{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: ADSDataBaseConnectionManager                                    }
{                                                                       }
{ Descri��o:                                                            }
{   Esta unit fornece fun��es para gerenciar conex�es com o banco de    }
{   dados Advantage Database Server (ADS) usando FireDAC. Permite a     }
{   cria��o de conex�es reutiliz�veis e personalizadas, bem como o      }
{   gerenciamento de um pool de conex�es.                               }
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
  { Unidad: ADSDataBaseConnectionManager                                  }
  {                                                                       }
  { Descripci�n:                                                          }
  {   Esta unidad proporciona funciones para gestionar conexiones con     }
  {   el servidor de base de datos Advantage Database Server (ADS) usando }
  {   FireDAC. Permite la creaci�n de conexiones reutilizables y          }
  {   personalizadas, as� como la gesti�n de un pool de conexiones.       }
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
  { Unit: ADSDataBaseConnectionManager                                    }
  {                                                                       }
  { Description:                                                          }
  {   This unit provides functions for managing connections to the        }
  {   Advantage Database Server (ADS) using FireDAC. It allows the        }
  {   creation of reusable and custom connections, as well as the         }
  {   management of a connection pool.                                    }
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

unit ADSDataBaseConnectionManager;

interface

uses
  EnumsHelpersUtils,
  Data.DB,
  FireDAC.Phys.ADS,
  FireDAC.Phys.ADSDef,
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
///   Retorna uma conex�o com o banco de dados Advantage Database Server (ADS) com base nas
///   configura��es fornecidas, no nome do banco de dados e no prefixo.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados ADS.
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
  ///   Devuelve una conexi�n a la base de datos Advantage Database Server (ADS) seg�n
  ///   las configuraciones proporcionadas, el nombre de la base de datos y el prefijo.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos ADS.
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
  ///   Returns a connection to the Advantage Database Server (ADS) based on the provided
  ///   configuration, database name, and prefix.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The ADS database configuration.
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
function GetConnection(const AConfiguration: TADSConfiguration;
  const ADatabase: string; const APrefix: string): TFDConnection; overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Retorna uma conex�o com o banco de dados ADS com base nas configura��es fornecidas
///   e no prefixo.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados ADS.
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
  ///   Devuelve una conexi�n a la base de datos ADS seg�n las configuraciones
  ///   proporcionadas y el prefijo.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos ADS.
  /// </param>
  /// <param name="APrefix">
  ///   El prefijo para identificar la conexi�n.
  /// </param>
  /// <returns>
  ///   Una instancia de <c>TFDConnection</c> configurada.
  /// </returns>
  {$ELSE}
  /// <summary>
  ///   Returns a connection to the ADS database based on the provided
  ///   configuration and prefix.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The ADS database configuration.
  /// </param>
  /// <param name="APrefix">
  ///   The prefix to identify the connection.
  /// </param>
  /// <returns>
  ///   A configured <c>TFDConnection</c> instance.
  /// </returns>
  {$ENDIF}
{$ENDIF}
function GetConnection(const AConfiguration: TADSConfiguration;
  const APrefix: string): TFDConnection; overload;

{$IFDEF PORTUGUES}
/// <summary>
///   Retorna uma conex�o com o banco de dados ADS com base apenas nas configura��es
///   fornecidas.
/// </summary>
/// <param name="AConfiguration">
///   A configura��o do banco de dados ADS.
/// </param>
/// <returns>
///   Uma inst�ncia de <c>TFDConnection</c> configurada.
/// </returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexi�n a la base de datos ADS seg�n solo las configuraciones
  ///   proporcionadas.
  /// </summary>
  /// <param name="AConfiguration">
  ///   La configuraci�n de la base de datos ADS.
  /// </param>
  /// <returns>
  ///   Una instancia de <c>TFDConnection</c> configurada.
  /// </returns>
  {$ELSE}
  /// <summary>
  ///   Returns a connection to the ADS database based only on the provided
  ///   configuration.
  /// </summary>
  /// <param name="AConfiguration">
  ///   The ADS database configuration.
  /// </param>
  /// <returns>
  ///   A configured <c>TFDConnection</c> instance.
  /// </returns>
  {$ENDIF}
{$ENDIF}
function GetConnection(const AConfiguration: TADSConfiguration): TFDConnection; overload;

implementation

uses
  ADSDatabaseConfigurationManager;

var
  FConnectionPool: TDictionary<string, TFDConnection>;
  FDConnection: TFDConnection;
  FDGUIxWaitCursor: TFDGUIxWaitCursor;
  FDDriver: TFDPhysADSDriverLink;

{$IFDEF PORTUGUES}
/// <summary>
///   Configura uma conex�o com o banco de dados ADS com base nas configura��es e par�metros fornecidos.
/// </summary>
/// <param name="AConfiguration">A configura��o do banco de dados ADS.</param>
/// <param name="ADatabase">O nome do banco de dados.</param>
/// <param name="APrefix">O prefixo para identificar a conex�o.</param>
/// <param name="AConnection">A conex�o a ser configurada.</param>
/// <exception cref="Exception">Lan�a uma exce��o se a DLL especificada em VendorLib n�o for encontrada.</exception>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Configura una conexi�n con la base de datos ADS seg�n las configuraciones y par�metros proporcionados.
  /// </summary>
  /// <param name="AConfiguration">La configuraci�n de la base de datos ADS.</param>
  /// <param name="ADatabase">El nombre de la base de datos.</param>
  /// <param name="APrefix">El prefijo para identificar la conexi�n.</param>
  /// <param name="AConnection">La conexi�n a configurar.</param>
  /// <exception cref="Exception">Lanza una excepci�n si no se encuentra la DLL especificada en VendorLib.</exception>
  {$ELSE}
  /// <summary>
  ///   Sets up a connection to the ADS database based on the provided configurations and parameters.
  /// </summary>
  /// <param name="AConfiguration">The ADS database configuration.</param>
  /// <param name="ADatabase">The database name.</param>
  /// <param name="APrefix">The prefix to identify the connection.</param>
  /// <param name="AConnection">The connection to be configured.</param>
  /// <exception cref="Exception">Throws an exception if the specified DLL in VendorLib is not found.</exception>
  {$ENDIF}
{$ENDIF}
procedure SetupConnection(const AConfiguration: TADSConfiguration;
  const ADatabase: string; const APrefix: string;
  var AConnection: TFDConnection);
begin
  Initialize(AConfiguration, ADatabase, APrefix);

  AConnection.ConnectionDefName := GetConnectionDef(APrefix);
  AConnection.LoginPrompt := False;

  FDGUIxWaitCursor := TFDGUIxWaitCursor.Create(AConnection);
  FDGUIxWaitCursor.Provider := 'Console';

  FDDriver := TFDPhysADSDriverLink.Create(AConnection);

  case ADatabase.Trim.IsEmpty of
    True:
      FDDriver.DefaultPath := AConfiguration.Database;
    False:
      FDDriver.DefaultPath := ADatabase;
  end;

  FDDriver.ShowDeleted := AConfiguration.ShowDelete;

  if not FileExists(AConfiguration.VendorLib) then
    raise Exception.CreateFmt({$IFDEF PORTUGUES}
                                'A DLL "%s" especificada em VendorLib n�o foi encontrada.'
                              {$ELSE}
                                {$IFDEF ESPANHOL}
                                  'No se ha encontrado la DLL "%s" especificada en VendorLib.'
                                {$ELSE}
                                  'The DLL "%s" specified in VendorLib was not found.'
                                {$ENDIF}
                              {$ENDIF}, [AConfiguration.VendorLib]);

  FDDriver.VendorLib := AConfiguration.VendorLib;
  AConnection.Connected := True;
end;

{$IFDEF PORTUGUES}
/// <summary>
///   Retorna uma conex�o padr�o com o banco de dados ADS.
///   Se uma conex�o padr�o j� existir, ela ser� retornada.
/// </summary>
/// <param name="AConfiguration">A configura��o do banco de dados ADS.</param>
/// <param name="ADatabase">O nome do banco de dados.</param>
/// <param name="APrefix">O prefixo para identificar a conex�o.</param>
/// <returns>Uma inst�ncia de <c>TFDConnection</c> configurada.</returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexi�n predeterminada a la base de datos ADS.
  ///   Si ya existe una conexi�n predeterminada, esta ser� devuelta.
  /// </summary>
  /// <param name="AConfiguration">La configuraci�n de la base de datos ADS.</param>
  /// <param name="ADatabase">El nombre de la base de datos.</param>
  /// <param name="APrefix">El prefijo para identificar la conexi�n.</param>
  /// <returns>Una instancia configurada de <c>TFDConnection</c>.</returns>
  {$ELSE}
  /// <summary>
  ///   Returns a default connection to the ADS database.
  ///   If a default connection already exists, it will be returned.
  /// </summary>
  /// <param name="AConfiguration">The ADS database configuration.</param>
  /// <param name="ADatabase">The database name.</param>
  /// <param name="APrefix">The prefix to identify the connection.</param>
  /// <returns>A configured <c>TFDConnection</c> instance.</returns>
  {$ENDIF}
{$ENDIF}
function DefaultConnection(const AConfiguration: TADSConfiguration;
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
///   Retorna uma conex�o personalizada com o banco de dados ADS.
///   Se uma conex�o com o prefixo fornecido j� existir, ela ser� retornada.
/// </summary>
/// <param name="AConfiguration">A configura��o do banco de dados ADS.</param>
/// <param name="ADatabase">O nome do banco de dados.</param>
/// <param name="APrefix">O prefixo para identificar a conex�o.</param>
/// <returns>Uma inst�ncia de <c>TFDConnection</c> configurada.</returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Devuelve una conexi�n personalizada a la base de datos ADS.
  ///   Si ya existe una conexi�n con el prefijo proporcionado, esta ser� devuelta.
  /// </summary>
  /// <param name="AConfiguration">La configuraci�n de la base de datos ADS.</param>
  /// <param name="ADatabase">El nombre de la base de datos.</param>
  /// <param name="APrefix">El prefijo para identificar la conexi�n.</param>
  /// <returns>Una instancia configurada de <c>TFDConnection</c>.</returns>
  {$ELSE}
  /// <summary>
  ///   Returns a custom connection to the ADS database.
  ///   If a connection with the provided prefix already exists, it will be returned.
  /// </summary>
  /// <param name="AConfiguration">The ADS database configuration.</param>
  /// <param name="ADatabase">The database name.</param>
  /// <param name="APrefix">The prefix to identify the connection.</param>
  /// <returns>A configured <c>TFDConnection</c> instance.</returns>
  {$ENDIF}
{$ENDIF}
function CustomConnection(const AConfiguration: TADSConfiguration;
  const ADatabase: string; const APrefix: string): TFDConnection;
begin
  if FConnectionPool.TryGetValue(APrefix, Result) then
    Exit;

  Result := TFDConnection.Create(nil);
  SetupConnection(AConfiguration, ADatabase, APrefix, Result);

  FConnectionPool.Add(APrefix, Result);
  FConnectionPool.TrimExcess;
end;

function GetConnection(const AConfiguration: TADSConfiguration;
  const ADatabase: string; const APrefix: string): TFDConnection;
begin
  case APrefix.Trim.IsEmpty of
    True:
      Result := DefaultConnection(AConfiguration, ADatabase, APrefix);
    False:
      Result := CustomConnection(AConfiguration, ADatabase, APrefix);
  end;
end;

function GetConnection(const AConfiguration: TADSConfiguration;
  const APrefix: string): TFDConnection;
begin
  Result := GetConnection(AConfiguration, EmptyStr, APrefix);
end;

function GetConnection(const AConfiguration: TADSConfiguration): TFDConnection;
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
