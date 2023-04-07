from urllib import request

def downloadUrl(file_url, file_path):
  request.urlretrieve(file_url , file_path )
