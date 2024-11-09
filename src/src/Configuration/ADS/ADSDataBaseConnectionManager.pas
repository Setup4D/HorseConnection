unit ADSDataBaseConnectionManager;

interface

uses
  EnumsHelpersUtils,

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

function GetConnection(const AConfiguration: TADSConfiguration;
  const ADatabase: string; const APrefix: string): TFDConnection; overload;
function GetConnection(const AConfiguration: TADSConfiguration;
  const APrefix: string): TFDConnection; overload;
function GetConnection(const AConfiguration: TADSConfiguration)
  : TFDConnection; overload;

implementation

uses
  ADSDatabaseConfigurationManager;

var
  FConnectionPool: TDictionary<string, TFDConnection>;
  FDConnection: TFDConnection;
  FDGUIxWaitCursor: TFDGUIxWaitCursor;
  FDDriver: TFDPhysADSDriverLink;

procedure SetupConnection(const AConfiguration: TADSConfiguration;
  const ADatabase: string; const APrefix: string;
  var AConnection: TFDConnection);
begin
  Initialize(AConfiguration, ADatabase, APrefix);

  AConnection.ConnectionDefName := GetConnectionDef(APrefix);
  AConnection.LoginPrompt := False;

  FDGUIxWaitCursor := TFDGUIxWaitCursor.Create(AConnection);
  FDGUIxWaitCursor.Provider := 'Console';

  FDDriver := TFDPhysADSDriverLink.Create(AConnection);

  case ADatabase.Trim.IsEmpty of
    True:
      FDDriver.DefaultPath := AConfiguration.Database;
    False:
      FDDriver.DefaultPath := ADatabase;
  end;

  FDDriver.ShowDeleted := AConfiguration.ShowDelete;

  if not FileExists(AConfiguration.VendorLib) then
    raise Exception.CreateFmt({$IFDEF PORTUGUES}
                                'A DLL "%s" especificada em VendorLib não foi encontrada.'
                              {$ELSE}
                                {$IFDEF ESPANHOL}
                                  'No se ha encontrado la DLL "%s" especificada en VendorLib.'
                                {$ELSE}
                                  'The DLL "%s" specified in VendorLib was not found.'
                                {$ENDIF}
                              {$ENDIF}, [AConfiguration.VendorLib]);

  FDDriver.VendorLib := AConfiguration.VendorLib;
  AConnection.Connected := True;
end;

function DefaultConnection(const AConfiguration: TADSConfiguration;
  const ADatabase: string; const APrefix: string): TFDConnection;
begin
  if not Assigned(FDConnection) then
  begin
    FDConnection := TFDConnection.Create(nil);
    SetupConnection(AConfiguration, ADatabase, APrefix, FDConnection);
  end;

  Result := FDConnection;
end;

function CustomConnection(const AConfiguration: TADSConfiguration;
  const ADatabase: string; const APrefix: string): TFDConnection;
begin
  if FConnectionPool.TryGetValue(APrefix, Result) then
    Exit;

  Result := TFDConnection.Create(nil);
  SetupConnection(AConfiguration, ADatabase, APrefix, Result);

  FConnectionPool.Add(APrefix, Result);
  FConnectionPool.TrimExcess;
end;

function GetConnection(const AConfiguration: TADSConfiguration;
  const ADatabase: string; const APrefix: string): TFDConnection;
begin
  case APrefix.Trim.IsEmpty of
    True:
      Result := DefaultConnection(AConfiguration, ADatabase, APrefix);
    False:
      Result := CustomConnection(AConfiguration, ADatabase, APrefix);
  end;
end;

function GetConnection(const AConfiguration: TADSConfiguration;
  const APrefix: string): TFDConnection;
begin
  Result := GetConnection(AConfiguration, EmptyStr, APrefix);
end;

function GetConnection(const AConfiguration: TADSConfiguration): TFDConnection;
begin
  Result := GetConnection(AConfiguration, EmptyStr);
end;

initialization

FConnectionPool := TDictionary<string, TFDConnection>.Create;

finalization

if Assigned(FDConnection) then
  FDConnection.DisposeOf;

FConnectionPool.DisposeOf;

end.
