# Intall Azure extension managementpartner
az extension add --name managementpartner

# Get a list of subscriptions for the logged in account. By default, only 'Enabled' subscriptions from the current cloud is shown.
$subscriptions = az account list --query "[].{SubscriptionID:id}" --output tsv

# for each item subscription to add the Azure PAL
foreach ($subscription in $subscriptions) {
    az managementpartner create --partner-id XXXXXX --subscription $subscription
    az managementpartner update --partner-id XXXXXX --subscription $subscription
}

# Finally we list the list of subscriptions to which we have given access to the PAL.
az managementpartner show --output table