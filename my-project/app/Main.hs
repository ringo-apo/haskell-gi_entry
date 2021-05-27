{-# LANGUAGE OverloadedStrings, OverloadedLabels #-}
{- cabal:
build-depends: base, haskell-gi-base, gi-gtk == 3.0.*
-}

import qualified GI.Gtk as Gtk
import Data.GI.Base

main :: IO ()
main = do
  Gtk.init Nothing

  win <- new Gtk.Window [ #title := "Hi there" ]

  on win #destroy Gtk.mainQuit
  #resize win 640 480

  box <- new Gtk.Box [ #orientation := Gtk.OrientationVertical]
  #add win box

  entry <- new Gtk.Entry []
  #add box entry


  msg <- new Gtk.Label [#label := "Your input comment"]
  #add box msg

  button <- new Gtk.Button [ #label := "Run" ]

  on button #clicked (do
                          buffer <- Gtk.entryGetBuffer entry
                          buffer2 <- Gtk.entryBufferGetText buffer
                          set msg [ #sensitive := False, #label := buffer2 ]
                     )

  #add box button

  #showAll win

  Gtk.main
