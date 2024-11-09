{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Descrição:                                                            }
{   Este exemplo faz parte do projeto HorseConnection e demonstra o uso }
{   do framework Horse com uma conexão ao banco de dados Firebird       }
{   utilizando o FireDAC. A conexão é configurada por meio de           }
{   parâmetros definidos com a função ApplyDatabaseConfiguration, e o   }
{   middleware HorseConnectionFB é usado para centralizar a             }
{   configuração da conexão. Este middleware permite uma integração     }
{   com o Horse para cada requisição HTTP, garantindo que a conexão     }
{   com o banco de dados Firebird seja gerenciada automaticamente.      }
{                                                                       }
{ Parâmetros de Configuração:                                           }
{   A função ApplyDatabaseConfiguration permite configurar os           }
{   seguintes parâmetros padrão para a conexão com o Firebird:          }
{                                                                       }
{     - Database:                                                       }
{       Caminho completo ou alias do banco de dados no servidor. Esse   }
{       parâmetro especifica o local do banco de dados Firebird que     }
{       será acessado.                                                  }
{                                                                       }
{     - UserName: String                                                }
{       Nome de usuário para autenticação no banco de dados.            }
{                                                                       }
{     - Password: String                                                }
{       Senha de acesso ao banco de dados.                              }
{                                                                       }
{     - Protocol: TFBProtocol                                           }
{       Protocolo de comunicação com o servidor, como "TCPIP" ou        }
{       "Local", definido pelo enumerado <c>TFBProtocolType</c>.        }
{                                                                       }
{     - Server: String                                                  }
{       Endereço do servidor onde o banco de dados Firebird está        }
{       hospedado. Pode ser um endereço IP ou hostname.                 }
{                                                                       }
{     - Port: Integer                                                   }
{       Porta de comunicação com o servidor Firebird. O valor padrão    }
{       costuma ser 3050.                                               }
{                                                                       }
{     - CharacterSet: TFBCharacterSetType                               }
{       Define o conjunto de caracteres para a conexão, utilizando o    }
{       enumerado <c>TFBCharacterSetType</c>. Opções comuns incluem:    }
{       - <c>NONE</c>: Sem conversão de conjunto de caracteres.         }
{       - <c>UTF8</c>: Usa o conjunto de caracteres UTF-8.              }
{       - <c>ISO8859_1</c>: Conjunto de caracteres ISO 8859-1           }
{         (Latin-1).                                                    }
{       - <c>WIN1252</c>: Conjunto de caracteres Windows-1252           }
{         (Western European).                                           }
{       Outros valores incluem <c>ASCII</c>, <c>UNICODE_FSS</c>, etc.   }
{                                                                       }
{     - OpenMode: TFBOpenModeType                                       }
{       Modo de abertura do banco de dados, definido pelo enumerado     }
{       <c>TFBOpenModeType</c>, com opções como:                        }
{       - <c>Open</c>: Abre o banco de dados existente.                 }
{       - <c>Create</c>: Cria um novo banco de dados.                   }
{       - <c>OpenOrCreate</c>: Abre ou cria o banco de dados.           }
{                                                                       }
{     - Pooled: Boolean                                                 }
{       Define se a conexão será gerida como um pool de conexões,       }
{       melhorando o desempenho ao reutilizar conexões inativas.        }
{                                                                       }
{     - PoolMaxItems: Integer                                           }
{       Número máximo de conexões permitidas no pool de conexões.       }
{                                                                       }
{     - PoolExpireTimeout: Integer                                      }
{       Tempo em milissegundos para que uma conexão inativa expire.     }
{                                                                       }
{     - PoolCleanupTimeout: Integer                                     }
{       Tempo em milissegundos para a limpeza periódica das conexões    }
{       expiradas no pool.                                              }
{ Errores Comunes (Troubleshooting):                                    }
{   A continuación se describen algunos errores comunes que pueden      }
{   ocurrir al configurar y utilizar la conexión con Firebird:          }
{                                                                       }
{     - Archivo de base de datos no encontrado:                         }
{       Si la ruta de la base de datos es incorrecta, Firebird muestra  }
{       un error de I/O.                                                }
{       Solución: Verifique que la ruta sea correcta.                   }
{                                                                       }
{     - Tabla no encontrada en Firebird:                                }
{       Si la consulta intenta acceder a una tabla inexistente,         }
{       Firebird generará un error que indica que la tabla no fue       }
{       encontrada. Solución: Verifique el nombre y existencia de la    }
{       tabla.                                                          }
{                                                                       }
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
  { Descripción:                                                          }
  {   Este ejemplo forma parte del proyecto HorseConnection y demuestra   }
  {   el uso del framework Horse con una conexión a la base de datos      }
  {   Firebird utilizando FireDAC. La conexión se configura mediante      }
  {   parámetros definidos con la función ApplyDatabaseConfiguration, y   }
  {   el middleware HorseConnectionFB se utiliza para centralizar la      }
  {   configuración de la conexión. Este middleware permite una           }
  {   integración con Horse para cada solicitud HTTP, asegurando que      }
  {   la conexión a la base de datos Firebird se gestione                 }
  {   automáticamente.                                                    }
  {                                                                       }
  { Parámetros de Configuración:                                          }
  {   La función ApplyDatabaseConfiguration permite configurar los        }
  {   siguientes parámetros predeterminados para la conexión con          }
  {   Firebird:                                                           }
  {                                                                       }
  {     - Database:                                                       }
  {       Ruta completa o alias de la base de datos en el servidor. Este  }
  {       parámetro especifica la ubicación de la base de datos Firebird  }
  {       a la que se accederá.                                           }
  {                                                                       }
  {     - UserName: String                                                }
  {       Nombre de usuario para autenticación en la base de datos.       }
  {                                                                       }
  {     - Password: String                                                }
  {       Contraseña para el acceso a la base de datos.                   }
  {                                                                       }
  {     - Protocol: TFBProtocol                                           }
  {       Protocolo de comunicación con el servidor, como "TCPIP" o       }
  {       "Local", definido por el enumerado <c>TFBProtocolType</c>.      }
  {                                                                       }
  {     - Server: String                                                  }
  {       Dirección del servidor donde se aloja la base de datos          }
  {       Firebird. Puede ser una dirección IP o un nombre de host.       }
  {                                                                       }
  {     - Port: Integer                                                   }
  {       Puerto de comunicación con el servidor Firebird. El valor       }
  {       predeterminado suele ser 3050.                                  }
  {                                                                       }
  {     - CharacterSet: TFBCharacterSetType                               }
  {       Define el conjunto de caracteres para la conexión, utilizando   }
  {       el enumerado <c>TFBCharacterSetType</c>. Opciones comunes       }
  {       incluyen:                                                       }
  {       - <c>NONE</c>: Sin conversión de conjunto de caracteres.        }
  {       - <c>UTF8</c>: Usa el conjunto de caracteres UTF-8.             }
  {       - <c>ISO8859_1</c>: Conjunto de caracteres ISO 8859-1           }
  {         (Latin-1).                                                    }
  {       - <c>WIN1252</c>: Conjunto de caracteres Windows-1252           }
  {         (Western European).                                           }
  {       Otros valores incluyen <c>ASCII</c>, <c>UNICODE_FSS</c>, etc.   }
  {                                                                       }
  {     - OpenMode: TFBOpenModeType                                       }
  {       Modo de apertura de la base de datos, definido por el           }
  {       enumerado <c>TFBOpenModeType</c>, con opciones como:            }
  {       - <c>Open</c>: Abre la base de datos existente.                 }
  {       - <c>Create</c>: Crea una nueva base de datos.                  }
  {       - <c>OpenOrCreate</c>: Abre o crea la base de datos.            }
  {                                                                       }
  {     - Pooled: Boolean                                                 }
  {       Define si la conexión se gestionará como un pool,               }
  {       mejorando el rendimiento reutilizando conexiones inactivas.     }
  {                                                                       }
  {     - PoolMaxItems: Integer                                           }
  {       Número máximo de conexiones permitidas en el pool de            }
  {       conexiones.                                                     }
  {                                                                       }
  {     - PoolExpireTimeout: Integer                                      }
  {       Tiempo en milisegundos para que una conexión inactiva expire.   }
  {                                                                       }
  {     - PoolCleanupTimeout: Integer                                     }
  {       Tiempo en milisegundos para la limpieza periódica de            }
  {       conexiones expiradas en el pool.                                }
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
  {   the Firebird database using FireDAC. The connection is configured   }
  {   through parameters defined with the ApplyDatabaseConfiguration      }
  {   function, and the HorseConnectionFB middleware is used to           }
  {   centralize the connection configuration. This middleware enables    }
  {   integration with Horse for each HTTP request, ensuring that the     }
  {   Firebird database connection is automatically managed.              }
  {                                                                       }
  { Configuration Parameters:                                             }
  {   The ApplyDatabaseConfiguration function allows configuring the      }
  {   following default parameters for the Firebird connection:           }
  {                                                                       }
  {     - Database:                                                       }
  {       Full path or alias of the database on the server. This          }
  {       parameter specifies the location of the Firebird database       }
  {       to be accessed.                                                 }
  {                                                                       }
  {     - UserName: String                                                }
  {       Username for database authentication.                           }
  {                                                                       }
  {     - Password: String                                                }
  {       Password for database access.                                   }
  {                                                                       }
  {     - Protocol: TFBProtocol                                           }
  {       Communication protocol with the server, such as "TCPIP" or      }
  {       "Local", defined by the <c>TFBProtocolType</c> enum.            }
  {                                                                       }
  {     - Server: String                                                  }
  {       Server address where the Firebird database is hosted.           }
  {       It can be an IP address or a hostname.                          }
  {                                                                       }
  {     - Port: Integer                                                   }
  {       Communication port with the Firebird server. The default        }
  {       value is usually 3050.                                          }
  {                                                                       }
  {     - CharacterSet: TFBCharacterSetType                               }
  {       Sets the character set for the connection, using the            }
  {       <c>TFBCharacterSetType</c> enum. Common options include:        }
  {       - <c>NONE</c>: No character set conversion.                     }
  {       - <c>UTF8</c>: Uses the UTF-8 character set.                    }
  {       - <c>ISO8859_1</c>: ISO 8859-1 (Latin-1) character set.         }
  {       - <c>WIN1252</c>: Windows-1252 (Western European) character set.}
  {       Other values include <c>ASCII</c>, <c>UNICODE_FSS</c>, etc.     }
  {                                                                       }
  {     - OpenMode: TFBOpenModeType                                       }
  {       Database open mode, defined by the <c>TFBOpenModeType</c> enum, }
  {       with options such as:                                           }
  {       - <c>Open</c>: Opens an existing database.                      }
  {       - <c>Create</c>: Creates a new database.                        }
  {       - <c>OpenOrCreate</c>: Opens the database if it exists,         }
  {         or creates it otherwise.                                      }
  {                                                                       }
  {     - Pooled: Boolean                                                 }
  {       Specifies whether the connection will be managed as a pool,     }
  {       enhancing performance by reusing inactive connections.          }
  {                                                                       }
  {     - PoolMaxItems: Integer                                           }
  {       Maximum number of connections allowed in the connection pool.   }
  {                                                                       }
  {     - PoolExpireTimeout: Integer                                      }
  {       Time in milliseconds for an inactive connection to expire.      }
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

program SampleHorseConnectionFB;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  Horse.HandleException,
  Horse.Compression,

  Horse.Connection,
  Horse.Connection.FB,

  FireDAC.Comp.Client,

  System.SysUtils,
  System.JSON;

begin
  ReportMemoryLeaksOnShutdown := True;

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Configura os parâmetros de conexão para o banco de dados Firebird.
  /// </summary>
  /// <remarks>
  ///   A função <c>ApplyDatabaseConfiguration</c> permite definir configurações específicas
  ///   para a conexão com o banco de dados Firebird, utilizando o FireDAC como camada de acesso.
  ///   Abaixo estão descritos os parâmetros:
  /// </remarks>
  /// <param name="UserName">
  ///   Nome de usuário para autenticação no banco de dados Firebird. Este parâmetro é necessário
  ///   caso o banco de dados exija autenticação.
  /// </param>
  /// <param name="Password">
  ///   Senha de acesso ao banco de dados Firebird, usada em conjunto com o <c>UserName</c> para
  ///   autenticação segura.
  /// </param>
  /// <param name="Database">
  ///   Caminho completo ou nome do banco de dados no servidor Firebird. Este parâmetro indica a
  ///   localização do banco de dados que será acessado.
  /// </param>
  /// <param name="Protocol">
  ///   Protocolo de comunicação com o servidor Firebird. Esse parâmetro controla o método de comunicação
  ///   entre o cliente e o servidor e é definido pelo enumerado <c>TFBProtocolType</c>, com as seguintes
  ///   opções:
  ///   - <c>Local</c>: Conexão local ao banco de dados (sem rede).
  ///   - <c>TCPIP</c>: Conexão via TCP/IP, adequada para conexões de rede.
  /// </param>
  /// <param name="Server">
  ///   Endereço do servidor onde o banco de dados Firebird está hospedado. Pode ser um endereço
  ///   IP ou um hostname. O padrão costuma ser "localhost" para desenvolvimento local.
  /// </param>
  /// <param name="Port">
  ///   Porta de conexão para o servidor Firebird. O valor padrão para Firebird é 3050, mas
  ///   pode ser alterado conforme a configuração do servidor.
  /// </param>
  /// <param name="CharacterSet">
  ///   Define o conjunto de caracteres para a conexão, garantindo a compatibilidade de caracteres.
  ///   Este parâmetro é configurado pelo enumerado <c>TFBCharacterSetType</c>, que oferece várias
  ///   opções, incluindo:
  ///   - <c>NONE</c>: Sem conversão de conjunto de caracteres.
  ///   - <c>UTF8</c>: Usa o conjunto de caracteres UTF-8.
  ///   - <c>ISO8859_1</c>: Conjunto de caracteres ISO 8859-1 (Latin-1).
  ///   - <c>WIN1252</c>: Conjunto de caracteres Windows-1252 (Western European).
  ///   Outros valores incluem <c>ASCII</c>, <c>UNICODE_FSS</c>, e muitos mais.
  /// </param>
  /// <param name="OpenMode">
  ///   Define o modo de abertura do banco de dados. As opções são definidas pelo enumerado
  ///   <c>TFBOpenModeType</c> e incluem:
  ///   - <c>Open</c>: Abre o banco de dados existente.
  ///   - <c>Create</c>: Cria um novo banco de dados.
  ///   - <c>OpenOrCreate</c>: Abre o banco de dados se existir ou o cria caso contrário.
  /// </param>
  /// <param name="Pooled">
  ///   Define se a conexão será gerida como um pool de conexões. O pooling de conexões
  ///   melhora o desempenho reutilizando conexões inativas, reduzindo a sobrecarga de
  ///   criação e destruição de conexões.
  /// </param>
  /// <param name="PoolMaxItems">
  ///   Número máximo de conexões permitidas no pool. Este parâmetro controla o tamanho do pool,
  ///   garantindo que um número excessivo de conexões não seja criado.
  /// </param>
  /// <param name="PoolExpireTimeout">
  ///   Tempo em segundos para que uma conexão inativa expire. Conexões que permanecerem
  ///   ociosas por este período serão automaticamente fechadas pelo pool.
  /// </param>
  /// <param name="PoolCleanupTimeout">
  ///   Tempo em segundos para a limpeza periódica das conexões expiradas no pool. Este
  ///   parâmetro define a frequência com que o pool verifica e elimina conexões ociosas.
  /// </param>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Configura los parámetros de conexión para la base de datos Firebird.
    /// </summary>
    /// <remarks>
    ///   La función <c>ApplyDatabaseConfiguration</c> permite definir configuraciones específicas
    ///   para la conexión a la base de datos Firebird, utilizando FireDAC como capa de acceso.
    ///   A continuación se describen los parámetros:
    /// </remarks>
    /// <param name="UserName">
    ///   Nombre de usuario para autenticación en la base de datos Firebird. Este parámetro es necesario
    ///   si la base de datos requiere autenticación.
    /// </param>
    /// <param name="Password">
    ///   Contraseña de acceso a la base de datos Firebird, utilizada junto con <c>UserName</c> para
    ///   la autenticación segura.
    /// </param>
    /// <param name="Database">
    ///   Ruta completa o nombre de la base de datos en el servidor Firebird. Este parámetro indica la
    ///   ubicación de la base de datos a la que se accederá.
    /// </param>
    /// <param name="Protocol">
    ///   Protocolo de comunicación con el servidor Firebird. Este parámetro controla el método de comunicación
    ///   entre el cliente y el servidor, y se define por el enumerado <c>TFBProtocolType</c>, con las siguientes
    ///   opciones:
    ///   - <c>Local</c>: Conexión local a la base de datos (sin red).
    ///   - <c>TCPIP</c>: Conexión a través de TCP/IP, adecuada para conexiones de red.
    /// </param>
    /// <param name="Server">
    ///   Dirección del servidor donde está alojada la base de datos Firebird. Puede ser una dirección
    ///   IP o un nombre de host. El valor predeterminado suele ser "localhost" para desarrollo local.
    /// </param>
    /// <param name="Port">
    ///   Puerto de conexión para el servidor Firebird. El valor predeterminado para Firebird es 3050,
    ///   pero se puede cambiar según la configuración del servidor.
    /// </param>
    /// <param name="CharacterSet">
    ///   Define el conjunto de caracteres para la conexión, garantizando la compatibilidad de caracteres.
    ///   Este parámetro se configura por el enumerado <c>TFBCharacterSetType</c>, que ofrece varias opciones,
    ///   incluyendo:
    ///   - <c>NONE</c>: Sin conversión de conjunto de caracteres.
    ///   - <c>UTF8</c>: Usa el conjunto de caracteres UTF-8.
    ///   - <c>ISO8859_1</c>: Conjunto de caracteres ISO 8859-1 (Latin-1).
    ///   - <c>WIN1252</c>: Conjunto de caracteres Windows-1252 (Western European).
    ///   Otros valores incluyen <c>ASCII</c>, <c>UNICODE_FSS</c>, y muchos más.
    /// </param>
    /// <param name="OpenMode">
    ///   Define el modo de apertura de la base de datos. Las opciones se definen por el enumerado
    ///   <c>TFBOpenModeType</c> e incluyen:
    ///   - <c>Open</c>: Abre la base de datos existente.
    ///   - <c>Create</c>: Crea una nueva base de datos.
    ///   - <c>OpenOrCreate</c>: Abre la base de datos si existe, o la crea en caso contrario.
    /// </param>
    /// <param name="Pooled">
    ///   Define si la conexión será gestionada como un pool de conexiones. El uso de pool de conexiones
    ///   mejora el rendimiento al reutilizar conexiones inactivas, reduciendo la sobrecarga de creación
    ///   y destrucción de conexiones.
    /// </param>
    /// <param name="PoolMaxItems">
    ///   Número máximo de conexiones permitidas en el pool. Este parámetro controla el tamaño del pool,
    ///   asegurando que no se cree un número excesivo de conexiones.
    /// </param>
    /// <param name="PoolExpireTimeout">
    ///   Tiempo en segundos para que una conexión inactiva expire. Las conexiones que permanezcan
    ///   inactivas por este período se cerrarán automáticamente por el pool.
    /// </param>
    /// <param name="PoolCleanupTimeout">
    ///   Tiempo en segundos para la limpieza periódica de las conexiones expiradas en el pool. Este
    ///   parámetro define la frecuencia con la que el pool verifica y elimina conexiones inactivas.
    /// </param>
    {$ELSE}
    /// <summary>
    ///   Configures connection parameters for the Firebird database.
    /// </summary>
    /// <remarks>
    ///   The <c>ApplyDatabaseConfiguration</c> function allows specific configurations
    ///   for the Firebird database connection, using FireDAC as the access layer.
    ///   The parameters are described below:
    /// </remarks>
    /// <param name="UserName">
    ///   Username for authentication on the Firebird database. This parameter is required
    ///   if the database requires authentication.
    /// </param>
    /// <param name="Password">
    ///   Password for Firebird database access, used together with <c>UserName</c> for
    ///   secure authentication.
    /// </param>
    /// <param name="Database">
    ///   Full path or name of the database on the Firebird server. This parameter specifies
    ///   the location of the database to be accessed.
    /// </param>
    /// <param name="Protocol">
    ///   Communication protocol with the Firebird server. This parameter controls the communication
    ///   method between the client and server, and is defined by the <c>TFBProtocolType</c> enum,
    ///   with the following options:
    ///   - <c>Local</c>: Local connection to the database (no network).
    ///   - <c>TCPIP</c>: Connection via TCP/IP, suitable for network connections.
    /// </param>
    /// <param name="Server">
    ///   Server address where the Firebird database is hosted. It can be an IP address or a hostname.
    ///   The default is usually "localhost" for local development.
    /// </param>
    /// <param name="Port">
    ///   Connection port for the Firebird server. The default value for Firebird is 3050, but
    ///   it can be changed according to server configuration.
    /// </param>
    /// <param name="CharacterSet">
    ///   Defines the character set for the connection, ensuring character compatibility.
    ///   This parameter is configured by the <c>TFBCharacterSetType</c> enum, offering a variety
    ///   of options, including:
    ///   - <c>NONE</c>: No character set conversion.
    ///   - <c>UTF8</c>: Uses the UTF-8 character set.
    ///   - <c>ISO8859_1</c>: ISO 8859-1 (Latin-1) character set.
    ///   - <c>WIN1252</c>: Windows-1252 (Western European) character set.
    ///   Additional options include <c>ASCII</c>, <c>UNICODE_FSS</c>, and many others.
    /// </param>
    /// <param name="OpenMode">
    ///   Defines the database open mode. Options are defined by the <c>TFBOpenModeType</c> enum and include:
    ///   - <c>Open</c>: Opens an existing database.
    ///   - <c>Create</c>: Creates a new database.
    ///   - <c>OpenOrCreate</c>: Opens the database if it exists, or creates it otherwise.
    /// </param>
    /// <param name="Pooled">
    ///   Specifies whether the connection will be managed as a connection pool. Connection pooling
    ///   improves performance by reusing inactive connections, reducing the overhead of creating
    ///   and destroying connections.
    /// </param>
    /// <param name="PoolMaxItems">
    ///   Maximum number of connections allowed in the pool. This parameter controls the pool size,
    ///   ensuring that an excessive number of connections is not created.
    /// </param>
    /// <param name="PoolExpireTimeout">
    ///   Time in seconds for an inactive connection to expire. Connections that remain idle for
    ///   this period will be automatically closed by the pool.
    /// </param>
    /// <param name="PoolCleanupTimeout">
    ///   Time in seconds for periodic cleanup of expired connections in the pool. This parameter
    ///   defines the frequency at which the pool checks and removes idle connections.
    /// </param>
    {$ENDIF}
  {$ENDIF}

  (*
  ApplyDatabaseConfiguration(TFBConfigurationParameter.Database, '.\db.fdb');
                                                                                                                          {$IFDEF PORTUGUES} // Define o caminho ou alias do banco de dados Firebird
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Define la ruta o alias de la base de datos Firebird
                                                                                                                          {$ELSE}// Sets the path or alias of the Firebird database
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TFBConfigurationParameter.UserName, 'SYSDBA');                                               {$IFDEF PORTUGUES} // Nome de usuário para autenticação no Firebird
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Nombre de usuario para autenticación en Firebird
                                                                                                                          {$ELSE}// Username for Firebird authentication
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TFBConfigurationParameter.Password, 'masterkey');                                            {$IFDEF PORTUGUES} // Senha de acesso ao banco de dados
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Contraseña para acceder a la base de datos
                                                                                                                          {$ELSE}// Password for database access
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TFBConfigurationParameter.Protocol, TFBProtocolType.TCPIP);                                  {$IFDEF PORTUGUES} // Protocolo de comunicação, como "TCPIP"
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Protocolo de comunicación, como "TCPIP"
                                                                                                                          {$ELSE}// Communication protocol, like "TCPIP"
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TFBConfigurationParameter.Server, 'localhost');                                              {$IFDEF PORTUGUES} // Endereço do servidor onde o Firebird está hospedado
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Dirección del servidor donde se aloja Firebird
                                                                                                                          {$ELSE}// Server address where Firebird is hosted
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TFBConfigurationParameter.Port, 3050);                                                       {$IFDEF PORTUGUES} // Porta de comunicação com o servidor Firebird
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Puerto de comunicación con el servidor Firebird
                                                                                                                          {$ELSE}// Communication port with the Firebird server
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TFBConfigurationParameter.CharacterSet, TFBCharacterSetType.UTF8);                           {$IFDEF PORTUGUES} // Define o conjunto de caracteres, ex: "UTF8"
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Define el conjunto de caracteres, ej: "UTF8"
                                                                                                                          {$ELSE}// Sets the character set, e.g., "UTF8"
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TFBConfigurationParameter.OpenMode, TFBOpenModeType.OpenOrCreate);                           {$IFDEF PORTUGUES} // Modo de abertura do banco de dados: "Abrir ou Criar"
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Modo de apertura de la base de datos: "Abrir o Crear"
                                                                                                                          {$ELSE}// Database open mode: "Open or Create"
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TFBConfigurationParameter.Pooled, True);                                                     {$IFDEF PORTUGUES} // Ativa o uso de pool de conexões
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Activa el uso de pool de conexiones
                                                                                                                          {$ELSE}// Enables connection pooling
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TFBConfigurationParameter.PoolMaxItems, 50);                                                 {$IFDEF PORTUGUES} // Número máximo de conexões no pool
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Número máximo de conexiones en el pool
                                                                                                                          {$ELSE}// Maximum number of connections in the pool
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TFBConfigurationParameter.PoolExpireTimeout, 90000);                                         {$IFDEF PORTUGUES} // Tempo de expiração para uma conexão inativa (ms)
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Tiempo de expiración para una conexión inactiva (ms)
                                                                                                                          {$ELSE}// Expiration time for an idle connection (ms)
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TFBConfigurationParameter.PoolCleanupTimeout, 30000);                                        {$IFDEF PORTUGUES} // Tempo de limpeza periódica do pool (ms)
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Tiempo de limpieza periódica del pool (ms)
                                                                                                                          {$ELSE}// Periodic cleanup time for the pool (ms)
                                                                                                                          {$ENDIF}{$ENDIF}
  *)

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Configura o middleware do Horse e define a rota para a aplicação.
  /// </summary>
  /// <remarks>
  ///   Este trecho configura o middleware do Horse, incluindo compressão de resposta,
  ///   manipulação de JSON, tratamento de exceções e conexão com o banco de dados Firebird.
  /// </remarks>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Configura el middleware de Horse y define la ruta para la aplicación.
    /// </summary>
    /// <remarks>
    ///   Este fragmento configura el middleware de Horse, incluyendo compresión de respuesta,
    ///   manipulación de JSON, manejo de excepciones y conexión con la base de datos Firebird.
    /// </remarks>
    {$ELSE}
    /// <summary>
    ///   Configures Horse middleware and defines the route for the application.
    /// </summary>
    /// <remarks>
    ///   This snippet configures Horse middleware, including response compression,
    ///   JSON handling, exception management, and connection to the Firebird database.
    /// </remarks>
    {$ENDIF}
  {$ENDIF}
  THorse
    .Use(Compression())       {$IFDEF PORTUGUES}// Middleware para compressão de respostas HTTP
                              {$ELSE}{$IFDEF ESPANHOL}// Middleware para compresión de respuestas HTTP
                              {$ELSE} // Middleware for HTTP response compression
                              {$ENDIF}{$ENDIF}

    .Use(Jhonson)             {$IFDEF PORTUGUES}// Middleware para manipulação de JSON
                              {$ELSE}{$IFDEF ESPANHOL}// Middleware para manejo de JSON
                              {$ELSE} // Middleware for JSON handling
                              {$ENDIF}{$ENDIF}

    .Use(HandleException)     {$IFDEF PORTUGUES}// Middleware para tratamento de exceções
                              {$ELSE}{$IFDEF ESPANHOL}// Middleware para manejo de excepciones
                              {$ELSE} // Middleware for exception handling
                              {$ENDIF}{$ENDIF}

    .Use(HorseConnectionFB);  {$IFDEF PORTUGUES}// Middleware para gerenciar a conexão com o Firebird
                              {$ELSE}{$IFDEF ESPANHOL}// Middleware para gestionar la conexión con Firebird
                              {$ELSE} // Middleware to manage the Firebird connection
                              {$ENDIF}{$ENDIF}


  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Define a rota "/produtos" que consulta e retorna dados no formato JSON.
  /// </summary>
  /// <remarks>
  ///   Esta rota consulta a tabela "produtos" no banco de dados Firebird e retorna os
  ///   dados no formato JSON, utilizando a conexão configurada pelo middleware.
  /// </remarks>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Define la ruta "/productos" que consulta y devuelve datos en formato JSON.
    /// </summary>
    /// <remarks>
    ///   Esta ruta consulta la tabla "productos" en la base de datos Firebird y devuelve los
    ///   datos en formato JSON, utilizando la conexión configurada por el middleware.
    /// </remarks>
    {$ELSE}
    /// <summary>
    ///   Defines the "/produtos" route that queries and returns data in JSON format.
    /// </summary>
    /// <remarks>
    ///   This route queries the "produtos" table in the Firebird database and returns the
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
        {$IFDEF PORTUGUES}{ Define o prefixo de conexão e o banco de dados, se necessário }
        {$ELSE} {$IFDEF ESPANHOL}{ Define el prefijo de conexión y la base de datos, si es necesario }
        {$ELSE}{ Defines the connection prefix and database, if necessary }
        {$ENDIF}{$ENDIF}
        SetConnectionPrefix(EmptyStr);  {$IFDEF PORTUGUES}// Prefixo do pool de conexão, se especificado
                                        {$ELSE}{$IFDEF ESPANHOL}// Prefijo del pool de conexiones, si se especifica
                                        {$ELSE} // Connection pool prefix, if specified
                                        {$ENDIF}{$ENDIF}

        SetDatabase(EmptyStr);          {$IFDEF PORTUGUES}// Caminho do banco de dados, se especificado
                                        {$ELSE}{$IFDEF ESPANHOL}// Ruta de la base de datos, si se especifica
                                        {$ELSE} // Database path, if specified
                                        {$ENDIF}{$ENDIF}

        {$IFDEF PORTUGUES}{ Configura a consulta SQL }
        {$ELSE} {$IFDEF ESPANHOL}{ Configura la consulta SQL }
        {$ELSE}{ Configures the SQL query }
        {$ENDIF}{$ENDIF}
        FDQuery.Connection := GetConnection(TConnectionType.FB);   {$IFDEF PORTUGUES}// Obtém a conexão do middleware
                                                                   {$ELSE}{$IFDEF ESPANHOL}// Obtiene la conexión del middleware
                                                                   {$ELSE} // Gets the connection from the middleware
                                                                   {$ENDIF}{$ENDIF}
        FDQuery.SQL.Text := 'SELECT * FROM produtos';
        FDQuery.Open;

        {$IFDEF PORTUGUES}{ Constrói o JSON com os dados dos produtos }
        {$ELSE} {$IFDEF ESPANHOL}{ Construye el JSON con los datos de los productos }
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

        { Envia a resposta como JSON }
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
  ///   Esta rota consulta a tabela "produtos" no banco de dados Firebird e retorna os
  ///   dados no formato JSON, utilizando a conexão configurada pelo middleware.
  ///   A conexão é obtida diretamente com a função <c>GetQuery</c>, que simplifica
  ///   a criação e gerenciamento da consulta no FireDAC.
  /// </remarks>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Define la ruta "/producto" que consulta y devuelve datos en formato JSON.
    /// </summary>
    /// <remarks>
    ///   Esta ruta consulta la tabla "productos" en la base de datos Firebird y devuelve los
    ///   datos en formato JSON, utilizando la conexión configurada por el middleware.
    ///   La conexión se obtiene directamente con la función <c>GetQuery</c>, que simplifica
    ///   la creación y gestión de la consulta en FireDAC.
    /// </remarks>
    {$ELSE}
    /// <summary>
    ///   Defines the "/produto" route that queries and returns data in JSON format.
    /// </summary>
    /// <remarks>
    ///   This route queries the "produtos" table in the Firebird database and returns the
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
      SetConnectionPrefix(EmptyStr);  {$IFDEF PORTUGUES}// Prefixo do pool de conexão, se especificado
                                      {$ELSE}{$IFDEF ESPANHOL}// Prefijo del pool de conexiones, si se especifica
                                      {$ELSE} // Connection pool prefix, if specified
                                      {$ENDIF}{$ENDIF}

      SetDatabase(EmptyStr);          {$IFDEF PORTUGUES}// Caminho do banco de dados, se especificado
                                      {$ELSE}{$IFDEF ESPANHOL}// Ruta de la base de datos, si se especifica
                                      {$ELSE} // Database path, if specified
                                      {$ENDIF}{$ENDIF}

      FDQuery := GetQuery(TConnectionType.FB);   {$IFDEF PORTUGUES}// Obtém a conexão do middleware com a função GetQuery
                                                {$ELSE}{$IFDEF ESPANHOL}// Obtiene la conexión del middleware con la función GetQuery
                                                {$ELSE} // Gets the connection from the middleware with GetQuery function
                                                {$ENDIF}{$ENDIF}
      try
        {$IFDEF PORTUGUES}{ Configura a consulta SQL }
        {$ELSE}{$IFDEF ESPANHOL}{ Configura la consulta SQL }
        {$ELSE}{ Configures the SQL query }
        {$ENDIF}{$ENDIF}
        FDQuery.SQL.Text := 'SELECT * FROM produtos';
        FDQuery.Open;

        {$IFDEF PORTUGUES}{ Constrói o JSON com os dados dos produtos }
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
        {$ELSE}{$IFDEF ESPANHOL}{ Envía la respuesta como JSON }
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
    ///   O servidor ficará disponível para receber requisições HTTP.
    /// </remarks>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Inicia el servidor Horse en el puerto 9000.
    /// </summary>
    /// <remarks>
    ///   El servidor estará disponible para recibir solicitudes HTTP.
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

