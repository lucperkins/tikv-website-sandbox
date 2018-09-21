---
title: Architecture
description: How TiKV works and how it was built
weight: 2
---

This page discusses the architecture of TiKV.

{{< figure src="/img/architecture.png" caption="The architecture of TiKV" alt="TiKV architecture diagram" >}}

## Placement driver

PD is the cluster manager of TiKV, which periodically checks replication constraints to balance load and data automatically.

## Store

There is a RocksDB database within each Store and it stores data into the local disk.

## Region

Region is the basic unit of key-value data movement. Each Region is replicated to multiple Nodes. These multiple replicas form a Raft group.

## Node

A physical node in the cluster. Within each node, there are one or more Stores. Within each Store, there are many Regions.

## The origins of TiKV

