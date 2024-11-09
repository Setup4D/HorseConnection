{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: Horse.Connection.FB                                             }
{                                                                       }
{ Descri��o:                                                            }
{   Esta unit fornece integra��o com o Horse para gerenciar conex�es    }
{   com o banco de dados Firebird usando FireDAC. Inclui fun��es para   }
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
  { Unidad: Horse.Connection.FB                                           }
  {                                                                       }
  { Descripci�n:                                                          }
  {   Esta unidad proporciona integraci�n con Horse para gestionar        }
  {   conexiones con la base de datos Firebird usando FireDAC. Incluye    }
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
  { Unit: Horse.Connection.FB                                             }
  {                                                                       }
  { Description:                                                          }
  {   This unit provides integration with Horse to manage connections     }
  {   to the Firebird database using FireDAC. It includes functions       }
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
unit Horse.Connection.FB;
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
  ///   Enumera��o de par�metros de configura��o para o Firebird.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Enumeraci�n de par�metros de configuraci�n para Firebird.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Enumeration of configuration parameters for Firebird.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TFBConfigurationParameter = EnumsHelpersUtils.TFBConfigurationParameter;
  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Enumera��o de tipos de protocolo suportados pelo Firebird.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Enumeraci�n de tipos de protocolo soportados por Firebird.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Enumeration of protocol types supported by Firebird.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TFBProtocolType = EnumsHelpersUtils.TFBProtocolType;
  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Enumera��o de modos de abertura de banco de dados suportados pelo Firebird.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Enumeraci�n de modos de apertura de base de datos soportados por Firebird.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Enumeration of database open modes supported by Firebird.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TFBOpenModeType = EnumsHelpersUtils.TFBOpenModeType;
  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Enumera��o de conjuntos de caracteres suportados pelo Firebird.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Enumeraci�n de conjuntos de caracteres soportados por Firebird.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Enumeration of character sets supported by Firebird.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TFBCharacterSetType = EnumsHelpersUtils.TFBCharacterSetType;
{$SCOPEDENUMS OFF}
{$IFDEF PORTUGUES}
/// <summary>
///   Retorna uma conex�o configurada para o banco de dados Firebird usando as configura��es atuais.
/// </summary>
/// <returns>
///   Uma inst�ncia de <c>TFDConnection</c> configurada para o banco de dados Firebird.
/// </returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexi�n configurada para la base de datos Firebird usando las configuraciones actuales.
  /// </summary>
  /// <returns>
  ///   Una instancia de <c>TFDConnection</c> configurada para la base de datos Firebird.
  /// </returns>
  {$ELSE}
  /// <summary>
  ///   Returns a configured connection to the Firebird database using the current settings.
  /// </summary>
  /// <returns>
  ///   A <c>TFDConnection</c> instance configured for the Firebird database.
  /// </returns>
  {$ENDIF}
{$ENDIF}
function FBConnection: TFDConnection;
{$IFDEF PORTUGUES}
/// <summary>
///   Aplica um par�metro de configura��o ao banco de dados Firebird usando um valor gen�rico.
/// </summary>
/// <param name="AParameter">
///   O par�metro de configura��o a ser aplicado.
/// </param>
/// <param name="Value">
///   O valor do par�metro como <c>TValue</c>.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Aplica un par�metro de configuraci�n a la base de datos Firebird usando un valor gen�rico.
/// </summary>
/// <param name="AParameter">
///   El par�metro de configuraci�n a aplicar.
/// </param>
/// <param name="Value">
///   El valor del par�metro como <c>TValue</c>.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Applies a configuration parameter to the Firebird database using a generic value.
  /// </summary>
  /// <param name="AParameter">
  ///   The configuration parameter to be applied.
  /// </param>
  /// <param name="Value">
  ///   The parameter value as <c>TValue</c>.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure ApplyDatabaseConfiguration(const AParameter: TFBConfigurationParameter; const Value: TValue); overload;
{$IFDEF PORTUGUES}
/// <summary>
///   Aplica um par�metro de tipo de protocolo ao banco de dados Firebird.
/// </summary>
/// <param name="AParameter">
///   O par�metro de configura��o a ser aplicado.
/// </param>
/// <param name="Value">
///   O valor do par�metro como <c>TFBProtocolType</c>.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Aplica un par�metro de tipo de protocolo a la base de datos Firebird.
  /// </summary>
  /// <param name="AParameter">
  ///   El par�metro de configuraci�n a aplicar.
  /// </param>
  /// <param name="Value">
  ///   El valor del par�metro como <c>TFBProtocolType</c>.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Applies a protocol type parameter to the Firebird database.
  /// </summary>
  /// <param name="AParameter">
  ///   The configuration parameter to be applied.
  /// </param>
  /// <param name="Value">
  ///   The parameter value as <c>TFBProtocolType</c>.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure ApplyDatabaseConfiguration(const AParameter: TFBConfigurationParameter; const Value: TFBProtocolType); overload;
{$IFDEF PORTUGUES}
/// <summary>
///   Aplica um par�metro de modo de abertura ao banco de dados Firebird.
/// </summary>
/// <param name="AParameter">
///   O par�metro de configura��o a ser aplicado.
/// </param>
/// <param name="Value">
///   O valor do par�metro como <c>TFBOpenModeType</c>.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Aplica un par�metro de modo de apertura a la base de datos Firebird.
/// </summary>
/// <param name="AParameter">
///   El par�metro de configuraci�n a aplicar.
/// </param>
/// <param name="Value">
///   El valor del par�metro como <c>TFBOpenModeType</c>.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Applies an open mode parameter to the Firebird database.
  /// </summary>
  /// <param name="AParameter">
  ///   The configuration parameter to be applied.
  /// </param>
  /// <param name="Value">
  ///   The parameter value as <c>TFBOpenModeType</c>.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure ApplyDatabaseConfiguration(const AParameter: TFBConfigurationParameter; const Value: TFBOpenModeType); overload;
{$IFDEF PORTUGUES}
/// <summary>
///   Aplica um par�metro de conjunto de caracteres ao banco de dados Firebird.
/// </summary>
/// <param name="AParameter">
///   O par�metro de configura��o a ser aplicado.
/// </param>
/// <param name="Value">
///   O valor do par�metro como <c>TFBCharacterSetType</c>.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Aplica un par�metro de conjunto de caracteres a la base de datos Firebird.
/// </summary>
/// <param name="AParameter">
///   El par�metro de configuraci�n a aplicar.
/// </param>
/// <param name="Value">
///   El valor del par�metro como <c>TFBCharacterSetType</c>.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Applies a character set parameter to the Firebird database.
  /// </summary>
  /// <param name="AParameter">
  ///   The configuration parameter to be applied.
  /// </param>
  /// <param name="Value">
  ///   The parameter value as <c>TFBCharacterSetType</c>.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure ApplyDatabaseConfiguration(const AParameter: TFBConfigurationParameter; const Value: TFBCharacterSetType); overload;
{$IFDEF PORTUGUES}
/// <summary>
///   Define o prefixo da conex�o para o banco de dados Firebird.
/// </summary>
/// <param name="AValue">
///   O valor do prefixo.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el prefijo de conexi�n para la base de datos Firebird.
/// </summary>
/// <param name="AValue">
///   El valor del prefijo.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the connection prefix for the Firebird database.
  /// </summary>
  /// <param name="AValue">
  ///   The prefix value.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetConnectionPrefix(const AValue: string);
{$IFDEF PORTUGUES}
/// <summary>
///   Define o caminho do banco de dados para o Firebird.
/// </summary>
/// <param name="AValue">
///   O caminho do banco de dados.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece la ruta de la base de datos para Firebird.
  /// </summary>
  /// <param name="AValue">
  ///   La ruta de la base de datos.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the database path for Firebird.
  /// </summary>
  /// <param name="AValue">
  ///   The database path.
  /// </param>
    {$ENDIF}
{$ENDIF}
procedure SetDatabase(const AValue: string);
{$IFDEF PORTUGUES}
/// <summary>
///   Middleware para integra��o com o Horse. Define a conex�o com o banco de dados Firebird
///   para cada requisi��o HTTP recebida.
/// </summary>
/// <param name="Req">O objeto de requisi��o do Horse.</param>
/// <param name="Res">O objeto de resposta do Horse.</param>
/// <param name="Next">O procedimento a ser executado na sequ�ncia.</param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Middleware para integraci�n con Horse. Establece la conexi�n con la base de datos Firebird
  ///   para cada solicitud HTTP recibida.
  /// </summary>
  /// <param name="Req">El objeto de solicitud de Horse.</param>
  /// <param name="Res">El objeto de respuesta de Horse.</param>
  /// <param name="Next">El procedimiento a ejecutar a continuaci�n.</param>
  {$ELSE}
  /// <summary>
  ///   Middleware for Horse integration. Sets the connection to the Firebird database
  ///   for each incoming HTTP request.
  /// </summary>
  /// <param name="Req">The Horse request object.</param>
  /// <param name="Res">The Horse response object.</param>
  /// <param name="Next">The procedure to execute next.</param>
  {$ENDIF}
{$ENDIF}
procedure HorseConnectionFB(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

uses
  FBDataBaseConnectionManager,
  FBDataBaseConfigurationParameter;

var
  FConfiguration: TFBConfiguration;
  FDatabase: string;
  FConnectionPrefix: string;

function FBConnection: TFDConnection;
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
  : TFBConfigurationParameter; const Value: TValue);
begin
  DatabaseConfig(FConfiguration, AParameter, Value);
end;

procedure ApplyDatabaseConfiguration(const AParameter
  : TFBConfigurationParameter; const Value: TFBProtocolType);
begin
  DatabaseConfig(FConfiguration, AParameter, Value);
end;

procedure ApplyDatabaseConfiguration(const AParameter
  : TFBConfigurationParameter; const Value: TFBOpenModeType);
begin
  DatabaseConfig(FConfiguration, AParameter, Value);
end;

procedure ApplyDatabaseConfiguration(const AParameter
  : TFBConfigurationParameter; const Value: TFBCharacterSetType);
begin
  DatabaseConfig(FConfiguration, AParameter, Value);
end;

procedure HorseConnectionFB(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  Next;
end;

initialization

FConfiguration := TFBConfiguration.Default;

end.
