{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Descri��o:                                                            }
{   Este exemplo faz parte do projeto HorseConnection e demonstra o uso }
{   do framework Horse com uma conex�o ao banco de dados SQLite         }
{   utilizando o FireDAC. A conex�o � configurada por meio de           }
{   par�metros definidos com a fun��o ApplyDatabaseConfiguration, e o   }
{   middleware HorseConnectionSQLite � usado para centralizar a         }
{   configura��o da conex�o. Este middleware permite uma integra��o     }
{   com o Horse para cada requisi��o HTTP, garantindo que a conex�o     }
{   com o banco de dados SQLite seja gerenciada automaticamente.        }
{                                                                       }
{ Par�metros de Configura��o:                                           }
{   A fun��o ApplyDatabaseConfiguration permite configurar os           }
{   seguintes par�metros padr�o para a conex�o com o SQLite:            }
{                                                                       }
{     - Database: String                                                }
{       Caminho do arquivo do banco de dados SQLite. Pode ser um        }
{       caminho relativo ou absoluto para o arquivo .db/.dat/.sqlite3.  }
{                                                                       }
{     - UserName: String                                                }
{       Nome de usu�rio (geralmente n�o utilizado no SQLite, por�m      }
{       configur�vel caso o banco de dados use extens�o de autentica��o).}
{                                                                       }
{     - Password: String                                                }
{       Senha de acesso ao banco de dados (normalmente vazio,           }
{       mas pode ser configurado para bancos criptografados).           }
{                                                                       }
{     - OpenMode: TSQLiteOpenModeType                                   }
{       Modo de abertura do banco de dados: leitura/escrita, somente    }
{       leitura, ou cria��o do arquivo caso n�o exista.                 }
{                                                                       }
{     - LockingMode: TSQLiteLockingModeType                             }
{       Modo de bloqueio utilizado para concorr�ncia de acesso ao       }
{       banco de dados. Pode ser "Normal" ou "Exclusivo".               }
{                                                                       }
{     - Encrypt: TSQLiteEncryptType                                     }
{       Tipo de criptografia para o banco de dados. Configur�vel como   }
{       "No" (sem criptografia) ou "aes_128", "aes_256", etc.           }
{                                                                       }
{     - Pooled: Boolean                                                 }
{       Define se a conex�o ser� gerida como um pool de conex�es,       }
{       melhorando o desempenho ao reutilizar conex�es inativas.        }
{                                                                       }
{     - PoolMaxItems: Integer                                           }
{       N�mero m�ximo de conex�es permitidas no pool de conex�es.       }
{                                                                       }
{     - PoolExpireTimeout: Integer                                      }
{       Tempo em milissegundos para que uma conex�o inativa expire.     }
{                                                                       }
{     - PoolCleanupTimeout: Integer                                     }
{       Tempo em milissegundos para a limpeza peri�dica das conex�es    }
{       expiradas no pool.                                              }
{                                                                       }
{ Autor: Ricardo R. Pereira                                             }
{ Data: 9 de novembro de 2024                                           }
{                                                                       }
{ Requisitos:                                                           }
{   - Delphi com suporte a FireDAC                                      }
{   - Componentes Horse e Horse.Connection                              }
{***********************************************************************}
{$ELSE}
  {$IFDEF ESPANHOL}
  {***********************************************************************}
  {                          HorseConnection                              }
  {                                                                       }
  { Descripci�n:                                                          }
  {   Este ejemplo forma parte del proyecto HorseConnection y demuestra   }
  {   el uso del framework Horse con una conexi�n a la base de datos      }
  {   SQLite utilizando FireDAC. La conexi�n se configura mediante        }
  {   par�metros definidos con la funci�n ApplyDatabaseConfiguration, y   }
  {   el middleware HorseConnectionSQLite se utiliza para centralizar la  }
  {   configuraci�n de la conexi�n. Este middleware permite una           }
  {   integraci�n con Horse para cada solicitud HTTP, asegurando que      }
  {   la conexi�n a la base de datos SQLite se gestione autom�ticamente.  }
  {                                                                       }
  { Par�metros de Configuraci�n:                                          }
  {   La funci�n ApplyDatabaseConfiguration permite configurar los        }
  {   siguientes par�metros predeterminados para la conexi�n con SQLite:  }
  {                                                                       }
  {     - Database: String                                                }
  {       Ruta del archivo de base de datos SQLite. Puede ser una ruta    }
  {       relativa o absoluta al archivo .db/.dat/.sqlite3.               }
  {                                                                       }
  {     - UserName: String                                                }
  {       Nombre de usuario (generalmente no utilizado en SQLite, pero    }
  {       configurable si la base de datos utiliza extensi�n de           }
  {       autenticaci�n).                                                 }
  {                                                                       }
  {     - Password: String                                                }
  {       Contrase�a para el acceso a la base de datos (generalmente      }
  {       vac�o, pero configurable para bases de datos cifradas).         }
  {                                                                       }
  {     - OpenMode: TSQLiteOpenModeType                                   }
  {       Modo de apertura de la base de datos: lectura/escritura, solo   }
  {       lectura o creaci�n del archivo si no existe.                    }
  {                                                                       }
  {     - LockingMode: TSQLiteLockingModeType                             }
  {       Modo de bloqueo utilizado para concurrencia de acceso a la      }
  {       base de datos. Puede ser "Normal" o "Exclusivo".                }
  {                                                                       }
  {     - Encrypt: TSQLiteEncryptType                                     }
  {       Tipo de cifrado para la base de datos. Configurable como "No"   }
  {       (sin cifrado) o "aes_128", "aes_256", etc.                      }
  {                                                                       }
  {     - Pooled: Boolean                                                 }
  {       Define si la conexi�n ser� gestionada como un pool de           }
  {       conexiones, mejorando el rendimiento al reutilizar conexiones   }
  {       inactivas.                                                      }
  {                                                                       }
  {     - PoolMaxItems: Integer                                           }
  {       N�mero m�ximo de conexiones permitidas en el pool de conexiones.}
  {                                                                       }
  {     - PoolExpireTimeout: Integer                                      }
  {       Tiempo en milisegundos para que una conexi�n inactiva expire.   }
  {                                                                       }
  {     - PoolCleanupTimeout: Integer                                     }
  {       Tiempo en milisegundos para la limpieza peri�dica de conexiones }
  {       expiradas en el pool.                                           }
  {                                                                       }
  { Autor: Ricardo R. Pereira                                             }
  { Fecha: 9 de noviembre de 2024                                         }
  {                                                                       }
  { Requisitos:                                                           }
  {   - Delphi con soporte para FireDAC                                   }
  {   - Componentes Horse y Horse.Connection                              }
  {***********************************************************************}
  {$ELSE}
  {***********************************************************************}
  {                          HorseConnection                              }
  {                                                                       }
  { Description:                                                          }
  {   This example is part of the HorseConnection project and             }
  {   demonstrates the use of the Horse framework with a connection to    }
  {   the SQLite database using FireDAC. The connection is                }
  {   configured through parameters defined with the                      }
  {   ApplyDatabaseConfiguration function, and the HorseConnectionSQLite  }
  {   middleware is used to centralize the connection configuration.      }
  {   This middleware enables integration with Horse for each HTTP        }
  {   request, ensuring that the SQLite database connection is            }
  {   automatically managed.                                              }
  {                                                                       }
  { Configuration Parameters:                                             }
  {   The ApplyDatabaseConfiguration function allows configuring the      }
  {   following default parameters for the SQLite connection:             }
  {                                                                       }
  {     - Database: String                                                }
  {       Path to the SQLite database file. Can be a relative or absolute }
  {       path to the .db/.dat/.sqlite3 file.                             }
  {                                                                       }
  {     - UserName: String                                                }
  {       Username (usually not used in SQLite, but configurable if the   }
  {       database uses an authentication extension).                     }
  {                                                                       }
  {     - Password: String                                                }
  {       Password for database access (usually empty, but configurable   }
  {       for encrypted databases).                                       }
  {                                                                       }
  {     - OpenMode: TSQLiteOpenModeType                                   }
  {       Mode for opening the database: read/write, read-only, or        }
  {       creating the file if it doesn't exist.                          }
  {                                                                       }
  {     - LockingMode: TSQLiteLockingModeType                             }
  {       Locking mode used for concurrent access to the database.        }
  {       Options are "Normal" or "Exclusive".                            }
  {                                                                       }
  {     - Encrypt: TSQLiteEncryptType                                     }
  {       Encryption type for the database. Configurable as "No"          }
  {       (no encryption) or "aes_128", "aes_256", etc.                   }
  {                                                                       }
  {     - Pooled: Boolean                                                 }
  {       Specifies whether the connection will be managed as a pool,     }
  {       enhancing performance by reusing idle connections.              }
  {                                                                       }
  {     - PoolMaxItems: Integer                                           }
  {       Maximum number of connections allowed in the connection pool.   }
  {                                                                       }
  {     - PoolExpireTimeout: Integer                                      }
  {       Time in milliseconds for an idle connection to expire.          }
  {                                                                       }
  {     - PoolCleanupTimeout: Integer                                     }
  {       Time in milliseconds for periodic cleanup of expired            }
  {       connections in the pool.                                        }
  {                                                                       }
  { Author: Ricardo R. Pereira                                            }
  { Date: November 9, 2024                                                }
  {                                                                       }
  { Requirements:                                                         }
  {   - Delphi with FireDAC support                                       }
  {   - Horse and Horse.Connection components                             }
  {***********************************************************************}
  {$ENDIF}
{$ENDIF}
program SampleHorseConnectionPG;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  Horse.HandleException,
  Horse.Compression,

  Horse.Connection,
  Horse.Connection.SQLite, // Middleware espec�fico para SQLite

  FireDAC.Comp.Client,

  System.SysUtils,
  System.JSON;

begin
  ReportMemoryLeaksOnShutdown := True;

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Configura os par�metros de conex�o para o banco de dados SQLite.
  /// </summary>
  /// <remarks>
  ///   A fun��o <c>ApplyDatabaseConfiguration</c> permite definir configura��es espec�ficas
  ///   para a conex�o com o banco de dados SQLite, utilizando o FireDAC como camada de acesso.
  ///   Abaixo est�o descritos os par�metros:
  /// </remarks>
  /// <param name="Database">
  ///   Caminho para o arquivo do banco de dados SQLite.
  /// </param>
  /// <param name="UserName">
  ///   Nome de usu�rio para autentica��o (n�o utilizado por padr�o no SQLite).
  /// </param>
  /// <param name="Password">
  ///   Senha para acessar o banco de dados (n�o utilizada por padr�o no SQLite).
  /// </param>
  /// <param name="LockingMode">
  ///   Modo de bloqueio da base de dados. Define como o SQLite gerencia o bloqueio dos dados
  ///   durante a leitura e grava��o. O valor � definido pelo enumerado <c>TSQLiteLockingModeType</c>,
  ///   com as seguintes op��es:
  ///   - <c>Normal</c>: Bloqueio compartilhado, permite leituras simult�neas.
  ///   - <c>Exclusive</c>: Bloqueio exclusivo, previne outras conex�es.
  /// </param>
  /// <param name="OpenMode">
  ///   Modo de abertura do banco de dados. Determina como o SQLite abre o banco de dados.
  ///   Este valor � definido pelo enumerado <c>TSQLiteOpenModeType</c>, com as op��es:
  ///   - <c>CreateUTF8</c>: Cria um novo banco de dados com codifica��o UTF8, se n�o existir.
  ///   - <c>CreateUTF16</c>: Cria um novo banco de dados com codifica��o UTF16, se n�o existir.
  ///   - <c>ReadWrite</c>: Abre o banco de dados para leitura e escrita.
  ///   - <c>ReadOnly</c>: Abre o banco de dados apenas para leitura.
  /// </param>
  /// <param name="Encrypt">
  ///   Tipo de criptografia usado para proteger o banco de dados. Define o n�vel de seguran�a
  ///   dos dados armazenados. Este valor � definido pelo enumerado <c>TSQLiteEncryptType</c>, com
  ///   as op��es mais comuns:
  ///   - <c>No</c>: Sem criptografia.
  ///   - <c>aes_128</c>: Criptografia AES com chave de 128 bits.
  ///   - <c>aes_256</c>: Criptografia AES com chave de 256 bits.
  /// </param>
  /// <param name="Pooled">
  ///   Define se a conex�o ser� gerida como um pool de conex�es.
  /// </param>
  /// <param name="PoolMaxItems">
  ///   N�mero m�ximo de conex�es permitidas no pool.
  /// </param>
  /// <param name="PoolExpireTimeout">
  ///   Tempo em milissegundos para que uma conex�o inativa expire.
  /// </param>
  /// <param name="PoolCleanupTimeout">
  ///   Tempo em milissegundos para a limpeza peri�dica das conex�es expiradas no pool.
  /// </param>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Configura los par�metros de conexi�n para la base de datos SQLite.
    /// </summary>
    /// <remarks>
    ///   La funci�n <c>ApplyDatabaseConfiguration</c> permite definir configuraciones espec�ficas
    ///   para la conexi�n a la base de datos SQLite, utilizando FireDAC como capa de acceso.
    ///   A continuaci�n se describen los par�metros:
    /// </remarks>
    /// <param name="Database">
    ///   Ruta del archivo de la base de datos SQLite.
    /// </param>
    /// <param name="UserName">
    ///   Nombre de usuario para autenticaci�n (no utilizado por defecto en SQLite).
    /// </param>
    /// <param name="Password">
    ///   Contrase�a para acceder a la base de datos (no utilizada por defecto en SQLite).
    /// </param>
    /// <param name="LockingMode">
    ///   Modo de bloqueo de la base de datos. Define c�mo SQLite maneja el bloqueo de datos
    ///   durante la lectura y escritura. El valor est� definido por el enumerado <c>TSQLiteLockingModeType</c>,
    ///   con las siguientes opciones:
    ///   - <c>Normal</c>: Bloqueo compartido, permite lecturas simult�neas.
    ///   - <c>Exclusive</c>: Bloqueo exclusivo, previene otras conexiones.
    /// </param>
    /// <param name="OpenMode">
    ///   Modo de apertura de la base de datos. Determina c�mo SQLite abre la base de datos.
    ///   Este valor est� definido por el enumerado <c>TSQLiteOpenModeType</c>, con las opciones:
    ///   - <c>CreateUTF8</c>: Crea una nueva base de datos con codificaci�n UTF8 si no existe.
    ///   - <c>CreateUTF16</c>: Crea una nueva base de datos con codificaci�n UTF16 si no existe.
    ///   - <c>ReadWrite</c>: Abre la base de datos para lectura y escritura.
    ///   - <c>ReadOnly</c>: Abre la base de datos solo para lectura.
    /// </param>
    /// <param name="Encrypt">
    ///   Tipo de cifrado utilizado para proteger la base de datos. Define el nivel de seguridad
    ///   de los datos almacenados. Este valor est� definido por el enumerado <c>TSQLiteEncryptType</c>,
    ///   con las opciones m�s comunes:
    ///   - <c>No</c>: Sin cifrado.
    ///   - <c>aes_128</c>: Cifrado AES con clave de 128 bits.
    ///   - <c>aes_256</c>: Cifrado AES con clave de 256 bits.
    /// </param>
    /// <param name="Pooled">
    ///   Define si la conexi�n se gestionar� como un pool de conexiones.
    /// </param>
    /// <param name="PoolMaxItems">
    ///   N�mero m�ximo de conexiones permitidas en el pool.
    /// </param>
    /// <param name="PoolExpireTimeout">
    ///   Tiempo en milisegundos para que una conexi�n inactiva expire.
    /// </param>
    /// <param name="PoolCleanupTimeout">
    ///   Tiempo en milisegundos para la limpieza peri�dica de las conexiones expiradas en el pool.
    /// </param>
    {$ELSE}
    /// <summary>
    ///   Configures connection parameters for the SQLite database.
    /// </summary>
    /// <remarks>
    ///   The <c>ApplyDatabaseConfiguration</c> function allows specific configurations
    ///   for the SQLite database connection, using FireDAC as the access layer.
    ///   The parameters are described below:
    /// </remarks>
    /// <param name="Database">
    ///   Path to the SQLite database file.
    /// </param>
    /// <param name="UserName">
    ///   Username for authentication (not used by default in SQLite).
    /// </param>
    /// <param name="Password">
    ///   Password to access the database (not used by default in SQLite).
    /// </param>
    /// <param name="LockingMode">
    ///   Database locking mode. Defines how SQLite handles data locking during read and write
    ///   operations. The value is defined by the <c>TSQLiteLockingModeType</c> enum, with the options:
    ///   - <c>Normal</c>: Shared lock, allows simultaneous reads.
    ///   - <c>Exclusive</c>: Exclusive lock, prevents other connections.
    /// </param>
    /// <param name="OpenMode">
    ///   Database open mode. Specifies how SQLite opens the database. This value is defined
    ///   by the <c>TSQLiteOpenModeType</c> enum, with the options:
    ///   - <c>CreateUTF8</c>: Creates a new database with UTF8 encoding if it does not exist.
    ///   - <c>CreateUTF16</c>: Creates a new database with UTF16 encoding if it does not exist.
    ///   - <c>ReadWrite</c>: Opens the database for reading and writing.
    ///   - <c>ReadOnly</c>: Opens the database in read-only mode.
    /// </param>
    /// <param name="Encrypt">
    ///   Encryption type used to secure the database. Defines the level of security for the
    ///   stored data. This value is defined by the <c>TSQLiteEncryptType</c> enum, with the most
    ///   common options:
    ///   - <c>No</c>: No encryption.
    ///   - <c>aes_128</c>: AES encryption with a 128-bit key.
    ///   - <c>aes_256</c>: AES encryption with a 256-bit key.
    /// </param>
    /// <param name="Pooled">
    ///   Specifies whether the connection will be managed as a pool.
    /// </param>
    /// <param name="PoolMaxItems">
    ///   Maximum number of connections allowed in the pool.
    /// </param>
    /// <param name="PoolExpireTimeout">
    ///   Time in milliseconds for an inactive connection to expire.
    /// </param>
    /// <param name="PoolCleanupTimeout">
    ///   Time in milliseconds for periodic cleanup of expired connections in the pool.
    /// </param>
    {$ENDIF}
  {$ENDIF}
(*
  ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.Database, 'custom_database');                  {$IFDEF PORTUGUES} // Caminho para o banco de dados SQLite
                                                                                                           {$ELSE}{$IFDEF ESPANHOL} // Ruta del archivo de la base de datos SQLite
                                                                                                           {$ELSE} // Path to the SQLite database file
                                                                                                           {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.UserName, 'custom_user');                      {$IFDEF PORTUGUES} // Nome de usu�rio (n�o utilizado por padr�o no SQLite)
                                                                                                           {$ELSE}{$IFDEF ESPANHOL} // Nombre de usuario (no utilizado por defecto en SQLite)
                                                                                                           {$ELSE} // Username (not used by default in SQLite)
                                                                                                           {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.Password, 'custom_password');                  {$IFDEF PORTUGUES} // Senha (n�o utilizada por padr�o no SQLite)
                                                                                                           {$ELSE}{$IFDEF ESPANHOL} // Contrase�a (no utilizada por defecto en SQLite)
                                                                                                           {$ELSE} // Password (not used by default in SQLite)
                                                                                                           {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.LockingMode, 'custom_locking_mode');           {$IFDEF PORTUGUES} // Modo de bloqueio (Normal ou Exclusive)
                                                                                                           {$ELSE}{$IFDEF ESPANHOL} // Modo de bloqueo (Normal o Exclusive)
                                                                                                           {$ELSE} // Locking mode (Normal or Exclusive)
                                                                                                           {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.OpenMode, 'custom_open_mode');                 {$IFDEF PORTUGUES} // Modo de abertura do banco de dados
                                                                                                           {$ELSE}{$IFDEF ESPANHOL} // Modo de apertura de la base de datos
                                                                                                           {$ELSE} // Database open mode
                                                                                                           {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.Encrypt, 'custom_encrypt');                    {$IFDEF PORTUGUES} // Tipo de criptografia (No, aes_128, etc.)
                                                                                                           {$ELSE}{$IFDEF ESPANHOL} // Tipo de cifrado (No, aes_128, etc.)
                                                                                                           {$ELSE} // Encryption type (No, aes_128, etc.)
                                                                                                           {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.Pooled, 'custom_Pooled_Boolean');              {$IFDEF PORTUGUES} // Define se o pool de conex�es est� ativo
                                                                                                           {$ELSE}{$IFDEF ESPANHOL} // Define si el pool de conexiones est� activo
                                                                                                           {$ELSE} // Specifies whether the connection pool is active
                                                                                                           {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.PoolMaxItems, 'custom_PoolMaxItems_Integer');  {$IFDEF PORTUGUES} // N�mero m�ximo de conex�es no pool
                                                                                                           {$ELSE}{$IFDEF ESPANHOL} // N�mero m�ximo de conexiones en el pool
                                                                                                           {$ELSE} // Maximum number of connections in the pool
                                                                                                           {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.PoolExpireTimeout, 'custom_PoolExpireTimeout_Integer'); {$IFDEF PORTUGUES} // Tempo de expira��o para uma conex�o inativa
                                                                                                                   {$ELSE}{$IFDEF ESPANHOL} // Tiempo de expiraci�n para una conexi�n inactiva
                                                                                                                   {$ELSE} // Expiration time for an idle connection
                                                                                                                   {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.PoolCleanupTimeout, 'custom_PoolCleanupTimeout_Integer'); {$IFDEF PORTUGUES} // Tempo de limpeza peri�dica das conex�es
                                                                                                                    {$ELSE}{$IFDEF ESPANHOL} // Tiempo de limpieza peri�dica de las conexiones
                                                                                                                    {$ELSE} // Periodic cleanup time for connections
                                                                                                                  {$ENDIF}{$ENDIF}
*)
  THorse
    .Use(Compression())       {$IFDEF PORTUGUES} // Middleware para compress�o de respostas HTTP
                              {$ELSE}{$IFDEF ESPANHOL} // Middleware para compresi�n de respuestas HTTP
                              {$ELSE} // Middleware for HTTP response compression
                              {$ENDIF}{$ENDIF}

    .Use(Jhonson)             {$IFDEF PORTUGUES} // Middleware para manipula��o de JSON
                              {$ELSE}{$IFDEF ESPANHOL} // Middleware para manejo de JSON
                              {$ELSE} // Middleware for JSON handling
                              {$ENDIF}{$ENDIF}

    .Use(HandleException)     {$IFDEF PORTUGUES} // Middleware para tratamento de exce��es
                              {$ELSE}{$IFDEF ESPANHOL} // Middleware para manejo de excepciones
                              {$ELSE} // Middleware for exception handling
                              {$ENDIF}{$ENDIF}

    .Use(HorseConnectionSQLite);  {$IFDEF PORTUGUES} // Middleware para gerenciar a conex�o com o SQLite
                                  {$ELSE}{$IFDEF ESPANHOL} // Middleware para gestionar la conexi�n con SQLite
                                  {$ELSE} // Middleware to manage the SQLite connection
                                  {$ENDIF}{$ENDIF}


  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Define a rota "/produtos" que consulta e retorna dados no formato JSON.
  /// </summary>
  /// <remarks>
  ///   Esta rota consulta a tabela "produtos" no banco de dados SQLite e retorna os
  ///   dados no formato JSON, utilizando a conex�o configurada pelo middleware.
  /// </remarks>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Define la ruta "/productos" que consulta y devuelve datos en formato JSON.
    /// </summary>
    /// <remarks>
    ///   Esta ruta consulta la tabla "productos" en la base de datos SQLite y devuelve los
    ///   datos en formato JSON, utilizando la conexi�n configurada por el middleware.
    /// </remarks>
    {$ELSE}
    /// <summary>
    ///   Defines the "/produtos" route that queries and returns data in JSON format.
    /// </summary>
    /// <remarks>
    ///   This route queries the "produtos" table in the SQLite database and returns the
    ///   data in JSON format, using the connection configured by the middleware.
    /// </remarks>
    {$ENDIF}
  {$ENDIF}
  THorse.Get('/produtos',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      FDQuery: TFDQuery;
      Produtos: TJSONArray;
      Produto: TJSONObject;
    begin
      FDQuery := TFDQuery.Create(nil);
      try
        {$IFDEF PORTUGUES}{ Configura a consulta SQL }
        {$ELSE}{$IFDEF ESPANHOL}{ Configura la consulta SQL }
        {$ELSE}{ Configures the SQL query }
        {$ENDIF}{$ENDIF}
        FDQuery.Connection := GetConnection(TConnectionType.SQLite);   {$IFDEF PORTUGUES}// Obt�m a conex�o do middleware
                                                                      {$ELSE}{$IFDEF ESPANHOL}// Obtiene la conexi�n del middleware
                                                                      {$ELSE} // Gets the connection from the middleware
                                                                      {$ENDIF}{$ENDIF}
        FDQuery.SQL.Text := 'SELECT * FROM produtos';
        FDQuery.Open;

        {$IFDEF PORTUGUES}{ Constr�i o JSON com os dados dos produtos }
        {$ELSE}{$IFDEF ESPANHOL}{ Construye el JSON con los datos de los productos }
        {$ELSE}{ Builds the JSON with the product data }
        {$ENDIF}{$ENDIF}
        Produtos := TJSONArray.Create;
        while not FDQuery.Eof do
        begin
          Produto := TJSONObject.Create;
          Produto.AddPair('id', FDQuery.FieldByName('id').AsString);
          Produto.AddPair('nome', FDQuery.FieldByName('nome').AsString);
          Produto.AddPair('preco', FDQuery.FieldByName('preco').AsString);
          Produtos.AddElement(Produto);

          FDQuery.Next;
        end;

        {$IFDEF PORTUGUES}{ Envia a resposta como JSON }
        {$ELSE}{$IFDEF ESPANHOL}{ Env�a la respuesta como JSON }
        {$ELSE}{ Sends the response as JSON }
        {$ENDIF}{$ENDIF}
        Res.Send<TJSONArray>(Produtos);
      finally
        FDQuery.Close;
        FDQuery.Free;
      end;
    end
  );

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Define a rota "/produto" que consulta e retorna dados no formato JSON.
  /// </summary>
  /// <remarks>
  ///   Esta rota consulta a tabela "produtos" no banco de dados SQLite e retorna os
  ///   dados no formato JSON, utilizando a conex�o configurada pelo middleware.
  ///   A conex�o � obtida diretamente com a fun��o <c>GetQuery</c>, que simplifica
  ///   a cria��o e gerenciamento da consulta no FireDAC.
  /// </remarks>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Define la ruta "/producto" que consulta y devuelve datos en formato JSON.
    /// </summary>
    /// <remarks>
    ///   Esta ruta consulta la tabla "productos" en la base de datos SQLite y devuelve los
    ///   datos en formato JSON, utilizando la conexi�n configurada por el middleware.
    ///   La conexi�n se obtiene directamente con la funci�n <c>GetQuery</c>, que simplifica
    ///   la creaci�n y gesti�n de la consulta en FireDAC.
    /// </remarks>
    {$ELSE}
    /// <summary>
    ///   Defines the "/produto" route that queries and returns data in JSON format.
    /// </summary>
    /// <remarks>
    ///   This route queries the "produtos" table in the SQLite database and returns the
    ///   data in JSON format, using the connection configured by the middleware.
    ///   The connection is obtained directly with the <c>GetQuery</c> function, which
    ///   simplifies the creation and management of the FireDAC query.
    /// </remarks>
    {$ENDIF}
  {$ENDIF}
  THorse.Get('/produto',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      FDQuery: TFDQuery;
      Produtos: TJSONArray;
      Produto: TJSONObject;
    begin
      SetConnectionPrefix(EmptyStr);  {$IFDEF PORTUGUES}// Prefixo do pool de conex�o, se especificado
                                      {$ELSE}{$IFDEF ESPANHOL}// Prefijo del pool de conexiones, si se especifica
                                      {$ELSE} // Connection pool prefix, if specified
                                      {$ENDIF}{$ENDIF}

      SetDatabase(EmptyStr);          {$IFDEF PORTUGUES}// Caminho do banco de dados SQLite, se especificado
                                      {$ELSE}{$IFDEF ESPANHOL}// Ruta de la base de datos SQLite, si se especifica
                                      {$ELSE} // Path of the SQLite database, if specified
                                      {$ENDIF}{$ENDIF}

      FDQuery := GetQuery(TConnectionType.SQLite);   {$IFDEF PORTUGUES}// Obt�m a conex�o do middleware com a fun��o GetQuery
                                                    {$ELSE}{$IFDEF ESPANHOL}// Obtiene la conexi�n del middleware con la funci�n GetQuery
                                                    {$ELSE} // Gets the connection from the middleware with GetQuery function
                                                    {$ENDIF}{$ENDIF}
      try
        {$IFDEF PORTUGUES}{ Configura a consulta SQL }
        {$ELSE}{$IFDEF ESPANHOL}{ Configura la consulta SQL }
        {$ELSE}{ Configures the SQL query }
        {$ENDIF}{$ENDIF}
        FDQuery.SQL.Text := 'SELECT * FROM produtos';
        FDQuery.Open;

        {$IFDEF PORTUGUES}{ Constr�i o JSON com os dados dos produtos }
        {$ELSE}{$IFDEF ESPANHOL}{ Construye el JSON con los datos de los productos }
        {$ELSE}{ Builds the JSON with the product data }
        {$ENDIF}{$ENDIF}
        Produtos := TJSONArray.Create;
        while not FDQuery.Eof do
        begin
          Produto := TJSONObject.Create;
          Produto.AddPair('id', FDQuery.FieldByName('id').AsString);
          Produto.AddPair('nome', FDQuery.FieldByName('nome').AsString);
          Produto.AddPair('preco', FDQuery.FieldByName('preco').AsString);
          Produtos.AddElement(Produto);

          FDQuery.Next;
        end;

        {$IFDEF PORTUGUES}{ Envia a resposta como JSON }
        {$ELSE}{$IFDEF ESPANHOL}{ Env�a la respuesta como JSON }
        {$ELSE}{ Sends the response as JSON }
        {$ENDIF}{$ENDIF}
        Res.Send<TJSONArray>(Produtos);
      finally
        FDQuery.Close;
        FDQuery.Free;
      end;
    end
  );

  {$IFDEF PORTUGUES}
    /// <summary>
    ///   Inicia o servidor Horse na porta 9000.
    /// </summary>
    /// <remarks>
    ///   O servidor ficar� dispon�vel para receber requisi��es HTTP.
    /// </remarks>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Inicia el servidor Horse en el puerto 9000.
    /// </summary>
    /// <remarks>
    ///   El servidor estar� disponible para recibir solicitudes HTTP.
    /// </remarks>
    {$ELSE}
    /// <summary>
    ///   Starts the Horse server on port 9000.
    /// </summary>
    /// <remarks>
    ///   The server will be available to receive HTTP requests.
    /// </remarks>
    {$ENDIF}
  {$ENDIF}
  THorse.Listen(9000);

end.
