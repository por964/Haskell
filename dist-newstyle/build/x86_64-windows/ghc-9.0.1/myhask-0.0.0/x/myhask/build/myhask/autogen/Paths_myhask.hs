{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_myhask (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\claes\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\claes\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-9.0.1\\myhask-0.0.0-inplace-myhask"
dynlibdir  = "C:\\Users\\claes\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-9.0.1"
datadir    = "C:\\Users\\claes\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-9.0.1\\myhask-0.0.0"
libexecdir = "C:\\Users\\claes\\AppData\\Roaming\\cabal\\myhask-0.0.0-inplace-myhask\\x86_64-windows-ghc-9.0.1\\myhask-0.0.0"
sysconfdir = "C:\\Users\\claes\\AppData\\Roaming\\cabal\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "myhask_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "myhask_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "myhask_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "myhask_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "myhask_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "myhask_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
