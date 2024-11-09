{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: SQLiteDatabaseConfigurationManager                              }
{                                                                       }
{ Descri��o:                                                            }
{   Esta unit fornece fun��es para gerenciar configura��es de conex�o   }
{   com o banco de dados SQLite usando FireDAC. Permite criar           }
{   defini��es de conex�o reutiliz�veis e personalizadas.               }
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
  { Unidad: SQLiteDatabaseConfigurationManager                            }
  {                                                                       }
  { Descripci�n:                                                          }
  {   Esta unidad proporciona funciones para gestionar configuraciones    }
  {   de conexi�n con la base de datos SQLite usando FireDAC. Permite     }
  {   crear definiciones de conexi�n reutilizables y personalizadas.      }
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
  { Unit: SQLiteDatabaseConfigurationManager                              }
  {                                                                       }
  { Description:                                                          }
  {   This unit provides functions for managing SQLite database           }
  {   connection configurations using FireDAC. It allows creating         }
  {   reusable and custom connection definitions.                         }
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
unit SQLiteDatabaseConfigurationManager;
interface
uses
  EnumsHelpersUtils,
  FireDAC.Comp.Client,
  System.Classes,
  System.SysUtils,
  System.StrUtils;
{$IFDEF PORTUGUES}
/// <summary>
///   Inicializa a configura��o do FireDAC para o banco de dados SQLite com base nas
///   configura��es fornecidas, no nome do banco de dados e no prefixo.
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
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Inicializa la configuraci�n de FireDAC para la base de datos SQLite seg�n
  ///   las configuraciones proporcionadas, el nombre de la base de datos y el prefijo.
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
  {$ELSE}
  /// <summary>
  ///   Initializes the FireDAC configuration for the SQLite database based on the
  ///   provided settings, database name, and prefix.
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
  {$ENDIF}
{$ENDIF}
procedure Initialize(const AConfiguration: TSQLiteConfiguration;
  const ADatabase: string; const APrefix: string); overload;
{$IFDEF PORTUGUES}
/// <summary>
///   Inicializa a configura��o do FireDAC para o banco de dados SQLite com base nas
///   configura��es fornecidas e no prefixo.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados SQLite.
/// </param>
/// <param name="APrefix">
///   O prefixo para identificar a conex�o.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Inicializa la configuraci�n de FireDAC para la base de datos SQLite seg�n
  ///   las configuraciones proporcionadas y el prefijo.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos SQLite.
  /// </param>
  /// <param name="APrefix">
  ///   El prefijo para identificar la conexi�n.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Initializes the FireDAC configuration for the SQLite database based on the
  ///   provided settings and prefix.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The SQLite database configuration.
  /// </param>
  /// <param name="APrefix">
  ///   The prefix to identify the connection.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure Initialize(const AConfiguration: TSQLiteConfiguration;
  const APrefix: string); overload;
{$IFDEF PORTUGUES}
/// <summary>
///   Inicializa a configura��o do FireDAC para o banco de dados SQLite com base apenas
///   nas configura��es fornecidas.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados SQLite.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Inicializa la configuraci�n de FireDAC para la base de datos SQLite seg�n solo
  ///   las configuraciones proporcionadas.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos SQLite.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Initializes the FireDAC configuration for the SQLite database based only on
  ///   the provided settings.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The SQLite database configuration.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure Initialize(const AConfiguration: TSQLiteConfiguration); overload;
{$IFDEF PORTUGUES}
/// <summary>
///   Retorna o nome da defini��o de conex�o com base no prefixo fornecido.
/// </summary>
/// <param name="APrefix">
///   O prefixo para identificar a conex�o.
/// </param>
/// <returns>
///   O nome da defini��o de conex�o.
/// </returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve el nombre de la definici�n de conexi�n seg�n el prefijo proporcionado.
  /// </summary>
  /// <param name="APrefix">
  ///   El prefijo para identificar la conexi�n.
  /// </param>
  /// <returns>
  ///   El nombre de la definici�n de conexi�n.
  /// </returns>
  {$ELSE}
  /// <summary>
  ///   Returns the connection definition name based on the provided prefix.
  /// </summary>
  /// <param name="APrefix">
  ///   The prefix to identify the connection.
  /// </param>
  /// <returns>
  ///   The connection definition name.
  /// </returns>
  {$ENDIF}
{$ENDIF}
function GetConnectionDef(const APrefix: string): string; overload;
{$IFDEF PORTUGUES}
/// <summary>
///   Retorna o nome da defini��o de conex�o padr�o.
/// </summary>
/// <returns>
///   O nome da defini��o de conex�o padr�o.
/// </returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve el nombre de la definici�n de conexi�n predeterminada.
  /// </summary>
  /// <returns>
  ///   El nombre de la definici�n de conexi�n predeterminada.
  /// </returns>
  {$ELSE}
  /// <summary>
  ///   Returns the default connection definition name.
  /// </summary>
  /// <returns>
  ///   The default connection definition name.
  /// </returns>
  {$ENDIF}
{$ENDIF}
function GetConnectionDef: string; overload;

implementation

var
  FDManager: TFDManager;

Const
  _CONNECTION_DEF_NAME = 'DBConnectionSQLite';

function GetConnectionDef(const APrefix: string): string;
begin
  Result := _CONNECTION_DEF_NAME;

  if not APrefix.Trim.IsEmpty then
    Result := APrefix + '_' + Result;
end;

function GetConnectionDef: string;
begin
  Result := GetConnectionDef(EmptyStr);
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Cria uma lista de par�metros de conex�o para o banco de dados SQLite com base nas configura��es fornecidas.
/// </summary>
/// <param name="AConfiguration">A configura��o do banco de dados SQLite.</param>
/// <param name="ADatabase">O nome do banco de dados.</param>
/// <returns>Uma lista de strings contendo os par�metros de conex�o.</returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Crea una lista de par�metros de conexi�n para la base de datos SQLite seg�n las configuraciones proporcionadas.
  /// </summary>
  /// <param name="AConfiguration">La configuraci�n de la base de datos SQLite.</param>
  /// <param name="ADatabase">El nombre de la base de datos.</param>
  /// <returns>Una lista de cadenas que contiene los par�metros de conexi�n.</returns>
  {$ELSE}
  /// <summary>
  ///   Creates a list of connection parameters for the SQLite database based on the provided settings.
  /// </summary>
  /// <param name="AConfiguration">The SQLite database configuration.</param>
  /// <param name="ADatabase">The database name.</param>
  /// <returns>A string list containing the connection parameters.</returns>
  {$ENDIF}
{$ENDIF}
function CreateConnectionParameters(const AConfiguration: TSQLiteConfiguration;
  const ADatabase: string): TStrings;
begin
  Result := TStringList.Create;
  with Result do
  begin
    Values['DriverID'] := AConfiguration.DriverID;
    Values['Database'] := IfThen(ADatabase.Trim.IsEmpty,
      AConfiguration.Database, ADatabase);
    Values['User_Name'] := AConfiguration.UserName;
    Values['Password'] := AConfiguration.Password;
    Values['LockingMode'] := AConfiguration.LockingMode.ToString;
    Values['OpenMode'] := AConfiguration.OpenMode.ToString;
    Values['Encrypt'] := AConfiguration.Encrypt.ToString;
    Values['Pooled'] := IfThen(AConfiguration.Pooled, 'True', 'False');
    Values['POOL_MaximumItems'] := AConfiguration.PoolMaxItems.ToString;
    Values['POOL_ExpireTimeout'] := AConfiguration.PoolExpireTimeout.ToString;
    Values['POOL_CleanupTimeout'] := AConfiguration.PoolCleanupTimeout.ToString;
  end;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Garante que o gerenciador do FireDAC esteja inicializado.
/// </summary>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Asegura que el administrador de FireDAC est� inicializado.
  /// </summary>
  {$ELSE}
  /// <summary>
  ///   Ensures that the FireDAC manager is initialized.
  /// </summary>
  {$ENDIF}
{$ENDIF}
procedure EnsureFDManagerInitialized;
begin
  if not Assigned(FDManager) then
    FDManager := TFDManager.Create(nil);
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura o gerenciador do FireDAC com as op��es necess�rias.
/// </summary>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura el administrador de FireDAC con las opciones necesarias.
  /// </summary>
  {$ELSE}
  /// <summary>
  ///   Configures the FireDAC manager with the necessary options.
  /// </summary>
  {$ENDIF}
{$ENDIF}
procedure ConfigureFDManager;
begin
  FDManager.Active := False;
  FDManager.ResourceOptions.AutoReconnect := True;
end;

procedure Initialize(const AConfiguration: TSQLiteConfiguration;
  const ADatabase: string; const APrefix: string); overload;
var
  LParams: TStrings;
begin
  EnsureFDManagerInitialized;

  if FDManager.IsConnectionDef(GetConnectionDef(APrefix)) then
    Exit;

  ConfigureFDManager;

  LParams := CreateConnectionParameters(AConfiguration, ADatabase);
  try
    FDManager.AddConnectionDef(GetConnectionDef(APrefix),
      AConfiguration.DriverID, LParams);
  finally
    LParams.DisposeOf;
  end;

  FDManager.Active := True;
end;

procedure Initialize(const AConfiguration: TSQLiteConfiguration;
  const APrefix: string);
begin
  Initialize(AConfiguration, EmptyStr, APrefix);
end;

procedure Initialize(const AConfiguration: TSQLiteConfiguration);
begin
  Initialize(AConfiguration, EmptyStr);
end;

initialization

finalization

FDManager.Active := False;
FDManager.DisposeOf;

end.
