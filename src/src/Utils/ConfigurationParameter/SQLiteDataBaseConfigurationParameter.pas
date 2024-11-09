unit SQLiteDataBaseConfigurationParameter;

interface

uses
  SystemUtils,
  EnumsHelpersUtils,
  MethodReferencesUtils,

  System.Rtti,
  System.SysUtils,
  System.Generics.Collections;

procedure DatabaseConfig(var AConfiguration: TSQLiteConfiguration;
  AParameter: TSQLiteConfigurationParameter; const AValue: TValue); overload;
procedure DatabaseConfig(var AConfiguration: TSQLiteConfiguration;
  AParameter: TSQLiteConfigurationParameter;
  const AValue: TSQLiteLockingModeType); overload;
procedure DatabaseConfig(var AConfiguration: TSQLiteConfiguration;
  AParameter: TSQLiteConfigurationParameter;
  const AValue: TSQLiteOpenModeType); overload;
procedure DatabaseConfig(var AConfiguration: TSQLiteConfiguration;
  AParameter: TSQLiteConfigurationParameter;
  const AValue: TSQLiteEncryptType); overload;

implementation

var
  FDictionary: TDictionary<TSQLiteConfigurationParameter,
    TSQLiteDatabaseConfigurator>;

procedure SetDatabase(var AConfiguration: TSQLiteConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Database', 'string');
  AConfiguration.Database := GetAbsolutePath(AValue.AsString);
end;

procedure SetUserName(var AConfiguration: TSQLiteConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('UserName', 'string');
  AConfiguration.UserName := AValue.AsString;
end;

procedure SetPassword(var AConfiguration: TSQLiteConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Password', 'string');
  AConfiguration.Password := AValue.AsString;
end;

procedure SetPooled(var AConfiguration: TSQLiteConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<Boolean> then
    RaiseInvalidTypeException('Pooled', 'boolean');
  AConfiguration.Pooled := AValue.AsBoolean;
end;

procedure SetPoolMaxItems(var AConfiguration: TSQLiteConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolMaxItems', 'integer');
  AConfiguration.PoolMaxItems := AValue.AsInteger;
end;

procedure SetPoolExpireTimeout(var AConfiguration: TSQLiteConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolExpireTimeout', 'integer');
  AConfiguration.PoolExpireTimeout := AValue.AsInteger;
end;

procedure SetPoolCleanupTimeout(var AConfiguration: TSQLiteConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolCleanupTimeout', 'integer');
  AConfiguration.PoolCleanupTimeout := AValue.AsInteger;
end;

procedure SetLockingMode(var AConfiguration: TSQLiteConfiguration;
  const AValue: TValue);
var
  LLockingMode: TSQLiteLockingModeType;
begin
  if not AValue.TryAsType<TSQLiteLockingModeType>(LLockingMode) then
    RaiseInvalidTypeException('LockingMode', 'TSQLiteLockingModeType');

  AConfiguration.LockingMode := LLockingMode;
end;

procedure SetOpenMode(var AConfiguration: TSQLiteConfiguration;
  const AValue: TValue);
var
  LOpenMode: TSQLiteOpenModeType;
begin
  if not AValue.TryAsType<TSQLiteOpenModeType>(LOpenMode) then
    RaiseInvalidTypeException('OpenMode', 'TSQLiteOpenModeType');

  AConfiguration.OpenMode := LOpenMode;
end;

procedure SetEncrypt(var AConfiguration: TSQLiteConfiguration;
  const AValue: TValue);
var
  LEncrypt: TSQLiteEncryptType;
begin
  if not AValue.TryAsType<TSQLiteEncryptType>(LEncrypt) then
    RaiseInvalidTypeException('Encrypt', 'TSQLiteEncryptType');

  AConfiguration.Encrypt := LEncrypt;
end;

procedure InitializeConfigurators;
begin
  FDictionary := TDictionary<TSQLiteConfigurationParameter,
    TSQLiteDatabaseConfigurator>.Create;

  // Adicionando setters para strings
  FDictionary.Add(TSQLiteConfigurationParameter.Database, SetDatabase);
  FDictionary.Add(TSQLiteConfigurationParameter.UserName, SetUserName);
  FDictionary.Add(TSQLiteConfigurationParameter.Password, SetPassword);

  // Adicionando setters para Enumerados
  FDictionary.Add(TSQLiteConfigurationParameter.LockingMode, SetLockingMode);
  FDictionary.Add(TSQLiteConfigurationParameter.OpenMode, SetOpenMode);
  FDictionary.Add(TSQLiteConfigurationParameter.Encrypt, SetEncrypt);

  // Adicionando setters para booleanos
  FDictionary.Add(TSQLiteConfigurationParameter.Pooled, SetPooled);

  // Adicionando setters para inteiros
  FDictionary.Add(TSQLiteConfigurationParameter.PoolMaxItems, SetPoolMaxItems);
  FDictionary.Add(TSQLiteConfigurationParameter.PoolExpireTimeout,
    SetPoolExpireTimeout);
  FDictionary.Add(TSQLiteConfigurationParameter.PoolCleanupTimeout,
    SetPoolCleanupTimeout);
end;

procedure DatabaseConfig(var AConfiguration: TSQLiteConfiguration;
  AParameter: TSQLiteConfigurationParameter;
  const AValue: TSQLiteLockingModeType);
begin
  AConfiguration.LockingMode := AValue;
end;

procedure DatabaseConfig(var AConfiguration: TSQLiteConfiguration;
  AParameter: TSQLiteConfigurationParameter; const AValue: TSQLiteOpenModeType);
begin
  AConfiguration.OpenMode := AValue;
end;

procedure DatabaseConfig(var AConfiguration: TSQLiteConfiguration;
  AParameter: TSQLiteConfigurationParameter; const AValue: TSQLiteEncryptType);
begin
  AConfiguration.Encrypt := AValue;
end;

procedure DatabaseConfig(var AConfiguration: TSQLiteConfiguration;
  AParameter: TSQLiteConfigurationParameter; const AValue: TValue);
var
  LConfigureProcedure: TSQLiteDatabaseConfigurator;
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
