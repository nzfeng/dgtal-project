#pragma once

#if defined(TestFile_RECURSES)
#else
/** Prevents recursive inclusion of headers. */
#define TestFile_RECURSES

#if !defined TestFile_h
/** Prevents repeated inclusion of headers. */
#define TestFile_h


#include <iostream>
#include <ostream>

#include <DGtal/helpers/Shortcuts.h>
#include <DGtal/helpers/ShortcutsGeometry.h>

void testFunction(const std::string& filepath);

#endif // !defined TestFile_h
#undef TestFile_RECURSES
#endif