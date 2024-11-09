unit EnumsHelpersUtils;


interface

{$SCOPEDENUMS ON}

type
  //Connection
  TConnectionType = (ADS, FB, MySQL, PG, SQLite);

  TConnectionTypeHelper= record helper for TConnectionType
    function ToString: string;
  end;

  //PostgreSQL
  TPGConfigurationParameter = (Server, Port, Database, UserName, Password, CharacterSet,
                    Pooled, PoolMaxItems, PoolExpireTimeout, PoolCleanupTimeout);


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

    class function Default: TPGConfiguration; static;
  end;

  //ADS;
  TADSConfigurationParameter = (ServerTypes, Database, UserName, Password, CharacterSet,
                    Pooled, PoolMaxItems, PoolExpireTimeout, PoolCleanupTimeout,
                    ShowDelete, VendorLib, Protocol, TableType, Locking);
  TADSServerType = (Null, Remote, Local, Internet);
  TADSCharacterSet = (ANSI, OEM);
  TADSProtocol = (Null, UDP, IPX, TCPIP, TLS);
  TADSTableType = (Default, CDX, VFP, ADT, NTX);
  TADSLocking = (Null, Proprietary, Compatible);

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

    class function Default: TADSConfiguration; static;
  end;

  TADSServerTypeHelper= record helper for TADSServerType
    function ToString: string;
  end;

  TADSCharacterSetHelper = record helper for TADSCharacterSet
    function ToString: string;
  end;

  TADSProtocolHelper = record helper for TADSProtocol
    function ToString: string;
  end;

  TADSTableTypeHelper = record helper for TADSTableType
    function ToString: string;
  end;

  TADSLockingHelper = record helper for TADSLocking
    function ToString: string;
  end;


  //SQLite
  TSQLiteConfigurationParameter = (Database, UserName, Password, LockingMode, OpenMode,
                          Encrypt, Pooled, PoolMaxItems, PoolExpireTimeout,
                          PoolCleanupTimeout);

  TSQLiteLockingModeType = (Normal, Exclusive);
  TSQLiteOpenModeType = (CreateUTF8, CreateUTF16, ReadWrite, ReadOnly);
  TSQLiteEncryptType = (No, aes_128, aes_192, aes_256, aes_ctr_128, aes_ctr_192,
                        aes_ctr_256, aes_ecb_128, aes_ecb_192, aes_ecb_256);

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

    class function Default: TSQLiteConfiguration; static;
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

  //FB

  TFBConfigurationParameter = (Database, UserName, Password, Protocol, Server, Port,
                    CharacterSet, OpenMode, Pooled, PoolMaxItems,
                    PoolExpireTimeout, PoolCleanupTimeout);

  TFBProtocolType = (Local, TCPIP);

  TFBOpenModeType = (Open, Create, OpenOrCreate);

  TFBCharacterSetType = (NONE, ASCII, BIG_5, CYRL, DOS437, DOS850, DOS852, DOS857,
                         DOS860, DOS861, DOS863, DOS865, DOS866, DOS869, EUCJ_0208,
                         GB_2312, ISO8859_1, ISO8859_2, ISO8859_3, ISO8859_4, ISO8859_5,
                         ISO8859_6, ISO8859_7, ISO8859_8, ISO8859_9, ISO8859_13, KOI8R,
                         KOI8U, KSC_5601, KSC_DICTIONARY, NEXT, OCTETS, SJIS_0208,
                         TIS620, UNICODE_FSS, UTF8, UTF16, WIN1250, WIN1251, WIN1252,
                         WIN1253, WIN1254, WIN1255, WIN1256, WIN1257, WIN1258);

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

    class function Default: TFBConfiguration; static;
  end;

  TFBProtocolTypeHelper= record helper for TFBProtocolType
    function ToString: string;
  end;

  TFBOpenModeTypeHelper = record helper for TFBOpenModeType
    function ToString: string;
  end;

  TFBCharacterSetTypeHelper = record helper for TFBCharacterSetType
    function ToString: string;
  end;

  //MySQL
  TMySQLConfigurationParameter = (Database, UserName, Password, Server, Port,
                                  VendorLib, Pooled, PoolMaxItems,
                                  PoolExpireTimeout, PoolCleanupTimeout);


  TMySQLConfiguration = record
    DriverID: string;
    Database: string;
    UserName: string;
    Password: string;
    Server: string;
    Port: Integer;
    VendorLib : string;
    Pooled: Boolean;
    PoolMaxItems: Integer;
    PoolExpireTimeout: Integer;
    PoolCleanupTimeout: Integer;

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
  Result.UserName := '';
  Result.Password := '';
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

