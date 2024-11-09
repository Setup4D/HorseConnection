program SampleHorseConnectionSQLite;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  Horse.HandleException,
  Horse.Compression,

  Horse.Connection,
  Horse.Connection.SQLite,

  Data.DB,
  FireDAC.Stan.Param,
  FireDAC.Comp.Client,

  System.DateUtils,
  System.SysUtils,
  System.JSON, FireDAC.Stan.Option;


begin
  ReportMemoryLeaksOnShutdown := True;

  // Modifica apenas os parâmetros necessários usando ApplyDatabaseConfig
{  ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.Database, 'custom_database');
  ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.UserName, 'custom_user');
  ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.Password, 'custom_password');
  ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.Locking, 'custom_locking_mode');
  ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.OpenMode, 'custom_open_mode');
  ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.Encrypt, 'custom_encrypt');
  ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.Pooled, 'custom_Pooled_Boolean');
  ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.PoolMaxItems, 'custom_PoolMaxItems_Integer');
  ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.PoolExpireTimeout, 'custom_PoolExpireTimeout_Integer');
  ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.PoolCleanupTimeout, 'custom_PoolCleanupTimeout_Integer');}

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
        SetConnectionPrefix(EmptyStr); // Define o prefixo do pool de conexão, se especificado.
        SetDatabase(EmptyStr);         // Define um banco de dados alternativo, se especificado.

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

