{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: FBDatabaseConnectionManager                                     }
{                                                                       }
{ Descrição:                                                            }
{   Esta unit fornece funções para gerenciar conexões com o banco de    }
{   dados Firebird usando FireDAC. Permite a criação de conexões        }
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
  { Unidad: FBDatabaseConnectionManager                                   }
  {                                                                       }
  { Descripción:                                                          }
  {   Esta unidad proporciona funciones para gestionar conexiones con     }
  {   la base de datos Firebird usando FireDAC. Permite la creación de    }
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
  { Unit: FBDatabaseConnectionManager                                     }
  {                                                                       }
  { Description:                                                          }
  {   This unit provides functions for managing connections to the        }
  {   Firebird database using FireDAC. It allows the creation of          }
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
unit FBDatabaseConnectionManager;

interface

uses
  EnumsHelpersUtils,
  Data.DB,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
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
///   Retorna uma conexão com o banco de dados Firebird com base nas configurações
///   fornecidas, no nome do banco de dados e no prefixo.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados Firebird.
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
  ///   Devuelve una conexión a la base de datos Firebird según las configuraciones
  ///   proporcionadas, el nombre de la base de datos y el prefijo.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos Firebird.
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
  ///   Returns a connection to the Firebird database based on the provided
  ///   configuration, database name, and prefix.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The Firebird database configuration.
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
function GetConnection(const AConfiguration: TFBConfiguration;
  const ADatabase: string; const APrefix: string): TFDConnection; overload;
{$IFDEF PORTUGUES}
/// <summary>
///   Retorna uma conexão com o banco de dados Firebird com base nas configurações
///   fornecidas e no prefixo.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados Firebird.
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
  ///   Devuelve una conexión a la base de datos Firebird según las configuraciones
  ///   proporcionadas y el prefijo.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos Firebird.
  /// </param>
  /// <param name="APrefix">
  ///   El prefijo para identificar la conexión.
  /// </param>
  /// <returns>
  ///   Una instancia de <c>TFDConnection</c> configurada.
  /// </returns>
  {$ELSE}
  /// <summary>
  ///   Returns a connection to the Firebird database based on the provided
  ///   configuration and prefix.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The Firebird database configuration.
  /// </param>
  /// <param name="APrefix">
  ///   The prefix to identify the connection.
  /// </param>
  /// <returns>
  ///   A configured <c>TFDConnection</c> instance.
  /// </returns>
  {$ENDIF}
{$ENDIF}
function GetConnection(const AConfiguration: TFBConfiguration;
  const APrefix: string): TFDConnection; overload;
{$IFDEF PORTUGUES}
/// <summary>
///   Retorna uma conexão com o banco de dados Firebird com base apenas nas configurações
///   fornecidas.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados Firebird.
/// </param>
/// <returns>
///   Uma instância de <c>TFDConnection</c> configurada.
/// </returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexión a la base de datos Firebird según solo las configuraciones
  ///   proporcionadas.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos Firebird.
  /// </param>
  /// <returns>
  ///   Una instancia de <c>TFDConnection</c> configurada.
  /// </returns>
  {$ELSE}
  /// <summary>
  ///   Returns a connection to the Firebird database based only on the provided
  ///   configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The Firebird database configuration.
  /// </param>
  /// <returns>
  ///   A configured <c>TFDConnection</c> instance.
  /// </returns>
  {$ENDIF}
{$ENDIF}
function GetConnection(const AConfiguration: TFBConfiguration): TFDConnection; overload;


implementation
uses
  FBDataBaseConfigurationManager;
var
  FConnectionPool: TDictionary<string, TFDConnection>;
  FDConnection: TFDConnection;
  FDGUIxWaitCursor: TFDGUIxWaitCursor;
  FDDriver: TFDPhysFBDriverLink;
{$IFDEF PORTUGUES}
/// <summary>
///   Configura uma conexão com o banco de dados Firebird com base nas configurações e parâmetros fornecidos.
/// </summary>
/// <param name="AConfiguration">A configuração do banco de dados Firebird.</param>
/// <param name="ADatabase">O nome do banco de dados.</param>
/// <param name="APrefix">O prefixo para identificar a conexão.</param>
/// <param name="AConnection">A conexão a ser configurada.</param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura una conexión con la base de datos Firebird según las configuraciones y parámetros proporcionados.
  /// </summary>
  /// <param name="AConfiguration">La configuración de la base de datos Firebird.</param>
  /// <param name="ADatabase">El nombre de la base de datos.</param>
  /// <param name="APrefix">El prefijo para identificar la conexión.</param>
  /// <param name="AConnection">La conexión a configurar.</param>
  {$ELSE}
  /// <summary>
  ///   Sets up a connection to the Firebird database based on the provided configurations and parameters.
  /// </summary>
  /// <param name="AConfiguration">The Firebird database configuration.</param>
  /// <param name="ADatabase">The database name.</param>
  /// <param name="APrefix">The prefix to identify the connection.</param>
  /// <param name="AConnection">The connection to be configured.</param>
  {$ENDIF}
{$ENDIF}
procedure SetupConnection(const AConfiguration: TFBConfiguration;
  const ADatabase: string; const APrefix: string; var AConnection: TFDConnection);
begin
  Initialize(AConfiguration, ADatabase, APrefix);
  AConnection.ConnectionDefName := GetConnectionDef(APrefix);
  AConnection.LoginPrompt := False;
  FDGUIxWaitCursor := TFDGUIxWaitCursor.Create(AConnection);
  FDGUIxWaitCursor.Provider := 'Console';
  FDDriver := TFDPhysFBDriverLink.Create(AConnection);
  AConnection.Connected := True;
end;
{$IFDEF PORTUGUES}
/// <summary>
///   Retorna uma conexão padrão com o banco de dados Firebird.
///   Se uma conexão padrão já existir, ela será retornada.
/// </summary>
/// <param name="AConfiguration">A configuração do banco de dados Firebird.</param>
/// <param name="ADatabase">O nome do banco de dados.</param>
/// <param name="APrefix">O prefixo para identificar a conexão.</param>
/// <returns>Uma instância de <c>TFDConnection</c> configurada.</returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexión predeterminada a la base de datos Firebird.
  ///   Si ya existe una conexión predeterminada, esta será devuelta.
  /// </summary>
  /// <param name="AConfiguration">La configuración de la base de datos Firebird.</param>
  /// <param name="ADatabase">El nombre de la base de datos.</param>
  /// <param name="APrefix">El prefijo para identificar la conexión.</param>
  /// <returns>Una instancia configurada de <c>TFDConnection</c>.</returns>
  {$ELSE}
  /// <summary>
  ///   Returns a default connection to the Firebird database.
  ///   If a default connection already exists, it will be returned.
  /// </summary>
  /// <param name="AConfiguration">The Firebird database configuration.</param>
  /// <param name="ADatabase">The database name.</param>
  /// <param name="APrefix">The prefix to identify the connection.</param>
  /// <returns>A configured <c>TFDConnection</c> instance.</returns>
  {$ENDIF}
{$ENDIF}
function DefaultConnection (const AConfiguration: TFBConfiguration;
  const ADatabase: string; const APrefix : string): TFDConnection;
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
///   Retorna uma conexão personalizada com o banco de dados Firebird.
///   Se uma conexão com o prefixo fornecido já existir, ela será retornada.
/// </summary>
/// <param name="AConfiguration">A configuração do banco de dados Firebird.</param>
/// <param name="ADatabase">O nome do banco de dados.</param>
/// <param name="APrefix">O prefixo para identificar a conexão.</param>
/// <returns>Uma instância de <c>TFDConnection</c> configurada.</returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexión personalizada a la base de datos Firebird.
  ///   Si ya existe una conexión con el prefijo proporcionado, esta será devuelta.
  /// </summary>
  /// <param name="AConfiguration">La configuración de la base de datos Firebird.</param>
  /// <param name="ADatabase">El nombre de la base de datos.</param>
  /// <param name="APrefix">El prefijo para identificar la conexión.</param>
  /// <returns>Una instancia configurada de <c>TFDConnection</c>.</returns>
  {$ELSE}
  /// <summary>
  ///   Returns a custom connection to the Firebird database.
  ///   If a connection with the provided prefix already exists, it will be returned.
  /// </summary>
  /// <param name="AConfiguration">The Firebird database configuration.</param>
  /// <param name="ADatabase">The database name.</param>
  /// <param name="APrefix">The prefix to identify the connection.</param>
  /// <returns>A configured <c>TFDConnection</c> instance.</returns>
  {$ENDIF}
{$ENDIF}
function CustomConnection  (const AConfiguration: TFBConfiguration;
  const ADatabase: string; const APrefix : string): TFDConnection;
var
  LIsConnectionExists : Boolean;
begin
  LIsConnectionExists := FConnectionPool.TryGetValue(APrefix, Result);
  if not LIsConnectionExists then
    Result := TFDConnection.Create(nil);

  SetupConnection(AConfiguration, ADatabase, APrefix, Result);

  if LIsConnectionExists then
    Exit;

  FConnectionPool.Add(APrefix, Result);
  FConnectionPool.TrimExcess;
end;

function GetConnection(const AConfiguration: TFBConfiguration;
  const ADatabase: string; const APrefix : string): TFDConnection;
begin
  case APrefix.Trim.IsEmpty of
    True  : Result := DefaultConnection(AConfiguration, ADatabase, APrefix);
    False : Result := CustomConnection(AConfiguration, ADatabase, APrefix);
  end;
end;
function GetConnection(const AConfiguration: TFBConfiguration;
  const APrefix : string): TFDConnection;
begin
  Result := GetConnection(AConfiguration, EmptyStr, APrefix);
end;
function GetConnection(const AConfiguration: TFBConfiguration): TFDConnection;
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


