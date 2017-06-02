#!/bin/bash
sensors | grep -oP 'Package id 0.*?\+\K[0-9]+'
