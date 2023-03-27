module DB where

import           Data.Proxy                   (Proxy (..))
import qualified Data.Text                    as T
import           Database.SQLite.Simple       (Connection, execute_)
import qualified Database.SQLite.Simple       as SQLite
import           Database.SQLite.Simple.Types
import           GHC.TypeLits                 (KnownSymbol, Symbol, symbolVal)

class HasTable a where
  type TableStmt a :: Symbol

-- | Create the table for any type that has a table.
--
createTable :: forall a. (HasTable a, KnownSymbol (TableStmt a)) => Proxy a -> IO ()
createTable _ =
  let tableStmt = symbolVal (Proxy :: Proxy (TableStmt a))
   in SQLite.withConnection "db.sqlite"
                     (flip execute_ $ Query $ T.pack tableStmt)


withConnection :: (Connection -> IO a) -> IO a
withConnection = SQLite.withConnection "db.sqlite"
