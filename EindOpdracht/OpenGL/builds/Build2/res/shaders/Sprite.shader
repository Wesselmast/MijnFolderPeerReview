#shader vertex
#version 330 core

layout(location = 0) in vec3 position;
layout(location = 1) in vec3 normal;
layout(location = 2) in vec2 texCoord;

out vec2 v_TexCoord;
out vec3 Normal;

uniform mat4 u_MVP;

void main()
{
	gl_Position = u_MVP * vec4(position,1.0f);
	v_TexCoord = texCoord;
	Normal = normal;
};






#shader fragment
#version 330 core

layout(location = 0) out vec4 color;



in vec2 v_TexCoord;
in vec3 Normal;

uniform vec4 u_Color;
uniform sampler2D u_Texture;

void main()
{
	vec4 texColor = texture(u_Texture, v_TexCoord);
	
	vec3 lightDir = normalize(vec3(0.0f, 0.4f, 0.3f));
	float diff = max(dot(Normal, lightDir), 0.0);
	vec3 dif = diff * vec3(1.15f,1.0f,1.0f);
	
	color = texColor * (vec4(dif.x,dif.y,dif.z, 1.0f) + vec4(0.4f, 0.4f, 0.4f, 1.0f));
};