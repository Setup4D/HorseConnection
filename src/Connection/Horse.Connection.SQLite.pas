{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: Horse.Connection.SQLite                                         }
{                                                                       }
{ Descri��o:                                                            }
{   Esta unit fornece integra��o com o Horse para gerenciar conex�es    }
{   com o banco de dados SQLite usando FireDAC. Inclui fun��es para     }
{   configurar a conex�o e aplicar par�metros espec�ficos de configura��o. }
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
  { Descripci�n:                                                          }
  {   Esta unidad proporciona integraci�n con Horse para gestionar        }
  {   conexiones con la base de datos SQLite usando FireDAC. Incluye      }
  {   funciones para configurar la conexi�n y aplicar par�metros espec�ficos. }
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
  ///   Enumera��o de par�metros de configura��o para o SQLite.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Enumeraci�n de par�metros de configuraci�n para SQLite.
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
  ///   Enumera��o dos modos de bloqueio suportados pelo SQLite.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Enumeraci�n de los modos de bloqueo soportados por SQLite.
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
  ///   Enumera��o dos modos de abertura suportados pelo SQLite.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Enumeraci�n de los modos de apertura soportados por SQLite.
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
  ///   Enumera��o dos tipos de criptografia suportados pelo SQLite.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Enumeraci�n de los tipos de encriptaci�n soportados por SQLite.
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
///   Retorna uma conex�o configurada para o banco de dados SQLite usando as configura��es atuais.
/// </summary>
/// <returns>
///   Uma inst�ncia de <c>TFDConnection</c> configurada para o banco de dados SQLite.
/// </returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexi�n configurada para la base de datos SQLite usando las configuraciones actuales.
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
///   Aplica um par�metro de configura��o ao banco de dados SQLite usando um valor gen�rico.
/// </summary>
/// <param name="AParameter">
///   O par�metro de configura��o a ser aplicado.
/// </param>
/// <param name="AValue">
///   O valor do par�metro como <c>TValue</c>.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Aplica un par�metro de configuraci�n a la base de datos SQLite usando un valor gen�rico.
/// </summary>
/// <param name="AParameter">
///   El par�metro de configuraci�n a aplicar.
/// </param>
/// <param name="AValue">
///   El valor del par�metro como <c>TValue</c>.
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
///   Aplica um par�metro de bloqueio ao banco de dados SQLite.
/// </summary>
/// <param name="AParameter">
///   O par�metro de configura��o a ser aplicado.
/// </param>
/// <param name="AValue">
///   O valor do par�metro como <c>TSQLiteLockingModeType</c>.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Aplica un par�metro de bloqueo a la base de datos SQLite.
  /// </summary>
  /// <param name="AParameter">
  ///   El par�metro de configuraci�n a aplicar.
  /// </param>
  /// <param name="AValue">
  ///   El valor del par�metro como <c>TSQLiteLockingModeType</c>.
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
///   Aplica um par�metro de modo de abertura ao banco de dados SQLite.
/// </summary>
/// <param name="AParameter">
///   O par�metro de configura��o a ser aplicado.
/// </param>
/// <param name="AValue">
///   O valor do par�metro como <c>TSQLiteOpenModeType</c>.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Aplica un par�metro de modo de apertura a la base de datos SQLite.
  /// </summary>
  /// <param name="AParameter">
  ///   El par�metro de configuraci�n a aplicar.
  /// </param>
  /// <param name="AValue">
  ///   El valor del par�metro como <c>TSQLiteOpenModeType</c>.
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
///   Aplica um par�metro de criptografia ao banco de dados SQLite.
/// </summary>
/// <param name="AParameter">
///   O par�metro de configura��o a ser aplicado.
/// </param>
/// <param name="AValue">
///   O valor do par�metro como <c>TSQLiteEncryptType</c>.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Aplica un par�metro de encriptaci�n a la base de datos SQLite.
  /// </summary>
  /// <param name="AParameter">
  ///   El par�metro de configuraci�n a aplicar.
  /// </param>
  /// <param name="AValue">
  ///   El valor del par�metro como <c>TSQLiteEncryptType</c>.
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
///   Define o prefixo da conex�o para o banco de dados SQLite.
/// </summary>
/// <param name="AValue">
///   O valor do prefixo.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el prefijo de conexi�n para la base de datos SQLite.
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
///   Middleware para integra��o com o Horse. Define a conex�o com o banco de dados SQLite
///   para cada requisi��o HTTP recebida.
/// </summary>
/// <param name="Req">O objeto de requisi��o do Horse.</param>
/// <param name="Res">O objeto de resposta do Horse.</param>
/// <param name="Next">O procedimento a ser executado na sequ�ncia.</param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Middleware para integraci�n con Horse. Establece la conexi�n con la base de datos SQLite
  ///   para cada solicitud HTTP recibida.
  /// </summary>
  /// <param name="Req">El objeto de solicitud de Horse.</param>
  /// <param name="Res">El objeto de respuesta de Horse.</param>
  /// <param name="Next">El procedimiento a ejecutar a continuaci�n.</param>
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
