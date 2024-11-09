program SampleHorseConnectionFB;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  Horse.HandleException,
  Horse.Compression,

  Horse.Connection,
  Horse.Connection.FB,

  FireDAC.Comp.Client,

  System.SysUtils,
  System.JSON;

begin
  ReportMemoryLeaksOnShutdown := True;

{  // Modifica apenas os parâmetros necessários usando ApplyDatabaseConfig
  ApplyDatabaseConfiguration(TFBConfigurationParameter.Database, 'custom_database');
  ApplyDatabaseConfiguration(TFBConfigurationParameter.UserName, 'custom_user');
  ApplyDatabaseConfiguration(TFBConfigurationParameter.Password, 'custom_password');
  ApplyDatabaseConfiguration(TFBConfigurationParameter.Protocol, 'custom_protocol');
  ApplyDatabaseConfiguration(TFBConfigurationParameter.Server, 'custom_localhost');
  ApplyDatabaseConfiguration(TFBConfigurationParameter.Port, 'custom_port');
  ApplyDatabaseConfiguration(TFBConfigurationParameter.CharacterSet, 'custom_CharacterSet');
  ApplyDatabaseConfiguration(TFBConfigurationParameter.OpenMode, 'custom_OpenMode');
  ApplyDatabaseConfiguration(TFBConfigurationParameter.Pooled, 'custom_Pooled_Boolean');
  ApplyDatabaseConfiguration(TFBConfigurationParameter.PoolMaxItems, 'custom_PoolMaxItems_Integer');
  ApplyDatabaseConfiguration(TFBConfigurationParameter.PoolExpireTimeout, 'custom_PoolExpireTimeout_Integer');
  ApplyDatabaseConfiguration(TFBConfigurationParameter.PoolCleanupTimeout, 'custom_PoolCleanupTimeout_Integer');}


  // Configura o Horse e adiciona o middleware de conexão
  THorse
    .Use(Compression())
    .Use(Jhonson)
    .Use(HandleException)
    .Use(HorseConnectionFB);

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

        FDQuery.Connection := GetConnection(TConnectionType.FB);  // Obtém a conexão única do middleware

        FDQuery.SQL.Clear;
        FDQuery.SQL.Text := 'SELECT * FROM PRODUTOS';
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

