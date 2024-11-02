unit DBConfigTypes;

interface

{$SCOPEDENUMS ON}

type
  TConnectionType = (ADS, FB, MySQL, PG, SQLite);

  TDatabaseConfigParam = (Server, Port, Database, UserName, Password,
                          CharacterSet, Pooled, PoolMaxItems, PoolExpireTimeout,
                          PoolCleanupTimeout, ShowDelete, VendorLib, Protocol,
                          TableType, Locking);

  TDatabaseConfig = record
    DriverID: string;
    Server: string;
    Port: string;
    Database: string;
    UserName: string;
    Password: string;
    CharacterSet: string;
    Pooled: Boolean;
    PoolMaxItems: Integer;
    PoolExpireTimeout: Integer;
    PoolCleanupTimeout: Integer;
    ShowDelete : Boolean;
    VendorLib : string;
    Protocol : string;
    TableType : string;
    Locking : string;

    class function DefaultADS: TDatabaseConfig; static;
    class function DefaultPG: TDatabaseConfig; static;
  end;
  TConnectionTypeHelper= record helper for TConnectionType
    function ToString: string;
  end;

{  TDatabaseConfigParamHelper= record helper for TDatabaseConfigParam
    function ToString: string;
  end;}

implementation

uses
  System.SysUtils;

{ TDatabaseConfig }

class function TDatabaseConfig.DefaultADS: TDatabaseConfig;
begin
  Result.DriverID := TConnectionType.ADS.ToString;
  Result.Server := 'Local';
  Result.Port := '';
  Result.Database := '.\';
  Result.UserName := '';
  Result.Password := '';
  Result.CharacterSet := 'ANSI';
  Result.Pooled := True;
  Result.PoolMaxItems := 10;
  Result.PoolExpireTimeout := 30000;
  Result.PoolCleanupTimeout := 15000;
  Result.ShowDelete := False;
  Result.Protocol := 'TCPIP';
  Result.TableType := 'CDX';
  Result.Locking := 'Compatible';

  {$IFDEF WIN32}
  Result.VendorLib := ExtractFilePath(ParamStr(0)) + 'ace32.dll';
  {$ELSE}
  Result.VendorLib := ExtractFilePath(ParamStr(0)) + 'ace64.dll';
  {$ENDIF}
end;

class function TDatabaseConfig.DefaultPG: TDatabaseConfig;
begin
  Result.DriverID := TConnectionType.PG.ToString;
  Result.Server := 'localhost';
  Result.Port := '5432';
  Result.Database := 'postgres';
  Result.UserName := 'postgres';
  Result.Password := 'postgres';
  Result.CharacterSet := 'UTF8';
  Result.Pooled := True;
  Result.PoolMaxItems := 10;
  Result.PoolExpireTimeout := 30000;
  Result.PoolCleanupTimeout := 15000;
end;

{ TDatabaseConfigParamHelper }

{function TDatabaseConfigParamHelper.ToString: string;
begin
  case Self of
    TDatabaseConfigParam.DriverID: Result := 'DriverID';
    TDatabaseConfigParam.Server: Result := 'Server';
    TDatabaseConfigParam.Port: Result := 'Port';
    TDatabaseConfigParam.Database: Result := 'Database';
    TDatabaseConfigParam.UserName: Result := 'User_Name';
    TDatabaseConfigParam.Password: Result := 'Password';
    TDatabaseConfigParam.CharacterSet: Result := 'CharacterSet';
    TDatabaseConfigParam.Pooled: Result := 'Pooled';
    TDatabaseConfigParam.PoolMaxItems: Result := 'POOL_MaximumItems';
    TDatabaseConfigParam.PoolExpireTimeout: Result := 'POOL_ExpireTimeout';
    TDatabaseConfigParam.PoolCleanupTimeout: Result := 'POOL_CleanupTimeout';
  else
    Result := EmptyStr;
  end;
end;}

{ TConnectionTypeHelper }

function TConnectionTypeHelper.ToString: string;
begin
  case Self of
    TConnectionType.ADS: Result := 'ADS';
    TConnectionType.FB: Result := 'FB';
    TConnectionType.MySQL: Result := 'MySQL';
    TConnectionType.PG: Result := 'PG';
    TConnectionType.SQLite: Result := 'SQLite';
  end;
end;

end.

