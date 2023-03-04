module Server (runServer) where

import           Member
import qualified MemberQueries            as Queries

import           Control.Monad.IO.Class   (liftIO)
import           Network.Wai.Handler.Warp (run)
import           Servant

runServer :: Int -> IO ()
runServer port = run port (serve api server)

api :: Proxy API
api = Proxy

server :: Server API
server = membersServer

type API = MemberAPI

type MemberAPI = "api" :> "v1" :>
  (
    Get '[JSON] [Member]
  :<|> "random" :> Get '[JSON] Member
  )


membersServer :: Server MemberAPI
membersServer = getAllMembers :<|> getRandomMember
  where
    getAllMembers = liftIO Queries.getAllMembers
    getRandomMember = do
      member <- liftIO Queries.getRandomMember
      case member of
        Just member -> pure member
        _           -> throwError err404
