unit Horse.Connection;

interface

uses
  Horse,
  FireDAC.Comp.Client,
  EnumsHelpersUtils;
type
  {$SCOPEDENUMS ON}
  TConnectionType = EnumsHelpersUtils.TConnectionType;
  {$SCOPEDENUMS OFF}

function GetConnection(AValue: TConnectionType): TFDConnection;

implementation

uses
  Horse.Connection.PG,
  Horse.Connection.FB,
  Horse.Connection.ADS,
  Horse.Connection.MySQL,
  Horse.Connection.SQLite,

  System.SysUtils;

function GetConnection(AValue: TConnectionType): TFDConnection;
begin
  case AValue of
    TConnectionType.ADS: Result := ADSConnection;
    TConnectionType.FB: Result := FBConnection;
    TConnectionType.MySQL : Result := MySQLConnection;
    TConnectionType.PG: Result := PGConnection;
    TConnectionType.SQLite: Result := SQLiteConnection;
  else
    raise Exception.Create({$IFDEF PORTUGUES}
                             'Tipo de conexão não suportado ou não especificado.'
                           {$ELSE}
                             {$IFDEF ESPANHOL}
                               'Tipo de conexión no admitido o no especificado.'
                             {$ELSE}
                               'Connection type not supported or not specified.'
                             {$ENDIF}
                           {$ENDIF});
  end;
end;

end.

