#include "object.h"

void testFunction(const std::string& filepath) {

    typedef DGtal::Shortcuts<DGtal::Z3i::KSpace> SH3;
    typedef DGtal::ShortcutsGeometry<DGtal::Z3i::KSpace> SHG3;

    auto params = SH3::defaultParameters() | SHG3::defaultParameters() | SHG3::parametersGeometryEstimation();
    params("surfaceComponents", "All");
    auto binary_image = SH3::makeBinaryImage(filepath, params);
}