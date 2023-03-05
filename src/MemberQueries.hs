module MemberQueries where

import qualified DB
import           LightningTalk          (MemberId)
import           LightningTalkQueries   (resetLightningTalk)
import           Member

import           Control.Lens
import           Data.Maybe             (listToMaybe)
import           Database.SQLite.Simple
import qualified Database.SQLite.Simple as SQLite


-- | Save a member to the database.
--
saveMember :: Member -> IO ()
saveMember member =
  let
      query = mconcat [ "insert into members (id, first_name, last_name) "
                      , "values (?, ?, ?)"
                      ]
   in
      DB.withConnection $ \conn ->
        execute conn query
                [ member ^. memberId
                , member ^. memberFirstName
                , member ^. memberLastName
                ]


-- | Get all members.
--
getAllMembers :: IO [Member]
getAllMembers =
  let
      query = mconcat [ "select id, first_name, last_name"
                      , "  from members"
                      ]
   in
      DB.withConnection (`query_` query)


-- | Get a random member.
-- If a random member could be retrieved, their status is updated to
-- reflect that they already gave their lightning talk.
--
getRandomMember :: IO (Maybe Member)
getRandomMember =
  let
      query = mconcat [ "select id, first_name, last_name"
                      , "  from members"
                      , " where already_talked = false"
                      , " order by RANDOM() "
                      , " limit 1"
                      ]
   in DB.withConnection $ \conn -> do
      result <- listToMaybe <$> query_ conn query
      case result of
        Just member -> do
          execute conn "update members set already_talked = true where id = ?" [member^.memberId]
          resetLightningTalk $ member^.memberId
          pure $ Just member
        _           -> pure Nothing


-- | Get a member by their id.
--
getMemberById :: MemberId -> IO (Maybe Member)
getMemberById memberId =
  let query = mconcat [ "select id, first_name, last_name"
                      , "  from members"
                      , " where id = ?"
                      ]
  in DB.withConnection $ \conn -> do
      listToMaybe <$> SQLite.query conn query [memberId]
