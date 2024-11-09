program SampleHorseConnectionPG;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  Horse.HandleException,
  Horse.Compression,

  Horse.Connection,
  Horse.Connection.PG,

  FireDAC.Comp.Client,

  System.SysUtils,
  System.JSON;

begin
  ReportMemoryLeaksOnShutdown := True;

  // Modifica apenas os parâmetros necessários usando ApplyDatabaseConfiguration
{  ApplyDatabaseConfiguration(TPGConfigurationParameter.Server, 'custom_localhost');
  ApplyDatabaseConfiguration(TPGConfigurationParameter.Port, 'custom_port');
  ApplyDatabaseConfiguration(TPGConfigurationParameter.Database, 'custom_database');
  ApplyDatabaseConfiguration(TPGConfigurationParameter.UserName, 'custom_user');
  ApplyDatabaseConfiguration(TPGConfigurationParameter.Password, 'custom_password');
  ApplyDatabaseConfiguration(TPGConfigurationParameter.CharacterSet, 'custom_CharacterSet');
  ApplyDatabaseConfiguration(TPGConfigurationParameter.Pooled, 'custom_Pooled_Boolean');
  ApplyDatabaseConfiguration(TPGConfigurationParameter.PoolMaxItems, 'custom_PoolMaxItems_Integer');
  ApplyDatabaseConfiguration(TPGConfigurationParameter.PoolExpireTimeout, 'custom_PoolExpireTimeout_Integer');
  ApplyDatabaseConfiguration(TPGConfigurationParameter.PoolCleanupTimeout, 'custom_PoolCleanupTimeout_Integer');}


  // Configura o Horse e adiciona o middleware de conexão
  THorse.Use(HorseConnectionPG);

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
        // ao definir `ConnectionPrefixPG` e o banco em `DatabasePG`.
        SetConnectionPrefix(EmptyStr); // Define o prefixo do pool de conexão, se especificado.
        SetDatabase(EmptyStr);         // Define um banco de dados alternativo, se especificado.

        FDQuery.Connection := GetConnection(TConnectionType.PG);  // Obtém a conexão única do middleware
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

  // Inicia o servidor na porta 9000
  THorse.Listen(9000);
end.

