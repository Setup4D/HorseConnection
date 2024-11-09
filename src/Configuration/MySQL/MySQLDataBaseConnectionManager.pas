{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: MySQLDatabaseConnectionManager                                  }
{                                                                       }
{ Descrição:                                                            }
{   Esta unit fornece funções para gerenciar conexões com o banco de    }
{   dados MySQL usando FireDAC. Permite a criação de conexões           }
{   reutilizáveis e personalizadas, além de gerenciar um pool de        }
{   conexões.                                                           }
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
  { Unidad: MySQLDatabaseConnectionManager                                }
  {                                                                       }
  { Descripción:                                                          }
  {   Esta unidad proporciona funciones para gestionar conexiones con     }
  {   la base de datos MySQL usando FireDAC. Permite la creación de       }
  {   conexiones reutilizables y personalizadas, además de gestionar un   }
  {   pool de conexiones.                                                 }
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
  { Unit: MySQLDatabaseConnectionManager                                  }
  {                                                                       }
  { Description:                                                          }
  {   This unit provides functions for managing connections to the        }
  {   MySQL database using FireDAC. It allows the creation of             }
  {   reusable and custom connections, as well as the management of a     }
  {   connection pool.                                                    }
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

unit MySQLDatabaseConnectionManager;

interface

uses
  EnumsHelpersUtils,
  Data.DB,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef,
  FireDAC.DatS,
  FireDAC.DApt,
  FireDAC.Phys,
  FireDAC.Comp.UI,
  FireDAC.UI.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Intf,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.Comp.Client,
  FireDAC.Stan.Option,
  FireDAC.Comp.DataSet,
  FireDAC.ConsoleUI.Wait,
  FireDAC.Stan.ExprFuncs,
  System.SysUtils,
  System.StrUtils,
  System.Generics.Collections;

{$IFDEF PORTUGUES}
/// <summary>
///   Retorna uma conexão com o banco de dados MySQL com base nas configurações
///   fornecidas, no nome do banco de dados e no prefixo.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados MySQL.
/// </param>
/// <param name="ADatabase">
///   O nome do banco de dados.
/// </param>
/// <param name="APrefix">
///   O prefixo para identificar a conexão.
/// </param>
/// <returns>
///   Uma instância de <c>TFDConnection</c> configurada.
/// </returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexión a la base de datos MySQL según las configuraciones
  ///   proporcionadas, el nombre de la base de datos y el prefijo.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos MySQL.
  /// </param>
  /// <param name="ADatabase">
  ///   El nombre de la base de datos.
  /// </param>
  /// <param name="APrefix">
  ///   El prefijo para identificar la conexión.
  /// </param>
  /// <returns>
  ///   Una instancia de <c>TFDConnection</c> configurada.
  /// </returns>
  {$ELSE}
  /// <summary>
  ///   Returns a connection to the MySQL database based on the provided
  ///   configuration, database name, and prefix.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The MySQL database configuration.
  /// </param>
  /// <param name="ADatabase">
  ///   The database name.
  /// </param>
  /// <param name="APrefix">
  ///   The prefix to identify the connection.
  /// </param>
  /// <returns>
  ///   A configured <c>TFDConnection</c> instance.
  /// </returns>
  {$ENDIF}
{$ENDIF}
function GetConnection(const AConfiguration: TMySQLConfiguration;
  const ADatabase: string; const APrefix: string): TFDConnection; overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Retorna uma conexão com o banco de dados MySQL com base nas configurações
///   fornecidas e no prefixo.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados MySQL.
/// </param>
/// <param name="APrefix">
///   O prefixo para identificar a conexão.
/// </param>
/// <returns>
///   Uma instância de <c>TFDConnection</c> configurada.
/// </returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexión a la base de datos MySQL según las configuraciones
  ///   proporcionadas y el prefijo.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos MySQL.
  /// </param>
  /// <param name="APrefix">
  ///   El prefijo para identificar la conexión.
  /// </param>
  /// <returns>
  ///   Una instancia de <c>TFDConnection</c> configurada.
  /// </returns>
  {$ELSE}
  /// <summary>
  ///   Returns a connection to the MySQL database based on the provided
  ///   configuration and prefix.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The MySQL database configuration.
  /// </param>
  /// <param name="APrefix">
  ///   The prefix to identify the connection.
  /// </param>
  /// <returns>
  ///   A configured <c>TFDConnection</c> instance.
  /// </returns>
  {$ENDIF}
{$ENDIF}
function GetConnection(const AConfiguration: TMySQLConfiguration;
  const APrefix: string): TFDConnection; overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Retorna uma conexão com o banco de dados MySQL com base apenas nas configurações
///   fornecidas.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados MySQL.
/// </param>
/// <returns>
///   Uma instância de <c>TFDConnection</c> configurada.
/// </returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexión a la base de datos MySQL según solo las configuraciones
  ///   proporcionadas.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos MySQL.
  /// </param>
  /// <returns>
  ///   Una instancia de <c>TFDConnection</c> configurada.
  /// </returns>
  {$ELSE}
  /// <summary>
  ///   Returns a connection to the MySQL database based only on the provided
  ///   configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The MySQL database configuration.
  /// </param>
  /// <returns>
  ///   A configured <c>TFDConnection</c> instance.
  /// </returns>
    {$ENDIF}
{$ENDIF}
function GetConnection(const AConfiguration: TMySQLConfiguration): TFDConnection; overload;

implementation

uses
  MySQLDatabaseConfigurationManager;

var
  FConnectionPool: TDictionary<string, TFDConnection>;
  FDConnection: TFDConnection;
  FDGUIxWaitCursor: TFDGUIxWaitCursor;
  FDDriver: TFDPhysMySQLDriverLink;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura uma conexão com o banco de dados MySQL com base nas configurações e parâmetros fornecidos.
/// </summary>
/// <param name="AConfiguration">A configuração do banco de dados MySQL.</param>
/// <param name="ADatabase">O nome do banco de dados.</param>
/// <param name="APrefix">O prefixo para identificar a conexão.</param>
/// <param name="AConnection">A conexão a ser configurada.</param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura una conexión con la base de datos MySQL según las configuraciones y parámetros proporcionados.
  /// </summary>
  /// <param name="AConfiguration">La configuración de la base de datos MySQL.</param>
  /// <param name="ADatabase">El nombre de la base de datos.</param>
  /// <param name="APrefix">El prefijo para identificar la conexión.</param>
  /// <param name="AConnection">La conexión a configurar.</param>
  {$ELSE}
  /// <summary>
  ///   Sets up a connection to the MySQL database based on the provided configurations and parameters.
  /// </summary>
  /// <param name="AConfiguration">The MySQL database configuration.</param>
  /// <param name="ADatabase">The database name.</param>
  /// <param name="APrefix">The prefix to identify the connection.</param>
  /// <param name="AConnection">The connection to be configured.</param>
  {$ENDIF}
{$ENDIF}
procedure SetupConnection(const AConfiguration: TMySQLConfiguration;
  const ADatabase: string; const APrefix: string;
  var AConnection: TFDConnection);
begin
  Initialize(AConfiguration, ADatabase, APrefix);

  AConnection.ConnectionDefName := GetConnectionDef(APrefix);
  AConnection.LoginPrompt := False;

  FDGUIxWaitCursor := TFDGUIxWaitCursor.Create(AConnection);
  FDGUIxWaitCursor.Provider := 'Console';

  FDDriver := TFDPhysMySQLDriverLink.Create(AConnection);
  FDDriver.VendorLib := AConfiguration.VendorLib;

  AConnection.Connected := True;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Retorna uma conexão padrão com o banco de dados MySQL.
///   Se uma conexão padrão já existir, ela será retornada.
/// </summary>
/// <param name="AConfiguration">A configuração do banco de dados MySQL.</param>
/// <param name="ADatabase">O nome do banco de dados.</param>
/// <param name="APrefix">O prefixo para identificar a conexão.</param>
/// <returns>Uma instância de <c>TFDConnection</c> configurada.</returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexión predeterminada a la base de datos MySQL.
  ///   Si ya existe una conexión predeterminada, esta será devuelta.
  /// </summary>
  /// <param name="AConfiguration">La configuración de la base de datos MySQL.</param>
  /// <param name="ADatabase">El nombre de la base de datos.</param>
  /// <param name="APrefix">El prefijo para identificar la conexión.</param>
  /// <returns>Una instancia configurada de <c>TFDConnection</c>.</returns>
  {$ELSE}
  /// <summary>
  ///   Returns a default connection to the MySQL database.
  ///   If a default connection already exists, it will be returned.
  /// </summary>
  /// <param name="AConfiguration">The MySQL database configuration.</param>
  /// <param name="ADatabase">The database name.</param>
  /// <param name="APrefix">The prefix to identify the connection.</param>
  /// <returns>A configured <c>TFDConnection</c> instance.</returns>
  {$ENDIF}
{$ENDIF}
function DefaultConnection(const AConfiguration: TMySQLConfiguration;
  const ADatabase: string; const APrefix: string): TFDConnection;
begin
  if not Assigned(FDConnection) then
  begin
    FDConnection := TFDConnection.Create(nil);
    SetupConnection(AConfiguration, ADatabase, APrefix, FDConnection);
  end;

  Result := FDConnection;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Retorna uma conexão personalizada com o banco de dados MySQL.
///   Se uma conexão com o prefixo fornecido já existir, ela será retornada.
/// </summary>
/// <param name="AConfiguration">A configuração do banco de dados MySQL.</param>
/// <param name="ADatabase">O nome do banco de dados.</param>
/// <param name="APrefix">O prefixo para identificar a conexão.</param>
/// <returns>Uma instância de <c>TFDConnection</c> configurada.</returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexión personalizada a la base de datos MySQL.
  ///   Si ya existe una conexión con el prefijo proporcionado, esta será devuelta.
  /// </summary>
  /// <param name="AConfiguration">La configuración de la base de datos MySQL.</param>
  /// <param name="ADatabase">El nombre de la base de datos.</param>
  /// <param name="APrefix">El prefijo para identificar la conexión.</param>
  /// <returns>Una instancia configurada de <c>TFDConnection</c>.</returns>
  {$ELSE}
  /// <summary>
  ///   Returns a custom connection to the MySQL database.
  ///   If a connection with the provided prefix already exists, it will be returned.
  /// </summary>
  /// <param name="AConfiguration">The MySQL database configuration.</param>
  /// <param name="ADatabase">The database name.</param>
  /// <param name="APrefix">The prefix to identify the connection.</param>
  /// <returns>A configured <c>TFDConnection</c> instance.</returns>
  {$ENDIF}
{$ENDIF}
function CustomConnection(const AConfiguration: TMySQLConfiguration;
  const ADatabase: string; const APrefix: string): TFDConnection;
begin
  if FConnectionPool.TryGetValue(APrefix, Result) then
    Exit;

  Result := TFDConnection.Create(nil);
  SetupConnection(AConfiguration, ADatabase, APrefix, Result);

  FConnectionPool.Add(APrefix, Result);
  FConnectionPool.TrimExcess;
end;

function GetConnection(const AConfiguration: TMySQLConfiguration;
  const ADatabase: string; const APrefix: string): TFDConnection;
begin
  case APrefix.Trim.IsEmpty of
    True:
      Result := DefaultConnection(AConfiguration, ADatabase, APrefix);
    False:
      Result := CustomConnection(AConfiguration, ADatabase, APrefix);
  end;
end;

function GetConnection(const AConfiguration: TMySQLConfiguration;
  const APrefix: string): TFDConnection;
begin
  Result := GetConnection(AConfiguration, EmptyStr, APrefix);
end;

function GetConnection(const AConfiguration: TMySQLConfiguration): TFDConnection;
begin
  Result := GetConnection(AConfiguration, EmptyStr);
end;

initialization

FConnectionPool := TDictionary<string, TFDConnection>.Create;

finalization

if Assigned(FDConnection) then
  FDConnection.DisposeOf;

FConnectionPool.DisposeOf;

end.

