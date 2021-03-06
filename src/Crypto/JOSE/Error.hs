-- Copyright (C) 2014  Fraser Tweedale
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

{-|

JOSE error types.

-}
module Crypto.JOSE.Error
  (
    Error(..)
  ) where

import qualified Crypto.PubKey.RSA as RSA

-- | All the errors that can occur, with the notable exception of
--   'Data.Aeson' decoding functions.  Aeson decoding errors that
--   occur in 'decodeCompact' are, however, lifted into this type
--   via the 'JSONDecodeError' constructor.
--
data Error
  = AlgorithmNotImplemented   -- ^ A requested algorithm is not implemented
  | AlgorithmMismatch String  -- ^ A requested algorithm cannot be used
  | KeyMismatch String        -- ^ Wrong type of key was given
  | KeySizeTooSmall           -- ^ Key size is too small
  | RSAError RSA.Error        -- ^ RSA encryption, decryption or signing error
  | CompactEncodeError String -- ^ Cannot produce compact representation of data
  | CompactDecodeError String -- ^ Cannot decode compact representation
  | JSONDecodeError String    -- ^ Cannot decode JSON data
  deriving (Eq, Show)
