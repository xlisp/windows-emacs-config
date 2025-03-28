import os
import sys
import re

mylogo = '{BOLD_YELLOW}坚持去λ化{BOLD_WHITE}({BOLD_GREEN}中-易{BOLD_WHITE}){BOLD_BLUE}'
$XONSH_TRACEBACK_LOGFILE = '~/.xonsh.log'
$PROMPT = '{env_name}' + mylogo + '{BOLD_BLUE} {cwd_base} {branch_color}{curr_branch: {}} {BOLD_BLUE}{prompt_end} '

def fg(name): # 高阶化
    os.system("find . -name " + "\"" + name + "\"")
def gam(comment):
    os.system("git add -A") # no include .xonshrc
    os.system("git commit -m '" + comment + "'")
    branch = os.popen("git branch | grep '*'").read().replace("\n", "").replace("*", "")
    os.system("git push origin " + branch)

def gcl1(url):
    os.system("git clone " + url + " --depth 1")

def update_words():
    cd ~/Downloads/
    unzip ~/Downloads/HululunoteZipFile.zip
    cp ~/Downloads/MarkdownDir/*.md /Users/clojure/Documents/_think_different_everday
    cd /Users/clojure/Documents/_think_different_everday/
    git add -A
    git commit -m "${date} learn english"
    git push origin master
    rm ~/Downloads/HululunoteZipFile.zip
    rm -fr /Users/clojure/Downloads/MarkdownDir

import inspect
def find_class(module, class_name):
    for name, obj in inspect.getmembers(module):
        if inspect.ismodule(obj):
            result = find_class(obj, class_name)
            if result:
                return result
        elif inspect.isclass(obj) and obj.__name__ == class_name:
            return obj.__module__, obj.__name__
#result = find_class(graphrag, 'GraphRAG')

def color_diff(file1, file2):
    with open(file1, 'r') as f1, open(file2, 'r') as f2:
        file1_lines = f1.readlines()
        file2_lines = f2.readlines()

    diff = difflib.ndiff(file1_lines, file2_lines)

    for line in diff:
        if line.startswith('-'):  # Lines that are in file1 but not file2 (deletions)
            print(f'\033[31m{line}\033[0m', end='')  # Red color
        elif line.startswith('+'):  # Lines that are in file2 but not file1 (additions)
            print(f'\033[32m{line}\033[0m', end='')  # Green color
        else:  # Lines that are the same
            print(line, end='')

