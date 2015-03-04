{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty
import Rules
import qualified Web.Scotty as S
import Text.Blaze.Html5 (h3,br,toHtml)
import Text.Blaze.Html.Renderer.Text (renderHtml)
import Data.Time.Clock
import Data.Time.LocalTime
import Data.Time.Calendar.WeekDate
import Data.Text.Internal.Lazy

main = S.scotty 5000 $ S.get "/:code" $ do
	code <- param "code"
	html $ ress code 100

ress :: String -> Int -> Data.Text.Internal.Lazy.Text
ress c n = (renderHtml . toHtml) $ custom c n

