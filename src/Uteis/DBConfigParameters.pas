unit DBConfigParameters;

interface

uses
  DBConfigTypes, System.SysUtils;

procedure DatabaseConfig(var Config: TDatabaseConfig; AParam: TDatabaseConfigParam; const Value: string); overload;
procedure DatabaseConfig(var Config: TDatabaseConfig; AParam: TDatabaseConfigParam; const Value: Integer); overload;
procedure DatabaseConfig(var Config: TDatabaseConfig; AParam: TDatabaseConfigParam; const Value: Boolean); overload;

implementation

procedure DatabaseConfig(var Config: TDatabaseConfig; AParam: TDatabaseConfigParam; const Value: string);
begin
  case AParam of
    TDatabaseConfigParam.Server: Config.Server := Value;
    TDatabaseConfigParam.Port: Config.Port := Value;
    TDatabaseConfigParam.Database: Config.Database := Value;
    TDatabaseConfigParam.UserName: Config.UserName := Value;
    TDatabaseConfigParam.Password: Config.Password := Value;
    TDatabaseConfigParam.CharacterSet: Config.CharacterSet := Value;
    TDatabaseConfigParam.Pooled: Config.Pooled := SameText(Value, 'True');
    TDatabaseConfigParam.PoolMaxItems: Config.PoolMaxItems := StrToIntDef(Value, Config.PoolMaxItems);
    TDatabaseConfigParam.PoolExpireTimeout: Config.PoolExpireTimeout := StrToIntDef(Value, Config.PoolExpireTimeout);
    TDatabaseConfigParam.PoolCleanupTimeout: Config.PoolCleanupTimeout := StrToIntDef(Value, Config.PoolCleanupTimeout);
    TDatabaseConfigParam.ShowDelete: Config.ShowDelete := SameText(Value, 'True');
    TDatabaseConfigParam.VendorLib: Config.VendorLib := Value;
  end;
end;

procedure DatabaseConfig(var Config: TDatabaseConfig; AParam: TDatabaseConfigParam; const Value: Integer);
begin
  case AParam of
    TDatabaseConfigParam.PoolMaxItems: Config.PoolMaxItems := Value;
    TDatabaseConfigParam.PoolExpireTimeout: Config.PoolExpireTimeout := Value;
    TDatabaseConfigParam.PoolCleanupTimeout: Config.PoolCleanupTimeout := Value;
  end;
end;

procedure DatabaseConfig(var Config: TDatabaseConfig; AParam: TDatabaseConfigParam; const Value: Boolean);
begin
  case AParam of
    TDatabaseConfigParam.Pooled: Config.Pooled := Value;
    TDatabaseConfigParam.ShowDelete: Config.ShowDelete := Value;
  end;
end;

end.

