#!/bin/bash
sensors | grep "Core 1" | cut -c17-18
