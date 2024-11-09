{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: FBDatabaseConfigurationManager                                  }
{                                                                       }
{ Descrição:                                                            }
{   Esta unit fornece funções para gerenciar configurações de conexão   }
{   com o banco de dados Firebird usando FireDAC. Permite a criação de  }
{   definições de conexão reutilizáveis e personalizadas.               }
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
  { Unidad: FBDatabaseConfigurationManager                                }
  {                                                                       }
  { Descripción:                                                          }
  {   Esta unidad proporciona funciones para gestionar configuraciones    }
  {   de conexión con la base de datos Firebird usando FireDAC. Permite   }
  {   crear definiciones de conexión reutilizables y personalizadas.      }
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
  { Unit: FBDatabaseConfigurationManager                                  }
  {                                                                       }
  { Description:                                                          }
  {   This unit provides functions for managing Firebird database         }
  {   connection configurations using FireDAC. It allows the creation     }
  {   of reusable and custom connection definitions.                      }
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
unit FBDatabaseConfigurationManager;
interface
uses
  EnumsHelpersUtils,
  FireDAC.Comp.Client,
  System.Classes,
  System.SysUtils,
  System.StrUtils;
{$IFDEF PORTUGUES}
/// <summary>
///   Inicializa a configuração do FireDAC para o banco de dados Firebird com base nas
///   configurações fornecidas, no nome do banco de dados e no prefixo.
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
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Inicializa la configuración de FireDAC para la base de datos Firebird según
  ///   las configuraciones proporcionadas, el nombre de la base de datos y el prefijo.
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
  {$ELSE}
  /// <summary>
  ///   Initializes the FireDAC configuration for the Firebird database based on the
  ///   provided settings, database name, and prefix.
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
  {$ENDIF}
{$ENDIF}
procedure Initialize(const AConfiguration: TFBConfiguration;
  const ADatabase: string; const APrefix: string); overload;
{$IFDEF PORTUGUES}
/// <summary>
///   Inicializa a configuração do FireDAC para o banco de dados Firebird com base nas
///   configurações fornecidas e no prefixo.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados Firebird.
/// </param>
/// <param name="APrefix">
///   O prefixo para identificar a conexão.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Inicializa la configuración de FireDAC para la base de datos Firebird según
  ///   las configuraciones proporcionadas y el prefijo.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuración de la base de datos Firebird.
  /// </param>
  /// <param name="APrefix">
  ///   El prefijo para identificar la conexión.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Initializes the FireDAC configuration for the Firebird database based on the
  ///   provided settings and prefix.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The Firebird database configuration.
  /// </param>
  /// <param name="APrefix">
  ///   The prefix to identify the connection.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure Initialize(const AConfiguration: TFBConfiguration;
  const APrefix: string); overload;
{$IFDEF PORTUGUES}
/// <summary>
///   Inicializa a configuração do FireDAC para o banco de dados Firebird com base apenas
///   nas configurações fornecidas.
/// </summary>
/// <param name="AConfiguration">
///   A configuração do banco de dados Firebird.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Inicializa la configuración de FireDAC para la base de datos Firebird según solo
  ///   las configuraciones proporcionadas.
/// </summary>
/// <param name="AConfiguration">
///   La configuración de la base de datos Firebird.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Initializes the FireDAC configuration for the Firebird database based only on
  ///   the provided settings.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The Firebird database configuration.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure Initialize(const AConfiguration: TFBConfiguration); overload;
{$IFDEF PORTUGUES}
/// <summary>
///   Retorna o nome da definição de conexão com base no prefixo fornecido.
/// </summary>
/// <param name="APrefix">
///   O prefixo para identificar a conexão.
/// </param>
/// <returns>
///   O nome da definição de conexão.
/// </returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve el nombre de la definición de conexión según el prefijo proporcionado.
/// </summary>
/// <param name="APrefix">
///   El prefijo para identificar la conexión.
/// </param>
/// <returns>
///   El nombre de la definición de conexión.
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
///   Retorna o nome da definição de conexão padrão.
/// </summary>
/// <returns>
///   O nome da definição de conexão padrão.
/// </returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve el nombre de la definición de conexión predeterminada.
  /// </summary>
  /// <returns>
  ///   El nombre de la definición de conexión predeterminada.
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
  _CONNECTION_DEF_NAME = 'DBConnectionFB';

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
///   Cria uma lista de parâmetros de conexão para o banco de dados Firebird com base nas configurações fornecidas.
/// </summary>
/// <param name="AConfiguration">A configuração do banco de dados Firebird.</param>
/// <param name="ADatabase">O nome do banco de dados.</param>
/// <returns>Uma lista de strings contendo os parâmetros de conexão.</returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Crea una lista de parámetros de conexión para la base de datos Firebird según las configuraciones proporcionadas.
/// </summary>
/// <param name="AConfiguration">La configuración de la base de datos Firebird.</param>
/// <param name="ADatabase">El nombre de la base de datos.</param>
/// <returns>Una lista de cadenas que contiene los parámetros de conexión.</returns>
  {$ELSE}
  /// <summary>
  ///   Creates a list of connection parameters for the Firebird database based on the provided settings.
/// </summary>
/// <param name="AConfiguration">The Firebird database configuration.</param>
/// <param name="ADatabase">The database name.</param>
/// <returns>A string list containing the connection parameters.</returns>
  {$ENDIF}
{$ENDIF}

function CreateConnectionParameters(const AConfiguration: TFBConfiguration;
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
    Values['Protocol'] := AConfiguration.Protocol.ToString;
    Values['Server'] := AConfiguration.Server;
    Values['Port'] := AConfiguration.Port.ToString;
    Values['CharacterSet'] := AConfiguration.CharacterSet.ToString;
    Values['SQLDialect'] := '3';
    Values['MetaDefSchema'] := 'PUBLIC';
    Values['OpenMode'] := AConfiguration.OpenMode.ToString;
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
  ///   Asegura que el administrador de FireDAC esté inicializado.
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
///   Configura o gerenciador do FireDAC com as opções necessárias.
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

procedure Initialize(const AConfiguration: TFBConfiguration;
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

procedure Initialize(const AConfiguration: TFBConfiguration;
  const APrefix: string);
begin
  Initialize(AConfiguration, EmptyStr, APrefix);
end;

procedure Initialize(const AConfiguration: TFBConfiguration);
begin
  Initialize(AConfiguration, EmptyStr);
end;

initialization

finalization

FDManager.Active := False;
FDManager.DisposeOf;

end.

