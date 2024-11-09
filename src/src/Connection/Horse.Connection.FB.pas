unit Horse.Connection.FB;

interface

uses
  FireDAC.Comp.Client,
  EnumsHelpersUtils,
  SystemUtils,
  System.Rtti,
  Horse;

type
{$SCOPEDENUMS ON}
  TFBConfigurationParameter = EnumsHelpersUtils.TFBConfigurationParameter;
  TFBProtocolType = EnumsHelpersUtils.TFBProtocolType;
  TFBOpenModeType = EnumsHelpersUtils.TFBOpenModeType;
  TFBCharacterSetType = EnumsHelpersUtils.TFBCharacterSetType;
{$SCOPEDENUMS OFF}
function FBConnection: TFDConnection;

procedure ApplyDatabaseConfiguration(const AParameter
  : TFBConfigurationParameter; const Value: TValue); overload;
procedure ApplyDatabaseConfiguration(const AParameter
  : TFBConfigurationParameter; const Value: TFBProtocolType); overload;
procedure ApplyDatabaseConfiguration(const AParameter
  : TFBConfigurationParameter; const Value: TFBOpenModeType); overload;
procedure ApplyDatabaseConfiguration(const AParameter
  : TFBConfigurationParameter; const Value: TFBCharacterSetType); overload;

procedure SetConnectionPrefix(const AValue : string);
procedure SetDatabase(const AValue : string);

procedure HorseConnectionFB(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);

implementation

uses
  FBDatabaseConfigurationManager,
  FBDataBaseConfigurationParameter;

var
  FConfiguration: TFBConfiguration;
  FDatabase: string;
  FConnectionPrefix: string;

function FBConnection: TFDConnection;
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
  : TFBConfigurationParameter; const Value: TValue);
begin
  DatabaseConfig(FConfiguration, AParameter, Value);
end;

procedure ApplyDatabaseConfiguration(const AParameter
  : TFBConfigurationParameter; const Value: TFBProtocolType);
begin
  DatabaseConfig(FConfiguration, AParameter, Value);
end;

procedure ApplyDatabaseConfiguration(const AParameter
  : TFBConfigurationParameter; const Value: TFBOpenModeType);
begin
  DatabaseConfig(FConfiguration, AParameter, Value);
end;

procedure ApplyDatabaseConfiguration(const AParameter
  : TFBConfigurationParameter; const Value: TFBCharacterSetType);
begin
  DatabaseConfig(FConfiguration, AParameter, Value);
end;

procedure HorseConnectionFB(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  Next;
end;

initialization

FConfiguration := TFBConfiguration.Default;

end.
