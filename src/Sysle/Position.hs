{-# LANGUAGE DerivingStrategies #-}

module Sysle.Position
  ( Pos (..)
  ) where

import Data.ByteString (ByteString)

data Pos =
    Pos
        { posFile :: ByteString
        , posLine :: Word
        , posColumn :: Word }
    deriving stock (Eq, Show)
