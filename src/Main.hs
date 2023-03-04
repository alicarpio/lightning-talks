module Main where

import qualified DB
import           Member
import           MemberGateway
import           MemberQueries
import           Server

import           Data.Proxy    (Proxy (..))

main :: IO ()
main = do
  DB.createTable (Proxy @Member)
  mapM_ saveMember =<< fetchMembers
  runServer 8080

