{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: SQLiteDataBaseConfigurationParameter                            }
{                                                                       }
{ Descri��o:                                                            }
{   Esta unit fornece procedimentos para configurar par�metros          }
{   espec�ficos de uma inst�ncia de TSQLiteConfiguration, usada para    }
{   configurar o FireDAC (FDConnection) com o driver SQLite.            }
{   Permite definir valores para diferentes par�metros de configura��o, }
{   como modo de bloqueio, modo de abertura, tipo de criptografia,      }
{   e outras op��es de conex�o.                                         }
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
  { Descripci�n:                                                          }
  {   Esta unidad proporciona procedimientos para configurar par�metros   }
  {   espec�ficos de una instancia de TSQLiteConfiguration, utilizada     }
  {   para configurar FireDAC (FDConnection) con el controlador SQLite.   }
  {   Permite definir valores para diferentes par�metros de configuraci�n }
  {   como modo de bloqueo, modo de apertura, tipo de cifrado, y otras    }
  {   opciones de conexi�n.                                               }
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
///   Configura um par�metro espec�fico em uma inst�ncia de TSQLiteConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AParameter">
///   O par�metro de configura��o a ser modificado.
/// </param>
/// <param name="AValue">
///   O valor a ser atribu�do ao par�metro.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura un par�metro espec�fico en una instancia de TSQLiteConfiguration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AParameter">
  ///   El par�metro de configuraci�n a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor a asignar al par�metro.
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
///   Configura o modo de bloqueio em uma inst�ncia de TSQLiteConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AParameter">
///   O par�metro de configura��o para o modo de bloqueio.
/// </param>
/// <param name="AValue">
///   O valor a ser atribu�do ao modo de bloqueio.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el modo de bloqueo en una instancia de TSQLiteConfiguration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AParameter">
  ///   El par�metro de configuraci�n para el modo de bloqueo.
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
///   Configura o modo de abertura em uma inst�ncia de TSQLiteConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AParameter">
///   O par�metro de configura��o para o modo de abertura.
/// </param>
/// <param name="AValue">
///   O valor a ser atribu�do ao modo de abertura.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el modo de apertura en una instancia de TSQLiteConfiguration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AParameter">
  ///   El par�metro de configuraci�n para el modo de apertura.
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
///   Configura o tipo de criptografia em uma inst�ncia de TSQLiteConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AParameter">
///   O par�metro de configura��o para o tipo de criptografia.
/// </param>
/// <param name="AValue">
///   O valor a ser atribu�do ao tipo de criptografia.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el tipo de cifrado en una instancia de TSQLiteConfiguration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AParameter">
  ///   El par�metro de configuraci�n para el tipo de cifrado.
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
///   Define o valor do par�metro "Database" na configura��o do SQLite.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o par�metro "Database".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del par�metro "Database" en la configuraci�n de SQLite.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el par�metro "Database".
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
///   Define o valor do par�metro "UserName" na configura��o do SQLite.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o par�metro "UserName".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del par�metro "UserName" en la configuraci�n de SQLite.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el par�metro "UserName".
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
///   Define o valor do par�metro "Password" na configura��o do SQLite.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o par�metro "Password".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del par�metro "Password" en la configuraci�n de SQLite.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el par�metro "Password".
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
///   Define o valor do par�metro "Pooled" na configura��o do SQLite.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o par�metro "Pooled".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del par�metro "Pooled" en la configuraci�n de SQLite.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el par�metro "Pooled".
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
///   Define o valor do par�metro "PoolMaxItems" na configura��o do SQLite.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o par�metro "PoolMaxItems".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del par�metro "PoolMaxItems" en la configuraci�n de SQLite.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el par�metro "PoolMaxItems".
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
///   Define o valor do par�metro "PoolExpireTimeout" na configura��o do SQLite.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o par�metro "PoolExpireTimeout".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del par�metro "PoolExpireTimeout" en la configuraci�n de SQLite.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el par�metro "PoolExpireTimeout".
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
///   Define o valor do par�metro "PoolCleanupTimeout" na configura��o do SQLite.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o par�metro "PoolCleanupTimeout".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del par�metro "PoolCleanupTimeout" en la configuraci�n de SQLite.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el par�metro "PoolCleanupTimeout".
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
///   Define o valor do par�metro "LockingMode" na configura��o do SQLite.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o par�metro "LockingMode".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del par�metro "LockingMode" en la configuraci�n de SQLite.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el par�metro "LockingMode".
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
///   Define o valor do par�metro "OpenMode" na configura��o do SQLite.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o par�metro "OpenMode".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del par�metro "OpenMode" en la configuraci�n de SQLite.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el par�metro "OpenMode".
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
///   Define o valor do par�metro "Encrypt" na configura��o do SQLite.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados SQLite a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o par�metro "Encrypt".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del par�metro "Encrypt" en la configuraci�n de SQLite.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos SQLite a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el par�metro "Encrypt".
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
///   Inicializa o dicion�rio de configuradores de par�metros do SQLite,
///   associando cada par�metro ao seu procedimento de configura��o correspondente.
/// </summary>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Inicializa el diccionario de configuradores de par�metros de SQLite,
  ///   asociando cada par�metro con su procedimiento de configuraci�n correspondiente.
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
                              'Par�metro de configura��o desconhecido.'
                            {$ELSE}
                              {$IFDEF ESPANHOL}
                                'Par�metro de configuraci�n desconocido.'
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
/// Inicializa o dicion�rio de configuradores de par�metros no momento da inicializa��o da aplica��o.
/// </summary>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  /// Inicializa el diccionario de configuradores de par�metros en el momento de la inicializaci�n de la aplicaci�n.
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
/// Libera o dicion�rio de configuradores de par�metros no momento da finaliza��o da aplica��o.
/// </summary>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  /// Libera el diccionario de configuradores de par�metros al finalizar la aplicaci�n.
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


