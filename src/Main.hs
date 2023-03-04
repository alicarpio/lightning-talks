module Main where

import qualified DB
import           LightningTalk
import           Member
import           MemberGateway
import           MemberQueries
import           Server

import           Data.Proxy    (Proxy (..))

main :: IO ()
main = do
  DB.createTable (Proxy @Member)
  DB.createTable (Proxy @LightningTalk)

  mapM_ saveMember =<< fetchMembers

  runServer 8080

