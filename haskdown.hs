{-# LANGUAGE OverloadedStrings #-}
-- A static site generator
-- Author: Reeze Xia <reeze.xia@gmail.com>

module Main where

import System.IO

import System.Console.GetOpt


import Data.Text as T
import Data.Text.Lazy as Lazy
import Text.Blaze.Html (toHtml)
import Text.Markdown
import Text.Blaze.Html.Renderer.Text (renderHtml)

configFile = "_config.yml"

main :: IO ()
main = do
  handle <- openFile "./a.md" ReadMode
  md <- hGetContents handle
  let html = renderHtml $ markdown def $ Lazy.pack md
  putStrLn $ Lazy.unpack html
  hClose handle