{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Descri��o:                                                            }
{   Este exemplo faz parte do projeto HorseConnection e demonstra o uso }
{   do framework Horse com uma conex�o ao banco de dados MySQL          }
{   utilizando o FireDAC. A conex�o � configurada por meio de           }
{   par�metros definidos com a fun��o ApplyDatabaseConfiguration, e o   }
{   middleware HorseConnectionMySQL � usado para centralizar a          }
{   configura��o da conex�o. Este middleware permite uma integra��o     }
{   com o Horse para cada requisi��o HTTP, garantindo que a conex�o     }
{   com o banco de dados MySQL seja gerenciada automaticamente.         }
{                                                                       }
{ Par�metros de Configura��o:                                           }
{   A fun��o ApplyDatabaseConfiguration permite configurar os           }
{   seguintes par�metros padr�o para a conex�o com o MySQL:             }
{                                                                       }
{     - Server: String                                                  }
{       Endere�o do servidor onde o banco de dados MySQL est�           }
{       hospedado. Pode ser um endere�o IP ou hostname.                 }
{                                                                       }
{     - Port: Integer                                                   }
{       Porta de comunica��o com o servidor MySQL. O valor padr�o       }
{       costuma ser 3306.                                               }
{                                                                       }
{     - Database: String                                                }
{       Nome do banco de dados que ser� acessado.                       }
{                                                                       }
{     - UserName: String                                                }
{       Nome de usu�rio para autentica��o no banco de dados.            }
{                                                                       }
{     - Password: String                                                }
{       Senha de acesso ao banco de dados.                              }
{                                                                       }
{     - VendorLib: String                                               }
{       Caminho para a biblioteca do fornecedor (DLL) necess�ria para   }
{       o FireDAC se comunicar com o MySQL. A DLL padr�o � "libmysql.dll" }
{       e deve corresponder � arquitetura da aplica��o (32 ou 64 bits). }
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
{ Erros Comuns (Troubleshooting):                                       }
{   Abaixo est�o alguns erros comuns que podem ocorrer ao configurar    }
{   e utilizar a conex�o com o MySQL e como resolv�-los:                }
{                                                                       }
{     - VendorLib n�o especificado ou incorreto:                        }
{       Se o par�metro 'VendorLib' estiver vazio ou se a DLL 'libmysql.dll' }
{       n�o corresponder � arquitetura correta (32 ou 64 bits), o FireDAC }
{       n�o conseguir� se conectar ao MySQL.                            }
{       Solu��o: Defina o caminho correto para a DLL 'libmysql.dll'     }
{       que corresponda � arquitetura do seu aplicativo. Para sistemas  }
{       de 32 bits, utilize a vers�o de 32 bits da DLL, e para 64 bits, }
{       utilize a vers�o de 64 bits.                                    }
{                                                                       }
{     - Banco de Dados n�o especificado:                                }
{       Caso o par�metro 'Database' n�o seja fornecido, o FireDAC n�o   }
{       conseguir� localizar o banco de dados e levantar� uma exce��o   }
{       indicando que o banco de dados n�o foi especificado.            }
{       Solu��o: Defina o nome do banco de dados a ser acessado.        }
{                                                                       }
{     - Erro de Conex�o com o Servidor:                                 }
{       Se o servidor MySQL estiver inacess�vel ou as credenciais       }
{       estiverem incorretas, ocorrer� um erro de conex�o.              }
{       Solu��o: Verifique se o endere�o do servidor, a porta, o        }
{       nome de usu�rio e a senha est�o corretos e que o servidor est�  }
{       acess�vel.                                                      }
{                                                                       }
{     - Tabela n�o encontrada no MySQL:                                 }
{       Quando uma consulta tenta acessar uma tabela inexistente,       }
{       o MySQL gera uma exce��o informando que a tabela n�o foi        }
{       encontrada. Esse erro ocorre com frequ�ncia quando o nome       }
{       da tabela est� incorreto ou o banco de dados � diferente.       }
{       Solu��o: Verifique se a tabela existe no banco de dados e       }
{       se o nome foi escrito corretamente.                             }
{                                                                       }
{     - Configura��o de Time Zone:                                      }
{       Alguns ambientes MySQL requerem que o time zone seja            }
{       configurado explicitamente. Caso contr�rio, podem ocorrer       }
{       problemas em opera��es que dependem de data e hora.             }
{       Solu��o: Verifique a configura��o de time zone do MySQL         }
{       e ajuste conforme necess�rio para o ambiente.                   }
{                                                                       }
{     - Limites de Conex�o:                                             }
{       O MySQL imp�e um limite no n�mero de conex�es simult�neas       }
{       permitidas. Esse limite pode ser alcan�ado em ambientes de      }
{       alta carga, causando falhas de conex�o.                         }
{       Solu��o: Considere ajustar o limite de conex�es no MySQL        }
{       (`max_connections`) ou otimize o uso de conex�es no             }
{       aplicativo para evitar alcan�ar o limite.                       }
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
  {   MySQL utilizando FireDAC. La conexi�n se configura mediante         }
  {   par�metros definidos con la funci�n ApplyDatabaseConfiguration, y   }
  {   el middleware HorseConnectionMySQL se utiliza para centralizar la   }
  {   configuraci�n de la conexi�n. Este middleware permite una           }
  {   integraci�n con Horse para cada solicitud HTTP, asegurando que      }
  {   la conexi�n a la base de datos MySQL se gestione                    }
  {   autom�ticamente.                                                    }
  {                                                                       }
  { Par�metros de Configuraci�n:                                          }
  {   La funci�n ApplyDatabaseConfiguration permite configurar los        }
  {   siguientes par�metros predeterminados para la conexi�n con MySQL:   }
  {                                                                       }
  {     - Server: String                                                  }
  {       Direcci�n del servidor donde se aloja la base de datos MySQL.   }
  {       Puede ser una direcci�n IP o un nombre de host.                 }
  {                                                                       }
  {     - Port: Integer                                                   }
  {       Puerto de comunicaci�n con el servidor MySQL. El valor          }
  {       predeterminado suele ser 3306.                                  }
  {                                                                       }
  {     - Database: String                                                }
  {       Nombre de la base de datos a la que se acceder�.                }
  {                                                                       }
  {     - UserName: String                                                }
  {       Nombre de usuario para la autenticaci�n en la base de datos.    }
  {                                                                       }
  {     - Password: String                                                }
  {       Contrase�a para el acceso a la base de datos.                   }
  {                                                                       }
  {     - VendorLib: String                                               }
  {       Ruta de la biblioteca del proveedor (DLL) necesaria para que    }
  {       FireDAC se comunique con MySQL. La DLL predeterminada es        }
  {       "libmysql.dll" y debe coincidir con la arquitectura de la       }
  {       aplicaci�n (32 o 64 bits).                                      }
  {                                                                       }
  {     - Pooled: Boolean                                                 }
  {       Define si la conexi�n se gestionar� como un pool de conexiones, }
  {       mejorando el rendimiento al reutilizar conexiones inactivas.    }
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
  { Errores Comunes (Troubleshooting):                                    }
  {   A continuaci�n se describen algunos errores comunes que pueden      }
  {   ocurrir al configurar y utilizar la conexi�n con MySQL:             }
  {                                                                       }
  {     - VendorLib no especificado o incorrecto:                         }
  {       Si el par�metro 'VendorLib' est� vac�o o si la DLL 'libmysql.dll' }
  {       no coincide con la arquitectura correcta (32 o 64 bits),        }
  {       FireDAC no podr� conectarse a MySQL.                            }
  {       Soluci�n: Establezca la ruta correcta para la DLL 'libmysql.dll' }
  {       que coincida con la arquitectura de su aplicaci�n. Para sistemas }
  {       de 32 bits, utilice la versi�n de 32 bits de la DLL, y para 64  }
  {       bits, utilice la versi�n de 64 bits.                            }
  {                                                                       }
  {     - Base de datos no especificada:                                  }
  {       Si el par�metro 'Database' no se proporciona, FireDAC no podr�  }
  {       localizar la base de datos y lanzar� una excepci�n indicando    }
  {       que la base de datos no fue especificada.                       }
  {       Soluci�n: Defina el nombre de la base de datos al que se        }
  {       acceder�.                                                       }
  {                                                                       }
  {     - Error de conexi�n con el servidor:                              }
  {       Si el servidor MySQL est� inaccesible o las credenciales son    }
  {       incorrectas, ocurrir� un error de conexi�n.                     }
  {       Soluci�n: Verifique que la direcci�n del servidor, el puerto,   }
  {       el nombre de usuario y la contrase�a sean correctos, y que el   }
  {       servidor est� accesible.                                        }
  {                                                                       }
  {     - Tabla no encontrada en MySQL:                                   }
  {       Cuando una consulta intenta acceder a una tabla inexistente,    }
  {       MySQL genera una excepci�n indicando que la tabla no fue        }
  {       encontrada. Este error ocurre con frecuencia cuando el nombre   }
  {       de la tabla es incorrecto o la base de datos es diferente.      }
  {       Soluci�n: Verifique que la tabla exista en la base de datos     }
  {       y que el nombre est� escrito correctamente.                     }
  {                                                                       }
  {     - Configuraci�n de Time Zone:                                     }
  {       Algunos entornos MySQL requieren que la zona horaria se         }
  {       configure expl�citamente, de lo contrario pueden surgir         }
  {       problemas en operaciones basadas en fecha y hora.               }
  {       Soluci�n: Verifique la configuraci�n de la zona horaria         }
  {       de MySQL y aj�stela seg�n sea necesario.                        }
  {                                                                       }
  {     - L�mites de Conexi�n:                                            }
  {       MySQL impone un l�mite en el n�mero de conexiones simult�neas   }
  {       permitidas, lo que puede alcanzarse en entornos de alta carga,  }
  {       causando fallos en la conexi�n.                                 }
  {       Soluci�n: Considere ajustar el l�mite de conexiones en MySQL    }
  {       (`max_connections`) u optimice el uso de conexiones en la       }
  {       aplicaci�n para evitar alcanzar el l�mite.                      }
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
  Horse.Connection.MySQL, // Middleware espec�fico para MySQL

  FireDAC.Comp.Client,

  System.SysUtils,
  System.JSON;

begin
  ReportMemoryLeaksOnShutdown := True;

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Configura os par�metros de conex�o para o banco de dados MySQL.
  /// </summary>
  /// <remarks>
  ///   A fun��o <c>ApplyDatabaseConfiguration</c> permite definir configura��es espec�ficas
  ///   para a conex�o com o banco de dados MySQL, utilizando o FireDAC como camada de acesso.
  ///   Abaixo est�o descritos os par�metros:
  /// </remarks>
  /// <param name="Server">
  ///   Endere�o do servidor onde o banco de dados MySQL est� hospedado. Pode ser um endere�o
  ///   IP ou um hostname. O padr�o costuma ser "localhost" para desenvolvimento local.
  /// </param>
  /// <param name="Port">
  ///   Porta de conex�o para o servidor MySQL. O valor padr�o para MySQL � 3306, mas
  ///   pode ser alterado conforme a configura��o do servidor.
  /// </param>
  /// <param name="Database">
  ///   Nome do banco de dados a ser acessado. Esse par�metro especifica o banco de dados
  ///   onde as consultas ser�o realizadas.
  /// </param>
  /// <param name="UserName">
  ///   Nome de usu�rio para autentica��o no banco de dados MySQL.
  /// </param>
  /// <param name="Password">
  ///   Senha de acesso ao banco de dados MySQL, usada em conjunto com o <c>UserName</c> para
  ///   autentica��o segura.
  /// </param>
  /// <param name="VendorLib">
  ///   Caminho para a biblioteca do fornecedor (DLL) necess�ria para o FireDAC se comunicar
  ///   com o MySQL. A biblioteca padr�o � "libmysql.dll" e deve corresponder � arquitetura da
  ///   aplica��o (32 ou 64 bits).
  /// </param>
  /// <param name="Pooled">
  ///   Define se a conex�o ser� gerida como um pool de conex�es. O pooling de conex�es
  ///   melhora o desempenho reutilizando conex�es inativas, reduzindo a sobrecarga de
  ///   cria��o e destrui��o de conex�es.
  /// </param>
  /// <param name="PoolMaxItems">
  ///   N�mero m�ximo de conex�es permitidas no pool. Este par�metro controla o tamanho do pool,
  ///   garantindo que um n�mero excessivo de conex�es n�o seja criado.
  /// </param>
  /// <param name="PoolExpireTimeout">
  ///   Tempo em milissegundos para que uma conex�o inativa expire. Conex�es que permanecerem
  ///   ociosas por este per�odo ser�o automaticamente fechadas pelo pool.
  /// </param>
  /// <param name="PoolCleanupTimeout">
  ///   Tempo em milissegundos para a limpeza peri�dica das conex�es expiradas no pool. Este
  ///   par�metro define a frequ�ncia com que o pool verifica e elimina conex�es ociosas.
  /// </param>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Configura los par�metros de conexi�n para la base de datos MySQL.
    /// </summary>
    /// <remarks>
    ///   La funci�n <c>ApplyDatabaseConfiguration</c> permite definir configuraciones espec�ficas
    ///   para la conexi�n a la base de datos MySQL, utilizando FireDAC como capa de acceso.
    ///   A continuaci�n se describen los par�metros:
    /// </remarks>
    /// <param name="Server">
    ///   Direcci�n del servidor donde est� alojada la base de datos MySQL. Puede ser una direcci�n
    ///   IP o un nombre de host. El valor predeterminado suele ser "localhost" para desarrollo local.
    /// </param>
    /// <param name="Port">
    ///   Puerto de conexi�n para el servidor MySQL. El valor predeterminado para MySQL es 3306,
    ///   pero se puede cambiar seg�n la configuraci�n del servidor.
    /// </param>
    /// <param name="Database">
    ///   Nombre de la base de datos a la que se acceder�. Este par�metro especifica la base de datos
    ///   en la que se realizar�n las consultas.
    /// </param>
    /// <param name="UserName">
    ///   Nombre de usuario para autenticaci�n en la base de datos MySQL.
    /// </param>
    /// <param name="Password">
    ///   Contrase�a de acceso a la base de datos MySQL, utilizada junto con <c>UserName</c> para
    ///   la autenticaci�n segura.
    /// </param>
    /// <param name="VendorLib">
    ///   Ruta a la biblioteca del proveedor (DLL) necesaria para que FireDAC se comunique con MySQL.
    ///   La biblioteca predeterminada es "libmysql.dll" y debe coincidir con la arquitectura de
    ///   la aplicaci�n (32 o 64 bits).
    /// </param>
    /// <param name="Pooled">
    ///   Define si la conexi�n se gestionar� como un pool de conexiones. El uso de pool de conexiones
    ///   mejora el rendimiento al reutilizar conexiones inactivas, reduciendo la sobrecarga de creaci�n
    ///   y destrucci�n de conexiones.
    /// </param>
    /// <param name="PoolMaxItems">
    ///   N�mero m�ximo de conexiones permitidas en el pool. Este par�metro controla el tama�o del pool,
    ///   asegurando que no se cree un n�mero excesivo de conexiones.
    /// </param>
    /// <param name="PoolExpireTimeout">
    ///   Tiempo en milisegundos para que una conexi�n inactiva expire. Las conexiones que permanezcan
    ///   inactivas por este per�odo se cerrar�n autom�ticamente por el pool.
    /// </param>
    /// <param name="PoolCleanupTimeout">
    ///   Tiempo en milisegundos para la limpieza peri�dica de las conexiones expiradas en el pool. Este
    ///   par�metro define la frecuencia con la que el pool verifica y elimina conexiones inactivas.
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
  ApplyDatabaseConfiguration(TMySQLConfigurationParameter.Server, 'localhost');                                           {$IFDEF PORTUGUES} // Endere�o do servidor onde o MySQL est� hospedado
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Direcci�n del servidor donde se aloja MySQL
                                                                                                                          {$ELSE}// Server address where MySQL is hosted
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TMySQLConfigurationParameter.Port, 3306);                                                    {$IFDEF PORTUGUES} // Porta de conex�o com o servidor MySQL
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Puerto de conexi�n con el servidor MySQL
                                                                                                                          {$ELSE}// Connection port for the MySQL server
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TMySQLConfigurationParameter.Database, 'db');                                                {$IFDEF PORTUGUES} // Nome do banco de dados a ser acessado
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Nombre de la base de datos a acceder
                                                                                                                          {$ELSE}// Name of the database to access
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TMySQLConfigurationParameter.UserName, 'root');                                              {$IFDEF PORTUGUES} // Nome de usu�rio para autentica��o no MySQL
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Nombre de usuario para autenticaci�n en MySQL
                                                                                                                          {$ELSE}// Username for MySQL authentication
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TMySQLConfigurationParameter.Password, 'password');                                          {$IFDEF PORTUGUES} // Senha de acesso ao banco de dados
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Contrase�a para acceder a la base de datos
                                                                                                                          {$ELSE}// Password for database access
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TMySQLConfigurationParameter.VendorLib, 'path/libmysql.dll');                                     {$IFDEF PORTUGUES} // Caminho para a biblioteca do MySQL (DLL). Deve ser compat�vel com a arquitetura (32/64 bits)
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Ruta de la biblioteca de MySQL (DLL). Debe ser compatible con la arquitectura (32/64 bits)
                                                                                                                          {$ELSE}// Path to the MySQL library (DLL). Must match architecture (32/64 bits)
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TMySQLConfigurationParameter.Pooled, True);                                                  {$IFDEF PORTUGUES} // Ativa o uso de pool de conex�es
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Activa el uso de pool de conexiones
                                                                                                                          {$ELSE}// Enables connection pooling
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TMySQLConfigurationParameter.PoolMaxItems, 50);                                              {$IFDEF PORTUGUES} // N�mero m�ximo de conex�es no pool
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // N�mero m�ximo de conexiones en el pool
                                                                                                                          {$ELSE}// Maximum number of connections in the pool
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TMySQLConfigurationParameter.PoolExpireTimeout, 90000);                                      {$IFDEF PORTUGUES} // Tempo de expira��o para uma conex�o inativa (ms)
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Tiempo de expiraci�n para una conexi�n inactiva (ms)
                                                                                                                          {$ELSE}// Expiration time for an idle connection (ms)
                                                                                                                          {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TMySQLConfigurationParameter.PoolCleanupTimeout, 30000);                                     {$IFDEF PORTUGUES} // Tempo de limpeza peri�dica do pool (ms)
                                                                                                                          {$ELSE}{$IFDEF ESPANHOL} // Tiempo de limpieza peri�dica del pool (ms)
                                                                                                                          {$ELSE}// Periodic cleanup time for the pool (ms)
                                                                                                                          {$ENDIF}{$ENDIF}
  *)


  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Configura o middleware do Horse e define a rota para a aplica��o.
  /// </summary>
  /// <remarks>
  ///   Este trecho configura o middleware do Horse, incluindo compress�o de resposta,
  ///   manipula��o de JSON, tratamento de exce��es e conex�o com o banco de dados MySQL.
  /// </remarks>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Configura el middleware de Horse y define la ruta para la aplicaci�n.
    /// </summary>
    /// <remarks>
    ///   Este fragmento configura el middleware de Horse, incluyendo compresi�n de respuesta,
    ///   manejo de JSON, manejo de excepciones y conexi�n con la base de datos MySQL.
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
    .Use(Compression())       {$IFDEF PORTUGUES}// Middleware para compress�o de respostas HTTP
                              {$ELSE}{$IFDEF ESPANHOL}// Middleware para compresi�n de respuestas HTTP
                              {$ELSE} // Middleware for HTTP response compression
                              {$ENDIF}{$ENDIF}

    .Use(Jhonson)             {$IFDEF PORTUGUES}// Middleware para manipula��o de JSON
                              {$ELSE}{$IFDEF ESPANHOL}// Middleware para manejo de JSON
                              {$ELSE} // Middleware for JSON handling
                              {$ENDIF}{$ENDIF}

    .Use(HandleException)     {$IFDEF PORTUGUES}// Middleware para tratamento de exce��es
                              {$ELSE}{$IFDEF ESPANHOL}// Middleware para manejo de excepciones
                              {$ELSE} // Middleware for exception handling
                              {$ENDIF}{$ENDIF}

    .Use(HorseConnectionMySQL);  {$IFDEF PORTUGUES}// Middleware para gerenciar a conex�o com o MySQL
                              {$ELSE}{$IFDEF ESPANHOL}// Middleware para gestionar la conexi�n con MySQL
                              {$ELSE} // Middleware to manage the MySQL connection
                              {$ENDIF}{$ENDIF}


  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Define a rota "/produtos" que consulta e retorna dados no formato JSON.
  /// </summary>
  /// <remarks>
  ///   Esta rota consulta a tabela "produtos" no banco de dados MySQL e retorna os
  ///   dados no formato JSON, utilizando a conex�o configurada pelo middleware.
  /// </remarks>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Define la ruta "/productos" que consulta y devuelve datos en formato JSON.
    /// </summary>
    /// <remarks>
    ///   Esta ruta consulta la tabla "productos" en la base de datos MySQL y devuelve los
    ///   datos en formato JSON, utilizando la conexi�n configurada por el middleware.
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
        FDQuery.Connection := GetConnection(TConnectionType.MySQL);   {$IFDEF PORTUGUES}// Obt�m a conex�o do middleware
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
  ///   Esta rota consulta a tabela "produtos" no banco de dados MySQL e retorna os
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
    ///   Esta ruta consulta la tabla "productos" en la base de datos MySQL y devuelve los
    ///   datos en formato JSON, utilizando la conexi�n configurada por el middleware.
    ///   La conexi�n se obtiene directamente con la funci�n <c>GetQuery</c>, que simplifica
    ///   la creaci�n y gesti�n de la consulta en FireDAC.
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
      SetConnectionPrefix(EmptyStr);  {$IFDEF PORTUGUES}// Prefixo do pool de conex�o, se especificado
                                      {$ELSE}{$IFDEF ESPANHOL}// Prefijo del pool de conexiones, si se especifica
                                      {$ELSE} // Connection pool prefix, if specified
                                      {$ENDIF}{$ENDIF}

      SetDatabase(EmptyStr);          {$IFDEF PORTUGUES}// Nome do banco de dados, se especificado
                                      {$ELSE}{$IFDEF ESPANHOL}// Nombre de la base de datos, si se especifica
                                      {$ELSE} // Database name, if specified
                                      {$ENDIF}{$ENDIF}

      FDQuery := GetQuery(TConnectionType.MySQL);   {$IFDEF PORTUGUES}// Obt�m a conex�o do middleware com a fun��o GetQuery
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
