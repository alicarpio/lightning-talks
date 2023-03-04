module LightningTalk where

import           Aeson
import           DB

import           Data.Text                      (Text)
import           Database.SQLite.Simple.FromRow
import           Deriving.Aeson

type MemberId = Text

data LightningTalk = LightningTalk
  { _lightningTalkTopic   :: !Text
  , _lightningTalkSpeaker :: !MemberId
  }
  deriving stock (Show, Generic)
  deriving (FromJSON, ToJSON)
  via CustomJSON '[FieldLabelModifier '[StripPrefix "_lightningTalk", ToLower]] LightningTalk


instance HasTable LightningTalk where
  type TableStmt LightningTalk =
    "create table if not exists lightning_talk ( \
    \  topic varchar not null \
    \  speaker varchar not null \
    \)"

instance FromRow LightningTalk where
  fromRow = LightningTalk <$> field <*> field
