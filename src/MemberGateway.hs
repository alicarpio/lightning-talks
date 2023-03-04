module MemberGateway where

import           Member

import           Network.HTTP.Req

apiUrl :: Url 'Https
apiUrl = https "kokoa.up.railway.app" /: "api" /: "v1" /: "members"

-- | Get the list of members from the API.
--
fetchMembers :: IO [Member]
fetchMembers = runReq defaultHttpConfig $ do
  r <- req
        GET
        apiUrl
        NoReqBody
        jsonResponse
        mempty
  pure $ responseBody r

