{-# LANGUAGE DerivingStrategies #-}

module Sysle.Name
  ( Id (..)
  , Qid (..)
  ) where

import Data.ByteString (ByteString)
import Data.List.NonEmpty (NonEmpty)

newtype Id =
    Id ByteString
    deriving stock (Eq, Ord, Show)

newtype Qid =
  Qid (NonEmpty Id)
    deriving stock (Eq, Ord, Show)
