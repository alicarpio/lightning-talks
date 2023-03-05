module Server (runServer) where

import           LightningTalk
import qualified LightningTalkQueries                 as LTQueries
import           Member
import qualified MemberQueries                        as MQueries

import           Control.Monad.IO.Class               (liftIO)
import           Data.Text                            (Text)
import           Network.Wai.Handler.Warp             (run)
import           Network.Wai.Middleware.RequestLogger (logStdout)
import           Servant

runServer :: Int -> IO ()
runServer port = run port $ logStdout (serve api server)

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
  :<|> Capture "id" Text :> Get '[JSON] Member
  )

type LightningTalksAPI = "lightning_talks" :>
    Get '[JSON] LightningTalk


membersServer :: Server MemberAPI
membersServer = getAllMembers :<|> getRandomMember :<|> getMemberById
  where
    getAllMembers = liftIO MQueries.getAllMembers

    getMemberById memberId = do
      member <- liftIO $ MQueries.getMemberById memberId
      maybe (throwError err404) pure member

    getRandomMember = do
      member <- liftIO MQueries.getRandomMember
      maybe (throwError err404) pure member

lightningTalksServer :: Server LightningTalksAPI
lightningTalksServer = getLightningTalk
  where
    getLightningTalk = do
      lt <- liftIO LTQueries.getLightningTalk
      maybe (throwError err404) pure lt
