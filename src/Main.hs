module Main where

import qualified DB
import           Member
import           MemberGateway
import           MemberQueries

import           Data.Proxy    (Proxy (..))

main :: IO ()
main = do
  DB.createTable (Proxy @Member)
  members <- fetchMembers
  mapM_ saveMember members
  getRandomMember >>= print

