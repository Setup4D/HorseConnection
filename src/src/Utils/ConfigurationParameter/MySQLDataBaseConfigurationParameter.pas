unit MySQLDataBaseConfigurationParameter;

interface

uses
  SystemUtils,
  EnumsHelpersUtils,
  MethodReferencesUtils,

  System.Rtti,
  System.SysUtils,
  System.Generics.Collections;

procedure DatabaseConfig(var AConfiguration: TMySQLConfiguration;
  AParameter: TMySQLConfigurationParameter; const AValue: TValue); overload;

implementation

var
  FDictionary: TDictionary<TMySQLConfigurationParameter, TMySQLDatabaseConfigurator>;

procedure SetDatabase(var AConfiguration: TMySQLConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Database', 'string');
  AConfiguration.Database := AValue.AsString;
end;

procedure SetUserName(var AConfiguration: TMySQLConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('UserName', 'string');
  AConfiguration.UserName := AValue.AsString;
end;

procedure SetPassword(var AConfiguration: TMySQLConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Password', 'string');
  AConfiguration.Password := AValue.AsString;
end;

procedure SetServer(var AConfiguration: TMySQLConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Server', 'string');
  AConfiguration.Server := AValue.AsString;
end;

procedure SetVendorLib(var AConfiguration: TMySQLConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('VendorLib', 'string');
  AConfiguration.VendorLib := AValue.AsString;
end;

procedure SetPort(var AConfiguration: TMySQLConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('Port', 'integer');
  AConfiguration.Port := AValue.AsInteger;
end;

procedure SetPooled(var AConfiguration: TMySQLConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Boolean> then
    RaiseInvalidTypeException('Pooled', 'boolean');
  AConfiguration.Pooled := AValue.AsBoolean;
end;

procedure SetPoolMaxItems(var AConfiguration: TMySQLConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolMaxItems', 'integer');
  AConfiguration.PoolMaxItems := AValue.AsInteger;
end;

procedure SetPoolExpireTimeout(var AConfiguration: TMySQLConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolExpireTimeout', 'integer');
  AConfiguration.PoolExpireTimeout := AValue.AsInteger;
end;

procedure SetPoolCleanupTimeout(var AConfiguration: TMySQLConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolCleanupTimeout', 'integer');
  AConfiguration.PoolCleanupTimeout := AValue.AsInteger;
end;

procedure InitializeConfigurators;
begin
  FDictionary := TDictionary<TMySQLConfigurationParameter, TMySQLDatabaseConfigurator>.Create;

  // Adicionando setters para strings
  FDictionary.Add(TMySQLConfigurationParameter.Database, SetDatabase);
  FDictionary.Add(TMySQLConfigurationParameter.UserName, SetUserName);
  FDictionary.Add(TMySQLConfigurationParameter.Password, SetPassword);
  FDictionary.Add(TMySQLConfigurationParameter.Server, SetServer);
  FDictionary.Add(TMySQLConfigurationParameter.VendorLib, SetVendorLib);

  // Adicionando setters para inteiros
  FDictionary.Add(TMySQLConfigurationParameter.Port, SetPort);
  FDictionary.Add(TMySQLConfigurationParameter.PoolMaxItems, SetPoolMaxItems);
  FDictionary.Add(TMySQLConfigurationParameter.PoolExpireTimeout, SetPoolExpireTimeout);
  FDictionary.Add(TMySQLConfigurationParameter.PoolCleanupTimeout, SetPoolCleanupTimeout);

  // Adicionando setter para booleano
  FDictionary.Add(TMySQLConfigurationParameter.Pooled, SetPooled);
end;

procedure DatabaseConfig(var AConfiguration: TMySQLConfiguration;
  AParameter: TMySQLConfigurationParameter; const AValue: TValue);
var
  LConfigureProcedure: TMySQLDatabaseConfigurator;
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

