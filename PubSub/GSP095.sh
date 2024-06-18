echo 'Lab GSP095'

echo '####################################################'
echo 'Task 1. Pub/Sub topics'
echo '####################################################'
    
gcloud pubsub topics create myTopic

read 'Validate task'

echo 'Creating two more topics'
gcloud pubsub topics create Test1
gcloud pubsub topics create Test2

echo 'Listing the tree topics'
gcloud pubsub topics list

echo '#################################'
echo 'Time to clean up. Delete Test1 and Test2'

gcloud pubsub topics delete Test1
gcloud pubsub topics delete Test2

echo 'time to verify the topics were deleted'
gcloud pubsub topics list

echo '####################################################'
echo 'Task 2. Pub/Sub subscriptions'
echo '####################################################'

echo 'create a subscription called mySubscription to topic myTopic'
gcloud  pubsub subscriptions create --topic myTopic mySubscription

read 'Validate task'

echo 'Add another two subscriptions to myTopic'
gcloud  pubsub subscriptions create --topic myTopic Test1
gcloud  pubsub subscriptions create --topic myTopic Test2

echo 'list the subscriptions to myTopic: '
gcloud pubsub topics list-subscriptions myTopic

echo '#################################'
echo 'Time to clean up. Delete Test1 and Test2'

gcloud pubsub subscriptions delete Test1
gcloud pubsub subscriptions delete Test2

echo '####################################################'
echo 'Task 3. Pub/Sub publishing and pulling a single message'
echo '####################################################'

echo 'publish the message "hello" to the topic you created previously (myTopic)'
gcloud pubsub topics publish myTopic --message "Hello"
gcloud pubsub topics publish myTopic --message "Publisher's name is Luis"
gcloud pubsub topics publish myTopic --message "Publisher likes to eat Asado"
gcloud pubsub topics publish myTopic --message "Publisher thinks Pub/Sub is awesome"

echo 'pull the messages you just published from the Pub/Sub topic: '
gcloud pubsub subscriptions pull mySubscription --auto-ack
gcloud pubsub subscriptions pull mySubscription --auto-ack
gcloud pubsub subscriptions pull mySubscription --auto-ack
gcloud pubsub subscriptions pull mySubscription --auto-ack

read 'Validate task'
echo '####################################################'
echo 'Task 4. Pub/Sub pulling all messages from subscriptions'
echo '####################################################'
echo 'publish the message "hello" to the topic you created previously (myTopic)'
gcloud pubsub topics publish myTopic --message "Hello"
gcloud pubsub topics publish myTopic --message "Publisher's name is Luis"
gcloud pubsub topics publish myTopic --message "Publisher likes to eat Asado"
gcloud pubsub topics publish myTopic --message "Publisher thinks Pub/Sub is awesome"
echo 'Run the pull command with the limit flag'
gcloud pubsub subscriptions pull mySubscription --auto-ack --limit=3
