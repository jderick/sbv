-----------------------------------------------------------------------------
-- |
-- Module      :  TestSuite.Existentials.CRCPolynomial
-- Copyright   :  (c) Levent Erkok
-- License     :  BSD3
-- Maintainer  :  erkokl@gmail.com
-- Stability   :  experimental
-- Portability :  portable
--
-- Test suite for Data.SBV.Examples.Existentials.CRCPolynomial
-----------------------------------------------------------------------------

module TestSuite.Existentials.CRCPolynomial(testSuite) where

import Data.SBV
import Data.SBV.Internals
import Data.SBV.Examples.Existentials.CRCPolynomial

import SBVTest

-- Test suite
testSuite :: SBVTestSuite
testSuite = mkTestSuite $ \goldCheck -> test [
  "crcPolyExist" ~: pgm `goldCheck` "crcPolyExist.gold"
 ]
 where pgm = runSymbolic True $ do
                p <- exists "poly"
                s <- do sh <- forall "sh"
                        sl <- forall "sl"
                        return (sh, sl)
                r <- do rh <- forall "rh"
                        rl <- forall "rl"
                        return (rh, rl)
                output $ sbvTestBit p 0 &&& crcGood 4 p s r
