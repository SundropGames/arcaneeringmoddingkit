# Arcaneering Modding Kit

Create mods for Arcaneering: Beyond Automation using this standalone Godot project.

## Security Notice

**This modding system is security-safe.** Unlike typical Godot resource loading, mod `.tres` files are never executed as code. Instead, they are read as plain text and manually parsed for properties only. The export process strips all script references and ExtResource links, ensuring no arbitrary code execution is possible.

## Quick Start

1. **Add assets** to `assets/icons/` and `assets/meshes/`
2. **Create mod content** in `working/` folders using the ModKit classes
3. **Run export tool** (Tools → Execute Script → mod_export_tool.gd)
4. **Copy exported mod** from `exported_mods/` to game's `user://mods/`

## File Structure

```
ArcaneeringModdingKit/
├── working/              # Create your .tres files here
│   ├── resources/        # ModKitResourceData
│   ├── recipes/          # ModKitRecipe  
│   ├── research/         # ModKitResearchData
│   └── objectives/       # ModKitObjectiveData
├── assets/               # Put your game assets here
│   ├── icons/            # .png icon files
│   └── meshes/           # .res mesh files
└── exported_mods/        # Generated mods appear here
```

## Creating Content

### Resources
1. Create → Resource → ModKitResourceData
2. Set ID, name, stack limit, market price
3. Set icon: `preload("res://assets/icons/[resource_id]_icon.png")`
4. Set mesh: `preload("res://assets/meshes/[resource_id].res")`
5. Save to `working/resources/[resource_id].tres`

**Important**: Assets must follow naming convention:
- Icons: `[resource_id]_icon.png` (e.g., `quantum_crystal_icon.png`)
- Meshes: `[resource_id].res` (e.g., `quantum_crystal.res`)

### Recipes  
1. Create → Resource → ModKitRecipe
2. Set inputs/outputs using resource IDs (0-999 for base game, 1000+ for modded resources)
3. Include building type in ID (e.g., "smelter_quantum_processing")
4. Save to `working/recipes/`

### Research
1. Create → Resource → ModKitResearchData  
2. Set dependencies, costs, effects
3. Save to `working/research/`

### Objectives
1. Create → Resource → ModKitObjectiveData
2. Set check types, targets, rewards
3. Save to `working/objectives/`

## Asset Guidelines

### Icons
- Format: PNG, 128x128 pixels
- Style: Match game's industrial minimalism
- Naming: `[resource_id]_icon.png`

### Meshes
- Format: .res (Godot resource)
- Scale: Similar to existing resources (Ore sphere: radius 0.4, height 0.8)
- Naming: `[resource_id].res`

## Export Process

1. Run `mod_export_tool.gd` script
2. Tool creates proper mod structure in `exported_mods/`
3. Converts ModKit classes to game classes
4. Removes ExtResource references and prepares assets for runtime loading
5. Generates `mod.json` automatically

## Asset Loading

The export system now handles assets specially:
- Icons and meshes are loaded at runtime from mod files
- No ExtResource references in exported .tres files
- Assets are loaded by naming convention during mod loading

## Troubleshooting

### Common Issues
- **"Unable to open file" errors**: Check asset naming convention
- **"Failed loading resource" errors**: Ensure assets exist in correct directories
- **Missing icons/meshes**: Assets will fall back to defaults if not found

### Asset Problems
- Verify icon files are named `[resource_id]_icon.png`
- Verify mesh files are named `[resource_id].res`  
- Check that assets exist in `assets/icons/` and `assets/meshes/`

## Cleanup

Run `mod_cleanup_tool.gd` to delete all working files and start fresh.

## Tips

- Use descriptive IDs: "quantum_crystal" not "qc"
- Follow naming conventions strictly for assets
- Resource IDs 1000-1009 are reserved for mods
- Building IDs 1000-1009 are reserved for mods
- Test exported mods in actual game before sharing
- Icons and meshes are optional - defaults will be used if missing