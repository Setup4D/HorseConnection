unit Horse.Connection.PG;

interface

uses
  FireDAC.Comp.Client,
  EnumsHelpersUtils,
  SystemUtils,
  System.Rtti,
  Horse;

type
{$SCOPEDENUMS ON}
  TPGConfigurationParameter = EnumsHelpersUtils.TPGConfigurationParameter;
{$SCOPEDENUMS OFF}

function PGConnection: TFDConnection;

procedure ApplyDatabaseConfiguration(const AParameter
  : TPGConfigurationParameter; const Value: TValue);

procedure SetConnectionPrefix(const AValue : string);
procedure SetDatabase(const AValue : string);

procedure HorseConnectionPG(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);

implementation

uses
  PGDataBaseConnectionManager,
  PGDataBaseConfigurationParameter;

var
  FConfiguration: TPGConfiguration;
  FDatabase: string;
  FConnectionPrefix: string;

function PGConnection: TFDConnection;
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
  : TPGConfigurationParameter; const Value: TValue);
begin
  DatabaseConfig(FConfiguration, AParameter, Value);
end;

procedure HorseConnectionPG(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  Next;
end;

initialization

FConfiguration := TPGConfiguration.Default;

end.
