# HorseConnection

Clique no idioma que deseja para ler este README: 🇺🇸 [Inglês](https://github.com/ricksolucoes/HorseConnection/blob/main/README.md), 🇧🇷 [Português](https://github.com/ricksolucoes/HorseConnection/blob/main/README_pt-BR.md), ou 🇪🇸 [Espanhol](https://github.com/ricksolucoes/HorseConnection/blob/main/README_ES.md).

> **Nota:** Você pode escolher o idioma em que prefere ler este README utilizando as bandeiras acima. Clique no link correspondente ao idioma desejado.

**HorseConnection** é um middleware para o framework **Horse** que facilita a conexão com bancos de dados em aplicações desenvolvidas em Delphi. Utilizando o **Boss** como gerenciador de pacotes, este projeto permite uma integração rápida e eficiente, simplificando a configuração de conexão.

HorseConnection facilita o uso de diferentes bancos de dados, fornecendo um middleware específico para cada tipo de banco, evitando a necessidade de reconfigurações manuais. Abaixo estão explicações específicas sobre as conexões de bancos disponíveis.

### Diferenças de Conexões

As diferenças entre as conexões no código ficam claras na forma como obtemos as conexões ou as queries, com a função **GetConnection(TConnectionType)** ou **GetQuery(TConnectionType)**. Com essas funções, é possível especificar para qual banco de dados estamos configurando a conexão, seja **ADS**, **Firebird**, **MySQL**, **PostgreSQL** ou **SQLite**. Isso garante maior flexibilidade e simplicidade ao lidar com diferentes bancos de dados dentro do mesmo projeto, utilizando o **Horse.Connection**.

### Utilização de Diretivas para Idiomas

No **HorseConnection**, é possível modificar o idioma das mensagens de configuração e retorno utilizando diretivas de compilação. Por padrão, o idioma utilizado é o **Inglês**. No entanto, se preferir, você pode definir a diretiva `PORTUGUES` ou `ESPANHOL` para que as mensagens sejam exibidas nesses respectivos idiomas.

Para utilizar um idioma diferente do padrão, adicione a diretiva desejada ao seu projeto, conforme o exemplo abaixo:
- Para Português:
```sh
 {$DEFINE PORTUGUES}
```
- Para Espanhol:
```sh
 {$DEFINE ESPANHOL}
```

Caso nenhuma diretiva seja definida, o idioma padrão será o Inglês.

## Sobre o Projeto

Este middleware foi desenvolvido para ser utilizado junto ao **Horse**, um framework HTTP REST para Delphi, permitindo a criação de APIs REST de maneira simples e intuitiva. Com o **HorseConnection**, é possível gerenciar conexões com diferentes bancos de dados sem a necessidade de configurar manualmente cada um deles em cada endpoint.

## Objetivo do Middleware

O objetivo do **HorseConnection** é encapsular a lógica de conexão com bancos de dados, promovendo uma gestão centralizada e reutilizável das conexões **FireDAC**, reduzindo código repetitivo e prevenindo vazamentos de conexões em aplicações que fazem uso intensivo de bancos de dados.

## Funcionalidades

- Facilita a conexão com bancos de dados em projetos Delphi.
- Integração simples com o framework Horse.
- Utiliza o Boss para gerenciar dependências e facilitar a instalação.

## Requisitos

- **Delphi** 10.2 ou superior.
- Boss como gerenciador de pacotes. Para obter mais informações sobre instalação e documentação do Boss, visite [este link](https://github.com/HashLoad/boss).
- **Horse** framework. Para instalar o Horse, você pode utilizar o Boss:
  ```sh
  boss install horse
  ```

## Instalação

Para instalar o **HorseConnection**, você pode utilizar o **Boss**, o gerenciador de pacotes para Delphi:

```sh
boss install https://github.com/ricksolucoes/HorseConnection
```

## Como Usar

### Configurando o Middleware

Para configurar o middleware específico para o banco de dados desejado, você deve importar as unidades necessárias e definir o middleware correspondente. Abaixo estão as configurações específicas para cada um dos bancos suportados:

- **PostgreSQL**: Utilizando o middleware `HorseConnectionPG`, permite gerenciar uma conexão com um banco de dados PostgreSQL.
- **Advantage Database Server (ADS)**: Utilize `HorseConnectionADS` para integrar uma conexão ao banco de dados ADS.
- **Firebird**: Com `HorseConnectionFB`, é possível conectar-se a bancos de dados Firebird.
- **MySQL**: Para conectar com o banco de dados MySQL, use `HorseConnectionMySQL`.
- **SQLite**: Utilize `HorseConnectionSQLite` para gerenciar conexões com um banco de dados SQLite.

```delphi
THorse
  .Use(Jhonson)
  .Use(HorseConnectionPG);

(* 
.Use(HorseConnectionADS)
.Use(HorseConnectionFB)
.Use(HorseConnectionMySQL)
.Use(HorseConnectionSQLite)
*)
```

### Configurando o Banco de Dados

Cada banco de dados possui parâmetros específicos que podem ser configurados para melhor atender às necessidades da sua aplicação. Abaixo estão os detalhes de configuração para cada banco de dados suportado.

#### Configurando ADS

Aqui está um exemplo de configuração para o banco de dados ADS usando a função `ApplyDatabaseConfiguration`:

```delphi
ApplyDatabaseConfiguration(TADSConfigurationParameter.UserName, 'admin');
ApplyDatabaseConfiguration(TADSConfigurationParameter.Password, 'password');
ApplyDatabaseConfiguration(TADSConfigurationParameter.Database, 'path/my_database');
ApplyDatabaseConfiguration(TADSConfigurationParameter.ShowDelete, True);
ApplyDatabaseConfiguration(TADSConfigurationParameter.Pooled, True);
ApplyDatabaseConfiguration(TADSConfigurationParameter.PoolMaxItems, 50);
ApplyDatabaseConfiguration(TADSConfigurationParameter.PoolExpireTimeout, 90000);
ApplyDatabaseConfiguration(TADSConfigurationParameter.PoolCleanupTimeout, 30000);
ApplyDatabaseConfiguration(TADSConfigurationParameter.CharacterSet, TADSCharacterSet.ANSI);
ApplyDatabaseConfiguration(TADSConfigurationParameter.ServerType, TADSServerType.Local);
ApplyDatabaseConfiguration(TADSConfigurationParameter.Protocol, TADSProtocol.TCPIP);
ApplyDatabaseConfiguration(TADSConfigurationParameter.TableType, TADSTableType.CDX);
ApplyDatabaseConfiguration(TADSConfigurationParameter.Locking, TADSLocking.Compatible);
ApplyDatabaseConfiguration(TADSConfigurationParameter.VendorLib, 'path/to/vendor/lib/ace32.dll');
```

- **UserName**: Nome de usuário para autenticação no banco de dados ADS.
- **Password**: Senha de acesso ao banco de dados ADS.
- **Database**: Caminho completo ou nome do banco de dados no servidor ADS.
- **ShowDelete**: Habilita a visualização de registros excluídos.
- **Pooled**: Define se a conexão será gerida como um pool de conexões.
- **PoolMaxItems**: Número máximo de conexões permitidas no pool.
- **PoolExpireTimeout**: Tempo em segundos para que uma conexão inativa expire.
- **PoolCleanupTimeout**: Tempo em segundos para a limpeza periódica das conexões expiradas no pool.
- **CharacterSet**: Define o conjunto de caracteres para a conexão, como "utf8" ou "ANSI".
- **ServerType**: Define o tipo de servidor onde o banco de dados ADS está hospedado.
- **Protocol**: Especifica o protocolo de comunicação usado para se conectar ao servidor ADS.
- **TableType**: Define o formato das tabelas usadas no banco de dados ADS.
- **Locking**: Define o tipo de bloqueio de dados utilizado no ADS.
- **VendorLib**: Caminho para a biblioteca (DLL) do fornecedor necessária para o FireDAC se comunicar com o ADS.

### Configurando Firebird

Aqui está um exemplo de configuração para o banco de dados Firebird usando a função `ApplyDatabaseConfiguration`:

```delphi
ApplyDatabaseConfiguration(TFBConfigurationParameter.Database, './db.fdb');
ApplyDatabaseConfiguration(TFBConfigurationParameter.UserName, 'SYSDBA');
ApplyDatabaseConfiguration(TFBConfigurationParameter.Password, 'masterkey');
ApplyDatabaseConfiguration(TFBConfigurationParameter.Protocol, TFBProtocolType.TCPIP);
ApplyDatabaseConfiguration(TFBConfigurationParameter.Server, 'localhost');
ApplyDatabaseConfiguration(TFBConfigurationParameter.Port, 3050);
ApplyDatabaseConfiguration(TFBConfigurationParameter.CharacterSet, TFBCharacterSetType.UTF8);
ApplyDatabaseConfiguration(TFBConfigurationParameter.OpenMode, TFBOpenModeType.OpenOrCreate);
ApplyDatabaseConfiguration(TFBConfigurationParameter.Pooled, True);
ApplyDatabaseConfiguration(TFBConfigurationParameter.PoolMaxItems, 50);
ApplyDatabaseConfiguration(TFBConfigurationParameter.PoolExpireTimeout, 90000);
ApplyDatabaseConfiguration(TFBConfigurationParameter.PoolCleanupTimeout, 30000);
```

- **UserName**: Nome de usuário para autenticação no banco de dados Firebird.
- **Password**: Senha de acesso ao banco de dados Firebird.
- **Database**: Caminho completo ou nome do banco de dados Firebird.
- **Protocol**: Protocolo de comunicação com o servidor Firebird.
- **Server**: Endereço do servidor onde o banco de dados Firebird está hospedado.
- **Port**: Porta de conexão para o servidor Firebird.
- **CharacterSet**: Define o conjunto de caracteres para a conexão.
- **OpenMode**: Define o modo de abertura do banco de dados.
- **Pooled**: Define se a conexão será gerida como um pool de conexões.
- **PoolMaxItems**: Número máximo de conexões permitidas no pool.
- **PoolExpireTimeout**: Tempo em segundos para que uma conexão inativa expire.
- **PoolCleanupTimeout**: Tempo em segundos para a limpeza periódica das conexões expiradas no pool.

### Configurando MySQL

Aqui está um exemplo de configuração para o banco de dados MySQL usando a função `ApplyDatabaseConfiguration`:

```delphi
ApplyDatabaseConfiguration(TMySQLConfigurationParameter.UserName, 'root');
ApplyDatabaseConfiguration(TMySQLConfigurationParameter.Password, 'password');
ApplyDatabaseConfiguration(TMySQLConfigurationParameter.Database, 'my_database');
ApplyDatabaseConfiguration(TMySQLConfigurationParameter.Server, 'localhost');
ApplyDatabaseConfiguration(TMySQLConfigurationParameter.Port, 3306);
ApplyDatabaseConfiguration(TMySQLConfigurationParameter.Pooled, True);
ApplyDatabaseConfiguration(TMySQLConfigurationParameter.PoolMaxItems, 50);
ApplyDatabaseConfiguration(TMySQLConfigurationParameter.PoolExpireTimeout, 90000);
ApplyDatabaseConfiguration(TMySQLConfigurationParameter.PoolCleanupTimeout, 30000);
```

- **UserName**: Nome de usuário para autenticação no banco de dados MySQL.
- **Password**: Senha de acesso ao banco de dados MySQL.
- **Database**: Nome do banco de dados MySQL.
- **Server**: Endereço do servidor MySQL.
- **Port**: Porta de conexão do MySQL.
- **Pooled**: Define se a conexão será gerida como um pool de conexões.
- **PoolMaxItems**: Número máximo de conexões permitidas no pool.
- **PoolExpireTimeout**: Tempo em segundos para que uma conexão inativa expire.
- **PoolCleanupTimeout**: Tempo em segundos para a limpeza periódica das conexões expiradas no pool.

### Configurando PostgreSQL

Aqui está um exemplo de configuração para o banco de dados PostgreSQL usando a função `ApplyDatabaseConfiguration`:

```delphi
ApplyDatabaseConfiguration(TPGConfigurationParameter.UserName, 'postgres');
ApplyDatabaseConfiguration(TPGConfigurationParameter.Password, 'password');
ApplyDatabaseConfiguration(TPGConfigurationParameter.Database, 'my_database');
ApplyDatabaseConfiguration(TPGConfigurationParameter.Server, 'localhost');
ApplyDatabaseConfiguration(TPGConfigurationParameter.Port, 5432);
ApplyDatabaseConfiguration(TPGConfigurationParameter.Pooled, True);
ApplyDatabaseConfiguration(TPGConfigurationParameter.PoolMaxItems, 50);
ApplyDatabaseConfiguration(TPGConfigurationParameter.PoolExpireTimeout, 90000);
ApplyDatabaseConfiguration(TPGConfigurationParameter.PoolCleanupTimeout, 30000);
```

- **UserName**: Nome de usuário para autenticação no banco de dados PostgreSQL.
- **Password**: Senha de acesso ao banco de dados PostgreSQL.
- **Database**: Nome do banco de dados PostgreSQL.
- **Server**: Endereço do servidor PostgreSQL.
- **Port**: Porta de conexão do PostgreSQL.
- **Pooled**: Define se a conexão será gerida como um pool de conexões.
- **PoolMaxItems**: Número máximo de conexões permitidas no pool.
- **PoolExpireTimeout**: Tempo em segundos para que uma conexão inativa expire.
- **PoolCleanupTimeout**: Tempo em segundos para a limpeza periódica das conexões expiradas no pool.

### Configurando SQLite

Aqui está um exemplo de configuração para o banco de dados SQLite usando a função `ApplyDatabaseConfiguration`:

```delphi
ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.Database, './my_database.sqlite');
ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.Pooled, True);
ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.PoolMaxItems, 50);
ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.PoolExpireTimeout, 90000);
ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.PoolCleanupTimeout, 30000);
```

- **Database**: Caminho do arquivo do banco de dados SQLite.
- **Pooled**: Define se a conexão será gerida como um pool de conexões.
- **PoolMaxItems**: Número máximo de conexões permitidas no pool.
- **PoolExpireTimeout**: Tempo em segundos para que uma conexão inativa expire.
- **PoolCleanupTimeout**: Tempo em segundos para a limpeza periódica das conexões expiradas no pool.

## Configurar o Banco de Dados

O método `SetConnectionPrefix` é utilizado para definir um prefixo específico para o pool de conexão, caso seja necessário. Isso é útil quando trabalhamos com múltiplos bancos de dados e queremos evitar conflitos entre conexões, garantindo que cada conjunto de conexões seja identificado de forma única.

```delphi
SetConnectionPrefix(EmptyStr);
```

O método `SetDatabase` é utilizado para definir o caminho ou nome do banco de dados, se necessário. Deve ser informado quando o banco de dados específico precisar ser configurado. Isso é útil quando trabalhamos com múltiplos bancos de dados e queremos evitar conflitos, garantindo acesso ao banco correto.

```delphi
SetDatabase(EmptyStr);
```

## Obtendo a Conexão

Este exemplo demonstra como obter a conexão com o banco de dados configurado pelo middleware utilizando o enumerado `TConnectionType` para especificar qual tipo de conexão será utilizada. O enumerado `TConnectionType` permite definir o tipo de banco de dados, como **ADS**, **FB**, **MySQL**, **PG**, ou **SQLite**, garantindo que a conexão seja feita corretamente de acordo com o banco selecionado. O exemplo abaixo mostra como obter a conexão usando `GetConnection(TConnectionType.PG)`, onde `PG` representa a escolha do banco PostgreSQL. Essa abordagem facilita a integração e manutenção de diferentes tipos de bancos de dados no projeto.

```delphi
THorse.Get('/produtos',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    FDQuery: TFDQuery;
    Produtos: TJSONArray;
    Produto: TJSONObject;
  begin
    FDQuery := TFDQuery.Create(nil);
    try
      SetConnectionPrefix(EmptyStr);
      SetDatabase(EmptyStr);

      FDQuery.Connection := GetConnection(TConnectionType.PG);
      
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
      FDQuery.Close;
      FDQuery.Free;
    end;
  end
);
```

## Obtendo a Query

Este exemplo demonstra como obter a Query diretamente utilizando o middleware configurado. Utiliza-se o enumerado `TConnectionType` para especificar o banco de dados desejado, como **ADS**, **FB**, **MySQL**, **PG**, ou **SQLite**, facilitando a manutenção e integração de diferentes bancos no projeto. A função `GetQuery` é utilizada para obter a instância do `TFDQuery` já configurada com a conexão apropriada, de acordo com o banco de dados selecionado no `TConnectionType`. Isso garante que a query seja conectada corretamente ao banco especificado, simplificando a implementação e manutenção do projeto.

```delphi
THorse.Get('/produto',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    FDQuery: TFDQuery;
    Produtos: TJSONArray;
    Produto: TJSONObject;
  begin
    SetConnectionPrefix(EmptyStr);
    SetDatabase(EmptyStr);

    FDQuery := GetQuery(TConnectionType.PG);
    try
      FDQuery.SQL.Text := 'SELECT * FROM produtos WHERE id = :id';
      FDQuery.ParamByName('id').AsString := Req.Params['id'];
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
      FDQuery.Close;
      FDQuery.Free;
    end;
  end
);
```

## Explicação do Código Fonte

### 🗂️ Unit Horse.Connection

A **unit Horse.Connection** fornece funções para gerenciar conexões com bancos de dados utilizando **FireDAC** no middleware **Horse**. O **HorseConnection** permite a liberação de conexões FireDAC ou instâncias de TFDQuery, centralizando a lógica de conexão e facilitando o gerenciamento eficiente das conexões dentro das rotas do middleware.

#### Funções e Procedimentos

- **GetConnection(AValue: TConnectionType): TFDConnection;**
  - **Descrição:** Obtém uma conexão FireDAC com base no tipo de conexão especificado.
  - **Parâmetros:**
    - `AValue`: O tipo de conexão desejado, definido pelo enumerado `TConnectionType`. As opções incluem:
      - `TConnectionType.ADS`: Conexão com banco de dados ADS.
      - `TConnectionType.FB`: Conexão com banco de dados Firebird.
      - `TConnectionType.MySQL`: Conexão com banco de dados MySQL.
      - `TConnectionType.PG`: Conexão com banco de dados PostgreSQL.
      - `TConnectionType.SQLite`: Conexão com banco de dados SQLite.
  - **Retorno:** Retorna uma instância de `TFDConnection` configurada de acordo com o tipo de conexão especificado.
  - **Exceção:** Lança uma exceção se o tipo de conexão não for suportado ou não especificado.

- **GetQuery(AValue: TConnectionType): TFDQuery;**
  - **Descrição:** Cria e retorna uma instância de TFDQuery associada ao tipo de conexão especificado.
  - **Parâmetros:**
    - `AValue`: O tipo de conexão desejado, definido pelo enumerado `TConnectionType`. As opções incluem:
      - `TConnectionType.ADS`: Conexão com banco de dados ADS.
      - `TConnectionType.FB`: Conexão com banco de dados Firebird.
      - `TConnectionType.MySQL`: Conexão com banco de dados MySQL.
      - `TConnectionType.PG`: Conexão com banco de dados PostgreSQL.
      - `TConnectionType.SQLite`: Conexão com banco de dados SQLite.
  - **Retorno:** Retorna uma instância de `TFDQuery` associada à conexão especificada.
  - **Exceção:** Lança uma exceção se o tipo de conexão não for suportado ou não especificado.

#### Middleware 

O middleware **HorseConnection** tem como objetivo encapsular a lógica de conexão com bancos de dados, promovendo uma gestão centralizada e reutilizável das conexões FireDAC, reduzindo código repetitivo e prevenindo vazamentos de conexões em aplicações que fazem uso intensivo de bancos de dados.


### 🗂️ Unit EnumsHelpersUtils

A **unit EnumsHelpersUtils** define tipos enumerados e configurações de conexão para diferentes bancos de dados (PostgreSQL, ADS, SQLite, Firebird, MySQL) e fornece funções auxiliares para manipulação desses tipos. 

#### Tipos Enumerados e Estruturas de Configuração

- **TConnectionType**
  - Define os tipos de conexão suportados pelo sistema:
    - `ADS`
    - `FB`
    - `MySQL`
    - `PG`
    - `SQLite`

- **TPGConfiguration**
  - Estrutura de configuração para o banco de dados PostgreSQL com valores como `Server`, `Port`, `Database`, `UserName`, entre outros.
  - **Função `Default`**: Retorna uma configuração padrão para PostgreSQL.

- **TADSConfiguration**
  - Estrutura de configuração para o banco de dados ADS com valores como `ServerType`, `Protocol`, `TableType`, `Locking`, entre outros.
  - **Função `Default`**: Retorna uma configuração padrão para ADS.

- **TSQLiteConfiguration**
  - Estrutura de configuração para o banco de dados SQLite com valores como `LockingMode`, `OpenMode`, `Encrypt`, entre outros.
  - **Função `Default`**: Retorna uma configuração padrão para SQLite.

- **TFBConfiguration**
  - Estrutura de configuração para o banco de dados Firebird com valores como `Protocol`, `CharacterSet`, `OpenMode`, entre outros.
  - **Função `Default`**: Retorna uma configuração padrão para Firebird.

- **TMySQLConfiguration**
  - Estrutura de configuração para o banco de dados MySQL com valores como `Server`, `VendorLib`, `Pooled`, entre outros.
  - **Função `Default`**: Retorna uma configuração padrão para MySQL.

#### Funções Auxiliares

- **ToString**
  - Disponível para cada tipo enumerado, como `TConnectionType`, `TADSServerType`, `TADSCharacterSet`, `TADSProtocol`, entre outros.
  - **Descrição**: Converte o valor do tipo enumerado em uma string representativa.
  
#### Exemplo de Uso

```delphi
var
  Config: TPGConfiguration;
begin
  Config := TPGConfiguration.Default;
end;
```

### 🗂️ Unit SystemUtils

A **unit SystemUtils** fornece utilitários para operações de sistema, incluindo manipulação de caminhos e lançamento de exceções de tipo inválido.

#### Funções e Procedimentos

- **RaiseInvalidTypeException**
  - **Descrição**: Lança uma exceção indicando que um campo possui um tipo incorreto.
  - **Parâmetros**:
    - `AFieldName` (string): Nome do campo que possui o tipo incorreto.
    - `AExpectedType` (string): Tipo esperado para o campo.
  - **Exceção**: Lança uma exceção formatada que ajuda a identificar erros de tipo em tempo de execução.

  - **Exemplo de Uso**:
    ```delphi
    RaiseInvalidTypeException('NomeCampo', 'Integer');
    ```

- **GetAbsolutePath**
  - **Descrição**: Obtém o caminho absoluto com base em um caminho relativo fornecido.
  - **Parâmetros**:
    - `ARelativePath` (string): Caminho relativo a ser convertido para absoluto.
  - **Retorno**: Retorna o caminho absoluto correspondente ao caminho relativo fornecido.
  - **Observação**: Se o caminho relativo começar com ".\", ele será combinado com o diretório do aplicativo para obter o caminho absoluto; caso contrário, retorna o próprio caminho fornecido.

  - **Exemplo de Uso**:
    ```delphi
    var
      CaminhoAbsoluto: string;
    begin
      CaminhoAbsoluto := GetAbsolutePath('.\diretorio\arquivo.txt');
    end;
    ```

### ⚠️ Exceções
- A unit utiliza exceções para sinalizar tipos de dados incorretos em `RaiseInvalidTypeException`, permitindo uma validação mais rigorosa dos tipos de campo durante a execução.

Essa unit é útil para operações de manipulação de caminhos e validação de tipos de campo, centralizando utilidades comuns para operações de sistema.


### 🗂️ Unit MethodReferencesUtils

A **unit MethodReferencesUtils** define tipos de referência a métodos (procedimentos e funções) para configurações e conexões de banco de dados.

#### Tipos

- **TFunctionConnection**
  - **Descrição**: Referência para uma função que retorna uma conexão FireDAC.
  - **Retorno**: Um objeto `TFDConnection` representando a conexão.
  - **Uso**: Facilita a criação de referências de função para obter uma conexão FireDAC, permitindo que outras unidades ou métodos executem a função de conexão de forma genérica e reutilizável.

  - **Exemplo de Uso**:
    ```delphi
    var
      GetConnection: TFunctionConnection;
    begin
      GetConnection := function: TFDConnection
        begin
          Result := TFDConnection.Create(nil); // Implementação específica
        end;
    end;
    ```

- **TDatabaseConfigurator<T>**
  - **Descrição**: Procedimento genérico de configuração para um banco de dados.
  - **Parâmetros**:
    - `AConfiguration` (var T): Configuração do banco de dados que será modificada.
    - `AValue` (TValue): Valor a ser aplicado na configuração.
  - **Uso**: Permite modificar configurações específicas de bancos de dados através de procedimentos parametrizados, tornando possível a aplicação de diferentes valores a diversas configurações de maneira flexível e genérica.

  - **Exemplo de Uso**:
    ```delphi
    var
      Configurador: TDatabaseConfigurator<TPGConfiguration>;
    begin
      Configurador := procedure(var AConfig: TPGConfiguration; const AValue: TValue)
        begin
          AConfig.Server := AValue.AsString; // Ajuste específico
        end;
    end;
    ```

### ⚙️ Finalidade

Esta unit centraliza as referências de métodos para conexões e configurações, facilitando a utilização e aplicação de procedimentos de configuração em diferentes contextos de banco de dados. É especialmente útil em sistemas onde múltiplos tipos de banco de dados são utilizados e precisam de configurações específicas.


### 🗂️ Unit ADSDataBaseConfigurationParameter

A **unit ADSDataBaseConfigurationParameter** oferece métodos para configurar parâmetros específicos de uma instância de `TADSConfiguration`, utilizada para preparar o FireDAC (`FDConnection`) com o driver ADS (Advantage Database Server). Esta configuração permite definir valores como tipo de servidor, conjunto de caracteres, protocolo, e outras opções de conexão.

#### Funções e Procedimentos

- **DatabaseConfig**
  - **Descrição**: Configura parâmetros específicos em uma instância de `TADSConfiguration` com base nos valores fornecidos.
  - **Parâmetros**:
    - `AConfiguration` (var TADSConfiguration): A configuração de banco de dados ADS a ser modificada.
    - `AParameter` (TADSConfigurationParameter): O parâmetro de configuração a ser ajustado.
    - `AValue` (TValue, TADSServerType, TADSCharacterSet, TADSProtocol, TADSTableType, TADSLocking): O valor a ser aplicado no parâmetro.
  - **Sobrecargas**:
    - `DatabaseConfig(var AConfiguration: TADSConfiguration; AParameter: TADSConfigurationParameter; const AValue: TValue)`: Configura com um valor genérico `TValue`.
    - `DatabaseConfig(var AConfiguration: TADSConfiguration; AParameter: TADSConfigurationParameter; const AValue: TADSServerType)`: Configura com o tipo de servidor.
    - `DatabaseConfig(var AConfiguration: TADSConfiguration; AParameter: TADSConfigurationParameter; const AValue: TADSCharacterSet)`: Configura o conjunto de caracteres.
    - `DatabaseConfig(var AConfiguration: TADSConfiguration; AParameter: TADSConfigurationParameter; const AValue: TADSProtocol)`: Configura o protocolo de conexão.
    - `DatabaseConfig(var AConfiguration: TADSConfiguration; AParameter: TADSConfigurationParameter; const AValue: TADSTableType)`: Configura o tipo de tabela.
    - `DatabaseConfig(var AConfiguration: TADSConfiguration; AParameter: TADSConfigurationParameter; const AValue: TADSLocking)`: Configura o tipo de bloqueio.

- **SetDatabase**
  - **Descrição**: Define o caminho do banco de dados na configuração `TADSConfiguration`.
  - **Parâmetros**:
    - `AConfiguration` (var TADSConfiguration): A configuração a ser alterada.
    - `AValue` (TValue): Caminho do banco de dados em formato `string`.
  - **Exemplo**:
    ```delphi
    SetDatabase(MyConfig, 'C:\databases\example.db');
    ```

- **SetUserName**
  - **Descrição**: Define o nome do usuário na configuração.
  - **Parâmetros**:
    - `AConfiguration` (var TADSConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Nome do usuário.

- **SetPassword**
  - **Descrição**: Define a senha na configuração.
  - **Parâmetros**:
    - `AConfiguration` (var TADSConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Senha do usuário.

- **SetCharacterSet**
  - **Descrição**: Define o conjunto de caracteres na configuração.
  - **Parâmetros**:
    - `AConfiguration` (var TADSConfiguration): Configuração a ser alterada.
    - `AValue` (TADSCharacterSet): Valor do conjunto de caracteres.

- **SetPooled**
  - **Descrição**: Define se o pool de conexões está habilitado.
  - **Parâmetros**:
    - `AConfiguration` (var TADSConfiguration): Configuração a ser alterada.
    - `AValue` (boolean): Indica se o pool está habilitado.

#### Inicialização e Finalização

- **InitializeConfigurators**
  - **Descrição**: Inicializa o dicionário `FDictionary` com os configuradores específicos para cada parâmetro de `TADSConfigurationParameter`.
  - **Chamado em**: Inicialização da unit.

- **Finalization**
  - **Descrição**: Libera o dicionário `FDictionary` ao final da execução para garantir a liberação da memória alocada.

### ⚠️ Exceções
- `RaiseInvalidTypeException`: Lança exceção quando o tipo do valor fornecido não corresponde ao esperado pelo parâmetro de configuração, ajudando na identificação de problemas de tipagem em tempo de execução.

### ⚙️ Finalidade

Esta unit é essencial para configurar parâmetros de conexão do FireDAC com o ADS, centralizando procedimentos que permitem ao desenvolvedor ajustar opções de conexão de maneira modular e consistente, incluindo características de tipo de servidor, conjunto de caracteres, e outros parâmetros técnicos de conexão de banco de dados.

### 🗂️ Unit FBDataBaseConfigurationParameter

A **unit FBDataBaseConfigurationParameter** fornece procedimentos para configurar parâmetros específicos de uma instância de `TFBConfiguration`, usada para configurar o FireDAC (`FDConnection`) com o driver Firebird. Esta configuração permite definir valores como protocolo, modo de abertura, conjunto de caracteres, e outras opções de conexão para o banco de dados Firebird.

#### Funções e Procedimentos

- **DatabaseConfig**
  - **Descrição**: Configura parâmetros específicos em uma instância de `TFBConfiguration` com base nos valores fornecidos.
  - **Parâmetros**:
    - `AConfiguration` (var TFBConfiguration): A configuração de banco de dados Firebird a ser modificada.
    - `AParameter` (TFBConfigurationParameter): O parâmetro de configuração a ser ajustado.
    - `AValue` (TValue, TFBProtocolType, TFBOpenModeType, TFBCharacterSetType): O valor a ser aplicado ao parâmetro.
  - **Sobrecargas**:
    - `DatabaseConfig(var AConfiguration: TFBConfiguration; AParameter: TFBConfigurationParameter; const AValue: TValue)`: Configura com um valor genérico `TValue`.
    - `DatabaseConfig(var AConfiguration: TFBConfiguration; AParameter: TFBConfigurationParameter; const AValue: TFBProtocolType)`: Configura o tipo de protocolo.
    - `DatabaseConfig(var AConfiguration: TFBConfiguration; AParameter: TFBConfigurationParameter; const AValue: TFBOpenModeType)`: Configura o modo de abertura.
    - `DatabaseConfig(var AConfiguration: TFBConfiguration; AParameter: TFBConfigurationParameter; const AValue: TFBCharacterSetType)`: Configura o conjunto de caracteres.

- **SetDatabase**
  - **Descrição**: Define o caminho do banco de dados na configuração `TFBConfiguration`.
  - **Parâmetros**:
    - `AConfiguration` (var TFBConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Caminho do banco de dados em formato `string`.
  - **Exemplo**:
    ```delphi
    SetDatabase(MyConfig, 'C:\databases\example.fdb');
    ```

- **SetUserName**
  - **Descrição**: Define o nome do usuário na configuração Firebird.
  - **Parâmetros**:
    - `AConfiguration` (var TFBConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Nome do usuário.

- **SetPassword**
  - **Descrição**: Define a senha na configuração Firebird.
  - **Parâmetros**:
    - `AConfiguration` (var TFBConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Senha do usuário.

- **SetProtocol**
  - **Descrição**: Define o protocolo de conexão na configuração.
  - **Parâmetros**:
    - `AConfiguration` (var TFBConfiguration): Configuração a ser alterada.
    - `AValue` (TFBProtocolType): Valor do protocolo de conexão.

- **SetOpenMode**
  - **Descrição**: Define o modo de abertura do banco de dados.
  - **Parâmetros**:
    - `AConfiguration` (var TFBConfiguration): Configuração a ser alterada.
    - `AValue` (TFBOpenModeType): Valor do modo de abertura.

- **SetCharacterSet**
  - **Descrição**: Define o conjunto de caracteres na configuração.
  - **Parâmetros**:
    - `AConfiguration` (var TFBConfiguration): Configuração a ser alterada.
    - `AValue` (TFBCharacterSetType): Valor do conjunto de caracteres.

- **SetPooled**
  - **Descrição**: Define se o pool de conexões está habilitado.
  - **Parâmetros**:
    - `AConfiguration` (var TFBConfiguration): Configuração a ser alterada.
    - `AValue` (boolean): Indica se o pool está habilitado.

### ⚠️ Exceções
- `RaiseInvalidTypeException`: Lança exceção quando o tipo do valor fornecido não corresponde ao esperado pelo parâmetro de configuração, ajudando na identificação de problemas de tipagem em tempo de execução.

### ⚙️ Finalidade

Esta unit é essencial para configurar parâmetros de conexão do FireDAC com o Firebird, centralizando procedimentos que permitem ao desenvolvedor ajustar opções de conexão de maneira modular e consistente, incluindo características de protocolo, conjunto de caracteres, e outros parâmetros técnicos de conexão de banco de dados Firebird.

### 🗂️ Unit MySQLDataBaseConfigurationParameter

A **unit MySQLDataBaseConfigurationParameter** fornece procedimentos para configurar parâmetros específicos de uma instância de `TMySQLConfiguration`, utilizada para configurar o FireDAC (`FDConnection`) com o driver MySQL. Essa unit permite definir valores como servidor, porta, biblioteca do fornecedor e opções de pooling de conexão para o banco de dados MySQL.

#### Funções e Procedimentos

- **DatabaseConfig**
  - **Descrição**: Configura parâmetros específicos em uma instância de `TMySQLConfiguration` com base nos valores fornecidos.
  - **Parâmetros**:
    - `AConfiguration` (var TMySQLConfiguration): A configuração de banco de dados MySQL a ser modificada.
    - `AParameter` (TMySQLConfigurationParameter): O parâmetro de configuração a ser ajustado.
    - `AValue` (TValue): O valor genérico a ser aplicado ao parâmetro.
  - **Exemplo de Uso**:
    ```delphi
    DatabaseConfig(MyConfig, TMySQLConfigurationParameter.Database, 'database_name');
    ```

- **SetDatabase**
  - **Descrição**: Define o caminho do banco de dados na configuração MySQL.
  - **Parâmetros**:
    - `AConfiguration` (var TMySQLConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Caminho do banco de dados em formato `string`.

- **SetUserName**
  - **Descrição**: Define o nome do usuário na configuração MySQL.
  - **Parâmetros**:
    - `AConfiguration` (var TMySQLConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Nome do usuário.

- **SetPassword**
  - **Descrição**: Define a senha na configuração MySQL.
  - **Parâmetros**:
    - `AConfiguration` (var TMySQLConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Senha do usuário.

- **SetServer**
  - **Descrição**: Define o endereço do servidor na configuração MySQL.
  - **Parâmetros**:
    - `AConfiguration` (var TMySQLConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Endereço do servidor.

- **SetVendorLib**
  - **Descrição**: Define a biblioteca do fornecedor na configuração MySQL.
  - **Parâmetros**:
    - `AConfiguration` (var TMySQLConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Caminho da biblioteca do fornecedor.

- **SetPort**
  - **Descrição**: Define a porta do servidor na configuração MySQL.
  - **Parâmetros**:
    - `AConfiguration` (var TMySQLConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Número da porta.

- **SetPooled**
  - **Descrição**: Define se o pool de conexões está habilitado.
  - **Parâmetros**:
    - `AConfiguration` (var TMySQLConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Valor booleano que indica se o pooling de conexão está habilitado.

- **SetPoolMaxItems**
  - **Descrição**: Define o número máximo de conexões no pool.
  - **Parâmetros**:
    - `AConfiguration` (var TMySQLConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Valor inteiro para o número máximo de conexões no pool.

- **SetPoolExpireTimeout**
  - **Descrição**: Define o tempo de expiração do pool de conexões.
  - **Parâmetros**:
    - `AConfiguration` (var TMySQLConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Tempo de expiração em milissegundos.

- **SetPoolCleanupTimeout**
  - **Descrição**: Define o tempo de limpeza do pool de conexões.
  - **Parâmetros**:
    - `AConfiguration` (var TMySQLConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Tempo de limpeza em milissegundos.

### ⚠️ Exceções
- `RaiseInvalidTypeException`: Lança exceção quando o tipo do valor fornecido não corresponde ao esperado pelo parâmetro de configuração, ajudando na identificação de problemas de tipagem em tempo de execução.

### ⚙️ Finalidade

Esta unit é essencial para configurar parâmetros de conexão do FireDAC com o MySQL, centralizando procedimentos que permitem ao desenvolvedor ajustar opções de conexão de forma modular e consistente, como detalhes de servidor, pooling de conexão e autenticação.

### 🗂️ Unit PGDataBaseConfigurationParameter

A **unit PGDataBaseConfigurationParameter** fornece procedimentos para configurar parâmetros específicos de uma instância de `TPGConfiguration`, utilizada para configurar o FireDAC (`FDConnection`) com o driver PostgreSQL. Essa unit permite definir valores de parâmetros como servidor, porta, banco de dados, nome de usuário, senha, conjunto de caracteres e opções de pool de conexões.

#### Funções e Procedimentos

- **DatabaseConfig**
  - **Descrição**: Configura um parâmetro específico em uma instância de `TPGConfiguration` de acordo com o valor fornecido.
  - **Parâmetros**:
    - `AConfiguration` (var TPGConfiguration): A configuração do banco de dados PostgreSQL a ser modificada.
    - `AParameter` (TPGConfigurationParameter): O parâmetro de configuração a ser modificado.
    - `AValue` (TValue): O valor genérico a ser aplicado ao parâmetro.
  - **Exemplo de Uso**:
    ```delphi
    DatabaseConfig(PGConfig, TPGConfigurationParameter.Server, 'localhost');
    ```

- **SetServer**
  - **Descrição**: Define o endereço do servidor PostgreSQL na configuração.
  - **Parâmetros**:
    - `AConfiguration` (var TPGConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Endereço do servidor.

- **SetPort**
  - **Descrição**: Define a porta do servidor PostgreSQL.
  - **Parâmetros**:
    - `AConfiguration` (var TPGConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Número da porta.

- **SetDatabase**
  - **Descrição**: Define o banco de dados na configuração PostgreSQL.
  - **Parâmetros**:
    - `AConfiguration` (var TPGConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Nome do banco de dados.

- **SetUserName**
  - **Descrição**: Define o nome de usuário na configuração PostgreSQL.
  - **Parâmetros**:
    - `AConfiguration` (var TPGConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Nome de usuário.

- **SetPassword**
  - **Descrição**: Define a senha de conexão na configuração PostgreSQL.
  - **Parâmetros**:
    - `AConfiguration` (var TPGConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Senha do usuário.

- **SetCharacterSet**
  - **Descrição**: Define o conjunto de caracteres na configuração PostgreSQL.
  - **Parâmetros**:
    - `AConfiguration` (var TPGConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Conjunto de caracteres.

- **SetPooled**
  - **Descrição**: Define se o pool de conexões está habilitado.
  - **Parâmetros**:
    - `AConfiguration` (var TPGConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Valor booleano para o pooling de conexão.

- **SetPoolMaxItems**
  - **Descrição**: Define o número máximo de conexões no pool.
  - **Parâmetros**:
    - `AConfiguration` (var TPGConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Quantidade máxima de conexões.

- **SetPoolExpireTimeout**
  - **Descrição**: Define o tempo de expiração do pool de conexões.
  - **Parâmetros**:
    - `AConfiguration` (var TPGConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Tempo de expiração em milissegundos.

- **SetPoolCleanupTimeout**
  - **Descrição**: Define o tempo de limpeza do pool de conexões.
  - **Parâmetros**:
    - `AConfiguration` (var TPGConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Tempo de limpeza em milissegundos.

### ⚠️ Exceções
- `RaiseInvalidTypeException`: Lança exceção quando o tipo do valor fornecido não corresponde ao esperado pelo parâmetro de configuração, garantindo que a configuração seja aplicada corretamente.

### ⚙️ Finalidade

Esta unit é essencial para centralizar a configuração de conexões com o PostgreSQL, permitindo ajuste modular de opções de conexão como servidor, autenticação e pooling.

### 🗂️ Unit SQLiteDataBaseConfigurationParameter

A **unit SQLiteDataBaseConfigurationParameter** fornece procedimentos para configurar parâmetros específicos de uma instância de `TSQLiteConfiguration`, utilizada para configurar o FireDAC (`FDConnection`) com o driver SQLite. Essa unit permite definir valores de parâmetros como modo de bloqueio, modo de abertura, tipo de criptografia e outras opções de conexão.

#### Funções e Procedimentos

- **DatabaseConfig** (sobrecargas)
  - **Descrição**: Configura um parâmetro específico em uma instância de `TSQLiteConfiguration` de acordo com o tipo de valor fornecido.
  
  - **Sobrecarga 1**
    - **Parâmetros**:
      - `AConfiguration` (var TSQLiteConfiguration): A configuração do banco de dados SQLite a ser modificada.
      - `AParameter` (TSQLiteConfigurationParameter): O parâmetro de configuração a ser modificado.
      - `AValue` (TValue): Valor genérico aplicado ao parâmetro.
    - **Exemplo de Uso**:
      ```delphi
      DatabaseConfig(SQLiteConfig, TSQLiteConfigurationParameter.Database, 'database_path');
      ```

  - **Sobrecarga 2**
    - **Parâmetros**:
      - `AConfiguration` (var TSQLiteConfiguration): A configuração do banco de dados SQLite a ser modificada.
      - `AParameter` (TSQLiteConfigurationParameter): O parâmetro de configuração para o modo de bloqueio.
      - `AValue` (TSQLiteLockingModeType): Valor do tipo de modo de bloqueio.
    - **Exemplo de Uso**:
      ```delphi
      DatabaseConfig(SQLiteConfig, TSQLiteConfigurationParameter.LockingMode, lmNormal);
      ```

  - **Sobrecarga 3**
    - **Parâmetros**:
      - `AConfiguration` (var TSQLiteConfiguration): A configuração do banco de dados SQLite a ser modificada.
      - `AParameter` (TSQLiteConfigurationParameter): O parâmetro de configuração para o modo de abertura.
      - `AValue` (TSQLiteOpenModeType): Valor do tipo de modo de abertura.
    - **Exemplo de Uso**:
      ```delphi
      DatabaseConfig(SQLiteConfig, TSQLiteConfigurationParameter.OpenMode, omReadWrite);
      ```

  - **Sobrecarga 4**
    - **Parâmetros**:
      - `AConfiguration` (var TSQLiteConfiguration): A configuração do banco de dados SQLite a ser modificada.
      - `AParameter` (TSQLiteConfigurationParameter): O parâmetro de configuração para o tipo de criptografia.
      - `AValue` (TSQLiteEncryptType): Valor do tipo de criptografia.
    - **Exemplo de Uso**:
      ```delphi
      DatabaseConfig(SQLiteConfig, TSQLiteConfigurationParameter.Encrypt, etAES256);
      ```

- **SetDatabase**
  - **Descrição**: Define o caminho do banco de dados na configuração SQLite.
  - **Parâmetros**:
    - `AConfiguration` (var TSQLiteConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Caminho do banco de dados.

- **SetUserName**
  - **Descrição**: Define o nome de usuário na configuração SQLite.
  - **Parâmetros**:
    - `AConfiguration` (var TSQLiteConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Nome de usuário.

- **SetPassword**
  - **Descrição**: Define a senha de conexão na configuração SQLite.
  - **Parâmetros**:
    - `AConfiguration` (var TSQLiteConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Senha do usuário.

- **SetPooled**
  - **Descrição**: Define se o pool de conexões está habilitado.
  - **Parâmetros**:
    - `AConfiguration` (var TSQLiteConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Valor booleano para o pooling de conexão.

- **SetPoolMaxItems**
  - **Descrição**: Define o número máximo de conexões no pool.
  - **Parâmetros**:
    - `AConfiguration` (var TSQLiteConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Quantidade máxima de conexões.

- **SetPoolExpireTimeout**
  - **Descrição**: Define o tempo de expiração do pool de conexões.
  - **Parâmetros**:
    - `AConfiguration` (var TSQLiteConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Tempo de expiração em milissegundos.

- **SetPoolCleanupTimeout**
  - **Descrição**: Define o tempo de limpeza do pool de conexões.
  - **Parâmetros**:
    - `AConfiguration` (var TSQLiteConfiguration): Configuração a ser alterada.
    - `AValue` (TValue): Tempo de limpeza em milissegundos.

### ⚠️ Exceções
- `RaiseInvalidTypeException`: Lança exceção quando o tipo do valor fornecido não corresponde ao esperado pelo parâmetro de configuração, garantindo que a configuração seja aplicada corretamente.

### ⚙️ Finalidade

Esta unit é essencial para centralizar a configuração de conexões com o SQLite, permitindo ajuste modular de opções de conexão como caminho do banco de dados, autenticação e pooling.

### 🗂️ Unit ADSDatabaseConfigurationManager

A **unit ADSDatabaseConfigurationManager** fornece funções e procedimentos para configurar e inicializar uma conexão com o banco de dados **ADS (Advantage Database Server)**, usando **FireDAC (FDConnection)**. Esta unit permite definir parâmetros de conexão, prefixos personalizados, e gerenciar definições de conexão dentro do FireDAC Manager.

#### Funções e Procedimentos

- **Initialize(const AConfiguration: TADSConfiguration; const ADatabase: string; const APrefix: string);**
  - **Descrição:** Inicializa uma conexão com o banco de dados **ADS** usando as configurações especificadas, um nome personalizado para o banco de dados e um prefixo para o FireDAC Manager.
  - **Parâmetros:**
    - `AConfiguration`: Configurações de conexão para o banco de dados **ADS**.
    - `ADatabase`: Nome personalizado do banco de dados.
    - `APrefix`: Prefixo para a definição da conexão no FireDAC Manager.

- **Initialize(const AConfiguration: TADSConfiguration; const APrefix: string);**
  - **Descrição:** Inicializa uma conexão com o banco de dados **ADS** usando as configurações especificadas e um prefixo personalizado.
  - **Parâmetros:**
    - `AConfiguration`: Configurações de conexão para o banco de dados **ADS**.
    - `APrefix`: Prefixo para a definição da conexão no FireDAC Manager.

- **Initialize(const AConfiguration: TADSConfiguration);**
  - **Descrição:** Inicializa uma conexão com o banco de dados **ADS** usando apenas as configurações especificadas.
  - **Parâmetro:** 
    - `AConfiguration`: Configurações de conexão para o banco de dados **ADS**.

- **GetConnectionDef(const APrefix: string): string;**
  - **Descrição:** Retorna o nome da definição de conexão no FireDAC Manager com um prefixo personalizado.
  - **Parâmetro:**
    - `APrefix`: Prefixo a ser utilizado na definição de conexão.
  - **Retorno:** Nome da definição de conexão com o prefixo.

- **GetConnectionDef: string;**
  - **Descrição:** Retorna o nome da definição de conexão padrão no FireDAC Manager.
  - **Retorno:** Nome da definição de conexão padrão.

- **CreateConnectionParameters(const AConfiguration: TADSConfiguration; const ADatabase: string): TStrings;**
  - **Descrição:** Cria uma lista de parâmetros de conexão para o banco de dados **ADS** com base nas configurações fornecidas.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **ADS**.
    - `ADatabase`: Nome do banco de dados.
  - **Retorno:** Lista de parâmetros de conexão.

- **EnsureFDManagerInitialized;**
  - **Descrição:** Garante que o gerenciador do **FireDAC** esteja inicializado.

- **ConfigureFDManager;**
  - **Descrição:** Configura o gerenciador do **FireDAC** com as opções necessárias para reconexão automática.

### 🗂️ Unit ADSDataBaseConnectionManager

A **unit ADSDataBaseConnectionManager** fornece funções para gerenciar conexões com o banco de dados **Advantage Database Server (ADS)** usando **FireDAC**. Permite a criação de conexões reutilizáveis e personalizadas, bem como o gerenciamento de um pool de conexões.

#### Funções e Procedimentos

- **GetConnection(const AConfiguration: TADSConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão com o banco de dados **ADS** com base nas configurações fornecidas, no nome do banco de dados e no prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **ADS**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo para identificar a conexão.
  - **Retorno:** Uma instância configurada de `TFDConnection`.

- **GetConnection(const AConfiguration: TADSConfiguration; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão com o banco de dados **ADS** com base nas configurações fornecidas e no prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **ADS**.
    - `APrefix`: Prefixo para identificar a conexão.
  - **Retorno:** Uma instância configurada de `TFDConnection`.

- **GetConnection(const AConfiguration: TADSConfiguration): TFDConnection;**
  - **Descrição:** Retorna uma conexão com o banco de dados **ADS** com base apenas nas configurações fornecidas.
  - **Parâmetro:** 
    - `AConfiguration`: Configurações do banco de dados **ADS**.
  - **Retorno:** Uma instância configurada de `TFDConnection`.

- **SetupConnection(const AConfiguration: TADSConfiguration; const ADatabase: string; const APrefix: string; var AConnection: TFDConnection);**
  - **Descrição:** Configura uma conexão com o banco de dados **ADS** com base nas configurações e parâmetros fornecidos.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **ADS**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo para identificar a conexão.
    - `AConnection`: A conexão a ser configurada.
  - **Exceção:** Lança uma exceção se a DLL especificada em `VendorLib` não for encontrada.

- **DefaultConnection(const AConfiguration: TADSConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão padrão com o banco de dados **ADS**. Se uma conexão padrão já existir, ela será retornada.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **ADS**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo para identificar a conexão.
  - **Retorno:** Uma instância configurada de `TFDConnection`.

- **CustomConnection(const AConfiguration: TADSConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão personalizada com o banco de dados **ADS**. Se uma conexão com o prefixo fornecido já existir, ela será retornada.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **ADS**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo para identificar a conexão.
  - **Retorno:** Uma instância configurada de `TFDConnection`.

### 🗂️ Unit Horse.Connection.ADS

A **unit Horse.Connection.ADS** fornece integração com o **Horse** para gerenciar conexões com o banco de dados **Advantage Database Server (ADS)** usando **FireDAC**. Inclui funções para configurar a conexão e aplicar parâmetros específicos de configuração.

#### Funções e Procedimentos

- **ADSConnection: TFDConnection;**
  - **Descrição:** Retorna uma conexão configurada para o banco de dados **ADS** usando as configurações atuais.
  - **Retorno:** Uma instância de `TFDConnection` configurada para o banco de dados **ADS**.

- **ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter; const Value: TValue);**
  - **Descrição:** Aplica um parâmetro de configuração ao banco de dados **ADS** usando um valor genérico.
  - **Parâmetros:**
    - `AParameter`: O parâmetro de configuração a ser aplicado.
    - `Value`: O valor do parâmetro como `TValue`.

- **ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter; const Value: TADSServerType);**
  - **Descrição:** Aplica um parâmetro de tipo de servidor ao banco de dados **ADS**.
  - **Parâmetros:**
    - `AParameter`: O parâmetro de configuração a ser aplicado.
    - `Value`: O valor do parâmetro como `TADSServerType`.

- **ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter; const Value: TADSCharacterSet);**
  - **Descrição:** Aplica um parâmetro de conjunto de caracteres ao banco de dados **ADS**.
  - **Parâmetros:**
    - `AParameter`: O parâmetro de configuração a ser aplicado.
    - `Value`: O valor do parâmetro como `TADSCharacterSet`.

- **ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter; const Value: TADSProtocol);**
  - **Descrição:** Aplica um parâmetro de protocolo ao banco de dados **ADS**.
  - **Parâmetros:**
    - `AParameter`: O parâmetro de configuração a ser aplicado.
    - `Value`: O valor do parâmetro como `TADSProtocol`.

- **ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter; const Value: TADSTableType);**
  - **Descrição:** Aplica um parâmetro de tipo de tabela ao banco de dados **ADS**.
  - **Parâmetros:**
    - `AParameter`: O parâmetro de configuração a ser aplicado.
    - `Value`: O valor do parâmetro como `TADSTableType`.

- **ApplyDatabaseConfiguration(const AParameter: TADSConfigurationParameter; const Value: TADSLocking);**
  - **Descrição:** Aplica um parâmetro de bloqueio ao banco de dados **ADS**.
  - **Parâmetros:**
    - `AParameter`: O parâmetro de configuração a ser aplicado.
    - `Value`: O valor do parâmetro como `TADSLocking`.

- **SetConnectionPrefix(const AValue: string);**
  - **Descrição:** Define o prefixo da conexão para o banco de dados **ADS**.
  - **Parâmetro:** 
    - `AValue`: O valor do prefixo.

- **SetDatabase(const AValue: string);**
  - **Descrição:** Define o caminho do banco de dados para o **ADS**.
  - **Parâmetro:** 
    - `AValue`: O caminho do banco de dados.

- **HorseConnectionADS(Req: THorseRequest; Res: THorseResponse; Next: TProc);**
  - **Descrição:** Middleware para integração com o **Horse**. Define a conexão com o banco de dados **ADS** para cada requisição HTTP.
  - **Parâmetros:**
    - `Req`: O objeto de requisição do **Horse**.
    - `Res`: O objeto de resposta do **Horse**.
    - `Next`: O procedimento a ser executado na sequência.

### 🗂️ Unit FBDatabaseConfigurationManager

A **unit FBDatabaseConfigurationManager** fornece funções para gerenciar configurações de conexão com o banco de dados **Firebird** usando **FireDAC**. Permite a criação de definições de conexão reutilizáveis e personalizadas.

#### Funções e Procedimentos

- **Initialize(const AConfiguration: TFBConfiguration; const ADatabase: string; const APrefix: string);**
  - **Descrição:** Inicializa a configuração do FireDAC para o banco de dados **Firebird** com base nas configurações fornecidas, nome do banco de dados e prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações de conexão para o banco de dados **Firebird**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo para identificar a conexão.

- **Initialize(const AConfiguration: TFBConfiguration; const APrefix: string);**
  - **Descrição:** Inicializa a configuração do FireDAC para o banco de dados **Firebird** com base nas configurações fornecidas e no prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações de conexão para o banco de dados **Firebird**.
    - `APrefix`: Prefixo para identificar a conexão.

- **Initialize(const AConfiguration: TFBConfiguration);**
  - **Descrição:** Inicializa a configuração do FireDAC para o banco de dados **Firebird** usando apenas as configurações fornecidas.
  - **Parâmetro:** 
    - `AConfiguration`: Configurações de conexão para o banco de dados **Firebird**.

- **GetConnectionDef(const APrefix: string): string;**
  - **Descrição:** Retorna o nome da definição de conexão com base no prefixo fornecido.
  - **Parâmetro:**
    - `APrefix`: Prefixo para identificar a conexão.
  - **Retorno:** Nome da definição de conexão.

- **GetConnectionDef: string;**
  - **Descrição:** Retorna o nome da definição de conexão padrão.
  - **Retorno:** Nome da definição de conexão padrão.

- **CreateConnectionParameters(const AConfiguration: TFBConfiguration; const ADatabase: string): TStrings;**
  - **Descrição:** Cria uma lista de parâmetros de conexão para o banco de dados **Firebird** com base nas configurações fornecidas.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **Firebird**.
    - `ADatabase`: Nome do banco de dados.
  - **Retorno:** Lista de strings contendo os parâmetros de conexão.

- **EnsureFDManagerInitialized;**
  - **Descrição:** Garante que o gerenciador do **FireDAC** esteja inicializado.

- **ConfigureFDManager;**
  - **Descrição:** Configura o gerenciador do **FireDAC** com as opções necessárias para reconexão automática.

#### Inicialização e Finalização

- **initialization**
  - **Descrição:** Assegura que o `FDManager` esteja ativo para o gerenciamento de conexões ao iniciar a aplicação.

- **finalization**
  - **Descrição:** Desativa e libera o `FDManager` ao finalizar a aplicação para evitar vazamentos de memória.

### ⚙️ Finalidade

Esta unit é essencial para gerenciar e personalizar conexões com o banco de dados **Firebird**, centralizando definições de conexão e facilitando a reutilização e manutenção das configurações no **FireDAC**.

### 🗂️ Unit FBDatabaseConnectionManager

A **unit FBDatabaseConnectionManager** fornece funções para gerenciar conexões com o banco de dados **Firebird** usando **FireDAC**. Permite a criação de conexões reutilizáveis e personalizadas, além de gerenciar um pool de conexões.

#### Funções e Procedimentos

- **GetConnection(const AConfiguration: TFBConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão com o banco de dados **Firebird** com base nas configurações fornecidas, no nome do banco de dados e no prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **Firebird**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo para identificar a conexão.
  - **Retorno:** Uma instância configurada de `TFDConnection`.

- **GetConnection(const AConfiguration: TFBConfiguration; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão com o banco de dados **Firebird** com base nas configurações fornecidas e no prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **Firebird**.
    - `APrefix`: Prefixo para identificar a conexão.
  - **Retorno:** Uma instância configurada de `TFDConnection`.

- **GetConnection(const AConfiguration: TFBConfiguration): TFDConnection;**
  - **Descrição:** Retorna uma conexão com o banco de dados **Firebird** baseada apenas nas configurações fornecidas.
  - **Parâmetro:** 
    - `AConfiguration`: Configurações do banco de dados **Firebird**.
  - **Retorno:** Uma instância configurada de `TFDConnection`.

- **DefaultConnection(const AConfiguration: TFBConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão padrão com o banco de dados **Firebird**. Se uma conexão padrão já existir, ela será retornada.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **Firebird**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo para identificar a conexão.
  - **Retorno:** Uma instância configurada de `TFDConnection`.

- **CustomConnection(const AConfiguration: TFBConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão personalizada com o banco de dados **Firebird**. Se uma conexão com o prefixo fornecido já existir, ela será retornada.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **Firebird**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo para identificar a conexão.
  - **Retorno:** Uma instância configurada de `TFDConnection`.

- **SetupConnection(const AConfiguration: TFBConfiguration; const ADatabase: string; const APrefix: string; var AConnection: TFDConnection);**
  - **Descrição:** Configura uma conexão com o banco de dados **Firebird** com base nas configurações e parâmetros fornecidos.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **Firebird**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo para identificar a conexão.
    - `AConnection`: A conexão a ser configurada.

#### Inicialização e Finalização

- **initialization**
  - **Descrição:** Inicializa o pool de conexões `FConnectionPool` ao iniciar a aplicação.

- **finalization**
  - **Descrição:** Libera o `FDConnection` e o pool de conexões `FConnectionPool` ao finalizar a aplicação para evitar vazamentos de memória.

### ⚙️ Finalidade

Esta unit é essencial para gerenciar conexões com o banco de dados **Firebird**, centralizando o controle de conexões padrão e personalizadas, garantindo reutilização e eficiência através do gerenciamento de um pool de conexões.

### 🗂️ Unit Horse.Connection.FB

A **unit Horse.Connection.FB** fornece integração com o **Horse** para gerenciar conexões com o banco de dados **Firebird** usando **FireDAC**. Inclui funções para configurar a conexão e aplicar parâmetros específicos de configuração.

#### Funções e Procedimentos

- **FBConnection: TFDConnection;**
  - **Descrição:** Retorna uma conexão configurada para o banco de dados **Firebird** usando as configurações atuais.
  - **Retorno:** Uma instância de `TFDConnection` configurada para o banco de dados **Firebird**.

- **ApplyDatabaseConfiguration(const AParameter: TFBConfigurationParameter; const Value: TValue);**
  - **Descrição:** Aplica um parâmetro de configuração ao banco de dados **Firebird** usando um valor genérico.
  - **Parâmetros:**
    - `AParameter`: O parâmetro de configuração a ser aplicado.
    - `Value`: O valor do parâmetro como `TValue`.

- **ApplyDatabaseConfiguration(const AParameter: TFBConfigurationParameter; const Value: TFBProtocolType);**
  - **Descrição:** Aplica um parâmetro de tipo de protocolo ao banco de dados **Firebird**.
  - **Parâmetros:**
    - `AParameter`: O parâmetro de configuração a ser aplicado.
    - `Value`: O valor do parâmetro como `TFBProtocolType`.

- **ApplyDatabaseConfiguration(const AParameter: TFBConfigurationParameter; const Value: TFBOpenModeType);**
  - **Descrição:** Aplica um parâmetro de modo de abertura ao banco de dados **Firebird**.
  - **Parâmetros:**
    - `AParameter`: O parâmetro de configuração a ser aplicado.
    - `Value`: O valor do parâmetro como `TFBOpenModeType`.

- **ApplyDatabaseConfiguration(const AParameter: TFBConfigurationParameter; const Value: TFBCharacterSetType);**
  - **Descrição:** Aplica um parâmetro de conjunto de caracteres ao banco de dados **Firebird**.
  - **Parâmetros:**
    - `AParameter`: O parâmetro de configuração a ser aplicado.
    - `Value`: O valor do parâmetro como `TFBCharacterSetType`.

- **SetConnectionPrefix(const AValue: string);**
  - **Descrição:** Define o prefixo da conexão para o banco de dados **Firebird**.
  - **Parâmetro:** 
    - `AValue`: O valor do prefixo.

- **SetDatabase(const AValue: string);**
  - **Descrição:** Define o caminho do banco de dados para o **Firebird**.
  - **Parâmetro:** 
    - `AValue`: O caminho do banco de dados.

- **HorseConnectionFB(Req: THorseRequest; Res: THorseResponse; Next: TProc);**
  - **Descrição:** Middleware para integração com o **Horse**. Define a conexão com o banco de dados **Firebird** para cada requisição HTTP recebida.
  - **Parâmetros:**
    - `Req`: O objeto de requisição do **Horse**.
    - `Res`: O objeto de resposta do **Horse**.
    - `Next`: O procedimento a ser executado na sequência.

### ⚙️ Finalidade

Esta unit facilita a integração do banco de dados **Firebird** com o framework **Horse**, permitindo que cada requisição HTTP utilize uma conexão configurada de maneira otimizada e flexível, com suporte a parâmetros específicos e personalizados.

### 🗂️ Unit MySQLDatabaseConfigurationManager

A **unit MySQLDatabaseConfigurationManager** fornece funções para gerenciar configurações de conexão com o banco de dados **MySQL** usando **FireDAC**. Permite criar definições de conexão reutilizáveis e personalizadas.

#### Funções e Procedimentos

- **Initialize(const AConfiguration: TMySQLConfiguration; const ADatabase: string; const APrefix: string);**
  - **Descrição:** Inicializa a configuração do FireDAC para o banco de dados **MySQL** com base nas configurações fornecidas, no nome do banco de dados e no prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações de conexão para o banco de dados **MySQL**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo para identificar a conexão no **FireDAC Manager**.

- **Initialize(const AConfiguration: TMySQLConfiguration; const APrefix: string);**
  - **Descrição:** Inicializa a configuração do FireDAC para o banco de dados **MySQL** com as configurações fornecidas e o prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações de conexão para o banco de dados **MySQL**.
    - `APrefix`: Prefixo para identificar a conexão.

- **Initialize(const AConfiguration: TMySQLConfiguration);**
  - **Descrição:** Inicializa a configuração do FireDAC para o banco de dados **MySQL** apenas com as configurações fornecidas.
  - **Parâmetro:** 
    - `AConfiguration`: Configurações de conexão para o banco de dados **MySQL**.

- **GetConnectionDef(const APrefix: string): string;**
  - **Descrição:** Retorna o nome da definição de conexão com base no prefixo fornecido.
  - **Parâmetro:**
    - `APrefix`: Prefixo a ser utilizado na definição de conexão.
  - **Retorno:** Nome da definição de conexão com o prefixo.

- **GetConnectionDef: string;**
  - **Descrição:** Retorna o nome da definição de conexão padrão.
  - **Retorno:** Nome da definição de conexão padrão.

- **CreateConnectionParameters(const AConfiguration: TMySQLConfiguration; const ADatabase: string): TStrings;**
  - **Descrição:** Cria uma lista de parâmetros de conexão para o banco de dados **MySQL** com base nas configurações fornecidas.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **MySQL**.
    - `ADatabase`: Nome do banco de dados.
  - **Retorno:** Lista de parâmetros de conexão.

#### Inicialização e Finalização

- **EnsureFDManagerInitialized**
  - **Descrição:** Garante que o gerenciador do **FireDAC** esteja inicializado.

- **ConfigureFDManager**
  - **Descrição:** Configura o gerenciador do **FireDAC** com as opções necessárias.

### ⚙️ Finalidade

Esta unit facilita o gerenciamento de conexões com o **MySQL** através do **FireDAC**, permitindo configurações personalizadas e reutilizáveis para diferentes cenários e ambientes.

### 🗂️ Unit MySQLDatabaseConnectionManager

A **unit MySQLDatabaseConnectionManager** fornece funções para gerenciar conexões com o banco de dados **MySQL** usando **FireDAC**. Permite a criação de conexões reutilizáveis e personalizadas, além de gerenciar um pool de conexões.

#### Funções e Procedimentos

- **GetConnection(const AConfiguration: TMySQLConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão com o banco de dados **MySQL** com base nas configurações fornecidas, nome do banco de dados, e prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações para o banco de dados **MySQL**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo para identificar a conexão.
  - **Retorno:** Instância de `TFDConnection` configurada.

- **GetConnection(const AConfiguration: TMySQLConfiguration; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão com o banco de dados **MySQL** com base nas configurações e prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações para o banco de dados **MySQL**.
    - `APrefix`: Prefixo para identificar a conexão.
  - **Retorno:** Instância de `TFDConnection` configurada.

- **GetConnection(const AConfiguration: TMySQLConfiguration): TFDConnection;**
  - **Descrição:** Retorna uma conexão com o banco de dados **MySQL** com base apenas nas configurações fornecidas.
  - **Parâmetro:**
    - `AConfiguration`: Configurações para o banco de dados **MySQL**.
  - **Retorno:** Instância de `TFDConnection` configurada.

- **DefaultConnection(const AConfiguration: TMySQLConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão padrão com o banco de dados **MySQL**; se uma conexão já existir, ela será retornada.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **MySQL**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo para identificar a conexão.
  - **Retorno:** Instância de `TFDConnection` configurada.

- **CustomConnection(const AConfiguration: TMySQLConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão personalizada com o banco de dados **MySQL**; se já existir uma conexão com o prefixo, ela será retornada.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **MySQL**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo para identificar a conexão.
  - **Retorno:** Instância de `TFDConnection` configurada.

#### Inicialização e Finalização

- **SetupConnection**
  - **Descrição:** Configura uma conexão com base nas configurações e parâmetros fornecidos.

- **FConnectionPool**
  - **Descrição:** Dicionário que gerencia um pool de conexões para o **MySQL**, permitindo reutilização e gerenciamento eficiente das conexões.

### ⚙️ Finalidade

Esta unit facilita o gerenciamento de conexões **MySQL** através do **FireDAC**, permitindo a criação de conexões padronizadas e customizadas para diferentes cenários e ambientes.

### 🗂️ Unit Horse.Connection.MySQL

A **unit Horse.Connection.MySQL** fornece integração com o **Horse** para gerenciar conexões com o banco de dados **MySQL** usando **FireDAC**. Inclui funções para configurar a conexão e aplicar parâmetros específicos de configuração.

#### Funções e Procedimentos

- **MySQLConnection**
  - **Descrição:** Retorna uma conexão configurada para o banco de dados **MySQL** usando as configurações atuais.
  - **Retorno:** Uma instância de `TFDConnection` configurada para o banco de dados **MySQL**.

- **ApplyDatabaseConfiguration(const AParameter: TMySQLConfigurationParameter; const Value: TValue)**
  - **Descrição:** Aplica um parâmetro de configuração ao banco de dados **MySQL** usando um valor genérico.
  - **Parâmetros:**
    - `AParameter`: O parâmetro de configuração a ser aplicado.
    - `Value`: O valor do parâmetro como `TValue`.

- **SetConnectionPrefix(const AValue: string)**
  - **Descrição:** Define o prefixo da conexão para o banco de dados **MySQL**.
  - **Parâmetro:**
    - `AValue`: O valor do prefixo.

- **SetDatabase(const AValue: string)**
  - **Descrição:** Define o caminho do banco de dados para o **MySQL**.
  - **Parâmetro:**
    - `AValue`: O caminho do banco de dados.

- **HorseConnectionMySQL(Req: THorseRequest; Res: THorseResponse; Next: TProc)**
  - **Descrição:** Middleware para integração com o **Horse**. Define a conexão com o banco de dados **MySQL** para cada requisição HTTP recebida.
  - **Parâmetros:**
    - `Req`: O objeto de requisição do **Horse**.
    - `Res`: O objeto de resposta do **Horse**.
    - `Next`: O procedimento a ser executado na sequência.

### ⚙️ Finalidade

Esta unit permite a integração com o **Horse**, simplificando o gerenciamento de conexões **MySQL** em aplicações web Delphi.

### 🗂️ Unit PGDatabaseConfigurationManager

A **unit PGDatabaseConfigurationManager** fornece funções para gerenciar configurações de conexão com o banco de dados **PostgreSQL** usando **FireDAC**. Permite criar definições de conexão reutilizáveis e personalizadas.

#### Funções e Procedimentos

- **Initialize(const AConfiguration: TPGConfiguration; const ADatabase: string; const APrefix: string);**
  - **Descrição:** Inicializa a configuração do FireDAC para o banco de dados **PostgreSQL** com base nas configurações fornecidas, no nome do banco de dados e no prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **PostgreSQL**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo para a definição da conexão.

- **Initialize(const AConfiguration: TPGConfiguration; const APrefix: string);**
  - **Descrição:** Inicializa a configuração do FireDAC para o banco de dados **PostgreSQL** com as configurações fornecidas e um prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **PostgreSQL**.
    - `APrefix`: Prefixo para a definição da conexão.

- **Initialize(const AConfiguration: TPGConfiguration);**
  - **Descrição:** Inicializa a configuração do FireDAC para o banco de dados **PostgreSQL** com base nas configurações fornecidas.
  - **Parâmetro:** 
    - `AConfiguration`: Configurações do banco de dados **PostgreSQL**.

- **GetConnectionDef(const APrefix: string): string;**
  - **Descrição:** Retorna o nome da definição de conexão baseado no prefixo fornecido.
  - **Parâmetro:**
    - `APrefix`: Prefixo para identificar a conexão.
  - **Retorno:** Nome da definição de conexão com o prefixo.

- **GetConnectionDef: string;**
  - **Descrição:** Retorna o nome da definição de conexão padrão.
  - **Retorno:** Nome da definição de conexão padrão.

- **CreateConnectionParameters(const AConfiguration: TPGConfiguration; const ADatabase: string): TStrings;**
  - **Descrição:** Cria uma lista de parâmetros de conexão para o banco de dados **PostgreSQL** com base nas configurações fornecidas.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **PostgreSQL**.
    - `ADatabase`: Nome do banco de dados.
  - **Retorno:** Lista de parâmetros de conexão.

- **EnsureFDManagerInitialized;**
  - **Descrição:** Garante que o gerenciador do **FireDAC** esteja inicializado.

- **ConfigureFDManager;**
  - **Descrição:** Configura o gerenciador do **FireDAC** com as opções necessárias para reconexão automática.

### ⚙️ Finalidade

Esta unit centraliza a configuração de conexões com o **PostgreSQL**, permitindo ajustes modulares de opções de conexão como servidor, autenticação e pooling.

### 🗂️ Unit PGDatabaseConnectionManager

A **unit PGDatabaseConnectionManager** fornece funções para gerenciar conexões com o banco de dados **PostgreSQL** usando **FireDAC**, permitindo a criação de conexões reutilizáveis e customizadas, além de gerenciamento de pool de conexões.

#### Funções e Procedimentos

- **GetConnection(const AConfiguration: TPGConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão com o banco de dados **PostgreSQL** com base nas configurações fornecidas, no nome do banco de dados e no prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **PostgreSQL**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo para identificar a conexão.
  - **Retorno:** Instância configurada de `TFDConnection`.

- **GetConnection(const AConfiguration: TPGConfiguration; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão com o banco de dados **PostgreSQL** com base nas configurações e prefixo fornecidos.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **PostgreSQL**.
    - `APrefix`: Prefixo para identificar a conexão.
  - **Retorno:** Instância configurada de `TFDConnection`.

- **GetConnection(const AConfiguration: TPGConfiguration): TFDConnection;**
  - **Descrição:** Retorna uma conexão padrão com o banco de dados **PostgreSQL** com base nas configurações fornecidas.
  - **Parâmetro:** 
    - `AConfiguration`: Configurações do banco de dados **PostgreSQL**.
  - **Retorno:** Instância configurada de `TFDConnection`.

- **SetupConnection(const AConfiguration: TPGConfiguration; const ADatabase: string; const APrefix: string; var AConnection: TFDConnection);**
  - **Descrição:** Configura uma conexão com o banco de dados **PostgreSQL** usando as configurações e parâmetros fornecidos.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **PostgreSQL**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo para identificar a conexão.
    - `AConnection`: Instância de conexão a ser configurada.

### ⚙️ Finalidade

Esta **unit** permite a criação e o gerenciamento de conexões reutilizáveis e personalizadas para o banco de dados **PostgreSQL** com **FireDAC**, oferecendo controle de **pooling** de conexões e reconexão automática, otimizando o acesso ao banco de dados e simplificando o gerenciamento de configurações.

### 🗂️ Unit Horse.Connection.PG

A **unit Horse.Connection.PG** oferece integração entre o framework **Horse** e o banco de dados **PostgreSQL** através do **FireDAC**. Ela inclui funções para configurar conexões, aplicar parâmetros específicos e gerenciar o caminho e prefixo de conexões, permitindo um gerenciamento eficiente de configurações para cada requisição HTTP recebida no Horse.

#### Funções e Procedimentos

- **PGConnection: TFDConnection;**
  - **Descrição:** Retorna uma conexão configurada para o banco de dados **PostgreSQL** usando as configurações atuais.
  - **Retorno:** Instância configurada de `TFDConnection` para o **PostgreSQL**.

- **ApplyDatabaseConfiguration(const AParameter: TPGConfigurationParameter; const Value: TValue);**
  - **Descrição:** Aplica um parâmetro de configuração ao banco de dados **PostgreSQL** usando um valor genérico.
  - **Parâmetros:**
    - `AParameter`: Parâmetro de configuração a ser aplicado.
    - `Value`: Valor do parâmetro, como `TValue`.

- **SetConnectionPrefix(const AValue: string);**
  - **Descrição:** Define o prefixo da conexão para o banco de dados **PostgreSQL**.
  - **Parâmetro:** 
    - `AValue`: Valor do prefixo.

- **SetDatabase(const AValue: string);**
  - **Descrição:** Define o caminho do banco de dados para o **PostgreSQL**.
  - **Parâmetro:** 
    - `AValue`: Caminho do banco de dados.

- **HorseConnectionPG(Req: THorseRequest; Res: THorseResponse; Next: TProc);**
  - **Descrição:** Middleware de integração com o Horse. Define a conexão com o banco de dados **PostgreSQL** para cada requisição HTTP recebida.
  - **Parâmetros:**
    - `Req`: Objeto de requisição do Horse.
    - `Res`: Objeto de resposta do Horse.
    - `Next`: Procedimento a ser executado na sequência.

### ⚙️ Finalidade

A **unit Horse.Connection.PG** permite o gerenciamento de conexões **PostgreSQL** em aplicações **Horse**, assegurando que cada requisição HTTP tenha uma conexão configurada conforme os parâmetros especificados. Essa abordagem facilita o uso de **PostgreSQL** em contextos web, proporcionando uma integração simplificada e eficiente com **Horse**.

### 🗂️ Unit SQLiteDatabaseConfigurationManager

A **unit SQLiteDatabaseConfigurationManager** fornece funções para gerenciar configurações de conexão com o banco de dados **SQLite** usando **FireDAC**. Permite criar definições de conexão reutilizáveis e personalizadas.

#### Funções e Procedimentos

- **Initialize(const AConfiguration: TSQLiteConfiguration; const ADatabase: string; const APrefix: string);**
  - **Descrição:** Inicializa a configuração do FireDAC para o banco de dados **SQLite** com base nas configurações fornecidas, no nome do banco de dados e no prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações de conexão para o banco de dados **SQLite**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo para identificar a conexão no **FireDAC Manager**.

- **Initialize(const AConfiguration: TSQLiteConfiguration; const APrefix: string);**
  - **Descrição:** Inicializa a configuração do FireDAC para o banco de dados **SQLite** com as configurações fornecidas e o prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações de conexão para o banco de dados **SQLite**.
    - `APrefix`: Prefixo para identificar a conexão.

- **Initialize(const AConfiguration: TSQLiteConfiguration);**
  - **Descrição:** Inicializa a configuração do FireDAC para o banco de dados **SQLite** apenas com as configurações fornecidas.
  - **Parâmetro:** 
    - `AConfiguration`: Configurações de conexão para o banco de dados **SQLite**.

- **GetConnectionDef(const APrefix: string): string;**
  - **Descrição:** Retorna o nome da definição de conexão com base no prefixo fornecido.
  - **Parâmetro:**
    - `APrefix`: Prefixo a ser utilizado na definição de conexão.
  - **Retorno:** Nome da definição de conexão com o prefixo.

- **GetConnectionDef: string;**
  - **Descrição:** Retorna o nome da definição de conexão padrão.
  - **Retorno:** Nome da definição de conexão padrão.

- **CreateConnectionParameters(const AConfiguration: TSQLiteConfiguration; const ADatabase: string): TStrings;**
  - **Descrição:** Cria uma lista de parâmetros de conexão para o banco de dados **SQLite** com base nas configurações fornecidas.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **SQLite**.
    - `ADatabase`: Nome do banco de dados.
  - **Retorno:** Lista de parâmetros de conexão.

#### Inicialização e Finalização

- **EnsureFDManagerInitialized**
  - **Descrição:** Garante que o gerenciador do **FireDAC** esteja inicializado.

- **ConfigureFDManager**
  - **Descrição:** Configura o gerenciador do **FireDAC** com as opções necessárias.

### ⚙️ Finalidade

Esta unit facilita o gerenciamento de conexões com o **SQLite** através do **FireDAC**, permitindo configurações personalizadas e reutilizáveis para diferentes cenários e ambientes.

### 🗂️ Unit SQLiteDatabaseConnectionManager

A **unit SQLiteDatabaseConnectionManager** fornece funções para gerenciar conexões com o banco de dados **SQLite** usando **FireDAC**. Permite a criação de conexões reutilizáveis e personalizadas, além de gerenciar um pool de conexões e configurar a criptografia do banco de dados.

#### Funções e Procedimentos

- **GetConnection(const AConfiguration: TSQLiteConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão com o banco de dados **SQLite** com base nas configurações fornecidas, nome do banco de dados e prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações para o banco de dados **SQLite**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo para identificar a conexão.
  - **Retorno:** Instância de `TFDConnection` configurada.

- **GetConnection(const AConfiguration: TSQLiteConfiguration; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão com o banco de dados **SQLite** com base nas configurações e prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações para o banco de dados **SQLite**.
    - `APrefix`: Prefixo para identificar a conexão.
  - **Retorno:** Instância de `TFDConnection` configurada.

- **GetConnection(const AConfiguration: TSQLiteConfiguration): TFDConnection;**
  - **Descrição:** Retorna uma conexão com o banco de dados **SQLite** com base apenas nas configurações fornecidas.
  - **Parâmetro:** 
    - `AConfiguration`: Configurações para o banco de dados **SQLite**.
  - **Retorno:** Instância de `TFDConnection` configurada.

- **DefaultConnection(const AConfiguration: TSQLiteConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão padrão com o banco de dados **SQLite**; se uma conexão já existir, ela será retornada.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **SQLite**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo para identificar a conexão.
  - **Retorno:** Instância de `TFDConnection` configurada.

- **CustomConnection(const AConfiguration: TSQLiteConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão personalizada com o banco de dados **SQLite**; se já existir uma conexão com o prefixo, ela será retornada.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **SQLite**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo para identificar a conexão.
  - **Retorno:** Instância de `TFDConnection` configurada.

#### Inicialização e Finalização

- **SetupConnection**
  - **Descrição:** Configura uma conexão com o banco de dados **SQLite** com suporte para criptografia, baseada nas configurações e parâmetros fornecidos.

- **FConnectionPool**
  - **Descrição:** Dicionário que gerencia um pool de conexões para o **SQLite**, permitindo reutilização e gerenciamento eficiente das conexões.

### ⚙️ Finalidade

Esta unit facilita o gerenciamento de conexões **SQLite** através do **FireDAC**, permitindo a criação de conexões padronizadas e customizadas para diferentes cenários e ambientes, com suporte adicional para criptografia de banco de dados.

### 🗂️ Unit Horse.Connection.SQLite

A **unit Horse.Connection.SQLite** fornece integração com o **Horse** para gerenciar conexões com o banco de dados **SQLite** usando **FireDAC**. Inclui funções para configurar a conexão e aplicar parâmetros específicos de configuração.

#### Funções e Procedimentos

- **SQLiteConnection**
  - **Descrição:** Retorna uma conexão configurada para o banco de dados **SQLite** usando as configurações atuais.
  - **Retorno:** Uma instância de `TFDConnection` configurada para o banco de dados **SQLite**.

- **ApplyDatabaseConfiguration(const AParameter: TSQLiteConfigurationParameter; const AValue: TValue)**
  - **Descrição:** Aplica um parâmetro de configuração ao banco de dados **SQLite** usando um valor genérico.
  - **Parâmetros:**
    - `AParameter`: O parâmetro de configuração a ser aplicado.
    - `AValue`: O valor do parâmetro como `TValue`.

- **ApplyDatabaseConfiguration(const AParameter: TSQLiteConfigurationParameter; const AValue: TSQLiteLockingModeType)**
  - **Descrição:** Aplica um parâmetro de bloqueio ao banco de dados **SQLite**.
  - **Parâmetros:**
    - `AParameter`: O parâmetro de configuração a ser aplicado.
    - `AValue`: O valor do parâmetro como `TSQLiteLockingModeType`.

- **ApplyDatabaseConfiguration(const AParameter: TSQLiteConfigurationParameter; const AValue: TSQLiteOpenModeType)**
  - **Descrição:** Aplica um parâmetro de modo de abertura ao banco de dados **SQLite**.
  - **Parâmetros:**
    - `AParameter`: O parâmetro de configuração a ser aplicado.
    - `AValue`: O valor do parâmetro como `TSQLiteOpenModeType`.

- **ApplyDatabaseConfiguration(const AParameter: TSQLiteConfigurationParameter; const AValue: TSQLiteEncryptType)**
  - **Descrição:** Aplica um parâmetro de criptografia ao banco de dados **SQLite**.
  - **Parâmetros:**
    - `AParameter`: O parâmetro de configuração a ser aplicado.
    - `AValue`: O valor do parâmetro como `TSQLiteEncryptType`.

- **SetConnectionPrefix(const AValue: string)**
  - **Descrição:** Define o prefixo da conexão para o banco de dados **SQLite**.
  - **Parâmetro:**
    - `AValue`: O valor do prefixo.

- **SetDatabase(const AValue: string)**
  - **Descrição:** Define o caminho do banco de dados para o **SQLite**.
  - **Parâmetro:**
    - `AValue`: O caminho do banco de dados.

- **HorseConnectionSQLite(Req: THorseRequest; Res: THorseResponse; Next: TProc)**
  - **Descrição:** Middleware para integração com o **Horse**. Define a conexão com o banco de dados **SQLite** para cada requisição HTTP recebida.
  - **Parâmetros:**
    - `Req`: O objeto de requisição do **Horse**.
    - `Res`: O objeto de resposta do **Horse**.
    - `Next`: O procedimento a ser executado na sequência.

### ⚙️ Finalidade

Esta unit permite a integração com o **Horse**, simplificando o gerenciamento de conexões **SQLite** em aplicações web Delphi.

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests para melhorar este projeto.

## Licença

Este projeto está licenciado sob a **MIT License**. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

