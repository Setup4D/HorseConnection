unit SQLiteDatabaseConfigurationManager;

interface

uses
  EnumsHelpersUtils,

  FireDAC.Comp.Client,

  System.Classes,
  System.SysUtils,
  System.StrUtils;

procedure Initialize(const AConfiguration: TSQLiteConfiguration;
  const ADatabase: string; const APrefix: string); overload;
procedure Initialize(const AConfiguration: TSQLiteConfiguration;
  const APrefix: string); overload;
procedure Initialize(const AConfiguration: TSQLiteConfiguration); overload;

function GetConnectionDef(const APrefix: string): string; overload;
function GetConnectionDef: string; overload;

implementation

var
  FDManager: TFDManager;

Const
  _CONNECTION_DEF_NAME = 'DBConnectionSQLite';

function GetConnectionDef(const APrefix: string): string;
begin
  Result := _CONNECTION_DEF_NAME;

  if not APrefix.Trim.IsEmpty then
    Result := APrefix + '_' + Result;
end;

function GetConnectionDef: string;
begin
  Result := GetConnectionDef(EmptyStr);
end;

function CreateConnectionParameters(const AConfiguration: TSQLiteConfiguration;
  const ADatabase: string): TStrings;
begin
  Result := TStringList.Create;
  with Result do
  begin
    Values['DriverID'] := AConfiguration.DriverID;
    Values['Database'] := IfThen(ADatabase.Trim.IsEmpty,
      AConfiguration.Database, ADatabase);
    Values['User_Name'] := AConfiguration.UserName;
    Values['Password'] := AConfiguration.Password;
    Values['LockingMode'] := AConfiguration.LockingMode.ToString;
    Values['OpenMode'] := AConfiguration.OpenMode.ToString;
    Values['Encrypt'] := AConfiguration.Encrypt.ToString;
    Values['Pooled'] := IfThen(AConfiguration.Pooled, 'True', 'False');
    Values['POOL_MaximumItems'] := AConfiguration.PoolMaxItems.ToString;
    Values['POOL_ExpireTimeout'] := AConfiguration.PoolExpireTimeout.ToString;
    Values['POOL_CleanupTimeout'] := AConfiguration.PoolCleanupTimeout.ToString;
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

procedure Initialize(const AConfiguration: TSQLiteConfiguration;
  const ADatabase: string; const APrefix: string); overload;
var
  LParams: TStrings;
begin
  EnsureFDManagerInitialized;

  if FDManager.IsConnectionDef(GetConnectionDef(APrefix)) then
    Exit;

  ConfigureFDManager;

  LParams := CreateConnectionParameters(AConfiguration, ADatabase);
  try
    FDManager.AddConnectionDef(GetConnectionDef(APrefix),
      AConfiguration.DriverID, LParams);
  finally
    LParams.DisposeOf;
  end;

  FDManager.Active := True;
end;

procedure Initialize(const AConfiguration: TSQLiteConfiguration;
  const APrefix: string);
begin
  Initialize(AConfiguration, EmptyStr, APrefix);
end;

procedure Initialize(const AConfiguration: TSQLiteConfiguration);
begin
  Initialize(AConfiguration, EmptyStr);
end;

initialization

finalization

FDManager.Active := False;
FDManager.DisposeOf;

end.
