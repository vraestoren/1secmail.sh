#!/bin/bash

api="https://www.1secmail.com/api/v1"
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36"

function _get() {
    curl --request GET \
        --url "$api/?$1" \
        --user-agent "$user_agent" \
        --header "accept: application/json" \
        --header "content-type: application/json"
}

function generate_email() {
    _get "action=genRandomMailbox&count=$1"
}

function get_domains() {
    _get "action=getDomainList"
}

function get_messages() {
    _get "action=getMessages&login=$1&domain=$2"
}

function read_message() {
    _get "action=readMessage&login=$1&domain=$2&id=$3"
}
