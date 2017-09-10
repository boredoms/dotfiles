import XMonad
import Control.Monad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName

import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeys, additionalMouseBindings)
import XMonad.Util.SpawnOnce
import XMonad.Util.Loggers

import qualified XMonad.StackSet as W
import qualified Data.Map as M
import GHC.IO.Handle.Types as H

import XMonad.Layout.Spacing
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.WindowArranger
import XMonad.Layout.Gaps
import XMonad.Layout.Circle

import XMonad.Actions.CycleWS (prevWS, nextWS)

import System.IO

myWorkspaces :: [String]
myWorkspaces = click $ [ " yu ", " ka ", " ri ", " ya ", " ku ", " mo "]
       	       where click l = [ "^ca(1, xdotool key super+"
       	     	       	       ++ show (n) ++ ")" ++ ws ++ "^ca()" |
		       	       (i,ws) <- zip [1..] l,
       	     	       	       let n = i]

myManageHook = composeAll
	       [ className =? "Gimp" --> doFloat
	       ]

myKeys = [ ((modm, xK_r), spawn "dmenu_run -fn 'Lucy Tewi-11:pixelsize=11' -nb '#222222' -nf '#999999' -sb '#444444' -sf '#999999' -b")
         , ((mod1Mask, xK_F4), kill)
       	 , ((modm, xK_Left), prevWS)
	 , ((modm, xK_Right), nextWS)
	 , ((modm .|. controlMask              , xK_s    ), sendMessage  Arrange         )
	 , ((modm .|. controlMask .|. shiftMask, xK_s    ), sendMessage  DeArrange       )
         , ((modm .|. controlMask              , xK_Left ), sendMessage (MoveLeft      10))
         , ((modm .|. controlMask              , xK_Right), sendMessage (MoveRight     10))
         , ((modm .|. controlMask              , xK_Down ), sendMessage (MoveDown      10))
         , ((modm .|. controlMask              , xK_Up   ), sendMessage (MoveUp        10))
         , ((modm                 .|. shiftMask, xK_Left ), sendMessage (IncreaseLeft  10))
         , ((modm                 .|. shiftMask, xK_Right), sendMessage (IncreaseRight 10))
         , ((modm                 .|. shiftMask, xK_Down ), sendMessage (IncreaseDown  10))
         , ((modm                 .|. shiftMask, xK_Up   ), sendMessage (IncreaseUp    10))
         , ((modm .|. controlMask .|. shiftMask, xK_Left ), sendMessage (DecreaseLeft  10))
         , ((modm .|. controlMask .|. shiftMask, xK_Right), sendMessage (DecreaseRight 10))
         , ((modm .|. controlMask .|. shiftMask, xK_Down ), sendMessage (DecreaseDown  10))
         , ((modm .|. controlMask .|. shiftMask, xK_Up   ), sendMessage (DecreaseUp    10))
         , ((modm, xK_KP_Add), sequence_ [ sendMessage (IncreaseLeft 10)
   	 	 	     	       	 , sendMessage (IncreaseRight 10)
  	     			         , sendMessage (IncreaseUp 10)
					 , sendMessage (IncreaseDown 10)
			  		 ])
	 , ((modm, xK_KP_Subtract), sequence_ [ sendMessage (DecreaseLeft 10)
	 		   	      	      , sendMessage (DecreaseRight 10)
                                              , sendMessage (DecreaseUp 10)
                                              , sendMessage (DecreaseDown 10)
                                              ])
	 ] where modm = myModMask

startUp :: X()
startUp = do
	spawnOnce "compton"
	spawnOnce "./.fehbg"
	spawnOnce "xrdb -load .Xresources"

logbar h = do
         dynamicLogWithPP $ tryPP h

tryPP :: Handle -> PP
tryPP h = defaultPP
      	{ ppOutput = hPutStrLn h
	, ppCurrent = dzenColor (back) (blu1) . pad
	, ppVisible = dzenColor (fore) (back) . pad
	, ppHidden  = dzenColor (fore) (back) . pad
	, ppHiddenNoWindows = dzenColor (fore) (back) . pad
	, ppUrgent  = dzenColor (back) (red1) . pad
	, ppOrder = \(ws:l:t) -> [ws, l]
	, ppSep = ""
	, ppLayout = dzenColor (back) (red1) .
	  	   ( \t -> case t of
		     	   "Spacing 2 ResizableTall" -> " tall "
			   "Full" -> " full "
			   "Circle" -> " circ "
		   )
	}

blu1 = "#aa759f"
red1 = "#75b5aa"
fore = "#999999"
back = "#222222"

myTerm = "urxvt"
myModMask = mod4Mask
myFont = "-lucy-tewi-medium-*-*-*-11-*-*-*-*-*-*-*"

res = ResizableTall 1 (2/100) (1/2) []
ful = noBorders (fullscreenFull Full)

layout = (gaps [(U, 34), (R, 8), (L, 8), (D, 8)] $ avoidStruts (spacing 2 $ res)) ||| Circle ||| ful

main = do
        bar <- spawnPipe panel
	info <- spawnPipe $ "conky | dzen2 -x 410 -y 10 -h 16 -w 1180 -p -ta r -e '' -bg '#222222' -fg '#999999' -fn '" ++ myFont ++ "'"
	xmonad $ defaultConfig
	       { manageHook = manageDocks <+> manageHook defaultConfig
	       , layoutHook = windowArrange layout
	       , startupHook = startUp
	       , workspaces = myWorkspaces
	       , modMask = myModMask
	       , terminal = myTerm
	       , borderWidth = 5
	       , focusedBorderColor = "#444444"
	       , normalBorderColor = "#222222"
	       , logHook = logbar bar
	       } `additionalKeys` myKeys
	       where panel = "dzen2 -ta l -p -w 400 -y 10 -x 10 -h 16 -e '' -bg '#222222' -fg '#999999' -fn '" ++ myFont ++ "'"