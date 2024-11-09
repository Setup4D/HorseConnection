unit ADSDataBaseConfigurationParameter;

interface

uses
  SystemUtils,
  EnumsHelpersUtils,
  MethodReferencesUtils,

  System.Rtti,
  System.SysUtils,
  System.Generics.Collections;

procedure DatabaseConfig(var AConfiguration: TADSConfiguration;
  AParameter: TADSConfigurationParameter; const AValue: TValue); overload;
procedure DatabaseConfig(var AConfiguration: TADSConfiguration;
  AParameter: TADSConfigurationParameter;
  const AValue: TADSServerType); overload;
procedure DatabaseConfig(var AConfiguration: TADSConfiguration;
  AParameter: TADSConfigurationParameter;
  const AValue: TADSCharacterSet); overload;
procedure DatabaseConfig(var AConfiguration: TADSConfiguration;
  AParameter: TADSConfigurationParameter; const AValue: TADSProtocol); overload;
procedure DatabaseConfig(var AConfiguration: TADSConfiguration;
  AParameter: TADSConfigurationParameter; const AValue: TADSTableType);
  overload;
procedure DatabaseConfig(var AConfiguration: TADSConfiguration;
  AParameter: TADSConfigurationParameter; const AValue: TADSLocking); overload;

implementation

var
  FDictionary: TDictionary<TADSConfigurationParameter, TADSDatabaseConfigurator>;

procedure SetDatabase(var AConfiguration: TADSConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Database', 'string');
  AConfiguration.Database := GetAbsolutePath(AValue.AsString);
end;

procedure SetUserName(var AConfiguration: TADSConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('UserName', 'string');
  AConfiguration.UserName := AValue.AsString;
end;

procedure SetPassword(var AConfiguration: TADSConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Password', 'string');
  AConfiguration.Password := AValue.AsString;
end;

procedure SetCharacterSet(var AConfiguration: TADSConfiguration;
  const AValue: TValue);
var
  LCharacterSet: TADSCharacterSet;
begin
  if not AValue.TryAsType<TADSCharacterSet>(LCharacterSet) then
    RaiseInvalidTypeException('CharacterSet', 'TADSCharacterSet');

  AConfiguration.CharacterSet := LCharacterSet;
end;

procedure SetPooled(var AConfiguration: TADSConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<Boolean> then
    RaiseInvalidTypeException('Pooled', 'boolean');
  AConfiguration.Pooled := AValue.AsBoolean;
end;

procedure SetPoolMaxItems(var AConfiguration: TADSConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolMaxItems', 'integer');
  AConfiguration.PoolMaxItems := AValue.AsInteger;
end;

procedure SetPoolExpireTimeout(var AConfiguration: TADSConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolExpireTimeout', 'integer');
  AConfiguration.PoolExpireTimeout := AValue.AsInteger;
end;

procedure SetPoolCleanupTimeout(var AConfiguration: TADSConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolCleanupTimeout', 'integer');
  AConfiguration.PoolCleanupTimeout := AValue.AsInteger;
end;

procedure SetShowDelete(var AConfiguration: TADSConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<Boolean> then
    RaiseInvalidTypeException('ShowDelete', 'boolean');
  AConfiguration.ShowDelete := AValue.AsBoolean;
end;

procedure SetVendorLib(var AConfiguration: TADSConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('VendorLib', 'string');
  AConfiguration.VendorLib := GetAbsolutePath(AValue.AsString);
end;

procedure SetProtocol(var AConfiguration: TADSConfiguration;
  const AValue: TValue);
var
  LProtocol: TADSProtocol;
begin
  if not AValue.TryAsType<TADSProtocol>(LProtocol) then
    RaiseInvalidTypeException('Protocol', 'TADSProtocol');

  AConfiguration.Protocol := LProtocol;
end;

procedure SetTableType(var AConfiguration: TADSConfiguration;
  const AValue: TValue);
var
  LTableType: TADSTableType;
begin
  if not AValue.TryAsType<TADSTableType>(LTableType) then
    RaiseInvalidTypeException('TableType', 'TADSTableType');

  AConfiguration.TableType := LTableType;
end;

procedure SetLocking(var AConfiguration: TADSConfiguration;
  const AValue: TValue);
var
  LLocking: TADSLocking;
begin
  if not AValue.TryAsType<TADSLocking>(LLocking) then
    RaiseInvalidTypeException('Locking', 'TADSLocking');

  AConfiguration.Locking := LLocking;
end;

procedure SetServerTypes(var AConfiguration: TADSConfiguration;
  const AValue: TValue);
var
  LServerType: TADSServerType;
begin
  if not AValue.TryAsType<TADSServerType>(LServerType) then
    RaiseInvalidTypeException('ServerType', 'TADSServerType');

  AConfiguration.ServerType := LServerType;
end;

procedure InitializeConfigurators;
begin
  FDictionary := TDictionary<TADSConfigurationParameter,
    TADSDatabaseConfigurator>.Create;

  // Adicionando setters para strings
  FDictionary.Add(TADSConfigurationParameter.Database, SetDatabase);
  FDictionary.Add(TADSConfigurationParameter.UserName, SetUserName);
  FDictionary.Add(TADSConfigurationParameter.Password, SetPassword);
  FDictionary.Add(TADSConfigurationParameter.VendorLib, SetVendorLib);

  // Adicionando setters para enumerados
  FDictionary.Add(TADSConfigurationParameter.ServerTypes, SetServerTypes);
  FDictionary.Add(TADSConfigurationParameter.CharacterSet, SetCharacterSet);
  FDictionary.Add(TADSConfigurationParameter.Protocol, SetProtocol);
  FDictionary.Add(TADSConfigurationParameter.TableType, SetTableType);
  FDictionary.Add(TADSConfigurationParameter.Locking, SetLocking);

  // Adicionando setters para booleanos
  FDictionary.Add(TADSConfigurationParameter.Pooled, SetPooled);
  FDictionary.Add(TADSConfigurationParameter.ShowDelete, SetShowDelete);

  // Adicionando setters para inteiros
  FDictionary.Add(TADSConfigurationParameter.PoolMaxItems, SetPoolMaxItems);
  FDictionary.Add(TADSConfigurationParameter.PoolExpireTimeout,
    SetPoolExpireTimeout);
  FDictionary.Add(TADSConfigurationParameter.PoolCleanupTimeout,
    SetPoolCleanupTimeout);
end;

procedure DatabaseConfig(var AConfiguration: TADSConfiguration;
  AParameter: TADSConfigurationParameter; const AValue: TADSServerType);
begin
  AConfiguration.ServerType := AValue;
end;

procedure DatabaseConfig(var AConfiguration: TADSConfiguration;
  AParameter: TADSConfigurationParameter; const AValue: TADSCharacterSet);
begin
  AConfiguration.CharacterSet := AValue;
end;

procedure DatabaseConfig(var AConfiguration: TADSConfiguration;
  AParameter: TADSConfigurationParameter; const AValue: TADSProtocol);
begin
  AConfiguration.Protocol := AValue;
end;

procedure DatabaseConfig(var AConfiguration: TADSConfiguration;
  AParameter: TADSConfigurationParameter; const AValue: TADSTableType);
begin
  AConfiguration.TableType := AValue;
end;

procedure DatabaseConfig(var AConfiguration: TADSConfiguration;
  AParameter: TADSConfigurationParameter; const AValue: TADSLocking); overload;
begin
  AConfiguration.Locking := AValue;
end;

procedure DatabaseConfig(var AConfiguration: TADSConfiguration;
  AParameter: TADSConfigurationParameter; const AValue: TValue);
var
  LConfigureProcedure: TADSDatabaseConfigurator;
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
