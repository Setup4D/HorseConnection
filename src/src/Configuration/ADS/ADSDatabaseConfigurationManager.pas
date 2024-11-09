unit ADSDatabaseConfigurationManager;

interface

uses
  EnumsHelpersUtils,

  FireDAC.Comp.Client,

  System.Classes,
  System.SysUtils,
  System.StrUtils;

procedure Initialize(const AConfiguration: TADSConfiguration;
  const ADatabase: string; const APrefix: string); overload;
procedure Initialize(const AConfiguration: TADSConfiguration;
  const APrefix: string); overload;
procedure Initialize(const AConfiguration: TADSConfiguration);overload;

function GetConnectionDef(const APrefix: string) : string; overload;
function GetConnectionDef : string; overload;


implementation

var
  FDManager: TFDManager;

Const
  _CONNECTION_DEF_NAME = 'DBConnectionADS';

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

function CreateConnectionParameters(const AConfiguration: TADSConfiguration; const ADatabase: string): TStrings;
begin
  Result := TStringList.Create;
  with Result do
  begin
    Values['DriverID'] := AConfiguration.DriverID;
    Values['User_Name'] := AConfiguration.UserName;
    Values['Password'] := AConfiguration.Password;
    Values['Database'] := IfThen(ADatabase.Trim.IsEmpty, AConfiguration.Database, ADatabase);
    Values['Pooled'] := IfThen(AConfiguration.Pooled, 'True', 'False');
    Values['POOL_MaximumItems'] := AConfiguration.PoolMaxItems.ToString;
    Values['POOL_ExpireTimeout'] := AConfiguration.PoolExpireTimeout.ToString;
    Values['POOL_CleanupTimeout'] := AConfiguration.PoolCleanupTimeout.ToString;
    Values['CharacterSet'] := AConfiguration.CharacterSet.ToString;
    Values['ServerTypes'] := AConfiguration.ServerType.ToString;
    Values['Protocol'] := AConfiguration.Protocol.ToString;
    Values['TableType'] := AConfiguration.TableType.ToString;
    Values['Locking'] := AConfiguration.Locking.ToString;
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

procedure Initialize(const AConfiguration: TADSConfiguration;
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
    FDManager.AddConnectionDef(GetConnectionDef(APrefix), AConfiguration.DriverID, LParams);
  finally
    LParams.DisposeOf;
  end;

  FDManager.Active := True;

end;

procedure Initialize(const AConfiguration: TADSConfiguration;
  const APrefix: string);
begin
  Initialize(AConfiguration, EmptyStr, APrefix);
end;

procedure Initialize(const AConfiguration: TADSConfiguration);
begin
  Initialize(AConfiguration, EmptyStr);
end;

initialization

finalization
  FDManager.Active := False;
  FDManager.DisposeOf;

end.

