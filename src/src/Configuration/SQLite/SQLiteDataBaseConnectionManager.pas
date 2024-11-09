unit SQLiteDataBaseConnectionManager;

interface

uses
  EnumsHelpersUtils,

  Data.DB,

  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,

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

function GetConnection(const AConfiguration: TSQLiteConfiguration;
  const ADatabase: string; const APrefix: string): TFDConnection; overload;
function GetConnection(const AConfiguration: TSQLiteConfiguration;
  const APrefix: string): TFDConnection; overload;
function GetConnection(const AConfiguration: TSQLiteConfiguration)
  : TFDConnection; overload;

implementation

uses
  SQLiteDatabaseConfigurationManager;

var
  FConnectionPool: TDictionary<string, TFDConnection>;
  FDConnection: TFDConnection;
  FDGUIxWaitCursor: TFDGUIxWaitCursor;
  FDDriver: TFDPhysSQLiteDriverLink;
  FDSQLiteSecurity: TFDSQLiteSecurity;

procedure SetupConnection(const AConfiguration: TSQLiteConfiguration;
  const ADatabase: string; const APrefix: string;
  var AConnection: TFDConnection);
begin
  Initialize(AConfiguration, ADatabase, APrefix);

  AConnection.ConnectionDefName := GetConnectionDef(APrefix);
  AConnection.LoginPrompt := False;

  FDGUIxWaitCursor := TFDGUIxWaitCursor.Create(AConnection);
  FDGUIxWaitCursor.Provider := 'Console';

  FDDriver := TFDPhysSQLiteDriverLink.Create(AConnection);

  if not(AConfiguration.Encrypt = TSQLiteEncryptType.No) then
  begin
    FDSQLiteSecurity := TFDSQLiteSecurity.Create(AConnection);
    FDSQLiteSecurity.Database := AConfiguration.Database;
    FDSQLiteSecurity.Password := AConfiguration.Encrypt.ToString + ':' +
      AConfiguration.Password;
    FDSQLiteSecurity.SetPassword;
  end;

  if not FileExists(IfThen(ADatabase.Trim.IsEmpty, AConfiguration.Database,
    ADatabase)) then
    raise Exception.CreateFmt({$IFDEF PORTUGUES}
      'O banco de dados especificado "%s", não foi encontrado.'
{$ELSE}
{$IFDEF ESPANHOL}
      'No se encontró la base de datos especificada "%s".'
{$ELSE}
      'The specified database "%s" was not found.'
{$ENDIF}
{$ENDIF}, [IfThen(ADatabase.Trim.IsEmpty,
      AConfiguration.Database, ADatabase)]);

  AConnection.Connected := True;
end;

function DefaultConnection(const AConfiguration: TSQLiteConfiguration;
  const ADatabase: string; const APrefix: string): TFDConnection;
begin
  if not Assigned(FDConnection) then
  begin
    FDConnection := TFDConnection.Create(nil);
    SetupConnection(AConfiguration, ADatabase, APrefix, FDConnection);
  end;

  Result := FDConnection;
end;

function CustomConnection(const AConfiguration: TSQLiteConfiguration;
  const ADatabase: string; const APrefix: string): TFDConnection;
begin
  if FConnectionPool.TryGetValue(APrefix, Result) then
    Exit;

  Result := TFDConnection.Create(nil);
  SetupConnection(AConfiguration, ADatabase, APrefix, Result);

  FConnectionPool.Add(APrefix, Result);
  FConnectionPool.TrimExcess;
end;

function GetConnection(const AConfiguration: TSQLiteConfiguration;
  const ADatabase: string; const APrefix: string): TFDConnection;
begin
  case APrefix.Trim.IsEmpty of
    True:
      Result := DefaultConnection(AConfiguration, ADatabase, APrefix);
    False:
      Result := CustomConnection(AConfiguration, ADatabase, APrefix);
  end;
end;

function GetConnection(const AConfiguration: TSQLiteConfiguration;
  const APrefix: string): TFDConnection;
begin
  Result := GetConnection(AConfiguration, EmptyStr, APrefix);
end;

function GetConnection(const AConfiguration: TSQLiteConfiguration)
  : TFDConnection;
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
