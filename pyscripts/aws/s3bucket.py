#!/usr/bin/python
# This script is used for listing, uploading to, deleteing, files from s3
# It also assumes you have your s3 credentials already set in ~/.aws/credentials
#
# by Troy Powell
# 25 Oct 2022

import logging
import os
import argparse
import sys

import boto3

from botocore.exceptions import ClientError

s3 = boto3.client('s3')

def main():
    # Accept arguments inputs as variables
    parser = argparse.ArgumentParser(description="s3 Tools, upload, delete, list")
    parser.add_argument("--file", help="filename")
    parser.add_argument("--bucket", help="bucket name")
    parser.add_argument("--object", help="object name")
    parser.add_argument("--describe", action='store_true', help="List objects in s3 bucket")
    parser.add_argument("--buckets", action='store_true', help="List s3 buckets")
    parser.add_argument("--upload", action='store_true', help="Upload file to s3")
    parser.add_argument("--download", action='store_true', help="Download file from s3")
    parser.add_argument("--delete", action='store_true', help="Delete object from s3")
    args = parser.parse_args()

    file_name = args.file
    bucket_name = args.bucket
    object_name = args.object

    if args.describe:
        describe_objects(bucket_name)

    if args.buckets:
        list_buckets()

    if args.upload:
        upload_file(file_name, bucket_name, object_name)

    if args.download:
        download_file(file_name, bucket_name, object_name)

    if args.delete:
        delete_object_from_bucket(bucket_name, file_name, object_name)

# List objects in bucket
def describe_objects(bucket_name):
    """List files in an S3 bucket

    :param bucket: Name of bucket
    """
    # Upload the file
    try:
        # Retrieve list of files in bucket
        response = s3.list_objects_v2(Bucket=bucket_name)
        files = response.get("Contents")
        # Output file names
        for file in files:
            print(f"file_name: {file['Key']}, size: {file['Size']}")
    except ClientError as e:
        logging.error(e)
        return False
    return True

# List buckets
def list_buckets():
    try:
        # Retrieve the list of existing buckets
        response = s3.list_buckets()['Buckets']

        # Output the bucket names
        for bucket in response:
            print('Bucket name: {}, Created on: {}'.format(bucket['Name'], bucket['CreationDate']))
    except ClientError as e:
        logging.error(e)
        return False
    return True

# Upload file to bucket
def upload_file(file_name, bucket_name, object_name=None):
    """Upload a file to an S3 bucket

    :param file_name: File to upload
    :param bucket: Bucket to upload to
    :param object_name: S3 object name. If not specified then file_name is used
    :return: True if file was uploaded, else False
    """
    # If S3 object_name was not specified, use file_name
    if object_name is None:
        object_name = os.path.basename(file_name)

    try:
        # Upload the file
        response = s3.upload_file(file_name, bucket_name, object_name)
        # Get list of files in bucket to confirm
        describe_objects(bucket_name)
    except ClientError as e:
        logging.error(e)
        return False
    return True

# Download file from bucket
def download_file(file_name, bucket_name, object_name=None):
    """Download a file from an S3 bucket

    :param bucket: Target Filename to Download to
    :param bucket: Bucket to Download from
    :param object_name: S3 object name. If not specified then file_name is used
    :return: True if file was uploaded, else False
    """
    # If S3 object_name was not specified, use file_name
    if object_name is None:
        object_name = os.path.basename(file_name)

    try:
        # Download file from bucket
        response = s3.download_file(Bucket=bucket_name, Key=object_name, Filename=file_name)
    except ClientError as e:
        logging.error(e)
        return False
    return True

# Delete file from bucket
def delete_object_from_bucket(bucket_name, file_name, object_name):
    """Delete a file from an S3 bucket

    :param bucket: Bucket to delete from
    :param object_name: S3 object name. If not specified then file_name is used
    :return: True if file was uploaded, else False
    """
    # If S3 object_name was not specified, use file_name
    if object_name is None:
        object_name = os.path.basename(file_name)

    try:
        # Delete object from bucket
        response = s3.delete_object(Bucket=bucket_name, Key=object_name)
        # List files in bucket to confirm
        describe_objects(bucket_name)
    except ClientError as e:
        logging.error(e)
        return False
    return True


if __name__ == "__main__":
    main()
