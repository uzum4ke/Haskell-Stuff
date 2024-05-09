{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_Haskell_Stuff (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
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
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "C:\\CABAL\\bin"
libdir     = "C:\\CABAL\\x86_64-windows-ghc-9.2.5\\Haskell-Stuff-0.1.0.0-inplace-Haskell-Stuff"
dynlibdir  = "C:\\CABAL\\x86_64-windows-ghc-9.2.5"
datadir    = "C:\\CABAL\\x86_64-windows-ghc-9.2.5\\Haskell-Stuff-0.1.0.0"
libexecdir = "C:\\CABAL\\Haskell-Stuff-0.1.0.0-inplace-Haskell-Stuff\\x86_64-windows-ghc-9.2.5\\Haskell-Stuff-0.1.0.0"
sysconfdir = "C:\\CABAL\\etc"

getBinDir     = catchIO (getEnv "Haskell_Stuff_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "Haskell_Stuff_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "Haskell_Stuff_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "Haskell_Stuff_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Haskell_Stuff_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Haskell_Stuff_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '\\'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/' || c == '\\'
