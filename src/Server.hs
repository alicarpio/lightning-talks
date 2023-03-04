module Server (runServer) where

import           LightningTalk
import qualified LightningTalkQueries     as LTQueries
import           Member
import qualified MemberQueries            as MQueries

import           Control.Monad.IO.Class   (liftIO)
import           Network.Wai.Handler.Warp (run)
import           Servant

runServer :: Int -> IO ()
runServer port = run port (serve api server)

api :: Proxy API
api = Proxy

server :: Server API
server = membersServer :<|> lightningTalksServer

type API = "api" :> "v1" :>
  (
    MemberAPI :<|> LightningTalksAPI
  )

type MemberAPI = "members" :>
  (
    Get '[JSON] [Member]
  :<|> "random" :> Get '[JSON] Member
  )

type LightningTalksAPI = "lightning_talks" :>
    Get '[JSON] LightningTalk


membersServer :: Server MemberAPI
membersServer = getAllMembers :<|> getRandomMember
  where
    getAllMembers = liftIO MQueries.getAllMembers
    getRandomMember = do
      member <- liftIO MQueries.getRandomMember
      case member of
        Just member -> pure member
        _           -> throwError err404

lightningTalksServer :: Server LightningTalksAPI
lightningTalksServer = getLightningTalk
  where
    getLightningTalk = do
      lt <- liftIO LTQueries.getLightningTalk
      case lt of
        Just lt -> pure lt
        _       -> throwError err404
