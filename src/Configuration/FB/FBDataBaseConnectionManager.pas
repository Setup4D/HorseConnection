{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: FBDatabaseConnectionManager                                     }
{                                                                       }
{ Descri��o:                                                            }
{   Esta unit fornece fun��es para gerenciar conex�es com o banco de    }
{   dados Firebird usando FireDAC. Permite a cria��o de conex�es        }
{   reutiliz�veis e personalizadas, al�m de gerenciar um pool de        }
{   conex�es.                                                           }
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
  { Descripci�n:                                                          }
  {   Esta unidad proporciona funciones para gestionar conexiones con     }
  {   la base de datos Firebird usando FireDAC. Permite la creaci�n de    }
  {   conexiones reutilizables y personalizadas, adem�s de gestionar un   }
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
///   Retorna uma conex�o com o banco de dados Firebird com base nas configura��es
///   fornecidas, no nome do banco de dados e no prefixo.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados Firebird.
/// </param>
/// <param name="ADatabase">
///   O nome do banco de dados.
/// </param>
/// <param name="APrefix">
///   O prefixo para identificar a conex�o.
/// </param>
/// <returns>
///   Uma inst�ncia de <c>TFDConnection</c> configurada.
/// </returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexi�n a la base de datos Firebird seg�n las configuraciones
  ///   proporcionadas, el nombre de la base de datos y el prefijo.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos Firebird.
  /// </param>
  /// <param name="ADatabase">
  ///   El nombre de la base de datos.
  /// </param>
  /// <param name="APrefix">
  ///   El prefijo para identificar la conexi�n.
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
///   Retorna uma conex�o com o banco de dados Firebird com base nas configura��es
///   fornecidas e no prefixo.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados Firebird.
/// </param>
/// <param name="APrefix">
///   O prefixo para identificar a conex�o.
/// </param>
/// <returns>
///   Uma inst�ncia de <c>TFDConnection</c> configurada.
/// </returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexi�n a la base de datos Firebird seg�n las configuraciones
  ///   proporcionadas y el prefijo.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos Firebird.
  /// </param>
  /// <param name="APrefix">
  ///   El prefijo para identificar la conexi�n.
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
///   Retorna uma conex�o com o banco de dados Firebird com base apenas nas configura��es
///   fornecidas.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados Firebird.
/// </param>
/// <returns>
///   Uma inst�ncia de <c>TFDConnection</c> configurada.
/// </returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexi�n a la base de datos Firebird seg�n solo las configuraciones
  ///   proporcionadas.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos Firebird.
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
///   Configura uma conex�o com o banco de dados Firebird com base nas configura��es e par�metros fornecidos.
/// </summary>
/// <param name="AConfiguration">A configura��o do banco de dados Firebird.</param>
/// <param name="ADatabase">O nome do banco de dados.</param>
/// <param name="APrefix">O prefixo para identificar a conex�o.</param>
/// <param name="AConnection">A conex�o a ser configurada.</param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura una conexi�n con la base de datos Firebird seg�n las configuraciones y par�metros proporcionados.
  /// </summary>
  /// <param name="AConfiguration">La configuraci�n de la base de datos Firebird.</param>
  /// <param name="ADatabase">El nombre de la base de datos.</param>
  /// <param name="APrefix">El prefijo para identificar la conexi�n.</param>
  /// <param name="AConnection">La conexi�n a configurar.</param>
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
///   Retorna uma conex�o padr�o com o banco de dados Firebird.
///   Se uma conex�o padr�o j� existir, ela ser� retornada.
/// </summary>
/// <param name="AConfiguration">A configura��o do banco de dados Firebird.</param>
/// <param name="ADatabase">O nome do banco de dados.</param>
/// <param name="APrefix">O prefixo para identificar a conex�o.</param>
/// <returns>Uma inst�ncia de <c>TFDConnection</c> configurada.</returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexi�n predeterminada a la base de datos Firebird.
  ///   Si ya existe una conexi�n predeterminada, esta ser� devuelta.
  /// </summary>
  /// <param name="AConfiguration">La configuraci�n de la base de datos Firebird.</param>
  /// <param name="ADatabase">El nombre de la base de datos.</param>
  /// <param name="APrefix">El prefijo para identificar la conexi�n.</param>
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
///   Retorna uma conex�o personalizada com o banco de dados Firebird.
///   Se uma conex�o com o prefixo fornecido j� existir, ela ser� retornada.
/// </summary>
/// <param name="AConfiguration">A configura��o do banco de dados Firebird.</param>
/// <param name="ADatabase">O nome do banco de dados.</param>
/// <param name="APrefix">O prefixo para identificar a conex�o.</param>
/// <returns>Uma inst�ncia de <c>TFDConnection</c> configurada.</returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexi�n personalizada a la base de datos Firebird.
  ///   Si ya existe una conexi�n con el prefijo proporcionado, esta ser� devuelta.
  /// </summary>
  /// <param name="AConfiguration">La configuraci�n de la base de datos Firebird.</param>
  /// <param name="ADatabase">El nombre de la base de datos.</param>
  /// <param name="APrefix">El prefijo para identificar la conexi�n.</param>
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


