unit Horse.Connection.SQLite;

interface

uses
  FireDAC.Comp.Client,
  EnumsHelpersUtils,
  SystemUtils,
  System.Rtti,
  Horse;

type
{$SCOPEDENUMS ON}
  TSQLiteConfigurationParameter = EnumsHelpersUtils.
    TSQLiteConfigurationParameter;
  TSQLiteLockingModeType = EnumsHelpersUtils.TSQLiteLockingModeType;
  TSQLiteOpenModeType = EnumsHelpersUtils.TSQLiteOpenModeType;
  TSQLiteEncryptType = EnumsHelpersUtils.TSQLiteEncryptType;
{$SCOPEDENUMS OFF}
function SQLiteConnection: TFDConnection;

procedure ApplyDatabaseConfiguration(const AParameter
  : TSQLiteConfigurationParameter; const AValue: TValue); overload;
procedure ApplyDatabaseConfiguration(const AParameter
  : TSQLiteConfigurationParameter;
  const AValue: TSQLiteLockingModeType); overload;
procedure ApplyDatabaseConfiguration(const AParameter
  : TSQLiteConfigurationParameter; const AValue: TSQLiteOpenModeType); overload;
procedure ApplyDatabaseConfiguration(const AParameter
  : TSQLiteConfigurationParameter; const AValue: TSQLiteEncryptType); overload;

procedure SetConnectionPrefix(const AValue : string);
procedure SetDatabase(const AValue : string);

procedure HorseConnectionSQLite(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);

implementation

uses
  SQLiteDataBaseConnectionManager,
  SQLiteDataBaseConfigurationParameter;

var
  FConfiguration: TSQLiteConfiguration;
  FDatabase: string;
  FConnectionPrefix: string;

function SQLiteConnection: TFDConnection;
begin
  Result := GetConnection(FConfiguration, FDatabase,
    FConnectionPrefix);
end;

procedure SetConnectionPrefix(const AValue : string);
begin
  FConnectionPrefix := AValue;
end;

procedure SetDatabase(const AValue : string);
begin
  FDatabase := GetAbsolutePath(AValue);
end;

procedure ApplyDatabaseConfiguration(const AParameter
  : TSQLiteConfigurationParameter; const AValue: TValue);
begin
  DatabaseConfig(FConfiguration, AParameter, AValue);
end;

procedure ApplyDatabaseConfiguration(const AParameter
  : TSQLiteConfigurationParameter; const AValue: TSQLiteLockingModeType);
begin
  DatabaseConfig(FConfiguration, AParameter, AValue);
end;

procedure ApplyDatabaseConfiguration(const AParameter
  : TSQLiteConfigurationParameter; const AValue: TSQLiteOpenModeType);
begin
  DatabaseConfig(FConfiguration, AParameter, AValue);
end;

procedure ApplyDatabaseConfiguration(const AParameter
  : TSQLiteConfigurationParameter; const AValue: TSQLiteEncryptType);
begin
  DatabaseConfig(FConfiguration, AParameter, AValue);
end;

procedure HorseConnectionSQLite(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  Next;
end;

initialization

FConfiguration := TSQLiteConfiguration.Default;

end.
