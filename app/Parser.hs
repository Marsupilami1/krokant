{-# OPTIONS_GHC -w #-}
{-# LANGUAGE OverloadedStrings #-}

module Parser where

import Lexer
import Ast
import System.IO.Unsafe
import System.Exit
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn 
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 (Program)
	| HappyAbsSyn5 (Decl)
	| HappyAbsSyn6 (Statements)
	| HappyAbsSyn7 (Statement)
	| HappyAbsSyn8 (Condition)
	| HappyAbsSyn9 (SenseDir)
	| HappyAbsSyn10 (Flag)
	| HappyAbsSyn11 (Dir)

{- to allow type-synonyms as our monads (likely
 - with explicitly-specified bind and return)
 - in Haskell98, it seems that with
 - /type M a = .../, then /(HappyReduction M)/
 - is not allowed.  But Happy is a
 - code-generator that can just substitute it.
type HappyReduction m = 
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> m HappyAbsSyn
-}

action_0,
 action_1,
 action_2,
 action_3,
 action_4,
 action_5,
 action_6,
 action_7,
 action_8,
 action_9,
 action_10,
 action_11,
 action_12,
 action_13,
 action_14,
 action_15,
 action_16,
 action_17,
 action_18,
 action_19,
 action_20,
 action_21,
 action_22,
 action_23,
 action_24,
 action_25,
 action_26,
 action_27,
 action_28,
 action_29,
 action_30,
 action_31,
 action_32,
 action_33,
 action_34,
 action_35,
 action_36,
 action_37,
 action_38,
 action_39,
 action_40,
 action_41,
 action_42,
 action_43,
 action_44,
 action_45,
 action_46,
 action_47,
 action_48,
 action_49,
 action_50,
 action_51,
 action_52,
 action_53,
 action_54,
 action_55,
 action_56,
 action_57,
 action_58,
 action_59,
 action_60,
 action_61,
 action_62,
 action_63,
 action_64,
 action_65,
 action_66,
 action_67,
 action_68,
 action_69,
 action_70,
 action_71,
 action_72,
 action_73,
 action_74,
 action_75,
 action_76,
 action_77,
 action_78,
 action_79,
 action_80,
 action_81,
 action_82,
 action_83,
 action_84,
 action_85,
 action_86 :: () => Prelude.Int -> ({-HappyReduction (HappyIdentity) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (HappyIdentity) HappyAbsSyn)

happyReduce_1,
 happyReduce_2,
 happyReduce_3,
 happyReduce_4,
 happyReduce_5,
 happyReduce_6,
 happyReduce_7,
 happyReduce_8,
 happyReduce_9,
 happyReduce_10,
 happyReduce_11,
 happyReduce_12,
 happyReduce_13,
 happyReduce_14,
 happyReduce_15,
 happyReduce_16,
 happyReduce_17,
 happyReduce_18,
 happyReduce_19,
 happyReduce_20,
 happyReduce_21,
 happyReduce_22,
 happyReduce_23,
 happyReduce_24,
 happyReduce_25,
 happyReduce_26,
 happyReduce_27,
 happyReduce_28,
 happyReduce_29,
 happyReduce_30,
 happyReduce_31,
 happyReduce_32,
 happyReduce_33,
 happyReduce_34,
 happyReduce_35,
 happyReduce_36,
 happyReduce_37,
 happyReduce_38 :: () => ({-HappyReduction (HappyIdentity) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (HappyIdentity) HappyAbsSyn)

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,199) ([0,24,0,0,192,0,0,0,0,0,0,1024,0,0,8192,0,0,12,0,0,0,0,0,1,0,0,32,0,0,512,0,0,0,47080,0,8192,48960,5,0,0,0,0,16,0,0,0,1024,0,0,8192,0,2048,0,0,0,8,0,0,0,0,192,16,0,0,4096,0,0,0,0,1,32768,0,0,0,1,0,0,40960,735,0,512,0,0,16384,0,0,0,0,0,0,64000,45,0,128,0,0,0,0,0,0,0,0,0,0,0,0,64768,22,0,64,0,0,512,0,0,512,512,4092,0,0,0,0,0,0,0,200,0,0,0,15360,0,256,256,2046,2048,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,62466,91,0,0,0,0,128,5885,0,0,0,0,0,2,0,0,64001,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,400,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,256,256,2046,2048,2048,16368,0,4,0,0,0,0,0,53248,367,0,0,0,0,2048,0,0,0,0,0,32768,64768,22,0,4096,0,0,16,0,0,0,11770,0,2048,28624,1,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","Program","Decl","Statements","Statement","Condition","SenseDir","Flag","Dir","'{'","'}'","'('","')'","','","';'","'&&'","'||'","fn","state","if","else","mark","unmark","pickup","drop","turn","move","rand","pass","switch","int","var","ahead","here","leftAhead","rightAhead","friend","foe","friendWithFood","foeWithFood","rock","food","marker","foeMarker","home","foeHome","left","right","%eof"]
        bit_start = st Prelude.* 51
        bit_end = (st Prelude.+ 1) Prelude.* 51
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..50]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (20) = happyShift action_3
action_0 (21) = happyShift action_4
action_0 (4) = happyGoto action_5
action_0 (5) = happyGoto action_2
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (20) = happyShift action_3
action_1 (21) = happyShift action_4
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (34) = happyShift action_8
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (34) = happyShift action_7
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (20) = happyShift action_3
action_5 (21) = happyShift action_4
action_5 (51) = happyAccept
action_5 (5) = happyGoto action_6
action_5 _ = happyFail (happyExpListPerState 5)

action_6 _ = happyReduce_2

action_7 (12) = happyShift action_10
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (14) = happyShift action_9
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (15) = happyShift action_23
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (22) = happyShift action_13
action_10 (24) = happyShift action_14
action_10 (25) = happyShift action_15
action_10 (26) = happyShift action_16
action_10 (27) = happyShift action_17
action_10 (28) = happyShift action_18
action_10 (29) = happyShift action_19
action_10 (31) = happyShift action_20
action_10 (32) = happyShift action_21
action_10 (34) = happyShift action_22
action_10 (6) = happyGoto action_11
action_10 (7) = happyGoto action_12
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (13) = happyShift action_38
action_11 (22) = happyShift action_13
action_11 (24) = happyShift action_14
action_11 (25) = happyShift action_15
action_11 (26) = happyShift action_16
action_11 (27) = happyShift action_17
action_11 (28) = happyShift action_18
action_11 (29) = happyShift action_19
action_11 (31) = happyShift action_20
action_11 (32) = happyShift action_21
action_11 (34) = happyShift action_22
action_11 (7) = happyGoto action_37
action_11 _ = happyFail (happyExpListPerState 11)

action_12 _ = happyReduce_5

action_13 (14) = happyShift action_36
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (33) = happyShift action_35
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (33) = happyShift action_34
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (12) = happyShift action_33
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (17) = happyShift action_32
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (49) = happyShift action_30
action_18 (50) = happyShift action_31
action_18 (11) = happyGoto action_29
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (12) = happyShift action_28
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (17) = happyShift action_27
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (34) = happyShift action_26
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (14) = happyShift action_25
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (12) = happyShift action_24
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (22) = happyShift action_13
action_24 (24) = happyShift action_14
action_24 (25) = happyShift action_15
action_24 (26) = happyShift action_16
action_24 (27) = happyShift action_17
action_24 (28) = happyShift action_18
action_24 (29) = happyShift action_19
action_24 (31) = happyShift action_20
action_24 (32) = happyShift action_21
action_24 (34) = happyShift action_22
action_24 (6) = happyGoto action_60
action_24 (7) = happyGoto action_12
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (15) = happyShift action_59
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (17) = happyShift action_58
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_13

action_28 (22) = happyShift action_13
action_28 (24) = happyShift action_14
action_28 (25) = happyShift action_15
action_28 (26) = happyShift action_16
action_28 (27) = happyShift action_17
action_28 (28) = happyShift action_18
action_28 (29) = happyShift action_19
action_28 (31) = happyShift action_20
action_28 (32) = happyShift action_21
action_28 (34) = happyShift action_22
action_28 (6) = happyGoto action_57
action_28 (7) = happyGoto action_12
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (17) = happyShift action_56
action_29 _ = happyFail (happyExpListPerState 29)

action_30 _ = happyReduce_37

action_31 _ = happyReduce_38

action_32 _ = happyReduce_12

action_33 (22) = happyShift action_13
action_33 (24) = happyShift action_14
action_33 (25) = happyShift action_15
action_33 (26) = happyShift action_16
action_33 (27) = happyShift action_17
action_33 (28) = happyShift action_18
action_33 (29) = happyShift action_19
action_33 (31) = happyShift action_20
action_33 (32) = happyShift action_21
action_33 (34) = happyShift action_22
action_33 (6) = happyGoto action_55
action_33 (7) = happyGoto action_12
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (17) = happyShift action_54
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (17) = happyShift action_53
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (14) = happyShift action_41
action_36 (30) = happyShift action_42
action_36 (39) = happyShift action_43
action_36 (40) = happyShift action_44
action_36 (41) = happyShift action_45
action_36 (42) = happyShift action_46
action_36 (43) = happyShift action_47
action_36 (44) = happyShift action_48
action_36 (45) = happyShift action_49
action_36 (46) = happyShift action_50
action_36 (47) = happyShift action_51
action_36 (48) = happyShift action_52
action_36 (8) = happyGoto action_39
action_36 (10) = happyGoto action_40
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_6

action_38 _ = happyReduce_4

action_39 (15) = happyShift action_72
action_39 (18) = happyShift action_73
action_39 (19) = happyShift action_74
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (35) = happyShift action_68
action_40 (36) = happyShift action_69
action_40 (37) = happyShift action_70
action_40 (38) = happyShift action_71
action_40 (9) = happyGoto action_67
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (14) = happyShift action_41
action_41 (30) = happyShift action_42
action_41 (39) = happyShift action_43
action_41 (40) = happyShift action_44
action_41 (41) = happyShift action_45
action_41 (42) = happyShift action_46
action_41 (43) = happyShift action_47
action_41 (44) = happyShift action_48
action_41 (45) = happyShift action_49
action_41 (46) = happyShift action_50
action_41 (47) = happyShift action_51
action_41 (48) = happyShift action_52
action_41 (8) = happyGoto action_66
action_41 (10) = happyGoto action_40
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (14) = happyShift action_65
action_42 _ = happyFail (happyExpListPerState 42)

action_43 _ = happyReduce_27

action_44 _ = happyReduce_28

action_45 _ = happyReduce_29

action_46 _ = happyReduce_30

action_47 _ = happyReduce_31

action_48 _ = happyReduce_32

action_49 _ = happyReduce_33

action_50 _ = happyReduce_34

action_51 _ = happyReduce_35

action_52 _ = happyReduce_36

action_53 _ = happyReduce_9

action_54 _ = happyReduce_10

action_55 (13) = happyShift action_64
action_55 (22) = happyShift action_13
action_55 (24) = happyShift action_14
action_55 (25) = happyShift action_15
action_55 (26) = happyShift action_16
action_55 (27) = happyShift action_17
action_55 (28) = happyShift action_18
action_55 (29) = happyShift action_19
action_55 (31) = happyShift action_20
action_55 (32) = happyShift action_21
action_55 (34) = happyShift action_22
action_55 (7) = happyGoto action_37
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_15

action_57 (13) = happyShift action_63
action_57 (22) = happyShift action_13
action_57 (24) = happyShift action_14
action_57 (25) = happyShift action_15
action_57 (26) = happyShift action_16
action_57 (27) = happyShift action_17
action_57 (28) = happyShift action_18
action_57 (29) = happyShift action_19
action_57 (31) = happyShift action_20
action_57 (32) = happyShift action_21
action_57 (34) = happyShift action_22
action_57 (7) = happyGoto action_37
action_57 _ = happyFail (happyExpListPerState 57)

action_58 _ = happyReduce_14

action_59 (17) = happyShift action_62
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (13) = happyShift action_61
action_60 (22) = happyShift action_13
action_60 (24) = happyShift action_14
action_60 (25) = happyShift action_15
action_60 (26) = happyShift action_16
action_60 (27) = happyShift action_17
action_60 (28) = happyShift action_18
action_60 (29) = happyShift action_19
action_60 (31) = happyShift action_20
action_60 (32) = happyShift action_21
action_60 (34) = happyShift action_22
action_60 (7) = happyGoto action_37
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_3

action_62 _ = happyReduce_17

action_63 _ = happyReduce_16

action_64 _ = happyReduce_11

action_65 (33) = happyShift action_79
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (15) = happyShift action_78
action_66 (18) = happyShift action_73
action_66 (19) = happyShift action_74
action_66 _ = happyFail (happyExpListPerState 66)

action_67 _ = happyReduce_21

action_68 _ = happyReduce_23

action_69 _ = happyReduce_24

action_70 _ = happyReduce_25

action_71 _ = happyReduce_26

action_72 (12) = happyShift action_77
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (14) = happyShift action_41
action_73 (30) = happyShift action_42
action_73 (39) = happyShift action_43
action_73 (40) = happyShift action_44
action_73 (41) = happyShift action_45
action_73 (42) = happyShift action_46
action_73 (43) = happyShift action_47
action_73 (44) = happyShift action_48
action_73 (45) = happyShift action_49
action_73 (46) = happyShift action_50
action_73 (47) = happyShift action_51
action_73 (48) = happyShift action_52
action_73 (8) = happyGoto action_76
action_73 (10) = happyGoto action_40
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (14) = happyShift action_41
action_74 (30) = happyShift action_42
action_74 (39) = happyShift action_43
action_74 (40) = happyShift action_44
action_74 (41) = happyShift action_45
action_74 (42) = happyShift action_46
action_74 (43) = happyShift action_47
action_74 (44) = happyShift action_48
action_74 (45) = happyShift action_49
action_74 (46) = happyShift action_50
action_74 (47) = happyShift action_51
action_74 (48) = happyShift action_52
action_74 (8) = happyGoto action_75
action_74 (10) = happyGoto action_40
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (18) = happyShift action_73
action_75 _ = happyReduce_19

action_76 _ = happyReduce_18

action_77 (22) = happyShift action_13
action_77 (24) = happyShift action_14
action_77 (25) = happyShift action_15
action_77 (26) = happyShift action_16
action_77 (27) = happyShift action_17
action_77 (28) = happyShift action_18
action_77 (29) = happyShift action_19
action_77 (31) = happyShift action_20
action_77 (32) = happyShift action_21
action_77 (34) = happyShift action_22
action_77 (6) = happyGoto action_81
action_77 (7) = happyGoto action_12
action_77 _ = happyFail (happyExpListPerState 77)

action_78 _ = happyReduce_20

action_79 (15) = happyShift action_80
action_79 _ = happyFail (happyExpListPerState 79)

action_80 _ = happyReduce_22

action_81 (13) = happyShift action_82
action_81 (22) = happyShift action_13
action_81 (24) = happyShift action_14
action_81 (25) = happyShift action_15
action_81 (26) = happyShift action_16
action_81 (27) = happyShift action_17
action_81 (28) = happyShift action_18
action_81 (29) = happyShift action_19
action_81 (31) = happyShift action_20
action_81 (32) = happyShift action_21
action_81 (34) = happyShift action_22
action_81 (7) = happyGoto action_37
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (23) = happyShift action_83
action_82 _ = happyReduce_7

action_83 (12) = happyShift action_84
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (22) = happyShift action_13
action_84 (24) = happyShift action_14
action_84 (25) = happyShift action_15
action_84 (26) = happyShift action_16
action_84 (27) = happyShift action_17
action_84 (28) = happyShift action_18
action_84 (29) = happyShift action_19
action_84 (31) = happyShift action_20
action_84 (32) = happyShift action_21
action_84 (34) = happyShift action_22
action_84 (6) = happyGoto action_85
action_84 (7) = happyGoto action_12
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (13) = happyShift action_86
action_85 (22) = happyShift action_13
action_85 (24) = happyShift action_14
action_85 (25) = happyShift action_15
action_85 (26) = happyShift action_16
action_85 (27) = happyShift action_17
action_85 (28) = happyShift action_18
action_85 (29) = happyShift action_19
action_85 (31) = happyShift action_20
action_85 (32) = happyShift action_21
action_85 (34) = happyShift action_22
action_85 (7) = happyGoto action_37
action_85 _ = happyFail (happyExpListPerState 85)

action_86 _ = happyReduce_8

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 ([happy_var_1]
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_2 : happy_var_1
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happyReduce 7 5 happyReduction_3
happyReduction_3 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Fun happy_var_2 (reverse happy_var_6)
	) `HappyStk` happyRest

happyReduce_4 = happyReduce 5 5 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (State happy_var_2 (reverse happy_var_4)
	) `HappyStk` happyRest

happyReduce_5 = happySpecReduce_1  6 happyReduction_5
happyReduction_5 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_2  6 happyReduction_6
happyReduction_6 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_2 : happy_var_1
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happyReduce 7 7 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (IfThenElse happy_var_3 (reverse happy_var_6) []
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 11 7 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (IfThenElse happy_var_3 (reverse happy_var_6) (reverse happy_var_10)
	) `HappyStk` happyRest

happyReduce_9 = happySpecReduce_3  7 happyReduction_9
happyReduction_9 _
	(HappyTerminal (TInt happy_var_2))
	_
	 =  HappyAbsSyn7
		 (Mark happy_var_2
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  7 happyReduction_10
happyReduction_10 _
	(HappyTerminal (TInt happy_var_2))
	_
	 =  HappyAbsSyn7
		 (Unmark happy_var_2
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happyReduce 4 7 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Pickup (reverse happy_var_3)
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_2  7 happyReduction_12
happyReduction_12 _
	_
	 =  HappyAbsSyn7
		 (Drop
	)

happyReduce_13 = happySpecReduce_2  7 happyReduction_13
happyReduction_13 _
	_
	 =  HappyAbsSyn7
		 (Pass
	)

happyReduce_14 = happySpecReduce_3  7 happyReduction_14
happyReduction_14 _
	(HappyTerminal (TVar happy_var_2))
	_
	 =  HappyAbsSyn7
		 (Switch happy_var_2
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  7 happyReduction_15
happyReduction_15 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (Turn happy_var_2
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happyReduce 4 7 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Move happy_var_3
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 4 7 happyReduction_17
happyReduction_17 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Call happy_var_1
	) `HappyStk` happyRest

happyReduce_18 = happySpecReduce_3  8 happyReduction_18
happyReduction_18 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (CAnd happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  8 happyReduction_19
happyReduction_19 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (COr happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  8 happyReduction_20
happyReduction_20 _
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (happy_var_2
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_2  8 happyReduction_21
happyReduction_21 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn8
		 (CSense happy_var_1 happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happyReduce 4 8 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyTerminal (TInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (CRand happy_var_3
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_1  9 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn9
		 (Ahead
	)

happyReduce_24 = happySpecReduce_1  9 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn9
		 (Here
	)

happyReduce_25 = happySpecReduce_1  9 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn9
		 (LeftAhead
	)

happyReduce_26 = happySpecReduce_1  9 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn9
		 (RightAhead
	)

happyReduce_27 = happySpecReduce_1  10 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn10
		 (Friend
	)

happyReduce_28 = happySpecReduce_1  10 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn10
		 (Foe
	)

happyReduce_29 = happySpecReduce_1  10 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn10
		 (FriendWithFood
	)

happyReduce_30 = happySpecReduce_1  10 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn10
		 (FoeWithFood
	)

happyReduce_31 = happySpecReduce_1  10 happyReduction_31
happyReduction_31 _
	 =  HappyAbsSyn10
		 (Rock
	)

happyReduce_32 = happySpecReduce_1  10 happyReduction_32
happyReduction_32 _
	 =  HappyAbsSyn10
		 (Food
	)

happyReduce_33 = happySpecReduce_1  10 happyReduction_33
happyReduction_33 (HappyTerminal (TMarker happy_var_1))
	 =  HappyAbsSyn10
		 (Marker happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  10 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn10
		 (FoeMarker
	)

happyReduce_35 = happySpecReduce_1  10 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn10
		 (Home
	)

happyReduce_36 = happySpecReduce_1  10 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn10
		 (FoeHome
	)

happyReduce_37 = happySpecReduce_1  11 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn11
		 (DLeft
	)

happyReduce_38 = happySpecReduce_1  11 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn11
		 (DRight
	)

happyNewToken action sts stk [] =
	action 51 51 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TLBrace -> cont 12;
	TRBrace -> cont 13;
	TLPar -> cont 14;
	TRPar -> cont 15;
	TComma -> cont 16;
	TSemicolon -> cont 17;
	TAnd -> cont 18;
	TOr -> cont 19;
	TFn -> cont 20;
	TState -> cont 21;
	TIf -> cont 22;
	TElse -> cont 23;
	TMark -> cont 24;
	TUnmark -> cont 25;
	TPickup -> cont 26;
	TDrop -> cont 27;
	TTurn -> cont 28;
	TMove -> cont 29;
	TRand -> cont 30;
	TPass -> cont 31;
	TSwitch -> cont 32;
	TInt happy_dollar_dollar -> cont 33;
	TVar happy_dollar_dollar -> cont 34;
	TAhead -> cont 35;
	THere -> cont 36;
	TLeftAhead -> cont 37;
	TRightAhead -> cont 38;
	TFriend -> cont 39;
	TFoe -> cont 40;
	TFriendWithFood -> cont 41;
	TFoeWithFood -> cont 42;
	TRock -> cont 43;
	TFood -> cont 44;
	TMarker happy_dollar_dollar -> cont 45;
	TFoeMarker -> cont 46;
	THome -> cont 47;
	TFoeHome -> cont 48;
	TLeft -> cont 49;
	TRight -> cont 50;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 51 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. parseError
parse tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: ([Token], [String]) -> a
parseError (tk, tks) = unsafePerformIO $ do
  putStrLn $ "Got: " ++ show tk ++ "\nExpexted: " ++ show tks
  exitFailure
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
