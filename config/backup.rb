##
# Backup
# Generated Template
#
# For more information:
#
# View the Git repository at https://github.com/meskyanichi/backup
# View the Wiki/Documentation at https://github.com/meskyanichi/backup/wiki
# View the issue log at https://github.com/meskyanichi/backup/issues
#
# When you're finished configuring this configuration file,
# you can run it from the command line by issuing the following command:
#
# $ backup -t S3PGBackup [-c <path_to_configuration_file>]

Backup::Model.new(:S3PGBackup, 'S3PGBackup') do

  database PostgreSQL do |db|
    db.name               = "backupS3PG_development"
    db.username           = "backupS3PG"
    db.password           = "backupS3PG"
    db.host               = "localhost"
    db.port               = 5432
    db.socket             = "/tmp/pg.sock"
    db.skip_tables        = ['skip', 'these', 'tables']
    db.only_tables        = ['only', 'these' 'tables']
    db.additional_options = ['--quick', '--single-transaction']
  end

  store_with S3 do |s3|
    s3.access_key_id      = 'AKIAJQAPCNIY4EGPL6LA'
    s3.secret_access_key  = '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'
    s3.region             = 'us-east-1'
    s3.bucket             = 'appcoast'
    s3.path               = '/'
    s3.keep               = 10
  end

  compress_with Gzip do |compression|
    compression.best = true
    compression.fast = false
  end

end
