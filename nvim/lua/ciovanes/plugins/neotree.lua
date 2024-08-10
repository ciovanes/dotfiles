return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Opcional: soporte para imágenes en la ventana de vista previa
    },
    config = function()
        require("neo-tree").setup({
            -- Aquí puedes agregar la configuración de `neo-tree` según tus necesidades
            close_if_last_window = true, -- Cierra la ventana de `neo-tree` si es la última ventana abierta
            popup_border_style = "rounded", -- Estilo del borde de las ventanas emergentes
            position = "right",    -- Establece la posición de `neo-tree` a la derecha
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false, -- Muestra archivos ocultos
                    hide_gitignored = false, -- Muestra archivos ignorados por Git
                },
            },
            -- Puedes agregar más configuraciones aquí según lo que necesites
        })

        -- Mapear `neo-tree` para abrir y cerrar
        vim.api.nvim_set_keymap("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })
    end,
}
