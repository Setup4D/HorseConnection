unit DBConnectionManagerADS;

interface

uses
  DBConfigTypes,

  Data.DB,

  FireDAC.DatS,
  FireDAC.DApt,
  FireDAC.Phys,
  FireDAC.Comp.UI,
  FireDAC.UI.Intf,
  FireDAC.Phys.PG,
  FireDAC.Stan.Def,
  FireDAC.Phys.ADS,
  FireDAC.Stan.Intf,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.Phys.PGDef,
  FireDAC.Phys.ADSDef,
  FireDAC.Comp.Client,
  FireDAC.Phys.SQLite,
  FireDAC.Stan.Option,
  FireDAC.Comp.DataSet,
  FireDAC.ConsoleUI.Wait,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteDef,

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

procedure FreeConnections;
var
  LConnection: TFDConnection;
begin
  if not (FConnectionPool.Count > 0) then
    Exit;
  for LConnection in FConnectionPool.Values do
  begin
    LConnection.Connected := False;
    LConnection.DisposeOf;
  end;
end;

function DefaultConnection (const AConfig: TDatabaseConfig;
  const ADatabase: string; const APrefix : string): TFDConnection;
begin
  DBConfigManagerADS.Initialize(AConfig, ADatabase, APrefix);

  if (not Assigned(FDConnection)) then
  begin
    FDConnection := TFDConnection.Create(nil);
    FDConnection.ConnectionDefName := DBConfigManagerADS.GetConnectionDef(APrefix);
    FDConnection.LoginPrompt := False;

    FDGUIxWaitCursor:= TFDGUIxWaitCursor.Create(FDConnection);
    FDGUIxWaitCursor.Provider := 'Console';

    FDDriver:= TFDPhysADSDriverLink.Create(FDConnection);
    FDDriver.DefaultPath                        := AConfig.Database;
    FDDriver.ShowDeleted                        := AConfig.ShowDelete;
    FDDriver.VendorLib                          := AConfig.VendorLib;


    FDConnection.Connected := True;
  end;

  Result := FDConnection;
end;

function CustomConnection  (const AConfig: TDatabaseConfig;
  const ADatabase: string; const APrefix : string): TFDConnection;
begin
  if FConnectionPool.TryGetValue(APrefix, Result) then
    Exit;

  // Cria e configura uma nova conexão se não estiver no dicionário
  Result := TFDConnection.Create(nil);
  DBConfigManagerADS.Initialize(AConfig, ADatabase, APrefix);
  Result.ConnectionDefName := DBConfigManagerADS.GetConnectionDef(APrefix);
  Result.LoginPrompt := False;

  FDGUIxWaitCursor:= TFDGUIxWaitCursor.Create(Result);
  FDGUIxWaitCursor.Provider := 'Console';

  FDDriver := TFDPhysADSDriverLink.Create(Result);

  case ADatabase.Trim.IsEmpty of
    True  : FDDriver.DefaultPath := AConfig.Database;
    False : FDDriver.DefaultPath := ADatabase;
  end;

  FDDriver.ShowDeleted := AConfig.ShowDelete;
  if not FileExists(AConfig.VendorLib) then
  {$IFDEF PORTUGUES}
    raise Exception.CreateFmt('A DLL "%s" especificada em VendorLib não foi encontrada.', [AConfig.VendorLib]);
  {$ELSE}
    raise Exception.CreateFmt('The DLL "%s" specified in VendorLib was not found.', [AConfig.VendorLib]);
  {$ENDIF}

  FDDriver.VendorLib := AConfig.VendorLib;

  Result.Connected := True;

  // Armazena a nova conexão no dicionário
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

  FreeConnections;
  FConnectionPool.DisposeOf;
end.
