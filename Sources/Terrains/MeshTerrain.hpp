#pragma once

#include <Models/Shapes/MeshSimple.hpp>
#include <Maths/Maths.hpp>
#include <Maths/Colour.hpp>

using namespace fl;

namespace test
{
	class MeshTerrain :
		public MeshSimple
	{
	private:
		float m_radius;
		Matrix4 m_worldMatrix;
	public:
		static const std::vector<float> SQUARE_SIZES;
		static const std::vector<float> TEXTURE_SCALES;

		MeshTerrain(const float &sideLength, const float &squareSize, const int &vertexCount, const float &textureScale, const float &radius, const Transform &transform);

		~MeshTerrain();

		Vector3 GetPosition(const float &x, const float &z) override;

		Vector3 GetNormal(const Vector3 &position) override;

		Vector3 GetColour(const Vector3 &position, const Vector3 &normal) override;
	};
}