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
  DBConfigParameters in 'src\Uteis\DBConfigParameters.pas',
  ProdFuncAnonymous in 'src\Uteis\ProdFuncAnonymous.pas',
  DBConfigManagerSQLite in 'src\SQLite\DBConfigManagerSQLite.pas',
  DBConnectionManagerSQLite in 'src\SQLite\DBConnectionManagerSQLite.pas',
  DBConfigManagerPG in 'src\PG\DBConfigManagerPG.pas',
  DBConnectionManagerPG in 'src\PG\DBConnectionManagerPG.pas',
  DBConfigManagerADS in 'src\ADS\DBConfigManagerADS.pas',
  DBConnectionManagerADS in 'src\ADS\DBConnectionManagerADS.pas',
  DBConfigTypes in 'src\Uteis\DBConfigTypes.pas';

{$R *.res}

begin
end.
