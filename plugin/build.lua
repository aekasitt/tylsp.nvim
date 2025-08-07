-- plugin/build.lua --

local Job = require('plenary.job')

if vim.fn.executable('ty') == 0 then
  vim.schedule(function()
    vim.notify('Installing astral-sh/ty for tylsp.nvim…', vim.log.levels.INFO)
  end)
  if vim.fn.executable('pip') == 1 then
    vim.schedule(function()
      vim.notify('Installing using pip command…', vim.log.levels.INFO)
    end)
    Job:new({
      args = { 'install', '--user', 'ty' },
      command = 'pip',
      on_exit = function(_, return_val)
        if return_val ~= 0 then
          vim.schedule(function()
            vim.notify('Unable to install astral-sh/ty executable', vim.log.levels.ERROR)
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
      on_stdout = function(_, data)
        if not data:match('^%s*Collecting') and not data:match('^%s*Using cached') then
          vim.schedule(function()
            vim.notify(data, vim.log.levels.INFO)
          end)
        end
      end,
    }):start()
  elseif vim.fn.executable('uv') == 1 then
    vim.schedule(function()
      vim.notify('Installing using uv command…', vim.log.levels.INFO)
    end)
    Job:new({
      args = { 'tool', 'install', 'ty@latest' },
      command = 'uv',
      on_exit = function(_, return_val)
        if return_val ~= 0 then
          vim.schedule(function()
            vim.notify('Unable to install astral-sh/ty executable', vim.log.levels.ERROR)
          end)
        end
      end,
      on_stderr = function(_, data)
        if data:match('^%s*Installed') and not data:match('^%s*Installed %d package') then
          vim.schedule(function()
            vim.notify(data, vim.log.levels.INFO)
          end)
        elseif data:match('^%s*Prepared') or data:match('^%s*Resolved') then
          -- do nothing
        elseif data:match('^%s*%error: Failed to fetch:') then
          vim.schedule(function()
            vim.notify(data, vim.log.levels.WARN)
          end)
        end
      end,
      on_stdout = function(_, data)
        if data:match('^%s*Installed') and not data:match('^%s*Installed %d package') then
          vim.schedule(function()
            vim.notify(data, vim.log.levels.INFO)
          end)
        elseif data:match('^%s*Prepared') or data:match('^%s*Resolved') then
          -- do nothing
        end
      end,
    }):start()
  else
    vim.schedule(function()
      vim.notify('Unable to install astral-sh/ty executable', vim.log.levels.ERROR)
    end)
  end
end
