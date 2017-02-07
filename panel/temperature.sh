#!/bin/bash
sensors | grep "Core 1" | cut -c18-19
