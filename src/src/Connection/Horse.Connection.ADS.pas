unit Horse.Connection.ADS;

interface

uses
  FireDAC.Comp.Client,
  EnumsHelpersUtils,
  SystemUtils,
  System.Rtti,
  Horse;

type
{$SCOPEDENUMS ON}
  TADSConfigurationParameter = EnumsHelpersUtils.TADSConfigurationParameter;
  TADSServerType = EnumsHelpersUtils.TADSServerType;
  TADSCharacterSet = EnumsHelpersUtils.TADSCharacterSet;
  TADSProtocol = EnumsHelpersUtils.TADSProtocol;
  TADSTableType = EnumsHelpersUtils.TADSTableType;
{$SCOPEDENUMS OFF}

function ADSConnection: TFDConnection;

procedure ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter;
  const Value: TValue); overload;
procedure ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter;
  const Value: TADSServerType); overload;
procedure ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter;
  const Value: TADSCharacterSet); overload;
procedure ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter;
  const Value: TADSProtocol); overload;
procedure ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter;
  const Value: TADSTableType); overload;
procedure ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter;
  const Value: TADSLocking); overload;

procedure SetConnectionPrefix(const AValue : string);
procedure SetDatabase(const AValue : string);

procedure HorseConnectionADS(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);

implementation

uses
  ADSDataBaseConnectionManager,
  ADSDataBaseConfigurationParameter;


var
  FConfiguration: TADSConfiguration;
  FDatabase: string;
  FConnectionPrefix: string;

function ADSConnection: TFDConnection;
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

procedure ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter;
  const Value: TValue);
begin
  DatabaseConfig(FConfiguration, AParameter, Value);
end;

procedure ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter;
  const Value: TADSServerType);
begin
  DatabaseConfig(FConfiguration, AParameter, Value);
end;

procedure ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter;
  const Value: TADSCharacterSet);
begin
  DatabaseConfig(FConfiguration, AParameter, Value);
end;

procedure ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter;
  const Value: TADSProtocol);
begin
  DatabaseConfig(FConfiguration, AParameter, Value);
end;

procedure ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter;
  const Value: TADSTableType);
begin
  DatabaseConfig(FConfiguration, AParameter, Value);
end;

procedure ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter;
  const Value: TADSLocking);
begin
  DatabaseConfig(FConfiguration, AParameter, Value);
end;

procedure HorseConnectionADS(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  Next;
end;

initialization

FConfiguration := TADSConfiguration.Default;

end.
