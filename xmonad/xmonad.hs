{-# LANGUAGE FlexibleContexts #-}

import XMonad
import XMonad.Actions.CycleWS
import qualified XMonad.StackSet as W
import qualified Data.Map as M

myModMask = mod4Mask

myLauncher = "$(yeganesh -x -- -fn 'monospace-8' -nb '#000000' -nf '#FFFFFF' -sb '#7C7C7C' -sf '#CEFFAC')"

myTerminal = "termite"

myFocusFollowsMouse = False

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
  [ ((modMask .|. shiftMask, xK_Return),
     spawn $ XMonad.terminal conf)
  , ((modMask, xK_p),
     spawn myLauncher)

  , ((modMask, xK_Tab),
     windows W.focusDown)

  -- Close focused window.
  , ((modMask .|. shiftMask, xK_c),
     kill)

  -- Cycle through the available layout algorithms.
  , ((modMask, xK_space),
     sendMessage NextLayout)

  --  Reset the layouts on the current workspace to default.
  , ((modMask .|. shiftMask, xK_space),
     setLayout $ XMonad.layoutHook conf)

  -- Resize viewed windows to the correct size.
  , ((modMask, xK_n),
     refresh)

  -- Move focus to the next window.
  , ((modMask, xK_Tab),
     windows W.focusDown)

  -- Move focus to the next window.
  , ((modMask, xK_j),
     windows W.focusDown)

  -- Move focus to the previous window.
  , ((modMask, xK_k),
     windows W.focusUp  )

  -- Move focus to the master window.
  , ((modMask, xK_m),
     windows W.focusMaster  )

  -- Swap the focused window and the master window.
  , ((modMask, xK_Return),
     windows W.swapMaster)

  -- Swap the focused window with the next window.
  , ((modMask .|. shiftMask, xK_j),
     windows W.swapDown  )

  -- Swap the focused window with the previous window.
  , ((modMask .|. shiftMask, xK_k),
     windows W.swapUp    )

  -- Shrink the master area.
  , ((modMask, xK_h),
     sendMessage Shrink)

  -- Expand the master area.
  , ((modMask, xK_l),
     sendMessage Expand)

  -- Push window back into tiling.
  , ((modMask, xK_t),
     withFocused $ windows . W.sink)

  -- Increment the number of windows in the master area.
  , ((modMask, xK_comma),
     sendMessage (IncMasterN 1))

  -- Decrement the number of windows in the master area.
  , ((modMask, xK_period),
     sendMessage (IncMasterN (-1)))

  -- Toggle the status bar gap.
  -- TODO: update this binding with avoidStruts, ((modMask, xK_b),

  -- Quit xmonad.
  -- , ((modMask .|. shiftMask, xK_q),
     -- io (exitWith ExitSuccess))
--
  -- Restart xmonad.
  , ((modMask, xK_q),
     restart "xmonad" True)

  , ((modMask, xK_f),
     spawn "chromium")

  , ((modMask, xK_e),
     spawn "spacefm")

  , ((modMask, xK_a),
     toggleWS)
  ]

  ++

  -- mod-[1..9], Switch to workspace N
  -- mod-shift-[1..9], Move client to workspace N
  [((m .|. modMask, k), windows $ f i)
      | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
      , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

main = do
  xmonad $ defaultConfig {
    terminal = myTerminal,
    modMask = myModMask,
    keys = myKeys
  }
