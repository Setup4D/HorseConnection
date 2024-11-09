{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: SQLiteDataBaseConfigurationParameter                            }
{                                                                       }
{ Descrição:                                                            }
{   Esta unit fornece procedimentos para configurar parâmetros          }
{   específicos de uma instância de TSQLiteConfiguration, usada para    }
{   configurar o FireDAC (FDConnection) com o driver SQLite.            }
{   Permite definir valores para diferentes parâmetros de configuração, }
{   como modo de bloqueio, modo de abertura, tipo de criptografia,      }
{   e outras opções de conexão.                                         }
{                                                                       }
{ Autor: Ricardo R. Pereira                                             }
{ Data: 9 de novembro de 2024                                           }
{                                                                       }
{ Copyright (C) 2024 Ricardo R. Pereira                                 }
{                                                                       }
{ Todos os direitos reservados.                                         }
{***********************************************************************}
{$ELSE}
  {$IFDEF ESPANHOL}
  {***********************************************************************}
  {                          HorseConnection                              }
  {                                                                       }
  { Unidad: SQLiteDataBaseConfigurationParameter                          }
  {                                                                       }
  { Descripción:                                                          }
  {   Esta unidad proporciona procedimientos para configurar parámetros   }
  {   específicos de una instancia de TSQLiteConfiguration, utilizada     }
  {   para configurar FireDAC (FDConnection) con el controlador SQLite.   }
  {   Permite definir valores para diferentes parámetros de configuración }
  {   como modo de bloqueo, modo de apertura, tipo de cifrado, y otras    }
  {   opciones de conexión.                                               }
  {                                                                       }
  { Autor: Ricardo R. Pereira                                             }
  { Fecha: 9 de noviembre de 2024                                         }
  {                                                                       }
  { Copyright (C) 2024 Ricardo R. Pereira                                 }
  {                                                                       }
  { Todos los derechos reservados.                                        }
  {***********************************************************************}
  {$ELSE}
  {***********************************************************************}
  {                          HorseConnection                              }
  {                                                                       }
  { Unit: SQLiteDataBaseConfigurationParameter                            }
  {                                                                       }
  { Description:                                                          }
  {   This unit provides procedures for configuring specific parameters   }
  {   of a TSQLiteConfiguration instance, used to set up FireDAC          }
  {   (FDConnection) with the SQLite driver. It allows defining values    }
  {   for various configuration parameters, such as locking mode, open    }
  {   mode, encryption type, and other connection options.                }
  {                                                                       }
  { Author: Ricardo R. Pereira                                            }
  { Date: November 9, 2024                                                }
  {                                                                       }
  { Copyright (C) 2024 Ricardo R. Pereira                                 }
  {                                                                       }
  { All rights reserved.                                                  }
  {***********************************************************************}
  {$ENDIF}
{$ENDIF}

unit SQLiteDataBaseConfigurationParameter;

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
///   Configura um parâmetro específico em uma instância de TSQLiteConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AParameter">
///   O parâmetro de configuração a ser modificado.
/// </param>
/// <param name="AValue">
///   O valor a ser atribuído ao parâmetro.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura un parámetro específico en una instancia de TSQLiteConfiguration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AParameter">
  ///   El parámetro de configuración a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor a asignar al parámetro.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Configures a specific parameter in a TSQLiteConfiguration instance.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The SQLite database configuration to be modified.
  /// </param>
  /// <param name="AParameter">
  ///   The configuration parameter to modify.
  /// </param>
  /// <param name="AValue">
  ///   The value to assign to the parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure DatabaseConfig(var AConfiguration: TSQLiteConfiguration;
  AParameter: TSQLiteConfigurationParameter; const AValue: TValue); overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura o modo de bloqueio em uma instância de TSQLiteConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AParameter">
///   O parâmetro de configuração para o modo de bloqueio.
/// </param>
/// <param name="AValue">
///   O valor a ser atribuído ao modo de bloqueio.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el modo de bloqueo en una instancia de TSQLiteConfiguration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AParameter">
  ///   El parámetro de configuración para el modo de bloqueo.
  /// </param>
  /// <param name="AValue">
  ///   El valor a asignar al modo de bloqueo.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Configures the locking mode in a TSQLiteConfiguration instance.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The SQLite database configuration to be modified.
  /// </param>
  /// <param name="AParameter">
  ///   The configuration parameter for the locking mode.
  /// </param>
  /// <param name="AValue">
  ///   The value to assign to the locking mode.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure DatabaseConfig(var AConfiguration: TSQLiteConfiguration;
  AParameter: TSQLiteConfigurationParameter; const AValue: TSQLiteLockingModeType); overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura o modo de abertura em uma instância de TSQLiteConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AParameter">
///   O parâmetro de configuração para o modo de abertura.
/// </param>
/// <param name="AValue">
///   O valor a ser atribuído ao modo de abertura.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el modo de apertura en una instancia de TSQLiteConfiguration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AParameter">
  ///   El parámetro de configuración para el modo de apertura.
  /// </param>
  /// <param name="AValue">
  ///   El valor a asignar al modo de apertura.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Configures the open mode in a TSQLiteConfiguration instance.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The SQLite database configuration to be modified.
  /// </param>
  /// <param name="AParameter">
  ///   The configuration parameter for the open mode.
  /// </param>
  /// <param name="AValue">
  ///   The value to assign to the open mode.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure DatabaseConfig(var AConfiguration: TSQLiteConfiguration;
  AParameter: TSQLiteConfigurationParameter; const AValue: TSQLiteOpenModeType); overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura o tipo de criptografia em uma instância de TSQLiteConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AParameter">
///   O parâmetro de configuração para o tipo de criptografia.
/// </param>
/// <param name="AValue">
///   O valor a ser atribuído ao tipo de criptografia.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el tipo de cifrado en una instancia de TSQLiteConfiguration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AParameter">
  ///   El parámetro de configuración para el tipo de cifrado.
  /// </param>
  /// <param name="AValue">
  ///   El valor a asignar al tipo de cifrado.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Configures the encryption type in a TSQLiteConfiguration instance.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The SQLite database configuration to be modified.
  /// </param>
  /// <param name="AParameter">
  ///   The configuration parameter for the encryption type.
  /// </param>
  /// <param name="AValue">
  ///   The value to assign to the encryption type.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure DatabaseConfig(var AConfiguration: TSQLiteConfiguration;
  AParameter: TSQLiteConfigurationParameter; const AValue: TSQLiteEncryptType); overload;

implementation

var
  FDictionary: TDictionary<TSQLiteConfigurationParameter,
    TDatabaseConfigurator<TSQLiteConfiguration>>;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o valor do parâmetro "Database" na configuração do SQLite.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o parâmetro "Database".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del parámetro "Database" en la configuración de SQLite.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el parámetro "Database".
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the "Database" parameter in the SQLite configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The SQLite database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  ///   The value to set for the "Database" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetDatabase(var AConfiguration: TSQLiteConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Database', 'string');
  AConfiguration.Database := GetAbsolutePath(AValue.AsString);
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o valor do parâmetro "UserName" na configuração do SQLite.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o parâmetro "UserName".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del parámetro "UserName" en la configuración de SQLite.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el parámetro "UserName".
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the "UserName" parameter in the SQLite configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The SQLite database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  ///   The value to set for the "UserName" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetUserName(var AConfiguration: TSQLiteConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('UserName', 'string');
  AConfiguration.UserName := AValue.AsString;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o valor do parâmetro "Password" na configuração do SQLite.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o parâmetro "Password".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del parámetro "Password" en la configuración de SQLite.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el parámetro "Password".
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the "Password" parameter in the SQLite configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The SQLite database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  ///   The value to set for the "Password" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetPassword(var AConfiguration: TSQLiteConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Password', 'string');
  AConfiguration.Password := AValue.AsString;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o valor do parâmetro "Pooled" na configuração do SQLite.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o parâmetro "Pooled".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del parámetro "Pooled" en la configuración de SQLite.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el parámetro "Pooled".
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the "Pooled" parameter in the SQLite configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The SQLite database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  ///   The value to set for the "Pooled" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetPooled(var AConfiguration: TSQLiteConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Boolean> then
    RaiseInvalidTypeException('Pooled', 'boolean');
  AConfiguration.Pooled := AValue.AsBoolean;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o valor do parâmetro "PoolMaxItems" na configuração do SQLite.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o parâmetro "PoolMaxItems".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del parámetro "PoolMaxItems" en la configuración de SQLite.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el parámetro "PoolMaxItems".
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the "PoolMaxItems" parameter in the SQLite configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The SQLite database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  ///   The value to set for the "PoolMaxItems" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetPoolMaxItems(var AConfiguration: TSQLiteConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolMaxItems', 'integer');
  AConfiguration.PoolMaxItems := AValue.AsInteger;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o valor do parâmetro "PoolExpireTimeout" na configuração do SQLite.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o parâmetro "PoolExpireTimeout".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del parámetro "PoolExpireTimeout" en la configuración de SQLite.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el parámetro "PoolExpireTimeout".
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the "PoolExpireTimeout" parameter in the SQLite configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The SQLite database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  ///   The value to set for the "PoolExpireTimeout" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetPoolExpireTimeout(var AConfiguration: TSQLiteConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolExpireTimeout', 'integer');
  AConfiguration.PoolExpireTimeout := AValue.AsInteger;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o valor do parâmetro "PoolCleanupTimeout" na configuração do SQLite.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o parâmetro "PoolCleanupTimeout".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del parámetro "PoolCleanupTimeout" en la configuración de SQLite.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el parámetro "PoolCleanupTimeout".
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the "PoolCleanupTimeout" parameter in the SQLite configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The SQLite database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  ///   The value to set for the "PoolCleanupTimeout" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetPoolCleanupTimeout(var AConfiguration: TSQLiteConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolCleanupTimeout', 'integer');
  AConfiguration.PoolCleanupTimeout := AValue.AsInteger;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o valor do parâmetro "LockingMode" na configuração do SQLite.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o parâmetro "LockingMode".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del parámetro "LockingMode" en la configuración de SQLite.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el parámetro "LockingMode".
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the "LockingMode" parameter in the SQLite configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The SQLite database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  ///   The value to set for the "LockingMode" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetLockingMode(var AConfiguration: TSQLiteConfiguration; const AValue: TValue);
var
  LLockingMode: TSQLiteLockingModeType;
begin
  if not AValue.TryAsType<TSQLiteLockingModeType>(LLockingMode) then
    RaiseInvalidTypeException('LockingMode', 'TSQLiteLockingModeType');
  AConfiguration.LockingMode := LLockingMode;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o valor do parâmetro "OpenMode" na configuração do SQLite.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o parâmetro "OpenMode".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del parámetro "OpenMode" en la configuración de SQLite.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el parámetro "OpenMode".
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the "OpenMode" parameter in the SQLite configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The SQLite database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  ///   The value to set for the "OpenMode" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetOpenMode(var AConfiguration: TSQLiteConfiguration; const AValue: TValue);
var
  LOpenMode: TSQLiteOpenModeType;
begin
  if not AValue.TryAsType<TSQLiteOpenModeType>(LOpenMode) then
    RaiseInvalidTypeException('OpenMode', 'TSQLiteOpenModeType');
  AConfiguration.OpenMode := LOpenMode;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o valor do parâmetro "Encrypt" na configuração do SQLite.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o parâmetro "Encrypt".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del parámetro "Encrypt" en la configuración de SQLite.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el parámetro "Encrypt".
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the "Encrypt" parameter in the SQLite configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The SQLite database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  ///   The value to set for the "Encrypt" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetEncrypt(var AConfiguration: TSQLiteConfiguration; const AValue: TValue);
var
  LEncrypt: TSQLiteEncryptType;
begin
  if not AValue.TryAsType<TSQLiteEncryptType>(LEncrypt) then
    RaiseInvalidTypeException('Encrypt', 'TSQLiteEncryptType');
  AConfiguration.Encrypt := LEncrypt;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Inicializa o dicionário de configuradores de parâmetros do SQLite,
///   associando cada parâmetro ao seu procedimento de configuração correspondente.
/// </summary>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Inicializa el diccionario de configuradores de parámetros de SQLite,
  ///   asociando cada parámetro con su procedimiento de configuración correspondiente.
  /// </summary>
  {$ELSE}
  /// <summary>
  ///   Initializes the SQLite parameter configurators dictionary,
  ///   associating each parameter with its corresponding setup procedure.
  /// </summary>
  {$ENDIF}
{$ENDIF}
procedure InitializeConfigurators;
begin
  FDictionary := TDictionary<TSQLiteConfigurationParameter, TDatabaseConfigurator<TSQLiteConfiguration>>.Create;

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
  FDictionary.Add(TSQLiteConfigurationParameter.PoolExpireTimeout, SetPoolExpireTimeout);
  FDictionary.Add(TSQLiteConfigurationParameter.PoolCleanupTimeout, SetPoolCleanupTimeout);
end;

procedure DatabaseConfig(var AConfiguration: TSQLiteConfiguration;
  AParameter: TSQLiteConfigurationParameter; const AValue: TValue);
var
  LConfigureProcedure: TDatabaseConfigurator<TSQLiteConfiguration>;
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

procedure DatabaseConfig(var AConfiguration: TSQLiteConfiguration;
  AParameter: TSQLiteConfigurationParameter; const AValue: TSQLiteLockingModeType);
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


