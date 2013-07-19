#!/bin/bash
yum -y --enablerepo epel install s3cmd
s3cmd --configure