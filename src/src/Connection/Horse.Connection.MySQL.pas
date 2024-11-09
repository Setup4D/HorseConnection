unit Horse.Connection.MySQL;

interface

uses
  FireDAC.Comp.Client,
  EnumsHelpersUtils,
  SystemUtils,
  System.Rtti,
  Horse;

type
{$SCOPEDENUMS ON}
  TMySQLConfigurationParameter = EnumsHelpersUtils.TMySQLConfigurationParameter;
{$SCOPEDENUMS OFF}

function MySQLConnection: TFDConnection;

procedure ApplyDatabaseConfiguration(const AParameter
  : TMySQLConfigurationParameter; const Value: TValue);

procedure SetConnectionPrefix(const AValue : string);
procedure SetDatabase(const AValue : string);

procedure HorseConnectionMySQL(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);

implementation

uses
  MySQLDataBaseConnectionManager,
  MySQLDataBaseConfigurationParameter;

var
  FConfiguration: TMySQLConfiguration;
  FDatabase: string;
  FConnectionPrefix: string;

function MySQLConnection: TFDConnection;
begin
  Result := GetConnection(FConfiguration, FDatabase, FConnectionPrefix);
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
  : TMySQLConfigurationParameter; const Value: TValue);
begin
  DatabaseConfig(FConfiguration, AParameter, Value);
end;

procedure HorseConnectionMySQL(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  Next;
end;

initialization

FConfiguration := TMySQLConfiguration.Default;

end.

