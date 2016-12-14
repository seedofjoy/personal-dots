#! /usr/bin/python
import filecmp
import os
import shutil

from collections import namedtuple
from datetime import datetime


class Colors:
    blue = '\033[94m'
    green = '\033[92m'
    warning = '\033[93m'
    fail = '\033[91m'
    endc = '\033[0m'


def color_print(color, text):
    print(color + text + Colors.endc)


Config = namedtuple('Config', ['source_filename', 'dest_path', 'symlink'])

DIR_PATH = os.path.dirname(os.path.realpath(__file__))
BACKUP_DIR = os.path.join(DIR_PATH, 'backup')

NOW = datetime.now()

bash_config = Config(
    source_filename='bash_profile',
    dest_path=os.path.expanduser('~/.bash_profile'),
    symlink=False,
)
fish_config = Config(
    source_filename='config.fish',
    dest_path=os.path.expanduser('~/.config/fish/config.fish'),
    symlink=False,
)
git_config = Config(
    source_filename='gitconfig',
    dest_path=os.path.expanduser('~/.config/git/config'),
    symlink=True,
)
configs = [bash_config, fish_config, git_config]

for conf in configs:
    dest_dir = os.path.dirname(conf.dest_path)
    if not os.path.exists(dest_dir):
        os.makedirs(dest_dir)

    if os.path.isfile(conf.dest_path):
        backup_filename = '{filename}.backup.{timestamp}'.format(
            filename=conf.source_filename,
            timestamp=NOW.strftime('%Y%m%d_%H-%M-%S'),
        )
        backup_filepath = os.path.join(BACKUP_DIR, backup_filename)
        print('Moving original "%s" to "%s"' % (conf.dest_path, backup_filepath))
        shutil.move(conf.dest_path, backup_filepath)

    source_path = os.path.join(DIR_PATH, conf.source_filename)
    if conf.symlink:
        os.symlink(source_path, conf.dest_path)
    else:
        shutil.copy(source_path, conf.dest_path)

    is_equal = filecmp.cmp(source_path, conf.dest_path, shallow=False)
    if is_equal:
        color_print(Colors.green, '{} has been successfully installed!'.format(conf.source_filename))
    else:
        color_print(Colors.fail, '{} failed to install, please try to install it manually'.format(conf.source_filename))
