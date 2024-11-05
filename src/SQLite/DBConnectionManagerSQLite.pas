unit DBConnectionManagerSQLite;

interface

uses
  DBConfigTypes,

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

function GetConnection(const AConfig: TDatabaseConfig;
  const ADatabase: string; const APrefix : string): TFDConnection; overload;

function GetConnection(const AConfig: TDatabaseConfig;
  const APrefix : string): TFDConnection; overload;

function GetConnection(const AConfig: TDatabaseConfig): TFDConnection; overload;

implementation

uses
  DBConfigManagerSQLite;

var
  FConnectionPool: TDictionary<string, TFDConnection>;
  FDConnection: TFDConnection;
  FDGUIxWaitCursor: TFDGUIxWaitCursor;
  FDDriver: TFDPhysSQLiteDriverLink;
  FDSQLiteSecurity : TFDSQLiteSecurity;

procedure SetupConnection(const AConfig: TDatabaseConfig;
  const ADatabase: string; const APrefix: string; var AConnection: TFDConnection);
begin
  DBConfigManagerSQLite.Initialize(AConfig, ADatabase, APrefix);

  AConnection.ConnectionDefName := DBConfigManagerSQLite.GetConnectionDef(APrefix);
  AConnection.LoginPrompt := False;

  FDGUIxWaitCursor := TFDGUIxWaitCursor.Create(AConnection);
  FDGUIxWaitCursor.Provider := 'Console';

  FDDriver := TFDPhysSQLiteDriverLink.Create(AConnection);

  if not (AConfig.Encrypt.ToLower = TSQLiteEncryptType.No.ToString.ToLower) then
  begin
    FDSQLiteSecurity := TFDSQLiteSecurity.Create(AConnection);
    FDSQLiteSecurity.Database:= AConfig.Database;
    FDSQLiteSecurity.Password:=  AConfig.Encrypt + ':' + AConfig.Password;
    FDSQLiteSecurity.SetPassword;
  end;

  if not FileExists(IfThen(ADatabase.Trim.IsEmpty, AConfig.Database, ADatabase)) then
    raise Exception.CreateFmt({$IFDEF PORTUGUES}
                                'O banco de dados especificado "%s", não foi encontrada.'
                              {$ELSEIF DEF ESPANHOL}
                                'No se encontró la base de datos especificada "%s".'
                              {$ELSE}
                                'The specified database “%s”, was not found.'
                              {$ENDIF}, [IfThen(ADatabase.Trim.IsEmpty, AConfig.Database, ADatabase)]);


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
