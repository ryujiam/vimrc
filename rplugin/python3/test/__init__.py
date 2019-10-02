import pynvim
vim = pynvim


@vim.plugin
class TestPlugin(object):

    def __init__(self, vim):
        self.vim = vim
        self.table_range = ()
        self.table_cur = ()

    @vim.function("_table_move_init", sync=True)
    def init(self, args):
        self.vim.vars['table#channel_id'] = self.vim.channel_id
        self.vim.current.buffer.append(str(self.vim.channel_id))

    @vim.rpc_export("table_move_mode", sync=True)
    def table_move_mode(self, args):
        self.vim.current.buffer.append('tablemovemode')
        self.vim.current.buffer.append(args)

    @vim.command("TableSample", sync=True)
    def test_command(self, args):
        self.vim.current.buffer
