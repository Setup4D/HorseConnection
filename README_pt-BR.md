# 🌐 HorseConnection

**Clique no idioma que deseja para ler este README:** 🇺🇸 [Inglês](https://github.com/ricksolucoes/HorseConnection/blob/main/README.md) | 🇧🇷 [Português](https://github.com/ricksolucoes/HorseConnection/blob/main/README_pt-BR.md) | 🇪🇸 [Espanhol](https://github.com/ricksolucoes/HorseConnection/blob/main/README_ES.md)

**HorseConnection** é um middleware desenvolvido para o framework **Horse**, com o objetivo de simplificar o gerenciamento de conexões com bancos de dados em aplicações **Delphi**. Ele utiliza o gerenciador de pacotes **Boss** para instalar e atualizar dependências automaticamente, proporcionando uma integração rápida e otimizada. Ao oferecer um middleware específico para cada tipo de banco de dados suportado, o **HorseConnection** elimina a necessidade de configurações manuais repetitivas, permitindo que cada endpoint do **Horse** se conecte ao banco de dados de forma automática e eficiente.

## 🎯 Sobre o Projeto

O **HorseConnection** foi criado para atuar como um middleware de integração com o **Horse** — um framework HTTP REST para Delphi — oferecendo suporte a múltiplos bancos de dados de maneira unificada e eficiente. Esse middleware permite que as conexões de banco de dados sejam configuradas uma única vez, eliminando a necessidade de ajustes manuais em cada endpoint.

## 🎯 Objetivo do Middleware

O **HorseConnection** tem como objetivo encapsular toda a lógica de conexão com bancos de dados, proporcionando uma estrutura centralizada que:

🔹 Simplifica o uso de conexões com bancos de dados no **FireDAC**;  

🔹 Reduz a duplicação de código ao evitar configurações repetitivas em cada requisição;  

🔹 Previne vazamentos de conexão em aplicações de alta demanda, garantindo que as conexões sejam gerenciadas de forma eficiente e reutilizável.

## 🚀 Funcionalidades

- **Conexão centralizada e automatizada** com diversos bancos de dados, incluindo PostgreSQL, Firebird, MySQL, SQLite e Advantage Database Server, facilitando a integração com o **Horse**;
- **Instalação e gerenciamento de dependências** simplificados via **Boss**, permitindo uma configuração de middleware rápida e descomplicada;
- **Suporte a múltiplas configurações de conexão**, garantindo que cada banco de dados possa ser configurado conforme suas especificidades, sem a necessidade de ajustes manuais em cada endpoint.

## 🧩 Requisitos

**🔹 Delphi** versão 10.2 ou superior.

**🔹 Boss** como gerenciador de pacotes para Delphi. [Saiba mais sobre o Boss](https://github.com/HashLoad/boss).

**🔹 Horse Framework** para criar aplicações REST em Delphi:

  ```sh
  boss install horse
  ```

## 🛠️ Instalação

Para instalar o **HorseConnection** e suas dependências, execute o seguinte comando com o **Boss**:

```sh
boss install https://github.com/ricksolucoes/HorseConnection
```

A## ⚙️ Como Usar

### 🌐 Utilização de Diretivas de Idioma

Para adaptar o idioma das mensagens de configuração e retorno, o **HorseConnection** utiliza diretivas de compilação, permitindo selecionar entre **Inglês** (padrão), **Português** ou **Espanhol**. Para definir o idioma desejado, adicione uma das diretivas ao projeto:

- Para **Português**:
  ```delphi
  {$DEFINE PORTUGUES}
  ```
- Para **Espanhol**:
  ```delphi
  {$DEFINE ESPANHOL}
  ```

---

### 🔧 Configurando o Middleware

Importe as unidades e defina o middleware para o banco de dados desejado:

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

---

### 🏗️ Configuração do Banco de Dados

Cada banco de dados possui parâmetros específicos que podem ser configurados para melhor atender às necessidades da sua aplicação. Abaixo estão os detalhes de configuração para cada banco de dados suportado.

---

#### ⚙️ Configuração do ADS

Exemplo de configuração para o banco de dados **ADS** usando a função `ApplyDatabaseConfiguration`:

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

- **👤 UserName**: Nome de usuário para autenticação no banco de dados ADS.
- **🔑 Password**: Senha de acesso ao banco de dados ADS.
- **📂 Database**: Caminho completo ou nome do banco de dados no servidor ADS.
- **👀 ShowDelete**: Habilita a visualização de registros excluídos.
- **♻️ Pooled**: Indica se a conexão será gerida como um pool de conexões.
- **📊 PoolMaxItems**: Número máximo de conexões permitidas no pool.
- **⏳ PoolExpireTimeout**: Tempo em segundos para que uma conexão inativa expire.
- **🧹 PoolCleanupTimeout**: Tempo em segundos para a limpeza periódica das conexões expiradas no pool.
- **🔤 CharacterSet**: Define o conjunto de caracteres para a conexão, como "UTF-8" ou "ANSI".
- **💻 ServerType**: Tipo de servidor onde o banco de dados ADS está hospedado.
- **🔌 Protocol**: Protocolo de comunicação usado para conectar-se ao servidor ADS.
- **📋 TableType**: Formato das tabelas usadas no banco de dados ADS.
- **🔒 Locking**: Tipo de bloqueio de dados utilizado no ADS.
- **📁 VendorLib**: Caminho para a biblioteca (DLL) do fornecedor necessária para que o FireDAC se comunique com o ADS.

---

### 🔄 Configuração do Firebird

Exemplo de configuração para o banco de dados **Firebird** usando a função `ApplyDatabaseConfiguration`:

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

- **👤 UserName**: Nome de usuário para autenticação no banco de dados Firebird.
- **🔑 Password**: Senha de acesso ao banco de dados Firebird.
- **📂 Database**: Caminho completo ou nome do banco de dados Firebird.
- **🔌 Protocol**: Protocolo de comunicação com o servidor Firebird.
- **🌐 Server**: Endereço do servidor onde o banco de dados Firebird está hospedado.
- **🔌 Port**: Porta de conexão para o servidor Firebird.
- **🔤 CharacterSet**: Define o conjunto de caracteres para a conexão.
- **🗄 OpenMode**: Modo de abertura do banco de dados.
- **♻️ Pooled**: Define se a conexão será gerida como um pool de conexões.
- **📊 PoolMaxItems**: Número máximo de conexões permitidas no pool.
- **⏳ PoolExpireTimeout**: Tempo em segundos para que uma conexão inativa expire.
- **🧹 PoolCleanupTimeout**: Tempo em segundos para a limpeza periódica das conexões expiradas no pool.

---

### 🔄 Configuração do Banco de Dados MySQL

Aqui está um exemplo de configuração para o banco de dados **MySQL** usando a função `ApplyDatabaseConfiguration`:

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

- **👤 UserName**: Nome de usuário para autenticação no banco de dados MySQL.
- **🔑 Password**: Senha de acesso ao banco de dados MySQL.
- **💾 Database**: Nome do banco de dados MySQL.
- **🌐 Server**: Endereço do servidor MySQL.
- **🔌 Port**: Porta de conexão do MySQL.
- **♻️ Pooled**: Define se a conexão será gerida como um pool de conexões.
- **📊 PoolMaxItems**: Número máximo de conexões permitidas no pool.
- **⏳ PoolExpireTimeout**: Tempo em segundos para que uma conexão inativa expire.
- **🧹 PoolCleanupTimeout**: Tempo em segundos para a limpeza periódica das conexões expiradas no pool.

---

### 🔄 Configuração do Banco de Dados PostgreSQL

Aqui está um exemplo de configuração para o banco de dados **PostgreSQL** usando a função `ApplyDatabaseConfiguration`:

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

- **👤 UserName**: Nome de usuário para autenticação no banco de dados PostgreSQL.
- **🔑 Password**: Senha de acesso ao banco de dados PostgreSQL.
- **💾 Database**: Nome do banco de dados PostgreSQL.
- **🌐 Server**: Endereço do servidor PostgreSQL.
- **🔌 Port**: Porta de conexão do PostgreSQL.
- **♻️ Pooled**: Define se a conexão será gerida como um pool de conexões.
- **📊 PoolMaxItems**: Número máximo de conexões permitidas no pool.
- **⏳ PoolExpireTimeout**: Tempo em segundos para que uma conexão inativa expire.
- **🧹 PoolCleanupTimeout**: Tempo em segundos para a limpeza periódica das conexões expiradas no pool.

---

### 🔄 Configuração do Banco de Dados SQLite

Aqui está um exemplo de configuração para o banco de dados **SQLite** usando a função `ApplyDatabaseConfiguration`:

```delphi
ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.Database, './my_database.sqlite');
ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.Pooled, True);
ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.PoolMaxItems, 50);
ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.PoolExpireTimeout, 90000);
ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.PoolCleanupTimeout, 30000);
```

- **💾 Database**: Caminho do arquivo do banco de dados SQLite.
- **♻️ Pooled**: Define se a conexão será gerida como um pool de conexões.
- **📊 PoolMaxItems**: Número máximo de conexões permitidas no pool.
- **⏳ PoolExpireTimeout**: Tempo em segundos para que uma conexão inativa expire.
- **🧹 PoolCleanupTimeout**: Tempo em segundos para a limpeza periódica das conexões expiradas no pool.

---

## ⚙️ Configuração do Banco de Dados

O método `SetConnectionPrefix` é utilizado para definir um prefixo específico para o pool de conexão, caso necessário. Esse prefixo é especialmente útil ao trabalhar com múltiplos bancos de dados, evitando conflitos entre conexões e garantindo que cada conjunto de conexões seja identificado de forma única. 

```delphi
SetConnectionPrefix(EmptyStr);
```

- **🔖 Prefixo de Conexão**: Define um prefixo para distinguir as conexões no pool, essencial para projetos com múltiplas bases de dados.

O método `SetDatabase` é empregado para especificar o caminho ou o nome do banco de dados, caso necessário. Esse ajuste é fundamental ao trabalhar com múltiplos bancos de dados, assegurando que cada conexão acesse o banco correto e evitando conflitos.

```delphi
SetDatabase(EmptyStr);
```

- **📂 Caminho ou Nome do Banco**: Configura o banco de dados a ser acessado, garantindo a conexão correta em ambientes com várias bases de dados.

## 🛠️ Obtendo a Conexão

Este exemplo demonstra como obter a conexão com o banco de dados configurado pelo middleware, utilizando o enumerado `TConnectionType` para especificar o tipo de conexão desejada. O enumerado `TConnectionType` permite definir o banco de dados, como **ADS**, **FB**, **MySQL**, **PG** ou **SQLite**, garantindo que a conexão seja estabelecida corretamente de acordo com o banco selecionado. No exemplo abaixo, a conexão é obtida com `GetConnection(TConnectionType.PG)`, onde `PG` representa o banco PostgreSQL, facilitando a integração e manutenção de diferentes tipos de bancos de dados no projeto.

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

## 🔍 Obtendo a Query

Este exemplo mostra como obter a Query diretamente utilizando o middleware configurado. Utiliza-se o enumerado `TConnectionType` para especificar o banco de dados desejado, como **ADS**, **FB**, **MySQL**, **PG** ou **SQLite**, facilitando a manutenção e integração de diferentes bancos no projeto. A função `GetQuery` é utilizada para obter a instância do `TFDQuery` já configurada com a conexão apropriada de acordo com o banco de dados selecionado. Isso assegura que a query seja conectada corretamente ao banco especificado, simplificando a implementação e manutenção do projeto.

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

### 🔀 Diferenças entre Conexões

As diferenças entre as conexões no código são evidentes ao usar as funções **GetConnection(TConnectionType)** ou **GetQuery(TConnectionType)**. Essas funções permitem especificar o banco de dados a ser configurado, seja **ADS**, **Firebird**, **MySQL**, **PostgreSQL** ou **SQLite**, garantindo maior flexibilidade e simplicidade ao lidar com diferentes bancos em um único projeto.

## 🧩 Explicação do Código Fonte

### 🗂️ Unit Horse.Connection

A **unit Horse.Connection** fornece funções para gerenciar conexões com bancos de dados utilizando **FireDAC** no middleware **Horse**. O **HorseConnection** permite a liberação de conexões `TFDConnection` ou instâncias de `TFDQuery`, centralizando a lógica de conexão e facilitando o gerenciamento eficiente das conexões dentro das rotas do middleware.

#### 🔍 Funções e Procedimentos

- **GetConnection(AValue: TConnectionType): TFDConnection;**
  - **Descrição:** Obtém uma conexão `TFDConnection` com base no tipo de conexão especificado.
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
  - **Descrição:** Cria e retorna uma instância de `TFDQuery` associada ao tipo de conexão especificado.
  - **Parâmetros:**
    - `AValue`: O tipo de conexão desejado, definido pelo enumerado `TConnectionType`.
  - **Retorno:** Retorna uma instância de `TFDQuery` associada à conexão especificada.
  - **Exceção:** Lança uma exceção se o tipo de conexão não for suportado ou não especificado.

#### 🌐 Middleware 

O middleware **HorseConnection** encapsula a lógica de conexão com bancos de dados, promovendo uma gestão centralizada e reutilizável das conexões `TFDConnection` e `TFDQuery`. Essa abordagem reduz o código repetitivo, pois facilita a criação e liberação de instâncias `TFDConnection` ou `TFDQuery` com a conexão adequada, além de prevenir vazamentos de conexão em aplicações que fazem uso intensivo de bancos de dados.

---

### 🗂️ Unit EnumsHelpersUtils

A **unit EnumsHelpersUtils** define tipos enumerados e configurações de conexão para diferentes bancos de dados (PostgreSQL, ADS, SQLite, Firebird, MySQL) e fornece funções auxiliares para manipulação desses tipos.

#### 🔍 Tipos Enumerados e Estruturas de Configuração

- **TConnectionType**
  - Define os tipos de conexão suportados:
    - `ADS`
    - `FB`
    - `MySQL`
    - `PG`
    - `SQLite`

- **TPGConfiguration**
  - Estrutura de configuração para PostgreSQL.
  - **Função `Default`**: Retorna uma configuração padrão para PostgreSQL.

- **TADSConfiguration**
  - Estrutura de configuração para ADS.
  - **Função `Default`**: Retorna uma configuração padrão para ADS.

- **TSQLiteConfiguration**
  - Estrutura de configuração para SQLite.
  - **Função `Default`**: Retorna uma configuração padrão para SQLite.

- **TFBConfiguration**
  - Estrutura de configuração para Firebird.
  - **Função `Default`**: Retorna uma configuração padrão para Firebird.

- **TMySQLConfiguration**
  - Estrutura de configuração para MySQL.
  - **Função `Default`**: Retorna uma configuração padrão para MySQL.

#### 🔧 Funções Auxiliares

- **ToString**
  - Disponível para cada tipo enumerado, como `TConnectionType`, `TADSServerType`, `TADSCharacterSet`, `TADSProtocol`, entre outros.
  - **Descrição**: Converte o valor do tipo enumerado em uma string representativa.

#### 📄 Exemplo de Uso

```delphi
var
  Config: TPGConfiguration;
begin
  Config := TPGConfiguration.Default;
end;
```

---

### 🗂️ Unit SystemUtils

A **unit SystemUtils** fornece utilitários para operações de sistema, incluindo manipulação de caminhos e lançamento de exceções de tipo inválido.

#### 🔍 Funções e Procedimentos

- **RaiseInvalidTypeException**
  - **Descrição**: Lança uma exceção indicando que um campo possui um tipo incorreto.
  - **Parâmetros**:
    - `AFieldName` (string): Nome do campo com tipo incorreto.
    - `AExpectedType` (string): Tipo esperado para o campo.
  - **Exceção:** Lança uma exceção formatada para identificar erros de tipo em tempo de execução.
  - **Exemplo de Uso**:
    ```delphi
    RaiseInvalidTypeException('NomeCampo', 'Integer');
    ```

- **GetAbsolutePath**
  - **Descrição**: Obtém o caminho absoluto com base em um caminho relativo fornecido.
  - **Parâmetros**:
    - `ARelativePath` (string): Caminho relativo a ser convertido.
  - **Retorno:** Retorna o caminho absoluto correspondente.
  - **Observação**: Se o caminho começar com ".\", será combinado com o diretório do aplicativo; caso contrário, retorna o próprio caminho fornecido.
  - **Exemplo de Uso**:
    ```delphi
    var
      CaminhoAbsoluto: string;
    begin
      CaminhoAbsoluto := GetAbsolutePath('.\diretorio\arquivo.txt');
    end;
    ```

### ⚠️ Exceções

A **unit** utiliza exceções para sinalizar tipos de dados incorretos em `RaiseInvalidTypeException`, permitindo uma validação mais rigorosa dos tipos de campo durante a execução. Essa unit é útil para operações de manipulação de caminhos e validação de tipos, centralizando utilidades comuns para operações de sistema.

## 🧩 Explicação do Código Fonte

### 🗂️ Unit MethodReferencesUtils

A **unit MethodReferencesUtils** define tipos de referência a métodos (procedimentos e funções) para configurações e conexões de banco de dados.

#### 🔍 Tipos

- **TFunctionConnection**
  - **Descrição**: Referência para uma função que retorna uma conexão `TFDConnection`.
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
  - **Uso**: Permite modificar configurações específicas de bancos de dados através de procedimentos parametrizados, facilitando a aplicação de diferentes valores a diversas configurações de maneira flexível e genérica.

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

Esta unit centraliza as referências de métodos para conexões e configurações, facilitando a aplicação de procedimentos de configuração em diferentes contextos de banco de dados. É especialmente útil em sistemas onde múltiplos tipos de banco de dados são utilizados e precisam de configurações específicas.

---

### 🗂️ Unit CharacterSetUtils

A **unit CharacterSetUtils** fornece funções auxiliares para adicionar diferentes conjuntos de caracteres ao dicionário **TDictionary**, permitindo a conversão de tipos de conjunto de caracteres do **Firebird**.

#### 🔍 Funções e Procedimentos

- **AddBasicCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);**
  - **Descrição:** Adiciona conjuntos de caracteres básicos ao dicionário.
  - **Parâmetro:** 
    - `Dictionary`: Dicionário onde os conjuntos de caracteres serão adicionados.

- **AddDOSCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);**
  - **Descrição:** Adiciona conjuntos de caracteres **DOS** ao dicionário.
  - **Parâmetro:** 
    - `Dictionary`: Dicionário onde os conjuntos de caracteres serão adicionados.

- **AddISOCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);**
  - **Descrição:** Adiciona conjuntos de caracteres **ISO** ao dicionário.
  - **Parâmetro:** 
    - `Dictionary`: Dicionário onde os conjuntos de caracteres serão adicionados.

- **AddWinCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);**
  - **Descrição:** Adiciona conjuntos de caracteres **Windows** ao dicionário.
  - **Parâmetro:** 
    - `Dictionary`: Dicionário onde os conjuntos de caracteres serão adicionados.

- **AddMiscellaneousCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);**
  - **Descrição:** Adiciona outros conjuntos de caracteres ao dicionário.
  - **Parâmetro:** 
    - `Dictionary`: Dicionário onde os conjuntos de caracteres serão adicionados.

### ⚙️ Finalidade

Esta unit facilita a configuração e adição de conjuntos de caracteres variados ao dicionário **TDictionary** para manipulação de conjuntos de caracteres no **Firebird**, garantindo suporte a diferentes padrões de codificação.

---

---

### 🗂️ Unit ADSDataBaseConfigurationParameter

A **unit ADSDataBaseConfigurationParameter** fornece métodos para configurar parâmetros específicos de uma instância de `TADSConfiguration`, utilizada para preparar o **FireDAC** (`TFDConnection`) com o driver **ADS** (Advantage Database Server). Essa configuração permite definir valores como tipo de servidor, conjunto de caracteres, protocolo e outras opções de conexão.

#### 🔍 Funções e Procedimentos

- **DatabaseConfig**
  - **Descrição**: Configura parâmetros específicos em uma instância de `TADSConfiguration` com base nos valores fornecidos.
  - **Parâmetros**:
    - `AConfiguration` (var `TADSConfiguration`): Configuração de banco de dados ADS a ser ajustada.
    - `AParameter` (`TADSConfigurationParameter`): Parâmetro de configuração a ser modificado.
    - `AValue` (`TValue`, `TADSServerType`, `TADSCharacterSet`, `TADSProtocol`, `TADSTableType`, `TADSLocking`): Valor a ser aplicado ao parâmetro.
  - **Sobrecargas**:
    - `DatabaseConfig(var AConfiguration: TADSConfiguration; AParameter: TADSConfigurationParameter; const AValue: TValue)`: Configura com valor genérico `TValue`.
    - Configurações específicas para tipo de servidor (`TADSServerType`), conjunto de caracteres (`TADSCharacterSet`), protocolo (`TADSProtocol`), tipo de tabela (`TADSTableType`) e bloqueio (`TADSLocking`).

- **SetDatabase**
  - **Descrição**: Define o caminho do banco de dados na configuração `TADSConfiguration`.
  - **Exemplo**:
    ```delphi
    SetDatabase(MyConfig, 'C:\databases\example.db');
    ```

- **SetUserName** / **SetPassword**
  - Define o nome de usuário e a senha na configuração.

- **SetCharacterSet**
  - Define o conjunto de caracteres (`TADSCharacterSet`).

- **SetPooled**
  - Habilita ou desabilita o pool de conexões.

### ⚠️ Exceções
- **RaiseInvalidTypeException**: Lança exceção ao detectar tipo incorreto, facilitando a depuração.

### ⚙️ Finalidade

Esta unit é essencial para configurar parâmetros de conexão do **FireDAC** com o **ADS**, centralizando procedimentos que permitem ao desenvolvedor ajustar a conexão de maneira modular e consistente.

---

### 🗂️ Unit FBDataBaseConfigurationParameter

A **unit FBDataBaseConfigurationParameter** fornece procedimentos para configurar parâmetros específicos de uma instância de `TFBConfiguration`, usada para preparar o **FireDAC** (`TFDConnection`) com o driver **Firebird**. Essa configuração permite definir valores como protocolo, modo de abertura, conjunto de caracteres e outras opções de conexão para o banco Firebird.

#### 🔍 Funções e Procedimentos

- **DatabaseConfig**
  - **Descrição**: Configura parâmetros específicos em uma instância de `TFBConfiguration` com base nos valores fornecidos.
  - **Parâmetros**:
    - `AConfiguration` (var `TFBConfiguration`): Configuração de banco de dados Firebird a ser ajustada.
    - `AParameter` (`TFBConfigurationParameter`): Parâmetro de configuração a ser modificado.
    - `AValue` (`TValue`, `TFBProtocolType`, `TFBOpenModeType`, `TFBCharacterSetType`): Valor a ser aplicado ao parâmetro.
  - **Sobrecargas**:
    - `DatabaseConfig(var AConfiguration: TFBConfiguration; AParameter: TFBConfigurationParameter; const AValue: TValue)`: Configura com valor genérico `TValue`.
    - Configurações específicas para tipo de protocolo (`TFBProtocolType`), modo de abertura (`TFBOpenModeType`) e conjunto de caracteres (`TFBCharacterSetType`).

- **SetDatabase**
  - **Descrição**: Define o caminho do banco de dados na configuração `TFBConfiguration`.
  - **Exemplo**:
    ```delphi
    SetDatabase(MyConfig, 'C:\databases\example.fdb');
    ```

- **SetUserName** / **SetPassword**
  - Define o nome de usuário e a senha na configuração.

- **SetProtocol**
  - Define o protocolo de conexão (`TFBProtocolType`).

- **SetOpenMode**
  - Define o modo de abertura (`TFBOpenModeType`).

- **SetCharacterSet**
  - Define o conjunto de caracteres (`TFBCharacterSetType`).

- **SetPooled**
  - Habilita ou desabilita o pool de conexões.

### ⚠️ Exceções
- **RaiseInvalidTypeException**: Lança exceção ao detectar tipo incorreto, facilitando a depuração.

### ⚙️ Finalidade

A **unit FBDataBaseConfigurationParameter** é essencial para configurar parâmetros de conexão do **FireDAC** com o **Firebird**, centralizando procedimentos que permitem ao desenvolvedor ajustar a conexão com o banco de forma modular e consistente, incluindo características de protocolo, conjunto de caracteres e outros parâmetros técnicos.

---

### 🗂️ Unit `MySQLDataBaseConfigurationParameter`

A **unit MySQLDataBaseConfigurationParameter** oferece procedimentos para configurar parâmetros específicos de uma instância de `TMySQLConfiguration`, utilizada na configuração do FireDAC (`TFDConnection`) com o driver MySQL. Essa unit possibilita a definição de valores como servidor, porta, biblioteca do fornecedor e opções de pooling de conexão para o banco de dados MySQL.

#### 🔧 Funções e Procedimentos

- **DatabaseConfig**
  - **Descrição**: Configura parâmetros específicos em uma instância de `TMySQLConfiguration` com base nos valores fornecidos.
  - **Parâmetros**:
    - `AConfiguration` (var `TMySQLConfiguration`): Configuração do banco de dados MySQL a ser modificada.
    - `AParameter` (`TMySQLConfigurationParameter`): Parâmetro de configuração a ser ajustado.
    - `AValue` (`TValue`): Valor genérico a ser aplicado ao parâmetro.
  - **Exemplo**:
    ```delphi
    DatabaseConfig(MyConfig, TMySQLConfigurationParameter.Database, 'database_name');
    ```

- **SetDatabase**
  - **Descrição**: Define o caminho do banco de dados na configuração MySQL.
  - **Parâmetros**:
    - `AConfiguration` (var `TMySQLConfiguration`): Configuração a ser alterada.
    - `AValue` (`TValue`): Caminho do banco de dados em formato `string`.

- **SetUserName** / **SetPassword**
  - **Descrição**: Define o nome de usuário e a senha para a conexão MySQL.
  - **Parâmetros**:
    - `AConfiguration` (var `TMySQLConfiguration`): Configuração a ser alterada.
    - `AValue` (`TValue`): Nome do usuário ou senha.

- **SetServer**
  - **Descrição**: Define o endereço do servidor MySQL.
  - **Parâmetros**:
    - `AConfiguration` (var `TMySQLConfiguration`): Configuração a ser alterada.
    - `AValue` (`TValue`): Endereço do servidor.

- **SetVendorLib**
  - **Descrição**: Especifica a biblioteca do fornecedor para a conexão MySQL.
  - **Parâmetros**:
    - `AConfiguration` (var `TMySQLConfiguration`): Configuração a ser alterada.
    - `AValue` (`TValue`): Caminho da biblioteca do fornecedor.

- **SetPort**
  - **Descrição**: Define a porta do servidor MySQL.
  - **Parâmetros**:
    - `AConfiguration` (var `TMySQLConfiguration`): Configuração a ser alterada.
    - `AValue` (`TValue`): Número da porta.

- **SetPooled**
  - **Descrição**: Habilita ou desabilita o pool de conexões.
  - **Parâmetros**:
    - `AConfiguration` (var `TMySQLConfiguration`): Configuração a ser alterada.
    - `AValue` (`TValue`): Valor booleano que indica o estado do pooling de conexão.

- **SetPoolMaxItems** / **SetPoolExpireTimeout** / **SetPoolCleanupTimeout**
  - **Descrição**: Define o número máximo de conexões, o tempo de expiração e o tempo de limpeza do pool de conexões.
  - **Parâmetros**:
    - `AConfiguration` (var `TMySQLConfiguration`): Configuração a ser alterada.
    - `AValue` (`TValue`): Número máximo de conexões ou tempo (em milissegundos) de expiração/limpeza.

### ⚠️ Exceções
- **RaiseInvalidTypeException**: Lança uma exceção se o tipo de valor fornecido não corresponder ao esperado pelo parâmetro, facilitando a detecção de problemas de tipo em tempo de execução.

### ⚙️ Finalidade

A **unit MySQLDataBaseConfigurationParameter** centraliza a configuração do FireDAC para MySQL, simplificando o ajuste modular de opções de conexão como servidor, pooling de conexões e autenticação.

---

### 🗂️ Unit `PGDataBaseConfigurationParameter`

A **unit PGDataBaseConfigurationParameter** oferece procedimentos para configurar parâmetros específicos de uma instância de `TPGConfiguration`, utilizada na configuração do FireDAC (`TFDConnection`) com o driver PostgreSQL. Esta unit permite definir valores como servidor, porta, banco de dados, nome de usuário, senha, conjunto de caracteres e opções de pooling de conexões para PostgreSQL.

#### 🔧 Funções e Procedimentos

- **DatabaseConfig**
  - **Descrição**: Configura um parâmetro específico em uma instância de `TPGConfiguration` de acordo com o valor fornecido.
  - **Parâmetros**:
    - `AConfiguration` (var `TPGConfiguration`): Configuração do banco de dados PostgreSQL a ser modificada.
    - `AParameter` (`TPGConfigurationParameter`): Parâmetro de configuração a ser ajustado.
    - `AValue` (`TValue`): Valor genérico a ser aplicado ao parâmetro.
  - **Exemplo**:
    ```delphi
    DatabaseConfig(PGConfig, TPGConfigurationParameter.Server, 'localhost');
    ```

- **SetServer** / **SetPort**
  - **Descrição**: Define o endereço do servidor e a porta na configuração PostgreSQL.
  - **Parâmetros**:
    - `AConfiguration` (var `TPGConfiguration`): Configuração a ser alterada.
    - `AValue` (`TValue`): Endereço do servidor ou número da porta.

- **SetDatabase** / **SetUserName** / **SetPassword**
  - **Descrição**: Define o banco de dados, o nome de usuário e a senha para a conexão PostgreSQL.
  - **Parâmetros**:
    - `AConfiguration` (var `TPGConfiguration`): Configuração a ser alterada.
    - `AValue` (`TValue`): Nome do banco de dados, nome de usuário ou senha.

- **SetCharacterSet**
  - **Descrição**: Define o conjunto de caracteres na configuração PostgreSQL.
  - **Parâmetros**:
    - `AConfiguration` (var `TPGConfiguration`): Configuração a ser alterada.
    - `AValue` (`TValue`): Conjunto de caracteres.

- **SetPooled**
  - **Descrição**: Habilita ou desabilita o pool de conexões.
  - **Parâmetros**:
    - `AConfiguration` (var `TPGConfiguration`): Configuração a ser alterada.
    - `AValue` (`TValue`): Valor booleano para o estado do pool de conexão.

- **SetPoolMaxItems** / **SetPoolExpireTimeout** / **SetPoolCleanupTimeout**
  - **Descrição**: Define o número máximo de conexões, o tempo de expiração e o tempo de limpeza do pool de conexões.
  - **Parâmetros**:
    - `AConfiguration` (var `TPGConfiguration`): Configuração a ser alterada.
    - `AValue` (`TValue`): Número máximo de conexões ou tempo (em milissegundos) de expiração/limpeza.

### ⚠️ Exceções
- **RaiseInvalidTypeException**: Lança uma exceção se o tipo de valor fornecido não corresponder ao esperado pelo parâmetro, garantindo que a configuração seja aplicada corretamente.

### ⚙️ Finalidade

A **unit PGDataBaseConfigurationParameter** centraliza a configuração do FireDAC para PostgreSQL, permitindo o ajuste modular de opções de conexão como servidor, autenticação e pooling de conexões.

---

### 🗂️ Unit `SQLiteDataBaseConfigurationParameter`

A unidade **`SQLiteDataBaseConfigurationParameter`** oferece procedimentos específicos para configurar uma instância de `TSQLiteConfiguration`, usada para ajustar o `TFDConnection` do FireDAC ao driver SQLite. Com esta unidade, é possível definir parâmetros como o modo de bloqueio, modo de abertura, tipo de criptografia, entre outros, otimizando a conexão com o banco de dados SQLite.

#### 🔧 Funções e Procedimentos

- **DatabaseConfig** (Sobrecargas)
  - **Descrição**: Configura um parâmetro específico em uma instância de `TSQLiteConfiguration`, ajustando-o conforme o tipo de valor fornecido.

  - **Sobrecarga 1** – Parâmetro Genérico
    - **Parâmetros**:
      - `AConfiguration` (var `TSQLiteConfiguration`): A configuração do banco de dados SQLite a ser modificada.
      - `AParameter` (`TSQLiteConfigurationParameter`): O parâmetro de configuração a ser ajustado.
      - `AValue` (`TValue`): Valor genérico aplicado ao parâmetro.
    - **Exemplo**:
      ```delphi
      DatabaseConfig(SQLiteConfig, TSQLiteConfigurationParameter.Database, 'caminho_do_banco');
      ```

  - **Sobrecarga 2** – Modo de Bloqueio
    - **Parâmetros**:
      - `AConfiguration` (var `TSQLiteConfiguration`): A configuração do banco de dados SQLite.
      - `AParameter` (`TSQLiteConfigurationParameter`): Parâmetro que define o modo de bloqueio.
      - `AValue` (`TSQLiteLockingModeType`): Valor do tipo de bloqueio a ser aplicado.
    - **Exemplo**:
      ```delphi
      DatabaseConfig(SQLiteConfig, TSQLiteConfigurationParameter.LockingMode, lmNormal);
      ```

  - **Sobrecarga 3** – Modo de Abertura
    - **Parâmetros**:
      - `AConfiguration` (var `TSQLiteConfiguration`): A configuração do banco de dados SQLite.
      - `AParameter` (`TSQLiteConfigurationParameter`): Parâmetro que define o modo de abertura.
      - `AValue` (`TSQLiteOpenModeType`): Valor do tipo de abertura a ser aplicado.
    - **Exemplo**:
      ```delphi
      DatabaseConfig(SQLiteConfig, TSQLiteConfigurationParameter.OpenMode, omReadWrite);
      ```

  - **Sobrecarga 4** – Tipo de Criptografia
    - **Parâmetros**:
      - `AConfiguration` (var `TSQLiteConfiguration`): A configuração do banco de dados SQLite.
      - `AParameter` (`TSQLiteConfigurationParameter`): Parâmetro que define o tipo de criptografia.
      - `AValue` (`TSQLiteEncryptType`): Tipo de criptografia a ser aplicado.
    - **Exemplo**:
      ```delphi
      DatabaseConfig(SQLiteConfig, TSQLiteConfigurationParameter.Encrypt, etAES256);
      ```

#### 🔐 Parâmetros Específicos de Conexão

- **SetDatabase**
  - **Descrição**: Define o caminho do banco de dados na configuração SQLite.
  - **Exemplo**:
    ```delphi
    SetDatabase(SQLiteConfig, 'caminho_do_banco');
    ```

- **SetUserName** / **SetPassword**
  - **Descrição**: Configura o nome de usuário e a senha para autenticação na conexão SQLite.

- **SetPooled**
  - **Descrição**: Define se o pool de conexões está habilitado.

- **SetPoolMaxItems** / **SetPoolExpireTimeout** / **SetPoolCleanupTimeout**
  - **Descrição**: Configura o número máximo de conexões, o tempo de expiração e o tempo de limpeza para o pool de conexões.

### ⚠️ Exceções
- `RaiseInvalidTypeException`: Lança uma exceção quando o tipo do valor fornecido não corresponde ao esperado pelo parâmetro de configuração, ajudando a garantir a consistência dos dados e facilitando a identificação de erros de tipo.

### ⚙️ Finalidade

A unidade `SQLiteDataBaseConfigurationParameter` centraliza a configuração do FireDAC para SQLite, oferecendo uma interface flexível e modular para definir o caminho do banco de dados, parâmetros de autenticação e opções de pooling, otimizando o gerenciamento de conexões com o SQLite.


---

### 🗂️ Unidade `ADSDatabaseConfigurationManager`

A unidade **`ADSDatabaseConfigurationManager`** oferece funções e procedimentos essenciais para configurar e inicializar conexões com o banco de dados **ADS (Advantage Database Server)** usando o **FireDAC** (`TFDConnection`). Ela permite definir parâmetros de conexão, prefixos personalizados e gerenciar definições de conexão no gerenciador **FireDAC**.

#### 🔧 Funções e Procedimentos

- **Initialize(const AConfiguration: TADSConfiguration; const ADatabase: string; const APrefix: string);**
  - **Descrição:** Inicializa uma conexão com o banco de dados **ADS** utilizando configurações específicas, um nome personalizado para o banco de dados e um prefixo no gerenciador **FireDAC**.
  - **Parâmetros:**
    - `AConfiguration`: Parâmetros de configuração da conexão ADS.
    - `ADatabase`: Nome customizado do banco de dados.
    - `APrefix`: Prefixo de identificação para a definição da conexão.

- **Initialize(const AConfiguration: TADSConfiguration; const APrefix: string);**
  - **Descrição:** Inicializa uma conexão com o banco de dados **ADS** com as configurações e um prefixo personalizado.
  - **Parâmetros:**
    - `AConfiguration`: Parâmetros de configuração da conexão ADS.
    - `APrefix`: Prefixo para identificação da conexão.

- **Initialize(const AConfiguration: TADSConfiguration);**
  - **Descrição:** Inicializa a conexão com o banco de dados **ADS** com as configurações básicas especificadas.
  - **Parâmetro:**
    - `AConfiguration`: Parâmetros de configuração ADS.

- **GetConnectionDef(const APrefix: string): string;**
  - **Descrição:** Retorna o nome da definição de conexão no gerenciador **FireDAC** com um prefixo específico.
  - **Parâmetro:**
    - `APrefix`: Prefixo para a definição da conexão.
  - **Retorno:** Nome da definição de conexão personalizada.

- **GetConnectionDef: string;**
  - **Descrição:** Obtém o nome da definição de conexão padrão no gerenciador **FireDAC**.
  - **Retorno:** Nome da definição de conexão padrão.

- **CreateConnectionParameters(const AConfiguration: TADSConfiguration; const ADatabase: string): TStrings;**
  - **Descrição:** Gera uma lista de parâmetros de conexão para o banco de dados **ADS** com base nas configurações fornecidas.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco **ADS**.
    - `ADatabase`: Nome do banco de dados.
  - **Retorno:** Lista com os parâmetros de configuração.

- **EnsureFDManagerInitialized;**
  - **Descrição:** Garante a inicialização do gerenciador **FireDAC**.

- **ConfigureFDManager;**
  - **Descrição:** Configura o gerenciador **FireDAC** com opções necessárias para suporte a reconexão.

---

### 🗂️ Unidade `ADSDataBaseConnectionManager`

A unidade **`ADSDataBaseConnectionManager`** possibilita o gerenciamento de conexões reutilizáveis com o banco de dados **Advantage Database Server (ADS)** utilizando **FireDAC**. Ela permite criar conexões personalizadas e gerenciar o pool de conexões para maximizar a eficiência.

#### 🔧 Funções e Procedimentos

- **GetConnection(const AConfiguration: TADSConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão configurada com o banco **ADS**, com base nas configurações, no nome do banco e no prefixo especificados.
  - **Parâmetros:**
    - `AConfiguration`: Parâmetros de configuração do banco **ADS**.
    - `ADatabase`: Nome do banco.
    - `APrefix`: Prefixo de identificação da conexão.
  - **Retorno:** Instância de `TFDConnection` configurada.

- **GetConnection(const AConfiguration: TADSConfiguration; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão configurada com o banco **ADS** com base nas configurações e no prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Parâmetros de configuração do banco **ADS**.
    - `APrefix`: Prefixo da conexão.
  - **Retorno:** Instância de `TFDConnection`.

- **GetConnection(const AConfiguration: TADSConfiguration): TFDConnection;**
  - **Descrição:** Retorna uma conexão configurada somente com os parâmetros do banco **ADS**.
  - **Parâmetro:** 
    - `AConfiguration`: Parâmetros de configuração **ADS**.
  - **Retorno:** Instância de `TFDConnection`.

- **SetupConnection(const AConfiguration: TADSConfiguration; const ADatabase: string; const APrefix: string; var AConnection: TFDConnection);**
  - **Descrição:** Configura uma conexão com o banco **ADS** com base nos parâmetros e no prefixo fornecidos.
  - **Parâmetros:**
    - `AConfiguration`: Configurações **ADS**.
    - `ADatabase`: Nome do banco.
    - `APrefix`: Prefixo da conexão.
    - `AConnection`: Instância da conexão a ser configurada.
  - **Exceção:** Lança uma exceção se a biblioteca (`VendorLib`) especificada não for encontrada.

---

### 🗂️ Unidade `Horse.Connection.ADS`

A unidade **`Horse.Connection.ADS`** facilita a integração do framework **Horse** com o banco de dados **Advantage Database Server (ADS)** usando **FireDAC**. Ela fornece métodos para configurar e aplicar parâmetros de conexão.

#### 🔧 Funções e Procedimentos

- **ADSConnection: TFDConnection;**
  - **Descrição:** Obtém uma conexão configurada com o banco **ADS** com as configurações atuais.
  - **Retorno:** Instância de `TFDConnection` para o banco **ADS**.

- **ApplyDatabaseConfiguration** (várias sobrecargas para diferentes tipos)
  - **Descrição:** Aplica parâmetros de configuração ao banco de dados **ADS**. Os tipos de configuração incluem `TADSServerType`, `TADSCharacterSet`, `TADSProtocol`, entre outros.
  - **Parâmetros:** 
    - `AParameter`: Parâmetro de configuração específico.
    - `Value`: Valor do parâmetro no tipo esperado.

- **SetConnectionPrefix(const AValue: string);**
  - **Descrição:** Define o prefixo da conexão para o banco **ADS**.
  - **Parâmetro:** 
    - `AValue`: Valor do prefixo.

- **SetDatabase(const AValue: string);**
  - **Descrição:** Define o caminho do banco de dados para **ADS**.
  - **Parâmetro:** 
    - `AValue`: Caminho do banco.

- **HorseConnectionADS(Req: THorseRequest; Res: THorseResponse; Next: TProc);**
  - **Descrição:** Middleware para integração com o framework **Horse**. Define a conexão com o banco **ADS** para cada requisição.
  - **Parâmetros:**
    - `Req`: Objeto de requisição do **Horse**.
    - `Res`: Objeto de resposta do **Horse**.
    - `Next`: Procedimento a ser executado na sequência.

---

### ⚠️ Exceções
- **RaiseInvalidTypeException**: Lança uma exceção ao detectar tipos incompatíveis de parâmetros de configuração, facilitando a identificação e a resolução de erros.


---

### 🗂️ **Unit `FBDatabaseConfigurationManager`**

A **unit `FBDatabaseConfigurationManager`** oferece funções para gerenciar configurações de conexão com o banco de dados **Firebird** utilizando **FireDAC**. Ela permite criar definições de conexão personalizadas e reutilizáveis, otimizando a gestão de conexões.

#### 🔧 **Funções e Procedimentos**

- **Initialize(const AConfiguration: TFBConfiguration; const ADatabase: string; const APrefix: string);**
  - **Descrição:** Inicializa a configuração do **FireDAC** para o banco de dados **Firebird**, com base nas configurações fornecidas, no nome do banco de dados e no prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações de conexão para o banco de dados **Firebird**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo utilizado para identificar a conexão.

- **Initialize(const AConfiguration: TFBConfiguration; const APrefix: string);**
  - **Descrição:** Inicializa a configuração do **FireDAC** para o banco de dados **Firebird**, com base nas configurações fornecidas e no prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações de conexão para o banco de dados **Firebird**.
    - `APrefix`: Prefixo utilizado para identificar a conexão.

- **Initialize(const AConfiguration: TFBConfiguration);**
  - **Descrição:** Inicializa a configuração do **FireDAC** para o banco de dados **Firebird**, usando apenas as configurações fornecidas.
  - **Parâmetro:** 
    - `AConfiguration`: Configurações de conexão para o banco de dados **Firebird**.

- **GetConnectionDef(const APrefix: string): string;**
  - **Descrição:** Retorna o nome da definição de conexão com base no prefixo fornecido.
  - **Parâmetro:**
    - `APrefix`: Prefixo utilizado para identificar a conexão.
  - **Retorno:** Nome da definição de conexão.

- **GetConnectionDef: string;**
  - **Descrição:** Retorna o nome da definição de conexão padrão.
  - **Retorno:** Nome da definição de conexão padrão.

- **CreateConnectionParameters(const AConfiguration: TFBConfiguration; const ADatabase: string): TStrings;**
  - **Descrição:** Cria uma lista de parâmetros de conexão para o banco de dados **Firebird**, com base nas configurações fornecidas.
  - **Parâmetros:**
    - `AConfiguration`: Configurações de conexão para o banco de dados **Firebird**.
    - `ADatabase`: Nome do banco de dados.
  - **Retorno:** Lista de parâmetros de conexão, representada por um conjunto de `TStrings`.

- **EnsureFDManagerInitialized;**
  - **Descrição:** Garante que o **FireDAC Manager** esteja devidamente inicializado.

- **ConfigureFDManager;**
  - **Descrição:** Configura o **FireDAC Manager** com as opções necessárias para a reconexão automática.

### ⚙️ **Finalidade**

Esta **unit** é essencial para gerenciar e personalizar conexões com o banco de dados **Firebird**, centralizando definições de conexão e facilitando a reutilização e manutenção das configurações no **FireDAC**.

___

### 🗂️ **Unit `FBDatabaseConnectionManager`**

A **unit `FBDatabaseConnectionManager`** oferece funções para gerenciar conexões com o banco de dados **Firebird** utilizando **FireDAC**. Ela permite criar conexões reutilizáveis e personalizadas, além de gerenciar um pool de conexões.

#### 🔧 **Funções e Procedimentos**

- **GetConnection(const AConfiguration: TFBConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão configurada com o banco de dados **Firebird**, com base nas configurações fornecidas, no nome do banco de dados e no prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **Firebird**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo utilizado para identificar a conexão.
  - **Retorno:** Instância configurada de `TFDConnection`.

- **GetConnection(const AConfiguration: TFBConfiguration; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão configurada com o banco de dados **Firebird**, com base nas configurações fornecidas e no prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **Firebird**.
    - `APrefix`: Prefixo utilizado para identificar a conexão.
  - **Retorno:** Instância configurada de `TFDConnection`.

- **GetConnection(const AConfiguration: TFBConfiguration): TFDConnection;**
  - **Descrição:** Retorna uma conexão configurada com o banco de dados **Firebird**, baseada apenas nas configurações fornecidas.
  - **Parâmetro:** 
    - `AConfiguration`: Configurações do banco de dados **Firebird**.
  - **Retorno:** Instância configurada de `TFDConnection`.

- **DefaultConnection(const AConfiguration: TFBConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão padrão com o banco de dados **Firebird**. Se uma conexão padrão já existir, ela será reutilizada.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **Firebird**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo utilizado para identificar a conexão.
  - **Retorno:** Instância configurada de `TFDConnection`.

- **CustomConnection(const AConfiguration: TFBConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão personalizada com o banco de dados **Firebird**. Caso uma conexão com o prefixo fornecido já exista, ela será retornada.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **Firebird**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo utilizado para identificar a conexão.
  - **Retorno:** Instância configurada de `TFDConnection`.

- **SetupConnection(const AConfiguration: TFBConfiguration; const ADatabase: string; const APrefix: string; var AConnection: TFDConnection);**
  - **Descrição:** Configura uma conexão com o banco de dados **Firebird** com base nas configurações e parâmetros fornecidos.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **Firebird**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo utilizado para identificar a conexão.
    - `AConnection`: A conexão a ser configurada.

### ⚙️ **Finalidade**

Esta **unit** é fundamental para gerenciar conexões com o banco de dados **Firebird**, centralizando o controle de conexões padrão e personalizadas. Ela garante a reutilização eficiente através da gestão de um pool de conexões.

___

### 🗂️ **Unit `Horse.Connection.FB`**

A **unit `Horse.Connection.FB`** proporciona integração com o framework **Horse**, permitindo o gerenciamento de conexões com o banco de dados **Firebird** usando **FireDAC**. Ela inclui funções para configurar a conexão e aplicar parâmetros específicos.

#### 🔧 **Funções e Procedimentos**

- **FBConnection: TFDConnection;**
  - **Descrição:** Retorna uma conexão configurada para o banco de dados **Firebird** utilizando as configurações atuais.
  - **Retorno:** Instância de `TFDConnection` configurada para o banco de dados **Firebird**.

- **ApplyDatabaseConfiguration(const AParameter: TFBConfigurationParameter; const Value: TValue);**
  - **Descrição:** Aplica um parâmetro de configuração ao banco de dados **Firebird** utilizando um valor genérico.
  - **Parâmetros:**
    - `AParameter`: O parâmetro de configuração a ser aplicado.
    - `Value`: O valor do parâmetro como `TValue`.

- **ApplyDatabaseConfiguration(const AParameter: TFBConfigurationParameter; const Value: TFBProtocolType);**
  - **Descrição:** Aplica um parâmetro de tipo de protocolo ao banco de dados **Firebird**.
  - **Parâmetros:**
    - `AParameter`: O parâmetro de configuração a ser

 aplicado.
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
  - **Descrição:** Define o prefixo da conexão com o banco de dados **Firebird**.
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

---

### ⚙️ **Finalidade**

Esta **unit** facilita a integração do banco de dados **Firebird** com o framework **Horse**, permitindo que cada requisição HTTP utilize uma conexão configurada de maneira otimizada e flexível, com suporte a parâmetros específicos e personalizados.

---

### 🗂️ **Unit MySQLDatabaseConfigurationManager**

A unit `MySQLDatabaseConfigurationManager` oferece métodos para gerenciar configurações de conexão com o banco de dados **MySQL** utilizando **FireDAC**. Essa unit permite definir configurações reutilizáveis e customizadas, facilitando o uso e a manutenção de conexões com o MySQL em diferentes contextos.

#### 🔧 **Principais Funções e Procedimentos**

- **Initialize(const AConfiguration: TMySQLConfiguration; const ADatabase: string; const APrefix: string);**
  - **Descrição:** Inicializa as configurações do FireDAC para uma conexão com o **MySQL**, utilizando as configurações fornecidas, um nome de banco de dados e um prefixo específico.
  - **Parâmetros:**
    - `AConfiguration`: Configurações de conexão para o MySQL.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo que identifica a conexão no FireDAC Manager.

- **Initialize(const AConfiguration: TMySQLConfiguration; const APrefix: string);**
  - **Descrição:** Configura a conexão do FireDAC para o **MySQL** usando as configurações especificadas e um prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações de conexão para o MySQL.
    - `APrefix`: Prefixo para a conexão.

- **Initialize(const AConfiguration: TMySQLConfiguration);**
  - **Descrição:** Configura a conexão do FireDAC para o **MySQL** utilizando apenas as configurações fornecidas.
  - **Parâmetro:** 
    - `AConfiguration`: Configurações de conexão para o MySQL.

- **GetConnectionDef(const APrefix: string): string;**
  - **Descrição:** Retorna o nome da definição de conexão com base no prefixo informado.
  - **Parâmetro:**
    - `APrefix`: Prefixo usado na definição de conexão.
  - **Retorno:** Nome da definição de conexão com o prefixo aplicado.

- **CreateConnectionParameters(const AConfiguration: TMySQLConfiguration; const ADatabase: string): TStrings;**
  - **Descrição:** Gera uma lista de parâmetros de conexão para o **MySQL** com base nas configurações fornecidas.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **MySQL**.
    - `ADatabase`: Nome do banco de dados.
  - **Retorno:** Lista de parâmetros de conexão.

#### 🔄 **Controle de Inicialização e Finalização**

- **EnsureFDManagerInitialized**
  - **Descrição:** Garante que o FireDAC Manager esteja ativo e inicializado.

- **ConfigureFDManager**
  - **Descrição:** Configura o FireDAC Manager com as opções necessárias para a conexão.

### ⚙️ **Objetivo Geral**

Esta unit centraliza e facilita o gerenciamento de conexões com o **MySQL** no FireDAC, permitindo configurar conexões personalizadas e reutilizáveis para diferentes cenários e ambientes, promovendo uma administração eficiente de recursos.

---

### 🗂️ **Unit MySQLDatabaseConnectionManager**

A unit `MySQLDatabaseConnectionManager` oferece funções para gerenciar conexões com o banco de dados **MySQL** utilizando **FireDAC**. Ela permite a criação de conexões customizadas, gerencia um pool de conexões e promove a reutilização dos recursos de conexão.

#### 🔧 **Funções e Procedimentos**

- **GetConnection(const AConfiguration: TMySQLConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão com o **MySQL** com base nas configurações fornecidas, incluindo o nome do banco de dados e o prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações para o banco de dados **MySQL**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo que identifica a conexão.
  - **Retorno:** Instância configurada de `TFDConnection`.

- **DefaultConnection(const AConfiguration: TMySQLConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão padrão para o **MySQL**; caso uma conexão já esteja ativa, a mesma será reutilizada.
  - **Parâmetros:**
    - `AConfiguration`: Configurações para o banco de dados **MySQL**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo para a conexão.
  - **Retorno:** Instância configurada de `TFDConnection`.

- **CustomConnection(const AConfiguration: TMySQLConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão personalizada com o **MySQL**; caso uma conexão já exista para o prefixo, será reutilizada.
  - **Parâmetros:**
    - `AConfiguration`: Configurações para o banco de dados **MySQL**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo para a conexão.
  - **Retorno:** Instância configurada de `TFDConnection`.

### ⚙️ **Objetivo Geral**

Esta unit centraliza a criação e o controle de conexões **MySQL** via FireDAC, promovendo a reutilização e a eficiência por meio do gerenciamento de um pool de conexões.

---

### 🗂️ **Unit Horse.Connection.MySQL**

A unit `Horse.Connection.MySQL` fornece uma integração com o framework **Horse** para gerenciar conexões com o banco de dados **MySQL** via **FireDAC**. Esta integração inclui funções para configuração da conexão e ajuste de parâmetros específicos.

#### 🔧 **Funções e Procedimentos**

- **MySQLConnection**
  - **Descrição:** Retorna uma conexão configurada para o **MySQL** com as definições atuais.
  - **Retorno:** Instância configurada de `TFDConnection` para o banco de dados **MySQL**.

- **ApplyDatabaseConfiguration(const AParameter: TMySQLConfigurationParameter; const Value: TValue)**
  - **Descrição:** Aplica um parâmetro de configuração ao banco de dados **MySQL** utilizando um valor genérico.
  - **Parâmetros:**
    - `AParameter`: O parâmetro de configuração a ser aplicado.
    - `Value`: O valor do parâmetro como `TValue`.

- **SetConnectionPrefix(const AValue: string)**
  - **Descrição:** Define o prefixo da conexão para o banco de dados **MySQL**.
  - **Parâmetro:**
    - `AValue`: Valor do prefixo para a conexão.

- **HorseConnectionMySQL(Req: THorseRequest; Res: THorseResponse; Next: TProc)**
  - **Descrição:** Middleware para integração com o **Horse**. Define a conexão com o **MySQL** para cada requisição HTTP.
  - **Parâmetros:**
    - `Req`: Objeto de requisição do **Horse**.
    - `Res`: Objeto de resposta do **Horse**.
    - `Next`: Procedimento a ser executado após a configuração da conexão.

### ⚙️ **Objetivo Geral**

A unit promove uma integração eficiente com o framework **Horse**, facilitando o gerenciamento de conexões **MySQL** em aplicações web desenvolvidas em Delphi.


---

### 🗂️ **Unit PGDatabaseConfigurationManager**

A **unit PGDatabaseConfigurationManager** oferece funções especializadas para o gerenciamento de configurações de conexão com o banco de dados **PostgreSQL** utilizando **FireDAC**. Ela possibilita a criação de definições de conexão flexíveis e reutilizáveis, atendendo a diferentes cenários de integração.

#### 🔧 **Funções e Procedimentos**

- **Initialize(const AConfiguration: TPGConfiguration; const ADatabase: string; const APrefix: string);**
  - **Descrição:** Inicializa a configuração do **FireDAC** para o banco de dados **PostgreSQL** utilizando as configurações fornecidas, o nome do banco de dados e o prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações detalhadas do banco de dados **PostgreSQL**.
    - `ADatabase`: Nome da base de dados.
    - `APrefix`: Prefixo utilizado na definição da conexão.
  
- **Initialize(const AConfiguration: TPGConfiguration; const APrefix: string);**
  - **Descrição:** Inicializa a configuração do **FireDAC** para o banco de dados **PostgreSQL** com base nas configurações fornecidas e um prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **PostgreSQL**.
    - `APrefix`: Prefixo para a definição da conexão.

- **Initialize(const AConfiguration: TPGConfiguration);**
  - **Descrição:** Inicializa a configuração do **FireDAC** para o banco de dados **PostgreSQL** com as configurações fornecidas, sem a necessidade de prefixo.
  - **Parâmetro:** 
    - `AConfiguration`: Configurações do banco de dados **PostgreSQL**.

- **GetConnectionDef(const APrefix: string): string;**
  - **Descrição:** Retorna o nome da definição de conexão baseada no prefixo especificado.
  - **Parâmetro:**
    - `APrefix`: Prefixo para identificar a conexão.
  - **Retorno:** Nome da definição de conexão com o prefixo especificado.

- **GetConnectionDef: string;**
  - **Descrição:** Retorna o nome da definição de conexão padrão, sem considerar prefixos.
  - **Retorno:** Nome da definição de conexão padrão.

- **CreateConnectionParameters(const AConfiguration: TPGConfiguration; const ADatabase: string): TStrings;**
  - **Descrição:** Cria uma lista de parâmetros de conexão para o banco de dados **PostgreSQL** com base nas configurações fornecidas.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **PostgreSQL**.
    - `ADatabase`: Nome do banco de dados.
  - **Retorno:** Lista de parâmetros de conexão configurados.

- **EnsureFDManagerInitialized;**
  - **Descrição:** Garante que o gerenciador **FireDAC** esteja devidamente inicializado, pronto para o uso.

- **ConfigureFDManager;**
  - **Descrição:** Configura o gerenciador **FireDAC** com as opções necessárias para garantir reconexão automática em caso de falha.

### ⚙️ **Finalidade**

Esta **unit** centraliza a configuração de conexões com o banco de dados **PostgreSQL**, permitindo ajustes modulares de opções de conexão, como servidor, autenticação e pooling. Essa abordagem facilita a manutenção e o gerenciamento de conexões em aplicações de larga escala.

---

### 🗂️ **Unit PGDatabaseConnectionManager**

A **unit PGDatabaseConnectionManager** fornece funções robustas para gerenciar conexões com o banco de dados **PostgreSQL** através de **FireDAC**. Ela possibilita a criação de conexões reutilizáveis e personalizadas, além de incluir gerenciamento de pool de conexões, o que otimiza o desempenho e a utilização dos recursos do sistema.

#### 🔧 **Funções e Procedimentos**

- **GetConnection(const AConfiguration: TPGConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma instância de conexão **PostgreSQL** baseada nas configurações fornecidas, no nome do banco de dados e no prefixo especificado.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **PostgreSQL**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo para identificar a conexão.
  - **Retorno:** Instância configurada de `TFDConnection`.

- **GetConnection(const AConfiguration: TPGConfiguration; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão com o banco de dados **PostgreSQL** com base nas configurações e no prefixo fornecidos.
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
  - **Descrição:** Configura uma conexão **PostgreSQL** com base nas configurações e parâmetros fornecidos. A conexão é configurada diretamente na variável `AConnection`.
  - **Parâmetros:**
    - `AConfiguration`: Configurações do banco de dados **PostgreSQL**.
    - `ADatabase`: Nome do banco de dados.
    - `APrefix`: Prefixo para identificar a conexão.
    - `AConnection`: Instância de conexão que será configurada.

### ⚙️ **Finalidade**

Esta **unit** permite a criação e o gerenciamento de conexões reutilizáveis e personalizadas com o banco de dados **PostgreSQL** através de **FireDAC**. Com suporte para pooling de conexões e reconexão automática, ela otimiza o desempenho das operações no banco de dados, proporcionando um gerenciamento mais eficiente dos recursos.

---

### 🗂️ **Unit Horse.Connection.PG**

A **unit Horse.Connection.PG** oferece integração entre o framework **Horse** e o banco de dados **PostgreSQL** usando **FireDAC**. Ela facilita o gerenciamento de conexões, aplicação de parâmetros específicos e o controle do caminho e prefixo das conexões, garantindo um gerenciamento eficiente das configurações para cada requisição HTTP recebida pelo framework.

#### 🔧 **Funções e Procedimentos**

- **PGConnection: TFDConnection;**
  - **Descrição:** Retorna uma conexão configurada para o banco de dados **PostgreSQL** utilizando as configurações atuais.
  - **Retorno:** Instância configurada de `TFDConnection` para **PostgreSQL**.

- **ApplyDatabaseConfiguration(const AParameter: TPGConfigurationParameter; const Value: TValue);**
  - **Descrição:** Aplica um parâmetro de configuração ao banco de dados **PostgreSQL** usando um valor genérico.
  - **Parâmetros:**
    - `AParameter`: Parâmetro de configuração a ser aplicado.
    - `Value`: Valor do parâmetro, como `TValue`.

- **SetConnectionPrefix(const AValue: string);**
  - **Descrição:** Define o prefixo da conexão para o banco de dados **PostgreSQL**.
  - **Parâmetro:** 
    - `AValue`: Valor do prefixo a ser definido.

- **SetDatabase(const AValue: string);**
  - **Descrição:** Define o caminho do banco de dados **PostgreSQL** para a conexão.
  - **Parâmetro:** 
    - `AValue`: Caminho do banco de dados a ser configurado.

- **HorseConnectionPG(Req: THorseRequest; Res: THorseResponse; Next: TProc);**
  - **Descrição:** Middleware de integração com o **Horse**. Define a conexão com o banco de dados **PostgreSQL** para cada requisição HTTP recebida.
  - **Parâmetros:**
    - `Req`: Objeto de requisição do **Horse**.
    - `Res`: Objeto de resposta do **Horse**.
    - `Next`: Procedimento a ser executado após a definição da conexão.

### ⚙️ **Finalidade**

A **unit Horse.Connection.PG** facilita o gerenciamento de conexões **PostgreSQL** em aplicações baseadas no framework **Horse**, assegurando que cada requisição HTTP tenha uma conexão configurada conforme os parâmetros especificados. Isso simplifica a integração de **PostgreSQL** em contextos web, promovendo uma integração eficiente e escalável.

---

### 🗂️ Unit SQLiteDatabaseConfigurationManager

A **unit SQLiteDatabaseConfigurationManager** oferece funções para gerenciar e configurar conexões com o banco de dados **SQLite** usando **FireDAC**, permitindo a criação de definições de conexão personalizadas e reutilizáveis para diversas aplicações.

#### 🔧 Funções e Procedimentos

- **Initialize(const AConfiguration: TSQLiteConfiguration; const ADatabase: string; const APrefix: string);**
  - **Descrição:** Configura e inicializa o **FireDAC** para o banco de dados **SQLite** com base nas configurações fornecidas, nome do banco de dados e prefixo.
  - **Parâmetros:**
    - `AConfiguration`: Configurações para conexão com o **SQLite**.
    - `ADatabase`: Nome da base de dados.
    - `APrefix`: Prefixo para identificar a conexão no **FireDAC Manager**.

- **Initialize(const AConfiguration: TSQLiteConfiguration; const APrefix: string);**
  - **Descrição:** Inicializa a configuração de conexão com base nas configurações e prefixo fornecidos.
  - **Parâmetros:**
    - `AConfiguration`: Configurações para conexão com o **SQLite**.
    - `APrefix`: Prefixo para identificação da conexão.

- **Initialize(const AConfiguration: TSQLiteConfiguration);**
  - **Descrição:** Inicializa a conexão apenas com as configurações fornecidas, sem prefixo.
  - **Parâmetro:** 
    - `AConfiguration`: Configurações para conexão com o **SQLite**.

- **GetConnectionDef(const APrefix: string): string;**
  - **Descrição:** Retorna o nome da definição de conexão com o prefixo especificado.
  - **Parâmetro:**
    - `APrefix`: Prefixo utilizado na definição de conexão.
  - **Retorno:** Nome da definição de conexão com o prefixo.

- **GetConnectionDef: string;**
  - **Descrição:** Retorna o nome da definição de conexão padrão.
  - **Retorno:** Nome da definição de conexão padrão.

- **CreateConnectionParameters(const AConfiguration: TSQLiteConfiguration; const ADatabase: string): TStrings;**
  - **Descrição:** Gera uma lista de parâmetros de conexão para o **SQLite** com base nas configurações fornecidas.
  - **Parâmetros:**
    - `AConfiguration`: Configurações da base de dados **SQLite**.
    - `ADatabase`: Nome da base de dados.
  - **Retorno:** Lista de parâmetros de conexão.

#### 🔄 Inicialização e Finalização

- **EnsureFDManagerInitialized**
  - **Descrição:** Garante que o gerenciador do **FireDAC** esteja ativo.

- **ConfigureFDManager**
  - **Descrição:** Configura o gerenciador do **FireDAC** com as opções necessárias.

### ⚙️ Finalidade

Esta unit simplifica o gerenciamento de conexões **SQLite** por meio do **FireDAC**, oferecendo configurações flexíveis e reutilizáveis para diferentes contextos e ambientes.

---

### 🗂️ Unit SQLiteDatabaseConnectionManager

A **unit SQLiteDatabaseConnectionManager** fornece ferramentas para gerenciar conexões com o banco de dados **SQLite** utilizando **FireDAC**. Além de suportar conexões customizadas e reutilizáveis, inclui funcionalidades para o gerenciamento de pool e criptografia de banco de dados.

#### 🔧 Funções e Procedimentos

- **GetConnection(const AConfiguration: TSQLiteConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão com base nas configurações, nome da base de dados e prefixo especificados.
  - **Parâmetros:**
    - `AConfiguration`: Configurações da base de dados **SQLite**.
    - `ADatabase`: Nome da base de dados.
    - `APrefix`: Prefixo para identificação da conexão.
  - **Retorno:** Instância configurada de `TFDConnection`.

- **GetConnection(const AConfiguration: TSQLiteConfiguration; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão com base nas configurações e prefixo fornecidos.
  - **Parâmetros:**
    - `AConfiguration`: Configurações da base de dados **SQLite**.
    - `APrefix`: Prefixo para identificação da conexão.
  - **Retorno:** Instância configurada de `TFDConnection`.

- **GetConnection(const AConfiguration: TSQLiteConfiguration): TFDConnection;**
  - **Descrição:** Retorna uma conexão padrão utilizando apenas as configurações fornecidas.
  - **Parâmetro:** 
    - `AConfiguration`: Configurações da base de dados **SQLite**.
  - **Retorno:** Instância configurada de `TFDConnection`.

- **DefaultConnection(const AConfiguration: TSQLiteConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão padrão com a base de dados **SQLite**; se já existir uma conexão padrão, esta será reutilizada.
  - **Parâmetros:**
    - `AConfiguration`: Configurações da base de dados **SQLite**.
    - `ADatabase`: Nome da base de dados.
    - `APrefix`: Prefixo para identificação da conexão.
  - **Retorno:** Instância configurada de `TFDConnection`.

- **CustomConnection(const AConfiguration: TSQLiteConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descrição:** Retorna uma conexão personalizada com a base de dados **SQLite**; se uma conexão com o prefixo já existir, ela será reutilizada.
  - **Parâmetros:**
    - `AConfiguration`: Configurações da base de dados **SQLite**.
    - `ADatabase`: Nome da base de dados.
    - `APrefix`: Prefixo para identificação da conexão.
  - **Retorno:** Instância configurada de `TFDConnection`.

#### 🔄 Inicialização e Finalização

- **SetupConnection**
  - **Descrição:** Configura a conexão com a base de dados **SQLite**, incluindo suporte para criptografia.

- **FConnectionPool**
  - **Descrição:** Gerencia um pool de conexões **SQLite**, otimizando a reutilização e eficiência das conexões.

### ⚙️ Finalidade

Esta unit melhora o gerenciamento de conexões **SQLite** com suporte a configurações padronizadas e personalizadas, oferecendo recursos avançados, como pool de conexões e criptografia de dados.

---

### 🗂️ Unit Horse.Connection.SQLite

A **unit Horse.Connection.SQLite** permite a integração do banco de dados **SQLite** com o framework **Horse** utilizando **FireDAC**. Fornece métodos para configurar e aplicar parâmetros específicos de conexão, garantindo uma gestão eficiente e personalizada das conexões para cada requisição HTTP.

#### 🔧 Funções e Procedimentos

- **SQLiteConnection**
  - **Descrição:** Retorna uma conexão configurada para a base de dados **SQLite** usando as configurações atuais.
  - **Retorno:** Instância de `TFDConnection` configurada para **SQLite**.

- **ApplyDatabaseConfiguration(const AParameter: TSQLiteConfigurationParameter; const AValue: TValue)**
  - **Descrição:** Aplica um parâmetro de configuração específico ao banco de dados **SQLite** usando um valor genérico.
  - **Parâmetros:**
    - `AParameter`: Parâmetro de configuração a ser aplicado.
    - `AValue`: Valor do parâmetro como `TValue`.

- **ApplyDatabaseConfiguration(const AParameter: TSQLiteConfigurationParameter; const AValue: TSQLiteLockingModeType)**
  - **Descrição:** Aplica um parâmetro de modo de bloqueio ao banco de dados **SQLite**.
  - **Parâmetros:**
    - `AParameter`: Parâmetro de configuração.
    - `AValue`: Valor do tipo `TSQLiteLockingModeType`.

- **ApplyDatabaseConfiguration(const AParameter: TSQLiteConfigurationParameter; const AValue: TSQLiteOpenModeType)**
  - **Descrição:** Aplica um parâmetro de modo de abertura ao banco de dados **SQLite**.
  - **Parâmetros:**
    - `AParameter`: Parâmetro de configuração.
    - `AValue`: Valor do tipo `TSQLiteOpenModeType`.

- **ApplyDatabaseConfiguration(const AParameter: TSQLiteConfigurationParameter; const AValue: TSQLiteEncryptType)**
  - **Descrição:** Aplica um parâmetro de criptografia ao banco de dados **SQLite**.
  - **Parâmetros:**
    - `AParameter`: Parâmetro de configuração.
    - `AValue`: Valor do tipo `TSQLiteEncryptType`.

- **SetConnectionPrefix(const AValue: string)**
  - **Descrição:** Define o prefixo da conexão para o banco de dados **SQLite**.
  - **Parâmetro:**
    - `AValue`: Prefixo da conexão.

- **SetDatabase(const AValue: string)**
  - **Descrição:** Define o caminho do banco de dados **SQLite**.
  - **Parâmetro:**
    - `AValue`: Caminho da base de dados.

- **HorseConnectionSQLite(Req: THorseRequest; Res: THorseResponse; Next: TProc)**
  - **Descrição:** Middleware para integrar o **Horse** com o banco de dados **SQLite**. Configura a conexão para cada requisição HTTP recebida.
  - **Parâmetros:**
    - `Req`: Objeto de requisição do **Horse**.
    - `Res`: Objeto de resposta do **Horse**.


    - `Next`: Procedimento a ser executado na sequência.

### ⚙️ Finalidade

Esta unit facilita a integração do **SQLite** com o **Horse**, permitindo que cada requisição HTTP seja atendida por uma conexão configurada de forma personalizada e eficiente.

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests para melhorar este projeto.

## Licença

Este projeto está licenciado sob a **MIT License**. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

