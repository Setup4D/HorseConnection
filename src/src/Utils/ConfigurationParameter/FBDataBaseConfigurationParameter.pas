unit FBDataBaseConfigurationParameter;

interface

uses
  SystemUtils,
  EnumsHelpersUtils,
  MethodReferencesUtils,

  System.Rtti,
  System.SysUtils,
  System.Generics.Collections;

procedure DatabaseConfig(var AConfiguration: TFBConfiguration;
  AParameter: TFBConfigurationParameter; const AValue: TValue); overload;
procedure DatabaseConfig(var AConfiguration: TFBConfiguration;
  AParameter: TFBConfigurationParameter;
  const AValue: TFBProtocolType); overload;
procedure DatabaseConfig(var AConfiguration: TFBConfiguration;
  AParameter: TFBConfigurationParameter;
  const AValue: TFBOpenModeType); overload;
procedure DatabaseConfig(var AConfiguration: TFBConfiguration;
  AParameter: TFBConfigurationParameter;
  const AValue: TFBCharacterSetType); overload;

implementation

var
  FDictionary: TDictionary<TFBConfigurationParameter, TFBDatabaseConfigurator>;

procedure SetDatabase(var AConfiguration: TFBConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Database', 'string');
  AConfiguration.Database := GetAbsolutePath(AValue.AsString);
end;

procedure SetUserName(var AConfiguration: TFBConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('UserName', 'string');
  AConfiguration.UserName := AValue.AsString;
end;

procedure SetPassword(var AConfiguration: TFBConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Password', 'string');
  AConfiguration.Password := AValue.AsString;
end;

procedure SetProtocol(var AConfiguration: TFBConfiguration;
  const AValue: TValue);
var
  LProtocol: TFBProtocolType;
begin
  if not AValue.TryAsType<TFBProtocolType>(LProtocol) then
    RaiseInvalidTypeException('Protocol', 'TFBProtocolType');

  AConfiguration.Protocol := LProtocol;
end;

procedure SetServer(var AConfiguration: TFBConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Server', 'string');
  AConfiguration.Server := AValue.AsString;
end;

procedure SetPort(var AConfiguration: TFBConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('Port', 'integer');
  AConfiguration.Port := AValue.AsInteger;
end;

procedure SetCharacterSet(var AConfiguration: TFBConfiguration;
  const AValue: TValue);
var
  LCharacterSet: TFBCharacterSetType;
begin
  if not AValue.TryAsType<TFBCharacterSetType>(LCharacterSet) then
    RaiseInvalidTypeException('CharacterSet', 'TFBCharacterSetType');

  AConfiguration.CharacterSet := LCharacterSet;
end;

procedure SetOpenMode(var AConfiguration: TFBConfiguration;
  const AValue: TValue);
var
  LOpenMode: TFBOpenModeType;
begin
  if not AValue.TryAsType<TFBOpenModeType>(LOpenMode) then
    RaiseInvalidTypeException('OpenMode', 'TFBOpenModeType');

  AConfiguration.OpenMode := LOpenMode;
end;

procedure SetPooled(var AConfiguration: TFBConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Boolean> then
    RaiseInvalidTypeException('Pooled', 'boolean');
  AConfiguration.Pooled := AValue.AsBoolean;
end;

procedure SetPoolMaxItems(var AConfiguration: TFBConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolMaxItems', 'integer');
  AConfiguration.PoolMaxItems := AValue.AsInteger;
end;

procedure SetPoolExpireTimeout(var AConfiguration: TFBConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolExpireTimeout', 'integer');
  AConfiguration.PoolExpireTimeout := AValue.AsInteger;
end;

procedure SetPoolCleanupTimeout(var AConfiguration: TFBConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolCleanupTimeout', 'integer');
  AConfiguration.PoolCleanupTimeout := AValue.AsInteger;
end;

procedure InitializeConfigurators;
begin
  FDictionary := TDictionary<TFBConfigurationParameter,
    TFBDatabaseConfigurator>.Create;

  // Adicionando setters para strings
  FDictionary.Add(TFBConfigurationParameter.Database, SetDatabase);
  FDictionary.Add(TFBConfigurationParameter.UserName, SetUserName);
  FDictionary.Add(TFBConfigurationParameter.Password, SetPassword);
  FDictionary.Add(TFBConfigurationParameter.Server, SetServer);

  // Adicionando setters para Enumerados
  FDictionary.Add(TFBConfigurationParameter.Protocol, SetProtocol);
  FDictionary.Add(TFBConfigurationParameter.CharacterSet, SetCharacterSet);
  FDictionary.Add(TFBConfigurationParameter.OpenMode, SetOpenMode);

  // Adicionando setters para booleanos
  FDictionary.Add(TFBConfigurationParameter.Pooled, SetPooled);

  // Adicionando setters para inteiros
  FDictionary.Add(TFBConfigurationParameter.Port, SetPort);
  FDictionary.Add(TFBConfigurationParameter.PoolMaxItems, SetPoolMaxItems);
  FDictionary.Add(TFBConfigurationParameter.PoolExpireTimeout,
    SetPoolExpireTimeout);
  FDictionary.Add(TFBConfigurationParameter.PoolCleanupTimeout,
    SetPoolCleanupTimeout);
end;

procedure DatabaseConfig(var AConfiguration: TFBConfiguration;
  AParameter: TFBConfigurationParameter; const AValue: TFBProtocolType);
begin
  AConfiguration.Protocol := AValue;
end;

procedure DatabaseConfig(var AConfiguration: TFBConfiguration;
  AParameter: TFBConfigurationParameter; const AValue: TFBOpenModeType);
begin
  AConfiguration.OpenMode := AValue;
end;

procedure DatabaseConfig(var AConfiguration: TFBConfiguration;
  AParameter: TFBConfigurationParameter; const AValue: TFBCharacterSetType);
begin
  AConfiguration.CharacterSet := AValue;
end;

procedure DatabaseConfig(var AConfiguration: TFBConfiguration;
  AParameter: TFBConfigurationParameter; const AValue: TValue);
var
  LConfigureProcedure: TFBDatabaseConfigurator;
begin
  if FDictionary.TryGetValue(AParameter, LConfigureProcedure) then
    LConfigureProcedure(AConfiguration, AValue)
  else
    raise Exception.Create({$IFDEF PORTUGUES}
                              'Parâmetro de configuração desconhecido.'
                            {$ELSE}
                              {$IFDEF ESPANHOL}
                                'Parámetro de configuración desconocido.'
                              {$ELSE}
                                'Unknown configuration parameter.'
                              {$ENDIF}
                            {$ENDIF});
end;

initialization

  InitializeConfigurators;

finalization

  FDictionary.Free;

end.
