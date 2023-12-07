// #include <DGtal/helpers/Shortcuts.h> // don't get errors if I #include DGtal headers in main.cpp

#include "object.h" // get errors if I #include DGtal headers via other files

#include "polyscope/polyscope.h"

#include "args/args.hxx"
#include "imgui.h"

int main(int argc, char** argv) {

    args::ArgumentParser parser("Test program.");
    args::Positional<std::string> meshFilename(parser, "mesh", "A mesh file.");

    try {
        parser.ParseCLI(argc, argv);
    } catch (args::Help&) {
        std::cout << parser;
        return 0;
    } catch (args::ParseError& e) {
        std::cerr << e.what() << std::endl;
        std::cerr << parser;
        return 1;
    }

    if (meshFilename) {
        testFunction(args::get(meshFilename));
    }

    return 0;
}