# 🌐 HorseConnection

**Click on the language you want to read this README:** 🇺🇸 [Inglês](https://github.com/ricksolucoes/HorseConnection/blob/main/README.md) | 🇧🇷 [Português](https://github.com/ricksolucoes/HorseConnection/blob/main/README_pt-BR.md) | 🇪🇸 [Espanhol](https://github.com/ricksolucoes/HorseConnection/blob/main/README_ES.md)

**HorseConnection** is a middleware developed for the **Horse** framework, aimed at simplifying database connection management in **Delphi** applications. It uses the **Boss** package manager to automatically install and update dependencies, providing quick and optimized integration. By offering specific middleware for each supported database type, **HorseConnection** eliminates the need for repetitive manual configurations, allowing each **Horse** endpoint to connect to the database automatically and efficiently.

## 🎯 About the Project

**HorseConnection** was created to serve as integration middleware with **Horse** — an HTTP REST framework for Delphi — providing unified and efficient support for multiple databases. This middleware enables database connections to be configured only once, removing the need for manual adjustments at each endpoint.

## 🎯 Middleware Objectives

The **HorseConnection** middleware aims to encapsulate all database connection logic, offering a centralized structure that:

🔹 Simplifies the use of database connections in **FireDAC**.

🔹 Reduces code duplication by avoiding repetitive configurations for each request.

🔹 Prevents connection leaks in high-demand applications, ensuring that connections are managed efficiently and are reusable.

## 🚀 Features

- **Centralized and automated connections** with various databases, including PostgreSQL, Firebird, MySQL, SQLite, and Advantage Database Server, facilitating integration with **Horse**.
- **Simplified installation and dependency management** via **Boss**, allowing quick and straightforward middleware configuration.
- **Support for multiple connection configurations**, ensuring each database can be configured according to its specific requirements without the need for manual adjustments at each endpoint.

## 🧩 Requirements

**🔹 Delphi** version 10.2 or higher.

**🔹 Boss** as a package manager for Delphi. [Learn more about Boss](https://github.com/HashLoad/boss).

**🔹 Horse Framework** to create REST applications in Delphi:

  ```sh
  boss install horse
  ```

## 🛠️ Installation

To install **HorseConnection** and its dependencies, execute the following command with **Boss**:

```sh
boss install https://github.com/ricksolucoes/HorseConnection
```

## ⚙️ How to Use

### 🌐 Language Directive Utilization

To customize the language for configuration messages and responses, **HorseConnection** uses compilation directives, allowing selection among **English** (default), **Portuguese**, or **Spanish**. To set the desired language, add one of the following directives to your project:

- For **Portuguese**:
  ```delphi
  {$DEFINE PORTUGUES}
  ```
- For **Spanish**:
  ```delphi
  {$DEFINE ESPANHOL}
  ```

---

### 🔧 Configuring the Middleware

Import the units and set up the middleware for the desired database:

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

### 🏗️ Database Configuration

Each database has specific parameters that can be configured to better meet the needs of your application. Below are configuration details for each supported database.

---

#### ⚙️ ADS Configuration

Example configuration for the **ADS** database using the `ApplyDatabaseConfiguration` function:

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

- **👤 UserName**: Specifies the username for authentication in the ADS database.
- **🔑 Password**: Specifies the password for access to the ADS database.
- **📂 Database**: Specifies the full path or database name on the ADS server.
- **👀 ShowDelete**: Enables the display of deleted records.
- **♻️ Pooled**: Indicates if the connection will be managed as a connection pool.
- **📊 PoolMaxItems**: Sets the maximum number of connections allowed in the pool.
- **⏳ PoolExpireTimeout**: Defines the time, in seconds, after which an idle connection will expire.
- **🧹 PoolCleanupTimeout**: Defines the time, in seconds, for periodic cleanup of expired connections in the pool.
- **🔤 CharacterSet**: Sets the character set for the connection, such as "UTF-8" or "ANSI."
- **💻 ServerType**: Defines the type of server where the ADS database is hosted.
- **🔌 Protocol**: Specifies the communication protocol used to connect to the ADS server.
- **📋 TableType**: Defines the format of tables used in the ADS database.
- **🔒 Locking**: Sets the data locking type used in ADS.
- **📁 VendorLib**: Specifies the path to the vendor library (DLL) required for FireDAC to communicate with ADS.

---

### 🔄 Firebird Configuration

Example configuration for the **Firebird** database using the `ApplyDatabaseConfiguration` function:

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

- **👤 UserName**: Specifies the username for authentication in the Firebird database.
- **🔑 Password**: Specifies the password for access to the Firebird database.
- **📂 Database**: Specifies the full path or database name for Firebird.
- **🔌 Protocol**: Defines the communication protocol with the Firebird server.
- **🌐 Server**: Specifies the server address where the Firebird database is hosted.
- **🔌 Port**: Specifies the connection port for the Firebird server.
- **🔤 CharacterSet**: Defines the character set for the connection.
- **🗄 OpenMode**: Specifies the database open mode.
- **♻️ Pooled**: Indicates if the connection will be managed as a connection pool.
- **📊 PoolMaxItems**: Sets the maximum number of connections allowed in the pool.
- **⏳ PoolExpireTimeout**: Specifies the time, in seconds, after which an idle connection will expire.
- **🧹 PoolCleanupTimeout**: Specifies the time, in seconds, for periodic cleanup of expired connections in the pool.

---

### 🔄 Configuring MySQL

Below is an example of configuring the **MySQL** database using the `ApplyDatabaseConfiguration` function:

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

- **👤 UserName**: Username for authentication in the MySQL database.
- **🔑 Password**: Password to access the MySQL database.
- **💾 Database**: Name of the MySQL database.
- **🌐 Server**: MySQL server address.
- **🔌 Port**: MySQL connection port.
- **♻️ Pooled**: Specifies if the connection will be managed as a connection pool.
- **📊 PoolMaxItems**: Maximum number of connections allowed in the pool.
- **⏳ PoolExpireTimeout**: Time in seconds for an inactive connection to expire.
- **🧹 PoolCleanupTimeout**: Time in seconds for periodic cleanup of expired connections in the pool.

---

### 🔄 Configuring PostgreSQL

Below is an example of configuring the **PostgreSQL** database using the `ApplyDatabaseConfiguration` function:

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

- **👤 UserName**: Username for authentication in the PostgreSQL database.
- **🔑 Password**: Password to access the PostgreSQL database.
- **💾 Database**: Name of the PostgreSQL database.
- **🌐 Server**: PostgreSQL server address.
- **🔌 Port**: PostgreSQL connection port.
- **♻️ Pooled**: Specifies if the connection will be managed as a connection pool.
- **📊 PoolMaxItems**: Maximum number of connections allowed in the pool.
- **⏳ PoolExpireTimeout**: Time in seconds for an inactive connection to expire.
- **🧹 PoolCleanupTimeout**: Time in seconds for periodic cleanup of expired connections in the pool.

---

### 🔄 Configuring SQLite

Below is an example of configuring the **SQLite** database using the `ApplyDatabaseConfiguration` function:

```delphi
ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.Database, './my_database.sqlite');
ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.Pooled, True);
ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.PoolMaxItems, 50);
ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.PoolExpireTimeout, 90000);
ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.PoolCleanupTimeout, 30000);
```

- **💾 Database**: Path to the SQLite database file.
- **♻️ Pooled**: Specifies if the connection will be managed as a connection pool.
- **📊 PoolMaxItems**: Maximum number of connections allowed in the pool.
- **⏳ PoolExpireTimeout**: Time in seconds for an inactive connection to expire.
- **🧹 PoolCleanupTimeout**: Time in seconds for periodic cleanup of expired connections in the pool.

---

## ⚙️ Database Configuration

The `SetConnectionPrefix` method is used to define a specific prefix for the connection pool, if necessary. This prefix is especially useful when working with multiple databases, preventing connection conflicts and ensuring that each set of connections is uniquely identified.

```delphi
SetConnectionPrefix(EmptyStr);
```

- **🔖 Connection Prefix**: Defines a prefix to distinguish connections in the pool, essential for projects with multiple databases.

The `SetDatabase` method is used to specify the path or name of the database, if needed. This adjustment is fundamental when working with multiple databases, ensuring each connection accesses the correct database and preventing conflicts.

```delphi
SetDatabase(EmptyStr);
```

- **📂 Database Path or Name**: Configures the target database, ensuring the correct connection in environments with several databases.

## 🛠️ Obtaining the Connection

This example demonstrates how to obtain the connection to the database configured by the middleware, using the `TConnectionType` enumerator to specify which type of connection will be used. The `TConnectionType` enumerator allows defining the database type, such as **ADS**, **FB**, **MySQL**, **PG**, or **SQLite**, ensuring that the connection is correctly established according to the selected database. The example below shows how to obtain the connection using `GetConnection(TConnectionType.PG)`, where `PG` represents PostgreSQL, facilitating the integration and maintenance of different types of databases in the project.

```delphi
THorse.Get('/products',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    FDQuery: TFDQuery;
    Products: TJSONArray;
    Product: TJSONObject;
  begin
    FDQuery := TFDQuery.Create(nil);
    try
      SetConnectionPrefix(EmptyStr);
      SetDatabase(EmptyStr);

      FDQuery.Connection := GetConnection(TConnectionType.PG);
      
      FDQuery.SQL.Text := 'SELECT * FROM products';
      FDQuery.Open;

      Products := TJSONArray.Create;
      while not FDQuery.Eof do
      begin
        Product := TJSONObject.Create;
        Product.AddPair('id', FDQuery.FieldByName('id').AsString);
        Product.AddPair('name', FDQuery.FieldByName('name').AsString);
        Product.AddPair('price', FDQuery.FieldByName('price').AsString);
        Products.AddElement(Product);
        FDQuery.Next;
      end;

      Res.Send<TJSONArray>(Products);
    finally
      FDQuery.Close;
      FDQuery.Free;
    end;
  end
);
```

## 🔍 Obtaining the Query

This example demonstrates how to obtain the Query directly using the configured middleware. The `TConnectionType` enumerator is used to specify the desired database, such as **ADS**, **FB**, **MySQL**, **PG**, or **SQLite**, facilitating the maintenance and integration of different databases in the project. The `GetQuery` function is used to obtain the `TFDQuery` instance already configured with the appropriate connection, according to the selected database in `TConnectionType`. This ensures that the query is correctly connected to the specified database, simplifying project implementation and maintenance.

```delphi
THorse.Get('/product',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    FDQuery: TFDQuery;
    Products: TJSONArray;
    Product: TJSONObject;
  begin
    SetConnectionPrefix(EmptyStr);
    SetDatabase(EmptyStr);

    FDQuery := GetQuery(TConnectionType.PG);
    try
      FDQuery.SQL.Text := 'SELECT * FROM products WHERE id = :id';
      FDQuery.ParamByName('id').AsString := Req.Params['id'];
      FDQuery.Open;

      Products := TJSONArray.Create;
      while not FDQuery.Eof do
      begin
        Product := TJSONObject.Create;
        Product.AddPair('id', FDQuery.FieldByName('id').AsString);
        Product.AddPair('name', FDQuery.FieldByName('name').AsString);
        Product.AddPair('price', FDQuery.FieldByName('price').AsString);
        Products.AddElement(Product);
        FDQuery.Next;
      end;

      Res.Send<TJSONArray>(Products);
    finally
      FDQuery.Close;
      FDQuery.Free;
    end;
  end
);
```

### 🔀 Connection Differences

The differences between connections in the code become clear when using the **GetConnection(TConnectionType)** or **GetQuery(TConnectionType)** functions. With these functions, it’s possible to specify which database to configure, whether **ADS**, **Firebird**, **MySQL**, **PostgreSQL**, or **SQLite**. This approach provides greater flexibility and simplicity when working with different databases within the same project.

## 🧩 Source Code Explanation

### 🗂️ Unit Horse.Connection

The **Horse.Connection** unit provides functions for managing database connections using **FireDAC** within the **Horse** middleware. **HorseConnection** facilitates the release of `TFDConnection` or `TFDQuery` instances, centralizing connection logic and simplifying the efficient management of connections within middleware routes.

#### 🔍 Functions and Procedures

- **GetConnection(AValue: TConnectionType): TFDConnection;**
  - **Description:** Obtains a `TFDConnection` based on the specified connection type.
  - **Parameters:**
    - `AValue`: The desired connection type, defined by the `TConnectionType` enumeration. Options include:
      - `TConnectionType.ADS`: Connection to ADS database.
      - `TConnectionType.FB`: Connection to Firebird database.
      - `TConnectionType.MySQL`: Connection to MySQL database.
      - `TConnectionType.PG`: Connection to PostgreSQL database.
      - `TConnectionType.SQLite`: Connection to SQLite database.
  - **Return:** Returns a `TFDConnection` instance configured according to the specified connection type.
  - **Exception:** Throws an exception if the connection type is unsupported or unspecified.

- **GetQuery(AValue: TConnectionType): TFDQuery;**
  - **Description:** Creates and returns a `TFDQuery` instance associated with the specified connection type.
  - **Parameters:**
    - `AValue`: The desired connection type, defined by the `TConnectionType` enumeration.
  - **Return:** Returns a `TFDQuery` instance associated with the specified connection.
  - **Exception:** Throws an exception if the connection type is unsupported or unspecified.

#### 🌐 Middleware 

The **HorseConnection** middleware encapsulates the database connection logic, promoting centralized and reusable management of `TFDConnection` and `TFDQuery` connections. This approach reduces repetitive code by facilitating the creation and release of `TFDConnection` or `TFDQuery` instances with the appropriate connection, as well as preventing connection leaks in database-intensive applications.

---

### 🗂️ Unit EnumsHelpersUtils

The **EnumsHelpersUtils** unit defines enumerated types and connection configurations for various databases (PostgreSQL, ADS, SQLite, Firebird, MySQL) and provides helper functions for handling these types.

#### 🔍 Enumerated Types and Configuration Structures

- **TConnectionType**
  - Defines the supported connection types:
    - `ADS`
    - `FB`
    - `MySQL`
    - `PG`
    - `SQLite`

- **TPGConfiguration**
  - Configuration structure for PostgreSQL.
  - **Default Function**: Returns a default configuration for PostgreSQL.

- **TADSConfiguration**
  - Configuration structure for ADS.
  - **Default Function**: Returns a default configuration for ADS.

- **TSQLiteConfiguration**
  - Configuration structure for SQLite.
  - **Default Function**: Returns a default configuration for SQLite.

- **TFBConfiguration**
  - Configuration structure for Firebird.
  - **Default Function**: Returns a default configuration for Firebird.

- **TMySQLConfiguration**
  - Configuration structure for MySQL.
  - **Default Function**: Returns a default configuration for MySQL.

#### 🔧 Helper Functions

- **ToString**
  - Available for each enumerated type, such as `TConnectionType`, `TADSServerType`, `TADSCharacterSet`, `TADSProtocol`, among others.
  - **Description**: Converts the enumerated type value into a representative string.

#### 📄 Example of Use

```delphi
var
  Config: TPGConfiguration;
begin
  Config := TPGConfiguration.Default;
end;
```

---

### 🗂️ Unit SystemUtils

The **SystemUtils** unit provides utilities for system operations, including path manipulation and throwing exceptions for invalid types.

#### 🔍 Functions and Procedures

- **RaiseInvalidTypeException**
  - **Description:** Throws an exception indicating that a field has an incorrect type.
  - **Parameters:**
    - `AFieldName` (string): Name of the field with the incorrect type.
    - `AExpectedType` (string): Expected type for the field.
  - **Exception:** Throws a formatted exception to identify type errors at runtime.
  - **Example of Use**:
    ```delphi
    RaiseInvalidTypeException('FieldName', 'Integer');
    ```

- **GetAbsolutePath**
  - **Description:** Obtains the absolute path based on a given relative path.
  - **Parameters:**
    - `ARelativePath` (string): Relative path to be converted.
  - **Return:** Returns the absolute path corresponding to the given relative path.
  - **Note:** If the relative path starts with ".\", it is combined with the application’s directory to obtain the absolute path; otherwise, it returns the provided path as is.
  - **Example of Use**:
    ```delphi
    var
      AbsolutePath: string;
    begin
      AbsolutePath := GetAbsolutePath('.\directory\file.txt');
    end;
    ```

### ⚠️ Exceptions

The **SystemUtils** unit utilizes exceptions to signal incorrect data types in `RaiseInvalidTypeException`, allowing for stricter field type validation during execution. This unit is useful for path manipulation and field type validation, centralizing common utilities for system operations.

---

## 🧩 Source Code Explanation

### 🗂️ Unit MethodReferencesUtils

The **MethodReferencesUtils** unit defines method reference types (procedures and functions) for database configurations and connections.

#### 🔍 Types

- **TFunctionConnection**
  - **Description**: Reference to a function that returns a `TFDConnection` connection.
  - **Return**: A `TFDConnection` object representing the connection.
  - **Usage**: Facilitates the creation of function references to obtain a FireDAC connection, allowing other units or methods to execute the connection function in a generic and reusable way.

  - **Usage Example**:
    ```delphi
    var
      GetConnection: TFunctionConnection;
    begin
      GetConnection := function: TFDConnection
        begin
          Result := TFDConnection.Create(nil); // Specific implementation
        end;
    end;
    ```

- **TDatabaseConfigurator<T>**
  - **Description**: Generic procedure for configuring a database.
  - **Parameters**:
    - `AConfiguration` (var T): Database configuration to be modified.
    - `AValue` (TValue): Value to be applied to the configuration.
  - **Usage**: Enables modification of specific database configurations through parameterized procedures, making it possible to apply different values to various configurations in a flexible and generic way.

  - **Usage Example**:
    ```delphi
    var
      Configurator: TDatabaseConfigurator<TPGConfiguration>;
    begin
      Configurator := procedure(var AConfig: TPGConfiguration; const AValue: TValue)
        begin
          AConfig.Server := AValue.AsString; // Specific adjustment
        end;
    end;
    ```

### ⚙️ Purpose

This unit centralizes method references for connections and configurations, facilitating the application of configuration procedures in various database contexts. It is particularly useful in systems where multiple types of databases are used and require specific configurations.

---

### 🗂️ Unit CharacterSetUtils

The **CharacterSetUtils** unit provides auxiliary functions to add different character sets to the **TDictionary**, allowing conversion of character set types for **Firebird**.

#### 🔍 Functions and Procedures

- **AddBasicCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);**
  - **Description:** Adds basic character sets to the dictionary.
  - **Parameter:** 
    - `Dictionary`: Dictionary where the character sets will be added.

- **AddDOSCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);**
  - **Description:** Adds **DOS** character sets to the dictionary.
  - **Parameter:** 
    - `Dictionary`: Dictionary where the character sets will be added.

- **AddISOCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);**
  - **Description:** Adds **ISO** character sets to the dictionary.
  - **Parameter:** 
    - `Dictionary`: Dictionary where the character sets will be added.

- **AddWinCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);**
  - **Description:** Adds **Windows** character sets to the dictionary.
  - **Parameter:** 
    - `Dictionary`: Dictionary where the character sets will be added.

- **AddMiscellaneousCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);**
  - **Description:** Adds miscellaneous character sets to the dictionary.
  - **Parameter:** 
    - `Dictionary`: Dictionary where the character sets will be added.

### ⚙️ Purpose

This unit facilitates the configuration and addition of various character sets to the **TDictionary** for character set manipulation in **Firebird**, ensuring support for different encoding standards.

---

### 🗂️ Unit ADSDataBaseConfigurationParameter

The **ADSDataBaseConfigurationParameter** unit provides methods to configure specific parameters of a `TADSConfiguration` instance, used to set up **FireDAC** (`TFDConnection`) with the **ADS** (Advantage Database Server) driver. This configuration allows defining values such as server type, character set, protocol, and other connection options.

#### 🔍 Functions and Procedures

- **DatabaseConfig**
  - **Description**: Configures specific parameters in a `TADSConfiguration` instance based on the provided values.
  - **Parameters**:
    - `AConfiguration` (var `TADSConfiguration`): The ADS database configuration to be adjusted.
    - `AParameter` (`TADSConfigurationParameter`): The configuration parameter to be modified.
    - `AValue` (`TValue`, `TADSServerType`, `TADSCharacterSet`, `TADSProtocol`, `TADSTableType`, `TADSLocking`): The value to apply to the parameter.
  - **Overloads**:
    - `DatabaseConfig(var AConfiguration: TADSConfiguration; AParameter: TADSConfigurationParameter; const AValue: TValue)`: Configures with a generic `TValue`.
    - Specific configurations for server type (`TADSServerType`), character set (`TADSCharacterSet`), protocol (`TADSProtocol`), table type (`TADSTableType`), and locking (`TADSLocking`).

- **SetDatabase**
  - **Description**: Defines the database path in the `TADSConfiguration`.
  - **Example**:
    ```delphi
    SetDatabase(MyConfig, 'C:\databases\example.db');
    ```

- **SetUserName** / **SetPassword**
  - Defines the username and password in the configuration.

- **SetCharacterSet**
  - Sets the character set (`TADSCharacterSet`).

- **SetPooled**
  - Enables or disables connection pooling.

### ⚠️ Exceptions
- **RaiseInvalidTypeException**: Raises an exception when an incorrect type is detected, aiding in debugging.

### ⚙️ Purpose

This unit is essential for configuring **FireDAC** connection parameters with **ADS**, centralizing procedures that allow developers to adjust the connection in a modular and consistent manner.

---

### 🗂️ Unit FBDataBaseConfigurationParameter

The **FBDataBaseConfigurationParameter** unit provides procedures to configure specific parameters of a `TFBConfiguration` instance, used to set up **FireDAC** (`TFDConnection`) with the **Firebird** driver. This configuration allows defining values such as protocol, open mode, character set, and other connection options for the Firebird database.

#### 🔍 Functions and Procedures

- **DatabaseConfig**
  - **Description**: Configures specific parameters in a `TFBConfiguration` instance based on the provided values.
  - **Parameters**:
    - `AConfiguration` (var `TFBConfiguration`): The Firebird database configuration to be adjusted.
    - `AParameter` (`TFBConfigurationParameter`): The configuration parameter to be modified.
    - `AValue` (`TValue`, `TFBProtocolType`, `TFBOpenModeType`, `TFBCharacterSetType`): The value to apply to the parameter.
  - **Overloads**:
    - `DatabaseConfig(var AConfiguration: TFBConfiguration; AParameter: TFBConfigurationParameter; const AValue: TValue)`: Configures with a generic `TValue`.
    - Specific configurations for protocol type (`TFBProtocolType`), open mode (`TFBOpenModeType`), and character set (`TFBCharacterSetType`).

- **SetDatabase**
  - **Description**: Defines the database path in the `TFBConfiguration`.
  - **Example**:
    ```delphi
    SetDatabase(MyConfig, 'C:\databases\example.fdb');
    ```

- **SetUserName** / **SetPassword**
  - Defines the username and password in the configuration.

- **SetProtocol**
  - Sets the connection protocol (`TFBProtocolType`).

- **SetOpenMode**
  - Sets the database open mode (`TFBOpenModeType`).

- **SetCharacterSet**
  - Sets the character set (`TFBCharacterSetType`).

- **SetPooled**
  - Enables or disables connection pooling.

### ⚠️ Exceptions
- **RaiseInvalidTypeException**: Raises an exception when an incorrect type is detected, aiding in debugging.

### ⚙️ Purpose

The **FBDataBaseConfigurationParameter** unit is essential for configuring **FireDAC** connection parameters with **Firebird**, centralizing procedures that enable developers to adjust the connection with the database in a modular and consistent manner, including protocol characteristics, character set, and other technical parameters.

---

### 🗂️ `MySQLDataBaseConfigurationParameter` Unit

The **MySQLDataBaseConfigurationParameter** unit provides procedures to configure specific parameters for a `TMySQLConfiguration` instance, used to set up FireDAC (`TFDConnection`) with the MySQL driver. This unit allows defining values such as server, port, vendor library, and connection pooling options for the MySQL database.

#### 🔧 Functions and Procedures

- **DatabaseConfig**
  - **Description**: Configures specific parameters in a `TMySQLConfiguration` instance based on the provided values.
  - **Parameters**:
    - `AConfiguration` (var `TMySQLConfiguration`): The MySQL database configuration to be modified.
    - `AParameter` (`TMySQLConfigurationParameter`): The configuration parameter to be adjusted.
    - `AValue` (`TValue`): The generic value to be applied to the parameter.
  - **Example**:
    ```delphi
    DatabaseConfig(MyConfig, TMySQLConfigurationParameter.Database, 'database_name');
    ```

- **SetDatabase**
  - **Description**: Sets the database path in the MySQL configuration.
  - **Parameters**:
    - `AConfiguration` (var `TMySQLConfiguration`): Configuration to be modified.
    - `AValue` (`TValue`): Database path in `string` format.

- **SetUserName** / **SetPassword**
  - **Description**: Sets the username and password for the MySQL connection.
  - **Parameters**:
    - `AConfiguration` (var `TMySQLConfiguration`): Configuration to be modified.
    - `AValue` (`TValue`): Username or password.

- **SetServer**
  - **Description**: Sets the server address in the MySQL configuration.
  - **Parameters**:
    - `AConfiguration` (var `TMySQLConfiguration`): Configuration to be modified.
    - `AValue` (`TValue`): Server address.

- **SetVendorLib**
  - **Description**: Specifies the vendor library path for the MySQL connection.
  - **Parameters**:
    - `AConfiguration` (var `TMySQLConfiguration`): Configuration to be modified.
    - `AValue` (`TValue`): Vendor library path.

- **SetPort**
  - **Description**: Sets the server port in the MySQL configuration.
  - **Parameters**:
    - `AConfiguration` (var `TMySQLConfiguration`): Configuration to be modified.
    - `AValue` (`TValue`): Port number.

- **SetPooled**
  - **Description**: Enables or disables connection pooling.
  - **Parameters**:
    - `AConfiguration` (var `TMySQLConfiguration`): Configuration to be modified.
    - `AValue` (`TValue`): Boolean value indicating the pooling state.

- **SetPoolMaxItems** / **SetPoolExpireTimeout** / **SetPoolCleanupTimeout**
  - **Description**: Sets the maximum number of connections, expiration time, and cleanup time for the connection pool.
  - **Parameters**:
    - `AConfiguration` (var `TMySQLConfiguration`): Configuration to be modified.
    - `AValue` (`TValue`): Maximum number of connections or time (in milliseconds) for expiration/cleanup.

### ⚠️ Exceptions
- **RaiseInvalidTypeException**: Throws an exception if the provided value type does not match the expected parameter type, aiding in identifying runtime type issues.

### ⚙️ Purpose

The **MySQLDataBaseConfigurationParameter** unit centralizes FireDAC configuration for MySQL, simplifying modular adjustments of connection options such as server, connection pooling, and authentication.

---

### 🗂️ `PGDataBaseConfigurationParameter` Unit

The **PGDataBaseConfigurationParameter** unit provides procedures to configure specific parameters for a `TPGConfiguration` instance, used to set up FireDAC (`TFDConnection`) with the PostgreSQL driver. This unit allows the definition of parameter values such as server, port, database name, username, password, character set, and connection pooling options for PostgreSQL.

#### 🔧 Functions and Procedures

- **DatabaseConfig**
  - **Description**: Configures a specific parameter in a `TPGConfiguration` instance according to the provided value.
  - **Parameters**:
    - `AConfiguration` (var `TPGConfiguration`): The PostgreSQL database configuration to be modified.
    - `AParameter` (`TPGConfigurationParameter`): The configuration parameter to be adjusted.
    - `AValue` (`TValue`): The generic value to be applied to the parameter.
  - **Example**:
    ```delphi
    DatabaseConfig(PGConfig, TPGConfigurationParameter.Server, 'localhost');
    ```

- **SetServer** / **SetPort**
  - **Description**: Sets the server address and port in the PostgreSQL configuration.
  - **Parameters**:
    - `AConfiguration` (var `TPGConfiguration`): Configuration to be modified.
    - `AValue` (`TValue`): Server address or port number.

- **SetDatabase** / **SetUserName** / **SetPassword**
  - **Description**: Sets the database name, username, and password for the PostgreSQL connection.
  - **Parameters**:
    - `AConfiguration` (var `TPGConfiguration`): Configuration to be modified.
    - `AValue` (`TValue`): Database name, username, or password.

- **SetCharacterSet**
  - **Description**: Sets the character set in the PostgreSQL configuration.
  - **Parameters**:
    - `AConfiguration` (var `TPGConfiguration`): Configuration to be modified.
    - `AValue` (`TValue`): Character set.

- **SetPooled**
  - **Description**: Enables or disables connection pooling.
  - **Parameters**:
    - `AConfiguration` (var `TPGConfiguration`): Configuration to be modified.
    - `AValue` (`TValue`): Boolean value for the pooling state.

- **SetPoolMaxItems** / **SetPoolExpireTimeout** / **SetPoolCleanupTimeout**
  - **Description**: Sets the maximum number of connections, expiration time, and cleanup time for the connection pool.
  - **Parameters**:
    - `AConfiguration` (var `TPGConfiguration`): Configuration to be modified.
    - `AValue` (`TValue`): Maximum number of connections or time (in milliseconds) for expiration/cleanup.

### ⚠️ Exceptions
- **RaiseInvalidTypeException**: Throws an exception if the provided value type does not match the expected parameter type, ensuring correct configuration.

### ⚙️ Purpose

The **PGDataBaseConfigurationParameter** unit centralizes PostgreSQL connection configuration for FireDAC, allowing modular adjustments for server settings, authentication, and connection pooling.

---

### 🗂️ `SQLiteDataBaseConfigurationParameter` Unit

The **`SQLiteDataBaseConfigurationParameter`** unit provides specific procedures to configure parameters for an instance of `TSQLiteConfiguration`, which is used to set up the `TFDConnection` in FireDAC with the SQLite driver. This unit enables setting values for parameters such as locking mode, open mode, encryption type, and other connection options, optimizing SQLite database connectivity.

#### 🔧 Functions and Procedures

- **DatabaseConfig** (Overloads)
  - **Description**: Configures a specific parameter in a `TSQLiteConfiguration` instance, adjusting it according to the provided value type.

  - **Overload 1** – Generic Parameter
    - **Parameters**:
      - `AConfiguration` (var `TSQLiteConfiguration`): The SQLite database configuration to be modified.
      - `AParameter` (`TSQLiteConfigurationParameter`): The configuration parameter to be adjusted.
      - `AValue` (`TValue`): Generic value applied to the parameter.
    - **Example**:
      ```delphi
      DatabaseConfig(SQLiteConfig, TSQLiteConfigurationParameter.Database, 'database_path');
      ```

  - **Overload 2** – Locking Mode
    - **Parameters**:
      - `AConfiguration` (var `TSQLiteConfiguration`): The SQLite database configuration.
      - `AParameter` (`TSQLiteConfigurationParameter`): The parameter defining the locking mode.
      - `AValue` (`TSQLiteLockingModeType`): The locking mode value to be applied.
    - **Example**:
      ```delphi
      DatabaseConfig(SQLiteConfig, TSQLiteConfigurationParameter.LockingMode, lmNormal);
      ```

  - **Overload 3** – Open Mode
    - **Parameters**:
      - `AConfiguration` (var `TSQLiteConfiguration`): The SQLite database configuration.
      - `AParameter` (`TSQLiteConfigurationParameter`): The parameter defining the open mode.
      - `AValue` (`TSQLiteOpenModeType`): The open mode value to be applied.
    - **Example**:
      ```delphi
      DatabaseConfig(SQLiteConfig, TSQLiteConfigurationParameter.OpenMode, omReadWrite);
      ```

  - **Overload 4** – Encryption Type
    - **Parameters**:
      - `AConfiguration` (var `TSQLiteConfiguration`): The SQLite database configuration.
      - `AParameter` (`TSQLiteConfigurationParameter`): The parameter defining the encryption type.
      - `AValue` (`TSQLiteEncryptType`): The encryption type value to be applied.
    - **Example**:
      ```delphi
      DatabaseConfig(SQLiteConfig, TSQLiteConfigurationParameter.Encrypt, etAES256);
      ```

#### 🔐 Specific Connection Parameters

- **SetDatabase**
  - **Description**: Sets the database path in the SQLite configuration.
  - **Example**:
    ```delphi
    SetDatabase(SQLiteConfig, 'database_path');
    ```

- **SetUserName** / **SetPassword**
  - **Description**: Configures the username and password for SQLite connection authentication.

- **SetPooled**
  - **Description**: Defines whether the connection pool is enabled.

- **SetPoolMaxItems** / **SetPoolExpireTimeout** / **SetPoolCleanupTimeout**
  - **Description**: Configures the maximum number of connections, the expiration time, and the cleanup time for the connection pool.

### ⚠️ Exceptions
- `RaiseInvalidTypeException`: Raises an exception when the provided value type does not match the expected type for the configuration parameter, helping ensure data consistency and facilitating type error identification.

### ⚙️ Purpose

The `SQLiteDataBaseConfigurationParameter` unit centralizes the FireDAC setup for SQLite, offering a flexible and modular interface for defining database paths, authentication parameters, and pooling options, optimizing SQLite connection management.

---

### 🗂️ `ADSDatabaseConfigurationManager` Unit

The **`ADSDatabaseConfigurationManager`** unit provides functions and procedures to configure and initialize a connection to the **ADS (Advantage Database Server)** using **FireDAC** (`TFDConnection`). It allows defining connection parameters, custom prefixes, and managing connection definitions within the **FireDAC** manager.

#### 🔧 Functions and Procedures

- **Initialize(const AConfiguration: TADSConfiguration; const ADatabase: string; const APrefix: string);**
  - **Description:** Initializes a connection to the **ADS** database using specified configurations, a custom database name, and a prefix for the **FireDAC** manager.
  - **Parameters:**
    - `AConfiguration`: Connection configuration parameters for the **ADS** database.
    - `ADatabase`: Custom name for the database.
    - `APrefix`: Prefix for defining the connection in **FireDAC** manager.

- **Initialize(const AConfiguration: TADSConfiguration; const APrefix: string);**
  - **Description:** Initializes a connection to the **ADS** database using the specified configurations and a custom prefix.
  - **Parameters:**
    - `AConfiguration`: Connection configuration parameters for the **ADS** database.
    - `APrefix`: Prefix for defining the connection.

- **Initialize(const AConfiguration: TADSConfiguration);**
  - **Description:** Initializes a connection to the **ADS** database using only the provided configurations.
  - **Parameter:** 
    - `AConfiguration`: Connection configuration parameters for the **ADS** database.

- **GetConnectionDef(const APrefix: string): string;**
  - **Description:** Returns the connection definition name in **FireDAC** manager using a custom prefix.
  - **Parameter:**
    - `APrefix`: Prefix for the connection definition.
  - **Return:** Connection definition name with the specified prefix.

- **GetConnectionDef: string;**
  - **Description:** Returns the default connection definition name in **FireDAC** manager.
  - **Return:** Default connection definition name.

- **CreateConnectionParameters(const AConfiguration: TADSConfiguration; const ADatabase: string): TStrings;**
  - **Description:** Creates a list of connection parameters for the **ADS** database based on the provided configuration.
  - **Parameters:**
    - `AConfiguration`: Connection configuration parameters for the **ADS** database.
    - `ADatabase`: Database name.
  - **Return:** List of connection parameters.

- **EnsureFDManagerInitialized;**
  - **Description:** Ensures the **FireDAC** manager is initialized.

- **ConfigureFDManager;**
  - **Description:** Configures the **FireDAC** manager with necessary options to support automatic reconnection.

---

### 🗂️ `ADSDataBaseConnectionManager` Unit

The **`ADSDataBaseConnectionManager`** unit manages reusable connections to the **Advantage Database Server (ADS)** using **FireDAC**. It allows the creation of custom connections and the management of a connection pool to optimize performance.

#### 🔧 Functions and Procedures

- **GetConnection(const AConfiguration: TADSConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Description:** Returns a connection to the **ADS** database based on the provided configuration, database name, and prefix.
  - **Parameters:**
    - `AConfiguration`: Connection configuration parameters for the **ADS** database.
    - `ADatabase`: Database name.
    - `APrefix`: Prefix for identifying the connection.
  - **Return:** Configured instance of `TFDConnection`.

- **GetConnection(const AConfiguration: TADSConfiguration; const APrefix: string): TFDConnection;**
  - **Description:** Returns a connection to the **ADS** database based on the provided configuration and prefix.
  - **Parameters:**
    - `AConfiguration`: Connection configuration parameters for the **ADS** database.
    - `APrefix`: Prefix for identifying the connection.
  - **Return:** Configured instance of `TFDConnection`.

- **GetConnection(const AConfiguration: TADSConfiguration): TFDConnection;**
  - **Description:** Returns a connection to the **ADS** database based only on the provided configuration.
  - **Parameter:** 
    - `AConfiguration`: Connection configuration parameters for the **ADS** database.
  - **Return:** Configured instance of `TFDConnection`.

- **SetupConnection(const AConfiguration: TADSConfiguration; const ADatabase: string; const APrefix: string; var AConnection: TFDConnection);**
  - **Description:** Configures a connection to the **ADS** database using the provided configurations and parameters.
  - **Parameters:**
    - `AConfiguration`: Connection configuration parameters for the **ADS** database.
    - `ADatabase`: Database name.
    - `APrefix`: Prefix for identifying the connection.
    - `AConnection`: The connection to be configured.
  - **Exception:** Throws an exception if the specified `VendorLib` DLL is not found.

---

### 🗂️ `Horse.Connection.ADS` Unit

The **`Horse.Connection.ADS`** unit integrates the **Horse** framework with the **Advantage Database Server (ADS)** using **FireDAC**. It provides functions to configure the connection and apply specific configuration parameters.

#### 🔧 Functions and Procedures

- **ADSConnection: TFDConnection;**
  - **Description:** Returns a configured connection for the **ADS** database using the current configuration.
  - **Return:** Instance of `TFDConnection` for the **ADS** database.

- **ApplyDatabaseConfiguration** (multiple overloads for different types)
  - **Description:** Applies a configuration parameter to the **ADS** database. Configuration types include `TADSServerType`, `TADSCharacterSet`, `TADSProtocol`, and others.
  - **Parameters:** 
    - `AParameter`: The configuration parameter to be applied.
    - `Value`: The parameter value, in the expected type.

- **SetConnectionPrefix(const AValue: string);**
  - **Description:** Sets the connection prefix for the **ADS** database.
  - **Parameter:** 
    - `AValue`: The connection prefix value.

- **SetDatabase(const AValue: string);**
  - **Description:** Sets the path for the **ADS** database.
  - **Parameter:** 
    - `AValue`: The database path.

- **HorseConnectionADS(Req: THorseRequest; Res: THorseResponse; Next: TProc);**
  - **Description:** Middleware for integrating with the **Horse** framework. Defines the connection to the **ADS** database for each HTTP request.
  - **Parameters:**
    - `Req`: The **Horse** request object.
    - `Res`: The **Horse** response object.
    - `Next`: The next procedure to be executed.

---

### ⚠️ Exceptions

- **RaiseInvalidTypeException**: Throws an exception when a configuration parameter's type does not match the expected type, helping to identify and resolve configuration errors.

---

### 🗂️ **Unit `FBDatabaseConfigurationManager`**

The **`FBDatabaseConfigurationManager` unit** provides functions to manage connection configurations for the **Firebird** database using **FireDAC**. It allows the creation of reusable and customizable connection definitions, optimizing connection management.

#### 🔧 **Functions and Procedures**

- **Initialize(const AConfiguration: TFBConfiguration; const ADatabase: string; const APrefix: string);**
  - **Description:** Initializes the **FireDAC** configuration for the **Firebird** database based on the provided settings, database name, and prefix.
  - **Parameters:**
    - `AConfiguration`: Connection settings for the **Firebird** database.
    - `ADatabase`: Database name.
    - `APrefix`: Prefix used to identify the connection.

- **Initialize(const AConfiguration: TFBConfiguration; const APrefix: string);**
  - **Description:** Initializes the **FireDAC** configuration for the **Firebird** database based on the provided settings and prefix.
  - **Parameters:**
    - `AConfiguration`: Connection settings for the **Firebird** database.
    - `APrefix`: Prefix used to identify the connection.

- **Initialize(const AConfiguration: TFBConfiguration);**
  - **Description:** Initializes the **FireDAC** configuration for the **Firebird** database using only the provided settings.
  - **Parameter:** 
    - `AConfiguration`: Connection settings for the **Firebird** database.

- **GetConnectionDef(const APrefix: string): string;**
  - **Description:** Returns the connection definition name based on the provided prefix.
  - **Parameter:**
    - `APrefix`: Prefix used to identify the connection.
  - **Return:** Connection definition name.

- **GetConnectionDef: string;**
  - **Description:** Returns the default connection definition name.
  - **Return:** Default connection definition name.

- **CreateConnectionParameters(const AConfiguration: TFBConfiguration; const ADatabase: string): TStrings;**
  - **Description:** Creates a list of connection parameters for the **Firebird** database based on the provided settings.
  - **Parameters:**
    - `AConfiguration`: Connection settings for the **Firebird** database.
    - `ADatabase`: Database name.
  - **Return:** A list of connection parameters, represented as `TStrings`.

- **EnsureFDManagerInitialized;**
  - **Description:** Ensures that the **FireDAC Manager** is properly initialized.

- **ConfigureFDManager;**
  - **Description:** Configures the **FireDAC Manager** with the necessary options for automatic reconnection.

### ⚙️ **Purpose**

This **unit** is essential for managing and customizing connections to the **Firebird** database, centralizing connection definitions and facilitating the reuse and maintenance of settings within **FireDAC**.

___

### 🗂️ **Unit `FBDatabaseConnectionManager`**

The **`FBDatabaseConnectionManager` unit** provides functions for managing connections to the **Firebird** database using **FireDAC**. It allows the creation of reusable and customizable connections, as well as the management of a connection pool.

#### 🔧 **Functions and Procedures**

- **GetConnection(const AConfiguration: TFBConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Description:** Returns a configured connection to the **Firebird** database based on the provided settings, database name, and prefix.
  - **Parameters:**
    - `AConfiguration`: Connection settings for the **Firebird** database.
    - `ADatabase`: Database name.
    - `APrefix`: Prefix used to identify the connection.
  - **Return:** A configured instance of `TFDConnection`.

- **GetConnection(const AConfiguration: TFBConfiguration; const APrefix: string): TFDConnection;**
  - **Description:** Returns a configured connection to the **Firebird** database based on the provided settings and prefix.
  - **Parameters:**
    - `AConfiguration`: Connection settings for the **Firebird** database.
    - `APrefix`: Prefix used to identify the connection.
  - **Return:** A configured instance of `TFDConnection`.

- **GetConnection(const AConfiguration: TFBConfiguration): TFDConnection;**
  - **Description:** Returns a configured connection to the **Firebird** database based solely on the provided settings.
  - **Parameter:** 
    - `AConfiguration`: Connection settings for the **Firebird** database.
  - **Return:** A configured instance of `TFDConnection`.

- **DefaultConnection(const AConfiguration: TFBConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Description:** Returns a default connection to the **Firebird** database. If a default connection already exists, it will be reused.
  - **Parameters:**
    - `AConfiguration`: Connection settings for the **Firebird** database.
    - `ADatabase`: Database name.
    - `APrefix`: Prefix used to identify the connection.
  - **Return:** A configured instance of `TFDConnection`.

- **CustomConnection(const AConfiguration: TFBConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Description:** Returns a custom connection to the **Firebird** database. If a connection with the provided prefix already exists, it will be returned.
  - **Parameters:**
    - `AConfiguration`: Connection settings for the **Firebird** database.
    - `ADatabase`: Database name.
    - `APrefix`: Prefix used to identify the connection.
  - **Return:** A configured instance of `TFDConnection`.

- **SetupConnection(const AConfiguration: TFBConfiguration; const ADatabase: string; const APrefix: string; var AConnection: TFDConnection);**
  - **Description:** Configures a connection to the **Firebird** database based on the provided settings and parameters.
  - **Parameters:**
    - `AConfiguration`: Connection settings for the **Firebird** database.
    - `ADatabase`: Database name.
    - `APrefix`: Prefix used to identify the connection.
    - `AConnection`: The connection to be configured.

### ⚙️ **Purpose**

This **unit** is fundamental for managing connections to the **Firebird** database, centralizing the control of standard and custom connections. It ensures efficiency and reuse through the management of a connection pool.

___

### 🗂️ **Unit `Horse.Connection.FB`**

The **`Horse.Connection.FB` unit** provides integration with the **Horse** framework, allowing the management of connections to the **Firebird** database using **FireDAC**. It includes functions for configuring the connection and applying specific configuration parameters.

#### 🔧 **Functions and Procedures**

- **FBConnection: TFDConnection;**
  - **Description:** Returns a configured connection to the **Firebird** database using the current settings.
  - **Return:** A configured instance of `TFDConnection` for the **Firebird** database.

- **ApplyDatabaseConfiguration(const AParameter: TFBConfigurationParameter; const Value: TValue);**
  - **Description:** Applies a configuration parameter to the **Firebird** database using a generic value.
  - **Parameters:**
    - `AParameter`: The configuration parameter to be applied.
    - `Value`: The value of the parameter as `TValue`.

- **ApplyDatabaseConfiguration(const AParameter: TFBConfigurationParameter; const Value: TFBProtocolType);**
  - **Description:** Applies a protocol type configuration parameter to the **Firebird** database.
  - **Parameters:**
    - `AParameter`: The configuration parameter to be applied.
    - `Value`: The value of the parameter as `TFBProtocolType`.

- **ApplyDatabaseConfiguration(const AParameter: TFBConfigurationParameter; const Value: TFBOpenModeType);**
  - **Description:** Applies an open mode configuration parameter to the **Firebird** database.
  - **Parameters:**
    - `AParameter`: The configuration parameter to be applied.
    - `Value`: The value of the parameter as `TFBOpenModeType`.

- **ApplyDatabaseConfiguration(const AParameter: TFBConfigurationParameter; const Value: TFBCharacterSetType);**
  - **Description:** Applies a character set configuration parameter to the **Firebird** database.
  - **Parameters:**
    - `AParameter`: The configuration parameter to be applied.
    - `Value`: The value of the parameter as `TFBCharacterSetType`.

- **SetConnectionPrefix(const AValue: string);**
  - **Description:** Sets the connection prefix for the **Firebird** database.
  - **Parameter:** 
    - `AValue`: The value of the prefix.

- **SetDatabase(const AValue: string);**
  - **Description:** Sets the database path for the **Firebird** database.
  - **Parameter:** 
    - `AValue`: The database path.

- **HorseConnectionFB(Req: THorseRequest; Res: TH

orseResponse; Next: TProc);**
  - **Description:** Middleware integration for the **Horse** framework. Sets the **Firebird** database connection for each incoming HTTP request.
  - **Parameters:**
    - `Req`: The **Horse** request object.
    - `Res`: The **Horse** response object.
    - `Next`: The procedure to be executed next.

---

### ⚙️ **Purpose**

This **unit** facilitates the integration of the **Firebird** database with the **Horse** framework, enabling each HTTP request to use an optimized and flexible connection, with support for specific and customizable parameters.

---

### 🗂️ **Unit MySQLDatabaseConfigurationManager**

The `MySQLDatabaseConfigurationManager` unit provides methods for managing **MySQL** database connection configurations using **FireDAC**. This unit allows for the definition of reusable and customized configurations, making it easier to manage and maintain **MySQL** connections in various contexts.

#### 🔧 **Main Functions and Procedures**

- **Initialize(const AConfiguration: TMySQLConfiguration; const ADatabase: string; const APrefix: string);**
  - **Description:** Initializes FireDAC settings for a **MySQL** connection based on the provided configurations, database name, and prefix.
  - **Parameters:**
    - `AConfiguration`: Connection settings for **MySQL**.
    - `ADatabase`: Name of the database.
    - `APrefix`: Prefix identifying the connection in the FireDAC Manager.

- **Initialize(const AConfiguration: TMySQLConfiguration; const APrefix: string);**
  - **Description:** Configures the FireDAC connection for **MySQL** using the provided settings and prefix.
  - **Parameters:**
    - `AConfiguration`: Connection settings for **MySQL**.
    - `APrefix`: Prefix to identify the connection.

- **Initialize(const AConfiguration: TMySQLConfiguration);**
  - **Description:** Configures the FireDAC connection for **MySQL** using only the provided settings.
  - **Parameter:** 
    - `AConfiguration`: Connection settings for **MySQL**.

- **GetConnectionDef(const APrefix: string): string;**
  - **Description:** Returns the name of the connection definition based on the specified prefix.
  - **Parameter:**
    - `APrefix`: Prefix used in the connection definition.
  - **Return:** Connection definition name with the prefix applied.

- **CreateConnectionParameters(const AConfiguration: TMySQLConfiguration; const ADatabase: string): TStrings;**
  - **Description:** Generates a list of connection parameters for **MySQL** based on the provided settings.
  - **Parameters:**
    - `AConfiguration`: **MySQL** database settings.
    - `ADatabase`: Name of the database.
  - **Return:** List of connection parameters.

#### 🔄 **Initialization and Finalization Controls**

- **EnsureFDManagerInitialized**
  - **Description:** Ensures the FireDAC Manager is active and initialized.

- **ConfigureFDManager**
  - **Description:** Configures the FireDAC Manager with necessary options for connection.

### ⚙️ **Purpose**

This unit centralizes and facilitates the management of **MySQL** connections through FireDAC, enabling custom, reusable configurations for different scenarios and environments and promoting efficient resource management.

---

### 🗂️ **Unit MySQLDatabaseConnectionManager**

The `MySQLDatabaseConnectionManager` unit offers methods for managing **MySQL** database connections using **FireDAC**. It allows for the creation of reusable, customized connections and manages a pool of connections to optimize resources.

#### 🔧 **Functions and Procedures**

- **GetConnection(const AConfiguration: TMySQLConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Description:** Returns a **MySQL** connection based on the provided settings, database name, and prefix.
  - **Parameters:**
    - `AConfiguration`: Settings for the **MySQL** database.
    - `ADatabase`: Name of the database.
    - `APrefix`: Prefix identifying the connection.
  - **Return:** Configured `TFDConnection` instance.

- **DefaultConnection(const AConfiguration: TMySQLConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Description:** Returns a default connection to **MySQL**; if an existing connection is active, it will be reused.
  - **Parameters:**
    - `AConfiguration`: **MySQL** database settings.
    - `ADatabase`: Database name.
    - `APrefix`: Connection prefix.
  - **Return:** Configured `TFDConnection` instance.

- **CustomConnection(const AConfiguration: TMySQLConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Description:** Returns a custom **MySQL** connection; if a connection with the specified prefix already exists, it will be reused.
  - **Parameters:**
    - `AConfiguration`: **MySQL** database settings.
    - `ADatabase`: Database name.
    - `APrefix`: Connection prefix.
  - **Return:** Configured `TFDConnection` instance.

### ⚙️ **Purpose**

This unit centralizes the creation and management of **MySQL** connections through FireDAC, promoting reuse and efficiency by managing a pool of connections.

---

### 🗂️ **Unit Horse.Connection.MySQL**

The `Horse.Connection.MySQL` unit provides integration with the **Horse** framework to manage **MySQL** database connections via **FireDAC**. This integration includes functions for configuring the connection and applying specific parameters.

#### 🔧 **Functions and Procedures**

- **MySQLConnection**
  - **Description:** Returns a configured **MySQL** connection using current definitions.
  - **Return:** Configured `TFDConnection` instance for **MySQL** database.

- **ApplyDatabaseConfiguration(const AParameter: TMySQLConfigurationParameter; const Value: TValue)**
  - **Description:** Applies a configuration parameter to the **MySQL** database using a generic value.
  - **Parameters:**
    - `AParameter`: Configuration parameter to be applied.
    - `Value`: Parameter value as `TValue`.

- **SetConnectionPrefix(const AValue: string)**
  - **Description:** Sets the connection prefix for the **MySQL** database.
  - **Parameter:**
    - `AValue`: Value for the connection prefix.

- **HorseConnectionMySQL(Req: THorseRequest; Res: THorseResponse; Next: TProc)**
  - **Description:** Middleware for integration with **Horse**. Defines the **MySQL** database connection for each incoming HTTP request.
  - **Parameters:**
    - `Req`: **Horse** request object.
    - `Res`: **Horse** response object.
    - `Next`: Procedure to execute after configuring the connection.

### ⚙️ **Purpose**

This unit facilitates integration with the **Horse** framework, simplifying **MySQL** connection management in Delphi web applications.

---

### 🗂️ **Unit PGDatabaseConfigurationManager**

The **PGDatabaseConfigurationManager unit** provides functions to manage PostgreSQL database connection configurations using **FireDAC**. It allows the creation of reusable and customizable connection definitions.

#### 🔧 **Functions and Procedures**

- **Initialize(const AConfiguration: TPGConfiguration; const ADatabase: string; const APrefix: string);**
  - **Description:** Initializes the **FireDAC** configuration for the **PostgreSQL** database using the provided settings, the database name, and the prefix.
  - **Parameters:**
    - `AConfiguration`: Configuration settings for the **PostgreSQL** database.
    - `ADatabase`: Database name.
    - `APrefix`: Prefix used in the connection definition.
  
- **Initialize(const AConfiguration: TPGConfiguration; const APrefix: string);**
  - **Description:** Initializes the **FireDAC** configuration for the **PostgreSQL** database using the provided settings and a prefix.
  - **Parameters:**
    - `AConfiguration`: Configuration settings for the **PostgreSQL** database.
    - `APrefix`: Prefix for the connection definition.

- **Initialize(const AConfiguration: TPGConfiguration);**
  - **Description:** Initializes the **FireDAC** configuration for the **PostgreSQL** database using the provided settings without the need for a prefix.
  - **Parameter:** 
    - `AConfiguration`: Configuration settings for the **PostgreSQL** database.

- **GetConnectionDef(const APrefix: string): string;**
  - **Description:** Returns the connection definition name based on the provided prefix.
  - **Parameter:**
    - `APrefix`: Prefix used to identify the connection.
  - **Return:** Name of the connection definition with the specified prefix.

- **GetConnectionDef: string;**
  - **Description:** Returns the default connection definition name, without considering prefixes.
  - **Return:** Name of the default connection definition.

- **CreateConnectionParameters(const AConfiguration: TPGConfiguration; const ADatabase: string): TStrings;**
  - **Description:** Creates a list of connection parameters for the **PostgreSQL** database based on the provided settings.
  - **Parameters:**
    - `AConfiguration`: Configuration settings for the **PostgreSQL** database.
    - `ADatabase`: Database name.
  - **Return:** List of connection parameters.

- **EnsureFDManagerInitialized;**
  - **Description:** Ensures that the **FireDAC** manager is properly initialized and ready for use.

- **ConfigureFDManager;**
  - **Description:** Configures the **FireDAC** manager with the necessary options to ensure automatic reconnection in case of failure.

### ⚙️ **Purpose**

This **unit** centralizes the configuration of connections to the **PostgreSQL** database, allowing modular adjustments for connection options such as server, authentication, and pooling. This approach simplifies the maintenance and management of connections in large-scale applications.

---

### 🗂️ **Unit PGDatabaseConnectionManager**

The **PGDatabaseConnectionManager unit** provides robust functions to manage PostgreSQL database connections using **FireDAC**. It enables the creation of reusable and customizable connections, and includes connection pooling management, which optimizes system performance and resource utilization.

#### 🔧 **Functions and Procedures**

- **GetConnection(const AConfiguration: TPGConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Description:** Returns a **PostgreSQL** connection instance based on the provided settings, database name, and prefix.
  - **Parameters:**
    - `AConfiguration`: Configuration settings for the **PostgreSQL** database.
    - `ADatabase`: Database name.
    - `APrefix`: Prefix used to identify the connection.
  - **Return:** Configured `TFDConnection` instance.

- **GetConnection(const AConfiguration: TPGConfiguration; const APrefix: string): TFDConnection;**
  - **Description:** Returns a **PostgreSQL** connection based on the provided settings and prefix.
  - **Parameters:**
    - `AConfiguration`: Configuration settings for the **PostgreSQL** database.
    - `APrefix`: Prefix used to identify the connection.
  - **Return:** Configured `TFDConnection` instance.

- **GetConnection(const AConfiguration: TPGConfiguration): TFDConnection;**
  - **Description:** Returns a default **PostgreSQL** connection based on the provided settings.
  - **Parameter:** 
    - `AConfiguration`: Configuration settings for the **PostgreSQL** database.
  - **Return:** Configured `TFDConnection` instance.

- **SetupConnection(const AConfiguration: TPGConfiguration; const ADatabase: string; const APrefix: string; var AConnection: TFDConnection);**
  - **Description:** Configures a **PostgreSQL** connection using the provided settings and parameters. The connection is directly configured in the `AConnection` variable.
  - **Parameters:**
    - `AConfiguration`: Configuration settings for the **PostgreSQL** database.
    - `ADatabase`: Database name.
    - `APrefix`: Prefix used to identify the connection.
    - `AConnection`: Connection instance to be configured.

### ⚙️ **Purpose**

This **unit** allows the creation and management of reusable and customizable **PostgreSQL** connections using **FireDAC**. With support for connection pooling and automatic reconnection, it optimizes database operation performance and facilitates more efficient resource management.

---

### 🗂️ **Unit Horse.Connection.PG**

The **Horse.Connection.PG unit** provides integration between the **Horse** framework and the **PostgreSQL** database using **FireDAC**. It includes functions for configuring connections, applying specific parameters, and managing the connection path and prefix, enabling efficient configuration management for each HTTP request received by the Horse framework.

#### 🔧 **Functions and Procedures**

- **PGConnection: TFDConnection;**
  - **Description:** Returns a configured connection for the **PostgreSQL** database using the current settings.
  - **Return:** Configured `TFDConnection` instance for **PostgreSQL**.

- **ApplyDatabaseConfiguration(const AParameter: TPGConfigurationParameter; const Value: TValue);**
  - **Description:** Applies a configuration parameter to the **PostgreSQL** database using a generic value.
  - **Parameters:**
    - `AParameter`: Configuration parameter to be applied.
    - `Value`: Value of the parameter, as `TValue`.

- **SetConnectionPrefix(const AValue: string);**
  - **Description:** Sets the connection prefix for the **PostgreSQL** database.
  - **Parameter:** 
    - `AValue`: Value of the prefix to be set.

- **SetDatabase(const AValue: string);**
  - **Description:** Sets the database path for the **PostgreSQL** connection.
  - **Parameter:** 
    - `AValue`: Database path to be configured.

- **HorseConnectionPG(Req: THorseRequest; Res: THorseResponse; Next: TProc);**
  - **Description:** Integration middleware for **Horse**. Sets the **PostgreSQL** connection for each HTTP request received.
  - **Parameters:**
    - `Req`: **Horse** request object.
    - `Res`: **Horse** response object.
    - `Next`: Procedure to be executed after setting the connection.

### ⚙️ **Purpose**

The **Horse.Connection.PG unit** simplifies the management of **PostgreSQL** connections in **Horse**-based applications, ensuring that each HTTP request has a properly configured connection based on specified parameters. This approach facilitates the integration of **PostgreSQL** in web contexts, providing efficient and scalable integration with **Horse**.

---

### 🗂️ Unit SQLiteDatabaseConfigurationManager

The **SQLiteDatabaseConfigurationManager unit** provides functions to manage and configure connections to the **SQLite** database using **FireDAC**, allowing the creation of reusable and customizable connection definitions for various applications.

#### 🔧 Functions and Procedures

- **Initialize(const AConfiguration: TSQLiteConfiguration; const ADatabase: string; const APrefix: string);**
  - **Description:** Configures and initializes **FireDAC** for the **SQLite** database based on the provided settings, database name, and prefix.
  - **Parameters:**
    - `AConfiguration`: Connection settings for the **SQLite** database.
    - `ADatabase`: Database name.
    - `APrefix`: Prefix used to identify the connection in the **FireDAC Manager**.

- **Initialize(const AConfiguration: TSQLiteConfiguration; const APrefix: string);**
  - **Description:** Initializes the connection configuration based on the provided settings and prefix.
  - **Parameters:**
    - `AConfiguration`: Connection settings for the **SQLite** database.
    - `APrefix`: Prefix used to identify the connection.

- **Initialize(const AConfiguration: TSQLiteConfiguration);**
  - **Description:** Initializes the connection using only the provided settings, without a prefix.
  - **Parameter:** 
    - `AConfiguration`: Connection settings for the **SQLite** database.

- **GetConnectionDef(const APrefix: string): string;**
  - **Description:** Returns the connection definition name based on the provided prefix.
  - **Parameter:**
    - `APrefix`: Prefix used in the connection definition.
  - **Return:** Name of the connection definition with the prefix.

- **GetConnectionDef: string;**
  - **Description:** Returns the name of the default connection definition.
  - **Return:** Name of the default connection definition.

- **CreateConnectionParameters(const AConfiguration: TSQLiteConfiguration; const ADatabase: string): TStrings;**
  - **Description:** Creates a list of connection parameters for the **SQLite** database based on the provided settings.
  - **Parameters:**
    - `AConfiguration`: Configuration settings for the **SQLite** database.
    - `ADatabase`: Database name.
  - **Return:** List of connection parameters.

#### 🔄 Initialization and Finalization

- **EnsureFDManagerInitialized**
  - **Description:** Ensures the **FireDAC** manager is initialized.

- **ConfigureFDManager**
  - **Description:** Configures the **FireDAC** manager with the necessary options.

### ⚙️ Purpose

This unit simplifies **SQLite** connection management via **FireDAC**, offering flexible and reusable configurations for different contexts and environments.

---

### 🗂️ Unit SQLiteDatabaseConnectionManager

The **SQLiteDatabaseConnectionManager unit** provides tools to manage connections to the **SQLite** database using **FireDAC**. It supports both custom and reusable connections and includes features for connection pooling and database encryption management.

#### 🔧 Functions and Procedures

- **GetConnection(const AConfiguration: TSQLiteConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Description:** Returns a connection based on the provided settings, database name, and prefix.
  - **Parameters:**
    - `AConfiguration`: Connection settings for the **SQLite** database.
    - `ADatabase`: Database name.
    - `APrefix`: Prefix used to identify the connection.
  - **Return:** Configured instance of `TFDConnection`.

- **GetConnection(const AConfiguration: TSQLiteConfiguration; const APrefix: string): TFDConnection;**
  - **Description:** Returns a connection based on the provided settings and prefix.
  - **Parameters:**
    - `AConfiguration`: Connection settings for the **SQLite** database.
    - `APrefix`: Prefix used to identify the connection.
  - **Return:** Configured instance of `TFDConnection`.

- **GetConnection(const AConfiguration: TSQLiteConfiguration): TFDConnection;**
  - **Description:** Returns a connection based solely on the provided settings.
  - **Parameter:** 
    - `AConfiguration`: Connection settings for the **SQLite** database.
  - **Return:** Configured instance of `TFDConnection`.

- **DefaultConnection(const AConfiguration: TSQLiteConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Description:** Returns a default connection for the **SQLite** database; if a connection already exists, it will be reused.
  - **Parameters:**
    - `AConfiguration`: Connection settings for the **SQLite** database.
    - `ADatabase`: Database name.
    - `APrefix`: Prefix used to identify the connection.
  - **Return:** Configured instance of `TFDConnection`.

- **CustomConnection(const AConfiguration: TSQLiteConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Description:** Returns a custom connection for the **SQLite** database; if a connection with the prefix already exists, it will be reused.
  - **Parameters:**
    - `AConfiguration`: Connection settings for the **SQLite** database.
    - `ADatabase`: Database name.
    - `APrefix`: Prefix used to identify the connection.
  - **Return:** Configured instance of `TFDConnection`.

#### 🔄 Initialization and Finalization

- **SetupConnection**
  - **Description:** Configures a connection to the **SQLite** database with support for encryption, based on the provided settings and parameters.

- **FConnectionPool**
  - **Description:** Manages a connection pool for **SQLite**, optimizing the reuse and efficiency of database connections.

### ⚙️ Purpose

This unit enhances **SQLite** connection management with standardized and custom configurations, providing advanced features such as connection pooling and database encryption support.

---

### 🗂️ Unit Horse.Connection.SQLite

The **Horse.Connection.SQLite unit** enables integration between the **SQLite** database and the **Horse** framework using **FireDAC**. It provides methods to configure and apply connection parameters, ensuring efficient and personalized connection management for each HTTP request.

#### 🔧 Functions and Procedures

- **SQLiteConnection**
  - **Description:** Returns a configured connection to the **SQLite** database based on the current settings.
  - **Return:** Configured instance of `TFDConnection` for the **SQLite** database.

- **ApplyDatabaseConfiguration(const AParameter: TSQLiteConfigurationParameter; const AValue: TValue)**
  - **Description:** Applies a configuration parameter to the **SQLite** database using a generic value.
  - **Parameters:**
    - `AParameter`: Configuration parameter to be applied.
    - `AValue`: Value of the parameter as `TValue`.

- **ApplyDatabaseConfiguration(const AParameter: TSQLiteConfigurationParameter; const AValue: TSQLiteLockingModeType)**
  - **Description:** Applies a locking mode parameter to the **SQLite** database.
  - **Parameters:**
    - `AParameter`: Configuration parameter.
    - `AValue`: Value of type `TSQLiteLockingModeType`.

- **ApplyDatabaseConfiguration(const AParameter: TSQLiteConfigurationParameter; const AValue: TSQLiteOpenModeType)**
  - **Description:** Applies an open mode parameter to the **SQLite** database.
  - **Parameters:**
    - `AParameter`: Configuration parameter.
    - `AValue`: Value of type `TSQLiteOpenModeType`.

- **ApplyDatabaseConfiguration(const AParameter: TSQLiteConfigurationParameter; const AValue: TSQLiteEncryptType)**
  - **Description:** Applies an encryption parameter to the **SQLite** database.
  - **Parameters:**
    - `AParameter`: Configuration parameter.
    - `AValue`: Value of type `TSQLiteEncryptType`.

- **SetConnectionPrefix(const AValue: string)**
  - **Description:** Sets the connection prefix for the **SQLite** database.
  - **Parameter:**
    - `AValue`: Connection prefix.

- **SetDatabase(const AValue: string)**
  - **Description:** Sets the path for the **SQLite** database.
  - **Parameter:**
    - `AValue`: Database path.

- **HorseConnectionSQLite(Req: THorseRequest; Res: THorseResponse; Next: TProc)**
  - **Description:** Middleware for integrating **Horse** with the **SQLite** database. Configures the connection for each incoming HTTP request.
  - **Parameters:**
    - `Req`: The **Horse** request object.
    - `Res`: The **Horse** response object.
    - `Next`: The procedure to be executed next.

### ⚙️ Purpose

This unit simplifies the integration of **SQLite** with the **Horse** framework, ensuring that each HTTP request is handled by a personalized and efficient connection.

## Contributions

Contributions are welcome! Feel free to open issues and pull requests to improve this project.

## License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for more details.