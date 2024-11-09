{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: EnumsHelpersUtils                                               }
{                                                                       }
{ Descrição:                                                            }
{   Esta unit define tipos enumerados e configurações de conexão para   }
{   diferentes bancos de dados (PostgreSQL, ADS, SQLite, Firebird,      }
{   MySQL) e fornece funções auxiliares para manipulação desses tipos.  }
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
  { Unidad: EnumsHelpersUtils                                             }
  {                                                                       }
  { Descripción:                                                          }
  {   Esta unidad define tipos enumerados y configuraciones de conexión   }
  {   para diferentes bases de datos (PostgreSQL, ADS, SQLite, Firebird,  }
  {   MySQL) y proporciona funciones auxiliares para manipulación de      }
  {   estos tipos.                                                        }
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
  { Unit: EnumsHelpersUtils                                               }
  {                                                                       }
  { Description:                                                          }
  {   This unit defines enumerated types and connection configurations    }
  {   for different databases (PostgreSQL, ADS, SQLite, Firebird, MySQL)  }
  {   and provides helper functions to handle these types.                }
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

unit EnumsHelpersUtils;

interface

{$SCOPEDENUMS ON}

type
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
  TConnectionType = (ADS, FB, MySQL, PG, SQLite);

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Funções auxiliares para TConnectionType.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Funciones auxiliares para TConnectionType.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Helper functions for TConnectionType.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TConnectionTypeHelper = record helper for TConnectionType
    {$IFDEF PORTUGUES}
    /// <summary>
    ///   Retorna o nome do tipo de conexão como uma string.
    /// </summary>
    /// <returns>
    ///   O nome do tipo de conexão em formato de string.
    /// </returns>
    {$ELSE}
      {$IFDEF ESPANHOL}
      /// <summary>
      ///   Devuelve el nombre del tipo de conexión como una cadena.
      /// </summary>
      /// <returns>
      ///   El nombre del tipo de conexión en formato de cadena.
      /// </returns>
      {$ELSE}
      /// <summary>
      ///   Returns the name of the connection type as a string.
      /// </summary>
      /// <returns>
      ///   The name of the connection type in string format.
      /// </returns>
      {$ENDIF}
    {$ENDIF}
    function ToString: string;
  end;

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Parâmetros de configuração para o banco de dados PostgreSQL.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Parámetros de configuración para la base de datos PostgreSQL.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Configuration parameters for the PostgreSQL database.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TPGConfigurationParameter = (Server, Port, Database, UserName, Password, CharacterSet,
                               Pooled, PoolMaxItems, PoolExpireTimeout, PoolCleanupTimeout);

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Estrutura de configuração para o banco de dados PostgreSQL.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Estructura de configuración para la base de datos PostgreSQL.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Configuration structure for the PostgreSQL database.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TPGConfiguration = record
    DriverID: string;
    Server: string;
    Port: Integer;
    Database: string;
    UserName: string;
    Password: string;
    CharacterSet: string;
    Pooled: Boolean;
    PoolMaxItems: Integer;
    PoolExpireTimeout: Integer;
    PoolCleanupTimeout: Integer;

    {$IFDEF PORTUGUES}
    /// <summary>
    ///   Retorna uma configuração padrão para o PostgreSQL.
    /// </summary>
    /// <returns>
    ///   Uma instância de TPGConfiguration com valores padrão.
    /// </returns>
    {$ELSE}
      {$IFDEF ESPANHOL}
      /// <summary>
      ///   Devuelve una configuración predeterminada para PostgreSQL.
      /// </summary>
      /// <returns>
      ///   Una instancia de TPGConfiguration con valores predeterminados.
      /// </returns>
      {$ELSE}
      /// <summary>
      ///   Returns a default configuration for PostgreSQL.
      /// </summary>
      /// <returns>
      ///   An instance of TPGConfiguration with default values.
      /// </returns>
      {$ENDIF}
    {$ENDIF}
    class function Default: TPGConfiguration; static;
  end;

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Parâmetros de configuração para o banco de dados ADS.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Parámetros de configuración para la base de datos ADS.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Configuration parameters for the ADS database.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TADSConfigurationParameter = (ServerTypes, Database, UserName, Password, CharacterSet,
                                Pooled, PoolMaxItems, PoolExpireTimeout, PoolCleanupTimeout,
                                ShowDelete, VendorLib, Protocol, TableType, Locking);

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Define os tipos de servidor suportados pelo ADS.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Define los tipos de servidor soportados por el ADS.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Defines the server types supported by ADS.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TADSServerType = (Null, Remote, Local, Internet);

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Define os tipos de conjunto de caracteres suportados pelo ADS.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Define los tipos de conjunto de caracteres soportados por el ADS.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Defines the character set types supported by ADS.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TADSCharacterSet = (ANSI, OEM);

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Define os tipos de protocolo suportados pelo ADS.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Define los tipos de protocolo soportados por el ADS.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Defines the protocol types supported by ADS.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TADSProtocol = (Null, UDP, IPX, TCPIP, TLS);

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Define os tipos de tabela suportados pelo ADS.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Define los tipos de tabla soportados por el ADS.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Defines the table types supported by ADS.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TADSTableType = (Default, CDX, VFP, ADT, NTX);

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Define os tipos de bloqueio suportados pelo ADS.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Define los tipos de bloqueo soportados por el ADS.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Defines the locking types supported by ADS.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TADSLocking = (Null, Proprietary, Compatible);

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Estrutura de configuração para o banco de dados ADS.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Estructura de configuración para la base de datos ADS.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Configuration structure for the ADS database.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TADSConfiguration = record
    DriverID: string;
    Database: string;
    UserName: string;
    Password: string;
    ShowDelete : Boolean;
    VendorLib : string;
    Pooled: Boolean;
    PoolMaxItems: Integer;
    PoolExpireTimeout: Integer;
    PoolCleanupTimeout: Integer;
    ServerType: TADSServerType;
    CharacterSet: TADSCharacterSet;
    Protocol : TADSProtocol;
    TableType : TADSTableType;
    Locking : TADSLocking;

    {$IFDEF PORTUGUES}
    /// <summary>
    ///   Retorna uma configuração padrão para o ADS.
    /// </summary>
    /// <returns>
    ///   Uma instância de TADSConfiguration com valores padrão.
    /// </returns>
    {$ELSE}
      {$IFDEF ESPANHOL}
      /// <summary>
      ///   Devuelve una configuración predeterminada para ADS.
      /// </summary>
      /// <returns>
      ///   Una instancia de TADSConfiguration con valores predeterminados.
      /// </returns>
      {$ELSE}
      /// <summary>
      ///   Returns a default configuration for ADS.
      /// </summary>
      /// <returns>
      ///   An instance of TADSConfiguration with default values.
      /// </returns>
      {$ENDIF}
    {$ENDIF}
    class function Default: TADSConfiguration; static;
  end;

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Funções auxiliares para TADSServerType.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Funciones auxiliares para TADSServerType.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Helper functions for TADSServerType.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TADSServerTypeHelper = record helper for TADSServerType
    {$IFDEF PORTUGUES}
    /// <summary>
    ///   Retorna o nome do tipo de servidor como uma string.
    /// </summary>
    /// <returns>
    ///   O nome do tipo de servidor em formato de string.
    /// </returns>
    {$ELSE}
      {$IFDEF ESPANHOL}
      /// <summary>
      ///   Devuelve el nombre del tipo de servidor como una cadena.
      /// </summary>
      /// <returns>
      ///   El nombre del tipo de servidor en formato de cadena.
      /// </returns>
      {$ELSE}
      /// <summary>
      ///   Returns the name of the server type as a string.
      /// </summary>
      /// <returns>
      ///   The name of the server type in string format.
      /// </returns>
      {$ENDIF}
    {$ENDIF}
    function ToString: string;
  end;

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Funções auxiliares para TADSCharacterSet.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Funciones auxiliares para TADSCharacterSet.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Helper functions for TADSCharacterSet.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TADSCharacterSetHelper = record helper for TADSCharacterSet
    {$IFDEF PORTUGUES}
    /// <summary>
    ///   Retorna o nome do conjunto de caracteres como uma string.
    /// </summary>
    /// <returns>
    ///   O nome do conjunto de caracteres em formato de string.
    /// </returns>
    {$ELSE}
      {$IFDEF ESPANHOL}
      /// <summary>
      ///   Devuelve el nombre del conjunto de caracteres como una cadena.
      /// </summary>
      /// <returns>
      ///   El nombre del conjunto de caracteres en formato de cadena.
      /// </returns>
      {$ELSE}
      /// <summary>
      ///   Returns the name of the character set as a string.
      /// </summary>
      /// <returns>
      ///   The name of the character set in string format.
      /// </returns>
      {$ENDIF}
    {$ENDIF}
    function ToString: string;
  end;

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Funções auxiliares para TADSProtocol.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Funciones auxiliares para TADSProtocol.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Helper functions for TADSProtocol.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TADSProtocolHelper = record helper for TADSProtocol
    {$IFDEF PORTUGUES}
    /// <summary>
    ///   Retorna o nome do protocolo como uma string.
    /// </summary>
    /// <returns>
    ///   O nome do protocolo em formato de string.
    /// </returns>
    {$ELSE}
      {$IFDEF ESPANHOL}
      /// <summary>
      ///   Devuelve el nombre del protocolo como una cadena.
      /// </summary>
      /// <returns>
      ///   El nombre del protocolo en formato de cadena.
      /// </returns>
      {$ELSE}
      /// <summary>
      ///   Returns the name of the protocol as a string.
      /// </summary>
      /// <returns>
      ///   The name of the protocol in string format.
      /// </returns>
      {$ENDIF}
    {$ENDIF}
    function ToString: string;
  end;
  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Funções auxiliares para TADSTableType.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Funciones auxiliares para TADSTableType.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Helper functions for TADSTableType.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TADSTableTypeHelper = record helper for TADSTableType
    {$IFDEF PORTUGUES}
    /// <summary>
    ///   Retorna o nome do tipo de tabela como uma string.
    /// </summary>
    /// <returns>
    ///   O nome do tipo de tabela em formato de string.
    /// </returns>
    {$ELSE}
      {$IFDEF ESPANHOL}
      /// <summary>
      ///   Devuelve el nombre del tipo de tabla como una cadena.
      /// </summary>
      /// <returns>
      ///   El nombre del tipo de tabla en formato de cadena.
      /// </returns>
      {$ELSE}
      /// <summary>
      ///   Returns the name of the table type as a string.
      /// </summary>
      /// <returns>
      ///   The name of the table type in string format.
      /// </returns>
      {$ENDIF}
    {$ENDIF}
    function ToString: string;
  end;

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Funções auxiliares para TADSLocking.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Funciones auxiliares para TADSLocking.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Helper functions for TADSLocking.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TADSLockingHelper = record helper for TADSLocking
    {$IFDEF PORTUGUES}
    /// <summary>
    ///   Retorna o nome do tipo de bloqueio como uma string.
    /// </summary>
    /// <returns>
    ///   O nome do tipo de bloqueio em formato de string.
    /// </returns>
    {$ELSE}
      {$IFDEF ESPANHOL}
      /// <summary>
      ///   Devuelve el nombre del tipo de bloqueo como una cadena.
      /// </summary>
      /// <returns>
      ///   El nombre del tipo de bloqueo en formato de cadena.
      /// </returns>
      {$ELSE}
      /// <summary>
      ///   Returns the name of the locking type as a string.
      /// </summary>
      /// <returns>
      ///   The name of the locking type in string format.
      /// </returns>
      {$ENDIF}
    {$ENDIF}
    function ToString: string;
  end;

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Parâmetros de configuração para o banco de dados SQLite.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Parámetros de configuración para la base de datos SQLite.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Configuration parameters for the SQLite database.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TSQLiteConfigurationParameter = (Database, UserName, Password, LockingMode, OpenMode,
                                   Encrypt, Pooled, PoolMaxItems, PoolExpireTimeout,
                                   PoolCleanupTimeout);

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Define os modos de bloqueio suportados pelo SQLite.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Define los modos de bloqueo soportados por SQLite.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Defines the locking modes supported by SQLite.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TSQLiteLockingModeType = (Normal, Exclusive);

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Define os modos de abertura suportados pelo SQLite.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Define los modos de apertura soportados por SQLite.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Defines the open modes supported by SQLite.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TSQLiteOpenModeType = (CreateUTF8, CreateUTF16, ReadWrite, ReadOnly);

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Define os tipos de criptografia suportados pelo SQLite.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Define los tipos de cifrado soportados por SQLite.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Defines the encryption types supported by SQLite.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TSQLiteEncryptType = (No, aes_128, aes_192, aes_256, aes_ctr_128, aes_ctr_192,
                        aes_ctr_256, aes_ecb_128, aes_ecb_192, aes_ecb_256);

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Estrutura de configuração para o banco de dados SQLite.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Estructura de configuración para la base de datos SQLite.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Configuration structure for the SQLite database.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TSQLiteConfiguration = record
    DriverID: string;
    Database: string;
    UserName: string;
    Password: string;
    LockingMode : TSQLiteLockingModeType;
    OpenMode : TSQLiteOpenModeType;
    Encrypt : TSQLiteEncryptType;
    Pooled: Boolean;
    PoolMaxItems: Integer;
    PoolExpireTimeout: Integer;
    PoolCleanupTimeout: Integer;

    {$IFDEF PORTUGUES}
    /// <summary>
    ///   Retorna uma configuração padrão para o SQLite.
    /// </summary>
    /// <returns>
    ///   Uma instância de TSQLiteConfiguration com valores padrão.
    /// </returns>
    {$ELSE}
      {$IFDEF ESPANHOL}
      /// <summary>
      ///   Devuelve una configuración predeterminada para SQLite.
      /// </summary>
      /// <returns>
      ///   Una instancia de TSQLiteConfiguration con valores predeterminados.
      /// </returns>
      {$ELSE}
      /// <summary>
      ///   Returns a default configuration for SQLite.
      /// </summary>
      /// <returns>
      ///   An instance of TSQLiteConfiguration with default values.
      /// </returns>
      {$ENDIF}
    {$ENDIF}
    class function Default: TSQLiteConfiguration; static;
  end;

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Funções auxiliares para TSQLiteEncryptType.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Funciones auxiliares para TSQLiteEncryptType.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Helper functions for TSQLiteEncryptType.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TSQLiteEncryptTypeHelper = record helper for TSQLiteEncryptType
    {$IFDEF PORTUGUES}
    /// <summary>
    ///   Retorna o nome do tipo de criptografia como uma string.
    /// </summary>
    /// <returns>
    ///   O nome do tipo de criptografia em formato de string.
    /// </returns>
    {$ELSE}
      {$IFDEF ESPANHOL}
      /// <summary>
      ///   Devuelve el nombre del tipo de cifrado como una cadena.
      /// </summary>
      /// <returns>
      ///   El nombre del tipo de cifrado en formato de cadena.
      /// </returns>
      {$ELSE}
      /// <summary>
      ///   Returns the name of the encryption type as a string.
      /// </summary>
      /// <returns>
      ///   The name of the encryption type in string format.
      /// </returns>
      {$ENDIF}
    {$ENDIF}
    function ToString: string;

    {$IFDEF PORTUGUES}
    /// <summary>
    ///   Converte uma string para o tipo de criptografia correspondente.
    /// </summary>
    /// <param name="AValue">
    ///   O valor em string a ser convertido.
    /// </param>
    /// <returns>
    ///   O tipo de criptografia correspondente.
    /// </returns>
    {$ELSE}
      {$IFDEF ESPANHOL}
      /// <summary>
      ///   Convierte una cadena en el tipo de cifrado correspondiente.
      /// </summary>
      /// <param name="AValue">
      ///   El valor en cadena a convertir.
      /// </param>
      /// <returns>
      ///   El tipo de cifrado correspondiente.
      /// </returns>
      {$ELSE}
      /// <summary>
      ///   Converts a string to the corresponding encryption type.
      /// </summary>
      /// <param name="AValue">
      ///   The string value to convert.
      /// </param>
      /// <returns>
      ///   The corresponding encryption type.
      /// </returns>
      {$ENDIF}
    {$ENDIF}
    function StrToEnum(const AValue: string): TSQLiteEncryptType;
  end;

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Funções auxiliares para TSQLiteLockingModeType.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Funciones auxiliares para TSQLiteLockingModeType.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Helper functions for TSQLiteLockingModeType.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TSQLiteLockingModeTypeHelper = record helper for TSQLiteLockingModeType
    {$IFDEF PORTUGUES}
    /// <summary>
    ///   Retorna o nome do modo de bloqueio como uma string.
    /// </summary>
    /// <returns>
    ///   O nome do modo de bloqueio em formato de string.
    /// </returns>
    {$ELSE}
      {$IFDEF ESPANHOL}
      /// <summary>
      ///   Devuelve el nombre del modo de bloqueo como una cadena.
      /// </summary>
      /// <returns>
      ///   El nombre del modo de bloqueo en formato de cadena.
      /// </returns>
      {$ELSE}
      /// <summary>
      ///   Returns the name of the locking mode as a string.
      /// </summary>
      /// <returns>
      ///   The name of the locking mode in string format.
      /// </returns>
      {$ENDIF}
    {$ENDIF}
    function ToString: string;
  end;

  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Funções auxiliares para TSQLiteOpenModeType.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Funciones auxiliares para TSQLiteOpenModeType.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Helper functions for TSQLiteOpenModeType.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TSQLiteOpenModeTypeHelper = record helper for TSQLiteOpenModeType
    {$IFDEF PORTUGUES}
    /// <summary>
    ///   Retorna o nome do modo de abertura como uma string.
    /// </summary>
    /// <returns>
    ///   O nome do modo de abertura em formato de string.
    /// </returns>
    {$ELSE}
      {$IFDEF ESPANHOL}
      /// <summary>
      ///   Devuelve el nombre del modo de apertura como una cadena.
      /// </summary>
      /// <returns>
      ///   El nombre del modo de apertura en formato de cadena.
      /// </returns>
      {$ELSE}
      /// <summary>
      ///   Returns the name of the open mode as a string.
      /// </summary>
      /// <returns>
      ///   The name of the open mode in string format.
      /// </returns>
      {$ENDIF}
    {$ENDIF}
    function ToString: string;
  end;
  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Parâmetros de configuração para o banco de dados Firebird.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Parámetros de configuración para la base de datos Firebird.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Configuration parameters for the Firebird database.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TFBConfigurationParameter = (Database, UserName, Password, Protocol, Server, Port,
                               CharacterSet, OpenMode, Pooled, PoolMaxItems,
                               PoolExpireTimeout, PoolCleanupTimeout);
  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Define os tipos de protocolo suportados pelo Firebird.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Define los tipos de protocolo soportados por Firebird.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Defines the protocol types supported by Firebird.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TFBProtocolType = (Local, TCPIP);
  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Define os modos de abertura suportados pelo Firebird.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Define los modos de apertura soportados por Firebird.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Defines the open modes supported by Firebird.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TFBOpenModeType = (Open, Create, OpenOrCreate);
  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Define os tipos de conjunto de caracteres suportados pelo Firebird.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Define los tipos de conjunto de caracteres soportados por Firebird.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Defines the character set types supported by Firebird.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TFBCharacterSetType = (NONE, ASCII, BIG_5, CYRL, DOS437, DOS850, DOS852, DOS857,
                         DOS860, DOS861, DOS863, DOS865, DOS866, DOS869, EUCJ_0208,
                         GB_2312, ISO8859_1, ISO8859_2, ISO8859_3, ISO8859_4, ISO8859_5,
                         ISO8859_6, ISO8859_7, ISO8859_8, ISO8859_9, ISO8859_13, KOI8R,
                         KOI8U, KSC_5601, KSC_DICTIONARY, NEXT, OCTETS, SJIS_0208,
                         TIS620, UNICODE_FSS, UTF8, UTF16, WIN1250, WIN1251, WIN1252,
                         WIN1253, WIN1254, WIN1255, WIN1256, WIN1257, WIN1258);
  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Estrutura de configuração para o banco de dados Firebird.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Estructura de configuración para la base de datos Firebird.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Configuration structure for the Firebird database.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TFBConfiguration = record
    DriverID: string;
    Database: string;
    UserName: string;
    Password: string;
    Protocol : TFBProtocolType;
    Server: string;
    Port: Integer;
    CharacterSet: TFBCharacterSetType;
    OpenMode : TFBOpenModeType;
    Pooled: Boolean;
    PoolMaxItems: Integer;
    PoolExpireTimeout: Integer;
    PoolCleanupTimeout: Integer;
    {$IFDEF PORTUGUES}
    /// <summary>
    ///   Retorna uma configuração padrão para o Firebird.
    /// </summary>
    /// <returns>
    ///   Uma instância de TFBConfiguration com valores padrão.
    /// </returns>
    {$ELSE}
      {$IFDEF ESPANHOL}
      /// <summary>
      ///   Devuelve una configuración predeterminada para Firebird.
      /// </summary>
      /// <returns>
      ///   Una instancia de TFBConfiguration con valores predeterminados.
      /// </returns>
      {$ELSE}
      /// <summary>
      ///   Returns a default configuration for Firebird.
      /// </summary>
      /// <returns>
      ///   An instance of TFBConfiguration with default values.
      /// </returns>
      {$ENDIF}
    {$ENDIF}
    class function Default: TFBConfiguration; static;
  end;
  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Funções auxiliares para TFBProtocolType.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Funciones auxiliares para TFBProtocolType.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Helper functions for TFBProtocolType.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TFBProtocolTypeHelper = record helper for TFBProtocolType
    {$IFDEF PORTUGUES}
    /// <summary>
    ///   Retorna o nome do protocolo como uma string.
    /// </summary>
    /// <returns>
    ///   O nome do protocolo em formato de string.
    /// </returns>
    {$ELSE}
      {$IFDEF ESPANHOL}
      /// <summary>
      ///   Devuelve el nombre del protocolo como una cadena.
      /// </summary>
      /// <returns>
      ///   El nombre del protocolo en formato de cadena.
      /// </returns>
      {$ELSE}
      /// <summary>
      ///   Returns the name of the protocol as a string.
      /// </summary>
      /// <returns>
      ///   The name of the protocol in string format.
      /// </returns>
      {$ENDIF}
    {$ENDIF}
    function ToString: string;
  end;
  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Funções auxiliares para TFBOpenModeType.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Funciones auxiliares para TFBOpenModeType.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Helper functions for TFBOpenModeType.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TFBOpenModeTypeHelper = record helper for TFBOpenModeType
    {$IFDEF PORTUGUES}
    /// <summary>
    ///   Retorna o nome do modo de abertura como uma string.
    /// </summary>
    /// <returns>
    ///   O nome do modo de abertura em formato de string.
    /// </returns>
    {$ELSE}
      {$IFDEF ESPANHOL}
      /// <summary>
      ///   Devuelve el nombre del modo de apertura como una cadena.
      /// </summary>
      /// <returns>
      ///   El nombre del modo de apertura en formato de cadena.
      /// </returns>
      {$ELSE}
      /// <summary>
      ///   Returns the name of the open mode as a string.
      /// </summary>
      /// <returns>
      ///   The name of the open mode in string format.
      /// </returns>
      {$ENDIF}
    {$ENDIF}
    function ToString: string;
  end;
  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Funções auxiliares para TFBCharacterSetType.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Funciones auxiliares para TFBCharacterSetType.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Helper functions for TFBCharacterSetType.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TFBCharacterSetTypeHelper = record helper for TFBCharacterSetType
    {$IFDEF PORTUGUES}
    /// <summary>
    ///   Retorna o nome do conjunto de caracteres como uma string.
    /// </summary>
    /// <returns>
    ///   O nome do conjunto de caracteres em formato de string.
    /// </returns>
    {$ELSE}
      {$IFDEF ESPANHOL}
      /// <summary>
      ///   Devuelve el nombre del conjunto de caracteres como una cadena.
      /// </summary>
      /// <returns>
      ///   El nombre del conjunto de caracteres en formato de cadena.
      /// </returns>
      {$ELSE}
      /// <summary>
      ///   Returns the name of the character set as a string.
      /// </summary>
      /// <returns>
      ///   The name of the character set in string format.
      /// </returns>
      {$ENDIF}
    {$ENDIF}
    function ToString: string;
  end;
  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Parâmetros de configuração para o banco de dados MySQL.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Parámetros de configuración para la base de datos MySQL.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Configuration parameters for the MySQL database.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TMySQLConfigurationParameter = (Database, UserName, Password, Server, Port,
                                  VendorLib, Pooled, PoolMaxItems,
                                  PoolExpireTimeout, PoolCleanupTimeout);
  {$IFDEF PORTUGUES}
  /// <summary>
  ///   Estrutura de configuração para o banco de dados MySQL.
  /// </summary>
  {$ELSE}
    {$IFDEF ESPANHOL}
    /// <summary>
    ///   Estructura de configuración para la base de datos MySQL.
    /// </summary>
    {$ELSE}
    /// <summary>
    ///   Configuration structure for the MySQL database.
    /// </summary>
    {$ENDIF}
  {$ENDIF}
  TMySQLConfiguration = record
    DriverID: string;
    Database: string;
    UserName: string;
    Password: string;
    Server: string;
    Port: Integer;
    VendorLib: string;
    Pooled: Boolean;
    PoolMaxItems: Integer;
    PoolExpireTimeout: Integer;
    PoolCleanupTimeout: Integer;
    {$IFDEF PORTUGUES}
    /// <summary>
    ///   Retorna uma configuração padrão para o MySQL.
    /// </summary>
    /// <returns>
    ///   Uma instância de TMySQLConfiguration com valores padrão.
    /// </returns>
    {$ELSE}
      {$IFDEF ESPANHOL}
      /// <summary>
      ///   Devuelve una configuración predeterminada para MySQL.
      /// </summary>
      /// <returns>
      ///   Una instancia de TMySQLConfiguration con valores predeterminados.
      /// </returns>
      {$ELSE}
      /// <summary>
      ///   Returns a default configuration for MySQL.
      /// </summary>
      /// <returns>
      ///   An instance of TMySQLConfiguration with default values.
      /// </returns>
      {$ENDIF}
    {$ENDIF}
    class function Default: TMySQLConfiguration; static;
  end;
  implementation
uses
  SystemUtils,
  System.SysUtils,
  System.Generics.Collections;
{ TFBConfiguration }
class function TFBConfiguration.Default: TFBConfiguration;
begin
  Result.DriverID := TConnectionType.FB.ToString;
  Result.Database := GetAbsolutePath('.\db.fdb');
  Result.UserName := 'SYSDBA';
  Result.Password := 'masterkey';
  Result.Protocol := TFBProtocolType.TCPIP;
  Result.Server := 'localhost';
  Result.Port := 3050;
  Result.CharacterSet := TFBCharacterSetType.UTF8;
  Result.OpenMode := TFBOpenModeType.OpenOrCreate;
  Result.Pooled := True;
  Result.PoolCleanupTimeout := 30000;
  Result.PoolExpireTimeout := 90000;
  Result.PoolMaxItems := 50;

end;

{ TConnectionTypeHelper }
function TConnectionTypeHelper.ToString: string;
var
  LDictionary: TDictionary<TConnectionType, string>;
begin
  LDictionary := TDictionary<TConnectionType, string>.Create;
  try
    LDictionary.Add(TConnectionType.ADS, 'ADS');
    LDictionary.Add(TConnectionType.FB, 'FB');
    LDictionary.Add(TConnectionType.MySQL, 'MySQL');
    LDictionary.Add(TConnectionType.PG, 'PG');
    LDictionary.Add(TConnectionType.SQLite, 'SQLite');
    LDictionary.TrimExcess;
    if not LDictionary.TryGetValue(Self, Result) then
      raise Exception.Create({$IFDEF PORTUGUES}
                                'Tipo de conexão inválido.'
                              {$ELSEIFDEF ESPANHOL}
                                'Tipo de conexión inválido.'
                              {$ELSE}
                                'Invalid connection type.'
                              {$ENDIF});
  finally
    LDictionary.DisposeOf;
  end;
end;
{ TOpenModeTypeHelper }

function TSQLiteOpenModeTypeHelper.ToString: string;
var
  LDictionary: TDictionary<TSQLiteOpenModeType, string>;
begin
  LDictionary := TDictionary<TSQLiteOpenModeType, string>.Create;
  try
    LDictionary.Add(TSQLiteOpenModeType.CreateUTF8, 'CreateUTF8');
    LDictionary.Add(TSQLiteOpenModeType.CreateUTF16, 'CreateUTF16');
    LDictionary.Add(TSQLiteOpenModeType.ReadWrite, 'ReadWrite');
    LDictionary.Add(TSQLiteOpenModeType.ReadOnly, 'ReadOnly');
    LDictionary.TrimExcess;
    if not LDictionary.TryGetValue(Self, Result) then
      raise Exception.Create({$IFDEF PORTUGUES}
                                'Tipo de modo de abertura inválido.'
                              {$ELSEIFDEF ESPANHOL}
                                'Tipo de modo de apertura no válido.'
                              {$ELSE}
                                'Invalid open mode type.'
                              {$ENDIF});
  finally
    LDictionary.DisposeOf;
  end;
end;

{ TLockingModeTypeHelper }

function TSQLiteLockingModeTypeHelper.ToString: string;
var
  LDictionary: TDictionary<TSQLiteLockingModeType, string>;
begin
  LDictionary := TDictionary<TSQLiteLockingModeType, string>.Create;
  try
    LDictionary.Add(TSQLiteLockingModeType.Normal, 'Normal');
    LDictionary.Add(TSQLiteLockingModeType.Exclusive, 'Exclusive');
    LDictionary.TrimExcess;
    if not LDictionary.TryGetValue(Self, Result) then
      raise Exception.Create({$IFDEF PORTUGUES}
                                'Tipo de modo de bloqueio inválido.'
                              {$ELSEIFDEF ESPANHOL}
                                'Tipo de modo de bloqueo no válido.'
                              {$ELSE}
                                'Invalid locking mode type.'
                              {$ENDIF});
  finally
    LDictionary.DisposeOf;
  end;
end;

{ TSQLiteEncryptTypeHelper }

function TSQLiteEncryptTypeHelper.StrToEnum(
  const AValue: string): TSQLiteEncryptType;
var
  LNormalizedValue: string;
  LDictionary: TDictionary<string, TSQLiteEncryptType>;
begin
  LNormalizedValue := LowerCase(StringReplace(AValue, '-', '_', [rfReplaceAll]));
  LDictionary := TDictionary<string, TSQLiteEncryptType>.Create;
  try
    LDictionary.Add('no', TSQLiteEncryptType.No);
    LDictionary.Add('aes_128', TSQLiteEncryptType.aes_128);
    LDictionary.Add('aes_192', TSQLiteEncryptType.aes_192);
    LDictionary.Add('aes_256', TSQLiteEncryptType.aes_256);
    LDictionary.Add('aes_ctr_128', TSQLiteEncryptType.aes_ctr_128);
    LDictionary.Add('aes_ctr_192', TSQLiteEncryptType.aes_ctr_192);
    LDictionary.Add('aes_ctr_256', TSQLiteEncryptType.aes_ctr_256);
    LDictionary.Add('aes_ecb_128', TSQLiteEncryptType.aes_ecb_128);
    LDictionary.Add('aes_ecb_192', TSQLiteEncryptType.aes_ecb_192);
    LDictionary.Add('aes_ecb_256', TSQLiteEncryptType.aes_ecb_256);
    LDictionary.TrimExcess;
    if not LDictionary.TryGetValue(LNormalizedValue, Result) then
      raise Exception.Create({$IFDEF PORTUGUES}
                                'Tipo de criptografia inválido: ' + AValue
                              {$ELSEIFDEF ESPANHOL}
                                'Tipo de cifrado no válido: ' + AValue
                              {$ELSE}
                                'Invalid encryption type: ' + AValue
                              {$ENDIF});
  finally
    LDictionary.DisposeOf;
  end;
end;

function TSQLiteEncryptTypeHelper.ToString: string;
var
  LDictionary: TDictionary<TSQLiteEncryptType, string>;
begin
  LDictionary := TDictionary<TSQLiteEncryptType, string>.Create;
  try
    LDictionary.Add(TSQLiteEncryptType.No, 'No');
    LDictionary.Add(TSQLiteEncryptType.aes_128, 'aes-128');
    LDictionary.Add(TSQLiteEncryptType.aes_192, 'aes-192');
    LDictionary.Add(TSQLiteEncryptType.aes_256, 'aes-256');
    LDictionary.Add(TSQLiteEncryptType.aes_ctr_128, 'aes-ctr-128');
    LDictionary.Add(TSQLiteEncryptType.aes_ctr_192, 'aes-ctr-192');
    LDictionary.Add(TSQLiteEncryptType.aes_ctr_256, 'aes-ctr-256');
    LDictionary.Add(TSQLiteEncryptType.aes_ecb_128, 'aes-ecb-128');
    LDictionary.Add(TSQLiteEncryptType.aes_ecb_192, 'aes-ecb-192');
    LDictionary.Add(TSQLiteEncryptType.aes_ecb_256, 'aes-ecb-256');
    LDictionary.TrimExcess;
    if not LDictionary.TryGetValue(Self, Result) then
      raise Exception.Create({$IFDEF PORTUGUES}
                                'Tipo de criptografia inválido.'
                              {$ELSEIFDEF ESPANHOL}
                                'Tipo de cifrado no válido.'
                              {$ELSE}
                                'Invalid encryption type.'
                              {$ENDIF});
  finally
    LDictionary.DisposeOf;
  end;
end;

{ TFBProtocolModeTypeHelper }

function TFBProtocolTypeHelper.ToString: string;
var
  LDictionary: TDictionary<TFBProtocolType, string>;
begin
  LDictionary := TDictionary<TFBProtocolType, string>.Create;
  try
    LDictionary.Add(TFBProtocolType.Local, 'Local');
    LDictionary.Add(TFBProtocolType.TCPIP, 'TCPIP');
    LDictionary.TrimExcess;
    if not LDictionary.TryGetValue(Self, Result) then
      raise Exception.Create({$IFDEF PORTUGUES}
                                'Tipo de protocolo inválido.'
                              {$ELSEIFDEF ESPANHOL}
                                'Tipo de protocolo no válido.'
                              {$ELSE}
                                'Invalid protocol type.'
                              {$ENDIF});
  finally
    LDictionary.DisposeOf;
  end;
end;



{ TFBCharacterSetTypeHelper }

function TFBCharacterSetTypeHelper.ToString: string;
var
  LDictionary: TDictionary<TFBCharacterSetType, string>;
begin
  LDictionary := TDictionary<TFBCharacterSetType, string>.Create;
  try
    LDictionary.Add(TFBCharacterSetType.NONE, 'NONE');
    LDictionary.Add(TFBCharacterSetType.ASCII, 'ASCII');
    LDictionary.Add(TFBCharacterSetType.BIG_5, 'BIG_5');
    LDictionary.Add(TFBCharacterSetType.CYRL, 'CYRL');
    LDictionary.Add(TFBCharacterSetType.DOS437, 'DOS437');
    LDictionary.Add(TFBCharacterSetType.DOS850, 'DOS850');
    LDictionary.Add(TFBCharacterSetType.DOS852, 'DOS852');
    LDictionary.Add(TFBCharacterSetType.DOS857, 'DOS857');
    LDictionary.Add(TFBCharacterSetType.DOS860, 'DOS860');
    LDictionary.Add(TFBCharacterSetType.DOS861, 'DOS861');
    LDictionary.Add(TFBCharacterSetType.DOS863, 'DOS863');
    LDictionary.Add(TFBCharacterSetType.DOS865, 'DOS865');
    LDictionary.Add(TFBCharacterSetType.DOS866, 'DOS866');
    LDictionary.Add(TFBCharacterSetType.DOS869, 'DOS869');
    LDictionary.Add(TFBCharacterSetType.EUCJ_0208, 'EUCJ_0208');
    LDictionary.Add(TFBCharacterSetType.GB_2312, 'GB_2312');
    LDictionary.Add(TFBCharacterSetType.ISO8859_1, 'ISO8859_1');
    LDictionary.Add(TFBCharacterSetType.ISO8859_2, 'ISO8859_2');
    LDictionary.Add(TFBCharacterSetType.ISO8859_3, 'ISO8859_3');
    LDictionary.Add(TFBCharacterSetType.ISO8859_4, 'ISO8859_4');
    LDictionary.Add(TFBCharacterSetType.ISO8859_5, 'ISO8859_5');
    LDictionary.Add(TFBCharacterSetType.ISO8859_6, 'ISO8859_6');
    LDictionary.Add(TFBCharacterSetType.ISO8859_7, 'ISO8859_7');
    LDictionary.Add(TFBCharacterSetType.ISO8859_8, 'ISO8859_8');
    LDictionary.Add(TFBCharacterSetType.ISO8859_9, 'ISO8859_9');
    LDictionary.Add(TFBCharacterSetType.ISO8859_13, 'ISO8859_13');
    LDictionary.Add(TFBCharacterSetType.KOI8R, 'KOI8R');
    LDictionary.Add(TFBCharacterSetType.KOI8U, 'KOI8U');
    LDictionary.Add(TFBCharacterSetType.KSC_5601, 'KSC_5601');
    LDictionary.Add(TFBCharacterSetType.KSC_DICTIONARY, 'KSC_DICTIONARY');
    LDictionary.Add(TFBCharacterSetType.NEXT, 'NEXT');
    LDictionary.Add(TFBCharacterSetType.OCTETS, 'OCTETS');
    LDictionary.Add(TFBCharacterSetType.SJIS_0208, 'SJIS_0208');
    LDictionary.Add(TFBCharacterSetType.TIS620, 'TIS620');
    LDictionary.Add(TFBCharacterSetType.UNICODE_FSS, 'UNICODE_FSS');
    LDictionary.Add(TFBCharacterSetType.UTF8, 'UTF8');
    LDictionary.Add(TFBCharacterSetType.UTF16, 'UTF16');
    LDictionary.Add(TFBCharacterSetType.WIN1250, 'WIN1250');
    LDictionary.Add(TFBCharacterSetType.WIN1251, 'WIN1251');
    LDictionary.Add(TFBCharacterSetType.WIN1252, 'WIN1252');
    LDictionary.Add(TFBCharacterSetType.WIN1253, 'WIN1253');
    LDictionary.Add(TFBCharacterSetType.WIN1254, 'WIN1254');
    LDictionary.Add(TFBCharacterSetType.WIN1255, 'WIN1255');
    LDictionary.Add(TFBCharacterSetType.WIN1256, 'WIN1256');
    LDictionary.Add(TFBCharacterSetType.WIN1257, 'WIN1257');
    LDictionary.Add(TFBCharacterSetType.WIN1258, 'WIN1258');
    LDictionary.TrimExcess;
    if not LDictionary.TryGetValue(Self, Result) then
      raise Exception.Create({$IFDEF PORTUGUES}
                                'Tipo de charset inválido.'
                              {$ELSEIFDEF ESPANHOL}
                                'Tipo de conjunto de caracteres no válido.'
                              {$ELSE}
                                'Invalid charset type.'
                              {$ENDIF});
  finally
    LDictionary.DisposeOf;
  end;
end;

{ TDatabasePGConfig }

class function TPGConfiguration.Default: TPGConfiguration;
begin
  Result.DriverID := TConnectionType.PG.ToString;
  Result.Server := 'localhost';
  Result.Port := 5432;
  Result.Database := 'postgres';
  Result.UserName := 'postgres';
  Result.Password := 'postgres';
  Result.CharacterSet := 'UTF8';
  Result.Pooled := True;
  Result.PoolCleanupTimeout := 30000;
  Result.PoolExpireTimeout := 90000;
  Result.PoolMaxItems := 50;
end;

{ TADSConfiguration }

class function TADSConfiguration.Default: TADSConfiguration;
begin
  Result.DriverID := TConnectionType.ADS.ToString;
  Result.Database := GetAbsolutePath('.\');
  Result.UserName := EmptyStr;
  Result.Password := EmptyStr;
  Result.Pooled := True;
  Result.ShowDelete := False;
  Result.PoolCleanupTimeout := 30000;
  Result.PoolExpireTimeout := 90000;
  Result.PoolMaxItems := 50;
  Result.CharacterSet := TADSCharacterSet.ANSI;
  Result.Protocol := TADSProtocol.TCPIP;
  Result.TableType := TADSTableType.CDX;
  Result.Locking := TADSLocking.Compatible;
  Result.ServerType := TADSServerType.Local;
  {$IFDEF WIN32}
  Result.VendorLib := GetAbsolutePath('.\ace32.dll');
  {$ELSE}
  Result.VendorLib := GetAbsolutePath('.\ace64.dll');
  {$ENDIF}

end;

{ TADSServerTypeHelper }

function TADSServerTypeHelper.ToString: string;
var
  LDictionary: TDictionary<TADSServerType, string>;
begin
  LDictionary := TDictionary<TADSServerType, string>.Create;
  try
    LDictionary.Add(TADSServerType.Null, EmptyStr);
    LDictionary.Add(TADSServerType.Remote, 'Remote');
    LDictionary.Add(TADSServerType.Local, 'Local');
    LDictionary.Add(TADSServerType.Internet, 'Internet');
    LDictionary.TrimExcess;

    if not LDictionary.TryGetValue(Self, Result) then
      raise Exception.Create(
        {$IFDEF PORTUGUES}
          'Tipo de servidor inválido.'
        {$ELSE}
          {$IFDEF ESPANHOL}
            'Tipo de servidor no admitido o no especificado.'
          {$ELSE}
            'Invalid server type.'
          {$ENDIF}
        {$ENDIF}
      );
  finally
    LDictionary.DisposeOf;
  end;
end;


{ TADSCharacterSetHelper }

function TADSCharacterSetHelper.ToString: string;
var
  LDictionary: TDictionary<TADSCharacterSet, string>;
begin
  LDictionary := TDictionary<TADSCharacterSet, string>.Create;
  try
    LDictionary.Add(TADSCharacterSet.ANSI, 'ANSI');
    LDictionary.Add(TADSCharacterSet.OEM, 'OEM');
    LDictionary.TrimExcess;
    if not LDictionary.TryGetValue(Self, Result) then
      raise Exception.Create(
        {$IFDEF PORTUGUES}
          'Tipo de conjunto de caracteres inválido.'
        {$ELSE}
          {$IFDEF ESPANHOL}
            'Tipo de conjunto de caracteres no admitido o no especificado.'
          {$ELSE}
            'Invalid character set type.'
          {$ENDIF}
        {$ENDIF}
      );
  finally
    LDictionary.DisposeOf;
  end;
end;

{ TADSProtocolHelper }

function TADSProtocolHelper.ToString: string;
var
  LDictionary: TDictionary<TADSProtocol, string>;
begin
  LDictionary := TDictionary<TADSProtocol, string>.Create;
  try
    LDictionary.Add(TADSProtocol.Null, EmptyStr);
    LDictionary.Add(TADSProtocol.UDP, 'UDP');
    LDictionary.Add(TADSProtocol.IPX, 'IPX');
    LDictionary.Add(TADSProtocol.TCPIP, 'TCPIP');
    LDictionary.Add(TADSProtocol.TLS, 'TLS');
    LDictionary.TrimExcess;
    if not LDictionary.TryGetValue(Self, Result) then
      raise Exception.Create(
        {$IFDEF PORTUGUES}
          'Tipo de protocolo inválido.'
        {$ELSE}
          {$IFDEF ESPANHOL}
            'Tipo de protocolo no admitido o no especificado.'
          {$ELSE}
            'Invalid protocol type.'
          {$ENDIF}
        {$ENDIF}
      );
  finally
    LDictionary.DisposeOf;
  end;
end;

{ TADSTableTypeHelper }

function TADSTableTypeHelper.ToString: string;
var
  LDictionary: TDictionary<TADSTableType, string>;
begin
  LDictionary := TDictionary<TADSTableType, string>.Create;
  try
    LDictionary.Add(TADSTableType.Default, 'Default');
    LDictionary.Add(TADSTableType.CDX, 'CDX');
    LDictionary.Add(TADSTableType.VFP, 'VFP');
    LDictionary.Add(TADSTableType.ADT, 'ADT');
    LDictionary.Add(TADSTableType.NTX, 'NTX');
    LDictionary.TrimExcess;
    if not LDictionary.TryGetValue(Self, Result) then
      raise Exception.Create(
        {$IFDEF PORTUGUES}
          'Tipo de tabela inválido.'
        {$ELSE}
          {$IFDEF ESPANHOL}
            'Tipo de tabla no admitido o no especificado.'
          {$ELSE}
            'Invalid table type.'
          {$ENDIF}
        {$ENDIF}
      );
  finally
    LDictionary.DisposeOf;
  end;
end;

{ TADSLockingHelper }

function TADSLockingHelper.ToString: string;
var
  LDictionary: TDictionary<TADSLocking, string>;
begin
  LDictionary := TDictionary<TADSLocking, string>.Create;
  try
    LDictionary.Add(TADSLocking.Null, EmptyStr);
    LDictionary.Add(TADSLocking.Proprietary, 'Proprietary');
    LDictionary.Add(TADSLocking.Compatible, 'Compatible');
    LDictionary.TrimExcess;
    if not LDictionary.TryGetValue(Self, Result) then
      raise Exception.Create(
        {$IFDEF PORTUGUES}
          'Tipo de bloqueio inválido.'
        {$ELSE}
          {$IFDEF ESPANHOL}
            'Tipo de bloqueo no admitido o no especificado.'
          {$ELSE}
            'Invalid locking type.'
          {$ENDIF}
        {$ENDIF}
      );
  finally
    LDictionary.DisposeOf;
  end;
end;

{ TSQLiteConfiguration }

class function TSQLiteConfiguration.Default: TSQLiteConfiguration;
begin
  Result.DriverID := TConnectionType.SQLite.ToString;
  Result.Database := GetAbsolutePath('.\db.dat');
  Result.UserName := EmptyStr;
  Result.Password := EmptyStr;
  Result.OpenMode := TSQLiteOpenModeType.ReadWrite;
  Result.LockingMode := TSQLiteLockingModeType.Normal;
  Result.Encrypt := TSQLiteEncryptType.No;
  Result.Pooled := True;
  Result.PoolCleanupTimeout := 30000;
  Result.PoolExpireTimeout := 90000;
  Result.PoolMaxItems := 50;

end;

{ TFBOpenModeTypeHelper }

function TFBOpenModeTypeHelper.ToString: string;
var
  LDictionary: TDictionary<TFBOpenModeType, string>;
begin
  LDictionary := TDictionary<TFBOpenModeType, string>.Create;
  try
    LDictionary.Add(TFBOpenModeType.Open, 'Open');
    LDictionary.Add(TFBOpenModeType.Create, 'Create');
    LDictionary.Add(TFBOpenModeType.OpenOrCreate, 'OpenOrCreate');
    LDictionary.TrimExcess;

    if not LDictionary.TryGetValue(Self, Result) then
      raise Exception.Create({$IFDEF PORTUGUES}
                                'Tipo de modo de abertura inválido.'
                              {$ELSEIFDEF ESPANHOL}
                                'Tipo de modo de apertura no válido.'
                              {$ELSE}
                                'Invalid open mode type.'
                              {$ENDIF});
  finally
    LDictionary.DisposeOf;
  end;

end;

{ TMySQLConfiguration }

class function TMySQLConfiguration.Default: TMySQLConfiguration;
begin
  Result.DriverID := TConnectionType.MySQL.ToString;
  Result.Database := 'db';
  Result.UserName := 'root';
  Result.Password := EmptyStr;
  Result.Server := 'localhost';
  Result.Port := 3306;
  Result.VendorLib := GetAbsolutePath('.\libmysql.dll');
  Result.Pooled := True;
  Result.PoolCleanupTimeout := 30000;
  Result.PoolExpireTimeout := 90000;
  Result.PoolMaxItems := 50;

end;

end.
