module Components.Toggle where

import Prelude

import Data.Maybe
  ( Maybe(..)
  , fromMaybe
  )
import React.Basic
  ( Component
  , JSX
  , StateUpdate(..)
  , createComponent
  , make
  )

import React.Basic.DOM as R
import React.Basic.Events as E

type Props
  = {initialValue :: Boolean}

component ::
  Component Props
component = createComponent "App"

toggle ::
  Props ->
  JSX
toggle = make component { initialState
                        , render
                        }
  where
  initialState = Nothing
  render self = R.button { onClick: E.handler_ $ self.setState (\s -> map not $ Just $ fromMaybe self.props.initialValue s)
                         , children: [ R.text if fromMaybe self.props.initialValue self.state
                                       then "On"
                                       else "Off"
                                     ]
                         }
