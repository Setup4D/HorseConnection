# 🌐 HorseConnection

**Haga clic en no idioma que desee para leer este README:**
🇺🇸 [Inglês](https://github.com/ricksolucoes/HorseConnection/blob/main/README.md) |  
🇧🇷 [Português](https://github.com/ricksolucoes/HorseConnection/blob/main/README_pt-BR.md) |  
🇪🇸 [Espanhol](https://github.com/ricksolucoes/HorseConnection/blob/main/README_ES.md)

**HorseConnection** es un middleware desarrollado para el framework **Horse**, con el objetivo de simplificar la gestión de conexiones a bases de datos en aplicaciones **Delphi**. Utiliza el gestor de paquetes **Boss** para instalar y actualizar automáticamente las dependencias, proporcionando una integración rápida y optimizada. Al ofrecer un middleware específico para cada tipo de base de datos compatible, **HorseConnection** elimina la necesidad de configuraciones manuales repetitivas, permitiendo que cada endpoint de **Horse** se conecte automáticamente y de manera eficiente a la base de datos.

## 🎯 Sobre el Proyecto

**HorseConnection** fue creado para actuar como un middleware de integración con **Horse** — un framework HTTP REST para Delphi —, ofreciendo soporte unificado y eficiente para múltiples bases de datos. Este middleware permite que las conexiones de bases de datos se configuren una sola vez, eliminando la necesidad de ajustes manuales en cada endpoint.

## 🎯 Objetivos del Middleware

El objetivo de **HorseConnection** es encapsular toda la lógica de conexión a bases de datos, proporcionando una estructura centralizada que:

🔹 Simplifica el uso de conexiones de bases de datos en **FireDAC**.
🔹 Reduce la duplicación de código evitando configuraciones repetitivas en cada solicitud.
🔹 Previene fugas de conexión en aplicaciones de alta demanda, asegurando que las conexiones se gestionen de forma eficiente y reutilizable.

## 🚀 Funcionalidades

- **Conexión centralizada y automatizada** con diversas bases de datos, incluidas PostgreSQL, Firebird, MySQL, SQLite y Advantage Database Server, facilitando la integración con **Horse**.
- **Instalación y gestión de dependencias simplificadas** a través de **Boss**, permitiendo una configuración de middleware rápida y sin complicaciones.
- **Soporte para múltiples configuraciones de conexión**, garantizando que cada base de datos pueda configurarse según sus requisitos específicos, sin la necesidad de ajustes manuales en cada endpoint.

## 🧩 Requisitos

**🔹 Delphi** versión 10.2 o superior.
**🔹 Boss** como gestor de paquetes para Delphi. [Más información sobre Boss](https://github.com/HashLoad/boss).
**🔹 Framework Horse** para crear aplicaciones REST en Delphi:

  ```sh
  boss install horse
  ```

## 🛠️ Instalación

Para instalar **HorseConnection** y sus dependencias, ejecute el siguiente comando con **Boss**:

```sh
boss install https://github.com/ricksolucoes/HorseConnection
```

## ⚙️ Cómo Usar

### 🌐 Uso de Directivas de Idioma

Para adaptar el idioma de los mensajes de configuración y respuesta, **HorseConnection** utiliza directivas de compilación que permiten seleccionar entre **Inglés** (predeterminado), **Portugués** o **Español**. Para establecer el idioma deseado, añada una de las siguientes directivas al proyecto:

- Para **Portugués**:
  ```delphi
  {$DEFINE PORTUGUES}
  ```
- Para **Español**:
  ```delphi
  {$DEFINE ESPANHOL}
  ```

---

### 🔧 Configuración del Middleware

Importe las unidades y configure el middleware para la base de datos deseada:

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

### 🏗️ Configuración de la Base de Datos

Cada base de datos tiene parámetros específicos que pueden configurarse para satisfacer mejor las necesidades de su aplicación. A continuación se detallan las configuraciones para cada base de datos compatible.

---

#### ⚙️ Configuración de ADS

Ejemplo de configuración para la base de datos **ADS** usando la función `ApplyDatabaseConfiguration`:

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

- **👤 UserName**: Especifica el nombre de usuario para la autenticación en la base de datos ADS.
- **🔑 Password**: Especifica la contraseña de acceso a la base de datos ADS.
- **📂 Database**: Especifica la ruta completa o el nombre de la base de datos en el servidor ADS.
- **👀 ShowDelete**: Habilita la visualización de registros eliminados.
- **♻️ Pooled**: Indica si la conexión será gestionada como un pool de conexiones.
- **📊 PoolMaxItems**: Establece el número máximo de conexiones permitidas en el pool.
- **⏳ PoolExpireTimeout**: Define el tiempo, en segundos, después del cual una conexión inactiva caducará.
- **🧹 PoolCleanupTimeout**: Define el tiempo, en segundos, para la limpieza periódica de las conexiones caducadas en el pool.
- **🔤 CharacterSet**: Establece el conjunto de caracteres para la conexión, como "UTF-8" o "ANSI".
- **💻 ServerType**: Define el tipo de servidor donde se aloja la base de datos ADS.
- **🔌 Protocol**: Especifica el protocolo de comunicación usado para conectarse al servidor ADS.
- **📋 TableType**: Define el formato de las tablas utilizadas en la base de datos ADS.
- **🔒 Locking**: Define el tipo de bloqueo de datos utilizado en ADS.
- **📁 VendorLib**: Especifica la ruta a la biblioteca del proveedor (DLL) necesaria para que FireDAC se comunique con ADS.

---

### 🔄 Configuración de Firebird

Ejemplo de configuración para la base de datos **Firebird** usando la función `ApplyDatabaseConfiguration`:

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

- **👤 UserName**: Especifica el nombre de usuario para la autenticación en la base de datos Firebird.
- **🔑 Password**: Especifica la contraseña de acceso a la base de datos Firebird.
- **📂 Database**: Especifica la ruta completa o el nombre de la base de datos de Firebird.
- **🔌 Protocol**: Define el protocolo de comunicación con el servidor Firebird.
- **🌐 Server**: Especifica la dirección del servidor donde se aloja la base de datos Firebird.
- **🔌 Port**: Especifica el puerto de conexión para el servidor Firebird.
- **🔤 CharacterSet**: Define el conjunto de caracteres para la conexión.
- **🗄 OpenMode**: Define el modo de apertura de la base de datos.
- **♻️ Pooled**: Indica si la conexión será gestionada como un pool de conexiones.
- **📊 PoolMaxItems**: Establece el número máximo de conexiones permitidas en el pool.
- **⏳ PoolExpireTimeout**: Especifica el tiempo, en segundos, después del cual una conexión inactiva caducará.
- **🧹 PoolCleanupTimeout**: Especifica el tiempo, en segundos, para la limpieza periódica de las conexiones caducadas en el pool.

---

### 🔄 Configuración de MySQL

A continuación, se muestra un ejemplo de configuración de la base de datos **MySQL** utilizando la función `ApplyDatabaseConfiguration`:

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

- **👤 UserName**: Nombre de usuario para la autenticación en la base de datos MySQL.
- **🔑 Password**: Contraseña para acceder a la base de datos MySQL.
- **💾 Database**: Nombre de la base de datos MySQL.
- **🌐 Server**: Dirección del servidor MySQL.
- **🔌 Port**: Puerto de conexión de MySQL.
- **♻️ Pooled**: Especifica si la conexión se gestionará como un grupo (pool) de conexiones.
- **📊 PoolMaxItems**: Número máximo de conexiones permitidas en el pool.
- **⏳ PoolExpireTimeout**: Tiempo en segundos para que una conexión inactiva expire.
- **🧹 PoolCleanupTimeout**: Tiempo en segundos para la limpieza periódica de las conexiones expiradas en el pool.

---

### 🔄 Configuración de PostgreSQL

A continuación, se muestra un ejemplo de configuración de la base de datos **PostgreSQL** utilizando la función `ApplyDatabaseConfiguration`:

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

- **👤 UserName**: Nombre de usuario para la autenticación en la base de datos PostgreSQL.
- **🔑 Password**: Contraseña para acceder a la base de datos PostgreSQL.
- **💾 Database**: Nombre de la base de datos PostgreSQL.
- **🌐 Server**: Dirección del servidor PostgreSQL.
- **🔌 Port**: Puerto de conexión de PostgreSQL.
- **♻️ Pooled**: Especifica si la conexión se gestionará como un grupo (pool) de conexiones.
- **📊 PoolMaxItems**: Número máximo de conexiones permitidas en el pool.
- **⏳ PoolExpireTimeout**: Tiempo en segundos para que una conexión inactiva expire.
- **🧹 PoolCleanupTimeout**: Tiempo en segundos para la limpieza periódica de las conexiones expiradas en el pool.

---

### 🔄 Configuración de SQLite

A continuación, se muestra un ejemplo de configuración de la base de datos **SQLite** utilizando la función `ApplyDatabaseConfiguration`:

```delphi
ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.Database, './my_database.sqlite');
ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.Pooled, True);
ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.PoolMaxItems, 50);
ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.PoolExpireTimeout, 90000);
ApplyDatabaseConfiguration(TSQLiteConfigurationParameter.PoolCleanupTimeout, 30000);
```

- **💾 Database**: Ruta del archivo de la base de datos SQLite.
- **♻️ Pooled**: Especifica si la conexión se gestionará como un grupo (pool) de conexiones.
- **📊 PoolMaxItems**: Número máximo de conexiones permitidas en el pool.
- **⏳ PoolExpireTimeout**: Tiempo en segundos para que una conexión inactiva expire.
- **🧹 PoolCleanupTimeout**: Tiempo en segundos para la limpieza periódica de las conexiones expiradas en el pool.

---

## ⚙️ Configuración de la Base de Datos

El método `SetConnectionPrefix` se utiliza para definir un prefijo específico para el pool de conexiones, si es necesario. Este prefijo es especialmente útil al trabajar con múltiples bases de datos, evitando conflictos entre conexiones y garantizando que cada conjunto de conexiones sea identificado de forma única.

```delphi
SetConnectionPrefix(EmptyStr);
```

- **🔖 Prefijo de Conexión**: Define un prefijo para distinguir las conexiones en el pool, esencial para proyectos con múltiples bases de datos.

El método `SetDatabase` se emplea para especificar la ruta o el nombre de la base de datos, si es necesario. Este ajuste es fundamental al trabajar con múltiples bases de datos, asegurando que cada conexión acceda a la base de datos correcta y evitando conflictos.

```delphi
SetDatabase(EmptyStr);
```

- **📂 Ruta o Nombre de la Base de Datos**: Configura la base de datos objetivo, asegurando la conexión correcta en entornos con varias bases de datos.

## 🛠️ Obtención de la Conexión

Este ejemplo demuestra cómo obtener la conexión con la base de datos configurada por el middleware, utilizando el enumerado `TConnectionType` para especificar el tipo de conexión que se utilizará. El enumerado `TConnectionType` permite definir el tipo de base de datos, como **ADS**, **FB**, **MySQL**, **PG** o **SQLite**, asegurando que la conexión se realice correctamente según la base de datos seleccionada. El siguiente ejemplo muestra cómo obtener la conexión usando `GetConnection(TConnectionType.PG)`, donde `PG` representa la elección de la base de datos PostgreSQL. Este enfoque facilita la integración y el mantenimiento de diferentes tipos de bases de datos en el proyecto.

```delphi
THorse.Get('/productos',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    FDQuery: TFDQuery;
    Productos: TJSONArray;
    Producto: TJSONObject;
  begin
    FDQuery := TFDQuery.Create(nil);
    try
      SetConnectionPrefix(EmptyStr);
      SetDatabase(EmptyStr);

      FDQuery.Connection := GetConnection(TConnectionType.PG);
      
      FDQuery.SQL.Text := 'SELECT * FROM productos';
      FDQuery.Open;

      Productos := TJSONArray.Create;
      while not FDQuery.Eof do
      begin
        Producto := TJSONObject.Create;
        Producto.AddPair('id', FDQuery.FieldByName('id').AsString);
        Producto.AddPair('nombre', FDQuery.FieldByName('nombre').AsString);
        Producto.AddPair('precio', FDQuery.FieldByName('precio').AsString);
        Productos.AddElement(Producto);
        FDQuery.Next;
      end;

      Res.Send<TJSONArray>(Productos);
    finally
      FDQuery.Close;
      FDQuery.Free;
    end;
  end
);
```

## 🔍 Obtención de la Consulta

Este ejemplo demuestra cómo obtener la consulta (Query) directamente utilizando el middleware configurado. Se utiliza el enumerado `TConnectionType` para especificar la base de datos deseada, como **ADS**, **FB**, **MySQL**, **PG** o **SQLite**, facilitando el mantenimiento e integración de diferentes bases de datos en el proyecto. La función `GetQuery` se utiliza para obtener la instancia de `TFDQuery` ya configurada con la conexión apropiada, según la base de datos seleccionada en `TConnectionType`. Esto asegura que la consulta esté correctamente conectada a la base de datos especificada, simplificando la implementación y el mantenimiento del proyecto.

```delphi
THorse.Get('/producto',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    FDQuery: TFDQuery;
    Productos: TJSONArray;
    Producto: TJSONObject;
  begin
    SetConnectionPrefix(EmptyStr);
    SetDatabase(EmptyStr);

    FDQuery := GetQuery(TConnectionType.PG);
    try
      FDQuery.SQL.Text := 'SELECT * FROM productos WHERE id = :id';
      FDQuery.ParamByName('id').AsString := Req.Params['id'];
      FDQuery.Open;

      Productos := TJSONArray.Create;
      while not FDQuery.Eof do
      begin
        Producto := TJSONObject.Create;
        Producto.AddPair('id', FDQuery.FieldByName('id').AsString);
        Producto.AddPair('nombre', FDQuery.FieldByName('nombre').AsString);
        Producto.AddPair('precio', FDQuery.FieldByName('precio').AsString);
        Productos.AddElement(Producto);
        FDQuery.Next;
      end;

      Res.Send<TJSONArray>(Productos);
    finally
      FDQuery.Close;
      FDQuery.Free;
    end;
  end
);
```

### 🔀 Diferencias de Conexiones

Las diferencias entre las conexiones en el código se vuelven evidentes al usar las funciones **GetConnection(TConnectionType)** o **GetQuery(TConnectionType)**. Con estas funciones, es posible especificar qué base de datos configurar, ya sea **ADS**, **Firebird**, **MySQL**, **PostgreSQL** o **SQLite**. Este enfoque garantiza una mayor flexibilidad y simplicidad al trabajar con diferentes bases de datos dentro del mismo proyecto.

## 🧩 Explicación del Código Fuente

### 🗂️ Unidad Horse.Connection

La unidad **Horse.Connection** proporciona funciones para gestionar conexiones a bases de datos utilizando **FireDAC** en el middleware **Horse**. **HorseConnection** facilita la liberación de conexiones `TFDConnection` o instancias de `TFDQuery`, centralizando la lógica de conexión y simplificando la gestión eficiente de las conexiones dentro de las rutas del middleware.

#### 🔍 Funciones y Procedimientos

- **GetConnection(AValue: TConnectionType): TFDConnection;**
  - **Descripción:** Obtiene una conexión `TFDConnection` basada en el tipo de conexión especificado.
  - **Parámetros:**
    - `AValue`: El tipo de conexión deseado, definido por la enumeración `TConnectionType`. Las opciones incluyen:
      - `TConnectionType.ADS`: Conexión a base de datos ADS.
      - `TConnectionType.FB`: Conexión a base de datos Firebird.
      - `TConnectionType.MySQL`: Conexión a base de datos MySQL.
      - `TConnectionType.PG`: Conexión a base de datos PostgreSQL.
      - `TConnectionType.SQLite`: Conexión a base de datos SQLite.
  - **Retorno:** Devuelve una instancia de `TFDConnection` configurada según el tipo de conexión especificado.
  - **Excepción:** Lanza una excepción si el tipo de conexión no es compatible o no está especificado.

- **GetQuery(AValue: TConnectionType): TFDQuery;**
  - **Descripción:** Crea y devuelve una instancia de `TFDQuery` asociada al tipo de conexión especificado.
  - **Parámetros:**
    - `AValue`: El tipo de conexión deseado, definido por la enumeración `TConnectionType`.
  - **Retorno:** Devuelve una instancia de `TFDQuery` asociada a la conexión especificada.
  - **Excepción:** Lanza una excepción si el tipo de conexión no es compatible o no está especificado.

#### 🌐 Middleware

El middleware **HorseConnection** encapsula la lógica de conexión a bases de datos, promoviendo una gestión centralizada y reutilizable de las conexiones `TFDConnection` y `TFDQuery`. Este enfoque reduce el código repetitivo al facilitar la creación y liberación de instancias `TFDConnection` o `TFDQuery` con la conexión adecuada, además de prevenir fugas de conexión en aplicaciones que hacen uso intensivo de bases de datos.

---

### 🗂️ Unidad EnumsHelpersUtils

La unidad **EnumsHelpersUtils** define tipos enumerados y configuraciones de conexión para diversas bases de datos (PostgreSQL, ADS, SQLite, Firebird, MySQL) y proporciona funciones auxiliares para la manipulación de estos tipos.

#### 🔍 Tipos Enumerados y Estructuras de Configuración

- **TConnectionType**
  - Define los tipos de conexión compatibles:
    - `ADS`
    - `FB`
    - `MySQL`
    - `PG`
    - `SQLite`

- **TPGConfiguration**
  - Estructura de configuración para PostgreSQL.
  - **Función Default**: Devuelve una configuración predeterminada para PostgreSQL.

- **TADSConfiguration**
  - Estructura de configuración para ADS.
  - **Función Default**: Devuelve una configuración predeterminada para ADS.

- **TSQLiteConfiguration**
  - Estructura de configuración para SQLite.
  - **Función Default**: Devuelve una configuración predeterminada para SQLite.

- **TFBConfiguration**
  - Estructura de configuración para Firebird.
  - **Función Default**: Devuelve una configuración predeterminada para Firebird.

- **TMySQLConfiguration**
  - Estructura de configuración para MySQL.
  - **Función Default**: Devuelve una configuración predeterminada para MySQL.

#### 🔧 Funciones Auxiliares

- **ToString**
  - Disponible para cada tipo enumerado, como `TConnectionType`, `TADSServerType`, `TADSCharacterSet`, `TADSProtocol`, entre otros.
  - **Descripción**: Convierte el valor del tipo enumerado en una cadena representativa.

#### 📄 Ejemplo de Uso

```delphi
var
  Config: TPGConfiguration;
begin
  Config := TPGConfiguration.Default;
end;
```

---

### 🗂️ Unidad SystemUtils

La unidad **SystemUtils** proporciona utilidades para operaciones de sistema, incluyendo la manipulación de rutas y el lanzamiento de excepciones para tipos inválidos.

#### 🔍 Funciones y Procedimientos

- **RaiseInvalidTypeException**
  - **Descripción:** Lanza una excepción indicando que un campo tiene un tipo incorrecto.
  - **Parámetros:**
    - `AFieldName` (string): Nombre del campo con el tipo incorrecto.
    - `AExpectedType` (string): Tipo esperado para el campo.
  - **Excepción:** Lanza una excepción formateada para identificar errores de tipo en tiempo de ejecución.
  - **Ejemplo de Uso**:
    ```delphi
    RaiseInvalidTypeException('NombreCampo', 'Integer');
    ```

- **GetAbsolutePath**
  - **Descripción:** Obtiene la ruta absoluta basada en una ruta relativa proporcionada.
  - **Parámetros:**
    - `ARelativePath` (string): Ruta relativa a convertir.
  - **Retorno:** Devuelve la ruta absoluta correspondiente.
  - **Nota:** Si la ruta relativa comienza con ".\", se combinará con el directorio de la aplicación; de lo contrario, devuelve la propia ruta proporcionada.
  - **Ejemplo de Uso**:
    ```delphi
    var
      RutaAbsoluta: string;
    begin
      RutaAbsoluta := GetAbsolutePath('.\directorio\archivo.txt');
    end;
    ```

### ⚠️ Excepciones

La unidad **SystemUtils** utiliza excepciones para señalar tipos de datos incorrectos en `RaiseInvalidTypeException`, permitiendo una validación más estricta de los tipos de campo durante la ejecución. Esta unidad es útil para la manipulación de rutas y la validación de tipos de campo, centralizando utilidades comunes para operaciones del sistema.

---

## 🧩 Explicación del Código Fuente

### 🗂️ Unidad MethodReferencesUtils

La unidad **MethodReferencesUtils** define tipos de referencia de métodos (procedimientos y funciones) para configuraciones y conexiones de bases de datos.

#### 🔍 Tipos

- **TFunctionConnection**
  - **Descripción**: Referencia a una función que retorna una conexión `TFDConnection`.
  - **Retorno**: Un objeto `TFDConnection` que representa la conexión.
  - **Uso**: Facilita la creación de referencias de función para obtener una conexión FireDAC, permitiendo que otras unidades o métodos ejecuten la función de conexión de manera genérica y reutilizable.

  - **Ejemplo de Uso**:
    ```delphi
    var
      GetConnection: TFunctionConnection;
    begin
      GetConnection := function: TFDConnection
        begin
          Result := TFDConnection.Create(nil); // Implementación específica
        end;
    end;
    ```

- **TDatabaseConfigurator<T>**
  - **Descripción**: Procedimiento genérico de configuración para una base de datos.
  - **Parámetros**:
    - `AConfiguration` (var T): Configuración de la base de datos que será modificada.
    - `AValue` (TValue): Valor a ser aplicado en la configuración.
  - **Uso**: Permite modificar configuraciones específicas de bases de datos a través de procedimientos parametrizados, posibilitando la aplicación de diferentes valores a varias configuraciones de forma flexible y genérica.

  - **Ejemplo de Uso**:
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

### ⚙️ Finalidad

Esta unidad centraliza las referencias de métodos para conexiones y configuraciones, facilitando la aplicación de procedimientos de configuración en diversos contextos de bases de datos. Es particularmente útil en sistemas donde se emplean múltiples tipos de bases de datos y requieren configuraciones específicas.

---

### 🗂️ Unidad CharacterSetUtils

La unidad **CharacterSetUtils** proporciona funciones auxiliares para agregar diferentes conjuntos de caracteres al **TDictionary**, permitiendo la conversión de tipos de conjuntos de caracteres para **Firebird**.

#### 🔍 Funciones y Procedimientos

- **AddBasicCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);**
  - **Descripción:** Agrega conjuntos de caracteres básicos al diccionario.
  - **Parámetro:** 
    - `Dictionary`: Diccionario donde se añadirán los conjuntos de caracteres.

- **AddDOSCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);**
  - **Descripción:** Agrega conjuntos de caracteres **DOS** al diccionario.
  - **Parámetro:** 
    - `Dictionary`: Diccionario donde se añadirán los conjuntos de caracteres.

- **AddISOCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);**
  - **Descripción:** Agrega conjuntos de caracteres **ISO** al diccionario.
  - **Parámetro:** 
    - `Dictionary`: Diccionario donde se añadirán los conjuntos de caracteres.

- **AddWinCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);**
  - **Descripción:** Agrega conjuntos de caracteres **Windows** al diccionario.
  - **Parámetro:** 
    - `Dictionary`: Diccionario donde se añadirán los conjuntos de caracteres.

- **AddMiscellaneousCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);**
  - **Descripción:** Agrega otros conjuntos de caracteres al diccionario.
  - **Parámetro:** 
    - `Dictionary`: Diccionario donde se añadirán los conjuntos de caracteres.

### ⚙️ Finalidad

Esta unidad facilita la configuración y adición de varios conjuntos de caracteres al **TDictionary** para la manipulación de conjuntos de caracteres en **Firebird**, garantizando soporte para diferentes estándares de codificación.

---

### 🗂️ Unidad ADSDataBaseConfigurationParameter

La unidad **ADSDataBaseConfigurationParameter** proporciona métodos para configurar parámetros específicos de una instancia de `TADSConfiguration`, utilizada para preparar **FireDAC** (`TFDConnection`) con el controlador **ADS** (Advantage Database Server). Esta configuración permite definir valores como el tipo de servidor, el conjunto de caracteres, el protocolo y otras opciones de conexión.

#### 🔍 Funciones y Procedimientos

- **DatabaseConfig**
  - **Descripción**: Configura parámetros específicos en una instancia de `TADSConfiguration` basada en los valores proporcionados.
  - **Parámetros**:
    - `AConfiguration` (var `TADSConfiguration`): La configuración de base de datos ADS a ajustar.
    - `AParameter` (`TADSConfigurationParameter`): El parámetro de configuración a modificar.
    - `AValue` (`TValue`, `TADSServerType`, `TADSCharacterSet`, `TADSProtocol`, `TADSTableType`, `TADSLocking`): El valor a aplicar al parámetro.
  - **Sobrecargas**:
    - `DatabaseConfig(var AConfiguration: TADSConfiguration; AParameter: TADSConfigurationParameter; const AValue: TValue)`: Configura con un valor genérico `TValue`.
    - Configuraciones específicas para tipo de servidor (`TADSServerType`), conjunto de caracteres (`TADSCharacterSet`), protocolo (`TADSProtocol`), tipo de tabla (`TADSTableType`) y bloqueo (`TADSLocking`).

- **SetDatabase**
  - **Descripción**: Define la ruta de la base de datos en la configuración `TADSConfiguration`.
  - **Ejemplo**:
    ```delphi
    SetDatabase(MyConfig, 'C:\databases\example.db');
    ```

- **SetUserName** / **SetPassword**
  - Define el nombre de usuario y la contraseña en la configuración.

- **SetCharacterSet**
  - Define el conjunto de caracteres (`TADSCharacterSet`).

- **SetPooled**
  - Habilita o deshabilita el pool de conexiones.

### ⚠️ Excepciones
- **RaiseInvalidTypeException**: Lanza una excepción al detectar un tipo incorrecto, facilitando la depuración.

### ⚙️ Propósito

Esta unidad es esencial para configurar parámetros de conexión de **FireDAC** con **ADS**, centralizando procedimientos que permiten al desarrollador ajustar la conexión de manera modular y consistente.

---

### 🗂️ Unidad FBDataBaseConfigurationParameter

La unidad **FBDataBaseConfigurationParameter** proporciona procedimientos para configurar parámetros específicos de una instancia de `TFBConfiguration`, utilizada para preparar **FireDAC** (`TFDConnection`) con el controlador **Firebird**. Esta configuración permite definir valores como el protocolo, el modo de apertura, el conjunto de caracteres y otras opciones de conexión para la base de datos Firebird.

#### 🔍 Funciones y Procedimientos

- **DatabaseConfig**
  - **Descripción**: Configura parámetros específicos en una instancia de `TFBConfiguration` basada en los valores proporcionados.
  - **Parámetros**:
    - `AConfiguration` (var `TFBConfiguration`): La configuración de base de datos Firebird a ajustar.
    - `AParameter` (`TFBConfigurationParameter`): El parámetro de configuración a modificar.
    - `AValue` (`TValue`, `TFBProtocolType`, `TFBOpenModeType`, `TFBCharacterSetType`): El valor a aplicar al parámetro.
  - **Sobrecargas**:
    - `DatabaseConfig(var AConfiguration: TFBConfiguration; AParameter: TFBConfigurationParameter; const AValue: TValue)`: Configura con un valor genérico `TValue`.
    - Configuraciones específicas para tipo de protocolo (`TFBProtocolType`), modo de apertura (`TFBOpenModeType`) y conjunto de caracteres (`TFBCharacterSetType`).

- **SetDatabase**
  - **Descripción**: Define la ruta de la base de datos en la configuración `TFBConfiguration`.
  - **Ejemplo**:
    ```delphi
    SetDatabase(MyConfig, 'C:\databases\example.fdb');
    ```

- **SetUserName** / **SetPassword**
  - Define el nombre de usuario y la contraseña en la configuración.

- **SetProtocol**
  - Define el protocolo de conexión (`TFBProtocolType`).

- **SetOpenMode**
  - Define el modo de apertura de la base de datos (`TFBOpenModeType`).

- **SetCharacterSet**
  - Define el conjunto de caracteres (`TFBCharacterSetType`).

- **

SetPooled**
  - Habilita o deshabilita el pool de conexiones.

### ⚠️ Excepciones
- **RaiseInvalidTypeException**: Lanza una excepción al detectar un tipo incorrecto, facilitando la depuración.

### ⚙️ Propósito

La unidad **FBDataBaseConfigurationParameter** es esencial para configurar parámetros de conexión de **FireDAC** con **Firebird**, centralizando procedimientos que permiten al desarrollador ajustar la conexión con la base de datos de forma modular y consistente, incluyendo características de protocolo, conjunto de caracteres y otros parámetros técnicos.


---

### 🗂️ Unidad `SQLiteDataBaseConfigurationParameter`

La **unidad `SQLiteDataBaseConfigurationParameter`** proporciona procedimientos específicos para configurar parámetros en una instancia de `TSQLiteConfiguration`, utilizada para configurar `TFDConnection` en FireDAC con el controlador SQLite. Esta unidad permite definir valores de parámetros como el modo de bloqueo, el modo de apertura, el tipo de encriptación y otras opciones de conexión, optimizando la conectividad con la base de datos SQLite.

#### 🔧 Funciones y Procedimientos

- **DatabaseConfig** (Sobrecargas)
  - **Descripción**: Configura un parámetro específico en una instancia de `TSQLiteConfiguration`, ajustándolo según el tipo de valor proporcionado.

  - **Sobrecarga 1** – Parámetro Genérico
    - **Parámetros**:
      - `AConfiguration` (var `TSQLiteConfiguration`): La configuración de la base de datos SQLite a modificar.
      - `AParameter` (`TSQLiteConfigurationParameter`): El parámetro de configuración a ajustar.
      - `AValue` (`TValue`): Valor genérico aplicado al parámetro.
    - **Ejemplo**:
      ```delphi
      DatabaseConfig(SQLiteConfig, TSQLiteConfigurationParameter.Database, 'database_path');
      ```

  - **Sobrecarga 2** – Modo de Bloqueo
    - **Parámetros**:
      - `AConfiguration` (var `TSQLiteConfiguration`): La configuración de la base de datos SQLite.
      - `AParameter` (`TSQLiteConfigurationParameter`): El parámetro que define el modo de bloqueo.
      - `AValue` (`TSQLiteLockingModeType`): El valor del modo de bloqueo que se aplicará.
    - **Ejemplo**:
      ```delphi
      DatabaseConfig(SQLiteConfig, TSQLiteConfigurationParameter.LockingMode, lmNormal);
      ```

  - **Sobrecarga 3** – Modo de Apertura
    - **Parámetros**:
      - `AConfiguration` (var `TSQLiteConfiguration`): La configuración de la base de datos SQLite.
      - `AParameter` (`TSQLiteConfigurationParameter`): El parámetro que define el modo de apertura.
      - `AValue` (`TSQLiteOpenModeType`): El valor del modo de apertura que se aplicará.
    - **Ejemplo**:
      ```delphi
      DatabaseConfig(SQLiteConfig, TSQLiteConfigurationParameter.OpenMode, omReadWrite);
      ```

  - **Sobrecarga 4** – Tipo de Encriptación
    - **Parámetros**:
      - `AConfiguration` (var `TSQLiteConfiguration`): La configuración de la base de datos SQLite.
      - `AParameter` (`TSQLiteConfigurationParameter`): El parámetro que define el tipo de encriptación.
      - `AValue` (`TSQLiteEncryptType`): El valor del tipo de encriptación que se aplicará.
    - **Ejemplo**:
      ```delphi
      DatabaseConfig(SQLiteConfig, TSQLiteConfigurationParameter.Encrypt, etAES256);
      ```

#### 🔐 Parámetros de Conexión Específicos

- **SetDatabase**
  - **Descripción**: Define la ruta de la base de datos en la configuración SQLite.
  - **Ejemplo**:
    ```delphi
    SetDatabase(SQLiteConfig, 'database_path');
    ```

- **SetUserName** / **SetPassword**
  - **Descripción**: Configura el nombre de usuario y la contraseña para la autenticación de conexión SQLite.

- **SetPooled**
  - **Descripción**: Define si el grupo de conexiones (pooling) está habilitado.

- **SetPoolMaxItems** / **SetPoolExpireTimeout** / **SetPoolCleanupTimeout**
  - **Descripción**: Configura el número máximo de conexiones, el tiempo de expiración y el tiempo de limpieza para el grupo de conexiones.

### ⚠️ Excepciones
- `RaiseInvalidTypeException`: Lanza una excepción cuando el tipo de valor proporcionado no coincide con el tipo esperado para el parámetro de configuración, asegurando la coherencia de datos y facilitando la identificación de errores de tipo.

### ⚙️ Propósito

La unidad `SQLiteDataBaseConfigurationParameter` centraliza la configuración de FireDAC para SQLite, ofreciendo una interfaz flexible y modular para definir rutas de bases de datos, parámetros de autenticación y opciones de agrupamiento, optimizando la gestión de conexiones SQLite.

---

### 🗂️ Unidad `ADSDatabaseConfigurationManager`

La **unidad `ADSDatabaseConfigurationManager`** proporciona funciones y procedimientos para configurar e inicializar una conexión con la base de datos **ADS (Advantage Database Server)** usando **FireDAC** (`TFDConnection`). Permite definir parámetros de conexión, prefijos personalizados y gestionar las definiciones de conexión dentro del gestor de **FireDAC**.

#### 🔧 Funciones y Procedimientos

- **Initialize(const AConfiguration: TADSConfiguration; const ADatabase: string; const APrefix: string);**
  - **Descripción:** Inicializa una conexión con la base de datos **ADS** usando las configuraciones especificadas, un nombre personalizado para la base de datos y un prefijo para el gestor de **FireDAC**.
  - **Parámetros:**
    - `AConfiguration`: Parámetros de configuración de conexión para la base de datos **ADS**.
    - `ADatabase`: Nombre personalizado para la base de datos.
    - `APrefix`: Prefijo para definir la conexión en el gestor de **FireDAC**.

- **Initialize(const AConfiguration: TADSConfiguration; const APrefix: string);**
  - **Descripción:** Inicializa una conexión con la base de datos **ADS** usando las configuraciones especificadas y un prefijo personalizado.
  - **Parámetros:**
    - `AConfiguration`: Parámetros de configuración de conexión para la base de datos **ADS**.
    - `APrefix`: Prefijo para definir la conexión.

- **Initialize(const AConfiguration: TADSConfiguration);**
  - **Descripción:** Inicializa una conexión con la base de datos **ADS** usando solo las configuraciones proporcionadas.
  - **Parámetro:** 
    - `AConfiguration`: Parámetros de configuración de conexión para la base de datos **ADS**.

- **GetConnectionDef(const APrefix: string): string;**
  - **Descripción:** Retorna el nombre de la definición de conexión en el gestor de **FireDAC** utilizando un prefijo personalizado.
  - **Parámetro:**
    - `APrefix`: Prefijo para la definición de la conexión.
  - **Retorno:** Nombre de la definición de la conexión con el prefijo especificado.

- **GetConnectionDef: string;**
  - **Descripción:** Retorna el nombre de la definición de conexión por defecto en el gestor de **FireDAC**.
  - **Retorno:** Nombre de la definición de conexión por defecto.

- **CreateConnectionParameters(const AConfiguration: TADSConfiguration; const ADatabase: string): TStrings;**
  - **Descripción:** Crea una lista de parámetros de conexión para la base de datos **ADS** basado en la configuración proporcionada.
  - **Parámetros:**
    - `AConfiguration`: Parámetros de configuración de conexión para la base de datos **ADS**.
    - `ADatabase`: Nombre de la base de datos.
  - **Retorno:** Lista de parámetros de conexión.

- **EnsureFDManagerInitialized;**
  - **Descripción:** Asegura que el gestor de **FireDAC** esté inicializado.

- **ConfigureFDManager;**
  - **Descripción:** Configura el gestor de **FireDAC** con las opciones necesarias para soportar la reconexión automática.

---

### 🗂️ Unidad `ADSDataBaseConnectionManager`

La **unidad `ADSDataBaseConnectionManager`** gestiona las conexiones reutilizables con la base de datos **Advantage Database Server (ADS)** usando **FireDAC**. Permite la creación de conexiones personalizadas y la gestión de un pool de conexiones para optimizar el rendimiento.

#### 🔧 Funciones y Procedimientos

- **GetConnection(const AConfiguration: TADSConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descripción:** Retorna una conexión con la base de datos **ADS** basado en la configuración proporcionada, el nombre de la base de datos y el prefijo.
  - **Parámetros:**
    - `AConfiguration`: Parámetros de configuración de conexión para la base de datos **ADS**.
    - `ADatabase`: Nombre de la base de datos.
    - `APrefix`: Prefijo para identificar la conexión.
  - **Retorno:** Instancia configurada de `TFDConnection`.

- **GetConnection(const AConfiguration: TADSConfiguration; const APrefix: string): TFDConnection;**
  - **Descripción:** Retorna una conexión con la base de datos **ADS** basado en la configuración proporcionada y el prefijo.
  - **Parámetros:**
    - `AConfiguration`: Parámetros de configuración de conexión para la base de datos **ADS**.
    - `APrefix`: Prefijo para identificar la conexión.
  - **Retorno:** Instancia configurada de `TFDConnection`.

- **GetConnection(const AConfiguration: TADSConfiguration): TFDConnection;**
  - **Descripción:** Retorna una conexión con la base de datos **ADS** basado solo en la configuración proporcionada.
  - **Parámetro:** 
    - `AConfiguration`: Parámetros de configuración de conexión para la base de datos **ADS**.
  - **Retorno:** Instancia configurada de `TFDConnection`.

- **SetupConnection(const AConfiguration: TADSConfiguration; const ADatabase: string; const APrefix: string; var AConnection: TFDConnection);**
  - **Descripción:** Configura una conexión con la base de datos **ADS** basado en la configuración y parámetros proporcionados.
  - **Parámetros:**
    - `AConfiguration`: Parámetros de configuración de conexión para la base de datos **ADS**.
    - `ADatabase`: Nombre de la base de datos.
    - `APrefix`: Prefijo para identificar la conexión.
    - `AConnection`: La conexión a ser configurada.
  - **Excepción:** Lanza una excepción si no se encuentra el DLL especificado en `VendorLib`.

---

### 🗂️ Unidad `Horse.Connection.ADS`

La **unidad `Horse.Connection.ADS`** integra el framework **Horse** con la base de datos **Advantage Database Server (ADS)** usando **FireDAC**. Proporciona funciones para configurar la conexión y aplicar parámetros específicos de configuración.

#### 🔧 Funciones y Procedimientos

- **ADSConnection: TFDConnection;**
  - **Descripción:** Retorna una conexión configurada para la base de datos **ADS** usando la configuración actual.
  - **Retorno:** Instancia de `TFDConnection` configurada para la base de datos **ADS**.

- **ApplyDatabaseConfiguration** (varias sobrecargas para diferentes tipos)
  - **Descripción:** Aplica un parámetro de configuración a la base de datos **ADS**. Los tipos de configuración incluyen `TADSServerType`, `TADSCharacterSet`, `TADSProtocol`, y otros.
  - **Parámetros:** 
    - `AParameter`: El parámetro de configuración que se va a aplicar.
    - `Value`: El valor del parámetro en el tipo esperado.

- **SetConnectionPrefix(const AValue: string);**
  - **Descripción:** Establece el prefijo de conexión para la base de datos **ADS**.
  - **Parámetro:** 
    - `AValue`: El valor del prefijo de conexión.

- **SetDatabase(const AValue: string);**
  - **Descripción:** Establece la ruta de la base de datos para **ADS**.
  - **Parámetro:** 
    - `AValue`: La ruta de la base de datos.

- **HorseConnectionADS(Req: THorseRequest; Res: THorseResponse; Next: TProc);**
  - **Descripción:** Middleware para integrar con el framework **Horse**. Define la conexión con la base de datos **ADS** para cada solicitud HTTP.
  - **Parámetros:**
    - `Req`: El objeto de solicitud de **Horse**.
    - `Res`: El objeto de respuesta de **Horse**.
    - `Next`: El siguiente procedimiento a ser ejecutado.

---

### ⚠️ Excepciones

- **RaiseInvalidTypeException**: Lanza una excepción cuando el tipo de un parámetro de configuración no coincide con el tipo esperado, ayudando a identificar y resolver errores de configuración.

---

### 🗂️ **Unidad `FBDatabaseConfigurationManager`**

La **unidad `FBDatabaseConfigurationManager`** proporciona funciones para gestionar las configuraciones de conexión a la base de datos **Firebird** utilizando **FireDAC**. Permite la creación de definiciones de conexión reutilizables y personalizadas, optimizando la gestión de conexiones.

#### 🔧 **Funciones y Procedimientos**

- **Initialize(const AConfiguration: TFBConfiguration; const ADatabase: string; const APrefix: string);**
  - **Descripción:** Inicializa la configuración de **FireDAC** para la base de datos **Firebird** basada en la configuración proporcionada, el nombre de la base de datos y el prefijo.
  - **Parámetros:**
    - `AConfiguration`: Configuración de conexión para la base de datos **Firebird**.
    - `ADatabase`: Nombre de la base de datos.
    - `APrefix`: Prefijo utilizado para identificar la conexión.

- **Initialize(const AConfiguration: TFBConfiguration; const APrefix: string);**
  - **Descripción:** Inicializa la configuración de **FireDAC** para la base de datos **Firebird** basada en la configuración proporcionada y el prefijo.
  - **Parámetros:**
    - `AConfiguration`: Configuración de conexión para la base de datos **Firebird**.
    - `APrefix`: Prefijo utilizado para identificar la conexión.

- **Initialize(const AConfiguration: TFBConfiguration);**
  - **Descripción:** Inicializa la configuración de **FireDAC** para la base de datos **Firebird** utilizando solo la configuración proporcionada.
  - **Parámetro:** 
    - `AConfiguration`: Configuración de conexión para la base de datos **Firebird**.

- **GetConnectionDef(const APrefix: string): string;**
  - **Descripción:** Devuelve el nombre de la definición de conexión basado en el prefijo proporcionado.
  - **Parámetro:**
    - `APrefix`: Prefijo utilizado para identificar la conexión.
  - **Retorno:** Nombre de la definición de conexión.

- **GetConnectionDef: string;**
  - **Descripción:** Devuelve el nombre de la definición de conexión predeterminada.
  - **Retorno:** Nombre de la definición de conexión predeterminada.

- **CreateConnectionParameters(const AConfiguration: TFBConfiguration; const ADatabase: string): TStrings;**
  - **Descripción:** Crea una lista de parámetros de conexión para la base de datos **Firebird** basada en la configuración proporcionada.
  - **Parámetros:**
    - `AConfiguration`: Configuración de conexión para la base de datos **Firebird**.
    - `ADatabase`: Nombre de la base de datos.
  - **Retorno:** Una lista de parámetros de conexión representados como `TStrings`.

- **EnsureFDManagerInitialized;**
  - **Descripción:** Asegura que el **FireDAC Manager** esté correctamente inicializado.

- **ConfigureFDManager;**
  - **Descripción:** Configura el **FireDAC Manager** con las opciones necesarias para la reconexión automática.

### ⚙️ **Finalidad**

Esta **unidad** es esencial para gestionar y personalizar las conexiones con la base de datos **Firebird**, centralizando las definiciones de conexión y facilitando la reutilización y el mantenimiento de las configuraciones dentro de **FireDAC**.

___

### 🗂️ **Unidad `FBDatabaseConnectionManager`**

La **unidad `FBDatabaseConnectionManager`** proporciona funciones para gestionar las conexiones a la base de datos **Firebird** utilizando **FireDAC**. Permite la creación de conexiones reutilizables y personalizadas, así como la gestión de un pool de conexiones.

#### 🔧 **Funciones y Procedimientos**

- **GetConnection(const AConfiguration: TFBConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descripción:** Devuelve una conexión configurada a la base de datos **Firebird** basada en la configuración proporcionada, el nombre de la base de datos y el prefijo.
  - **Parámetros:**
    - `AConfiguration`: Configuración de conexión para la base de datos **Firebird**.
    - `ADatabase`: Nombre de la base de datos.
    - `APrefix`: Prefijo utilizado para identificar la conexión.
  - **Retorno:** Una instancia configurada de `TFDConnection`.

- **GetConnection(const AConfiguration: TFBConfiguration; const APrefix: string): TFDConnection;**
  - **Descripción:** Devuelve una conexión configurada a la base de datos **Firebird** basada en la configuración proporcionada y el prefijo.
  - **Parámetros:**
    - `AConfiguration`: Configuración de conexión para la base de datos **Firebird**.
    - `APrefix`: Prefijo utilizado para identificar la conexión.
  - **Retorno:** Una instancia configurada de `TFDConnection`.

- **GetConnection(const AConfiguration: TFBConfiguration): TFDConnection;**
  - **Descripción:** Devuelve una conexión configurada a la base de datos **Firebird** basada únicamente en la configuración proporcionada.
  - **Parámetro:** 
    - `AConfiguration`: Configuración de conexión para la base de datos **Firebird**.
  - **Retorno:** Una instancia configurada de `TFDConnection`.

- **DefaultConnection(const AConfiguration: TFBConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descripción:** Devuelve una conexión predeterminada a la base de datos **Firebird**. Si ya existe una conexión predeterminada, se reutilizará.
  - **Parámetros:**
    - `AConfiguration`: Configuración de conexión para la base de datos **Firebird**.
    - `ADatabase`: Nombre de la base de datos.
    - `APrefix`: Prefijo utilizado para identificar la conexión.
  - **Retorno:** Una instancia configurada de `TFDConnection`.

- **CustomConnection(const AConfiguration: TFBConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descripción:** Devuelve una conexión personalizada a la base de datos **Firebird**. Si ya existe una conexión con el prefijo proporcionado, se devolverá esa conexión.
  - **Parámetros:**
    - `AConfiguration`: Configuración de conexión para la base de datos **Firebird**.
    - `ADatabase`: Nombre de la base de datos.
    - `APrefix`: Prefijo utilizado para identificar la conexión.
  - **Retorno:** Una instancia configurada de `TFDConnection`.

- **SetupConnection(const AConfiguration: TFBConfiguration; const ADatabase: string; const APrefix: string; var AConnection: TFDConnection);**
  - **Descripción:** Configura una conexión a la base de datos **Firebird** basada en los parámetros y configuración proporcionados.
  - **Parámetros:**
    - `AConfiguration`: Configuración de conexión para la base de datos **Firebird**.
    - `ADatabase`: Nombre de la base de datos.
    - `APrefix`: Prefijo utilizado para identificar la conexión.
    - `AConnection`: La conexión que se configurará.

### ⚙️ **Finalidad**

Esta **unidad** es fundamental para gestionar las conexiones a la base de datos **Firebird**, centralizando el control de conexiones estándar y personalizadas. Garantiza eficiencia y reutilización mediante la gestión de un pool de conexiones.

___

### 🗂️ **Unidad `Horse.Connection.FB`**

La **unidad `Horse.Connection.FB`** proporciona integración con el framework **Horse**, permitiendo la gestión de conexiones a la base de datos **Firebird** mediante **FireDAC**. Incluye funciones para configurar la conexión y aplicar parámetros específicos de configuración.

#### 🔧 **Funciones y Procedimientos**

- **FBConnection: TFDConnection;**
  - **Descripción:** Devuelve una conexión configurada para la base de datos **Firebird** utilizando la configuración actual.
  - **Retorno:** Una instancia configurada de `TFDConnection` para la base de datos **Firebird**.

- **ApplyDatabaseConfiguration(const AParameter: TFBConfigurationParameter; const Value: TValue);**
  - **Descripción:** Aplica un parámetro de configuración a la base de datos **Firebird** utilizando un valor genérico.
  - **Parámetros:**
    - `AParameter`: El parámetro de configuración que se aplicará.
    - `Value`: El valor del parámetro como `TValue`.

- **ApplyDatabaseConfiguration(const AParameter: TFBConfigurationParameter; const Value: TFBProtocolType);**
  - **Descripción:** Aplica un parámetro de tipo de protocolo a la base de datos **Firebird**.
  - **Parámetros:**
    - `AParameter`: El

 parámetro de configuración que se aplicará.
    - `Value`: El valor del parámetro como `TFBProtocolType`.

- **ApplyDatabaseConfiguration(const AParameter: TFBConfigurationParameter; const Value: TFBOpenModeType);**
  - **Descripción:** Aplica un parámetro de modo de apertura a la base de datos **Firebird**.
  - **Parámetros:**
    - `AParameter`: El parámetro de configuración que se aplicará.
    - `Value`: El valor del parámetro como `TFBOpenModeType`.

- **ApplyDatabaseConfiguration(const AParameter: TFBConfigurationParameter; const Value: TFBCharacterSetType);**
  - **Descripción:** Aplica un parámetro de conjunto de caracteres a la base de datos **Firebird**.
  - **Parámetros:**
    - `AParameter`: El parámetro de configuración que se aplicará.
    - `Value`: El valor del parámetro como `TFBCharacterSetType`.

- **SetConnectionPrefix(const AValue: string);**
  - **Descripción:** Establece el prefijo de la conexión para la base de datos **Firebird**.
  - **Parámetro:** 
    - `AValue`: El valor del prefijo.

- **SetDatabase(const AValue: string);**
  - **Descripción:** Establece la ruta de la base de datos para **Firebird**.
  - **Parámetro:** 
    - `AValue`: La ruta de la base de datos.

- **HorseConnectionFB(Req: THorseRequest; Res: THorseResponse; Next: TProc);**
  - **Descripción:** Middleware para integración con **Horse**. Define la conexión a la base de datos **Firebird** para cada solicitud HTTP recibida.
  - **Parámetros:**
    - `Req`: El objeto de solicitud de **Horse**.
    - `Res`: El objeto de respuesta de **Horse**.
    - `Next`: El procedimiento que se ejecutará a continuación.

---

### ⚙️ **Finalidad**

Esta **unidad** facilita la integración de la base de datos **Firebird** con el framework **Horse**, permitiendo que cada solicitud HTTP utilice una conexión configurada de manera optimizada y flexible, con soporte para parámetros específicos y personalizables.

---

### 🗂️ **Unit MySQLDatabaseConfigurationManager**

La **unit MySQLDatabaseConfigurationManager** proporciona métodos para gestionar configuraciones de conexión con la base de datos **MySQL** utilizando **FireDAC**. Esta unidad permite definir configuraciones reutilizables y personalizadas, facilitando el manejo y mantenimiento de conexiones **MySQL** en diversos contextos.

#### 🔧 **Funciones y Procedimientos Principales**

- **Initialize(const AConfiguration: TMySQLConfiguration; const ADatabase: string; const APrefix: string);**
  - **Descripción:** Inicializa la configuración de FireDAC para una conexión **MySQL** según las configuraciones proporcionadas, el nombre de la base de datos y el prefijo.
  - **Parámetros:**
    - `AConfiguration`: Configuraciones de conexión para **MySQL**.
    - `ADatabase`: Nombre de la base de datos.
    - `APrefix`: Prefijo que identifica la conexión en el FireDAC Manager.

- **Initialize(const AConfiguration: TMySQLConfiguration; const APrefix: string);**
  - **Descripción:** Configura la conexión de FireDAC para **MySQL** utilizando las configuraciones y el prefijo proporcionados.
  - **Parámetros:**
    - `AConfiguration`: Configuraciones de conexión para **MySQL**.
    - `APrefix`: Prefijo para identificar la conexión.

- **Initialize(const AConfiguration: TMySQLConfiguration);**
  - **Descripción:** Configura la conexión de FireDAC para **MySQL** utilizando solo las configuraciones proporcionadas.
  - **Parámetro:** 
    - `AConfiguration`: Configuraciones de conexión para **MySQL**.

- **GetConnectionDef(const APrefix: string): string;**
  - **Descripción:** Devuelve el nombre de la definición de conexión basado en el prefijo especificado.
  - **Parámetro:**
    - `APrefix`: Prefijo usado en la definición de conexión.
  - **Retorno:** Nombre de la definición de conexión con el prefijo aplicado.

- **CreateConnectionParameters(const AConfiguration: TMySQLConfiguration; const ADatabase: string): TStrings;**
  - **Descripción:** Genera una lista de parámetros de conexión para **MySQL** basados en las configuraciones proporcionadas.
  - **Parámetros:**
    - `AConfiguration`: Configuraciones de la base de datos **MySQL**.
    - `ADatabase`: Nombre de la base de datos.
  - **Retorno:** Lista de parámetros de conexión.

#### 🔄 **Controles de Inicialización y Finalización**

- **EnsureFDManagerInitialized**
  - **Descripción:** Garantiza que el FireDAC Manager esté activo e inicializado.

- **ConfigureFDManager**
  - **Descripción:** Configura el FireDAC Manager con las opciones necesarias para la conexión.

### ⚙️ **Finalidad**

Esta unidad centraliza y facilita la gestión de conexiones **MySQL** a través de FireDAC, permitiendo configuraciones personalizadas y reutilizables en distintos escenarios y ambientes, promoviendo una gestión eficiente de recursos.

---

### 🗂️ **Unit MySQLDatabaseConnectionManager**

La **unit MySQLDatabaseConnectionManager** proporciona métodos para gestionar conexiones con la base de datos **MySQL** utilizando **FireDAC**. Permite la creación de conexiones reutilizables y personalizadas, además de gestionar un pool de conexiones para optimizar los recursos.

#### 🔧 **Funciones y Procedimientos**

- **GetConnection(const AConfiguration: TMySQLConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descripción:** Retorna una conexión **MySQL** basada en las configuraciones proporcionadas, el nombre de la base de datos y el prefijo.
  - **Parámetros:**
    - `AConfiguration`: Configuraciones de la base de datos **MySQL**.
    - `ADatabase`: Nombre de la base de datos.
    - `APrefix`: Prefijo que identifica la conexión.
  - **Retorno:** Instancia configurada de `TFDConnection`.

- **DefaultConnection(const AConfiguration: TMySQLConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descripción:** Retorna una conexión predeterminada con la base de datos **MySQL**; si ya existe una conexión activa, esta será reutilizada.
  - **Parámetros:**
    - `AConfiguration`: Configuraciones de la base de datos **MySQL**.
    - `ADatabase`: Nombre de la base de datos.
    - `APrefix`: Prefijo de conexión.
  - **Retorno:** Instancia configurada de `TFDConnection`.

- **CustomConnection(const AConfiguration: TMySQLConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descripción:** Retorna una conexión personalizada con la base de datos **MySQL**; si ya existe una conexión con el prefijo especificado, esta será reutilizada.
  - **Parámetros:**
    - `AConfiguration`: Configuraciones de la base de datos **MySQL**.
    - `ADatabase`: Nombre de la base de datos.
    - `APrefix`: Prefijo de conexión.
  - **Retorno:** Instancia configurada de `TFDConnection`.

### ⚙️ **Finalidad**

Esta unidad centraliza la creación y gestión de conexiones **MySQL** mediante FireDAC, promoviendo la reutilización y eficiencia mediante la gestión de un pool de conexiones.

---

### 🗂️ **Unit Horse.Connection.MySQL**

La **unit Horse.Connection.MySQL** proporciona integración con el framework **Horse** para gestionar conexiones con la base de datos **MySQL** a través de **FireDAC**. Incluye funciones para configurar la conexión y aplicar parámetros específicos de configuración.

#### 🔧 **Funciones y Procedimientos**

- **MySQLConnection**
  - **Descripción:** Retorna una conexión configurada para la base de datos **MySQL** usando las definiciones actuales.
  - **Retorno:** Instancia de `TFDConnection` configurada para la base de datos **MySQL**.

- **ApplyDatabaseConfiguration(const AParameter: TMySQLConfigurationParameter; const Value: TValue)**
  - **Descripción:** Aplica un parámetro de configuración a la base de datos **MySQL** usando un valor genérico.
  - **Parámetros:**
    - `AParameter`: Parámetro de configuración a aplicar.
    - `Value`: Valor del parámetro como `TValue`.

- **SetConnectionPrefix(const AValue: string)**
  - **Descripción:** Establece el prefijo de la conexión para la base de datos **MySQL**.
  - **Parámetro:**
    - `AValue`: Valor del prefijo de conexión.

- **HorseConnectionMySQL(Req: THorseRequest; Res: THorseResponse; Next: TProc)**
  - **Descripción:** Middleware para integración con **Horse**. Define la conexión con la base de datos **MySQL** para cada solicitud HTTP recibida.
  - **Parámetros:**
    - `Req`: Objeto de solicitud de **Horse**.
    - `Res`: Objeto de respuesta de **Horse**.
    - `Next`: Procedimiento a ejecutar tras configurar la conexión.

### ⚙️ **Finalidad**

Esta unidad facilita la integración con el framework **Horse**, simplificando la gestión de conexiones **MySQL** en aplicaciones web desarrolladas con Delphi.

---

### 🗂️ **Unidad PGDatabaseConfigurationManager**

La **unidad PGDatabaseConfigurationManager** proporciona funciones para gestionar las configuraciones de conexión a la base de datos **PostgreSQL** utilizando **FireDAC**. Permite la creación de definiciones de conexión reutilizables y personalizables.

#### 🔧 **Funciones y Procedimientos**

- **Initialize(const AConfiguration: TPGConfiguration; const ADatabase: string; const APrefix: string);**
  - **Descripción:** Inicializa la configuración de **FireDAC** para la base de datos **PostgreSQL** utilizando los ajustes proporcionados, el nombre de la base de datos y el prefijo.
  - **Parámetros:**
    - `AConfiguration`: Configuraciones para la base de datos **PostgreSQL**.
    - `ADatabase`: Nombre de la base de datos.
    - `APrefix`: Prefijo para la definición de la conexión.
  
- **Initialize(const AConfiguration: TPGConfiguration; const APrefix: string);**
  - **Descripción:** Inicializa la configuración de **FireDAC** para la base de datos **PostgreSQL** utilizando los ajustes proporcionados y un prefijo.
  - **Parámetros:**
    - `AConfiguration`: Configuraciones para la base de datos **PostgreSQL**.
    - `APrefix`: Prefijo para la definición de la conexión.

- **Initialize(const AConfiguration: TPGConfiguration);**
  - **Descripción:** Inicializa la configuración de **FireDAC** para la base de datos **PostgreSQL** utilizando los ajustes proporcionados sin necesidad de un prefijo.
  - **Parámetro:** 
    - `AConfiguration`: Configuraciones para la base de datos **PostgreSQL**.

- **GetConnectionDef(const APrefix: string): string;**
  - **Descripción:** Devuelve el nombre de la definición de conexión basada en el prefijo proporcionado.
  - **Parámetro:**
    - `APrefix`: Prefijo utilizado para identificar la conexión.
  - **Retorno:** Nombre de la definición de conexión con el prefijo especificado.

- **GetConnectionDef: string;**
  - **Descripción:** Devuelve el nombre de la definición de conexión por defecto, sin considerar los prefijos.
  - **Retorno:** Nombre de la definición de conexión por defecto.

- **CreateConnectionParameters(const AConfiguration: TPGConfiguration; const ADatabase: string): TStrings;**
  - **Descripción:** Crea una lista de parámetros de conexión para la base de datos **PostgreSQL** basada en los ajustes proporcionados.
  - **Parámetros:**
    - `AConfiguration`: Configuraciones para la base de datos **PostgreSQL**.
    - `ADatabase`: Nombre de la base de datos.
  - **Retorno:** Lista de parámetros de conexión.

- **EnsureFDManagerInitialized;**
  - **Descripción:** Asegura que el administrador de **FireDAC** esté correctamente inicializado y listo para su uso.

- **ConfigureFDManager;**
  - **Descripción:** Configura el administrador de **FireDAC** con las opciones necesarias para garantizar la reconexión automática en caso de falla.

### ⚙️ **Propósito**

Esta **unidad** centraliza la configuración de conexiones a la base de datos **PostgreSQL**, permitiendo ajustes modulares para opciones de conexión como servidor, autenticación y agrupación (pooling). Este enfoque facilita el mantenimiento y la gestión de conexiones en aplicaciones a gran escala.

---

### 🗂️ **Unidad PGDatabaseConnectionManager**

La **unidad PGDatabaseConnectionManager** proporciona funciones robustas para gestionar las conexiones a la base de datos **PostgreSQL** utilizando **FireDAC**. Permite la creación de conexiones reutilizables y personalizables, e incluye la gestión del **pooling** de conexiones, lo que optimiza el rendimiento y la utilización de recursos del sistema.

#### 🔧 **Funciones y Procedimientos**

- **GetConnection(const AConfiguration: TPGConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descripción:** Devuelve una instancia de conexión a **PostgreSQL** basada en los ajustes proporcionados, el nombre de la base de datos y el prefijo.
  - **Parámetros:**
    - `AConfiguration`: Configuraciones para la base de datos **PostgreSQL**.
    - `ADatabase`: Nombre de la base de datos.
    - `APrefix`: Prefijo utilizado para identificar la conexión.
  - **Retorno:** Instancia configurada de `TFDConnection`.

- **GetConnection(const AConfiguration: TPGConfiguration; const APrefix: string): TFDConnection;**
  - **Descripción:** Devuelve una instancia de conexión a **PostgreSQL** basada en los ajustes y el prefijo proporcionados.
  - **Parámetros:**
    - `AConfiguration`: Configuraciones para la base de datos **PostgreSQL**.
    - `APrefix`: Prefijo utilizado para identificar la conexión.
  - **Retorno:** Instancia configurada de `TFDConnection`.

- **GetConnection(const AConfiguration: TPGConfiguration): TFDConnection;**
  - **Descripción:** Devuelve una conexión por defecto a **PostgreSQL** basada en los ajustes proporcionados.
  - **Parámetro:** 
    - `AConfiguration`: Configuraciones para la base de datos **PostgreSQL**.
  - **Retorno:** Instancia configurada de `TFDConnection`.

- **SetupConnection(const AConfiguration: TPGConfiguration; const ADatabase: string; const APrefix: string; var AConnection: TFDConnection);**
  - **Descripción:** Configura una conexión a **PostgreSQL** utilizando los ajustes y parámetros proporcionados. La conexión se configura directamente en la variable `AConnection`.
  - **Parámetros:**
    - `AConfiguration`: Configuraciones para la base de datos **PostgreSQL**.
    - `ADatabase`: Nombre de la base de datos.
    - `APrefix`: Prefijo utilizado para identificar la conexión.
    - `AConnection`: Instancia de conexión a ser configurada.

### ⚙️ **Propósito**

Esta **unidad** permite la creación y gestión de conexiones reutilizables y personalizables a **PostgreSQL** utilizando **FireDAC**. Con soporte para **pooling** de conexiones y reconexión automática, optimiza el rendimiento de las operaciones con la base de datos y facilita una gestión más eficiente de los recursos.

---

### 🗂️ **Unidad Horse.Connection.PG**

La **unidad Horse.Connection.PG** ofrece integración entre el framework **Horse** y la base de datos **PostgreSQL** utilizando **FireDAC**. Incluye funciones para configurar conexiones, aplicar parámetros específicos y gestionar el prefijo y la ruta de las conexiones, permitiendo una gestión eficiente de la configuración para cada solicitud HTTP recibida por el framework Horse.

#### 🔧 **Funciones y Procedimientos**

- **PGConnection: TFDConnection;**
  - **Descripción:** Devuelve una conexión configurada para la base de datos **PostgreSQL** utilizando los ajustes actuales.
  - **Retorno:** Instancia configurada de `TFDConnection` para **PostgreSQL**.

- **ApplyDatabaseConfiguration(const AParameter: TPGConfigurationParameter; const Value: TValue);**
  - **Descripción:** Aplica un parámetro de configuración a la base de datos **PostgreSQL** utilizando un valor genérico.
  - **Parámetros:**
    - `AParameter`: Parámetro de configuración a ser aplicado.
    - `Value`: Valor del parámetro, como `TValue`.

- **SetConnectionPrefix(const AValue: string);**
  - **Descripción:** Define el prefijo de la conexión para la base de datos **PostgreSQL**.
  - **Parámetro:** 
    - `AValue`: Valor del prefijo.

- **SetDatabase(const AValue: string);**
  - **Descripción:** Define la ruta de la base de datos para la conexión **PostgreSQL**.
  - **Parámetro:** 
    - `AValue`: Ruta de la base de datos.

- **HorseConnectionPG(Req: THorseRequest; Res: THorseResponse; Next: TProc);**
  - **Descripción:** Middleware de integración para **Horse**. Define la conexión con la base de datos **PostgreSQL** para cada solicitud HTTP recibida.
  - **Parámetros:**
    - `Req`: Objeto de solicitud de **Horse**.
    - `Res`: Objeto de respuesta de **Horse**.
    - `Next`: Procedimiento a ser ejecutado después de configurar la conexión.

### ⚙️ **Propósito**

La **unidad Horse.Connection.PG** facilita la gestión de conexiones **PostgreSQL** en aplicaciones basadas en **Horse**, asegurando que cada solicitud HTTP tenga una conexión correctamente configurada según los parámetros especificados. Este enfoque facilita la integración de **PostgreSQL** en contextos web, proporcionando una integración sencilla y eficiente con **Horse**.

---

### 🗂️ Unidad SQLiteDatabaseConfigurationManager

La **unidad SQLiteDatabaseConfigurationManager** proporciona funciones para gestionar y configurar las conexiones a la base de datos **SQLite** mediante **FireDAC**, permitiendo la creación de definiciones de conexión reutilizables y personalizadas para diversas aplicaciones.

#### 🔧 Funciones y Procedimientos

- **Initialize(const AConfiguration: TSQLiteConfiguration; const ADatabase: string; const APrefix: string);**
  - **Descripción:** Configura e inicializa **FireDAC** para la base de datos **SQLite** en función de las configuraciones proporcionadas, el nombre de la base de datos y el prefijo.
  - **Parámetros:**
    - `AConfiguration`: Configuración de conexión para la base de datos **SQLite**.
    - `ADatabase`: Nombre de la base de datos.
    - `APrefix`: Prefijo utilizado para identificar la conexión en el **FireDAC Manager**.

- **Initialize(const AConfiguration: TSQLiteConfiguration; const APrefix: string);**
  - **Descripción:** Inicializa la configuración de conexión en función de la configuración y el prefijo proporcionados.
  - **Parámetros:**
    - `AConfiguration`: Configuración de conexión para la base de datos **SQLite**.
    - `APrefix`: Prefijo utilizado para identificar la conexión.

- **Initialize(const AConfiguration: TSQLiteConfiguration);**
  - **Descripción:** Inicializa la conexión utilizando solo las configuraciones proporcionadas, sin prefijo.
  - **Parámetro:** 
    - `AConfiguration`: Configuración de conexión para la base de datos **SQLite**.

- **GetConnectionDef(const APrefix: string): string;**
  - **Descripción:** Devuelve el nombre de la definición de conexión basado en el prefijo proporcionado.
  - **Parámetro:**
    - `APrefix`: Prefijo utilizado en la definición de conexión.
  - **Retorno:** Nombre de la definición de conexión con el prefijo.

- **GetConnectionDef: string;**
  - **Descripción:** Devuelve el nombre de la definición de conexión predeterminada.
  - **Retorno:** Nombre de la definición de conexión predeterminada.

- **CreateConnectionParameters(const AConfiguration: TSQLiteConfiguration; const ADatabase: string): TStrings;**
  - **Descripción:** Crea una lista de parámetros de conexión para la base de datos **SQLite** basada en las configuraciones proporcionadas.
  - **Parámetros:**
    - `AConfiguration`: Configuración para la base de datos **SQLite**.
    - `ADatabase`: Nombre de la base de datos.
  - **Retorno:** Lista de parámetros de conexión.

#### 🔄 Inicialización y Finalización

- **EnsureFDManagerInitialized**
  - **Descripción:** Garantiza que el administrador de **FireDAC** esté inicializado.

- **ConfigureFDManager**
  - **Descripción:** Configura el administrador de **FireDAC** con las opciones necesarias.

### ⚙️ Propósito

Esta unidad facilita la gestión de conexiones a **SQLite** mediante **FireDAC**, ofreciendo configuraciones flexibles y reutilizables para distintos contextos y entornos.

---

### 🗂️ Unidad SQLiteDatabaseConnectionManager

La **unidad SQLiteDatabaseConnectionManager** proporciona herramientas para gestionar las conexiones a la base de datos **SQLite** mediante **FireDAC**. Admite conexiones tanto personalizadas como reutilizables y cuenta con funcionalidades de gestión de conexión en pool y administración de cifrado de la base de datos.

#### 🔧 Funciones y Procedimientos

- **GetConnection(const AConfiguration: TSQLiteConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descripción:** Devuelve una conexión basada en las configuraciones, nombre de la base de datos y prefijo proporcionados.
  - **Parámetros:**
    - `AConfiguration`: Configuración para la base de datos **SQLite**.
    - `ADatabase`: Nombre de la base de datos.
    - `APrefix`: Prefijo utilizado para identificar la conexión.
  - **Retorno:** Instancia configurada de `TFDConnection`.

- **GetConnection(const AConfiguration: TSQLiteConfiguration; const APrefix: string): TFDConnection;**
  - **Descripción:** Devuelve una conexión basada en las configuraciones y el prefijo proporcionados.
  - **Parámetros:**
    - `AConfiguration`: Configuración para la base de datos **SQLite**.
    - `APrefix`: Prefijo utilizado para identificar la conexión.
  - **Retorno:** Instancia configurada de `TFDConnection`.

- **GetConnection(const AConfiguration: TSQLiteConfiguration): TFDConnection;**
  - **Descripción:** Devuelve una conexión basada únicamente en las configuraciones proporcionadas.
  - **Parámetro:** 
    - `AConfiguration`: Configuración para la base de datos **SQLite**.
  - **Retorno:** Instancia configurada de `TFDConnection`.

- **DefaultConnection(const AConfiguration: TSQLiteConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descripción:** Devuelve una conexión predeterminada para la base de datos **SQLite**; si ya existe una conexión, se reutilizará.
  - **Parámetros:**
    - `AConfiguration`: Configuración para la base de datos **SQLite**.
    - `ADatabase`: Nombre de la base de datos.
    - `APrefix`: Prefijo utilizado para identificar la conexión.
  - **Retorno:** Instancia configurada de `TFDConnection`.

- **CustomConnection(const AConfiguration: TSQLiteConfiguration; const ADatabase: string; const APrefix: string): TFDConnection;**
  - **Descripción:** Devuelve una conexión personalizada para la base de datos **SQLite**; si ya existe una conexión con el prefijo proporcionado, se reutilizará.
  - **Parámetros:**
    - `AConfiguration`: Configuración para la base de datos **SQLite**.
    - `ADatabase`: Nombre de la base de datos.
    - `APrefix`: Prefijo utilizado para identificar la conexión.
  - **Retorno:** Instancia configurada de `TFDConnection`.

#### 🔄 Inicialización y Finalización

- **SetupConnection**
  - **Descripción:** Configura una conexión con soporte para cifrado en la base de datos **SQLite**, basado en las configuraciones y parámetros proporcionados.

- **FConnectionPool**
  - **Descripción:** Administra un pool de conexiones para **SQLite**, optimizando la reutilización y eficiencia de las conexiones de la base de datos.

### ⚙️ Propósito

Esta unidad facilita la gestión de conexiones **SQLite** con **FireDAC**, permitiendo configuraciones estandarizadas y personalizadas para distintos escenarios y entornos, con soporte adicional para el cifrado de la base de datos.

---

### 🗂️ Unidad Horse.Connection.SQLite

La **unidad Horse.Connection.SQLite** permite la integración entre la base de datos **SQLite** y el framework **Horse** mediante **FireDAC**. Proporciona métodos para configurar y aplicar parámetros de conexión, asegurando una gestión eficiente y personalizada de las conexiones para cada solicitud HTTP.

#### 🔧 Funciones y Procedimientos

- **SQLiteConnection**
  - **Descripción:** Devuelve una conexión configurada para la base de datos **SQLite** basada en la configuración actual.
  - **Retorno:** Instancia configurada de `TFDConnection` para la base de datos **SQLite**.

- **ApplyDatabaseConfiguration(const AParameter: TSQLiteConfigurationParameter; const AValue: TValue)**
  - **Descripción:** Aplica un parámetro de configuración a la base de datos **SQLite** utilizando un valor genérico.
  - **Parámetros:**
    - `AParameter`: Parámetro de configuración a aplicar.
    - `AValue`: Valor del parámetro, como `TValue`.

- **ApplyDatabaseConfiguration(const AParameter: TSQLiteConfigurationParameter; const AValue: TSQLiteLockingModeType)**
  - **Descripción:** Aplica un parámetro de modo de bloqueo a la base de datos **SQLite**.
  - **Parámetros:**
    - `AParameter`: Parámetro de configuración.
    - `AValue`: Valor de tipo `TSQLiteLockingModeType`.

- **ApplyDatabaseConfiguration(const AParameter: TSQLiteConfigurationParameter; const AValue: TSQLiteOpenModeType)**
  - **Descripción:** Aplica un parámetro de modo de apertura a la base de datos **SQLite**.
  - **Parámetros:**
    - `AParameter`: Parámetro de configuración.
    - `AValue`: Valor de tipo `TSQLiteOpenModeType`.

- **ApplyDatabaseConfiguration(const AParameter: TSQLiteConfigurationParameter; const AValue: TSQLiteEncryptType)**
  - **Descripción:** Aplica un parámetro de cifrado a la base de datos **SQLite**.
  - **Parámetros:**
    - `AParameter`: Parámetro de configuración.
    - `AValue`: Valor de tipo `TSQLiteEncryptType`.

- **SetConnectionPrefix(const AValue: string)**
  - **Descripción:** Establece el prefijo de la conexión para la base de datos **SQLite**.
  - **Parámetro:**
    - `AValue`: Prefijo de la conexión.

- **SetDatabase(const AValue: string)**
  - **Descripción:** Define la ruta de la base de datos para **SQLite**.
  - **Parámetro:**
    - `AValue`: Ruta de la base de datos.

- **HorseConnectionSQLite(Req: THorseRequest; Res: THorseResponse; Next: TProc)**
  - **Descripción:** Middleware para integrar

 **Horse** con la base de datos **SQLite**. Configura la conexión para cada solicitud HTTP entrante.
  - **Parámetros:**
    - `Req`: Objeto de solicitud de **Horse**.
    - `Res`: Objeto de respuesta de **Horse**.
    - `Next`: Procedimiento a ejecutar a continuación.

### ⚙️ Propósito

Esta unidad simplifica la integración de **SQLite** con el framework **Horse**, asegurando que cada solicitud HTTP sea manejada por una conexión personalizada y eficiente.

## Contribuciones

¡Las contribuciones son bienvenidas! No dudes en abrir issues y pull requests para mejorar este proyecto.

## Licencia

Este proyecto está licenciado bajo la **Licencia MIT**. Consulte el archivo [LICENSE](LICENSE) para más detalles.