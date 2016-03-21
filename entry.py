import time

import click

from runutils import runbash, ensure_user, get_user_ids


USER_NAME, USER_ID, GROUP_NAME, GROUP_ID = get_user_ids('trac', 9876)


@click.group()
def run():
    ensure_user(USER_NAME, USER_ID, GROUP_NAME, GROUP_ID)


@run.command()
@click.argument('user', default=USER_NAME)
def bash(user):
    runbash(user)


@run.command()
def start():
    while True:
        time.sleep(1)


if __name__ == '__main__':
    run()
