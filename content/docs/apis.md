---
title: APIs
description: Interact with TiKV using the raw key-value API or the transactional key-value API
weight: 4
---

## Raw key-value API {#raw}

The raw key-value API is a simple API that enables you to interact with TiKV

To try out the raw key-value API:

1. Install the necessary packages:

    ```shell
    go get -v -u github.com/pingcap/tidb/store/tikv
    ```

2. Import the dependency packages:

    ```go
    import (
        "fmt"
        "github.com/pingcap/tidb/config"
        "github.com/pingcap/tidb/store/tikv"
    )
    ```

## Transactional key-value API {#transactional}
