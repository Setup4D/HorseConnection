{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Descri��o:                                                            }
{   Este exemplo faz parte do projeto HorseConnection e demonstra o uso }
{   do framework Horse com uma conex�o ao banco de dados ADS (Advantage }
{   Database Server) usando FireDAC. A conex�o � configurada por meio   }
{   de par�metros definidos com a fun��o ApplyDatabaseConfiguration,    }
{   e o middleware HorseConnectionADS � usado para centralizar a        }
{   configura��o da conex�o. Este middleware permite uma integra��o     }
{   com o Horse para cada requisi��o HTTP, garantindo que a conex�o ADS }
{   seja gerenciada automaticamente.                                    }
{                                                                       }
{ Par�metros de Configura��o:                                           }
{   A fun��o ApplyDatabaseConfiguration permite configurar os seguintes }
{   par�metros padr�o para a conex�o:                                   }
{                                                                       }
{     - CharacterSet: TADSCharacterSet.ANSI                             }
{       Define o conjunto de caracteres para a conex�o. A op��o padr�o  }
{       � "ANSI", mas pode ser alterada para "OEM" conforme necess�rio. }
{                                                                       }
{     - UserName: String vazio                                          }
{       Nome de usu�rio para autentica��o no banco de dados.            }
{                                                                       }
{     - Password: String vazio                                          }
{       Senha de acesso ao banco de dados.                              }
{                                                                       }
{     - Database: Diret�rio atual ("./")                                }
{       Caminho completo ou nome do banco de dados no servidor.         }
{                                                                       }
{     - ShowDelete: False                                               }
{       Booleano que controla a visualiza��o de registros exclu�dos.    }
{       Se verdadeiro, registros exclu�dos ser�o exibidos nas consultas.}
{                                                                       }
{     - Pooled: True                                                    }
{       Define se a conex�o ser� gerida como um pool de conex�es,       }
{       melhorando o desempenho ao reutilizar conex�es inativas.        }
{                                                                       }
{     - PoolMaxItems: 50                                                }
{       N�mero m�ximo de conex�es permitidas no pool de conex�es.       }
{                                                                       }
{     - PoolExpireTimeout: 90000 ms                                     }
{       Tempo em milissegundos para que uma conex�o inativa expire.     }
{                                                                       }
{     - PoolCleanupTimeout: 30000 ms                                    }
{       Tempo em milissegundos para a limpeza peri�dica das conex�es    }
{       expiradas no pool.                                              }
{                                                                       }
{     - Server: localhost                                               }
{       Endere�o do servidor onde o banco ADS est� hospedado.           }
{                                                                       }
{     - Protocol: TADSProtocol.TCPIP                                    }
{       Protocolo de comunica��o com o servidor, como "tcp" ou "udp".   }
{                                                                       }
{     - TableType: TADSTableType.CDX                                    }
{       Tipo de tabela usada no banco de dados, como "adt" ou "cdx".    }
{                                                                       }
{     - Locking: TADSLocking.Compatible                                 }
{       Tipo de bloqueio de dados, controlando o n�vel de concorr�ncia. }
{                                                                       }
{     - VendorLib: ace32.dll ou ace64.dll                               }
{       Caminho para a biblioteca do fornecedor (DLL) necess�ria para   }
{       o FireDAC se comunicar com o ADS.                               }
{                                                                       }
{ Erros Comuns (Troubleshooting):                                       }
{   Abaixo est�o alguns erros comuns que podem ocorrer ao configurar    }
{   e utilizar a conex�o com o ADS e como resolv�-los:                  }
{                                                                       }
{     - Database n�o especificado:                                      }
{       Caso o par�metro 'Database' n�o seja fornecido, o FireDAC n�o   }
{       conseguir� localizar o banco de dados e levantar� uma exce��o   }
{       indicando que o caminho do banco de dados n�o foi especificado. }
{       Solu��o: Defina o caminho completo para o banco de dados ADS,   }
{       por exemplo, 'C:\Path\To\Database\MyDatabase.add'.              }
{                                                                       }
{     - VendorLib n�o especificado:                                     }
{       Se o par�metro 'VendorLib' estiver vazio ou incorreto, o ADS    }
{       n�o conseguir� carregar a biblioteca do fornecedor (DLL), o que }
{       resultar� em uma exce��o. Verifique se o caminho para 'ace32.dll}
{       ou 'ace64.dll' est� correto e acess�vel.                        }
{       Solu��o: Defina o caminho correto para a DLL do ADS,            }
{       por exemplo, 'C:\Path\To\ADS\ace32.dll' para sistemas 32 bits.  }
{                                                                       }
{     - Tabela n�o encontrada no ADS:                                   }
{       Quando uma consulta tenta acessar uma tabela inexistente,       }
{       o ADS gera uma exce��o informando que a tabela n�o foi          }
{       encontrada. Esse erro � comum quando a base de dados ADS        }
{       utiliza tabelas DBF.                                            }
{       Solu��o: Verifique se a tabela existe no banco de dados e       }
{       se o caminho para o banco de dados est� correto.                }
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
  {   el uso del framework Horse con una conexi�n a la base de datos ADS  }
  {   (Advantage Database Server) usando FireDAC. La conexi�n se          }
  {   configura mediante par�metros definidos con la funci�n              }
  {   ApplyDatabaseConfiguration, y el middleware HorseConnectionADS se   }
  {   utiliza para centralizar la configuraci�n de la conexi�n. Este      }
  {   middleware permite una integraci�n con Horse para cada solicitud    }
  {   HTTP, asegurando que la conexi�n ADS se gestione autom�ticamente.   }
  {                                                                       }
  { Par�metros de Configuraci�n:                                          }
  {   La funci�n ApplyDatabaseConfiguration permite configurar los        }
  {   siguientes par�metros predeterminados para la conexi�n:             }
  {                                                                       }
  {     - CharacterSet: TADSCharacterSet.ANSI                             }
  {       Define el conjunto de caracteres para la conexi�n. La opci�n    }
  {       predeterminada es "ANSI", pero se puede cambiar a "OEM".        }
  {                                                                       }
  {     - UserName: Cadena vac�a                                          }
  {       Nombre de usuario para autenticaci�n en la base de datos.       }
  {                                                                       }
  {     - Password: Cadena vac�a                                          }
  {       Contrase�a para acceso a la base de datos.                      }
  {                                                                       }
  {     - Database: Directorio actual ("./")                              }
  {       Ruta completa o nombre de la base de datos en el servidor.      }
  {                                                                       }
  {     - ShowDelete: False                                               }
  {       Booleano que controla la visualizaci�n de registros borrados.   }
  {       Si es verdadero, se mostrar�n los registros borrados en las     }
  {       consultas.                                                      }
  {                                                                       }
  {     - Pooled: True                                                    }
  {       Define si la conexi�n ser� gestionada como un pool,             }
  {       mejorando el rendimiento mediante la reutilizaci�n de conexiones}
  {       inactivas.                                                      }
  {                                                                       }
  {     - PoolMaxItems: 50                                                }
  {       N�mero m�ximo de conexiones permitidas en el pool de conexiones.}
  {                                                                       }
  {     - PoolExpireTimeout: 90000 ms                                     }
  {       Tiempo en milisegundos para que una conexi�n inactiva expire.   }
  {                                                                       }
  {     - PoolCleanupTimeout: 30000 ms                                    }
  {       Tiempo en milisegundos para la limpieza peri�dica de conexiones }
  {       expiradas en el pool.                                           }
  {                                                                       }
  {     - Server: localhost                                               }
  {       Direcci�n del servidor donde se encuentra la base de datos ADS. }
  {                                                                       }
  {     - Protocol: TADSProtocol.TCPIP                                    }
  {       Protocolo de comunicaci�n con el servidor, como "tcp" o "udp".  }
  {                                                                       }
  {     - TableType: TADSTableType.CDX                                    }
  {       Tipo de tabla utilizada en la base de datos, como "adt" o "cdx".}
  {                                                                       }
  {     - Locking: TADSLocking.Compatible                                 }
  {       Tipo de bloqueo de datos, que controla el nivel de concurrencia.}
  {                                                                       }
  {     - VendorLib: ace32.dll o ace64.dll                                }
  {       Ruta a la biblioteca del proveedor (DLL) necesaria para que     }
  {       FireDAC se comunique con el ADS.                                }
  {                                                                       }
  { Errores Comunes (Troubleshooting):                                    }
  {   A continuaci�n se presentan algunos errores comunes que pueden      }
  {   ocurrir al configurar y utilizar la conexi�n con ADS y c�mo         }
  {   resolverlos:                                                        }
  {                                                                       }
  {     - Database no especificado:                                       }
  {       Si el par�metro 'Database' no se proporciona, FireDAC no        }
  {       podr� localizar la base de datos y generar� una excepci�n       }
  {       indicando que no se ha especificado la ruta de la base de datos.}
  {       Soluci�n: Defina la ruta completa de la base de datos ADS, por  }
  {       ejemplo, 'C:\Path\To\Database\MyDatabase.add'.                  }
  {                                                                       }
  {     - VendorLib no especificado:                                      }
  {       Si el par�metro 'VendorLib' est� vac�o o incorrecto, el ADS no  }
  {       podr� cargar la biblioteca del proveedor (DLL), lo que          }
  {       resultar� en una excepci�n. Aseg�rese de que la ruta para       }
  {       'ace32.dll' o 'ace64.dll' sea correcta y est� accesible.        }
  {       Soluci�n: Establezca la ruta correcta para la DLL de ADS, por   }
  {       ejemplo, 'C:\Path\To\ADS\ace32.dll' para sistemas de 32 bits.   }
  {                                                                       }
  {     - Tabla no encontrada en ADS:                                     }
  {       Cuando una consulta intenta acceder a una tabla inexistente,    }
  {       el ADS genera una excepci�n indicando que la tabla no fue       }
  {       encontrada. Este error es com�n cuando la base de datos ADS usa }
  {       tablas DBF.                                                     }
  {       Soluci�n: Verifique si la tabla existe en la base de datos y    }
  {       si la ruta hacia la base de datos es correcta.                  }
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
  {   This example is part of the HorseConnection project and demonstrates}
  {   the use of the Horse framework with a connection to the ADS         }
  {   (Advantage Database Server) database using FireDAC. The connection  }
  {   is configured through parameters defined with the                   }
  {   ApplyDatabaseConfiguration function, and the HorseConnectionADS     }
  {   middleware is used to centralize the connection configuration. This }
  {   middleware allows integration with Horse for each HTTP request,     }
  {   ensuring that the ADS connection is automatically managed.          }
  {                                                                       }
  { Configuration Parameters:                                             }
  {   The ApplyDatabaseConfiguration function allows configuring the      }
  {   following default parameters for the connection:                    }
  {                                                                       }
  {     - CharacterSet: TADSCharacterSet.ANSI                             }
  {       Sets the character set for the connection. Default is "ANSI",   }
  {       but can be changed to "OEM" if needed.                          }
  {                                                                       }
  {     - UserName: Empty string                                          }
  {       Username for database authentication.                           }
  {                                                                       }
  {     - Password: Empty string                                          }
  {       Password for database access.                                   }
  {                                                                       }
  {     - Database: Current directory ("./")                              }
  {       Full path or database name on the server.                       }
  {                                                                       }
  {     - ShowDelete: False                                               }
  {       Boolean that controls viewing deleted records. If true,         }
  {       deleted records are shown in query results.                     }
  {                                                                       }
  {     - Pooled: True                                                    }
  {       Specifies whether the connection is managed as a pool,          }
  {       enhancing performance by reusing inactive connections.          }
  {                                                                       }
  {     - PoolMaxItems: 50                                                }
  {       Maximum number of connections allowed in the connection pool.   }
  {                                                                       }
  {     - PoolExpireTimeout: 90000 ms                                     }
  {       Time in milliseconds for an inactive connection to expire.      }
  {                                                                       }
  {     - PoolCleanupTimeout: 30000 ms                                    }
  {       Time in milliseconds for periodic cleanup of expired            }
  {       connections in the pool.                                        }
  {                                                                       }
  {     - Server: localhost                                               }
  {       Server address where the ADS database is hosted.                }
  {                                                                       }
  {     - Protocol: TADSProtocol.TCPIP                                    }
  {       Communication protocol with the server, like "tcp" or "udp".    }
  {                                                                       }
  {     - TableType: TADSTableType.CDX                                    }
  {       Table type used in the database, such as "adt" or "cdx".        }
  {                                                                       }
  {     - Locking: TADSLocking.Compatible                                 }
  {       Data locking type that controls concurrency level.              }
  {                                                                       }
  {     - VendorLib: ace32.dll or ace64.dll                               }
  {       Path to the vendor library (DLL) needed for FireDAC to          }
  {       communicate with ADS.                                           }
  {                                                                       }
  { Troubleshooting:                                                      }
  {   Below are some common errors that may occur when setting up and     }
  {   using the ADS connection and how to resolve them:                   }
  {                                                                       }
  {     - Database not specified:                                         }
  {       If the 'Database' parameter is not provided, FireDAC will       }
  {       not be able to locate the database and will raise an exception  }
  {       indicating that the database path was not specified.            }
  {       Solution: Set the full path to the ADS database, for example,   }
  {       'C:\Path\To\Database\MyDatabase.add'.                           }
  {                                                                       }
  {     - VendorLib not specified:                                        }
  {       If the 'VendorLib' parameter is empty or incorrect, ADS will    }
  {       not be able to load the vendor library (DLL), which will        }
  {       result in an exception. Ensure the path to 'ace32.dll' or       }
  {       'ace64.dll' is correct and accessible.                          }
  {       Solution: Set the correct path for the ADS DLL, for example,    }
  {       'C:\Path\To\ADS\ace32.dll' for 32-bit systems.                 }
  {                                                                       }
  {     - Table not found in ADS:                                         }
  {       When a query attempts to access a non-existent table, ADS       }
  {       will raise an exception indicating that the table was not found.}
  {       This error is common when the ADS database uses DBF tables.     }
  {       Solution: Verify that the table exists in the database and      }
  {       that the database path is correct.                              }
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



program SampleHorseConnectionADS;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  Horse.HandleException,
  Horse.Compression,

  Horse.Connection,
  Horse.Connection.ADS,

  Data.DB,
  FireDAC.Stan.Param,
  FireDAC.Comp.Client,

  System.DateUtils,
  System.SysUtils,
  System.JSON,
  FireDAC.Stan.Option;

begin
  ReportMemoryLeaksOnShutdown := True;

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Configura os par�metros de conex�o para o banco de dados ADS.
  /// </summary>
  /// <remarks>
  ///   A fun��o <c>ApplyDatabaseConfiguration</c> permite definir configura��es espec�ficas
  ///   para a conex�o com o banco de dados ADS, utilizando o FireDAC como camada de acesso.
  ///   Abaixo est�o descritos os par�metros:
  /// </remarks>
  /// <param name="UserName">
  ///   Nome de usu�rio para autentica��o no banco de dados ADS. Este par�metro � necess�rio
  ///   caso o banco de dados exija autentica��o.
  /// </param>
  /// <param name="Password">
  ///   Senha de acesso ao banco de dados ADS, usada em conjunto com o <c>UserName</c> para
  ///   autentica��o segura.
  /// </param>
  /// <param name="Database">
  ///   Caminho completo ou nome do banco de dados no servidor ADS. Este par�metro indica a
  ///   localiza��o do banco de dados que ser� acessado.
  /// </param>
  /// <param name="ShowDelete">
  ///   Booleano que habilita a visualiza��o de registros exclu�dos. No ADS, registros
  ///   exclu�dos podem ser marcados como tal e, se este par�metro estiver definido como <c>True</c>,
  ///   eles ser�o inclu�dos nos resultados das consultas.
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
  ///   Tempo em segundos para que uma conex�o inativa expire. Conex�es que permanecerem
  ///   ociosas por este per�odo ser�o automaticamente fechadas pelo pool.
  /// </param>
  /// <param name="PoolCleanupTimeout">
  ///   Tempo em segundos para a limpeza peri�dica das conex�es expiradas no pool. Este
  ///   par�metro define a frequ�ncia com que o pool verifica e elimina conex�es ociosas.
  /// </param>
  /// <param name="CharacterSet">
  ///   Define o conjunto de caracteres para a conex�o, como "utf8" ou "ANSI". Este par�metro
  ///   controla o encoding dos dados trafegados, garantindo compatibilidade de caracteres.
  ///   O valor � definido pelo enumerado <c>TADSCharacterSet</c>, que oferece as seguintes op��es:
  ///   - <c>TADSCharacterSet.ANSI</c>: Usa o conjunto de caracteres ANSI.
  ///   - <c>TADSCharacterSet.OEM</c>: Usa o conjunto de caracteres OEM.
  /// </param>
  /// <param name="ServerType">
  ///   Define o tipo de servidor onde o banco de dados ADS est� hospedado. Este par�metro � configurado
  ///   usando o enumerado <c>TADSServerType</c>, que especifica como o cliente se comunica com o ADS,
  ///   dependendo da localiza��o e do tipo de acesso desejado. As op��es incluem:
  ///   - <c>TADSServerType.Null</c>: Sem configura��o espec�fica.
  ///   - <c>TADSServerType.Remote</c>: Utiliza um servidor remoto (servidor dedicado do ADS).
  ///   - <c>TADSServerType.Local</c>: Configura uma conex�o local, geralmente para desenvolvimento.
  ///   - <c>TADSServerType.Internet</c>: Conex�o via Internet, adequada para acesso remoto.
  /// </param>
  /// <param name="Protocol">
  ///   Especifica o protocolo de comunica��o usado para se conectar ao servidor ADS. Este par�metro
  ///   � configurado pelo enumerado <c>TADSProtocol</c> e determina o m�todo de transporte de dados.
  ///   As op��es incluem:
  ///   - <c>TADSProtocol.Null</c>: Sem configura��o espec�fica.
  ///   - <c>TADSProtocol.UDP</c>: Protocolo UDP para comunica��o r�pida, sem conex�o.
  ///   - <c>TADSProtocol.IPX</c>: Utiliza o protocolo IPX, geralmente em redes mais antigas.
  ///   - <c>TADSProtocol.TCPIP</c>: Protocolo TCP/IP, amplamente utilizado em redes modernas.
  ///   - <c>TADSProtocol.TLS</c>: Protocolo TLS para comunica��o segura.
  /// </param>
  /// <param name="TableType">
  ///   Define o formato das tabelas usadas no banco de dados ADS. Este par�metro � configurado pelo
  ///   enumerado <c>TADSTableType</c> e determina o tipo de �ndice e estrutura de tabela compat�vel.
  ///   As op��es incluem:
  ///   - <c>TADSTableType.Default</c>: Tipo de tabela padr�o do ADS.
  ///   - <c>TADSTableType.CDX</c>: Tabelas dBASE compat�veis com �ndice CDX.
  ///   - <c>TADSTableType.VFP</c>: Tabelas Visual FoxPro.
  ///   - <c>TADSTableType.ADT</c>: Tabelas nativas do Advantage Database Server (ADT).
  ///   - <c>TADSTableType.NTX</c>: Tabelas dBASE compat�veis com �ndice NTX.
  /// </param>
  /// <param name="Locking">
  ///   Define o tipo de bloqueio de dados utilizado no ADS. Este par�metro � configurado pelo
  ///   enumerado <c>TADSLocking</c> e determina como o banco de dados lida com o controle de
  ///   concorr�ncia nas opera��es de leitura e escrita. As op��es incluem:
  ///   - <c>TADSLocking.Null</c>: Sem configura��o espec�fica de bloqueio.
  ///   - <c>TADSLocking.Proprietary</c>: Modo de bloqueio propriet�rio do ADS, que oferece um
  ///     n�vel de controle mais avan�ado.
  ///   - <c>TADSLocking.Compatible</c>: Modo de bloqueio compat�vel, ideal para interoperabilidade
  ///     com outras aplica��es e bases de dados.
  /// </param>
  /// <param name="VendorLib">
  ///   Caminho para a biblioteca (DLL) do fornecedor necess�ria para o FireDAC se comunicar
  ///   com o ADS. Em sistemas de 32 bits, o nome padr�o � "ace32.dll"; em sistemas de 64 bits,
  ///   � "ace64.dll". A DLL deve estar acess�vel no caminho especificado.
  /// </param>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Configura los par�metros de conexi�n para la base de datos ADS.
    /// </summary>
    /// <remarks>
    ///   La funci�n <c>ApplyDatabaseConfiguration</c> permite definir configuraciones espec�ficas
    ///   para la conexi�n a la base de datos ADS, utilizando FireDAC como capa de acceso.
    ///   A continuaci�n se describen los par�metros:
    /// </remarks>
    /// <param name="UserName">
    ///   Nombre de usuario para autenticaci�n en la base de datos ADS. Este par�metro es necesario
    ///   si la base de datos requiere autenticaci�n.
    /// </param>
    /// <param name="Password">
    ///   Contrase�a de acceso a la base de datos ADS, utilizada junto con <c>UserName</c> para
    ///   la autenticaci�n segura.
    /// </param>
    /// <param name="Database">
    ///   Ruta completa o nombre de la base de datos en el servidor ADS. Este par�metro indica la
    ///   ubicaci�n de la base de datos a la que se acceder�.
    /// </param>
    /// <param name="ShowDelete">
    ///   Booleano que habilita la visualizaci�n de registros eliminados. En ADS, los registros
    ///   eliminados pueden marcarse como tales y, si este par�metro est� configurado como <c>True</c>,
    ///   se incluir�n en los resultados de las consultas.
    /// </param>
    /// <param name="Pooled">
    ///   Define si la conexi�n ser� administrada como un pool de conexiones. El pooling de conexiones
    ///   mejora el rendimiento reutilizando conexiones inactivas, reduciendo la sobrecarga de
    ///   creaci�n y destrucci�n de conexiones.
    /// </param>
    /// <param name="PoolMaxItems">
    ///   N�mero m�ximo de conexiones permitidas en el pool. Este par�metro controla el tama�o del pool,
    ///   asegurando que no se cree un n�mero excesivo de conexiones.
    /// </param>
    /// <param name="PoolExpireTimeout">
    ///   Tiempo en segundos para que una conexi�n inactiva expire. Las conexiones que permanezcan
    ///   inactivas por este per�odo se cerrar�n autom�ticamente por el pool.
    /// </param>
    /// <param name="PoolCleanupTimeout">
    ///   Tiempo en segundos para la limpieza peri�dica de las conexiones expiradas en el pool. Este
    ///   par�metro define la frecuencia con la que el pool verifica y elimina conexiones inactivas.
    /// </param>
    /// <param name="CharacterSet">
    ///   Define el conjunto de caracteres para la conexi�n, como "utf8" o "ANSI". Este par�metro
    ///   controla la codificaci�n de los datos transmitidos, garantizando la compatibilidad de caracteres.
    ///   El valor se define por el enumerado <c>TADSCharacterSet</c>, que ofrece las siguientes opciones:
    ///   - <c>TADSCharacterSet.ANSI</c>: Usa el conjunto de caracteres ANSI.
    ///   - <c>TADSCharacterSet.OEM</c>: Usa el conjunto de caracteres OEM.
    /// </param>
    /// <param name="ServerType">
    ///   Define el tipo de servidor donde est� alojada la base de datos ADS. Este par�metro se configura
    ///   usando el enumerado <c>TADSServerType</c>, que especifica c�mo el cliente se comunica con el ADS,
    ///   dependiendo de la ubicaci�n y el tipo de acceso deseado. Las opciones incluyen:
    ///   - <c>TADSServerType.Null</c>: Sin configuraci�n espec�fica.
    ///   - <c>TADSServerType.Remote</c>: Utiliza un servidor remoto (servidor dedicado de ADS).
    ///   - <c>TADSServerType.Local</c>: Configura una conexi�n local, generalmente para desarrollo.
    ///   - <c>TADSServerType.Internet</c>: Conexi�n a trav�s de Internet, adecuada para acceso remoto.
    /// </param>
    /// <param name="Protocol">
    ///   Especifica el protocolo de comunicaci�n utilizado para conectarse al servidor ADS. Este par�metro
    ///   se configura por el enumerado <c>TADSProtocol</c> y determina el m�todo de transporte de datos.
    ///   Las opciones incluyen:
    ///   - <c>TADSProtocol.Null</c>: Sin configuraci�n espec�fica.
    ///   - <c>TADSProtocol.UDP</c>: Protocolo UDP para comunicaci�n r�pida, sin conexi�n.
    ///   - <c>TADSProtocol.IPX</c>: Utiliza el protocolo IPX, generalmente en redes m�s antiguas.
    ///   - <c>TADSProtocol.TCPIP</c>: Protocolo TCP/IP, ampliamente utilizado en redes modernas.
    ///   - <c>TADSProtocol.TLS</c>: Protocolo TLS para comunicaci�n segura.
    /// </param>
    /// <param name="TableType">
    ///   Define el formato de las tablas utilizadas en la base de datos ADS. Este par�metro se configura
    ///   por el enumerado <c>TADSTableType</c> y determina el tipo de �ndice y estructura de tabla compatible.
    ///   Las opciones incluyen:
    ///   - <c>TADSTableType.Default</c>: Tipo de tabla predeterminado de ADS.
    ///   - <c>TADSTableType.CDX</c>: Tablas dBASE compatibles con �ndice CDX.
    ///   - <c>TADSTableType.VFP</c>: Tablas Visual FoxPro.
    ///   - <c>TADSTableType.ADT</c>: Tablas nativas del Advantage Database Server (ADT).
    ///   - <c>TADSTableType.NTX</c>: Tablas dBASE compatibles con �ndice NTX.
    /// </param>
    /// <param name="Locking">
    ///   Define el tipo de bloqueo de datos utilizado en ADS. Este par�metro se configura por el
    ///   enumerado <c>TADSLocking</c> y determina c�mo la base de datos gestiona el control de
    ///   concurrencia en las operaciones de lectura y escritura. Las opciones incluyen:
    ///   - <c>TADSLocking.Null</c>: Sin configuraci�n espec�fica de bloqueo.
    ///   - <c>TADSLocking.Proprietary</c>: Modo de bloqueo propietario de ADS, que ofrece un
    ///     nivel de control m�s avanzado.
    ///   - <c>TADSLocking.Compatible</c>: Modo de bloqueo compatible, ideal para interoperabilidad
    ///     con otras aplicaciones y bases de datos.
    /// </param>
    /// <param name="VendorLib">
    ///   Ruta a la biblioteca (DLL) del proveedor necesaria para que FireDAC se comunique
    ///   con ADS. En sistemas de 32 bits, el nombre predeterminado es "ace32.dll"; en sistemas de 64 bits,
    ///   es "ace64.dll". La DLL debe estar accesible en la ruta especificada.
    /// </param>
    {$ELSE}
    /// <summary>
    ///   Configures connection parameters for the ADS database.
    /// </summary>
    /// <remarks>
    ///   The <c>ApplyDatabaseConfiguration</c> function allows specific configurations for
    ///   the ADS database connection, using FireDAC as the access layer.
    ///   The parameters are described below:
    /// </remarks>
    /// <param name="UserName">
    ///   Username for authentication on the ADS database. This parameter is required
    ///   if the database requires authentication.
    /// </param>
    /// <param name="Password">
    ///   Password for ADS database access, used together with <c>UserName</c> for
    ///   secure authentication.
    /// </param>
    /// <param name="Database">
    ///   Full path or name of the database on the ADS server. This parameter specifies
    ///   the location of the database to be accessed.
    /// </param>
    /// <param name="ShowDelete">
    ///   Boolean that enables the display of deleted records. In ADS, deleted records
    ///   can be marked as such, and if this parameter is set to <c>True</c>, they will
    ///   be included in query results.
    /// </param>
    /// <param name="Pooled">
    ///   Defines whether the connection will be managed as a connection pool. Connection
    ///   pooling improves performance by reusing inactive connections, reducing the overhead
    ///   of creating and destroying connections.
    /// </param>
    /// <param name="PoolMaxItems">
    ///   Maximum number of connections allowed in the pool. This parameter controls the pool size,
    ///   ensuring that an excessive number of connections is not created.
    /// </param>
    /// <param name="PoolExpireTimeout">
    ///   Time in seconds for an inactive connection to expire. Connections that remain
    ///   idle for this period will be automatically closed by the pool.
    /// </param>
    /// <param name="PoolCleanupTimeout">
    ///   Time in seconds for periodic cleanup of expired connections in the pool. This
    ///   parameter defines the frequency at which the pool checks and removes idle connections.
    /// </param>
    /// <param name="CharacterSet">
    ///   Sets the character set for the connection, such as "utf8" or "ANSI". This parameter
    ///   controls the encoding of transmitted data, ensuring character compatibility.
    ///   The value is defined by the <c>TADSCharacterSet</c> enum, which provides the following options:
    ///   - <c>TADSCharacterSet.ANSI</c>: Uses the ANSI character set.
    ///   - <c>TADSCharacterSet.OEM</c>: Uses the OEM character set.
    /// </param>
    /// <param name="ServerType">
    ///   Defines the server type where the ADS database is hosted. This parameter is configured
    ///   using the <c>TADSServerType</c> enum, which specifies how the client communicates with ADS,
    ///   depending on the location and type of desired access. Options include:
    ///   - <c>TADSServerType.Null</c>: No specific configuration.
    ///   - <c>TADSServerType.Remote</c>: Uses a remote server (dedicated ADS server).
    ///   - <c>TADSServerType.Local</c>: Sets up a local connection, typically for development.
    ///   - <c>TADSServerType.Internet</c>: Internet connection, suitable for remote access.
    /// </param>
    /// <param name="Protocol">
    ///   Specifies the communication protocol used to connect to the ADS server. This parameter
    ///   is configured by the <c>TADSProtocol</c> enum and determines the data transport method.
    ///   Options include:
    ///   - <c>TADSProtocol.Null</c>: No specific configuration.
    ///   - <c>TADSProtocol.UDP</c>: UDP protocol for fast, connectionless communication.
    ///   - <c>TADSProtocol.IPX</c>: Uses the IPX protocol, typically in older networks.
    ///   - <c>TADSProtocol.TCPIP</c>: TCP/IP protocol, widely used in modern networks.
    ///   - <c>TADSProtocol.TLS</c>: TLS protocol for secure communication.
    /// </param>
    /// <param name="TableType">
    ///   Defines the format of tables used in the ADS database. This parameter is configured by the
    ///   <c>TADSTableType</c> enum and determines the compatible index and table structure type.
    ///   Options include:
    ///   - <c>TADSTableType.Default</c>: Default ADS table type.
    ///   - <c>TADSTableType.CDX</c>: dBASE tables compatible with CDX index.
    ///   - <c>TADSTableType.VFP</c>: Visual FoxPro tables.
    ///   - <c>TADSTableType.ADT</c>: Native Advantage Database Server (ADT) tables.
    ///   - <c>TADSTableType.NTX</c>: dBASE tables compatible with NTX index.
    /// </param>
    /// <param name="Locking">
    ///   Defines the data locking type used in ADS. This parameter is configured by the
    ///   <c>TADSLocking</c> enum and determines how the database handles concurrency control
    ///   during read and write operations. Options include:
    ///   - <c>TADSLocking.Null</c>: No specific locking configuration.
    ///   - <c>TADSLocking.Proprietary</c>: ADS proprietary locking mode, providing advanced control.
    ///   - <c>TADSLocking.Compatible</c>: Compatible locking mode, ideal for interoperability
    ///     with other applications and databases.
    /// </param>
    /// <param name="VendorLib">
    ///   Path to the vendor library (DLL) required for FireDAC to communicate with ADS. On 32-bit
    ///   systems, the default name is "ace32.dll"; on 64-bit systems, it is "ace64.dll".
    ///   The DLL must be accessible at the specified path.
    /// </param>
    {$ENDIF}
  {$ENDIF}
  (*
  ApplyDatabaseConfiguration(TADSConfigurationParameter.UserName, EmptyStr);                                  {$IFDEF PORTUGUES} // Define o nome de usu�rio do banco de dados
                                                                                                              {$ELSE}{$IFDEF ESPANHOL} // Define el nombre de usuario de la base de datos
                                                                                                              {$ELSE}// Defines the database username
                                                                                                              {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TADSConfigurationParameter.Password, EmptyStr);                                  {$IFDEF PORTUGUES} // Define a senha de acesso ao banco de dados
                                                                                                              {$ELSE}{$IFDEF ESPANHOL} // Define la contrase�a de acceso a la base de datos
                                                                                                              {$ELSE}// Sets the database access password
                                                                                                              {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TADSConfigurationParameter.Database, 'path/my_database');                        {$IFDEF PORTUGUES} // Define o caminho ou nome do banco de dados
                                                                                                              {$ELSE}{$IFDEF ESPANHOL} // Define la ruta o nombre de la base de datos
                                                                                                              {$ELSE}// Sets the database path or name
                                                                                                              {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TADSConfigurationParameter.ShowDelete, True);                                    {$IFDEF PORTUGUES} // Habilita a visualiza��o de registros exclu�dos
                                                                                                              {$ELSE}{$IFDEF ESPANHOL} // Habilita la visualizaci�n de registros eliminados
                                                                                                              {$ELSE}// Enables viewing of deleted records
                                                                                                              {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TADSConfigurationParameter.Pooled, True);                                        {$IFDEF PORTUGUES} // Ativa o uso de pool de conex�es
                                                                                                              {$ELSE}{$IFDEF ESPANHOL} // Activa el uso de pool de conexiones
                                                                                                              {$ELSE}// Enables connection pooling
                                                                                                              {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TADSConfigurationParameter.PoolMaxItems, 50);                                    {$IFDEF PORTUGUES} // Define o n�mero m�ximo de conex�es no pool
                                                                                                              {$ELSE}{$IFDEF ESPANHOL} // Define el n�mero m�ximo de conexiones en el pool
                                                                                                              {$ELSE}// Sets the maximum number of connections in the pool
                                                                                                              {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TADSConfigurationParameter.PoolExpireTimeout, 90000);                            {$IFDEF PORTUGUES} // Tempo de expira��o do pool em milissegundos
                                                                                                              {$ELSE}{$IFDEF ESPANHOL} // Tiempo de expiraci�n del pool en milisegundos
                                                                                                              {$ELSE}// Pool expiration time in milliseconds
                                                                                                              {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TADSConfigurationParameter.PoolCleanupTimeout, 30000);                           {$IFDEF PORTUGUES} // Tempo de limpeza do pool em milissegundos
                                                                                                              {$ELSE}{$IFDEF ESPANHOL} // Tiempo de limpieza del pool en milisegundos
                                                                                                              {$ELSE}// Pool cleanup time in milliseconds
                                                                                                              {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TADSConfigurationParameter.CharacterSet, TADSCharacterSet.ANSI);                 {$IFDEF PORTUGUES} // Define o conjunto de caracteres
                                                                                                              {$ELSE}{$IFDEF ESPANHOL} // Define el conjunto de caracteres
                                                                                                              {$ELSE}// Sets the character set
                                                                                                              {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TADSConfigurationParameter.ServerType, TADSServerType.Local);                    {$IFDEF PORTUGUES} // Define o tipo de servidor
                                                                                                              {$ELSE}{$IFDEF ESPANHOL} // Define el tipo de servidor
                                                                                                              {$ELSE}// Sets the server type
                                                                                                              {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TADSConfigurationParameter.Protocol, TADSProtocol.TCPIP);                        {$IFDEF PORTUGUES} // Define o protocolo de comunica��o
                                                                                                              {$ELSE}{$IFDEF ESPANHOL} // Define el protocolo de comunicaci�n
                                                                                                              {$ELSE}// Sets the communication protocol
                                                                                                              {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TADSConfigurationParameter.TableType, TADSTableType.CDX);                        {$IFDEF PORTUGUES} // Define o tipo de tabela
                                                                                                              {$ELSE}{$IFDEF ESPANHOL} // Define el tipo de tabla
                                                                                                              {$ELSE}// Sets the table type
                                                                                                              {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TADSConfigurationParameter.Locking, TADSLocking.Compatible);                     {$IFDEF PORTUGUES} // Define o tipo de bloqueio (linha, tabela)
                                                                                                              {$ELSE}{$IFDEF ESPANHOL} // Define el tipo de bloqueo (registro, tabla)
                                                                                                              {$ELSE}// Sets the locking type (row, table)
                                                                                                              {$ENDIF}{$ENDIF}

  ApplyDatabaseConfiguration(TADSConfigurationParameter.VendorLib, 'path/to/vendor/lib/[ACE[32 ou 64].dll');  {$IFDEF PORTUGUES} // Caminho para a biblioteca do fornecedor (DLL)
                                                                                                              {$ELSE}{$IFDEF ESPANHOL} // Ruta de la biblioteca del proveedor (DLL)
                                                                                                              {$ELSE}// Path to the vendor library (DLL)
                                                                                                              {$ENDIF}{$ENDIF}
  *)

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Configura o middleware do Horse e define a rota para a aplica��o.
  /// </summary>
  /// <remarks>
  ///   Este trecho configura o middleware do Horse, incluindo compress�o de resposta,
  ///   manipula��o de JSON, tratamento de exce��es e conex�o com o banco de dados ADS.
  /// </remarks>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Configura el middleware de Horse y define la ruta para la aplicaci�n.
    /// </summary>
    /// <remarks>
    ///   Este fragmento configura el middleware de Horse, incluyendo compresi�n de respuesta,
    ///   manipulaci�n de JSON, manejo de excepciones y conexi�n con la base de datos ADS.
    /// </remarks>
    {$ELSE}
    /// <summary>
    ///   Configures Horse middleware and defines the route for the application.
    /// </summary>
    /// <remarks>
    ///   This snippet configures Horse middleware, including response compression,
    ///   JSON handling, exception management, and connection to the ADS database.
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

    .Use(HorseConnectionADS); {$IFDEF PORTUGUES}// Middleware para gerenciar a conex�o com o ADS
                              {$ELSE}{$IFDEF ESPANHOL}// Middleware para gestionar la conexi�n con el ADS
                              {$ELSE} // Middleware to manage the ADS connection
                              {$ENDIF}{$ENDIF}




  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Define a rota "/produtos" que consulta e retorna dados no formato JSON.
  /// </summary>
  /// <remarks>
  ///   Esta rota consulta a tabela "produtos" no banco de dados ADS e retorna os
  ///   dados no formato JSON, utilizando a conex�o configurada pelo middleware.
  /// </remarks>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Define la ruta "/productos" que consulta y devuelve datos en formato JSON.
    /// </summary>
    /// <remarks>
    ///   Esta ruta consulta la tabla "productos" en la base de datos ADS y devuelve los
    ///   datos en formato JSON, utilizando la conexi�n configurada por el middleware.
    /// </remarks>
    {$ELSE}
    /// <summary>
    ///   Defines the "/produtos" route that queries and returns data in JSON format.
    /// </summary>
    /// <remarks>
    ///   This route queries the "produtos" table in the ADS database and returns the
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
        {$IFDEF PORTUGUES}{ Define o prefixo de conex�o e o banco de dados, se necess�rio }
        {$ELSE}{$IFDEF ESPANHOL}{ Define el prefijo de conexi�n y la base de datos, si es necesario }
        {$ELSE}{ Defines the connection prefix and database, if necessary }
        {$ENDIF}{$ENDIF}
        SetConnectionPrefix(EmptyStr);  {$IFDEF PORTUGUES}// Prefixo do pool de conex�o, se especificado
                                        {$ELSE}{$IFDEF ESPANHOL}// Prefijo del pool de conexiones, si se especifica
                                        {$ELSE} // Connection pool prefix, if specified
                                        {$ENDIF}{$ENDIF}

        SetDatabase(EmptyStr);          {$IFDEF PORTUGUES}// Caminho do banco de dados, se especificado
                                        {$ELSE}{$IFDEF ESPANHOL}// Ruta de la base de datos, si se especifica
                                        {$ELSE} // Database path, if specified
                                        {$ENDIF}{$ENDIF}

        {$IFDEF PORTUGUES}{ Configura a consulta SQL }
        {$ELSE}{$IFDEF ESPANHOL}{ Configura la consulta SQL }
        {$ELSE}{ Configures the SQL query }
        {$ENDIF}{$ENDIF}
        FDQuery.Connection := GetConnection(TConnectionType.ADS);   {$IFDEF PORTUGUES}// Obt�m a conex�o do middleware
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
  ///   Esta rota consulta a tabela "produtos" no banco de dados ADS e retorna os
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
    ///   Esta ruta consulta la tabla "productos" en la base de datos ADS y devuelve los
    ///   datos en formato JSON, utilizando la conexi�n configurada por el middleware.
    ///   La conexi�n se obtiene directamente con la funci�n <c>GetQuery</c>, que simplifica
    ///   la creaci�n y gesti�n de la consulta en FireDAC.
    /// </remarks>
    {$ELSE}
    /// <summary>
    ///   Defines the "/produto" route that queries and returns data in JSON format.
    /// </summary>
    /// <remarks>
    ///   This route queries the "produtos" table in the ADS database and returns the
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

      SetDatabase(EmptyStr);          {$IFDEF PORTUGUES}// Caminho do banco de dados, se especificado
                                      {$ELSE}{$IFDEF ESPANHOL}// Ruta de la base de datos, si se especifica
                                      {$ELSE} // Database path, if specified
                                      {$ENDIF}{$ENDIF}

      FDQuery := GetQuery(TConnectionType.ADS);   {$IFDEF PORTUGUES}// Obt�m a conex�o do middleware com a fun��o GetQuery
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

