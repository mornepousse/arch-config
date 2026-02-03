-- Host configuration for archlinux
-- Work Laptop
-- See LUA-HOSTS.md for full documentation

local is_laptop = dcli.hardware.is_laptop()
local memory_mb = dcli.system.memory_total_mb()

dcli.log.info(string.format("Loading config for archlinux (%d MB RAM)", memory_mb))

-- ═══════════════════════════════════════════════════════════════════
-- MODULE SELECTION
-- ═══════════════════════════════════════════════════════════════════

local enabled_modules = {
    "base",
    -- Add your modules here
}

-- Example: Add GPU drivers based on hardware detection
-- if dcli.hardware.has_nvidia() then
--     table.insert(enabled_modules, "nvidia-drivers")
-- elseif dcli.hardware.has_amd_gpu() then
--     table.insert(enabled_modules, "amd-drivers")
-- end

-- Example: Add laptop-specific modules
-- if is_laptop then
--     table.insert(enabled_modules, "laptop-power")
-- end

-- ═══════════════════════════════════════════════════════════════════
-- SERVICES
-- ═══════════════════════════════════════════════════════════════════

local services = {
    enabled = {},
    disabled = {},
}

-- Example: Enable docker if module is enabled
-- if dcli.util.contains(enabled_modules, "docker") then
--     table.insert(services.enabled, "docker.service")
-- end

-- ═══════════════════════════════════════════════════════════════════
-- RETURN CONFIGURATION
-- ═══════════════════════════════════════════════════════════════════

return {
    host = "archlinux",
    description = "Work Laptop",

    enabled_modules = enabled_modules,

    -- Host-specific packages (in addition to modules)
    packages = {},

    -- Packages to exclude from modules
    exclude = {},

    -- Services configuration
    services = services,

    -- Default applications
    default_apps = {
        browser = "firefox",
        terminal = "kitty",
        text_editor = "code",
        file_manager = "code",
    },

    -- Settings
    flatpak_scope = "user",
    auto_prune = false,
    module_processing = "parallel",
    aur_helper = "yay",

    -- Backup settings
    config_backups = {
        enabled = true,
        max_backups = 5,
    },

    system_backups = {
        enabled = true,
        backup_on_sync = true,
        backup_on_update = true,
        tool = "snapper",
        snapper_config = "root",
    },
}
