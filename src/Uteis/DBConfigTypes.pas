unit DBConfigTypes;

interface

{$SCOPEDENUMS ON}

type
  TSQLiteLockingModeType = (Normal, Exclusive);
  TSQLiteOpenModeType = (CreateUTF8, CreateUTF16, ReadWrite, ReadOnly);
  TSQLiteEncryptType = (No, aes_128, aes_192, aes_256, aes_ctr_128, aes_ctr_192,
                        aes_ctr_256, aes_ecb_128, aes_ecb_192, aes_ecb_256);

  TConnectionType = (ADS, FB, MySQL, PG, SQLite);

  TDatabaseConfigParam = (Server, Port, Database, UserName, Password,
                          CharacterSet, Pooled, PoolMaxItems, PoolExpireTimeout,
                          PoolCleanupTimeout, ShowDelete, VendorLib, Protocol,
                          TableType, Locking, OpenMode, Encrypt, PasswordAuxiliary);

  TDatabaseConfig = record
    DriverID: string;
    Server: string;
    Port: string;
    Database: string;
    UserName: string;
    Password: string;
    CharacterSet: string;
    Pooled: Boolean;
    PoolMaxItems: Integer;
    PoolExpireTimeout: Integer;
    PoolCleanupTimeout: Integer;
    ShowDelete : Boolean;
    VendorLib : string;
    Protocol : string;
    TableType : string;
    Locking : string;
    OpenMode : string;
    Encrypt : string;
    PasswordAuxiliary : string;

    class function DefaultADS: TDatabaseConfig; static;
    class function DefaultPG: TDatabaseConfig; static;
    class function DefaultSQLite: TDatabaseConfig; static;
  end;

  TSQLiteEncryptTypeHelper= record helper for TSQLiteEncryptType
    function ToString: string;
    function StrToEnum(const AValue: string): TSQLiteEncryptType;
  end;

  TSQLiteLockingModeTypeHelper= record helper for TSQLiteLockingModeType
    function ToString: string;
  end;

  TSQLiteOpenModeTypeHelper= record helper for TSQLiteOpenModeType
    function ToString: string;
  end;


  TConnectionTypeHelper= record helper for TConnectionType
    function ToString: string;
  end;

implementation

uses
  System.SysUtils,
  System.Generics.Collections;

{ TDatabaseConfig }

class function TDatabaseConfig.DefaultADS: TDatabaseConfig;
begin
  Result.DriverID := TConnectionType.ADS.ToString;
  Result.Server := 'Local';
  Result.Port := '';
  Result.Database := '.\';
  Result.UserName := '';
  Result.Password := '';
  Result.CharacterSet := 'ANSI';
  Result.ShowDelete := False;
  Result.Protocol := 'TCPIP';
  Result.TableType := 'CDX';
  Result.Locking := 'Compatible';
  Result.Pooled := True;
  Result.PoolCleanupTimeout := 30000;
  Result.PoolExpireTimeout := 90000;
  Result.PoolMaxItems := 50;

  {$IFDEF WIN32}
  Result.VendorLib := ExtractFilePath(ParamStr(0)) + 'ace32.dll';
  {$ELSE}
  Result.VendorLib := ExtractFilePath(ParamStr(0)) + 'ace64.dll';
  {$ENDIF}
end;

class function TDatabaseConfig.DefaultPG: TDatabaseConfig;
begin
  Result.DriverID := TConnectionType.PG.ToString;
  Result.Server := 'localhost';
  Result.Port := '5432';
  Result.Database := 'postgres';
  Result.UserName := 'postgres';
  Result.Password := 'postgres';
  Result.CharacterSet := 'UTF8';
  Result.Pooled := True;
  Result.PoolCleanupTimeout := 30000;
  Result.PoolExpireTimeout := 90000;
  Result.PoolMaxItems := 50;
end;

class function TDatabaseConfig.DefaultSQLite: TDatabaseConfig;
begin
  Result.DriverID := TConnectionType.SQLite.ToString;
  Result.Database := '.\db.dat';
  Result.UserName := EmptyStr;
  Result.Password := EmptyStr;
  Result.OpenMode := TSQLiteOpenModeType.ReadWrite.ToString;
  Result.Locking := TSQLiteLockingModeType.Normal.ToString;
  Result.Encrypt := TSQLiteEncryptType.No.ToString;
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

end.

