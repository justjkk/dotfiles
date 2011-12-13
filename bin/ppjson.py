#!/usr/bin/env python
import simplejson as json
import sys

def pretty_print_json(json_data, indent):
    try:
        json.dump(json.loads(json_data), sys.stdout, indent=indent,
                sort_keys=True)
        print
    except ValueError, e:
        print json_data

if __name__ == "__main__":
    if len(sys.argv) == 1:
        src = sys.stdin
    else:
        src = open(sys.argv[1], 'r')
    if len(sys.argv) == 3:
        indent = int(sys.argv[2])
    else:
        indent = 4
    pretty_print_json(src.read(), indent)
