unit Horse.Connection;

interface

uses
  DBConfigParameters,
  DBConfigTypes,

  Horse,

  FireDAC.Comp.Client,

  System.SysUtils;

var

{$REGION 'ADS'}
  ConfigADS: TDatabaseConfig;
  DatabaseADS : string;
  ConnectionPrefixADS : string;
{$ENDREGION}

{$REGION 'PG'}
  ConfigPG: TDatabaseConfig;
  DatabasePG : string;
  ConnectionPrefixPG : string;
{$ENDREGION}

type
  {$SCOPEDENUMS ON}
  TDatabaseConfigParam = DBConfigTypes.TDatabaseConfigParam;
  TConnectionType = DBConfigTypes.TConnectionType;
  {$SCOPEDENUMS OFF}


function GetConnection(AValue : TConnectionType): TFDConnection;


{$REGION 'ADS'}
procedure ApplyDatabaseConfigADS(const AParam: TDatabaseConfigParam;
  const Value: string); overload;
procedure ApplyDatabaseConfigADS(const AParam: TDatabaseConfigParam;
  const Value: Integer); overload;
procedure ApplyDatabaseConfigADS(const AParam: TDatabaseConfigParam;
  const Value: Boolean); overload;
procedure HorseConnectionADS(Req: THorseRequest; Res: THorseResponse; Next: TProc);
{$ENDREGION}

{$REGION 'PG'}
procedure ApplyDatabaseConfigPG(const AParam: TDatabaseConfigParam;
  const Value: string); overload;
procedure ApplyDatabaseConfigPG(const AParam: TDatabaseConfigParam;
  const Value: Integer); overload;
procedure ApplyDatabaseConfigPG(const AParam: TDatabaseConfigParam;
  const Value: Boolean); overload;
procedure HorseConnectionPG(Req: THorseRequest; Res: THorseResponse; Next: TProc);
{$ENDREGION}


implementation

uses

{$REGION 'ADS'}
  DBConnectionManagerADS,
{$ENDREGION}

{$REGION 'PG'}
  DBConnectionManagerPG;
{$ENDREGION}

{$REGION 'Comum'}

function GetConnection(AValue : TConnectionType): TFDConnection;
begin
  case AValue of
    TConnectionType.ADS:
      Result := DBConnectionManagerADS.GetConnection(ConfigADS, DatabaseADS, ConnectionPrefixADS);
    TConnectionType.FB:
      {$IFDEF PORTUGUES}
      raise Exception.Create('Configurações para Firebird (FB) não definidas.');
      {$ELSE}
      raise Exception.Create('Configurations for Firebird (FB) are not defined.');
      {$ENDIF}
    TConnectionType.MySQL:
      {$IFDEF PORTUGUES}
      raise Exception.Create('Configurações para MySQL não definidas.');
      {$ELSE}
      raise Exception.Create('Configurations for MySQL are not defined.');
      {$ENDIF}
    TConnectionType.PG:
      Result := DBConnectionManagerPG.GetConnection(ConfigPG, DatabasePG, ConnectionPrefixPG);
    TConnectionType.SQLite:
      {$IFDEF PORTUGUES}
      raise Exception.Create('Configurações para SQLite não definidas.');
      {$ELSE}
      raise Exception.Create('Configurations for SQLite are not defined.');
      {$ENDIF}
  else
    {$IFDEF PORTUGUES}
    raise Exception.Create('Tipo de conexão não suportado ou não especificado.');
    {$ELSE}
    raise Exception.Create('Connection type not supported or not specified.');
    {$ENDIF}
  end;
end;

{$ENDREGION}

{$REGION 'ADS'}
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

{$REGION 'PG'}
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

initialization

{$REGION 'ADS'}
  ConfigADS := TDatabaseConfig.DefaultADS;
{$ENDREGION}

{$REGION 'PG'}
  ConfigPG := TDatabaseConfig.DefaultPG;
{$ENDREGION}

finalization

end.

