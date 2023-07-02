local M = {}

local Job = require("plenary.job")

M.async_gpull = function()
  Job
    :new({
      command = "git",
      args = { "pull" },
      cwd = vim.fn.getcwd(),
      on_start = function()
        -- TODO: Add branch name
        vim.notify("[git] pulling branch [" .. "]")
      end,
      on_exit = function(j, _)
        vim.notify(vim.inspect(j:result()), vim.log.levels.INFO)
      end,
    })
    :start()
end

M.async_gpush = function()
  Job
    :new({
      command = "git",
      args = { "push" },
      cwd = vim.fn.getcwd(),
      on_start = function()
        vim.notify("[git] pushing on branch [" .. "]")
      end,
      on_exit = function(j, _)
        -- print(return_val)
        vim.notify(vim.inspect(j:result()), vim.log.levels.INFO)
      end,
    })
    :start()
end

M.async_gfetch = function()
  Job
    :new({
      command = "git",
      args = { "pull" },
      cwd = vim.fn.getcwd(),
      on_start = function()
        vim.notify("[git] fetching branch [" .. "]")
      end,
      on_exit = function(j, return_val)
        print(return_val)
        print(j:result())
      end,
    })
    :start()
end

return M
