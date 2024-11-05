unit DBConnectionManagerADS;

interface

uses
  DBConfigTypes,

  Data.DB,

  FireDAC.Phys.ADS,
  FireDAC.Phys.ADSDef,

  FireDAC.DatS,
  FireDAC.DApt,
  FireDAC.Phys,
  FireDAC.Comp.UI,
  FireDAC.UI.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Intf,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.Comp.Client,
  FireDAC.Stan.Option,
  FireDAC.Comp.DataSet,
  FireDAC.ConsoleUI.Wait,
  FireDAC.Stan.ExprFuncs,


  System.SysUtils,
  System.StrUtils,
  System.Generics.Collections;

function GetConnection(const AConfig: TDatabaseConfig;
  const ADatabase: string; const APrefix : string): TFDConnection; overload;

function GetConnection(const AConfig: TDatabaseConfig;
  const APrefix : string): TFDConnection; overload;

function GetConnection(const AConfig: TDatabaseConfig): TFDConnection; overload;

implementation

uses
  DBConfigManagerADS;

var
  FConnectionPool: TDictionary<string, TFDConnection>;
  FDConnection: TFDConnection;
  FDGUIxWaitCursor: TFDGUIxWaitCursor;
  FDDriver: TFDPhysADSDriverLink;

procedure SetupConnection(const AConfig: TDatabaseConfig;
  const ADatabase: string; const APrefix: string; var AConnection: TFDConnection);
begin
  DBConfigManagerADS.Initialize(AConfig, ADatabase, APrefix);

  AConnection.ConnectionDefName := DBConfigManagerADS.GetConnectionDef(APrefix);
  AConnection.LoginPrompt := False;

  FDGUIxWaitCursor := TFDGUIxWaitCursor.Create(AConnection);
  FDGUIxWaitCursor.Provider := 'Console';


  FDDriver := TFDPhysADSDriverLink.Create(AConnection);

  case ADatabase.Trim.IsEmpty of
    True  : FDDriver.DefaultPath := AConfig.Database;
    False : FDDriver.DefaultPath := ADatabase;
  end;

  FDDriver.ShowDeleted := AConfig.ShowDelete;

  if not FileExists(AConfig.VendorLib) then
    raise Exception.CreateFmt({$IFDEF PORTUGUES}
                                'A DLL "%s" especificada em VendorLib não foi encontrada.'
                              {$ELSEIF DEF ESPANHOL}
                                'No se ha encontrado la DLL "%s" especificada en VendorLib.'
                              {$ELSE}
                                'The DLL "%s" specified in VendorLib was not found.'
                              {$ENDIF}, [AConfig.VendorLib]);

  FDDriver.VendorLib := AConfig.VendorLib;

  AConnection.Connected := True;
end;


function DefaultConnection (const AConfig: TDatabaseConfig;
  const ADatabase: string; const APrefix : string): TFDConnection;
begin
  if not Assigned(FDConnection) then
  begin
    FDConnection := TFDConnection.Create(nil);
    SetupConnection(AConfig, ADatabase, APrefix, FDConnection);
  end;

  Result := FDConnection;
end;

function CustomConnection  (const AConfig: TDatabaseConfig;
  const ADatabase: string; const APrefix : string): TFDConnection;
begin
  if FConnectionPool.TryGetValue(APrefix, Result) then
    Exit;

  Result := TFDConnection.Create(nil);
  SetupConnection(AConfig, ADatabase, APrefix, Result);

  FConnectionPool.Add(APrefix, Result);
  FConnectionPool.TrimExcess;
end;

function GetConnection(const AConfig: TDatabaseConfig;
  const ADatabase: string; const APrefix : string): TFDConnection;
begin
  case APrefix.Trim.IsEmpty of
    True  : Result := DefaultConnection(AConfig, ADatabase, APrefix);
    False : Result := CustomConnection(AConfig, ADatabase, APrefix);
  end;
end;

function GetConnection(const AConfig: TDatabaseConfig;
  const APrefix : string): TFDConnection;
begin
  Result := GetConnection(AConfig, EmptyStr, APrefix);
end;

function GetConnection(const AConfig: TDatabaseConfig): TFDConnection;
begin
  Result := GetConnection(AConfig, EmptyStr);
end;

initialization
  FConnectionPool := TDictionary<string, TFDConnection>.Create;

finalization
  if Assigned(FDConnection) then
    FDConnection.DisposeOf;

  FConnectionPool.DisposeOf;

end.
