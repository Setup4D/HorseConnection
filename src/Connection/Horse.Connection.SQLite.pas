{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: Horse.Connection.SQLite                                         }
{                                                                       }
{ Descrição:                                                            }
{   Esta unit fornece integração com o Horse para gerenciar conexões    }
{   com o banco de dados SQLite usando FireDAC. Inclui funções para     }
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
  { Unidad: Horse.Connection.SQLite                                       }
  {                                                                       }
  { Descripción:                                                          }
  {   Esta unidad proporciona integración con Horse para gestionar        }
  {   conexiones con la base de datos SQLite usando FireDAC. Incluye      }
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
  { Unit: Horse.Connection.SQLite                                         }
  {                                                                       }
  { Description:                                                          }
  {   This unit provides integration with Horse to manage connections     }
  {   to the SQLite database using FireDAC. It includes functions         }
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

unit Horse.Connection.SQLite;

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
  ///   Enumeração de parâmetros de configuração para o SQLite.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Enumeración de parámetros de configuración para SQLite.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Enumeration of configuration parameters for SQLite.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TSQLiteConfigurationParameter = EnumsHelpersUtils.TSQLiteConfigurationParameter;

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Enumeração dos modos de bloqueio suportados pelo SQLite.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Enumeración de los modos de bloqueo soportados por SQLite.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Enumeration of locking modes supported by SQLite.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TSQLiteLockingModeType = EnumsHelpersUtils.TSQLiteLockingModeType;

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Enumeração dos modos de abertura suportados pelo SQLite.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Enumeración de los modos de apertura soportados por SQLite.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Enumeration of open modes supported by SQLite.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TSQLiteOpenModeType = EnumsHelpersUtils.TSQLiteOpenModeType;

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Enumeração dos tipos de criptografia suportados pelo SQLite.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Enumeración de los tipos de encriptación soportados por SQLite.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Enumeration of encryption types supported by SQLite.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TSQLiteEncryptType = EnumsHelpersUtils.TSQLiteEncryptType;

{$SCOPEDENUMS OFF}

{$IFDEF PORTUGUES}
/// <summary>
///   Retorna uma conexão configurada para o banco de dados SQLite usando as configurações atuais.
/// </summary>
/// <returns>
///   Uma instância de <c>TFDConnection</c> configurada para o banco de dados SQLite.
/// </returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexión configurada para la base de datos SQLite usando las configuraciones actuales.
  /// </summary>
  /// <returns>
  ///   Una instancia de <c>TFDConnection</c> configurada para la base de datos SQLite.
  /// </returns>
  {$ELSE}
  /// <summary>
  ///   Returns a configured connection to the SQLite database using the current settings.
  /// </summary>
  /// <returns>
  ///   A <c>TFDConnection</c> instance configured for the SQLite database.
  /// </returns>
  {$ENDIF}
{$ENDIF}
function SQLiteConnection: TFDConnection;

{$IFDEF PORTUGUES}
/// <summary>
///   Aplica um parâmetro de configuração ao banco de dados SQLite usando um valor genérico.
/// </summary>
/// <param name="AParameter">
///   O parâmetro de configuração a ser aplicado.
/// </param>
/// <param name="AValue">
///   O valor do parâmetro como <c>TValue</c>.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Aplica un parámetro de configuración a la base de datos SQLite usando un valor genérico.
/// </summary>
/// <param name="AParameter">
///   El parámetro de configuración a aplicar.
/// </param>
/// <param name="AValue">
///   El valor del parámetro como <c>TValue</c>.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Applies a configuration parameter to the SQLite database using a generic value.
  /// </summary>
  /// <param name="AParameter">
  ///   The configuration parameter to be applied.
  /// </param>
  /// <param name="AValue">
  ///   The parameter value as <c>TValue</c>.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure ApplyDatabaseConfiguration(const AParameter: TSQLiteConfigurationParameter; const AValue: TValue); overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Aplica um parâmetro de bloqueio ao banco de dados SQLite.
/// </summary>
/// <param name="AParameter">
///   O parâmetro de configuração a ser aplicado.
/// </param>
/// <param name="AValue">
///   O valor do parâmetro como <c>TSQLiteLockingModeType</c>.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Aplica un parámetro de bloqueo a la base de datos SQLite.
  /// </summary>
  /// <param name="AParameter">
  ///   El parámetro de configuración a aplicar.
  /// </param>
  /// <param name="AValue">
  ///   El valor del parámetro como <c>TSQLiteLockingModeType</c>.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Applies a locking mode parameter to the SQLite database.
  /// </summary>
  /// <param name="AParameter">
  ///   The configuration parameter to be applied.
  /// </param>
  /// <param name="AValue">
  ///   The parameter value as <c>TSQLiteLockingModeType</c>.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure ApplyDatabaseConfiguration(const AParameter: TSQLiteConfigurationParameter; const AValue: TSQLiteLockingModeType); overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Aplica um parâmetro de modo de abertura ao banco de dados SQLite.
/// </summary>
/// <param name="AParameter">
///   O parâmetro de configuração a ser aplicado.
/// </param>
/// <param name="AValue">
///   O valor do parâmetro como <c>TSQLiteOpenModeType</c>.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Aplica un parámetro de modo de apertura a la base de datos SQLite.
  /// </summary>
  /// <param name="AParameter">
  ///   El parámetro de configuración a aplicar.
  /// </param>
  /// <param name="AValue">
  ///   El valor del parámetro como <c>TSQLiteOpenModeType</c>.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Applies an open mode parameter to the SQLite database.
  /// </summary>
  /// <param name="AParameter">
  ///   The configuration parameter to be applied.
  /// </param>
  /// <param name="AValue">
  ///   The parameter value as <c>TSQLiteOpenModeType</c>.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure ApplyDatabaseConfiguration(const AParameter: TSQLiteConfigurationParameter; const AValue: TSQLiteOpenModeType); overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Aplica um parâmetro de criptografia ao banco de dados SQLite.
/// </summary>
/// <param name="AParameter">
///   O parâmetro de configuração a ser aplicado.
/// </param>
/// <param name="AValue">
///   O valor do parâmetro como <c>TSQLiteEncryptType</c>.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Aplica un parámetro de encriptación a la base de datos SQLite.
  /// </summary>
  /// <param name="AParameter">
  ///   El parámetro de configuración a aplicar.
  /// </param>
  /// <param name="AValue">
  ///   El valor del parámetro como <c>TSQLiteEncryptType</c>.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Applies an encryption parameter to the SQLite database.
  /// </summary>
  /// <param name="AParameter">
  ///   The configuration parameter to be applied.
  /// </param>
  /// <param name="AValue">
  ///   The parameter value as <c>TSQLiteEncryptType</c>.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure ApplyDatabaseConfiguration(const AParameter: TSQLiteConfigurationParameter; const AValue: TSQLiteEncryptType); overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o prefixo da conexão para o banco de dados SQLite.
/// </summary>
/// <param name="AValue">
///   O valor do prefixo.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el prefijo de conexión para la base de datos SQLite.
  /// </summary>
  /// <param name="AValue">
  ///   El valor del prefijo.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the connection prefix for the SQLite database.
  /// </summary>
  /// <param name="AValue">
  ///   The prefix value.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetConnectionPrefix(const AValue: string);

{$IFDEF PORTUGUES}
/// <summary>
///   Define o caminho do banco de dados para o SQLite.
/// </summary>
/// <param name="AValue">
///   O caminho do banco de dados.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece la ruta de la base de datos para SQLite.
  /// </summary>
  /// <param name="AValue">
  ///   La ruta de la base de datos.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the database path for SQLite.
  /// </summary>
  /// <param name="AValue">
  ///   The database path.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetDatabase(const AValue: string);

{$IFDEF PORTUGUES}
/// <summary>
///   Middleware para integração com o Horse. Define a conexão com o banco de dados SQLite
///   para cada requisição HTTP recebida.
/// </summary>
/// <param name="Req">O objeto de requisição do Horse.</param>
/// <param name="Res">O objeto de resposta do Horse.</param>
/// <param name="Next">O procedimento a ser executado na sequência.</param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Middleware para integración con Horse. Establece la conexión con la base de datos SQLite
  ///   para cada solicitud HTTP recibida.
  /// </summary>
  /// <param name="Req">El objeto de solicitud de Horse.</param>
  /// <param name="Res">El objeto de respuesta de Horse.</param>
  /// <param name="Next">El procedimiento a ejecutar a continuación.</param>
  {$ELSE}
  /// <summary>
  ///   Middleware for Horse integration. Sets the connection to the SQLite database
  ///   for each incoming HTTP request.
  /// </summary>
  /// <param name="Req">The Horse request object.</param>
  /// <param name="Res">The Horse response object.</param>
  /// <param name="Next">The procedure to execute next.</param>
  {$ENDIF}
{$ENDIF}
procedure HorseConnectionSQLite(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

uses
  SQLiteDataBaseConnectionManager,
  SQLiteDataBaseConfigurationParameter;

var
  FConfiguration: TSQLiteConfiguration;
  FDatabase: string;
  FConnectionPrefix: string;

function SQLiteConnection: TFDConnection;
begin
  Result := GetConnection(FConfiguration, FDatabase,
    FConnectionPrefix);
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
  : TSQLiteConfigurationParameter; const AValue: TValue);
begin
  DatabaseConfig(FConfiguration, AParameter, AValue);
end;

procedure ApplyDatabaseConfiguration(const AParameter
  : TSQLiteConfigurationParameter; const AValue: TSQLiteLockingModeType);
begin
  DatabaseConfig(FConfiguration, AParameter, AValue);
end;

procedure ApplyDatabaseConfiguration(const AParameter
  : TSQLiteConfigurationParameter; const AValue: TSQLiteOpenModeType);
begin
  DatabaseConfig(FConfiguration, AParameter, AValue);
end;

procedure ApplyDatabaseConfiguration(const AParameter
  : TSQLiteConfigurationParameter; const AValue: TSQLiteEncryptType);
begin
  DatabaseConfig(FConfiguration, AParameter, AValue);
end;

procedure HorseConnectionSQLite(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  Next;
end;

initialization

FConfiguration := TSQLiteConfiguration.Default;

end.
