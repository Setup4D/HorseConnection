{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: SQLiteDatabaseConnectionManager                                 }
{                                                                       }
{ Descri��o:                                                            }
{   Esta unit fornece fun��es para gerenciar conex�es com o banco de    }
{   dados SQLite usando FireDAC. Permite a cria��o de conex�es          }
{   reutiliz�veis e personalizadas, al�m de gerenciar um pool de        }
{   conex�es e configurar a criptografia do banco de dados.             }
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
  { Unidad: SQLiteDatabaseConnectionManager                               }
  {                                                                       }
  { Descripci�n:                                                          }
  {   Esta unidad proporciona funciones para gestionar conexiones con     }
  {   la base de datos SQLite usando FireDAC. Permite la creaci�n de      }
  {   conexiones reutilizables y personalizadas, adem�s de gestionar      }
  {   un pool de conexiones y configurar la encriptaci�n de la base de    }
  {   datos.                                                              }
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
  { Unit: SQLiteDatabaseConnectionManager                                 }
  {                                                                       }
  { Description:                                                          }
  {   This unit provides functions for managing connections to the        }
  {   SQLite database using FireDAC. It allows the creation of reusable   }
  {   and custom connections, as well as managing a connection pool and   }
  {   setting up database encryption.                                     }
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
unit SQLiteDatabaseConnectionManager;
interface
uses
  EnumsHelpersUtils,
  Data.DB,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
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
///   Retorna uma conex�o com o banco de dados SQLite com base nas configura��es
///   fornecidas, no nome do banco de dados e no prefixo.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados SQLite.
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
  ///   Devuelve una conexi�n a la base de datos SQLite seg�n las configuraciones
  ///   proporcionadas, el nombre de la base de datos y el prefijo.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos SQLite.
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
  ///   Returns a connection to the SQLite database based on the provided
  ///   configuration, database name, and prefix.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The SQLite database configuration.
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
function GetConnection(const AConfiguration: TSQLiteConfiguration;
  const ADatabase: string; const APrefix: string): TFDConnection; overload;
{$IFDEF PORTUGUES}
/// <summary>
///   Retorna uma conex�o com o banco de dados SQLite com base nas configura��es
///   fornecidas e no prefixo.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados SQLite.
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
  ///   Devuelve una conexi�n a la base de datos SQLite seg�n las configuraciones
  ///   proporcionadas y el prefijo.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos SQLite.
  /// </param>
  /// <param name="APrefix">
  ///   El prefijo para identificar la conexi�n.
  /// </param>
  /// <returns>
  ///   Una instancia de <c>TFDConnection</c> configurada.
  /// </returns>
  {$ELSE}
  /// <summary>
  ///   Returns a connection to the SQLite database based on the provided
  ///   configuration and prefix.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The SQLite database configuration.
  /// </param>
  /// <param name="APrefix">
  ///   The prefix to identify the connection.
  /// </param>
  /// <returns>
  ///   A configured <c>TFDConnection</c> instance.
  /// </returns>
  {$ENDIF}
{$ENDIF}
function GetConnection(const AConfiguration: TSQLiteConfiguration;
  const APrefix: string): TFDConnection; overload;
{$IFDEF PORTUGUES}
/// <summary>
///   Retorna uma conex�o com o banco de dados SQLite com base apenas nas configura��es
///   fornecidas.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados SQLite.
/// </param>
/// <returns>
///   Uma inst�ncia de <c>TFDConnection</c> configurada.
/// </returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexi�n a la base de datos SQLite seg�n solo las configuraciones
  ///   proporcionadas.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos SQLite.
  /// </param>
  /// <returns>
  ///   Una instancia de <c>TFDConnection</c> configurada.
  /// </returns>
  {$ELSE}
  /// <summary>
  ///   Returns a connection to the SQLite database based only on the provided
  ///   configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The SQLite database configuration.
  /// </param>
  /// <returns>
  ///   A configured <c>TFDConnection</c> instance.
  /// </returns>
  {$ENDIF}
{$ENDIF}
function GetConnection(const AConfiguration: TSQLiteConfiguration): TFDConnection; overload;

implementation

uses
  SQLiteDatabaseConfigurationManager;

var
  FConnectionPool: TDictionary<string, TFDConnection>;
  FDConnection: TFDConnection;
  FDGUIxWaitCursor: TFDGUIxWaitCursor;
  FDDriver: TFDPhysSQLiteDriverLink;
  FDSQLiteSecurity: TFDSQLiteSecurity;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura uma conex�o com o banco de dados SQLite com base nas configura��es e par�metros fornecidos.
///   Inclui suporte para criptografia do banco de dados se configurado.
/// </summary>
/// <param name="AConfiguration">A configura��o do banco de dados SQLite.</param>
/// <param name="ADatabase">O nome do banco de dados.</param>
/// <param name="APrefix">O prefixo para identificar a conex�o.</param>
/// <param name="AConnection">A conex�o a ser configurada.</param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura una conexi�n con la base de datos SQLite seg�n las configuraciones y par�metros proporcionados.
  ///   Incluye soporte para la encriptaci�n de la base de datos si est� configurado.
  /// </summary>
  /// <param name="AConfiguration">La configuraci�n de la base de datos SQLite.</param>
  /// <param name="ADatabase">El nombre de la base de datos.</param>
  /// <param name="APrefix">El prefijo para identificar la conexi�n.</param>
  /// <param name="AConnection">La conexi�n a configurar.</param>
  {$ELSE}
  /// <summary>
  ///   Sets up a connection to the SQLite database based on the provided configurations and parameters.
  ///   Includes support for database encryption if configured.
  /// </summary>
  /// <param name="AConfiguration">The SQLite database configuration.</param>
  /// <param name="ADatabase">The database name.</param>
  /// <param name="APrefix">The prefix to identify the connection.</param>
  /// <param name="AConnection">The connection to be configured.</param>
  {$ENDIF}
{$ENDIF}
procedure SetupConnection(const AConfiguration: TSQLiteConfiguration;
  const ADatabase: string; const APrefix: string;
  var AConnection: TFDConnection);
begin
  Initialize(AConfiguration, ADatabase, APrefix);

  AConnection.ConnectionDefName := GetConnectionDef(APrefix);
  AConnection.LoginPrompt := False;

  FDGUIxWaitCursor := TFDGUIxWaitCursor.Create(AConnection);
  FDGUIxWaitCursor.Provider := 'Console';

  FDDriver := TFDPhysSQLiteDriverLink.Create(AConnection);

  if not(AConfiguration.Encrypt = TSQLiteEncryptType.No) then
  begin
    FDSQLiteSecurity := TFDSQLiteSecurity.Create(AConnection);
    FDSQLiteSecurity.Database := AConfiguration.Database;
    FDSQLiteSecurity.Password := AConfiguration.Encrypt.ToString + ':' +
      AConfiguration.Password;
    FDSQLiteSecurity.SetPassword;
  end;

  if not FileExists(IfThen(ADatabase.Trim.IsEmpty, AConfiguration.Database,
    ADatabase)) then
    raise Exception.CreateFmt({$IFDEF PORTUGUES}
                                'O banco de dados especificado "%s", n�o foi encontrado.'
                              {$ELSE}
                                {$IFDEF ESPANHOL}
                                  'No se encontr� la base de datos especificada "%s".'
                                {$ELSE}
                                  'The specified database "%s" was not found.'
                                {$ENDIF}
                              {$ENDIF}, [IfThen(ADatabase.Trim.IsEmpty,
                                                  AConfiguration.Database,
                                                  ADatabase)]);

  AConnection.Connected := True;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Retorna uma conex�o padr�o com o banco de dados SQLite.
///   Se uma conex�o padr�o j� existir, ela ser� retornada.
/// </summary>
/// <param name="AConfiguration">A configura��o do banco de dados SQLite.</param>
/// <param name="ADatabase">O nome do banco de dados.</param>
/// <param name="APrefix">O prefixo para identificar a conex�o.</param>
/// <returns>Uma inst�ncia de <c>TFDConnection</c> configurada.</returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexi�n predeterminada a la base de datos SQLite.
  ///   Si ya existe una conexi�n predeterminada, esta ser� devuelta.
  /// </summary>
  /// <param name="AConfiguration">La configuraci�n de la base de datos SQLite.</param>
  /// <param name="ADatabase">El nombre de la base de datos.</param>
  /// <param name="APrefix">El prefijo para identificar la conexi�n.</param>
  /// <returns>Una instancia configurada de <c>TFDConnection</c>.</returns>
  {$ELSE}
  /// <summary>
  ///   Returns a default connection to the SQLite database.
  ///   If a default connection already exists, it will be returned.
  /// </summary>
  /// <param name="AConfiguration">The SQLite database configuration.</param>
  /// <param name="ADatabase">The database name.</param>
  /// <param name="APrefix">The prefix to identify the connection.</param>
  /// <returns>A configured <c>TFDConnection</c> instance.</returns>
  {$ENDIF}
{$ENDIF}
function DefaultConnection(const AConfiguration: TSQLiteConfiguration;
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
///   Retorna uma conex�o personalizada com o banco de dados SQLite.
///   Se uma conex�o com o prefixo fornecido j� existir, ela ser� retornada.
/// </summary>
/// <param name="AConfiguration">A configura��o do banco de dados SQLite.</param>
/// <param name="ADatabase">O nome do banco de dados.</param>
/// <param name="APrefix">O prefixo para identificar a conex�o.</param>
/// <returns>Uma inst�ncia de <c>TFDConnection</c> configurada.</returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexi�n personalizada a la base de datos SQLite.
  ///   Si ya existe una conexi�n con el prefijo proporcionado, esta ser� devuelta.
  /// </summary>
  /// <param name="AConfiguration">La configuraci�n de la base de datos SQLite.</param>
  /// <param name="ADatabase">El nombre de la base de datos.</param>
  /// <param name="APrefix">El prefijo para identificar la conexi�n.</param>
  /// <returns>Una instancia configurada de <c>TFDConnection</c>.</returns>
  {$ELSE}
  /// <summary>
  ///   Returns a custom connection to the SQLite database.
  ///   If a connection with the provided prefix already exists, it will be returned.
  /// </summary>
  /// <param name="AConfiguration">The SQLite database configuration.</param>
  /// <param name="ADatabase">The database name.</param>
  /// <param name="APrefix">The prefix to identify the connection.</param>
  /// <returns>A configured <c>TFDConnection</c> instance.</returns>
  {$ENDIF}
{$ENDIF}
function CustomConnection(const AConfiguration: TSQLiteConfiguration;
  const ADatabase: string; const APrefix: string): TFDConnection;
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

function GetConnection(const AConfiguration: TSQLiteConfiguration;
  const ADatabase: string; const APrefix: string): TFDConnection;
begin
  case APrefix.Trim.IsEmpty of
    True:
      Result := DefaultConnection(AConfiguration, ADatabase, APrefix);
    False:
      Result := CustomConnection(AConfiguration, ADatabase, APrefix);
  end;
end;

function GetConnection(const AConfiguration: TSQLiteConfiguration;
  const APrefix: string): TFDConnection;
begin
  Result := GetConnection(AConfiguration, EmptyStr, APrefix);
end;

function GetConnection(const AConfiguration: TSQLiteConfiguration)
  : TFDConnection;
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
