unit Horse.Connection;

interface

uses
  ProdFuncAnonymous,
  DBConfigParameters,
  DBConfigTypes,

  Horse,

  FireDAC.Comp.Client,

  System.SysUtils;

var

{$REGION 'Variável do ADS'}
  ConfigADS: TDatabaseConfig;
  DatabaseADS : string;
  ConnectionPrefixADS : string;
{$ENDREGION}

{$REGION 'Variável do PG'}
  ConfigPG: TDatabaseConfig;
  DatabasePG : string;
  ConnectionPrefixPG : string;
{$ENDREGION}

{$REGION 'Variável do PG'}
  ConfigSQLite: TDatabaseConfig;
  DatabaseSQLite : string;
  ConnectionPrefixSQLite : string;
{$ENDREGION}

type
  {$SCOPEDENUMS ON}
  TDatabaseConfigParam = DBConfigTypes.TDatabaseConfigParam;
  TConnectionType = DBConfigTypes.TConnectionType;
  {$SCOPEDENUMS OFF}


function GetConnection(AValue : TConnectionType): TFDConnection;


{$REGION 'Procedimentos do ADS'}
procedure ApplyDatabaseConfigADS(const AParam: TDatabaseConfigParam;
  const Value: string); overload;
procedure ApplyDatabaseConfigADS(const AParam: TDatabaseConfigParam;
  const Value: Integer); overload;
procedure ApplyDatabaseConfigADS(const AParam: TDatabaseConfigParam;
  const Value: Boolean); overload;
procedure HorseConnectionADS(Req: THorseRequest; Res: THorseResponse; Next: TProc);
{$ENDREGION}

{$REGION 'Procedimentos do PG'}
procedure ApplyDatabaseConfigPG(const AParam: TDatabaseConfigParam;
  const Value: string); overload;
procedure ApplyDatabaseConfigPG(const AParam: TDatabaseConfigParam;
  const Value: Integer); overload;
procedure ApplyDatabaseConfigPG(const AParam: TDatabaseConfigParam;
  const Value: Boolean); overload;
procedure HorseConnectionPG(Req: THorseRequest; Res: THorseResponse; Next: TProc);
{$ENDREGION}

{$REGION 'Procedimentos do SQLite'}
procedure ApplyDatabaseConfigSQLite(const AParam: TDatabaseConfigParam;
  const Value: string); overload;
procedure ApplyDatabaseConfigSQLite(const AParam: TDatabaseConfigParam;
  const Value: Integer); overload;
procedure ApplyDatabaseConfigSQLite(const AParam: TDatabaseConfigParam;
  const Value: Boolean); overload;
procedure ApplyDatabaseConfigSQLite(const AParam: TDatabaseConfigParam;
  const Value: TSQLiteLockingModeType); overload;
procedure ApplyDatabaseConfigSQLite(const AParam: TDatabaseConfigParam;
  const Value: TSQLiteOpenModeType); overload;
procedure ApplyDatabaseConfigSQLite(const AParam: TDatabaseConfigParam;
  const Value: TSQLiteEncryptType);  overload;

procedure HorseConnectionSQLite(Req: THorseRequest; Res: THorseResponse; Next: TProc);
{$ENDREGION}

implementation

uses
  System.Generics.Collections,

{$REGION 'Uses do ADS'}
  DBConnectionManagerADS,
{$ENDREGION}

{$REGION 'Uses do PG'}
  DBConnectionManagerPG,
{$ENDREGION}

{$REGION 'Uses do SQLite'}
  DBConnectionManagerSQLite;
{$ENDREGION}

{$REGION 'Implementação do ADS'}
function ADSConnection: TFDConnection;
begin
  Result := DBConnectionManagerADS.GetConnection(ConfigADS, DatabaseADS, ConnectionPrefixADS);
end;

procedure ApplyDatabaseConfigADS(const AParam: TDatabaseConfigParam;
  const Value: string);
begin
  DatabaseConfig(ConfigADS, AParam, Value);
end;

procedure ApplyDatabaseConfigADS(const AParam: TDatabaseConfigParam;
  const Value: Integer);
begin
  DatabaseConfig(ConfigADS, AParam, Value);
end;

procedure ApplyDatabaseConfigADS(const AParam: TDatabaseConfigParam;
  const Value: Boolean);
begin
  DatabaseConfig(ConfigADS, AParam, Value);
end;

procedure HorseConnectionADS(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  Next;
end;

{$ENDREGION}

{$REGION 'Implementação do PG'}

function PGConnection: TFDConnection;
begin
  Result := DBConnectionManagerPG.GetConnection(ConfigPG, DatabasePG, ConnectionPrefixPG);
end;

procedure ApplyDatabaseConfigPG(const AParam: TDatabaseConfigParam;
  const Value: string);
begin
  DatabaseConfig(ConfigPG, AParam, Value);
end;

procedure ApplyDatabaseConfigPG(const AParam: TDatabaseConfigParam;
  const Value: Integer);
begin
  DatabaseConfig(ConfigPG, AParam, Value);
end;

procedure ApplyDatabaseConfigPG(const AParam: TDatabaseConfigParam;
  const Value: Boolean);
begin
  DatabaseConfig(ConfigPG, AParam, Value);
end;

procedure HorseConnectionPG(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  Next;
end;

{$ENDREGION}

{$REGION 'Implementação do SQLite'}

function SQLiteConnection: TFDConnection;
begin
  Result := DBConnectionManagerSQLite.GetConnection(ConfigSQLite, DatabaseSQLite, ConnectionPrefixSQLite);
end;

procedure ApplyDatabaseConfigSQLite(const AParam: TDatabaseConfigParam;
  const Value: string);
begin
  DatabaseConfig(ConfigSQLite, AParam, Value);
end;

procedure ApplyDatabaseConfigSQLite(const AParam: TDatabaseConfigParam;
  const Value: Integer);
begin
  DatabaseConfig(ConfigSQLite, AParam, Value);
end;

procedure ApplyDatabaseConfigSQLite(const AParam: TDatabaseConfigParam;
  const Value: Boolean);
begin
  DatabaseConfig(ConfigSQLite, AParam, Value);
end;

procedure ApplyDatabaseConfigSQLite(const AParam: TDatabaseConfigParam;
  const Value: TSQLiteLockingModeType);
begin
  DatabaseConfig(ConfigSQLite, AParam, Value.ToString);
end;

procedure ApplyDatabaseConfigSQLite(const AParam: TDatabaseConfigParam;
  const Value: TSQLiteOpenModeType);
begin
  DatabaseConfig(ConfigSQLite, AParam, Value.ToString);
end;

procedure ApplyDatabaseConfigSQLite(const AParam: TDatabaseConfigParam;
  const Value: TSQLiteEncryptType);
begin
  DatabaseConfig(ConfigSQLite, AParam, Value.ToString);
end;


procedure HorseConnectionSQLite(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  Next;
end;

{$ENDREGION}

{$REGION 'Implementação Comum'}

procedure RaiseConnectionNotDefined(AValue: TConnectionType);
var
  ErrorMsg: string;
begin
  case AValue of
    TConnectionType.FB:
      ErrorMsg := {$IFDEF PORTUGUES}
                    'Configurações para Firebird (FB) não definidas.'
                  {$ELSE}
                    {$IFDEF ESPANHOL}
                      'Configuración para Firebird (FB) no definida.'
                    {$ELSE}
                      'Configurations for Firebird (FB) are not defined.'
                    {$ENDIF}
                  {$ENDIF};
    TConnectionType.MySQL:
      ErrorMsg := {$IFDEF PORTUGUES}
                    'Configurações para MySQL não definidas.'
                  {$ELSE}
                    {$IFDEF ESPANHOL}
                      'Configuración de MySQL no definida.'
                    {$ELSE}
                      'Configurations for MySQL are not defined.'
                    {$ENDIF}
                  {$ENDIF};
  else
    ErrorMsg := {$IFDEF PORTUGUES}
                   'Tipo de conexão não suportado ou não especificado.'
                 {$ELSE}
                   {$IFDEF ESPANHOL}
                     'Tipo de conexión no admitido o no especificado.'
                   {$ELSE}
                     'Connection type not supported or not specified.'
                   {$ENDIF}
                 {$ENDIF};
  end;

  raise Exception.Create(ErrorMsg);
end;

function GetConnection(AValue : TConnectionType): TFDConnection;
var
  LDictionary: TDictionary<TConnectionType, TConnectionFunc>;
  LAction :  TConnectionFunc;
begin
  LDictionary := TDictionary<TConnectionType, TConnectionFunc>.Create;
  try
    LDictionary.Add(TConnectionType.ADS, ADSConnection);
    LDictionary.Add(TConnectionType.PG, PGConnection);
    LDictionary.Add(TConnectionType.SQLite, SQLiteConnection);

    LDictionary.TrimExcess;

    if not LDictionary.TryGetValue(AValue, LAction) then
      RaiseConnectionNotDefined(AValue);

    Result := LAction;
  finally

    LDictionary.DisposeOf;
  end;
end;

{$ENDREGION}

initialization

{$REGION 'Iniciar o ADS'}
  ConfigADS := TDatabaseConfig.DefaultADS;
{$ENDREGION}

{$REGION 'Iniciar o PG'}
  ConfigPG := TDatabaseConfig.DefaultPG;
{$ENDREGION}

{$REGION 'Iniciar o SQLite'}
  ConfigSQLite := TDatabaseConfig.DefaultSQLite;
{$ENDREGION}

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}

finalization

end.

