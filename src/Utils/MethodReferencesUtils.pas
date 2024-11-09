{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: MethodReferencesUtils                                           }
{                                                                       }
{ Descrição:                                                            }
{   Esta unit define tipos de referência a métodos (procedimentos e     }
{   funções) para configurações de banco de dados e conexões.           }
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
  { Unidad: MethodReferencesUtils                                         }
  {                                                                       }
  { Descripción:                                                          }
  {   Esta unidad define tipos de referencia a métodos (procedimientos    }
  {   y funciones) para configuraciones de bases de datos y conexiones.   }
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
  { Unit: MethodReferencesUtils                                           }
  {                                                                       }
  { Description:                                                          }
  {   This unit defines method reference types (procedures and functions) }
  {   for database configurations and connections.                        }
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

unit MethodReferencesUtils;

interface

uses
  EnumsHelpersUtils,
  FireDAC.Comp.Client,
  System.Rtti;

{$IFDEF PORTUGUES}
/// <summary>
///   Referência para uma função que retorna uma conexão FireDAC.
/// </summary>
/// <returns>
///   Um objeto <see cref="TFDConnection"/> representando a conexão.
/// </returns>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Referencia a una función que devuelve una conexión FireDAC.
  /// </summary>
  /// <returns>
  ///   Un objeto <see cref="TFDConnection"/> que representa la conexión.
  /// </returns>
  {$ELSE}
  /// <summary>
  ///   Reference to a function that returns a FireDAC connection.
  /// </summary>
  /// <returns>
  ///   A <see cref="TFDConnection"/> object representing the connection.
  /// </returns>
  {$ENDIF}
{$ENDIF}
type
  TFunctionConnection = reference to function: TFDConnection;

{$IFDEF PORTUGUES}
/// <summary>
///   Procedimento de configuração genérico para um banco de dados.
/// </summary>
/// <typeparam name="T">
///   O tipo da configuração do banco de dados a ser modificado.
/// </typeparam>
/// <param name="AConfiguration">
///   A configuração do banco de dados do tipo <typeparamref name="T"/> a ser modificada.
/// </param>
/// <param name="AValue">
///   O valor a ser aplicado na configuração.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Procedimiento de configuración genérico para una base de datos.
/// </summary>
/// <typeparam name="T">
///   El tipo de configuración de la base de datos a modificar.
/// </typeparam>
/// <param name="AConfiguration">
///   La configuración de la base de datos del tipo <typeparamref name="T"/> a modificar.
/// </param>
/// <param name="AValue">
///   El valor a aplicar en la configuración.
/// </param>
  {$ELSE}
  /// <summary>
  ///   Generic configuration procedure for a database.
/// </summary>
/// <typeparam name="T">
///   The type of the database configuration to be modified.
/// </typeparam>
/// <param name="AConfiguration">
///   The database configuration of type <typeparamref name="T"/> to be modified.
/// </param>
/// <param name="AValue">
///   The value to be applied to the configuration.
/// </param>
  {$ENDIF}
{$ENDIF}
  TDatabaseConfigurator<T> = reference to procedure(var AConfiguration: T; const AValue: TValue);

implementation

end.

