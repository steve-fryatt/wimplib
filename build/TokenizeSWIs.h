/* Copyright 2014-2020, Stephen Fryatt (info@stevefryatt.org.uk)
 *
 * This file is part of WimpLib:
 *
 *   http://www.stevefryatt.org.uk/software/
 *
 * Licensed under the EUPL, Version 1.2 only (the "Licence");
 * You may not use this work except in compliance with the
 * Licence.
 *
 * You may obtain a copy of the Licence at:
 *
 *   http://joinup.ec.europa.eu/software/page/eupl
 *
 * Unless required by applicable law or agreed to in
 * writing, software distributed under the Licence is
 * distributed on an "AS IS" basis, WITHOUT WARRANTIES
 * OR CONDITIONS OF ANY KIND, either express or implied.
 *
 * See the Licence for the specific language governing
 * permissions and limitations under the Licence.
 */

/**
 * \file: TokenizeSWIs.h
 *
 * This file contains additional SWI name definitions, as a
 * supplement for those within <swis.h>.
 * 
 * It is intended for use when tokenising BASIC code linked with
 * WimpLib, by Tokenize. Its standard C format may make it more
 * generally useful, however.
 */

/* Acorn URL Module */

#define URI_Version			0x4e380
#define URI_Dispatch			0x4e381
#define URI_RequestURI			0x4e382
#define URI_InvalidateURI		0x4e383

/* Impression Spell Module */

#define Spell_Typo			0x80080
#define Spell_Anagram			0x80081
#define Spell_Fuzzy			0x80082
#define Spell_CheckWord			0x80083
#define Spell_AddWord			0x80084
#define Spell_GetWord			0x80085
#define Spell_GetNextWord		0x80086
#define Spell_EnumWord			0x80087
#define Spell_CreateUser		0x80088
#define Spell_LoadUser			0x80089
#define Spell_SaveUser			0x8008a
#define Spell_UserToFile		0x8008b
#define Spell_FileToUser		0x8008c
#define Spell_GetDictionaryName		0x8008d
#define Spell_RemoveDictionary		0x8008e
#define Spell_DeleteWord		0x8008f
#define Spell_ResetIgnore		0x80090
#define Spell_AddToIgnore		0x80091
#define Spell_BrowseWindow		0x80092
#define Spell_SpellOp			0x80093
#define Spell_FindWord			0x80094
#define Spell_ImpressionInfo		0x80095
#define Spell_ImpressionQuickCheck	0x80096
#define Spell_FileToFile		0x80097
#define Spell_SaveDictionaryWithPath	0x80098

/* PlayIt */

#define PlayIt_Version			0x4d140
#define PlayIt_Config			0x4d141
#define PlayIt_LoadDriver		0x4d142
#define PlayIt_DriverInfo		0x4d143
#define PlayIt_SampleInfo		0x4d144
#define PlayIt_Status			0x4d145
#define PlayIt_Volume			0x4d146
#define PlayIt_Open			0x4d147
#define PlayIt_BeginEnd			0x4d148
#define PlayIt_SetPtr			0x4d149
#define PlayIt_Play			0x4d14a
#define PlayIt_Stop			0x4d14b
#define PlayIt_Pause			0x4d14c
#define PlayIt_Balance			0x4d14d
#define PlayIt_PauseAt			0x4d14e
#define PlayIt_VU			0x4d14f
#define PlayIt_ListDrivers		0x4d150
#define PlayIt_Identify			0x4d151
#define PlayIt_Queue			0x4d152
#define PlayIt_SetLoop			0x4d153
#define PlayIt_FileInfo			0x4d154
#define PlayIt_ClientOp			0x4d155
#define PlayIt_Debug			0x4d156
