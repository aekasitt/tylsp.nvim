-- plugin/build.lua --

local Job = require('plenary.job')

if vim.fn.executable('ty') == 0 then
  vim.schedule(function()
    vim.notify('Installing astral-sh/ty for tylsp.nvim…', vim.log.levels.INFO)
  end)
  if vim.fn.executable('pip') == 0 then
    vim.schedule(function()
      vim.notify('Unable to locate pip command', vim.log.levels.ERROR)
    end)
    return
  end
  Job:new({
    args = { 'install', '--user', 'ty' },
    command = 'pip',
    on_stdout = function(_, data)
      if not data:match("^%s*Collecting") and not data:match('^%s*Using cached') then
        vim.schedule(function()
          vim.notify(data, vim.log.levels.INFO)
        end)
      end
    end,
    on_stderr = function(_, data)
      if not data:match('^%s*%[notice%]') then
        vim.schedule(function()
          vim.notify(data, vim.log.levels.WARN)
        end)
      end
    end,
    on_exit = function(_, return_val)
      if return_val ~= 0 then
        vim.schedule(function()
          vim.notify("Unable to install Tylsp's python dependencies", vim.log.levels.ERROR)
        end)
      end
    end,
  }):start()
end
