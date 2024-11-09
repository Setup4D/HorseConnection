{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: PGDataBaseConfigurationParameter                                }
{                                                                       }
{ Descri��o:                                                            }
{   Esta unit fornece procedimentos para configurar par�metros          }
{   espec�ficos de uma inst�ncia de TPGConfiguration, usada para        }
{   configurar o FireDAC (FDConnection) com o driver PostgreSQL.        }
{   Permite definir valores para diferentes par�metros de configura��o, }
{   como servidor, porta, banco de dados, nome de usu�rio, senha,       }
{   conjunto de caracteres e op��es de pool de conex�es.                }
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
  { Descripci�n:                                                          }
  {   Esta unidad proporciona procedimientos para configurar par�metros   }
  {   espec�ficos de una instancia de TPGConfiguration, utilizada para    }
  {   configurar FireDAC (FDConnection) con el controlador PostgreSQL.    }
  {   Permite definir valores para diferentes par�metros de configuraci�n }
  {   como servidor, puerto, base de datos, nombre de usuario, contrase�a,}
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
///   Configura um par�metro espec�fico em uma inst�ncia de TPGConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados PostgreSQL a ser modificada.
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
  ///   Configura un par�metro espec�fico en una instancia de TPGConfiguration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos PostgreSQL a modificar.
  /// </param>
  /// <param name="AParameter">
  ///   El par�metro de configuraci�n a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor a asignar al par�metro.
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
///   Define o valor do par�metro "Server" na configura��o do PostgreSQL.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados PostgreSQL a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o par�metro "Server".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del par�metro "Server" en la configuraci�n de PostgreSQL.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos PostgreSQL a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el par�metro "Server".
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
///   Define o valor do par�metro "Port" na configura��o do PostgreSQL.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados PostgreSQL a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o par�metro "Port".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del par�metro "Port" en la configuraci�n de PostgreSQL.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos PostgreSQL a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el par�metro "Port".
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
///   Define o valor do par�metro "Database" na configura��o do PostgreSQL.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados PostgreSQL a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o par�metro "Database".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del par�metro "Database" en la configuraci�n de PostgreSQL.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos PostgreSQL a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el par�metro "Database".
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
///   Define o valor do par�metro "UserName" na configura��o do PostgreSQL.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados PostgreSQL a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o par�metro "UserName".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del par�metro "UserName" en la configuraci�n de PostgreSQL.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos PostgreSQL a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el par�metro "UserName".
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
///   Define o valor do par�metro "Password" na configura��o do PostgreSQL.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados PostgreSQL a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o par�metro "Password".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del par�metro "Password" en la configuraci�n de PostgreSQL.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos PostgreSQL a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el par�metro "Password".
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
///   Define o valor do par�metro "CharacterSet" na configura��o do PostgreSQL.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados PostgreSQL a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o par�metro "CharacterSet".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del par�metro "CharacterSet" en la configuraci�n de PostgreSQL.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos PostgreSQL a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el par�metro "CharacterSet".
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
///   Define o valor do par�metro "Pooled" na configura��o do PostgreSQL.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados PostgreSQL a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o par�metro "Pooled".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del par�metro "Pooled" en la configuraci�n de PostgreSQL.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos PostgreSQL a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el par�metro "Pooled".
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
///   Define o valor do par�metro "PoolMaxItems" na configura��o do PostgreSQL.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados PostgreSQL a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o par�metro "PoolMaxItems".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del par�metro "PoolMaxItems" en la configuraci�n de PostgreSQL.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos PostgreSQL a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el par�metro "PoolMaxItems".
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
///   Define o valor do par�metro "PoolExpireTimeout" na configura��o do PostgreSQL.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados PostgreSQL a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o par�metro "PoolExpireTimeout".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del par�metro "PoolExpireTimeout" en la configuraci�n de PostgreSQL.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos PostgreSQL a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el par�metro "PoolExpireTimeout".
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
///   Define o valor do par�metro "PoolCleanupTimeout" na configura��o do PostgreSQL.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados PostgreSQL a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor para definir o par�metro "PoolCleanupTimeout".
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el valor del par�metro "PoolCleanupTimeout" en la configuraci�n de PostgreSQL.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos PostgreSQL a modificar.
  /// </param>
  /// <param name="AValue">
  ///   El valor para establecer el par�metro "PoolCleanupTimeout".
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
///   Inicializa o dicion�rio de configuradores com os procedimentos para cada par�metro.
/// </summary>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Inicializa el diccionario de configuradores con los procedimientos para cada par�metro.
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

