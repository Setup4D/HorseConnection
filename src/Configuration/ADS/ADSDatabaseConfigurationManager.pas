{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: ADSDatabaseConfigurationManager                                 }
{                                                                       }
{ Descri��o:                                                            }
{   Esta unit fornece fun��es e procedimentos para configurar e         }
{   inicializar uma conex�o com um banco de dados ADS (Advantage        }
{   Database Server) usando o FireDAC (FDConnection).                   }
{   Permite definir par�metros de conex�o, prefixos personalizados      }
{   e gerenciar a defini��o de conex�es dentro do FireDAC Manager.      }
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
  { Unidad: ADSDatabaseConfigurationManager                               }
  {                                                                       }
  { Descripci�n:                                                          }
  {   Esta unidad proporciona funciones y procedimientos para configurar  }
  {   e inicializar una conexi�n con una base de datos ADS (Advantage     }
  {   Database Server) utilizando FireDAC (FDConnection).                 }
  {   Permite definir par�metros de conexi�n, prefijos personalizados     }
  {   y gestionar la definici�n de conexiones dentro del FireDAC Manager. }
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
  { Unit: ADSDatabaseConfigurationManager                                 }
  {                                                                       }
  { Description:                                                          }
  {   This unit provides functions and procedures for configuring and     }
  {   initializing a connection to an ADS (Advantage Database Server)     }
  {   database using FireDAC (FDConnection). It allows setting connection }
  {   parameters, custom prefixes, and managing connection definitions    }
  {   within the FireDAC Manager.                                         }
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

unit ADSDatabaseConfigurationManager;

interface

uses
  EnumsHelpersUtils,
  FireDAC.Comp.Client,
  System.Classes,
  System.SysUtils,
  System.StrUtils;

{$IFDEF PORTUGUES}
/// <summary>
///   Inicializa uma conex�o com o banco de dados ADS utilizando as configura��es especificadas,
///   um nome de banco de dados personalizado e um prefixo.
/// </summary>
/// <param name="AConfiguration">
///   As configura��es de conex�o ADS.
/// </param>
/// <param name="ADatabase">
///   O nome personalizado do banco de dados.
/// </param>
/// <param name="APrefix">
///   O prefixo para a defini��o da conex�o no FireDAC Manager.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Inicializa una conexi�n con la base de datos ADS utilizando las configuraciones especificadas,
  ///   un nombre de base de datos personalizado y un prefijo.
  /// </summary>
  /// <param name="AConfiguration">
  ///   Las configuraciones de conexi�n ADS.
  /// </param>
  /// <param name="ADatabase">
  ///   El nombre personalizado de la base de datos.
  /// </param>
  /// <param name="APrefix">
  ///   El prefijo para la definici�n de la conexi�n en el FireDAC Manager.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Initializes a connection to the ADS database using the specified configuration,
  ///   a custom database name, and a prefix.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The ADS connection configuration.
  /// </param>
  /// <param name="ADatabase">
  ///   The custom database name.
  /// </param>
  /// <param name="APrefix">
  ///   The prefix for the connection definition in the FireDAC Manager.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure Initialize(const AConfiguration: TADSConfiguration; const ADatabase: string; const APrefix: string); overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Inicializa uma conex�o com o banco de dados ADS utilizando as configura��es especificadas
///   e um prefixo personalizado.
/// </summary>
/// <param name="AConfiguration">
///   As configura��es de conex�o ADS.
/// </param>
/// <param name="APrefix">
///   O prefixo para a defini��o da conex�o no FireDAC Manager.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Inicializa una conexi�n con la base de datos ADS utilizando las configuraciones especificadas
  ///   y un prefijo personalizado.
  /// </summary>
  /// <param name="AConfiguration">
  ///   Las configuraciones de conexi�n ADS.
  /// </param>
  /// <param name="APrefix">
  ///   El prefijo para la definici�n de la conexi�n en el FireDAC Manager.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Initializes a connection to the ADS database using the specified configuration
  ///   and a custom prefix.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The ADS connection configuration.
  /// </param>
  /// <param name="APrefix">
  ///   The prefix for the connection definition in the FireDAC Manager.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure Initialize(const AConfiguration: TADSConfiguration; const APrefix: string); overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Inicializa uma conex�o com o banco de dados ADS utilizando apenas as configura��es especificadas.
/// </summary>
/// <param name="AConfiguration">
///   As configura��es de conex�o ADS.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Inicializa una conexi�n con la base de datos ADS utilizando solo las configuraciones especificadas.
  /// </summary>
  /// <param name="AConfiguration">
  ///   Las configuraciones de conexi�n ADS.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Initializes a connection to the ADS database using only the specified configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The ADS connection configuration.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure Initialize(const AConfiguration: TADSConfiguration); overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Retorna o nome da defini��o de conex�o no FireDAC Manager com um prefixo personalizado.
/// </summary>
/// <param name="APrefix">
///   O prefixo a ser usado para a defini��o de conex�o.
/// </param>
/// <returns>
///   O nome da defini��o de conex�o com o prefixo.
/// </returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve el nombre de la definici�n de conexi�n en el FireDAC Manager con un prefijo personalizado.
  /// </summary>
  /// <param name="APrefix">
  ///   El prefijo a utilizar para la definici�n de conexi�n.
  /// </param>
  /// <returns>
  ///   El nombre de la definici�n de conexi�n con el prefijo.
  /// </returns>
  {$ELSE}
  /// <summary>
  ///   Returns the connection definition name in the FireDAC Manager with a custom prefix.
  /// </summary>
  /// <param name="APrefix">
  ///   The prefix to be used for the connection definition.
  /// </param>
  /// <returns>
  ///   The connection definition name with the prefix.
  /// </returns>
  {$ENDIF}
{$ENDIF}
function GetConnectionDef(const APrefix: string): string; overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Retorna o nome da defini��o de conex�o padr�o no FireDAC Manager.
/// </summary>
/// <returns>
///   O nome da defini��o de conex�o padr�o.
/// </returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve el nombre de la definici�n de conexi�n predeterminada en el FireDAC Manager.
  /// </summary>
  /// <returns>
  ///   El nombre de la definici�n de conexi�n predeterminada.
  /// </returns>
  {$ELSE}
  /// <summary>
  ///   Returns the default connection definition name in the FireDAC Manager.
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

const
  _CONNECTION_DEF_NAME = 'DBConnectionADS';

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
///   Cria uma lista de par�metros de conex�o para o banco de dados ADS com base nas configura��es fornecidas.
/// </summary>
/// <param name="AConfiguration">A configura��o do banco de dados ADS.</param>
/// <param name="ADatabase">O nome do banco de dados.</param>
/// <returns>Uma lista de strings contendo os par�metros de conex�o.</returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Crea una lista de par�metros de conexi�n para la base de datos ADS seg�n las configuraciones proporcionadas.
/// </summary>
/// <param name="AConfiguration">La configuraci�n de la base de datos ADS.</param>
/// <param name="ADatabase">El nombre de la base de datos.</param>
/// <returns>Una lista de cadenas que contiene los par�metros de conexi�n.</returns>
  {$ELSE}
  /// <summary>
  ///   Creates a list of connection parameters for the ADS database based on the provided settings.
/// </summary>
/// <param name="AConfiguration">The ADS database configuration.</param>
/// <param name="ADatabase">The database name.</param>
/// <returns>A string list containing the connection parameters.</returns>
  {$ENDIF}
{$ENDIF}
function CreateConnectionParameters(const AConfiguration: TADSConfiguration; const ADatabase: string): TStrings;
begin
  Result := TStringList.Create;
  with Result do
  begin
    Values['DriverID'] := AConfiguration.DriverID;
    Values['User_Name'] := AConfiguration.UserName;
    Values['Password'] := AConfiguration.Password;
    Values['Database'] := IfThen(ADatabase.Trim.IsEmpty, AConfiguration.Database, ADatabase);
    Values['Pooled'] := IfThen(AConfiguration.Pooled, 'True', 'False');
    Values['POOL_MaximumItems'] := AConfiguration.PoolMaxItems.ToString;
    Values['POOL_ExpireTimeout'] := AConfiguration.PoolExpireTimeout.ToString;
    Values['POOL_CleanupTimeout'] := AConfiguration.PoolCleanupTimeout.ToString;
    Values['CharacterSet'] := AConfiguration.CharacterSet.ToString;
    Values['ServerTypes'] := AConfiguration.ServerType.ToString;
    Values['Protocol'] := AConfiguration.Protocol.ToString;
    Values['TableType'] := AConfiguration.TableType.ToString;
    Values['Locking'] := AConfiguration.Locking.ToString;
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

procedure Initialize(const AConfiguration: TADSConfiguration;
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
    FDManager.AddConnectionDef(GetConnectionDef(APrefix), AConfiguration.DriverID, LParams);
  finally
    LParams.DisposeOf;
  end;

  FDManager.Active := True;
end;

procedure Initialize(const AConfiguration: TADSConfiguration;
  const APrefix: string);
begin
  Initialize(AConfiguration, EmptyStr, APrefix);
end;

procedure Initialize(const AConfiguration: TADSConfiguration);
begin
  Initialize(AConfiguration, EmptyStr);
end;

initialization

finalization
  FDManager.Active := False;
  FDManager.DisposeOf;

end.

