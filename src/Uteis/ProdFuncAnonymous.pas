unit ProdFuncAnonymous;

interface

uses
  DBConfigTypes,
  FireDAC.Comp.Client;

type
  TConnectionFunc = reference to function: TFDConnection;
  TDatabaseConfigStringSetter = reference to procedure(var Config: TDatabaseConfig; const Value: string);
  TDatabaseConfigIntegerSetter = reference to procedure(var Config: TDatabaseConfig; const Value: Integer);
  TDatabaseConfigBooleanSetter = reference to procedure(var Config: TDatabaseConfig; const Value: Boolean);

implementation

end.
