#!/bin/bash
cd "$(dirname "$0")"
/Applications/Blender.app/Contents/MacOS/Blender --background --factory-startup --python blender-src/make_cafe.py > reports/cafe-models.log 2>&1
echo DONE >> reports/cafe-models.log
