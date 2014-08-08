#
#  Copyright (C) 2013-2014 mogemimi.
#
#  Distributed under the MIT License.
#  See accompanying file LICENSE.md or copy at
#  http://enginetrouble.net/pomdog/LICENSE.md for details.
#

import sys
import os
import argparse
import string
import re

# How to use:
# >>> python tools/glsl2embedded.py VertexShader.glsl
# Create new file: VertexShader.embedded.glsl

def ReadGLSLSource(path):
    f = open(path, 'r')
    str = f.read()
    f.close()
    return str

def SaveEmbeddedCode(path, content):
    f = open(path, 'w')
    f.write(content)
    f.close()
    print "Create new file: " + path

def RemoveWhiteSpace(source):
    result = ""
    for line in source.split('\n'):
        line = line.strip()
        if line:
          result += line
          result += '\n'
    return result

def RemoveCommentOut(source):
    result = ""
    pattern = re.compile("(.*)(//)(.*)")
    for line in source.split('\n'):
        m = pattern.match(line)
        while m and line:
          if m:
            line = m.group(1)
          m = pattern.match(line)
        if line:
          result += line
          result += '\n'
    return result

def CompressGLSLCode(source):
    preformatted = RemoveCommentOut(RemoveWhiteSpace(source))
    preformatted = preformatted.replace(' + ', '+')
    preformatted = preformatted.replace(' - ', '-')
    preformatted = preformatted.replace(' * ', '*')
    preformatted = preformatted.replace(' / ', '/')
    preformatted = preformatted.replace(' = ', '=')
    preformatted = preformatted.replace(' < ', '<')
    preformatted = preformatted.replace(' > ', '>')
    preformatted = preformatted.replace(' <= ', '<=')
    preformatted = preformatted.replace(' >= ', '>=')
    preformatted = preformatted.replace(', ', ',')
    preformatted = preformatted.replace(' (', '(')
    preformatted = preformatted.replace(') ', ')')
    preformatted = preformatted.replace(' {', '{')
    preformatted = preformatted.replace('} ', '}')
    return preformatted

def ConvertGLSL2EmbeddedCode(source):
    formatted = CompressGLSLCode(source)
    result = "char const* shaderCode = "
    for line in formatted.split('\n'):
        if not line or line == '\n':
            continue
        line = line.replace('"', '\\"')
        result += '"'
        result += line
        result += '\\n"\n'
    return result

def ParsingCommandLineAraguments():
    parser = argparse.ArgumentParser(prog='skeleton_generator',
                                     description='Convert GLSL to embedded C++ code.')
    parser.add_argument('identifier', default='def')
    parser.add_argument('-v', '--version', action='version', version='%(prog)s version 0.1.0')
    args = parser.parse_args()
    return args

def Run():
    args = ParsingCommandLineAraguments()

    path = args.identifier
    identifier, ext = os.path.splitext(args.identifier)
    directory = os.path.dirname(args.identifier)

    source = ReadGLSLSource(path)
    embedded = ConvertGLSL2EmbeddedCode(source)
    SaveEmbeddedCode(identifier + '.embedded' + ext, embedded)

Run()