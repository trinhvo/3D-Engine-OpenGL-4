//Copyright (c) 2020 by Stan Fortoński
//Based on: Computer Graphics Programming in OpenGL with C++ V. Scott Gordon | John Clevenger
#version 410

layout (quads, fractional_even_spacing, ccw) in;

in vec2 tc_out[];

uniform sampler2D heightMap;
uniform float depth;
uniform mat4 model;

void main()
{
  vec2 tc = vec2(tc_out[0].x + (gl_TessCoord.x) / 64.0, tc_out[0].y + (1.0 - gl_TessCoord.y) / 64.0);
  vec4 tessellatedPoint = vec4(gl_in[0].gl_Position.x + gl_TessCoord.x / 64.0, 0.0, gl_in[0].gl_Position.z + gl_TessCoord.y / 64.0, 1.0);
  tessellatedPoint.y += texture(heightMap, tc).r * depth;

  gl_Position = model * tessellatedPoint;
}
