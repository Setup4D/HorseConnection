{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: Horse.Connection.PG                                             }
{                                                                       }
{ Descri��o:                                                            }
{   Esta unit fornece integra��o com o Horse para gerenciar conex�es    }
{   com o banco de dados PostgreSQL usando FireDAC. Inclui fun��es      }
{   para configurar a conex�o e aplicar par�metros espec�ficos de       }
{   configura��o.                                                       }
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
  { Unidad: Horse.Connection.PG                                           }
  {                                                                       }
  { Descripci�n:                                                          }
  {   Esta unidad proporciona integraci�n con Horse para gestionar        }
  {   conexiones con la base de datos PostgreSQL usando FireDAC. Incluye  }
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
  { Unit: Horse.Connection.PG                                             }
  {                                                                       }
  { Description:                                                          }
  {   This unit provides integration with Horse to manage connections     }
  {   to the PostgreSQL database using FireDAC. It includes functions     }
  {   to configure the connection and apply specific configuration        }
  {   parameters.                                                         }
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

unit Horse.Connection.PG;

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
  ///   Enumera��o de par�metros de configura��o para o PostgreSQL.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Enumeraci�n de par�metros de configuraci�n para PostgreSQL.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Enumeration of configuration parameters for PostgreSQL.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TPGConfigurationParameter = EnumsHelpersUtils.TPGConfigurationParameter;

{$SCOPEDENUMS OFF}

{$IFDEF PORTUGUES}
/// <summary>
///   Retorna uma conex�o configurada para o banco de dados PostgreSQL usando as configura��es atuais.
/// </summary>
/// <returns>
///   Uma inst�ncia de <c>TFDConnection</c> configurada para o banco de dados PostgreSQL.
/// </returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexi�n configurada para la base de datos PostgreSQL usando las configuraciones actuales.
/// </summary>
/// <returns>
///   Una instancia de <c>TFDConnection</c> configurada para la base de datos PostgreSQL.
/// </returns>
  {$ELSE}
  /// <summary>
  ///   Returns a configured connection to the PostgreSQL database using the current settings.
  /// </summary>
  /// <returns>
  ///   A <c>TFDConnection</c> instance configured for the PostgreSQL database.
  /// </returns>
  {$ENDIF}
{$ENDIF}
function PGConnection: TFDConnection;

{$IFDEF PORTUGUES}
/// <summary>
///   Aplica um par�metro de configura��o ao banco de dados PostgreSQL usando um valor gen�rico.
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
  ///   Aplica un par�metro de configuraci�n a la base de datos PostgreSQL usando un valor gen�rico.
  /// </summary>
  /// <param name="AParameter">
  ///   El par�metro de configuraci�n a aplicar.
  /// </param>
  /// <param name="Value">
  ///   El valor del par�metro como <c>TValue</c>.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Applies a configuration parameter to the PostgreSQL database using a generic value.
  /// </summary>
  /// <param name="AParameter">
  ///   The configuration parameter to be applied.
  /// </param>
  /// <param name="Value">
  ///   The parameter value as <c>TValue</c>.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure ApplyDatabaseConfiguration(const AParameter: TPGConfigurationParameter; const Value: TValue);

{$IFDEF PORTUGUES}
/// <summary>
///   Define o prefixo da conex�o para o banco de dados PostgreSQL.
/// </summary>
/// <param name="AValue">
///   O valor do prefixo.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el prefijo de conexi�n para la base de datos PostgreSQL.
  /// </summary>
  /// <param name="AValue">
  ///   El valor del prefijo.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the connection prefix for the PostgreSQL database.
  /// </summary>
  /// <param name="AValue">
  ///   The prefix value.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetConnectionPrefix(const AValue: string);

{$IFDEF PORTUGUES}
/// <summary>
///   Define o caminho do banco de dados para o PostgreSQL.
/// </summary>
/// <param name="AValue">
///   O caminho do banco de dados.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece la ruta de la base de datos para PostgreSQL.
/// </summary>
/// <param name="AValue">
///   La ruta de la base de datos.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the database path for PostgreSQL.
  /// </summary>
  /// <param name="AValue">
  ///   The database path.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetDatabase(const AValue: string);

{$IFDEF PORTUGUES}
/// <summary>
///   Middleware para integra��o com o Horse. Define a conex�o com o banco de dados PostgreSQL
///   para cada requisi��o HTTP recebida.
/// </summary>
/// <param name="Req">O objeto de requisi��o do Horse.</param>
/// <param name="Res">O objeto de resposta do Horse.</param>
/// <param name="Next">O procedimento a ser executado na sequ�ncia.</param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Middleware para integraci�n con Horse. Establece la conexi�n con la base de datos PostgreSQL
  ///   para cada solicitud HTTP recibida.
  /// </summary>
  /// <param name="Req">El objeto de solicitud de Horse.</param>
  /// <param name="Res">El objeto de respuesta de Horse.</param>
  /// <param name="Next">El procedimiento a ejecutar a continuaci�n.</param>
  {$ELSE}
  /// <summary>
  ///   Middleware for Horse integration. Sets the connection to the PostgreSQL database
  ///   for each incoming HTTP request.
  /// </summary>
  /// <param name="Req">The Horse request object.</param>
  /// <param name="Res">The Horse response object.</param>
  /// <param name="Next">The procedure to execute next.</param>
  {$ENDIF}
{$ENDIF}
procedure HorseConnectionPG(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

uses
  PGDataBaseConnectionManager,
  PGDataBaseConfigurationParameter;

var
  FConfiguration: TPGConfiguration;
  FDatabase: string;
  FConnectionPrefix: string;

function PGConnection: TFDConnection;
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
  : TPGConfigurationParameter; const Value: TValue);
begin
  DatabaseConfig(FConfiguration, AParameter, Value);
end;

procedure HorseConnectionPG(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  Next;
end;

initialization

FConfiguration := TPGConfiguration.Default;

end.
