{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: ADSDataBaseConfigurationParameter                               }
{                                                                       }
{ Descrição:                                                            }
{   Esta unit fornece procedimentos para configurar parâmetros          }
{   específicos de uma instância de TADSConfiguration, usada para       }
{   configurar o FireDAC (FDConnection) com o driver ADS.               }
{   Permite definir valores para diferentes parâmetros de configuração, }
{   como tipo de servidor, conjunto de caracteres, protocolo, e outras  }
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
  { Unidad: ADSDataBaseConfigurationParameter                            }
  {                                                                       }
  { Descripción:                                                         }
  {   Esta unidad proporciona procedimientos para configurar parámetros   }
  {   específicos de una instancia de TADSConfiguration, utilizada para   }
  {   configurar FireDAC (FDConnection) con el controlador ADS.           }
  {   Permite definir valores para diferentes parámetros de configuración }
  {   como tipo de servidor, conjunto de caracteres, protocolo, y otras   }
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
  { Unit: ADSDataBaseConfigurationParameter                               }
  {                                                                       }
  { Description:                                                          }
  {   This unit provides procedures for configuring specific parameters   }
  {   of a TADSConfiguration instance, used to set up FireDAC             }
  {   (FDConnection) with the ADS driver. It allows defining values for   }
  {   various configuration parameters, such as server type, character    }
  {   set, protocol, and other connection options.                        }
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
unit ADSDataBaseConfigurationParameter;

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
///   Configura o parâmetro de configuração TADSConfiguration com base em um valor TValue.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados ADS a ser modificada.
/// </param>
/// <param name="AParameter">
///   O parâmetro específico de configuração (TADSConfigurationParameter).
/// </param>
/// <param name="AValue">
///   O valor do tipo TValue a ser aplicado.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el parámetro de configuración TADSConfiguration basado en un valor TValue.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de la base de datos ADS a modificar.
/// </param>
/// <param name="AParameter">
///   El parámetro específico de configuración (TADSConfigurationParameter).
/// </param>
/// <param name="AValue">
///   El valor del tipo TValue a aplicar.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Configures the TADSConfiguration parameter based on a TValue.
/// </summary>
/// <param name="AConfiguration">
///   The ADS database configuration to be modified.
/// </param>
/// <param name="AParameter">
///   The specific configuration parameter (TADSConfigurationParameter).
/// </param>
/// <param name="AValue">
///   The TValue to be applied.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure DatabaseConfig(var AConfiguration: TADSConfiguration;
  AParameter: TADSConfigurationParameter; const AValue: TValue); overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura o parâmetro de configuração TADSConfiguration com base em um valor TADSServerType.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados ADS a ser modificada.
/// </param>
/// <param name="AParameter">
///   O parâmetro específico de configuração (TADSConfigurationParameter).
/// </param>
/// <param name="AValue">
///   O valor do tipo TADSServerType a ser aplicado.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el parámetro de configuración TADSConfiguration basado en un valor TADSServerType.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de la base de datos ADS a modificar.
/// </param>
/// <param name="AParameter">
///   El parámetro específico de configuración (TADSConfigurationParameter).
/// </param>
/// <param name="AValue">
///   El valor del tipo TADSServerType a aplicar.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Configures the TADSConfiguration parameter based on a TADSServerType value.
/// </summary>
/// <param name="AConfiguration">
///   The ADS database configuration to be modified.
/// </param>
/// <param name="AParameter">
///   The specific configuration parameter (TADSConfigurationParameter).
/// </param>
/// <param name="AValue">
///   The TADSServerType value to be applied.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure DatabaseConfig(var AConfiguration: TADSConfiguration;
  AParameter: TADSConfigurationParameter; const AValue: TADSServerType); overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura o parâmetro de configuração TADSConfiguration com base em um valor TADSCharacterSet.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados ADS a ser modificada.
/// </param>
/// <param name="AParameter">
///   O parâmetro específico de configuração (TADSConfigurationParameter).
/// </param>
/// <param name="AValue">
///   O valor do tipo TADSCharacterSet a ser aplicado.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el parámetro de configuración TADSConfiguration basado en un valor TADSCharacterSet.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de la base de datos ADS a modificar.
/// </param>
/// <param name="AParameter">
///   El parámetro específico de configuración (TADSConfigurationParameter).
/// </param>
/// <param name="AValue">
///   El valor del tipo TADSCharacterSet a aplicar.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Configures the TADSConfiguration parameter based on a TADSCharacterSet value.
/// </summary>
/// <param name="AConfiguration">
///   The ADS database configuration to be modified.
/// </param>
/// <param name="AParameter">
///   The specific configuration parameter (TADSConfigurationParameter).
/// </param>
/// <param name="AValue">
///   The TADSCharacterSet value to be applied.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure DatabaseConfig(var AConfiguration: TADSConfiguration;
  AParameter: TADSConfigurationParameter; const AValue: TADSCharacterSet); overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura o parâmetro de configuração TADSConfiguration com base em um valor TADSProtocol.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados ADS a ser modificada.
/// </param>
/// <param name="AParameter">
///   O parâmetro específico de configuração (TADSConfigurationParameter).
/// </param>
/// <param name="AValue">
///   O valor do tipo TADSProtocol a ser aplicado.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el parámetro de configuración TADSConfiguration basado en un valor TADSProtocol.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de la base de datos ADS a modificar.
/// </param>
/// <param name="AParameter">
///   El parámetro específico de configuración (TADSConfigurationParameter).
/// </param>
/// <param name="AValue">
///   El valor del tipo TADSProtocol a aplicar.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Configures the TADSConfiguration parameter based on a TADSProtocol value.
/// </summary>
/// <param name="AConfiguration">
///   The ADS database configuration to be modified.
/// </param>
/// <param name="AParameter">
///   The specific configuration parameter (TADSConfigurationParameter).
/// </param>
/// <param name="AValue">
///   The TADSProtocol value to be applied.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure DatabaseConfig(var AConfiguration: TADSConfiguration;
  AParameter: TADSConfigurationParameter; const AValue: TADSProtocol); overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura o parâmetro de configuração TADSConfiguration com base em um valor TADSTableType.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados ADS a ser modificada.
/// </param>
/// <param name="AParameter">
///   O parâmetro específico de configuração (TADSConfigurationParameter).
/// </param>
/// <param name="AValue">
///   O valor do tipo TADSTableType a ser aplicado.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el parámetro de configuración TADSConfiguration basado en un valor TADSTableType.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de la base de datos ADS a modificar.
/// </param>
/// <param name="AParameter">
///   El parámetro específico de configuración (TADSConfigurationParameter).
/// </param>
/// <param name="AValue">
///   El valor del tipo TADSTableType a aplicar.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Configures the TADSConfiguration parameter based on a TADSTableType value.
/// </summary>
/// <param name="AConfiguration">
///   The ADS database configuration to be modified.
/// </param>
/// <param name="AParameter">
///   The specific configuration parameter (TADSConfigurationParameter).
/// </param>
/// <param name="AValue">
///   The TADSTableType value to be applied.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure DatabaseConfig(var AConfiguration: TADSConfiguration;
  AParameter: TADSConfigurationParameter; const AValue: TADSTableType); overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura o parâmetro de configuração TADSConfiguration com base em um valor TADSLocking.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados ADS a ser modificada.
/// </param>
/// <param name="AParameter">
///   O parâmetro específico de configuração (TADSConfigurationParameter).
/// </param>
/// <param name="AValue">
///   O valor do tipo TADSLocking a ser aplicado.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el parámetro de configuración TADSConfiguration basado en un valor TADSLocking.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de la base de datos ADS a modificar.
/// </param>
/// <param name="AParameter">
///   El parámetro específico de configuración (TADSConfigurationParameter).
/// </param>
/// <param name="AValue">
///   El valor del tipo TADSLocking a aplicar.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Configures the TADSConfiguration parameter based on a TADSLocking value.
/// </summary>
/// <param name="AConfiguration">
///   The ADS database configuration to be modified.
/// </param>
/// <param name="AParameter">
///   The specific configuration parameter (TADSConfigurationParameter).
/// </param>
/// <param name="AValue">
///   The TADSLocking value to be applied.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure DatabaseConfig(var AConfiguration: TADSConfiguration;
  AParameter: TADSConfigurationParameter; const AValue: TADSLocking); overload;

implementation

var
  FDictionary: TDictionary<TADSConfigurationParameter, TDatabaseConfigurator<TADSConfiguration>>;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o caminho do banco de dados no TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados ADS a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor (string) do caminho do banco de dados.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece la ruta de la base de datos en TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de la base de datos ADS a modificar.
/// </param>
/// <param name="AValue">
///   El valor (string) de la ruta de la base de datos.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the database path in TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   The ADS database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The value (string) of the database path.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetDatabase(var AConfiguration: TADSConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Database', 'string');
  AConfiguration.Database := GetAbsolutePath(AValue.AsString);
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o nome do usuário no TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados ADS a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor (string) do nome do usuário.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el nombre de usuario en TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de la base de datos ADS a modificar.
/// </param>
/// <param name="AValue">
///   El valor (string) del nombre de usuario.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the username in TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   The ADS database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The value (string) of the username.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetUserName(var AConfiguration: TADSConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('UserName', 'string');
  AConfiguration.UserName := AValue.AsString;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define a senha no TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados ADS a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor (string) da senha.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece la contraseña en TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de la base de datos ADS a modificar.
/// </param>
/// <param name="AValue">
///   El valor (string) de la contraseña.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the password in TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   The ADS database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The value (string) of the password.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetPassword(var AConfiguration: TADSConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('Password', 'string');
  AConfiguration.Password := AValue.AsString;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o conjunto de caracteres no TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados ADS a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor (TADSCharacterSet) do conjunto de caracteres.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el conjunto de caracteres en TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de la base de datos ADS a modificar.
/// </param>
/// <param name="AValue">
///   El valor (TADSCharacterSet) del conjunto de caracteres.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the character set in TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   The ADS database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The TADSCharacterSet value of the character set.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetCharacterSet(var AConfiguration: TADSConfiguration; const AValue: TValue);
var
  LCharacterSet: TADSCharacterSet;
begin
  if not AValue.TryAsType<TADSCharacterSet>(LCharacterSet) then
    RaiseInvalidTypeException('CharacterSet', 'TADSCharacterSet');

  AConfiguration.CharacterSet := LCharacterSet;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define se o pool de conexões está habilitado no TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados ADS a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor (boolean) que indica se o pool de conexões está habilitado.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece si el grupo de conexiones está habilitado en TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de la base de datos ADS a modificar.
/// </param>
/// <param name="AValue">
///   El valor (boolean) que indica si el grupo de conexiones está habilitado.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Sets whether connection pooling is enabled in TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   The ADS database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The boolean value indicating whether connection pooling is enabled.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetPooled(var AConfiguration: TADSConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Boolean> then
    RaiseInvalidTypeException('Pooled', 'boolean');
  AConfiguration.Pooled := AValue.AsBoolean;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o número máximo de itens no pool de conexões no TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados ADS a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor (integer) que representa o número máximo de itens no pool.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el número máximo de elementos en el grupo de conexiones en TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de la base de datos ADS a modificar.
/// </param>
/// <param name="AValue">
///   El valor (integer) que representa el número máximo de elementos en el grupo.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the maximum number of items in the connection pool in TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   The ADS database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The integer value representing the maximum number of items in the pool.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetPoolMaxItems(var AConfiguration: TADSConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolMaxItems', 'integer');
  AConfiguration.PoolMaxItems := AValue.AsInteger;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o tempo de expiração do pool de conexões no TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados ADS a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor (integer) que representa o tempo de expiração em milissegundos.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el tiempo de expiración del grupo de conexiones en TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de la base de datos ADS a modificar.
/// </param>
/// <param name="AValue">
///   El valor (integer) que representa el tiempo de expiración en milisegundos.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the connection pool expiration timeout in TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   The ADS database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The integer value representing the expiration timeout in milliseconds.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetPoolExpireTimeout(var AConfiguration: TADSConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolExpireTimeout', 'integer');
  AConfiguration.PoolExpireTimeout := AValue.AsInteger;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o tempo de limpeza do pool de conexões no TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados ADS a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor (integer) que representa o tempo de limpeza em milissegundos.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el tiempo de limpieza del grupo de conexiones en TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de la base de datos ADS a modificar.
/// </param>
/// <param name="AValue">
///   El valor (integer) que representa el tiempo de limpieza en milisegundos.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the connection pool cleanup timeout in TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   The ADS database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The integer value representing the cleanup timeout in milliseconds.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetPoolCleanupTimeout(var AConfiguration: TADSConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Integer> then
    RaiseInvalidTypeException('PoolCleanupTimeout', 'integer');
  AConfiguration.PoolCleanupTimeout := AValue.AsInteger;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define a visibilidade de registros excluídos no TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados ADS a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor (boolean) que indica se registros excluídos devem ser exibidos.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece la visibilidad de los registros eliminados en TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de la base de datos ADS a modificar.
/// </param>
/// <param name="AValue">
///   El valor (boolean) que indica si se deben mostrar registros eliminados.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the visibility of deleted records in TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   The ADS database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The boolean value indicating if deleted records should be shown.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetShowDelete(var AConfiguration: TADSConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<Boolean> then
    RaiseInvalidTypeException('ShowDelete', 'boolean');
  AConfiguration.ShowDelete := AValue.AsBoolean;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define a biblioteca de fornecedor (vendor library) no TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados ADS a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor (string) do caminho para a biblioteca do fornecedor (vendor library).
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece la biblioteca de proveedor (vendor library) en TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de la base de datos ADS a modificar.
/// </param>
/// <param name="AValue">
///   El valor (string) de la ruta de la biblioteca de proveedor.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the vendor library in TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   The ADS database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The string value of the vendor library path.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetVendorLib(var AConfiguration: TADSConfiguration; const AValue: TValue);
begin
  if not AValue.IsType<string> then
    RaiseInvalidTypeException('VendorLib', 'string');
  AConfiguration.VendorLib := GetAbsolutePath(AValue.AsString);
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o protocolo de conexão no TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados ADS a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor (TADSProtocol) que especifica o protocolo de conexão.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el protocolo de conexión en TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de la base de datos ADS a modificar.
/// </param>
/// <param name="AValue">
///   El valor (TADSProtocol) que especifica el protocolo de conexión.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the connection protocol in TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   The ADS database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The TADSProtocol value specifying the connection protocol.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetProtocol(var AConfiguration: TADSConfiguration; const AValue: TValue);
var
  LProtocol: TADSProtocol;
begin
  if not AValue.TryAsType<TADSProtocol>(LProtocol) then
    RaiseInvalidTypeException('Protocol', 'TADSProtocol');

  AConfiguration.Protocol := LProtocol;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o tipo de tabela no TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados ADS a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor (TADSTableType) que especifica o tipo de tabela.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el tipo de tabla en TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de la base de datos ADS a modificar.
/// </param>
/// <param name="AValue">
///   El valor (TADSTableType) que especifica el tipo de tabla.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the table type in TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   The ADS database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The TADSTableType value specifying the table type.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetTableType(var AConfiguration: TADSConfiguration; const AValue: TValue);
var
  LTableType: TADSTableType;
begin
  if not AValue.TryAsType<TADSTableType>(LTableType) then
    RaiseInvalidTypeException('TableType', 'TADSTableType');

  AConfiguration.TableType := LTableType;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o tipo de bloqueio no TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados ADS a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor (TADSLocking) que especifica o tipo de bloqueio.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el tipo de bloqueo en TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de la base de datos ADS a modificar.
/// </param>
/// <param name="AValue">
///   El valor (TADSLocking) que especifica el tipo de bloqueo.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the locking type in TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   The ADS database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The TADSLocking value specifying the locking type.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetLocking(var AConfiguration: TADSConfiguration; const AValue: TValue);
var
  LLocking: TADSLocking;
begin
  if not AValue.TryAsType<TADSLocking>(LLocking) then
    RaiseInvalidTypeException('Locking', 'TADSLocking');

  AConfiguration.Locking := LLocking;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o tipo de servidor no TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados ADS a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor (TADSServerType) que especifica o tipo de servidor.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el tipo de servidor en TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de la base de datos ADS a modificar.
/// </param>
/// <param name="AValue">
///   El valor (TADSServerType) que especifica el tipo de servidor.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the server type in TADSConfiguration.
/// </summary>
/// <param name="AConfiguration">
///   The ADS database configuration to be modified.
/// </param>
/// <param name="AValue">
///   The TADSServerType value specifying the server type.
/// </param>
  {$ENDIF}
{$ENDIF}
procedure SetServerTypes(var AConfiguration: TADSConfiguration; const AValue: TValue);
var
  LServerType: TADSServerType;
begin
  if not AValue.TryAsType<TADSServerType>(LServerType) then
    RaiseInvalidTypeException('ServerType', 'TADSServerType');

  AConfiguration.ServerType := LServerType;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Inicializa o dicionário de configuradores para os parâmetros de configuração do ADS.
/// </summary>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Inicializa el diccionario de configuradores para los parámetros de configuración de ADS.
/// </summary>
  {$ELSE}
  /// <summary>
  ///   Initializes the configurator dictionary for ADS configuration parameters.
/// </summary>
  {$ENDIF}
{$ENDIF}
procedure InitializeConfigurators;
begin
  FDictionary := TDictionary<TADSConfigurationParameter, TDatabaseConfigurator<TADSConfiguration>>.Create;

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
  FDictionary.Add(TADSConfigurationParameter.PoolExpireTimeout, SetPoolExpireTimeout);
  FDictionary.Add(TADSConfigurationParameter.PoolCleanupTimeout, SetPoolCleanupTimeout);
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
  AParameter: TADSConfigurationParameter; const AValue: TADSLocking);
begin
  AConfiguration.Locking := AValue;
end;

procedure DatabaseConfig(var AConfiguration: TADSConfiguration;
  AParameter: TADSConfigurationParameter; const AValue: TValue);
var
  LConfigureProcedure: TDatabaseConfigurator<TADSConfiguration>;
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


