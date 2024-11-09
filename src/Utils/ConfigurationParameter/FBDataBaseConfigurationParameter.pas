{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: FBDataBaseConfigurationParameter                                }
{                                                                       }
{ Descrição:                                                            }
{   Esta unit fornece procedimentos para configurar parâmetros          }
{   específicos de uma instância de TFBConfiguration, usada para        }
{   configurar o FireDAC (FDConnection) com o driver Firebird.          }
{   Permite definir valores para diferentes parâmetros de configuração, }
{   como protocolo, modo de abertura, conjunto de caracteres e outras   }
{   opções de conexão.                                                  }
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
  { Unidad: FBDataBaseConfigurationParameter                              }
  {                                                                       }
  { Descripción:                                                          }
  {   Esta unidad proporciona procedimientos para configurar parámetros   }
  {   específicos de una instancia de TFBConfiguration, utilizada para    }
  {   configurar FireDAC (FDConnection) con el controlador Firebird.      }
  {   Permite definir valores para diferentes parámetros de configuración }
  {   como protocolo, modo de apertura, conjunto de caracteres y otras    }
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
  { Unit: FBDataBaseConfigurationParameter                                }
  {                                                                       }
  { Description:                                                          }
  {   This unit provides procedures for configuring specific parameters   }
  {   of a TFBConfiguration instance, used to set up FireDAC              }
  {   (FDConnection) with the Firebird driver. It allows defining values  }
  {   for various configuration parameters, such as protocol, open mode,  }
  {   character set, and other connection options.                        }
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

unit FBDataBaseConfigurationParameter;

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
///   Configura um parâmetro de banco de dados Firebird com base em um valor genérico.
/// </summary>
/// <param name="AConfiguration">
///   A configuração de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AParameter">
///   O parâmetro específico da configuração Firebird.
/// </param>
/// <param name="AValue">
///   O valor genérico a ser aplicado ao parâmetro.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura un parámetro de base de datos Firebird basado en un valor genérico.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de base de datos Firebird a modificar.
  /// </param>
  /// <param name="AParameter">
  ///   El parámetro específico de la configuración Firebird.
  /// </param>
  /// <param name="AValue">
  ///   El valor genérico a aplicar al parámetro.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Configures a Firebird database parameter based on a generic value.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The Firebird database configuration to be modified.
  /// </param>
  /// <param name="AParameter">
  ///   The specific parameter of the Firebird configuration.
  /// </param>
  /// <param name="AValue">
  ///   The generic value to be applied to the parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure DatabaseConfig(var AConfiguration: TFBConfiguration;
  AParameter: TFBConfigurationParameter; const AValue: TValue); overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura o protocolo para o banco de dados Firebird.
/// </summary>
/// <param name="AConfiguration">
///   A configuração de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AParameter">
///   O parâmetro do protocolo.
/// </param>
/// <param name="AValue">
///   O valor do protocolo a ser aplicado.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el protocolo para la base de datos Firebird.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de base de datos Firebird a modificar.
  /// </param>
  /// <param name="AParameter">
  ///   El parámetro del protocolo.
  /// </param>
  /// <param name="AValue">
  ///   El valor del protocolo a aplicar.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Configures the protocol for the Firebird database.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The Firebird database configuration to be modified.
  /// </param>
  /// <param name="AParameter">
  ///   The protocol parameter.
  /// </param>
  /// <param name="AValue">
  ///   The protocol value to be applied.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure DatabaseConfig(var AConfiguration: TFBConfiguration;
  AParameter: TFBConfigurationParameter; const AValue: TFBProtocolType); overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura o modo de abertura para o banco de dados Firebird.
/// </summary>
/// <param name="AConfiguration">
///   A configuração de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AParameter">
///   O parâmetro do modo de abertura.
/// </param>
/// <param name="AValue">
///   O valor do modo de abertura a ser aplicado.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el modo de apertura para la base de datos Firebird.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de base de datos Firebird a modificar.
  /// </param>
  /// <param name="AParameter">
  ///   El parámetro del modo de apertura.
  /// </param>
  /// <param name="AValue">
  ///   El valor del modo de apertura a aplicar.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Configures the open mode for the Firebird database.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The Firebird database configuration to be modified.
  /// </param>
  /// <param name="AParameter">
  ///   The open mode parameter.
  /// </param>
  /// <param name="AValue">
  ///   The open mode value to be applied.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure DatabaseConfig(var AConfiguration: TFBConfiguration;
  AParameter: TFBConfigurationParameter; const AValue: TFBOpenModeType); overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura o conjunto de caracteres para o banco de dados Firebird.
/// </summary>
/// <param name="AConfiguration">
///   A configuração de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AParameter">
///   O parâmetro do conjunto de caracteres.
/// </param>
/// <param name="AValue">
///   O valor do conjunto de caracteres a ser aplicado.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el conjunto de caracteres para la base de datos Firebird.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de base de datos Firebird a modificar.
  /// </param>
  /// <param name="AParameter">
  ///   El parámetro del conjunto de caracteres.
  /// </param>
  /// <param name="AValue">
  ///   El valor del conjunto de caracteres a aplicar.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Configures the character set for the Firebird database.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The Firebird database configuration to be modified.
  /// </param>
  /// <param name="AParameter">
  ///   The character set parameter.
  /// </param>
  /// <param name="AValue">
  ///   The character set value to be applied.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure DatabaseConfig(var AConfiguration: TFBConfiguration;
  AParameter: TFBConfigurationParameter; const AValue: TFBCharacterSetType); overload;

implementation

var
  FDictionary: TDictionary<TFBConfigurationParameter, TDatabaseConfigurator<TFBConfiguration>>;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura o parâmetro "Database" da instância TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para o parâmetro Database.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el parámetro "Database" de la instancia TFBConfiguration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de base de datos Firebird a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para el parámetro Database.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Configures the "Database" parameter of the TFBConfiguration instance.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The Firebird database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  ///   The value for the Database parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetDatabase(var AConfiguration: TFBConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Database', 'string');
  AConfiguration.Database := GetAbsolutePath(AValue.AsString);
end;
{$IFDEF PORTUGUES}
/// <summary>
///   Configura o parâmetro "UserName" da instância TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para o parâmetro UserName.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el parámetro "UserName" de la instancia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de base de datos Firebird a modificar.
/// </param>
/// <param name="AValue">
///   El valor para el parámetro UserName.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Configures the "UserName" parameter of the TFBConfiguration instance.
/// </summary>
/// <param name="AConfiguration">
///   The Firebird database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The value for the UserName parameter.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetUserName(var AConfiguration: TFBConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('UserName', 'string');
  AConfiguration.UserName := AValue.AsString;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura o parâmetro "Password" da instância TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para o parâmetro Password.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el parámetro "Password" de la instancia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de base de datos Firebird a modificar.
/// </param>
/// <param name="AValue">
///   El valor para el parámetro Password.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Configures the "Password" parameter of the TFBConfiguration instance.
/// </summary>
/// <param name="AConfiguration">
///   The Firebird database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The value for the Password parameter.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetPassword(var AConfiguration: TFBConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Password', 'string');
  AConfiguration.Password := AValue.AsString;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura o parâmetro "Protocol" da instância TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para o parâmetro Protocol (TFBProtocolType).
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el parámetro "Protocol" de la instancia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de base de datos Firebird a modificar.
/// </param>
/// <param name="AValue">
///   El valor para el parámetro Protocol (TFBProtocolType).
/// </param>
  {$ELSE}
  /// <summary>
  ///   Configures the "Protocol" parameter of the TFBConfiguration instance.
/// </summary>
/// <param name="AConfiguration">
///   The Firebird database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The value for the Protocol parameter (TFBProtocolType).
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetProtocol(var AConfiguration: TFBConfiguration; const AValue: TValue);
var
  LProtocol: TFBProtocolType;
begin
  if not AValue.TryAsType<TFBProtocolType>(LProtocol) then
    RaiseInvalidTypeException('Protocol', 'TFBProtocolType');

  AConfiguration.Protocol := LProtocol;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura o parâmetro "Server" da instância TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para o parâmetro Server.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el parámetro "Server" de la instancia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de base de datos Firebird a modificar.
/// </param>
/// <param name="AValue">
///   El valor para el parámetro Server.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Configures the "Server" parameter of the TFBConfiguration instance.
/// </summary>
/// <param name="AConfiguration">
///   The Firebird database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The value for the Server parameter.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetServer(var AConfiguration: TFBConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Server', 'string');
  AConfiguration.Server := AValue.AsString;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura o parâmetro "Port" da instância TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para o parâmetro Port.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el parámetro "Port" de la instancia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de base de datos Firebird a modificar.
/// </param>
/// <param name="AValue">
///   El valor para el parámetro Port.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Configures the "Port" parameter of the TFBConfiguration instance.
/// </summary>
/// <param name="AConfiguration">
///   The Firebird database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The value for the Port parameter.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetPort(var AConfiguration: TFBConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('Port', 'integer');
  AConfiguration.Port := AValue.AsInteger;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura o parâmetro "CharacterSet" da instância TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para o parâmetro CharacterSet (TFBCharacterSetType).
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el parámetro "CharacterSet" de la instancia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de base de datos Firebird a modificar.
/// </param>
/// <param name="AValue">
///   El valor para el parámetro CharacterSet (TFBCharacterSetType).
/// </param>
  {$ELSE}
  /// <summary>
  ///   Configures the "CharacterSet" parameter of the TFBConfiguration instance.
/// </summary>
/// <param name="AConfiguration">
///   The Firebird database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The value for the CharacterSet parameter (TFBCharacterSetType).
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetCharacterSet(var AConfiguration: TFBConfiguration; const AValue: TValue);
var
  LCharacterSet: TFBCharacterSetType;
begin
  if not AValue.TryAsType<TFBCharacterSetType>(LCharacterSet) then
    RaiseInvalidTypeException('CharacterSet', 'TFBCharacterSetType');

  AConfiguration.CharacterSet := LCharacterSet;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura o parâmetro "OpenMode" da instância TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para o parâmetro OpenMode (TFBOpenModeType).
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el parámetro "OpenMode" de la instancia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de base de datos Firebird a modificar.
/// </param>
/// <param name="AValue">
///   El valor para el parámetro OpenMode (TFBOpenModeType).
/// </param>
  {$ELSE}
  /// <summary>
  ///   Configures the "OpenMode" parameter of the TFBConfiguration instance.
/// </summary>
/// <param name="AConfiguration">
///   The Firebird database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The value for the OpenMode parameter (TFBOpenModeType).
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetOpenMode(var AConfiguration: TFBConfiguration; const AValue: TValue);
var
  LOpenMode: TFBOpenModeType;
begin
  if not AValue.TryAsType<TFBOpenModeType>(LOpenMode) then
    RaiseInvalidTypeException('OpenMode', 'TFBOpenModeType');

  AConfiguration.OpenMode := LOpenMode;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura o parâmetro "Pooled" da instância TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor booleano para o parâmetro Pooled.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el parámetro "Pooled" de la instancia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de base de datos Firebird a modificar.
/// </param>
/// <param name="AValue">
///   El valor booleano para el parámetro Pooled.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Configures the "Pooled" parameter of the TFBConfiguration instance.
/// </summary>
/// <param name="AConfiguration">
///   The Firebird database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The boolean value for the Pooled parameter.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetPooled(var AConfiguration: TFBConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Boolean> then
    RaiseInvalidTypeException('Pooled', 'boolean');
  AConfiguration.Pooled := AValue.AsBoolean;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura o parâmetro "PoolMaxItems" da instância TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor inteiro para o parâmetro PoolMaxItems.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el parámetro "PoolMaxItems" de la instancia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de base de datos Firebird a modificar.
/// </param>
/// <param name="AValue">
///   El valor entero para el parámetro PoolMaxItems.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Configures the "PoolMaxItems" parameter of the TFBConfiguration instance.
/// </summary>
/// <param name="AConfiguration">
///   The Firebird database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The integer value for the PoolMaxItems parameter.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetPoolMaxItems(var AConfiguration: TFBConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolMaxItems', 'integer');
  AConfiguration.PoolMaxItems := AValue.AsInteger;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura o parâmetro "PoolExpireTimeout" da instância TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor inteiro para o parâmetro PoolExpireTimeout.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el parámetro "PoolExpireTimeout" de la instancia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de base de datos Firebird a modificar.
/// </param>
/// <param name="AValue">
///   El valor entero para el parámetro PoolExpireTimeout.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Configures the "PoolExpireTimeout" parameter of the TFBConfiguration instance.
/// </summary>
/// <param name="AConfiguration">
///   The Firebird database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The integer value for the PoolExpireTimeout parameter.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetPoolExpireTimeout(var AConfiguration: TFBConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolExpireTimeout', 'integer');
  AConfiguration.PoolExpireTimeout := AValue.AsInteger;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura o parâmetro "PoolCleanupTimeout" da instância TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor inteiro para o parâmetro PoolCleanupTimeout.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el parámetro "PoolCleanupTimeout" de la instancia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de base de datos Firebird a modificar.
/// </param>
/// <param name="AValue">
///   El valor entero para el parámetro PoolCleanupTimeout.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Configures the "PoolCleanupTimeout" parameter of the TFBConfiguration instance.
/// </summary>
/// <param name="AConfiguration">
///   The Firebird database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The integer value for the PoolCleanupTimeout parameter.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetPoolCleanupTimeout(var AConfiguration: TFBConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolCleanupTimeout', 'integer');
  AConfiguration.PoolCleanupTimeout := AValue.AsInteger;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Inicializa os configuradores para cada parâmetro de TFBConfiguration, mapeando
///   parâmetros de TFBConfigurationParameter para procedimentos específicos.
/// </summary>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Inicializa los configuradores para cada parámetro de TFBConfiguration, mapeando
  ///   parámetros de TFBConfigurationParameter a procedimientos específicos.
/// </summary>
  {$ELSE}
  /// <summary>
  ///   Initializes the configurators for each parameter of TFBConfiguration, mapping
  ///   TFBConfigurationParameter parameters to specific procedures.
/// </summary>
  {$ENDIF}
{$ENDIF}
procedure InitializeConfigurators;
begin
  FDictionary := TDictionary<TFBConfigurationParameter, TDatabaseConfigurator<TFBConfiguration>>.Create;

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
  FDictionary.Add(TFBConfigurationParameter.PoolExpireTimeout, SetPoolExpireTimeout);
  FDictionary.Add(TFBConfigurationParameter.PoolCleanupTimeout, SetPoolCleanupTimeout);
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
  LConfigureProcedure: TDatabaseConfigurator<TFBConfiguration>;
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
///   Inicializa o dicionário de configuradores de parâmetros no momento da inicialização da aplicação.
/// </summary>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Inicializa el diccionario de configuradores de parámetros en el momento de la inicialización de la aplicación.
/// </summary>
  {$ELSE}
  /// <summary>
  ///   Initializes the parameter configurator dictionary at application initialization.
/// </summary>
  {$ENDIF}
{$ENDIF}
initialization

  InitializeConfigurators;


{$IFDEF PORTUGUES}
/// <summary>
///   Libera o dicionário de configuradores de parâmetros no momento da finalização da aplicação.
/// </summary>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Libera el diccionario de configuradores de parámetros al finalizar la aplicación.
/// </summary>
  {$ELSE}
  /// <summary>
  ///   Frees the parameter configurator dictionary at application finalization.
/// </summary>
  {$ENDIF}
{$ENDIF}
finalization

  FDictionary.Free;

end.

