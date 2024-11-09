{$IFDEF PORTUGUES}
{ *********************************************************************** }
{ HorseConnection }
{ }
{ Unit: MySQLDataBaseConfigurationParameter }
{ }
{ Descrição: }
{ Esta unit fornece procedimentos para configurar parâmetros }
{ específicos de uma instância de TMySQLConfiguration, usada para }
{ configurar o FireDAC (FDConnection) com o driver MySQL. }
{ Permite definir valores para diferentes parâmetros de configuração, }
{ como servidor, porta, biblioteca do fornecedor, e opções de pooling }
{ de conexão. }
{ }
{ Autor: Ricardo R. Pereira }
{ Data: 9 de novembro de 2024 }
{ }
{ Copyright (C) 2024 Ricardo R. Pereira }
{ }
{ Todos os direitos reservados. }
{ *********************************************************************** }
{$ELSE}
  {$IFDEF ESPANHOL}
  { *********************************************************************** }
  { HorseConnection }
  { }
  { Unidad: MySQLDataBaseConfigurationParameter }
  { }
  { Descripción: }
  { Esta unidad proporciona procedimientos para configurar parámetros }
  { específicos de una instancia de TMySQLConfiguration, utilizada para }
  { configurar FireDAC (FDConnection) con el controlador MySQL. }
  { Permite definir valores para diferentes parámetros de configuración }
  { como servidor, puerto, biblioteca del proveedor, y opciones de }
  { agrupamiento de conexiones. }
  { }
  { Autor: Ricardo R. Pereira }
  { Fecha: 9 de noviembre de 2024 }
  { }
  { Copyright (C) 2024 Ricardo R. Pereira }
  { }
  { Todos los derechos reservados. }
  { *********************************************************************** }
  {$ELSE}
  { *********************************************************************** }
  { HorseConnection }
  { }
  { Unit: MySQLDataBaseConfigurationParameter }
  { }
  { Description: }
  { This unit provides procedures for configuring specific parameters }
  { of a TMySQLConfiguration instance, used to set up FireDAC }
  { (FDConnection) with the MySQL driver. It allows defining values }
  { for various configuration parameters, such as server, port, vendor }
  { library, and connection pooling options. }
  { }
  { Author: Ricardo R. Pereira }
  { Date: November 9, 2024 }
  { }
  { Copyright (C) 2024 Ricardo R. Pereira }
  { }
  { All rights reserved. }
  { *********************************************************************** }
  {$ENDIF}
{$ENDIF}
unit MySQLDataBaseConfigurationParameter;

interface

uses
  SystemUtils,
  EnumsHelpersUtils,
  MethodReferencesUtils,
  System.Rtti,
  System.SysUtils,
  System.Generics.Collections;

{$IFDEF PORTUGUES}
/// <summary>
/// Configura um parâmetro específico em uma instância de TMySQLConfiguration
/// usando o tipo genérico TValue.
/// </summary>
/// <param name="AConfiguration">
/// A configuração do banco de dados MySQL a ser modificada.
/// </param>
/// <param name="AParameter">
/// O parâmetro de configuração a ser modificado.
/// </param>
/// <param name="AValue">
/// O valor genérico a ser atribuído ao parâmetro.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  /// Configura un parámetro específico en una instancia de TMySQLConfiguration
  /// usando el tipo genérico TValue.
  /// </summary>
  /// <param name="AConfiguration">
  /// La configuración de la base de datos MySQL a modificar.
  /// </param>
  /// <param name="AParameter">
  /// El parámetro de configuración a modificar.
  /// </param>
  /// <param name="AValue">
  /// El valor genérico a asignar al parámetro.
  /// </param>
  {$ELSE}
  /// <summary>
  /// Configures a specific parameter in a TMySQLConfiguration instance
  /// using the generic TValue type.
  /// </summary>
  /// <param name="AConfiguration">
  /// The MySQL database configuration to be modified.
  /// </param>
  /// <param name="AParameter">
  /// The configuration parameter to modify.
  /// </param>
  /// <param name="AValue">
  /// The generic value to assign to the parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure DatabaseConfig(var AConfiguration: TMySQLConfiguration;
  AParameter: TMySQLConfigurationParameter; const AValue: TValue); overload;

implementation

var
  FDictionary: TDictionary<TMySQLConfigurationParameter,
    TDatabaseConfigurator<TMySQLConfiguration>>;

{$IFDEF PORTUGUES}
  /// <summary>
  /// Define o valor do parâmetro "Database" na configuração do MySQL.
  /// </summary>
  /// <param name="AConfiguration">
  /// A configuração do banco de dados MySQL a ser modificada.
  /// </param>
  /// <param name="AValue">
  /// O valor para definir o parâmetro "Database".
  /// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
    /// <summary>
    /// Establece el valor del parámetro "Database" en la configuración de MySQL.
    /// </summary>
    /// <param name="AConfiguration">
    /// La configuración de la base de datos MySQL a modificar.
    /// </param>
    /// <param name="AValue">
    /// El valor para establecer el parámetro "Database".
    /// </param>
  {$ELSE}
    /// <summary>
    /// Sets the "Database" parameter in the MySQL configuration.
    /// </summary>
    /// <param name="AConfiguration">
    /// The MySQL database configuration to be modified.
    /// </param>
    /// <param name="AValue">
    /// The value to set for the "Database" parameter.
    /// </param>
  {$ENDIF}
{$ENDIF}

procedure SetDatabase(var AConfiguration: TMySQLConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Database', 'string');
  AConfiguration.Database := AValue.AsString;
end;

{$IFDEF PORTUGUES}
/// <summary>
/// Define o valor do parâmetro "UserName" na configuração do MySQL.
/// </summary>
/// <param name="AConfiguration">
/// A configuração do banco de dados MySQL a ser modificada.
/// </param>
/// <param name="AValue">
/// O valor para definir o parâmetro "UserName".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  /// Establece el valor del parámetro "UserName" en la configuración de MySQL.
  /// </summary>
  /// <param name="AConfiguration">
  /// La configuración de la base de datos MySQL a modificar.
  /// </param>
  /// <param name="AValue">
  /// El valor para establecer el parámetro "UserName".
  /// </param>
  {$ELSE}
  /// <summary>
  /// Sets the "UserName" parameter in the MySQL configuration.
  /// </summary>
  /// <param name="AConfiguration">
  /// The MySQL database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  /// The value to set for the "UserName" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}

procedure SetUserName(var AConfiguration: TMySQLConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('UserName', 'string');
  AConfiguration.UserName := AValue.AsString;
end;

{$IFDEF PORTUGUES}
/// <summary>
/// Define o valor do parâmetro "Password" na configuração do MySQL.
/// </summary>
/// <param name="AConfiguration">
/// A configuração do banco de dados MySQL a ser modificada.
/// </param>
/// <param name="AValue">
/// O valor para definir o parâmetro "Password".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  /// Establece el valor del parámetro "Password" en la configuración de MySQL.
  /// </summary>
  /// <param name="AConfiguration">
  /// La configuración de la base de datos MySQL a modificar.
  /// </param>
  /// <param name="AValue">
  /// El valor para establecer el parámetro "Password".
  /// </param>
  {$ELSE}
  /// <summary>
  /// Sets the "Password" parameter in the MySQL configuration.
  /// </summary>
  /// <param name="AConfiguration">
  /// The MySQL database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  /// The value to set for the "Password" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}

procedure SetPassword(var AConfiguration: TMySQLConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Password', 'string');
  AConfiguration.Password := AValue.AsString;
end;

{$IFDEF PORTUGUES}
/// <summary>
/// Define o valor do parâmetro "Server" na configuração do MySQL.
/// </summary>
/// <param name="AConfiguration">
/// A configuração do banco de dados MySQL a ser modificada.
/// </param>
/// <param name="AValue">
/// O valor para definir o parâmetro "Server".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  /// Establece el valor del parámetro "Server" en la configuración de MySQL.
  /// </summary>
  /// <param name="AConfiguration">
  /// La configuración de la base de datos MySQL a modificar.
  /// </param>
  /// <param name="AValue">
  /// El valor para establecer el parámetro "Server".
  /// </param>
  {$ELSE}
  /// <summary>
  /// Sets the "Server" parameter in the MySQL configuration.
  /// </summary>
  /// <param name="AConfiguration">
  /// The MySQL database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  /// The value to set for the "Server" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}

procedure SetServer(var AConfiguration: TMySQLConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Server', 'string');
  AConfiguration.Server := AValue.AsString;
end;

{$IFDEF PORTUGUES}
/// <summary>
/// Define o valor do parâmetro "VendorLib" na configuração do MySQL.
/// </summary>
/// <param name="AConfiguration">
/// A configuração do banco de dados MySQL a ser modificada.
/// </param>
/// <param name="AValue">
/// O valor para definir o parâmetro "VendorLib".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  /// Establece el valor del parámetro "VendorLib" en la configuración de MySQL.
  /// </summary>
  /// <param name="AConfiguration">
  /// La configuración de la base de datos MySQL a modificar.
  /// </param>
  /// <param name="AValue">
  /// El valor para establecer el parámetro "VendorLib".
  /// </param>
  {$ELSE}
  /// <summary>
  /// Sets the "VendorLib" parameter in the MySQL configuration.
  /// </summary>
  /// <param name="AConfiguration">
  /// The MySQL database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  /// The value to set for the "VendorLib" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}

procedure SetVendorLib(var AConfiguration: TMySQLConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('VendorLib', 'string');
  AConfiguration.VendorLib := AValue.AsString;
end;

{$IFDEF PORTUGUES}
/// <summary>
/// Define o valor do parâmetro "Port" na configuração do MySQL.
/// </summary>
/// <param name="AConfiguration">
/// A configuração do banco de dados MySQL a ser modificada.
/// </param>
/// <param name="AValue">
/// O valor para definir o parâmetro "Port".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  /// Establece el valor del parámetro "Port" en la configuración de MySQL.
  /// </summary>
  /// <param name="AConfiguration">
  /// La configuración de la base de datos MySQL a modificar.
  /// </param>
  /// <param name="AValue">
  /// El valor para establecer el parámetro "Port".
  /// </param>
  {$ELSE}
  /// <summary>
  /// Sets the "Port" parameter in the MySQL configuration.
  /// </summary>
  /// <param name="AConfiguration">
  /// The MySQL database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  /// The value to set for the "Port" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}

procedure SetPort(var AConfiguration: TMySQLConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('Port', 'integer');
  AConfiguration.Port := AValue.AsInteger;
end;

{$IFDEF PORTUGUES}
/// <summary>
/// Define o valor do parâmetro "Pooled" na configuração do MySQL.
/// </summary>
/// <param name="AConfiguration">
/// A configuração do banco de dados MySQL a ser modificada.
/// </param>
/// <param name="AValue">
/// O valor para definir o parâmetro "Pooled".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  /// Establece el valor del parámetro "Pooled" en la configuración de MySQL.
  /// </summary>
  /// <param name="AConfiguration">
  /// La configuración de la base de datos MySQL a modificar.
  /// </param>
  /// <param name="AValue">
  /// El valor para establecer el parámetro "Pooled".
  /// </param>
  {$ELSE}
  /// <summary>
  /// Sets the "Pooled" parameter in the MySQL configuration.
  /// </summary>
  /// <param name="AConfiguration">
  /// The MySQL database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  /// The value to set for the "Pooled" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}

procedure SetPooled(var AConfiguration: TMySQLConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<Boolean> then
    RaiseInvalidTypeException('Pooled', 'boolean');
  AConfiguration.Pooled := AValue.AsBoolean;
end;

{$IFDEF PORTUGUES}
/// <summary>
/// Define o valor do parâmetro "PoolMaxItems" na configuração do MySQL.
/// </summary>
/// <param name="AConfiguration">
/// A configuração do banco de dados MySQL a ser modificada.
/// </param>
/// <param name="AValue">
/// O valor para definir o parâmetro "PoolMaxItems".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  /// Establece el valor del parámetro "PoolMaxItems" en la configuración de MySQL.
  /// </summary>
  /// <param name="AConfiguration">
  /// La configuración de la base de datos MySQL a modificar.
  /// </param>
  /// <param name="AValue">
  /// El valor para establecer el parámetro "PoolMaxItems".
  /// </param>
  {$ELSE}
  /// <summary>
  /// Sets the "PoolMaxItems" parameter in the MySQL configuration.
  /// </summary>
  /// <param name="AConfiguration">
  /// The MySQL database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  /// The value to set for the "PoolMaxItems" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}

procedure SetPoolMaxItems(var AConfiguration: TMySQLConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolMaxItems', 'integer');
  AConfiguration.PoolMaxItems := AValue.AsInteger;
end;

{$IFDEF PORTUGUES}
/// <summary>
/// Define o valor do parâmetro "PoolExpireTimeout" na configuração do MySQL.
/// </summary>
/// <param name="AConfiguration">
/// A configuração do banco de dados MySQL a ser modificada.
/// </param>
/// <param name="AValue">
/// O valor para definir o parâmetro "PoolExpireTimeout".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  /// Establece el valor del parámetro "PoolExpireTimeout" en la configuración de MySQL.
  /// </summary>
  /// <param name="AConfiguration">
  /// La configuración de la base de datos MySQL a modificar.
  /// </param>
  /// <param name="AValue">
  /// El valor para establecer el parámetro "PoolExpireTimeout".
  /// </param>
  {$ELSE}
  /// <summary>
  /// Sets the "PoolExpireTimeout" parameter in the MySQL configuration.
  /// </summary>
  /// <param name="AConfiguration">
  /// The MySQL database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  /// The value to set for the "PoolExpireTimeout" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}

procedure SetPoolExpireTimeout(var AConfiguration: TMySQLConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolExpireTimeout', 'integer');
  AConfiguration.PoolExpireTimeout := AValue.AsInteger;
end;

{$IFDEF PORTUGUES}
/// <summary>
/// Define o valor do parâmetro "PoolCleanupTimeout" na configuração do MySQL.
/// </summary>
/// <param name="AConfiguration">
/// A configuração do banco de dados MySQL a ser modificada.
/// </param>
/// <param name="AValue">
/// O valor para definir o parâmetro "PoolCleanupTimeout".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  /// Establece el valor del parámetro "PoolCleanupTimeout" en la configuración de MySQL.
  /// </summary>
  /// <param name="AConfiguration">
  /// La configuración de la base de datos MySQL a modificar.
  /// </param>
  /// <param name="AValue">
  /// El valor para establecer el parámetro "PoolCleanupTimeout".
  /// </param>
  {$ELSE}
  /// <summary>
  /// Sets the "PoolCleanupTimeout" parameter in the MySQL configuration.
  /// </summary>
  /// <param name="AConfiguration">
  /// The MySQL database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  /// The value to set for the "PoolCleanupTimeout" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}

procedure SetPoolCleanupTimeout(var AConfiguration: TMySQLConfiguration;
  const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolCleanupTimeout', 'integer');
  AConfiguration.PoolCleanupTimeout := AValue.AsInteger;
end;

// Inicialização e Finalização
{$IFDEF PORTUGUES}
/// <summary>
/// Inicializa o dicionário com os procedimentos de configuração dos parâmetros.
/// </summary>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  /// Inicializa el diccionario con los procedimientos de configuración de los parámetros.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Initializes the dictionary with the parameter configuration procedures.
  /// </summary>
  {$ENDIF}
{$ENDIF}
procedure InitializeConfigurators;
begin
  FDictionary := TDictionary < TMySQLConfigurationParameter,
    TDatabaseConfigurator < TMySQLConfiguration >>.Create;

  // Adicionando setters para strings
  FDictionary.Add(TMySQLConfigurationParameter.Database, SetDatabase);
  FDictionary.Add(TMySQLConfigurationParameter.UserName, SetUserName);
  FDictionary.Add(TMySQLConfigurationParameter.Password, SetPassword);
  FDictionary.Add(TMySQLConfigurationParameter.Server, SetServer);
  FDictionary.Add(TMySQLConfigurationParameter.VendorLib, SetVendorLib);

  // Adicionando setters para inteiros
  FDictionary.Add(TMySQLConfigurationParameter.Port, SetPort);
  FDictionary.Add(TMySQLConfigurationParameter.PoolMaxItems, SetPoolMaxItems);
  FDictionary.Add(TMySQLConfigurationParameter.PoolExpireTimeout,
    SetPoolExpireTimeout);
  FDictionary.Add(TMySQLConfigurationParameter.PoolCleanupTimeout,
    SetPoolCleanupTimeout);

  // Adicionando setter para booleano
  FDictionary.Add(TMySQLConfigurationParameter.Pooled, SetPooled);
end;

procedure DatabaseConfig(var AConfiguration: TMySQLConfiguration;
  AParameter: TMySQLConfigurationParameter; const AValue: TValue);
var
  LConfigureProcedure: TDatabaseConfigurator<TMySQLConfiguration>;
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

{$IFDEF PORTUGUES}
/// <summary>
/// Inicializa o dicionário de configuradores de parâmetros no momento da inicialização da aplicação.
/// </summary>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  /// Inicializa el diccionario de configuradores de parámetros en el momento de la inicialización de la aplicación.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Initializes the parameter configurator dictionary at application initialization.
  /// </summary>
  {$ENDIF}
{$ENDIF}

initialization

InitializeConfigurators;

{$IFDEF PORTUGUES}
/// <summary>
/// Libera o dicionário de configuradores de parâmetros no momento da finalização da aplicação.
/// </summary>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  /// Libera el diccionario de configuradores de parámetros al finalizar la aplicación.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Frees the parameter configurator dictionary at application finalization.
  /// </summary>
  {$ENDIF}
{$ENDIF}

finalization

FDictionary.Free;

end.
