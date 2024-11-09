{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: Horse.Connection                                                }
{                                                                       }
{ Descrição:                                                            }
{   Esta unit fornece funções para gerenciar conexões com bancos de     }
{   dados utilizando FireDAC no middleware Horse. O HorseConnection     }
{   permite a liberação de conexões FireDAC ou instâncias de TFDQuery,  }
{   centralizando a lógica de conexão e facilitando o gerenciamento     }
{   eficiente das conexões dentro das rotas do middleware.              }
{                                                                       }
{ Propósito do Middleware:                                              }
{   O middleware HorseConnection tem como objetivo encapsular a lógica  }
{   de conexão com bancos de dados, promovendo uma gestão centralizada  }
{   e reutilizável das conexões FireDAC, reduzindo código repetitivo e  }
{   prevenindo vazamentos de conexões em aplicações que fazem uso       }
{   intensivo de bancos de dados.                                       }
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
  { Unidad: Horse.Connection                                              }
  {                                                                       }
  { Descripción:                                                          }
  {   Esta unidad proporciona funciones para gestionar conexiones a la    }
  {   base de datos utilizando FireDAC en el middleware Horse.            }
  {   HorseConnectionpermite la liberación de conexiones FireDAC o        }
  {   instancias de TFDQuery, centralizando la lógica de conexión y       }
  {   facilitando la gestión        eficiente de las conexiones dentro de }
  {   las rutas del middleware.                                           }
  {                                                                       }
  { Propósito del Middleware:                                             }
  {   El middleware HorseConnection tiene como objetivo encapsular la     }
  {   lógica de conexión con bases de datos, promoviendo una gestión      }
  {   centralizada y reutilizable de las conexiones FireDAC, reduciendo   }
  {   código repetitivoy previniendo fugas de conexiones en aplicaciones  }
  {   que hacen uso intensivo de bases de datos.                          }
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
  { Unit: Horse.Connection                                                }
  {                                                                       }
  { Description:                                                          }
  {   This unit provides functions for managing database connections using}
  {   FireDAC in the Horse middleware. HorseConnection allows for the     }
  {   release of FireDAC connections or instances of TFDQuery,            }
  {   centralizing connection logic and facilitating efficient management }
  {   of connections within middleware routes.                            }
  {                                                                       }
  { Middleware Purpose:                                                   }
  {   The HorseConnection middleware aims to encapsulate database         }
  {   connectionlogic, promoting centralized and reusable management of   }
  {   FireDAC connections, reducing repetitive code, and preventing       }
  {   connectionleaks in applications that make intensive use of          }
  {   databases.                                                          }
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

unit Horse.Connection;

interface

uses
  Horse,
  FireDAC.Comp.Client,
  EnumsHelpersUtils;
type
  {$SCOPEDENUMS ON}
  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Define os tipos de conexão suportados pelo sistema.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Define los tipos de conexión soportados por el sistema.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Defines the connection types supported by the system.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TConnectionType = EnumsHelpersUtils.TConnectionType;
  {$SCOPEDENUMS OFF}

{$IFDEF PORTUGUES}
  /// <summary>
  ///   Obtém uma conexão FireDAC com base no tipo de conexão especificado.
  /// </summary>
  /// <remarks>
  ///   A função <c>GetConnection</c> retorna uma instância de <c>TFDConnection</c> correspondente ao
  ///   <c>TConnectionType</c> fornecido. Esta função centraliza a obtenção de conexões, garantindo
  ///   consistência e facilitando a manutenção do código.
  /// </remarks>
  /// <param name="AValue">
  ///   O tipo de conexão desejado, definido pelo enumerado <c>TConnectionType</c>. As opções incluem:
  ///   - <c>TConnectionType.ADS</c>: Conexão com banco de dados ADS.
  ///   - <c>TConnectionType.FB</c>: Conexão com banco de dados Firebird.
  ///   - <c>TConnectionType.MySQL</c>: Conexão com banco de dados MySQL.
  ///   - <c>TConnectionType.PG</c>: Conexão com banco de dados PostgreSQL.
  ///   - <c>TConnectionType.SQLite</c>: Conexão com banco de dados SQLite.
  /// </param>
  /// <returns>
  ///   Retorna uma instância de <c>TFDConnection</c> configurada de acordo com o tipo de conexão especificado.
  /// </returns>
  /// <exception cref="Exception">
  ///   Lança uma exceção se o tipo de conexão não for suportado ou não especificado.
  /// </exception>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Obtiene una conexión FireDAC basada en el tipo de conexión especificado.
  /// </summary>
  /// <remarks>
  ///   La función <c>GetConnection</c> devuelve una instancia de <c>TFDConnection</c> correspondiente al
  ///   <c>TConnectionType</c> proporcionado. Esta función centraliza la obtención de conexiones,
  ///   garantizando consistencia y facilitando el mantenimiento del código.
  /// </remarks>
  /// <param name="AValue">
  ///   El tipo de conexión deseado, definido por el enumerado <c>TConnectionType</c>. Las opciones incluyen:
  ///   - <c>TConnectionType.ADS</c>: Conexión con base de datos ADS.
  ///   - <c>TConnectionType.FB</c>: Conexión con base de datos Firebird.
  ///   - <c>TConnectionType.MySQL</c>: Conexión con base de datos MySQL.
  ///   - <c>TConnectionType.PG</c>: Conexión con base de datos PostgreSQL.
  ///   - <c>TConnectionType.SQLite</c>: Conexión con base de datos SQLite.
  /// </param>
  /// <returns>
  ///   Devuelve una instancia de <c>TFDConnection</c> configurada de acuerdo con el tipo de conexión especificado.
  /// </returns>
  /// <exception cref="Exception">
  ///   Lanza una excepción si el tipo de conexión no es soportado o no está especificado.
  /// </exception>
  {$ELSE}
  /// <summary>
  ///   Retrieves a FireDAC connection based on the specified connection type.
  /// </summary>
  /// <remarks>
  ///   The <c>GetConnection</c> function returns an instance of <c>TFDConnection</c> corresponding to the
  ///   provided <c>TConnectionType</c>. This function centralizes connection retrieval, ensuring
  ///   consistency and facilitating code maintenance.
  /// </remarks>
  /// <param name="AValue">
  ///   The desired connection type, defined by the <c>TConnectionType</c> enum. Options include:
  ///   - <c>TConnectionType.ADS</c>: Connection to ADS database.
  ///   - <c>TConnectionType.FB</c>: Connection to Firebird database.
  ///   - <c>TConnectionType.MySQL</c>: Connection to MySQL database.
  ///   - <c>TConnectionType.PG</c>: Connection to PostgreSQL database.
  ///   - <c>TConnectionType.SQLite</c>: Connection to SQLite database.
  /// </param>
  /// <returns>
  ///   Returns an instance of <c>TFDConnection</c> configured according to the specified connection type.
  /// </returns>
  /// <exception cref="Exception">
  ///   Throws an exception if the connection type is not supported or not specified.
  /// </exception>
  {$ENDIF}
{$ENDIF}
function GetConnection(AValue: TConnectionType): TFDConnection;

{$IFDEF PORTUGUES}
  /// <summary>
  ///   Cria e retorna uma instância de TFDQuery associada ao tipo de conexão especificado.
  /// </summary>
  /// <remarks>
  ///   A função <c>GetQuery</c> cria uma nova instância de <c>TFDQuery</c> e a associa a uma conexão obtida
  ///   através da função <c>GetConnection</c>. Isso facilita a execução de consultas SQL de forma
  ///   consistente e reutilizável dentro das rotas do middleware Horse.
  /// </remarks>
  /// <param name="AValue">
  ///   O tipo de conexão desejado, definido pelo enumerado <c>TConnectionType</c>. As opções incluem:
  ///   - <c>TConnectionType.ADS</c>: Conexão com banco de dados ADS.
  ///   - <c>TConnectionType.FB</c>: Conexão com banco de dados Firebird.
  ///   - <c>TConnectionType.MySQL</c>: Conexão com banco de dados MySQL.
  ///   - <c>TConnectionType.PG</c>: Conexão com banco de dados PostgreSQL.
  ///   - <c>TConnectionType.SQLite</c>: Conexão com banco de dados SQLite.
  /// </param>
  /// <returns>
  ///   Retorna uma instância de <c>TFDQuery</c> associada à conexão especificada.
  /// </returns>
  /// <exception cref="Exception">
  ///   Lança uma exceção se o tipo de conexão não for suportado ou não especificado.
  /// </exception>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Crea y devuelve una instancia de TFDQuery asociada al tipo de conexión especificado.
  /// </summary>
  /// <remarks>
  ///   La función <c>GetQuery</c> crea una nueva instancia de <c>TFDQuery</c> y la asocia a una conexión obtenida
  ///   a través de la función <c>GetConnection</c>. Esto facilita la ejecución de consultas SQL de manera
  ///   consistente y reutilizable dentro de las rutas del middleware Horse.
  /// </remarks>
  /// <param name="AValue">
  ///   El tipo de conexión deseado, definido por el enumerado <c>TConnectionType</c>. Las opciones incluyen:
  ///   - <c>TConnectionType.ADS</c>: Conexión con base de datos ADS.
  ///   - <c>TConnectionType.FB</c>: Conexión con base de datos Firebird.
  ///   - <c>TConnectionType.MySQL</c>: Conexión con base de datos MySQL.
  ///   - <c>TConnectionType.PG</c>: Conexión con base de datos PostgreSQL.
  ///   - <c>TConnectionType.SQLite</c>: Conexión con base de datos SQLite.
  /// </param>
  /// <returns>
  ///   Devuelve una instancia de <c>TFDQuery</c> asociada a la conexión especificada.
  /// </returns>
  /// <exception cref="Exception">
  ///   Lanza una excepción si el tipo de conexión no es soportado o no está especificado.
  /// </exception>
  {$ELSE}
  /// <summary>
  ///   Creates and returns an instance of TFDQuery associated with the specified connection type.
  /// </summary>
  /// <remarks>
  ///   The <c>GetQuery</c> function creates a new instance of <c>TFDQuery</c> and associates it with a connection obtained
  ///   through the <c>GetConnection</c> function. This facilitates executing SQL queries in a
  ///   consistent and reusable manner within the Horse middleware routes.
  /// </remarks>
  /// <param name="AValue">
  ///   The desired connection type, defined by the <c>TConnectionType</c> enum. Options include:
  ///   - <c>TConnectionType.ADS</c>: Connection to ADS database.
  ///   - <c>TConnectionType.FB</c>: Connection to Firebird database.
  ///   - <c>TConnectionType.MySQL</c>: Connection to MySQL database.
  ///   - <c>TConnectionType.PG</c>: Connection to PostgreSQL database.
  ///   - <c>TConnectionType.SQLite</c>: Connection to SQLite database.
  /// </param>
  /// <returns>
  ///   Returns an instance of <c>TFDQuery</c> associated with the specified connection.
  /// </returns>
  /// <exception cref="Exception">
  ///   Throws an exception if the connection type is not supported or not specified.
  /// </exception>
  {$ENDIF}
{$ENDIF}
function GetQuery(AValue: TConnectionType): TFDQuery;


implementation

uses
  Horse.Connection.PG,
  Horse.Connection.FB,
  Horse.Connection.ADS,
  Horse.Connection.MySQL,
  Horse.Connection.SQLite,

  System.SysUtils;

function GetConnection(AValue: TConnectionType): TFDConnection;
begin
  case AValue of
    TConnectionType.ADS: Result := ADSConnection;
    TConnectionType.FB: Result := FBConnection;
    TConnectionType.MySQL : Result := MySQLConnection;
    TConnectionType.PG: Result := PGConnection;
    TConnectionType.SQLite: Result := SQLiteConnection;
  else
    raise Exception.Create({$IFDEF PORTUGUES}
                             'Tipo de conexão não suportado ou não especificado.'
                           {$ELSE}
                             {$IFDEF ESPANHOL}
                               'Tipo de conexión no admitido o no especificado.'
                             {$ELSE}
                               'Connection type not supported or not specified.'
                             {$ENDIF}
                           {$ENDIF});
  end;
end;

function GetQuery(AValue: TConnectionType): TFDQuery;
var
  LConnection : TFDConnection;
begin
  LConnection:= GetConnection(AValue);
  Result := TFDQuery.Create(LConnection);
  Result.Connection := LConnection;
end;

end.

