module Aeson where

import           Data.Char      (toLower)
import           Deriving.Aeson

data ToLower

instance StringModifier ToLower where
  getStringModifier ""       = ""
  getStringModifier (c : xs) = toLower c : xs

