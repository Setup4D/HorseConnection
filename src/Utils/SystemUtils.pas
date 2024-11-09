{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: SystemUtils                                                     }
{                                                                       }
{ Descrição:                                                            }
{   Esta unit fornece utilitários para operações de sistema, incluindo  }
{   manipulação de caminhos e lançamento de exceções de tipo inválido.  }
{                                                                       }
{ Autor: Ricardo R. Pereira                                             }
{ Data: 9 de novembro de 2024                                           }
{                                                                       }
{ Copyright (C) 2024 Ricardo R. Pereira                                 }
{                                                                       }
{ Todos os direitos reservados.                                         }
{***********************************************************************}
{$ELSE}
  {$IFDEF ESPANHOL}
  {***********************************************************************}
  {                          HorseConnection                              }
  {                                                                       }
  { Unidad: SystemUtils                                                   }
  {                                                                       }
  { Descripción:                                                          }
  {   Esta unidad proporciona utilidades para operaciones del sistema,    }
  {   incluyendo la manipulación de rutas y el lanzamiento de excepciones }
  {   de tipo incorrecto.                                                 }
  {                                                                       }
  { Autor: Ricardo R. Pereira                                             }
  { Fecha: 9 de noviembre de 2024                                         }
  {                                                                       }
  { Copyright (C) 2024 Ricardo R. Pereira                                 }
  {                                                                       }
  { Todos los derechos reservados.                                        }
  {***********************************************************************}
  {$ELSE}
  {***********************************************************************}
  {                          HorseConnection                              }
  {                                                                       }
  { Unit: SystemUtils                                                     }
  {                                                                       }
  { Description:                                                          }
  {   This unit provides utilities for system operations, including       }
  {   path handling and raising invalid type exceptions.                  }
  {                                                                       }
  { Author: Ricardo R. Pereira                                            }
  { Date: November 9, 2024                                                }
  {                                                                       }
  { Copyright (C) 2024 Ricardo R. Pereira                                 }
  {                                                                       }
  { All rights reserved.                                                  }
  {***********************************************************************}
  {$ENDIF}
{$ENDIF}

unit SystemUtils;

interface

{$IFDEF PORTUGUES}
/// <summary>
///   Lança uma exceção indicando que um campo possui um tipo incorreto.
/// </summary>
/// <param name="AFieldName">
///   O nome do campo que possui o tipo incorreto.
/// </param>
/// <param name="AExpectedType">
///   O tipo esperado para o campo.
/// </param>
/// <remarks>
///   Esta função lança uma exceção formatada com o nome do campo e o tipo
///   esperado, ajudando a identificar erros de tipo em tempo de execução.
/// </remarks>
/// <exception cref="Exception">
///   Exceção lançada quando o tipo do campo não corresponde ao tipo esperado.
/// </exception>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Lanza una excepción indicando que un campo tiene un tipo incorrecto.
  /// </summary>
  /// <param name="AFieldName">
  ///   El nombre del campo que tiene el tipo incorrecto.
  /// </param>
  /// <param name="AExpectedType">
  ///   El tipo esperado para el campo.
  /// </param>
  /// <remarks>
  ///   Esta función lanza una excepción formateada con el nombre del campo y
  ///   el tipo esperado, ayudando a identificar errores de tipo en tiempo de
  ///   ejecución.
  /// </remarks>
  /// <exception cref="Exception">
  ///   Excepción lanzada cuando el tipo del campo no coincide con el tipo esperado.
  /// </exception>
  {$ELSE}
  /// <summary>
  ///   Raises an exception indicating that a field has an incorrect type.
  /// </summary>
  /// <param name="AFieldName">
  ///   The name of the field with the incorrect type.
  /// </param>
  /// <param name="AExpectedType">
  ///   The expected type for the field.
  /// </param>
  /// <remarks>
  ///   This function raises a formatted exception with the field name and
  ///   expected type, helping to identify type errors at runtime.
  /// </remarks>
  /// <exception cref="Exception">
  ///   Exception raised when the field type does not match the expected type.
  /// </exception>
  {$ENDIF}
{$ENDIF}
procedure RaiseInvalidTypeException(const AFieldName, AExpectedType: string);

{$IFDEF PORTUGUES}
/// <summary>
///   Obtém o caminho absoluto com base em um caminho relativo fornecido.
/// </summary>
/// <param name="ARelativePath">
///   O caminho relativo a ser convertido para absoluto.
/// </param>
/// <returns>
///   O caminho absoluto correspondente ao caminho relativo fornecido.
/// </returns>
/// <remarks>
///   Se o caminho relativo começar com '.\', ele será combinado com o diretório
///   do aplicativo para obter o caminho absoluto. Caso contrário, retorna o
///   caminho fornecido.
/// </remarks>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Obtiene la ruta absoluta basada en una ruta relativa proporcionada.
  /// </summary>
  /// <param name="ARelativePath">
  ///   La ruta relativa que se convertirá en una ruta absoluta.
  /// </param>
  /// <returns>
  ///   La ruta absoluta correspondiente a la ruta relativa proporcionada.
  /// </returns>
  /// <remarks>
  ///   Si la ruta relativa comienza con '.\', se combinará con el directorio
  ///   de la aplicación para obtener la ruta absoluta. De lo contrario,
  ///   devuelve la ruta proporcionada.
  /// </remarks>
  {$ELSE}
  /// <summary>
  ///   Gets the absolute path based on a provided relative path.
  /// </summary>
  /// <param name="ARelativePath">
  ///   The relative path to be converted to an absolute path.
  /// </param>
  /// <returns>
  ///   The absolute path corresponding to the provided relative path.
  /// </returns>
  /// <remarks>
  ///   If the relative path starts with '.\', it will be combined with the
  ///   application's directory to obtain the absolute path. Otherwise,
  ///   returns the provided path.
  /// </remarks>
  {$ENDIF}
{$ENDIF}
function GetAbsolutePath(const ARelativePath: string): string;

implementation

uses
  System.IOUtils,
  System.SysUtils;

procedure RaiseInvalidTypeException(const AFieldName, AExpectedType: string);
begin
  raise Exception.CreateFmt({$IFDEF PORTUGUES}
                              'Tipo incorreto para o campo %s. Esperado: %s.',
                            {$ELSE}
                              {$IFDEF ESPANHOL}
                                'Tipo incorrecto para el campo %s. Esperado: %s.',
                              {$ELSE}
                                'Incorrect type for field %s. Expected: %s.',
                              {$ENDIF}
                            {$ENDIF}
                            [AFieldName, AExpectedType]);
end;

function GetAbsolutePath(const ARelativePath: string): string;
begin
  Result := ARelativePath;
  if Result.StartsWith('.\') then
    Result := TPath.Combine(ExtractFilePath(ParamStr(0)), Result.Substring(2));
end;

end.

