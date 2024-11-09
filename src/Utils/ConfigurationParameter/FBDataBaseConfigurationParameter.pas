{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: FBDataBaseConfigurationParameter                                }
{                                                                       }
{ Descri��o:                                                            }
{   Esta unit fornece procedimentos para configurar par�metros          }
{   espec�ficos de uma inst�ncia de TFBConfiguration, usada para        }
{   configurar o FireDAC (FDConnection) com o driver Firebird.          }
{   Permite definir valores para diferentes par�metros de configura��o, }
{   como protocolo, modo de abertura, conjunto de caracteres e outras   }
{   op��es de conex�o.                                                  }
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
  { Descripci�n:                                                          }
  {   Esta unidad proporciona procedimientos para configurar par�metros   }
  {   espec�ficos de una instancia de TFBConfiguration, utilizada para    }
  {   configurar FireDAC (FDConnection) con el controlador Firebird.      }
  {   Permite definir valores para diferentes par�metros de configuraci�n }
  {   como protocolo, modo de apertura, conjunto de caracteres y otras    }
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
///   Configura um par�metro de banco de dados Firebird com base em um valor gen�rico.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AParameter">
///   O par�metro espec�fico da configura��o Firebird.
/// </param>
/// <param name="AValue">
///   O valor gen�rico a ser aplicado ao par�metro.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura un par�metro de base de datos Firebird basado en un valor gen�rico.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de base de datos Firebird a modificar.
  /// </param>
  /// <param name="AParameter">
  ///   El par�metro espec�fico de la configuraci�n Firebird.
  /// </param>
  /// <param name="AValue">
  ///   El valor gen�rico a aplicar al par�metro.
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
///   A configura��o de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AParameter">
///   O par�metro do protocolo.
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
  ///   La configuraci�n de base de datos Firebird a modificar.
  /// </param>
  /// <param name="AParameter">
  ///   El par�metro del protocolo.
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
///   A configura��o de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AParameter">
///   O par�metro do modo de abertura.
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
  ///   La configuraci�n de base de datos Firebird a modificar.
  /// </param>
  /// <param name="AParameter">
  ///   El par�metro del modo de apertura.
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
///   A configura��o de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AParameter">
///   O par�metro do conjunto de caracteres.
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
  ///   La configuraci�n de base de datos Firebird a modificar.
  /// </param>
  /// <param name="AParameter">
  ///   El par�metro del conjunto de caracteres.
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
///   Configura o par�metro "Database" da inst�ncia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para o par�metro Database.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el par�metro "Database" de la instancia TFBConfiguration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de base de datos Firebird a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para el par�metro Database.
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
///   Configura o par�metro "UserName" da inst�ncia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para o par�metro UserName.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el par�metro "UserName" de la instancia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuraci�n de base de datos Firebird a modificar.
/// </param>
/// <param name="AValue">
///   El valor para el par�metro UserName.
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
///   Configura o par�metro "Password" da inst�ncia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para o par�metro Password.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el par�metro "Password" de la instancia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuraci�n de base de datos Firebird a modificar.
/// </param>
/// <param name="AValue">
///   El valor para el par�metro Password.
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
///   Configura o par�metro "Protocol" da inst�ncia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para o par�metro Protocol (TFBProtocolType).
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el par�metro "Protocol" de la instancia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuraci�n de base de datos Firebird a modificar.
/// </param>
/// <param name="AValue">
///   El valor para el par�metro Protocol (TFBProtocolType).
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
///   Configura o par�metro "Server" da inst�ncia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para o par�metro Server.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el par�metro "Server" de la instancia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuraci�n de base de datos Firebird a modificar.
/// </param>
/// <param name="AValue">
///   El valor para el par�metro Server.
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
///   Configura o par�metro "Port" da inst�ncia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para o par�metro Port.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el par�metro "Port" de la instancia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuraci�n de base de datos Firebird a modificar.
/// </param>
/// <param name="AValue">
///   El valor para el par�metro Port.
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
///   Configura o par�metro "CharacterSet" da inst�ncia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para o par�metro CharacterSet (TFBCharacterSetType).
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el par�metro "CharacterSet" de la instancia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuraci�n de base de datos Firebird a modificar.
/// </param>
/// <param name="AValue">
///   El valor para el par�metro CharacterSet (TFBCharacterSetType).
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
///   Configura o par�metro "OpenMode" da inst�ncia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para o par�metro OpenMode (TFBOpenModeType).
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el par�metro "OpenMode" de la instancia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuraci�n de base de datos Firebird a modificar.
/// </param>
/// <param name="AValue">
///   El valor para el par�metro OpenMode (TFBOpenModeType).
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
///   Configura o par�metro "Pooled" da inst�ncia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor booleano para o par�metro Pooled.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el par�metro "Pooled" de la instancia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuraci�n de base de datos Firebird a modificar.
/// </param>
/// <param name="AValue">
///   El valor booleano para el par�metro Pooled.
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
///   Configura o par�metro "PoolMaxItems" da inst�ncia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor inteiro para o par�metro PoolMaxItems.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el par�metro "PoolMaxItems" de la instancia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuraci�n de base de datos Firebird a modificar.
/// </param>
/// <param name="AValue">
///   El valor entero para el par�metro PoolMaxItems.
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
///   Configura o par�metro "PoolExpireTimeout" da inst�ncia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor inteiro para o par�metro PoolExpireTimeout.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el par�metro "PoolExpireTimeout" de la instancia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuraci�n de base de datos Firebird a modificar.
/// </param>
/// <param name="AValue">
///   El valor entero para el par�metro PoolExpireTimeout.
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
///   Configura o par�metro "PoolCleanupTimeout" da inst�ncia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o de banco de dados Firebird a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor inteiro para o par�metro PoolCleanupTimeout.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el par�metro "PoolCleanupTimeout" de la instancia TFBConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuraci�n de base de datos Firebird a modificar.
/// </param>
/// <param name="AValue">
///   El valor entero para el par�metro PoolCleanupTimeout.
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
///   Inicializa os configuradores para cada par�metro de TFBConfiguration, mapeando
///   par�metros de TFBConfigurationParameter para procedimentos espec�ficos.
/// </summary>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Inicializa los configuradores para cada par�metro de TFBConfiguration, mapeando
  ///   par�metros de TFBConfigurationParameter a procedimientos espec�ficos.
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
                              'Par�metro de configura��o desconhecido.'
                            {$ELSE}
                              {$IFDEF ESPANHOL}
                                'Par�metro de configuraci�n desconocido.'
                              {$ELSE}
                                'Unknown configuration parameter.'
                              {$ENDIF}
                            {$ENDIF});
end;


{$IFDEF PORTUGUES}
/// <summary>
///   Inicializa o dicion�rio de configuradores de par�metros no momento da inicializa��o da aplica��o.
/// </summary>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Inicializa el diccionario de configuradores de par�metros en el momento de la inicializaci�n de la aplicaci�n.
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
///   Libera o dicion�rio de configuradores de par�metros no momento da finaliza��o da aplica��o.
/// </summary>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Libera el diccionario de configuradores de par�metros al finalizar la aplicaci�n.
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

