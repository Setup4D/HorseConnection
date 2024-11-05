program SampleHorseConnectionADS;

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

  System.SysUtils,
  System.JSON;

begin
  ReportMemoryLeaksOnShutdown := True;

{  // Modifica apenas os parâmetros necessários usando ApplyDatabaseConfig
  ApplyDatabaseConfigPG(TDatabaseConfigParam.CharacterSet, 'custom_CharacterSet');
  ApplyDatabaseConfigADS(TDatabaseConfigParam.UserName, 'custom_UserName');
  ApplyDatabaseConfigADS(TDatabaseConfigParam.Password, 'custom_Password');
  ApplyDatabaseConfigADS(TDatabaseConfigParam.Database, 'custom_database');
  ApplyDatabaseConfigADS(TDatabaseConfigParam.ShowDelete, 'custom_ShowDelete_Boolean');
  ApplyDatabaseConfigADS(TDatabaseConfigParam.Pooled, 'custom_Pooled_Boolean');
  ApplyDatabaseConfigADS(TDatabaseConfigParam.PoolMaxItems, 'custom_PoolMaxItems_Integer');
  ApplyDatabaseConfigADS(TDatabaseConfigParam.PoolExpireTimeout, 'custom_PoolExpireTimeout_Integer');
  ApplyDatabaseConfigADS(TDatabaseConfigParam.PoolCleanupTimeout, 'custom_PoolCleanupTimeout_Integer');
  ApplyDatabaseConfigADS(TDatabaseConfigParam.Server, 'custom_ServerTypes');
  ApplyDatabaseConfigADS(TDatabaseConfigParam.Protocol, 'custom_Protocol');
  ApplyDatabaseConfigADS(TDatabaseConfigParam.TableType, 'custom_TableType');
  ApplyDatabaseConfigADS(TDatabaseConfigParam.Locking, 'custom_Locking');
  ApplyDatabaseConfigADS(TDatabaseConfigParam.VendorLib, 'custom_VendorLib'); }


  // Configura o Horse e adiciona o middleware de conexão
  THorse
    .Use(Compression())
    .Use(Jhonson)
    .Use(HandleException)
    .Use(HorseConnectionADS);

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
        // ao definir `ConnectionPrefixADS` e o banco em `DatabaseADS`.
        ConnectionPrefixADS := EmptyStr; // Define o prefixo do pool de conexão, se especificado.
        DatabaseADS := EmptyStr;         // Define um banco de dados alternativo, se especificado.

        FDQuery.Connection := GetConnection(TConnectionType.ADS);  // Obtém a conexão única do middleware
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

