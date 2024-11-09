{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: Horse.Connection.MySQL                                          }
{                                                                       }
{ Descrição:                                                            }
{   Esta unit fornece integração com o Horse para gerenciar conexões    }
{   com o banco de dados MySQL usando FireDAC. Inclui funções para      }
{   configurar a conexão e aplicar parâmetros específicos de configuração. }
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
  { Unidad: Horse.Connection.MySQL                                        }
  {                                                                       }
  { Descripción:                                                          }
  {   Esta unidad proporciona integración con Horse para gestionar        }
  {   conexiones con la base de datos MySQL usando FireDAC. Incluye       }
  {   funciones para configurar la conexión y aplicar parámetros específicos. }
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
  { Unit: Horse.Connection.MySQL                                          }
  {                                                                       }
  { Description:                                                          }
  {   This unit provides integration with Horse to manage connections     }
  {   to the MySQL database using FireDAC. It includes functions          }
  {   to configure the connection and apply specific configuration parameters. }
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

unit Horse.Connection.MySQL;

interface

uses
  FireDAC.Comp.Client,
  EnumsHelpersUtils,
  SystemUtils,
  System.Rtti,
  Horse;

type
{$SCOPEDENUMS ON}

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Enumeração de parâmetros de configuração para o MySQL.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Enumeración de parámetros de configuración para MySQL.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Enumeration of configuration parameters for MySQL.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TMySQLConfigurationParameter = EnumsHelpersUtils.TMySQLConfigurationParameter;

{$SCOPEDENUMS OFF}

{$IFDEF PORTUGUES}
/// <summary>
///   Retorna uma conexão configurada para o banco de dados MySQL usando as configurações atuais.
/// </summary>
/// <returns>
///   Uma instância de <c>TFDConnection</c> configurada para o banco de dados MySQL.
/// </returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexión configurada para la base de datos MySQL usando las configuraciones actuales.
  /// </summary>
  /// <returns>
  ///   Una instancia de <c>TFDConnection</c> configurada para la base de datos MySQL.
  /// </returns>
  {$ELSE}
  /// <summary>
  ///   Returns a configured connection to the MySQL database using the current settings.
  /// </summary>
  /// <returns>
  ///   A <c>TFDConnection</c> instance configured for the MySQL database.
  /// </returns>
  {$ENDIF}
{$ENDIF}
function MySQLConnection: TFDConnection;

{$IFDEF PORTUGUES}
/// <summary>
///   Aplica um parâmetro de configuração ao banco de dados MySQL usando um valor genérico.
/// </summary>
/// <param name="AParameter">
///   O parâmetro de configuração a ser aplicado.
/// </param>
/// <param name="Value">
///   O valor do parâmetro como <c>TValue</c>.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Aplica un parámetro de configuración a la base de datos MySQL usando un valor genérico.
  /// </summary>
  /// <param name="AParameter">
  ///   El parámetro de configuración a aplicar.
  /// </param>
  /// <param name="Value">
  ///   El valor del parámetro como <c>TValue</c>.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Applies a configuration parameter to the MySQL database using a generic value.
  /// </summary>
  /// <param name="AParameter">
  ///   The configuration parameter to be applied.
  /// </param>
  /// <param name="Value">
  ///   The parameter value as <c>TValue</c>.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure ApplyDatabaseConfiguration(const AParameter: TMySQLConfigurationParameter; const Value: TValue);

{$IFDEF PORTUGUES}
/// <summary>
///   Define o prefixo da conexão para o banco de dados MySQL.
/// </summary>
/// <param name="AValue">
///   O valor do prefixo.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el prefijo de conexión para la base de datos MySQL.
  /// </summary>
  /// <param name="AValue">
  ///   El valor del prefijo.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the connection prefix for the MySQL database.
  /// </summary>
  /// <param name="AValue">
  ///   The prefix value.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetConnectionPrefix(const AValue: string);

{$IFDEF PORTUGUES}
/// <summary>
///   Define o caminho do banco de dados para o MySQL.
/// </summary>
/// <param name="AValue">
///   O caminho do banco de dados.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece la ruta de la base de datos para MySQL.
  /// </summary>
  /// <param name="AValue">
  ///   La ruta de la base de datos.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the database path for MySQL.
  /// </summary>
  /// <param name="AValue">
  ///   The database path.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetDatabase(const AValue: string);

{$IFDEF PORTUGUES}
/// <summary>
///   Middleware para integração com o Horse. Define a conexão com o banco de dados MySQL
///   para cada requisição HTTP recebida.
/// </summary>
/// <param name="Req">O objeto de requisição do Horse.</param>
/// <param name="Res">O objeto de resposta do Horse.</param>
/// <param name="Next">O procedimento a ser executado na sequência.</param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Middleware para integración con Horse. Establece la conexión con la base de datos MySQL
  ///   para cada solicitud HTTP recibida.
  /// </summary>
  /// <param name="Req">El objeto de solicitud de Horse.</param>
  /// <param name="Res">El objeto de respuesta de Horse.</param>
  /// <param name="Next">El procedimiento a ejecutar a continuación.</param>
  {$ELSE}
  /// <summary>
  ///   Middleware for Horse integration. Sets the connection to the MySQL database
  ///   for each incoming HTTP request.
  /// </summary>
  /// <param name="Req">The Horse request object.</param>
  /// <param name="Res">The Horse response object.</param>
  /// <param name="Next">The procedure to execute next.</param>
  {$ENDIF}
{$ENDIF}
procedure HorseConnectionMySQL(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

uses
  MySQLDataBaseConnectionManager,
  MySQLDataBaseConfigurationParameter;

var
  FConfiguration: TMySQLConfiguration;
  FDatabase: string;
  FConnectionPrefix: string;

function MySQLConnection: TFDConnection;
begin
  Result := GetConnection(FConfiguration, FDatabase, FConnectionPrefix);
end;

procedure SetConnectionPrefix(const AValue : string);
begin
  FConnectionPrefix := AValue;
end;

procedure SetDatabase(const AValue : string);
begin
  FDatabase := GetAbsolutePath(AValue);
end;

procedure ApplyDatabaseConfiguration(const AParameter
  : TMySQLConfigurationParameter; const Value: TValue);
begin
  DatabaseConfig(FConfiguration, AParameter, Value);
end;

procedure HorseConnectionMySQL(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  Next;
end;

initialization

FConfiguration := TMySQLConfiguration.Default;

end.

