{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: PGDataBaseConfigurationParameter                                }
{                                                                       }
{ Descrição:                                                            }
{   Esta unit fornece procedimentos para configurar parâmetros          }
{   específicos de uma instância de TPGConfiguration, usada para        }
{   configurar o FireDAC (FDConnection) com o driver PostgreSQL.        }
{   Permite definir valores para diferentes parâmetros de configuração, }
{   como servidor, porta, banco de dados, nome de usuário, senha,       }
{   conjunto de caracteres e opções de pool de conexões.                }
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
  { Unidad: PGDataBaseConfigurationParameter                              }
  {                                                                       }
  { Descripción:                                                          }
  {   Esta unidad proporciona procedimientos para configurar parámetros   }
  {   específicos de una instancia de TPGConfiguration, utilizada para    }
  {   configurar FireDAC (FDConnection) con el controlador PostgreSQL.    }
  {   Permite definir valores para diferentes parámetros de configuración }
  {   como servidor, puerto, base de datos, nombre de usuario, contraseña,}
  {   conjunto de caracteres y opciones de pool de conexiones.            }
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
  { Unit: PGDataBaseConfigurationParameter                                }
  {                                                                       }
  { Description:                                                          }
  {   This unit provides procedures for configuring specific parameters   }
  {   of a TPGConfiguration instance, used to set up FireDAC              }
  {   (FDConnection) with the PostgreSQL driver. It allows defining       }
  {   values for various configuration parameters, such as server, port,  }
  {   database, username, password, character set, and connection pool    }
  {   options.                                                            }
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

unit PGDataBaseConfigurationParameter;

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
///   Configura um parâmetro específico em uma instância de TPGConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados PostgreSQL a ser modificada.
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
  ///   Configura un parámetro específico en una instancia de TPGConfiguration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos PostgreSQL a modificar.
  /// </param>
  /// <param name="AParameter">
  ///   El parámetro de configuración a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor a asignar al parámetro.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Configures a specific parameter in a TPGConfiguration instance.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The PostgreSQL database configuration to be modified.
  /// </param>
  /// <param name="AParameter">
  ///   The configuration parameter to modify.
  /// </param>
  /// <param name="AValue">
  ///   The value to assign to the parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure DatabaseConfig(var AConfiguration: TPGConfiguration;
  AParameter: TPGConfigurationParameter; const AValue: TValue); overload;

implementation

var
  FDictionary: TDictionary<TPGConfigurationParameter, TDatabaseConfigurator<TPGConfiguration>>;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o valor do parâmetro "Server" na configuração do PostgreSQL.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados PostgreSQL a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o parâmetro "Server".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del parámetro "Server" en la configuración de PostgreSQL.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos PostgreSQL a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el parámetro "Server".
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the "Server" parameter in the PostgreSQL configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The PostgreSQL database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  ///   The value to set for the "Server" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetServer(var AConfiguration: TPGConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Server', 'string');
  AConfiguration.Server := AValue.AsString;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o valor do parâmetro "Port" na configuração do PostgreSQL.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados PostgreSQL a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o parâmetro "Port".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del parámetro "Port" en la configuración de PostgreSQL.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos PostgreSQL a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el parámetro "Port".
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the "Port" parameter in the PostgreSQL configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The PostgreSQL database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  ///   The value to set for the "Port" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetPort(var AConfiguration: TPGConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('Port', 'Integer');
  AConfiguration.Port := AValue.AsInteger;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o valor do parâmetro "Database" na configuração do PostgreSQL.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados PostgreSQL a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o parâmetro "Database".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del parámetro "Database" en la configuración de PostgreSQL.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos PostgreSQL a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el parámetro "Database".
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the "Database" parameter in the PostgreSQL configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The PostgreSQL database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  ///   The value to set for the "Database" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetDatabase(var AConfiguration: TPGConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Database', 'string');
  AConfiguration.Database := AValue.AsString;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o valor do parâmetro "UserName" na configuração do PostgreSQL.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados PostgreSQL a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o parâmetro "UserName".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del parámetro "UserName" en la configuración de PostgreSQL.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos PostgreSQL a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el parámetro "UserName".
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the "UserName" parameter in the PostgreSQL configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The PostgreSQL database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  ///   The value to set for the "UserName" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetUserName(var AConfiguration: TPGConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('UserName', 'string');
  AConfiguration.UserName := AValue.AsString;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o valor do parâmetro "Password" na configuração do PostgreSQL.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados PostgreSQL a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o parâmetro "Password".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del parámetro "Password" en la configuración de PostgreSQL.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos PostgreSQL a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el parámetro "Password".
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the "Password" parameter in the PostgreSQL configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The PostgreSQL database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  ///   The value to set for the "Password" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetPassword(var AConfiguration: TPGConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Password', 'string');
  AConfiguration.Password := AValue.AsString;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o valor do parâmetro "CharacterSet" na configuração do PostgreSQL.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados PostgreSQL a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o parâmetro "CharacterSet".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del parámetro "CharacterSet" en la configuración de PostgreSQL.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos PostgreSQL a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el parámetro "CharacterSet".
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the "CharacterSet" parameter in the PostgreSQL configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The PostgreSQL database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  ///   The value to set for the "CharacterSet" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetCharacterSet(var AConfiguration: TPGConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('CharacterSet', 'string');
  AConfiguration.CharacterSet := AValue.AsString;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o valor do parâmetro "Pooled" na configuração do PostgreSQL.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados PostgreSQL a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o parâmetro "Pooled".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del parámetro "Pooled" en la configuración de PostgreSQL.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos PostgreSQL a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el parámetro "Pooled".
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the "Pooled" parameter in the PostgreSQL configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The PostgreSQL database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  ///   The value to set for the "Pooled" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetPooled(var AConfiguration: TPGConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Boolean> then
    RaiseInvalidTypeException('Pooled', 'boolean');
  AConfiguration.Pooled := AValue.AsBoolean;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o valor do parâmetro "PoolMaxItems" na configuração do PostgreSQL.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados PostgreSQL a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o parâmetro "PoolMaxItems".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del parámetro "PoolMaxItems" en la configuración de PostgreSQL.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos PostgreSQL a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el parámetro "PoolMaxItems".
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the "PoolMaxItems" parameter in the PostgreSQL configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The PostgreSQL database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  ///   The value to set for the "PoolMaxItems" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetPoolMaxItems(var AConfiguration: TPGConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolMaxItems', 'integer');
  AConfiguration.PoolMaxItems := AValue.AsInteger;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o valor do parâmetro "PoolExpireTimeout" na configuração do PostgreSQL.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados PostgreSQL a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o parâmetro "PoolExpireTimeout".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del parámetro "PoolExpireTimeout" en la configuración de PostgreSQL.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos PostgreSQL a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el parámetro "PoolExpireTimeout".
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the "PoolExpireTimeout" parameter in the PostgreSQL configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The PostgreSQL database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  ///   The value to set for the "PoolExpireTimeout" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetPoolExpireTimeout(var AConfiguration: TPGConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolExpireTimeout', 'integer');
  AConfiguration.PoolExpireTimeout := AValue.AsInteger;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o valor do parâmetro "PoolCleanupTimeout" na configuração do PostgreSQL.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados PostgreSQL a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o parâmetro "PoolCleanupTimeout".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del parámetro "PoolCleanupTimeout" en la configuración de PostgreSQL.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos PostgreSQL a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el parámetro "PoolCleanupTimeout".
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the "PoolCleanupTimeout" parameter in the PostgreSQL configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The PostgreSQL database configuration to be modified.
  /// </param>
  /// <param name="AValue">
  ///   The value to set for the "PoolCleanupTimeout" parameter.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetPoolCleanupTimeout(var AConfiguration: TPGConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolCleanupTimeout', 'integer');
  AConfiguration.PoolCleanupTimeout := AValue.AsInteger;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Inicializa o dicionário de configuradores com os procedimentos para cada parâmetro.
/// </summary>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Inicializa el diccionario de configuradores con los procedimientos para cada parámetro.
  /// </summary>
  {$ELSE}
  /// <summary>
  ///   Initializes the configurator dictionary with procedures for each parameter.
  /// </summary>
  {$ENDIF}
{$ENDIF}
procedure InitializeConfigurators;
begin
  FDictionary := TDictionary<TPGConfigurationParameter, TDatabaseConfigurator<TPGConfiguration>>.Create;

  // Adicionando setters para strings
  FDictionary.Add(TPGConfigurationParameter.Server, SetServer);
  FDictionary.Add(TPGConfigurationParameter.Database, SetDatabase);
  FDictionary.Add(TPGConfigurationParameter.UserName, SetUserName);
  FDictionary.Add(TPGConfigurationParameter.Password, SetPassword);
  FDictionary.Add(TPGConfigurationParameter.CharacterSet, SetCharacterSet);

  // Adicionando setters para inteiros e booleanos
  FDictionary.Add(TPGConfigurationParameter.Port, SetPort);
  FDictionary.Add(TPGConfigurationParameter.Pooled, SetPooled);
  FDictionary.Add(TPGConfigurationParameter.PoolMaxItems, SetPoolMaxItems);
  FDictionary.Add(TPGConfigurationParameter.PoolExpireTimeout, SetPoolExpireTimeout);
  FDictionary.Add(TPGConfigurationParameter.PoolCleanupTimeout, SetPoolCleanupTimeout);
end;

procedure DatabaseConfig(var AConfiguration: TPGConfiguration;
  AParameter: TPGConfigurationParameter; const AValue: TValue);
var
  LConfigureProcedure: TDatabaseConfigurator<TPGConfiguration>;
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

