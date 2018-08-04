#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 0, binding = 0) uniform UboScene
{
	mat4 projection;
	mat4 view;
} scene;

layout(set = 0, binding = 1) uniform UboObject
{
	mat4 transform;
	float innerRadius;
	float outerRadius;
} object;

layout(set = 0, location = 0) in vec3 vertexPosition;
layout(set = 0, location = 1) in vec2 vertexUv;
layout(set = 0, location = 2) in vec3 vertexNormal;
layout(set = 0, location = 3) in vec3 vertexTangent;

layout(location = 0) out vec3 fragmentPosition;
layout(location = 1) out vec3 fragmentNormal;
layout(location = 2) out vec2 fragmentUv;

out gl_PerVertex
{
	vec4 gl_Position;
};

void main()
{
	vec4 totalLocalPos = vec4(vertexPosition, 1.0f);
	vec4 totalNormal = vec4(vertexNormal, 0.0f);

	vec4 worldPosition = object.transform * totalLocalPos;

	gl_Position = scene.projection * scene.view * worldPosition;

    fragmentPosition = vertexPosition;
	fragmentNormal = normalize((object.transform * totalNormal).xyz);
	fragmentUv = vertexUv;
}
