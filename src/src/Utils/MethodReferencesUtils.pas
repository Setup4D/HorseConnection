unit MethodReferencesUtils;

interface

uses
  EnumsHelpersUtils,
  FireDAC.Comp.Client,
  System.Rtti;
type
  TFunctionConnection = reference to function: TFDConnection;
  TPGDatabaseConfigurator = reference to procedure(var AConfiguration: TPGConfiguration; const AValue: TValue);
  TADSDatabaseConfigurator = reference to procedure(var AConfiguration: TADSConfiguration; const AValue: TValue);
  TSQLiteDatabaseConfigurator = reference to procedure(var AConfiguration: TSQLiteConfiguration; const AValue: TValue);
  TFBDatabaseConfigurator = reference to procedure(var AConfiguration: TFBConfiguration; const AValue: TValue);
  TMySQLDatabaseConfigurator = reference to procedure(var AConfiguration: TMySQLConfiguration; const AValue: TValue);
implementation

end.
