{$IFDEF PORTUGUES}
{***********************************************************************}
{                          HorseConnection                              }
{                                                                       }
{ Unit: CharacterSetUtils                                               }
{                                                                       }
{ Descrição:                                                            }
{   Esta unit fornece funções auxiliares para adicionar diferentes      }
{   conjuntos de caracteres ao dicionário TDictionary, permitindo a     }
{   conversão de tipos de conjunto de caracteres do Firebird.           }
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
  { Unidad: CharacterSetUtils                                             }
  {                                                                       }
  { Descripción:                                                          }
  {   Esta unidad proporciona funciones auxiliares para agregar           }
  {   diferentes conjuntos de caracteres al diccionario TDictionary,      }
  {   permitiendo la conversión de tipos de conjunto de caracteres        }
  {   de Firebird.                                                        }
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
  { Unit: CharacterSetUtils                                               }
  {                                                                       }
  { Description:                                                          }
  {   This unit provides helper functions to add different character      }
  {   sets to the TDictionary, enabling the conversion of Firebird        }
  {   character set types.                                                }
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

unit CharacterSetUtils;

interface

uses
  System.Generics.Collections,
  EnumsHelpersUtils;

{$IFDEF PORTUGUES}
/// <summary>
///   Adiciona os conjuntos de caracteres básicos ao dicionário.
/// </summary>
/// <param name="Dictionary">
///   Dicionário onde os conjuntos de caracteres serão adicionados.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Agrega los conjuntos de caracteres básicos al diccionario.
  /// </summary>
  /// <param name="Dictionary">
  ///   Diccionario donde se agregarán los conjuntos de caracteres.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Adds basic character sets to the dictionary.
  /// </summary>
  /// <param name="Dictionary">
  ///   Dictionary where the character sets will be added.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure AddBasicCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);

{$IFDEF PORTUGUES}
/// <summary>
///   Adiciona os conjuntos de caracteres DOS ao dicionário.
/// </summary>
/// <param name="Dictionary">
///   Dicionário onde os conjuntos de caracteres serão adicionados.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Agrega los conjuntos de caracteres DOS al diccionario.
  /// </summary>
  /// <param name="Dictionary">
  ///   Diccionario donde se agregarán los conjuntos de caracteres.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Adds DOS character sets to the dictionary.
  /// </summary>
  /// <param name="Dictionary">
  ///   Dictionary where the character sets will be added.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure AddDOSCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);

{$IFDEF PORTUGUES}
/// <summary>
///   Adiciona os conjuntos de caracteres ISO ao dicionário.
/// </summary>
/// <param name="Dictionary">
///   Dicionário onde os conjuntos de caracteres serão adicionados.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Agrega los conjuntos de caracteres ISO al diccionario.
  /// </summary>
  /// <param name="Dictionary">
  ///   Diccionario donde se agregarán los conjuntos de caracteres.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Adds ISO character sets to the dictionary.
  /// </summary>
  /// <param name="Dictionary">
  ///   Dictionary where the character sets will be added.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure AddISOCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);

{$IFDEF PORTUGUES}
/// <summary>
///   Adiciona os conjuntos de caracteres Windows ao dicionário.
/// </summary>
/// <param name="Dictionary">
///   Dicionário onde os conjuntos de caracteres serão adicionados.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Agrega los conjuntos de caracteres de Windows al diccionario.
  /// </summary>
  /// <param name="Dictionary">
  ///   Diccionario donde se agregarán los conjuntos de caracteres.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Adds Windows character sets to the dictionary.
  /// </summary>
  /// <param name="Dictionary">
  ///   Dictionary where the character sets will be added.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure AddWinCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);

{$IFDEF PORTUGUES}
/// <summary>
///   Adiciona outros conjuntos de caracteres ao dicionário.
/// </summary>
/// <param name="Dictionary">
///   Dicionário onde os conjuntos de caracteres serão adicionados.
/// </param>
{$ELSE}
  {$IFDEF ESPANHOL}
  /// <summary>
  ///   Agrega otros conjuntos de caracteres al diccionario.
  /// </summary>
  /// <param name="Dictionary">
  ///   Diccionario donde se agregarán los conjuntos de caracteres.
  /// </param>
  {$ELSE}
  /// <summary>
  ///   Adds miscellaneous character sets to the dictionary.
  /// </summary>
  /// <param name="Dictionary">
  ///   Dictionary where the character sets will be added.
  /// </param>
  {$ENDIF}
{$ENDIF}
procedure AddMiscellaneousCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);

implementation

procedure AddBasicCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);
begin
  Dictionary.Add(TFBCharacterSetType.NONE, 'NONE');
  Dictionary.Add(TFBCharacterSetType.ASCII, 'ASCII');
  Dictionary.Add(TFBCharacterSetType.UTF8, 'UTF8');
  Dictionary.Add(TFBCharacterSetType.UTF16, 'UTF16');
end;

procedure AddDOSCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);
begin
  Dictionary.Add(TFBCharacterSetType.DOS437, 'DOS437');
  Dictionary.Add(TFBCharacterSetType.DOS850, 'DOS850');
  Dictionary.Add(TFBCharacterSetType.DOS852, 'DOS852');
  Dictionary.Add(TFBCharacterSetType.DOS857, 'DOS857');
  Dictionary.Add(TFBCharacterSetType.DOS860, 'DOS860');
  Dictionary.Add(TFBCharacterSetType.DOS861, 'DOS861');
  Dictionary.Add(TFBCharacterSetType.DOS863, 'DOS863');
  Dictionary.Add(TFBCharacterSetType.DOS865, 'DOS865');
  Dictionary.Add(TFBCharacterSetType.DOS866, 'DOS866');
  Dictionary.Add(TFBCharacterSetType.DOS869, 'DOS869');
end;

procedure AddISOCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);
begin
  Dictionary.Add(TFBCharacterSetType.ISO8859_1, 'ISO8859_1');
  Dictionary.Add(TFBCharacterSetType.ISO8859_2, 'ISO8859_2');
  Dictionary.Add(TFBCharacterSetType.ISO8859_3, 'ISO8859_3');
  Dictionary.Add(TFBCharacterSetType.ISO8859_4, 'ISO8859_4');
  Dictionary.Add(TFBCharacterSetType.ISO8859_5, 'ISO8859_5');
  Dictionary.Add(TFBCharacterSetType.ISO8859_6, 'ISO8859_6');
  Dictionary.Add(TFBCharacterSetType.ISO8859_7, 'ISO8859_7');
  Dictionary.Add(TFBCharacterSetType.ISO8859_8, 'ISO8859_8');
  Dictionary.Add(TFBCharacterSetType.ISO8859_9, 'ISO8859_9');
  Dictionary.Add(TFBCharacterSetType.ISO8859_13, 'ISO8859_13');
end;

procedure AddWinCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);
begin
  Dictionary.Add(TFBCharacterSetType.WIN1250, 'WIN1250');
  Dictionary.Add(TFBCharacterSetType.WIN1251, 'WIN1251');
  Dictionary.Add(TFBCharacterSetType.WIN1252, 'WIN1252');
  Dictionary.Add(TFBCharacterSetType.WIN1253, 'WIN1253');
  Dictionary.Add(TFBCharacterSetType.WIN1254, 'WIN1254');
  Dictionary.Add(TFBCharacterSetType.WIN1255, 'WIN1255');
  Dictionary.Add(TFBCharacterSetType.WIN1256, 'WIN1256');
  Dictionary.Add(TFBCharacterSetType.WIN1257, 'WIN1257');
  Dictionary.Add(TFBCharacterSetType.WIN1258, 'WIN1258');
end;

procedure AddMiscellaneousCharacterSets(Dictionary: TDictionary<TFBCharacterSetType, string>);
begin
  Dictionary.Add(TFBCharacterSetType.KOI8R, 'KOI8R');
  Dictionary.Add(TFBCharacterSetType.KOI8U, 'KOI8U');
  Dictionary.Add(TFBCharacterSetType.KSC_5601, 'KSC_5601');
  Dictionary.Add(TFBCharacterSetType.KSC_DICTIONARY, 'KSC_DICTIONARY');
  Dictionary.Add(TFBCharacterSetType.NEXT, 'NEXT');
  Dictionary.Add(TFBCharacterSetType.OCTETS, 'OCTETS');
  Dictionary.Add(TFBCharacterSetType.SJIS_0208, 'SJIS_0208');
  Dictionary.Add(TFBCharacterSetType.TIS620, 'TIS620');
  Dictionary.Add(TFBCharacterSetType.UNICODE_FSS, 'UNICODE_FSS');
  Dictionary.Add(TFBCharacterSetType.BIG_5, 'BIG_5');
  Dictionary.Add(TFBCharacterSetType.CYRL, 'CYRL');
end;

end.

