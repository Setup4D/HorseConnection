unit DBConfigManagerADS;

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

procedure Initialize(const AConfig: TDatabaseConfig;
  const ADatabase: string; const APrefix: string); overload;
var
  LParams: TStrings;
begin

  if not Assigned(FDManager) then
    FDManager := TFDManager.Create(nil);

  if not FDManager.IsConnectionDef(GetConnectionDef(APrefix)) then
  begin
    FDManager.Active := False;
    FDManager.ResourceOptions.AutoReconnect := True;

    LParams := TStringList.Create;
    try
      LParams.Values['DriverID'] := AConfig.DriverID;
      LParams.Values['CharacterSet'] := AConfig.CharacterSet;
      LParams.Values['User_Name'] := AConfig.UserName;
      LParams.Values['Password'] := AConfig.Password;

      case ADatabase.Trim.IsEmpty of
        True  : LParams.Values['Database'] := AConfig.Database;
        False : LParams.Values['Database'] := ADatabase;
      end;

      LParams.Values['Pooled'] := ifthen(AConfig.Pooled, 'True', 'False');
      LParams.Values['POOL_MaximumItems'] := AConfig.PoolMaxItems.ToString;
      LParams.Values['POOL_ExpireTimeout'] := AConfig.PoolExpireTimeout.ToString;
      LParams.Values['POOL_CleanupTimeout'] := AConfig.PoolCleanupTimeout.ToString;
      LParams.Values['ServerTypes'] := AConfig.Server;
      LParams.Values['Protocol'] := AConfig.Protocol;
      LParams.Values['TableType'] := AConfig.TableType;
      LParams.Values['Locking'] := AConfig.Locking;


      FDManager.AddConnectionDef(GetConnectionDef(APrefix), AConfig.DriverID, LParams);
    finally
      LParams.Free;
    end;

    FDManager.Active := True;
  end;
end;

procedure Initialize(const AConfig: TDatabaseConfig;
  const APrefix: string);
begin
  Initialize(AConfig, EmptyStr, APrefix);
end;

procedure Initialize(const AConfig: TDatabaseConfig);
begin
  Initialize(AConfig, EmptyStr);
end;

initialization

finalization
  FDManager.DisposeOf;

end.
