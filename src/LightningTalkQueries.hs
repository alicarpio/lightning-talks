module LightningTalkQueries where

import           Data.Maybe             (listToMaybe)
import           Database.SQLite.Simple (query_, withConnection)
import           LightningTalk

{-
  At any given point there is only one row in the lightning talks
  table. This row corresponds to the next lightning talk to take
  place.

  TODO: We might want to keep a history of all the lightning talks
  that have been given.
-}

-- | Get the currently scheduled lightning talk.
getLightningTalk :: IO (Maybe LightningTalk)
getLightningTalk =
  let
      query = mconcat [ "select topic, speaker"
                      , "  from lightning_talks"
                      , " limit 1"
                      ]
   in withConnection "db.sqlite" $ \conn ->
    listToMaybe <$> query_ conn query
