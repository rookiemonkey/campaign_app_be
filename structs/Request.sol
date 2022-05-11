// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

struct Request {
    string description;
    uint value;
    address recipient;
    bool complete;
}