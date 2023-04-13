function bufline_setup()
  require('cokeline').setup({
    show_if_buffers_are_at_least = 1,
    buffers = {
      new_buffers_position = "number",
    },
    components = {
      {
        text = function(buffer) return ' ' .. buffer.filename .. ' ' end,
      },
      {
        text = ' ',
      },
      {
        text = function(buffer) return '|' end
      },
    }
  })
end
