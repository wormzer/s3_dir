use_inline_resources

action :create do
  directory new_resource.name do
    owner     new_resource.owner
    group     new_resource.group
    mode      new_resource.mode
    action    :create
    recursive new_resource.recursive
  end

  s3_dir_lib = S3Lib::Dir.new(
    new_resource.access_key_id,
    new_resource.secret_access_key
  )

  s3_dir_lib.ls(
    new_resource.bucket,
    new_resource.dir
  ).each do |filename|
    if filename[-1] == '/'
      directory "#{new_resource.name}#{filename}" do
        owner     new_resource.owner
        group     new_resource.group
        mode      new_resource.mode
      end
    else
      s3_file "#{new_resource.name}#{filename}" do
        remote_path "#{new_resource.dir}#{filename}"
        bucket new_resource.bucket
        aws_access_key_id new_resource.access_key_id
        aws_secret_access_key new_resource.secret_access_key
        owner new_resource.owner
        group new_resource.group
        mode new_resource.mode
        action :create
      end
    end
  end
end
