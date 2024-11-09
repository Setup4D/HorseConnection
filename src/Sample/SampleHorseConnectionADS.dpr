program SampleHorseConnectionADS;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  Horse.HandleException,
  Horse.Compression,

  Horse.Connection,
  Horse.Connection.ADS,


  Data.DB,
  FireDAC.Stan.Param,
  FireDAC.Comp.Client,

  System.DateUtils,
  System.SysUtils,
  System.JSON, FireDAC.Stan.Option;

begin
  ReportMemoryLeaksOnShutdown := True;

{  // Modifica apenas os par�metros necess�rios usando ApplyDatabaseConfig
  ApplyDatabaseConfiguration(TADSConfigurationParameter.CharacterSet, 'custom_CharacterSet');
  ApplyDatabaseConfiguration(TADSConfigurationParameter.UserName, 'custom_UserName');
  ApplyDatabaseConfiguration(TADSConfigurationParameter.Password, 'custom_Password');
  ApplyDatabaseConfiguration(TADSConfigurationParameter.Database, 'custom_database');
  ApplyDatabaseConfiguration(TADSConfigurationParameter.ShowDelete, 'custom_ShowDelete_Boolean');
  ApplyDatabaseConfiguration(TADSConfigurationParameter.Pooled, 'custom_Pooled_Boolean');
  ApplyDatabaseConfiguration(TADSConfigurationParameter.PoolMaxItems, 'custom_PoolMaxItems_Integer');
  ApplyDatabaseConfiguration(TADSConfigurationParameter.PoolExpireTimeout, 'custom_PoolExpireTimeout_Integer');
  ApplyDatabaseConfiguration(TADSConfigurationParameter.PoolCleanupTimeout, 'custom_PoolCleanupTimeout_Integer');
  ApplyDatabaseConfiguration(TADSConfigurationParameter.Server, 'custom_ServerTypes');
  ApplyDatabaseConfiguration(TADSConfigurationParameter.Protocol, 'custom_Protocol');
  ApplyDatabaseConfiguration(TADSConfigurationParameter.TableType, 'custom_TableType');
  ApplyDatabaseConfiguration(TADSConfigurationParameter.Locking, 'custom_Locking');
  ApplyDatabaseConfiguration(TADSConfigurationParameter.VendorLib, 'custom_VendorLib'); }


  // Configura o Horse e adiciona o middleware de conex�o
  THorse
    .Use(Compression())
    .Use(Jhonson)
    .Use(HandleException)
    .Use(HorseConnectionADS);

  // Exemplo de rota que utiliza a conex�o FireDAC do middleware
  THorse.Get('/produtos',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      FDQuery: TFDQuery;
      Produtos: TJSONArray;
      Produto: TJSONObject;
    begin
      FDQuery := TFDQuery.Create(nil);
      try
        // Permite criar um pool de conex�o espec�fico para um banco de dados
        // ao definir `ConnectionPrefixADS` e o banco em `DatabaseADS`.
        SetConnectionPrefix(EmptyStr); // Define o prefixo do pool de conex�o, se especificado.
        SetDatabase(EmptyStr);         // Define um banco de dados alternativo, se especificado.

        FDQuery.Connection := GetConnection(TConnectionType.ADS);  // Obt�m a conex�o �nica do middleware
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

