-----------------------------------------------------------------------------
-- |
-- Module      :  TestSuite.Crypto.RC4
-- Copyright   :  (c) Levent Erkok
-- License     :  BSD3
-- Maintainer  :  erkokl@gmail.com
-- Stability   :  experimental
-- Portability :  portable
--
-- Test suite for Data.SBV.Examples.Crypto.RC4
-----------------------------------------------------------------------------

module TestSuite.Crypto.RC4(testSuite) where

import Data.SBV
import Data.SBV.Examples.Crypto.RC4

import SBVTest

-- Test suite
testSuite :: SBVTestSuite
testSuite = mkTestSuite $ \_ -> test [
   "rc4swap" ~: assert =<< isTheorem readWrite
 ]
 where readWrite i j = readSTree (writeSTree initS i j) i .== j
