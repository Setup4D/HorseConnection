library HorseConnection;

{$IFDEF PORTUGUES}
(*
  Atenção: Este projeto foi desenvolvido para uso como middleware no Horse e
  **não** deve ser compilado como DLL.

  Objetivo: Fornece integração para conexões de banco (SQLite, PostgreSQL, ADS,
  FB, MySQL) e auxiliares de configuração no contexto de uma aplicação Horse.

  Observação: A compilação como DLL pode gerar problemas de memória e
  incompatibilidade com o framework Horse.
*)
{$ELSE}
  {$IFDEF ESPANHOL}
  (*
    Atención: Este proyecto fue desarrollado para ser utilizado como middleware
    en Horse y **no** debe ser compilado como DLL.

    Objetivo: Proporciona integración para conexiones de bases de datos
    (SQLite, PostgreSQL, ADS, FB, MySQL) y auxiliares de configuración en el
    contexto de una aplicación Horse.

    Nota: La compilación como DLL puede causar problemas de memoria y ser
    incompatible con el framework Horse.
  *)
  {$ELSE}
  (*
    Note: This project was developed to be used as middleware in Horse and
    **should not** be compiled as a DLL.

    Purpose: Provides integration for database connections (SQLite, PostgreSQL,
    ADS, FB, MySQL) and configuration helpers in the context of a Horse
    application.

    Warning: Compiling as a DLL may cause memory issues and be incompatible
    with the Horse framework.
  *)
  {$ENDIF}
{$ENDIF}


uses
  System.SysUtils,
  System.Classes,
  Horse.Connection in 'src\Horse.Connection.pas',
  EnumsHelpersUtils in 'src\Utils\EnumsHelpersUtils.pas',
  MethodReferencesUtils in 'src\Utils\MethodReferencesUtils.pas',
  SystemUtils in 'src\Utils\SystemUtils.pas',
  ADSDataBaseConfigurationParameter in 'src\Utils\ConfigurationParameter\ADSDataBaseConfigurationParameter.pas',
  FBDataBaseConfigurationParameter in 'src\Utils\ConfigurationParameter\FBDataBaseConfigurationParameter.pas',
  MySQLDataBaseConfigurationParameter in 'src\Utils\ConfigurationParameter\MySQLDataBaseConfigurationParameter.pas',
  PGDataBaseConfigurationParameter in 'src\Utils\ConfigurationParameter\PGDataBaseConfigurationParameter.pas',
  SQLiteDataBaseConfigurationParameter in 'src\Utils\ConfigurationParameter\SQLiteDataBaseConfigurationParameter.pas',
  Horse.Connection.ADS in 'src\Connection\Horse.Connection.ADS.pas',
  Horse.Connection.FB in 'src\Connection\Horse.Connection.FB.pas',
  Horse.Connection.MySQL in 'src\Connection\Horse.Connection.MySQL.pas',
  Horse.Connection.PG in 'src\Connection\Horse.Connection.PG.pas',
  Horse.Connection.SQLite in 'src\Connection\Horse.Connection.SQLite.pas',
  ADSDatabaseConfigurationManager in 'src\Configuration\ADS\ADSDatabaseConfigurationManager.pas',
  ADSDataBaseConnectionManager in 'src\Configuration\ADS\ADSDataBaseConnectionManager.pas',
  FBDatabaseConfigurationManager in 'src\Configuration\FB\FBDatabaseConfigurationManager.pas',
  FBDataBaseConnectionManager in 'src\Configuration\FB\FBDataBaseConnectionManager.pas',
  MySQLDatabaseConfigurationManager in 'src\Configuration\MySQL\MySQLDatabaseConfigurationManager.pas',
  MySQLDataBaseConnectionManager in 'src\Configuration\MySQL\MySQLDataBaseConnectionManager.pas',
  PGDatabaseConfigurationManager in 'src\Configuration\PG\PGDatabaseConfigurationManager.pas',
  PGDataBaseConnectionManager in 'src\Configuration\PG\PGDataBaseConnectionManager.pas',
  SQLiteDatabaseConfigurationManager in 'src\Configuration\SQLite\SQLiteDatabaseConfigurationManager.pas',
  SQLiteDataBaseConnectionManager in 'src\Configuration\SQLite\SQLiteDataBaseConnectionManager.pas';

{$R *.res}

begin
end.
