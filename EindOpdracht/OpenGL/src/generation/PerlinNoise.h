#include <cmath>
#include <algorithm>

class PerlinNoise {
private: //section for private variables
	int* perm;
private: //section for private functions
	float fade(float t) const;
	float lerp(float t, float a, float b) const;
	float grad(int hash, float x, float y) const;
	float noise(float x, float y) const;
public: //section for public functions
	PerlinNoise();
	float octaveNoise(float x, float y, int amtOfOctaves) const;
	~PerlinNoise();
};