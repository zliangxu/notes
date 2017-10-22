# coding=-utf8
import os
import time
import sys


def backupOne():
    ''' BackUp file。
    '''
    source = ['/home/lxg/notes']
    target_dir = '/tmp'
    target = target_dir + os.sep + \
                time.strftime('%Y%m%d%H%M%S') + '.zip'
    if not os.path.exists(target_dir):
        os.mkdir(target_dir)
    zip_command = 'zip -r {0} {1}'.format(target, 
                                ' '.join(source))
    print('zip comand is:')
    print(zip_command)
    print('running...')
    if os.system(zip_command) == 0:
        print('successful backup to', target)
    else:
        print('backup failed')


def testInput():
    ''' Test if the input is palindrome。
    '''
    forbidden = (' ', '!', '?', '.' , '...',)
    something = input("please input text:")
    print("text input is: {0}".format(something))
    for item in forbidden:
        something = something.replace(item, "")
    print("after delete text input is: {0}".format(something))
    if something == something[::-1]:
        print("the text input is palindrome")
    else:
        print("the text input is not palindrome")

    

if __name__ == '__main__':
    # 备份
    # print('parameter passed to argv: \n{0}'.format(sys.argv))
    # for i in range(len(sys.argv)):
    #     if sys.argv[i] == 'one':
    #         backupOne()

    # test input
    testInput()