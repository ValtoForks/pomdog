{
  'includes': ['common.gypi'],
  'variables': {
    'pomdog_third_party_dir%': '../third-party',
    'pomdog_expr_dir': '../experimental/Pomdog.Experimental',
    'pomdog_experimental_sources': [
      '<@(pomdog_expr_dir)/Experimental.hpp',

      '<@(pomdog_expr_dir)/Actions/Action.hpp',
      '<@(pomdog_expr_dir)/Actions/MoveToAction.hpp',
      '<@(pomdog_expr_dir)/Actions/RemoveActorAction.hpp',
      '<@(pomdog_expr_dir)/Actions/RotateToAction.hpp',
      '<@(pomdog_expr_dir)/Actions/ScaleToAction.hpp',
      '<@(pomdog_expr_dir)/Actions/SequenceAction.hpp',
      '<@(pomdog_expr_dir)/Actions/TintToAction.hpp',
      '<@(pomdog_expr_dir)/Actions/detail/TemporalAction.hpp',

    #   '<@(pomdog_expr_dir)/Compositing/RenderLayer.cpp',
    #   '<@(pomdog_expr_dir)/Compositing/RenderLayer.hpp',
    #   '<@(pomdog_expr_dir)/Compositing/RenderLayerCompositor.cpp',
    #   '<@(pomdog_expr_dir)/Compositing/RenderLayerCompositor.hpp',

      '<@(pomdog_expr_dir)/Gameplay/Component.hpp',
      '<@(pomdog_expr_dir)/Gameplay/Entity.cpp',
      '<@(pomdog_expr_dir)/Gameplay/Entity.hpp',
      '<@(pomdog_expr_dir)/Gameplay/EntityContext.cpp',
      '<@(pomdog_expr_dir)/Gameplay/EntityContext.hpp',
      '<@(pomdog_expr_dir)/Gameplay/EntityID.hpp',
      '<@(pomdog_expr_dir)/Gameplay/EntityManager.cpp',
      '<@(pomdog_expr_dir)/Gameplay/EntityManager.hpp',
      '<@(pomdog_expr_dir)/Gameplay/Scene.cpp',
      '<@(pomdog_expr_dir)/Gameplay/Scene.hpp',
      '<@(pomdog_expr_dir)/Gameplay/detail/ComponentTypeIndex.cpp',
      '<@(pomdog_expr_dir)/Gameplay/detail/ComponentTypeIndex.hpp',

      '<@(pomdog_expr_dir)/Gameplay2D/ActorComponent.cpp',
      '<@(pomdog_expr_dir)/Gameplay2D/ActorComponent.hpp',
      '<@(pomdog_expr_dir)/Gameplay2D/Animator.cpp',
      '<@(pomdog_expr_dir)/Gameplay2D/Animator.hpp',
    #   '<@(pomdog_expr_dir)/Gameplay2D/BeamRenderable.cpp',
    #   '<@(pomdog_expr_dir)/Gameplay2D/BeamRenderable.hpp',
      '<@(pomdog_expr_dir)/Gameplay2D/CameraComponent.cpp',
      '<@(pomdog_expr_dir)/Gameplay2D/CameraComponent.hpp',
      '<@(pomdog_expr_dir)/Gameplay2D/Collider2D.cpp',
      '<@(pomdog_expr_dir)/Gameplay2D/Collider2D.hpp',
      '<@(pomdog_expr_dir)/Gameplay2D/GameLevel.hpp',
      '<@(pomdog_expr_dir)/Gameplay2D/GraphicsComponent.cpp',
      '<@(pomdog_expr_dir)/Gameplay2D/GraphicsComponent.hpp',
      '<@(pomdog_expr_dir)/Gameplay2D/HierarchyNode.cpp',
      '<@(pomdog_expr_dir)/Gameplay2D/HierarchyNode.hpp',
    #   '<@(pomdog_expr_dir)/Gameplay2D/ParticleRenderable.cpp',
    #   '<@(pomdog_expr_dir)/Gameplay2D/ParticleRenderable.hpp',
      '<@(pomdog_expr_dir)/Gameplay2D/PrimitiveRenderable.cpp',
      '<@(pomdog_expr_dir)/Gameplay2D/PrimitiveRenderable.hpp',
    #   '<@(pomdog_expr_dir)/Gameplay2D/RectangleRenderable.cpp',
    #   '<@(pomdog_expr_dir)/Gameplay2D/RectangleRenderable.hpp',
      '<@(pomdog_expr_dir)/Gameplay2D/Simple2DGameEngine.cpp',
      '<@(pomdog_expr_dir)/Gameplay2D/Simple2DGameEngine.hpp',
    #   '<@(pomdog_expr_dir)/Gameplay2D/SkinnedMeshRenderable.cpp',
    #   '<@(pomdog_expr_dir)/Gameplay2D/SkinnedMeshRenderable.hpp',
      '<@(pomdog_expr_dir)/Gameplay2D/SpriteRenderable.cpp',
      '<@(pomdog_expr_dir)/Gameplay2D/SpriteRenderable.hpp',
      '<@(pomdog_expr_dir)/Gameplay2D/TextRenderable.cpp',
      '<@(pomdog_expr_dir)/Gameplay2D/TextRenderable.hpp',
      '<@(pomdog_expr_dir)/Gameplay2D/Transform.cpp',
      '<@(pomdog_expr_dir)/Gameplay2D/Transform.hpp',

      '<@(pomdog_expr_dir)/Graphics/LineBatch.cpp',
      '<@(pomdog_expr_dir)/Graphics/LineBatch.hpp',
      '<@(pomdog_expr_dir)/Graphics/PolygonBatch.cpp',
      '<@(pomdog_expr_dir)/Graphics/PolygonBatch.hpp',
      '<@(pomdog_expr_dir)/Graphics/PolygonShapeBuilder.cpp',
      '<@(pomdog_expr_dir)/Graphics/PolygonShapeBuilder.hpp',
      '<@(pomdog_expr_dir)/Graphics/ScreenQuad.cpp',
      '<@(pomdog_expr_dir)/Graphics/ScreenQuad.hpp',
    #   '<@(pomdog_expr_dir)/Graphics/SkinnedEffect.cpp',
    #   '<@(pomdog_expr_dir)/Graphics/SkinnedEffect.hpp',
      '<@(pomdog_expr_dir)/Graphics/SpriteBatchRenderer.cpp',
      '<@(pomdog_expr_dir)/Graphics/SpriteBatchRenderer.hpp',
      '<@(pomdog_expr_dir)/Graphics/SpriteFont.cpp',
      '<@(pomdog_expr_dir)/Graphics/SpriteFont.hpp',
      '<@(pomdog_expr_dir)/Graphics/SpriteFontLoader.cpp',
      '<@(pomdog_expr_dir)/Graphics/SpriteFontLoader.hpp',
    #   '<@(pomdog_expr_dir)/Graphics/SpriteLine.cpp',
    #   '<@(pomdog_expr_dir)/Graphics/SpriteLine.hpp',
      '<@(pomdog_expr_dir)/Graphics/SpriteSortMode.hpp',
    #   '<@(pomdog_expr_dir)/Graphics/SpriteRenderer.cpp',
    #   '<@(pomdog_expr_dir)/Graphics/SpriteRenderer.hpp',
      '<@(pomdog_expr_dir)/Graphics/TrueTypeFont.cpp',
      '<@(pomdog_expr_dir)/Graphics/TrueTypeFont.hpp',

      '<@(pomdog_expr_dir)/ImageEffects/ChromaticAberration.cpp',
      '<@(pomdog_expr_dir)/ImageEffects/ChromaticAberration.hpp',
      '<@(pomdog_expr_dir)/ImageEffects/FishEyeEffect.cpp',
      '<@(pomdog_expr_dir)/ImageEffects/FishEyeEffect.hpp',
      '<@(pomdog_expr_dir)/ImageEffects/FXAA.cpp',
      '<@(pomdog_expr_dir)/ImageEffects/FXAA.hpp',
      '<@(pomdog_expr_dir)/ImageEffects/GrayscaleEffect.cpp',
      '<@(pomdog_expr_dir)/ImageEffects/GrayscaleEffect.hpp',
      '<@(pomdog_expr_dir)/ImageEffects/ImageEffectBase.hpp',
      '<@(pomdog_expr_dir)/ImageEffects/PostProcessCompositor.cpp',
      '<@(pomdog_expr_dir)/ImageEffects/PostProcessCompositor.hpp',
      '<@(pomdog_expr_dir)/ImageEffects/RetroCrtEffect.cpp',
      '<@(pomdog_expr_dir)/ImageEffects/RetroCrtEffect.hpp',
      '<@(pomdog_expr_dir)/ImageEffects/SepiaToneEffect.cpp',
      '<@(pomdog_expr_dir)/ImageEffects/SepiaToneEffect.hpp',
      '<@(pomdog_expr_dir)/ImageEffects/VignetteEffect.cpp',
      '<@(pomdog_expr_dir)/ImageEffects/VignetteEffect.hpp',

    #   '<@(pomdog_expr_dir)/InGameEditor/InGameEditor.cpp',
    #   '<@(pomdog_expr_dir)/InGameEditor/InGameEditor.hpp',
    #   '<@(pomdog_expr_dir)/InGameEditor/detail/EditorBackground.cpp',
    #   '<@(pomdog_expr_dir)/InGameEditor/detail/EditorBackground.hpp',
      '<@(pomdog_expr_dir)/InGameEditor/detail/EditorColorScheme.hpp',
    #   '<@(pomdog_expr_dir)/InGameEditor/detail/PrimitiveAxes.cpp',
    #   '<@(pomdog_expr_dir)/InGameEditor/detail/PrimitiveAxes.hpp',
    #   '<@(pomdog_expr_dir)/InGameEditor/detail/PrimitiveGrid.cpp',
    #   '<@(pomdog_expr_dir)/InGameEditor/detail/PrimitiveGrid.hpp',

      '<@(pomdog_expr_dir)/MagicaVoxel/VoxModel.hpp',
      '<@(pomdog_expr_dir)/MagicaVoxel/VoxModelLoader.cpp',
      '<@(pomdog_expr_dir)/MagicaVoxel/VoxModelLoader.hpp',
      '<@(pomdog_expr_dir)/MagicaVoxel/VoxModelExporter.cpp',
      '<@(pomdog_expr_dir)/MagicaVoxel/VoxModelExporter.hpp',
      '<@(pomdog_expr_dir)/MagicaVoxel/detail/VoxChunkHeader.hpp',

      '<@(pomdog_expr_dir)/Particle2D/Beam.hpp',
      '<@(pomdog_expr_dir)/Particle2D/BeamBranching.hpp',
      '<@(pomdog_expr_dir)/Particle2D/BeamEmitter.hpp',
      '<@(pomdog_expr_dir)/Particle2D/BeamSystem.cpp',
      '<@(pomdog_expr_dir)/Particle2D/BeamSystem.hpp',
      '<@(pomdog_expr_dir)/Particle2D/Particle.hpp',
      '<@(pomdog_expr_dir)/Particle2D/ParticleClip.cpp',
      '<@(pomdog_expr_dir)/Particle2D/ParticleClip.hpp',
      '<@(pomdog_expr_dir)/Particle2D/ParticleEmitter.hpp',
      '<@(pomdog_expr_dir)/Particle2D/ParticleLoader.cpp',
      '<@(pomdog_expr_dir)/Particle2D/ParticleLoader.hpp',
      '<@(pomdog_expr_dir)/Particle2D/ParticleSystem.cpp',
      '<@(pomdog_expr_dir)/Particle2D/ParticleSystem.hpp',
      '<@(pomdog_expr_dir)/Particle2D/detail/ParticleCurveKey.hpp',
      '<@(pomdog_expr_dir)/Particle2D/detail/ParticleCurveLerp.hpp',
      '<@(pomdog_expr_dir)/Particle2D/detail/ParticleEmitterShape.hpp',
      '<@(pomdog_expr_dir)/Particle2D/detail/ParticleEmitterShapeBox.hpp',
      '<@(pomdog_expr_dir)/Particle2D/detail/ParticleEmitterShapeSector.hpp',
      '<@(pomdog_expr_dir)/Particle2D/detail/ParticleParameter.hpp',
      '<@(pomdog_expr_dir)/Particle2D/detail/ParticleParameterConstant.hpp',
      '<@(pomdog_expr_dir)/Particle2D/detail/ParticleParameterCurve.hpp',
      '<@(pomdog_expr_dir)/Particle2D/detail/ParticleParameterRandom.hpp',
      '<@(pomdog_expr_dir)/Particle2D/detail/ParticleParameterRandomCurves.hpp',

      '<@(pomdog_expr_dir)/Skeletal2D/AnimationBlendInput.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/AnimationBlendInputType.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/AnimationClip.cpp',
      '<@(pomdog_expr_dir)/Skeletal2D/AnimationClip.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/AnimationGraph.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/AnimationNode.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/AnimationState.cpp',
      '<@(pomdog_expr_dir)/Skeletal2D/AnimationState.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/AnimationSystem.cpp',
      '<@(pomdog_expr_dir)/Skeletal2D/AnimationSystem.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/AnimationTimeInterval.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/AnimationTrack.cpp',
      '<@(pomdog_expr_dir)/Skeletal2D/AnimationTrack.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/CompressedFloat.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/Joint.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/JointIndex.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/JointPose.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/RigidSlot.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/RotationTrack.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/ScaleTrack.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/Skeleton.cpp',
      '<@(pomdog_expr_dir)/Skeletal2D/Skeleton.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/SkeletonHelper.cpp',
      '<@(pomdog_expr_dir)/Skeletal2D/SkeletonHelper.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/SkeletonPose.cpp',
      '<@(pomdog_expr_dir)/Skeletal2D/SkeletonPose.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/SkeletonTransform.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/Skin.cpp',
      '<@(pomdog_expr_dir)/Skeletal2D/Skin.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/SkinnedMesh.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/SkinnedMeshPart.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/SkinnedVertex.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/SpriteAnimationTrack.cpp',
      '<@(pomdog_expr_dir)/Skeletal2D/SpriteAnimationTrack.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/TranslationTrack.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/detail/AnimationAdditiveNode.cpp',
      '<@(pomdog_expr_dir)/Skeletal2D/detail/AnimationAdditiveNode.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/detail/AnimationClipNode.cpp',
      '<@(pomdog_expr_dir)/Skeletal2D/detail/AnimationClipNode.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/detail/AnimationGraphWeight.cpp',
      '<@(pomdog_expr_dir)/Skeletal2D/detail/AnimationGraphWeight.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/detail/AnimationGraphWeightCollection.cpp',
      '<@(pomdog_expr_dir)/Skeletal2D/detail/AnimationGraphWeightCollection.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/detail/AnimationKeyHelper.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/detail/AnimationLerpNode.cpp',
      '<@(pomdog_expr_dir)/Skeletal2D/detail/AnimationLerpNode.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/detail/AnimationTimer.cpp',
      '<@(pomdog_expr_dir)/Skeletal2D/detail/AnimationTimer.hpp',
      '<@(pomdog_expr_dir)/Skeletal2D/detail/WeightBlendingHelper.cpp',
      '<@(pomdog_expr_dir)/Skeletal2D/detail/WeightBlendingHelper.hpp',

      '<@(pomdog_expr_dir)/Spine/AnimationGraphBuilder.cpp',
      '<@(pomdog_expr_dir)/Spine/AnimationGraphBuilder.hpp',
      '<@(pomdog_expr_dir)/Spine/AnimationLoader.cpp',
      '<@(pomdog_expr_dir)/Spine/AnimationLoader.hpp',
      '<@(pomdog_expr_dir)/Spine/SkeletonDesc.hpp',
      '<@(pomdog_expr_dir)/Spine/SkeletonDescLoader.cpp',
      '<@(pomdog_expr_dir)/Spine/SkeletonDescLoader.hpp',
      '<@(pomdog_expr_dir)/Spine/SkeletonLoader.cpp',
      '<@(pomdog_expr_dir)/Spine/SkeletonLoader.hpp',
      '<@(pomdog_expr_dir)/Spine/SkinLoader.cpp',
      '<@(pomdog_expr_dir)/Spine/SkinLoader.hpp',
      '<@(pomdog_expr_dir)/Spine/SkinnedMeshLoader.cpp',
      '<@(pomdog_expr_dir)/Spine/SkinnedMeshLoader.hpp',
      '<@(pomdog_expr_dir)/Spine/SpriteAnimationLoader.cpp',
      '<@(pomdog_expr_dir)/Spine/SpriteAnimationLoader.hpp',

      '<@(pomdog_expr_dir)/Tween/EasingHelper.cpp',
      '<@(pomdog_expr_dir)/Tween/EasingHelper.hpp',

      '<@(pomdog_expr_dir)/Rendering/RenderCommand.hpp',
      '<@(pomdog_expr_dir)/Rendering/RenderCommandProcessor.hpp',
      '<@(pomdog_expr_dir)/Rendering/Renderer.cpp',
      '<@(pomdog_expr_dir)/Rendering/Renderer.hpp',
    #   '<@(pomdog_expr_dir)/Rendering/Commands/ParticleBatchCommand.cpp',
    #   '<@(pomdog_expr_dir)/Rendering/Commands/ParticleBatchCommand.hpp',
      '<@(pomdog_expr_dir)/Rendering/Commands/PrimitiveCommand.cpp',
      '<@(pomdog_expr_dir)/Rendering/Commands/PrimitiveCommand.hpp',
      '<@(pomdog_expr_dir)/Rendering/Commands/PrimitivePolygonCommand.cpp',
      '<@(pomdog_expr_dir)/Rendering/Commands/PrimitivePolygonCommand.hpp',
    #   '<@(pomdog_expr_dir)/Rendering/Commands/SkinnedMeshCommand.cpp',
    #   '<@(pomdog_expr_dir)/Rendering/Commands/SkinnedMeshCommand.hpp',
      '<@(pomdog_expr_dir)/Rendering/Commands/SpriteBatchCommand.cpp',
      '<@(pomdog_expr_dir)/Rendering/Commands/SpriteBatchCommand.hpp',
    #   '<@(pomdog_expr_dir)/Rendering/Processors/ParticleBatchCommandProcessor.cpp',
    #   '<@(pomdog_expr_dir)/Rendering/Processors/ParticleBatchCommandProcessor.hpp',
      '<@(pomdog_expr_dir)/Rendering/Processors/PrimitiveCommandProcessor.cpp',
      '<@(pomdog_expr_dir)/Rendering/Processors/PrimitiveCommandProcessor.hpp',
      '<@(pomdog_expr_dir)/Rendering/Processors/PrimitivePolygonCommandProcessor.cpp',
      '<@(pomdog_expr_dir)/Rendering/Processors/PrimitivePolygonCommandProcessor.hpp',
    #   '<@(pomdog_expr_dir)/Rendering/Processors/SkinnedMeshCommandProcessor.cpp',
    #   '<@(pomdog_expr_dir)/Rendering/Processors/SkinnedMeshCommandProcessor.hpp',
      '<@(pomdog_expr_dir)/Rendering/Processors/SpriteBatchCommandProcessor.cpp',
      '<@(pomdog_expr_dir)/Rendering/Processors/SpriteBatchCommandProcessor.hpp',

      '<@(pomdog_expr_dir)/UI/DebugNavigator.cpp',
      '<@(pomdog_expr_dir)/UI/DebugNavigator.hpp',
      '<@(pomdog_expr_dir)/UI/DrawingContext.cpp',
      '<@(pomdog_expr_dir)/UI/DrawingContext.hpp',
      '<@(pomdog_expr_dir)/UI/FontSize.hpp',
      '<@(pomdog_expr_dir)/UI/FontWeight.hpp',
      '<@(pomdog_expr_dir)/UI/HorizontalAlignment.hpp',
      '<@(pomdog_expr_dir)/UI/PointerEventType.hpp',
      '<@(pomdog_expr_dir)/UI/PointerPoint.hpp',
      '<@(pomdog_expr_dir)/UI/ScenePanel.cpp',
      '<@(pomdog_expr_dir)/UI/ScenePanel.hpp',
      '<@(pomdog_expr_dir)/UI/Slider.cpp',
      '<@(pomdog_expr_dir)/UI/Slider.hpp',
      '<@(pomdog_expr_dir)/UI/StackPanel.cpp',
      '<@(pomdog_expr_dir)/UI/StackPanel.hpp',
      '<@(pomdog_expr_dir)/UI/TextBlock.cpp',
      '<@(pomdog_expr_dir)/UI/TextBlock.hpp',
      '<@(pomdog_expr_dir)/UI/Thickness.hpp',
      '<@(pomdog_expr_dir)/UI/ToggleSwitch.cpp',
      '<@(pomdog_expr_dir)/UI/ToggleSwitch.hpp',
      '<@(pomdog_expr_dir)/UI/UIElement.cpp',
      '<@(pomdog_expr_dir)/UI/UIElement.hpp',
      '<@(pomdog_expr_dir)/UI/UIElementHierarchy.cpp',
      '<@(pomdog_expr_dir)/UI/UIElementHierarchy.hpp',
      '<@(pomdog_expr_dir)/UI/UIEventDispatcher.cpp',
      '<@(pomdog_expr_dir)/UI/UIEventDispatcher.hpp',
      '<@(pomdog_expr_dir)/UI/UIHelper.hpp',
      '<@(pomdog_expr_dir)/UI/VerticalAlignment.hpp',
      '<@(pomdog_expr_dir)/UI/detail/SubscribeRequestDispatcher.hpp',
      '<@(pomdog_expr_dir)/UI/detail/UIEventConnection.hpp',

      '<@(pomdog_expr_dir)/Utility/UserPreferences.cpp',
      '<@(pomdog_expr_dir)/Utility/UserPreferences.hpp',
    ],
  },
  'target_defaults': {
    'configurations': {
      'Debug': {
        'msbuild_settings': {
          'Link': {
            'GenerateDebugInformation': 'true', # /DEBUG
          },
        },
      },
    },
    'msbuild_settings':{
      'ClCompile': {
        'WarningLevel': 'Level4', # /W4
        #'TreatWarningAsError': 'true', # /WX
      },
    },
    'xcode_settings': {
      'GCC_VERSION': 'com.apple.compilers.llvm.clang.1_0',
      'CLANG_CXX_LANGUAGE_STANDARD': 'c++14',
      'CLANG_CXX_LIBRARY': 'libc++', # libc++ requires OS X 10.7 or later
      #'SKIP_INSTALL': 'NO',
      # Warnings:
      'CLANG_WARN_EMPTY_BODY': 'YES',
      'GCC_WARN_64_TO_32_BIT_CONVERSION': 'YES',
      'GCC_WARN_ABOUT_DEPRECATED_FUNCTIONS': 'YES',
      'GCC_WARN_ABOUT_MISSING_FIELD_INITIALIZERS': 'YES',
      'GCC_WARN_ABOUT_MISSING_NEWLINE': 'YES',
      'GCC_WARN_ABOUT_RETURN_TYPE': 'YES',
      'GCC_WARN_CHECK_SWITCH_STATEMENTS': 'YES',
      'GCC_WARN_HIDDEN_VIRTUAL_FUNCTIONS': 'YES',
      #'GCC_WARN_INITIALIZER_NOT_FULLY_BRACKETED': 'YES',
      'GCC_WARN_MISSING_PARENTHESES': 'YES',
      'GCC_WARN_NON_VIRTUAL_DESTRUCTOR': 'YES',
      'GCC_WARN_SHADOW': 'YES',
      'GCC_WARN_SIGN_COMPARE': 'YES',
      'GCC_WARN_TYPECHECK_CALLS_TO_PRINTF': 'YES',
      'GCC_WARN_UNINITIALIZED_AUTOS': 'YES',
      'GCC_WARN_UNKNOWN_PRAGMAS': 'YES',
      'GCC_WARN_UNUSED_FUNCTION': 'YES',
      'GCC_WARN_UNUSED_LABEL': 'YES',
      'GCC_WARN_UNUSED_VALUE': 'YES',
      'GCC_WARN_UNUSED_VARIABLE': 'YES',
      'GCC_TREAT_WARNINGS_AS_ERRORS': 'YES',
      # Symbols:
      'CLANG_ENABLE_OBJC_ARC': 'YES',
      'GCC_INLINES_ARE_PRIVATE_EXTERN': 'YES', # '-fvisibility-inlines-hidden'
      'GCC_SYMBOLS_PRIVATE_EXTERN': 'YES', # '-fvisibility=hidden'
    },
    'conditions': [
      ['OS == "mac"', {
        'xcode_settings': {
          'MACOSX_DEPLOYMENT_TARGET': '10.11',
        },
      }],
      ['OS == "ios"', {
        'xcode_settings': {
          'IPHONEOS_DEPLOYMENT_TARGET': '8.3',
          'SDKROOT': 'iphoneos',
        },
      }],
    ],
  },
  'targets': [
    {
      'target_name': 'pomdog_experimental',
      'product_name': 'pomdog_experimental',
      'type': 'static_library',
      'include_dirs': [
        '../experimental',
        '../include',
        '../dependencies/rapidjson/include',
        '../dependencies/stb',
        '../dependencies',
      ],
      'sources': [
        '<@(pomdog_experimental_sources)',
      ],
      'xcode_settings': {
        'SKIP_INSTALL': 'YES',
      },
      'conditions': [
        ['component == "shared_library"', {
          'dependencies': [
            'pomdog.gyp:pomdog-shared',
          ],
          'defines': [
            'POMDOG_USING_LIBRARY_EXPORTS=1',
          ],
        }, {
          'dependencies': [
            'pomdog.gyp:pomdog-static',
          ],
        }],
      ],
    },
  ],
}
