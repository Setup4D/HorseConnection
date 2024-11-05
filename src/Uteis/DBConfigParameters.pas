unit DBConfigParameters;

interface

uses
  ProdFuncAnonymous,
  DBConfigTypes,

  System.SysUtils,
  System.Generics.Collections;

procedure DatabaseConfig(var Config: TDatabaseConfig; AParam: TDatabaseConfigParam; const AValue: string); overload;
procedure DatabaseConfig(var Config: TDatabaseConfig; AParam: TDatabaseConfigParam; const AValue: Integer); overload;
procedure DatabaseConfig(var Config: TDatabaseConfig; AParam: TDatabaseConfigParam; const AValue: Boolean); overload;

implementation

var
  FStringSetters: TDictionary<TDatabaseConfigParam, TDatabaseConfigStringSetter>;
  FIntegerSetters: TDictionary<TDatabaseConfigParam, TDatabaseConfigIntegerSetter>;
  FBooleanSetters: TDictionary<TDatabaseConfigParam, TDatabaseConfigBooleanSetter>;

procedure SetServer(var Config: TDatabaseConfig; const AValue: string);
begin
  Config.Server := AValue;
end;

procedure SetPort(var Config: TDatabaseConfig; const AValue: string);
begin
  Config.Port := AValue;
end;

procedure SetDatabase(var Config: TDatabaseConfig; const AValue: string);
begin
  Config.Database := AValue;
end;

procedure SetUserName(var Config: TDatabaseConfig; const AValue: string);
begin
  Config.UserName := AValue;
end;

procedure SetPassword(var Config: TDatabaseConfig; const AValue: string);
begin
  Config.Password := AValue;
end;

procedure SetCharacterSet(var Config: TDatabaseConfig; const AValue: string);
begin
  Config.CharacterSet := AValue;
end;

procedure SetPooled(var Config: TDatabaseConfig; const AValue: Boolean);
begin
  Config.Pooled := AValue;
end;

procedure SetPoolMaxItems(var Config: TDatabaseConfig; const AValue: Integer);
begin
  Config.PoolMaxItems := AValue;
end;

procedure SetPoolExpireTimeout(var Config: TDatabaseConfig; const AValue: Integer);
begin
  Config.PoolExpireTimeout := AValue;
end;

procedure SetPoolCleanupTimeout(var Config: TDatabaseConfig; const AValue: Integer);
begin
  Config.PoolCleanupTimeout := AValue;
end;

procedure SetShowDelete(var Config: TDatabaseConfig; const AValue: Boolean);
begin
  Config.ShowDelete := AValue;
end;

procedure SetVendorLib(var Config: TDatabaseConfig; const AValue: string);
begin
  Config.VendorLib := AValue;
end;

procedure SetProtocol(var Config: TDatabaseConfig; const AValue: string);
begin
  Config.Protocol := AValue;
end;

procedure SetTableType(var Config: TDatabaseConfig; const AValue: string);
begin
  Config.TableType := AValue;
end;

procedure SetLocking(var Config: TDatabaseConfig; const AValue: string);
begin
  Config.Locking := AValue;
end;

procedure SetOpenMode(var Config: TDatabaseConfig; const AValue: string);
begin
  Config.OpenMode := AValue;
end;

procedure SetEncrypt(var Config: TDatabaseConfig; const AValue: string);
begin
  Config.Encrypt := AValue;
end;

procedure SetPasswordAuxiliary(var Config: TDatabaseConfig; const AValue: string);
begin
  Config.PasswordAuxiliary := AValue;
end;

procedure InitializeStringSetters;
begin
  FStringSetters := TDictionary<TDatabaseConfigParam, TDatabaseConfigStringSetter>.Create;

  FStringSetters.Add(TDatabaseConfigParam.Server, SetServer);
  FStringSetters.Add(TDatabaseConfigParam.Port, SetPort);
  FStringSetters.Add(TDatabaseConfigParam.Database, SetDatabase);
  FStringSetters.Add(TDatabaseConfigParam.UserName, SetUserName);
  FStringSetters.Add(TDatabaseConfigParam.Password, SetPassword);
  FStringSetters.Add(TDatabaseConfigParam.CharacterSet, SetCharacterSet);
  FStringSetters.Add(TDatabaseConfigParam.VendorLib, SetVendorLib);
  FStringSetters.Add(TDatabaseConfigParam.Protocol, SetProtocol);
  FStringSetters.Add(TDatabaseConfigParam.TableType, SetTableType);
  FStringSetters.Add(TDatabaseConfigParam.Locking, SetLocking);
  FStringSetters.Add(TDatabaseConfigParam.OpenMode, SetOpenMode);
  FStringSetters.Add(TDatabaseConfigParam.Encrypt, SetEncrypt);
  FStringSetters.Add(TDatabaseConfigParam.PasswordAuxiliary, SetPasswordAuxiliary);

end;

procedure InitializeBooleanSetters;
begin
  FBooleanSetters := TDictionary<TDatabaseConfigParam, TDatabaseConfigBooleanSetter>.Create;

  FBooleanSetters.Add(TDatabaseConfigParam.Pooled, SetPooled);
  FBooleanSetters.Add(TDatabaseConfigParam.ShowDelete, SetShowDelete);
end;

procedure InitializeIntegerSetters;
begin
  FIntegerSetters := TDictionary<TDatabaseConfigParam, TDatabaseConfigIntegerSetter>.Create;

  FIntegerSetters.Add(TDatabaseConfigParam.PoolMaxItems, SetPoolMaxItems);
  FIntegerSetters.Add(TDatabaseConfigParam.PoolExpireTimeout, SetPoolExpireTimeout);
  FIntegerSetters.Add(TDatabaseConfigParam.PoolCleanupTimeout, SetPoolCleanupTimeout);
end;

procedure InitializeSetters;
begin
  InitializeStringSetters;
  InitializeBooleanSetters;
  InitializeIntegerSetters;
end;

procedure FinalizeSetters;
begin
  FStringSetters.DisposeOf;
  FIntegerSetters.DisposeOf;
  FBooleanSetters.DisposeOf;
end;

procedure DatabaseConfig(var Config: TDatabaseConfig; AParam: TDatabaseConfigParam; const AValue: string); overload;
begin
  if FStringSetters.ContainsKey(AParam) then
    FStringSetters[AParam](Config, AValue)
  else
    raise Exception.Create({$IFDEF PORTUGUES}
                              'Parâmetro de configuração string desconhecido.'
                           {$ELSEIFDEF ESPANHOL}
                              'Parámetro de configuración de cadena desconocido.'
                           {$ELSE}
                              'Unknown string configuration parameter.'
                           {$ENDIF});
end;

procedure DatabaseConfig(var Config: TDatabaseConfig; AParam: TDatabaseConfigParam; const AValue: Integer); overload;
begin
  if FIntegerSetters.ContainsKey(AParam) then
    FIntegerSetters[AParam](Config, AValue)
  else
    raise Exception.Create({$IFDEF PORTUGUES}
                              'Parâmetro de configuração integer desconhecido.'
                           {$ELSEIFDEF ESPANHOL}
                              'Parámetro de configuración entero desconocido.'
                           {$ELSE}
                              'Unknown integer configuration parameter.'
                           {$ENDIF});
end;

procedure DatabaseConfig(var Config: TDatabaseConfig; AParam: TDatabaseConfigParam; const AValue: Boolean); overload;
begin
  if FBooleanSetters.ContainsKey(AParam) then
    FBooleanSetters[AParam](Config, AValue)
  else
    raise Exception.Create({$IFDEF PORTUGUES}
                              'Parâmetro de configuração boolean desconhecido.'
                           {$ELSEIFDEF ESPANHOL}
                              'Parámetro de configuración booleano desconocido.'
                           {$ELSE}
                              'Unknown boolean configuration parameter.'
                           {$ENDIF});
end;

initialization
  InitializeSetters;

finalization
  FinalizeSetters;

end.
