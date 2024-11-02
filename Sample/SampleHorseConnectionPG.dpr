program SampleHorseConnectionPG;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  Horse.Compression,

  Horse.Connection,
  FireDAC.Comp.Client,

  System.SysUtils,
  System.JSON;

begin
  ReportMemoryLeaksOnShutdown := True;

  // Modifica apenas os parâmetros necessários usando ApplyDatabaseConfig
  {ApplyDatabaseConfigPG(TDatabaseConfigParam.Server, 'custom_localhost');
  ApplyDatabaseConfigPG(TDatabaseConfigParam.Port, 'custom_port');
  ApplyDatabaseConfigPG(TDatabaseConfigParam.Database, 'custom_database');
  ApplyDatabaseConfigPG(TDatabaseConfigParam.UserName, 'custom_user');
  ApplyDatabaseConfigPG(TDatabaseConfigParam.Password, 'custom_password');
  ApplyDatabaseConfigPG(TDatabaseConfigParam.CharacterSet, 'custom_CharacterSet');
  ApplyDatabaseConfigPG(TDatabaseConfigParam.Pooled, 'custom_Pooled_Boolean');
  ApplyDatabaseConfigPG(TDatabaseConfigParam.PoolMaxItems, 'custom_PoolMaxItems_Integer');
  ApplyDatabaseConfigPG(TDatabaseConfigParam.PoolExpireTimeout, 'custom_PoolExpireTimeout_Integer');
  ApplyDatabaseConfigPG(TDatabaseConfigParam.PoolCleanupTimeout, 'custom_PoolCleanupTimeout_Integer'); }


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
        ConnectionPrefixPG := EmptyStr; // Define o prefixo do pool de conexão, se especificado.
        DatabasePG := EmptyStr;         // Define um banco de dados alternativo, se especificado.

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

