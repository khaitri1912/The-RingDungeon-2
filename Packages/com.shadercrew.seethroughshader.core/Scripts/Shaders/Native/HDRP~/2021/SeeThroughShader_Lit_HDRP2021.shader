Shader "SeeThroughShader/HDRP/2021/Lit"
{
   Properties
   {
        [MainColor] _BaseColor("BaseColor", Color) = (1,1,1,1)
        [MainTexture] _BaseColorMap("BaseColorMap", 2D) = "white" {}
        [HideInInspector] _BaseColorMap_MipInfo("_BaseColorMap_MipInfo", Vector) = (0, 0, 0, 0)

        _Metallic("_Metallic", Range(0.0, 1.0)) = 0
        _Smoothness("Smoothness", Range(0.0, 1.0)) = 0.5
        _MaskMap("MaskMap", 2D) = "white" {}
        _MetallicRemapMin("MetallicRemapMin", Float) = 0.0
        _MetallicRemapMax("MetallicRemapMax", Float) = 1.0
        _SmoothnessRemapMin("SmoothnessRemapMin", Float) = 0.0
        _SmoothnessRemapMax("SmoothnessRemapMax", Float) = 1.0
        _AlphaRemapMin("AlphaRemapMin", Float) = 0.0
        _AlphaRemapMax("AlphaRemapMax", Float) = 1.0
        _AORemapMin("AORemapMin", Float) = 0.0
        _AORemapMax("AORemapMax", Float) = 1.0

        _NormalMap("NormalMap", 2D) = "bump" {}     
        _NormalMapOS("NormalMapOS", 2D) = "white" {} 
        _NormalScale("_NormalScale", Range(0.0, 8.0)) = 1

        _BentNormalMap("_BentNormalMap", 2D) = "bump" {}
        _BentNormalMapOS("_BentNormalMapOS", 2D) = "white" {}

        _HeightMap("HeightMap", 2D) = "black" {}
        [HideInInspector] _HeightAmplitude("Height Amplitude", Float) = 0.02 
        [HideInInspector] _HeightCenter("Height Center", Range(0.0, 1.0)) = 0.5 

        [Enum(MinMax, 0, Amplitude, 1)] _HeightMapParametrization("Heightmap Parametrization", Int) = 0
        _HeightOffset("Height Offset", Float) = 0
        _HeightMin("Heightmap Min", Float) = -1
        _HeightMax("Heightmap Max", Float) = 1
        _HeightTessAmplitude("Amplitude", Float) = 2.0 
        _HeightTessCenter("Height Center", Range(0.0, 1.0)) = 0.5 
        _HeightPoMAmplitude("Height Amplitude", Float) = 2.0 

        _DetailMap("DetailMap", 2D) = "linearGrey" {}
        _DetailAlbedoScale("_DetailAlbedoScale", Range(0.0, 2.0)) = 1
        _DetailNormalScale("_DetailNormalScale", Range(0.0, 2.0)) = 1
        _DetailSmoothnessScale("_DetailSmoothnessScale", Range(0.0, 2.0)) = 1

        _TangentMap("TangentMap", 2D) = "bump" {}
        _TangentMapOS("TangentMapOS", 2D) = "white" {}
        _Anisotropy("Anisotropy", Range(-1.0, 1.0)) = 0
        _AnisotropyMap("AnisotropyMap", 2D) = "white" {}

        _SubsurfaceMask("Subsurface Radius", Range(0.0, 1.0)) = 1.0
        _SubsurfaceMaskMap("Subsurface Radius Map", 2D) = "white" {}
        _TransmissionMask("Transmission Mask", Range(0.0, 1.0)) = 1.0
        _TransmissionMaskMap("Transmission Mask Map", 2D) = "white" {}
        _Thickness("Thickness", Float) = 1.0
        _ThicknessMap("Thickness Map", 2D) = "white" {}
        _ThicknessRemap("Thickness Remap", Vector) = (0, 1, 0, 0)

        _IridescenceThickness("Iridescence Thickness", Range(0.0, 1.0)) = 1.0
        _IridescenceThicknessMap("Iridescence Thickness Map", 2D) = "white" {}
        _IridescenceThicknessRemap("Iridescence Thickness Remap", Vector) = (0, 1, 0, 0)
        _IridescenceMask("Iridescence Mask", Range(0.0, 1.0)) = 1.0
        _IridescenceMaskMap("Iridescence Mask Map", 2D) = "white" {}

        _CoatMask("Coat Mask", Range(0.0, 1.0)) = 0.0
        _CoatMaskMap("CoatMaskMap", 2D) = "white" {}

        [ToggleUI] _EnergyConservingSpecularColor("_EnergyConservingSpecularColor", Float) = 1.0
        _SpecularColor("SpecularColor", Color) = (1, 1, 1, 1)
        _SpecularColorMap("SpecularColorMap", 2D) = "white" {}
        [Enum(Off, 0, From Ambient Occlusion, 1, From AO and Bent Normals, 2)]  _SpecularOcclusionMode("Specular Occlusion Mode", Int) = 1

        [HDR] _EmissiveColor("EmissiveColor", Color) = (0, 0, 0)
        [HideInInspector] _EmissiveColorLDR("EmissiveColor LDR", Color) = (0, 0, 0)
        _EmissiveColorMap("EmissiveColorMap", 2D) = "white" {}
        [ToggleUI] _AlbedoAffectEmissive("Albedo Affect Emissive", Float) = 0.0
        _EmissiveIntensityUnit("Emissive Mode", Int) = 0
        [ToggleUI] _UseEmissiveIntensity("Use Emissive Intensity", Int) = 0
        _EmissiveIntensity("Emissive Intensity", Float) = 1
        _EmissiveExposureWeight("Emissive Pre Exposure", Range(0.0, 1.0)) = 1.0
        _AlphaCutoff("Alpha Cutoff", Range(0.0, 1.0)) = 0.5
        _AlphaCutoffShadow("_AlphaCutoffShadow", Range(0.0, 1.0)) = 0.5
        _AlphaCutoffPrepass("_AlphaCutoffPrepass", Range(0.0, 1.0)) = 0.5
        _AlphaCutoffPostpass("_AlphaCutoffPostpass", Range(0.0, 1.0)) = 0.5
        _Ior("Index Of Refraction", Range(1.0, 2.5)) = 1.5
        _TransmittanceColor("Transmittance Color", Color) = (1.0, 1.0, 1.0)
        _TransmittanceColorMap("TransmittanceColorMap", 2D) = "white" {}
        _ATDistance("Transmittance Absorption Distance", Float) = 1.0
        [HideInInspector] _CullMode("__cullmode", Float) = 2.0
        [HideInInspector] _CullModeForward("__cullmodeForward", Float) = 2.0 
        [Enum(UnityEditor.Rendering.HighDefinition.TransparentCullMode)] _TransparentCullMode("_TransparentCullMode", Int) = 2 
        [Enum(OpaqueCullMode)] _OpaqueCullMode("_OpaqueCullMode", Int) = 2 
        [ToggleUI] _DoubleSidedEnable("Double sided enable", Float) = 0.0
        [Enum(Flip, 0, Mirror, 1, None, 2)] _DoubleSidedNormalMode("Double sided normal mode", Float) = 1
        [HideInInspector] _DoubleSidedConstants("_DoubleSidedConstants", Vector) = (1, 1, -1, 0)
        [Enum(Auto, 0, On, 1, Off, 2)] _DoubleSidedGIMode("Double sided GI mode", Float) = 0

        [Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Planar, 4, Triplanar, 5)] _UVBase("UV Set for base", Float) = 0
        [Enum(WorldSpace, 0, ObjectSpace, 1)] _ObjectSpaceUVMapping("Mapping space", Float) = 0.0
        _TexWorldScale("Scale to apply on world coordinate", Float) = 1.0
        [HideInInspector] _InvTilingScale("Inverse tiling scale = 2 / (abs(_BaseColorMap_ST.x) + abs(_BaseColorMap_ST.y))", Float) = 1
        [HideInInspector] _UVMappingMask("_UVMappingMask", Color) = (1, 0, 0, 0)
        [Enum(TangentSpace, 0, ObjectSpace, 1)] _NormalMapSpace("NormalMap space", Float) = 0
        [Enum(Subsurface Scattering, 0, Standard, 1, Anisotropy, 2, Iridescence, 3, Specular Color, 4, Translucent, 5)] _MaterialID("MaterialId", Int) = 1 
        [ToggleUI] _TransmissionEnable("_TransmissionEnable", Float) = 1.0

        _DisplacementMode("DisplacementMode", Int) = 0
        [ToggleUI] _DisplacementLockObjectScale("displacement lock object scale", Float) = 1.0
        [ToggleUI] _DisplacementLockTilingScale("displacement lock tiling scale", Float) = 1.0
        [ToggleUI] _EnableGeometricSpecularAA("EnableGeometricSpecularAA", Float) = 0.0
        _SpecularAAScreenSpaceVariance("SpecularAAScreenSpaceVariance", Range(0.0, 1.0)) = 0.1
        _SpecularAAThreshold("SpecularAAThreshold", Range(0.0, 1.0)) = 0.2

        _PPDMinSamples("Min sample for POM", Range(1.0, 64.0)) = 5
        _PPDMaxSamples("Max sample for POM", Range(1.0, 64.0)) = 15
        _PPDLodThreshold("Start lod to fade out the POM effect", Range(0.0, 16.0)) = 5
        _PPDPrimitiveLength("Primitive length for POM", Float) = 1
        _PPDPrimitiveWidth("Primitive width for POM", Float) = 1
        [HideInInspector] _InvPrimScale("Inverse primitive scale for non-planar POM", Vector) = (1, 1, 0, 0)

        [Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3)] _UVDetail("UV Set for detail", Float) = 0
        [HideInInspector] _UVDetailsMappingMask("_UVDetailsMappingMask", Color) = (1, 0, 0, 0)
        [ToggleUI] _LinkDetailsWithBase("LinkDetailsWithBase", Float) = 1.0

        [Enum(Use Emissive Color, 0, Use Emissive Mask, 1)] _EmissiveColorMode("Emissive color mode", Float) = 1
        [Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Planar, 4, Triplanar, 5, Same as Base, 6)] _UVEmissive("UV Set for emissive", Float) = 0
        [Enum(WorldSpace, 0, ObjectSpace, 1)] _ObjectSpaceUVMappingEmissive("Mapping space", Float) = 0.0
        _TexWorldScaleEmissive("Scale to apply on world coordinate", Float) = 1.0
        [HideInInspector] _UVMappingMaskEmissive("_UVMappingMaskEmissive", Color) = (1, 0, 0, 0)
        _EmissionColor("Color", Color) = (1, 1, 1)
        [HideInInspector] _MainTex("Albedo", 2D) = "white" {}
        [HideInInspector] _Color("Color", Color) = (1,1,1,1)
        [HideInInspector] _Cutoff("Alpha Cutoff", Range(0.0, 1.0)) = 0.5
        [HideInInspector] _DiffusionProfile("Obsolete, kept for migration purpose", Int) = 0
        [HideInInspector] _DiffusionProfileAsset("Diffusion Profile Asset", Vector) = (0, 0, 0, 0)
        [HideInInspector] _DiffusionProfileHash("Diffusion Profile Hash", Float) = 0
	_DissolveColor("Dissolve Color", Color) = (1,1,1,1)
	_DissolveColorSaturation("Dissolve Color Saturation", Range(0,1)) = 1.0
	_DissolveEmission("Dissolve Emission", Range(0,1)) = 1.0
	[AbsoluteValue()] _DissolveEmissionBooster("Dissolve Emission Booster", float) = 1
	_DissolveTex("Dissolve Effect Texture", 2D) = "white" {}

	_DissolveMethod ("Dissolve Method", Float) = 0
	_DissolveTexSpace ("Dissolve Tex Space", Float) = 0
    [MaterialToggle] _CrossSectionEnabled("Cross-Section Enabled", float) = 0.0
    _CrossSectionColor("Cross-Section Color", Color) = (1,0,0,1)

    [MaterialToggle] _CrossSectionTextureEnabled("Cross-Section Texture Enabled", float) = 0.0
    _CrossSectionTexture("Cross-Section Texture", 2D) = "white" {}
    _CrossSectionTextureScale ("Cross-Section Texture Scale", Float) = 1.0
    [MaterialToggle] _CrossSectionUVScaledByDistance("Scale UV by Camera Distance", Float) = 1.0
	[Enum(STSInteractionMode)] _InteractionMode ("Interaction Mode", Float) = 0
	[Enum(ObstructionMode)] _Obstruction ("Obstruction Mode", Float) = 0
	_AngleStrength("Angle Obstruction Strength", Range(0,1)) = 1.0
	_ConeStrength ("Cone Obstruction Strength", Range(0,1)) = 1.0
	_ConeObstructionDestroyRadius ("Cone Obstruction Destroy Radius", float) = 10.0
	_CylinderStrength ("Cylinder Obstruction Strength", Range(0,1)) = 1.0
	_CylinderObstructionDestroyRadius ("Cylinder Obstruction Destroy Radius", float) = 10.0

	_CircleStrength ("Circle Obstruction Strength", Range(0,1)) = 1.0
	_CircleObstructionDestroyRadius ("Circle Obstruction Destroy Radius", float) = 10.0

	_CurveStrength ("Curve Obstruction Strength", Range(0,1)) = 1.0
	_CurveObstructionDestroyRadius ("Curve Obstruction Destroy Radius", float) = 10.0
	[HideInInspector] _ObstructionCurve("Obstruction Curve", 2D) = "white" {}

	_DissolveFallOff("Dissolve FallOff", Range(0,1)) = 0.0

	_DissolveMask("Dissolve Mask", 2D) = "white" {}
	_DissolveMaskEnabled("Use DissolveMask", float) = 0.0

    _AffectedAreaPlayerBasedObstruction("_AffectedAreaPlayerBasedObstruction",  float) = 0.0

	_IntrinsicDissolveStrength("Intrinsic Dissolve Strength", Range(0,1)) = 0.0

	[MaterialToggle] _PreviewMode("Preview Mode", float) = 0.0
	_PreviewIndicatorLineThickness("Indicator Line Thickness",  Range(0.01,0.5)) = 0.04        

	[AbsoluteValue()] _UVs ("Dissolve Texture Scale", float) = 1.0
	[MaterialToggle] _hasClippedShadows("Has Clipped Shadows", Float) = 0
	[MaterialToggle] _Floor ("Floor", float) = 0.0
	[Enum(FloorMode)] _FloorMode ("Floor Mode", Float) = 0
	_FloorY ("FloorY",  float) = 1.0
	_PlayerPosYOffset ("PlayerPos Y Offset", float) = 1.0  
    _AffectedAreaFloor("_AffectedAreaFloor",  float) = 0.0

	[AbsoluteValue()] _FloorYTextureGradientLength ("FloorY Texture Gradient Length", float) = 0.1  

	[MaterialToggle] _AnimationEnabled("Animation Enabled", Float) = 1
	_AnimationSpeed("Animation Speed", Range(0,2)) = 1

	[MaterialToggle] _IsReplacementShader ("hidden: _IsReplacementShader", Float) = 0

	[HideInInspector] _RaycastMode ("hidden: _RaycastMode", Float) = 0
	[HideInInspector] _TriggerMode ("hidden: _TriggerMode", Float) = 0

	[HideInInspector] _IsExempt ("_IsExempt", Float) = 0

	[AbsoluteValue()] _TransitionDuration ("Transition Duration In Seconds", Float) = 2

	[AbsoluteValue()] _DefaultEffectRadius ("Default Effect Radius",Float) = 25    
    [MaterialToggle] _EnableDefaultEffectRadius("Enable Default Effect Radius", float) = 0.0

	[HideInInspector] _numOfPlayersInside ("hidden: _numOfPlayersInside", Float) = 0
	[HideInInspector] _tValue ("hidden: _tValue", Float) = 0
	[HideInInspector] _tDirection ("hidden: _tDirection", Float) = 0
	[HideInInspector] _id ("hidden: _id", Float) = 0

	[MaterialToggle] _TexturedEmissionEdge("Textured Emission Edge", float) = 1.0
	_TexturedEmissionEdgeStrength("Textured Emission Edge Strength", Range(0,1)) = 0.3

	[MaterialToggle] _IsometricExclusion("Isometric Exclusion", float) = 0.0
	_IsometricExclusionDistance("Isometric Exclusion Distance", float) = 0.0
	_IsometricExclusionGradientLength("Isometric Exclusion Gradient Length", float) = 0.1

	[MaterialToggle] _Ceiling ("Ceiling", float) = 0.0

	[Enum(CeilingMode)] _CeilingMode ("Ceiling Mode", Float) = 0
	[Enum(CeilingBlendMode)] _CeilingBlendMode ("Blending Mode", Float) = 1.0
	_CeilingY ("CeilingY",  float) = 1.0
	_CeilingPlayerYOffset ("PlayerPos Y Offset", float) = 1.0  
	_CeilingYGradientLength ("CeilingY Gradient Length", float) = 0.1

	[MaterialToggle] _Zoning("Zoning", float) = 0.0
	[Enum(ZoningMode)] _ZoningMode("Zoning Mode", Float) = 0.0
	_ZoningEdgeGradientLength ("Edge Gradient Length", float) = 0.1
	[MaterialToggle] _IsZoningRevealable ("Is Zoning Revealable", float) = 0.0
	[MaterialToggle] _SyncZonesWithFloorY ("Sync Zones With FloorY", float) = 0.0
	_SyncZonesFloorYOffset ("Sync Zones Floor YOffset", float) = 0.0

    [MaterialToggle] _UseCustomTime ("_UseCustomTime", float) = 0.0
	[MaterialToggle] _isReferenceMaterial("Is Reference Material", float) = 0.0
    [HideInInspector] _ShowContentDissolveArea ("hidden: _ShowContentDissolveArea", Float) = 1
    [HideInInspector] _ShowContentInteractionOptionsArea ("hidden: _ShowContentInteractionOptionsArea", Float) = 1
    [HideInInspector] _ShowContentObstructionOptionsArea ("hidden: _ShowContentObstructionOptionsArea", Float) = 1
    [HideInInspector] _ShowContentAnimationArea ("hidden: _ShowContentAnimationArea", Float) = 1
    [HideInInspector] _ShowContentZoningArea ("hidden: _ShowContentZoningArea", Float) = 1
    [HideInInspector] _ShowContentReplacementOptionsArea ("hidden: _ShowContentReplacementOptionsArea", Float) = 1
    [HideInInspector] _ShowContentDebugArea ("hidden: _ShowContentDebugArea", Float) = 1
    [MaterialToggle] _SyncCullMode ("_SyncCullMode", Float) = 0
      [HideInInspector]_RenderQueueType("Float", Float) = 1
      [HideInInspector][ToggleUI]_AddPrecomputedVelocity("Boolean", Float) = 0
      [HideInInspector][ToggleUI]_DepthOffsetEnable("Boolean", Float) = 0
      [HideInInspector][ToggleUI]_TransparentWritingMotionVec("Boolean", Float) = 0
      [HideInInspector][ToggleUI]_AlphaCutoffEnable("Boolean", Float) = 0
      [HideInInspector]_TransparentSortPriority("_TransparentSortPriority", Float) = 0
      [HideInInspector][ToggleUI]_UseShadowThreshold("Boolean", Float) = 0
      [HideInInspector][ToggleUI]_TransparentDepthPrepassEnable("Boolean", Float) = 0
      [HideInInspector][ToggleUI]_TransparentDepthPostpassEnable("Boolean", Float) = 0
      [HideInInspector]_SurfaceType("Float", Float) = 0
      [HideInInspector]_BlendMode("Float", Float) = 0
      [HideInInspector]_SrcBlend("Float", Float) = 1
      [HideInInspector]_DstBlend("Float", Float) = 0
      [HideInInspector]_AlphaSrcBlend("Float", Float) = 1
      [HideInInspector]_AlphaDstBlend("Float", Float) = 0
      [HideInInspector][ToggleUI]_AlphaToMask("Boolean", Float) = 0
      [HideInInspector][ToggleUI]_AlphaToMaskInspectorValue("Boolean", Float) = 0
      [HideInInspector][ToggleUI]_ZWrite("Boolean", Float) = 1
      [HideInInspector][ToggleUI]_TransparentZWrite("Boolean", Float) = 0
      [HideInInspector][ToggleUI]_EnableFogOnTransparent("Boolean", Float) = 1
      [HideInInspector]_ZTestDepthEqualForOpaque("Float", Int) = 4
      [HideInInspector][Enum(UnityEngine.Rendering.CompareFunction)]_ZTestTransparent("Float", Float) = 4
      [HideInInspector][ToggleUI]_TransparentBackfaceEnable("Boolean", Float) = 0
      [HideInInspector][ToggleUI]_RequireSplitLighting("Boolean", Float) = 0
      [HideInInspector][ToggleUI]_ReceivesSSR("Boolean", Float) = 1
      [HideInInspector][ToggleUI]_ReceivesSSRTransparent("Boolean", Float) = 0
      [HideInInspector][ToggleUI]_EnableBlendModePreserveSpecularLighting("Boolean", Float) = 1
      [HideInInspector][ToggleUI]_SupportDecals("Boolean", Float) = 1
      [HideInInspector]_StencilRef("Float", Int) = 0
      [HideInInspector]_StencilWriteMask("Float", Int) = 6
      [HideInInspector]_StencilRefDepth("Float", Int) = 8
      [HideInInspector]_StencilWriteMaskDepth("Float", Int) = 8
      [HideInInspector]_StencilRefMV("Float", Int) = 40
      [HideInInspector]_StencilWriteMaskMV("Float", Int) = 40
      [HideInInspector]_StencilRefDistortionVec("Float", Int) = 4
      [HideInInspector]_StencilWriteMaskDistortionVec("Float", Int) = 4
      [HideInInspector]_StencilWriteMaskGBuffer("Float", Int) = 14
      [HideInInspector]_StencilRefGBuffer("Float", Int) = 10
      [HideInInspector]_ZTestGBuffer("Float", Int) = 4
      [HideInInspector][ToggleUI]_RayTracing("Boolean", Float) = 0
      [HideInInspector][Enum(None, 0, Box, 1, Sphere, 2, Thin, 3)]_RefractionModel("Float", Float) = 0
      [HideInInspector][NoScaleOffset]unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
      [HideInInspector][NoScaleOffset]unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
      [HideInInspector][NoScaleOffset]unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}
   }
   SubShader
   {
      Tags { "RenderPipeline" = "HDRenderPipeline" "RenderType" = "HDLitShader" "Queue" = "Geometry+225" }
              Pass
        {
            Name "Forward"
            Tags { "LightMode" = "Forward" }
            Stencil
            {
               WriteMask [_StencilWriteMask]
               Ref [_StencilRef]
               CompFront Always
               PassFront Replace
               CompBack Always
               PassBack Replace
            }
            ColorMask [_ColorMaskTransparentVel] 1

                Cull [_CullMode]
            HLSLPROGRAM
            #pragma target 4.5
            #pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
            #pragma multi_compile_instancing
            #pragma multi_compile _ DOTS_INSTANCING_ON
            #pragma instancing_options renderinglayer
            #pragma multi_compile _ DEBUG_DISPLAY
            #pragma multi_compile _ LIGHTMAP_ON
            #pragma multi_compile _ DIRLIGHTMAP_COMBINED
            #pragma multi_compile_fragment PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
            #pragma multi_compile_raytracing PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
            #pragma multi_compile _ DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fragment _ SHADOWS_SHADOWMASK
            #pragma multi_compile_raytracing _ SHADOWS_SHADOWMASK
            #pragma multi_compile_fragment DECALS_OFF DECALS_3RT DECALS_4RT
            #pragma multi_compile_fragment _ DECAL_SURFACE_GRADIENT
            #pragma multi_compile_fragment SHADOW_LOW SHADOW_MEDIUM SHADOW_HIGH SHADOW_VERY_HIGH
            #pragma multi_compile_fragment SCREEN_SPACE_SHADOWS_OFF SCREEN_SPACE_SHADOWS_ON
            #pragma multi_compile_fragment USE_FPTL_LIGHTLIST USE_CLUSTERED_LIGHTLIST
            #define _ENABLE_FOG_ON_TRANSPARENT 1
            #define SHADERPASS SHADERPASS_FORWARD
            #define SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
            #define HAS_LIGHTLOOP
            #define RAYTRACING_SHADER_GRAPH_DEFAULT
            #define _PASSFORWARD 1
    #pragma shader_feature_local _ALPHATEST_ON

    #pragma shader_feature_local_fragment _NORMALMAP_TANGENT_SPACE
    #pragma shader_feature_local _NORMALMAP
    #pragma shader_feature_local_fragment _MASKMAP
    #pragma shader_feature_local_fragment _EMISSIVE_COLOR_MAP
    #pragma shader_feature_local_fragment _ANISOTROPYMAP
    #pragma shader_feature_local_fragment _DETAIL_MAP
    #pragma shader_feature_local_fragment _SUBSURFACE_MASK_MAP
    #pragma shader_feature_local_fragment _THICKNESSMAP
    #pragma shader_feature_local_fragment _IRIDESCENCE_THICKNESSMAP
    #pragma shader_feature_local_fragment _SPECULARCOLORMAP
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_TRANSMISSION
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_ANISOTROPY
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_CLEAR_COAT
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_IRIDESCENCE
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_SPECULAR_COLOR
    #pragma shader_feature_local_fragment _ENABLESPECULAROCCLUSION
    #pragma shader_feature_local_fragment _ _SPECULAR_OCCLUSION_NONE _SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP

    #ifdef _ENABLESPECULAROCCLUSION
        #define _SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP
    #endif
        #pragma shader_feature_local_fragment _OBSTRUCTION_CURVE
        #pragma shader_feature_local_fragment _DISSOLVEMASK
        #pragma shader_feature_local_fragment _ZONING
        #pragma shader_feature_local_fragment _REPLACEMENT
        #pragma shader_feature_local_fragment _PLAYERINDEPENDENT
   #define _HDRP 1
#define _USINGTEXCOORD1 1
#define _USINGTEXCOORD2 1
#define NEED_FACING 1

               #pragma vertex Vert
   #pragma fragment Frag
      #define UNITY_DECLARE_TEX2D(name) TEXTURE2D(name); SAMPLER(sampler##name);
      #define UNITY_DECLARE_TEX2D_NOSAMPLER(name) TEXTURE2D(name);
      #define UNITY_DECLARE_TEX2DARRAY(name) TEXTURE2D_ARRAY(name); SAMPLER(sampler##name);
      #define UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(tex) TEXTURE2D_ARRAY(tex);

      #define UNITY_SAMPLE_TEX2DARRAY(tex,coord)            SAMPLE_TEXTURE2D_ARRAY(tex, sampler##tex, coord.xy, coord.z)
      #define UNITY_SAMPLE_TEX2DARRAY_LOD(tex,coord,lod)    SAMPLE_TEXTURE2D_ARRAY_LOD(tex, sampler##tex, coord.xy, coord.z, lod)
      #define UNITY_SAMPLE_TEX2D(tex, coord)                SAMPLE_TEXTURE2D(tex, sampler##tex, coord)
      #define UNITY_SAMPLE_TEX2D_SAMPLER(tex, samp, coord)  SAMPLE_TEXTURE2D(tex, sampler##samp, coord)

      #define UNITY_SAMPLE_TEX2D_LOD(tex,coord, lod)   SAMPLE_TEXTURE2D_LOD(tex, sampler_##tex, coord, lod)
      #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord, lod) SAMPLE_TEXTURE2D_LOD (tex, sampler##samplertex,coord, lod)

      #if defined(UNITY_COMPILER_HLSL)
         #define UNITY_INITIALIZE_OUTPUT(type,name) name = (type)0;
      #else
         #define UNITY_INITIALIZE_OUTPUT(type,name)
      #endif

      #define sampler2D_float sampler2D
      #define sampler2D_half sampler2D

      #undef WorldNormalVector
      #define WorldNormalVector(data, normal) mul(normal, data.TBNMatrix)

      #define UnityObjectToWorldNormal(normal) mul(GetObjectToWorldMatrix(), normal)
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
#if UNITY_VERSION >= UNITY_2021_3_31
       #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl" 
#else
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" 
#endif    
            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT 
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
            #define RAYTRACING_SHADER_GRAPH_LOW
            #endif
            #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
               #define OUTPUT_SPLIT_LIGHTING
            #endif

            #define HAVE_RECURSIVE_RENDERING

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
               #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                  #define WRITE_NORMAL_BUFFER
               #endif
            #endif

            #ifndef DEBUG_DISPLAY
               #if !defined(_SURFACE_TYPE_TRANSPARENT) && defined(_ALPHATEST)
                  #if SHADERPASS == SHADERPASS_FORWARD
                  #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                  #elif SHADERPASS == SHADERPASS_GBUFFER
                  #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                  #endif
               #endif
            #endif
            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
               #define _DEFERRED_CAPABLE_MATERIAL
            #endif
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
               #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
            CBUFFER_START(UnityPerMaterial)
               float _UseShadowThreshold;
               float _BlendMode;
               float _EnableBlendModePreserveSpecularLighting;
               float _RayTracing;
               float _RefractionModel;
    float4 _BaseColorMap_ST;
    float4 _DetailMap_ST;
    float4 _EmissiveColorMap_ST;

    float _UVBase;
    half4 _Color;
    half4 _BaseColor; 
    half _Cutoff; 
    half _Mode;
    float _CullMode;
    float _CullModeForward;
    half _Metallic;
    half3 _EmissionColor;
    half _UVSec;

    float3 _EmissiveColor;
    float _AlbedoAffectEmissive;
    float _EmissiveExposureWeight;
    float _MetallicRemapMin;
    float _MetallicRemapMax;
    float _Smoothness;
    float _SmoothnessRemapMin;
    float _SmoothnessRemapMax;
    float _AlphaRemapMin;
    float _AlphaRemapMax;
    float _AORemapMin;
    float _AORemapMax;
    float _NormalScale;
    float _DetailAlbedoScale;
    float _DetailNormalScale;
    float _DetailSmoothnessScale;
    float _Anisotropy;
    float _DiffusionProfileHash;
    float _SubsurfaceMask;
    float _Thickness;
    float4 _ThicknessRemap;
    float _IridescenceThickness;
    float4 _IridescenceThicknessRemap;
    float _IridescenceMask;
    float _CoatMask;
    float4 _SpecularColor;
    float _EnergyConservingSpecularColor;
    int _MaterialID;

    float _LinkDetailsWithBase;
    float4 _UVMappingMask;
    float4 _UVDetailsMappingMask;

    float4 _UVMappingMaskEmissive;

    float _AlphaCutoff;
    float _SyncCullMode;

    float _IsReplacementShader;
    float _TriggerMode;
    float _RaycastMode;
    float _IsExempt;
    float _isReferenceMaterial;
    float _InteractionMode;

    float _tDirection = 0;
    float _numOfPlayersInside = 0;
    float _tValue = 0;
    float _id = 0;
    half _TextureVisibility;
    half _AngleStrength;
    float _Obstruction;
    float _UVs;
    float4 _ObstructionCurve_TexelSize;      
    float _DissolveMaskEnabled;
    float4 _DissolveMask_TexelSize;
    float4 _DissolveTex_TexelSize;
    half4 _DissolveColor;
    float _DissolveColorSaturation;
    float _DissolveEmission;
    float _DissolveEmissionBooster;
    float _hasClippedShadows;
    float _ConeStrength;
    float _ConeObstructionDestroyRadius;
    float _CylinderStrength;
    float _CylinderObstructionDestroyRadius;
    float _CircleStrength;
    float _CircleObstructionDestroyRadius;
    float _CurveStrength;
    float _CurveObstructionDestroyRadius;
    float _IntrinsicDissolveStrength;
    float _DissolveFallOff;
    float _AffectedAreaPlayerBasedObstruction;
    float _PreviewMode;
    float _PreviewIndicatorLineThickness;
    float _AnimationEnabled;
    float _AnimationSpeed;
    float _DefaultEffectRadius;
    float _EnableDefaultEffectRadius;
    float _TransitionDuration;
    float _TexturedEmissionEdge;
    float _TexturedEmissionEdgeStrength;
    float _IsometricExclusion;
    float _IsometricExclusionDistance;
    float _IsometricExclusionGradientLength;
    float _Floor;
    float _FloorMode;
    float _FloorY;
    float _FloorYTextureGradientLength;
    float _PlayerPosYOffset;
    float _AffectedAreaFloor;
    float _Ceiling;
    float _CeilingMode;
    float _CeilingBlendMode;
    float _CeilingY;
    float _CeilingPlayerYOffset;
    float _CeilingYGradientLength;
    float _Zoning;
    float _ZoningMode;
    float _ZoningEdgeGradientLength;
    float _IsZoningRevealable;
    float _SyncZonesWithFloorY;
    float _SyncZonesFloorYOffset;

    half _UseCustomTime;

    half _CrossSectionEnabled;
    half4 _CrossSectionColor;
    half _CrossSectionTextureEnabled;
    float _CrossSectionTextureScale;
    half _CrossSectionUVScaledByDistance;
    half _DissolveMethod;
    half _DissolveTexSpace;
            CBUFFER_END
               #ifdef SCENEPICKINGPASS
               float4 _SelectionID;
               #endif
               #ifdef SCENESELECTIONPASS
               int _ObjectId;
               int _PassValue;
               #endif
            struct VertexToPixel
            {
               float4 pos : SV_POSITION;
               float3 worldPos : TEXCOORD0;
               float3 worldNormal : TEXCOORD1;
               float4 worldTangent : TEXCOORD2;
               float4 texcoord0 : TEXCOORD3;
               float4 texcoord1 : TEXCOORD4;
               float4 texcoord2 : TEXCOORD5;
                float4 texcoord3 : TEXCOORD6;
                float4 screenPos : TEXCOORD7;
               #if UNITY_ANY_INSTANCING_ENABLED
                  UNITY_VERTEX_INPUT_INSTANCE_ID
               #endif 

               #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
                  float4 previousPositionCS : TEXCOORD16; 
                  float4 motionVectorCS : TEXCOORD17;
               #endif

               UNITY_VERTEX_OUTPUT_STEREO
            }; 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Lighting.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoopDef.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoop.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
            struct Surface
            {
               half3 Albedo;
               half Height;
               half3 Normal;
               half Smoothness;
               half3 Emission;
               half Metallic;
               half3 Specular;
               half Occlusion;
               half SpecularPower; 
               half Alpha;
               float outputDepth; 
               half SpecularOcclusion;
               half SubsurfaceMask;
               half Thickness;
               half CoatMask;
               half CoatSmoothness;
               half Anisotropy;
               half IridescenceMask;
               half IridescenceThickness;
               int DiffusionProfileHash;
               float SpecularAAThreshold;
               float SpecularAAScreenSpaceVariance;
               float3 DiffuseGI;
               float3 BackDiffuseGI;
               float3 SpecularGI;
               float ior;
               float3 transmittanceColor;
               float atDistance;
               float transmittanceMask;
               float4 ShadowMask;
               float NormalAlpha;
               float MAOSAlpha;
            };
            struct Blackboard
            {
                float blackboardDummyData;
            };
            struct ShaderData
            {
               float4 clipPos; 
               float3 localSpacePosition;
               float3 localSpaceNormal;
               float3 localSpaceTangent;
               float3 worldSpacePosition;
               float3 worldSpaceNormal;
               float3 worldSpaceTangent;
               float tangentSign;

               float3 worldSpaceViewDir;
               float3 tangentSpaceViewDir;

               float4 texcoord0;
               float4 texcoord1;
               float4 texcoord2;
               float4 texcoord3;

               float2 screenUV;
               float4 screenPos;

               float4 vertexColor;
               bool isFrontFace;

               float4 extraV2F0;
               float4 extraV2F1;
               float4 extraV2F2;
               float4 extraV2F3;
               float4 extraV2F4;
               float4 extraV2F5;
               float4 extraV2F6;
               float4 extraV2F7;

               float3x3 TBNMatrix;
               Blackboard blackboard;
            };

            struct VertexData
            {
               #if SHADER_TARGET > 30
               #endif
               float4 vertex : POSITION;
               float3 normal : NORMAL;
               float4 tangent : TANGENT;
               float4 texcoord0 : TEXCOORD0;
               #if _URP && (_USINGTEXCOORD1 || _PASSMETA || _PASSFORWARD || _PASSGBUFFER)
                  float4 texcoord1 : TEXCOORD1;
               #endif

               #if _URP && (_USINGTEXCOORD2 || _PASSMETA || ((_PASSFORWARD || _PASSGBUFFER) && defined(DYNAMICLIGHTMAP_ON)))
                  float4 texcoord2 : TEXCOORD2;
               #endif

               #if _STANDARD && (_USINGTEXCOORD1 || (_PASSMETA || ((_PASSFORWARD || _PASSGBUFFER || _PASSFORWARDADD) && LIGHTMAP_ON)))
                  float4 texcoord1 : TEXCOORD1;
               #endif
               #if _STANDARD && (_USINGTEXCOORD2 || (_PASSMETA || ((_PASSFORWARD || _PASSGBUFFER) && DYNAMICLIGHTMAP_ON)))
                  float4 texcoord2 : TEXCOORD2;
               #endif
               #if _HDRP
                  float4 texcoord1 : TEXCOORD1;
                  float4 texcoord2 : TEXCOORD2;
               #endif
                float4 texcoord3 : TEXCOORD3;
               #if _PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR))
                  float3 previousPositionOS : TEXCOORD4; 
                  #if defined (_ADD_PRECOMPUTED_VELOCITY)
                     float3 precomputedVelocity    : TEXCOORD5; 
                  #endif
               #endif

               UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct TessVertex 
            {
               float4 vertex : INTERNALTESSPOS;
               float3 normal : NORMAL;
               float4 tangent : TANGENT;
               float4 texcoord0 : TEXCOORD0;
               float4 texcoord1 : TEXCOORD1;
               float4 texcoord2 : TEXCOORD2;
                float4 texcoord3 : TEXCOORD3;
               #if _PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR))
                  float3 previousPositionOS : TEXCOORD13; 
                  #if defined (_ADD_PRECOMPUTED_VELOCITY)
                     float3 precomputedVelocity : TEXCOORD14;
                  #endif
               #endif

               UNITY_VERTEX_INPUT_INSTANCE_ID
               UNITY_VERTEX_OUTPUT_STEREO
            };

            struct ExtraV2F
            {
               float4 extraV2F0;
               float4 extraV2F1;
               float4 extraV2F2;
               float4 extraV2F3;
               float4 extraV2F4;
               float4 extraV2F5;
               float4 extraV2F6;
               float4 extraV2F7;
               Blackboard blackboard;
               float4 time;
            };
            float3 WorldToTangentSpace(ShaderData d, float3 normal)
            {
               return mul(d.TBNMatrix, normal);
            }

            float3 TangentToWorldSpace(ShaderData d, float3 normal)
            {
               return mul(normal, d.TBNMatrix);
            }
            #if _STANDARD
               float3 TransformWorldToObject(float3 p) { return mul(unity_WorldToObject, float4(p, 1)); };
               float3 TransformObjectToWorld(float3 p) { return mul(unity_ObjectToWorld, float4(p, 1)); };
               float4 TransformWorldToObject(float4 p) { return mul(unity_WorldToObject, p); };
               float4 TransformObjectToWorld(float4 p) { return mul(unity_ObjectToWorld, p); };
               float4x4 GetWorldToObjectMatrix() { return unity_WorldToObject; }
               float4x4 GetObjectToWorldMatrix() { return unity_ObjectToWorld; }
               #if (defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (SHADER_TARGET_SURFACE_ANALYSIS && !SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))
                 #define UNITY_SAMPLE_TEX2D_LOD(tex,coord, lod) tex.SampleLevel (sampler##tex,coord, lod)
                 #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord, lod) tex.SampleLevel (sampler##samplertex,coord, lod)
              #else
                 #define UNITY_SAMPLE_TEX2D_LOD(tex,coord,lod) tex2D (tex,coord,0,lod)
                 #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord,lod) tex2D (tex,coord,0,lod)
              #endif

               #undef GetWorldToObjectMatrix()

               #define GetWorldToObjectMatrix()   unity_WorldToObject
            #endif

            float3 GetCameraWorldPosition()
            {
               #if _HDRP
                  return GetCameraRelativePositionWS(_WorldSpaceCameraPos);
               #else
                  return _WorldSpaceCameraPos;
               #endif
            }

            #if _GRABPASSUSED
               #if _STANDARD
                  TEXTURE2D(%GRABTEXTURE%);
                  SAMPLER(sampler_%GRABTEXTURE%);
               #endif

               half3 GetSceneColor(float2 uv)
               {
                  #if _STANDARD
                     return SAMPLE_TEXTURE2D(%GRABTEXTURE%, sampler_%GRABTEXTURE%, uv).rgb;
                  #else
                     return SHADERGRAPH_SAMPLE_SCENE_COLOR(uv);
                  #endif
               }
            #endif
            #if _STANDARD
               UNITY_DECLARE_DEPTH_TEXTURE(_CameraDepthTexture);
               float GetSceneDepth(float2 uv) { return SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, uv); }
               float GetLinear01Depth(float2 uv) { return Linear01Depth(GetSceneDepth(uv)); }
               float GetLinearEyeDepth(float2 uv) { return LinearEyeDepth(GetSceneDepth(uv)); } 
            #else
               float GetSceneDepth(float2 uv) { return SHADERGRAPH_SAMPLE_SCENE_DEPTH(uv); }
               float GetLinear01Depth(float2 uv) { return Linear01Depth(GetSceneDepth(uv), _ZBufferParams); }
               float GetLinearEyeDepth(float2 uv) { return LinearEyeDepth(GetSceneDepth(uv), _ZBufferParams); } 
            #endif

            float3 GetWorldPositionFromDepthBuffer(float2 uv, float3 worldSpaceViewDir)
            {
               float eye = GetLinearEyeDepth(uv);
               float3 camView = mul((float3x3)GetObjectToWorldMatrix(), transpose(mul(GetWorldToObjectMatrix(), UNITY_MATRIX_I_V)) [2].xyz);

               float dt = dot(worldSpaceViewDir, camView);
               float3 div = worldSpaceViewDir/dt;
               float3 wpos = (eye * div) + GetCameraWorldPosition();
               return wpos;
            }

            #if _HDRP
            float3 ObjectToWorldSpacePosition(float3 pos)
            {
               return GetAbsolutePositionWS(TransformObjectToWorld(pos));
            }
            #else
            float3 ObjectToWorldSpacePosition(float3 pos)
            {
               return TransformObjectToWorld(pos);
            }
            #endif

            #if _STANDARD
               UNITY_DECLARE_SCREENSPACE_TEXTURE(_CameraDepthNormalsTexture);
               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  float4 depthNorms = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_CameraDepthNormalsTexture, uv);
                  float3 norms = DecodeViewNormalStereo(depthNorms);
                  norms = mul((float3x3)GetWorldToViewMatrix(), norms) * 0.5 + 0.5;
                  return norms;
               }
            #elif _HDRP && !_DECALSHADER
               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  NormalData nd;
                  DecodeFromNormalBuffer(_ScreenSize.xy * uv, nd);
                  return nd.normalWS;
               }
            #elif _URP
               #if (SHADER_LIBRARY_VERSION_MAJOR >= 10)
                  #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareNormalsTexture.hlsl"
               #endif

               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  #if (SHADER_LIBRARY_VERSION_MAJOR >= 10)
                     return SampleSceneNormals(uv);
                  #else
                     float3 wpos = GetWorldPositionFromDepthBuffer(uv, worldSpaceViewDir);
                     return normalize(-cross(ddx(wpos), ddy(wpos))) * 0.5 + 0.5;
                  #endif

                }
             #endif

             #if _HDRP

               half3 UnpackNormalmapRGorAG(half4 packednormal)
               {
                  packednormal.x *= packednormal.w;

                  half3 normal;
                  normal.xy = packednormal.xy * 2 - 1;
                  normal.z = sqrt(1 - saturate(dot(normal.xy, normal.xy)));
                  return normal;
               }
               half3 UnpackNormal(half4 packednormal)
               {
                  #if defined(UNITY_NO_DXT5nm)
                     return packednormal.xyz * 2 - 1;
                  #else
                     return UnpackNormalmapRGorAG(packednormal);
                  #endif
               }
            #endif
            #if _HDRP || _URP

               half3 UnpackScaleNormal(half4 packednormal, half scale)
               {
                 #ifndef UNITY_NO_DXT5nm
                   packednormal.x *= packednormal.w;
                 #endif
                   half3 normal;
                   normal.xy = (packednormal.xy * 2 - 1) * scale;
                   normal.z = sqrt(1 - saturate(dot(normal.xy, normal.xy)));
                   return normal;
               }	

             #endif
            void GetSun(out float3 lightDir, out float3 color)
            {
               lightDir = float3(0.5, 0.5, 0);
               color = 1;
               #if _HDRP
                  if (_DirectionalLightCount > 0)
                  {
                     DirectionalLightData light = _DirectionalLightDatas[0];
                     lightDir = -light.forward.xyz;
                     color = light.color;
                  }
               #elif _STANDARD
			         lightDir = normalize(_WorldSpaceLightPos0.xyz);
                  color = _LightColor0.rgb;
               #elif _URP
	               Light light = GetMainLight();
	               lightDir = light.direction;
	               color = light.color;
               #endif
            }
    sampler2D _EmissiveColorMap;
    sampler2D _BaseColorMap;
    sampler2D _MaskMap;
    sampler2D _NormalMap;
    sampler2D _NormalMapOS;
    sampler2D _DetailMap;
    sampler2D _TangentMap;
    sampler2D _TangentMapOS;
    sampler2D _AnisotropyMap;
    sampler2D _SubsurfaceMaskMap;
    sampler2D _TransmissionMaskMap;
    sampler2D _ThicknessMap;
    sampler2D _IridescenceThicknessMap;
    sampler2D _IridescenceMaskMap;
    sampler2D _SpecularColorMap;

    sampler2D _CoatMaskMap;

    float3 DecodeNormal (float4 sample, float scale) {
        #if defined(UNITY_NO_DXT5nm)
            return UnpackNormalRGB(sample, scale);
        #else
            return UnpackNormalmapRGorAG(sample, scale);
        #endif
    }

	void Ext_SurfaceFunction0 (inout Surface o, ShaderData d)
	{
        float2 uvBase = (_UVMappingMask.x * d.texcoord0 +
                        _UVMappingMask.y * d.texcoord1 +
                        _UVMappingMask.z * d.texcoord2 +
                        _UVMappingMask.w * d.texcoord3).xy;

        float2 uvDetails =  (_UVDetailsMappingMask.x * d.texcoord0 +
                            _UVDetailsMappingMask.y * d.texcoord1 +
                            _UVDetailsMappingMask.z * d.texcoord2 +
                            _UVDetailsMappingMask.w * d.texcoord3).xy;
        float4 texcoords;
        texcoords.xy = uvBase * _BaseColorMap_ST.xy + _BaseColorMap_ST.zw; 

        texcoords.zw = uvDetails * _DetailMap_ST.xy + _DetailMap_ST.zw;

        if (_LinkDetailsWithBase > 0.0)
        {
            texcoords.zw = texcoords.zw  * _BaseColorMap_ST.xy + _BaseColorMap_ST.zw;

        }

            float3 detailNormalTS = float3(0.0, 0.0, 0.0);
            float detailMask = 0.0;
            #ifdef _DETAIL_MAP
                detailMask = 1.0;
                #ifdef _MASKMAP
                    detailMask = tex2D(_MaskMap, texcoords.xy).b;
                #endif
                float2 detailAlbedoAndSmoothness = tex2D(_DetailMap, texcoords.zw).rb;
                float detailAlbedo = detailAlbedoAndSmoothness.r * 2.0 - 1.0;
                float detailSmoothness = detailAlbedoAndSmoothness.g * 2.0 - 1.0;
                real4 packedNormal = tex2D(_DetailMap, texcoords.zw).rgba;
                detailNormalTS = UnpackNormalAG(packedNormal, _DetailNormalScale);
            #endif
            float4 color = tex2D(_BaseColorMap, texcoords.xy).rgba  * _Color.rgba;
            o.Albedo = color.rgb; 
            float alpha = color.a;
            alpha = lerp(_AlphaRemapMin, _AlphaRemapMax, alpha);
            o.Alpha = alpha;
            #ifdef _DETAIL_MAP
                float albedoDetailSpeed = saturate(abs(detailAlbedo) * _DetailAlbedoScale);
                float3 baseColorOverlay = lerp(sqrt(o.Albedo), (detailAlbedo < 0.0) ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0), albedoDetailSpeed * albedoDetailSpeed);
                baseColorOverlay *= baseColorOverlay;
                o.Albedo = lerp(o.Albedo, saturate(baseColorOverlay), detailMask);
            #endif

            #ifdef _NORMALMAP
                float3 normalTS;
                #ifdef _NORMALMAP_TANGENT_SPACE
                    normalTS = DecodeNormal(tex2D(_NormalMap, texcoords.xy), _NormalScale);
                #else
                    #ifdef SURFACE_GRADIENT
                        float3 normalOS = tex2D(_NormalMapOS, texcoords.xy).xyz * 2.0 - 1.0;
                        normalTS = SurfaceGradientFromPerturbedNormal(d.worldSpaceNormal, TransformObjectToWorldNormal(normalOS));
                    #else
                        float3 normalOS = UnpackNormalRGB(tex2D(_NormalMapOS, texcoords.xy), 1.0);
                        float3 bitangent = d.tangentSign * cross(d.worldSpaceNormal.xyz, d.worldSpaceTangent.xyz);
                        half3x3 tangentToWorld = half3x3(d.worldSpaceTangent.xyz, bitangent.xyz, d.worldSpaceNormal.xyz);
                        normalTS = TransformObjectToTangent(normalOS, tangentToWorld);
                    #endif
                #endif

                #ifdef _DETAIL_MAP
                    #ifdef SURFACE_GRADIENT
                    normalTS += detailNormalTS * detailMask;
                    #else
                    normalTS = lerp(normalTS, BlendNormalRNM(normalTS, normalize(detailNormalTS)), detailMask); 
                    #endif
                #endif
                o.Normal = normalTS;

            #endif

            #if defined(_MASKMAP)
                o.Smoothness = tex2D(_MaskMap, texcoords.xy).a;
                o.Smoothness = lerp(_SmoothnessRemapMin, _SmoothnessRemapMax, o.Smoothness);
            #else
                o.Smoothness = _Smoothness;
            #endif
            #ifdef _DETAIL_MAP
                float smoothnessDetailSpeed = saturate(abs(detailSmoothness) * _DetailSmoothnessScale);
                float smoothnessOverlay = lerp(o.Smoothness, (detailSmoothness < 0.0) ? 0.0 : 1.0, smoothnessDetailSpeed);
                o.Smoothness = lerp(o.Smoothness, saturate(smoothnessOverlay), detailMask);
            #endif
            #ifdef _MASKMAP
                o.Metallic = tex2D(_MaskMap, texcoords.xy).r;
                o.Metallic = lerp(_MetallicRemapMin, _MetallicRemapMax, o.Metallic);
                o.Occlusion = tex2D(_MaskMap, texcoords.xy).g;
                o.Occlusion = lerp(_AORemapMin, _AORemapMax, o.Occlusion);
            #else
                o.Metallic = _Metallic;
                o.Occlusion = 1.0;
            #endif

            #if defined(_SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP)
            #elif  defined(_MASKMAP) && !defined(_SPECULAR_OCCLUSION_NONE)
                float3 V = normalize(d.worldSpaceViewDir);
                o.SpecularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(d.worldSpaceNormal, V)), o.Occlusion, PerceptualSmoothnessToRoughness(o.Smoothness));
            #endif

            o.DiffusionProfileHash = asuint(_DiffusionProfileHash);
            o.SubsurfaceMask = _SubsurfaceMask;
            #ifdef _SUBSURFACE_MASK_MAP
                o.SubsurfaceMask *= tex2D(_SubsurfaceMaskMap, texcoords.xy).r;
            #endif
            #ifdef _THICKNESSMAP
                o.Thickness = tex2D(_ThicknessMap, texcoords.xy).r;
                o.Thickness = _ThicknessRemap.x + _ThicknessRemap.y * surfaceData.thickness;
            #else
                o.Thickness = _Thickness;
            #endif
            #ifdef _ANISOTROPYMAP
                o.Anisotropy = tex2D(_AnisotropyMap, texcoords.xy).r;
            #else
                o.Anisotropy = 1.0;
            #endif
                o.Anisotropy *= _Anisotropy;
                o.Specular = _SpecularColor.rgb;
            #ifdef _SPECULARCOLORMAP
                o.Specular *= tex2D(_SpecularColorMap, texcoords.xy).rgb;
            #endif
            #ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                o.Albedo *= _EnergyConservingSpecularColor > 0.0 ? (1.0 - Max3(o.Specular.r, o.Specular.g, o.Specular.b)) : 1.0;
            #endif
            #ifdef _MATERIAL_FEATURE_CLEAR_COAT
                o.CoatMask = _CoatMask;
                o.CoatMask *= tex2D(_CoatMaskMap, texcoords.xy).r;
            #else
                o.CoatMask = 0.0;
            #endif
            #ifdef _MATERIAL_FEATURE_IRIDESCENCE
                #ifdef _IRIDESCENCE_THICKNESSMAP
                o.IridescenceThickness = tex2D(_IridescenceThicknessMap, texcoords.xy).r;
                o.IridescenceThickness = _IridescenceThicknessRemap.x + _IridescenceThicknessRemap.y * o.IridescenceThickness;
                #else
                o.IridescenceThickness = _IridescenceThickness;
                #endif
                o.IridescenceMask = _IridescenceMask;
                o.IridescenceMask *= tex2D(_IridescenceMaskMap, texcoords.xy).r;
            #else
                o.IridescenceThickness = 0.0;
                o.IridescenceMask = 0.0;
            #endif
            float3 emissiveColor = _EmissiveColor * lerp(float3(1.0, 1.0, 1.0), o.Albedo.rgb, _AlbedoAffectEmissive);
            #ifdef _EMISSIVE_COLOR_MAP                
                float2 uvEmission = _UVMappingMaskEmissive.x * d.texcoord0 +
                                    _UVMappingMaskEmissive.y * d.texcoord1 +
                                    _UVMappingMaskEmissive.z * d.texcoord2 +
                                    _UVMappingMaskEmissive.w * d.texcoord3;

                uvEmission = uvEmission * _EmissiveColorMap_ST.xy + _EmissiveColorMap_ST.zw;                     

                emissiveColor *= tex2D(_EmissiveColorMap, uvEmission).rgb;
            #endif
            o.Emission += emissiveColor;
            float currentExposureMultiplier = 0;
            #if SHADEROPTIONS_PRE_EXPOSITION
                currentExposureMultiplier =  LOAD_TEXTURE2D(_ExposureTexture, int2(0, 0)).x * _ProbeExposureScale;
            #else
                currentExposureMultiplier =  _ProbeExposureScale;
            #endif
            float InverseCurrentExposureMultiplier = 0;
            float exposure = currentExposureMultiplier;
            InverseCurrentExposureMultiplier =  rcp(exposure + (exposure == 0.0)); 
            float3 emissiveRcpExposure = o.Emission * InverseCurrentExposureMultiplier;
            o.Emission = lerp(emissiveRcpExposure, o.Emission, _EmissiveExposureWeight);
            #if defined(_ALPHATEST_ON)
                float alphaTex = tex2D(_BaseColorMap, texcoords.xy).a;
                alphaTex = lerp(_AlphaRemapMin, _AlphaRemapMax, alphaTex);
                float alphaValue = alphaTex * _BaseColor.a;
                float alphaCutoff = _AlphaCutoff;
                clip(alpha - alphaCutoff);
            #endif

	}
    float _ArrayLength = 0;
    #if (defined(SHADER_API_GLES) || defined(SHADER_API_GLES3)) 
        float4 _PlayersPosVectorArray[20];
        float _PlayersDataFloatArray[150];     
    #else
        float4 _PlayersPosVectorArray[100];
        float _PlayersDataFloatArray[500];  
    #endif
    #if _ZONING
        #if (defined(SHADER_API_GLES) || defined(SHADER_API_GLES3)) 
            float _ZDFA[500];
        #else
            float _ZDFA[1000];
        #endif
        float _ZonesDataCount;
    #endif

    float _STSCustomTime = 0;
    #if _REPLACEMENT        
        half4 _DissolveColorGlobal;
        float _DissolveColorSaturationGlobal;
        float _DissolveEmissionGlobal;
        float _DissolveEmissionBoosterGlobal;
        float _TextureVisibilityGlobal;
        float _ObstructionGlobal;
        float _AngleStrengthGlobal;
        float _ConeStrengthGlobal;
        float _ConeObstructionDestroyRadiusGlobal;
        float _CylinderStrengthGlobal;
        float _CylinderObstructionDestroyRadiusGlobal;
        float _CircleStrengthGlobal;
        float _CircleObstructionDestroyRadiusGlobal;
        float _CurveStrengthGlobal;
        float _CurveObstructionDestroyRadiusGlobal;
        float _DissolveFallOffGlobal;
        float _AffectedAreaPlayerBasedObstructionGlobal;
        float _IntrinsicDissolveStrengthGlobal;
        float _PreviewModeGlobal;
        float _UVsGlobal;
        float _hasClippedShadowsGlobal;
        float _FloorGlobal;
        float _FloorModeGlobal;
        float _FloorYGlobal;
        float _PlayerPosYOffsetGlobal;
        float _FloorYTextureGradientLengthGlobal;
        float _AffectedAreaFloorGlobal;
        float _AnimationEnabledGlobal;
        float _AnimationSpeedGlobal;
        float _DefaultEffectRadiusGlobal;
        float _EnableDefaultEffectRadiusGlobal;
        float _TransitionDurationGlobal;        
        float _TexturedEmissionEdgeGlobal;
        float _TexturedEmissionEdgeStrengthGlobal;
        float _IsometricExclusionGlobal;
        float _IsometricExclusionDistanceGlobal;
        float _IsometricExclusionGradientLengthGlobal;
        float _CeilingGlobal;
        float _CeilingModeGlobal;
        float _CeilingBlendModeGlobal;
        float _CeilingYGlobal;
        float _CeilingPlayerYOffsetGlobal;
        float _CeilingYGradientLengthGlobal;
        float _ZoningGlobal;
        float _ZoningModeGlobal;
        float _ZoningEdgeGradientLengthGlobal;
        float _IsZoningRevealableGlobal;
        float _SyncZonesWithFloorYGlobal;
        float _SyncZonesFloorYOffsetGlobal;
        float4 _ObstructionCurveGlobal_TexelSize;
        float4 _DissolveMaskGlobal_TexelSize;
        float _DissolveMaskEnabledGlobal;
        float _PreviewIndicatorLineThicknessGlobal;
        half _UseCustomTimeGlobal;

        half _CrossSectionEnabledGlobal;
        half4 _CrossSectionColorGlobal;
        half _CrossSectionTextureEnabledGlobal;
        float _CrossSectionTextureScaleGlobal;
        half _CrossSectionUVScaledByDistanceGlobal;

        half _DissolveMethodGlobal;
        half _DissolveTexSpaceGlobal;

        float4 _DissolveTexGlobal_TexelSize;
    #endif
    #if _REPLACEMENT
        sampler2D _DissolveTexGlobal;
    #else
        sampler2D _DissolveTex;
    #endif
    #if _REPLACEMENT
        sampler2D _DissolveMaskGlobal;
    #else
        sampler2D _DissolveMask;
    #endif
    #if _REPLACEMENT
        sampler2D _ObstructionCurveGlobal;
    #else
        sampler2D _ObstructionCurve;
    #endif

    #if _REPLACEMENT
        sampler2D _CrossSectionTextureGlobal;
    #else
        sampler2D _CrossSectionTexture;
    #endif
#ifdef USE_UNITY_TEXTURE_2D_TYPE
#undef USE_UNITY_TEXTURE_2D_TYPE
#endif

#include "Packages/com.shadercrew.seethroughshader.core/Scripts/Shaders/xxSharedSTSDependencies/SeeThroughShaderFunction.hlsl"
	void Ext_SurfaceFunction1 (inout Surface o, ShaderData d)
	{
        half3 albedo;
        half3 emission;
        float alphaForClipping;
#ifdef USE_UNITY_TEXTURE_2D_TYPE
#undef USE_UNITY_TEXTURE_2D_TYPE
#endif
#if _REPLACEMENT
    DoSeeThroughShading( o.Albedo, o.Normal, d.worldSpacePosition, d.worldSpaceNormal, d.screenPos,
                        _numOfPlayersInside, _tDirection, _tValue, _id,
                        _TriggerMode, _RaycastMode,
                        _IsExempt,

                        _DissolveMethodGlobal, _DissolveTexSpaceGlobal,

                        _DissolveColorGlobal, _DissolveColorSaturationGlobal, _UVsGlobal,
                        _DissolveEmissionGlobal, _DissolveEmissionBoosterGlobal, _TexturedEmissionEdgeGlobal, _TexturedEmissionEdgeStrengthGlobal,
                        _hasClippedShadowsGlobal,

                        _ObstructionGlobal,
                        _AngleStrengthGlobal,
                        _ConeStrengthGlobal, _ConeObstructionDestroyRadiusGlobal,
                        _CylinderStrengthGlobal, _CylinderObstructionDestroyRadiusGlobal,
                        _CircleStrengthGlobal, _CircleObstructionDestroyRadiusGlobal,
                        _CurveStrengthGlobal, _CurveObstructionDestroyRadiusGlobal,
                        _DissolveFallOffGlobal,
                        _DissolveMaskEnabledGlobal,
                        _AffectedAreaPlayerBasedObstructionGlobal,
                        _IntrinsicDissolveStrengthGlobal,
                        _DefaultEffectRadiusGlobal, _EnableDefaultEffectRadiusGlobal,

                        _IsometricExclusionGlobal, _IsometricExclusionDistanceGlobal, _IsometricExclusionGradientLengthGlobal,
                        _CeilingGlobal, _CeilingModeGlobal, _CeilingBlendModeGlobal, _CeilingYGlobal, _CeilingPlayerYOffsetGlobal, _CeilingYGradientLengthGlobal,
                        _FloorGlobal, _FloorModeGlobal, _FloorYGlobal, _PlayerPosYOffsetGlobal, _FloorYTextureGradientLengthGlobal, _AffectedAreaFloorGlobal,

                        _AnimationEnabledGlobal, _AnimationSpeedGlobal,
                        _TransitionDurationGlobal,

                        _UseCustomTimeGlobal,

                        _ZoningGlobal, _ZoningModeGlobal, _IsZoningRevealableGlobal, _ZoningEdgeGradientLengthGlobal,
                        _SyncZonesWithFloorYGlobal, _SyncZonesFloorYOffsetGlobal,

                        _PreviewModeGlobal,
                        _PreviewIndicatorLineThicknessGlobal,

                        _DissolveTexGlobal,
                        _DissolveMaskGlobal,
                        _ObstructionCurveGlobal,

                        _DissolveTexGlobal_TexelSize,
                        _DissolveMaskGlobal_TexelSize,
                        _ObstructionCurveGlobal_TexelSize,

                        albedo, emission, alphaForClipping);
#else 
    DoSeeThroughShading( o.Albedo, o.Normal, d.worldSpacePosition, d.worldSpaceNormal, d.screenPos,

                        _numOfPlayersInside, _tDirection, _tValue, _id,
                        _TriggerMode, _RaycastMode,
                        _IsExempt,

                        _DissolveMethod, _DissolveTexSpace,

                        _DissolveColor, _DissolveColorSaturation, _UVs,
                        _DissolveEmission, _DissolveEmissionBooster, _TexturedEmissionEdge, _TexturedEmissionEdgeStrength,
                        _hasClippedShadows,

                        _Obstruction,
                        _AngleStrength,
                        _ConeStrength, _ConeObstructionDestroyRadius,
                        _CylinderStrength, _CylinderObstructionDestroyRadius,
                        _CircleStrength, _CircleObstructionDestroyRadius,
                        _CurveStrength, _CurveObstructionDestroyRadius,
                        _DissolveFallOff,
                        _DissolveMaskEnabled,
                        _AffectedAreaPlayerBasedObstruction,
                        _IntrinsicDissolveStrength,
                        _DefaultEffectRadius, _EnableDefaultEffectRadius,

                        _IsometricExclusion, _IsometricExclusionDistance, _IsometricExclusionGradientLength,
                        _Ceiling, _CeilingMode, _CeilingBlendMode, _CeilingY, _CeilingPlayerYOffset, _CeilingYGradientLength,
                        _Floor, _FloorMode, _FloorY, _PlayerPosYOffset, _FloorYTextureGradientLength, _AffectedAreaFloor,

                        _AnimationEnabled, _AnimationSpeed,
                        _TransitionDuration,

                        _UseCustomTime,

                        _Zoning, _ZoningMode , _IsZoningRevealable, _ZoningEdgeGradientLength,
                        _SyncZonesWithFloorY, _SyncZonesFloorYOffset,

                        _PreviewMode,
                        _PreviewIndicatorLineThickness,                            

                        _DissolveTex,
                        _DissolveMask,
                        _ObstructionCurve,

                        _DissolveTex_TexelSize,
                        _DissolveMask_TexelSize,
                        _ObstructionCurve_TexelSize,

                        albedo, emission, alphaForClipping);
#endif 
        o.Albedo = albedo;
        o.Emission += emission;   

	}
    void Ext_FinalColorForward1 (Surface o, ShaderData d, inout half4 color)
    {
        #if _REPLACEMENT   
            DoCrossSection(_CrossSectionEnabledGlobal,
                        _CrossSectionColorGlobal,
                        _CrossSectionTextureEnabledGlobal,
                        _CrossSectionTextureGlobal,
                        _CrossSectionTextureScaleGlobal,
                        _CrossSectionUVScaledByDistanceGlobal,
                        d.isFrontFace,
                        d.screenPos,
                        color);
        #else 
            DoCrossSection(_CrossSectionEnabled,
                        _CrossSectionColor,
                        _CrossSectionTextureEnabled,
                        _CrossSectionTexture,
                        _CrossSectionTextureScale,
                        _CrossSectionUVScaledByDistance,
                        d.isFrontFace,
                        d.screenPos,
                        color);
        #endif
    }
            void ChainSurfaceFunction(inout Surface l, inout ShaderData d)
            {
                  Ext_SurfaceFunction0(l, d);
                  Ext_SurfaceFunction1(l, d);
            }

#if !_DECALSHADER

            void ChainModifyVertex(inout VertexData v, inout VertexToPixel v2p, float4 time)
            {
                 ExtraV2F d;
                 ZERO_INITIALIZE(ExtraV2F, d);
                 ZERO_INITIALIZE(Blackboard, d.blackboard);
                 d.time = time;
            }

            void ChainModifyTessellatedVertex(inout VertexData v, inout VertexToPixel v2p)
            {
               ExtraV2F d;
               ZERO_INITIALIZE(ExtraV2F, d);
               ZERO_INITIALIZE(Blackboard, d.blackboard);
            }

            void ChainFinalColorForward(inout Surface l, inout ShaderData d, inout half4 color)
            {
                  Ext_FinalColorForward1(l, d, color);
            }

            void ChainFinalGBufferStandard(inout Surface s, inout ShaderData d, inout half4 GBuffer0, inout half4 GBuffer1, inout half4 GBuffer2, inout half4 outEmission, inout half4 outShadowMask)
            {
            }
#endif
#if _DECALSHADER

        ShaderData CreateShaderData(SurfaceDescriptionInputs IN)
        {
            ShaderData d = (ShaderData)0;
            d.TBNMatrix = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
            d.worldSpaceNormal = IN.WorldSpaceNormal;
            d.worldSpaceTangent = IN.WorldSpaceTangent;

            d.worldSpacePosition = IN.WorldSpacePosition;
            d.texcoord0 = IN.uv0.xyxy;
            d.screenPos = IN.ScreenPosition;

            d.worldSpaceViewDir = normalize(_WorldSpaceCameraPos - d.worldSpacePosition);

            d.tangentSpaceViewDir = mul(d.TBNMatrix, d.worldSpaceViewDir);
            #if _HDRP
            #else
            #endif
             d.screenUV = (IN.ScreenPosition.xy / max(0.01, IN.ScreenPosition.w));
            return d;
        }
#else

         ShaderData CreateShaderData(VertexToPixel i
                  #if NEED_FACING
                     , bool facing
                  #endif
         )
         {
            ShaderData d = (ShaderData)0;
            d.clipPos = i.pos;
            d.worldSpacePosition = i.worldPos;

            d.worldSpaceNormal = normalize(i.worldNormal);
            d.worldSpaceTangent.xyz = normalize(i.worldTangent.xyz);

            d.tangentSign = i.worldTangent.w * unity_WorldTransformParams.w;
            float3 bitangent = cross(d.worldSpaceTangent.xyz, d.worldSpaceNormal) * d.tangentSign;
            d.TBNMatrix = float3x3(d.worldSpaceTangent, -bitangent, d.worldSpaceNormal);
            d.worldSpaceViewDir = normalize(_WorldSpaceCameraPos - i.worldPos);

            d.tangentSpaceViewDir = mul(d.TBNMatrix, d.worldSpaceViewDir);
             d.texcoord0 = i.texcoord0;
             d.texcoord1 = i.texcoord1;
             d.texcoord2 = i.texcoord2;
             d.texcoord3 = i.texcoord3;
             d.isFrontFace = facing;
            #if _HDRP
            #else
            #endif
             d.screenPos = i.screenPos;
             d.screenUV = (i.screenPos.xy / i.screenPos.w);
            return d;
         }

#endif
#if (SHADERPASS == SHADERPASS_LIGHT_TRANSPORT)
   float unity_OneOverOutputBoost;
   float unity_MaxOutputValue;

   CBUFFER_START(UnityMetaPass)
   bool4 unity_MetaVertexControl;
   bool4 unity_MetaFragmentControl;
   CBUFFER_END

   VertexToPixel Vert(VertexData inputMesh)
   {
       VertexToPixel output;
       ZERO_INITIALIZE(VertexToPixel, output);
       UNITY_SETUP_INSTANCE_ID(inputMesh);
       UNITY_TRANSFER_INSTANCE_ID(inputMesh, output);
       UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);
       float2 uv = float2(0.0, 0.0);

       if (unity_MetaVertexControl.x)
       {
           uv = inputMesh.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
       }
       else if (unity_MetaVertexControl.y)
       {
           uv = inputMesh.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
       }
       output.pos = float4(uv * 2.0 - 1.0, inputMesh.vertex.z > 0 ? 1.0e-4 : 0.0, 1.0);

       output.worldPos = TransformObjectToWorld(inputMesh.vertex.xyz).xyz;
       output.worldNormal = TransformObjectToWorldNormal(inputMesh.normal);
       output.worldTangent = float4(1.0, 0.0, 0.0, 0.0);

       output.texcoord0 = inputMesh.texcoord0;
       output.texcoord1 = inputMesh.texcoord1;
       output.texcoord2 = inputMesh.texcoord2;
        output.texcoord3 = inputMesh.texcoord3;
       return output;
   }
#else

   #if (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
      #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariablesMatrixDefsHDCamera.hlsl"

      void MotionVectorPositionZBias(VertexToPixel input)
      {
      #if UNITY_REVERSED_Z
          input.pos.z -= unity_MotionVectorsParams.z * input.pos.w;
      #else
          input.pos.z += unity_MotionVectorsParams.z * input.pos.w;
      #endif
      }

   #endif

   VertexToPixel Vert(VertexData input)
   {
       VertexToPixel output;
       ZERO_INITIALIZE(VertexToPixel, output);

       UNITY_SETUP_INSTANCE_ID(input);
       UNITY_TRANSFER_INSTANCE_ID(input, output);
       UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

       #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
         VertexData previousMesh = input;
       #endif

       ChainModifyVertex(input, output, _Time);
       float3 positionRWS = TransformObjectToWorld(input.vertex.xyz);
       float3 normalWS = TransformObjectToWorldNormal(input.normal);
       float4 tangentWS = float4(TransformObjectToWorldDir(input.tangent.xyz), input.tangent.w);
       output.worldPos = GetAbsolutePositionWS(positionRWS);
       output.pos = TransformWorldToHClip(positionRWS);
       output.worldNormal = normalWS;
       output.worldTangent = tangentWS;
       output.texcoord0 = input.texcoord0;
       output.texcoord1 = input.texcoord1;
       output.texcoord2 = input.texcoord2;
        output.texcoord3 = input.texcoord3;
        output.screenPos = ComputeScreenPos(output.pos, _ProjectionParams.x);
       #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))

          #if !defined(TESSELLATION_ON)
            MotionVectorPositionZBias(output);
          #endif

          output.motionVectorCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(positionRWS.xyz, 1.0));
          bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
          if (forceNoMotion)
          {
              output.previousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
          }
          else
          {
            bool hasDeformation = unity_MotionVectorsParams.x > 0.0; 

            float3 effectivePositionOS = (hasDeformation ? previousMesh.previousPositionOS : previousMesh.vertex.xyz);
            #if defined(_ADD_PRECOMPUTED_VELOCITY)
               effectivePositionOS -= input.precomputedVelocity;
            #endif

            previousMesh.vertex = float4(effectivePositionOS, 1);
            VertexToPixel dummy = (VertexToPixel)0;
            ChainModifyVertex(previousMesh, dummy, _LastTimeParameters);
            float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.vertex.xyz);

            #ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
            if (_TransparentCameraOnlyMotionVectors > 0)
            {
               previousPositionRWS = positionRWS.xyz;
            }
            #endif 

            output.previousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
         }
       #endif 
       return output;
   }
#endif
               #if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
                  #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
               #endif

                FragInputs BuildFragInputs(VertexToPixel input)
                {
                    UNITY_SETUP_INSTANCE_ID(input);
                    FragInputs output;
                    ZERO_INITIALIZE(FragInputs, output);
                    output.tangentToWorld = k_identity3x3;
                    output.positionSS = input.pos;       
                    output.positionRWS = GetCameraRelativePositionWS(input.worldPos);
                    output.tangentToWorld = BuildTangentToWorld(input.worldTangent, input.worldNormal);
                    output.texCoord0 = input.texcoord0;
                    output.texCoord1 = input.texcoord1;
                    output.texCoord2 = input.texcoord2;
                    return output;
                }
               void BuildSurfaceData(FragInputs fragInputs, inout Surface surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
               {
                   ZERO_INITIALIZE(SurfaceData, surfaceData);
                   surfaceData.specularOcclusion = 1.0;
                   surfaceData.baseColor =                 surfaceDescription.Albedo;
                   surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;
                   surfaceData.ambientOcclusion =          surfaceDescription.Occlusion;
                   surfaceData.specularOcclusion =         surfaceDescription.SpecularOcclusion;
                   surfaceData.metallic =                  surfaceDescription.Metallic;
                   surfaceData.subsurfaceMask =            surfaceDescription.SubsurfaceMask;
                   surfaceData.thickness =                 surfaceDescription.Thickness;
                   surfaceData.diffusionProfileHash =      asuint(surfaceDescription.DiffusionProfileHash);
                   #if _USESPECULAR
                      surfaceData.specularColor =             surfaceDescription.Specular;
                   #endif
                   surfaceData.coatMask =                  surfaceDescription.CoatMask;
                   surfaceData.anisotropy =                surfaceDescription.Anisotropy;
                   surfaceData.iridescenceMask =           surfaceDescription.IridescenceMask;
                   surfaceData.iridescenceThickness =      surfaceDescription.IridescenceThickness;
                   #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                        if (_EnableSSRefraction)
                        {
                            surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                            surfaceDescription.Alpha = 1.0;
                        }
                        else
                        {
                            surfaceData.ior = surfaceDescription.ior;
                            surfaceData.transmittanceColor = surfaceDescription.transmittanceColor;
                            surfaceData.atDistance = surfaceDescription.atDistance;
                            surfaceData.transmittanceMask = surfaceDescription.transmittanceMask;
                            surfaceDescription.Alpha = 1.0;
                        }
                    #else
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                    #endif
                    surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
                    #ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
                    #endif
                    #ifdef _MATERIAL_FEATURE_TRANSMISSION
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
                    #endif
                    #ifdef _MATERIAL_FEATURE_ANISOTROPY
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                        surfaceData.normalWS = float3(0, 1, 0);
                    #endif
                    #ifdef _MATERIAL_FEATURE_IRIDESCENCE
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
                    #endif
                    #ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
                    #endif
                    #if defined(_MATERIAL_FEATURE_CLEAR_COAT) || _CLEARCOAT
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
                    #endif
                    #if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                        surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
                    #endif
                   #if !_WORLDSPACENORMAL
                      surfaceData.normalWS = mul(surfaceDescription.Normal, fragInputs.tangentToWorld);
                   #else
                      surfaceData.normalWS = surfaceDescription.Normal;
                   #endif

                   surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                   surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    
                    #if HAVE_DECALS
                        if (_EnableDecals)
                        {
                            float alpha = 1.0;
                            alpha = surfaceDescription.Alpha;
                            DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], alpha);
                            ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
                        }
                    #endif
                    bentNormalWS = surfaceData.normalWS;
                    surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);
                    #ifdef DEBUG_DISPLAY
                        if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
                        {
                            surfaceData.metallic = 0;
                        }
                        ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
                    #endif
                    #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                    #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                        surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                    #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                        surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                    #endif
                    #if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
                        surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                    #endif
               }
               void GetSurfaceAndBuiltinData(VertexToPixel m2ps, FragInputs fragInputs, float3 V, inout PositionInputs posInput,
                     out SurfaceData surfaceData, out BuiltinData builtinData, inout Surface l, inout ShaderData d
                     #if NEED_FACING
                        , bool facing
                     #endif
                  )
               {
                 d = CreateShaderData(m2ps
                    #if NEED_FACING
                       , facing
                    #endif
                 );

                 l = (Surface)0;

                 l.Albedo = half3(0.5, 0.5, 0.5);
                 l.Normal = float3(0,0,1);
                 l.Occlusion = 1;
                 l.Alpha = 1;
                 l.SpecularOcclusion = 1;

                 #if !defined(SHADER_STAGE_RAY_TRACING) && defined(_DEPTHOFFSET_ON)
                    l.outputDepth = d.clipPos.z;
                 #endif

                 ChainSurfaceFunction(l, d);

                 #if !defined(SHADER_STAGE_RAY_TRACING) && defined(_DEPTHOFFSET_ON)
                 #endif

                 #if _UNLIT
                     l.Normal = half3(0,0,1);
                     l.Occlusion = 1;
                     l.Metallic = 0;
                     l.Specular = 0;
                 #endif

                 surfaceData.geomNormalWS = d.worldSpaceNormal;
                 surfaceData.tangentWS = d.worldSpaceTangent;
                 fragInputs.tangentToWorld = d.TBNMatrix;

                 float3 bentNormalWS;
                 BuildSurfaceData(fragInputs, l, V, posInput, surfaceData, bentNormalWS);
                 InitBuiltinData(posInput, l.Alpha, bentNormalWS, -d.worldSpaceNormal, fragInputs.texCoord1, fragInputs.texCoord2, builtinData);
                 builtinData.emissiveColor = l.Emission;

                 #if defined(_OVERRIDE_BAKEDGI)
                    builtinData.bakeDiffuseLighting = l.DiffuseGI;
                    builtinData.backBakeDiffuseLighting = l.BackDiffuseGI;
                    builtinData.emissiveColor += l.SpecularGI;
                 #endif

                 #if defined(_OVERRIDE_SHADOWMASK)
                    builtinData.shadowMask0 = l.ShadowMask.x;
                    builtinData.shadowMask1 = l.ShadowMask.y;
                    builtinData.shadowMask2 = l.ShadowMask.z;
                    builtinData.shadowMask3 = l.ShadowMask.w;
                 #endif

                 #if defined(UNITY_VIRTUAL_TEXTURING)
                    builtinData.vtPackedFeedback = surfaceData.VTPackedFeedback;
                 #endif

                  #if (SHADERPASS == SHADERPASS_DISTORTION)
                     builtinData.distortion = surfaceData.Distortion;
                     builtinData.distortionBlur = surfaceData.DistortionBlur;
                  #endif

                  #ifndef SHADER_UNLIT
                    PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                  #else
                    ApplyDebugToBuiltinData(builtinData);
                  #endif
                  RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
               }
            #ifdef UNITY_VIRTUAL_TEXTURING
            #define VT_BUFFER_TARGET SV_Target1
            #define EXTRA_BUFFER_TARGET SV_Target2
            #else
            #define EXTRA_BUFFER_TARGET SV_Target1
            #endif
          void Frag(VertexToPixel v2p,
              #ifdef OUTPUT_SPLIT_LIGHTING
                  out float4 outColor : SV_Target0,  
                  #ifdef UNITY_VIRTUAL_TEXTURING
                      out float4 outVTFeedback : VT_BUFFER_TARGET,
                  #endif
                  out float4 outDiffuseLighting : EXTRA_BUFFER_TARGET,
                  OUTPUT_SSSBUFFER(outSSSBuffer)
              #else
                  out float4 outColor : SV_Target0
                  #ifdef UNITY_VIRTUAL_TEXTURING
                      ,out float4 outVTFeedback : VT_BUFFER_TARGET
                  #endif
                  #ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
                     , out float4 outMotionVec : EXTRA_BUFFER_TARGET
                  #endif 
              #endif 
              #ifdef _DEPTHOFFSET_ON
                  , out float outputDepth : SV_Depth
              #endif
              #if NEED_FACING
                 , bool facing : SV_IsFrontFace
              #endif
          )
          {
              #ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
                 outMotionVec = float4(2.0, 0.0, 0.0, 0.0);
              #endif

              UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(v2p);
              FragInputs input = BuildFragInputs(v2p);
              input.positionSS.xy = _OffScreenRendering > 0 ? (input.positionSS.xy * _OffScreenDownsampleFactor) : input.positionSS.xy;

              uint2 tileIndex = uint2(input.positionSS.xy) / GetTileSize();
              PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz, tileIndex);
              float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);
              SurfaceData surfaceData;
              BuiltinData builtinData;
              Surface l;
              ShaderData d;
              GetSurfaceAndBuiltinData(v2p, input, V, posInput, surfaceData, builtinData, l, d
               #if NEED_FACING
                  , facing
               #endif
               );
              BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);

              PreLightData preLightData = GetPreLightData(V, posInput, bsdfData);

              outColor = float4(0.0, 0.0, 0.0, 0.0);
             #ifdef DEBUG_DISPLAY
                #ifdef OUTPUT_SPLIT_LIGHTING
                    outDiffuseLighting = 0;
                    ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
                #endif
              bool viewMaterial = false;
              int bufferSize = _DebugViewMaterialArray[0].x;
              if (bufferSize != 0)
              {
                  bool needLinearToSRGB = false;
                  float3 result = float3(1.0, 0.0, 1.0);
                  for (int index = 1; index <= bufferSize; index++)
                  {
                      int indexMaterialProperty = _DebugViewMaterialArray[index].x;
                      if (indexMaterialProperty != 0)
                      {
                          viewMaterial = true;

                          GetPropertiesDataDebug(indexMaterialProperty, result, needLinearToSRGB);
                          GetVaryingsDataDebug(indexMaterialProperty, input, result, needLinearToSRGB);
                          GetBuiltinDataDebug(indexMaterialProperty, builtinData, posInput, result, needLinearToSRGB);
                          GetSurfaceDataDebug(indexMaterialProperty, surfaceData, result, needLinearToSRGB);
                          GetBSDFDataDebug(indexMaterialProperty, bsdfData, result, needLinearToSRGB);
                      }
                  }
                  if (!needLinearToSRGB)
                      result = SRGBToLinear(max(0, result));

                  outColor = float4(result, 1.0);
              }

              if (!viewMaterial)
              {
                  if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_DIFFUSE_COLOR || _DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_SPECULAR_COLOR)
                  {
                      float3 result = float3(0.0, 0.0, 0.0);

                      GetPBRValidatorDebug(surfaceData, result);

                      outColor = float4(result, 1.0f);
                  }
                  else if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_TRANSPARENCY_OVERDRAW)
                  {
                      float4 result = _DebugTransparencyOverdrawWeight * float4(TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_A);
                      outColor = result;
                  }
                  else
          #endif
                  {
          #ifdef _SURFACE_TYPE_TRANSPARENT
                      uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_TRANSPARENT;
          #else
                      uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_OPAQUE;
          #endif

                      LightLoopOutput lightLoopOutput;
                      LightLoop(V, posInput, preLightData, bsdfData, builtinData, featureFlags, lightLoopOutput);

                      float3 diffuseLighting = lightLoopOutput.diffuseLighting;
                      float3 specularLighting = lightLoopOutput.specularLighting;

                      diffuseLighting *= GetCurrentExposureMultiplier();
                      specularLighting *= GetCurrentExposureMultiplier();

          #ifdef OUTPUT_SPLIT_LIGHTING
                      if (_EnableSubsurfaceScattering != 0 && ShouldOutputSplitLighting(bsdfData))
                      {
                          outColor = float4(specularLighting, 1.0);
                          outDiffuseLighting = float4(TagLightingForSSS(diffuseLighting), 1.0);
                      }
                      else
                      {
                          outColor = float4(diffuseLighting + specularLighting, 1.0);
                          outDiffuseLighting = 0;
                      }
                      ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
          #else
                      outColor = ApplyBlendMode(diffuseLighting, specularLighting, builtinData.opacity);
                      outColor = EvaluateAtmosphericScattering(posInput, V, outColor);
          #endif

          ChainFinalColorForward(l, d, outColor);

          #ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
                      bool forceNoMotion = any(unity_MotionVectorsParams.yw == 0.0);
                      if (!forceNoMotion)
                      {
                          float2 motionVec = CalculateMotionVector(v2p.motionVectorCS, v2p.previousPositionCS);
                          EncodeMotionVector(motionVec * 0.5, outMotionVec);
                          outMotionVec.zw = 1.0;
                      }
          #endif
                  }

          #ifdef DEBUG_DISPLAY
              }
          #endif

          #ifdef _DEPTHOFFSET_ON
              outputDepth = l.outputDepth;
          #endif

          #ifdef UNITY_VIRTUAL_TEXTURING
             outVTFeedback = builtinData.vtPackedFeedback;
          #endif
          }

            ENDHLSL
        }
               Pass
        {
            Name "GBuffer"
            Tags { "LightMode" = "GBuffer" }
            Cull Back
            ZTest [_ZTestGBuffer]
            Stencil
               {
                  WriteMask [_StencilWriteMaskGBuffer]
                  Ref [_StencilRefGBuffer]
                  CompFront Always
                  PassFront Replace
                  CompBack Always
                  PassBack Replace
               }

                Cull [_CullMode]
            HLSLPROGRAM
            #pragma target 4.5
            #pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
            #pragma multi_compile_instancing
            #pragma multi_compile _ DOTS_INSTANCING_ON
            #pragma instancing_options renderinglayer
            #pragma multi_compile _ LIGHT_LAYERS
            #pragma multi_compile_raytracing _ LIGHT_LAYERS
            #pragma multi_compile _ DEBUG_DISPLAY
            #pragma multi_compile _ LIGHTMAP_ON
            #pragma multi_compile _ DIRLIGHTMAP_COMBINED
            #pragma multi_compile_fragment PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
            #pragma multi_compile_raytracing PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
            #pragma multi_compile _ DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fragment _ SHADOWS_SHADOWMASK
            #pragma multi_compile_raytracing _ SHADOWS_SHADOWMASK
            #pragma multi_compile_fragment DECALS_OFF DECALS_3RT DECALS_4RT
            #pragma multi_compile_fragment _ DECAL_SURFACE_GRADIENT
            #define _ENABLE_FOG_ON_TRANSPARENT 1
            #define SHADERPASS SHADERPASS_GBUFFER
            #define RAYTRACING_SHADER_GRAPH_DEFAULT
            #define _PASSGBUFFER 1
    #pragma shader_feature_local _ALPHATEST_ON

    #pragma shader_feature_local_fragment _NORMALMAP_TANGENT_SPACE
    #pragma shader_feature_local _NORMALMAP
    #pragma shader_feature_local_fragment _MASKMAP
    #pragma shader_feature_local_fragment _EMISSIVE_COLOR_MAP
    #pragma shader_feature_local_fragment _ANISOTROPYMAP
    #pragma shader_feature_local_fragment _DETAIL_MAP
    #pragma shader_feature_local_fragment _SUBSURFACE_MASK_MAP
    #pragma shader_feature_local_fragment _THICKNESSMAP
    #pragma shader_feature_local_fragment _IRIDESCENCE_THICKNESSMAP
    #pragma shader_feature_local_fragment _SPECULARCOLORMAP
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_TRANSMISSION
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_ANISOTROPY
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_CLEAR_COAT
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_IRIDESCENCE
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_SPECULAR_COLOR
    #pragma shader_feature_local_fragment _ENABLESPECULAROCCLUSION
    #pragma shader_feature_local_fragment _ _SPECULAR_OCCLUSION_NONE _SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP

    #ifdef _ENABLESPECULAROCCLUSION
        #define _SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP
    #endif
        #pragma shader_feature_local_fragment _OBSTRUCTION_CURVE
        #pragma shader_feature_local_fragment _DISSOLVEMASK
        #pragma shader_feature_local_fragment _ZONING
        #pragma shader_feature_local_fragment _REPLACEMENT
        #pragma shader_feature_local_fragment _PLAYERINDEPENDENT
   #define _HDRP 1
#define _USINGTEXCOORD1 1
#define _USINGTEXCOORD2 1
#define NEED_FACING 1

               #pragma vertex Vert
   #pragma fragment Frag
      #define UNITY_DECLARE_TEX2D(name) TEXTURE2D(name); SAMPLER(sampler##name);
      #define UNITY_DECLARE_TEX2D_NOSAMPLER(name) TEXTURE2D(name);
      #define UNITY_DECLARE_TEX2DARRAY(name) TEXTURE2D_ARRAY(name); SAMPLER(sampler##name);
      #define UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(tex) TEXTURE2D_ARRAY(tex);

      #define UNITY_SAMPLE_TEX2DARRAY(tex,coord)            SAMPLE_TEXTURE2D_ARRAY(tex, sampler##tex, coord.xy, coord.z)
      #define UNITY_SAMPLE_TEX2DARRAY_LOD(tex,coord,lod)    SAMPLE_TEXTURE2D_ARRAY_LOD(tex, sampler##tex, coord.xy, coord.z, lod)
      #define UNITY_SAMPLE_TEX2D(tex, coord)                SAMPLE_TEXTURE2D(tex, sampler##tex, coord)
      #define UNITY_SAMPLE_TEX2D_SAMPLER(tex, samp, coord)  SAMPLE_TEXTURE2D(tex, sampler##samp, coord)

      #define UNITY_SAMPLE_TEX2D_LOD(tex,coord, lod)   SAMPLE_TEXTURE2D_LOD(tex, sampler_##tex, coord, lod)
      #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord, lod) SAMPLE_TEXTURE2D_LOD (tex, sampler##samplertex,coord, lod)

      #if defined(UNITY_COMPILER_HLSL)
         #define UNITY_INITIALIZE_OUTPUT(type,name) name = (type)0;
      #else
         #define UNITY_INITIALIZE_OUTPUT(type,name)
      #endif

      #define sampler2D_float sampler2D
      #define sampler2D_half sampler2D

      #undef WorldNormalVector
      #define WorldNormalVector(data, normal) mul(normal, data.TBNMatrix)

      #define UnityObjectToWorldNormal(normal) mul(GetObjectToWorldMatrix(), normal)
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
#if UNITY_VERSION >= UNITY_2021_3_31
       #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl" 
#else
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" 
#endif    
            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT 
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
            #define RAYTRACING_SHADER_GRAPH_LOW
            #endif
            #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
               #define OUTPUT_SPLIT_LIGHTING
            #endif

            #define HAVE_RECURSIVE_RENDERING

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
               #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                  #define WRITE_NORMAL_BUFFER
               #endif
            #endif

            #ifndef DEBUG_DISPLAY
               #if !defined(_SURFACE_TYPE_TRANSPARENT) && defined(_ALPHATEST)
                  #if SHADERPASS == SHADERPASS_FORWARD
                  #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                  #elif SHADERPASS == SHADERPASS_GBUFFER
                  #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                  #endif
               #endif
            #endif
            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
               #define _DEFERRED_CAPABLE_MATERIAL
            #endif
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
               #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
            CBUFFER_START(UnityPerMaterial)
               float _UseShadowThreshold;
               float _BlendMode;
               float _EnableBlendModePreserveSpecularLighting;
               float _RayTracing;
               float _RefractionModel;
    float4 _BaseColorMap_ST;
    float4 _DetailMap_ST;
    float4 _EmissiveColorMap_ST;

    float _UVBase;
    half4 _Color;
    half4 _BaseColor; 
    half _Cutoff; 
    half _Mode;
    float _CullMode;
    float _CullModeForward;
    half _Metallic;
    half3 _EmissionColor;
    half _UVSec;

    float3 _EmissiveColor;
    float _AlbedoAffectEmissive;
    float _EmissiveExposureWeight;
    float _MetallicRemapMin;
    float _MetallicRemapMax;
    float _Smoothness;
    float _SmoothnessRemapMin;
    float _SmoothnessRemapMax;
    float _AlphaRemapMin;
    float _AlphaRemapMax;
    float _AORemapMin;
    float _AORemapMax;
    float _NormalScale;
    float _DetailAlbedoScale;
    float _DetailNormalScale;
    float _DetailSmoothnessScale;
    float _Anisotropy;
    float _DiffusionProfileHash;
    float _SubsurfaceMask;
    float _Thickness;
    float4 _ThicknessRemap;
    float _IridescenceThickness;
    float4 _IridescenceThicknessRemap;
    float _IridescenceMask;
    float _CoatMask;
    float4 _SpecularColor;
    float _EnergyConservingSpecularColor;
    int _MaterialID;

    float _LinkDetailsWithBase;
    float4 _UVMappingMask;
    float4 _UVDetailsMappingMask;

    float4 _UVMappingMaskEmissive;

    float _AlphaCutoff;
    float _SyncCullMode;

    float _IsReplacementShader;
    float _TriggerMode;
    float _RaycastMode;
    float _IsExempt;
    float _isReferenceMaterial;
    float _InteractionMode;

    float _tDirection = 0;
    float _numOfPlayersInside = 0;
    float _tValue = 0;
    float _id = 0;
    half _TextureVisibility;
    half _AngleStrength;
    float _Obstruction;
    float _UVs;
    float4 _ObstructionCurve_TexelSize;      
    float _DissolveMaskEnabled;
    float4 _DissolveMask_TexelSize;
    float4 _DissolveTex_TexelSize;
    half4 _DissolveColor;
    float _DissolveColorSaturation;
    float _DissolveEmission;
    float _DissolveEmissionBooster;
    float _hasClippedShadows;
    float _ConeStrength;
    float _ConeObstructionDestroyRadius;
    float _CylinderStrength;
    float _CylinderObstructionDestroyRadius;
    float _CircleStrength;
    float _CircleObstructionDestroyRadius;
    float _CurveStrength;
    float _CurveObstructionDestroyRadius;
    float _IntrinsicDissolveStrength;
    float _DissolveFallOff;
    float _AffectedAreaPlayerBasedObstruction;
    float _PreviewMode;
    float _PreviewIndicatorLineThickness;
    float _AnimationEnabled;
    float _AnimationSpeed;
    float _DefaultEffectRadius;
    float _EnableDefaultEffectRadius;
    float _TransitionDuration;
    float _TexturedEmissionEdge;
    float _TexturedEmissionEdgeStrength;
    float _IsometricExclusion;
    float _IsometricExclusionDistance;
    float _IsometricExclusionGradientLength;
    float _Floor;
    float _FloorMode;
    float _FloorY;
    float _FloorYTextureGradientLength;
    float _PlayerPosYOffset;
    float _AffectedAreaFloor;
    float _Ceiling;
    float _CeilingMode;
    float _CeilingBlendMode;
    float _CeilingY;
    float _CeilingPlayerYOffset;
    float _CeilingYGradientLength;
    float _Zoning;
    float _ZoningMode;
    float _ZoningEdgeGradientLength;
    float _IsZoningRevealable;
    float _SyncZonesWithFloorY;
    float _SyncZonesFloorYOffset;

    half _UseCustomTime;

    half _CrossSectionEnabled;
    half4 _CrossSectionColor;
    half _CrossSectionTextureEnabled;
    float _CrossSectionTextureScale;
    half _CrossSectionUVScaledByDistance;
    half _DissolveMethod;
    half _DissolveTexSpace;
            CBUFFER_END
               #ifdef SCENEPICKINGPASS
               float4 _SelectionID;
               #endif
               #ifdef SCENESELECTIONPASS
               int _ObjectId;
               int _PassValue;
               #endif
            struct VertexToPixel
            {
               float4 pos : SV_POSITION;
               float3 worldPos : TEXCOORD0;
               float3 worldNormal : TEXCOORD1;
               float4 worldTangent : TEXCOORD2;
               float4 texcoord0 : TEXCOORD3;
               float4 texcoord1 : TEXCOORD4;
               float4 texcoord2 : TEXCOORD5;
                float4 texcoord3 : TEXCOORD6;
                float4 screenPos : TEXCOORD7;
               #if UNITY_ANY_INSTANCING_ENABLED
                  UNITY_VERTEX_INPUT_INSTANCE_ID
               #endif 

               #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
                  float4 previousPositionCS : TEXCOORD16; 
                  float4 motionVectorCS : TEXCOORD17;
               #endif

               UNITY_VERTEX_OUTPUT_STEREO
            }; 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
            struct Surface
            {
               half3 Albedo;
               half Height;
               half3 Normal;
               half Smoothness;
               half3 Emission;
               half Metallic;
               half3 Specular;
               half Occlusion;
               half SpecularPower; 
               half Alpha;
               float outputDepth; 
               half SpecularOcclusion;
               half SubsurfaceMask;
               half Thickness;
               half CoatMask;
               half CoatSmoothness;
               half Anisotropy;
               half IridescenceMask;
               half IridescenceThickness;
               int DiffusionProfileHash;
               float SpecularAAThreshold;
               float SpecularAAScreenSpaceVariance;
               float3 DiffuseGI;
               float3 BackDiffuseGI;
               float3 SpecularGI;
               float ior;
               float3 transmittanceColor;
               float atDistance;
               float transmittanceMask;
               float4 ShadowMask;
               float NormalAlpha;
               float MAOSAlpha;
            };
            struct Blackboard
            {
                float blackboardDummyData;
            };
            struct ShaderData
            {
               float4 clipPos; 
               float3 localSpacePosition;
               float3 localSpaceNormal;
               float3 localSpaceTangent;
               float3 worldSpacePosition;
               float3 worldSpaceNormal;
               float3 worldSpaceTangent;
               float tangentSign;

               float3 worldSpaceViewDir;
               float3 tangentSpaceViewDir;

               float4 texcoord0;
               float4 texcoord1;
               float4 texcoord2;
               float4 texcoord3;

               float2 screenUV;
               float4 screenPos;

               float4 vertexColor;
               bool isFrontFace;

               float4 extraV2F0;
               float4 extraV2F1;
               float4 extraV2F2;
               float4 extraV2F3;
               float4 extraV2F4;
               float4 extraV2F5;
               float4 extraV2F6;
               float4 extraV2F7;

               float3x3 TBNMatrix;
               Blackboard blackboard;
            };

            struct VertexData
            {
               #if SHADER_TARGET > 30
               #endif
               float4 vertex : POSITION;
               float3 normal : NORMAL;
               float4 tangent : TANGENT;
               float4 texcoord0 : TEXCOORD0;
               #if _URP && (_USINGTEXCOORD1 || _PASSMETA || _PASSFORWARD || _PASSGBUFFER)
                  float4 texcoord1 : TEXCOORD1;
               #endif

               #if _URP && (_USINGTEXCOORD2 || _PASSMETA || ((_PASSFORWARD || _PASSGBUFFER) && defined(DYNAMICLIGHTMAP_ON)))
                  float4 texcoord2 : TEXCOORD2;
               #endif

               #if _STANDARD && (_USINGTEXCOORD1 || (_PASSMETA || ((_PASSFORWARD || _PASSGBUFFER || _PASSFORWARDADD) && LIGHTMAP_ON)))
                  float4 texcoord1 : TEXCOORD1;
               #endif
               #if _STANDARD && (_USINGTEXCOORD2 || (_PASSMETA || ((_PASSFORWARD || _PASSGBUFFER) && DYNAMICLIGHTMAP_ON)))
                  float4 texcoord2 : TEXCOORD2;
               #endif
               #if _HDRP
                  float4 texcoord1 : TEXCOORD1;
                  float4 texcoord2 : TEXCOORD2;
               #endif
                float4 texcoord3 : TEXCOORD3;
               #if _PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR))
                  float3 previousPositionOS : TEXCOORD4; 
                  #if defined (_ADD_PRECOMPUTED_VELOCITY)
                     float3 precomputedVelocity    : TEXCOORD5; 
                  #endif
               #endif

               UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct TessVertex 
            {
               float4 vertex : INTERNALTESSPOS;
               float3 normal : NORMAL;
               float4 tangent : TANGENT;
               float4 texcoord0 : TEXCOORD0;
               float4 texcoord1 : TEXCOORD1;
               float4 texcoord2 : TEXCOORD2;
                float4 texcoord3 : TEXCOORD3;
               #if _PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR))
                  float3 previousPositionOS : TEXCOORD13; 
                  #if defined (_ADD_PRECOMPUTED_VELOCITY)
                     float3 precomputedVelocity : TEXCOORD14;
                  #endif
               #endif

               UNITY_VERTEX_INPUT_INSTANCE_ID
               UNITY_VERTEX_OUTPUT_STEREO
            };

            struct ExtraV2F
            {
               float4 extraV2F0;
               float4 extraV2F1;
               float4 extraV2F2;
               float4 extraV2F3;
               float4 extraV2F4;
               float4 extraV2F5;
               float4 extraV2F6;
               float4 extraV2F7;
               Blackboard blackboard;
               float4 time;
            };
            float3 WorldToTangentSpace(ShaderData d, float3 normal)
            {
               return mul(d.TBNMatrix, normal);
            }

            float3 TangentToWorldSpace(ShaderData d, float3 normal)
            {
               return mul(normal, d.TBNMatrix);
            }
            #if _STANDARD
               float3 TransformWorldToObject(float3 p) { return mul(unity_WorldToObject, float4(p, 1)); };
               float3 TransformObjectToWorld(float3 p) { return mul(unity_ObjectToWorld, float4(p, 1)); };
               float4 TransformWorldToObject(float4 p) { return mul(unity_WorldToObject, p); };
               float4 TransformObjectToWorld(float4 p) { return mul(unity_ObjectToWorld, p); };
               float4x4 GetWorldToObjectMatrix() { return unity_WorldToObject; }
               float4x4 GetObjectToWorldMatrix() { return unity_ObjectToWorld; }
               #if (defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (SHADER_TARGET_SURFACE_ANALYSIS && !SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))
                 #define UNITY_SAMPLE_TEX2D_LOD(tex,coord, lod) tex.SampleLevel (sampler##tex,coord, lod)
                 #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord, lod) tex.SampleLevel (sampler##samplertex,coord, lod)
              #else
                 #define UNITY_SAMPLE_TEX2D_LOD(tex,coord,lod) tex2D (tex,coord,0,lod)
                 #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord,lod) tex2D (tex,coord,0,lod)
              #endif

               #undef GetWorldToObjectMatrix()

               #define GetWorldToObjectMatrix()   unity_WorldToObject
            #endif

            float3 GetCameraWorldPosition()
            {
               #if _HDRP
                  return GetCameraRelativePositionWS(_WorldSpaceCameraPos);
               #else
                  return _WorldSpaceCameraPos;
               #endif
            }

            #if _GRABPASSUSED
               #if _STANDARD
                  TEXTURE2D(%GRABTEXTURE%);
                  SAMPLER(sampler_%GRABTEXTURE%);
               #endif

               half3 GetSceneColor(float2 uv)
               {
                  #if _STANDARD
                     return SAMPLE_TEXTURE2D(%GRABTEXTURE%, sampler_%GRABTEXTURE%, uv).rgb;
                  #else
                     return SHADERGRAPH_SAMPLE_SCENE_COLOR(uv);
                  #endif
               }
            #endif
            #if _STANDARD
               UNITY_DECLARE_DEPTH_TEXTURE(_CameraDepthTexture);
               float GetSceneDepth(float2 uv) { return SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, uv); }
               float GetLinear01Depth(float2 uv) { return Linear01Depth(GetSceneDepth(uv)); }
               float GetLinearEyeDepth(float2 uv) { return LinearEyeDepth(GetSceneDepth(uv)); } 
            #else
               float GetSceneDepth(float2 uv) { return SHADERGRAPH_SAMPLE_SCENE_DEPTH(uv); }
               float GetLinear01Depth(float2 uv) { return Linear01Depth(GetSceneDepth(uv), _ZBufferParams); }
               float GetLinearEyeDepth(float2 uv) { return LinearEyeDepth(GetSceneDepth(uv), _ZBufferParams); } 
            #endif

            float3 GetWorldPositionFromDepthBuffer(float2 uv, float3 worldSpaceViewDir)
            {
               float eye = GetLinearEyeDepth(uv);
               float3 camView = mul((float3x3)GetObjectToWorldMatrix(), transpose(mul(GetWorldToObjectMatrix(), UNITY_MATRIX_I_V)) [2].xyz);

               float dt = dot(worldSpaceViewDir, camView);
               float3 div = worldSpaceViewDir/dt;
               float3 wpos = (eye * div) + GetCameraWorldPosition();
               return wpos;
            }

            #if _HDRP
            float3 ObjectToWorldSpacePosition(float3 pos)
            {
               return GetAbsolutePositionWS(TransformObjectToWorld(pos));
            }
            #else
            float3 ObjectToWorldSpacePosition(float3 pos)
            {
               return TransformObjectToWorld(pos);
            }
            #endif

            #if _STANDARD
               UNITY_DECLARE_SCREENSPACE_TEXTURE(_CameraDepthNormalsTexture);
               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  float4 depthNorms = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_CameraDepthNormalsTexture, uv);
                  float3 norms = DecodeViewNormalStereo(depthNorms);
                  norms = mul((float3x3)GetWorldToViewMatrix(), norms) * 0.5 + 0.5;
                  return norms;
               }
            #elif _HDRP && !_DECALSHADER
               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  NormalData nd;
                  DecodeFromNormalBuffer(_ScreenSize.xy * uv, nd);
                  return nd.normalWS;
               }
            #elif _URP
               #if (SHADER_LIBRARY_VERSION_MAJOR >= 10)
                  #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareNormalsTexture.hlsl"
               #endif

               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  #if (SHADER_LIBRARY_VERSION_MAJOR >= 10)
                     return SampleSceneNormals(uv);
                  #else
                     float3 wpos = GetWorldPositionFromDepthBuffer(uv, worldSpaceViewDir);
                     return normalize(-cross(ddx(wpos), ddy(wpos))) * 0.5 + 0.5;
                  #endif

                }
             #endif

             #if _HDRP

               half3 UnpackNormalmapRGorAG(half4 packednormal)
               {
                  packednormal.x *= packednormal.w;

                  half3 normal;
                  normal.xy = packednormal.xy * 2 - 1;
                  normal.z = sqrt(1 - saturate(dot(normal.xy, normal.xy)));
                  return normal;
               }
               half3 UnpackNormal(half4 packednormal)
               {
                  #if defined(UNITY_NO_DXT5nm)
                     return packednormal.xyz * 2 - 1;
                  #else
                     return UnpackNormalmapRGorAG(packednormal);
                  #endif
               }
            #endif
            #if _HDRP || _URP

               half3 UnpackScaleNormal(half4 packednormal, half scale)
               {
                 #ifndef UNITY_NO_DXT5nm
                   packednormal.x *= packednormal.w;
                 #endif
                   half3 normal;
                   normal.xy = (packednormal.xy * 2 - 1) * scale;
                   normal.z = sqrt(1 - saturate(dot(normal.xy, normal.xy)));
                   return normal;
               }	

             #endif
            void GetSun(out float3 lightDir, out float3 color)
            {
               lightDir = float3(0.5, 0.5, 0);
               color = 1;
               #if _HDRP
                  if (_DirectionalLightCount > 0)
                  {
                     DirectionalLightData light = _DirectionalLightDatas[0];
                     lightDir = -light.forward.xyz;
                     color = light.color;
                  }
               #elif _STANDARD
			         lightDir = normalize(_WorldSpaceLightPos0.xyz);
                  color = _LightColor0.rgb;
               #elif _URP
	               Light light = GetMainLight();
	               lightDir = light.direction;
	               color = light.color;
               #endif
            }
    sampler2D _EmissiveColorMap;
    sampler2D _BaseColorMap;
    sampler2D _MaskMap;
    sampler2D _NormalMap;
    sampler2D _NormalMapOS;
    sampler2D _DetailMap;
    sampler2D _TangentMap;
    sampler2D _TangentMapOS;
    sampler2D _AnisotropyMap;
    sampler2D _SubsurfaceMaskMap;
    sampler2D _TransmissionMaskMap;
    sampler2D _ThicknessMap;
    sampler2D _IridescenceThicknessMap;
    sampler2D _IridescenceMaskMap;
    sampler2D _SpecularColorMap;

    sampler2D _CoatMaskMap;

    float3 DecodeNormal (float4 sample, float scale) {
        #if defined(UNITY_NO_DXT5nm)
            return UnpackNormalRGB(sample, scale);
        #else
            return UnpackNormalmapRGorAG(sample, scale);
        #endif
    }

	void Ext_SurfaceFunction0 (inout Surface o, ShaderData d)
	{
        float2 uvBase = (_UVMappingMask.x * d.texcoord0 +
                        _UVMappingMask.y * d.texcoord1 +
                        _UVMappingMask.z * d.texcoord2 +
                        _UVMappingMask.w * d.texcoord3).xy;

        float2 uvDetails =  (_UVDetailsMappingMask.x * d.texcoord0 +
                            _UVDetailsMappingMask.y * d.texcoord1 +
                            _UVDetailsMappingMask.z * d.texcoord2 +
                            _UVDetailsMappingMask.w * d.texcoord3).xy;
        float4 texcoords;
        texcoords.xy = uvBase * _BaseColorMap_ST.xy + _BaseColorMap_ST.zw; 

        texcoords.zw = uvDetails * _DetailMap_ST.xy + _DetailMap_ST.zw;

        if (_LinkDetailsWithBase > 0.0)
        {
            texcoords.zw = texcoords.zw  * _BaseColorMap_ST.xy + _BaseColorMap_ST.zw;

        }

            float3 detailNormalTS = float3(0.0, 0.0, 0.0);
            float detailMask = 0.0;
            #ifdef _DETAIL_MAP
                detailMask = 1.0;
                #ifdef _MASKMAP
                    detailMask = tex2D(_MaskMap, texcoords.xy).b;
                #endif
                float2 detailAlbedoAndSmoothness = tex2D(_DetailMap, texcoords.zw).rb;
                float detailAlbedo = detailAlbedoAndSmoothness.r * 2.0 - 1.0;
                float detailSmoothness = detailAlbedoAndSmoothness.g * 2.0 - 1.0;
                real4 packedNormal = tex2D(_DetailMap, texcoords.zw).rgba;
                detailNormalTS = UnpackNormalAG(packedNormal, _DetailNormalScale);
            #endif
            float4 color = tex2D(_BaseColorMap, texcoords.xy).rgba  * _Color.rgba;
            o.Albedo = color.rgb; 
            float alpha = color.a;
            alpha = lerp(_AlphaRemapMin, _AlphaRemapMax, alpha);
            o.Alpha = alpha;
            #ifdef _DETAIL_MAP
                float albedoDetailSpeed = saturate(abs(detailAlbedo) * _DetailAlbedoScale);
                float3 baseColorOverlay = lerp(sqrt(o.Albedo), (detailAlbedo < 0.0) ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0), albedoDetailSpeed * albedoDetailSpeed);
                baseColorOverlay *= baseColorOverlay;
                o.Albedo = lerp(o.Albedo, saturate(baseColorOverlay), detailMask);
            #endif

            #ifdef _NORMALMAP
                float3 normalTS;
                #ifdef _NORMALMAP_TANGENT_SPACE
                    normalTS = DecodeNormal(tex2D(_NormalMap, texcoords.xy), _NormalScale);
                #else
                    #ifdef SURFACE_GRADIENT
                        float3 normalOS = tex2D(_NormalMapOS, texcoords.xy).xyz * 2.0 - 1.0;
                        normalTS = SurfaceGradientFromPerturbedNormal(d.worldSpaceNormal, TransformObjectToWorldNormal(normalOS));
                    #else
                        float3 normalOS = UnpackNormalRGB(tex2D(_NormalMapOS, texcoords.xy), 1.0);
                        float3 bitangent = d.tangentSign * cross(d.worldSpaceNormal.xyz, d.worldSpaceTangent.xyz);
                        half3x3 tangentToWorld = half3x3(d.worldSpaceTangent.xyz, bitangent.xyz, d.worldSpaceNormal.xyz);
                        normalTS = TransformObjectToTangent(normalOS, tangentToWorld);
                    #endif
                #endif

                #ifdef _DETAIL_MAP
                    #ifdef SURFACE_GRADIENT
                    normalTS += detailNormalTS * detailMask;
                    #else
                    normalTS = lerp(normalTS, BlendNormalRNM(normalTS, normalize(detailNormalTS)), detailMask); 
                    #endif
                #endif
                o.Normal = normalTS;

            #endif

            #if defined(_MASKMAP)
                o.Smoothness = tex2D(_MaskMap, texcoords.xy).a;
                o.Smoothness = lerp(_SmoothnessRemapMin, _SmoothnessRemapMax, o.Smoothness);
            #else
                o.Smoothness = _Smoothness;
            #endif
            #ifdef _DETAIL_MAP
                float smoothnessDetailSpeed = saturate(abs(detailSmoothness) * _DetailSmoothnessScale);
                float smoothnessOverlay = lerp(o.Smoothness, (detailSmoothness < 0.0) ? 0.0 : 1.0, smoothnessDetailSpeed);
                o.Smoothness = lerp(o.Smoothness, saturate(smoothnessOverlay), detailMask);
            #endif
            #ifdef _MASKMAP
                o.Metallic = tex2D(_MaskMap, texcoords.xy).r;
                o.Metallic = lerp(_MetallicRemapMin, _MetallicRemapMax, o.Metallic);
                o.Occlusion = tex2D(_MaskMap, texcoords.xy).g;
                o.Occlusion = lerp(_AORemapMin, _AORemapMax, o.Occlusion);
            #else
                o.Metallic = _Metallic;
                o.Occlusion = 1.0;
            #endif

            #if defined(_SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP)
            #elif  defined(_MASKMAP) && !defined(_SPECULAR_OCCLUSION_NONE)
                float3 V = normalize(d.worldSpaceViewDir);
                o.SpecularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(d.worldSpaceNormal, V)), o.Occlusion, PerceptualSmoothnessToRoughness(o.Smoothness));
            #endif

            o.DiffusionProfileHash = asuint(_DiffusionProfileHash);
            o.SubsurfaceMask = _SubsurfaceMask;
            #ifdef _SUBSURFACE_MASK_MAP
                o.SubsurfaceMask *= tex2D(_SubsurfaceMaskMap, texcoords.xy).r;
            #endif
            #ifdef _THICKNESSMAP
                o.Thickness = tex2D(_ThicknessMap, texcoords.xy).r;
                o.Thickness = _ThicknessRemap.x + _ThicknessRemap.y * surfaceData.thickness;
            #else
                o.Thickness = _Thickness;
            #endif
            #ifdef _ANISOTROPYMAP
                o.Anisotropy = tex2D(_AnisotropyMap, texcoords.xy).r;
            #else
                o.Anisotropy = 1.0;
            #endif
                o.Anisotropy *= _Anisotropy;
                o.Specular = _SpecularColor.rgb;
            #ifdef _SPECULARCOLORMAP
                o.Specular *= tex2D(_SpecularColorMap, texcoords.xy).rgb;
            #endif
            #ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                o.Albedo *= _EnergyConservingSpecularColor > 0.0 ? (1.0 - Max3(o.Specular.r, o.Specular.g, o.Specular.b)) : 1.0;
            #endif
            #ifdef _MATERIAL_FEATURE_CLEAR_COAT
                o.CoatMask = _CoatMask;
                o.CoatMask *= tex2D(_CoatMaskMap, texcoords.xy).r;
            #else
                o.CoatMask = 0.0;
            #endif
            #ifdef _MATERIAL_FEATURE_IRIDESCENCE
                #ifdef _IRIDESCENCE_THICKNESSMAP
                o.IridescenceThickness = tex2D(_IridescenceThicknessMap, texcoords.xy).r;
                o.IridescenceThickness = _IridescenceThicknessRemap.x + _IridescenceThicknessRemap.y * o.IridescenceThickness;
                #else
                o.IridescenceThickness = _IridescenceThickness;
                #endif
                o.IridescenceMask = _IridescenceMask;
                o.IridescenceMask *= tex2D(_IridescenceMaskMap, texcoords.xy).r;
            #else
                o.IridescenceThickness = 0.0;
                o.IridescenceMask = 0.0;
            #endif
            float3 emissiveColor = _EmissiveColor * lerp(float3(1.0, 1.0, 1.0), o.Albedo.rgb, _AlbedoAffectEmissive);
            #ifdef _EMISSIVE_COLOR_MAP                
                float2 uvEmission = _UVMappingMaskEmissive.x * d.texcoord0 +
                                    _UVMappingMaskEmissive.y * d.texcoord1 +
                                    _UVMappingMaskEmissive.z * d.texcoord2 +
                                    _UVMappingMaskEmissive.w * d.texcoord3;

                uvEmission = uvEmission * _EmissiveColorMap_ST.xy + _EmissiveColorMap_ST.zw;                     

                emissiveColor *= tex2D(_EmissiveColorMap, uvEmission).rgb;
            #endif
            o.Emission += emissiveColor;
            float currentExposureMultiplier = 0;
            #if SHADEROPTIONS_PRE_EXPOSITION
                currentExposureMultiplier =  LOAD_TEXTURE2D(_ExposureTexture, int2(0, 0)).x * _ProbeExposureScale;
            #else
                currentExposureMultiplier =  _ProbeExposureScale;
            #endif
            float InverseCurrentExposureMultiplier = 0;
            float exposure = currentExposureMultiplier;
            InverseCurrentExposureMultiplier =  rcp(exposure + (exposure == 0.0)); 
            float3 emissiveRcpExposure = o.Emission * InverseCurrentExposureMultiplier;
            o.Emission = lerp(emissiveRcpExposure, o.Emission, _EmissiveExposureWeight);
            #if defined(_ALPHATEST_ON)
                float alphaTex = tex2D(_BaseColorMap, texcoords.xy).a;
                alphaTex = lerp(_AlphaRemapMin, _AlphaRemapMax, alphaTex);
                float alphaValue = alphaTex * _BaseColor.a;
                float alphaCutoff = _AlphaCutoff;
                clip(alpha - alphaCutoff);
            #endif

	}
    float _ArrayLength = 0;
    #if (defined(SHADER_API_GLES) || defined(SHADER_API_GLES3)) 
        float4 _PlayersPosVectorArray[20];
        float _PlayersDataFloatArray[150];     
    #else
        float4 _PlayersPosVectorArray[100];
        float _PlayersDataFloatArray[500];  
    #endif
    #if _ZONING
        #if (defined(SHADER_API_GLES) || defined(SHADER_API_GLES3)) 
            float _ZDFA[500];
        #else
            float _ZDFA[1000];
        #endif
        float _ZonesDataCount;
    #endif

    float _STSCustomTime = 0;
    #if _REPLACEMENT        
        half4 _DissolveColorGlobal;
        float _DissolveColorSaturationGlobal;
        float _DissolveEmissionGlobal;
        float _DissolveEmissionBoosterGlobal;
        float _TextureVisibilityGlobal;
        float _ObstructionGlobal;
        float _AngleStrengthGlobal;
        float _ConeStrengthGlobal;
        float _ConeObstructionDestroyRadiusGlobal;
        float _CylinderStrengthGlobal;
        float _CylinderObstructionDestroyRadiusGlobal;
        float _CircleStrengthGlobal;
        float _CircleObstructionDestroyRadiusGlobal;
        float _CurveStrengthGlobal;
        float _CurveObstructionDestroyRadiusGlobal;
        float _DissolveFallOffGlobal;
        float _AffectedAreaPlayerBasedObstructionGlobal;
        float _IntrinsicDissolveStrengthGlobal;
        float _PreviewModeGlobal;
        float _UVsGlobal;
        float _hasClippedShadowsGlobal;
        float _FloorGlobal;
        float _FloorModeGlobal;
        float _FloorYGlobal;
        float _PlayerPosYOffsetGlobal;
        float _FloorYTextureGradientLengthGlobal;
        float _AffectedAreaFloorGlobal;
        float _AnimationEnabledGlobal;
        float _AnimationSpeedGlobal;
        float _DefaultEffectRadiusGlobal;
        float _EnableDefaultEffectRadiusGlobal;
        float _TransitionDurationGlobal;        
        float _TexturedEmissionEdgeGlobal;
        float _TexturedEmissionEdgeStrengthGlobal;
        float _IsometricExclusionGlobal;
        float _IsometricExclusionDistanceGlobal;
        float _IsometricExclusionGradientLengthGlobal;
        float _CeilingGlobal;
        float _CeilingModeGlobal;
        float _CeilingBlendModeGlobal;
        float _CeilingYGlobal;
        float _CeilingPlayerYOffsetGlobal;
        float _CeilingYGradientLengthGlobal;
        float _ZoningGlobal;
        float _ZoningModeGlobal;
        float _ZoningEdgeGradientLengthGlobal;
        float _IsZoningRevealableGlobal;
        float _SyncZonesWithFloorYGlobal;
        float _SyncZonesFloorYOffsetGlobal;
        float4 _ObstructionCurveGlobal_TexelSize;
        float4 _DissolveMaskGlobal_TexelSize;
        float _DissolveMaskEnabledGlobal;
        float _PreviewIndicatorLineThicknessGlobal;
        half _UseCustomTimeGlobal;

        half _CrossSectionEnabledGlobal;
        half4 _CrossSectionColorGlobal;
        half _CrossSectionTextureEnabledGlobal;
        float _CrossSectionTextureScaleGlobal;
        half _CrossSectionUVScaledByDistanceGlobal;

        half _DissolveMethodGlobal;
        half _DissolveTexSpaceGlobal;

        float4 _DissolveTexGlobal_TexelSize;
    #endif
    #if _REPLACEMENT
        sampler2D _DissolveTexGlobal;
    #else
        sampler2D _DissolveTex;
    #endif
    #if _REPLACEMENT
        sampler2D _DissolveMaskGlobal;
    #else
        sampler2D _DissolveMask;
    #endif
    #if _REPLACEMENT
        sampler2D _ObstructionCurveGlobal;
    #else
        sampler2D _ObstructionCurve;
    #endif

    #if _REPLACEMENT
        sampler2D _CrossSectionTextureGlobal;
    #else
        sampler2D _CrossSectionTexture;
    #endif
#ifdef USE_UNITY_TEXTURE_2D_TYPE
#undef USE_UNITY_TEXTURE_2D_TYPE
#endif

#include "Packages/com.shadercrew.seethroughshader.core/Scripts/Shaders/xxSharedSTSDependencies/SeeThroughShaderFunction.hlsl"
	void Ext_SurfaceFunction1 (inout Surface o, ShaderData d)
	{
        half3 albedo;
        half3 emission;
        float alphaForClipping;
#ifdef USE_UNITY_TEXTURE_2D_TYPE
#undef USE_UNITY_TEXTURE_2D_TYPE
#endif
#if _REPLACEMENT
    DoSeeThroughShading( o.Albedo, o.Normal, d.worldSpacePosition, d.worldSpaceNormal, d.screenPos,
                        _numOfPlayersInside, _tDirection, _tValue, _id,
                        _TriggerMode, _RaycastMode,
                        _IsExempt,

                        _DissolveMethodGlobal, _DissolveTexSpaceGlobal,

                        _DissolveColorGlobal, _DissolveColorSaturationGlobal, _UVsGlobal,
                        _DissolveEmissionGlobal, _DissolveEmissionBoosterGlobal, _TexturedEmissionEdgeGlobal, _TexturedEmissionEdgeStrengthGlobal,
                        _hasClippedShadowsGlobal,

                        _ObstructionGlobal,
                        _AngleStrengthGlobal,
                        _ConeStrengthGlobal, _ConeObstructionDestroyRadiusGlobal,
                        _CylinderStrengthGlobal, _CylinderObstructionDestroyRadiusGlobal,
                        _CircleStrengthGlobal, _CircleObstructionDestroyRadiusGlobal,
                        _CurveStrengthGlobal, _CurveObstructionDestroyRadiusGlobal,
                        _DissolveFallOffGlobal,
                        _DissolveMaskEnabledGlobal,
                        _AffectedAreaPlayerBasedObstructionGlobal,
                        _IntrinsicDissolveStrengthGlobal,
                        _DefaultEffectRadiusGlobal, _EnableDefaultEffectRadiusGlobal,

                        _IsometricExclusionGlobal, _IsometricExclusionDistanceGlobal, _IsometricExclusionGradientLengthGlobal,
                        _CeilingGlobal, _CeilingModeGlobal, _CeilingBlendModeGlobal, _CeilingYGlobal, _CeilingPlayerYOffsetGlobal, _CeilingYGradientLengthGlobal,
                        _FloorGlobal, _FloorModeGlobal, _FloorYGlobal, _PlayerPosYOffsetGlobal, _FloorYTextureGradientLengthGlobal, _AffectedAreaFloorGlobal,

                        _AnimationEnabledGlobal, _AnimationSpeedGlobal,
                        _TransitionDurationGlobal,

                        _UseCustomTimeGlobal,

                        _ZoningGlobal, _ZoningModeGlobal, _IsZoningRevealableGlobal, _ZoningEdgeGradientLengthGlobal,
                        _SyncZonesWithFloorYGlobal, _SyncZonesFloorYOffsetGlobal,

                        _PreviewModeGlobal,
                        _PreviewIndicatorLineThicknessGlobal,

                        _DissolveTexGlobal,
                        _DissolveMaskGlobal,
                        _ObstructionCurveGlobal,

                        _DissolveTexGlobal_TexelSize,
                        _DissolveMaskGlobal_TexelSize,
                        _ObstructionCurveGlobal_TexelSize,

                        albedo, emission, alphaForClipping);
#else 
    DoSeeThroughShading( o.Albedo, o.Normal, d.worldSpacePosition, d.worldSpaceNormal, d.screenPos,

                        _numOfPlayersInside, _tDirection, _tValue, _id,
                        _TriggerMode, _RaycastMode,
                        _IsExempt,

                        _DissolveMethod, _DissolveTexSpace,

                        _DissolveColor, _DissolveColorSaturation, _UVs,
                        _DissolveEmission, _DissolveEmissionBooster, _TexturedEmissionEdge, _TexturedEmissionEdgeStrength,
                        _hasClippedShadows,

                        _Obstruction,
                        _AngleStrength,
                        _ConeStrength, _ConeObstructionDestroyRadius,
                        _CylinderStrength, _CylinderObstructionDestroyRadius,
                        _CircleStrength, _CircleObstructionDestroyRadius,
                        _CurveStrength, _CurveObstructionDestroyRadius,
                        _DissolveFallOff,
                        _DissolveMaskEnabled,
                        _AffectedAreaPlayerBasedObstruction,
                        _IntrinsicDissolveStrength,
                        _DefaultEffectRadius, _EnableDefaultEffectRadius,

                        _IsometricExclusion, _IsometricExclusionDistance, _IsometricExclusionGradientLength,
                        _Ceiling, _CeilingMode, _CeilingBlendMode, _CeilingY, _CeilingPlayerYOffset, _CeilingYGradientLength,
                        _Floor, _FloorMode, _FloorY, _PlayerPosYOffset, _FloorYTextureGradientLength, _AffectedAreaFloor,

                        _AnimationEnabled, _AnimationSpeed,
                        _TransitionDuration,

                        _UseCustomTime,

                        _Zoning, _ZoningMode , _IsZoningRevealable, _ZoningEdgeGradientLength,
                        _SyncZonesWithFloorY, _SyncZonesFloorYOffset,

                        _PreviewMode,
                        _PreviewIndicatorLineThickness,                            

                        _DissolveTex,
                        _DissolveMask,
                        _ObstructionCurve,

                        _DissolveTex_TexelSize,
                        _DissolveMask_TexelSize,
                        _ObstructionCurve_TexelSize,

                        albedo, emission, alphaForClipping);
#endif 
        o.Albedo = albedo;
        o.Emission += emission;   

	}
    void Ext_FinalColorForward1 (Surface o, ShaderData d, inout half4 color)
    {
        #if _REPLACEMENT   
            DoCrossSection(_CrossSectionEnabledGlobal,
                        _CrossSectionColorGlobal,
                        _CrossSectionTextureEnabledGlobal,
                        _CrossSectionTextureGlobal,
                        _CrossSectionTextureScaleGlobal,
                        _CrossSectionUVScaledByDistanceGlobal,
                        d.isFrontFace,
                        d.screenPos,
                        color);
        #else 
            DoCrossSection(_CrossSectionEnabled,
                        _CrossSectionColor,
                        _CrossSectionTextureEnabled,
                        _CrossSectionTexture,
                        _CrossSectionTextureScale,
                        _CrossSectionUVScaledByDistance,
                        d.isFrontFace,
                        d.screenPos,
                        color);
        #endif
    }
            void ChainSurfaceFunction(inout Surface l, inout ShaderData d)
            {
                  Ext_SurfaceFunction0(l, d);
                  Ext_SurfaceFunction1(l, d);
            }

#if !_DECALSHADER

            void ChainModifyVertex(inout VertexData v, inout VertexToPixel v2p, float4 time)
            {
                 ExtraV2F d;
                 ZERO_INITIALIZE(ExtraV2F, d);
                 ZERO_INITIALIZE(Blackboard, d.blackboard);
                 d.time = time;
            }

            void ChainModifyTessellatedVertex(inout VertexData v, inout VertexToPixel v2p)
            {
               ExtraV2F d;
               ZERO_INITIALIZE(ExtraV2F, d);
               ZERO_INITIALIZE(Blackboard, d.blackboard);
            }

            void ChainFinalColorForward(inout Surface l, inout ShaderData d, inout half4 color)
            {
                  Ext_FinalColorForward1(l, d, color);
            }

            void ChainFinalGBufferStandard(inout Surface s, inout ShaderData d, inout half4 GBuffer0, inout half4 GBuffer1, inout half4 GBuffer2, inout half4 outEmission, inout half4 outShadowMask)
            {
            }
#endif
#if _DECALSHADER

        ShaderData CreateShaderData(SurfaceDescriptionInputs IN)
        {
            ShaderData d = (ShaderData)0;
            d.TBNMatrix = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
            d.worldSpaceNormal = IN.WorldSpaceNormal;
            d.worldSpaceTangent = IN.WorldSpaceTangent;

            d.worldSpacePosition = IN.WorldSpacePosition;
            d.texcoord0 = IN.uv0.xyxy;
            d.screenPos = IN.ScreenPosition;

            d.worldSpaceViewDir = normalize(_WorldSpaceCameraPos - d.worldSpacePosition);

            d.tangentSpaceViewDir = mul(d.TBNMatrix, d.worldSpaceViewDir);
            #if _HDRP
            #else
            #endif
             d.screenUV = (IN.ScreenPosition.xy / max(0.01, IN.ScreenPosition.w));
            return d;
        }
#else

         ShaderData CreateShaderData(VertexToPixel i
                  #if NEED_FACING
                     , bool facing
                  #endif
         )
         {
            ShaderData d = (ShaderData)0;
            d.clipPos = i.pos;
            d.worldSpacePosition = i.worldPos;

            d.worldSpaceNormal = normalize(i.worldNormal);
            d.worldSpaceTangent.xyz = normalize(i.worldTangent.xyz);

            d.tangentSign = i.worldTangent.w * unity_WorldTransformParams.w;
            float3 bitangent = cross(d.worldSpaceTangent.xyz, d.worldSpaceNormal) * d.tangentSign;
            d.TBNMatrix = float3x3(d.worldSpaceTangent, -bitangent, d.worldSpaceNormal);
            d.worldSpaceViewDir = normalize(_WorldSpaceCameraPos - i.worldPos);

            d.tangentSpaceViewDir = mul(d.TBNMatrix, d.worldSpaceViewDir);
             d.texcoord0 = i.texcoord0;
             d.texcoord1 = i.texcoord1;
             d.texcoord2 = i.texcoord2;
             d.texcoord3 = i.texcoord3;
             d.isFrontFace = facing;
            #if _HDRP
            #else
            #endif
             d.screenPos = i.screenPos;
             d.screenUV = (i.screenPos.xy / i.screenPos.w);
            return d;
         }

#endif
#if (SHADERPASS == SHADERPASS_LIGHT_TRANSPORT)
   float unity_OneOverOutputBoost;
   float unity_MaxOutputValue;

   CBUFFER_START(UnityMetaPass)
   bool4 unity_MetaVertexControl;
   bool4 unity_MetaFragmentControl;
   CBUFFER_END

   VertexToPixel Vert(VertexData inputMesh)
   {
       VertexToPixel output;
       ZERO_INITIALIZE(VertexToPixel, output);
       UNITY_SETUP_INSTANCE_ID(inputMesh);
       UNITY_TRANSFER_INSTANCE_ID(inputMesh, output);
       UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);
       float2 uv = float2(0.0, 0.0);

       if (unity_MetaVertexControl.x)
       {
           uv = inputMesh.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
       }
       else if (unity_MetaVertexControl.y)
       {
           uv = inputMesh.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
       }
       output.pos = float4(uv * 2.0 - 1.0, inputMesh.vertex.z > 0 ? 1.0e-4 : 0.0, 1.0);

       output.worldPos = TransformObjectToWorld(inputMesh.vertex.xyz).xyz;
       output.worldNormal = TransformObjectToWorldNormal(inputMesh.normal);
       output.worldTangent = float4(1.0, 0.0, 0.0, 0.0);

       output.texcoord0 = inputMesh.texcoord0;
       output.texcoord1 = inputMesh.texcoord1;
       output.texcoord2 = inputMesh.texcoord2;
        output.texcoord3 = inputMesh.texcoord3;
       return output;
   }
#else

   #if (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
      #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariablesMatrixDefsHDCamera.hlsl"

      void MotionVectorPositionZBias(VertexToPixel input)
      {
      #if UNITY_REVERSED_Z
          input.pos.z -= unity_MotionVectorsParams.z * input.pos.w;
      #else
          input.pos.z += unity_MotionVectorsParams.z * input.pos.w;
      #endif
      }

   #endif

   VertexToPixel Vert(VertexData input)
   {
       VertexToPixel output;
       ZERO_INITIALIZE(VertexToPixel, output);

       UNITY_SETUP_INSTANCE_ID(input);
       UNITY_TRANSFER_INSTANCE_ID(input, output);
       UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

       #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
         VertexData previousMesh = input;
       #endif

       ChainModifyVertex(input, output, _Time);
       float3 positionRWS = TransformObjectToWorld(input.vertex.xyz);
       float3 normalWS = TransformObjectToWorldNormal(input.normal);
       float4 tangentWS = float4(TransformObjectToWorldDir(input.tangent.xyz), input.tangent.w);
       output.worldPos = GetAbsolutePositionWS(positionRWS);
       output.pos = TransformWorldToHClip(positionRWS);
       output.worldNormal = normalWS;
       output.worldTangent = tangentWS;
       output.texcoord0 = input.texcoord0;
       output.texcoord1 = input.texcoord1;
       output.texcoord2 = input.texcoord2;
        output.texcoord3 = input.texcoord3;
        output.screenPos = ComputeScreenPos(output.pos, _ProjectionParams.x);
       #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))

          #if !defined(TESSELLATION_ON)
            MotionVectorPositionZBias(output);
          #endif

          output.motionVectorCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(positionRWS.xyz, 1.0));
          bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
          if (forceNoMotion)
          {
              output.previousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
          }
          else
          {
            bool hasDeformation = unity_MotionVectorsParams.x > 0.0; 

            float3 effectivePositionOS = (hasDeformation ? previousMesh.previousPositionOS : previousMesh.vertex.xyz);
            #if defined(_ADD_PRECOMPUTED_VELOCITY)
               effectivePositionOS -= input.precomputedVelocity;
            #endif

            previousMesh.vertex = float4(effectivePositionOS, 1);
            VertexToPixel dummy = (VertexToPixel)0;
            ChainModifyVertex(previousMesh, dummy, _LastTimeParameters);
            float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.vertex.xyz);

            #ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
            if (_TransparentCameraOnlyMotionVectors > 0)
            {
               previousPositionRWS = positionRWS.xyz;
            }
            #endif 

            output.previousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
         }
       #endif 
       return output;
   }
#endif
               #if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
                  #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
               #endif

                FragInputs BuildFragInputs(VertexToPixel input)
                {
                    UNITY_SETUP_INSTANCE_ID(input);
                    FragInputs output;
                    ZERO_INITIALIZE(FragInputs, output);
                    output.tangentToWorld = k_identity3x3;
                    output.positionSS = input.pos;       
                    output.positionRWS = GetCameraRelativePositionWS(input.worldPos);
                    output.tangentToWorld = BuildTangentToWorld(input.worldTangent, input.worldNormal);
                    output.texCoord0 = input.texcoord0;
                    output.texCoord1 = input.texcoord1;
                    output.texCoord2 = input.texcoord2;
                    return output;
                }
               void BuildSurfaceData(FragInputs fragInputs, inout Surface surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
               {
                   ZERO_INITIALIZE(SurfaceData, surfaceData);
                   surfaceData.specularOcclusion = 1.0;
                   surfaceData.baseColor =                 surfaceDescription.Albedo;
                   surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;
                   surfaceData.ambientOcclusion =          surfaceDescription.Occlusion;
                   surfaceData.specularOcclusion =         surfaceDescription.SpecularOcclusion;
                   surfaceData.metallic =                  surfaceDescription.Metallic;
                   surfaceData.subsurfaceMask =            surfaceDescription.SubsurfaceMask;
                   surfaceData.thickness =                 surfaceDescription.Thickness;
                   surfaceData.diffusionProfileHash =      asuint(surfaceDescription.DiffusionProfileHash);
                   #if _USESPECULAR
                      surfaceData.specularColor =             surfaceDescription.Specular;
                   #endif
                   surfaceData.coatMask =                  surfaceDescription.CoatMask;
                   surfaceData.anisotropy =                surfaceDescription.Anisotropy;
                   surfaceData.iridescenceMask =           surfaceDescription.IridescenceMask;
                   surfaceData.iridescenceThickness =      surfaceDescription.IridescenceThickness;
                   #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                        if (_EnableSSRefraction)
                        {
                            surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                            surfaceDescription.Alpha = 1.0;
                        }
                        else
                        {
                            surfaceData.ior = surfaceDescription.ior;
                            surfaceData.transmittanceColor = surfaceDescription.transmittanceColor;
                            surfaceData.atDistance = surfaceDescription.atDistance;
                            surfaceData.transmittanceMask = surfaceDescription.transmittanceMask;
                            surfaceDescription.Alpha = 1.0;
                        }
                    #else
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                    #endif
                    surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
                    #ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
                    #endif
                    #ifdef _MATERIAL_FEATURE_TRANSMISSION
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
                    #endif
                    #ifdef _MATERIAL_FEATURE_ANISOTROPY
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                        surfaceData.normalWS = float3(0, 1, 0);
                    #endif
                    #ifdef _MATERIAL_FEATURE_IRIDESCENCE
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
                    #endif
                    #ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
                    #endif
                    #if defined(_MATERIAL_FEATURE_CLEAR_COAT) || _CLEARCOAT
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
                    #endif
                    #if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                        surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
                    #endif
                   #if !_WORLDSPACENORMAL
                      surfaceData.normalWS = mul(surfaceDescription.Normal, fragInputs.tangentToWorld);
                   #else
                      surfaceData.normalWS = surfaceDescription.Normal;
                   #endif

                   surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                   surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    
                    #if HAVE_DECALS
                        if (_EnableDecals)
                        {
                            float alpha = 1.0;
                            alpha = surfaceDescription.Alpha;
                            DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], alpha);
                            ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
                        }
                    #endif
                    bentNormalWS = surfaceData.normalWS;
                    surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);
                    #ifdef DEBUG_DISPLAY
                        if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
                        {
                            surfaceData.metallic = 0;
                        }
                        ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
                    #endif
                    #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                    #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                        surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                    #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                        surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                    #endif
                    #if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
                        surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                    #endif
               }
               void GetSurfaceAndBuiltinData(VertexToPixel m2ps, FragInputs fragInputs, float3 V, inout PositionInputs posInput,
                     out SurfaceData surfaceData, out BuiltinData builtinData, inout Surface l, inout ShaderData d
                     #if NEED_FACING
                        , bool facing
                     #endif
                  )
               {
                 d = CreateShaderData(m2ps
                    #if NEED_FACING
                       , facing
                    #endif
                 );

                 l = (Surface)0;

                 l.Albedo = half3(0.5, 0.5, 0.5);
                 l.Normal = float3(0,0,1);
                 l.Occlusion = 1;
                 l.Alpha = 1;
                 l.SpecularOcclusion = 1;

                 #if !defined(SHADER_STAGE_RAY_TRACING) && defined(_DEPTHOFFSET_ON)
                    l.outputDepth = d.clipPos.z;
                 #endif

                 ChainSurfaceFunction(l, d);

                 #if !defined(SHADER_STAGE_RAY_TRACING) && defined(_DEPTHOFFSET_ON)
                 #endif

                 #if _UNLIT
                     l.Normal = half3(0,0,1);
                     l.Occlusion = 1;
                     l.Metallic = 0;
                     l.Specular = 0;
                 #endif

                 surfaceData.geomNormalWS = d.worldSpaceNormal;
                 surfaceData.tangentWS = d.worldSpaceTangent;
                 fragInputs.tangentToWorld = d.TBNMatrix;

                 float3 bentNormalWS;
                 BuildSurfaceData(fragInputs, l, V, posInput, surfaceData, bentNormalWS);
                 InitBuiltinData(posInput, l.Alpha, bentNormalWS, -d.worldSpaceNormal, fragInputs.texCoord1, fragInputs.texCoord2, builtinData);
                 builtinData.emissiveColor = l.Emission;

                 #if defined(_OVERRIDE_BAKEDGI)
                    builtinData.bakeDiffuseLighting = l.DiffuseGI;
                    builtinData.backBakeDiffuseLighting = l.BackDiffuseGI;
                    builtinData.emissiveColor += l.SpecularGI;
                 #endif

                 #if defined(_OVERRIDE_SHADOWMASK)
                    builtinData.shadowMask0 = l.ShadowMask.x;
                    builtinData.shadowMask1 = l.ShadowMask.y;
                    builtinData.shadowMask2 = l.ShadowMask.z;
                    builtinData.shadowMask3 = l.ShadowMask.w;
                 #endif

                 #if defined(UNITY_VIRTUAL_TEXTURING)
                    builtinData.vtPackedFeedback = surfaceData.VTPackedFeedback;
                 #endif

                  #if (SHADERPASS == SHADERPASS_DISTORTION)
                     builtinData.distortion = surfaceData.Distortion;
                     builtinData.distortionBlur = surfaceData.DistortionBlur;
                  #endif

                  #ifndef SHADER_UNLIT
                    PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                  #else
                    ApplyDebugToBuiltinData(builtinData);
                  #endif
                  RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
               }

            void Frag(  VertexToPixel v2f,
                        OUTPUT_GBUFFER(outGBuffer)
                        #ifdef _DEPTHOFFSET_ON
                        , out float outputDepth : SV_Depth
                        #endif
                        #if NEED_FACING
                           , bool facing : SV_IsFrontFace
                        #endif
                        )
            {
                  UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(v2f);
                  FragInputs input = BuildFragInputs(v2f);
                  PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
                  float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

                  SurfaceData surfaceData;
                  BuiltinData builtinData;
                  Surface l;
                  ShaderData d;
                  GetSurfaceAndBuiltinData(v2f, input, V, posInput, surfaceData, builtinData, l, d
                    #if NEED_FACING
                      , facing
                    #endif
                  );
                  ENCODE_INTO_GBUFFER(surfaceData, builtinData, posInput.positionSS, outGBuffer);

                  #ifdef _DEPTHOFFSET_ON
                        outputDepth = l.outputDepth;
                  #endif
            }

            ENDHLSL
        }
              Pass
        {
            Name "ShadowCaster"
            Tags { "LightMode" = "ShadowCaster" }
            Cull Back
            ZWrite On
            ColorMask 0
            ZClip [_ZClip]
                Cull [_CullMode]
            HLSLPROGRAM
            #pragma target 4.5
            #pragma only_renderers d3d11 playstation xboxone vulkan metal switch
            #pragma multi_compile_instancing
            #pragma instancing_options renderinglayer
            #pragma multi_compile _ DOTS_INSTANCING_ON
            #pragma multi_compile _ WRITE_DECAL_BUFFER
            #define _ENABLE_FOG_ON_TRANSPARENT 1
            #define SHADERPASS SHADERPASS_SHADOWS
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #define _PASSSHADOW 1
    #pragma shader_feature_local _ALPHATEST_ON

    #pragma shader_feature_local_fragment _NORMALMAP_TANGENT_SPACE
    #pragma shader_feature_local _NORMALMAP
    #pragma shader_feature_local_fragment _MASKMAP
    #pragma shader_feature_local_fragment _EMISSIVE_COLOR_MAP
    #pragma shader_feature_local_fragment _ANISOTROPYMAP
    #pragma shader_feature_local_fragment _DETAIL_MAP
    #pragma shader_feature_local_fragment _SUBSURFACE_MASK_MAP
    #pragma shader_feature_local_fragment _THICKNESSMAP
    #pragma shader_feature_local_fragment _IRIDESCENCE_THICKNESSMAP
    #pragma shader_feature_local_fragment _SPECULARCOLORMAP
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_TRANSMISSION
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_ANISOTROPY
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_CLEAR_COAT
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_IRIDESCENCE
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_SPECULAR_COLOR
    #pragma shader_feature_local_fragment _ENABLESPECULAROCCLUSION
    #pragma shader_feature_local_fragment _ _SPECULAR_OCCLUSION_NONE _SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP

    #ifdef _ENABLESPECULAROCCLUSION
        #define _SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP
    #endif
        #pragma shader_feature_local_fragment _OBSTRUCTION_CURVE
        #pragma shader_feature_local_fragment _DISSOLVEMASK
        #pragma shader_feature_local_fragment _ZONING
        #pragma shader_feature_local_fragment _REPLACEMENT
        #pragma shader_feature_local_fragment _PLAYERINDEPENDENT
   #define _HDRP 1
#define _USINGTEXCOORD1 1
#define _USINGTEXCOORD2 1
#define NEED_FACING 1

               #pragma vertex Vert
   #pragma fragment Frag
      #define UNITY_DECLARE_TEX2D(name) TEXTURE2D(name); SAMPLER(sampler##name);
      #define UNITY_DECLARE_TEX2D_NOSAMPLER(name) TEXTURE2D(name);
      #define UNITY_DECLARE_TEX2DARRAY(name) TEXTURE2D_ARRAY(name); SAMPLER(sampler##name);
      #define UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(tex) TEXTURE2D_ARRAY(tex);

      #define UNITY_SAMPLE_TEX2DARRAY(tex,coord)            SAMPLE_TEXTURE2D_ARRAY(tex, sampler##tex, coord.xy, coord.z)
      #define UNITY_SAMPLE_TEX2DARRAY_LOD(tex,coord,lod)    SAMPLE_TEXTURE2D_ARRAY_LOD(tex, sampler##tex, coord.xy, coord.z, lod)
      #define UNITY_SAMPLE_TEX2D(tex, coord)                SAMPLE_TEXTURE2D(tex, sampler##tex, coord)
      #define UNITY_SAMPLE_TEX2D_SAMPLER(tex, samp, coord)  SAMPLE_TEXTURE2D(tex, sampler##samp, coord)

      #define UNITY_SAMPLE_TEX2D_LOD(tex,coord, lod)   SAMPLE_TEXTURE2D_LOD(tex, sampler_##tex, coord, lod)
      #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord, lod) SAMPLE_TEXTURE2D_LOD (tex, sampler##samplertex,coord, lod)

      #if defined(UNITY_COMPILER_HLSL)
         #define UNITY_INITIALIZE_OUTPUT(type,name) name = (type)0;
      #else
         #define UNITY_INITIALIZE_OUTPUT(type,name)
      #endif

      #define sampler2D_float sampler2D
      #define sampler2D_half sampler2D

      #undef WorldNormalVector
      #define WorldNormalVector(data, normal) mul(normal, data.TBNMatrix)

      #define UnityObjectToWorldNormal(normal) mul(GetObjectToWorldMatrix(), normal)
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
#if UNITY_VERSION >= UNITY_2021_3_31
       #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl" 
#else
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" 
#endif    
            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT 
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
            #define RAYTRACING_SHADER_GRAPH_LOW
            #endif
            #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
               #define OUTPUT_SPLIT_LIGHTING
            #endif

            #define HAVE_RECURSIVE_RENDERING

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
               #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                  #define WRITE_NORMAL_BUFFER
               #endif
            #endif

            #ifndef DEBUG_DISPLAY
               #if !defined(_SURFACE_TYPE_TRANSPARENT) && defined(_ALPHATEST)
                  #if SHADERPASS == SHADERPASS_FORWARD
                  #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                  #elif SHADERPASS == SHADERPASS_GBUFFER
                  #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                  #endif
               #endif
            #endif
            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
               #define _DEFERRED_CAPABLE_MATERIAL
            #endif
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
               #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
            CBUFFER_START(UnityPerMaterial)
               float _UseShadowThreshold;
               float _BlendMode;
               float _EnableBlendModePreserveSpecularLighting;
               float _RayTracing;
               float _RefractionModel;
    float4 _BaseColorMap_ST;
    float4 _DetailMap_ST;
    float4 _EmissiveColorMap_ST;

    float _UVBase;
    half4 _Color;
    half4 _BaseColor; 
    half _Cutoff; 
    half _Mode;
    float _CullMode;
    float _CullModeForward;
    half _Metallic;
    half3 _EmissionColor;
    half _UVSec;

    float3 _EmissiveColor;
    float _AlbedoAffectEmissive;
    float _EmissiveExposureWeight;
    float _MetallicRemapMin;
    float _MetallicRemapMax;
    float _Smoothness;
    float _SmoothnessRemapMin;
    float _SmoothnessRemapMax;
    float _AlphaRemapMin;
    float _AlphaRemapMax;
    float _AORemapMin;
    float _AORemapMax;
    float _NormalScale;
    float _DetailAlbedoScale;
    float _DetailNormalScale;
    float _DetailSmoothnessScale;
    float _Anisotropy;
    float _DiffusionProfileHash;
    float _SubsurfaceMask;
    float _Thickness;
    float4 _ThicknessRemap;
    float _IridescenceThickness;
    float4 _IridescenceThicknessRemap;
    float _IridescenceMask;
    float _CoatMask;
    float4 _SpecularColor;
    float _EnergyConservingSpecularColor;
    int _MaterialID;

    float _LinkDetailsWithBase;
    float4 _UVMappingMask;
    float4 _UVDetailsMappingMask;

    float4 _UVMappingMaskEmissive;

    float _AlphaCutoff;
    float _SyncCullMode;

    float _IsReplacementShader;
    float _TriggerMode;
    float _RaycastMode;
    float _IsExempt;
    float _isReferenceMaterial;
    float _InteractionMode;

    float _tDirection = 0;
    float _numOfPlayersInside = 0;
    float _tValue = 0;
    float _id = 0;
    half _TextureVisibility;
    half _AngleStrength;
    float _Obstruction;
    float _UVs;
    float4 _ObstructionCurve_TexelSize;      
    float _DissolveMaskEnabled;
    float4 _DissolveMask_TexelSize;
    float4 _DissolveTex_TexelSize;
    half4 _DissolveColor;
    float _DissolveColorSaturation;
    float _DissolveEmission;
    float _DissolveEmissionBooster;
    float _hasClippedShadows;
    float _ConeStrength;
    float _ConeObstructionDestroyRadius;
    float _CylinderStrength;
    float _CylinderObstructionDestroyRadius;
    float _CircleStrength;
    float _CircleObstructionDestroyRadius;
    float _CurveStrength;
    float _CurveObstructionDestroyRadius;
    float _IntrinsicDissolveStrength;
    float _DissolveFallOff;
    float _AffectedAreaPlayerBasedObstruction;
    float _PreviewMode;
    float _PreviewIndicatorLineThickness;
    float _AnimationEnabled;
    float _AnimationSpeed;
    float _DefaultEffectRadius;
    float _EnableDefaultEffectRadius;
    float _TransitionDuration;
    float _TexturedEmissionEdge;
    float _TexturedEmissionEdgeStrength;
    float _IsometricExclusion;
    float _IsometricExclusionDistance;
    float _IsometricExclusionGradientLength;
    float _Floor;
    float _FloorMode;
    float _FloorY;
    float _FloorYTextureGradientLength;
    float _PlayerPosYOffset;
    float _AffectedAreaFloor;
    float _Ceiling;
    float _CeilingMode;
    float _CeilingBlendMode;
    float _CeilingY;
    float _CeilingPlayerYOffset;
    float _CeilingYGradientLength;
    float _Zoning;
    float _ZoningMode;
    float _ZoningEdgeGradientLength;
    float _IsZoningRevealable;
    float _SyncZonesWithFloorY;
    float _SyncZonesFloorYOffset;

    half _UseCustomTime;

    half _CrossSectionEnabled;
    half4 _CrossSectionColor;
    half _CrossSectionTextureEnabled;
    float _CrossSectionTextureScale;
    half _CrossSectionUVScaledByDistance;
    half _DissolveMethod;
    half _DissolveTexSpace;
            CBUFFER_END
               #ifdef SCENEPICKINGPASS
               float4 _SelectionID;
               #endif
               #ifdef SCENESELECTIONPASS
               int _ObjectId;
               int _PassValue;
               #endif
            struct VertexToPixel
            {
               float4 pos : SV_POSITION;
               float3 worldPos : TEXCOORD0;
               float3 worldNormal : TEXCOORD1;
               float4 worldTangent : TEXCOORD2;
               float4 texcoord0 : TEXCOORD3;
               float4 texcoord1 : TEXCOORD4;
               float4 texcoord2 : TEXCOORD5;
                float4 texcoord3 : TEXCOORD6;
                float4 screenPos : TEXCOORD7;
               #if UNITY_ANY_INSTANCING_ENABLED
                  UNITY_VERTEX_INPUT_INSTANCE_ID
               #endif 

               #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
                  float4 previousPositionCS : TEXCOORD16; 
                  float4 motionVectorCS : TEXCOORD17;
               #endif

               UNITY_VERTEX_OUTPUT_STEREO
            }; 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
            struct Surface
            {
               half3 Albedo;
               half Height;
               half3 Normal;
               half Smoothness;
               half3 Emission;
               half Metallic;
               half3 Specular;
               half Occlusion;
               half SpecularPower; 
               half Alpha;
               float outputDepth; 
               half SpecularOcclusion;
               half SubsurfaceMask;
               half Thickness;
               half CoatMask;
               half CoatSmoothness;
               half Anisotropy;
               half IridescenceMask;
               half IridescenceThickness;
               int DiffusionProfileHash;
               float SpecularAAThreshold;
               float SpecularAAScreenSpaceVariance;
               float3 DiffuseGI;
               float3 BackDiffuseGI;
               float3 SpecularGI;
               float ior;
               float3 transmittanceColor;
               float atDistance;
               float transmittanceMask;
               float4 ShadowMask;
               float NormalAlpha;
               float MAOSAlpha;
            };
            struct Blackboard
            {
                float blackboardDummyData;
            };
            struct ShaderData
            {
               float4 clipPos; 
               float3 localSpacePosition;
               float3 localSpaceNormal;
               float3 localSpaceTangent;
               float3 worldSpacePosition;
               float3 worldSpaceNormal;
               float3 worldSpaceTangent;
               float tangentSign;

               float3 worldSpaceViewDir;
               float3 tangentSpaceViewDir;

               float4 texcoord0;
               float4 texcoord1;
               float4 texcoord2;
               float4 texcoord3;

               float2 screenUV;
               float4 screenPos;

               float4 vertexColor;
               bool isFrontFace;

               float4 extraV2F0;
               float4 extraV2F1;
               float4 extraV2F2;
               float4 extraV2F3;
               float4 extraV2F4;
               float4 extraV2F5;
               float4 extraV2F6;
               float4 extraV2F7;

               float3x3 TBNMatrix;
               Blackboard blackboard;
            };

            struct VertexData
            {
               #if SHADER_TARGET > 30
               #endif
               float4 vertex : POSITION;
               float3 normal : NORMAL;
               float4 tangent : TANGENT;
               float4 texcoord0 : TEXCOORD0;
               #if _URP && (_USINGTEXCOORD1 || _PASSMETA || _PASSFORWARD || _PASSGBUFFER)
                  float4 texcoord1 : TEXCOORD1;
               #endif

               #if _URP && (_USINGTEXCOORD2 || _PASSMETA || ((_PASSFORWARD || _PASSGBUFFER) && defined(DYNAMICLIGHTMAP_ON)))
                  float4 texcoord2 : TEXCOORD2;
               #endif

               #if _STANDARD && (_USINGTEXCOORD1 || (_PASSMETA || ((_PASSFORWARD || _PASSGBUFFER || _PASSFORWARDADD) && LIGHTMAP_ON)))
                  float4 texcoord1 : TEXCOORD1;
               #endif
               #if _STANDARD && (_USINGTEXCOORD2 || (_PASSMETA || ((_PASSFORWARD || _PASSGBUFFER) && DYNAMICLIGHTMAP_ON)))
                  float4 texcoord2 : TEXCOORD2;
               #endif
               #if _HDRP
                  float4 texcoord1 : TEXCOORD1;
                  float4 texcoord2 : TEXCOORD2;
               #endif
                float4 texcoord3 : TEXCOORD3;
               #if _PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR))
                  float3 previousPositionOS : TEXCOORD4; 
                  #if defined (_ADD_PRECOMPUTED_VELOCITY)
                     float3 precomputedVelocity    : TEXCOORD5; 
                  #endif
               #endif

               UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct TessVertex 
            {
               float4 vertex : INTERNALTESSPOS;
               float3 normal : NORMAL;
               float4 tangent : TANGENT;
               float4 texcoord0 : TEXCOORD0;
               float4 texcoord1 : TEXCOORD1;
               float4 texcoord2 : TEXCOORD2;
                float4 texcoord3 : TEXCOORD3;
               #if _PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR))
                  float3 previousPositionOS : TEXCOORD13; 
                  #if defined (_ADD_PRECOMPUTED_VELOCITY)
                     float3 precomputedVelocity : TEXCOORD14;
                  #endif
               #endif

               UNITY_VERTEX_INPUT_INSTANCE_ID
               UNITY_VERTEX_OUTPUT_STEREO
            };

            struct ExtraV2F
            {
               float4 extraV2F0;
               float4 extraV2F1;
               float4 extraV2F2;
               float4 extraV2F3;
               float4 extraV2F4;
               float4 extraV2F5;
               float4 extraV2F6;
               float4 extraV2F7;
               Blackboard blackboard;
               float4 time;
            };
            float3 WorldToTangentSpace(ShaderData d, float3 normal)
            {
               return mul(d.TBNMatrix, normal);
            }

            float3 TangentToWorldSpace(ShaderData d, float3 normal)
            {
               return mul(normal, d.TBNMatrix);
            }
            #if _STANDARD
               float3 TransformWorldToObject(float3 p) { return mul(unity_WorldToObject, float4(p, 1)); };
               float3 TransformObjectToWorld(float3 p) { return mul(unity_ObjectToWorld, float4(p, 1)); };
               float4 TransformWorldToObject(float4 p) { return mul(unity_WorldToObject, p); };
               float4 TransformObjectToWorld(float4 p) { return mul(unity_ObjectToWorld, p); };
               float4x4 GetWorldToObjectMatrix() { return unity_WorldToObject; }
               float4x4 GetObjectToWorldMatrix() { return unity_ObjectToWorld; }
               #if (defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (SHADER_TARGET_SURFACE_ANALYSIS && !SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))
                 #define UNITY_SAMPLE_TEX2D_LOD(tex,coord, lod) tex.SampleLevel (sampler##tex,coord, lod)
                 #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord, lod) tex.SampleLevel (sampler##samplertex,coord, lod)
              #else
                 #define UNITY_SAMPLE_TEX2D_LOD(tex,coord,lod) tex2D (tex,coord,0,lod)
                 #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord,lod) tex2D (tex,coord,0,lod)
              #endif

               #undef GetWorldToObjectMatrix()

               #define GetWorldToObjectMatrix()   unity_WorldToObject
            #endif

            float3 GetCameraWorldPosition()
            {
               #if _HDRP
                  return GetCameraRelativePositionWS(_WorldSpaceCameraPos);
               #else
                  return _WorldSpaceCameraPos;
               #endif
            }

            #if _GRABPASSUSED
               #if _STANDARD
                  TEXTURE2D(%GRABTEXTURE%);
                  SAMPLER(sampler_%GRABTEXTURE%);
               #endif

               half3 GetSceneColor(float2 uv)
               {
                  #if _STANDARD
                     return SAMPLE_TEXTURE2D(%GRABTEXTURE%, sampler_%GRABTEXTURE%, uv).rgb;
                  #else
                     return SHADERGRAPH_SAMPLE_SCENE_COLOR(uv);
                  #endif
               }
            #endif
            #if _STANDARD
               UNITY_DECLARE_DEPTH_TEXTURE(_CameraDepthTexture);
               float GetSceneDepth(float2 uv) { return SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, uv); }
               float GetLinear01Depth(float2 uv) { return Linear01Depth(GetSceneDepth(uv)); }
               float GetLinearEyeDepth(float2 uv) { return LinearEyeDepth(GetSceneDepth(uv)); } 
            #else
               float GetSceneDepth(float2 uv) { return SHADERGRAPH_SAMPLE_SCENE_DEPTH(uv); }
               float GetLinear01Depth(float2 uv) { return Linear01Depth(GetSceneDepth(uv), _ZBufferParams); }
               float GetLinearEyeDepth(float2 uv) { return LinearEyeDepth(GetSceneDepth(uv), _ZBufferParams); } 
            #endif

            float3 GetWorldPositionFromDepthBuffer(float2 uv, float3 worldSpaceViewDir)
            {
               float eye = GetLinearEyeDepth(uv);
               float3 camView = mul((float3x3)GetObjectToWorldMatrix(), transpose(mul(GetWorldToObjectMatrix(), UNITY_MATRIX_I_V)) [2].xyz);

               float dt = dot(worldSpaceViewDir, camView);
               float3 div = worldSpaceViewDir/dt;
               float3 wpos = (eye * div) + GetCameraWorldPosition();
               return wpos;
            }

            #if _HDRP
            float3 ObjectToWorldSpacePosition(float3 pos)
            {
               return GetAbsolutePositionWS(TransformObjectToWorld(pos));
            }
            #else
            float3 ObjectToWorldSpacePosition(float3 pos)
            {
               return TransformObjectToWorld(pos);
            }
            #endif

            #if _STANDARD
               UNITY_DECLARE_SCREENSPACE_TEXTURE(_CameraDepthNormalsTexture);
               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  float4 depthNorms = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_CameraDepthNormalsTexture, uv);
                  float3 norms = DecodeViewNormalStereo(depthNorms);
                  norms = mul((float3x3)GetWorldToViewMatrix(), norms) * 0.5 + 0.5;
                  return norms;
               }
            #elif _HDRP && !_DECALSHADER
               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  NormalData nd;
                  DecodeFromNormalBuffer(_ScreenSize.xy * uv, nd);
                  return nd.normalWS;
               }
            #elif _URP
               #if (SHADER_LIBRARY_VERSION_MAJOR >= 10)
                  #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareNormalsTexture.hlsl"
               #endif

               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  #if (SHADER_LIBRARY_VERSION_MAJOR >= 10)
                     return SampleSceneNormals(uv);
                  #else
                     float3 wpos = GetWorldPositionFromDepthBuffer(uv, worldSpaceViewDir);
                     return normalize(-cross(ddx(wpos), ddy(wpos))) * 0.5 + 0.5;
                  #endif

                }
             #endif

             #if _HDRP

               half3 UnpackNormalmapRGorAG(half4 packednormal)
               {
                  packednormal.x *= packednormal.w;

                  half3 normal;
                  normal.xy = packednormal.xy * 2 - 1;
                  normal.z = sqrt(1 - saturate(dot(normal.xy, normal.xy)));
                  return normal;
               }
               half3 UnpackNormal(half4 packednormal)
               {
                  #if defined(UNITY_NO_DXT5nm)
                     return packednormal.xyz * 2 - 1;
                  #else
                     return UnpackNormalmapRGorAG(packednormal);
                  #endif
               }
            #endif
            #if _HDRP || _URP

               half3 UnpackScaleNormal(half4 packednormal, half scale)
               {
                 #ifndef UNITY_NO_DXT5nm
                   packednormal.x *= packednormal.w;
                 #endif
                   half3 normal;
                   normal.xy = (packednormal.xy * 2 - 1) * scale;
                   normal.z = sqrt(1 - saturate(dot(normal.xy, normal.xy)));
                   return normal;
               }	

             #endif
            void GetSun(out float3 lightDir, out float3 color)
            {
               lightDir = float3(0.5, 0.5, 0);
               color = 1;
               #if _HDRP
                  if (_DirectionalLightCount > 0)
                  {
                     DirectionalLightData light = _DirectionalLightDatas[0];
                     lightDir = -light.forward.xyz;
                     color = light.color;
                  }
               #elif _STANDARD
			         lightDir = normalize(_WorldSpaceLightPos0.xyz);
                  color = _LightColor0.rgb;
               #elif _URP
	               Light light = GetMainLight();
	               lightDir = light.direction;
	               color = light.color;
               #endif
            }
    sampler2D _EmissiveColorMap;
    sampler2D _BaseColorMap;
    sampler2D _MaskMap;
    sampler2D _NormalMap;
    sampler2D _NormalMapOS;
    sampler2D _DetailMap;
    sampler2D _TangentMap;
    sampler2D _TangentMapOS;
    sampler2D _AnisotropyMap;
    sampler2D _SubsurfaceMaskMap;
    sampler2D _TransmissionMaskMap;
    sampler2D _ThicknessMap;
    sampler2D _IridescenceThicknessMap;
    sampler2D _IridescenceMaskMap;
    sampler2D _SpecularColorMap;

    sampler2D _CoatMaskMap;

    float3 DecodeNormal (float4 sample, float scale) {
        #if defined(UNITY_NO_DXT5nm)
            return UnpackNormalRGB(sample, scale);
        #else
            return UnpackNormalmapRGorAG(sample, scale);
        #endif
    }

	void Ext_SurfaceFunction0 (inout Surface o, ShaderData d)
	{
        float2 uvBase = (_UVMappingMask.x * d.texcoord0 +
                        _UVMappingMask.y * d.texcoord1 +
                        _UVMappingMask.z * d.texcoord2 +
                        _UVMappingMask.w * d.texcoord3).xy;

        float2 uvDetails =  (_UVDetailsMappingMask.x * d.texcoord0 +
                            _UVDetailsMappingMask.y * d.texcoord1 +
                            _UVDetailsMappingMask.z * d.texcoord2 +
                            _UVDetailsMappingMask.w * d.texcoord3).xy;
        float4 texcoords;
        texcoords.xy = uvBase * _BaseColorMap_ST.xy + _BaseColorMap_ST.zw; 

        texcoords.zw = uvDetails * _DetailMap_ST.xy + _DetailMap_ST.zw;

        if (_LinkDetailsWithBase > 0.0)
        {
            texcoords.zw = texcoords.zw  * _BaseColorMap_ST.xy + _BaseColorMap_ST.zw;

        }

            float3 detailNormalTS = float3(0.0, 0.0, 0.0);
            float detailMask = 0.0;
            #ifdef _DETAIL_MAP
                detailMask = 1.0;
                #ifdef _MASKMAP
                    detailMask = tex2D(_MaskMap, texcoords.xy).b;
                #endif
                float2 detailAlbedoAndSmoothness = tex2D(_DetailMap, texcoords.zw).rb;
                float detailAlbedo = detailAlbedoAndSmoothness.r * 2.0 - 1.0;
                float detailSmoothness = detailAlbedoAndSmoothness.g * 2.0 - 1.0;
                real4 packedNormal = tex2D(_DetailMap, texcoords.zw).rgba;
                detailNormalTS = UnpackNormalAG(packedNormal, _DetailNormalScale);
            #endif
            float4 color = tex2D(_BaseColorMap, texcoords.xy).rgba  * _Color.rgba;
            o.Albedo = color.rgb; 
            float alpha = color.a;
            alpha = lerp(_AlphaRemapMin, _AlphaRemapMax, alpha);
            o.Alpha = alpha;
            #ifdef _DETAIL_MAP
                float albedoDetailSpeed = saturate(abs(detailAlbedo) * _DetailAlbedoScale);
                float3 baseColorOverlay = lerp(sqrt(o.Albedo), (detailAlbedo < 0.0) ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0), albedoDetailSpeed * albedoDetailSpeed);
                baseColorOverlay *= baseColorOverlay;
                o.Albedo = lerp(o.Albedo, saturate(baseColorOverlay), detailMask);
            #endif

            #ifdef _NORMALMAP
                float3 normalTS;
                #ifdef _NORMALMAP_TANGENT_SPACE
                    normalTS = DecodeNormal(tex2D(_NormalMap, texcoords.xy), _NormalScale);
                #else
                    #ifdef SURFACE_GRADIENT
                        float3 normalOS = tex2D(_NormalMapOS, texcoords.xy).xyz * 2.0 - 1.0;
                        normalTS = SurfaceGradientFromPerturbedNormal(d.worldSpaceNormal, TransformObjectToWorldNormal(normalOS));
                    #else
                        float3 normalOS = UnpackNormalRGB(tex2D(_NormalMapOS, texcoords.xy), 1.0);
                        float3 bitangent = d.tangentSign * cross(d.worldSpaceNormal.xyz, d.worldSpaceTangent.xyz);
                        half3x3 tangentToWorld = half3x3(d.worldSpaceTangent.xyz, bitangent.xyz, d.worldSpaceNormal.xyz);
                        normalTS = TransformObjectToTangent(normalOS, tangentToWorld);
                    #endif
                #endif

                #ifdef _DETAIL_MAP
                    #ifdef SURFACE_GRADIENT
                    normalTS += detailNormalTS * detailMask;
                    #else
                    normalTS = lerp(normalTS, BlendNormalRNM(normalTS, normalize(detailNormalTS)), detailMask); 
                    #endif
                #endif
                o.Normal = normalTS;

            #endif

            #if defined(_MASKMAP)
                o.Smoothness = tex2D(_MaskMap, texcoords.xy).a;
                o.Smoothness = lerp(_SmoothnessRemapMin, _SmoothnessRemapMax, o.Smoothness);
            #else
                o.Smoothness = _Smoothness;
            #endif
            #ifdef _DETAIL_MAP
                float smoothnessDetailSpeed = saturate(abs(detailSmoothness) * _DetailSmoothnessScale);
                float smoothnessOverlay = lerp(o.Smoothness, (detailSmoothness < 0.0) ? 0.0 : 1.0, smoothnessDetailSpeed);
                o.Smoothness = lerp(o.Smoothness, saturate(smoothnessOverlay), detailMask);
            #endif
            #ifdef _MASKMAP
                o.Metallic = tex2D(_MaskMap, texcoords.xy).r;
                o.Metallic = lerp(_MetallicRemapMin, _MetallicRemapMax, o.Metallic);
                o.Occlusion = tex2D(_MaskMap, texcoords.xy).g;
                o.Occlusion = lerp(_AORemapMin, _AORemapMax, o.Occlusion);
            #else
                o.Metallic = _Metallic;
                o.Occlusion = 1.0;
            #endif

            #if defined(_SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP)
            #elif  defined(_MASKMAP) && !defined(_SPECULAR_OCCLUSION_NONE)
                float3 V = normalize(d.worldSpaceViewDir);
                o.SpecularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(d.worldSpaceNormal, V)), o.Occlusion, PerceptualSmoothnessToRoughness(o.Smoothness));
            #endif

            o.DiffusionProfileHash = asuint(_DiffusionProfileHash);
            o.SubsurfaceMask = _SubsurfaceMask;
            #ifdef _SUBSURFACE_MASK_MAP
                o.SubsurfaceMask *= tex2D(_SubsurfaceMaskMap, texcoords.xy).r;
            #endif
            #ifdef _THICKNESSMAP
                o.Thickness = tex2D(_ThicknessMap, texcoords.xy).r;
                o.Thickness = _ThicknessRemap.x + _ThicknessRemap.y * surfaceData.thickness;
            #else
                o.Thickness = _Thickness;
            #endif
            #ifdef _ANISOTROPYMAP
                o.Anisotropy = tex2D(_AnisotropyMap, texcoords.xy).r;
            #else
                o.Anisotropy = 1.0;
            #endif
                o.Anisotropy *= _Anisotropy;
                o.Specular = _SpecularColor.rgb;
            #ifdef _SPECULARCOLORMAP
                o.Specular *= tex2D(_SpecularColorMap, texcoords.xy).rgb;
            #endif
            #ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                o.Albedo *= _EnergyConservingSpecularColor > 0.0 ? (1.0 - Max3(o.Specular.r, o.Specular.g, o.Specular.b)) : 1.0;
            #endif
            #ifdef _MATERIAL_FEATURE_CLEAR_COAT
                o.CoatMask = _CoatMask;
                o.CoatMask *= tex2D(_CoatMaskMap, texcoords.xy).r;
            #else
                o.CoatMask = 0.0;
            #endif
            #ifdef _MATERIAL_FEATURE_IRIDESCENCE
                #ifdef _IRIDESCENCE_THICKNESSMAP
                o.IridescenceThickness = tex2D(_IridescenceThicknessMap, texcoords.xy).r;
                o.IridescenceThickness = _IridescenceThicknessRemap.x + _IridescenceThicknessRemap.y * o.IridescenceThickness;
                #else
                o.IridescenceThickness = _IridescenceThickness;
                #endif
                o.IridescenceMask = _IridescenceMask;
                o.IridescenceMask *= tex2D(_IridescenceMaskMap, texcoords.xy).r;
            #else
                o.IridescenceThickness = 0.0;
                o.IridescenceMask = 0.0;
            #endif
            float3 emissiveColor = _EmissiveColor * lerp(float3(1.0, 1.0, 1.0), o.Albedo.rgb, _AlbedoAffectEmissive);
            #ifdef _EMISSIVE_COLOR_MAP                
                float2 uvEmission = _UVMappingMaskEmissive.x * d.texcoord0 +
                                    _UVMappingMaskEmissive.y * d.texcoord1 +
                                    _UVMappingMaskEmissive.z * d.texcoord2 +
                                    _UVMappingMaskEmissive.w * d.texcoord3;

                uvEmission = uvEmission * _EmissiveColorMap_ST.xy + _EmissiveColorMap_ST.zw;                     

                emissiveColor *= tex2D(_EmissiveColorMap, uvEmission).rgb;
            #endif
            o.Emission += emissiveColor;
            float currentExposureMultiplier = 0;
            #if SHADEROPTIONS_PRE_EXPOSITION
                currentExposureMultiplier =  LOAD_TEXTURE2D(_ExposureTexture, int2(0, 0)).x * _ProbeExposureScale;
            #else
                currentExposureMultiplier =  _ProbeExposureScale;
            #endif
            float InverseCurrentExposureMultiplier = 0;
            float exposure = currentExposureMultiplier;
            InverseCurrentExposureMultiplier =  rcp(exposure + (exposure == 0.0)); 
            float3 emissiveRcpExposure = o.Emission * InverseCurrentExposureMultiplier;
            o.Emission = lerp(emissiveRcpExposure, o.Emission, _EmissiveExposureWeight);
            #if defined(_ALPHATEST_ON)
                float alphaTex = tex2D(_BaseColorMap, texcoords.xy).a;
                alphaTex = lerp(_AlphaRemapMin, _AlphaRemapMax, alphaTex);
                float alphaValue = alphaTex * _BaseColor.a;
                float alphaCutoff = _AlphaCutoff;
                clip(alpha - alphaCutoff);
            #endif

	}
    float _ArrayLength = 0;
    #if (defined(SHADER_API_GLES) || defined(SHADER_API_GLES3)) 
        float4 _PlayersPosVectorArray[20];
        float _PlayersDataFloatArray[150];     
    #else
        float4 _PlayersPosVectorArray[100];
        float _PlayersDataFloatArray[500];  
    #endif
    #if _ZONING
        #if (defined(SHADER_API_GLES) || defined(SHADER_API_GLES3)) 
            float _ZDFA[500];
        #else
            float _ZDFA[1000];
        #endif
        float _ZonesDataCount;
    #endif

    float _STSCustomTime = 0;
    #if _REPLACEMENT        
        half4 _DissolveColorGlobal;
        float _DissolveColorSaturationGlobal;
        float _DissolveEmissionGlobal;
        float _DissolveEmissionBoosterGlobal;
        float _TextureVisibilityGlobal;
        float _ObstructionGlobal;
        float _AngleStrengthGlobal;
        float _ConeStrengthGlobal;
        float _ConeObstructionDestroyRadiusGlobal;
        float _CylinderStrengthGlobal;
        float _CylinderObstructionDestroyRadiusGlobal;
        float _CircleStrengthGlobal;
        float _CircleObstructionDestroyRadiusGlobal;
        float _CurveStrengthGlobal;
        float _CurveObstructionDestroyRadiusGlobal;
        float _DissolveFallOffGlobal;
        float _AffectedAreaPlayerBasedObstructionGlobal;
        float _IntrinsicDissolveStrengthGlobal;
        float _PreviewModeGlobal;
        float _UVsGlobal;
        float _hasClippedShadowsGlobal;
        float _FloorGlobal;
        float _FloorModeGlobal;
        float _FloorYGlobal;
        float _PlayerPosYOffsetGlobal;
        float _FloorYTextureGradientLengthGlobal;
        float _AffectedAreaFloorGlobal;
        float _AnimationEnabledGlobal;
        float _AnimationSpeedGlobal;
        float _DefaultEffectRadiusGlobal;
        float _EnableDefaultEffectRadiusGlobal;
        float _TransitionDurationGlobal;        
        float _TexturedEmissionEdgeGlobal;
        float _TexturedEmissionEdgeStrengthGlobal;
        float _IsometricExclusionGlobal;
        float _IsometricExclusionDistanceGlobal;
        float _IsometricExclusionGradientLengthGlobal;
        float _CeilingGlobal;
        float _CeilingModeGlobal;
        float _CeilingBlendModeGlobal;
        float _CeilingYGlobal;
        float _CeilingPlayerYOffsetGlobal;
        float _CeilingYGradientLengthGlobal;
        float _ZoningGlobal;
        float _ZoningModeGlobal;
        float _ZoningEdgeGradientLengthGlobal;
        float _IsZoningRevealableGlobal;
        float _SyncZonesWithFloorYGlobal;
        float _SyncZonesFloorYOffsetGlobal;
        float4 _ObstructionCurveGlobal_TexelSize;
        float4 _DissolveMaskGlobal_TexelSize;
        float _DissolveMaskEnabledGlobal;
        float _PreviewIndicatorLineThicknessGlobal;
        half _UseCustomTimeGlobal;

        half _CrossSectionEnabledGlobal;
        half4 _CrossSectionColorGlobal;
        half _CrossSectionTextureEnabledGlobal;
        float _CrossSectionTextureScaleGlobal;
        half _CrossSectionUVScaledByDistanceGlobal;

        half _DissolveMethodGlobal;
        half _DissolveTexSpaceGlobal;

        float4 _DissolveTexGlobal_TexelSize;
    #endif
    #if _REPLACEMENT
        sampler2D _DissolveTexGlobal;
    #else
        sampler2D _DissolveTex;
    #endif
    #if _REPLACEMENT
        sampler2D _DissolveMaskGlobal;
    #else
        sampler2D _DissolveMask;
    #endif
    #if _REPLACEMENT
        sampler2D _ObstructionCurveGlobal;
    #else
        sampler2D _ObstructionCurve;
    #endif

    #if _REPLACEMENT
        sampler2D _CrossSectionTextureGlobal;
    #else
        sampler2D _CrossSectionTexture;
    #endif
#ifdef USE_UNITY_TEXTURE_2D_TYPE
#undef USE_UNITY_TEXTURE_2D_TYPE
#endif

#include "Packages/com.shadercrew.seethroughshader.core/Scripts/Shaders/xxSharedSTSDependencies/SeeThroughShaderFunction.hlsl"
	void Ext_SurfaceFunction1 (inout Surface o, ShaderData d)
	{
        half3 albedo;
        half3 emission;
        float alphaForClipping;
#ifdef USE_UNITY_TEXTURE_2D_TYPE
#undef USE_UNITY_TEXTURE_2D_TYPE
#endif
#if _REPLACEMENT
    DoSeeThroughShading( o.Albedo, o.Normal, d.worldSpacePosition, d.worldSpaceNormal, d.screenPos,
                        _numOfPlayersInside, _tDirection, _tValue, _id,
                        _TriggerMode, _RaycastMode,
                        _IsExempt,

                        _DissolveMethodGlobal, _DissolveTexSpaceGlobal,

                        _DissolveColorGlobal, _DissolveColorSaturationGlobal, _UVsGlobal,
                        _DissolveEmissionGlobal, _DissolveEmissionBoosterGlobal, _TexturedEmissionEdgeGlobal, _TexturedEmissionEdgeStrengthGlobal,
                        _hasClippedShadowsGlobal,

                        _ObstructionGlobal,
                        _AngleStrengthGlobal,
                        _ConeStrengthGlobal, _ConeObstructionDestroyRadiusGlobal,
                        _CylinderStrengthGlobal, _CylinderObstructionDestroyRadiusGlobal,
                        _CircleStrengthGlobal, _CircleObstructionDestroyRadiusGlobal,
                        _CurveStrengthGlobal, _CurveObstructionDestroyRadiusGlobal,
                        _DissolveFallOffGlobal,
                        _DissolveMaskEnabledGlobal,
                        _AffectedAreaPlayerBasedObstructionGlobal,
                        _IntrinsicDissolveStrengthGlobal,
                        _DefaultEffectRadiusGlobal, _EnableDefaultEffectRadiusGlobal,

                        _IsometricExclusionGlobal, _IsometricExclusionDistanceGlobal, _IsometricExclusionGradientLengthGlobal,
                        _CeilingGlobal, _CeilingModeGlobal, _CeilingBlendModeGlobal, _CeilingYGlobal, _CeilingPlayerYOffsetGlobal, _CeilingYGradientLengthGlobal,
                        _FloorGlobal, _FloorModeGlobal, _FloorYGlobal, _PlayerPosYOffsetGlobal, _FloorYTextureGradientLengthGlobal, _AffectedAreaFloorGlobal,

                        _AnimationEnabledGlobal, _AnimationSpeedGlobal,
                        _TransitionDurationGlobal,

                        _UseCustomTimeGlobal,

                        _ZoningGlobal, _ZoningModeGlobal, _IsZoningRevealableGlobal, _ZoningEdgeGradientLengthGlobal,
                        _SyncZonesWithFloorYGlobal, _SyncZonesFloorYOffsetGlobal,

                        _PreviewModeGlobal,
                        _PreviewIndicatorLineThicknessGlobal,

                        _DissolveTexGlobal,
                        _DissolveMaskGlobal,
                        _ObstructionCurveGlobal,

                        _DissolveTexGlobal_TexelSize,
                        _DissolveMaskGlobal_TexelSize,
                        _ObstructionCurveGlobal_TexelSize,

                        albedo, emission, alphaForClipping);
#else 
    DoSeeThroughShading( o.Albedo, o.Normal, d.worldSpacePosition, d.worldSpaceNormal, d.screenPos,

                        _numOfPlayersInside, _tDirection, _tValue, _id,
                        _TriggerMode, _RaycastMode,
                        _IsExempt,

                        _DissolveMethod, _DissolveTexSpace,

                        _DissolveColor, _DissolveColorSaturation, _UVs,
                        _DissolveEmission, _DissolveEmissionBooster, _TexturedEmissionEdge, _TexturedEmissionEdgeStrength,
                        _hasClippedShadows,

                        _Obstruction,
                        _AngleStrength,
                        _ConeStrength, _ConeObstructionDestroyRadius,
                        _CylinderStrength, _CylinderObstructionDestroyRadius,
                        _CircleStrength, _CircleObstructionDestroyRadius,
                        _CurveStrength, _CurveObstructionDestroyRadius,
                        _DissolveFallOff,
                        _DissolveMaskEnabled,
                        _AffectedAreaPlayerBasedObstruction,
                        _IntrinsicDissolveStrength,
                        _DefaultEffectRadius, _EnableDefaultEffectRadius,

                        _IsometricExclusion, _IsometricExclusionDistance, _IsometricExclusionGradientLength,
                        _Ceiling, _CeilingMode, _CeilingBlendMode, _CeilingY, _CeilingPlayerYOffset, _CeilingYGradientLength,
                        _Floor, _FloorMode, _FloorY, _PlayerPosYOffset, _FloorYTextureGradientLength, _AffectedAreaFloor,

                        _AnimationEnabled, _AnimationSpeed,
                        _TransitionDuration,

                        _UseCustomTime,

                        _Zoning, _ZoningMode , _IsZoningRevealable, _ZoningEdgeGradientLength,
                        _SyncZonesWithFloorY, _SyncZonesFloorYOffset,

                        _PreviewMode,
                        _PreviewIndicatorLineThickness,                            

                        _DissolveTex,
                        _DissolveMask,
                        _ObstructionCurve,

                        _DissolveTex_TexelSize,
                        _DissolveMask_TexelSize,
                        _ObstructionCurve_TexelSize,

                        albedo, emission, alphaForClipping);
#endif 
        o.Albedo = albedo;
        o.Emission += emission;   

	}
    void Ext_FinalColorForward1 (Surface o, ShaderData d, inout half4 color)
    {
        #if _REPLACEMENT   
            DoCrossSection(_CrossSectionEnabledGlobal,
                        _CrossSectionColorGlobal,
                        _CrossSectionTextureEnabledGlobal,
                        _CrossSectionTextureGlobal,
                        _CrossSectionTextureScaleGlobal,
                        _CrossSectionUVScaledByDistanceGlobal,
                        d.isFrontFace,
                        d.screenPos,
                        color);
        #else 
            DoCrossSection(_CrossSectionEnabled,
                        _CrossSectionColor,
                        _CrossSectionTextureEnabled,
                        _CrossSectionTexture,
                        _CrossSectionTextureScale,
                        _CrossSectionUVScaledByDistance,
                        d.isFrontFace,
                        d.screenPos,
                        color);
        #endif
    }
            void ChainSurfaceFunction(inout Surface l, inout ShaderData d)
            {
                  Ext_SurfaceFunction0(l, d);
                  Ext_SurfaceFunction1(l, d);
            }

#if !_DECALSHADER

            void ChainModifyVertex(inout VertexData v, inout VertexToPixel v2p, float4 time)
            {
                 ExtraV2F d;
                 ZERO_INITIALIZE(ExtraV2F, d);
                 ZERO_INITIALIZE(Blackboard, d.blackboard);
                 d.time = time;
            }

            void ChainModifyTessellatedVertex(inout VertexData v, inout VertexToPixel v2p)
            {
               ExtraV2F d;
               ZERO_INITIALIZE(ExtraV2F, d);
               ZERO_INITIALIZE(Blackboard, d.blackboard);
            }

            void ChainFinalColorForward(inout Surface l, inout ShaderData d, inout half4 color)
            {
                  Ext_FinalColorForward1(l, d, color);
            }

            void ChainFinalGBufferStandard(inout Surface s, inout ShaderData d, inout half4 GBuffer0, inout half4 GBuffer1, inout half4 GBuffer2, inout half4 outEmission, inout half4 outShadowMask)
            {
            }
#endif
#if _DECALSHADER

        ShaderData CreateShaderData(SurfaceDescriptionInputs IN)
        {
            ShaderData d = (ShaderData)0;
            d.TBNMatrix = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
            d.worldSpaceNormal = IN.WorldSpaceNormal;
            d.worldSpaceTangent = IN.WorldSpaceTangent;

            d.worldSpacePosition = IN.WorldSpacePosition;
            d.texcoord0 = IN.uv0.xyxy;
            d.screenPos = IN.ScreenPosition;

            d.worldSpaceViewDir = normalize(_WorldSpaceCameraPos - d.worldSpacePosition);

            d.tangentSpaceViewDir = mul(d.TBNMatrix, d.worldSpaceViewDir);
            #if _HDRP
            #else
            #endif
             d.screenUV = (IN.ScreenPosition.xy / max(0.01, IN.ScreenPosition.w));
            return d;
        }
#else

         ShaderData CreateShaderData(VertexToPixel i
                  #if NEED_FACING
                     , bool facing
                  #endif
         )
         {
            ShaderData d = (ShaderData)0;
            d.clipPos = i.pos;
            d.worldSpacePosition = i.worldPos;

            d.worldSpaceNormal = normalize(i.worldNormal);
            d.worldSpaceTangent.xyz = normalize(i.worldTangent.xyz);

            d.tangentSign = i.worldTangent.w * unity_WorldTransformParams.w;
            float3 bitangent = cross(d.worldSpaceTangent.xyz, d.worldSpaceNormal) * d.tangentSign;
            d.TBNMatrix = float3x3(d.worldSpaceTangent, -bitangent, d.worldSpaceNormal);
            d.worldSpaceViewDir = normalize(_WorldSpaceCameraPos - i.worldPos);

            d.tangentSpaceViewDir = mul(d.TBNMatrix, d.worldSpaceViewDir);
             d.texcoord0 = i.texcoord0;
             d.texcoord1 = i.texcoord1;
             d.texcoord2 = i.texcoord2;
             d.texcoord3 = i.texcoord3;
             d.isFrontFace = facing;
            #if _HDRP
            #else
            #endif
             d.screenPos = i.screenPos;
             d.screenUV = (i.screenPos.xy / i.screenPos.w);
            return d;
         }

#endif
#if (SHADERPASS == SHADERPASS_LIGHT_TRANSPORT)
   float unity_OneOverOutputBoost;
   float unity_MaxOutputValue;

   CBUFFER_START(UnityMetaPass)
   bool4 unity_MetaVertexControl;
   bool4 unity_MetaFragmentControl;
   CBUFFER_END

   VertexToPixel Vert(VertexData inputMesh)
   {
       VertexToPixel output;
       ZERO_INITIALIZE(VertexToPixel, output);
       UNITY_SETUP_INSTANCE_ID(inputMesh);
       UNITY_TRANSFER_INSTANCE_ID(inputMesh, output);
       UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);
       float2 uv = float2(0.0, 0.0);

       if (unity_MetaVertexControl.x)
       {
           uv = inputMesh.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
       }
       else if (unity_MetaVertexControl.y)
       {
           uv = inputMesh.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
       }
       output.pos = float4(uv * 2.0 - 1.0, inputMesh.vertex.z > 0 ? 1.0e-4 : 0.0, 1.0);

       output.worldPos = TransformObjectToWorld(inputMesh.vertex.xyz).xyz;
       output.worldNormal = TransformObjectToWorldNormal(inputMesh.normal);
       output.worldTangent = float4(1.0, 0.0, 0.0, 0.0);

       output.texcoord0 = inputMesh.texcoord0;
       output.texcoord1 = inputMesh.texcoord1;
       output.texcoord2 = inputMesh.texcoord2;
        output.texcoord3 = inputMesh.texcoord3;
       return output;
   }
#else

   #if (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
      #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariablesMatrixDefsHDCamera.hlsl"

      void MotionVectorPositionZBias(VertexToPixel input)
      {
      #if UNITY_REVERSED_Z
          input.pos.z -= unity_MotionVectorsParams.z * input.pos.w;
      #else
          input.pos.z += unity_MotionVectorsParams.z * input.pos.w;
      #endif
      }

   #endif

   VertexToPixel Vert(VertexData input)
   {
       VertexToPixel output;
       ZERO_INITIALIZE(VertexToPixel, output);

       UNITY_SETUP_INSTANCE_ID(input);
       UNITY_TRANSFER_INSTANCE_ID(input, output);
       UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

       #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
         VertexData previousMesh = input;
       #endif

       ChainModifyVertex(input, output, _Time);
       float3 positionRWS = TransformObjectToWorld(input.vertex.xyz);
       float3 normalWS = TransformObjectToWorldNormal(input.normal);
       float4 tangentWS = float4(TransformObjectToWorldDir(input.tangent.xyz), input.tangent.w);
       output.worldPos = GetAbsolutePositionWS(positionRWS);
       output.pos = TransformWorldToHClip(positionRWS);
       output.worldNormal = normalWS;
       output.worldTangent = tangentWS;
       output.texcoord0 = input.texcoord0;
       output.texcoord1 = input.texcoord1;
       output.texcoord2 = input.texcoord2;
        output.texcoord3 = input.texcoord3;
        output.screenPos = ComputeScreenPos(output.pos, _ProjectionParams.x);
       #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))

          #if !defined(TESSELLATION_ON)
            MotionVectorPositionZBias(output);
          #endif

          output.motionVectorCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(positionRWS.xyz, 1.0));
          bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
          if (forceNoMotion)
          {
              output.previousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
          }
          else
          {
            bool hasDeformation = unity_MotionVectorsParams.x > 0.0; 

            float3 effectivePositionOS = (hasDeformation ? previousMesh.previousPositionOS : previousMesh.vertex.xyz);
            #if defined(_ADD_PRECOMPUTED_VELOCITY)
               effectivePositionOS -= input.precomputedVelocity;
            #endif

            previousMesh.vertex = float4(effectivePositionOS, 1);
            VertexToPixel dummy = (VertexToPixel)0;
            ChainModifyVertex(previousMesh, dummy, _LastTimeParameters);
            float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.vertex.xyz);

            #ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
            if (_TransparentCameraOnlyMotionVectors > 0)
            {
               previousPositionRWS = positionRWS.xyz;
            }
            #endif 

            output.previousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
         }
       #endif 
       return output;
   }
#endif
               #if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
                  #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
               #endif

                FragInputs BuildFragInputs(VertexToPixel input)
                {
                    UNITY_SETUP_INSTANCE_ID(input);
                    FragInputs output;
                    ZERO_INITIALIZE(FragInputs, output);
                    output.tangentToWorld = k_identity3x3;
                    output.positionSS = input.pos;       
                    output.positionRWS = GetCameraRelativePositionWS(input.worldPos);
                    output.tangentToWorld = BuildTangentToWorld(input.worldTangent, input.worldNormal);
                    output.texCoord0 = input.texcoord0;
                    output.texCoord1 = input.texcoord1;
                    output.texCoord2 = input.texcoord2;
                    return output;
                }
               void BuildSurfaceData(FragInputs fragInputs, inout Surface surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
               {
                   ZERO_INITIALIZE(SurfaceData, surfaceData);
                   surfaceData.specularOcclusion = 1.0;
                   surfaceData.baseColor =                 surfaceDescription.Albedo;
                   surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;
                   surfaceData.ambientOcclusion =          surfaceDescription.Occlusion;
                   surfaceData.specularOcclusion =         surfaceDescription.SpecularOcclusion;
                   surfaceData.metallic =                  surfaceDescription.Metallic;
                   surfaceData.subsurfaceMask =            surfaceDescription.SubsurfaceMask;
                   surfaceData.thickness =                 surfaceDescription.Thickness;
                   surfaceData.diffusionProfileHash =      asuint(surfaceDescription.DiffusionProfileHash);
                   #if _USESPECULAR
                      surfaceData.specularColor =             surfaceDescription.Specular;
                   #endif
                   surfaceData.coatMask =                  surfaceDescription.CoatMask;
                   surfaceData.anisotropy =                surfaceDescription.Anisotropy;
                   surfaceData.iridescenceMask =           surfaceDescription.IridescenceMask;
                   surfaceData.iridescenceThickness =      surfaceDescription.IridescenceThickness;
                   #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                        if (_EnableSSRefraction)
                        {
                            surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                            surfaceDescription.Alpha = 1.0;
                        }
                        else
                        {
                            surfaceData.ior = surfaceDescription.ior;
                            surfaceData.transmittanceColor = surfaceDescription.transmittanceColor;
                            surfaceData.atDistance = surfaceDescription.atDistance;
                            surfaceData.transmittanceMask = surfaceDescription.transmittanceMask;
                            surfaceDescription.Alpha = 1.0;
                        }
                    #else
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                    #endif
                    surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
                    #ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
                    #endif
                    #ifdef _MATERIAL_FEATURE_TRANSMISSION
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
                    #endif
                    #ifdef _MATERIAL_FEATURE_ANISOTROPY
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                        surfaceData.normalWS = float3(0, 1, 0);
                    #endif
                    #ifdef _MATERIAL_FEATURE_IRIDESCENCE
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
                    #endif
                    #ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
                    #endif
                    #if defined(_MATERIAL_FEATURE_CLEAR_COAT) || _CLEARCOAT
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
                    #endif
                    #if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                        surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
                    #endif
                   #if !_WORLDSPACENORMAL
                      surfaceData.normalWS = mul(surfaceDescription.Normal, fragInputs.tangentToWorld);
                   #else
                      surfaceData.normalWS = surfaceDescription.Normal;
                   #endif

                   surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                   surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    
                    #if HAVE_DECALS
                        if (_EnableDecals)
                        {
                            float alpha = 1.0;
                            alpha = surfaceDescription.Alpha;
                            DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], alpha);
                            ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
                        }
                    #endif
                    bentNormalWS = surfaceData.normalWS;
                    surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);
                    #ifdef DEBUG_DISPLAY
                        if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
                        {
                            surfaceData.metallic = 0;
                        }
                        ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
                    #endif
                    #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                    #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                        surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                    #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                        surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                    #endif
                    #if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
                        surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                    #endif
               }
               void GetSurfaceAndBuiltinData(VertexToPixel m2ps, FragInputs fragInputs, float3 V, inout PositionInputs posInput,
                     out SurfaceData surfaceData, out BuiltinData builtinData, inout Surface l, inout ShaderData d
                     #if NEED_FACING
                        , bool facing
                     #endif
                  )
               {
                 d = CreateShaderData(m2ps
                    #if NEED_FACING
                       , facing
                    #endif
                 );

                 l = (Surface)0;

                 l.Albedo = half3(0.5, 0.5, 0.5);
                 l.Normal = float3(0,0,1);
                 l.Occlusion = 1;
                 l.Alpha = 1;
                 l.SpecularOcclusion = 1;

                 #if !defined(SHADER_STAGE_RAY_TRACING) && defined(_DEPTHOFFSET_ON)
                    l.outputDepth = d.clipPos.z;
                 #endif

                 ChainSurfaceFunction(l, d);

                 #if !defined(SHADER_STAGE_RAY_TRACING) && defined(_DEPTHOFFSET_ON)
                 #endif

                 #if _UNLIT
                     l.Normal = half3(0,0,1);
                     l.Occlusion = 1;
                     l.Metallic = 0;
                     l.Specular = 0;
                 #endif

                 surfaceData.geomNormalWS = d.worldSpaceNormal;
                 surfaceData.tangentWS = d.worldSpaceTangent;
                 fragInputs.tangentToWorld = d.TBNMatrix;

                 float3 bentNormalWS;
                 BuildSurfaceData(fragInputs, l, V, posInput, surfaceData, bentNormalWS);
                 InitBuiltinData(posInput, l.Alpha, bentNormalWS, -d.worldSpaceNormal, fragInputs.texCoord1, fragInputs.texCoord2, builtinData);
                 builtinData.emissiveColor = l.Emission;

                 #if defined(_OVERRIDE_BAKEDGI)
                    builtinData.bakeDiffuseLighting = l.DiffuseGI;
                    builtinData.backBakeDiffuseLighting = l.BackDiffuseGI;
                    builtinData.emissiveColor += l.SpecularGI;
                 #endif

                 #if defined(_OVERRIDE_SHADOWMASK)
                    builtinData.shadowMask0 = l.ShadowMask.x;
                    builtinData.shadowMask1 = l.ShadowMask.y;
                    builtinData.shadowMask2 = l.ShadowMask.z;
                    builtinData.shadowMask3 = l.ShadowMask.w;
                 #endif

                 #if defined(UNITY_VIRTUAL_TEXTURING)
                    builtinData.vtPackedFeedback = surfaceData.VTPackedFeedback;
                 #endif

                  #if (SHADERPASS == SHADERPASS_DISTORTION)
                     builtinData.distortion = surfaceData.Distortion;
                     builtinData.distortionBlur = surfaceData.DistortionBlur;
                  #endif

                  #ifndef SHADER_UNLIT
                    PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                  #else
                    ApplyDebugToBuiltinData(builtinData);
                  #endif
                  RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
               }
            #if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
               #define SV_TARGET_DECAL SV_Target2
            #elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
               #define SV_TARGET_DECAL SV_Target1
            #else
               #define SV_TARGET_DECAL SV_Target0
            #endif
              void Frag(  VertexToPixel v2f
                          #if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
                          , out float4 outColor : SV_Target0
                          #else
                          #ifdef WRITE_MSAA_DEPTH
                            , out float4 depthColor : SV_Target0
                                #ifdef WRITE_NORMAL_BUFFER
                                , out float4 outNormalBuffer : SV_Target1
                                #endif
                            #else
                                #ifdef WRITE_NORMAL_BUFFER
                                , out float4 outNormalBuffer : SV_Target0
                                #endif
                            #endif
                            #if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
                            , out float4 outDecalBuffer : SV_TARGET_DECAL
                            #endif
                        #endif

                        #if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
                        , out float outputDepth : SV_Depth
                        #endif
                        #if NEED_FACING
                           , bool facing : SV_IsFrontFace
                        #endif
                      )
              {
                  UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(v2f);
                  FragInputs input = BuildFragInputs(v2f);
                  PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
                  float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);
                  SurfaceData surfaceData;
                  BuiltinData builtinData;
                  Surface l;
                  ShaderData d;
                  GetSurfaceAndBuiltinData(v2f, input, V, posInput, surfaceData, builtinData, l, d
               #if NEED_FACING
                  , facing
               #endif
               );
                  #ifdef _DEPTHOFFSET_ON
                     outputDepth = l.outputDepth;
                  #endif

                  #ifdef SCENESELECTIONPASS
                      outColor = float4(_ObjectId, _PassValue, 1.0, 1.0);
                  #elif defined(SCENEPICKINGPASS)
                      outColor = _SelectionID;
                  #else
                     #ifdef WRITE_MSAA_DEPTH
                       depthColor = v2f.pos.z;

                       #ifdef _ALPHATOMASK_ON
                          depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
                       #endif 
                     #endif 
                  #endif

                   #if defined(WRITE_NORMAL_BUFFER)
                      EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
                   #endif

                   #if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
                      DecalPrepassData decalPrepassData;
                      decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
                      decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
                      EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
                   #endif
              }
            ENDHLSL
        }
              Pass
        {
            Name "DepthOnly"
            Tags { "LightMode" = "DepthOnly" }
            Cull Back
            ZWrite On
        Stencil
        {
           WriteMask [_StencilWriteMaskDepth]
           Ref [_StencilRefDepth]
           Comp Always
           Pass Replace
        }
                Cull [_CullMode]
            HLSLPROGRAM
            #pragma target 4.5
            #pragma only_renderers d3d11 playstation xboxone vulkan metal switch
            #pragma multi_compile_instancing
            #pragma multi_compile _ DOTS_INSTANCING_ON
            #pragma instancing_options renderinglayer
            #pragma multi_compile _ WRITE_DECAL_BUFFER
            #define _ENABLE_FOG_ON_TRANSPARENT 1
            #define SHADERPASS SHADERPASS_DEPTH_ONLY
            #pragma multi_compile _ WRITE_NORMAL_BUFFER
            #pragma multi_compile _ WRITE_MSAA_DEPTH
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #define _PASSDEPTH 1
    #pragma shader_feature_local _ALPHATEST_ON

    #pragma shader_feature_local_fragment _NORMALMAP_TANGENT_SPACE
    #pragma shader_feature_local _NORMALMAP
    #pragma shader_feature_local_fragment _MASKMAP
    #pragma shader_feature_local_fragment _EMISSIVE_COLOR_MAP
    #pragma shader_feature_local_fragment _ANISOTROPYMAP
    #pragma shader_feature_local_fragment _DETAIL_MAP
    #pragma shader_feature_local_fragment _SUBSURFACE_MASK_MAP
    #pragma shader_feature_local_fragment _THICKNESSMAP
    #pragma shader_feature_local_fragment _IRIDESCENCE_THICKNESSMAP
    #pragma shader_feature_local_fragment _SPECULARCOLORMAP
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_TRANSMISSION
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_ANISOTROPY
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_CLEAR_COAT
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_IRIDESCENCE
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_SPECULAR_COLOR
    #pragma shader_feature_local_fragment _ENABLESPECULAROCCLUSION
    #pragma shader_feature_local_fragment _ _SPECULAR_OCCLUSION_NONE _SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP

    #ifdef _ENABLESPECULAROCCLUSION
        #define _SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP
    #endif
        #pragma shader_feature_local_fragment _OBSTRUCTION_CURVE
        #pragma shader_feature_local_fragment _DISSOLVEMASK
        #pragma shader_feature_local_fragment _ZONING
        #pragma shader_feature_local_fragment _REPLACEMENT
        #pragma shader_feature_local_fragment _PLAYERINDEPENDENT
   #define _HDRP 1
#define _USINGTEXCOORD1 1
#define _USINGTEXCOORD2 1
#define NEED_FACING 1

               #pragma vertex Vert
   #pragma fragment Frag
      #define UNITY_DECLARE_TEX2D(name) TEXTURE2D(name); SAMPLER(sampler##name);
      #define UNITY_DECLARE_TEX2D_NOSAMPLER(name) TEXTURE2D(name);
      #define UNITY_DECLARE_TEX2DARRAY(name) TEXTURE2D_ARRAY(name); SAMPLER(sampler##name);
      #define UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(tex) TEXTURE2D_ARRAY(tex);

      #define UNITY_SAMPLE_TEX2DARRAY(tex,coord)            SAMPLE_TEXTURE2D_ARRAY(tex, sampler##tex, coord.xy, coord.z)
      #define UNITY_SAMPLE_TEX2DARRAY_LOD(tex,coord,lod)    SAMPLE_TEXTURE2D_ARRAY_LOD(tex, sampler##tex, coord.xy, coord.z, lod)
      #define UNITY_SAMPLE_TEX2D(tex, coord)                SAMPLE_TEXTURE2D(tex, sampler##tex, coord)
      #define UNITY_SAMPLE_TEX2D_SAMPLER(tex, samp, coord)  SAMPLE_TEXTURE2D(tex, sampler##samp, coord)

      #define UNITY_SAMPLE_TEX2D_LOD(tex,coord, lod)   SAMPLE_TEXTURE2D_LOD(tex, sampler_##tex, coord, lod)
      #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord, lod) SAMPLE_TEXTURE2D_LOD (tex, sampler##samplertex,coord, lod)

      #if defined(UNITY_COMPILER_HLSL)
         #define UNITY_INITIALIZE_OUTPUT(type,name) name = (type)0;
      #else
         #define UNITY_INITIALIZE_OUTPUT(type,name)
      #endif

      #define sampler2D_float sampler2D
      #define sampler2D_half sampler2D

      #undef WorldNormalVector
      #define WorldNormalVector(data, normal) mul(normal, data.TBNMatrix)

      #define UnityObjectToWorldNormal(normal) mul(GetObjectToWorldMatrix(), normal)
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
#if UNITY_VERSION >= UNITY_2021_3_31
       #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl" 
#else
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" 
#endif    
            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT 
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
            #define RAYTRACING_SHADER_GRAPH_LOW
            #endif
            #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
               #define OUTPUT_SPLIT_LIGHTING
            #endif

            #define HAVE_RECURSIVE_RENDERING

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
               #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                  #define WRITE_NORMAL_BUFFER
               #endif
            #endif

            #ifndef DEBUG_DISPLAY
               #if !defined(_SURFACE_TYPE_TRANSPARENT) && defined(_ALPHATEST)
                  #if SHADERPASS == SHADERPASS_FORWARD
                  #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                  #elif SHADERPASS == SHADERPASS_GBUFFER
                  #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                  #endif
               #endif
            #endif
            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
               #define _DEFERRED_CAPABLE_MATERIAL
            #endif
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
               #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
            CBUFFER_START(UnityPerMaterial)
               float _UseShadowThreshold;
               float _BlendMode;
               float _EnableBlendModePreserveSpecularLighting;
               float _RayTracing;
               float _RefractionModel;
    float4 _BaseColorMap_ST;
    float4 _DetailMap_ST;
    float4 _EmissiveColorMap_ST;

    float _UVBase;
    half4 _Color;
    half4 _BaseColor; 
    half _Cutoff; 
    half _Mode;
    float _CullMode;
    float _CullModeForward;
    half _Metallic;
    half3 _EmissionColor;
    half _UVSec;

    float3 _EmissiveColor;
    float _AlbedoAffectEmissive;
    float _EmissiveExposureWeight;
    float _MetallicRemapMin;
    float _MetallicRemapMax;
    float _Smoothness;
    float _SmoothnessRemapMin;
    float _SmoothnessRemapMax;
    float _AlphaRemapMin;
    float _AlphaRemapMax;
    float _AORemapMin;
    float _AORemapMax;
    float _NormalScale;
    float _DetailAlbedoScale;
    float _DetailNormalScale;
    float _DetailSmoothnessScale;
    float _Anisotropy;
    float _DiffusionProfileHash;
    float _SubsurfaceMask;
    float _Thickness;
    float4 _ThicknessRemap;
    float _IridescenceThickness;
    float4 _IridescenceThicknessRemap;
    float _IridescenceMask;
    float _CoatMask;
    float4 _SpecularColor;
    float _EnergyConservingSpecularColor;
    int _MaterialID;

    float _LinkDetailsWithBase;
    float4 _UVMappingMask;
    float4 _UVDetailsMappingMask;

    float4 _UVMappingMaskEmissive;

    float _AlphaCutoff;
    float _SyncCullMode;

    float _IsReplacementShader;
    float _TriggerMode;
    float _RaycastMode;
    float _IsExempt;
    float _isReferenceMaterial;
    float _InteractionMode;

    float _tDirection = 0;
    float _numOfPlayersInside = 0;
    float _tValue = 0;
    float _id = 0;
    half _TextureVisibility;
    half _AngleStrength;
    float _Obstruction;
    float _UVs;
    float4 _ObstructionCurve_TexelSize;      
    float _DissolveMaskEnabled;
    float4 _DissolveMask_TexelSize;
    float4 _DissolveTex_TexelSize;
    half4 _DissolveColor;
    float _DissolveColorSaturation;
    float _DissolveEmission;
    float _DissolveEmissionBooster;
    float _hasClippedShadows;
    float _ConeStrength;
    float _ConeObstructionDestroyRadius;
    float _CylinderStrength;
    float _CylinderObstructionDestroyRadius;
    float _CircleStrength;
    float _CircleObstructionDestroyRadius;
    float _CurveStrength;
    float _CurveObstructionDestroyRadius;
    float _IntrinsicDissolveStrength;
    float _DissolveFallOff;
    float _AffectedAreaPlayerBasedObstruction;
    float _PreviewMode;
    float _PreviewIndicatorLineThickness;
    float _AnimationEnabled;
    float _AnimationSpeed;
    float _DefaultEffectRadius;
    float _EnableDefaultEffectRadius;
    float _TransitionDuration;
    float _TexturedEmissionEdge;
    float _TexturedEmissionEdgeStrength;
    float _IsometricExclusion;
    float _IsometricExclusionDistance;
    float _IsometricExclusionGradientLength;
    float _Floor;
    float _FloorMode;
    float _FloorY;
    float _FloorYTextureGradientLength;
    float _PlayerPosYOffset;
    float _AffectedAreaFloor;
    float _Ceiling;
    float _CeilingMode;
    float _CeilingBlendMode;
    float _CeilingY;
    float _CeilingPlayerYOffset;
    float _CeilingYGradientLength;
    float _Zoning;
    float _ZoningMode;
    float _ZoningEdgeGradientLength;
    float _IsZoningRevealable;
    float _SyncZonesWithFloorY;
    float _SyncZonesFloorYOffset;

    half _UseCustomTime;

    half _CrossSectionEnabled;
    half4 _CrossSectionColor;
    half _CrossSectionTextureEnabled;
    float _CrossSectionTextureScale;
    half _CrossSectionUVScaledByDistance;
    half _DissolveMethod;
    half _DissolveTexSpace;
            CBUFFER_END
               #ifdef SCENEPICKINGPASS
               float4 _SelectionID;
               #endif
               #ifdef SCENESELECTIONPASS
               int _ObjectId;
               int _PassValue;
               #endif
            struct VertexToPixel
            {
               float4 pos : SV_POSITION;
               float3 worldPos : TEXCOORD0;
               float3 worldNormal : TEXCOORD1;
               float4 worldTangent : TEXCOORD2;
               float4 texcoord0 : TEXCOORD3;
               float4 texcoord1 : TEXCOORD4;
               float4 texcoord2 : TEXCOORD5;
                float4 texcoord3 : TEXCOORD6;
                float4 screenPos : TEXCOORD7;
               #if UNITY_ANY_INSTANCING_ENABLED
                  UNITY_VERTEX_INPUT_INSTANCE_ID
               #endif 

               #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
                  float4 previousPositionCS : TEXCOORD16; 
                  float4 motionVectorCS : TEXCOORD17;
               #endif

               UNITY_VERTEX_OUTPUT_STEREO
            }; 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
            struct Surface
            {
               half3 Albedo;
               half Height;
               half3 Normal;
               half Smoothness;
               half3 Emission;
               half Metallic;
               half3 Specular;
               half Occlusion;
               half SpecularPower; 
               half Alpha;
               float outputDepth; 
               half SpecularOcclusion;
               half SubsurfaceMask;
               half Thickness;
               half CoatMask;
               half CoatSmoothness;
               half Anisotropy;
               half IridescenceMask;
               half IridescenceThickness;
               int DiffusionProfileHash;
               float SpecularAAThreshold;
               float SpecularAAScreenSpaceVariance;
               float3 DiffuseGI;
               float3 BackDiffuseGI;
               float3 SpecularGI;
               float ior;
               float3 transmittanceColor;
               float atDistance;
               float transmittanceMask;
               float4 ShadowMask;
               float NormalAlpha;
               float MAOSAlpha;
            };
            struct Blackboard
            {
                float blackboardDummyData;
            };
            struct ShaderData
            {
               float4 clipPos; 
               float3 localSpacePosition;
               float3 localSpaceNormal;
               float3 localSpaceTangent;
               float3 worldSpacePosition;
               float3 worldSpaceNormal;
               float3 worldSpaceTangent;
               float tangentSign;

               float3 worldSpaceViewDir;
               float3 tangentSpaceViewDir;

               float4 texcoord0;
               float4 texcoord1;
               float4 texcoord2;
               float4 texcoord3;

               float2 screenUV;
               float4 screenPos;

               float4 vertexColor;
               bool isFrontFace;

               float4 extraV2F0;
               float4 extraV2F1;
               float4 extraV2F2;
               float4 extraV2F3;
               float4 extraV2F4;
               float4 extraV2F5;
               float4 extraV2F6;
               float4 extraV2F7;

               float3x3 TBNMatrix;
               Blackboard blackboard;
            };

            struct VertexData
            {
               #if SHADER_TARGET > 30
               #endif
               float4 vertex : POSITION;
               float3 normal : NORMAL;
               float4 tangent : TANGENT;
               float4 texcoord0 : TEXCOORD0;
               #if _URP && (_USINGTEXCOORD1 || _PASSMETA || _PASSFORWARD || _PASSGBUFFER)
                  float4 texcoord1 : TEXCOORD1;
               #endif

               #if _URP && (_USINGTEXCOORD2 || _PASSMETA || ((_PASSFORWARD || _PASSGBUFFER) && defined(DYNAMICLIGHTMAP_ON)))
                  float4 texcoord2 : TEXCOORD2;
               #endif

               #if _STANDARD && (_USINGTEXCOORD1 || (_PASSMETA || ((_PASSFORWARD || _PASSGBUFFER || _PASSFORWARDADD) && LIGHTMAP_ON)))
                  float4 texcoord1 : TEXCOORD1;
               #endif
               #if _STANDARD && (_USINGTEXCOORD2 || (_PASSMETA || ((_PASSFORWARD || _PASSGBUFFER) && DYNAMICLIGHTMAP_ON)))
                  float4 texcoord2 : TEXCOORD2;
               #endif
               #if _HDRP
                  float4 texcoord1 : TEXCOORD1;
                  float4 texcoord2 : TEXCOORD2;
               #endif
                float4 texcoord3 : TEXCOORD3;
               #if _PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR))
                  float3 previousPositionOS : TEXCOORD4; 
                  #if defined (_ADD_PRECOMPUTED_VELOCITY)
                     float3 precomputedVelocity    : TEXCOORD5; 
                  #endif
               #endif

               UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct TessVertex 
            {
               float4 vertex : INTERNALTESSPOS;
               float3 normal : NORMAL;
               float4 tangent : TANGENT;
               float4 texcoord0 : TEXCOORD0;
               float4 texcoord1 : TEXCOORD1;
               float4 texcoord2 : TEXCOORD2;
                float4 texcoord3 : TEXCOORD3;
               #if _PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR))
                  float3 previousPositionOS : TEXCOORD13; 
                  #if defined (_ADD_PRECOMPUTED_VELOCITY)
                     float3 precomputedVelocity : TEXCOORD14;
                  #endif
               #endif

               UNITY_VERTEX_INPUT_INSTANCE_ID
               UNITY_VERTEX_OUTPUT_STEREO
            };

            struct ExtraV2F
            {
               float4 extraV2F0;
               float4 extraV2F1;
               float4 extraV2F2;
               float4 extraV2F3;
               float4 extraV2F4;
               float4 extraV2F5;
               float4 extraV2F6;
               float4 extraV2F7;
               Blackboard blackboard;
               float4 time;
            };
            float3 WorldToTangentSpace(ShaderData d, float3 normal)
            {
               return mul(d.TBNMatrix, normal);
            }

            float3 TangentToWorldSpace(ShaderData d, float3 normal)
            {
               return mul(normal, d.TBNMatrix);
            }
            #if _STANDARD
               float3 TransformWorldToObject(float3 p) { return mul(unity_WorldToObject, float4(p, 1)); };
               float3 TransformObjectToWorld(float3 p) { return mul(unity_ObjectToWorld, float4(p, 1)); };
               float4 TransformWorldToObject(float4 p) { return mul(unity_WorldToObject, p); };
               float4 TransformObjectToWorld(float4 p) { return mul(unity_ObjectToWorld, p); };
               float4x4 GetWorldToObjectMatrix() { return unity_WorldToObject; }
               float4x4 GetObjectToWorldMatrix() { return unity_ObjectToWorld; }
               #if (defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (SHADER_TARGET_SURFACE_ANALYSIS && !SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))
                 #define UNITY_SAMPLE_TEX2D_LOD(tex,coord, lod) tex.SampleLevel (sampler##tex,coord, lod)
                 #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord, lod) tex.SampleLevel (sampler##samplertex,coord, lod)
              #else
                 #define UNITY_SAMPLE_TEX2D_LOD(tex,coord,lod) tex2D (tex,coord,0,lod)
                 #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord,lod) tex2D (tex,coord,0,lod)
              #endif

               #undef GetWorldToObjectMatrix()

               #define GetWorldToObjectMatrix()   unity_WorldToObject
            #endif

            float3 GetCameraWorldPosition()
            {
               #if _HDRP
                  return GetCameraRelativePositionWS(_WorldSpaceCameraPos);
               #else
                  return _WorldSpaceCameraPos;
               #endif
            }

            #if _GRABPASSUSED
               #if _STANDARD
                  TEXTURE2D(%GRABTEXTURE%);
                  SAMPLER(sampler_%GRABTEXTURE%);
               #endif

               half3 GetSceneColor(float2 uv)
               {
                  #if _STANDARD
                     return SAMPLE_TEXTURE2D(%GRABTEXTURE%, sampler_%GRABTEXTURE%, uv).rgb;
                  #else
                     return SHADERGRAPH_SAMPLE_SCENE_COLOR(uv);
                  #endif
               }
            #endif
            #if _STANDARD
               UNITY_DECLARE_DEPTH_TEXTURE(_CameraDepthTexture);
               float GetSceneDepth(float2 uv) { return SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, uv); }
               float GetLinear01Depth(float2 uv) { return Linear01Depth(GetSceneDepth(uv)); }
               float GetLinearEyeDepth(float2 uv) { return LinearEyeDepth(GetSceneDepth(uv)); } 
            #else
               float GetSceneDepth(float2 uv) { return SHADERGRAPH_SAMPLE_SCENE_DEPTH(uv); }
               float GetLinear01Depth(float2 uv) { return Linear01Depth(GetSceneDepth(uv), _ZBufferParams); }
               float GetLinearEyeDepth(float2 uv) { return LinearEyeDepth(GetSceneDepth(uv), _ZBufferParams); } 
            #endif

            float3 GetWorldPositionFromDepthBuffer(float2 uv, float3 worldSpaceViewDir)
            {
               float eye = GetLinearEyeDepth(uv);
               float3 camView = mul((float3x3)GetObjectToWorldMatrix(), transpose(mul(GetWorldToObjectMatrix(), UNITY_MATRIX_I_V)) [2].xyz);

               float dt = dot(worldSpaceViewDir, camView);
               float3 div = worldSpaceViewDir/dt;
               float3 wpos = (eye * div) + GetCameraWorldPosition();
               return wpos;
            }

            #if _HDRP
            float3 ObjectToWorldSpacePosition(float3 pos)
            {
               return GetAbsolutePositionWS(TransformObjectToWorld(pos));
            }
            #else
            float3 ObjectToWorldSpacePosition(float3 pos)
            {
               return TransformObjectToWorld(pos);
            }
            #endif

            #if _STANDARD
               UNITY_DECLARE_SCREENSPACE_TEXTURE(_CameraDepthNormalsTexture);
               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  float4 depthNorms = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_CameraDepthNormalsTexture, uv);
                  float3 norms = DecodeViewNormalStereo(depthNorms);
                  norms = mul((float3x3)GetWorldToViewMatrix(), norms) * 0.5 + 0.5;
                  return norms;
               }
            #elif _HDRP && !_DECALSHADER
               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  NormalData nd;
                  DecodeFromNormalBuffer(_ScreenSize.xy * uv, nd);
                  return nd.normalWS;
               }
            #elif _URP
               #if (SHADER_LIBRARY_VERSION_MAJOR >= 10)
                  #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareNormalsTexture.hlsl"
               #endif

               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  #if (SHADER_LIBRARY_VERSION_MAJOR >= 10)
                     return SampleSceneNormals(uv);
                  #else
                     float3 wpos = GetWorldPositionFromDepthBuffer(uv, worldSpaceViewDir);
                     return normalize(-cross(ddx(wpos), ddy(wpos))) * 0.5 + 0.5;
                  #endif

                }
             #endif

             #if _HDRP

               half3 UnpackNormalmapRGorAG(half4 packednormal)
               {
                  packednormal.x *= packednormal.w;

                  half3 normal;
                  normal.xy = packednormal.xy * 2 - 1;
                  normal.z = sqrt(1 - saturate(dot(normal.xy, normal.xy)));
                  return normal;
               }
               half3 UnpackNormal(half4 packednormal)
               {
                  #if defined(UNITY_NO_DXT5nm)
                     return packednormal.xyz * 2 - 1;
                  #else
                     return UnpackNormalmapRGorAG(packednormal);
                  #endif
               }
            #endif
            #if _HDRP || _URP

               half3 UnpackScaleNormal(half4 packednormal, half scale)
               {
                 #ifndef UNITY_NO_DXT5nm
                   packednormal.x *= packednormal.w;
                 #endif
                   half3 normal;
                   normal.xy = (packednormal.xy * 2 - 1) * scale;
                   normal.z = sqrt(1 - saturate(dot(normal.xy, normal.xy)));
                   return normal;
               }	

             #endif
            void GetSun(out float3 lightDir, out float3 color)
            {
               lightDir = float3(0.5, 0.5, 0);
               color = 1;
               #if _HDRP
                  if (_DirectionalLightCount > 0)
                  {
                     DirectionalLightData light = _DirectionalLightDatas[0];
                     lightDir = -light.forward.xyz;
                     color = light.color;
                  }
               #elif _STANDARD
			         lightDir = normalize(_WorldSpaceLightPos0.xyz);
                  color = _LightColor0.rgb;
               #elif _URP
	               Light light = GetMainLight();
	               lightDir = light.direction;
	               color = light.color;
               #endif
            }
    sampler2D _EmissiveColorMap;
    sampler2D _BaseColorMap;
    sampler2D _MaskMap;
    sampler2D _NormalMap;
    sampler2D _NormalMapOS;
    sampler2D _DetailMap;
    sampler2D _TangentMap;
    sampler2D _TangentMapOS;
    sampler2D _AnisotropyMap;
    sampler2D _SubsurfaceMaskMap;
    sampler2D _TransmissionMaskMap;
    sampler2D _ThicknessMap;
    sampler2D _IridescenceThicknessMap;
    sampler2D _IridescenceMaskMap;
    sampler2D _SpecularColorMap;

    sampler2D _CoatMaskMap;

    float3 DecodeNormal (float4 sample, float scale) {
        #if defined(UNITY_NO_DXT5nm)
            return UnpackNormalRGB(sample, scale);
        #else
            return UnpackNormalmapRGorAG(sample, scale);
        #endif
    }

	void Ext_SurfaceFunction0 (inout Surface o, ShaderData d)
	{
        float2 uvBase = (_UVMappingMask.x * d.texcoord0 +
                        _UVMappingMask.y * d.texcoord1 +
                        _UVMappingMask.z * d.texcoord2 +
                        _UVMappingMask.w * d.texcoord3).xy;

        float2 uvDetails =  (_UVDetailsMappingMask.x * d.texcoord0 +
                            _UVDetailsMappingMask.y * d.texcoord1 +
                            _UVDetailsMappingMask.z * d.texcoord2 +
                            _UVDetailsMappingMask.w * d.texcoord3).xy;
        float4 texcoords;
        texcoords.xy = uvBase * _BaseColorMap_ST.xy + _BaseColorMap_ST.zw; 

        texcoords.zw = uvDetails * _DetailMap_ST.xy + _DetailMap_ST.zw;

        if (_LinkDetailsWithBase > 0.0)
        {
            texcoords.zw = texcoords.zw  * _BaseColorMap_ST.xy + _BaseColorMap_ST.zw;

        }

            float3 detailNormalTS = float3(0.0, 0.0, 0.0);
            float detailMask = 0.0;
            #ifdef _DETAIL_MAP
                detailMask = 1.0;
                #ifdef _MASKMAP
                    detailMask = tex2D(_MaskMap, texcoords.xy).b;
                #endif
                float2 detailAlbedoAndSmoothness = tex2D(_DetailMap, texcoords.zw).rb;
                float detailAlbedo = detailAlbedoAndSmoothness.r * 2.0 - 1.0;
                float detailSmoothness = detailAlbedoAndSmoothness.g * 2.0 - 1.0;
                real4 packedNormal = tex2D(_DetailMap, texcoords.zw).rgba;
                detailNormalTS = UnpackNormalAG(packedNormal, _DetailNormalScale);
            #endif
            float4 color = tex2D(_BaseColorMap, texcoords.xy).rgba  * _Color.rgba;
            o.Albedo = color.rgb; 
            float alpha = color.a;
            alpha = lerp(_AlphaRemapMin, _AlphaRemapMax, alpha);
            o.Alpha = alpha;
            #ifdef _DETAIL_MAP
                float albedoDetailSpeed = saturate(abs(detailAlbedo) * _DetailAlbedoScale);
                float3 baseColorOverlay = lerp(sqrt(o.Albedo), (detailAlbedo < 0.0) ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0), albedoDetailSpeed * albedoDetailSpeed);
                baseColorOverlay *= baseColorOverlay;
                o.Albedo = lerp(o.Albedo, saturate(baseColorOverlay), detailMask);
            #endif

            #ifdef _NORMALMAP
                float3 normalTS;
                #ifdef _NORMALMAP_TANGENT_SPACE
                    normalTS = DecodeNormal(tex2D(_NormalMap, texcoords.xy), _NormalScale);
                #else
                    #ifdef SURFACE_GRADIENT
                        float3 normalOS = tex2D(_NormalMapOS, texcoords.xy).xyz * 2.0 - 1.0;
                        normalTS = SurfaceGradientFromPerturbedNormal(d.worldSpaceNormal, TransformObjectToWorldNormal(normalOS));
                    #else
                        float3 normalOS = UnpackNormalRGB(tex2D(_NormalMapOS, texcoords.xy), 1.0);
                        float3 bitangent = d.tangentSign * cross(d.worldSpaceNormal.xyz, d.worldSpaceTangent.xyz);
                        half3x3 tangentToWorld = half3x3(d.worldSpaceTangent.xyz, bitangent.xyz, d.worldSpaceNormal.xyz);
                        normalTS = TransformObjectToTangent(normalOS, tangentToWorld);
                    #endif
                #endif

                #ifdef _DETAIL_MAP
                    #ifdef SURFACE_GRADIENT
                    normalTS += detailNormalTS * detailMask;
                    #else
                    normalTS = lerp(normalTS, BlendNormalRNM(normalTS, normalize(detailNormalTS)), detailMask); 
                    #endif
                #endif
                o.Normal = normalTS;

            #endif

            #if defined(_MASKMAP)
                o.Smoothness = tex2D(_MaskMap, texcoords.xy).a;
                o.Smoothness = lerp(_SmoothnessRemapMin, _SmoothnessRemapMax, o.Smoothness);
            #else
                o.Smoothness = _Smoothness;
            #endif
            #ifdef _DETAIL_MAP
                float smoothnessDetailSpeed = saturate(abs(detailSmoothness) * _DetailSmoothnessScale);
                float smoothnessOverlay = lerp(o.Smoothness, (detailSmoothness < 0.0) ? 0.0 : 1.0, smoothnessDetailSpeed);
                o.Smoothness = lerp(o.Smoothness, saturate(smoothnessOverlay), detailMask);
            #endif
            #ifdef _MASKMAP
                o.Metallic = tex2D(_MaskMap, texcoords.xy).r;
                o.Metallic = lerp(_MetallicRemapMin, _MetallicRemapMax, o.Metallic);
                o.Occlusion = tex2D(_MaskMap, texcoords.xy).g;
                o.Occlusion = lerp(_AORemapMin, _AORemapMax, o.Occlusion);
            #else
                o.Metallic = _Metallic;
                o.Occlusion = 1.0;
            #endif

            #if defined(_SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP)
            #elif  defined(_MASKMAP) && !defined(_SPECULAR_OCCLUSION_NONE)
                float3 V = normalize(d.worldSpaceViewDir);
                o.SpecularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(d.worldSpaceNormal, V)), o.Occlusion, PerceptualSmoothnessToRoughness(o.Smoothness));
            #endif

            o.DiffusionProfileHash = asuint(_DiffusionProfileHash);
            o.SubsurfaceMask = _SubsurfaceMask;
            #ifdef _SUBSURFACE_MASK_MAP
                o.SubsurfaceMask *= tex2D(_SubsurfaceMaskMap, texcoords.xy).r;
            #endif
            #ifdef _THICKNESSMAP
                o.Thickness = tex2D(_ThicknessMap, texcoords.xy).r;
                o.Thickness = _ThicknessRemap.x + _ThicknessRemap.y * surfaceData.thickness;
            #else
                o.Thickness = _Thickness;
            #endif
            #ifdef _ANISOTROPYMAP
                o.Anisotropy = tex2D(_AnisotropyMap, texcoords.xy).r;
            #else
                o.Anisotropy = 1.0;
            #endif
                o.Anisotropy *= _Anisotropy;
                o.Specular = _SpecularColor.rgb;
            #ifdef _SPECULARCOLORMAP
                o.Specular *= tex2D(_SpecularColorMap, texcoords.xy).rgb;
            #endif
            #ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                o.Albedo *= _EnergyConservingSpecularColor > 0.0 ? (1.0 - Max3(o.Specular.r, o.Specular.g, o.Specular.b)) : 1.0;
            #endif
            #ifdef _MATERIAL_FEATURE_CLEAR_COAT
                o.CoatMask = _CoatMask;
                o.CoatMask *= tex2D(_CoatMaskMap, texcoords.xy).r;
            #else
                o.CoatMask = 0.0;
            #endif
            #ifdef _MATERIAL_FEATURE_IRIDESCENCE
                #ifdef _IRIDESCENCE_THICKNESSMAP
                o.IridescenceThickness = tex2D(_IridescenceThicknessMap, texcoords.xy).r;
                o.IridescenceThickness = _IridescenceThicknessRemap.x + _IridescenceThicknessRemap.y * o.IridescenceThickness;
                #else
                o.IridescenceThickness = _IridescenceThickness;
                #endif
                o.IridescenceMask = _IridescenceMask;
                o.IridescenceMask *= tex2D(_IridescenceMaskMap, texcoords.xy).r;
            #else
                o.IridescenceThickness = 0.0;
                o.IridescenceMask = 0.0;
            #endif
            float3 emissiveColor = _EmissiveColor * lerp(float3(1.0, 1.0, 1.0), o.Albedo.rgb, _AlbedoAffectEmissive);
            #ifdef _EMISSIVE_COLOR_MAP                
                float2 uvEmission = _UVMappingMaskEmissive.x * d.texcoord0 +
                                    _UVMappingMaskEmissive.y * d.texcoord1 +
                                    _UVMappingMaskEmissive.z * d.texcoord2 +
                                    _UVMappingMaskEmissive.w * d.texcoord3;

                uvEmission = uvEmission * _EmissiveColorMap_ST.xy + _EmissiveColorMap_ST.zw;                     

                emissiveColor *= tex2D(_EmissiveColorMap, uvEmission).rgb;
            #endif
            o.Emission += emissiveColor;
            float currentExposureMultiplier = 0;
            #if SHADEROPTIONS_PRE_EXPOSITION
                currentExposureMultiplier =  LOAD_TEXTURE2D(_ExposureTexture, int2(0, 0)).x * _ProbeExposureScale;
            #else
                currentExposureMultiplier =  _ProbeExposureScale;
            #endif
            float InverseCurrentExposureMultiplier = 0;
            float exposure = currentExposureMultiplier;
            InverseCurrentExposureMultiplier =  rcp(exposure + (exposure == 0.0)); 
            float3 emissiveRcpExposure = o.Emission * InverseCurrentExposureMultiplier;
            o.Emission = lerp(emissiveRcpExposure, o.Emission, _EmissiveExposureWeight);
            #if defined(_ALPHATEST_ON)
                float alphaTex = tex2D(_BaseColorMap, texcoords.xy).a;
                alphaTex = lerp(_AlphaRemapMin, _AlphaRemapMax, alphaTex);
                float alphaValue = alphaTex * _BaseColor.a;
                float alphaCutoff = _AlphaCutoff;
                clip(alpha - alphaCutoff);
            #endif

	}
    float _ArrayLength = 0;
    #if (defined(SHADER_API_GLES) || defined(SHADER_API_GLES3)) 
        float4 _PlayersPosVectorArray[20];
        float _PlayersDataFloatArray[150];     
    #else
        float4 _PlayersPosVectorArray[100];
        float _PlayersDataFloatArray[500];  
    #endif
    #if _ZONING
        #if (defined(SHADER_API_GLES) || defined(SHADER_API_GLES3)) 
            float _ZDFA[500];
        #else
            float _ZDFA[1000];
        #endif
        float _ZonesDataCount;
    #endif

    float _STSCustomTime = 0;
    #if _REPLACEMENT        
        half4 _DissolveColorGlobal;
        float _DissolveColorSaturationGlobal;
        float _DissolveEmissionGlobal;
        float _DissolveEmissionBoosterGlobal;
        float _TextureVisibilityGlobal;
        float _ObstructionGlobal;
        float _AngleStrengthGlobal;
        float _ConeStrengthGlobal;
        float _ConeObstructionDestroyRadiusGlobal;
        float _CylinderStrengthGlobal;
        float _CylinderObstructionDestroyRadiusGlobal;
        float _CircleStrengthGlobal;
        float _CircleObstructionDestroyRadiusGlobal;
        float _CurveStrengthGlobal;
        float _CurveObstructionDestroyRadiusGlobal;
        float _DissolveFallOffGlobal;
        float _AffectedAreaPlayerBasedObstructionGlobal;
        float _IntrinsicDissolveStrengthGlobal;
        float _PreviewModeGlobal;
        float _UVsGlobal;
        float _hasClippedShadowsGlobal;
        float _FloorGlobal;
        float _FloorModeGlobal;
        float _FloorYGlobal;
        float _PlayerPosYOffsetGlobal;
        float _FloorYTextureGradientLengthGlobal;
        float _AffectedAreaFloorGlobal;
        float _AnimationEnabledGlobal;
        float _AnimationSpeedGlobal;
        float _DefaultEffectRadiusGlobal;
        float _EnableDefaultEffectRadiusGlobal;
        float _TransitionDurationGlobal;        
        float _TexturedEmissionEdgeGlobal;
        float _TexturedEmissionEdgeStrengthGlobal;
        float _IsometricExclusionGlobal;
        float _IsometricExclusionDistanceGlobal;
        float _IsometricExclusionGradientLengthGlobal;
        float _CeilingGlobal;
        float _CeilingModeGlobal;
        float _CeilingBlendModeGlobal;
        float _CeilingYGlobal;
        float _CeilingPlayerYOffsetGlobal;
        float _CeilingYGradientLengthGlobal;
        float _ZoningGlobal;
        float _ZoningModeGlobal;
        float _ZoningEdgeGradientLengthGlobal;
        float _IsZoningRevealableGlobal;
        float _SyncZonesWithFloorYGlobal;
        float _SyncZonesFloorYOffsetGlobal;
        float4 _ObstructionCurveGlobal_TexelSize;
        float4 _DissolveMaskGlobal_TexelSize;
        float _DissolveMaskEnabledGlobal;
        float _PreviewIndicatorLineThicknessGlobal;
        half _UseCustomTimeGlobal;

        half _CrossSectionEnabledGlobal;
        half4 _CrossSectionColorGlobal;
        half _CrossSectionTextureEnabledGlobal;
        float _CrossSectionTextureScaleGlobal;
        half _CrossSectionUVScaledByDistanceGlobal;

        half _DissolveMethodGlobal;
        half _DissolveTexSpaceGlobal;

        float4 _DissolveTexGlobal_TexelSize;
    #endif
    #if _REPLACEMENT
        sampler2D _DissolveTexGlobal;
    #else
        sampler2D _DissolveTex;
    #endif
    #if _REPLACEMENT
        sampler2D _DissolveMaskGlobal;
    #else
        sampler2D _DissolveMask;
    #endif
    #if _REPLACEMENT
        sampler2D _ObstructionCurveGlobal;
    #else
        sampler2D _ObstructionCurve;
    #endif

    #if _REPLACEMENT
        sampler2D _CrossSectionTextureGlobal;
    #else
        sampler2D _CrossSectionTexture;
    #endif
#ifdef USE_UNITY_TEXTURE_2D_TYPE
#undef USE_UNITY_TEXTURE_2D_TYPE
#endif

#include "Packages/com.shadercrew.seethroughshader.core/Scripts/Shaders/xxSharedSTSDependencies/SeeThroughShaderFunction.hlsl"
	void Ext_SurfaceFunction1 (inout Surface o, ShaderData d)
	{
        half3 albedo;
        half3 emission;
        float alphaForClipping;
#ifdef USE_UNITY_TEXTURE_2D_TYPE
#undef USE_UNITY_TEXTURE_2D_TYPE
#endif
#if _REPLACEMENT
    DoSeeThroughShading( o.Albedo, o.Normal, d.worldSpacePosition, d.worldSpaceNormal, d.screenPos,
                        _numOfPlayersInside, _tDirection, _tValue, _id,
                        _TriggerMode, _RaycastMode,
                        _IsExempt,

                        _DissolveMethodGlobal, _DissolveTexSpaceGlobal,

                        _DissolveColorGlobal, _DissolveColorSaturationGlobal, _UVsGlobal,
                        _DissolveEmissionGlobal, _DissolveEmissionBoosterGlobal, _TexturedEmissionEdgeGlobal, _TexturedEmissionEdgeStrengthGlobal,
                        _hasClippedShadowsGlobal,

                        _ObstructionGlobal,
                        _AngleStrengthGlobal,
                        _ConeStrengthGlobal, _ConeObstructionDestroyRadiusGlobal,
                        _CylinderStrengthGlobal, _CylinderObstructionDestroyRadiusGlobal,
                        _CircleStrengthGlobal, _CircleObstructionDestroyRadiusGlobal,
                        _CurveStrengthGlobal, _CurveObstructionDestroyRadiusGlobal,
                        _DissolveFallOffGlobal,
                        _DissolveMaskEnabledGlobal,
                        _AffectedAreaPlayerBasedObstructionGlobal,
                        _IntrinsicDissolveStrengthGlobal,
                        _DefaultEffectRadiusGlobal, _EnableDefaultEffectRadiusGlobal,

                        _IsometricExclusionGlobal, _IsometricExclusionDistanceGlobal, _IsometricExclusionGradientLengthGlobal,
                        _CeilingGlobal, _CeilingModeGlobal, _CeilingBlendModeGlobal, _CeilingYGlobal, _CeilingPlayerYOffsetGlobal, _CeilingYGradientLengthGlobal,
                        _FloorGlobal, _FloorModeGlobal, _FloorYGlobal, _PlayerPosYOffsetGlobal, _FloorYTextureGradientLengthGlobal, _AffectedAreaFloorGlobal,

                        _AnimationEnabledGlobal, _AnimationSpeedGlobal,
                        _TransitionDurationGlobal,

                        _UseCustomTimeGlobal,

                        _ZoningGlobal, _ZoningModeGlobal, _IsZoningRevealableGlobal, _ZoningEdgeGradientLengthGlobal,
                        _SyncZonesWithFloorYGlobal, _SyncZonesFloorYOffsetGlobal,

                        _PreviewModeGlobal,
                        _PreviewIndicatorLineThicknessGlobal,

                        _DissolveTexGlobal,
                        _DissolveMaskGlobal,
                        _ObstructionCurveGlobal,

                        _DissolveTexGlobal_TexelSize,
                        _DissolveMaskGlobal_TexelSize,
                        _ObstructionCurveGlobal_TexelSize,

                        albedo, emission, alphaForClipping);
#else 
    DoSeeThroughShading( o.Albedo, o.Normal, d.worldSpacePosition, d.worldSpaceNormal, d.screenPos,

                        _numOfPlayersInside, _tDirection, _tValue, _id,
                        _TriggerMode, _RaycastMode,
                        _IsExempt,

                        _DissolveMethod, _DissolveTexSpace,

                        _DissolveColor, _DissolveColorSaturation, _UVs,
                        _DissolveEmission, _DissolveEmissionBooster, _TexturedEmissionEdge, _TexturedEmissionEdgeStrength,
                        _hasClippedShadows,

                        _Obstruction,
                        _AngleStrength,
                        _ConeStrength, _ConeObstructionDestroyRadius,
                        _CylinderStrength, _CylinderObstructionDestroyRadius,
                        _CircleStrength, _CircleObstructionDestroyRadius,
                        _CurveStrength, _CurveObstructionDestroyRadius,
                        _DissolveFallOff,
                        _DissolveMaskEnabled,
                        _AffectedAreaPlayerBasedObstruction,
                        _IntrinsicDissolveStrength,
                        _DefaultEffectRadius, _EnableDefaultEffectRadius,

                        _IsometricExclusion, _IsometricExclusionDistance, _IsometricExclusionGradientLength,
                        _Ceiling, _CeilingMode, _CeilingBlendMode, _CeilingY, _CeilingPlayerYOffset, _CeilingYGradientLength,
                        _Floor, _FloorMode, _FloorY, _PlayerPosYOffset, _FloorYTextureGradientLength, _AffectedAreaFloor,

                        _AnimationEnabled, _AnimationSpeed,
                        _TransitionDuration,

                        _UseCustomTime,

                        _Zoning, _ZoningMode , _IsZoningRevealable, _ZoningEdgeGradientLength,
                        _SyncZonesWithFloorY, _SyncZonesFloorYOffset,

                        _PreviewMode,
                        _PreviewIndicatorLineThickness,                            

                        _DissolveTex,
                        _DissolveMask,
                        _ObstructionCurve,

                        _DissolveTex_TexelSize,
                        _DissolveMask_TexelSize,
                        _ObstructionCurve_TexelSize,

                        albedo, emission, alphaForClipping);
#endif 
        o.Albedo = albedo;
        o.Emission += emission;   

	}
    void Ext_FinalColorForward1 (Surface o, ShaderData d, inout half4 color)
    {
        #if _REPLACEMENT   
            DoCrossSection(_CrossSectionEnabledGlobal,
                        _CrossSectionColorGlobal,
                        _CrossSectionTextureEnabledGlobal,
                        _CrossSectionTextureGlobal,
                        _CrossSectionTextureScaleGlobal,
                        _CrossSectionUVScaledByDistanceGlobal,
                        d.isFrontFace,
                        d.screenPos,
                        color);
        #else 
            DoCrossSection(_CrossSectionEnabled,
                        _CrossSectionColor,
                        _CrossSectionTextureEnabled,
                        _CrossSectionTexture,
                        _CrossSectionTextureScale,
                        _CrossSectionUVScaledByDistance,
                        d.isFrontFace,
                        d.screenPos,
                        color);
        #endif
    }
            void ChainSurfaceFunction(inout Surface l, inout ShaderData d)
            {
                  Ext_SurfaceFunction0(l, d);
                  Ext_SurfaceFunction1(l, d);
            }

#if !_DECALSHADER

            void ChainModifyVertex(inout VertexData v, inout VertexToPixel v2p, float4 time)
            {
                 ExtraV2F d;
                 ZERO_INITIALIZE(ExtraV2F, d);
                 ZERO_INITIALIZE(Blackboard, d.blackboard);
                 d.time = time;
            }

            void ChainModifyTessellatedVertex(inout VertexData v, inout VertexToPixel v2p)
            {
               ExtraV2F d;
               ZERO_INITIALIZE(ExtraV2F, d);
               ZERO_INITIALIZE(Blackboard, d.blackboard);
            }

            void ChainFinalColorForward(inout Surface l, inout ShaderData d, inout half4 color)
            {
                  Ext_FinalColorForward1(l, d, color);
            }

            void ChainFinalGBufferStandard(inout Surface s, inout ShaderData d, inout half4 GBuffer0, inout half4 GBuffer1, inout half4 GBuffer2, inout half4 outEmission, inout half4 outShadowMask)
            {
            }
#endif
#if _DECALSHADER

        ShaderData CreateShaderData(SurfaceDescriptionInputs IN)
        {
            ShaderData d = (ShaderData)0;
            d.TBNMatrix = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
            d.worldSpaceNormal = IN.WorldSpaceNormal;
            d.worldSpaceTangent = IN.WorldSpaceTangent;

            d.worldSpacePosition = IN.WorldSpacePosition;
            d.texcoord0 = IN.uv0.xyxy;
            d.screenPos = IN.ScreenPosition;

            d.worldSpaceViewDir = normalize(_WorldSpaceCameraPos - d.worldSpacePosition);

            d.tangentSpaceViewDir = mul(d.TBNMatrix, d.worldSpaceViewDir);
            #if _HDRP
            #else
            #endif
             d.screenUV = (IN.ScreenPosition.xy / max(0.01, IN.ScreenPosition.w));
            return d;
        }
#else

         ShaderData CreateShaderData(VertexToPixel i
                  #if NEED_FACING
                     , bool facing
                  #endif
         )
         {
            ShaderData d = (ShaderData)0;
            d.clipPos = i.pos;
            d.worldSpacePosition = i.worldPos;

            d.worldSpaceNormal = normalize(i.worldNormal);
            d.worldSpaceTangent.xyz = normalize(i.worldTangent.xyz);

            d.tangentSign = i.worldTangent.w * unity_WorldTransformParams.w;
            float3 bitangent = cross(d.worldSpaceTangent.xyz, d.worldSpaceNormal) * d.tangentSign;
            d.TBNMatrix = float3x3(d.worldSpaceTangent, -bitangent, d.worldSpaceNormal);
            d.worldSpaceViewDir = normalize(_WorldSpaceCameraPos - i.worldPos);

            d.tangentSpaceViewDir = mul(d.TBNMatrix, d.worldSpaceViewDir);
             d.texcoord0 = i.texcoord0;
             d.texcoord1 = i.texcoord1;
             d.texcoord2 = i.texcoord2;
             d.texcoord3 = i.texcoord3;
             d.isFrontFace = facing;
            #if _HDRP
            #else
            #endif
             d.screenPos = i.screenPos;
             d.screenUV = (i.screenPos.xy / i.screenPos.w);
            return d;
         }

#endif
#if (SHADERPASS == SHADERPASS_LIGHT_TRANSPORT)
   float unity_OneOverOutputBoost;
   float unity_MaxOutputValue;

   CBUFFER_START(UnityMetaPass)
   bool4 unity_MetaVertexControl;
   bool4 unity_MetaFragmentControl;
   CBUFFER_END

   VertexToPixel Vert(VertexData inputMesh)
   {
       VertexToPixel output;
       ZERO_INITIALIZE(VertexToPixel, output);
       UNITY_SETUP_INSTANCE_ID(inputMesh);
       UNITY_TRANSFER_INSTANCE_ID(inputMesh, output);
       UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);
       float2 uv = float2(0.0, 0.0);

       if (unity_MetaVertexControl.x)
       {
           uv = inputMesh.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
       }
       else if (unity_MetaVertexControl.y)
       {
           uv = inputMesh.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
       }
       output.pos = float4(uv * 2.0 - 1.0, inputMesh.vertex.z > 0 ? 1.0e-4 : 0.0, 1.0);

       output.worldPos = TransformObjectToWorld(inputMesh.vertex.xyz).xyz;
       output.worldNormal = TransformObjectToWorldNormal(inputMesh.normal);
       output.worldTangent = float4(1.0, 0.0, 0.0, 0.0);

       output.texcoord0 = inputMesh.texcoord0;
       output.texcoord1 = inputMesh.texcoord1;
       output.texcoord2 = inputMesh.texcoord2;
        output.texcoord3 = inputMesh.texcoord3;
       return output;
   }
#else

   #if (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
      #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariablesMatrixDefsHDCamera.hlsl"

      void MotionVectorPositionZBias(VertexToPixel input)
      {
      #if UNITY_REVERSED_Z
          input.pos.z -= unity_MotionVectorsParams.z * input.pos.w;
      #else
          input.pos.z += unity_MotionVectorsParams.z * input.pos.w;
      #endif
      }

   #endif

   VertexToPixel Vert(VertexData input)
   {
       VertexToPixel output;
       ZERO_INITIALIZE(VertexToPixel, output);

       UNITY_SETUP_INSTANCE_ID(input);
       UNITY_TRANSFER_INSTANCE_ID(input, output);
       UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

       #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
         VertexData previousMesh = input;
       #endif

       ChainModifyVertex(input, output, _Time);
       float3 positionRWS = TransformObjectToWorld(input.vertex.xyz);
       float3 normalWS = TransformObjectToWorldNormal(input.normal);
       float4 tangentWS = float4(TransformObjectToWorldDir(input.tangent.xyz), input.tangent.w);
       output.worldPos = GetAbsolutePositionWS(positionRWS);
       output.pos = TransformWorldToHClip(positionRWS);
       output.worldNormal = normalWS;
       output.worldTangent = tangentWS;
       output.texcoord0 = input.texcoord0;
       output.texcoord1 = input.texcoord1;
       output.texcoord2 = input.texcoord2;
        output.texcoord3 = input.texcoord3;
        output.screenPos = ComputeScreenPos(output.pos, _ProjectionParams.x);
       #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))

          #if !defined(TESSELLATION_ON)
            MotionVectorPositionZBias(output);
          #endif

          output.motionVectorCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(positionRWS.xyz, 1.0));
          bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
          if (forceNoMotion)
          {
              output.previousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
          }
          else
          {
            bool hasDeformation = unity_MotionVectorsParams.x > 0.0; 

            float3 effectivePositionOS = (hasDeformation ? previousMesh.previousPositionOS : previousMesh.vertex.xyz);
            #if defined(_ADD_PRECOMPUTED_VELOCITY)
               effectivePositionOS -= input.precomputedVelocity;
            #endif

            previousMesh.vertex = float4(effectivePositionOS, 1);
            VertexToPixel dummy = (VertexToPixel)0;
            ChainModifyVertex(previousMesh, dummy, _LastTimeParameters);
            float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.vertex.xyz);

            #ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
            if (_TransparentCameraOnlyMotionVectors > 0)
            {
               previousPositionRWS = positionRWS.xyz;
            }
            #endif 

            output.previousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
         }
       #endif 
       return output;
   }
#endif
               #if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
                  #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
               #endif

                FragInputs BuildFragInputs(VertexToPixel input)
                {
                    UNITY_SETUP_INSTANCE_ID(input);
                    FragInputs output;
                    ZERO_INITIALIZE(FragInputs, output);
                    output.tangentToWorld = k_identity3x3;
                    output.positionSS = input.pos;       
                    output.positionRWS = GetCameraRelativePositionWS(input.worldPos);
                    output.tangentToWorld = BuildTangentToWorld(input.worldTangent, input.worldNormal);
                    output.texCoord0 = input.texcoord0;
                    output.texCoord1 = input.texcoord1;
                    output.texCoord2 = input.texcoord2;
                    return output;
                }
               void BuildSurfaceData(FragInputs fragInputs, inout Surface surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
               {
                   ZERO_INITIALIZE(SurfaceData, surfaceData);
                   surfaceData.specularOcclusion = 1.0;
                   surfaceData.baseColor =                 surfaceDescription.Albedo;
                   surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;
                   surfaceData.ambientOcclusion =          surfaceDescription.Occlusion;
                   surfaceData.specularOcclusion =         surfaceDescription.SpecularOcclusion;
                   surfaceData.metallic =                  surfaceDescription.Metallic;
                   surfaceData.subsurfaceMask =            surfaceDescription.SubsurfaceMask;
                   surfaceData.thickness =                 surfaceDescription.Thickness;
                   surfaceData.diffusionProfileHash =      asuint(surfaceDescription.DiffusionProfileHash);
                   #if _USESPECULAR
                      surfaceData.specularColor =             surfaceDescription.Specular;
                   #endif
                   surfaceData.coatMask =                  surfaceDescription.CoatMask;
                   surfaceData.anisotropy =                surfaceDescription.Anisotropy;
                   surfaceData.iridescenceMask =           surfaceDescription.IridescenceMask;
                   surfaceData.iridescenceThickness =      surfaceDescription.IridescenceThickness;
                   #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                        if (_EnableSSRefraction)
                        {
                            surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                            surfaceDescription.Alpha = 1.0;
                        }
                        else
                        {
                            surfaceData.ior = surfaceDescription.ior;
                            surfaceData.transmittanceColor = surfaceDescription.transmittanceColor;
                            surfaceData.atDistance = surfaceDescription.atDistance;
                            surfaceData.transmittanceMask = surfaceDescription.transmittanceMask;
                            surfaceDescription.Alpha = 1.0;
                        }
                    #else
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                    #endif
                    surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
                    #ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
                    #endif
                    #ifdef _MATERIAL_FEATURE_TRANSMISSION
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
                    #endif
                    #ifdef _MATERIAL_FEATURE_ANISOTROPY
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                        surfaceData.normalWS = float3(0, 1, 0);
                    #endif
                    #ifdef _MATERIAL_FEATURE_IRIDESCENCE
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
                    #endif
                    #ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
                    #endif
                    #if defined(_MATERIAL_FEATURE_CLEAR_COAT) || _CLEARCOAT
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
                    #endif
                    #if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                        surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
                    #endif
                   #if !_WORLDSPACENORMAL
                      surfaceData.normalWS = mul(surfaceDescription.Normal, fragInputs.tangentToWorld);
                   #else
                      surfaceData.normalWS = surfaceDescription.Normal;
                   #endif

                   surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                   surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    
                    #if HAVE_DECALS
                        if (_EnableDecals)
                        {
                            float alpha = 1.0;
                            alpha = surfaceDescription.Alpha;
                            DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], alpha);
                            ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
                        }
                    #endif
                    bentNormalWS = surfaceData.normalWS;
                    surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);
                    #ifdef DEBUG_DISPLAY
                        if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
                        {
                            surfaceData.metallic = 0;
                        }
                        ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
                    #endif
                    #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                    #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                        surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                    #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                        surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                    #endif
                    #if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
                        surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                    #endif
               }
               void GetSurfaceAndBuiltinData(VertexToPixel m2ps, FragInputs fragInputs, float3 V, inout PositionInputs posInput,
                     out SurfaceData surfaceData, out BuiltinData builtinData, inout Surface l, inout ShaderData d
                     #if NEED_FACING
                        , bool facing
                     #endif
                  )
               {
                 d = CreateShaderData(m2ps
                    #if NEED_FACING
                       , facing
                    #endif
                 );

                 l = (Surface)0;

                 l.Albedo = half3(0.5, 0.5, 0.5);
                 l.Normal = float3(0,0,1);
                 l.Occlusion = 1;
                 l.Alpha = 1;
                 l.SpecularOcclusion = 1;

                 #if !defined(SHADER_STAGE_RAY_TRACING) && defined(_DEPTHOFFSET_ON)
                    l.outputDepth = d.clipPos.z;
                 #endif

                 ChainSurfaceFunction(l, d);

                 #if !defined(SHADER_STAGE_RAY_TRACING) && defined(_DEPTHOFFSET_ON)
                 #endif

                 #if _UNLIT
                     l.Normal = half3(0,0,1);
                     l.Occlusion = 1;
                     l.Metallic = 0;
                     l.Specular = 0;
                 #endif

                 surfaceData.geomNormalWS = d.worldSpaceNormal;
                 surfaceData.tangentWS = d.worldSpaceTangent;
                 fragInputs.tangentToWorld = d.TBNMatrix;

                 float3 bentNormalWS;
                 BuildSurfaceData(fragInputs, l, V, posInput, surfaceData, bentNormalWS);
                 InitBuiltinData(posInput, l.Alpha, bentNormalWS, -d.worldSpaceNormal, fragInputs.texCoord1, fragInputs.texCoord2, builtinData);
                 builtinData.emissiveColor = l.Emission;

                 #if defined(_OVERRIDE_BAKEDGI)
                    builtinData.bakeDiffuseLighting = l.DiffuseGI;
                    builtinData.backBakeDiffuseLighting = l.BackDiffuseGI;
                    builtinData.emissiveColor += l.SpecularGI;
                 #endif

                 #if defined(_OVERRIDE_SHADOWMASK)
                    builtinData.shadowMask0 = l.ShadowMask.x;
                    builtinData.shadowMask1 = l.ShadowMask.y;
                    builtinData.shadowMask2 = l.ShadowMask.z;
                    builtinData.shadowMask3 = l.ShadowMask.w;
                 #endif

                 #if defined(UNITY_VIRTUAL_TEXTURING)
                    builtinData.vtPackedFeedback = surfaceData.VTPackedFeedback;
                 #endif

                  #if (SHADERPASS == SHADERPASS_DISTORTION)
                     builtinData.distortion = surfaceData.Distortion;
                     builtinData.distortionBlur = surfaceData.DistortionBlur;
                  #endif

                  #ifndef SHADER_UNLIT
                    PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                  #else
                    ApplyDebugToBuiltinData(builtinData);
                  #endif
                  RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
               }
              #if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
              #define SV_TARGET_DECAL SV_Target2
              #elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
              #define SV_TARGET_DECAL SV_Target1
              #else
              #define SV_TARGET_DECAL SV_Target0
              #endif
              void Frag(  VertexToPixel v2p
                          #if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
                          , out float4 outColor : SV_Target0
                          #else
                          #ifdef WRITE_MSAA_DEPTH
                            , out float4 depthColor : SV_Target0
                                #ifdef WRITE_NORMAL_BUFFER
                                , out float4 outNormalBuffer : SV_Target1
                                #endif
                            #else
                                #ifdef WRITE_NORMAL_BUFFER
                                , out float4 outNormalBuffer : SV_Target0
                                #endif
                            #endif
                            #if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
                            , out float4 outDecalBuffer : SV_TARGET_DECAL
                            #endif
                        #endif

                        #if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
                        , out float outputDepth : SV_Depth
                        #endif
                        #if NEED_FACING
                           , bool facing : SV_IsFrontFace
                        #endif
                      )
              {
                  UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(v2p);
                  FragInputs input = BuildFragInputs(v2p);
                  PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
                  float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);
                  SurfaceData surfaceData;
                  BuiltinData builtinData;
                  Surface l;
                  ShaderData d;
                  GetSurfaceAndBuiltinData(v2p, input, V, posInput, surfaceData, builtinData, l, d
               #if NEED_FACING
                  , facing
               #endif
               );
                  surfaceData.normalWS *= saturate(l.Albedo.r + 9999);

                  #ifdef _DEPTHOFFSET_ON
                     outputDepth = l.outputDepth;
                  #endif

                  #ifdef SCENESELECTIONPASS
                      outColor = float4(_ObjectId, _PassValue, 1.0, 1.0);
                  #elif defined(SCENEPICKINGPASS)
                      outColor = _SelectionID;
                  #else
                     #ifdef WRITE_MSAA_DEPTH
                       depthColor = v2p.pos.z;

                       #ifdef _ALPHATOMASK_ON
                          depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
                       #endif 
                     #endif 
                     #if defined(WRITE_NORMAL_BUFFER)
                        EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
                     #endif

                     #if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
                        DecalPrepassData decalPrepassData;
                        decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
                        decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
                        EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
                     #endif
                  #endif

              }
         ENDHLSL
    }
              Pass
        {
            Name "META"
            Tags { "LightMode" = "META" }
            Cull Off
                Cull [_CullMode]
            HLSLPROGRAM
            #pragma target 4.5
            #pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
            #pragma multi_compile_instancing
            #define _ENABLE_FOG_ON_TRANSPARENT 1
            #define SHADERPASS SHADERPASS_LIGHT_TRANSPORT
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #define REQUIRE_DEPTH_TEXTURE
            #define _PASSMETA 1
    #pragma shader_feature_local _ALPHATEST_ON

    #pragma shader_feature_local_fragment _NORMALMAP_TANGENT_SPACE
    #pragma shader_feature_local _NORMALMAP
    #pragma shader_feature_local_fragment _MASKMAP
    #pragma shader_feature_local_fragment _EMISSIVE_COLOR_MAP
    #pragma shader_feature_local_fragment _ANISOTROPYMAP
    #pragma shader_feature_local_fragment _DETAIL_MAP
    #pragma shader_feature_local_fragment _SUBSURFACE_MASK_MAP
    #pragma shader_feature_local_fragment _THICKNESSMAP
    #pragma shader_feature_local_fragment _IRIDESCENCE_THICKNESSMAP
    #pragma shader_feature_local_fragment _SPECULARCOLORMAP
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_TRANSMISSION
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_ANISOTROPY
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_CLEAR_COAT
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_IRIDESCENCE
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_SPECULAR_COLOR
    #pragma shader_feature_local_fragment _ENABLESPECULAROCCLUSION
    #pragma shader_feature_local_fragment _ _SPECULAR_OCCLUSION_NONE _SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP

    #ifdef _ENABLESPECULAROCCLUSION
        #define _SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP
    #endif
        #pragma shader_feature_local_fragment _OBSTRUCTION_CURVE
        #pragma shader_feature_local_fragment _DISSOLVEMASK
        #pragma shader_feature_local_fragment _ZONING
        #pragma shader_feature_local_fragment _REPLACEMENT
        #pragma shader_feature_local_fragment _PLAYERINDEPENDENT
   #define _HDRP 1
#define _USINGTEXCOORD1 1
#define _USINGTEXCOORD2 1
#define NEED_FACING 1

               #pragma vertex Vert
   #pragma fragment Frag
      #define UNITY_DECLARE_TEX2D(name) TEXTURE2D(name); SAMPLER(sampler##name);
      #define UNITY_DECLARE_TEX2D_NOSAMPLER(name) TEXTURE2D(name);
      #define UNITY_DECLARE_TEX2DARRAY(name) TEXTURE2D_ARRAY(name); SAMPLER(sampler##name);
      #define UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(tex) TEXTURE2D_ARRAY(tex);

      #define UNITY_SAMPLE_TEX2DARRAY(tex,coord)            SAMPLE_TEXTURE2D_ARRAY(tex, sampler##tex, coord.xy, coord.z)
      #define UNITY_SAMPLE_TEX2DARRAY_LOD(tex,coord,lod)    SAMPLE_TEXTURE2D_ARRAY_LOD(tex, sampler##tex, coord.xy, coord.z, lod)
      #define UNITY_SAMPLE_TEX2D(tex, coord)                SAMPLE_TEXTURE2D(tex, sampler##tex, coord)
      #define UNITY_SAMPLE_TEX2D_SAMPLER(tex, samp, coord)  SAMPLE_TEXTURE2D(tex, sampler##samp, coord)

      #define UNITY_SAMPLE_TEX2D_LOD(tex,coord, lod)   SAMPLE_TEXTURE2D_LOD(tex, sampler_##tex, coord, lod)
      #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord, lod) SAMPLE_TEXTURE2D_LOD (tex, sampler##samplertex,coord, lod)

      #if defined(UNITY_COMPILER_HLSL)
         #define UNITY_INITIALIZE_OUTPUT(type,name) name = (type)0;
      #else
         #define UNITY_INITIALIZE_OUTPUT(type,name)
      #endif

      #define sampler2D_float sampler2D
      #define sampler2D_half sampler2D

      #undef WorldNormalVector
      #define WorldNormalVector(data, normal) mul(normal, data.TBNMatrix)

      #define UnityObjectToWorldNormal(normal) mul(GetObjectToWorldMatrix(), normal)
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
#if UNITY_VERSION >= UNITY_2021_3_31
       #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl" 
#else
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" 
#endif    
            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT 
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
            #define RAYTRACING_SHADER_GRAPH_LOW
            #endif
            #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
               #define OUTPUT_SPLIT_LIGHTING
            #endif

            #define HAVE_RECURSIVE_RENDERING

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
               #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                  #define WRITE_NORMAL_BUFFER
               #endif
            #endif

            #ifndef DEBUG_DISPLAY
               #if !defined(_SURFACE_TYPE_TRANSPARENT) && defined(_ALPHATEST)
                  #if SHADERPASS == SHADERPASS_FORWARD
                  #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                  #elif SHADERPASS == SHADERPASS_GBUFFER
                  #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                  #endif
               #endif
            #endif
            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
               #define _DEFERRED_CAPABLE_MATERIAL
            #endif
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
               #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
            CBUFFER_START(UnityPerMaterial)
               float _UseShadowThreshold;
               float _BlendMode;
               float _EnableBlendModePreserveSpecularLighting;
               float _RayTracing;
               float _RefractionModel;
    float4 _BaseColorMap_ST;
    float4 _DetailMap_ST;
    float4 _EmissiveColorMap_ST;

    float _UVBase;
    half4 _Color;
    half4 _BaseColor; 
    half _Cutoff; 
    half _Mode;
    float _CullMode;
    float _CullModeForward;
    half _Metallic;
    half3 _EmissionColor;
    half _UVSec;

    float3 _EmissiveColor;
    float _AlbedoAffectEmissive;
    float _EmissiveExposureWeight;
    float _MetallicRemapMin;
    float _MetallicRemapMax;
    float _Smoothness;
    float _SmoothnessRemapMin;
    float _SmoothnessRemapMax;
    float _AlphaRemapMin;
    float _AlphaRemapMax;
    float _AORemapMin;
    float _AORemapMax;
    float _NormalScale;
    float _DetailAlbedoScale;
    float _DetailNormalScale;
    float _DetailSmoothnessScale;
    float _Anisotropy;
    float _DiffusionProfileHash;
    float _SubsurfaceMask;
    float _Thickness;
    float4 _ThicknessRemap;
    float _IridescenceThickness;
    float4 _IridescenceThicknessRemap;
    float _IridescenceMask;
    float _CoatMask;
    float4 _SpecularColor;
    float _EnergyConservingSpecularColor;
    int _MaterialID;

    float _LinkDetailsWithBase;
    float4 _UVMappingMask;
    float4 _UVDetailsMappingMask;

    float4 _UVMappingMaskEmissive;

    float _AlphaCutoff;
    float _SyncCullMode;

    float _IsReplacementShader;
    float _TriggerMode;
    float _RaycastMode;
    float _IsExempt;
    float _isReferenceMaterial;
    float _InteractionMode;

    float _tDirection = 0;
    float _numOfPlayersInside = 0;
    float _tValue = 0;
    float _id = 0;
    half _TextureVisibility;
    half _AngleStrength;
    float _Obstruction;
    float _UVs;
    float4 _ObstructionCurve_TexelSize;      
    float _DissolveMaskEnabled;
    float4 _DissolveMask_TexelSize;
    float4 _DissolveTex_TexelSize;
    half4 _DissolveColor;
    float _DissolveColorSaturation;
    float _DissolveEmission;
    float _DissolveEmissionBooster;
    float _hasClippedShadows;
    float _ConeStrength;
    float _ConeObstructionDestroyRadius;
    float _CylinderStrength;
    float _CylinderObstructionDestroyRadius;
    float _CircleStrength;
    float _CircleObstructionDestroyRadius;
    float _CurveStrength;
    float _CurveObstructionDestroyRadius;
    float _IntrinsicDissolveStrength;
    float _DissolveFallOff;
    float _AffectedAreaPlayerBasedObstruction;
    float _PreviewMode;
    float _PreviewIndicatorLineThickness;
    float _AnimationEnabled;
    float _AnimationSpeed;
    float _DefaultEffectRadius;
    float _EnableDefaultEffectRadius;
    float _TransitionDuration;
    float _TexturedEmissionEdge;
    float _TexturedEmissionEdgeStrength;
    float _IsometricExclusion;
    float _IsometricExclusionDistance;
    float _IsometricExclusionGradientLength;
    float _Floor;
    float _FloorMode;
    float _FloorY;
    float _FloorYTextureGradientLength;
    float _PlayerPosYOffset;
    float _AffectedAreaFloor;
    float _Ceiling;
    float _CeilingMode;
    float _CeilingBlendMode;
    float _CeilingY;
    float _CeilingPlayerYOffset;
    float _CeilingYGradientLength;
    float _Zoning;
    float _ZoningMode;
    float _ZoningEdgeGradientLength;
    float _IsZoningRevealable;
    float _SyncZonesWithFloorY;
    float _SyncZonesFloorYOffset;

    half _UseCustomTime;

    half _CrossSectionEnabled;
    half4 _CrossSectionColor;
    half _CrossSectionTextureEnabled;
    float _CrossSectionTextureScale;
    half _CrossSectionUVScaledByDistance;
    half _DissolveMethod;
    half _DissolveTexSpace;
            CBUFFER_END
               #ifdef SCENEPICKINGPASS
               float4 _SelectionID;
               #endif
               #ifdef SCENESELECTIONPASS
               int _ObjectId;
               int _PassValue;
               #endif
            struct VertexToPixel
            {
               float4 pos : SV_POSITION;
               float3 worldPos : TEXCOORD0;
               float3 worldNormal : TEXCOORD1;
               float4 worldTangent : TEXCOORD2;
               float4 texcoord0 : TEXCOORD3;
               float4 texcoord1 : TEXCOORD4;
               float4 texcoord2 : TEXCOORD5;
                float4 texcoord3 : TEXCOORD6;
                float4 screenPos : TEXCOORD7;
               #if UNITY_ANY_INSTANCING_ENABLED
                  UNITY_VERTEX_INPUT_INSTANCE_ID
               #endif 

               #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
                  float4 previousPositionCS : TEXCOORD16; 
                  float4 motionVectorCS : TEXCOORD17;
               #endif

               UNITY_VERTEX_OUTPUT_STEREO
            }; 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
            struct Surface
            {
               half3 Albedo;
               half Height;
               half3 Normal;
               half Smoothness;
               half3 Emission;
               half Metallic;
               half3 Specular;
               half Occlusion;
               half SpecularPower; 
               half Alpha;
               float outputDepth; 
               half SpecularOcclusion;
               half SubsurfaceMask;
               half Thickness;
               half CoatMask;
               half CoatSmoothness;
               half Anisotropy;
               half IridescenceMask;
               half IridescenceThickness;
               int DiffusionProfileHash;
               float SpecularAAThreshold;
               float SpecularAAScreenSpaceVariance;
               float3 DiffuseGI;
               float3 BackDiffuseGI;
               float3 SpecularGI;
               float ior;
               float3 transmittanceColor;
               float atDistance;
               float transmittanceMask;
               float4 ShadowMask;
               float NormalAlpha;
               float MAOSAlpha;
            };
            struct Blackboard
            {
                float blackboardDummyData;
            };
            struct ShaderData
            {
               float4 clipPos; 
               float3 localSpacePosition;
               float3 localSpaceNormal;
               float3 localSpaceTangent;
               float3 worldSpacePosition;
               float3 worldSpaceNormal;
               float3 worldSpaceTangent;
               float tangentSign;

               float3 worldSpaceViewDir;
               float3 tangentSpaceViewDir;

               float4 texcoord0;
               float4 texcoord1;
               float4 texcoord2;
               float4 texcoord3;

               float2 screenUV;
               float4 screenPos;

               float4 vertexColor;
               bool isFrontFace;

               float4 extraV2F0;
               float4 extraV2F1;
               float4 extraV2F2;
               float4 extraV2F3;
               float4 extraV2F4;
               float4 extraV2F5;
               float4 extraV2F6;
               float4 extraV2F7;

               float3x3 TBNMatrix;
               Blackboard blackboard;
            };

            struct VertexData
            {
               #if SHADER_TARGET > 30
               #endif
               float4 vertex : POSITION;
               float3 normal : NORMAL;
               float4 tangent : TANGENT;
               float4 texcoord0 : TEXCOORD0;
               #if _URP && (_USINGTEXCOORD1 || _PASSMETA || _PASSFORWARD || _PASSGBUFFER)
                  float4 texcoord1 : TEXCOORD1;
               #endif

               #if _URP && (_USINGTEXCOORD2 || _PASSMETA || ((_PASSFORWARD || _PASSGBUFFER) && defined(DYNAMICLIGHTMAP_ON)))
                  float4 texcoord2 : TEXCOORD2;
               #endif

               #if _STANDARD && (_USINGTEXCOORD1 || (_PASSMETA || ((_PASSFORWARD || _PASSGBUFFER || _PASSFORWARDADD) && LIGHTMAP_ON)))
                  float4 texcoord1 : TEXCOORD1;
               #endif
               #if _STANDARD && (_USINGTEXCOORD2 || (_PASSMETA || ((_PASSFORWARD || _PASSGBUFFER) && DYNAMICLIGHTMAP_ON)))
                  float4 texcoord2 : TEXCOORD2;
               #endif
               #if _HDRP
                  float4 texcoord1 : TEXCOORD1;
                  float4 texcoord2 : TEXCOORD2;
               #endif
                float4 texcoord3 : TEXCOORD3;
               #if _PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR))
                  float3 previousPositionOS : TEXCOORD4; 
                  #if defined (_ADD_PRECOMPUTED_VELOCITY)
                     float3 precomputedVelocity    : TEXCOORD5; 
                  #endif
               #endif

               UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct TessVertex 
            {
               float4 vertex : INTERNALTESSPOS;
               float3 normal : NORMAL;
               float4 tangent : TANGENT;
               float4 texcoord0 : TEXCOORD0;
               float4 texcoord1 : TEXCOORD1;
               float4 texcoord2 : TEXCOORD2;
                float4 texcoord3 : TEXCOORD3;
               #if _PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR))
                  float3 previousPositionOS : TEXCOORD13; 
                  #if defined (_ADD_PRECOMPUTED_VELOCITY)
                     float3 precomputedVelocity : TEXCOORD14;
                  #endif
               #endif

               UNITY_VERTEX_INPUT_INSTANCE_ID
               UNITY_VERTEX_OUTPUT_STEREO
            };

            struct ExtraV2F
            {
               float4 extraV2F0;
               float4 extraV2F1;
               float4 extraV2F2;
               float4 extraV2F3;
               float4 extraV2F4;
               float4 extraV2F5;
               float4 extraV2F6;
               float4 extraV2F7;
               Blackboard blackboard;
               float4 time;
            };
            float3 WorldToTangentSpace(ShaderData d, float3 normal)
            {
               return mul(d.TBNMatrix, normal);
            }

            float3 TangentToWorldSpace(ShaderData d, float3 normal)
            {
               return mul(normal, d.TBNMatrix);
            }
            #if _STANDARD
               float3 TransformWorldToObject(float3 p) { return mul(unity_WorldToObject, float4(p, 1)); };
               float3 TransformObjectToWorld(float3 p) { return mul(unity_ObjectToWorld, float4(p, 1)); };
               float4 TransformWorldToObject(float4 p) { return mul(unity_WorldToObject, p); };
               float4 TransformObjectToWorld(float4 p) { return mul(unity_ObjectToWorld, p); };
               float4x4 GetWorldToObjectMatrix() { return unity_WorldToObject; }
               float4x4 GetObjectToWorldMatrix() { return unity_ObjectToWorld; }
               #if (defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (SHADER_TARGET_SURFACE_ANALYSIS && !SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))
                 #define UNITY_SAMPLE_TEX2D_LOD(tex,coord, lod) tex.SampleLevel (sampler##tex,coord, lod)
                 #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord, lod) tex.SampleLevel (sampler##samplertex,coord, lod)
              #else
                 #define UNITY_SAMPLE_TEX2D_LOD(tex,coord,lod) tex2D (tex,coord,0,lod)
                 #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord,lod) tex2D (tex,coord,0,lod)
              #endif

               #undef GetWorldToObjectMatrix()

               #define GetWorldToObjectMatrix()   unity_WorldToObject
            #endif

            float3 GetCameraWorldPosition()
            {
               #if _HDRP
                  return GetCameraRelativePositionWS(_WorldSpaceCameraPos);
               #else
                  return _WorldSpaceCameraPos;
               #endif
            }

            #if _GRABPASSUSED
               #if _STANDARD
                  TEXTURE2D(%GRABTEXTURE%);
                  SAMPLER(sampler_%GRABTEXTURE%);
               #endif

               half3 GetSceneColor(float2 uv)
               {
                  #if _STANDARD
                     return SAMPLE_TEXTURE2D(%GRABTEXTURE%, sampler_%GRABTEXTURE%, uv).rgb;
                  #else
                     return SHADERGRAPH_SAMPLE_SCENE_COLOR(uv);
                  #endif
               }
            #endif
            #if _STANDARD
               UNITY_DECLARE_DEPTH_TEXTURE(_CameraDepthTexture);
               float GetSceneDepth(float2 uv) { return SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, uv); }
               float GetLinear01Depth(float2 uv) { return Linear01Depth(GetSceneDepth(uv)); }
               float GetLinearEyeDepth(float2 uv) { return LinearEyeDepth(GetSceneDepth(uv)); } 
            #else
               float GetSceneDepth(float2 uv) { return SHADERGRAPH_SAMPLE_SCENE_DEPTH(uv); }
               float GetLinear01Depth(float2 uv) { return Linear01Depth(GetSceneDepth(uv), _ZBufferParams); }
               float GetLinearEyeDepth(float2 uv) { return LinearEyeDepth(GetSceneDepth(uv), _ZBufferParams); } 
            #endif

            float3 GetWorldPositionFromDepthBuffer(float2 uv, float3 worldSpaceViewDir)
            {
               float eye = GetLinearEyeDepth(uv);
               float3 camView = mul((float3x3)GetObjectToWorldMatrix(), transpose(mul(GetWorldToObjectMatrix(), UNITY_MATRIX_I_V)) [2].xyz);

               float dt = dot(worldSpaceViewDir, camView);
               float3 div = worldSpaceViewDir/dt;
               float3 wpos = (eye * div) + GetCameraWorldPosition();
               return wpos;
            }

            #if _HDRP
            float3 ObjectToWorldSpacePosition(float3 pos)
            {
               return GetAbsolutePositionWS(TransformObjectToWorld(pos));
            }
            #else
            float3 ObjectToWorldSpacePosition(float3 pos)
            {
               return TransformObjectToWorld(pos);
            }
            #endif

            #if _STANDARD
               UNITY_DECLARE_SCREENSPACE_TEXTURE(_CameraDepthNormalsTexture);
               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  float4 depthNorms = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_CameraDepthNormalsTexture, uv);
                  float3 norms = DecodeViewNormalStereo(depthNorms);
                  norms = mul((float3x3)GetWorldToViewMatrix(), norms) * 0.5 + 0.5;
                  return norms;
               }
            #elif _HDRP && !_DECALSHADER
               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  NormalData nd;
                  DecodeFromNormalBuffer(_ScreenSize.xy * uv, nd);
                  return nd.normalWS;
               }
            #elif _URP
               #if (SHADER_LIBRARY_VERSION_MAJOR >= 10)
                  #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareNormalsTexture.hlsl"
               #endif

               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  #if (SHADER_LIBRARY_VERSION_MAJOR >= 10)
                     return SampleSceneNormals(uv);
                  #else
                     float3 wpos = GetWorldPositionFromDepthBuffer(uv, worldSpaceViewDir);
                     return normalize(-cross(ddx(wpos), ddy(wpos))) * 0.5 + 0.5;
                  #endif

                }
             #endif

             #if _HDRP

               half3 UnpackNormalmapRGorAG(half4 packednormal)
               {
                  packednormal.x *= packednormal.w;

                  half3 normal;
                  normal.xy = packednormal.xy * 2 - 1;
                  normal.z = sqrt(1 - saturate(dot(normal.xy, normal.xy)));
                  return normal;
               }
               half3 UnpackNormal(half4 packednormal)
               {
                  #if defined(UNITY_NO_DXT5nm)
                     return packednormal.xyz * 2 - 1;
                  #else
                     return UnpackNormalmapRGorAG(packednormal);
                  #endif
               }
            #endif
            #if _HDRP || _URP

               half3 UnpackScaleNormal(half4 packednormal, half scale)
               {
                 #ifndef UNITY_NO_DXT5nm
                   packednormal.x *= packednormal.w;
                 #endif
                   half3 normal;
                   normal.xy = (packednormal.xy * 2 - 1) * scale;
                   normal.z = sqrt(1 - saturate(dot(normal.xy, normal.xy)));
                   return normal;
               }	

             #endif
            void GetSun(out float3 lightDir, out float3 color)
            {
               lightDir = float3(0.5, 0.5, 0);
               color = 1;
               #if _HDRP
                  if (_DirectionalLightCount > 0)
                  {
                     DirectionalLightData light = _DirectionalLightDatas[0];
                     lightDir = -light.forward.xyz;
                     color = light.color;
                  }
               #elif _STANDARD
			         lightDir = normalize(_WorldSpaceLightPos0.xyz);
                  color = _LightColor0.rgb;
               #elif _URP
	               Light light = GetMainLight();
	               lightDir = light.direction;
	               color = light.color;
               #endif
            }
    sampler2D _EmissiveColorMap;
    sampler2D _BaseColorMap;
    sampler2D _MaskMap;
    sampler2D _NormalMap;
    sampler2D _NormalMapOS;
    sampler2D _DetailMap;
    sampler2D _TangentMap;
    sampler2D _TangentMapOS;
    sampler2D _AnisotropyMap;
    sampler2D _SubsurfaceMaskMap;
    sampler2D _TransmissionMaskMap;
    sampler2D _ThicknessMap;
    sampler2D _IridescenceThicknessMap;
    sampler2D _IridescenceMaskMap;
    sampler2D _SpecularColorMap;

    sampler2D _CoatMaskMap;

    float3 DecodeNormal (float4 sample, float scale) {
        #if defined(UNITY_NO_DXT5nm)
            return UnpackNormalRGB(sample, scale);
        #else
            return UnpackNormalmapRGorAG(sample, scale);
        #endif
    }

	void Ext_SurfaceFunction0 (inout Surface o, ShaderData d)
	{
        float2 uvBase = (_UVMappingMask.x * d.texcoord0 +
                        _UVMappingMask.y * d.texcoord1 +
                        _UVMappingMask.z * d.texcoord2 +
                        _UVMappingMask.w * d.texcoord3).xy;

        float2 uvDetails =  (_UVDetailsMappingMask.x * d.texcoord0 +
                            _UVDetailsMappingMask.y * d.texcoord1 +
                            _UVDetailsMappingMask.z * d.texcoord2 +
                            _UVDetailsMappingMask.w * d.texcoord3).xy;
        float4 texcoords;
        texcoords.xy = uvBase * _BaseColorMap_ST.xy + _BaseColorMap_ST.zw; 

        texcoords.zw = uvDetails * _DetailMap_ST.xy + _DetailMap_ST.zw;

        if (_LinkDetailsWithBase > 0.0)
        {
            texcoords.zw = texcoords.zw  * _BaseColorMap_ST.xy + _BaseColorMap_ST.zw;

        }

            float3 detailNormalTS = float3(0.0, 0.0, 0.0);
            float detailMask = 0.0;
            #ifdef _DETAIL_MAP
                detailMask = 1.0;
                #ifdef _MASKMAP
                    detailMask = tex2D(_MaskMap, texcoords.xy).b;
                #endif
                float2 detailAlbedoAndSmoothness = tex2D(_DetailMap, texcoords.zw).rb;
                float detailAlbedo = detailAlbedoAndSmoothness.r * 2.0 - 1.0;
                float detailSmoothness = detailAlbedoAndSmoothness.g * 2.0 - 1.0;
                real4 packedNormal = tex2D(_DetailMap, texcoords.zw).rgba;
                detailNormalTS = UnpackNormalAG(packedNormal, _DetailNormalScale);
            #endif
            float4 color = tex2D(_BaseColorMap, texcoords.xy).rgba  * _Color.rgba;
            o.Albedo = color.rgb; 
            float alpha = color.a;
            alpha = lerp(_AlphaRemapMin, _AlphaRemapMax, alpha);
            o.Alpha = alpha;
            #ifdef _DETAIL_MAP
                float albedoDetailSpeed = saturate(abs(detailAlbedo) * _DetailAlbedoScale);
                float3 baseColorOverlay = lerp(sqrt(o.Albedo), (detailAlbedo < 0.0) ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0), albedoDetailSpeed * albedoDetailSpeed);
                baseColorOverlay *= baseColorOverlay;
                o.Albedo = lerp(o.Albedo, saturate(baseColorOverlay), detailMask);
            #endif

            #ifdef _NORMALMAP
                float3 normalTS;
                #ifdef _NORMALMAP_TANGENT_SPACE
                    normalTS = DecodeNormal(tex2D(_NormalMap, texcoords.xy), _NormalScale);
                #else
                    #ifdef SURFACE_GRADIENT
                        float3 normalOS = tex2D(_NormalMapOS, texcoords.xy).xyz * 2.0 - 1.0;
                        normalTS = SurfaceGradientFromPerturbedNormal(d.worldSpaceNormal, TransformObjectToWorldNormal(normalOS));
                    #else
                        float3 normalOS = UnpackNormalRGB(tex2D(_NormalMapOS, texcoords.xy), 1.0);
                        float3 bitangent = d.tangentSign * cross(d.worldSpaceNormal.xyz, d.worldSpaceTangent.xyz);
                        half3x3 tangentToWorld = half3x3(d.worldSpaceTangent.xyz, bitangent.xyz, d.worldSpaceNormal.xyz);
                        normalTS = TransformObjectToTangent(normalOS, tangentToWorld);
                    #endif
                #endif

                #ifdef _DETAIL_MAP
                    #ifdef SURFACE_GRADIENT
                    normalTS += detailNormalTS * detailMask;
                    #else
                    normalTS = lerp(normalTS, BlendNormalRNM(normalTS, normalize(detailNormalTS)), detailMask); 
                    #endif
                #endif
                o.Normal = normalTS;

            #endif

            #if defined(_MASKMAP)
                o.Smoothness = tex2D(_MaskMap, texcoords.xy).a;
                o.Smoothness = lerp(_SmoothnessRemapMin, _SmoothnessRemapMax, o.Smoothness);
            #else
                o.Smoothness = _Smoothness;
            #endif
            #ifdef _DETAIL_MAP
                float smoothnessDetailSpeed = saturate(abs(detailSmoothness) * _DetailSmoothnessScale);
                float smoothnessOverlay = lerp(o.Smoothness, (detailSmoothness < 0.0) ? 0.0 : 1.0, smoothnessDetailSpeed);
                o.Smoothness = lerp(o.Smoothness, saturate(smoothnessOverlay), detailMask);
            #endif
            #ifdef _MASKMAP
                o.Metallic = tex2D(_MaskMap, texcoords.xy).r;
                o.Metallic = lerp(_MetallicRemapMin, _MetallicRemapMax, o.Metallic);
                o.Occlusion = tex2D(_MaskMap, texcoords.xy).g;
                o.Occlusion = lerp(_AORemapMin, _AORemapMax, o.Occlusion);
            #else
                o.Metallic = _Metallic;
                o.Occlusion = 1.0;
            #endif

            #if defined(_SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP)
            #elif  defined(_MASKMAP) && !defined(_SPECULAR_OCCLUSION_NONE)
                float3 V = normalize(d.worldSpaceViewDir);
                o.SpecularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(d.worldSpaceNormal, V)), o.Occlusion, PerceptualSmoothnessToRoughness(o.Smoothness));
            #endif

            o.DiffusionProfileHash = asuint(_DiffusionProfileHash);
            o.SubsurfaceMask = _SubsurfaceMask;
            #ifdef _SUBSURFACE_MASK_MAP
                o.SubsurfaceMask *= tex2D(_SubsurfaceMaskMap, texcoords.xy).r;
            #endif
            #ifdef _THICKNESSMAP
                o.Thickness = tex2D(_ThicknessMap, texcoords.xy).r;
                o.Thickness = _ThicknessRemap.x + _ThicknessRemap.y * surfaceData.thickness;
            #else
                o.Thickness = _Thickness;
            #endif
            #ifdef _ANISOTROPYMAP
                o.Anisotropy = tex2D(_AnisotropyMap, texcoords.xy).r;
            #else
                o.Anisotropy = 1.0;
            #endif
                o.Anisotropy *= _Anisotropy;
                o.Specular = _SpecularColor.rgb;
            #ifdef _SPECULARCOLORMAP
                o.Specular *= tex2D(_SpecularColorMap, texcoords.xy).rgb;
            #endif
            #ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                o.Albedo *= _EnergyConservingSpecularColor > 0.0 ? (1.0 - Max3(o.Specular.r, o.Specular.g, o.Specular.b)) : 1.0;
            #endif
            #ifdef _MATERIAL_FEATURE_CLEAR_COAT
                o.CoatMask = _CoatMask;
                o.CoatMask *= tex2D(_CoatMaskMap, texcoords.xy).r;
            #else
                o.CoatMask = 0.0;
            #endif
            #ifdef _MATERIAL_FEATURE_IRIDESCENCE
                #ifdef _IRIDESCENCE_THICKNESSMAP
                o.IridescenceThickness = tex2D(_IridescenceThicknessMap, texcoords.xy).r;
                o.IridescenceThickness = _IridescenceThicknessRemap.x + _IridescenceThicknessRemap.y * o.IridescenceThickness;
                #else
                o.IridescenceThickness = _IridescenceThickness;
                #endif
                o.IridescenceMask = _IridescenceMask;
                o.IridescenceMask *= tex2D(_IridescenceMaskMap, texcoords.xy).r;
            #else
                o.IridescenceThickness = 0.0;
                o.IridescenceMask = 0.0;
            #endif
            float3 emissiveColor = _EmissiveColor * lerp(float3(1.0, 1.0, 1.0), o.Albedo.rgb, _AlbedoAffectEmissive);
            #ifdef _EMISSIVE_COLOR_MAP                
                float2 uvEmission = _UVMappingMaskEmissive.x * d.texcoord0 +
                                    _UVMappingMaskEmissive.y * d.texcoord1 +
                                    _UVMappingMaskEmissive.z * d.texcoord2 +
                                    _UVMappingMaskEmissive.w * d.texcoord3;

                uvEmission = uvEmission * _EmissiveColorMap_ST.xy + _EmissiveColorMap_ST.zw;                     

                emissiveColor *= tex2D(_EmissiveColorMap, uvEmission).rgb;
            #endif
            o.Emission += emissiveColor;
            float currentExposureMultiplier = 0;
            #if SHADEROPTIONS_PRE_EXPOSITION
                currentExposureMultiplier =  LOAD_TEXTURE2D(_ExposureTexture, int2(0, 0)).x * _ProbeExposureScale;
            #else
                currentExposureMultiplier =  _ProbeExposureScale;
            #endif
            float InverseCurrentExposureMultiplier = 0;
            float exposure = currentExposureMultiplier;
            InverseCurrentExposureMultiplier =  rcp(exposure + (exposure == 0.0)); 
            float3 emissiveRcpExposure = o.Emission * InverseCurrentExposureMultiplier;
            o.Emission = lerp(emissiveRcpExposure, o.Emission, _EmissiveExposureWeight);
            #if defined(_ALPHATEST_ON)
                float alphaTex = tex2D(_BaseColorMap, texcoords.xy).a;
                alphaTex = lerp(_AlphaRemapMin, _AlphaRemapMax, alphaTex);
                float alphaValue = alphaTex * _BaseColor.a;
                float alphaCutoff = _AlphaCutoff;
                clip(alpha - alphaCutoff);
            #endif

	}
    float _ArrayLength = 0;
    #if (defined(SHADER_API_GLES) || defined(SHADER_API_GLES3)) 
        float4 _PlayersPosVectorArray[20];
        float _PlayersDataFloatArray[150];     
    #else
        float4 _PlayersPosVectorArray[100];
        float _PlayersDataFloatArray[500];  
    #endif
    #if _ZONING
        #if (defined(SHADER_API_GLES) || defined(SHADER_API_GLES3)) 
            float _ZDFA[500];
        #else
            float _ZDFA[1000];
        #endif
        float _ZonesDataCount;
    #endif

    float _STSCustomTime = 0;
    #if _REPLACEMENT        
        half4 _DissolveColorGlobal;
        float _DissolveColorSaturationGlobal;
        float _DissolveEmissionGlobal;
        float _DissolveEmissionBoosterGlobal;
        float _TextureVisibilityGlobal;
        float _ObstructionGlobal;
        float _AngleStrengthGlobal;
        float _ConeStrengthGlobal;
        float _ConeObstructionDestroyRadiusGlobal;
        float _CylinderStrengthGlobal;
        float _CylinderObstructionDestroyRadiusGlobal;
        float _CircleStrengthGlobal;
        float _CircleObstructionDestroyRadiusGlobal;
        float _CurveStrengthGlobal;
        float _CurveObstructionDestroyRadiusGlobal;
        float _DissolveFallOffGlobal;
        float _AffectedAreaPlayerBasedObstructionGlobal;
        float _IntrinsicDissolveStrengthGlobal;
        float _PreviewModeGlobal;
        float _UVsGlobal;
        float _hasClippedShadowsGlobal;
        float _FloorGlobal;
        float _FloorModeGlobal;
        float _FloorYGlobal;
        float _PlayerPosYOffsetGlobal;
        float _FloorYTextureGradientLengthGlobal;
        float _AffectedAreaFloorGlobal;
        float _AnimationEnabledGlobal;
        float _AnimationSpeedGlobal;
        float _DefaultEffectRadiusGlobal;
        float _EnableDefaultEffectRadiusGlobal;
        float _TransitionDurationGlobal;        
        float _TexturedEmissionEdgeGlobal;
        float _TexturedEmissionEdgeStrengthGlobal;
        float _IsometricExclusionGlobal;
        float _IsometricExclusionDistanceGlobal;
        float _IsometricExclusionGradientLengthGlobal;
        float _CeilingGlobal;
        float _CeilingModeGlobal;
        float _CeilingBlendModeGlobal;
        float _CeilingYGlobal;
        float _CeilingPlayerYOffsetGlobal;
        float _CeilingYGradientLengthGlobal;
        float _ZoningGlobal;
        float _ZoningModeGlobal;
        float _ZoningEdgeGradientLengthGlobal;
        float _IsZoningRevealableGlobal;
        float _SyncZonesWithFloorYGlobal;
        float _SyncZonesFloorYOffsetGlobal;
        float4 _ObstructionCurveGlobal_TexelSize;
        float4 _DissolveMaskGlobal_TexelSize;
        float _DissolveMaskEnabledGlobal;
        float _PreviewIndicatorLineThicknessGlobal;
        half _UseCustomTimeGlobal;

        half _CrossSectionEnabledGlobal;
        half4 _CrossSectionColorGlobal;
        half _CrossSectionTextureEnabledGlobal;
        float _CrossSectionTextureScaleGlobal;
        half _CrossSectionUVScaledByDistanceGlobal;

        half _DissolveMethodGlobal;
        half _DissolveTexSpaceGlobal;

        float4 _DissolveTexGlobal_TexelSize;
    #endif
    #if _REPLACEMENT
        sampler2D _DissolveTexGlobal;
    #else
        sampler2D _DissolveTex;
    #endif
    #if _REPLACEMENT
        sampler2D _DissolveMaskGlobal;
    #else
        sampler2D _DissolveMask;
    #endif
    #if _REPLACEMENT
        sampler2D _ObstructionCurveGlobal;
    #else
        sampler2D _ObstructionCurve;
    #endif

    #if _REPLACEMENT
        sampler2D _CrossSectionTextureGlobal;
    #else
        sampler2D _CrossSectionTexture;
    #endif
#ifdef USE_UNITY_TEXTURE_2D_TYPE
#undef USE_UNITY_TEXTURE_2D_TYPE
#endif

#include "Packages/com.shadercrew.seethroughshader.core/Scripts/Shaders/xxSharedSTSDependencies/SeeThroughShaderFunction.hlsl"
	void Ext_SurfaceFunction1 (inout Surface o, ShaderData d)
	{
        half3 albedo;
        half3 emission;
        float alphaForClipping;
#ifdef USE_UNITY_TEXTURE_2D_TYPE
#undef USE_UNITY_TEXTURE_2D_TYPE
#endif
#if _REPLACEMENT
    DoSeeThroughShading( o.Albedo, o.Normal, d.worldSpacePosition, d.worldSpaceNormal, d.screenPos,
                        _numOfPlayersInside, _tDirection, _tValue, _id,
                        _TriggerMode, _RaycastMode,
                        _IsExempt,

                        _DissolveMethodGlobal, _DissolveTexSpaceGlobal,

                        _DissolveColorGlobal, _DissolveColorSaturationGlobal, _UVsGlobal,
                        _DissolveEmissionGlobal, _DissolveEmissionBoosterGlobal, _TexturedEmissionEdgeGlobal, _TexturedEmissionEdgeStrengthGlobal,
                        _hasClippedShadowsGlobal,

                        _ObstructionGlobal,
                        _AngleStrengthGlobal,
                        _ConeStrengthGlobal, _ConeObstructionDestroyRadiusGlobal,
                        _CylinderStrengthGlobal, _CylinderObstructionDestroyRadiusGlobal,
                        _CircleStrengthGlobal, _CircleObstructionDestroyRadiusGlobal,
                        _CurveStrengthGlobal, _CurveObstructionDestroyRadiusGlobal,
                        _DissolveFallOffGlobal,
                        _DissolveMaskEnabledGlobal,
                        _AffectedAreaPlayerBasedObstructionGlobal,
                        _IntrinsicDissolveStrengthGlobal,
                        _DefaultEffectRadiusGlobal, _EnableDefaultEffectRadiusGlobal,

                        _IsometricExclusionGlobal, _IsometricExclusionDistanceGlobal, _IsometricExclusionGradientLengthGlobal,
                        _CeilingGlobal, _CeilingModeGlobal, _CeilingBlendModeGlobal, _CeilingYGlobal, _CeilingPlayerYOffsetGlobal, _CeilingYGradientLengthGlobal,
                        _FloorGlobal, _FloorModeGlobal, _FloorYGlobal, _PlayerPosYOffsetGlobal, _FloorYTextureGradientLengthGlobal, _AffectedAreaFloorGlobal,

                        _AnimationEnabledGlobal, _AnimationSpeedGlobal,
                        _TransitionDurationGlobal,

                        _UseCustomTimeGlobal,

                        _ZoningGlobal, _ZoningModeGlobal, _IsZoningRevealableGlobal, _ZoningEdgeGradientLengthGlobal,
                        _SyncZonesWithFloorYGlobal, _SyncZonesFloorYOffsetGlobal,

                        _PreviewModeGlobal,
                        _PreviewIndicatorLineThicknessGlobal,

                        _DissolveTexGlobal,
                        _DissolveMaskGlobal,
                        _ObstructionCurveGlobal,

                        _DissolveTexGlobal_TexelSize,
                        _DissolveMaskGlobal_TexelSize,
                        _ObstructionCurveGlobal_TexelSize,

                        albedo, emission, alphaForClipping);
#else 
    DoSeeThroughShading( o.Albedo, o.Normal, d.worldSpacePosition, d.worldSpaceNormal, d.screenPos,

                        _numOfPlayersInside, _tDirection, _tValue, _id,
                        _TriggerMode, _RaycastMode,
                        _IsExempt,

                        _DissolveMethod, _DissolveTexSpace,

                        _DissolveColor, _DissolveColorSaturation, _UVs,
                        _DissolveEmission, _DissolveEmissionBooster, _TexturedEmissionEdge, _TexturedEmissionEdgeStrength,
                        _hasClippedShadows,

                        _Obstruction,
                        _AngleStrength,
                        _ConeStrength, _ConeObstructionDestroyRadius,
                        _CylinderStrength, _CylinderObstructionDestroyRadius,
                        _CircleStrength, _CircleObstructionDestroyRadius,
                        _CurveStrength, _CurveObstructionDestroyRadius,
                        _DissolveFallOff,
                        _DissolveMaskEnabled,
                        _AffectedAreaPlayerBasedObstruction,
                        _IntrinsicDissolveStrength,
                        _DefaultEffectRadius, _EnableDefaultEffectRadius,

                        _IsometricExclusion, _IsometricExclusionDistance, _IsometricExclusionGradientLength,
                        _Ceiling, _CeilingMode, _CeilingBlendMode, _CeilingY, _CeilingPlayerYOffset, _CeilingYGradientLength,
                        _Floor, _FloorMode, _FloorY, _PlayerPosYOffset, _FloorYTextureGradientLength, _AffectedAreaFloor,

                        _AnimationEnabled, _AnimationSpeed,
                        _TransitionDuration,

                        _UseCustomTime,

                        _Zoning, _ZoningMode , _IsZoningRevealable, _ZoningEdgeGradientLength,
                        _SyncZonesWithFloorY, _SyncZonesFloorYOffset,

                        _PreviewMode,
                        _PreviewIndicatorLineThickness,                            

                        _DissolveTex,
                        _DissolveMask,
                        _ObstructionCurve,

                        _DissolveTex_TexelSize,
                        _DissolveMask_TexelSize,
                        _ObstructionCurve_TexelSize,

                        albedo, emission, alphaForClipping);
#endif 
        o.Albedo = albedo;
        o.Emission += emission;   

	}
    void Ext_FinalColorForward1 (Surface o, ShaderData d, inout half4 color)
    {
        #if _REPLACEMENT   
            DoCrossSection(_CrossSectionEnabledGlobal,
                        _CrossSectionColorGlobal,
                        _CrossSectionTextureEnabledGlobal,
                        _CrossSectionTextureGlobal,
                        _CrossSectionTextureScaleGlobal,
                        _CrossSectionUVScaledByDistanceGlobal,
                        d.isFrontFace,
                        d.screenPos,
                        color);
        #else 
            DoCrossSection(_CrossSectionEnabled,
                        _CrossSectionColor,
                        _CrossSectionTextureEnabled,
                        _CrossSectionTexture,
                        _CrossSectionTextureScale,
                        _CrossSectionUVScaledByDistance,
                        d.isFrontFace,
                        d.screenPos,
                        color);
        #endif
    }
            void ChainSurfaceFunction(inout Surface l, inout ShaderData d)
            {
                  Ext_SurfaceFunction0(l, d);
                  Ext_SurfaceFunction1(l, d);
            }

#if !_DECALSHADER

            void ChainModifyVertex(inout VertexData v, inout VertexToPixel v2p, float4 time)
            {
                 ExtraV2F d;
                 ZERO_INITIALIZE(ExtraV2F, d);
                 ZERO_INITIALIZE(Blackboard, d.blackboard);
                 d.time = time;
            }

            void ChainModifyTessellatedVertex(inout VertexData v, inout VertexToPixel v2p)
            {
               ExtraV2F d;
               ZERO_INITIALIZE(ExtraV2F, d);
               ZERO_INITIALIZE(Blackboard, d.blackboard);
            }

            void ChainFinalColorForward(inout Surface l, inout ShaderData d, inout half4 color)
            {
                  Ext_FinalColorForward1(l, d, color);
            }

            void ChainFinalGBufferStandard(inout Surface s, inout ShaderData d, inout half4 GBuffer0, inout half4 GBuffer1, inout half4 GBuffer2, inout half4 outEmission, inout half4 outShadowMask)
            {
            }
#endif
#if _DECALSHADER

        ShaderData CreateShaderData(SurfaceDescriptionInputs IN)
        {
            ShaderData d = (ShaderData)0;
            d.TBNMatrix = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
            d.worldSpaceNormal = IN.WorldSpaceNormal;
            d.worldSpaceTangent = IN.WorldSpaceTangent;

            d.worldSpacePosition = IN.WorldSpacePosition;
            d.texcoord0 = IN.uv0.xyxy;
            d.screenPos = IN.ScreenPosition;

            d.worldSpaceViewDir = normalize(_WorldSpaceCameraPos - d.worldSpacePosition);

            d.tangentSpaceViewDir = mul(d.TBNMatrix, d.worldSpaceViewDir);
            #if _HDRP
            #else
            #endif
             d.screenUV = (IN.ScreenPosition.xy / max(0.01, IN.ScreenPosition.w));
            return d;
        }
#else

         ShaderData CreateShaderData(VertexToPixel i
                  #if NEED_FACING
                     , bool facing
                  #endif
         )
         {
            ShaderData d = (ShaderData)0;
            d.clipPos = i.pos;
            d.worldSpacePosition = i.worldPos;

            d.worldSpaceNormal = normalize(i.worldNormal);
            d.worldSpaceTangent.xyz = normalize(i.worldTangent.xyz);

            d.tangentSign = i.worldTangent.w * unity_WorldTransformParams.w;
            float3 bitangent = cross(d.worldSpaceTangent.xyz, d.worldSpaceNormal) * d.tangentSign;
            d.TBNMatrix = float3x3(d.worldSpaceTangent, -bitangent, d.worldSpaceNormal);
            d.worldSpaceViewDir = normalize(_WorldSpaceCameraPos - i.worldPos);

            d.tangentSpaceViewDir = mul(d.TBNMatrix, d.worldSpaceViewDir);
             d.texcoord0 = i.texcoord0;
             d.texcoord1 = i.texcoord1;
             d.texcoord2 = i.texcoord2;
             d.texcoord3 = i.texcoord3;
             d.isFrontFace = facing;
            #if _HDRP
            #else
            #endif
             d.screenPos = i.screenPos;
             d.screenUV = (i.screenPos.xy / i.screenPos.w);
            return d;
         }

#endif
#if (SHADERPASS == SHADERPASS_LIGHT_TRANSPORT)
   float unity_OneOverOutputBoost;
   float unity_MaxOutputValue;

   CBUFFER_START(UnityMetaPass)
   bool4 unity_MetaVertexControl;
   bool4 unity_MetaFragmentControl;
   CBUFFER_END

   VertexToPixel Vert(VertexData inputMesh)
   {
       VertexToPixel output;
       ZERO_INITIALIZE(VertexToPixel, output);
       UNITY_SETUP_INSTANCE_ID(inputMesh);
       UNITY_TRANSFER_INSTANCE_ID(inputMesh, output);
       UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);
       float2 uv = float2(0.0, 0.0);

       if (unity_MetaVertexControl.x)
       {
           uv = inputMesh.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
       }
       else if (unity_MetaVertexControl.y)
       {
           uv = inputMesh.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
       }
       output.pos = float4(uv * 2.0 - 1.0, inputMesh.vertex.z > 0 ? 1.0e-4 : 0.0, 1.0);

       output.worldPos = TransformObjectToWorld(inputMesh.vertex.xyz).xyz;
       output.worldNormal = TransformObjectToWorldNormal(inputMesh.normal);
       output.worldTangent = float4(1.0, 0.0, 0.0, 0.0);

       output.texcoord0 = inputMesh.texcoord0;
       output.texcoord1 = inputMesh.texcoord1;
       output.texcoord2 = inputMesh.texcoord2;
        output.texcoord3 = inputMesh.texcoord3;
       return output;
   }
#else

   #if (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
      #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariablesMatrixDefsHDCamera.hlsl"

      void MotionVectorPositionZBias(VertexToPixel input)
      {
      #if UNITY_REVERSED_Z
          input.pos.z -= unity_MotionVectorsParams.z * input.pos.w;
      #else
          input.pos.z += unity_MotionVectorsParams.z * input.pos.w;
      #endif
      }

   #endif

   VertexToPixel Vert(VertexData input)
   {
       VertexToPixel output;
       ZERO_INITIALIZE(VertexToPixel, output);

       UNITY_SETUP_INSTANCE_ID(input);
       UNITY_TRANSFER_INSTANCE_ID(input, output);
       UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

       #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
         VertexData previousMesh = input;
       #endif

       ChainModifyVertex(input, output, _Time);
       float3 positionRWS = TransformObjectToWorld(input.vertex.xyz);
       float3 normalWS = TransformObjectToWorldNormal(input.normal);
       float4 tangentWS = float4(TransformObjectToWorldDir(input.tangent.xyz), input.tangent.w);
       output.worldPos = GetAbsolutePositionWS(positionRWS);
       output.pos = TransformWorldToHClip(positionRWS);
       output.worldNormal = normalWS;
       output.worldTangent = tangentWS;
       output.texcoord0 = input.texcoord0;
       output.texcoord1 = input.texcoord1;
       output.texcoord2 = input.texcoord2;
        output.texcoord3 = input.texcoord3;
        output.screenPos = ComputeScreenPos(output.pos, _ProjectionParams.x);
       #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))

          #if !defined(TESSELLATION_ON)
            MotionVectorPositionZBias(output);
          #endif

          output.motionVectorCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(positionRWS.xyz, 1.0));
          bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
          if (forceNoMotion)
          {
              output.previousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
          }
          else
          {
            bool hasDeformation = unity_MotionVectorsParams.x > 0.0; 

            float3 effectivePositionOS = (hasDeformation ? previousMesh.previousPositionOS : previousMesh.vertex.xyz);
            #if defined(_ADD_PRECOMPUTED_VELOCITY)
               effectivePositionOS -= input.precomputedVelocity;
            #endif

            previousMesh.vertex = float4(effectivePositionOS, 1);
            VertexToPixel dummy = (VertexToPixel)0;
            ChainModifyVertex(previousMesh, dummy, _LastTimeParameters);
            float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.vertex.xyz);

            #ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
            if (_TransparentCameraOnlyMotionVectors > 0)
            {
               previousPositionRWS = positionRWS.xyz;
            }
            #endif 

            output.previousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
         }
       #endif 
       return output;
   }
#endif
               #if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
                  #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
               #endif

                FragInputs BuildFragInputs(VertexToPixel input)
                {
                    UNITY_SETUP_INSTANCE_ID(input);
                    FragInputs output;
                    ZERO_INITIALIZE(FragInputs, output);
                    output.tangentToWorld = k_identity3x3;
                    output.positionSS = input.pos;       
                    output.positionRWS = GetCameraRelativePositionWS(input.worldPos);
                    output.tangentToWorld = BuildTangentToWorld(input.worldTangent, input.worldNormal);
                    output.texCoord0 = input.texcoord0;
                    output.texCoord1 = input.texcoord1;
                    output.texCoord2 = input.texcoord2;
                    return output;
                }
               void BuildSurfaceData(FragInputs fragInputs, inout Surface surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
               {
                   ZERO_INITIALIZE(SurfaceData, surfaceData);
                   surfaceData.specularOcclusion = 1.0;
                   surfaceData.baseColor =                 surfaceDescription.Albedo;
                   surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;
                   surfaceData.ambientOcclusion =          surfaceDescription.Occlusion;
                   surfaceData.specularOcclusion =         surfaceDescription.SpecularOcclusion;
                   surfaceData.metallic =                  surfaceDescription.Metallic;
                   surfaceData.subsurfaceMask =            surfaceDescription.SubsurfaceMask;
                   surfaceData.thickness =                 surfaceDescription.Thickness;
                   surfaceData.diffusionProfileHash =      asuint(surfaceDescription.DiffusionProfileHash);
                   #if _USESPECULAR
                      surfaceData.specularColor =             surfaceDescription.Specular;
                   #endif
                   surfaceData.coatMask =                  surfaceDescription.CoatMask;
                   surfaceData.anisotropy =                surfaceDescription.Anisotropy;
                   surfaceData.iridescenceMask =           surfaceDescription.IridescenceMask;
                   surfaceData.iridescenceThickness =      surfaceDescription.IridescenceThickness;
                   #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                        if (_EnableSSRefraction)
                        {
                            surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                            surfaceDescription.Alpha = 1.0;
                        }
                        else
                        {
                            surfaceData.ior = surfaceDescription.ior;
                            surfaceData.transmittanceColor = surfaceDescription.transmittanceColor;
                            surfaceData.atDistance = surfaceDescription.atDistance;
                            surfaceData.transmittanceMask = surfaceDescription.transmittanceMask;
                            surfaceDescription.Alpha = 1.0;
                        }
                    #else
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                    #endif
                    surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
                    #ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
                    #endif
                    #ifdef _MATERIAL_FEATURE_TRANSMISSION
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
                    #endif
                    #ifdef _MATERIAL_FEATURE_ANISOTROPY
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                        surfaceData.normalWS = float3(0, 1, 0);
                    #endif
                    #ifdef _MATERIAL_FEATURE_IRIDESCENCE
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
                    #endif
                    #ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
                    #endif
                    #if defined(_MATERIAL_FEATURE_CLEAR_COAT) || _CLEARCOAT
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
                    #endif
                    #if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                        surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
                    #endif
                   #if !_WORLDSPACENORMAL
                      surfaceData.normalWS = mul(surfaceDescription.Normal, fragInputs.tangentToWorld);
                   #else
                      surfaceData.normalWS = surfaceDescription.Normal;
                   #endif

                   surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                   surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    
                    #if HAVE_DECALS
                        if (_EnableDecals)
                        {
                            float alpha = 1.0;
                            alpha = surfaceDescription.Alpha;
                            DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], alpha);
                            ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
                        }
                    #endif
                    bentNormalWS = surfaceData.normalWS;
                    surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);
                    #ifdef DEBUG_DISPLAY
                        if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
                        {
                            surfaceData.metallic = 0;
                        }
                        ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
                    #endif
                    #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                    #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                        surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                    #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                        surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                    #endif
                    #if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
                        surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                    #endif
               }
               void GetSurfaceAndBuiltinData(VertexToPixel m2ps, FragInputs fragInputs, float3 V, inout PositionInputs posInput,
                     out SurfaceData surfaceData, out BuiltinData builtinData, inout Surface l, inout ShaderData d
                     #if NEED_FACING
                        , bool facing
                     #endif
                  )
               {
                 d = CreateShaderData(m2ps
                    #if NEED_FACING
                       , facing
                    #endif
                 );

                 l = (Surface)0;

                 l.Albedo = half3(0.5, 0.5, 0.5);
                 l.Normal = float3(0,0,1);
                 l.Occlusion = 1;
                 l.Alpha = 1;
                 l.SpecularOcclusion = 1;

                 #if !defined(SHADER_STAGE_RAY_TRACING) && defined(_DEPTHOFFSET_ON)
                    l.outputDepth = d.clipPos.z;
                 #endif

                 ChainSurfaceFunction(l, d);

                 #if !defined(SHADER_STAGE_RAY_TRACING) && defined(_DEPTHOFFSET_ON)
                 #endif

                 #if _UNLIT
                     l.Normal = half3(0,0,1);
                     l.Occlusion = 1;
                     l.Metallic = 0;
                     l.Specular = 0;
                 #endif

                 surfaceData.geomNormalWS = d.worldSpaceNormal;
                 surfaceData.tangentWS = d.worldSpaceTangent;
                 fragInputs.tangentToWorld = d.TBNMatrix;

                 float3 bentNormalWS;
                 BuildSurfaceData(fragInputs, l, V, posInput, surfaceData, bentNormalWS);
                 InitBuiltinData(posInput, l.Alpha, bentNormalWS, -d.worldSpaceNormal, fragInputs.texCoord1, fragInputs.texCoord2, builtinData);
                 builtinData.emissiveColor = l.Emission;

                 #if defined(_OVERRIDE_BAKEDGI)
                    builtinData.bakeDiffuseLighting = l.DiffuseGI;
                    builtinData.backBakeDiffuseLighting = l.BackDiffuseGI;
                    builtinData.emissiveColor += l.SpecularGI;
                 #endif

                 #if defined(_OVERRIDE_SHADOWMASK)
                    builtinData.shadowMask0 = l.ShadowMask.x;
                    builtinData.shadowMask1 = l.ShadowMask.y;
                    builtinData.shadowMask2 = l.ShadowMask.z;
                    builtinData.shadowMask3 = l.ShadowMask.w;
                 #endif

                 #if defined(UNITY_VIRTUAL_TEXTURING)
                    builtinData.vtPackedFeedback = surfaceData.VTPackedFeedback;
                 #endif

                  #if (SHADERPASS == SHADERPASS_DISTORTION)
                     builtinData.distortion = surfaceData.Distortion;
                     builtinData.distortionBlur = surfaceData.DistortionBlur;
                  #endif

                  #ifndef SHADER_UNLIT
                    PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                  #else
                    ApplyDebugToBuiltinData(builtinData);
                  #endif
                  RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
               }
            float4 Frag(VertexToPixel v2f
               #if NEED_FACING
                  , bool facing : SV_IsFrontFace
               #endif
            ) : SV_Target
            {
                FragInputs input = BuildFragInputs(v2f);
                PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

                float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

                SurfaceData surfaceData;
                BuiltinData builtinData;
                Surface l;
                ShaderData d;
                GetSurfaceAndBuiltinData(v2f, input, V, posInput, surfaceData, builtinData, l, d
               #if NEED_FACING
                  , facing
               #endif
               );
                BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);
                LightTransportData lightTransportData = GetLightTransportData(surfaceData, builtinData, bsdfData);
                float4 res = float4(0.0, 0.0, 0.0, 1.0);

                if (unity_MetaFragmentControl.x)
                {
                    res.rgb = clamp(pow(abs(lightTransportData.diffuseColor), saturate(unity_OneOverOutputBoost)), 0, unity_MaxOutputValue);
                }

                if (unity_MetaFragmentControl.y)
                {
                    res.rgb = lightTransportData.emissiveColor;
                }

                return res;
            }
            ENDHLSL
        }
              Pass
        {
            Name "SceneSelectionPass"
            Tags { "LightMode" = "SceneSelectionPass" }
            Cull Off
            ColorMask 0

                Cull [_CullMode]
            HLSLPROGRAM
            #pragma target 4.5
            #pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
            #pragma multi_compile_instancing
            #pragma editor_sync_compilation
            #pragma instancing_options renderinglayer
            #define _ENABLE_FOG_ON_TRANSPARENT 1
            #define SHADERPASS SHADERPASS_DEPTH_ONLY
            #define RAYTRACING_SHADER_GRAPH_DEFAULT
            #define SCENESELECTIONPASS
            #define _PASSSCENESELECT 1
    #pragma shader_feature_local _ALPHATEST_ON

    #pragma shader_feature_local_fragment _NORMALMAP_TANGENT_SPACE
    #pragma shader_feature_local _NORMALMAP
    #pragma shader_feature_local_fragment _MASKMAP
    #pragma shader_feature_local_fragment _EMISSIVE_COLOR_MAP
    #pragma shader_feature_local_fragment _ANISOTROPYMAP
    #pragma shader_feature_local_fragment _DETAIL_MAP
    #pragma shader_feature_local_fragment _SUBSURFACE_MASK_MAP
    #pragma shader_feature_local_fragment _THICKNESSMAP
    #pragma shader_feature_local_fragment _IRIDESCENCE_THICKNESSMAP
    #pragma shader_feature_local_fragment _SPECULARCOLORMAP
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_TRANSMISSION
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_ANISOTROPY
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_CLEAR_COAT
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_IRIDESCENCE
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_SPECULAR_COLOR
    #pragma shader_feature_local_fragment _ENABLESPECULAROCCLUSION
    #pragma shader_feature_local_fragment _ _SPECULAR_OCCLUSION_NONE _SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP

    #ifdef _ENABLESPECULAROCCLUSION
        #define _SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP
    #endif
        #pragma shader_feature_local_fragment _OBSTRUCTION_CURVE
        #pragma shader_feature_local_fragment _DISSOLVEMASK
        #pragma shader_feature_local_fragment _ZONING
        #pragma shader_feature_local_fragment _REPLACEMENT
        #pragma shader_feature_local_fragment _PLAYERINDEPENDENT
   #define _HDRP 1
#define _USINGTEXCOORD1 1
#define _USINGTEXCOORD2 1
#define NEED_FACING 1

               #pragma vertex Vert
   #pragma fragment Frag
      #define UNITY_DECLARE_TEX2D(name) TEXTURE2D(name); SAMPLER(sampler##name);
      #define UNITY_DECLARE_TEX2D_NOSAMPLER(name) TEXTURE2D(name);
      #define UNITY_DECLARE_TEX2DARRAY(name) TEXTURE2D_ARRAY(name); SAMPLER(sampler##name);
      #define UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(tex) TEXTURE2D_ARRAY(tex);

      #define UNITY_SAMPLE_TEX2DARRAY(tex,coord)            SAMPLE_TEXTURE2D_ARRAY(tex, sampler##tex, coord.xy, coord.z)
      #define UNITY_SAMPLE_TEX2DARRAY_LOD(tex,coord,lod)    SAMPLE_TEXTURE2D_ARRAY_LOD(tex, sampler##tex, coord.xy, coord.z, lod)
      #define UNITY_SAMPLE_TEX2D(tex, coord)                SAMPLE_TEXTURE2D(tex, sampler##tex, coord)
      #define UNITY_SAMPLE_TEX2D_SAMPLER(tex, samp, coord)  SAMPLE_TEXTURE2D(tex, sampler##samp, coord)

      #define UNITY_SAMPLE_TEX2D_LOD(tex,coord, lod)   SAMPLE_TEXTURE2D_LOD(tex, sampler_##tex, coord, lod)
      #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord, lod) SAMPLE_TEXTURE2D_LOD (tex, sampler##samplertex,coord, lod)

      #if defined(UNITY_COMPILER_HLSL)
         #define UNITY_INITIALIZE_OUTPUT(type,name) name = (type)0;
      #else
         #define UNITY_INITIALIZE_OUTPUT(type,name)
      #endif

      #define sampler2D_float sampler2D
      #define sampler2D_half sampler2D

      #undef WorldNormalVector
      #define WorldNormalVector(data, normal) mul(normal, data.TBNMatrix)

      #define UnityObjectToWorldNormal(normal) mul(GetObjectToWorldMatrix(), normal)
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
#if UNITY_VERSION >= UNITY_2021_3_31
       #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl" 
#else
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" 
#endif    
            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT 
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
            #define RAYTRACING_SHADER_GRAPH_LOW
            #endif
            #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
               #define OUTPUT_SPLIT_LIGHTING
            #endif

            #define HAVE_RECURSIVE_RENDERING

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
               #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                  #define WRITE_NORMAL_BUFFER
               #endif
            #endif

            #ifndef DEBUG_DISPLAY
               #if !defined(_SURFACE_TYPE_TRANSPARENT) && defined(_ALPHATEST)
                  #if SHADERPASS == SHADERPASS_FORWARD
                  #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                  #elif SHADERPASS == SHADERPASS_GBUFFER
                  #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                  #endif
               #endif
            #endif
            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
               #define _DEFERRED_CAPABLE_MATERIAL
            #endif
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
               #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
            CBUFFER_START(UnityPerMaterial)
               float _UseShadowThreshold;
               float _BlendMode;
               float _EnableBlendModePreserveSpecularLighting;
               float _RayTracing;
               float _RefractionModel;
    float4 _BaseColorMap_ST;
    float4 _DetailMap_ST;
    float4 _EmissiveColorMap_ST;

    float _UVBase;
    half4 _Color;
    half4 _BaseColor; 
    half _Cutoff; 
    half _Mode;
    float _CullMode;
    float _CullModeForward;
    half _Metallic;
    half3 _EmissionColor;
    half _UVSec;

    float3 _EmissiveColor;
    float _AlbedoAffectEmissive;
    float _EmissiveExposureWeight;
    float _MetallicRemapMin;
    float _MetallicRemapMax;
    float _Smoothness;
    float _SmoothnessRemapMin;
    float _SmoothnessRemapMax;
    float _AlphaRemapMin;
    float _AlphaRemapMax;
    float _AORemapMin;
    float _AORemapMax;
    float _NormalScale;
    float _DetailAlbedoScale;
    float _DetailNormalScale;
    float _DetailSmoothnessScale;
    float _Anisotropy;
    float _DiffusionProfileHash;
    float _SubsurfaceMask;
    float _Thickness;
    float4 _ThicknessRemap;
    float _IridescenceThickness;
    float4 _IridescenceThicknessRemap;
    float _IridescenceMask;
    float _CoatMask;
    float4 _SpecularColor;
    float _EnergyConservingSpecularColor;
    int _MaterialID;

    float _LinkDetailsWithBase;
    float4 _UVMappingMask;
    float4 _UVDetailsMappingMask;

    float4 _UVMappingMaskEmissive;

    float _AlphaCutoff;
    float _SyncCullMode;

    float _IsReplacementShader;
    float _TriggerMode;
    float _RaycastMode;
    float _IsExempt;
    float _isReferenceMaterial;
    float _InteractionMode;

    float _tDirection = 0;
    float _numOfPlayersInside = 0;
    float _tValue = 0;
    float _id = 0;
    half _TextureVisibility;
    half _AngleStrength;
    float _Obstruction;
    float _UVs;
    float4 _ObstructionCurve_TexelSize;      
    float _DissolveMaskEnabled;
    float4 _DissolveMask_TexelSize;
    float4 _DissolveTex_TexelSize;
    half4 _DissolveColor;
    float _DissolveColorSaturation;
    float _DissolveEmission;
    float _DissolveEmissionBooster;
    float _hasClippedShadows;
    float _ConeStrength;
    float _ConeObstructionDestroyRadius;
    float _CylinderStrength;
    float _CylinderObstructionDestroyRadius;
    float _CircleStrength;
    float _CircleObstructionDestroyRadius;
    float _CurveStrength;
    float _CurveObstructionDestroyRadius;
    float _IntrinsicDissolveStrength;
    float _DissolveFallOff;
    float _AffectedAreaPlayerBasedObstruction;
    float _PreviewMode;
    float _PreviewIndicatorLineThickness;
    float _AnimationEnabled;
    float _AnimationSpeed;
    float _DefaultEffectRadius;
    float _EnableDefaultEffectRadius;
    float _TransitionDuration;
    float _TexturedEmissionEdge;
    float _TexturedEmissionEdgeStrength;
    float _IsometricExclusion;
    float _IsometricExclusionDistance;
    float _IsometricExclusionGradientLength;
    float _Floor;
    float _FloorMode;
    float _FloorY;
    float _FloorYTextureGradientLength;
    float _PlayerPosYOffset;
    float _AffectedAreaFloor;
    float _Ceiling;
    float _CeilingMode;
    float _CeilingBlendMode;
    float _CeilingY;
    float _CeilingPlayerYOffset;
    float _CeilingYGradientLength;
    float _Zoning;
    float _ZoningMode;
    float _ZoningEdgeGradientLength;
    float _IsZoningRevealable;
    float _SyncZonesWithFloorY;
    float _SyncZonesFloorYOffset;

    half _UseCustomTime;

    half _CrossSectionEnabled;
    half4 _CrossSectionColor;
    half _CrossSectionTextureEnabled;
    float _CrossSectionTextureScale;
    half _CrossSectionUVScaledByDistance;
    half _DissolveMethod;
    half _DissolveTexSpace;
            CBUFFER_END
               #ifdef SCENEPICKINGPASS
               float4 _SelectionID;
               #endif
               #ifdef SCENESELECTIONPASS
               int _ObjectId;
               int _PassValue;
               #endif
            struct VertexToPixel
            {
               float4 pos : SV_POSITION;
               float3 worldPos : TEXCOORD0;
               float3 worldNormal : TEXCOORD1;
               float4 worldTangent : TEXCOORD2;
               float4 texcoord0 : TEXCOORD3;
               float4 texcoord1 : TEXCOORD4;
               float4 texcoord2 : TEXCOORD5;
                float4 texcoord3 : TEXCOORD6;
                float4 screenPos : TEXCOORD7;
               #if UNITY_ANY_INSTANCING_ENABLED
                  UNITY_VERTEX_INPUT_INSTANCE_ID
               #endif 

               #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
                  float4 previousPositionCS : TEXCOORD16; 
                  float4 motionVectorCS : TEXCOORD17;
               #endif

               UNITY_VERTEX_OUTPUT_STEREO
            }; 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
            struct Surface
            {
               half3 Albedo;
               half Height;
               half3 Normal;
               half Smoothness;
               half3 Emission;
               half Metallic;
               half3 Specular;
               half Occlusion;
               half SpecularPower; 
               half Alpha;
               float outputDepth; 
               half SpecularOcclusion;
               half SubsurfaceMask;
               half Thickness;
               half CoatMask;
               half CoatSmoothness;
               half Anisotropy;
               half IridescenceMask;
               half IridescenceThickness;
               int DiffusionProfileHash;
               float SpecularAAThreshold;
               float SpecularAAScreenSpaceVariance;
               float3 DiffuseGI;
               float3 BackDiffuseGI;
               float3 SpecularGI;
               float ior;
               float3 transmittanceColor;
               float atDistance;
               float transmittanceMask;
               float4 ShadowMask;
               float NormalAlpha;
               float MAOSAlpha;
            };
            struct Blackboard
            {
                float blackboardDummyData;
            };
            struct ShaderData
            {
               float4 clipPos; 
               float3 localSpacePosition;
               float3 localSpaceNormal;
               float3 localSpaceTangent;
               float3 worldSpacePosition;
               float3 worldSpaceNormal;
               float3 worldSpaceTangent;
               float tangentSign;

               float3 worldSpaceViewDir;
               float3 tangentSpaceViewDir;

               float4 texcoord0;
               float4 texcoord1;
               float4 texcoord2;
               float4 texcoord3;

               float2 screenUV;
               float4 screenPos;

               float4 vertexColor;
               bool isFrontFace;

               float4 extraV2F0;
               float4 extraV2F1;
               float4 extraV2F2;
               float4 extraV2F3;
               float4 extraV2F4;
               float4 extraV2F5;
               float4 extraV2F6;
               float4 extraV2F7;

               float3x3 TBNMatrix;
               Blackboard blackboard;
            };

            struct VertexData
            {
               #if SHADER_TARGET > 30
               #endif
               float4 vertex : POSITION;
               float3 normal : NORMAL;
               float4 tangent : TANGENT;
               float4 texcoord0 : TEXCOORD0;
               #if _URP && (_USINGTEXCOORD1 || _PASSMETA || _PASSFORWARD || _PASSGBUFFER)
                  float4 texcoord1 : TEXCOORD1;
               #endif

               #if _URP && (_USINGTEXCOORD2 || _PASSMETA || ((_PASSFORWARD || _PASSGBUFFER) && defined(DYNAMICLIGHTMAP_ON)))
                  float4 texcoord2 : TEXCOORD2;
               #endif

               #if _STANDARD && (_USINGTEXCOORD1 || (_PASSMETA || ((_PASSFORWARD || _PASSGBUFFER || _PASSFORWARDADD) && LIGHTMAP_ON)))
                  float4 texcoord1 : TEXCOORD1;
               #endif
               #if _STANDARD && (_USINGTEXCOORD2 || (_PASSMETA || ((_PASSFORWARD || _PASSGBUFFER) && DYNAMICLIGHTMAP_ON)))
                  float4 texcoord2 : TEXCOORD2;
               #endif
               #if _HDRP
                  float4 texcoord1 : TEXCOORD1;
                  float4 texcoord2 : TEXCOORD2;
               #endif
                float4 texcoord3 : TEXCOORD3;
               #if _PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR))
                  float3 previousPositionOS : TEXCOORD4; 
                  #if defined (_ADD_PRECOMPUTED_VELOCITY)
                     float3 precomputedVelocity    : TEXCOORD5; 
                  #endif
               #endif

               UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct TessVertex 
            {
               float4 vertex : INTERNALTESSPOS;
               float3 normal : NORMAL;
               float4 tangent : TANGENT;
               float4 texcoord0 : TEXCOORD0;
               float4 texcoord1 : TEXCOORD1;
               float4 texcoord2 : TEXCOORD2;
                float4 texcoord3 : TEXCOORD3;
               #if _PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR))
                  float3 previousPositionOS : TEXCOORD13; 
                  #if defined (_ADD_PRECOMPUTED_VELOCITY)
                     float3 precomputedVelocity : TEXCOORD14;
                  #endif
               #endif

               UNITY_VERTEX_INPUT_INSTANCE_ID
               UNITY_VERTEX_OUTPUT_STEREO
            };

            struct ExtraV2F
            {
               float4 extraV2F0;
               float4 extraV2F1;
               float4 extraV2F2;
               float4 extraV2F3;
               float4 extraV2F4;
               float4 extraV2F5;
               float4 extraV2F6;
               float4 extraV2F7;
               Blackboard blackboard;
               float4 time;
            };
            float3 WorldToTangentSpace(ShaderData d, float3 normal)
            {
               return mul(d.TBNMatrix, normal);
            }

            float3 TangentToWorldSpace(ShaderData d, float3 normal)
            {
               return mul(normal, d.TBNMatrix);
            }
            #if _STANDARD
               float3 TransformWorldToObject(float3 p) { return mul(unity_WorldToObject, float4(p, 1)); };
               float3 TransformObjectToWorld(float3 p) { return mul(unity_ObjectToWorld, float4(p, 1)); };
               float4 TransformWorldToObject(float4 p) { return mul(unity_WorldToObject, p); };
               float4 TransformObjectToWorld(float4 p) { return mul(unity_ObjectToWorld, p); };
               float4x4 GetWorldToObjectMatrix() { return unity_WorldToObject; }
               float4x4 GetObjectToWorldMatrix() { return unity_ObjectToWorld; }
               #if (defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (SHADER_TARGET_SURFACE_ANALYSIS && !SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))
                 #define UNITY_SAMPLE_TEX2D_LOD(tex,coord, lod) tex.SampleLevel (sampler##tex,coord, lod)
                 #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord, lod) tex.SampleLevel (sampler##samplertex,coord, lod)
              #else
                 #define UNITY_SAMPLE_TEX2D_LOD(tex,coord,lod) tex2D (tex,coord,0,lod)
                 #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord,lod) tex2D (tex,coord,0,lod)
              #endif

               #undef GetWorldToObjectMatrix()

               #define GetWorldToObjectMatrix()   unity_WorldToObject
            #endif

            float3 GetCameraWorldPosition()
            {
               #if _HDRP
                  return GetCameraRelativePositionWS(_WorldSpaceCameraPos);
               #else
                  return _WorldSpaceCameraPos;
               #endif
            }

            #if _GRABPASSUSED
               #if _STANDARD
                  TEXTURE2D(%GRABTEXTURE%);
                  SAMPLER(sampler_%GRABTEXTURE%);
               #endif

               half3 GetSceneColor(float2 uv)
               {
                  #if _STANDARD
                     return SAMPLE_TEXTURE2D(%GRABTEXTURE%, sampler_%GRABTEXTURE%, uv).rgb;
                  #else
                     return SHADERGRAPH_SAMPLE_SCENE_COLOR(uv);
                  #endif
               }
            #endif
            #if _STANDARD
               UNITY_DECLARE_DEPTH_TEXTURE(_CameraDepthTexture);
               float GetSceneDepth(float2 uv) { return SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, uv); }
               float GetLinear01Depth(float2 uv) { return Linear01Depth(GetSceneDepth(uv)); }
               float GetLinearEyeDepth(float2 uv) { return LinearEyeDepth(GetSceneDepth(uv)); } 
            #else
               float GetSceneDepth(float2 uv) { return SHADERGRAPH_SAMPLE_SCENE_DEPTH(uv); }
               float GetLinear01Depth(float2 uv) { return Linear01Depth(GetSceneDepth(uv), _ZBufferParams); }
               float GetLinearEyeDepth(float2 uv) { return LinearEyeDepth(GetSceneDepth(uv), _ZBufferParams); } 
            #endif

            float3 GetWorldPositionFromDepthBuffer(float2 uv, float3 worldSpaceViewDir)
            {
               float eye = GetLinearEyeDepth(uv);
               float3 camView = mul((float3x3)GetObjectToWorldMatrix(), transpose(mul(GetWorldToObjectMatrix(), UNITY_MATRIX_I_V)) [2].xyz);

               float dt = dot(worldSpaceViewDir, camView);
               float3 div = worldSpaceViewDir/dt;
               float3 wpos = (eye * div) + GetCameraWorldPosition();
               return wpos;
            }

            #if _HDRP
            float3 ObjectToWorldSpacePosition(float3 pos)
            {
               return GetAbsolutePositionWS(TransformObjectToWorld(pos));
            }
            #else
            float3 ObjectToWorldSpacePosition(float3 pos)
            {
               return TransformObjectToWorld(pos);
            }
            #endif

            #if _STANDARD
               UNITY_DECLARE_SCREENSPACE_TEXTURE(_CameraDepthNormalsTexture);
               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  float4 depthNorms = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_CameraDepthNormalsTexture, uv);
                  float3 norms = DecodeViewNormalStereo(depthNorms);
                  norms = mul((float3x3)GetWorldToViewMatrix(), norms) * 0.5 + 0.5;
                  return norms;
               }
            #elif _HDRP && !_DECALSHADER
               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  NormalData nd;
                  DecodeFromNormalBuffer(_ScreenSize.xy * uv, nd);
                  return nd.normalWS;
               }
            #elif _URP
               #if (SHADER_LIBRARY_VERSION_MAJOR >= 10)
                  #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareNormalsTexture.hlsl"
               #endif

               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  #if (SHADER_LIBRARY_VERSION_MAJOR >= 10)
                     return SampleSceneNormals(uv);
                  #else
                     float3 wpos = GetWorldPositionFromDepthBuffer(uv, worldSpaceViewDir);
                     return normalize(-cross(ddx(wpos), ddy(wpos))) * 0.5 + 0.5;
                  #endif

                }
             #endif

             #if _HDRP

               half3 UnpackNormalmapRGorAG(half4 packednormal)
               {
                  packednormal.x *= packednormal.w;

                  half3 normal;
                  normal.xy = packednormal.xy * 2 - 1;
                  normal.z = sqrt(1 - saturate(dot(normal.xy, normal.xy)));
                  return normal;
               }
               half3 UnpackNormal(half4 packednormal)
               {
                  #if defined(UNITY_NO_DXT5nm)
                     return packednormal.xyz * 2 - 1;
                  #else
                     return UnpackNormalmapRGorAG(packednormal);
                  #endif
               }
            #endif
            #if _HDRP || _URP

               half3 UnpackScaleNormal(half4 packednormal, half scale)
               {
                 #ifndef UNITY_NO_DXT5nm
                   packednormal.x *= packednormal.w;
                 #endif
                   half3 normal;
                   normal.xy = (packednormal.xy * 2 - 1) * scale;
                   normal.z = sqrt(1 - saturate(dot(normal.xy, normal.xy)));
                   return normal;
               }	

             #endif
            void GetSun(out float3 lightDir, out float3 color)
            {
               lightDir = float3(0.5, 0.5, 0);
               color = 1;
               #if _HDRP
                  if (_DirectionalLightCount > 0)
                  {
                     DirectionalLightData light = _DirectionalLightDatas[0];
                     lightDir = -light.forward.xyz;
                     color = light.color;
                  }
               #elif _STANDARD
			         lightDir = normalize(_WorldSpaceLightPos0.xyz);
                  color = _LightColor0.rgb;
               #elif _URP
	               Light light = GetMainLight();
	               lightDir = light.direction;
	               color = light.color;
               #endif
            }
    sampler2D _EmissiveColorMap;
    sampler2D _BaseColorMap;
    sampler2D _MaskMap;
    sampler2D _NormalMap;
    sampler2D _NormalMapOS;
    sampler2D _DetailMap;
    sampler2D _TangentMap;
    sampler2D _TangentMapOS;
    sampler2D _AnisotropyMap;
    sampler2D _SubsurfaceMaskMap;
    sampler2D _TransmissionMaskMap;
    sampler2D _ThicknessMap;
    sampler2D _IridescenceThicknessMap;
    sampler2D _IridescenceMaskMap;
    sampler2D _SpecularColorMap;

    sampler2D _CoatMaskMap;

    float3 DecodeNormal (float4 sample, float scale) {
        #if defined(UNITY_NO_DXT5nm)
            return UnpackNormalRGB(sample, scale);
        #else
            return UnpackNormalmapRGorAG(sample, scale);
        #endif
    }

	void Ext_SurfaceFunction0 (inout Surface o, ShaderData d)
	{
        float2 uvBase = (_UVMappingMask.x * d.texcoord0 +
                        _UVMappingMask.y * d.texcoord1 +
                        _UVMappingMask.z * d.texcoord2 +
                        _UVMappingMask.w * d.texcoord3).xy;

        float2 uvDetails =  (_UVDetailsMappingMask.x * d.texcoord0 +
                            _UVDetailsMappingMask.y * d.texcoord1 +
                            _UVDetailsMappingMask.z * d.texcoord2 +
                            _UVDetailsMappingMask.w * d.texcoord3).xy;
        float4 texcoords;
        texcoords.xy = uvBase * _BaseColorMap_ST.xy + _BaseColorMap_ST.zw; 

        texcoords.zw = uvDetails * _DetailMap_ST.xy + _DetailMap_ST.zw;

        if (_LinkDetailsWithBase > 0.0)
        {
            texcoords.zw = texcoords.zw  * _BaseColorMap_ST.xy + _BaseColorMap_ST.zw;

        }

            float3 detailNormalTS = float3(0.0, 0.0, 0.0);
            float detailMask = 0.0;
            #ifdef _DETAIL_MAP
                detailMask = 1.0;
                #ifdef _MASKMAP
                    detailMask = tex2D(_MaskMap, texcoords.xy).b;
                #endif
                float2 detailAlbedoAndSmoothness = tex2D(_DetailMap, texcoords.zw).rb;
                float detailAlbedo = detailAlbedoAndSmoothness.r * 2.0 - 1.0;
                float detailSmoothness = detailAlbedoAndSmoothness.g * 2.0 - 1.0;
                real4 packedNormal = tex2D(_DetailMap, texcoords.zw).rgba;
                detailNormalTS = UnpackNormalAG(packedNormal, _DetailNormalScale);
            #endif
            float4 color = tex2D(_BaseColorMap, texcoords.xy).rgba  * _Color.rgba;
            o.Albedo = color.rgb; 
            float alpha = color.a;
            alpha = lerp(_AlphaRemapMin, _AlphaRemapMax, alpha);
            o.Alpha = alpha;
            #ifdef _DETAIL_MAP
                float albedoDetailSpeed = saturate(abs(detailAlbedo) * _DetailAlbedoScale);
                float3 baseColorOverlay = lerp(sqrt(o.Albedo), (detailAlbedo < 0.0) ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0), albedoDetailSpeed * albedoDetailSpeed);
                baseColorOverlay *= baseColorOverlay;
                o.Albedo = lerp(o.Albedo, saturate(baseColorOverlay), detailMask);
            #endif

            #ifdef _NORMALMAP
                float3 normalTS;
                #ifdef _NORMALMAP_TANGENT_SPACE
                    normalTS = DecodeNormal(tex2D(_NormalMap, texcoords.xy), _NormalScale);
                #else
                    #ifdef SURFACE_GRADIENT
                        float3 normalOS = tex2D(_NormalMapOS, texcoords.xy).xyz * 2.0 - 1.0;
                        normalTS = SurfaceGradientFromPerturbedNormal(d.worldSpaceNormal, TransformObjectToWorldNormal(normalOS));
                    #else
                        float3 normalOS = UnpackNormalRGB(tex2D(_NormalMapOS, texcoords.xy), 1.0);
                        float3 bitangent = d.tangentSign * cross(d.worldSpaceNormal.xyz, d.worldSpaceTangent.xyz);
                        half3x3 tangentToWorld = half3x3(d.worldSpaceTangent.xyz, bitangent.xyz, d.worldSpaceNormal.xyz);
                        normalTS = TransformObjectToTangent(normalOS, tangentToWorld);
                    #endif
                #endif

                #ifdef _DETAIL_MAP
                    #ifdef SURFACE_GRADIENT
                    normalTS += detailNormalTS * detailMask;
                    #else
                    normalTS = lerp(normalTS, BlendNormalRNM(normalTS, normalize(detailNormalTS)), detailMask); 
                    #endif
                #endif
                o.Normal = normalTS;

            #endif

            #if defined(_MASKMAP)
                o.Smoothness = tex2D(_MaskMap, texcoords.xy).a;
                o.Smoothness = lerp(_SmoothnessRemapMin, _SmoothnessRemapMax, o.Smoothness);
            #else
                o.Smoothness = _Smoothness;
            #endif
            #ifdef _DETAIL_MAP
                float smoothnessDetailSpeed = saturate(abs(detailSmoothness) * _DetailSmoothnessScale);
                float smoothnessOverlay = lerp(o.Smoothness, (detailSmoothness < 0.0) ? 0.0 : 1.0, smoothnessDetailSpeed);
                o.Smoothness = lerp(o.Smoothness, saturate(smoothnessOverlay), detailMask);
            #endif
            #ifdef _MASKMAP
                o.Metallic = tex2D(_MaskMap, texcoords.xy).r;
                o.Metallic = lerp(_MetallicRemapMin, _MetallicRemapMax, o.Metallic);
                o.Occlusion = tex2D(_MaskMap, texcoords.xy).g;
                o.Occlusion = lerp(_AORemapMin, _AORemapMax, o.Occlusion);
            #else
                o.Metallic = _Metallic;
                o.Occlusion = 1.0;
            #endif

            #if defined(_SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP)
            #elif  defined(_MASKMAP) && !defined(_SPECULAR_OCCLUSION_NONE)
                float3 V = normalize(d.worldSpaceViewDir);
                o.SpecularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(d.worldSpaceNormal, V)), o.Occlusion, PerceptualSmoothnessToRoughness(o.Smoothness));
            #endif

            o.DiffusionProfileHash = asuint(_DiffusionProfileHash);
            o.SubsurfaceMask = _SubsurfaceMask;
            #ifdef _SUBSURFACE_MASK_MAP
                o.SubsurfaceMask *= tex2D(_SubsurfaceMaskMap, texcoords.xy).r;
            #endif
            #ifdef _THICKNESSMAP
                o.Thickness = tex2D(_ThicknessMap, texcoords.xy).r;
                o.Thickness = _ThicknessRemap.x + _ThicknessRemap.y * surfaceData.thickness;
            #else
                o.Thickness = _Thickness;
            #endif
            #ifdef _ANISOTROPYMAP
                o.Anisotropy = tex2D(_AnisotropyMap, texcoords.xy).r;
            #else
                o.Anisotropy = 1.0;
            #endif
                o.Anisotropy *= _Anisotropy;
                o.Specular = _SpecularColor.rgb;
            #ifdef _SPECULARCOLORMAP
                o.Specular *= tex2D(_SpecularColorMap, texcoords.xy).rgb;
            #endif
            #ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                o.Albedo *= _EnergyConservingSpecularColor > 0.0 ? (1.0 - Max3(o.Specular.r, o.Specular.g, o.Specular.b)) : 1.0;
            #endif
            #ifdef _MATERIAL_FEATURE_CLEAR_COAT
                o.CoatMask = _CoatMask;
                o.CoatMask *= tex2D(_CoatMaskMap, texcoords.xy).r;
            #else
                o.CoatMask = 0.0;
            #endif
            #ifdef _MATERIAL_FEATURE_IRIDESCENCE
                #ifdef _IRIDESCENCE_THICKNESSMAP
                o.IridescenceThickness = tex2D(_IridescenceThicknessMap, texcoords.xy).r;
                o.IridescenceThickness = _IridescenceThicknessRemap.x + _IridescenceThicknessRemap.y * o.IridescenceThickness;
                #else
                o.IridescenceThickness = _IridescenceThickness;
                #endif
                o.IridescenceMask = _IridescenceMask;
                o.IridescenceMask *= tex2D(_IridescenceMaskMap, texcoords.xy).r;
            #else
                o.IridescenceThickness = 0.0;
                o.IridescenceMask = 0.0;
            #endif
            float3 emissiveColor = _EmissiveColor * lerp(float3(1.0, 1.0, 1.0), o.Albedo.rgb, _AlbedoAffectEmissive);
            #ifdef _EMISSIVE_COLOR_MAP                
                float2 uvEmission = _UVMappingMaskEmissive.x * d.texcoord0 +
                                    _UVMappingMaskEmissive.y * d.texcoord1 +
                                    _UVMappingMaskEmissive.z * d.texcoord2 +
                                    _UVMappingMaskEmissive.w * d.texcoord3;

                uvEmission = uvEmission * _EmissiveColorMap_ST.xy + _EmissiveColorMap_ST.zw;                     

                emissiveColor *= tex2D(_EmissiveColorMap, uvEmission).rgb;
            #endif
            o.Emission += emissiveColor;
            float currentExposureMultiplier = 0;
            #if SHADEROPTIONS_PRE_EXPOSITION
                currentExposureMultiplier =  LOAD_TEXTURE2D(_ExposureTexture, int2(0, 0)).x * _ProbeExposureScale;
            #else
                currentExposureMultiplier =  _ProbeExposureScale;
            #endif
            float InverseCurrentExposureMultiplier = 0;
            float exposure = currentExposureMultiplier;
            InverseCurrentExposureMultiplier =  rcp(exposure + (exposure == 0.0)); 
            float3 emissiveRcpExposure = o.Emission * InverseCurrentExposureMultiplier;
            o.Emission = lerp(emissiveRcpExposure, o.Emission, _EmissiveExposureWeight);
            #if defined(_ALPHATEST_ON)
                float alphaTex = tex2D(_BaseColorMap, texcoords.xy).a;
                alphaTex = lerp(_AlphaRemapMin, _AlphaRemapMax, alphaTex);
                float alphaValue = alphaTex * _BaseColor.a;
                float alphaCutoff = _AlphaCutoff;
                clip(alpha - alphaCutoff);
            #endif

	}
    float _ArrayLength = 0;
    #if (defined(SHADER_API_GLES) || defined(SHADER_API_GLES3)) 
        float4 _PlayersPosVectorArray[20];
        float _PlayersDataFloatArray[150];     
    #else
        float4 _PlayersPosVectorArray[100];
        float _PlayersDataFloatArray[500];  
    #endif
    #if _ZONING
        #if (defined(SHADER_API_GLES) || defined(SHADER_API_GLES3)) 
            float _ZDFA[500];
        #else
            float _ZDFA[1000];
        #endif
        float _ZonesDataCount;
    #endif

    float _STSCustomTime = 0;
    #if _REPLACEMENT        
        half4 _DissolveColorGlobal;
        float _DissolveColorSaturationGlobal;
        float _DissolveEmissionGlobal;
        float _DissolveEmissionBoosterGlobal;
        float _TextureVisibilityGlobal;
        float _ObstructionGlobal;
        float _AngleStrengthGlobal;
        float _ConeStrengthGlobal;
        float _ConeObstructionDestroyRadiusGlobal;
        float _CylinderStrengthGlobal;
        float _CylinderObstructionDestroyRadiusGlobal;
        float _CircleStrengthGlobal;
        float _CircleObstructionDestroyRadiusGlobal;
        float _CurveStrengthGlobal;
        float _CurveObstructionDestroyRadiusGlobal;
        float _DissolveFallOffGlobal;
        float _AffectedAreaPlayerBasedObstructionGlobal;
        float _IntrinsicDissolveStrengthGlobal;
        float _PreviewModeGlobal;
        float _UVsGlobal;
        float _hasClippedShadowsGlobal;
        float _FloorGlobal;
        float _FloorModeGlobal;
        float _FloorYGlobal;
        float _PlayerPosYOffsetGlobal;
        float _FloorYTextureGradientLengthGlobal;
        float _AffectedAreaFloorGlobal;
        float _AnimationEnabledGlobal;
        float _AnimationSpeedGlobal;
        float _DefaultEffectRadiusGlobal;
        float _EnableDefaultEffectRadiusGlobal;
        float _TransitionDurationGlobal;        
        float _TexturedEmissionEdgeGlobal;
        float _TexturedEmissionEdgeStrengthGlobal;
        float _IsometricExclusionGlobal;
        float _IsometricExclusionDistanceGlobal;
        float _IsometricExclusionGradientLengthGlobal;
        float _CeilingGlobal;
        float _CeilingModeGlobal;
        float _CeilingBlendModeGlobal;
        float _CeilingYGlobal;
        float _CeilingPlayerYOffsetGlobal;
        float _CeilingYGradientLengthGlobal;
        float _ZoningGlobal;
        float _ZoningModeGlobal;
        float _ZoningEdgeGradientLengthGlobal;
        float _IsZoningRevealableGlobal;
        float _SyncZonesWithFloorYGlobal;
        float _SyncZonesFloorYOffsetGlobal;
        float4 _ObstructionCurveGlobal_TexelSize;
        float4 _DissolveMaskGlobal_TexelSize;
        float _DissolveMaskEnabledGlobal;
        float _PreviewIndicatorLineThicknessGlobal;
        half _UseCustomTimeGlobal;

        half _CrossSectionEnabledGlobal;
        half4 _CrossSectionColorGlobal;
        half _CrossSectionTextureEnabledGlobal;
        float _CrossSectionTextureScaleGlobal;
        half _CrossSectionUVScaledByDistanceGlobal;

        half _DissolveMethodGlobal;
        half _DissolveTexSpaceGlobal;

        float4 _DissolveTexGlobal_TexelSize;
    #endif
    #if _REPLACEMENT
        sampler2D _DissolveTexGlobal;
    #else
        sampler2D _DissolveTex;
    #endif
    #if _REPLACEMENT
        sampler2D _DissolveMaskGlobal;
    #else
        sampler2D _DissolveMask;
    #endif
    #if _REPLACEMENT
        sampler2D _ObstructionCurveGlobal;
    #else
        sampler2D _ObstructionCurve;
    #endif

    #if _REPLACEMENT
        sampler2D _CrossSectionTextureGlobal;
    #else
        sampler2D _CrossSectionTexture;
    #endif
#ifdef USE_UNITY_TEXTURE_2D_TYPE
#undef USE_UNITY_TEXTURE_2D_TYPE
#endif

#include "Packages/com.shadercrew.seethroughshader.core/Scripts/Shaders/xxSharedSTSDependencies/SeeThroughShaderFunction.hlsl"
	void Ext_SurfaceFunction1 (inout Surface o, ShaderData d)
	{
        half3 albedo;
        half3 emission;
        float alphaForClipping;
#ifdef USE_UNITY_TEXTURE_2D_TYPE
#undef USE_UNITY_TEXTURE_2D_TYPE
#endif
#if _REPLACEMENT
    DoSeeThroughShading( o.Albedo, o.Normal, d.worldSpacePosition, d.worldSpaceNormal, d.screenPos,
                        _numOfPlayersInside, _tDirection, _tValue, _id,
                        _TriggerMode, _RaycastMode,
                        _IsExempt,

                        _DissolveMethodGlobal, _DissolveTexSpaceGlobal,

                        _DissolveColorGlobal, _DissolveColorSaturationGlobal, _UVsGlobal,
                        _DissolveEmissionGlobal, _DissolveEmissionBoosterGlobal, _TexturedEmissionEdgeGlobal, _TexturedEmissionEdgeStrengthGlobal,
                        _hasClippedShadowsGlobal,

                        _ObstructionGlobal,
                        _AngleStrengthGlobal,
                        _ConeStrengthGlobal, _ConeObstructionDestroyRadiusGlobal,
                        _CylinderStrengthGlobal, _CylinderObstructionDestroyRadiusGlobal,
                        _CircleStrengthGlobal, _CircleObstructionDestroyRadiusGlobal,
                        _CurveStrengthGlobal, _CurveObstructionDestroyRadiusGlobal,
                        _DissolveFallOffGlobal,
                        _DissolveMaskEnabledGlobal,
                        _AffectedAreaPlayerBasedObstructionGlobal,
                        _IntrinsicDissolveStrengthGlobal,
                        _DefaultEffectRadiusGlobal, _EnableDefaultEffectRadiusGlobal,

                        _IsometricExclusionGlobal, _IsometricExclusionDistanceGlobal, _IsometricExclusionGradientLengthGlobal,
                        _CeilingGlobal, _CeilingModeGlobal, _CeilingBlendModeGlobal, _CeilingYGlobal, _CeilingPlayerYOffsetGlobal, _CeilingYGradientLengthGlobal,
                        _FloorGlobal, _FloorModeGlobal, _FloorYGlobal, _PlayerPosYOffsetGlobal, _FloorYTextureGradientLengthGlobal, _AffectedAreaFloorGlobal,

                        _AnimationEnabledGlobal, _AnimationSpeedGlobal,
                        _TransitionDurationGlobal,

                        _UseCustomTimeGlobal,

                        _ZoningGlobal, _ZoningModeGlobal, _IsZoningRevealableGlobal, _ZoningEdgeGradientLengthGlobal,
                        _SyncZonesWithFloorYGlobal, _SyncZonesFloorYOffsetGlobal,

                        _PreviewModeGlobal,
                        _PreviewIndicatorLineThicknessGlobal,

                        _DissolveTexGlobal,
                        _DissolveMaskGlobal,
                        _ObstructionCurveGlobal,

                        _DissolveTexGlobal_TexelSize,
                        _DissolveMaskGlobal_TexelSize,
                        _ObstructionCurveGlobal_TexelSize,

                        albedo, emission, alphaForClipping);
#else 
    DoSeeThroughShading( o.Albedo, o.Normal, d.worldSpacePosition, d.worldSpaceNormal, d.screenPos,

                        _numOfPlayersInside, _tDirection, _tValue, _id,
                        _TriggerMode, _RaycastMode,
                        _IsExempt,

                        _DissolveMethod, _DissolveTexSpace,

                        _DissolveColor, _DissolveColorSaturation, _UVs,
                        _DissolveEmission, _DissolveEmissionBooster, _TexturedEmissionEdge, _TexturedEmissionEdgeStrength,
                        _hasClippedShadows,

                        _Obstruction,
                        _AngleStrength,
                        _ConeStrength, _ConeObstructionDestroyRadius,
                        _CylinderStrength, _CylinderObstructionDestroyRadius,
                        _CircleStrength, _CircleObstructionDestroyRadius,
                        _CurveStrength, _CurveObstructionDestroyRadius,
                        _DissolveFallOff,
                        _DissolveMaskEnabled,
                        _AffectedAreaPlayerBasedObstruction,
                        _IntrinsicDissolveStrength,
                        _DefaultEffectRadius, _EnableDefaultEffectRadius,

                        _IsometricExclusion, _IsometricExclusionDistance, _IsometricExclusionGradientLength,
                        _Ceiling, _CeilingMode, _CeilingBlendMode, _CeilingY, _CeilingPlayerYOffset, _CeilingYGradientLength,
                        _Floor, _FloorMode, _FloorY, _PlayerPosYOffset, _FloorYTextureGradientLength, _AffectedAreaFloor,

                        _AnimationEnabled, _AnimationSpeed,
                        _TransitionDuration,

                        _UseCustomTime,

                        _Zoning, _ZoningMode , _IsZoningRevealable, _ZoningEdgeGradientLength,
                        _SyncZonesWithFloorY, _SyncZonesFloorYOffset,

                        _PreviewMode,
                        _PreviewIndicatorLineThickness,                            

                        _DissolveTex,
                        _DissolveMask,
                        _ObstructionCurve,

                        _DissolveTex_TexelSize,
                        _DissolveMask_TexelSize,
                        _ObstructionCurve_TexelSize,

                        albedo, emission, alphaForClipping);
#endif 
        o.Albedo = albedo;
        o.Emission += emission;   

	}
    void Ext_FinalColorForward1 (Surface o, ShaderData d, inout half4 color)
    {
        #if _REPLACEMENT   
            DoCrossSection(_CrossSectionEnabledGlobal,
                        _CrossSectionColorGlobal,
                        _CrossSectionTextureEnabledGlobal,
                        _CrossSectionTextureGlobal,
                        _CrossSectionTextureScaleGlobal,
                        _CrossSectionUVScaledByDistanceGlobal,
                        d.isFrontFace,
                        d.screenPos,
                        color);
        #else 
            DoCrossSection(_CrossSectionEnabled,
                        _CrossSectionColor,
                        _CrossSectionTextureEnabled,
                        _CrossSectionTexture,
                        _CrossSectionTextureScale,
                        _CrossSectionUVScaledByDistance,
                        d.isFrontFace,
                        d.screenPos,
                        color);
        #endif
    }
            void ChainSurfaceFunction(inout Surface l, inout ShaderData d)
            {
                  Ext_SurfaceFunction0(l, d);
                  Ext_SurfaceFunction1(l, d);
            }

#if !_DECALSHADER

            void ChainModifyVertex(inout VertexData v, inout VertexToPixel v2p, float4 time)
            {
                 ExtraV2F d;
                 ZERO_INITIALIZE(ExtraV2F, d);
                 ZERO_INITIALIZE(Blackboard, d.blackboard);
                 d.time = time;
            }

            void ChainModifyTessellatedVertex(inout VertexData v, inout VertexToPixel v2p)
            {
               ExtraV2F d;
               ZERO_INITIALIZE(ExtraV2F, d);
               ZERO_INITIALIZE(Blackboard, d.blackboard);
            }

            void ChainFinalColorForward(inout Surface l, inout ShaderData d, inout half4 color)
            {
                  Ext_FinalColorForward1(l, d, color);
            }

            void ChainFinalGBufferStandard(inout Surface s, inout ShaderData d, inout half4 GBuffer0, inout half4 GBuffer1, inout half4 GBuffer2, inout half4 outEmission, inout half4 outShadowMask)
            {
            }
#endif
#if _DECALSHADER

        ShaderData CreateShaderData(SurfaceDescriptionInputs IN)
        {
            ShaderData d = (ShaderData)0;
            d.TBNMatrix = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
            d.worldSpaceNormal = IN.WorldSpaceNormal;
            d.worldSpaceTangent = IN.WorldSpaceTangent;

            d.worldSpacePosition = IN.WorldSpacePosition;
            d.texcoord0 = IN.uv0.xyxy;
            d.screenPos = IN.ScreenPosition;

            d.worldSpaceViewDir = normalize(_WorldSpaceCameraPos - d.worldSpacePosition);

            d.tangentSpaceViewDir = mul(d.TBNMatrix, d.worldSpaceViewDir);
            #if _HDRP
            #else
            #endif
             d.screenUV = (IN.ScreenPosition.xy / max(0.01, IN.ScreenPosition.w));
            return d;
        }
#else

         ShaderData CreateShaderData(VertexToPixel i
                  #if NEED_FACING
                     , bool facing
                  #endif
         )
         {
            ShaderData d = (ShaderData)0;
            d.clipPos = i.pos;
            d.worldSpacePosition = i.worldPos;

            d.worldSpaceNormal = normalize(i.worldNormal);
            d.worldSpaceTangent.xyz = normalize(i.worldTangent.xyz);

            d.tangentSign = i.worldTangent.w * unity_WorldTransformParams.w;
            float3 bitangent = cross(d.worldSpaceTangent.xyz, d.worldSpaceNormal) * d.tangentSign;
            d.TBNMatrix = float3x3(d.worldSpaceTangent, -bitangent, d.worldSpaceNormal);
            d.worldSpaceViewDir = normalize(_WorldSpaceCameraPos - i.worldPos);

            d.tangentSpaceViewDir = mul(d.TBNMatrix, d.worldSpaceViewDir);
             d.texcoord0 = i.texcoord0;
             d.texcoord1 = i.texcoord1;
             d.texcoord2 = i.texcoord2;
             d.texcoord3 = i.texcoord3;
             d.isFrontFace = facing;
            #if _HDRP
            #else
            #endif
             d.screenPos = i.screenPos;
             d.screenUV = (i.screenPos.xy / i.screenPos.w);
            return d;
         }

#endif
#if (SHADERPASS == SHADERPASS_LIGHT_TRANSPORT)
   float unity_OneOverOutputBoost;
   float unity_MaxOutputValue;

   CBUFFER_START(UnityMetaPass)
   bool4 unity_MetaVertexControl;
   bool4 unity_MetaFragmentControl;
   CBUFFER_END

   VertexToPixel Vert(VertexData inputMesh)
   {
       VertexToPixel output;
       ZERO_INITIALIZE(VertexToPixel, output);
       UNITY_SETUP_INSTANCE_ID(inputMesh);
       UNITY_TRANSFER_INSTANCE_ID(inputMesh, output);
       UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);
       float2 uv = float2(0.0, 0.0);

       if (unity_MetaVertexControl.x)
       {
           uv = inputMesh.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
       }
       else if (unity_MetaVertexControl.y)
       {
           uv = inputMesh.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
       }
       output.pos = float4(uv * 2.0 - 1.0, inputMesh.vertex.z > 0 ? 1.0e-4 : 0.0, 1.0);

       output.worldPos = TransformObjectToWorld(inputMesh.vertex.xyz).xyz;
       output.worldNormal = TransformObjectToWorldNormal(inputMesh.normal);
       output.worldTangent = float4(1.0, 0.0, 0.0, 0.0);

       output.texcoord0 = inputMesh.texcoord0;
       output.texcoord1 = inputMesh.texcoord1;
       output.texcoord2 = inputMesh.texcoord2;
        output.texcoord3 = inputMesh.texcoord3;
       return output;
   }
#else

   #if (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
      #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariablesMatrixDefsHDCamera.hlsl"

      void MotionVectorPositionZBias(VertexToPixel input)
      {
      #if UNITY_REVERSED_Z
          input.pos.z -= unity_MotionVectorsParams.z * input.pos.w;
      #else
          input.pos.z += unity_MotionVectorsParams.z * input.pos.w;
      #endif
      }

   #endif

   VertexToPixel Vert(VertexData input)
   {
       VertexToPixel output;
       ZERO_INITIALIZE(VertexToPixel, output);

       UNITY_SETUP_INSTANCE_ID(input);
       UNITY_TRANSFER_INSTANCE_ID(input, output);
       UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

       #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
         VertexData previousMesh = input;
       #endif

       ChainModifyVertex(input, output, _Time);
       float3 positionRWS = TransformObjectToWorld(input.vertex.xyz);
       float3 normalWS = TransformObjectToWorldNormal(input.normal);
       float4 tangentWS = float4(TransformObjectToWorldDir(input.tangent.xyz), input.tangent.w);
       output.worldPos = GetAbsolutePositionWS(positionRWS);
       output.pos = TransformWorldToHClip(positionRWS);
       output.worldNormal = normalWS;
       output.worldTangent = tangentWS;
       output.texcoord0 = input.texcoord0;
       output.texcoord1 = input.texcoord1;
       output.texcoord2 = input.texcoord2;
        output.texcoord3 = input.texcoord3;
        output.screenPos = ComputeScreenPos(output.pos, _ProjectionParams.x);
       #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))

          #if !defined(TESSELLATION_ON)
            MotionVectorPositionZBias(output);
          #endif

          output.motionVectorCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(positionRWS.xyz, 1.0));
          bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
          if (forceNoMotion)
          {
              output.previousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
          }
          else
          {
            bool hasDeformation = unity_MotionVectorsParams.x > 0.0; 

            float3 effectivePositionOS = (hasDeformation ? previousMesh.previousPositionOS : previousMesh.vertex.xyz);
            #if defined(_ADD_PRECOMPUTED_VELOCITY)
               effectivePositionOS -= input.precomputedVelocity;
            #endif

            previousMesh.vertex = float4(effectivePositionOS, 1);
            VertexToPixel dummy = (VertexToPixel)0;
            ChainModifyVertex(previousMesh, dummy, _LastTimeParameters);
            float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.vertex.xyz);

            #ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
            if (_TransparentCameraOnlyMotionVectors > 0)
            {
               previousPositionRWS = positionRWS.xyz;
            }
            #endif 

            output.previousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
         }
       #endif 
       return output;
   }
#endif
               #if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
                  #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
               #endif

                FragInputs BuildFragInputs(VertexToPixel input)
                {
                    UNITY_SETUP_INSTANCE_ID(input);
                    FragInputs output;
                    ZERO_INITIALIZE(FragInputs, output);
                    output.tangentToWorld = k_identity3x3;
                    output.positionSS = input.pos;       
                    output.positionRWS = GetCameraRelativePositionWS(input.worldPos);
                    output.tangentToWorld = BuildTangentToWorld(input.worldTangent, input.worldNormal);
                    output.texCoord0 = input.texcoord0;
                    output.texCoord1 = input.texcoord1;
                    output.texCoord2 = input.texcoord2;
                    return output;
                }
               void BuildSurfaceData(FragInputs fragInputs, inout Surface surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
               {
                   ZERO_INITIALIZE(SurfaceData, surfaceData);
                   surfaceData.specularOcclusion = 1.0;
                   surfaceData.baseColor =                 surfaceDescription.Albedo;
                   surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;
                   surfaceData.ambientOcclusion =          surfaceDescription.Occlusion;
                   surfaceData.specularOcclusion =         surfaceDescription.SpecularOcclusion;
                   surfaceData.metallic =                  surfaceDescription.Metallic;
                   surfaceData.subsurfaceMask =            surfaceDescription.SubsurfaceMask;
                   surfaceData.thickness =                 surfaceDescription.Thickness;
                   surfaceData.diffusionProfileHash =      asuint(surfaceDescription.DiffusionProfileHash);
                   #if _USESPECULAR
                      surfaceData.specularColor =             surfaceDescription.Specular;
                   #endif
                   surfaceData.coatMask =                  surfaceDescription.CoatMask;
                   surfaceData.anisotropy =                surfaceDescription.Anisotropy;
                   surfaceData.iridescenceMask =           surfaceDescription.IridescenceMask;
                   surfaceData.iridescenceThickness =      surfaceDescription.IridescenceThickness;
                   #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                        if (_EnableSSRefraction)
                        {
                            surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                            surfaceDescription.Alpha = 1.0;
                        }
                        else
                        {
                            surfaceData.ior = surfaceDescription.ior;
                            surfaceData.transmittanceColor = surfaceDescription.transmittanceColor;
                            surfaceData.atDistance = surfaceDescription.atDistance;
                            surfaceData.transmittanceMask = surfaceDescription.transmittanceMask;
                            surfaceDescription.Alpha = 1.0;
                        }
                    #else
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                    #endif
                    surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
                    #ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
                    #endif
                    #ifdef _MATERIAL_FEATURE_TRANSMISSION
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
                    #endif
                    #ifdef _MATERIAL_FEATURE_ANISOTROPY
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                        surfaceData.normalWS = float3(0, 1, 0);
                    #endif
                    #ifdef _MATERIAL_FEATURE_IRIDESCENCE
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
                    #endif
                    #ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
                    #endif
                    #if defined(_MATERIAL_FEATURE_CLEAR_COAT) || _CLEARCOAT
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
                    #endif
                    #if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                        surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
                    #endif
                   #if !_WORLDSPACENORMAL
                      surfaceData.normalWS = mul(surfaceDescription.Normal, fragInputs.tangentToWorld);
                   #else
                      surfaceData.normalWS = surfaceDescription.Normal;
                   #endif

                   surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                   surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    
                    #if HAVE_DECALS
                        if (_EnableDecals)
                        {
                            float alpha = 1.0;
                            alpha = surfaceDescription.Alpha;
                            DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], alpha);
                            ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
                        }
                    #endif
                    bentNormalWS = surfaceData.normalWS;
                    surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);
                    #ifdef DEBUG_DISPLAY
                        if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
                        {
                            surfaceData.metallic = 0;
                        }
                        ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
                    #endif
                    #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                    #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                        surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                    #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                        surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                    #endif
                    #if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
                        surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                    #endif
               }
               void GetSurfaceAndBuiltinData(VertexToPixel m2ps, FragInputs fragInputs, float3 V, inout PositionInputs posInput,
                     out SurfaceData surfaceData, out BuiltinData builtinData, inout Surface l, inout ShaderData d
                     #if NEED_FACING
                        , bool facing
                     #endif
                  )
               {
                 d = CreateShaderData(m2ps
                    #if NEED_FACING
                       , facing
                    #endif
                 );

                 l = (Surface)0;

                 l.Albedo = half3(0.5, 0.5, 0.5);
                 l.Normal = float3(0,0,1);
                 l.Occlusion = 1;
                 l.Alpha = 1;
                 l.SpecularOcclusion = 1;

                 #if !defined(SHADER_STAGE_RAY_TRACING) && defined(_DEPTHOFFSET_ON)
                    l.outputDepth = d.clipPos.z;
                 #endif

                 ChainSurfaceFunction(l, d);

                 #if !defined(SHADER_STAGE_RAY_TRACING) && defined(_DEPTHOFFSET_ON)
                 #endif

                 #if _UNLIT
                     l.Normal = half3(0,0,1);
                     l.Occlusion = 1;
                     l.Metallic = 0;
                     l.Specular = 0;
                 #endif

                 surfaceData.geomNormalWS = d.worldSpaceNormal;
                 surfaceData.tangentWS = d.worldSpaceTangent;
                 fragInputs.tangentToWorld = d.TBNMatrix;

                 float3 bentNormalWS;
                 BuildSurfaceData(fragInputs, l, V, posInput, surfaceData, bentNormalWS);
                 InitBuiltinData(posInput, l.Alpha, bentNormalWS, -d.worldSpaceNormal, fragInputs.texCoord1, fragInputs.texCoord2, builtinData);
                 builtinData.emissiveColor = l.Emission;

                 #if defined(_OVERRIDE_BAKEDGI)
                    builtinData.bakeDiffuseLighting = l.DiffuseGI;
                    builtinData.backBakeDiffuseLighting = l.BackDiffuseGI;
                    builtinData.emissiveColor += l.SpecularGI;
                 #endif

                 #if defined(_OVERRIDE_SHADOWMASK)
                    builtinData.shadowMask0 = l.ShadowMask.x;
                    builtinData.shadowMask1 = l.ShadowMask.y;
                    builtinData.shadowMask2 = l.ShadowMask.z;
                    builtinData.shadowMask3 = l.ShadowMask.w;
                 #endif

                 #if defined(UNITY_VIRTUAL_TEXTURING)
                    builtinData.vtPackedFeedback = surfaceData.VTPackedFeedback;
                 #endif

                  #if (SHADERPASS == SHADERPASS_DISTORTION)
                     builtinData.distortion = surfaceData.Distortion;
                     builtinData.distortionBlur = surfaceData.DistortionBlur;
                  #endif

                  #ifndef SHADER_UNLIT
                    PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                  #else
                    ApplyDebugToBuiltinData(builtinData);
                  #endif
                  RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
               }
            void Frag(  VertexToPixel IN
            #ifdef WRITE_NORMAL_BUFFER
            , out float4 outNormalBuffer : SV_Target0
                #ifdef WRITE_MSAA_DEPTH
                , out float1 depthColor : SV_Target1
                #endif
            #elif defined(WRITE_MSAA_DEPTH) 
            , out float4 outNormalBuffer : SV_Target0
            , out float1 depthColor : SV_Target1
            #elif defined(SCENESELECTIONPASS)
            , out float4 outColor : SV_Target0
            #endif

            #ifdef _DEPTHOFFSET_ON
            , out float outputDepth : SV_Depth
            #endif
            #if NEED_FACING
               , bool facing : SV_IsFrontFace
            #endif
        )
         {
             UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);
             FragInputs input = BuildFragInputs(IN);
             PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
             float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);
            SurfaceData surfaceData;
            BuiltinData builtinData;
            Surface l;
            ShaderData d;
            GetSurfaceAndBuiltinData(IN, input, V, posInput, surfaceData, builtinData, l, d
               #if NEED_FACING
                  , facing
               #endif
               );
         #ifdef _DEPTHOFFSET_ON
             outputDepth = l.outputDepth;
         #endif

         #ifdef WRITE_NORMAL_BUFFER
             EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), posInput.positionSS, outNormalBuffer);
             #ifdef WRITE_MSAA_DEPTH
             depthColor = v2f.pos.z;
             #endif
         #elif defined(WRITE_MSAA_DEPTH) 
             outNormalBuffer = float4(0.0, 0.0, 0.0, 1.0);
             depthColor = v2f.pos.z;
         #elif defined(SCENESELECTIONPASS)
             outColor = float4(_ObjectId, _PassValue, 1.0, 1.0);
         #endif
         }

         ENDHLSL
     }
              Pass
        {
            Name "ScenePickingPass"
            Tags
            {
               "LightMode" = "Picking"
            }
                Cull [_CullMode]
            HLSLPROGRAM
            #pragma target 4.5
            #pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
            #pragma multi_compile_instancing
            #pragma editor_sync_compilation
            #pragma instancing_options renderinglayer
            #pragma multi_compile _ WRITE_DECAL_BUFFER
            #define SHADERPASS SHADERPASS_DEPTH_ONLY
            #define SCENEPICKINGPASS
    #pragma shader_feature_local _ALPHATEST_ON

    #pragma shader_feature_local_fragment _NORMALMAP_TANGENT_SPACE
    #pragma shader_feature_local _NORMALMAP
    #pragma shader_feature_local_fragment _MASKMAP
    #pragma shader_feature_local_fragment _EMISSIVE_COLOR_MAP
    #pragma shader_feature_local_fragment _ANISOTROPYMAP
    #pragma shader_feature_local_fragment _DETAIL_MAP
    #pragma shader_feature_local_fragment _SUBSURFACE_MASK_MAP
    #pragma shader_feature_local_fragment _THICKNESSMAP
    #pragma shader_feature_local_fragment _IRIDESCENCE_THICKNESSMAP
    #pragma shader_feature_local_fragment _SPECULARCOLORMAP
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_TRANSMISSION
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_ANISOTROPY
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_CLEAR_COAT
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_IRIDESCENCE
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_SPECULAR_COLOR
    #pragma shader_feature_local_fragment _ENABLESPECULAROCCLUSION
    #pragma shader_feature_local_fragment _ _SPECULAR_OCCLUSION_NONE _SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP

    #ifdef _ENABLESPECULAROCCLUSION
        #define _SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP
    #endif
        #pragma shader_feature_local_fragment _OBSTRUCTION_CURVE
        #pragma shader_feature_local_fragment _DISSOLVEMASK
        #pragma shader_feature_local_fragment _ZONING
        #pragma shader_feature_local_fragment _REPLACEMENT
        #pragma shader_feature_local_fragment _PLAYERINDEPENDENT
   #define _HDRP 1
#define _USINGTEXCOORD1 1
#define _USINGTEXCOORD2 1
#define NEED_FACING 1

               #pragma vertex Vert
   #pragma fragment Frag
      #define UNITY_DECLARE_TEX2D(name) TEXTURE2D(name); SAMPLER(sampler##name);
      #define UNITY_DECLARE_TEX2D_NOSAMPLER(name) TEXTURE2D(name);
      #define UNITY_DECLARE_TEX2DARRAY(name) TEXTURE2D_ARRAY(name); SAMPLER(sampler##name);
      #define UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(tex) TEXTURE2D_ARRAY(tex);

      #define UNITY_SAMPLE_TEX2DARRAY(tex,coord)            SAMPLE_TEXTURE2D_ARRAY(tex, sampler##tex, coord.xy, coord.z)
      #define UNITY_SAMPLE_TEX2DARRAY_LOD(tex,coord,lod)    SAMPLE_TEXTURE2D_ARRAY_LOD(tex, sampler##tex, coord.xy, coord.z, lod)
      #define UNITY_SAMPLE_TEX2D(tex, coord)                SAMPLE_TEXTURE2D(tex, sampler##tex, coord)
      #define UNITY_SAMPLE_TEX2D_SAMPLER(tex, samp, coord)  SAMPLE_TEXTURE2D(tex, sampler##samp, coord)

      #define UNITY_SAMPLE_TEX2D_LOD(tex,coord, lod)   SAMPLE_TEXTURE2D_LOD(tex, sampler_##tex, coord, lod)
      #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord, lod) SAMPLE_TEXTURE2D_LOD (tex, sampler##samplertex,coord, lod)

      #if defined(UNITY_COMPILER_HLSL)
         #define UNITY_INITIALIZE_OUTPUT(type,name) name = (type)0;
      #else
         #define UNITY_INITIALIZE_OUTPUT(type,name)
      #endif

      #define sampler2D_float sampler2D
      #define sampler2D_half sampler2D

      #undef WorldNormalVector
      #define WorldNormalVector(data, normal) mul(normal, data.TBNMatrix)

      #define UnityObjectToWorldNormal(normal) mul(GetObjectToWorldMatrix(), normal)
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
#if UNITY_VERSION >= UNITY_2021_3_31
       #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl" 
#else
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" 
#endif    
            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT 
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
            #define RAYTRACING_SHADER_GRAPH_LOW
            #endif
            #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
               #define OUTPUT_SPLIT_LIGHTING
            #endif

            #define HAVE_RECURSIVE_RENDERING

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
               #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                  #define WRITE_NORMAL_BUFFER
               #endif
            #endif

            #ifndef DEBUG_DISPLAY
               #if !defined(_SURFACE_TYPE_TRANSPARENT) && defined(_ALPHATEST)
                  #if SHADERPASS == SHADERPASS_FORWARD
                  #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                  #elif SHADERPASS == SHADERPASS_GBUFFER
                  #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                  #endif
               #endif
            #endif
            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
               #define _DEFERRED_CAPABLE_MATERIAL
            #endif
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
               #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
            CBUFFER_START(UnityPerMaterial)
               float _UseShadowThreshold;
               float _BlendMode;
               float _EnableBlendModePreserveSpecularLighting;
               float _RayTracing;
               float _RefractionModel;
    float4 _BaseColorMap_ST;
    float4 _DetailMap_ST;
    float4 _EmissiveColorMap_ST;

    float _UVBase;
    half4 _Color;
    half4 _BaseColor; 
    half _Cutoff; 
    half _Mode;
    float _CullMode;
    float _CullModeForward;
    half _Metallic;
    half3 _EmissionColor;
    half _UVSec;

    float3 _EmissiveColor;
    float _AlbedoAffectEmissive;
    float _EmissiveExposureWeight;
    float _MetallicRemapMin;
    float _MetallicRemapMax;
    float _Smoothness;
    float _SmoothnessRemapMin;
    float _SmoothnessRemapMax;
    float _AlphaRemapMin;
    float _AlphaRemapMax;
    float _AORemapMin;
    float _AORemapMax;
    float _NormalScale;
    float _DetailAlbedoScale;
    float _DetailNormalScale;
    float _DetailSmoothnessScale;
    float _Anisotropy;
    float _DiffusionProfileHash;
    float _SubsurfaceMask;
    float _Thickness;
    float4 _ThicknessRemap;
    float _IridescenceThickness;
    float4 _IridescenceThicknessRemap;
    float _IridescenceMask;
    float _CoatMask;
    float4 _SpecularColor;
    float _EnergyConservingSpecularColor;
    int _MaterialID;

    float _LinkDetailsWithBase;
    float4 _UVMappingMask;
    float4 _UVDetailsMappingMask;

    float4 _UVMappingMaskEmissive;

    float _AlphaCutoff;
    float _SyncCullMode;

    float _IsReplacementShader;
    float _TriggerMode;
    float _RaycastMode;
    float _IsExempt;
    float _isReferenceMaterial;
    float _InteractionMode;

    float _tDirection = 0;
    float _numOfPlayersInside = 0;
    float _tValue = 0;
    float _id = 0;
    half _TextureVisibility;
    half _AngleStrength;
    float _Obstruction;
    float _UVs;
    float4 _ObstructionCurve_TexelSize;      
    float _DissolveMaskEnabled;
    float4 _DissolveMask_TexelSize;
    float4 _DissolveTex_TexelSize;
    half4 _DissolveColor;
    float _DissolveColorSaturation;
    float _DissolveEmission;
    float _DissolveEmissionBooster;
    float _hasClippedShadows;
    float _ConeStrength;
    float _ConeObstructionDestroyRadius;
    float _CylinderStrength;
    float _CylinderObstructionDestroyRadius;
    float _CircleStrength;
    float _CircleObstructionDestroyRadius;
    float _CurveStrength;
    float _CurveObstructionDestroyRadius;
    float _IntrinsicDissolveStrength;
    float _DissolveFallOff;
    float _AffectedAreaPlayerBasedObstruction;
    float _PreviewMode;
    float _PreviewIndicatorLineThickness;
    float _AnimationEnabled;
    float _AnimationSpeed;
    float _DefaultEffectRadius;
    float _EnableDefaultEffectRadius;
    float _TransitionDuration;
    float _TexturedEmissionEdge;
    float _TexturedEmissionEdgeStrength;
    float _IsometricExclusion;
    float _IsometricExclusionDistance;
    float _IsometricExclusionGradientLength;
    float _Floor;
    float _FloorMode;
    float _FloorY;
    float _FloorYTextureGradientLength;
    float _PlayerPosYOffset;
    float _AffectedAreaFloor;
    float _Ceiling;
    float _CeilingMode;
    float _CeilingBlendMode;
    float _CeilingY;
    float _CeilingPlayerYOffset;
    float _CeilingYGradientLength;
    float _Zoning;
    float _ZoningMode;
    float _ZoningEdgeGradientLength;
    float _IsZoningRevealable;
    float _SyncZonesWithFloorY;
    float _SyncZonesFloorYOffset;

    half _UseCustomTime;

    half _CrossSectionEnabled;
    half4 _CrossSectionColor;
    half _CrossSectionTextureEnabled;
    float _CrossSectionTextureScale;
    half _CrossSectionUVScaledByDistance;
    half _DissolveMethod;
    half _DissolveTexSpace;
            CBUFFER_END
               #ifdef SCENEPICKINGPASS
               float4 _SelectionID;
               #endif
               #ifdef SCENESELECTIONPASS
               int _ObjectId;
               int _PassValue;
               #endif
            struct VertexToPixel
            {
               float4 pos : SV_POSITION;
               float3 worldPos : TEXCOORD0;
               float3 worldNormal : TEXCOORD1;
               float4 worldTangent : TEXCOORD2;
               float4 texcoord0 : TEXCOORD3;
               float4 texcoord1 : TEXCOORD4;
               float4 texcoord2 : TEXCOORD5;
                float4 texcoord3 : TEXCOORD6;
                float4 screenPos : TEXCOORD7;
               #if UNITY_ANY_INSTANCING_ENABLED
                  UNITY_VERTEX_INPUT_INSTANCE_ID
               #endif 

               #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
                  float4 previousPositionCS : TEXCOORD16; 
                  float4 motionVectorCS : TEXCOORD17;
               #endif

               UNITY_VERTEX_OUTPUT_STEREO
            }; 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
            struct Surface
            {
               half3 Albedo;
               half Height;
               half3 Normal;
               half Smoothness;
               half3 Emission;
               half Metallic;
               half3 Specular;
               half Occlusion;
               half SpecularPower; 
               half Alpha;
               float outputDepth; 
               half SpecularOcclusion;
               half SubsurfaceMask;
               half Thickness;
               half CoatMask;
               half CoatSmoothness;
               half Anisotropy;
               half IridescenceMask;
               half IridescenceThickness;
               int DiffusionProfileHash;
               float SpecularAAThreshold;
               float SpecularAAScreenSpaceVariance;
               float3 DiffuseGI;
               float3 BackDiffuseGI;
               float3 SpecularGI;
               float ior;
               float3 transmittanceColor;
               float atDistance;
               float transmittanceMask;
               float4 ShadowMask;
               float NormalAlpha;
               float MAOSAlpha;
            };
            struct Blackboard
            {
                float blackboardDummyData;
            };
            struct ShaderData
            {
               float4 clipPos; 
               float3 localSpacePosition;
               float3 localSpaceNormal;
               float3 localSpaceTangent;
               float3 worldSpacePosition;
               float3 worldSpaceNormal;
               float3 worldSpaceTangent;
               float tangentSign;

               float3 worldSpaceViewDir;
               float3 tangentSpaceViewDir;

               float4 texcoord0;
               float4 texcoord1;
               float4 texcoord2;
               float4 texcoord3;

               float2 screenUV;
               float4 screenPos;

               float4 vertexColor;
               bool isFrontFace;

               float4 extraV2F0;
               float4 extraV2F1;
               float4 extraV2F2;
               float4 extraV2F3;
               float4 extraV2F4;
               float4 extraV2F5;
               float4 extraV2F6;
               float4 extraV2F7;

               float3x3 TBNMatrix;
               Blackboard blackboard;
            };

            struct VertexData
            {
               #if SHADER_TARGET > 30
               #endif
               float4 vertex : POSITION;
               float3 normal : NORMAL;
               float4 tangent : TANGENT;
               float4 texcoord0 : TEXCOORD0;
               #if _URP && (_USINGTEXCOORD1 || _PASSMETA || _PASSFORWARD || _PASSGBUFFER)
                  float4 texcoord1 : TEXCOORD1;
               #endif

               #if _URP && (_USINGTEXCOORD2 || _PASSMETA || ((_PASSFORWARD || _PASSGBUFFER) && defined(DYNAMICLIGHTMAP_ON)))
                  float4 texcoord2 : TEXCOORD2;
               #endif

               #if _STANDARD && (_USINGTEXCOORD1 || (_PASSMETA || ((_PASSFORWARD || _PASSGBUFFER || _PASSFORWARDADD) && LIGHTMAP_ON)))
                  float4 texcoord1 : TEXCOORD1;
               #endif
               #if _STANDARD && (_USINGTEXCOORD2 || (_PASSMETA || ((_PASSFORWARD || _PASSGBUFFER) && DYNAMICLIGHTMAP_ON)))
                  float4 texcoord2 : TEXCOORD2;
               #endif
               #if _HDRP
                  float4 texcoord1 : TEXCOORD1;
                  float4 texcoord2 : TEXCOORD2;
               #endif
                float4 texcoord3 : TEXCOORD3;
               #if _PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR))
                  float3 previousPositionOS : TEXCOORD4; 
                  #if defined (_ADD_PRECOMPUTED_VELOCITY)
                     float3 precomputedVelocity    : TEXCOORD5; 
                  #endif
               #endif

               UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct TessVertex 
            {
               float4 vertex : INTERNALTESSPOS;
               float3 normal : NORMAL;
               float4 tangent : TANGENT;
               float4 texcoord0 : TEXCOORD0;
               float4 texcoord1 : TEXCOORD1;
               float4 texcoord2 : TEXCOORD2;
                float4 texcoord3 : TEXCOORD3;
               #if _PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR))
                  float3 previousPositionOS : TEXCOORD13; 
                  #if defined (_ADD_PRECOMPUTED_VELOCITY)
                     float3 precomputedVelocity : TEXCOORD14;
                  #endif
               #endif

               UNITY_VERTEX_INPUT_INSTANCE_ID
               UNITY_VERTEX_OUTPUT_STEREO
            };

            struct ExtraV2F
            {
               float4 extraV2F0;
               float4 extraV2F1;
               float4 extraV2F2;
               float4 extraV2F3;
               float4 extraV2F4;
               float4 extraV2F5;
               float4 extraV2F6;
               float4 extraV2F7;
               Blackboard blackboard;
               float4 time;
            };
            float3 WorldToTangentSpace(ShaderData d, float3 normal)
            {
               return mul(d.TBNMatrix, normal);
            }

            float3 TangentToWorldSpace(ShaderData d, float3 normal)
            {
               return mul(normal, d.TBNMatrix);
            }
            #if _STANDARD
               float3 TransformWorldToObject(float3 p) { return mul(unity_WorldToObject, float4(p, 1)); };
               float3 TransformObjectToWorld(float3 p) { return mul(unity_ObjectToWorld, float4(p, 1)); };
               float4 TransformWorldToObject(float4 p) { return mul(unity_WorldToObject, p); };
               float4 TransformObjectToWorld(float4 p) { return mul(unity_ObjectToWorld, p); };
               float4x4 GetWorldToObjectMatrix() { return unity_WorldToObject; }
               float4x4 GetObjectToWorldMatrix() { return unity_ObjectToWorld; }
               #if (defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (SHADER_TARGET_SURFACE_ANALYSIS && !SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))
                 #define UNITY_SAMPLE_TEX2D_LOD(tex,coord, lod) tex.SampleLevel (sampler##tex,coord, lod)
                 #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord, lod) tex.SampleLevel (sampler##samplertex,coord, lod)
              #else
                 #define UNITY_SAMPLE_TEX2D_LOD(tex,coord,lod) tex2D (tex,coord,0,lod)
                 #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord,lod) tex2D (tex,coord,0,lod)
              #endif

               #undef GetWorldToObjectMatrix()

               #define GetWorldToObjectMatrix()   unity_WorldToObject
            #endif

            float3 GetCameraWorldPosition()
            {
               #if _HDRP
                  return GetCameraRelativePositionWS(_WorldSpaceCameraPos);
               #else
                  return _WorldSpaceCameraPos;
               #endif
            }

            #if _GRABPASSUSED
               #if _STANDARD
                  TEXTURE2D(%GRABTEXTURE%);
                  SAMPLER(sampler_%GRABTEXTURE%);
               #endif

               half3 GetSceneColor(float2 uv)
               {
                  #if _STANDARD
                     return SAMPLE_TEXTURE2D(%GRABTEXTURE%, sampler_%GRABTEXTURE%, uv).rgb;
                  #else
                     return SHADERGRAPH_SAMPLE_SCENE_COLOR(uv);
                  #endif
               }
            #endif
            #if _STANDARD
               UNITY_DECLARE_DEPTH_TEXTURE(_CameraDepthTexture);
               float GetSceneDepth(float2 uv) { return SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, uv); }
               float GetLinear01Depth(float2 uv) { return Linear01Depth(GetSceneDepth(uv)); }
               float GetLinearEyeDepth(float2 uv) { return LinearEyeDepth(GetSceneDepth(uv)); } 
            #else
               float GetSceneDepth(float2 uv) { return SHADERGRAPH_SAMPLE_SCENE_DEPTH(uv); }
               float GetLinear01Depth(float2 uv) { return Linear01Depth(GetSceneDepth(uv), _ZBufferParams); }
               float GetLinearEyeDepth(float2 uv) { return LinearEyeDepth(GetSceneDepth(uv), _ZBufferParams); } 
            #endif

            float3 GetWorldPositionFromDepthBuffer(float2 uv, float3 worldSpaceViewDir)
            {
               float eye = GetLinearEyeDepth(uv);
               float3 camView = mul((float3x3)GetObjectToWorldMatrix(), transpose(mul(GetWorldToObjectMatrix(), UNITY_MATRIX_I_V)) [2].xyz);

               float dt = dot(worldSpaceViewDir, camView);
               float3 div = worldSpaceViewDir/dt;
               float3 wpos = (eye * div) + GetCameraWorldPosition();
               return wpos;
            }

            #if _HDRP
            float3 ObjectToWorldSpacePosition(float3 pos)
            {
               return GetAbsolutePositionWS(TransformObjectToWorld(pos));
            }
            #else
            float3 ObjectToWorldSpacePosition(float3 pos)
            {
               return TransformObjectToWorld(pos);
            }
            #endif

            #if _STANDARD
               UNITY_DECLARE_SCREENSPACE_TEXTURE(_CameraDepthNormalsTexture);
               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  float4 depthNorms = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_CameraDepthNormalsTexture, uv);
                  float3 norms = DecodeViewNormalStereo(depthNorms);
                  norms = mul((float3x3)GetWorldToViewMatrix(), norms) * 0.5 + 0.5;
                  return norms;
               }
            #elif _HDRP && !_DECALSHADER
               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  NormalData nd;
                  DecodeFromNormalBuffer(_ScreenSize.xy * uv, nd);
                  return nd.normalWS;
               }
            #elif _URP
               #if (SHADER_LIBRARY_VERSION_MAJOR >= 10)
                  #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareNormalsTexture.hlsl"
               #endif

               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  #if (SHADER_LIBRARY_VERSION_MAJOR >= 10)
                     return SampleSceneNormals(uv);
                  #else
                     float3 wpos = GetWorldPositionFromDepthBuffer(uv, worldSpaceViewDir);
                     return normalize(-cross(ddx(wpos), ddy(wpos))) * 0.5 + 0.5;
                  #endif

                }
             #endif

             #if _HDRP

               half3 UnpackNormalmapRGorAG(half4 packednormal)
               {
                  packednormal.x *= packednormal.w;

                  half3 normal;
                  normal.xy = packednormal.xy * 2 - 1;
                  normal.z = sqrt(1 - saturate(dot(normal.xy, normal.xy)));
                  return normal;
               }
               half3 UnpackNormal(half4 packednormal)
               {
                  #if defined(UNITY_NO_DXT5nm)
                     return packednormal.xyz * 2 - 1;
                  #else
                     return UnpackNormalmapRGorAG(packednormal);
                  #endif
               }
            #endif
            #if _HDRP || _URP

               half3 UnpackScaleNormal(half4 packednormal, half scale)
               {
                 #ifndef UNITY_NO_DXT5nm
                   packednormal.x *= packednormal.w;
                 #endif
                   half3 normal;
                   normal.xy = (packednormal.xy * 2 - 1) * scale;
                   normal.z = sqrt(1 - saturate(dot(normal.xy, normal.xy)));
                   return normal;
               }	

             #endif
            void GetSun(out float3 lightDir, out float3 color)
            {
               lightDir = float3(0.5, 0.5, 0);
               color = 1;
               #if _HDRP
                  if (_DirectionalLightCount > 0)
                  {
                     DirectionalLightData light = _DirectionalLightDatas[0];
                     lightDir = -light.forward.xyz;
                     color = light.color;
                  }
               #elif _STANDARD
			         lightDir = normalize(_WorldSpaceLightPos0.xyz);
                  color = _LightColor0.rgb;
               #elif _URP
	               Light light = GetMainLight();
	               lightDir = light.direction;
	               color = light.color;
               #endif
            }
    sampler2D _EmissiveColorMap;
    sampler2D _BaseColorMap;
    sampler2D _MaskMap;
    sampler2D _NormalMap;
    sampler2D _NormalMapOS;
    sampler2D _DetailMap;
    sampler2D _TangentMap;
    sampler2D _TangentMapOS;
    sampler2D _AnisotropyMap;
    sampler2D _SubsurfaceMaskMap;
    sampler2D _TransmissionMaskMap;
    sampler2D _ThicknessMap;
    sampler2D _IridescenceThicknessMap;
    sampler2D _IridescenceMaskMap;
    sampler2D _SpecularColorMap;

    sampler2D _CoatMaskMap;

    float3 DecodeNormal (float4 sample, float scale) {
        #if defined(UNITY_NO_DXT5nm)
            return UnpackNormalRGB(sample, scale);
        #else
            return UnpackNormalmapRGorAG(sample, scale);
        #endif
    }

	void Ext_SurfaceFunction0 (inout Surface o, ShaderData d)
	{
        float2 uvBase = (_UVMappingMask.x * d.texcoord0 +
                        _UVMappingMask.y * d.texcoord1 +
                        _UVMappingMask.z * d.texcoord2 +
                        _UVMappingMask.w * d.texcoord3).xy;

        float2 uvDetails =  (_UVDetailsMappingMask.x * d.texcoord0 +
                            _UVDetailsMappingMask.y * d.texcoord1 +
                            _UVDetailsMappingMask.z * d.texcoord2 +
                            _UVDetailsMappingMask.w * d.texcoord3).xy;
        float4 texcoords;
        texcoords.xy = uvBase * _BaseColorMap_ST.xy + _BaseColorMap_ST.zw; 

        texcoords.zw = uvDetails * _DetailMap_ST.xy + _DetailMap_ST.zw;

        if (_LinkDetailsWithBase > 0.0)
        {
            texcoords.zw = texcoords.zw  * _BaseColorMap_ST.xy + _BaseColorMap_ST.zw;

        }

            float3 detailNormalTS = float3(0.0, 0.0, 0.0);
            float detailMask = 0.0;
            #ifdef _DETAIL_MAP
                detailMask = 1.0;
                #ifdef _MASKMAP
                    detailMask = tex2D(_MaskMap, texcoords.xy).b;
                #endif
                float2 detailAlbedoAndSmoothness = tex2D(_DetailMap, texcoords.zw).rb;
                float detailAlbedo = detailAlbedoAndSmoothness.r * 2.0 - 1.0;
                float detailSmoothness = detailAlbedoAndSmoothness.g * 2.0 - 1.0;
                real4 packedNormal = tex2D(_DetailMap, texcoords.zw).rgba;
                detailNormalTS = UnpackNormalAG(packedNormal, _DetailNormalScale);
            #endif
            float4 color = tex2D(_BaseColorMap, texcoords.xy).rgba  * _Color.rgba;
            o.Albedo = color.rgb; 
            float alpha = color.a;
            alpha = lerp(_AlphaRemapMin, _AlphaRemapMax, alpha);
            o.Alpha = alpha;
            #ifdef _DETAIL_MAP
                float albedoDetailSpeed = saturate(abs(detailAlbedo) * _DetailAlbedoScale);
                float3 baseColorOverlay = lerp(sqrt(o.Albedo), (detailAlbedo < 0.0) ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0), albedoDetailSpeed * albedoDetailSpeed);
                baseColorOverlay *= baseColorOverlay;
                o.Albedo = lerp(o.Albedo, saturate(baseColorOverlay), detailMask);
            #endif

            #ifdef _NORMALMAP
                float3 normalTS;
                #ifdef _NORMALMAP_TANGENT_SPACE
                    normalTS = DecodeNormal(tex2D(_NormalMap, texcoords.xy), _NormalScale);
                #else
                    #ifdef SURFACE_GRADIENT
                        float3 normalOS = tex2D(_NormalMapOS, texcoords.xy).xyz * 2.0 - 1.0;
                        normalTS = SurfaceGradientFromPerturbedNormal(d.worldSpaceNormal, TransformObjectToWorldNormal(normalOS));
                    #else
                        float3 normalOS = UnpackNormalRGB(tex2D(_NormalMapOS, texcoords.xy), 1.0);
                        float3 bitangent = d.tangentSign * cross(d.worldSpaceNormal.xyz, d.worldSpaceTangent.xyz);
                        half3x3 tangentToWorld = half3x3(d.worldSpaceTangent.xyz, bitangent.xyz, d.worldSpaceNormal.xyz);
                        normalTS = TransformObjectToTangent(normalOS, tangentToWorld);
                    #endif
                #endif

                #ifdef _DETAIL_MAP
                    #ifdef SURFACE_GRADIENT
                    normalTS += detailNormalTS * detailMask;
                    #else
                    normalTS = lerp(normalTS, BlendNormalRNM(normalTS, normalize(detailNormalTS)), detailMask); 
                    #endif
                #endif
                o.Normal = normalTS;

            #endif

            #if defined(_MASKMAP)
                o.Smoothness = tex2D(_MaskMap, texcoords.xy).a;
                o.Smoothness = lerp(_SmoothnessRemapMin, _SmoothnessRemapMax, o.Smoothness);
            #else
                o.Smoothness = _Smoothness;
            #endif
            #ifdef _DETAIL_MAP
                float smoothnessDetailSpeed = saturate(abs(detailSmoothness) * _DetailSmoothnessScale);
                float smoothnessOverlay = lerp(o.Smoothness, (detailSmoothness < 0.0) ? 0.0 : 1.0, smoothnessDetailSpeed);
                o.Smoothness = lerp(o.Smoothness, saturate(smoothnessOverlay), detailMask);
            #endif
            #ifdef _MASKMAP
                o.Metallic = tex2D(_MaskMap, texcoords.xy).r;
                o.Metallic = lerp(_MetallicRemapMin, _MetallicRemapMax, o.Metallic);
                o.Occlusion = tex2D(_MaskMap, texcoords.xy).g;
                o.Occlusion = lerp(_AORemapMin, _AORemapMax, o.Occlusion);
            #else
                o.Metallic = _Metallic;
                o.Occlusion = 1.0;
            #endif

            #if defined(_SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP)
            #elif  defined(_MASKMAP) && !defined(_SPECULAR_OCCLUSION_NONE)
                float3 V = normalize(d.worldSpaceViewDir);
                o.SpecularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(d.worldSpaceNormal, V)), o.Occlusion, PerceptualSmoothnessToRoughness(o.Smoothness));
            #endif

            o.DiffusionProfileHash = asuint(_DiffusionProfileHash);
            o.SubsurfaceMask = _SubsurfaceMask;
            #ifdef _SUBSURFACE_MASK_MAP
                o.SubsurfaceMask *= tex2D(_SubsurfaceMaskMap, texcoords.xy).r;
            #endif
            #ifdef _THICKNESSMAP
                o.Thickness = tex2D(_ThicknessMap, texcoords.xy).r;
                o.Thickness = _ThicknessRemap.x + _ThicknessRemap.y * surfaceData.thickness;
            #else
                o.Thickness = _Thickness;
            #endif
            #ifdef _ANISOTROPYMAP
                o.Anisotropy = tex2D(_AnisotropyMap, texcoords.xy).r;
            #else
                o.Anisotropy = 1.0;
            #endif
                o.Anisotropy *= _Anisotropy;
                o.Specular = _SpecularColor.rgb;
            #ifdef _SPECULARCOLORMAP
                o.Specular *= tex2D(_SpecularColorMap, texcoords.xy).rgb;
            #endif
            #ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                o.Albedo *= _EnergyConservingSpecularColor > 0.0 ? (1.0 - Max3(o.Specular.r, o.Specular.g, o.Specular.b)) : 1.0;
            #endif
            #ifdef _MATERIAL_FEATURE_CLEAR_COAT
                o.CoatMask = _CoatMask;
                o.CoatMask *= tex2D(_CoatMaskMap, texcoords.xy).r;
            #else
                o.CoatMask = 0.0;
            #endif
            #ifdef _MATERIAL_FEATURE_IRIDESCENCE
                #ifdef _IRIDESCENCE_THICKNESSMAP
                o.IridescenceThickness = tex2D(_IridescenceThicknessMap, texcoords.xy).r;
                o.IridescenceThickness = _IridescenceThicknessRemap.x + _IridescenceThicknessRemap.y * o.IridescenceThickness;
                #else
                o.IridescenceThickness = _IridescenceThickness;
                #endif
                o.IridescenceMask = _IridescenceMask;
                o.IridescenceMask *= tex2D(_IridescenceMaskMap, texcoords.xy).r;
            #else
                o.IridescenceThickness = 0.0;
                o.IridescenceMask = 0.0;
            #endif
            float3 emissiveColor = _EmissiveColor * lerp(float3(1.0, 1.0, 1.0), o.Albedo.rgb, _AlbedoAffectEmissive);
            #ifdef _EMISSIVE_COLOR_MAP                
                float2 uvEmission = _UVMappingMaskEmissive.x * d.texcoord0 +
                                    _UVMappingMaskEmissive.y * d.texcoord1 +
                                    _UVMappingMaskEmissive.z * d.texcoord2 +
                                    _UVMappingMaskEmissive.w * d.texcoord3;

                uvEmission = uvEmission * _EmissiveColorMap_ST.xy + _EmissiveColorMap_ST.zw;                     

                emissiveColor *= tex2D(_EmissiveColorMap, uvEmission).rgb;
            #endif
            o.Emission += emissiveColor;
            float currentExposureMultiplier = 0;
            #if SHADEROPTIONS_PRE_EXPOSITION
                currentExposureMultiplier =  LOAD_TEXTURE2D(_ExposureTexture, int2(0, 0)).x * _ProbeExposureScale;
            #else
                currentExposureMultiplier =  _ProbeExposureScale;
            #endif
            float InverseCurrentExposureMultiplier = 0;
            float exposure = currentExposureMultiplier;
            InverseCurrentExposureMultiplier =  rcp(exposure + (exposure == 0.0)); 
            float3 emissiveRcpExposure = o.Emission * InverseCurrentExposureMultiplier;
            o.Emission = lerp(emissiveRcpExposure, o.Emission, _EmissiveExposureWeight);
            #if defined(_ALPHATEST_ON)
                float alphaTex = tex2D(_BaseColorMap, texcoords.xy).a;
                alphaTex = lerp(_AlphaRemapMin, _AlphaRemapMax, alphaTex);
                float alphaValue = alphaTex * _BaseColor.a;
                float alphaCutoff = _AlphaCutoff;
                clip(alpha - alphaCutoff);
            #endif

	}
    float _ArrayLength = 0;
    #if (defined(SHADER_API_GLES) || defined(SHADER_API_GLES3)) 
        float4 _PlayersPosVectorArray[20];
        float _PlayersDataFloatArray[150];     
    #else
        float4 _PlayersPosVectorArray[100];
        float _PlayersDataFloatArray[500];  
    #endif
    #if _ZONING
        #if (defined(SHADER_API_GLES) || defined(SHADER_API_GLES3)) 
            float _ZDFA[500];
        #else
            float _ZDFA[1000];
        #endif
        float _ZonesDataCount;
    #endif

    float _STSCustomTime = 0;
    #if _REPLACEMENT        
        half4 _DissolveColorGlobal;
        float _DissolveColorSaturationGlobal;
        float _DissolveEmissionGlobal;
        float _DissolveEmissionBoosterGlobal;
        float _TextureVisibilityGlobal;
        float _ObstructionGlobal;
        float _AngleStrengthGlobal;
        float _ConeStrengthGlobal;
        float _ConeObstructionDestroyRadiusGlobal;
        float _CylinderStrengthGlobal;
        float _CylinderObstructionDestroyRadiusGlobal;
        float _CircleStrengthGlobal;
        float _CircleObstructionDestroyRadiusGlobal;
        float _CurveStrengthGlobal;
        float _CurveObstructionDestroyRadiusGlobal;
        float _DissolveFallOffGlobal;
        float _AffectedAreaPlayerBasedObstructionGlobal;
        float _IntrinsicDissolveStrengthGlobal;
        float _PreviewModeGlobal;
        float _UVsGlobal;
        float _hasClippedShadowsGlobal;
        float _FloorGlobal;
        float _FloorModeGlobal;
        float _FloorYGlobal;
        float _PlayerPosYOffsetGlobal;
        float _FloorYTextureGradientLengthGlobal;
        float _AffectedAreaFloorGlobal;
        float _AnimationEnabledGlobal;
        float _AnimationSpeedGlobal;
        float _DefaultEffectRadiusGlobal;
        float _EnableDefaultEffectRadiusGlobal;
        float _TransitionDurationGlobal;        
        float _TexturedEmissionEdgeGlobal;
        float _TexturedEmissionEdgeStrengthGlobal;
        float _IsometricExclusionGlobal;
        float _IsometricExclusionDistanceGlobal;
        float _IsometricExclusionGradientLengthGlobal;
        float _CeilingGlobal;
        float _CeilingModeGlobal;
        float _CeilingBlendModeGlobal;
        float _CeilingYGlobal;
        float _CeilingPlayerYOffsetGlobal;
        float _CeilingYGradientLengthGlobal;
        float _ZoningGlobal;
        float _ZoningModeGlobal;
        float _ZoningEdgeGradientLengthGlobal;
        float _IsZoningRevealableGlobal;
        float _SyncZonesWithFloorYGlobal;
        float _SyncZonesFloorYOffsetGlobal;
        float4 _ObstructionCurveGlobal_TexelSize;
        float4 _DissolveMaskGlobal_TexelSize;
        float _DissolveMaskEnabledGlobal;
        float _PreviewIndicatorLineThicknessGlobal;
        half _UseCustomTimeGlobal;

        half _CrossSectionEnabledGlobal;
        half4 _CrossSectionColorGlobal;
        half _CrossSectionTextureEnabledGlobal;
        float _CrossSectionTextureScaleGlobal;
        half _CrossSectionUVScaledByDistanceGlobal;

        half _DissolveMethodGlobal;
        half _DissolveTexSpaceGlobal;

        float4 _DissolveTexGlobal_TexelSize;
    #endif
    #if _REPLACEMENT
        sampler2D _DissolveTexGlobal;
    #else
        sampler2D _DissolveTex;
    #endif
    #if _REPLACEMENT
        sampler2D _DissolveMaskGlobal;
    #else
        sampler2D _DissolveMask;
    #endif
    #if _REPLACEMENT
        sampler2D _ObstructionCurveGlobal;
    #else
        sampler2D _ObstructionCurve;
    #endif

    #if _REPLACEMENT
        sampler2D _CrossSectionTextureGlobal;
    #else
        sampler2D _CrossSectionTexture;
    #endif
#ifdef USE_UNITY_TEXTURE_2D_TYPE
#undef USE_UNITY_TEXTURE_2D_TYPE
#endif

#include "Packages/com.shadercrew.seethroughshader.core/Scripts/Shaders/xxSharedSTSDependencies/SeeThroughShaderFunction.hlsl"
	void Ext_SurfaceFunction1 (inout Surface o, ShaderData d)
	{
        half3 albedo;
        half3 emission;
        float alphaForClipping;
#ifdef USE_UNITY_TEXTURE_2D_TYPE
#undef USE_UNITY_TEXTURE_2D_TYPE
#endif
#if _REPLACEMENT
    DoSeeThroughShading( o.Albedo, o.Normal, d.worldSpacePosition, d.worldSpaceNormal, d.screenPos,
                        _numOfPlayersInside, _tDirection, _tValue, _id,
                        _TriggerMode, _RaycastMode,
                        _IsExempt,

                        _DissolveMethodGlobal, _DissolveTexSpaceGlobal,

                        _DissolveColorGlobal, _DissolveColorSaturationGlobal, _UVsGlobal,
                        _DissolveEmissionGlobal, _DissolveEmissionBoosterGlobal, _TexturedEmissionEdgeGlobal, _TexturedEmissionEdgeStrengthGlobal,
                        _hasClippedShadowsGlobal,

                        _ObstructionGlobal,
                        _AngleStrengthGlobal,
                        _ConeStrengthGlobal, _ConeObstructionDestroyRadiusGlobal,
                        _CylinderStrengthGlobal, _CylinderObstructionDestroyRadiusGlobal,
                        _CircleStrengthGlobal, _CircleObstructionDestroyRadiusGlobal,
                        _CurveStrengthGlobal, _CurveObstructionDestroyRadiusGlobal,
                        _DissolveFallOffGlobal,
                        _DissolveMaskEnabledGlobal,
                        _AffectedAreaPlayerBasedObstructionGlobal,
                        _IntrinsicDissolveStrengthGlobal,
                        _DefaultEffectRadiusGlobal, _EnableDefaultEffectRadiusGlobal,

                        _IsometricExclusionGlobal, _IsometricExclusionDistanceGlobal, _IsometricExclusionGradientLengthGlobal,
                        _CeilingGlobal, _CeilingModeGlobal, _CeilingBlendModeGlobal, _CeilingYGlobal, _CeilingPlayerYOffsetGlobal, _CeilingYGradientLengthGlobal,
                        _FloorGlobal, _FloorModeGlobal, _FloorYGlobal, _PlayerPosYOffsetGlobal, _FloorYTextureGradientLengthGlobal, _AffectedAreaFloorGlobal,

                        _AnimationEnabledGlobal, _AnimationSpeedGlobal,
                        _TransitionDurationGlobal,

                        _UseCustomTimeGlobal,

                        _ZoningGlobal, _ZoningModeGlobal, _IsZoningRevealableGlobal, _ZoningEdgeGradientLengthGlobal,
                        _SyncZonesWithFloorYGlobal, _SyncZonesFloorYOffsetGlobal,

                        _PreviewModeGlobal,
                        _PreviewIndicatorLineThicknessGlobal,

                        _DissolveTexGlobal,
                        _DissolveMaskGlobal,
                        _ObstructionCurveGlobal,

                        _DissolveTexGlobal_TexelSize,
                        _DissolveMaskGlobal_TexelSize,
                        _ObstructionCurveGlobal_TexelSize,

                        albedo, emission, alphaForClipping);
#else 
    DoSeeThroughShading( o.Albedo, o.Normal, d.worldSpacePosition, d.worldSpaceNormal, d.screenPos,

                        _numOfPlayersInside, _tDirection, _tValue, _id,
                        _TriggerMode, _RaycastMode,
                        _IsExempt,

                        _DissolveMethod, _DissolveTexSpace,

                        _DissolveColor, _DissolveColorSaturation, _UVs,
                        _DissolveEmission, _DissolveEmissionBooster, _TexturedEmissionEdge, _TexturedEmissionEdgeStrength,
                        _hasClippedShadows,

                        _Obstruction,
                        _AngleStrength,
                        _ConeStrength, _ConeObstructionDestroyRadius,
                        _CylinderStrength, _CylinderObstructionDestroyRadius,
                        _CircleStrength, _CircleObstructionDestroyRadius,
                        _CurveStrength, _CurveObstructionDestroyRadius,
                        _DissolveFallOff,
                        _DissolveMaskEnabled,
                        _AffectedAreaPlayerBasedObstruction,
                        _IntrinsicDissolveStrength,
                        _DefaultEffectRadius, _EnableDefaultEffectRadius,

                        _IsometricExclusion, _IsometricExclusionDistance, _IsometricExclusionGradientLength,
                        _Ceiling, _CeilingMode, _CeilingBlendMode, _CeilingY, _CeilingPlayerYOffset, _CeilingYGradientLength,
                        _Floor, _FloorMode, _FloorY, _PlayerPosYOffset, _FloorYTextureGradientLength, _AffectedAreaFloor,

                        _AnimationEnabled, _AnimationSpeed,
                        _TransitionDuration,

                        _UseCustomTime,

                        _Zoning, _ZoningMode , _IsZoningRevealable, _ZoningEdgeGradientLength,
                        _SyncZonesWithFloorY, _SyncZonesFloorYOffset,

                        _PreviewMode,
                        _PreviewIndicatorLineThickness,                            

                        _DissolveTex,
                        _DissolveMask,
                        _ObstructionCurve,

                        _DissolveTex_TexelSize,
                        _DissolveMask_TexelSize,
                        _ObstructionCurve_TexelSize,

                        albedo, emission, alphaForClipping);
#endif 
        o.Albedo = albedo;
        o.Emission += emission;   

	}
    void Ext_FinalColorForward1 (Surface o, ShaderData d, inout half4 color)
    {
        #if _REPLACEMENT   
            DoCrossSection(_CrossSectionEnabledGlobal,
                        _CrossSectionColorGlobal,
                        _CrossSectionTextureEnabledGlobal,
                        _CrossSectionTextureGlobal,
                        _CrossSectionTextureScaleGlobal,
                        _CrossSectionUVScaledByDistanceGlobal,
                        d.isFrontFace,
                        d.screenPos,
                        color);
        #else 
            DoCrossSection(_CrossSectionEnabled,
                        _CrossSectionColor,
                        _CrossSectionTextureEnabled,
                        _CrossSectionTexture,
                        _CrossSectionTextureScale,
                        _CrossSectionUVScaledByDistance,
                        d.isFrontFace,
                        d.screenPos,
                        color);
        #endif
    }
            void ChainSurfaceFunction(inout Surface l, inout ShaderData d)
            {
                  Ext_SurfaceFunction0(l, d);
                  Ext_SurfaceFunction1(l, d);
            }

#if !_DECALSHADER

            void ChainModifyVertex(inout VertexData v, inout VertexToPixel v2p, float4 time)
            {
                 ExtraV2F d;
                 ZERO_INITIALIZE(ExtraV2F, d);
                 ZERO_INITIALIZE(Blackboard, d.blackboard);
                 d.time = time;
            }

            void ChainModifyTessellatedVertex(inout VertexData v, inout VertexToPixel v2p)
            {
               ExtraV2F d;
               ZERO_INITIALIZE(ExtraV2F, d);
               ZERO_INITIALIZE(Blackboard, d.blackboard);
            }

            void ChainFinalColorForward(inout Surface l, inout ShaderData d, inout half4 color)
            {
                  Ext_FinalColorForward1(l, d, color);
            }

            void ChainFinalGBufferStandard(inout Surface s, inout ShaderData d, inout half4 GBuffer0, inout half4 GBuffer1, inout half4 GBuffer2, inout half4 outEmission, inout half4 outShadowMask)
            {
            }
#endif
#if _DECALSHADER

        ShaderData CreateShaderData(SurfaceDescriptionInputs IN)
        {
            ShaderData d = (ShaderData)0;
            d.TBNMatrix = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
            d.worldSpaceNormal = IN.WorldSpaceNormal;
            d.worldSpaceTangent = IN.WorldSpaceTangent;

            d.worldSpacePosition = IN.WorldSpacePosition;
            d.texcoord0 = IN.uv0.xyxy;
            d.screenPos = IN.ScreenPosition;

            d.worldSpaceViewDir = normalize(_WorldSpaceCameraPos - d.worldSpacePosition);

            d.tangentSpaceViewDir = mul(d.TBNMatrix, d.worldSpaceViewDir);
            #if _HDRP
            #else
            #endif
             d.screenUV = (IN.ScreenPosition.xy / max(0.01, IN.ScreenPosition.w));
            return d;
        }
#else

         ShaderData CreateShaderData(VertexToPixel i
                  #if NEED_FACING
                     , bool facing
                  #endif
         )
         {
            ShaderData d = (ShaderData)0;
            d.clipPos = i.pos;
            d.worldSpacePosition = i.worldPos;

            d.worldSpaceNormal = normalize(i.worldNormal);
            d.worldSpaceTangent.xyz = normalize(i.worldTangent.xyz);

            d.tangentSign = i.worldTangent.w * unity_WorldTransformParams.w;
            float3 bitangent = cross(d.worldSpaceTangent.xyz, d.worldSpaceNormal) * d.tangentSign;
            d.TBNMatrix = float3x3(d.worldSpaceTangent, -bitangent, d.worldSpaceNormal);
            d.worldSpaceViewDir = normalize(_WorldSpaceCameraPos - i.worldPos);

            d.tangentSpaceViewDir = mul(d.TBNMatrix, d.worldSpaceViewDir);
             d.texcoord0 = i.texcoord0;
             d.texcoord1 = i.texcoord1;
             d.texcoord2 = i.texcoord2;
             d.texcoord3 = i.texcoord3;
             d.isFrontFace = facing;
            #if _HDRP
            #else
            #endif
             d.screenPos = i.screenPos;
             d.screenUV = (i.screenPos.xy / i.screenPos.w);
            return d;
         }

#endif
#if (SHADERPASS == SHADERPASS_LIGHT_TRANSPORT)
   float unity_OneOverOutputBoost;
   float unity_MaxOutputValue;

   CBUFFER_START(UnityMetaPass)
   bool4 unity_MetaVertexControl;
   bool4 unity_MetaFragmentControl;
   CBUFFER_END

   VertexToPixel Vert(VertexData inputMesh)
   {
       VertexToPixel output;
       ZERO_INITIALIZE(VertexToPixel, output);
       UNITY_SETUP_INSTANCE_ID(inputMesh);
       UNITY_TRANSFER_INSTANCE_ID(inputMesh, output);
       UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);
       float2 uv = float2(0.0, 0.0);

       if (unity_MetaVertexControl.x)
       {
           uv = inputMesh.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
       }
       else if (unity_MetaVertexControl.y)
       {
           uv = inputMesh.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
       }
       output.pos = float4(uv * 2.0 - 1.0, inputMesh.vertex.z > 0 ? 1.0e-4 : 0.0, 1.0);

       output.worldPos = TransformObjectToWorld(inputMesh.vertex.xyz).xyz;
       output.worldNormal = TransformObjectToWorldNormal(inputMesh.normal);
       output.worldTangent = float4(1.0, 0.0, 0.0, 0.0);

       output.texcoord0 = inputMesh.texcoord0;
       output.texcoord1 = inputMesh.texcoord1;
       output.texcoord2 = inputMesh.texcoord2;
        output.texcoord3 = inputMesh.texcoord3;
       return output;
   }
#else

   #if (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
      #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariablesMatrixDefsHDCamera.hlsl"

      void MotionVectorPositionZBias(VertexToPixel input)
      {
      #if UNITY_REVERSED_Z
          input.pos.z -= unity_MotionVectorsParams.z * input.pos.w;
      #else
          input.pos.z += unity_MotionVectorsParams.z * input.pos.w;
      #endif
      }

   #endif

   VertexToPixel Vert(VertexData input)
   {
       VertexToPixel output;
       ZERO_INITIALIZE(VertexToPixel, output);

       UNITY_SETUP_INSTANCE_ID(input);
       UNITY_TRANSFER_INSTANCE_ID(input, output);
       UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

       #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
         VertexData previousMesh = input;
       #endif

       ChainModifyVertex(input, output, _Time);
       float3 positionRWS = TransformObjectToWorld(input.vertex.xyz);
       float3 normalWS = TransformObjectToWorldNormal(input.normal);
       float4 tangentWS = float4(TransformObjectToWorldDir(input.tangent.xyz), input.tangent.w);
       output.worldPos = GetAbsolutePositionWS(positionRWS);
       output.pos = TransformWorldToHClip(positionRWS);
       output.worldNormal = normalWS;
       output.worldTangent = tangentWS;
       output.texcoord0 = input.texcoord0;
       output.texcoord1 = input.texcoord1;
       output.texcoord2 = input.texcoord2;
        output.texcoord3 = input.texcoord3;
        output.screenPos = ComputeScreenPos(output.pos, _ProjectionParams.x);
       #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))

          #if !defined(TESSELLATION_ON)
            MotionVectorPositionZBias(output);
          #endif

          output.motionVectorCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(positionRWS.xyz, 1.0));
          bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
          if (forceNoMotion)
          {
              output.previousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
          }
          else
          {
            bool hasDeformation = unity_MotionVectorsParams.x > 0.0; 

            float3 effectivePositionOS = (hasDeformation ? previousMesh.previousPositionOS : previousMesh.vertex.xyz);
            #if defined(_ADD_PRECOMPUTED_VELOCITY)
               effectivePositionOS -= input.precomputedVelocity;
            #endif

            previousMesh.vertex = float4(effectivePositionOS, 1);
            VertexToPixel dummy = (VertexToPixel)0;
            ChainModifyVertex(previousMesh, dummy, _LastTimeParameters);
            float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.vertex.xyz);

            #ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
            if (_TransparentCameraOnlyMotionVectors > 0)
            {
               previousPositionRWS = positionRWS.xyz;
            }
            #endif 

            output.previousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
         }
       #endif 
       return output;
   }
#endif
               #if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
                  #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
               #endif

                FragInputs BuildFragInputs(VertexToPixel input)
                {
                    UNITY_SETUP_INSTANCE_ID(input);
                    FragInputs output;
                    ZERO_INITIALIZE(FragInputs, output);
                    output.tangentToWorld = k_identity3x3;
                    output.positionSS = input.pos;       
                    output.positionRWS = GetCameraRelativePositionWS(input.worldPos);
                    output.tangentToWorld = BuildTangentToWorld(input.worldTangent, input.worldNormal);
                    output.texCoord0 = input.texcoord0;
                    output.texCoord1 = input.texcoord1;
                    output.texCoord2 = input.texcoord2;
                    return output;
                }
               void BuildSurfaceData(FragInputs fragInputs, inout Surface surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
               {
                   ZERO_INITIALIZE(SurfaceData, surfaceData);
                   surfaceData.specularOcclusion = 1.0;
                   surfaceData.baseColor =                 surfaceDescription.Albedo;
                   surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;
                   surfaceData.ambientOcclusion =          surfaceDescription.Occlusion;
                   surfaceData.specularOcclusion =         surfaceDescription.SpecularOcclusion;
                   surfaceData.metallic =                  surfaceDescription.Metallic;
                   surfaceData.subsurfaceMask =            surfaceDescription.SubsurfaceMask;
                   surfaceData.thickness =                 surfaceDescription.Thickness;
                   surfaceData.diffusionProfileHash =      asuint(surfaceDescription.DiffusionProfileHash);
                   #if _USESPECULAR
                      surfaceData.specularColor =             surfaceDescription.Specular;
                   #endif
                   surfaceData.coatMask =                  surfaceDescription.CoatMask;
                   surfaceData.anisotropy =                surfaceDescription.Anisotropy;
                   surfaceData.iridescenceMask =           surfaceDescription.IridescenceMask;
                   surfaceData.iridescenceThickness =      surfaceDescription.IridescenceThickness;
                   #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                        if (_EnableSSRefraction)
                        {
                            surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                            surfaceDescription.Alpha = 1.0;
                        }
                        else
                        {
                            surfaceData.ior = surfaceDescription.ior;
                            surfaceData.transmittanceColor = surfaceDescription.transmittanceColor;
                            surfaceData.atDistance = surfaceDescription.atDistance;
                            surfaceData.transmittanceMask = surfaceDescription.transmittanceMask;
                            surfaceDescription.Alpha = 1.0;
                        }
                    #else
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                    #endif
                    surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
                    #ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
                    #endif
                    #ifdef _MATERIAL_FEATURE_TRANSMISSION
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
                    #endif
                    #ifdef _MATERIAL_FEATURE_ANISOTROPY
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                        surfaceData.normalWS = float3(0, 1, 0);
                    #endif
                    #ifdef _MATERIAL_FEATURE_IRIDESCENCE
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
                    #endif
                    #ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
                    #endif
                    #if defined(_MATERIAL_FEATURE_CLEAR_COAT) || _CLEARCOAT
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
                    #endif
                    #if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                        surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
                    #endif
                   #if !_WORLDSPACENORMAL
                      surfaceData.normalWS = mul(surfaceDescription.Normal, fragInputs.tangentToWorld);
                   #else
                      surfaceData.normalWS = surfaceDescription.Normal;
                   #endif

                   surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                   surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    
                    #if HAVE_DECALS
                        if (_EnableDecals)
                        {
                            float alpha = 1.0;
                            alpha = surfaceDescription.Alpha;
                            DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], alpha);
                            ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
                        }
                    #endif
                    bentNormalWS = surfaceData.normalWS;
                    surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);
                    #ifdef DEBUG_DISPLAY
                        if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
                        {
                            surfaceData.metallic = 0;
                        }
                        ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
                    #endif
                    #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                    #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                        surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                    #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                        surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                    #endif
                    #if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
                        surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                    #endif
               }
               void GetSurfaceAndBuiltinData(VertexToPixel m2ps, FragInputs fragInputs, float3 V, inout PositionInputs posInput,
                     out SurfaceData surfaceData, out BuiltinData builtinData, inout Surface l, inout ShaderData d
                     #if NEED_FACING
                        , bool facing
                     #endif
                  )
               {
                 d = CreateShaderData(m2ps
                    #if NEED_FACING
                       , facing
                    #endif
                 );

                 l = (Surface)0;

                 l.Albedo = half3(0.5, 0.5, 0.5);
                 l.Normal = float3(0,0,1);
                 l.Occlusion = 1;
                 l.Alpha = 1;
                 l.SpecularOcclusion = 1;

                 #if !defined(SHADER_STAGE_RAY_TRACING) && defined(_DEPTHOFFSET_ON)
                    l.outputDepth = d.clipPos.z;
                 #endif

                 ChainSurfaceFunction(l, d);

                 #if !defined(SHADER_STAGE_RAY_TRACING) && defined(_DEPTHOFFSET_ON)
                 #endif

                 #if _UNLIT
                     l.Normal = half3(0,0,1);
                     l.Occlusion = 1;
                     l.Metallic = 0;
                     l.Specular = 0;
                 #endif

                 surfaceData.geomNormalWS = d.worldSpaceNormal;
                 surfaceData.tangentWS = d.worldSpaceTangent;
                 fragInputs.tangentToWorld = d.TBNMatrix;

                 float3 bentNormalWS;
                 BuildSurfaceData(fragInputs, l, V, posInput, surfaceData, bentNormalWS);
                 InitBuiltinData(posInput, l.Alpha, bentNormalWS, -d.worldSpaceNormal, fragInputs.texCoord1, fragInputs.texCoord2, builtinData);
                 builtinData.emissiveColor = l.Emission;

                 #if defined(_OVERRIDE_BAKEDGI)
                    builtinData.bakeDiffuseLighting = l.DiffuseGI;
                    builtinData.backBakeDiffuseLighting = l.BackDiffuseGI;
                    builtinData.emissiveColor += l.SpecularGI;
                 #endif

                 #if defined(_OVERRIDE_SHADOWMASK)
                    builtinData.shadowMask0 = l.ShadowMask.x;
                    builtinData.shadowMask1 = l.ShadowMask.y;
                    builtinData.shadowMask2 = l.ShadowMask.z;
                    builtinData.shadowMask3 = l.ShadowMask.w;
                 #endif

                 #if defined(UNITY_VIRTUAL_TEXTURING)
                    builtinData.vtPackedFeedback = surfaceData.VTPackedFeedback;
                 #endif

                  #if (SHADERPASS == SHADERPASS_DISTORTION)
                     builtinData.distortion = surfaceData.Distortion;
                     builtinData.distortionBlur = surfaceData.DistortionBlur;
                  #endif

                  #ifndef SHADER_UNLIT
                    PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                  #else
                    ApplyDebugToBuiltinData(builtinData);
                  #endif
                  RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
               }
            void Frag( VertexToPixel v2f
                          #if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
                          , out float4 outColor : SV_Target0
                          #else
                          #ifdef WRITE_MSAA_DEPTH
                            , out float4 depthColor : SV_Target0
                                #ifdef WRITE_NORMAL_BUFFER
                                , out float4 outNormalBuffer : SV_Target1
                                #endif
                            #else
                                #ifdef WRITE_NORMAL_BUFFER
                                , out float4 outNormalBuffer : SV_Target0
                                #endif
                            #endif
                            #if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
                            , out float4 outDecalBuffer : SV_TARGET_DECAL
                            #endif
                        #endif
                        #if NEED_FACING
                           , bool facing : SV_IsFrontFace
                        #endif

                      )
              {
                  UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(v2f);
                  FragInputs input = BuildFragInputs(v2f);
                  PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

                  float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);
                  SurfaceData surfaceData;
                  BuiltinData builtinData;
                  Surface l;
                  ShaderData d;
                  GetSurfaceAndBuiltinData(v2f, input, V, posInput, surfaceData, builtinData, l, d
               #if NEED_FACING
                  , facing
               #endif
               );
                  #ifdef SCENESELECTIONPASS
                      outColor = float4(_ObjectId, _PassValue, 1.0, 1.0);
                  #elif defined(SCENEPICKINGPASS)
                      outColor = _SelectionID;
                  #else
                     #ifdef WRITE_MSAA_DEPTH
                       depthColor = v2p.pos.z;

                       #ifdef _ALPHATOMASK_ON
                          depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
                       #endif 
                     #endif 
                     #if defined(WRITE_NORMAL_BUFFER)
                        EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
                     #endif

                     #if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
                        DecalPrepassData decalPrepassData;
                        decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
                        decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
                        EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
                     #endif
                  #endif
              }

         ENDHLSL
        }

              Pass
        {
            Name "MotionVectors"
            Tags
            {
               "LightMode" = "MotionVectors"
            }
            Cull Back
            ZWrite On
            Stencil
               {
                  WriteMask [_StencilWriteMaskMV]
                  Ref [_StencilRefMV]
                  CompFront Always
                  PassFront Replace
                  CompBack Always
                  PassBack Replace
               }

                Cull [_CullMode]
            HLSLPROGRAM
            #pragma target 4.5
            #pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
            #pragma multi_compile_instancing
            #pragma multi_compile _ DOTS_INSTANCING_ON
            #pragma instancing_options renderinglayer
            #pragma multi_compile _ WRITE_MSAA_DEPTH
            #pragma multi_compile _ WRITE_NORMAL_BUFFER
            #pragma multi_compile _ WRITE_DECAL_BUFFER
            #define SHADERPASS SHADERPASS_MOTION_VECTORS
            #define RAYTRACING_SHADER_GRAPH_DEFAULT
            #define VARYINGS_NEED_PASS
            #define _PASSMOTIONVECTOR 1
    #pragma shader_feature_local _ALPHATEST_ON

    #pragma shader_feature_local_fragment _NORMALMAP_TANGENT_SPACE
    #pragma shader_feature_local _NORMALMAP
    #pragma shader_feature_local_fragment _MASKMAP
    #pragma shader_feature_local_fragment _EMISSIVE_COLOR_MAP
    #pragma shader_feature_local_fragment _ANISOTROPYMAP
    #pragma shader_feature_local_fragment _DETAIL_MAP
    #pragma shader_feature_local_fragment _SUBSURFACE_MASK_MAP
    #pragma shader_feature_local_fragment _THICKNESSMAP
    #pragma shader_feature_local_fragment _IRIDESCENCE_THICKNESSMAP
    #pragma shader_feature_local_fragment _SPECULARCOLORMAP
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_TRANSMISSION
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_ANISOTROPY
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_CLEAR_COAT
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_IRIDESCENCE
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_SPECULAR_COLOR
    #pragma shader_feature_local_fragment _ENABLESPECULAROCCLUSION
    #pragma shader_feature_local_fragment _ _SPECULAR_OCCLUSION_NONE _SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP

    #ifdef _ENABLESPECULAROCCLUSION
        #define _SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP
    #endif
        #pragma shader_feature_local_fragment _OBSTRUCTION_CURVE
        #pragma shader_feature_local_fragment _DISSOLVEMASK
        #pragma shader_feature_local_fragment _ZONING
        #pragma shader_feature_local_fragment _REPLACEMENT
        #pragma shader_feature_local_fragment _PLAYERINDEPENDENT
   #define _HDRP 1
#define _USINGTEXCOORD1 1
#define _USINGTEXCOORD2 1
#define NEED_FACING 1

               #pragma vertex Vert
   #pragma fragment Frag
      #define UNITY_DECLARE_TEX2D(name) TEXTURE2D(name); SAMPLER(sampler##name);
      #define UNITY_DECLARE_TEX2D_NOSAMPLER(name) TEXTURE2D(name);
      #define UNITY_DECLARE_TEX2DARRAY(name) TEXTURE2D_ARRAY(name); SAMPLER(sampler##name);
      #define UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(tex) TEXTURE2D_ARRAY(tex);

      #define UNITY_SAMPLE_TEX2DARRAY(tex,coord)            SAMPLE_TEXTURE2D_ARRAY(tex, sampler##tex, coord.xy, coord.z)
      #define UNITY_SAMPLE_TEX2DARRAY_LOD(tex,coord,lod)    SAMPLE_TEXTURE2D_ARRAY_LOD(tex, sampler##tex, coord.xy, coord.z, lod)
      #define UNITY_SAMPLE_TEX2D(tex, coord)                SAMPLE_TEXTURE2D(tex, sampler##tex, coord)
      #define UNITY_SAMPLE_TEX2D_SAMPLER(tex, samp, coord)  SAMPLE_TEXTURE2D(tex, sampler##samp, coord)

      #define UNITY_SAMPLE_TEX2D_LOD(tex,coord, lod)   SAMPLE_TEXTURE2D_LOD(tex, sampler_##tex, coord, lod)
      #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord, lod) SAMPLE_TEXTURE2D_LOD (tex, sampler##samplertex,coord, lod)

      #if defined(UNITY_COMPILER_HLSL)
         #define UNITY_INITIALIZE_OUTPUT(type,name) name = (type)0;
      #else
         #define UNITY_INITIALIZE_OUTPUT(type,name)
      #endif

      #define sampler2D_float sampler2D
      #define sampler2D_half sampler2D

      #undef WorldNormalVector
      #define WorldNormalVector(data, normal) mul(normal, data.TBNMatrix)

      #define UnityObjectToWorldNormal(normal) mul(GetObjectToWorldMatrix(), normal)
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
#if UNITY_VERSION >= UNITY_2021_3_31
       #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl" 
#else
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" 
#endif    
            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT 
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
            #define RAYTRACING_SHADER_GRAPH_LOW
            #endif
            #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
               #define OUTPUT_SPLIT_LIGHTING
            #endif

            #define HAVE_RECURSIVE_RENDERING

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
               #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                  #define WRITE_NORMAL_BUFFER
               #endif
            #endif

            #ifndef DEBUG_DISPLAY
               #if !defined(_SURFACE_TYPE_TRANSPARENT) && defined(_ALPHATEST)
                  #if SHADERPASS == SHADERPASS_FORWARD
                  #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                  #elif SHADERPASS == SHADERPASS_GBUFFER
                  #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                  #endif
               #endif
            #endif
            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
               #define _DEFERRED_CAPABLE_MATERIAL
            #endif
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
               #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
            CBUFFER_START(UnityPerMaterial)
               float _UseShadowThreshold;
               float _BlendMode;
               float _EnableBlendModePreserveSpecularLighting;
               float _RayTracing;
               float _RefractionModel;
    float4 _BaseColorMap_ST;
    float4 _DetailMap_ST;
    float4 _EmissiveColorMap_ST;

    float _UVBase;
    half4 _Color;
    half4 _BaseColor; 
    half _Cutoff; 
    half _Mode;
    float _CullMode;
    float _CullModeForward;
    half _Metallic;
    half3 _EmissionColor;
    half _UVSec;

    float3 _EmissiveColor;
    float _AlbedoAffectEmissive;
    float _EmissiveExposureWeight;
    float _MetallicRemapMin;
    float _MetallicRemapMax;
    float _Smoothness;
    float _SmoothnessRemapMin;
    float _SmoothnessRemapMax;
    float _AlphaRemapMin;
    float _AlphaRemapMax;
    float _AORemapMin;
    float _AORemapMax;
    float _NormalScale;
    float _DetailAlbedoScale;
    float _DetailNormalScale;
    float _DetailSmoothnessScale;
    float _Anisotropy;
    float _DiffusionProfileHash;
    float _SubsurfaceMask;
    float _Thickness;
    float4 _ThicknessRemap;
    float _IridescenceThickness;
    float4 _IridescenceThicknessRemap;
    float _IridescenceMask;
    float _CoatMask;
    float4 _SpecularColor;
    float _EnergyConservingSpecularColor;
    int _MaterialID;

    float _LinkDetailsWithBase;
    float4 _UVMappingMask;
    float4 _UVDetailsMappingMask;

    float4 _UVMappingMaskEmissive;

    float _AlphaCutoff;
    float _SyncCullMode;

    float _IsReplacementShader;
    float _TriggerMode;
    float _RaycastMode;
    float _IsExempt;
    float _isReferenceMaterial;
    float _InteractionMode;

    float _tDirection = 0;
    float _numOfPlayersInside = 0;
    float _tValue = 0;
    float _id = 0;
    half _TextureVisibility;
    half _AngleStrength;
    float _Obstruction;
    float _UVs;
    float4 _ObstructionCurve_TexelSize;      
    float _DissolveMaskEnabled;
    float4 _DissolveMask_TexelSize;
    float4 _DissolveTex_TexelSize;
    half4 _DissolveColor;
    float _DissolveColorSaturation;
    float _DissolveEmission;
    float _DissolveEmissionBooster;
    float _hasClippedShadows;
    float _ConeStrength;
    float _ConeObstructionDestroyRadius;
    float _CylinderStrength;
    float _CylinderObstructionDestroyRadius;
    float _CircleStrength;
    float _CircleObstructionDestroyRadius;
    float _CurveStrength;
    float _CurveObstructionDestroyRadius;
    float _IntrinsicDissolveStrength;
    float _DissolveFallOff;
    float _AffectedAreaPlayerBasedObstruction;
    float _PreviewMode;
    float _PreviewIndicatorLineThickness;
    float _AnimationEnabled;
    float _AnimationSpeed;
    float _DefaultEffectRadius;
    float _EnableDefaultEffectRadius;
    float _TransitionDuration;
    float _TexturedEmissionEdge;
    float _TexturedEmissionEdgeStrength;
    float _IsometricExclusion;
    float _IsometricExclusionDistance;
    float _IsometricExclusionGradientLength;
    float _Floor;
    float _FloorMode;
    float _FloorY;
    float _FloorYTextureGradientLength;
    float _PlayerPosYOffset;
    float _AffectedAreaFloor;
    float _Ceiling;
    float _CeilingMode;
    float _CeilingBlendMode;
    float _CeilingY;
    float _CeilingPlayerYOffset;
    float _CeilingYGradientLength;
    float _Zoning;
    float _ZoningMode;
    float _ZoningEdgeGradientLength;
    float _IsZoningRevealable;
    float _SyncZonesWithFloorY;
    float _SyncZonesFloorYOffset;

    half _UseCustomTime;

    half _CrossSectionEnabled;
    half4 _CrossSectionColor;
    half _CrossSectionTextureEnabled;
    float _CrossSectionTextureScale;
    half _CrossSectionUVScaledByDistance;
    half _DissolveMethod;
    half _DissolveTexSpace;
            CBUFFER_END
               #ifdef SCENEPICKINGPASS
               float4 _SelectionID;
               #endif
               #ifdef SCENESELECTIONPASS
               int _ObjectId;
               int _PassValue;
               #endif
            struct VertexToPixel
            {
               float4 pos : SV_POSITION;
               float3 worldPos : TEXCOORD0;
               float3 worldNormal : TEXCOORD1;
               float4 worldTangent : TEXCOORD2;
               float4 texcoord0 : TEXCOORD3;
               float4 texcoord1 : TEXCOORD4;
               float4 texcoord2 : TEXCOORD5;
                float4 texcoord3 : TEXCOORD6;
                float4 screenPos : TEXCOORD7;
               #if UNITY_ANY_INSTANCING_ENABLED
                  UNITY_VERTEX_INPUT_INSTANCE_ID
               #endif 

               #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
                  float4 previousPositionCS : TEXCOORD16; 
                  float4 motionVectorCS : TEXCOORD17;
               #endif

               UNITY_VERTEX_OUTPUT_STEREO
            }; 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
            struct Surface
            {
               half3 Albedo;
               half Height;
               half3 Normal;
               half Smoothness;
               half3 Emission;
               half Metallic;
               half3 Specular;
               half Occlusion;
               half SpecularPower; 
               half Alpha;
               float outputDepth; 
               half SpecularOcclusion;
               half SubsurfaceMask;
               half Thickness;
               half CoatMask;
               half CoatSmoothness;
               half Anisotropy;
               half IridescenceMask;
               half IridescenceThickness;
               int DiffusionProfileHash;
               float SpecularAAThreshold;
               float SpecularAAScreenSpaceVariance;
               float3 DiffuseGI;
               float3 BackDiffuseGI;
               float3 SpecularGI;
               float ior;
               float3 transmittanceColor;
               float atDistance;
               float transmittanceMask;
               float4 ShadowMask;
               float NormalAlpha;
               float MAOSAlpha;
            };
            struct Blackboard
            {
                float blackboardDummyData;
            };
            struct ShaderData
            {
               float4 clipPos; 
               float3 localSpacePosition;
               float3 localSpaceNormal;
               float3 localSpaceTangent;
               float3 worldSpacePosition;
               float3 worldSpaceNormal;
               float3 worldSpaceTangent;
               float tangentSign;

               float3 worldSpaceViewDir;
               float3 tangentSpaceViewDir;

               float4 texcoord0;
               float4 texcoord1;
               float4 texcoord2;
               float4 texcoord3;

               float2 screenUV;
               float4 screenPos;

               float4 vertexColor;
               bool isFrontFace;

               float4 extraV2F0;
               float4 extraV2F1;
               float4 extraV2F2;
               float4 extraV2F3;
               float4 extraV2F4;
               float4 extraV2F5;
               float4 extraV2F6;
               float4 extraV2F7;

               float3x3 TBNMatrix;
               Blackboard blackboard;
            };

            struct VertexData
            {
               #if SHADER_TARGET > 30
               #endif
               float4 vertex : POSITION;
               float3 normal : NORMAL;
               float4 tangent : TANGENT;
               float4 texcoord0 : TEXCOORD0;
               #if _URP && (_USINGTEXCOORD1 || _PASSMETA || _PASSFORWARD || _PASSGBUFFER)
                  float4 texcoord1 : TEXCOORD1;
               #endif

               #if _URP && (_USINGTEXCOORD2 || _PASSMETA || ((_PASSFORWARD || _PASSGBUFFER) && defined(DYNAMICLIGHTMAP_ON)))
                  float4 texcoord2 : TEXCOORD2;
               #endif

               #if _STANDARD && (_USINGTEXCOORD1 || (_PASSMETA || ((_PASSFORWARD || _PASSGBUFFER || _PASSFORWARDADD) && LIGHTMAP_ON)))
                  float4 texcoord1 : TEXCOORD1;
               #endif
               #if _STANDARD && (_USINGTEXCOORD2 || (_PASSMETA || ((_PASSFORWARD || _PASSGBUFFER) && DYNAMICLIGHTMAP_ON)))
                  float4 texcoord2 : TEXCOORD2;
               #endif
               #if _HDRP
                  float4 texcoord1 : TEXCOORD1;
                  float4 texcoord2 : TEXCOORD2;
               #endif
                float4 texcoord3 : TEXCOORD3;
               #if _PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR))
                  float3 previousPositionOS : TEXCOORD4; 
                  #if defined (_ADD_PRECOMPUTED_VELOCITY)
                     float3 precomputedVelocity    : TEXCOORD5; 
                  #endif
               #endif

               UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct TessVertex 
            {
               float4 vertex : INTERNALTESSPOS;
               float3 normal : NORMAL;
               float4 tangent : TANGENT;
               float4 texcoord0 : TEXCOORD0;
               float4 texcoord1 : TEXCOORD1;
               float4 texcoord2 : TEXCOORD2;
                float4 texcoord3 : TEXCOORD3;
               #if _PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR))
                  float3 previousPositionOS : TEXCOORD13; 
                  #if defined (_ADD_PRECOMPUTED_VELOCITY)
                     float3 precomputedVelocity : TEXCOORD14;
                  #endif
               #endif

               UNITY_VERTEX_INPUT_INSTANCE_ID
               UNITY_VERTEX_OUTPUT_STEREO
            };

            struct ExtraV2F
            {
               float4 extraV2F0;
               float4 extraV2F1;
               float4 extraV2F2;
               float4 extraV2F3;
               float4 extraV2F4;
               float4 extraV2F5;
               float4 extraV2F6;
               float4 extraV2F7;
               Blackboard blackboard;
               float4 time;
            };
            float3 WorldToTangentSpace(ShaderData d, float3 normal)
            {
               return mul(d.TBNMatrix, normal);
            }

            float3 TangentToWorldSpace(ShaderData d, float3 normal)
            {
               return mul(normal, d.TBNMatrix);
            }
            #if _STANDARD
               float3 TransformWorldToObject(float3 p) { return mul(unity_WorldToObject, float4(p, 1)); };
               float3 TransformObjectToWorld(float3 p) { return mul(unity_ObjectToWorld, float4(p, 1)); };
               float4 TransformWorldToObject(float4 p) { return mul(unity_WorldToObject, p); };
               float4 TransformObjectToWorld(float4 p) { return mul(unity_ObjectToWorld, p); };
               float4x4 GetWorldToObjectMatrix() { return unity_WorldToObject; }
               float4x4 GetObjectToWorldMatrix() { return unity_ObjectToWorld; }
               #if (defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (SHADER_TARGET_SURFACE_ANALYSIS && !SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))
                 #define UNITY_SAMPLE_TEX2D_LOD(tex,coord, lod) tex.SampleLevel (sampler##tex,coord, lod)
                 #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord, lod) tex.SampleLevel (sampler##samplertex,coord, lod)
              #else
                 #define UNITY_SAMPLE_TEX2D_LOD(tex,coord,lod) tex2D (tex,coord,0,lod)
                 #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord,lod) tex2D (tex,coord,0,lod)
              #endif

               #undef GetWorldToObjectMatrix()

               #define GetWorldToObjectMatrix()   unity_WorldToObject
            #endif

            float3 GetCameraWorldPosition()
            {
               #if _HDRP
                  return GetCameraRelativePositionWS(_WorldSpaceCameraPos);
               #else
                  return _WorldSpaceCameraPos;
               #endif
            }

            #if _GRABPASSUSED
               #if _STANDARD
                  TEXTURE2D(%GRABTEXTURE%);
                  SAMPLER(sampler_%GRABTEXTURE%);
               #endif

               half3 GetSceneColor(float2 uv)
               {
                  #if _STANDARD
                     return SAMPLE_TEXTURE2D(%GRABTEXTURE%, sampler_%GRABTEXTURE%, uv).rgb;
                  #else
                     return SHADERGRAPH_SAMPLE_SCENE_COLOR(uv);
                  #endif
               }
            #endif
            #if _STANDARD
               UNITY_DECLARE_DEPTH_TEXTURE(_CameraDepthTexture);
               float GetSceneDepth(float2 uv) { return SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, uv); }
               float GetLinear01Depth(float2 uv) { return Linear01Depth(GetSceneDepth(uv)); }
               float GetLinearEyeDepth(float2 uv) { return LinearEyeDepth(GetSceneDepth(uv)); } 
            #else
               float GetSceneDepth(float2 uv) { return SHADERGRAPH_SAMPLE_SCENE_DEPTH(uv); }
               float GetLinear01Depth(float2 uv) { return Linear01Depth(GetSceneDepth(uv), _ZBufferParams); }
               float GetLinearEyeDepth(float2 uv) { return LinearEyeDepth(GetSceneDepth(uv), _ZBufferParams); } 
            #endif

            float3 GetWorldPositionFromDepthBuffer(float2 uv, float3 worldSpaceViewDir)
            {
               float eye = GetLinearEyeDepth(uv);
               float3 camView = mul((float3x3)GetObjectToWorldMatrix(), transpose(mul(GetWorldToObjectMatrix(), UNITY_MATRIX_I_V)) [2].xyz);

               float dt = dot(worldSpaceViewDir, camView);
               float3 div = worldSpaceViewDir/dt;
               float3 wpos = (eye * div) + GetCameraWorldPosition();
               return wpos;
            }

            #if _HDRP
            float3 ObjectToWorldSpacePosition(float3 pos)
            {
               return GetAbsolutePositionWS(TransformObjectToWorld(pos));
            }
            #else
            float3 ObjectToWorldSpacePosition(float3 pos)
            {
               return TransformObjectToWorld(pos);
            }
            #endif

            #if _STANDARD
               UNITY_DECLARE_SCREENSPACE_TEXTURE(_CameraDepthNormalsTexture);
               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  float4 depthNorms = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_CameraDepthNormalsTexture, uv);
                  float3 norms = DecodeViewNormalStereo(depthNorms);
                  norms = mul((float3x3)GetWorldToViewMatrix(), norms) * 0.5 + 0.5;
                  return norms;
               }
            #elif _HDRP && !_DECALSHADER
               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  NormalData nd;
                  DecodeFromNormalBuffer(_ScreenSize.xy * uv, nd);
                  return nd.normalWS;
               }
            #elif _URP
               #if (SHADER_LIBRARY_VERSION_MAJOR >= 10)
                  #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareNormalsTexture.hlsl"
               #endif

               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  #if (SHADER_LIBRARY_VERSION_MAJOR >= 10)
                     return SampleSceneNormals(uv);
                  #else
                     float3 wpos = GetWorldPositionFromDepthBuffer(uv, worldSpaceViewDir);
                     return normalize(-cross(ddx(wpos), ddy(wpos))) * 0.5 + 0.5;
                  #endif

                }
             #endif

             #if _HDRP

               half3 UnpackNormalmapRGorAG(half4 packednormal)
               {
                  packednormal.x *= packednormal.w;

                  half3 normal;
                  normal.xy = packednormal.xy * 2 - 1;
                  normal.z = sqrt(1 - saturate(dot(normal.xy, normal.xy)));
                  return normal;
               }
               half3 UnpackNormal(half4 packednormal)
               {
                  #if defined(UNITY_NO_DXT5nm)
                     return packednormal.xyz * 2 - 1;
                  #else
                     return UnpackNormalmapRGorAG(packednormal);
                  #endif
               }
            #endif
            #if _HDRP || _URP

               half3 UnpackScaleNormal(half4 packednormal, half scale)
               {
                 #ifndef UNITY_NO_DXT5nm
                   packednormal.x *= packednormal.w;
                 #endif
                   half3 normal;
                   normal.xy = (packednormal.xy * 2 - 1) * scale;
                   normal.z = sqrt(1 - saturate(dot(normal.xy, normal.xy)));
                   return normal;
               }	

             #endif
            void GetSun(out float3 lightDir, out float3 color)
            {
               lightDir = float3(0.5, 0.5, 0);
               color = 1;
               #if _HDRP
                  if (_DirectionalLightCount > 0)
                  {
                     DirectionalLightData light = _DirectionalLightDatas[0];
                     lightDir = -light.forward.xyz;
                     color = light.color;
                  }
               #elif _STANDARD
			         lightDir = normalize(_WorldSpaceLightPos0.xyz);
                  color = _LightColor0.rgb;
               #elif _URP
	               Light light = GetMainLight();
	               lightDir = light.direction;
	               color = light.color;
               #endif
            }
    sampler2D _EmissiveColorMap;
    sampler2D _BaseColorMap;
    sampler2D _MaskMap;
    sampler2D _NormalMap;
    sampler2D _NormalMapOS;
    sampler2D _DetailMap;
    sampler2D _TangentMap;
    sampler2D _TangentMapOS;
    sampler2D _AnisotropyMap;
    sampler2D _SubsurfaceMaskMap;
    sampler2D _TransmissionMaskMap;
    sampler2D _ThicknessMap;
    sampler2D _IridescenceThicknessMap;
    sampler2D _IridescenceMaskMap;
    sampler2D _SpecularColorMap;

    sampler2D _CoatMaskMap;

    float3 DecodeNormal (float4 sample, float scale) {
        #if defined(UNITY_NO_DXT5nm)
            return UnpackNormalRGB(sample, scale);
        #else
            return UnpackNormalmapRGorAG(sample, scale);
        #endif
    }

	void Ext_SurfaceFunction0 (inout Surface o, ShaderData d)
	{
        float2 uvBase = (_UVMappingMask.x * d.texcoord0 +
                        _UVMappingMask.y * d.texcoord1 +
                        _UVMappingMask.z * d.texcoord2 +
                        _UVMappingMask.w * d.texcoord3).xy;

        float2 uvDetails =  (_UVDetailsMappingMask.x * d.texcoord0 +
                            _UVDetailsMappingMask.y * d.texcoord1 +
                            _UVDetailsMappingMask.z * d.texcoord2 +
                            _UVDetailsMappingMask.w * d.texcoord3).xy;
        float4 texcoords;
        texcoords.xy = uvBase * _BaseColorMap_ST.xy + _BaseColorMap_ST.zw; 

        texcoords.zw = uvDetails * _DetailMap_ST.xy + _DetailMap_ST.zw;

        if (_LinkDetailsWithBase > 0.0)
        {
            texcoords.zw = texcoords.zw  * _BaseColorMap_ST.xy + _BaseColorMap_ST.zw;

        }

            float3 detailNormalTS = float3(0.0, 0.0, 0.0);
            float detailMask = 0.0;
            #ifdef _DETAIL_MAP
                detailMask = 1.0;
                #ifdef _MASKMAP
                    detailMask = tex2D(_MaskMap, texcoords.xy).b;
                #endif
                float2 detailAlbedoAndSmoothness = tex2D(_DetailMap, texcoords.zw).rb;
                float detailAlbedo = detailAlbedoAndSmoothness.r * 2.0 - 1.0;
                float detailSmoothness = detailAlbedoAndSmoothness.g * 2.0 - 1.0;
                real4 packedNormal = tex2D(_DetailMap, texcoords.zw).rgba;
                detailNormalTS = UnpackNormalAG(packedNormal, _DetailNormalScale);
            #endif
            float4 color = tex2D(_BaseColorMap, texcoords.xy).rgba  * _Color.rgba;
            o.Albedo = color.rgb; 
            float alpha = color.a;
            alpha = lerp(_AlphaRemapMin, _AlphaRemapMax, alpha);
            o.Alpha = alpha;
            #ifdef _DETAIL_MAP
                float albedoDetailSpeed = saturate(abs(detailAlbedo) * _DetailAlbedoScale);
                float3 baseColorOverlay = lerp(sqrt(o.Albedo), (detailAlbedo < 0.0) ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0), albedoDetailSpeed * albedoDetailSpeed);
                baseColorOverlay *= baseColorOverlay;
                o.Albedo = lerp(o.Albedo, saturate(baseColorOverlay), detailMask);
            #endif

            #ifdef _NORMALMAP
                float3 normalTS;
                #ifdef _NORMALMAP_TANGENT_SPACE
                    normalTS = DecodeNormal(tex2D(_NormalMap, texcoords.xy), _NormalScale);
                #else
                    #ifdef SURFACE_GRADIENT
                        float3 normalOS = tex2D(_NormalMapOS, texcoords.xy).xyz * 2.0 - 1.0;
                        normalTS = SurfaceGradientFromPerturbedNormal(d.worldSpaceNormal, TransformObjectToWorldNormal(normalOS));
                    #else
                        float3 normalOS = UnpackNormalRGB(tex2D(_NormalMapOS, texcoords.xy), 1.0);
                        float3 bitangent = d.tangentSign * cross(d.worldSpaceNormal.xyz, d.worldSpaceTangent.xyz);
                        half3x3 tangentToWorld = half3x3(d.worldSpaceTangent.xyz, bitangent.xyz, d.worldSpaceNormal.xyz);
                        normalTS = TransformObjectToTangent(normalOS, tangentToWorld);
                    #endif
                #endif

                #ifdef _DETAIL_MAP
                    #ifdef SURFACE_GRADIENT
                    normalTS += detailNormalTS * detailMask;
                    #else
                    normalTS = lerp(normalTS, BlendNormalRNM(normalTS, normalize(detailNormalTS)), detailMask); 
                    #endif
                #endif
                o.Normal = normalTS;

            #endif

            #if defined(_MASKMAP)
                o.Smoothness = tex2D(_MaskMap, texcoords.xy).a;
                o.Smoothness = lerp(_SmoothnessRemapMin, _SmoothnessRemapMax, o.Smoothness);
            #else
                o.Smoothness = _Smoothness;
            #endif
            #ifdef _DETAIL_MAP
                float smoothnessDetailSpeed = saturate(abs(detailSmoothness) * _DetailSmoothnessScale);
                float smoothnessOverlay = lerp(o.Smoothness, (detailSmoothness < 0.0) ? 0.0 : 1.0, smoothnessDetailSpeed);
                o.Smoothness = lerp(o.Smoothness, saturate(smoothnessOverlay), detailMask);
            #endif
            #ifdef _MASKMAP
                o.Metallic = tex2D(_MaskMap, texcoords.xy).r;
                o.Metallic = lerp(_MetallicRemapMin, _MetallicRemapMax, o.Metallic);
                o.Occlusion = tex2D(_MaskMap, texcoords.xy).g;
                o.Occlusion = lerp(_AORemapMin, _AORemapMax, o.Occlusion);
            #else
                o.Metallic = _Metallic;
                o.Occlusion = 1.0;
            #endif

            #if defined(_SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP)
            #elif  defined(_MASKMAP) && !defined(_SPECULAR_OCCLUSION_NONE)
                float3 V = normalize(d.worldSpaceViewDir);
                o.SpecularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(d.worldSpaceNormal, V)), o.Occlusion, PerceptualSmoothnessToRoughness(o.Smoothness));
            #endif

            o.DiffusionProfileHash = asuint(_DiffusionProfileHash);
            o.SubsurfaceMask = _SubsurfaceMask;
            #ifdef _SUBSURFACE_MASK_MAP
                o.SubsurfaceMask *= tex2D(_SubsurfaceMaskMap, texcoords.xy).r;
            #endif
            #ifdef _THICKNESSMAP
                o.Thickness = tex2D(_ThicknessMap, texcoords.xy).r;
                o.Thickness = _ThicknessRemap.x + _ThicknessRemap.y * surfaceData.thickness;
            #else
                o.Thickness = _Thickness;
            #endif
            #ifdef _ANISOTROPYMAP
                o.Anisotropy = tex2D(_AnisotropyMap, texcoords.xy).r;
            #else
                o.Anisotropy = 1.0;
            #endif
                o.Anisotropy *= _Anisotropy;
                o.Specular = _SpecularColor.rgb;
            #ifdef _SPECULARCOLORMAP
                o.Specular *= tex2D(_SpecularColorMap, texcoords.xy).rgb;
            #endif
            #ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                o.Albedo *= _EnergyConservingSpecularColor > 0.0 ? (1.0 - Max3(o.Specular.r, o.Specular.g, o.Specular.b)) : 1.0;
            #endif
            #ifdef _MATERIAL_FEATURE_CLEAR_COAT
                o.CoatMask = _CoatMask;
                o.CoatMask *= tex2D(_CoatMaskMap, texcoords.xy).r;
            #else
                o.CoatMask = 0.0;
            #endif
            #ifdef _MATERIAL_FEATURE_IRIDESCENCE
                #ifdef _IRIDESCENCE_THICKNESSMAP
                o.IridescenceThickness = tex2D(_IridescenceThicknessMap, texcoords.xy).r;
                o.IridescenceThickness = _IridescenceThicknessRemap.x + _IridescenceThicknessRemap.y * o.IridescenceThickness;
                #else
                o.IridescenceThickness = _IridescenceThickness;
                #endif
                o.IridescenceMask = _IridescenceMask;
                o.IridescenceMask *= tex2D(_IridescenceMaskMap, texcoords.xy).r;
            #else
                o.IridescenceThickness = 0.0;
                o.IridescenceMask = 0.0;
            #endif
            float3 emissiveColor = _EmissiveColor * lerp(float3(1.0, 1.0, 1.0), o.Albedo.rgb, _AlbedoAffectEmissive);
            #ifdef _EMISSIVE_COLOR_MAP                
                float2 uvEmission = _UVMappingMaskEmissive.x * d.texcoord0 +
                                    _UVMappingMaskEmissive.y * d.texcoord1 +
                                    _UVMappingMaskEmissive.z * d.texcoord2 +
                                    _UVMappingMaskEmissive.w * d.texcoord3;

                uvEmission = uvEmission * _EmissiveColorMap_ST.xy + _EmissiveColorMap_ST.zw;                     

                emissiveColor *= tex2D(_EmissiveColorMap, uvEmission).rgb;
            #endif
            o.Emission += emissiveColor;
            float currentExposureMultiplier = 0;
            #if SHADEROPTIONS_PRE_EXPOSITION
                currentExposureMultiplier =  LOAD_TEXTURE2D(_ExposureTexture, int2(0, 0)).x * _ProbeExposureScale;
            #else
                currentExposureMultiplier =  _ProbeExposureScale;
            #endif
            float InverseCurrentExposureMultiplier = 0;
            float exposure = currentExposureMultiplier;
            InverseCurrentExposureMultiplier =  rcp(exposure + (exposure == 0.0)); 
            float3 emissiveRcpExposure = o.Emission * InverseCurrentExposureMultiplier;
            o.Emission = lerp(emissiveRcpExposure, o.Emission, _EmissiveExposureWeight);
            #if defined(_ALPHATEST_ON)
                float alphaTex = tex2D(_BaseColorMap, texcoords.xy).a;
                alphaTex = lerp(_AlphaRemapMin, _AlphaRemapMax, alphaTex);
                float alphaValue = alphaTex * _BaseColor.a;
                float alphaCutoff = _AlphaCutoff;
                clip(alpha - alphaCutoff);
            #endif

	}
    float _ArrayLength = 0;
    #if (defined(SHADER_API_GLES) || defined(SHADER_API_GLES3)) 
        float4 _PlayersPosVectorArray[20];
        float _PlayersDataFloatArray[150];     
    #else
        float4 _PlayersPosVectorArray[100];
        float _PlayersDataFloatArray[500];  
    #endif
    #if _ZONING
        #if (defined(SHADER_API_GLES) || defined(SHADER_API_GLES3)) 
            float _ZDFA[500];
        #else
            float _ZDFA[1000];
        #endif
        float _ZonesDataCount;
    #endif

    float _STSCustomTime = 0;
    #if _REPLACEMENT        
        half4 _DissolveColorGlobal;
        float _DissolveColorSaturationGlobal;
        float _DissolveEmissionGlobal;
        float _DissolveEmissionBoosterGlobal;
        float _TextureVisibilityGlobal;
        float _ObstructionGlobal;
        float _AngleStrengthGlobal;
        float _ConeStrengthGlobal;
        float _ConeObstructionDestroyRadiusGlobal;
        float _CylinderStrengthGlobal;
        float _CylinderObstructionDestroyRadiusGlobal;
        float _CircleStrengthGlobal;
        float _CircleObstructionDestroyRadiusGlobal;
        float _CurveStrengthGlobal;
        float _CurveObstructionDestroyRadiusGlobal;
        float _DissolveFallOffGlobal;
        float _AffectedAreaPlayerBasedObstructionGlobal;
        float _IntrinsicDissolveStrengthGlobal;
        float _PreviewModeGlobal;
        float _UVsGlobal;
        float _hasClippedShadowsGlobal;
        float _FloorGlobal;
        float _FloorModeGlobal;
        float _FloorYGlobal;
        float _PlayerPosYOffsetGlobal;
        float _FloorYTextureGradientLengthGlobal;
        float _AffectedAreaFloorGlobal;
        float _AnimationEnabledGlobal;
        float _AnimationSpeedGlobal;
        float _DefaultEffectRadiusGlobal;
        float _EnableDefaultEffectRadiusGlobal;
        float _TransitionDurationGlobal;        
        float _TexturedEmissionEdgeGlobal;
        float _TexturedEmissionEdgeStrengthGlobal;
        float _IsometricExclusionGlobal;
        float _IsometricExclusionDistanceGlobal;
        float _IsometricExclusionGradientLengthGlobal;
        float _CeilingGlobal;
        float _CeilingModeGlobal;
        float _CeilingBlendModeGlobal;
        float _CeilingYGlobal;
        float _CeilingPlayerYOffsetGlobal;
        float _CeilingYGradientLengthGlobal;
        float _ZoningGlobal;
        float _ZoningModeGlobal;
        float _ZoningEdgeGradientLengthGlobal;
        float _IsZoningRevealableGlobal;
        float _SyncZonesWithFloorYGlobal;
        float _SyncZonesFloorYOffsetGlobal;
        float4 _ObstructionCurveGlobal_TexelSize;
        float4 _DissolveMaskGlobal_TexelSize;
        float _DissolveMaskEnabledGlobal;
        float _PreviewIndicatorLineThicknessGlobal;
        half _UseCustomTimeGlobal;

        half _CrossSectionEnabledGlobal;
        half4 _CrossSectionColorGlobal;
        half _CrossSectionTextureEnabledGlobal;
        float _CrossSectionTextureScaleGlobal;
        half _CrossSectionUVScaledByDistanceGlobal;

        half _DissolveMethodGlobal;
        half _DissolveTexSpaceGlobal;

        float4 _DissolveTexGlobal_TexelSize;
    #endif
    #if _REPLACEMENT
        sampler2D _DissolveTexGlobal;
    #else
        sampler2D _DissolveTex;
    #endif
    #if _REPLACEMENT
        sampler2D _DissolveMaskGlobal;
    #else
        sampler2D _DissolveMask;
    #endif
    #if _REPLACEMENT
        sampler2D _ObstructionCurveGlobal;
    #else
        sampler2D _ObstructionCurve;
    #endif

    #if _REPLACEMENT
        sampler2D _CrossSectionTextureGlobal;
    #else
        sampler2D _CrossSectionTexture;
    #endif
#ifdef USE_UNITY_TEXTURE_2D_TYPE
#undef USE_UNITY_TEXTURE_2D_TYPE
#endif

#include "Packages/com.shadercrew.seethroughshader.core/Scripts/Shaders/xxSharedSTSDependencies/SeeThroughShaderFunction.hlsl"
	void Ext_SurfaceFunction1 (inout Surface o, ShaderData d)
	{
        half3 albedo;
        half3 emission;
        float alphaForClipping;
#ifdef USE_UNITY_TEXTURE_2D_TYPE
#undef USE_UNITY_TEXTURE_2D_TYPE
#endif
#if _REPLACEMENT
    DoSeeThroughShading( o.Albedo, o.Normal, d.worldSpacePosition, d.worldSpaceNormal, d.screenPos,
                        _numOfPlayersInside, _tDirection, _tValue, _id,
                        _TriggerMode, _RaycastMode,
                        _IsExempt,

                        _DissolveMethodGlobal, _DissolveTexSpaceGlobal,

                        _DissolveColorGlobal, _DissolveColorSaturationGlobal, _UVsGlobal,
                        _DissolveEmissionGlobal, _DissolveEmissionBoosterGlobal, _TexturedEmissionEdgeGlobal, _TexturedEmissionEdgeStrengthGlobal,
                        _hasClippedShadowsGlobal,

                        _ObstructionGlobal,
                        _AngleStrengthGlobal,
                        _ConeStrengthGlobal, _ConeObstructionDestroyRadiusGlobal,
                        _CylinderStrengthGlobal, _CylinderObstructionDestroyRadiusGlobal,
                        _CircleStrengthGlobal, _CircleObstructionDestroyRadiusGlobal,
                        _CurveStrengthGlobal, _CurveObstructionDestroyRadiusGlobal,
                        _DissolveFallOffGlobal,
                        _DissolveMaskEnabledGlobal,
                        _AffectedAreaPlayerBasedObstructionGlobal,
                        _IntrinsicDissolveStrengthGlobal,
                        _DefaultEffectRadiusGlobal, _EnableDefaultEffectRadiusGlobal,

                        _IsometricExclusionGlobal, _IsometricExclusionDistanceGlobal, _IsometricExclusionGradientLengthGlobal,
                        _CeilingGlobal, _CeilingModeGlobal, _CeilingBlendModeGlobal, _CeilingYGlobal, _CeilingPlayerYOffsetGlobal, _CeilingYGradientLengthGlobal,
                        _FloorGlobal, _FloorModeGlobal, _FloorYGlobal, _PlayerPosYOffsetGlobal, _FloorYTextureGradientLengthGlobal, _AffectedAreaFloorGlobal,

                        _AnimationEnabledGlobal, _AnimationSpeedGlobal,
                        _TransitionDurationGlobal,

                        _UseCustomTimeGlobal,

                        _ZoningGlobal, _ZoningModeGlobal, _IsZoningRevealableGlobal, _ZoningEdgeGradientLengthGlobal,
                        _SyncZonesWithFloorYGlobal, _SyncZonesFloorYOffsetGlobal,

                        _PreviewModeGlobal,
                        _PreviewIndicatorLineThicknessGlobal,

                        _DissolveTexGlobal,
                        _DissolveMaskGlobal,
                        _ObstructionCurveGlobal,

                        _DissolveTexGlobal_TexelSize,
                        _DissolveMaskGlobal_TexelSize,
                        _ObstructionCurveGlobal_TexelSize,

                        albedo, emission, alphaForClipping);
#else 
    DoSeeThroughShading( o.Albedo, o.Normal, d.worldSpacePosition, d.worldSpaceNormal, d.screenPos,

                        _numOfPlayersInside, _tDirection, _tValue, _id,
                        _TriggerMode, _RaycastMode,
                        _IsExempt,

                        _DissolveMethod, _DissolveTexSpace,

                        _DissolveColor, _DissolveColorSaturation, _UVs,
                        _DissolveEmission, _DissolveEmissionBooster, _TexturedEmissionEdge, _TexturedEmissionEdgeStrength,
                        _hasClippedShadows,

                        _Obstruction,
                        _AngleStrength,
                        _ConeStrength, _ConeObstructionDestroyRadius,
                        _CylinderStrength, _CylinderObstructionDestroyRadius,
                        _CircleStrength, _CircleObstructionDestroyRadius,
                        _CurveStrength, _CurveObstructionDestroyRadius,
                        _DissolveFallOff,
                        _DissolveMaskEnabled,
                        _AffectedAreaPlayerBasedObstruction,
                        _IntrinsicDissolveStrength,
                        _DefaultEffectRadius, _EnableDefaultEffectRadius,

                        _IsometricExclusion, _IsometricExclusionDistance, _IsometricExclusionGradientLength,
                        _Ceiling, _CeilingMode, _CeilingBlendMode, _CeilingY, _CeilingPlayerYOffset, _CeilingYGradientLength,
                        _Floor, _FloorMode, _FloorY, _PlayerPosYOffset, _FloorYTextureGradientLength, _AffectedAreaFloor,

                        _AnimationEnabled, _AnimationSpeed,
                        _TransitionDuration,

                        _UseCustomTime,

                        _Zoning, _ZoningMode , _IsZoningRevealable, _ZoningEdgeGradientLength,
                        _SyncZonesWithFloorY, _SyncZonesFloorYOffset,

                        _PreviewMode,
                        _PreviewIndicatorLineThickness,                            

                        _DissolveTex,
                        _DissolveMask,
                        _ObstructionCurve,

                        _DissolveTex_TexelSize,
                        _DissolveMask_TexelSize,
                        _ObstructionCurve_TexelSize,

                        albedo, emission, alphaForClipping);
#endif 
        o.Albedo = albedo;
        o.Emission += emission;   

	}
    void Ext_FinalColorForward1 (Surface o, ShaderData d, inout half4 color)
    {
        #if _REPLACEMENT   
            DoCrossSection(_CrossSectionEnabledGlobal,
                        _CrossSectionColorGlobal,
                        _CrossSectionTextureEnabledGlobal,
                        _CrossSectionTextureGlobal,
                        _CrossSectionTextureScaleGlobal,
                        _CrossSectionUVScaledByDistanceGlobal,
                        d.isFrontFace,
                        d.screenPos,
                        color);
        #else 
            DoCrossSection(_CrossSectionEnabled,
                        _CrossSectionColor,
                        _CrossSectionTextureEnabled,
                        _CrossSectionTexture,
                        _CrossSectionTextureScale,
                        _CrossSectionUVScaledByDistance,
                        d.isFrontFace,
                        d.screenPos,
                        color);
        #endif
    }
            void ChainSurfaceFunction(inout Surface l, inout ShaderData d)
            {
                  Ext_SurfaceFunction0(l, d);
                  Ext_SurfaceFunction1(l, d);
            }

#if !_DECALSHADER

            void ChainModifyVertex(inout VertexData v, inout VertexToPixel v2p, float4 time)
            {
                 ExtraV2F d;
                 ZERO_INITIALIZE(ExtraV2F, d);
                 ZERO_INITIALIZE(Blackboard, d.blackboard);
                 d.time = time;
            }

            void ChainModifyTessellatedVertex(inout VertexData v, inout VertexToPixel v2p)
            {
               ExtraV2F d;
               ZERO_INITIALIZE(ExtraV2F, d);
               ZERO_INITIALIZE(Blackboard, d.blackboard);
            }

            void ChainFinalColorForward(inout Surface l, inout ShaderData d, inout half4 color)
            {
                  Ext_FinalColorForward1(l, d, color);
            }

            void ChainFinalGBufferStandard(inout Surface s, inout ShaderData d, inout half4 GBuffer0, inout half4 GBuffer1, inout half4 GBuffer2, inout half4 outEmission, inout half4 outShadowMask)
            {
            }
#endif
#if _DECALSHADER

        ShaderData CreateShaderData(SurfaceDescriptionInputs IN)
        {
            ShaderData d = (ShaderData)0;
            d.TBNMatrix = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
            d.worldSpaceNormal = IN.WorldSpaceNormal;
            d.worldSpaceTangent = IN.WorldSpaceTangent;

            d.worldSpacePosition = IN.WorldSpacePosition;
            d.texcoord0 = IN.uv0.xyxy;
            d.screenPos = IN.ScreenPosition;

            d.worldSpaceViewDir = normalize(_WorldSpaceCameraPos - d.worldSpacePosition);

            d.tangentSpaceViewDir = mul(d.TBNMatrix, d.worldSpaceViewDir);
            #if _HDRP
            #else
            #endif
             d.screenUV = (IN.ScreenPosition.xy / max(0.01, IN.ScreenPosition.w));
            return d;
        }
#else

         ShaderData CreateShaderData(VertexToPixel i
                  #if NEED_FACING
                     , bool facing
                  #endif
         )
         {
            ShaderData d = (ShaderData)0;
            d.clipPos = i.pos;
            d.worldSpacePosition = i.worldPos;

            d.worldSpaceNormal = normalize(i.worldNormal);
            d.worldSpaceTangent.xyz = normalize(i.worldTangent.xyz);

            d.tangentSign = i.worldTangent.w * unity_WorldTransformParams.w;
            float3 bitangent = cross(d.worldSpaceTangent.xyz, d.worldSpaceNormal) * d.tangentSign;
            d.TBNMatrix = float3x3(d.worldSpaceTangent, -bitangent, d.worldSpaceNormal);
            d.worldSpaceViewDir = normalize(_WorldSpaceCameraPos - i.worldPos);

            d.tangentSpaceViewDir = mul(d.TBNMatrix, d.worldSpaceViewDir);
             d.texcoord0 = i.texcoord0;
             d.texcoord1 = i.texcoord1;
             d.texcoord2 = i.texcoord2;
             d.texcoord3 = i.texcoord3;
             d.isFrontFace = facing;
            #if _HDRP
            #else
            #endif
             d.screenPos = i.screenPos;
             d.screenUV = (i.screenPos.xy / i.screenPos.w);
            return d;
         }

#endif
#if (SHADERPASS == SHADERPASS_LIGHT_TRANSPORT)
   float unity_OneOverOutputBoost;
   float unity_MaxOutputValue;

   CBUFFER_START(UnityMetaPass)
   bool4 unity_MetaVertexControl;
   bool4 unity_MetaFragmentControl;
   CBUFFER_END

   VertexToPixel Vert(VertexData inputMesh)
   {
       VertexToPixel output;
       ZERO_INITIALIZE(VertexToPixel, output);
       UNITY_SETUP_INSTANCE_ID(inputMesh);
       UNITY_TRANSFER_INSTANCE_ID(inputMesh, output);
       UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);
       float2 uv = float2(0.0, 0.0);

       if (unity_MetaVertexControl.x)
       {
           uv = inputMesh.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
       }
       else if (unity_MetaVertexControl.y)
       {
           uv = inputMesh.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
       }
       output.pos = float4(uv * 2.0 - 1.0, inputMesh.vertex.z > 0 ? 1.0e-4 : 0.0, 1.0);

       output.worldPos = TransformObjectToWorld(inputMesh.vertex.xyz).xyz;
       output.worldNormal = TransformObjectToWorldNormal(inputMesh.normal);
       output.worldTangent = float4(1.0, 0.0, 0.0, 0.0);

       output.texcoord0 = inputMesh.texcoord0;
       output.texcoord1 = inputMesh.texcoord1;
       output.texcoord2 = inputMesh.texcoord2;
        output.texcoord3 = inputMesh.texcoord3;
       return output;
   }
#else

   #if (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
      #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariablesMatrixDefsHDCamera.hlsl"

      void MotionVectorPositionZBias(VertexToPixel input)
      {
      #if UNITY_REVERSED_Z
          input.pos.z -= unity_MotionVectorsParams.z * input.pos.w;
      #else
          input.pos.z += unity_MotionVectorsParams.z * input.pos.w;
      #endif
      }

   #endif

   VertexToPixel Vert(VertexData input)
   {
       VertexToPixel output;
       ZERO_INITIALIZE(VertexToPixel, output);

       UNITY_SETUP_INSTANCE_ID(input);
       UNITY_TRANSFER_INSTANCE_ID(input, output);
       UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

       #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
         VertexData previousMesh = input;
       #endif

       ChainModifyVertex(input, output, _Time);
       float3 positionRWS = TransformObjectToWorld(input.vertex.xyz);
       float3 normalWS = TransformObjectToWorldNormal(input.normal);
       float4 tangentWS = float4(TransformObjectToWorldDir(input.tangent.xyz), input.tangent.w);
       output.worldPos = GetAbsolutePositionWS(positionRWS);
       output.pos = TransformWorldToHClip(positionRWS);
       output.worldNormal = normalWS;
       output.worldTangent = tangentWS;
       output.texcoord0 = input.texcoord0;
       output.texcoord1 = input.texcoord1;
       output.texcoord2 = input.texcoord2;
        output.texcoord3 = input.texcoord3;
        output.screenPos = ComputeScreenPos(output.pos, _ProjectionParams.x);
       #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))

          #if !defined(TESSELLATION_ON)
            MotionVectorPositionZBias(output);
          #endif

          output.motionVectorCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(positionRWS.xyz, 1.0));
          bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
          if (forceNoMotion)
          {
              output.previousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
          }
          else
          {
            bool hasDeformation = unity_MotionVectorsParams.x > 0.0; 

            float3 effectivePositionOS = (hasDeformation ? previousMesh.previousPositionOS : previousMesh.vertex.xyz);
            #if defined(_ADD_PRECOMPUTED_VELOCITY)
               effectivePositionOS -= input.precomputedVelocity;
            #endif

            previousMesh.vertex = float4(effectivePositionOS, 1);
            VertexToPixel dummy = (VertexToPixel)0;
            ChainModifyVertex(previousMesh, dummy, _LastTimeParameters);
            float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.vertex.xyz);

            #ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
            if (_TransparentCameraOnlyMotionVectors > 0)
            {
               previousPositionRWS = positionRWS.xyz;
            }
            #endif 

            output.previousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
         }
       #endif 
       return output;
   }
#endif
               #if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
                  #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
               #endif

                FragInputs BuildFragInputs(VertexToPixel input)
                {
                    UNITY_SETUP_INSTANCE_ID(input);
                    FragInputs output;
                    ZERO_INITIALIZE(FragInputs, output);
                    output.tangentToWorld = k_identity3x3;
                    output.positionSS = input.pos;       
                    output.positionRWS = GetCameraRelativePositionWS(input.worldPos);
                    output.tangentToWorld = BuildTangentToWorld(input.worldTangent, input.worldNormal);
                    output.texCoord0 = input.texcoord0;
                    output.texCoord1 = input.texcoord1;
                    output.texCoord2 = input.texcoord2;
                    return output;
                }
               void BuildSurfaceData(FragInputs fragInputs, inout Surface surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
               {
                   ZERO_INITIALIZE(SurfaceData, surfaceData);
                   surfaceData.specularOcclusion = 1.0;
                   surfaceData.baseColor =                 surfaceDescription.Albedo;
                   surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;
                   surfaceData.ambientOcclusion =          surfaceDescription.Occlusion;
                   surfaceData.specularOcclusion =         surfaceDescription.SpecularOcclusion;
                   surfaceData.metallic =                  surfaceDescription.Metallic;
                   surfaceData.subsurfaceMask =            surfaceDescription.SubsurfaceMask;
                   surfaceData.thickness =                 surfaceDescription.Thickness;
                   surfaceData.diffusionProfileHash =      asuint(surfaceDescription.DiffusionProfileHash);
                   #if _USESPECULAR
                      surfaceData.specularColor =             surfaceDescription.Specular;
                   #endif
                   surfaceData.coatMask =                  surfaceDescription.CoatMask;
                   surfaceData.anisotropy =                surfaceDescription.Anisotropy;
                   surfaceData.iridescenceMask =           surfaceDescription.IridescenceMask;
                   surfaceData.iridescenceThickness =      surfaceDescription.IridescenceThickness;
                   #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                        if (_EnableSSRefraction)
                        {
                            surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                            surfaceDescription.Alpha = 1.0;
                        }
                        else
                        {
                            surfaceData.ior = surfaceDescription.ior;
                            surfaceData.transmittanceColor = surfaceDescription.transmittanceColor;
                            surfaceData.atDistance = surfaceDescription.atDistance;
                            surfaceData.transmittanceMask = surfaceDescription.transmittanceMask;
                            surfaceDescription.Alpha = 1.0;
                        }
                    #else
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                    #endif
                    surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
                    #ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
                    #endif
                    #ifdef _MATERIAL_FEATURE_TRANSMISSION
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
                    #endif
                    #ifdef _MATERIAL_FEATURE_ANISOTROPY
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                        surfaceData.normalWS = float3(0, 1, 0);
                    #endif
                    #ifdef _MATERIAL_FEATURE_IRIDESCENCE
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
                    #endif
                    #ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
                    #endif
                    #if defined(_MATERIAL_FEATURE_CLEAR_COAT) || _CLEARCOAT
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
                    #endif
                    #if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                        surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
                    #endif
                   #if !_WORLDSPACENORMAL
                      surfaceData.normalWS = mul(surfaceDescription.Normal, fragInputs.tangentToWorld);
                   #else
                      surfaceData.normalWS = surfaceDescription.Normal;
                   #endif

                   surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                   surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    
                    #if HAVE_DECALS
                        if (_EnableDecals)
                        {
                            float alpha = 1.0;
                            alpha = surfaceDescription.Alpha;
                            DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], alpha);
                            ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
                        }
                    #endif
                    bentNormalWS = surfaceData.normalWS;
                    surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);
                    #ifdef DEBUG_DISPLAY
                        if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
                        {
                            surfaceData.metallic = 0;
                        }
                        ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
                    #endif
                    #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                    #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                        surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                    #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                        surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                    #endif
                    #if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
                        surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                    #endif
               }
               void GetSurfaceAndBuiltinData(VertexToPixel m2ps, FragInputs fragInputs, float3 V, inout PositionInputs posInput,
                     out SurfaceData surfaceData, out BuiltinData builtinData, inout Surface l, inout ShaderData d
                     #if NEED_FACING
                        , bool facing
                     #endif
                  )
               {
                 d = CreateShaderData(m2ps
                    #if NEED_FACING
                       , facing
                    #endif
                 );

                 l = (Surface)0;

                 l.Albedo = half3(0.5, 0.5, 0.5);
                 l.Normal = float3(0,0,1);
                 l.Occlusion = 1;
                 l.Alpha = 1;
                 l.SpecularOcclusion = 1;

                 #if !defined(SHADER_STAGE_RAY_TRACING) && defined(_DEPTHOFFSET_ON)
                    l.outputDepth = d.clipPos.z;
                 #endif

                 ChainSurfaceFunction(l, d);

                 #if !defined(SHADER_STAGE_RAY_TRACING) && defined(_DEPTHOFFSET_ON)
                 #endif

                 #if _UNLIT
                     l.Normal = half3(0,0,1);
                     l.Occlusion = 1;
                     l.Metallic = 0;
                     l.Specular = 0;
                 #endif

                 surfaceData.geomNormalWS = d.worldSpaceNormal;
                 surfaceData.tangentWS = d.worldSpaceTangent;
                 fragInputs.tangentToWorld = d.TBNMatrix;

                 float3 bentNormalWS;
                 BuildSurfaceData(fragInputs, l, V, posInput, surfaceData, bentNormalWS);
                 InitBuiltinData(posInput, l.Alpha, bentNormalWS, -d.worldSpaceNormal, fragInputs.texCoord1, fragInputs.texCoord2, builtinData);
                 builtinData.emissiveColor = l.Emission;

                 #if defined(_OVERRIDE_BAKEDGI)
                    builtinData.bakeDiffuseLighting = l.DiffuseGI;
                    builtinData.backBakeDiffuseLighting = l.BackDiffuseGI;
                    builtinData.emissiveColor += l.SpecularGI;
                 #endif

                 #if defined(_OVERRIDE_SHADOWMASK)
                    builtinData.shadowMask0 = l.ShadowMask.x;
                    builtinData.shadowMask1 = l.ShadowMask.y;
                    builtinData.shadowMask2 = l.ShadowMask.z;
                    builtinData.shadowMask3 = l.ShadowMask.w;
                 #endif

                 #if defined(UNITY_VIRTUAL_TEXTURING)
                    builtinData.vtPackedFeedback = surfaceData.VTPackedFeedback;
                 #endif

                  #if (SHADERPASS == SHADERPASS_DISTORTION)
                     builtinData.distortion = surfaceData.Distortion;
                     builtinData.distortionBlur = surfaceData.DistortionBlur;
                  #endif

                  #ifndef SHADER_UNLIT
                    PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                  #else
                    ApplyDebugToBuiltinData(builtinData);
                  #endif
                  RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
               }
#if defined(WRITE_DECAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
#define SV_TARGET_NORMAL SV_Target3
#elif defined(WRITE_DECAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
#define SV_TARGET_NORMAL SV_Target2
#else
#define SV_TARGET_NORMAL SV_Target1
#endif
void Frag(  VertexToPixel v2f
            #ifdef WRITE_MSAA_DEPTH
            , out float4 depthColor : SV_Target0
            , out float4 outMotionVector : SV_Target1
                #ifdef WRITE_DECAL_BUFFER
                , out float4 outDecalBuffer : SV_Target2
                #endif
            #else
            , out float4 outMotionVector : SV_Target0
                #ifdef WRITE_DECAL_BUFFER
                , out float4 outDecalBuffer : SV_Target1
                #endif
            #endif
            #ifdef WRITE_NORMAL_BUFFER
            , out float4 outNormalBuffer : SV_TARGET_NORMAL
            #endif

            #ifdef _DEPTHOFFSET_ON
            , out float outputDepth : SV_Depth
            #endif
            #if NEED_FACING
               , bool facing : SV_IsFrontFace
            #endif
        )
          {

              FragInputs input = BuildFragInputs(v2f);
              PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

              float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);
              SurfaceData surfaceData;
              BuiltinData builtinData;
              Surface l;
              ShaderData d;
              GetSurfaceAndBuiltinData(v2f, input, V, posInput, surfaceData, builtinData, l, d
               #if NEED_FACING
                  , facing
               #endif
               );

            #ifdef _DEPTHOFFSET_ON
                v2f.motionVectorCS.w += builtinData.depthOffset;
                v2f.previousPositionCS.w += builtinData.depthOffset;
            #endif
             float2 motionVector = CalculateMotionVector(v2f.motionVectorCS, v2f.previousPositionCS);
             EncodeMotionVector(motionVector * 0.5, outMotionVector);
             bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
             if (forceNoMotion)
                 outMotionVector = float4(2.0, 0.0, 0.0, 0.0);
         #ifdef WRITE_MSAA_DEPTH
             depthColor = v2f.pos.z;

             #ifdef _ALPHATOMASK_ON
             depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
             #endif
         #endif
         #ifdef WRITE_NORMAL_BUFFER
             EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
         #endif

         #if defined(WRITE_DECAL_BUFFER)
             DecalPrepassData decalPrepassData;
             #ifdef _DISABLE_DECALS
             ZERO_INITIALIZE(DecalPrepassData, decalPrepassData);
             #else
             decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
             decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
             #endif
             EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
             outDecalBuffer.w = (GetMeshRenderingLightLayer() & 0x000000FF) / 255.0;
         #endif

         #ifdef _DEPTHOFFSET_ON
             outputDepth = posInput.deviceDepth;
         #endif
          }

            ENDHLSL
        }
              Pass
        {
            Name "FullScreenDebug"
            Tags
            {
               "LightMode" = "FullScreenDebug"
            }
            Cull Back
            ZTest LEqual
            ZWrite Off
            HLSLPROGRAM
            #pragma target 4.5
            #pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
            #define SHADERPASS SHADERPASS_FULL_SCREEN_DEBUG
            #define _PASSFULLSCREENDEBUG 1
    #pragma shader_feature_local _ALPHATEST_ON

    #pragma shader_feature_local_fragment _NORMALMAP_TANGENT_SPACE
    #pragma shader_feature_local _NORMALMAP
    #pragma shader_feature_local_fragment _MASKMAP
    #pragma shader_feature_local_fragment _EMISSIVE_COLOR_MAP
    #pragma shader_feature_local_fragment _ANISOTROPYMAP
    #pragma shader_feature_local_fragment _DETAIL_MAP
    #pragma shader_feature_local_fragment _SUBSURFACE_MASK_MAP
    #pragma shader_feature_local_fragment _THICKNESSMAP
    #pragma shader_feature_local_fragment _IRIDESCENCE_THICKNESSMAP
    #pragma shader_feature_local_fragment _SPECULARCOLORMAP
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_TRANSMISSION
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_ANISOTROPY
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_CLEAR_COAT
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_IRIDESCENCE
    #pragma shader_feature_local_fragment _MATERIAL_FEATURE_SPECULAR_COLOR
    #pragma shader_feature_local_fragment _ENABLESPECULAROCCLUSION
    #pragma shader_feature_local_fragment _ _SPECULAR_OCCLUSION_NONE _SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP

    #ifdef _ENABLESPECULAROCCLUSION
        #define _SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP
    #endif
        #pragma shader_feature_local_fragment _OBSTRUCTION_CURVE
        #pragma shader_feature_local_fragment _DISSOLVEMASK
        #pragma shader_feature_local_fragment _ZONING
        #pragma shader_feature_local_fragment _REPLACEMENT
        #pragma shader_feature_local_fragment _PLAYERINDEPENDENT
   #define _HDRP 1
#define _USINGTEXCOORD1 1
#define _USINGTEXCOORD2 1
#define NEED_FACING 1

               #pragma vertex Vert
   #pragma fragment Frag
      #define UNITY_DECLARE_TEX2D(name) TEXTURE2D(name); SAMPLER(sampler##name);
      #define UNITY_DECLARE_TEX2D_NOSAMPLER(name) TEXTURE2D(name);
      #define UNITY_DECLARE_TEX2DARRAY(name) TEXTURE2D_ARRAY(name); SAMPLER(sampler##name);
      #define UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(tex) TEXTURE2D_ARRAY(tex);

      #define UNITY_SAMPLE_TEX2DARRAY(tex,coord)            SAMPLE_TEXTURE2D_ARRAY(tex, sampler##tex, coord.xy, coord.z)
      #define UNITY_SAMPLE_TEX2DARRAY_LOD(tex,coord,lod)    SAMPLE_TEXTURE2D_ARRAY_LOD(tex, sampler##tex, coord.xy, coord.z, lod)
      #define UNITY_SAMPLE_TEX2D(tex, coord)                SAMPLE_TEXTURE2D(tex, sampler##tex, coord)
      #define UNITY_SAMPLE_TEX2D_SAMPLER(tex, samp, coord)  SAMPLE_TEXTURE2D(tex, sampler##samp, coord)

      #define UNITY_SAMPLE_TEX2D_LOD(tex,coord, lod)   SAMPLE_TEXTURE2D_LOD(tex, sampler_##tex, coord, lod)
      #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord, lod) SAMPLE_TEXTURE2D_LOD (tex, sampler##samplertex,coord, lod)

      #if defined(UNITY_COMPILER_HLSL)
         #define UNITY_INITIALIZE_OUTPUT(type,name) name = (type)0;
      #else
         #define UNITY_INITIALIZE_OUTPUT(type,name)
      #endif

      #define sampler2D_float sampler2D
      #define sampler2D_half sampler2D

      #undef WorldNormalVector
      #define WorldNormalVector(data, normal) mul(normal, data.TBNMatrix)

      #define UnityObjectToWorldNormal(normal) mul(GetObjectToWorldMatrix(), normal)
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
#if UNITY_VERSION >= UNITY_2021_3_31
       #include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl" 
#else
        #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" 
#endif    
            #ifdef RAYTRACING_SHADER_GRAPH_DEFAULT 
            #define RAYTRACING_SHADER_GRAPH_HIGH
            #endif
            #ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
            #define RAYTRACING_SHADER_GRAPH_LOW
            #endif
            #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
               #define OUTPUT_SPLIT_LIGHTING
            #endif

            #define HAVE_RECURSIVE_RENDERING

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
               #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                  #define WRITE_NORMAL_BUFFER
               #endif
            #endif

            #ifndef DEBUG_DISPLAY
               #if !defined(_SURFACE_TYPE_TRANSPARENT) && defined(_ALPHATEST)
                  #if SHADERPASS == SHADERPASS_FORWARD
                  #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                  #elif SHADERPASS == SHADERPASS_GBUFFER
                  #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                  #endif
               #endif
            #endif
            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
               #define _DEFERRED_CAPABLE_MATERIAL
            #endif
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
               #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
            CBUFFER_START(UnityPerMaterial)
               float _UseShadowThreshold;
               float _BlendMode;
               float _EnableBlendModePreserveSpecularLighting;
               float _RayTracing;
               float _RefractionModel;
    float4 _BaseColorMap_ST;
    float4 _DetailMap_ST;
    float4 _EmissiveColorMap_ST;

    float _UVBase;
    half4 _Color;
    half4 _BaseColor; 
    half _Cutoff; 
    half _Mode;
    float _CullMode;
    float _CullModeForward;
    half _Metallic;
    half3 _EmissionColor;
    half _UVSec;

    float3 _EmissiveColor;
    float _AlbedoAffectEmissive;
    float _EmissiveExposureWeight;
    float _MetallicRemapMin;
    float _MetallicRemapMax;
    float _Smoothness;
    float _SmoothnessRemapMin;
    float _SmoothnessRemapMax;
    float _AlphaRemapMin;
    float _AlphaRemapMax;
    float _AORemapMin;
    float _AORemapMax;
    float _NormalScale;
    float _DetailAlbedoScale;
    float _DetailNormalScale;
    float _DetailSmoothnessScale;
    float _Anisotropy;
    float _DiffusionProfileHash;
    float _SubsurfaceMask;
    float _Thickness;
    float4 _ThicknessRemap;
    float _IridescenceThickness;
    float4 _IridescenceThicknessRemap;
    float _IridescenceMask;
    float _CoatMask;
    float4 _SpecularColor;
    float _EnergyConservingSpecularColor;
    int _MaterialID;

    float _LinkDetailsWithBase;
    float4 _UVMappingMask;
    float4 _UVDetailsMappingMask;

    float4 _UVMappingMaskEmissive;

    float _AlphaCutoff;
    float _SyncCullMode;

    float _IsReplacementShader;
    float _TriggerMode;
    float _RaycastMode;
    float _IsExempt;
    float _isReferenceMaterial;
    float _InteractionMode;

    float _tDirection = 0;
    float _numOfPlayersInside = 0;
    float _tValue = 0;
    float _id = 0;
    half _TextureVisibility;
    half _AngleStrength;
    float _Obstruction;
    float _UVs;
    float4 _ObstructionCurve_TexelSize;      
    float _DissolveMaskEnabled;
    float4 _DissolveMask_TexelSize;
    float4 _DissolveTex_TexelSize;
    half4 _DissolveColor;
    float _DissolveColorSaturation;
    float _DissolveEmission;
    float _DissolveEmissionBooster;
    float _hasClippedShadows;
    float _ConeStrength;
    float _ConeObstructionDestroyRadius;
    float _CylinderStrength;
    float _CylinderObstructionDestroyRadius;
    float _CircleStrength;
    float _CircleObstructionDestroyRadius;
    float _CurveStrength;
    float _CurveObstructionDestroyRadius;
    float _IntrinsicDissolveStrength;
    float _DissolveFallOff;
    float _AffectedAreaPlayerBasedObstruction;
    float _PreviewMode;
    float _PreviewIndicatorLineThickness;
    float _AnimationEnabled;
    float _AnimationSpeed;
    float _DefaultEffectRadius;
    float _EnableDefaultEffectRadius;
    float _TransitionDuration;
    float _TexturedEmissionEdge;
    float _TexturedEmissionEdgeStrength;
    float _IsometricExclusion;
    float _IsometricExclusionDistance;
    float _IsometricExclusionGradientLength;
    float _Floor;
    float _FloorMode;
    float _FloorY;
    float _FloorYTextureGradientLength;
    float _PlayerPosYOffset;
    float _AffectedAreaFloor;
    float _Ceiling;
    float _CeilingMode;
    float _CeilingBlendMode;
    float _CeilingY;
    float _CeilingPlayerYOffset;
    float _CeilingYGradientLength;
    float _Zoning;
    float _ZoningMode;
    float _ZoningEdgeGradientLength;
    float _IsZoningRevealable;
    float _SyncZonesWithFloorY;
    float _SyncZonesFloorYOffset;

    half _UseCustomTime;

    half _CrossSectionEnabled;
    half4 _CrossSectionColor;
    half _CrossSectionTextureEnabled;
    float _CrossSectionTextureScale;
    half _CrossSectionUVScaledByDistance;
    half _DissolveMethod;
    half _DissolveTexSpace;
            CBUFFER_END
               #ifdef SCENEPICKINGPASS
               float4 _SelectionID;
               #endif
               #ifdef SCENESELECTIONPASS
               int _ObjectId;
               int _PassValue;
               #endif
            struct VertexToPixel
            {
               float4 pos : SV_POSITION;
               float3 worldPos : TEXCOORD0;
               float3 worldNormal : TEXCOORD1;
               float4 worldTangent : TEXCOORD2;
               float4 texcoord0 : TEXCOORD3;
               float4 texcoord1 : TEXCOORD4;
               float4 texcoord2 : TEXCOORD5;
                float4 texcoord3 : TEXCOORD6;
                float4 screenPos : TEXCOORD7;
               #if UNITY_ANY_INSTANCING_ENABLED
                  UNITY_VERTEX_INPUT_INSTANCE_ID
               #endif 

               #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
                  float4 previousPositionCS : TEXCOORD16; 
                  float4 motionVectorCS : TEXCOORD17;
               #endif

               UNITY_VERTEX_OUTPUT_STEREO
            }; 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
            struct Surface
            {
               half3 Albedo;
               half Height;
               half3 Normal;
               half Smoothness;
               half3 Emission;
               half Metallic;
               half3 Specular;
               half Occlusion;
               half SpecularPower; 
               half Alpha;
               float outputDepth; 
               half SpecularOcclusion;
               half SubsurfaceMask;
               half Thickness;
               half CoatMask;
               half CoatSmoothness;
               half Anisotropy;
               half IridescenceMask;
               half IridescenceThickness;
               int DiffusionProfileHash;
               float SpecularAAThreshold;
               float SpecularAAScreenSpaceVariance;
               float3 DiffuseGI;
               float3 BackDiffuseGI;
               float3 SpecularGI;
               float ior;
               float3 transmittanceColor;
               float atDistance;
               float transmittanceMask;
               float4 ShadowMask;
               float NormalAlpha;
               float MAOSAlpha;
            };
            struct Blackboard
            {
                float blackboardDummyData;
            };
            struct ShaderData
            {
               float4 clipPos; 
               float3 localSpacePosition;
               float3 localSpaceNormal;
               float3 localSpaceTangent;
               float3 worldSpacePosition;
               float3 worldSpaceNormal;
               float3 worldSpaceTangent;
               float tangentSign;

               float3 worldSpaceViewDir;
               float3 tangentSpaceViewDir;

               float4 texcoord0;
               float4 texcoord1;
               float4 texcoord2;
               float4 texcoord3;

               float2 screenUV;
               float4 screenPos;

               float4 vertexColor;
               bool isFrontFace;

               float4 extraV2F0;
               float4 extraV2F1;
               float4 extraV2F2;
               float4 extraV2F3;
               float4 extraV2F4;
               float4 extraV2F5;
               float4 extraV2F6;
               float4 extraV2F7;

               float3x3 TBNMatrix;
               Blackboard blackboard;
            };

            struct VertexData
            {
               #if SHADER_TARGET > 30
               #endif
               float4 vertex : POSITION;
               float3 normal : NORMAL;
               float4 tangent : TANGENT;
               float4 texcoord0 : TEXCOORD0;
               #if _URP && (_USINGTEXCOORD1 || _PASSMETA || _PASSFORWARD || _PASSGBUFFER)
                  float4 texcoord1 : TEXCOORD1;
               #endif

               #if _URP && (_USINGTEXCOORD2 || _PASSMETA || ((_PASSFORWARD || _PASSGBUFFER) && defined(DYNAMICLIGHTMAP_ON)))
                  float4 texcoord2 : TEXCOORD2;
               #endif

               #if _STANDARD && (_USINGTEXCOORD1 || (_PASSMETA || ((_PASSFORWARD || _PASSGBUFFER || _PASSFORWARDADD) && LIGHTMAP_ON)))
                  float4 texcoord1 : TEXCOORD1;
               #endif
               #if _STANDARD && (_USINGTEXCOORD2 || (_PASSMETA || ((_PASSFORWARD || _PASSGBUFFER) && DYNAMICLIGHTMAP_ON)))
                  float4 texcoord2 : TEXCOORD2;
               #endif
               #if _HDRP
                  float4 texcoord1 : TEXCOORD1;
                  float4 texcoord2 : TEXCOORD2;
               #endif
                float4 texcoord3 : TEXCOORD3;
               #if _PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR))
                  float3 previousPositionOS : TEXCOORD4; 
                  #if defined (_ADD_PRECOMPUTED_VELOCITY)
                     float3 precomputedVelocity    : TEXCOORD5; 
                  #endif
               #endif

               UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct TessVertex 
            {
               float4 vertex : INTERNALTESSPOS;
               float3 normal : NORMAL;
               float4 tangent : TANGENT;
               float4 texcoord0 : TEXCOORD0;
               float4 texcoord1 : TEXCOORD1;
               float4 texcoord2 : TEXCOORD2;
                float4 texcoord3 : TEXCOORD3;
               #if _PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR))
                  float3 previousPositionOS : TEXCOORD13; 
                  #if defined (_ADD_PRECOMPUTED_VELOCITY)
                     float3 precomputedVelocity : TEXCOORD14;
                  #endif
               #endif

               UNITY_VERTEX_INPUT_INSTANCE_ID
               UNITY_VERTEX_OUTPUT_STEREO
            };

            struct ExtraV2F
            {
               float4 extraV2F0;
               float4 extraV2F1;
               float4 extraV2F2;
               float4 extraV2F3;
               float4 extraV2F4;
               float4 extraV2F5;
               float4 extraV2F6;
               float4 extraV2F7;
               Blackboard blackboard;
               float4 time;
            };
            float3 WorldToTangentSpace(ShaderData d, float3 normal)
            {
               return mul(d.TBNMatrix, normal);
            }

            float3 TangentToWorldSpace(ShaderData d, float3 normal)
            {
               return mul(normal, d.TBNMatrix);
            }
            #if _STANDARD
               float3 TransformWorldToObject(float3 p) { return mul(unity_WorldToObject, float4(p, 1)); };
               float3 TransformObjectToWorld(float3 p) { return mul(unity_ObjectToWorld, float4(p, 1)); };
               float4 TransformWorldToObject(float4 p) { return mul(unity_WorldToObject, p); };
               float4 TransformObjectToWorld(float4 p) { return mul(unity_ObjectToWorld, p); };
               float4x4 GetWorldToObjectMatrix() { return unity_WorldToObject; }
               float4x4 GetObjectToWorldMatrix() { return unity_ObjectToWorld; }
               #if (defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (SHADER_TARGET_SURFACE_ANALYSIS && !SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))
                 #define UNITY_SAMPLE_TEX2D_LOD(tex,coord, lod) tex.SampleLevel (sampler##tex,coord, lod)
                 #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord, lod) tex.SampleLevel (sampler##samplertex,coord, lod)
              #else
                 #define UNITY_SAMPLE_TEX2D_LOD(tex,coord,lod) tex2D (tex,coord,0,lod)
                 #define UNITY_SAMPLE_TEX2D_SAMPLER_LOD(tex,samplertex,coord,lod) tex2D (tex,coord,0,lod)
              #endif

               #undef GetWorldToObjectMatrix()

               #define GetWorldToObjectMatrix()   unity_WorldToObject
            #endif

            float3 GetCameraWorldPosition()
            {
               #if _HDRP
                  return GetCameraRelativePositionWS(_WorldSpaceCameraPos);
               #else
                  return _WorldSpaceCameraPos;
               #endif
            }

            #if _GRABPASSUSED
               #if _STANDARD
                  TEXTURE2D(%GRABTEXTURE%);
                  SAMPLER(sampler_%GRABTEXTURE%);
               #endif

               half3 GetSceneColor(float2 uv)
               {
                  #if _STANDARD
                     return SAMPLE_TEXTURE2D(%GRABTEXTURE%, sampler_%GRABTEXTURE%, uv).rgb;
                  #else
                     return SHADERGRAPH_SAMPLE_SCENE_COLOR(uv);
                  #endif
               }
            #endif
            #if _STANDARD
               UNITY_DECLARE_DEPTH_TEXTURE(_CameraDepthTexture);
               float GetSceneDepth(float2 uv) { return SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, uv); }
               float GetLinear01Depth(float2 uv) { return Linear01Depth(GetSceneDepth(uv)); }
               float GetLinearEyeDepth(float2 uv) { return LinearEyeDepth(GetSceneDepth(uv)); } 
            #else
               float GetSceneDepth(float2 uv) { return SHADERGRAPH_SAMPLE_SCENE_DEPTH(uv); }
               float GetLinear01Depth(float2 uv) { return Linear01Depth(GetSceneDepth(uv), _ZBufferParams); }
               float GetLinearEyeDepth(float2 uv) { return LinearEyeDepth(GetSceneDepth(uv), _ZBufferParams); } 
            #endif

            float3 GetWorldPositionFromDepthBuffer(float2 uv, float3 worldSpaceViewDir)
            {
               float eye = GetLinearEyeDepth(uv);
               float3 camView = mul((float3x3)GetObjectToWorldMatrix(), transpose(mul(GetWorldToObjectMatrix(), UNITY_MATRIX_I_V)) [2].xyz);

               float dt = dot(worldSpaceViewDir, camView);
               float3 div = worldSpaceViewDir/dt;
               float3 wpos = (eye * div) + GetCameraWorldPosition();
               return wpos;
            }

            #if _HDRP
            float3 ObjectToWorldSpacePosition(float3 pos)
            {
               return GetAbsolutePositionWS(TransformObjectToWorld(pos));
            }
            #else
            float3 ObjectToWorldSpacePosition(float3 pos)
            {
               return TransformObjectToWorld(pos);
            }
            #endif

            #if _STANDARD
               UNITY_DECLARE_SCREENSPACE_TEXTURE(_CameraDepthNormalsTexture);
               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  float4 depthNorms = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_CameraDepthNormalsTexture, uv);
                  float3 norms = DecodeViewNormalStereo(depthNorms);
                  norms = mul((float3x3)GetWorldToViewMatrix(), norms) * 0.5 + 0.5;
                  return norms;
               }
            #elif _HDRP && !_DECALSHADER
               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  NormalData nd;
                  DecodeFromNormalBuffer(_ScreenSize.xy * uv, nd);
                  return nd.normalWS;
               }
            #elif _URP
               #if (SHADER_LIBRARY_VERSION_MAJOR >= 10)
                  #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareNormalsTexture.hlsl"
               #endif

               float3 GetSceneNormal(float2 uv, float3 worldSpaceViewDir)
               {
                  #if (SHADER_LIBRARY_VERSION_MAJOR >= 10)
                     return SampleSceneNormals(uv);
                  #else
                     float3 wpos = GetWorldPositionFromDepthBuffer(uv, worldSpaceViewDir);
                     return normalize(-cross(ddx(wpos), ddy(wpos))) * 0.5 + 0.5;
                  #endif

                }
             #endif

             #if _HDRP

               half3 UnpackNormalmapRGorAG(half4 packednormal)
               {
                  packednormal.x *= packednormal.w;

                  half3 normal;
                  normal.xy = packednormal.xy * 2 - 1;
                  normal.z = sqrt(1 - saturate(dot(normal.xy, normal.xy)));
                  return normal;
               }
               half3 UnpackNormal(half4 packednormal)
               {
                  #if defined(UNITY_NO_DXT5nm)
                     return packednormal.xyz * 2 - 1;
                  #else
                     return UnpackNormalmapRGorAG(packednormal);
                  #endif
               }
            #endif
            #if _HDRP || _URP

               half3 UnpackScaleNormal(half4 packednormal, half scale)
               {
                 #ifndef UNITY_NO_DXT5nm
                   packednormal.x *= packednormal.w;
                 #endif
                   half3 normal;
                   normal.xy = (packednormal.xy * 2 - 1) * scale;
                   normal.z = sqrt(1 - saturate(dot(normal.xy, normal.xy)));
                   return normal;
               }	

             #endif
            void GetSun(out float3 lightDir, out float3 color)
            {
               lightDir = float3(0.5, 0.5, 0);
               color = 1;
               #if _HDRP
                  if (_DirectionalLightCount > 0)
                  {
                     DirectionalLightData light = _DirectionalLightDatas[0];
                     lightDir = -light.forward.xyz;
                     color = light.color;
                  }
               #elif _STANDARD
			         lightDir = normalize(_WorldSpaceLightPos0.xyz);
                  color = _LightColor0.rgb;
               #elif _URP
	               Light light = GetMainLight();
	               lightDir = light.direction;
	               color = light.color;
               #endif
            }
    sampler2D _EmissiveColorMap;
    sampler2D _BaseColorMap;
    sampler2D _MaskMap;
    sampler2D _NormalMap;
    sampler2D _NormalMapOS;
    sampler2D _DetailMap;
    sampler2D _TangentMap;
    sampler2D _TangentMapOS;
    sampler2D _AnisotropyMap;
    sampler2D _SubsurfaceMaskMap;
    sampler2D _TransmissionMaskMap;
    sampler2D _ThicknessMap;
    sampler2D _IridescenceThicknessMap;
    sampler2D _IridescenceMaskMap;
    sampler2D _SpecularColorMap;

    sampler2D _CoatMaskMap;

    float3 DecodeNormal (float4 sample, float scale) {
        #if defined(UNITY_NO_DXT5nm)
            return UnpackNormalRGB(sample, scale);
        #else
            return UnpackNormalmapRGorAG(sample, scale);
        #endif
    }

	void Ext_SurfaceFunction0 (inout Surface o, ShaderData d)
	{
        float2 uvBase = (_UVMappingMask.x * d.texcoord0 +
                        _UVMappingMask.y * d.texcoord1 +
                        _UVMappingMask.z * d.texcoord2 +
                        _UVMappingMask.w * d.texcoord3).xy;

        float2 uvDetails =  (_UVDetailsMappingMask.x * d.texcoord0 +
                            _UVDetailsMappingMask.y * d.texcoord1 +
                            _UVDetailsMappingMask.z * d.texcoord2 +
                            _UVDetailsMappingMask.w * d.texcoord3).xy;
        float4 texcoords;
        texcoords.xy = uvBase * _BaseColorMap_ST.xy + _BaseColorMap_ST.zw; 

        texcoords.zw = uvDetails * _DetailMap_ST.xy + _DetailMap_ST.zw;

        if (_LinkDetailsWithBase > 0.0)
        {
            texcoords.zw = texcoords.zw  * _BaseColorMap_ST.xy + _BaseColorMap_ST.zw;

        }

            float3 detailNormalTS = float3(0.0, 0.0, 0.0);
            float detailMask = 0.0;
            #ifdef _DETAIL_MAP
                detailMask = 1.0;
                #ifdef _MASKMAP
                    detailMask = tex2D(_MaskMap, texcoords.xy).b;
                #endif
                float2 detailAlbedoAndSmoothness = tex2D(_DetailMap, texcoords.zw).rb;
                float detailAlbedo = detailAlbedoAndSmoothness.r * 2.0 - 1.0;
                float detailSmoothness = detailAlbedoAndSmoothness.g * 2.0 - 1.0;
                real4 packedNormal = tex2D(_DetailMap, texcoords.zw).rgba;
                detailNormalTS = UnpackNormalAG(packedNormal, _DetailNormalScale);
            #endif
            float4 color = tex2D(_BaseColorMap, texcoords.xy).rgba  * _Color.rgba;
            o.Albedo = color.rgb; 
            float alpha = color.a;
            alpha = lerp(_AlphaRemapMin, _AlphaRemapMax, alpha);
            o.Alpha = alpha;
            #ifdef _DETAIL_MAP
                float albedoDetailSpeed = saturate(abs(detailAlbedo) * _DetailAlbedoScale);
                float3 baseColorOverlay = lerp(sqrt(o.Albedo), (detailAlbedo < 0.0) ? float3(0.0, 0.0, 0.0) : float3(1.0, 1.0, 1.0), albedoDetailSpeed * albedoDetailSpeed);
                baseColorOverlay *= baseColorOverlay;
                o.Albedo = lerp(o.Albedo, saturate(baseColorOverlay), detailMask);
            #endif

            #ifdef _NORMALMAP
                float3 normalTS;
                #ifdef _NORMALMAP_TANGENT_SPACE
                    normalTS = DecodeNormal(tex2D(_NormalMap, texcoords.xy), _NormalScale);
                #else
                    #ifdef SURFACE_GRADIENT
                        float3 normalOS = tex2D(_NormalMapOS, texcoords.xy).xyz * 2.0 - 1.0;
                        normalTS = SurfaceGradientFromPerturbedNormal(d.worldSpaceNormal, TransformObjectToWorldNormal(normalOS));
                    #else
                        float3 normalOS = UnpackNormalRGB(tex2D(_NormalMapOS, texcoords.xy), 1.0);
                        float3 bitangent = d.tangentSign * cross(d.worldSpaceNormal.xyz, d.worldSpaceTangent.xyz);
                        half3x3 tangentToWorld = half3x3(d.worldSpaceTangent.xyz, bitangent.xyz, d.worldSpaceNormal.xyz);
                        normalTS = TransformObjectToTangent(normalOS, tangentToWorld);
                    #endif
                #endif

                #ifdef _DETAIL_MAP
                    #ifdef SURFACE_GRADIENT
                    normalTS += detailNormalTS * detailMask;
                    #else
                    normalTS = lerp(normalTS, BlendNormalRNM(normalTS, normalize(detailNormalTS)), detailMask); 
                    #endif
                #endif
                o.Normal = normalTS;

            #endif

            #if defined(_MASKMAP)
                o.Smoothness = tex2D(_MaskMap, texcoords.xy).a;
                o.Smoothness = lerp(_SmoothnessRemapMin, _SmoothnessRemapMax, o.Smoothness);
            #else
                o.Smoothness = _Smoothness;
            #endif
            #ifdef _DETAIL_MAP
                float smoothnessDetailSpeed = saturate(abs(detailSmoothness) * _DetailSmoothnessScale);
                float smoothnessOverlay = lerp(o.Smoothness, (detailSmoothness < 0.0) ? 0.0 : 1.0, smoothnessDetailSpeed);
                o.Smoothness = lerp(o.Smoothness, saturate(smoothnessOverlay), detailMask);
            #endif
            #ifdef _MASKMAP
                o.Metallic = tex2D(_MaskMap, texcoords.xy).r;
                o.Metallic = lerp(_MetallicRemapMin, _MetallicRemapMax, o.Metallic);
                o.Occlusion = tex2D(_MaskMap, texcoords.xy).g;
                o.Occlusion = lerp(_AORemapMin, _AORemapMax, o.Occlusion);
            #else
                o.Metallic = _Metallic;
                o.Occlusion = 1.0;
            #endif

            #if defined(_SPECULAR_OCCLUSION_FROM_BENT_NORMAL_MAP)
            #elif  defined(_MASKMAP) && !defined(_SPECULAR_OCCLUSION_NONE)
                float3 V = normalize(d.worldSpaceViewDir);
                o.SpecularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(d.worldSpaceNormal, V)), o.Occlusion, PerceptualSmoothnessToRoughness(o.Smoothness));
            #endif

            o.DiffusionProfileHash = asuint(_DiffusionProfileHash);
            o.SubsurfaceMask = _SubsurfaceMask;
            #ifdef _SUBSURFACE_MASK_MAP
                o.SubsurfaceMask *= tex2D(_SubsurfaceMaskMap, texcoords.xy).r;
            #endif
            #ifdef _THICKNESSMAP
                o.Thickness = tex2D(_ThicknessMap, texcoords.xy).r;
                o.Thickness = _ThicknessRemap.x + _ThicknessRemap.y * surfaceData.thickness;
            #else
                o.Thickness = _Thickness;
            #endif
            #ifdef _ANISOTROPYMAP
                o.Anisotropy = tex2D(_AnisotropyMap, texcoords.xy).r;
            #else
                o.Anisotropy = 1.0;
            #endif
                o.Anisotropy *= _Anisotropy;
                o.Specular = _SpecularColor.rgb;
            #ifdef _SPECULARCOLORMAP
                o.Specular *= tex2D(_SpecularColorMap, texcoords.xy).rgb;
            #endif
            #ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                o.Albedo *= _EnergyConservingSpecularColor > 0.0 ? (1.0 - Max3(o.Specular.r, o.Specular.g, o.Specular.b)) : 1.0;
            #endif
            #ifdef _MATERIAL_FEATURE_CLEAR_COAT
                o.CoatMask = _CoatMask;
                o.CoatMask *= tex2D(_CoatMaskMap, texcoords.xy).r;
            #else
                o.CoatMask = 0.0;
            #endif
            #ifdef _MATERIAL_FEATURE_IRIDESCENCE
                #ifdef _IRIDESCENCE_THICKNESSMAP
                o.IridescenceThickness = tex2D(_IridescenceThicknessMap, texcoords.xy).r;
                o.IridescenceThickness = _IridescenceThicknessRemap.x + _IridescenceThicknessRemap.y * o.IridescenceThickness;
                #else
                o.IridescenceThickness = _IridescenceThickness;
                #endif
                o.IridescenceMask = _IridescenceMask;
                o.IridescenceMask *= tex2D(_IridescenceMaskMap, texcoords.xy).r;
            #else
                o.IridescenceThickness = 0.0;
                o.IridescenceMask = 0.0;
            #endif
            float3 emissiveColor = _EmissiveColor * lerp(float3(1.0, 1.0, 1.0), o.Albedo.rgb, _AlbedoAffectEmissive);
            #ifdef _EMISSIVE_COLOR_MAP                
                float2 uvEmission = _UVMappingMaskEmissive.x * d.texcoord0 +
                                    _UVMappingMaskEmissive.y * d.texcoord1 +
                                    _UVMappingMaskEmissive.z * d.texcoord2 +
                                    _UVMappingMaskEmissive.w * d.texcoord3;

                uvEmission = uvEmission * _EmissiveColorMap_ST.xy + _EmissiveColorMap_ST.zw;                     

                emissiveColor *= tex2D(_EmissiveColorMap, uvEmission).rgb;
            #endif
            o.Emission += emissiveColor;
            float currentExposureMultiplier = 0;
            #if SHADEROPTIONS_PRE_EXPOSITION
                currentExposureMultiplier =  LOAD_TEXTURE2D(_ExposureTexture, int2(0, 0)).x * _ProbeExposureScale;
            #else
                currentExposureMultiplier =  _ProbeExposureScale;
            #endif
            float InverseCurrentExposureMultiplier = 0;
            float exposure = currentExposureMultiplier;
            InverseCurrentExposureMultiplier =  rcp(exposure + (exposure == 0.0)); 
            float3 emissiveRcpExposure = o.Emission * InverseCurrentExposureMultiplier;
            o.Emission = lerp(emissiveRcpExposure, o.Emission, _EmissiveExposureWeight);
            #if defined(_ALPHATEST_ON)
                float alphaTex = tex2D(_BaseColorMap, texcoords.xy).a;
                alphaTex = lerp(_AlphaRemapMin, _AlphaRemapMax, alphaTex);
                float alphaValue = alphaTex * _BaseColor.a;
                float alphaCutoff = _AlphaCutoff;
                clip(alpha - alphaCutoff);
            #endif

	}
    float _ArrayLength = 0;
    #if (defined(SHADER_API_GLES) || defined(SHADER_API_GLES3)) 
        float4 _PlayersPosVectorArray[20];
        float _PlayersDataFloatArray[150];     
    #else
        float4 _PlayersPosVectorArray[100];
        float _PlayersDataFloatArray[500];  
    #endif
    #if _ZONING
        #if (defined(SHADER_API_GLES) || defined(SHADER_API_GLES3)) 
            float _ZDFA[500];
        #else
            float _ZDFA[1000];
        #endif
        float _ZonesDataCount;
    #endif

    float _STSCustomTime = 0;
    #if _REPLACEMENT        
        half4 _DissolveColorGlobal;
        float _DissolveColorSaturationGlobal;
        float _DissolveEmissionGlobal;
        float _DissolveEmissionBoosterGlobal;
        float _TextureVisibilityGlobal;
        float _ObstructionGlobal;
        float _AngleStrengthGlobal;
        float _ConeStrengthGlobal;
        float _ConeObstructionDestroyRadiusGlobal;
        float _CylinderStrengthGlobal;
        float _CylinderObstructionDestroyRadiusGlobal;
        float _CircleStrengthGlobal;
        float _CircleObstructionDestroyRadiusGlobal;
        float _CurveStrengthGlobal;
        float _CurveObstructionDestroyRadiusGlobal;
        float _DissolveFallOffGlobal;
        float _AffectedAreaPlayerBasedObstructionGlobal;
        float _IntrinsicDissolveStrengthGlobal;
        float _PreviewModeGlobal;
        float _UVsGlobal;
        float _hasClippedShadowsGlobal;
        float _FloorGlobal;
        float _FloorModeGlobal;
        float _FloorYGlobal;
        float _PlayerPosYOffsetGlobal;
        float _FloorYTextureGradientLengthGlobal;
        float _AffectedAreaFloorGlobal;
        float _AnimationEnabledGlobal;
        float _AnimationSpeedGlobal;
        float _DefaultEffectRadiusGlobal;
        float _EnableDefaultEffectRadiusGlobal;
        float _TransitionDurationGlobal;        
        float _TexturedEmissionEdgeGlobal;
        float _TexturedEmissionEdgeStrengthGlobal;
        float _IsometricExclusionGlobal;
        float _IsometricExclusionDistanceGlobal;
        float _IsometricExclusionGradientLengthGlobal;
        float _CeilingGlobal;
        float _CeilingModeGlobal;
        float _CeilingBlendModeGlobal;
        float _CeilingYGlobal;
        float _CeilingPlayerYOffsetGlobal;
        float _CeilingYGradientLengthGlobal;
        float _ZoningGlobal;
        float _ZoningModeGlobal;
        float _ZoningEdgeGradientLengthGlobal;
        float _IsZoningRevealableGlobal;
        float _SyncZonesWithFloorYGlobal;
        float _SyncZonesFloorYOffsetGlobal;
        float4 _ObstructionCurveGlobal_TexelSize;
        float4 _DissolveMaskGlobal_TexelSize;
        float _DissolveMaskEnabledGlobal;
        float _PreviewIndicatorLineThicknessGlobal;
        half _UseCustomTimeGlobal;

        half _CrossSectionEnabledGlobal;
        half4 _CrossSectionColorGlobal;
        half _CrossSectionTextureEnabledGlobal;
        float _CrossSectionTextureScaleGlobal;
        half _CrossSectionUVScaledByDistanceGlobal;

        half _DissolveMethodGlobal;
        half _DissolveTexSpaceGlobal;

        float4 _DissolveTexGlobal_TexelSize;
    #endif
    #if _REPLACEMENT
        sampler2D _DissolveTexGlobal;
    #else
        sampler2D _DissolveTex;
    #endif
    #if _REPLACEMENT
        sampler2D _DissolveMaskGlobal;
    #else
        sampler2D _DissolveMask;
    #endif
    #if _REPLACEMENT
        sampler2D _ObstructionCurveGlobal;
    #else
        sampler2D _ObstructionCurve;
    #endif

    #if _REPLACEMENT
        sampler2D _CrossSectionTextureGlobal;
    #else
        sampler2D _CrossSectionTexture;
    #endif
#ifdef USE_UNITY_TEXTURE_2D_TYPE
#undef USE_UNITY_TEXTURE_2D_TYPE
#endif

#include "Packages/com.shadercrew.seethroughshader.core/Scripts/Shaders/xxSharedSTSDependencies/SeeThroughShaderFunction.hlsl"
	void Ext_SurfaceFunction1 (inout Surface o, ShaderData d)
	{
        half3 albedo;
        half3 emission;
        float alphaForClipping;
#ifdef USE_UNITY_TEXTURE_2D_TYPE
#undef USE_UNITY_TEXTURE_2D_TYPE
#endif
#if _REPLACEMENT
    DoSeeThroughShading( o.Albedo, o.Normal, d.worldSpacePosition, d.worldSpaceNormal, d.screenPos,
                        _numOfPlayersInside, _tDirection, _tValue, _id,
                        _TriggerMode, _RaycastMode,
                        _IsExempt,

                        _DissolveMethodGlobal, _DissolveTexSpaceGlobal,

                        _DissolveColorGlobal, _DissolveColorSaturationGlobal, _UVsGlobal,
                        _DissolveEmissionGlobal, _DissolveEmissionBoosterGlobal, _TexturedEmissionEdgeGlobal, _TexturedEmissionEdgeStrengthGlobal,
                        _hasClippedShadowsGlobal,

                        _ObstructionGlobal,
                        _AngleStrengthGlobal,
                        _ConeStrengthGlobal, _ConeObstructionDestroyRadiusGlobal,
                        _CylinderStrengthGlobal, _CylinderObstructionDestroyRadiusGlobal,
                        _CircleStrengthGlobal, _CircleObstructionDestroyRadiusGlobal,
                        _CurveStrengthGlobal, _CurveObstructionDestroyRadiusGlobal,
                        _DissolveFallOffGlobal,
                        _DissolveMaskEnabledGlobal,
                        _AffectedAreaPlayerBasedObstructionGlobal,
                        _IntrinsicDissolveStrengthGlobal,
                        _DefaultEffectRadiusGlobal, _EnableDefaultEffectRadiusGlobal,

                        _IsometricExclusionGlobal, _IsometricExclusionDistanceGlobal, _IsometricExclusionGradientLengthGlobal,
                        _CeilingGlobal, _CeilingModeGlobal, _CeilingBlendModeGlobal, _CeilingYGlobal, _CeilingPlayerYOffsetGlobal, _CeilingYGradientLengthGlobal,
                        _FloorGlobal, _FloorModeGlobal, _FloorYGlobal, _PlayerPosYOffsetGlobal, _FloorYTextureGradientLengthGlobal, _AffectedAreaFloorGlobal,

                        _AnimationEnabledGlobal, _AnimationSpeedGlobal,
                        _TransitionDurationGlobal,

                        _UseCustomTimeGlobal,

                        _ZoningGlobal, _ZoningModeGlobal, _IsZoningRevealableGlobal, _ZoningEdgeGradientLengthGlobal,
                        _SyncZonesWithFloorYGlobal, _SyncZonesFloorYOffsetGlobal,

                        _PreviewModeGlobal,
                        _PreviewIndicatorLineThicknessGlobal,

                        _DissolveTexGlobal,
                        _DissolveMaskGlobal,
                        _ObstructionCurveGlobal,

                        _DissolveTexGlobal_TexelSize,
                        _DissolveMaskGlobal_TexelSize,
                        _ObstructionCurveGlobal_TexelSize,

                        albedo, emission, alphaForClipping);
#else 
    DoSeeThroughShading( o.Albedo, o.Normal, d.worldSpacePosition, d.worldSpaceNormal, d.screenPos,

                        _numOfPlayersInside, _tDirection, _tValue, _id,
                        _TriggerMode, _RaycastMode,
                        _IsExempt,

                        _DissolveMethod, _DissolveTexSpace,

                        _DissolveColor, _DissolveColorSaturation, _UVs,
                        _DissolveEmission, _DissolveEmissionBooster, _TexturedEmissionEdge, _TexturedEmissionEdgeStrength,
                        _hasClippedShadows,

                        _Obstruction,
                        _AngleStrength,
                        _ConeStrength, _ConeObstructionDestroyRadius,
                        _CylinderStrength, _CylinderObstructionDestroyRadius,
                        _CircleStrength, _CircleObstructionDestroyRadius,
                        _CurveStrength, _CurveObstructionDestroyRadius,
                        _DissolveFallOff,
                        _DissolveMaskEnabled,
                        _AffectedAreaPlayerBasedObstruction,
                        _IntrinsicDissolveStrength,
                        _DefaultEffectRadius, _EnableDefaultEffectRadius,

                        _IsometricExclusion, _IsometricExclusionDistance, _IsometricExclusionGradientLength,
                        _Ceiling, _CeilingMode, _CeilingBlendMode, _CeilingY, _CeilingPlayerYOffset, _CeilingYGradientLength,
                        _Floor, _FloorMode, _FloorY, _PlayerPosYOffset, _FloorYTextureGradientLength, _AffectedAreaFloor,

                        _AnimationEnabled, _AnimationSpeed,
                        _TransitionDuration,

                        _UseCustomTime,

                        _Zoning, _ZoningMode , _IsZoningRevealable, _ZoningEdgeGradientLength,
                        _SyncZonesWithFloorY, _SyncZonesFloorYOffset,

                        _PreviewMode,
                        _PreviewIndicatorLineThickness,                            

                        _DissolveTex,
                        _DissolveMask,
                        _ObstructionCurve,

                        _DissolveTex_TexelSize,
                        _DissolveMask_TexelSize,
                        _ObstructionCurve_TexelSize,

                        albedo, emission, alphaForClipping);
#endif 
        o.Albedo = albedo;
        o.Emission += emission;   

	}
    void Ext_FinalColorForward1 (Surface o, ShaderData d, inout half4 color)
    {
        #if _REPLACEMENT   
            DoCrossSection(_CrossSectionEnabledGlobal,
                        _CrossSectionColorGlobal,
                        _CrossSectionTextureEnabledGlobal,
                        _CrossSectionTextureGlobal,
                        _CrossSectionTextureScaleGlobal,
                        _CrossSectionUVScaledByDistanceGlobal,
                        d.isFrontFace,
                        d.screenPos,
                        color);
        #else 
            DoCrossSection(_CrossSectionEnabled,
                        _CrossSectionColor,
                        _CrossSectionTextureEnabled,
                        _CrossSectionTexture,
                        _CrossSectionTextureScale,
                        _CrossSectionUVScaledByDistance,
                        d.isFrontFace,
                        d.screenPos,
                        color);
        #endif
    }
            void ChainSurfaceFunction(inout Surface l, inout ShaderData d)
            {
                  Ext_SurfaceFunction0(l, d);
                  Ext_SurfaceFunction1(l, d);
            }

#if !_DECALSHADER

            void ChainModifyVertex(inout VertexData v, inout VertexToPixel v2p, float4 time)
            {
                 ExtraV2F d;
                 ZERO_INITIALIZE(ExtraV2F, d);
                 ZERO_INITIALIZE(Blackboard, d.blackboard);
                 d.time = time;
            }

            void ChainModifyTessellatedVertex(inout VertexData v, inout VertexToPixel v2p)
            {
               ExtraV2F d;
               ZERO_INITIALIZE(ExtraV2F, d);
               ZERO_INITIALIZE(Blackboard, d.blackboard);
            }

            void ChainFinalColorForward(inout Surface l, inout ShaderData d, inout half4 color)
            {
                  Ext_FinalColorForward1(l, d, color);
            }

            void ChainFinalGBufferStandard(inout Surface s, inout ShaderData d, inout half4 GBuffer0, inout half4 GBuffer1, inout half4 GBuffer2, inout half4 outEmission, inout half4 outShadowMask)
            {
            }
#endif
#if _DECALSHADER

        ShaderData CreateShaderData(SurfaceDescriptionInputs IN)
        {
            ShaderData d = (ShaderData)0;
            d.TBNMatrix = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
            d.worldSpaceNormal = IN.WorldSpaceNormal;
            d.worldSpaceTangent = IN.WorldSpaceTangent;

            d.worldSpacePosition = IN.WorldSpacePosition;
            d.texcoord0 = IN.uv0.xyxy;
            d.screenPos = IN.ScreenPosition;

            d.worldSpaceViewDir = normalize(_WorldSpaceCameraPos - d.worldSpacePosition);

            d.tangentSpaceViewDir = mul(d.TBNMatrix, d.worldSpaceViewDir);
            #if _HDRP
            #else
            #endif
             d.screenUV = (IN.ScreenPosition.xy / max(0.01, IN.ScreenPosition.w));
            return d;
        }
#else

         ShaderData CreateShaderData(VertexToPixel i
                  #if NEED_FACING
                     , bool facing
                  #endif
         )
         {
            ShaderData d = (ShaderData)0;
            d.clipPos = i.pos;
            d.worldSpacePosition = i.worldPos;

            d.worldSpaceNormal = normalize(i.worldNormal);
            d.worldSpaceTangent.xyz = normalize(i.worldTangent.xyz);

            d.tangentSign = i.worldTangent.w * unity_WorldTransformParams.w;
            float3 bitangent = cross(d.worldSpaceTangent.xyz, d.worldSpaceNormal) * d.tangentSign;
            d.TBNMatrix = float3x3(d.worldSpaceTangent, -bitangent, d.worldSpaceNormal);
            d.worldSpaceViewDir = normalize(_WorldSpaceCameraPos - i.worldPos);

            d.tangentSpaceViewDir = mul(d.TBNMatrix, d.worldSpaceViewDir);
             d.texcoord0 = i.texcoord0;
             d.texcoord1 = i.texcoord1;
             d.texcoord2 = i.texcoord2;
             d.texcoord3 = i.texcoord3;
             d.isFrontFace = facing;
            #if _HDRP
            #else
            #endif
             d.screenPos = i.screenPos;
             d.screenUV = (i.screenPos.xy / i.screenPos.w);
            return d;
         }

#endif
#if (SHADERPASS == SHADERPASS_LIGHT_TRANSPORT)
   float unity_OneOverOutputBoost;
   float unity_MaxOutputValue;

   CBUFFER_START(UnityMetaPass)
   bool4 unity_MetaVertexControl;
   bool4 unity_MetaFragmentControl;
   CBUFFER_END

   VertexToPixel Vert(VertexData inputMesh)
   {
       VertexToPixel output;
       ZERO_INITIALIZE(VertexToPixel, output);
       UNITY_SETUP_INSTANCE_ID(inputMesh);
       UNITY_TRANSFER_INSTANCE_ID(inputMesh, output);
       UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);
       float2 uv = float2(0.0, 0.0);

       if (unity_MetaVertexControl.x)
       {
           uv = inputMesh.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
       }
       else if (unity_MetaVertexControl.y)
       {
           uv = inputMesh.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
       }
       output.pos = float4(uv * 2.0 - 1.0, inputMesh.vertex.z > 0 ? 1.0e-4 : 0.0, 1.0);

       output.worldPos = TransformObjectToWorld(inputMesh.vertex.xyz).xyz;
       output.worldNormal = TransformObjectToWorldNormal(inputMesh.normal);
       output.worldTangent = float4(1.0, 0.0, 0.0, 0.0);

       output.texcoord0 = inputMesh.texcoord0;
       output.texcoord1 = inputMesh.texcoord1;
       output.texcoord2 = inputMesh.texcoord2;
        output.texcoord3 = inputMesh.texcoord3;
       return output;
   }
#else

   #if (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
      #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariablesMatrixDefsHDCamera.hlsl"

      void MotionVectorPositionZBias(VertexToPixel input)
      {
      #if UNITY_REVERSED_Z
          input.pos.z -= unity_MotionVectorsParams.z * input.pos.w;
      #else
          input.pos.z += unity_MotionVectorsParams.z * input.pos.w;
      #endif
      }

   #endif

   VertexToPixel Vert(VertexData input)
   {
       VertexToPixel output;
       ZERO_INITIALIZE(VertexToPixel, output);

       UNITY_SETUP_INSTANCE_ID(input);
       UNITY_TRANSFER_INSTANCE_ID(input, output);
       UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

       #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))
         VertexData previousMesh = input;
       #endif

       ChainModifyVertex(input, output, _Time);
       float3 positionRWS = TransformObjectToWorld(input.vertex.xyz);
       float3 normalWS = TransformObjectToWorldNormal(input.normal);
       float4 tangentWS = float4(TransformObjectToWorldDir(input.tangent.xyz), input.tangent.w);
       output.worldPos = GetAbsolutePositionWS(positionRWS);
       output.pos = TransformWorldToHClip(positionRWS);
       output.worldNormal = normalWS;
       output.worldTangent = tangentWS;
       output.texcoord0 = input.texcoord0;
       output.texcoord1 = input.texcoord1;
       output.texcoord2 = input.texcoord2;
        output.texcoord3 = input.texcoord3;
        output.screenPos = ComputeScreenPos(output.pos, _ProjectionParams.x);
       #if _HDRP && (_PASSMOTIONVECTOR || ((_PASSFORWARD || _PASSUNLIT) && defined(_WRITE_TRANSPARENT_MOTION_VECTOR)))

          #if !defined(TESSELLATION_ON)
            MotionVectorPositionZBias(output);
          #endif

          output.motionVectorCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(positionRWS.xyz, 1.0));
          bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
          if (forceNoMotion)
          {
              output.previousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
          }
          else
          {
            bool hasDeformation = unity_MotionVectorsParams.x > 0.0; 

            float3 effectivePositionOS = (hasDeformation ? previousMesh.previousPositionOS : previousMesh.vertex.xyz);
            #if defined(_ADD_PRECOMPUTED_VELOCITY)
               effectivePositionOS -= input.precomputedVelocity;
            #endif

            previousMesh.vertex = float4(effectivePositionOS, 1);
            VertexToPixel dummy = (VertexToPixel)0;
            ChainModifyVertex(previousMesh, dummy, _LastTimeParameters);
            float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.vertex.xyz);

            #ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
            if (_TransparentCameraOnlyMotionVectors > 0)
            {
               previousPositionRWS = positionRWS.xyz;
            }
            #endif 

            output.previousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
         }
       #endif 
       return output;
   }
#endif
               #if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
                  #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
               #endif

                FragInputs BuildFragInputs(VertexToPixel input)
                {
                    UNITY_SETUP_INSTANCE_ID(input);
                    FragInputs output;
                    ZERO_INITIALIZE(FragInputs, output);
                    output.tangentToWorld = k_identity3x3;
                    output.positionSS = input.pos;       
                    output.positionRWS = GetCameraRelativePositionWS(input.worldPos);
                    output.tangentToWorld = BuildTangentToWorld(input.worldTangent, input.worldNormal);
                    output.texCoord0 = input.texcoord0;
                    output.texCoord1 = input.texcoord1;
                    output.texCoord2 = input.texcoord2;
                    return output;
                }
               void BuildSurfaceData(FragInputs fragInputs, inout Surface surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
               {
                   ZERO_INITIALIZE(SurfaceData, surfaceData);
                   surfaceData.specularOcclusion = 1.0;
                   surfaceData.baseColor =                 surfaceDescription.Albedo;
                   surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;
                   surfaceData.ambientOcclusion =          surfaceDescription.Occlusion;
                   surfaceData.specularOcclusion =         surfaceDescription.SpecularOcclusion;
                   surfaceData.metallic =                  surfaceDescription.Metallic;
                   surfaceData.subsurfaceMask =            surfaceDescription.SubsurfaceMask;
                   surfaceData.thickness =                 surfaceDescription.Thickness;
                   surfaceData.diffusionProfileHash =      asuint(surfaceDescription.DiffusionProfileHash);
                   #if _USESPECULAR
                      surfaceData.specularColor =             surfaceDescription.Specular;
                   #endif
                   surfaceData.coatMask =                  surfaceDescription.CoatMask;
                   surfaceData.anisotropy =                surfaceDescription.Anisotropy;
                   surfaceData.iridescenceMask =           surfaceDescription.IridescenceMask;
                   surfaceData.iridescenceThickness =      surfaceDescription.IridescenceThickness;
                   #if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
                        if (_EnableSSRefraction)
                        {
                            surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
                            surfaceDescription.Alpha = 1.0;
                        }
                        else
                        {
                            surfaceData.ior = surfaceDescription.ior;
                            surfaceData.transmittanceColor = surfaceDescription.transmittanceColor;
                            surfaceData.atDistance = surfaceDescription.atDistance;
                            surfaceData.transmittanceMask = surfaceDescription.transmittanceMask;
                            surfaceDescription.Alpha = 1.0;
                        }
                    #else
                        surfaceData.ior = 1.0;
                        surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
                        surfaceData.atDistance = 1.0;
                        surfaceData.transmittanceMask = 0.0;
                    #endif
                    surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
                    #ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
                    #endif
                    #ifdef _MATERIAL_FEATURE_TRANSMISSION
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
                    #endif
                    #ifdef _MATERIAL_FEATURE_ANISOTROPY
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
                        surfaceData.normalWS = float3(0, 1, 0);
                    #endif
                    #ifdef _MATERIAL_FEATURE_IRIDESCENCE
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
                    #endif
                    #ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
                    #endif
                    #if defined(_MATERIAL_FEATURE_CLEAR_COAT) || _CLEARCOAT
                        surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
                    #endif
                    #if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                        surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
                    #endif
                   #if !_WORLDSPACENORMAL
                      surfaceData.normalWS = mul(surfaceDescription.Normal, fragInputs.tangentToWorld);
                   #else
                      surfaceData.normalWS = surfaceDescription.Normal;
                   #endif

                   surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
                   surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    
                    #if HAVE_DECALS
                        if (_EnableDecals)
                        {
                            float alpha = 1.0;
                            alpha = surfaceDescription.Alpha;
                            DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], alpha);
                            ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
                        }
                    #endif
                    bentNormalWS = surfaceData.normalWS;
                    surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);
                    #ifdef DEBUG_DISPLAY
                        if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
                        {
                            surfaceData.metallic = 0;
                        }
                        ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
                    #endif
                    #if defined(_SPECULAR_OCCLUSION_CUSTOM)
                    #elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                        surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
                    #elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
                        surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
                    #endif
                    #if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
                        surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
                    #endif
               }
               void GetSurfaceAndBuiltinData(VertexToPixel m2ps, FragInputs fragInputs, float3 V, inout PositionInputs posInput,
                     out SurfaceData surfaceData, out BuiltinData builtinData, inout Surface l, inout ShaderData d
                     #if NEED_FACING
                        , bool facing
                     #endif
                  )
               {
                 d = CreateShaderData(m2ps
                    #if NEED_FACING
                       , facing
                    #endif
                 );

                 l = (Surface)0;

                 l.Albedo = half3(0.5, 0.5, 0.5);
                 l.Normal = float3(0,0,1);
                 l.Occlusion = 1;
                 l.Alpha = 1;
                 l.SpecularOcclusion = 1;

                 #if !defined(SHADER_STAGE_RAY_TRACING) && defined(_DEPTHOFFSET_ON)
                    l.outputDepth = d.clipPos.z;
                 #endif

                 ChainSurfaceFunction(l, d);

                 #if !defined(SHADER_STAGE_RAY_TRACING) && defined(_DEPTHOFFSET_ON)
                 #endif

                 #if _UNLIT
                     l.Normal = half3(0,0,1);
                     l.Occlusion = 1;
                     l.Metallic = 0;
                     l.Specular = 0;
                 #endif

                 surfaceData.geomNormalWS = d.worldSpaceNormal;
                 surfaceData.tangentWS = d.worldSpaceTangent;
                 fragInputs.tangentToWorld = d.TBNMatrix;

                 float3 bentNormalWS;
                 BuildSurfaceData(fragInputs, l, V, posInput, surfaceData, bentNormalWS);
                 InitBuiltinData(posInput, l.Alpha, bentNormalWS, -d.worldSpaceNormal, fragInputs.texCoord1, fragInputs.texCoord2, builtinData);
                 builtinData.emissiveColor = l.Emission;

                 #if defined(_OVERRIDE_BAKEDGI)
                    builtinData.bakeDiffuseLighting = l.DiffuseGI;
                    builtinData.backBakeDiffuseLighting = l.BackDiffuseGI;
                    builtinData.emissiveColor += l.SpecularGI;
                 #endif

                 #if defined(_OVERRIDE_SHADOWMASK)
                    builtinData.shadowMask0 = l.ShadowMask.x;
                    builtinData.shadowMask1 = l.ShadowMask.y;
                    builtinData.shadowMask2 = l.ShadowMask.z;
                    builtinData.shadowMask3 = l.ShadowMask.w;
                 #endif

                 #if defined(UNITY_VIRTUAL_TEXTURING)
                    builtinData.vtPackedFeedback = surfaceData.VTPackedFeedback;
                 #endif

                  #if (SHADERPASS == SHADERPASS_DISTORTION)
                     builtinData.distortion = surfaceData.Distortion;
                     builtinData.distortionBlur = surfaceData.DistortionBlur;
                  #endif

                  #ifndef SHADER_UNLIT
                    PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                  #else
                    ApplyDebugToBuiltinData(builtinData);
                  #endif
                  RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
               }
#define DEBUG_DISPLAY
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/FullScreenDebug.hlsl"

         #if !defined(_DEPTHOFFSET_ON)
         [earlydepthstencil] 
         #endif
         void Frag(VertexToPixel v2f
            #if NEED_FACING
               , bool facing : SV_IsFrontFace
            #endif
         )
         {
             UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(v2f);
             FragInputs input = BuildFragInputs(v2f);

             PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz);

         #ifdef PLATFORM_SUPPORTS_PRIMITIVE_ID_IN_PIXEL_SHADER
             if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_QUAD_OVERDRAW)
             {
                 IncrementQuadOverdrawCounter(posInput.positionSS.xy, input.primitiveID);
             }
         #endif
         }

            ENDHLSL
        }
   }
   CustomEditor "ShaderCrew.SeeThroughShader.StandardLitSeeThroughShaderEditor"
}
