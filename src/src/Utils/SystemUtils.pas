unit SystemUtils;

interface

procedure RaiseInvalidTypeException(const AFieldName, AExpectedType: string);
function GetAbsolutePath(const ARelativePath: string): string;

implementation

uses
  System.IOUtils,
  System.SysUtils;

procedure RaiseInvalidTypeException(const AFieldName, AExpectedType: string);
begin
  raise Exception.CreateFmt({$IFDEF PORTUGUES}
                              'Tipo incorreto para o campo %s. Esperado: %s.',
                            {$ELSE}
                              {$IFDEF ESPANHOL}
                                'Tipo incorrecto para el campo %s. Esperado: %s.',
                              {$ELSE}
                                'Incorrect type for field %s. Expected: %s.',
                              {$ENDIF}
                            {$ENDIF}
                            [AFieldName, AExpectedType]);
end;

function GetAbsolutePath(const ARelativePath: string): string;
begin
  Result := ARelativePath;
  if Result.StartsWith('.\') then
    Result := TPath.Combine(ExtractFilePath(ParamStr(0)), Result.Substring(2));
end;
end.
