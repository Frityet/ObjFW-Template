#pragma once

#define nillable _Nullable
#define nonnil _Nonnull
// `nil` is `_Null_unspecified` which lets you pass `nil` to a `_Nonnull` parameter
// using this macro will cause a warning, which is better
#define nilptr ((void *nillable)0)

//you can remove this if you want
#if defined(nil)
#   undef nil
#endif
#define nil nilptr

#if defined(NULL)
#   undef NULL
#endif
#define NULL nilptr

#if !__has_feature(cxx_auto_type) || __STDC_VERSION__ < 202111L
#   define auto __auto_type
#endif
