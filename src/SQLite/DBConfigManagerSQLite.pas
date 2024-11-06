unit DBConfigManagerSQLite;

interface

uses
  DBConfigTypes,

  FireDAC.Comp.Client,

  System.Classes,
  System.SysUtils,
  System.StrUtils;

procedure Initialize(const AConfig: TDatabaseConfig;
  const ADatabase: string; const APrefix: string); overload;
procedure Initialize(const AConfig: TDatabaseConfig;
  const APrefix: string); overload;
procedure Initialize(const AConfig: TDatabaseConfig);overload;

function GetConnectionDef(const APrefix: string) : string; overload;
function GetConnectionDef : string; overload;


implementation

var
  FDManager: TFDManager;

Const
  _CONNECTION_DEF_NAME = 'DBConnectionSQLite';

function GetConnectionDef(const APrefix: string) : string;
begin
  Result := _CONNECTION_DEF_NAME;

  if not APrefix.Trim.IsEmpty then
    Result := APrefix + '_' + Result;
end;

function GetConnectionDef : string;
begin
  Result := GetConnectionDef(EmptyStr);
end;

function CreateConnectionParams(const AConfig: TDatabaseConfig; const ADatabase: string): TStrings;
begin
  Result := TStringList.Create;
  with Result do
  begin
    Values['DriverID'] := AConfig.DriverID;
    Values['Database'] := IfThen(ADatabase.Trim.IsEmpty, AConfig.Database, ADatabase);
    Values['User_Name'] := AConfig.UserName;
    Values['Password'] := AConfig.Password;
    Values['LockingMode'] := AConfig.Locking;
    Values['OpenMode'] := AConfig.OpenMode;
    Values['Encrypt'] := AConfig.Encrypt;
    Values['Pooled'] := IfThen(AConfig.Pooled, 'True', 'False');
    Values['POOL_MaximumItems'] := AConfig.PoolMaxItems.ToString;
    Values['POOL_ExpireTimeout'] := AConfig.PoolExpireTimeout.ToString;
    Values['POOL_CleanupTimeout'] := AConfig.PoolCleanupTimeout.ToString;
  end;
end;

procedure EnsureFDManagerInitialized;
begin
  if not Assigned(FDManager) then
    FDManager := TFDManager.Create(nil);
end;
procedure ConfigureFDManager;
begin
  FDManager.Active := False;
  FDManager.ResourceOptions.AutoReconnect := True;
end;

procedure Initialize(const AConfig: TDatabaseConfig;
  const ADatabase: string; const APrefix: string); overload;
var
  LParams: TStrings;
begin
  EnsureFDManagerInitialized;
  if FDManager.IsConnectionDef(GetConnectionDef(APrefix)) then
    Exit;
  ConfigureFDManager;
  LParams := CreateConnectionParams(AConfig, ADatabase);
  try
    FDManager.AddConnectionDef(GetConnectionDef(APrefix), AConfig.DriverID, LParams);
  finally
    LParams.DisposeOf;
  end;
  FDManager.Active := True;
end;

procedure Initialize(const AConfig: TDatabaseConfig; const APrefix: string);
begin
  Initialize(AConfig, EmptyStr, APrefix);
end;

procedure Initialize(const AConfig: TDatabaseConfig);
begin
  Initialize(AConfig, EmptyStr);
end;

initialization

finalization
  FDManager.Active := False;
  FDManager.DisposeOf;

end.

