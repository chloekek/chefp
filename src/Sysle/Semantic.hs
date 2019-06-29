{-# LANGUAGE DerivingStrategies #-}

module Sysle.Semantic
    ( Defs (..)
    , TermExp (..)
    , TypeExp (..)
    ) where

import Sysle.Name (Id, Qid)
import Sysle.Position (Pos)

data Defs =
    Defs
        { valueDefs :: HashMap Qid ValueDef }
    deriving stock (Eq, Show)

data ValueDef =
    ValueDef Pos TypeExp TermExp
    deriving stock (Eq, Show)

data TermExp
    = LocalTermExp Pos TypeExp Id
    | GlobalTermExp Pos TypeExp Qid
    | ApplyTermExp TypeExp TermExp TermExp
    | LambdaTermExp Pos TypeExp Id TermExp
    | FieldTermExp TypeExp TermExp Id
    deriving stock (Eq, Show)

data TypeExp
    = LocalTypeExp Pos Id
    | GlobalTypeExp Pos Qid
    | ApplyTypeExp TypeExp TypeExp
    | FieldTypeExp TypeExp Id
    deriving stock (Eq, Show)
