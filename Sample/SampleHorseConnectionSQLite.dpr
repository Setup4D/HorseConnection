program SampleHorseConnectionSQLite;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  Horse.HandleException,
  Horse.Compression,

  Horse.Connection,

  Data.DB,
  FireDAC.Stan.Param,
  FireDAC.Comp.Client,

  System.DateUtils,
  System.SysUtils,
  System.JSON, FireDAC.Stan.Option;


begin
  ReportMemoryLeaksOnShutdown := True;

  // Modifica apenas os parâmetros necessários usando ApplyDatabaseConfig
{  ApplyDatabaseConfigSQLite(TDatabaseConfigParam.Database, 'custom_database');
  ApplyDatabaseConfigSQLite(TDatabaseConfigParam.UserName, 'custom_user');
  ApplyDatabaseConfigSQLite(TDatabaseConfigParam.Password, 'custom_password');
  ApplyDatabaseConfigSQLite(TDatabaseConfigParam.Locking, 'custom_locking_mode'); //Pode utilizar o DBConfigTypes, com o tipo TSQLiteLockingModeType para selecionar as opções compativel.
  ApplyDatabaseConfigSQLite(TDatabaseConfigParam.OpenMode, 'custom_open_mode'); //Pode utilizar o DBConfigTypes, com o tipo TSQLiteOpenModeType para selecionar as opções compativel.
  ApplyDatabaseConfigSQLite(TDatabaseConfigParam.Encrypt, 'custom_encrypt'); //Pode utilizar o DBConfigTypes, com o tipo TSQLiteEncryptType para selecionar as opções compativel.
  ApplyDatabaseConfigSQLite(TDatabaseConfigParam.Pooled, 'custom_Pooled_Boolean');
  ApplyDatabaseConfigSQLite(TDatabaseConfigParam.PoolMaxItems, 'custom_PoolMaxItems_Integer');
  ApplyDatabaseConfigSQLite(TDatabaseConfigParam.PoolExpireTimeout, 'custom_PoolExpireTimeout_Integer');
  ApplyDatabaseConfigSQLite(TDatabaseConfigParam.PoolCleanupTimeout, 'custom_PoolCleanupTimeout_Integer');}

  // Configura o Horse e adiciona o middleware de conexão
  THorse
    .Use(Compression())
    .Use(Jhonson)
    .Use(HandleException)
    .Use(HorseConnectionSQLite);

  // Exemplo de rota que utiliza a conexão FireDAC do middleware
  THorse.Get('/produtos',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      FDQuery: TFDQuery;
      Produtos: TJSONArray;
      Produto: TJSONObject;
    begin
      FDQuery := TFDQuery.Create(nil);
      try
        // Permite criar um pool de conexão específico para um banco de dados
        // ao definir `ConnectionPrefixSQLite` e o banco em `DatabaseSQLite`.
        ConnectionPrefixSQLite := EmptyStr; // Define o prefixo do pool de conexão, se especificado.
        DatabaseSQLite := EmptyStr;         // Define um banco de dados alternativo, se especificado.

        FDQuery.Connection := GetConnection(TConnectionType.SQLite);  // Obtém a conexão única do middleware
        FDQuery.SQL.Text := 'SELECT * FROM produtos';
        FDQuery.Open;

        Produtos := TJSONArray.Create;
        while not FDQuery.Eof do
        begin
          Produto := TJSONObject.Create;
          Produto.AddPair('id', FDQuery.FieldByName('id').AsString);
          Produto.AddPair('nome', FDQuery.FieldByName('nome').AsString);
          Produto.AddPair('preco', FDQuery.FieldByName('preco').AsString);
          Produtos.AddElement(Produto);

          FDQuery.Next;
        end;

        Res.Send<TJSONArray>(Produtos);
      finally
        FDQuery.Free;
      end;
    end
  );

  THorse.Listen(9000);
end.

