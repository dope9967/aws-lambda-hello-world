USERNAME = $1
aws iam create-role --role-name lambda-cli-role --assume-role-policy-document file://basic_lambda_role.json
aws iam put-role-policy --role-name lambda-cli-role --policy-name AWSLambdaBasicExecutionRole --policy-document file://AWSLambdaBasicExecutionRole.json
aws lambda create-function --function-name helloworld --zip-file fileb://function.zip --handler index.handler --runtime nodejs8.10 --role arn:aws:iam::017992846038:role/lambda-cli-role
aws iam put-user-policy --user-name $USERNAME --policy-name AWSLambdaFullAccess --policy-document file://AWSLambdaFullAccess.json
aws lambda create-function --function-name helloworld --zip-file fileb://function.zip --handler index.handler --runtime nodejs8.10 --role arn:aws:iam::017992846038:role/lambda-cli-role
aws lambda invoke --function-name helloworld --log-type Tail --payload '{"key1":"value1", "key2":"value2", "key3":"value3"}' outputfile.txt
