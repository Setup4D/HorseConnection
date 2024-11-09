{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: Horse.Connection                                                }
{                                                                       }
{ Descri��o:                                                            }
{   Esta unit fornece fun��es para gerenciar conex�es com bancos de     }
{   dados utilizando FireDAC no middleware Horse. O HorseConnection     }
{   permite a libera��o de conex�es FireDAC ou inst�ncias de TFDQuery,  }
{   centralizando a l�gica de conex�o e facilitando o gerenciamento     }
{   eficiente das conex�es dentro das rotas do middleware.              }
{                                                                       }
{ Prop�sito do Middleware:                                              }
{   O middleware HorseConnection tem como objetivo encapsular a l�gica  }
{   de conex�o com bancos de dados, promovendo uma gest�o centralizada  }
{   e reutiliz�vel das conex�es FireDAC, reduzindo c�digo repetitivo e  }
{   prevenindo vazamentos de conex�es em aplica��es que fazem uso       }
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
  { Descripci�n:                                                          }
  {   Esta unidad proporciona funciones para gestionar conexiones a la    }
  {   base de datos utilizando FireDAC en el middleware Horse.            }
  {   HorseConnectionpermite la liberaci�n de conexiones FireDAC o        }
  {   instancias de TFDQuery, centralizando la l�gica de conexi�n y       }
  {   facilitando la gesti�n        eficiente de las conexiones dentro de }
  {   las rutas del middleware.                                           }
  {                                                                       }
  { Prop�sito del Middleware:                                             }
  {   El middleware HorseConnection tiene como objetivo encapsular la     }
  {   l�gica de conexi�n con bases de datos, promoviendo una gesti�n      }
  {   centralizada y reutilizable de las conexiones FireDAC, reduciendo   }
  {   c�digo repetitivoy previniendo fugas de conexiones en aplicaciones  }
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
  ///   Define os tipos de conex�o suportados pelo sistema.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Define los tipos de conexi�n soportados por el sistema.
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
  ///   Obt�m uma conex�o FireDAC com base no tipo de conex�o especificado.
  /// </summary>
  /// <remarks>
  ///   A fun��o <c>GetConnection</c> retorna uma inst�ncia de <c>TFDConnection</c> correspondente ao
  ///   <c>TConnectionType</c> fornecido. Esta fun��o centraliza a obten��o de conex�es, garantindo
  ///   consist�ncia e facilitando a manuten��o do c�digo.
  /// </remarks>
  /// <param name="AValue">
  ///   O tipo de conex�o desejado, definido pelo enumerado <c>TConnectionType</c>. As op��es incluem:
  ///   - <c>TConnectionType.ADS</c>: Conex�o com banco de dados ADS.
  ///   - <c>TConnectionType.FB</c>: Conex�o com banco de dados Firebird.
  ///   - <c>TConnectionType.MySQL</c>: Conex�o com banco de dados MySQL.
  ///   - <c>TConnectionType.PG</c>: Conex�o com banco de dados PostgreSQL.
  ///   - <c>TConnectionType.SQLite</c>: Conex�o com banco de dados SQLite.
  /// </param>
  /// <returns>
  ///   Retorna uma inst�ncia de <c>TFDConnection</c> configurada de acordo com o tipo de conex�o especificado.
  /// </returns>
  /// <exception cref="Exception">
  ///   Lan�a uma exce��o se o tipo de conex�o n�o for suportado ou n�o especificado.
  /// </exception>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Obtiene una conexi�n FireDAC basada en el tipo de conexi�n especificado.
  /// </summary>
  /// <remarks>
  ///   La funci�n <c>GetConnection</c> devuelve una instancia de <c>TFDConnection</c> correspondiente al
  ///   <c>TConnectionType</c> proporcionado. Esta funci�n centraliza la obtenci�n de conexiones,
  ///   garantizando consistencia y facilitando el mantenimiento del c�digo.
  /// </remarks>
  /// <param name="AValue">
  ///   El tipo de conexi�n deseado, definido por el enumerado <c>TConnectionType</c>. Las opciones incluyen:
  ///   - <c>TConnectionType.ADS</c>: Conexi�n con base de datos ADS.
  ///   - <c>TConnectionType.FB</c>: Conexi�n con base de datos Firebird.
  ///   - <c>TConnectionType.MySQL</c>: Conexi�n con base de datos MySQL.
  ///   - <c>TConnectionType.PG</c>: Conexi�n con base de datos PostgreSQL.
  ///   - <c>TConnectionType.SQLite</c>: Conexi�n con base de datos SQLite.
  /// </param>
  /// <returns>
  ///   Devuelve una instancia de <c>TFDConnection</c> configurada de acuerdo con el tipo de conexi�n especificado.
  /// </returns>
  /// <exception cref="Exception">
  ///   Lanza una excepci�n si el tipo de conexi�n no es soportado o no est� especificado.
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
  ///   Cria e retorna uma inst�ncia de TFDQuery associada ao tipo de conex�o especificado.
  /// </summary>
  /// <remarks>
  ///   A fun��o <c>GetQuery</c> cria uma nova inst�ncia de <c>TFDQuery</c> e a associa a uma conex�o obtida
  ///   atrav�s da fun��o <c>GetConnection</c>. Isso facilita a execu��o de consultas SQL de forma
  ///   consistente e reutiliz�vel dentro das rotas do middleware Horse.
  /// </remarks>
  /// <param name="AValue">
  ///   O tipo de conex�o desejado, definido pelo enumerado <c>TConnectionType</c>. As op��es incluem:
  ///   - <c>TConnectionType.ADS</c>: Conex�o com banco de dados ADS.
  ///   - <c>TConnectionType.FB</c>: Conex�o com banco de dados Firebird.
  ///   - <c>TConnectionType.MySQL</c>: Conex�o com banco de dados MySQL.
  ///   - <c>TConnectionType.PG</c>: Conex�o com banco de dados PostgreSQL.
  ///   - <c>TConnectionType.SQLite</c>: Conex�o com banco de dados SQLite.
  /// </param>
  /// <returns>
  ///   Retorna uma inst�ncia de <c>TFDQuery</c> associada � conex�o especificada.
  /// </returns>
  /// <exception cref="Exception">
  ///   Lan�a uma exce��o se o tipo de conex�o n�o for suportado ou n�o especificado.
  /// </exception>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Crea y devuelve una instancia de TFDQuery asociada al tipo de conexi�n especificado.
  /// </summary>
  /// <remarks>
  ///   La funci�n <c>GetQuery</c> crea una nueva instancia de <c>TFDQuery</c> y la asocia a una conexi�n obtenida
  ///   a trav�s de la funci�n <c>GetConnection</c>. Esto facilita la ejecuci�n de consultas SQL de manera
  ///   consistente y reutilizable dentro de las rutas del middleware Horse.
  /// </remarks>
  /// <param name="AValue">
  ///   El tipo de conexi�n deseado, definido por el enumerado <c>TConnectionType</c>. Las opciones incluyen:
  ///   - <c>TConnectionType.ADS</c>: Conexi�n con base de datos ADS.
  ///   - <c>TConnectionType.FB</c>: Conexi�n con base de datos Firebird.
  ///   - <c>TConnectionType.MySQL</c>: Conexi�n con base de datos MySQL.
  ///   - <c>TConnectionType.PG</c>: Conexi�n con base de datos PostgreSQL.
  ///   - <c>TConnectionType.SQLite</c>: Conexi�n con base de datos SQLite.
  /// </param>
  /// <returns>
  ///   Devuelve una instancia de <c>TFDQuery</c> asociada a la conexi�n especificada.
  /// </returns>
  /// <exception cref="Exception">
  ///   Lanza una excepci�n si el tipo de conexi�n no es soportado o no est� especificado.
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
                             'Tipo de conex�o n�o suportado ou n�o especificado.'
                           {$ELSE}
                             {$IFDEF ESPANHOL}
                               'Tipo de conexi�n no admitido o no especificado.'
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

