{-# LANGUAGE DerivingStrategies #-}

module Sysle.Syntactic
    ( Def (..)
    , TermExp (..)
    , TypeExp (..)
    ) where

import Data.List.NonEmpty (NonEmpty)
import Sysle.Name (Id)
import Sysle.Position (Pos)

data Def
    = NamespaceDef Pos (NonEmpty Id) [Def]
    | ValueDef Pos Id TypeExp TermExp
    | StrongDef Pos Id [Id] TypeExp
    deriving stock (Eq, Show)

data TermExp
    = VariableTermExp Pos Id
    | ApplyTermExp TermExp TermExp
    | LambdaTermExp Pos Id TermExp
    | FieldTermExp TermExp Id
    deriving stock (Eq, Show)

data TypeExp
    = VariableTypeExp Pos Id
    | ApplyTypeExp TypeExp TypeExp
    | FieldTypeExp TypeExp Id
    deriving stock (Eq, Show)
