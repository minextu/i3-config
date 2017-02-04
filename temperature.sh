#!/bin/bash
sensors | grep temp2 | cut -c16-17
