{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "S3Permissions",
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "${bucket_arn}",
                "${bucket_arn}/*"
            ]
        },
        {
            "Sid": "CodeBuildPermissions",
            "Effect": "Allow",
            "Action": [
                "codebuild:BatchGetBuilds",
                "codebuild:StartBuild"
            ],
            "Resource": "${codebuild_arn}"
        },
        {
            "Sid": "CodeCommitPermissions",
            "Effect": "Allow",
            "Action": [
                "codecommit:BatchGet*",
                "codecommit:BatchDescribe*",
                "codecommit:Get*",
                "codecommit:GetBranch*",
                "codecommit:List*",
                "codecommit:Create*",
                "codecommit:DeleteBranch",
                "codecommit:DeleteFile",
                "codecommit:Describe*",
                "codecommit:Put*",
                "codecommit:Post*",
                "codecommit:Merge*",
                "codecommit:TagResource",
                "codecommit:Test*",
                "codecommit:UploadArchive", 
                "codecommit:UntagResource",
                "codecommit:Update*",
                "codecommit:GitPull",
                "codecommit:GitPush"
            ],
            "Resource": "${codecommit_arn}"
        }
    ]
}