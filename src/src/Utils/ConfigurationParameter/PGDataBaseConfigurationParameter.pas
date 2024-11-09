unit PGDataBaseConfigurationParameter;

interface

uses
  SystemUtils,
  EnumsHelpersUtils,
  MethodReferencesUtils,

  System.Rtti,
  System.SysUtils,
  System.Generics.Collections;

procedure DatabaseConfig(var AConfiguration: TPGConfiguration;
  AParameter: TPGConfigurationParameter; const AValue: TValue); overload;

implementation

var
  FDictionary: TDictionary<TPGConfigurationParameter, TPGDatabaseConfigurator>;

procedure SetServer(var AConfiguration: TPGConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Server', 'string');
  AConfiguration.Server := AValue.AsString;
end;

procedure SetPort(var AConfiguration: TPGConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('Port', 'Integer');
  AConfiguration.Port := AValue.AsInteger;
end;

procedure SetDatabase(var AConfiguration: TPGConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Database', 'string');
  AConfiguration.Database := AValue.AsString;
end;

procedure SetUserName(var AConfiguration: TPGConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('UserName', 'string');
  AConfiguration.UserName := AValue.AsString;
end;

procedure SetPassword(var AConfiguration: TPGConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Password', 'string');
  AConfiguration.Password := AValue.AsString;
end;

procedure SetCharacterSet(var AConfiguration: TPGConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('CharacterSet', 'string');
  AConfiguration.CharacterSet := AValue.AsString;
end;

procedure SetPooled(var AConfiguration: TPGConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Boolean> then
    RaiseInvalidTypeException('Pooled', 'boolean');
  AConfiguration.Pooled := AValue.AsBoolean;
end;

procedure SetPoolMaxItems(var AConfiguration: TPGConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolMaxItems', 'integer');
  AConfiguration.PoolMaxItems := AValue.AsInteger;
end;

procedure SetPoolExpireTimeout(var AConfiguration: TPGConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolExpireTimeout', 'integer');
  AConfiguration.PoolExpireTimeout := AValue.AsInteger;
end;

procedure SetPoolCleanupTimeout(var AConfiguration: TPGConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolCleanupTimeout', 'integer');
  AConfiguration.PoolCleanupTimeout := AValue.AsInteger;
end;

procedure InitializeConfigurators;
begin
  FDictionary := TDictionary<TPGConfigurationParameter,
    TPGDatabaseConfigurator>.Create;

  // Adicionando setters para strings
  FDictionary.Add(TPGConfigurationParameter.Server, SetServer);
  FDictionary.Add(TPGConfigurationParameter.Port, SetPort);
  FDictionary.Add(TPGConfigurationParameter.Database, SetDatabase);
  FDictionary.Add(TPGConfigurationParameter.UserName, SetUserName);
  FDictionary.Add(TPGConfigurationParameter.Password, SetPassword);
  FDictionary.Add(TPGConfigurationParameter.CharacterSet, SetCharacterSet);

  // Adicionando setters para booleanos
  FDictionary.Add(TPGConfigurationParameter.Pooled, SetPooled);

  // Adicionando setters para inteiros
  FDictionary.Add(TPGConfigurationParameter.PoolMaxItems, SetPoolMaxItems);
  FDictionary.Add(TPGConfigurationParameter.PoolExpireTimeout,
    SetPoolExpireTimeout);
  FDictionary.Add(TPGConfigurationParameter.PoolCleanupTimeout,
    SetPoolCleanupTimeout);
end;

procedure DatabaseConfig(var AConfiguration: TPGConfiguration;
  AParameter: TPGConfigurationParameter; const AValue: TValue);
var
  LConfigureProcedure: TPGDatabaseConfigurator;
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
