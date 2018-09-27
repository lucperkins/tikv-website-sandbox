---
title: Architecture
description: How TiKV works and how it was built
weight: 3
---

This page discusses the architecture of TiKV.

## APIs

TiKV provides two APIs that you can use to interact with it:

API | Description | Atomicity | Use when...
:---|:------------|:----------|:-----------
[Raw](../apis#raw) | A lower-level key-value API for interacting directly with individual key-value pairs. | Single key | Your application doesn't require distributed transactions or multi-version concurrency control (MVCC)
[Transactional](../apis#transactional) | A higher-level key-value API that provides ACID semantics | Multiple keys | Your 

## Diagram

{{< figure
    id="d6ff8e03-ed36-46b3-83b3-a1ce79db03a4"
    caption="The architecture of TiKV"
    alt="TiKV architecture diagram"
    width="70"
    number="1" >}}

## Placement driver (PD) {#placement-driver}

The TiKV placement driver is the cluster manager of TiKV, which periodically checks replication constraints to balance load and data automatically across nodes and regions in a process called **auto-sharding**.

## Transaction model

TiKV's transaction model is similar to that of Google's [Percolator](https://ai.google/research/pubs/pub36726), a system built for processing updates to large data sets. Percolator uses an incremental update model in place of a batch-based model.

TiKV's transaction model provides:

* **Snapshot isolation** with lock, with semantics analogous to `SELECT ... FOR UPDATE` in SQL
* Externally consistent reads and writes in distributed transactions

## Store

There is a RocksDB database within each Store and it stores data into the local disk.

## Region

Region is the basic unit of key-value data movement. Each Region is replicated to multiple Nodes. These multiple replicas form a Raft group.

## Node

A TiKV **Node** is just a physical node in the cluster, which could be a virtual machine, a container, etc. Within each Node, there are one or more **Store**s. The data in each Store is split across multiple regions. Data is distributed across Regions using the Raft algorithm.

When a Node starts, the metadata for the Node, Store, and Region is recorded into the Placement Driver. The status of each Region and Store is regularly reported to the PD.

## Raft

## The origins of TiKV

