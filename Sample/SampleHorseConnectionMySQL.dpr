{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Descrição:                                                            }
{   Este exemplo faz parte do projeto HorseConnection e demonstra o uso }
{   do framework Horse com uma conexão ao banco de dados MySQL          }
{   utilizando o FireDAC. A conexão é configurada por meio de           }
{   parâmetros definidos com a função ApplyDatabaseConfiguration, e o   }
{   middleware HorseConnectionMySQL é usado para centralizar a          }
{   configuração da conexão. Este middleware permite uma integração     }
{   com o Horse para cada requisição HTTP, garantindo que a conexão     }
{   com o banco de dados MySQL seja gerenciada automaticamente.         }
{                                                                       }
{ Parâmetros de Configuração:                                           }
{   A função ApplyDatabaseConfiguration permite configurar os           }
{   seguintes parâmetros padrão para a conexão com o MySQL:             }
{                                                                       }
{     - Server: String                                                  }
{       Endereço do servidor onde o banco de dados MySQL está           }
{       hospedado. Pode ser um endereço IP ou hostname.                 }
{                                                                       }
{     - Port: Integer                                                   }
{       Porta de comunicação com o servidor MySQL. O valor padrão       }
{       costuma ser 3306.                                               }
{                                                                       }
{     - Database: String                                                }
{       Nome do banco de dados que será acessado.                       }
{                                                                       }
{     - UserName: String                                                }
{       Nome de usuário para autenticação no banco de dados.            }
{                                                                       }
{     - Password: String                                                }
{       Senha de acesso ao banco de dados.                              }
{                                                                       }
{     - VendorLib: String                                               }
{       Caminho para a biblioteca do fornecedor (DLL) necessária para   }
{       o FireDAC se comunicar com o MySQL. A DLL padrão é "libmysql.dll" }
{       e deve corresponder à arquitetura da aplicação (32 ou 64 bits). }
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
{                                                                       }
{ Erros Comuns (Troubleshooting):                                       }
{   Abaixo estão alguns erros comuns que podem ocorrer ao configurar    }
{   e utilizar a conexão com o MySQL e como resolvê-los:                }
{                                                                       }
{     - VendorLib não especificado ou incorreto:                        }
{       Se o parâmetro 'VendorLib' estiver vazio ou se a DLL 'libmysql.dll' }
{       não corresponder à arquitetura correta (32 ou 64 bits), o FireDAC }
{       não conseguirá se conectar ao MySQL.                            }
{       Solução: Defina o caminho correto para a DLL 'libmysql.dll'     }
{       que corresponda à arquitetura do seu aplicativo. Para sistemas  }
{       de 32 bits, utilize a versão de 32 bits da DLL, e para 64 bits, }
{       utilize a versão de 64 bits.                                    }
{                                                                       }
{     - Banco de Dados não especificado:                                }
{       Caso o parâmetro 'Database' não seja fornecido, o FireDAC não   }
{       conseguirá localizar o banco de dados e levantará uma exceção   }
{       indicando que o banco de dados não foi especificado.            }
{       Solução: Defina o nome do banco de dados a ser acessado.        }
{                                                                       }
{     - Erro de Conexão com o Servidor:                                 }
{       Se o servidor MySQL estiver inacessível ou as credenciais       }
{       estiverem incorretas, ocorrerá um erro de conexão.              }
{       Solução: Verifique se o endereço do servidor, a porta, o        }
{       nome de usuário e a senha estão corretos e que o servidor está  }
{       acessível.                                                      }
{                                                                       }
{     - Tabela não encontrada no MySQL:                                 }
{       Quando uma consulta tenta acessar uma tabela inexistente,       }
{       o MySQL gera uma exceção informando que a tabela não foi        }
{       encontrada. Esse erro ocorre com frequência quando o nome       }
{       da tabela está incorreto ou o banco de dados é diferente.       }
{       Solução: Verifique se a tabela existe no banco de dados e       }
{       se o nome foi escrito corretamente.                             }
{                                                                       }
{     - Configuração de Time Zone:                                      }
{       Alguns ambientes MySQL requerem que o time zone seja            }
{       configurado explicitamente. Caso contrário, podem ocorrer       }
{       problemas em operações que dependem de data e hora.             }
{       Solução: Verifique a configuração de time zone do MySQL         }
{       e ajuste conforme necessário para o ambiente.                   }
{                                                                       }
{     - Limites de Conexão:                                             }
{       O MySQL impõe um limite no número de conexões simultâneas       }
{       permitidas. Esse limite pode ser alcançado em ambientes de      }
{       alta carga, causando falhas de conexão.                         }
{       Solução: Considere ajustar o limite de conexões no MySQL        }
{       (`max_connections`) ou otimize o uso de conexões no             }
{       aplicativo para evitar alcançar o limite.                       }
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
  {   MySQL utilizando FireDAC. La conexión se configura mediante         }
  {   parámetros definidos con la función ApplyDatabaseConfiguration, y   }
  {   el middleware HorseConnectionMySQL se utiliza para centralizar la   }
  {   configuración de la conexión. Este middleware permite una           }
  {   integración con Horse para cada solicitud HTTP, asegurando que      }
  {   la conexión a la base de datos MySQL se gestione                    }
  {   automáticamente.                                                    }
  {                                                                       }
  { Parámetros de Configuración:                                          }
  {   La función ApplyDatabaseConfiguration permite configurar los        }
  {   siguientes parámetros predeterminados para la conexión con MySQL:   }
  {                                                                       }
  {     - Server: String                                                  }
  {       Dirección del servidor donde se aloja la base de datos MySQL.   }
  {       Puede ser una dirección IP o un nombre de host.                 }
  {                                                                       }
  {     - Port: Integer                                                   }
  {       Puerto de comunicación con el servidor MySQL. El valor          }
  {       predeterminado suele ser 3306.                                  }
  {                                                                       }
  {     - Database: String                                                }
  {       Nombre de la base de datos a la que se accederá.                }
  {                                                                       }
  {     - UserName: String                                                }
  {       Nombre de usuario para la autenticación en la base de datos.    }
  {                                                                       }
  {     - Password: String                                                }
  {       Contraseña para el acceso a la base de datos.                   }
  {                                                                       }
  {     - VendorLib: String                                               }
  {       Ruta de la biblioteca del proveedor (DLL) necesaria para que    }
  {       FireDAC se comunique con MySQL. La DLL predeterminada es        }
  {       "libmysql.dll" y debe coincidir con la arquitectura de la       }
  {       aplicación (32 o 64 bits).                                      }
  {                                                                       }
  {     - Pooled: Boolean                                                 }
  {       Define si la conexión se gestionará como un pool de conexiones, }
  {       mejorando el rendimiento al reutilizar conexiones inactivas.    }
  {                                                                       }
  {     - PoolMaxItems: Integer                                           }
  {       Número máximo de conexiones permitidas en el pool de conexiones.}
  {                                                                       }
  {     - PoolExpireTimeout: Integer                                      }
  {       Tiempo en milisegundos para que una conexión inactiva expire.   }
  {                                                                       }
  {     - PoolCleanupTimeout: Integer                                     }
  {       Tiempo en milisegundos para la limpieza periódica de conexiones }
  {       expiradas en el pool.                                           }
  {                                                                       }
  { Errores Comunes (Troubleshooting):                                    }
  {   A continuación se describen algunos errores comunes que pueden      }
  {   ocurrir al configurar y utilizar la conexión con MySQL:             }
  {                                                                       }
  {     - VendorLib no especificado o incorrecto:                         }
  {       Si el parámetro 'VendorLib' está vacío o si la DLL 'libmysql.dll' }
  {       no coincide con la arquitectura correcta (32 o 64 bits),        }
  {       FireDAC no podrá conectarse a MySQL.                            }
  {       Solución: Establezca la ruta correcta para la DLL 'libmysql.dll' }
  {       que coincida con la arquitectura de su aplicación. Para sistemas }
  {       de 32 bits, utilice la versión de 32 bits de la DLL, y para 64  }
  {       bits, utilice la versión de 64 bits.                            }
  {                                                                       }
  {     - Base de datos no especificada:                                  }
  {       Si el parámetro 'Database' no se proporciona, FireDAC no podrá  }
  {       localizar la base de datos y lanzará una excepción indicando    }
  {       que la base de datos no fue especificada.                       }
  {       Solución: Defina el nombre de la base de datos al que se        }
  {       accederá.                                                       }
  {                                                                       }
  {     - Error de conexión con el servidor:                              }
  {       Si el servidor MySQL está inaccesible o las credenciales son    }
  {       incorrectas, ocurrirá un error de conexión.                     }
  {       Solución: Verifique que la dirección del servidor, el puerto,   }
  {       el nombre de usuario y la contraseña sean correctos, y que el   }
  {       servidor esté accesible.                                        }
  {                                                                       }
  {     - Tabla no encontrada en MySQL:                                   }
  {       Cuando una consulta intenta acceder a una tabla inexistente,    }
  {       MySQL genera una excepción indicando que la tabla no fue        }
  {       encontrada. Este error ocurre con frecuencia cuando el nombre   }
  {       de la tabla es incorrecto o la base de datos es diferente.      }
  {       Solución: Verifique que la tabla exista en la base de datos     }
  {       y que el nombre esté escrito correctamente.                     }
  {                                                                       }
  {     - Configuración de Time Zone:                                     }
  {       Algunos entornos MySQL requieren que la zona horaria se         }
  {       configure explícitamente, de lo contrario pueden surgir         }
  {       problemas en operaciones basadas en fecha y hora.               }
  {       Solución: Verifique la configuración de la zona horaria         }
  {       de MySQL y ajústela según sea necesario.                        }
  {                                                                       }
  {     - Límites de Conexión:                                            }
  {       MySQL impone un límite en el número de conexiones simultáneas   }
  {       permitidas, lo que puede alcanzarse en entornos de alta carga,  }
  {       causando fallos en la conexión.                                 }
  {       Solución: Considere ajustar el límite de conexiones en MySQL    }
  {       (`max_connections`) u optimice el uso de conexiones en la       }
  {       aplicación para evitar alcanzar el límite.                      }
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
  {   the MySQL database using FireDAC. The connection is configured      }
  {   through parameters defined with the ApplyDatabaseConfiguration      }
  {   function, and the HorseConnectionMySQL middleware is used to        }
  {   centralize the connection configuration. This middleware enables    }
  {   integration with Horse for each HTTP request, ensuring that the     }
  {   MySQL database connection is automatically managed.                 }
  {                                                                       }
  { Configuration Parameters:                                             }
  {   The ApplyDatabaseConfiguration function allows configuring the      }
  {   following default parameters for the MySQL connection:              }
  {                                                                       }
  {     - Server: String                                                  }
  {       Server address where the MySQL database is hosted.              }
  {       It can be an IP address or a hostname.                          }
  {                                                                       }
  {     - Port: Integer                                                   }
  {       Communication port with the MySQL server. The default           }
  {       value is usually 3306.                                          }
  {                                                                       }
  {     - Database: String                                                }
  {       Name of the database to be accessed.                            }
  {                                                                       }
  {     - UserName: String                                                }
  {       Username for database authentication.                           }
  {                                                                       }
  {     - Password: String                                                }
  {       Password for database access.                                   }
  {                                                                       }
  {     - VendorLib: String                                               }
  {       Path to the vendor library (DLL) required for FireDAC to        }
  {       communicate with MySQL. The default DLL is "libmysql.dll" and   }
  {       it must match the application architecture (32 or 64-bit).      }
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
  { Troubleshooting:                                                      }
  {   Below are some common errors that may occur when setting up and     }
  {   using the MySQL connection and how to resolve them:                 }
  {                                                                       }
  {     - VendorLib not specified or incorrect:                           }
  {       If the 'VendorLib' parameter is empty or if the 'libmysql.dll'  }
  {       does not match the correct architecture (32 or 64-bit), FireDAC }
  {       will be unable to connect to MySQL.                             }
  {       Solution: Set the correct path for 'libmysql.dll' that matches  }
  {       your application architecture. For 32-bit systems, use the 32-  }
  {       bit DLL version, and for 64-bit systems, use the 64-bit version.}
  {                                                                       }
  {     - Database not specified:                                         }
  {       If the 'Database' parameter is not provided, FireDAC will       }
  {       be unable to locate the database and will raise an exception    }
  {       indicating that the database was not specified.                 }
  {       Solution: Define the name of the database to be accessed.       }
  {                                                                       }
  {     - Connection error with the server:                               }
  {       If the MySQL server is inaccessible or the credentials are      }
  {       incorrect, a connection error will occur.                       }
  {       Solution: Verify the server address, port, username, and        }
  {       password are correct and that the server is accessible.         }
  {                                                                       }
  {     - Table not found in MySQL:                                       }
  {       When a query attempts to access a non-existent table, MySQL     }
  {       will raise an exception indicating that the table was not       }
  {       found. This error often occurs when the table name is           }
  {       misspelled or the database is different.                        }
  {       Solution: Verify that the table exists in the database and      }
  {       that the name is spelled correctly.                             }
  {                                                                       }
  {     - Time Zone configuration:                                        }
  {       Some MySQL environments require explicit configuration of the   }
  {       time zone to avoid issues in date and time-dependent operations.}
  {       Solution: Check the MySQL time zone settings and adjust         }
  {       accordingly for your environment.                               }
  {                                                                       }
  {     - Connection Limits:                                              }
  {       MySQL imposes a limit on the number of simultaneous connections }
  {       allowed, which can be reached in high-load environments,        }
  {       causing connection failures.                                    }
  {       Solution: Consider adjusting the MySQL `max_connections` limit  }
  {       or optimize connection usage in the application to avoid        }
  {       hitting the limit.                                              }
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


program SampleHorseConnectionMySQL;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  Horse.HandleException,
  Horse.Compression,

  Horse.Connection,
  Horse.Connection.MySQL, // Middleware específico para MySQL

  FireDAC.Comp.Client,

  System.SysUtils,
  System.JSON;

begin
  ReportMemoryLeaksOnShutdown := True;

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Configura os parâmetros de conexão para o banco de dados MySQL.
  /// </summary>
  /// <remarks>
  ///   A função <c>ApplyDatabaseConfiguration</c> permite definir configurações específicas
  ///   para a conexão com o banco de dados MySQL, utilizando o FireDAC como camada de acesso.
  ///   Abaixo estão descritos os parâmetros:
  /// </remarks>
  /// <param name="Server">
  ///   Endereço do servidor onde o banco de dados MySQL está hospedado. Pode ser um endereço
  ///   IP ou um hostname. O padrão costuma ser "localhost" para desenvolvimento local.
  /// </param>
  /// <param name="Port">
  ///   Porta de conexão para o servidor MySQL. O valor padrão para MySQL é 3306, mas
  ///   pode ser alterado conforme a configuração do servidor.
  /// </param>
  /// <param name="Database">
  ///   Nome do banco de dados a ser acessado. Esse parâmetro especifica o banco de dados
  ///   onde as consultas serão realizadas.
  /// </param>
  /// <param name="UserName">
  ///   Nome de usuário para autenticação no banco de dados MySQL.
  /// </param>
  /// <param name="Password">
  ///   Senha de acesso ao banco de dados MySQL, usada em conjunto com o <c>UserName</c> para
  ///   autenticação segura.
  /// </param>
  /// <param name="VendorLib">
  ///   Caminho para a biblioteca do fornecedor (DLL) necessária para o FireDAC se comunicar
  ///   com o MySQL. A biblioteca padrão é "libmysql.dll" e deve corresponder à arquitetura da
  ///   aplicação (32 ou 64 bits).
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
  ///   Tempo em milissegundos para que uma conexão inativa expire. Conexões que permanecerem
  ///   ociosas por este período serão automaticamente fechadas pelo pool.
  /// </param>
  /// <param name="PoolCleanupTimeout">
  ///   Tempo em milissegundos para a limpeza periódica das conexões expiradas no pool. Este
  ///   parâmetro define a frequência com que o pool verifica e elimina conexões ociosas.
  /// </param>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Configura los parámetros de conexión para la base de datos MySQL.
    /// </summary>
    /// <remarks>
    ///   La función <c>ApplyDatabaseConfiguration</c> permite definir configuraciones específicas
    ///   para la conexión a la base de datos MySQL, utilizando FireDAC como capa de acceso.
    ///   A continuación se describen los parámetros:
    /// </remarks>
    /// <param name="Server">
    ///   Dirección del servidor donde está alojada la base de datos MySQL. Puede ser una dirección
    ///   IP o un nombre de host. El valor predeterminado suele ser "localhost" para desarrollo local.
    /// </param>
    /// <param name="Port">
    ///   Puerto de conexión para el servidor MySQL. El valor predeterminado para MySQL es 3306,
    ///   pero se puede cambiar según la configuración del servidor.
    /// </param>
    /// <param name="Database">
    ///   Nombre de la base de datos a la que se accederá. Este parámetro especifica la base de datos
    ///   en la que se realizarán las consultas.
    /// </param>
    /// <param name="UserName">
    ///   Nombre de usuario para autenticación en la base de datos MySQL.
    /// </param>
    /// <param name="Password">
    ///   Contraseña de acceso a la base de datos MySQL, utilizada junto con <c>UserName</c> para
    ///   la autenticación segura.
    /// </param>
    /// <param name="VendorLib">
    ///   Ruta a la biblioteca del proveedor (DLL) necesaria para que FireDAC se comunique con MySQL.
    ///   La biblioteca predeterminada es "libmysql.dll" y debe coincidir con la arquitectura de
    ///   la aplicación (32 o 64 bits).
    /// </param>
    /// <param name="Pooled">
    ///   Define si la conexión se gestionará como un pool de conexiones. El uso de pool de conexiones
    ///   mejora el rendimiento al reutilizar conexiones inactivas, reduciendo la sobrecarga de creación
    ///   y destrucción de conexiones.
    /// </param>
    /// <param name="PoolMaxItems">
    ///   Número máximo de conexiones permitidas en el pool. Este parámetro controla el tamaño del pool,
    ///   asegurando que no se cree un número excesivo de conexiones.
    /// </param>
    /// <param name="PoolExpireTimeout">
    ///   Tiempo en milisegundos para que una conexión inactiva expire. Las conexiones que permanezcan
    ///   inactivas por este período se cerrarán automáticamente por el pool.
    /// </param>
    /// <param name="PoolCleanupTimeout">
    ///   Tiempo en milisegundos para la limpieza periódica de las conexiones expiradas en el pool. Este
    ///   parámetro define la frecuencia con la que el pool verifica y elimina conexiones inactivas.
    /// </param>
    {$ELSE}
    /// <summary>
    ///   Configures connection parameters for the MySQL database.
    /// </summary>
    /// <remarks>
    ///   The <c>ApplyDatabaseConfiguration</c> function allows specific configurations
    ///   for the MySQL database connection, using FireDAC as the access layer.
    ///   The parameters are described below:
    /// </remarks>
    /// <param name="Server">
    ///   Server address where the MySQL database is hosted. It can be an IP address
    ///   or a hostname. The default is usually "localhost" for local development.
    /// </param>
    /// <param name="Port">
    ///   Connection port for the MySQL server. The default port for MySQL is 3306,
    ///   but it can be changed according to the server configuration.
    /// </param>
    /// <param name="Database">
    ///   Name of the database to be accessed. This parameter specifies the database
    ///   where queries will be executed.
    /// </param>
    /// <param name="UserName">
    ///   Username for authentication on the MySQL database.
    /// </param>
    /// <param name="Password">
    ///   Password for MySQL database access, used together with <c>UserName</c> for
    ///   secure authentication.
    /// </param>
    /// <param name="VendorLib">
    ///   Path to the vendor library (DLL) required for FireDAC to communicate with
    ///   MySQL. The default library is "libmysql.dll" and it must match the application
    ///   architecture (32 or 64 bits).
    /// </param>
    /// <param name="Pooled">
    ///   Specifies whether the connection will be managed as a pool. Connection pooling
    ///   enhances performance by reusing idle connections, reducing the overhead of
    ///   creating and destroying connections.
    /// </param>
    /// <param name="PoolMaxItems">
    ///   Maximum number of connections allowed in the pool. This parameter controls the
    ///   pool size, ensuring that an excessive number of connections is not created.
    /// </param>
    /// <param name="PoolExpireTimeout">
    ///   Time in milliseconds for an idle connection to expire. Connections that remain
    ///   idle for this period will be automatically closed by the pool.
    /// </param>
    /// <param name="PoolCleanupTimeout">
    ///   Time in milliseconds for periodic cleanup of expired connections in the pool.
    ///   This parameter defines the frequency at which the pool checks and removes idle
    ///   connections.
    /// </param>
    {$ENDIF}
  {$ENDIF}

  (*
  ApplyDatabaseConfiguration(TMySQLConfigurationParameter.Server, 'localhost');                                           {$IFDEF PORTUGUES} // Endereço do servidor onde o MySQL está hospedado
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Dirección del servidor donde se aloja MySQL
                                                                                                                          {$ELSE}// Server address where MySQL is hosted
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TMySQLConfigurationParameter.Port, 3306);                                                    {$IFDEF PORTUGUES} // Porta de conexão com o servidor MySQL
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Puerto de conexión con el servidor MySQL
                                                                                                                          {$ELSE}// Connection port for the MySQL server
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TMySQLConfigurationParameter.Database, 'db');                                                {$IFDEF PORTUGUES} // Nome do banco de dados a ser acessado
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Nombre de la base de datos a acceder
                                                                                                                          {$ELSE}// Name of the database to access
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TMySQLConfigurationParameter.UserName, 'root');                                              {$IFDEF PORTUGUES} // Nome de usuário para autenticação no MySQL
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Nombre de usuario para autenticación en MySQL
                                                                                                                          {$ELSE}// Username for MySQL authentication
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TMySQLConfigurationParameter.Password, 'password');                                          {$IFDEF PORTUGUES} // Senha de acesso ao banco de dados
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Contraseña para acceder a la base de datos
                                                                                                                          {$ELSE}// Password for database access
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TMySQLConfigurationParameter.VendorLib, 'path/libmysql.dll');                                     {$IFDEF PORTUGUES} // Caminho para a biblioteca do MySQL (DLL). Deve ser compatível com a arquitetura (32/64 bits)
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Ruta de la biblioteca de MySQL (DLL). Debe ser compatible con la arquitectura (32/64 bits)
                                                                                                                          {$ELSE}// Path to the MySQL library (DLL). Must match architecture (32/64 bits)
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TMySQLConfigurationParameter.Pooled, True);                                                  {$IFDEF PORTUGUES} // Ativa o uso de pool de conexões
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Activa el uso de pool de conexiones
                                                                                                                          {$ELSE}// Enables connection pooling
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TMySQLConfigurationParameter.PoolMaxItems, 50);                                              {$IFDEF PORTUGUES} // Número máximo de conexões no pool
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Número máximo de conexiones en el pool
                                                                                                                          {$ELSE}// Maximum number of connections in the pool
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TMySQLConfigurationParameter.PoolExpireTimeout, 90000);                                      {$IFDEF PORTUGUES} // Tempo de expiração para uma conexão inativa (ms)
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Tiempo de expiración para una conexión inactiva (ms)
                                                                                                                          {$ELSE}// Expiration time for an idle connection (ms)
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TMySQLConfigurationParameter.PoolCleanupTimeout, 30000);                                     {$IFDEF PORTUGUES} // Tempo de limpeza periódica do pool (ms)
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
  ///   manipulação de JSON, tratamento de exceções e conexão com o banco de dados MySQL.
  /// </remarks>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Configura el middleware de Horse y define la ruta para la aplicación.
    /// </summary>
    /// <remarks>
    ///   Este fragmento configura el middleware de Horse, incluyendo compresión de respuesta,
    ///   manejo de JSON, manejo de excepciones y conexión con la base de datos MySQL.
    /// </remarks>
    {$ELSE}
    /// <summary>
    ///   Configures Horse middleware and defines the route for the application.
    /// </summary>
    /// <remarks>
    ///   This snippet configures Horse middleware, including response compression,
    ///   JSON handling, exception management, and connection to the MySQL database.
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

    .Use(HorseConnectionMySQL);  {$IFDEF PORTUGUES}// Middleware para gerenciar a conexão com o MySQL
                              {$ELSE}{$IFDEF ESPANHOL}// Middleware para gestionar la conexión con MySQL
                              {$ELSE} // Middleware to manage the MySQL connection
                              {$ENDIF}{$ENDIF}


  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Define a rota "/produtos" que consulta e retorna dados no formato JSON.
  /// </summary>
  /// <remarks>
  ///   Esta rota consulta a tabela "produtos" no banco de dados MySQL e retorna os
  ///   dados no formato JSON, utilizando a conexão configurada pelo middleware.
  /// </remarks>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Define la ruta "/productos" que consulta y devuelve datos en formato JSON.
    /// </summary>
    /// <remarks>
    ///   Esta ruta consulta la tabla "productos" en la base de datos MySQL y devuelve los
    ///   datos en formato JSON, utilizando la conexión configurada por el middleware.
    /// </remarks>
    {$ELSE}
    /// <summary>
    ///   Defines the "/produtos" route that queries and returns data in JSON format.
    /// </summary>
    /// <remarks>
    ///   This route queries the "produtos" table in the MySQL database and returns the
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
        FDQuery.Connection := GetConnection(TConnectionType.MySQL);   {$IFDEF PORTUGUES}// Obtém a conexão do middleware
                                                                      {$ELSE}{$IFDEF ESPANHOL}// Obtiene la conexión del middleware
                                                                      {$ELSE} // Gets the connection from the middleware
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
  ///   Define a rota "/produto" que consulta e retorna dados no formato JSON.
  /// </summary>
  /// <remarks>
  ///   Esta rota consulta a tabela "produtos" no banco de dados MySQL e retorna os
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
    ///   Esta ruta consulta la tabla "productos" en la base de datos MySQL y devuelve los
    ///   datos en formato JSON, utilizando la conexión configurada por el middleware.
    ///   La conexión se obtiene directamente con la función <c>GetQuery</c>, que simplifica
    ///   la creación y gestión de la consulta en FireDAC.
    /// </remarks>
    {$ELSE}
    /// <summary>
    ///   Defines the "/produto" route that queries and returns data in JSON format.
    /// </summary>
    /// <remarks>
    ///   This route queries the "produtos" table in the MySQL database and returns the
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

      SetDatabase(EmptyStr);          {$IFDEF PORTUGUES}// Nome do banco de dados, se especificado
                                      {$ELSE}{$IFDEF ESPANHOL}// Nombre de la base de datos, si se especifica
                                      {$ELSE} // Database name, if specified
                                      {$ENDIF}{$ENDIF}

      FDQuery := GetQuery(TConnectionType.MySQL);   {$IFDEF PORTUGUES}// Obtém a conexão do middleware com a função GetQuery
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
