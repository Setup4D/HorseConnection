{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: Horse.Connection.ADS                                            }
{                                                                       }
{ Descri��o:                                                            }
{   Esta unit fornece integra��o com o Horse para gerenciar conex�es    }
{   com o banco de dados Advantage Database Server (ADS) usando FireDAC.}
{   Inclui fun��es para configurar a conex�o e aplicar par�metros       }
{   espec�ficos de configura��o.                                        }
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
  { Unidad: Horse.Connection.ADS                                          }
  {                                                                       }
  { Descripci�n:                                                          }
  {   Esta unidad proporciona integraci�n con Horse para gestionar        }
  {   conexiones con la base de datos Advantage Database Server (ADS)     }
  {   usando FireDAC. Incluye funciones para configurar la conexi�n y     }
  {   aplicar par�metros espec�ficos de configuraci�n.                    }
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
  { Unit: Horse.Connection.ADS                                            }
  {                                                                       }
  { Description:                                                          }
  {   This unit provides integration with Horse to manage connections     }
  {   to the Advantage Database Server (ADS) using FireDAC. It includes   }
  {   functions to configure the connection and apply specific            }
  {   configuration parameters.                                           }
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

unit Horse.Connection.ADS;

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
  ///   Enumera��o de par�metros de configura��o para o ADS.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Enumeraci�n de par�metros de configuraci�n para ADS.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Enumeration of configuration parameters for ADS.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TADSConfigurationParameter = EnumsHelpersUtils.TADSConfigurationParameter;

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Enumera��o de tipos de servidor suportados pelo ADS.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Enumeraci�n de tipos de servidor soportados por ADS.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Enumeration of server types supported by ADS.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TADSServerType = EnumsHelpersUtils.TADSServerType;

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Enumera��o de conjuntos de caracteres suportados pelo ADS.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Enumeraci�n de conjuntos de caracteres soportados por ADS.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Enumeration of character sets supported by ADS.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TADSCharacterSet = EnumsHelpersUtils.TADSCharacterSet;

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Enumera��o de protocolos suportados pelo ADS.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Enumeraci�n de protocolos soportados por ADS.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Enumeration of protocols supported by ADS.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TADSProtocol = EnumsHelpersUtils.TADSProtocol;

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Enumera��o de tipos de tabela suportados pelo ADS.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Enumeraci�n de tipos de tabla soportados por ADS.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Enumeration of table types supported by ADS.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TADSTableType = EnumsHelpersUtils.TADSTableType;

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Enumera��o de tipos de bloqueio suportados pelo ADS.
  /// </summary>
  /// <remarks>
  ///   Define os tipos de bloqueio que controlam o acesso concorrente aos dados
  ///   no Advantage Database Server (ADS). A escolha do tipo de bloqueio impacta
  ///   a forma como m�ltiplos usu�rios podem acessar e modificar os dados.
  /// </remarks>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Enumeraci�n de tipos de bloqueo soportados por ADS.
    /// </summary>
    /// <remarks>
    ///   Define los tipos de bloqueo que controlan el acceso concurrente a los datos
    ///   en el Advantage Database Server (ADS). La elecci�n del tipo de bloqueo impacta
    ///   c�mo m�ltiples usuarios pueden acceder y modificar los datos.
    /// </remarks>
    {$ELSE}
    /// <summary>
    ///   Enumeration of locking types supported by ADS.
    /// </summary>
    /// <remarks>
    ///   Defines the types of locks that control concurrent access to data in the
    ///   Advantage Database Server (ADS). The choice of lock type affects how multiple
    ///   users can access and modify data.
    /// </remarks>
    {$ENDIF}
  {$ENDIF}
  TADSLocking = EnumsHelpersUtils.TADSLocking;


{$SCOPEDENUMS OFF}

{$IFDEF PORTUGUES}
/// <summary>
///   Retorna uma conex�o configurada para o banco de dados ADS usando as configura��es atuais.
/// </summary>
/// <returns>
///   Uma inst�ncia de <c>TFDConnection</c> configurada para o banco de dados ADS.
/// </returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexi�n configurada para la base de datos ADS usando las configuraciones actuales.
  /// </summary>
  /// <returns>
  ///   Una instancia de <c>TFDConnection</c> configurada para la base de datos ADS.
  /// </returns>
  {$ELSE}
  /// <summary>
  ///   Returns a configured connection to the ADS database using the current settings.
  /// </summary>
  /// <returns>
  ///   A <c>TFDConnection</c> instance configured for the ADS database.
  /// </returns>
  {$ENDIF}
{$ENDIF}
function ADSConnection: TFDConnection;

{$IFDEF PORTUGUES}
/// <summary>
///   Aplica um par�metro de configura��o ao banco de dados ADS usando um valor gen�rico.
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
  ///   Aplica un par�metro de configuraci�n a la base de datos ADS usando un valor gen�rico.
  /// </summary>
  /// <param name="AParameter">
  ///   El par�metro de configuraci�n a aplicar.
  /// </param>
  /// <param name="Value">
  ///   El valor del par�metro como <c>TValue</c>.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Applies a configuration parameter to the ADS database using a generic value.
  /// </summary>
  /// <param name="AParameter">
  ///   The configuration parameter to be applied.
  /// </param>
  /// <param name="Value">
  ///   The parameter value as <c>TValue</c>.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter; const Value: TValue); overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Aplica um par�metro de tipo de servidor ao banco de dados ADS.
/// </summary>
/// <param name="AParameter">
///   O par�metro de configura��o a ser aplicado.
/// </param>
/// <param name="Value">
///   O valor do par�metro como <c>TADSServerType</c>.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Aplica un par�metro de tipo de servidor a la base de datos ADS.
  /// </summary>
  /// <param name="AParameter">
  ///   El par�metro de configuraci�n a aplicar.
  /// </param>
  /// <param name="Value">
  ///   El valor del par�metro como <c>TADSServerType</c>.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Applies a server type parameter to the ADS database.
  /// </summary>
  /// <param name="AParameter">
  ///   The configuration parameter to be applied.
  /// </param>
  /// <param name="Value">
  ///   The parameter value as <c>TADSServerType</c>.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter; const Value: TADSServerType); overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Aplica um par�metro de conjunto de caracteres ao banco de dados ADS.
/// </summary>
/// <param name="AParameter">
///   O par�metro de configura��o a ser aplicado.
/// </param>
/// <param name="Value">
///   O valor do par�metro como <c>TADSCharacterSet</c>.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Aplica un par�metro de conjunto de caracteres a la base de datos ADS.
  /// </summary>
  /// <param name="AParameter">
  ///   El par�metro de configuraci�n a aplicar.
  /// </param>
  /// <param name="Value">
  ///   El valor del par�metro como <c>TADSCharacterSet</c>.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Applies a character set parameter to the ADS database.
  /// </summary>
  /// <param name="AParameter">
  ///   The configuration parameter to be applied.
  /// </param>
  /// <param name="Value">
  ///   The parameter value as <c>TADSCharacterSet</c>.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter; const Value: TADSCharacterSet); overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Aplica um par�metro de protocolo ao banco de dados ADS.
/// </summary>
/// <param name="AParameter">
///   O par�metro de configura��o a ser aplicado.
/// </param>
/// <param name="Value">
///   O valor do par�metro como <c>TADSProtocol</c>.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Aplica un par�metro de protocolo a la base de datos ADS.
/// </summary>
/// <param name="AParameter">
///   El par�metro de configuraci�n a aplicar.
/// </param>
/// <param name="Value">
///   El valor del par�metro como <c>TADSProtocol</c>.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Applies a protocol parameter to the ADS database.
  /// </summary>
  /// <param name="AParameter">
  ///   The configuration parameter to be applied.
  /// </param>
  /// <param name="Value">
  ///   The parameter value as <c>TADSProtocol</c>.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter; const Value: TADSProtocol); overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Aplica um par�metro de tipo de tabela ao banco de dados ADS.
/// </summary>
/// <param name="AParameter">
///   O par�metro de configura��o a ser aplicado.
/// </param>
/// <param name="Value">
///   O valor do par�metro como <c>TADSTableType</c>.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Aplica un par�metro de tipo de tabla a la base de datos ADS.
/// </summary>
/// <param name="AParameter">
///   El par�metro de configuraci�n a aplicar.
/// </param>
/// <param name="Value">
///   El valor del par�metro como <c>TADSTableType</c>.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Applies a table type parameter to the ADS database.
  /// </summary>
  /// <param name="AParameter">
  ///   The configuration parameter to be applied.
  /// </param>
  /// <param name="Value">
  ///   The parameter value as <c>TADSTableType</c>.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter; const Value: TADSTableType); overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Aplica um par�metro de bloqueio ao banco de dados ADS.
/// </summary>
/// <param name="AParameter">
///   O par�metro de configura��o a ser aplicado.
/// </param>
/// <param name="Value">
///   O valor do par�metro como <c>TADSLocking</c>.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Aplica un par�metro de bloqueo a la base de datos ADS.
  /// </summary>
  /// <param name="AParameter">
  ///   El par�metro de configuraci�n a aplicar.
  /// </param>
  /// <param name="Value">
  ///   El valor del par�metro como <c>TADSLocking</c>.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Applies a locking parameter to the ADS database.
  /// </summary>
  /// <param name="AParameter">
  ///   The configuration parameter to be applied.
  /// </param>
  /// <param name="Value">
  ///   The parameter value as <c>TADSLocking</c>.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter; const Value: TADSLocking); overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Define o prefixo da conex�o para o banco de dados ADS.
/// </summary>
/// <param name="AValue">
///   O valor do prefixo.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece el prefijo de conexi�n para la base de datos ADS.
  /// </summary>
  /// <param name="AValue">
  ///   El valor del prefijo.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the connection prefix for the ADS database.
  /// </summary>
  /// <param name="AValue">
  ///   The prefix value.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetConnectionPrefix(const AValue: string);

{$IFDEF PORTUGUES}
/// <summary>
///   Define o caminho do banco de dados para o ADS.
/// </summary>
/// <param name="AValue">
///   O caminho do banco de dados.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Establece la ruta de la base de datos para ADS.
  /// </summary>
  /// <param name="AValue">
  ///   La ruta de la base de datos.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Sets the database path for ADS.
  /// </summary>
  /// <param name="AValue">
  ///   The database path.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure SetDatabase(const AValue: string);

{$IFDEF PORTUGUES}
/// <summary>
///   Middleware para integra��o com o Horse. Define a conex�o com o banco de dados ADS
///   para cada requisi��o HTTP.
/// </summary>
/// <param name="Req">
///   O objeto de requisi��o do Horse.
/// </param>
/// <param name="Res">
///   O objeto de resposta do Horse.
/// </param>
/// <param name="Next">
///   O procedimento a ser executado na sequ�ncia.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Middleware para integraci�n con Horse. Establece la conexi�n con la base de datos ADS
  ///   para cada solicitud HTTP.
  /// </summary>
  /// <param name="Req">
  ///   El objeto de solicitud de Horse.
  /// </param>
  /// <param name="Res">
  ///   El objeto de respuesta de Horse.
  /// </param>
  /// <param name="Next">
  ///   El procedimiento a ejecutar a continuaci�n.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Middleware for Horse integration. Sets the connection to the ADS database
  ///   for each HTTP request.
  /// </summary>
  /// <param name="Req">
  ///   The Horse request object.
  /// </param>
  /// <param name="Res">
  ///   The Horse response object.
  /// </param>
  /// <param name="Next">
  ///   The procedure to execute next.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure HorseConnectionADS(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

uses
  ADSDataBaseConnectionManager,
  ADSDataBaseConfigurationParameter;


var
  FConfiguration: TADSConfiguration;
  FDatabase: string;
  FConnectionPrefix: string;

function ADSConnection: TFDConnection;
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

procedure ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter;
  const Value: TValue);
begin
  DatabaseConfig(FConfiguration, AParameter, Value);
end;

procedure ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter;
  const Value: TADSServerType);
begin
  DatabaseConfig(FConfiguration, AParameter, Value);
end;

procedure ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter;
  const Value: TADSCharacterSet);
begin
  DatabaseConfig(FConfiguration, AParameter, Value);
end;

procedure ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter;
  const Value: TADSProtocol);
begin
  DatabaseConfig(FConfiguration, AParameter, Value);
end;

procedure ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter;
  const Value: TADSTableType);
begin
  DatabaseConfig(FConfiguration, AParameter, Value);
end;

procedure ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter;
  const Value: TADSLocking);
begin
  DatabaseConfig(FConfiguration, AParameter, Value);
end;

procedure HorseConnectionADS(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  Next;
end;

initialization

FConfiguration := TADSConfiguration.Default;

end.
