{-# LANGUAGE TemplateHaskell #-}
module Member where

import           DB

import           Control.Lens                   (makeLenses)
import           Data.Char                      (toLower)
import           Data.Text                      (Text)
import           Database.SQLite.Simple.FromRow
import           Deriving.Aeson


data ToLower

instance StringModifier ToLower where
  getStringModifier ""       = ""
  getStringModifier (c : xs) = toLower c : xs

data Member = Member
  { _memberId        :: !Text    -- ^ The member's id (this is a UUID)
  , _memberFirstName :: !Text    -- ^ The member's first name
  , _memberLastName  :: !Text    -- ^ The member's last name
  }
  deriving stock (Show, Generic)
  deriving (FromJSON, ToJSON)
  via CustomJSON '[FieldLabelModifier '[StripPrefix "_member", ToLower]] Member

makeLenses ''Member

instance HasTable Member where
  type TableStmt Member =
    "create table if not exists members ( \
    \ id varchar primary key, \
    \ first_name varchar not null, \
    \ last_name varchar not null, \
    \ already_talked boolean default FALSE \
    \)"

instance FromRow Member where
  fromRow = Member <$> field <*> field <*> field
