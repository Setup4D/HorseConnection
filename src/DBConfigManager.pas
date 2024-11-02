unit DBConfigManager;

interface

uses
  DBConfigTypes,

  FireDAC.Comp.Client,

  System.Classes,
  System.SysUtils,
  System.StrUtils;

procedure Initialize(const AConfig: TDatabaseConfig);
function GetConnectionDef : string;

implementation

var
  FDManager: TFDManager;
Const
  _CONNECTION_DEF_NAME = 'DBConnectionPG';

function GetConnectionDef : string;
begin
  Result := _CONNECTION_DEF_NAME;
end;

procedure Initialize(const AConfig: TDatabaseConfig);
var
  LParams: TStrings;
begin
  if not Assigned(FDManager) then
    FDManager := TFDManager.Create(nil);

  if not FDManager.IsConnectionDef(_CONNECTION_DEF_NAME) then
  begin

    FDManager.Active := False;
    FDManager.ResourceOptions.AutoReconnect := True;

    LParams := TStringList.Create;
    try
      LParams.Values['DriverID'] := AConfig.DriverID;
      LParams.Values['Server'] := AConfig.Server;
      LParams.Values['Port'] := AConfig.Port;
      LParams.Values['Database'] := AConfig.Database;
      LParams.Values['User_Name'] := AConfig.UserName;
      LParams.Values['Password'] := AConfig.Password;
      LParams.Values['CharacterSet'] := AConfig.CharacterSet;
      LParams.Values['Pooled'] := ifthen(AConfig.Pooled, 'True', 'False');
      LParams.Values['POOL_MaximumItems'] := AConfig.PoolMaxItems.ToString;
      LParams.Values['POOL_ExpireTimeout'] := AConfig.PoolExpireTimeout.ToString;
      LParams.Values['POOL_CleanupTimeout'] := AConfig.PoolCleanupTimeout.ToString;

      FDManager.AddConnectionDef(_CONNECTION_DEF_NAME, AConfig.DriverID, LParams);
    finally
      LParams.Free;
    end;

    FDManager.Active := True;
  end;
end;

initialization

finalization
  FDManager.DisposeOf;

end.

