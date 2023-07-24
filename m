Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DB575F054
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jul 2023 11:50:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qNsDH-0004mO-1S;
	Mon, 24 Jul 2023 09:50:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qNsDF-0004lp-Fo
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 09:50:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GhsBT9Fumj8uBYrifNTbdeUWiupPg7k66ZIkdolEOus=; b=CHSJGwr5UqSyMDQCYE4v549s4T
 sZVxrkV7xnsD1jQGfqZCR+K7pd1NLdZSi9K1oonwkDHqKteeYvuOjUJRUUfZL0PbQXjYBICYdT5Ih
 omhm700mIGiwsZPcEGm26ZgLffgFORHs2rQQQCMXZmScjUyPE+icmWKgNgnfs5L3Au44=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GhsBT9Fumj8uBYrifNTbdeUWiupPg7k66ZIkdolEOus=; b=Q
 26cV+4bkWAzcO6K8MMondJUEbVJPoYHtuFNDCOzfhXa/+TeMugAtPSi8P/y8Oy80uyZk4CCCKK2jy
 E4sGloT8izsuUHZIRbgnai3bgSiV3CDGm/hi7VmHG2f1ffoLgA6FjDmh0DLOTaQFliXqsnEgwszMx
 kI3wu/WR6heQh9Ko=;
Received: from mail-ot1-f41.google.com ([209.85.210.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qNsDF-0003vn-GQ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 09:50:46 +0000
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-6bb1133b063so735928a34.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jul 2023 02:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690192240; x=1690797040;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GhsBT9Fumj8uBYrifNTbdeUWiupPg7k66ZIkdolEOus=;
 b=LrlQZ8lz8bNUk+nvUZnVZ0ACNQmVVVhI97Kr1Rh4hVviljDi1JvA3vHgLjCde6qYeD
 O09vWM1XQtB1jgVUqzCkKp2UqiBe9+tt31EBF3uuFqhGDU613NVha6oxSH7itLUg37Be
 j5D+00YMQeqSqrm1ECvc2AnbNlkRd3zQSKGZM58kKXcF9jWUOZhWTWV6F1vr3sRBeD6w
 uyiEWJYZlZzHYAHowI+vxUxF5rpTiy461XTM6KtLDyYIXF0AQEvAVWYJqT4JUVWxnBxs
 bW+fuTP4+ueDKcYJOTenI23qCPJMUWilDpspOYxBhFskhifWqY4VYZdabFlkZuJCI+QZ
 Y4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690192240; x=1690797040;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GhsBT9Fumj8uBYrifNTbdeUWiupPg7k66ZIkdolEOus=;
 b=cjIVndb8hdFhJNAWyzAR0XKlqWmDDr/qlJ+v6mrLRcJjSXHTnmW5gqzJXND4ajK/TG
 oGioWOoJtA3sFd96llo5nQcRgi9lUW/3XzQ7PrlTjPu5wWD13RcHUYRkBy++6cX91mnP
 JTVqmZFHwtOoU2FkHKEWX1mCUdvy4KCbCkWOTpwLQFQxDaRfg1JX5qNKr1zYtBNGAsna
 pazpk2Dpz3LCJHvIimFmc1ZdSygn3Uo4Hp6QOD8iAT0jyZagQsr6C3XLIdu7Twqywdxc
 /y6hJOSX/LBqVjOyFjsIZLdgg9TPeSiIdTmKyb0nu2QwZvejRCHCEHbC9aBoBvG1W+TU
 A1Zw==
X-Gm-Message-State: ABy/qLbkqrQFw9tb6Xzqj4ioybFdaBkhaj5LrAXY7qoY4v0NwF1wAMPn
 j/rPMKjb2r4Jprt1TUa/ek+XaosRBVkAqJKa+4c=
X-Google-Smtp-Source: APBJJlG2lKEMpVGWAV6dsRZ28hllsUFknqcdUwpJ+mz8ptX/BQjWY5s2WSDY0Jqf92PnyDAdPtn/0A==
X-Received: by 2002:a17:902:ea01:b0:1bb:83ec:832 with SMTP id
 s1-20020a170902ea0100b001bb83ec0832mr8326265plg.2.1690191906857; 
 Mon, 24 Jul 2023 02:45:06 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:45:06 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 24 Jul 2023 17:43:07 +0800
Message-Id: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi all, 1. Background ============= We used to implement the
 lockless slab shrink with SRCU [1], but then kernel test robot reported -88.8%
 regression in stress-ng.ramfs.ops_per_sec test case [2], so we reverted it
 [3]. Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.41 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.41 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qNsDF-0003vn-GQ
Subject: [f2fs-dev] [PATCH v2 00/47] use refcount+RCU method to implement
 lockless slab shrink
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
From: Qi Zheng via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, x86@kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-arm-msm@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi all,

1. Background
=============

We used to implement the lockless slab shrink with SRCU [1], but then kernel
test robot reported -88.8% regression in stress-ng.ramfs.ops_per_sec test
case [2], so we reverted it [3].

This patch series aims to re-implement the lockless slab shrink using the
refcount+RCU method proposed by Dave Chinner [4].

[1]. https://lore.kernel.org/lkml/20230313112819.38938-1-zhengqi.arch@bytedance.com/
[2]. https://lore.kernel.org/lkml/202305230837.db2c233f-yujie.liu@intel.com/
[3]. https://lore.kernel.org/all/20230609081518.3039120-1-qi.zheng@linux.dev/
[4]. https://lore.kernel.org/lkml/ZIJhou1d55d4H1s0@dread.disaster.area/

2. Implementation
=================

Currently, the shrinker instances can be divided into the following three types:

a) global shrinker instance statically defined in the kernel, such as
   workingset_shadow_shrinker.

b) global shrinker instance statically defined in the kernel modules, such as
   mmu_shrinker in x86.

c) shrinker instance embedded in other structures.

For case a, the memory of shrinker instance is never freed. For case b, the
memory of shrinker instance will be freed after synchronize_rcu() when the
module is unloaded. For case c, the memory of shrinker instance will be freed
along with the structure it is embedded in.

In preparation for implementing lockless slab shrink, we need to dynamically
allocate those shrinker instances in case c, then the memory can be dynamically
freed alone by calling kfree_rcu().

This patchset adds the following new APIs for dynamically allocating shrinker,
and add a private_data field to struct shrinker to record and get the original
embedded structure.

1. shrinker_alloc()
2. shrinker_free_non_registered()
3. shrinker_register()
4. shrinker_unregister()

In order to simplify shrinker-related APIs and make shrinker more independent of
other kernel mechanisms, this patchset uses the above APIs to convert all
shrinkers (including case a and b) to dynamically allocated, and then remove all
existing APIs. This will also have another advantage mentioned by Dave Chinner:

```
The other advantage of this is that it will break all the existing out of tree
code and third party modules using the old API and will no longer work with a
kernel using lockless slab shrinkers. They need to break (both at the source and
binary levels) to stop bad things from happening due to using uncoverted
shrinkers in the new setup.
```

Then we free the shrinker by calling kfree_rcu(), and use rcu_read_{lock,unlock}()
to ensure that the shrinker instance is valid. And the shrinker::refcount
mechanism ensures that the shrinker instance will not be run again after
unregistration. So the structure that records the pointer of shrinker instance
can be safely freed without waiting for the RCU read-side critical section.

In this way, while we implement the lockless slab shrink, we don't need to be
blocked in unregister_shrinker() to wait RCU read-side critical section.

PATCH 1: move shrinker-related code into a separate file
PATCH 2: remove redundant shrinker_rwsem in debugfs operations
PATCH 3: add infrastructure for dynamically allocating shrinker
PATCH 4 ~ 21: dynamically allocate the shrinker instances in case a and b
PATCH 22 ~ 40: dynamically allocate the shrinker instances in case c
PATCH 41: remove old APIs
PATCH 42: introduce pool_shrink_rwsem to implement private synchronize_shrinkers()
PATCH 43: add a secondary array for shrinker_info::{map, nr_deferred}
PATCH 44 ~ 45: implement the lockless slab shrink
PATCH 46 ~ 47: convert shrinker_rwsem to mutex

3. Testing
==========

3.1 slab shrink stress test
---------------------------

We can reproduce the down_read_trylock() hotspot through the following script:

```

DIR="/root/shrinker/memcg/mnt"

do_create()
{
    mkdir -p /sys/fs/cgroup/memory/test
    echo 4G > /sys/fs/cgroup/memory/test/memory.limit_in_bytes
    for i in `seq 0 $1`;
    do
        mkdir -p /sys/fs/cgroup/memory/test/$i;
        echo $$ > /sys/fs/cgroup/memory/test/$i/cgroup.procs;
        mkdir -p $DIR/$i;
    done
}

do_mount()
{
    for i in `seq $1 $2`;
    do
        mount -t tmpfs $i $DIR/$i;
    done
}

do_touch()
{
    for i in `seq $1 $2`;
    do
        echo $$ > /sys/fs/cgroup/memory/test/$i/cgroup.procs;
        dd if=/dev/zero of=$DIR/$i/file$i bs=1M count=1 &
    done
}

case "$1" in
  touch)
    do_touch $2 $3
    ;;
  test)
    do_create 4000
    do_mount 0 4000
    do_touch 0 3000
    ;;
  *)
    exit 1
    ;;
esac
```

Save the above script, then run test and touch commands. Then we can use the
following perf command to view hotspots:

perf top -U -F 999

1) Before applying this patchset:

  40.44%  [kernel]            [k] down_read_trylock
  17.59%  [kernel]            [k] up_read
  13.64%  [kernel]            [k] pv_native_safe_halt
  11.90%  [kernel]            [k] shrink_slab
   8.21%  [kernel]            [k] idr_find
   2.71%  [kernel]            [k] _find_next_bit
   1.36%  [kernel]            [k] shrink_node
   0.81%  [kernel]            [k] shrink_lruvec
   0.80%  [kernel]            [k] __radix_tree_lookup
   0.50%  [kernel]            [k] do_shrink_slab
   0.21%  [kernel]            [k] list_lru_count_one
   0.16%  [kernel]            [k] mem_cgroup_iter

2) After applying this patchset:

  60.17%  [kernel]           [k] shrink_slab
  20.42%  [kernel]           [k] pv_native_safe_halt
   3.03%  [kernel]           [k] do_shrink_slab
   2.73%  [kernel]           [k] shrink_node
   2.27%  [kernel]           [k] shrink_lruvec
   2.00%  [kernel]           [k] __rcu_read_unlock
   1.92%  [kernel]           [k] mem_cgroup_iter
   0.98%  [kernel]           [k] __rcu_read_lock
   0.91%  [kernel]           [k] osq_lock
   0.63%  [kernel]           [k] mem_cgroup_calculate_protection
   0.55%  [kernel]           [k] shrinker_put
   0.46%  [kernel]           [k] list_lru_count_one

We can see that the first perf hotspot becomes shrink_slab, which is what we
expect.

3.2 registeration and unregisteration stress test
-------------------------------------------------

Run the command below to test:

stress-ng --timeout 60 --times --verify --metrics-brief --ramfs 9 &

1) Before applying this patchset:

setting to a 60 second run per stressor
dispatching hogs: 9 ramfs
stressor       bogo ops real time  usr time  sys time   bogo ops/s     bogo ops/s
                          (secs)    (secs)    (secs)   (real time) (usr+sys time)
ramfs            735238     60.00     12.37    363.70     12253.05        1955.08
for a 60.01s run time:
   1440.27s available CPU time
     12.36s user time   (  0.86%)
    363.70s system time ( 25.25%)
    376.06s total time  ( 26.11%)
load average: 10.79 4.47 1.69
passed: 9: ramfs (9)
failed: 0
skipped: 0
successful run completed in 60.01s (1 min, 0.01 secs)

2) After applying this patchset:

setting to a 60 second run per stressor
dispatching hogs: 9 ramfs
stressor       bogo ops real time  usr time  sys time   bogo ops/s     bogo ops/s
                          (secs)    (secs)    (secs)   (real time) (usr+sys time)
ramfs            746677     60.00     12.22    367.75     12443.70        1965.13
for a 60.01s run time:
   1440.26s available CPU time
     12.21s user time   (  0.85%)
    367.75s system time ( 25.53%)
    379.96s total time  ( 26.38%)
load average: 8.37 2.48 0.86
passed: 9: ramfs (9)
failed: 0
skipped: 0
successful run completed in 60.01s (1 min, 0.01 secs)

We can see that the ops/s has hardly changed.

This series is based on next-20230711, and the [PATCH v2 05/49] depends on the
patch: https://lore.kernel.org/lkml/20230625154937.64316-1-qi.zheng@linux.dev/.

Comments and suggestions are welcome.

Thanks,
Qi

Changelog in v1 -> v2:
 - implement the new APIs and convert all shrinkers to use it.
   (suggested by Dave Chinner)
 - fix UAF in PATCH [05/29] (pointed by Steven Price)
 - add a secondary array for shrinker_info::{map, nr_deferred}
 - re-implement the lockless slab shrink
   (Since unifying the processing of global and memcg slab shrink needs to
    modify the startup sequence (As I mentioned in https://lore.kernel.org/lkml/38b14080-4ce5-d300-8a0a-c630bca6806b@bytedance.com/),
    I finally choose to process them separately.)
 - collect Acked-bys

Qi Zheng (47):
  mm: vmscan: move shrinker-related code into a separate file
  mm: shrinker: remove redundant shrinker_rwsem in debugfs operations
  mm: shrinker: add infrastructure for dynamically allocating shrinker
  kvm: mmu: dynamically allocate the x86-mmu shrinker
  binder: dynamically allocate the android-binder shrinker
  drm/ttm: dynamically allocate the drm-ttm_pool shrinker
  xenbus/backend: dynamically allocate the xen-backend shrinker
  erofs: dynamically allocate the erofs-shrinker
  f2fs: dynamically allocate the f2fs-shrinker
  gfs2: dynamically allocate the gfs2-glock shrinker
  gfs2: dynamically allocate the gfs2-qd shrinker
  NFSv4.2: dynamically allocate the nfs-xattr shrinkers
  nfs: dynamically allocate the nfs-acl shrinker
  nfsd: dynamically allocate the nfsd-filecache shrinker
  quota: dynamically allocate the dquota-cache shrinker
  ubifs: dynamically allocate the ubifs-slab shrinker
  rcu: dynamically allocate the rcu-lazy shrinker
  rcu: dynamically allocate the rcu-kfree shrinker
  mm: thp: dynamically allocate the thp-related shrinkers
  sunrpc: dynamically allocate the sunrpc_cred shrinker
  mm: workingset: dynamically allocate the mm-shadow shrinker
  drm/i915: dynamically allocate the i915_gem_mm shrinker
  drm/msm: dynamically allocate the drm-msm_gem shrinker
  drm/panfrost: dynamically allocate the drm-panfrost shrinker
  dm: dynamically allocate the dm-bufio shrinker
  dm zoned: dynamically allocate the dm-zoned-meta shrinker
  md/raid5: dynamically allocate the md-raid5 shrinker
  bcache: dynamically allocate the md-bcache shrinker
  vmw_balloon: dynamically allocate the vmw-balloon shrinker
  virtio_balloon: dynamically allocate the virtio-balloon shrinker
  mbcache: dynamically allocate the mbcache shrinker
  ext4: dynamically allocate the ext4-es shrinker
  jbd2,ext4: dynamically allocate the jbd2-journal shrinker
  nfsd: dynamically allocate the nfsd-client shrinker
  nfsd: dynamically allocate the nfsd-reply shrinker
  xfs: dynamically allocate the xfs-buf shrinker
  xfs: dynamically allocate the xfs-inodegc shrinker
  xfs: dynamically allocate the xfs-qm shrinker
  zsmalloc: dynamically allocate the mm-zspool shrinker
  fs: super: dynamically allocate the s_shrink
  mm: shrinker: remove old APIs
  drm/ttm: introduce pool_shrink_rwsem
  mm: shrinker: add a secondary array for shrinker_info::{map,
    nr_deferred}
  mm: shrinker: make global slab shrink lockless
  mm: shrinker: make memcg slab shrink lockless
  mm: shrinker: hold write lock to reparent shrinker nr_deferred
  mm: shrinker: convert shrinker_rwsem to mutex

 arch/x86/kvm/mmu/mmu.c                        |  18 +-
 drivers/android/binder_alloc.c                |  31 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  30 +-
 drivers/gpu/drm/i915/i915_drv.h               |   2 +-
 drivers/gpu/drm/msm/msm_drv.c                 |   4 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   4 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c        |  36 +-
 drivers/gpu/drm/panfrost/panfrost_device.h    |   2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |   6 +-
 drivers/gpu/drm/panfrost/panfrost_gem.h       |   2 +-
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |  32 +-
 drivers/gpu/drm/ttm/ttm_pool.c                |  38 +-
 drivers/md/bcache/bcache.h                    |   2 +-
 drivers/md/bcache/btree.c                     |  27 +-
 drivers/md/bcache/sysfs.c                     |   3 +-
 drivers/md/dm-bufio.c                         |  26 +-
 drivers/md/dm-cache-metadata.c                |   2 +-
 drivers/md/dm-zoned-metadata.c                |  28 +-
 drivers/md/raid5.c                            |  25 +-
 drivers/md/raid5.h                            |   2 +-
 drivers/misc/vmw_balloon.c                    |  38 +-
 drivers/virtio/virtio_balloon.c               |  25 +-
 drivers/xen/xenbus/xenbus_probe_backend.c     |  17 +-
 fs/btrfs/super.c                              |   2 +-
 fs/erofs/utils.c                              |  20 +-
 fs/ext4/ext4.h                                |   2 +-
 fs/ext4/extents_status.c                      |  22 +-
 fs/f2fs/super.c                               |  32 +-
 fs/gfs2/glock.c                               |  20 +-
 fs/gfs2/main.c                                |   6 +-
 fs/gfs2/quota.c                               |  26 +-
 fs/gfs2/quota.h                               |   3 +-
 fs/jbd2/journal.c                             |  27 +-
 fs/kernfs/mount.c                             |   2 +-
 fs/mbcache.c                                  |  23 +-
 fs/nfs/nfs42xattr.c                           |  87 +-
 fs/nfs/super.c                                |  20 +-
 fs/nfsd/filecache.c                           |  22 +-
 fs/nfsd/netns.h                               |   4 +-
 fs/nfsd/nfs4state.c                           |  20 +-
 fs/nfsd/nfscache.c                            |  31 +-
 fs/proc/root.c                                |   2 +-
 fs/quota/dquot.c                              |  17 +-
 fs/super.c                                    |  39 +-
 fs/ubifs/super.c                              |  22 +-
 fs/xfs/xfs_buf.c                              |  25 +-
 fs/xfs/xfs_buf.h                              |   2 +-
 fs/xfs/xfs_icache.c                           |  26 +-
 fs/xfs/xfs_mount.c                            |   4 +-
 fs/xfs/xfs_mount.h                            |   2 +-
 fs/xfs/xfs_qm.c                               |  26 +-
 fs/xfs/xfs_qm.h                               |   2 +-
 include/linux/fs.h                            |   2 +-
 include/linux/jbd2.h                          |   2 +-
 include/linux/memcontrol.h                    |  12 +-
 include/linux/shrinker.h                      |  54 +-
 kernel/rcu/tree.c                             |  21 +-
 kernel/rcu/tree_nocb.h                        |  19 +-
 mm/Makefile                                   |   4 +-
 mm/huge_memory.c                              |  69 +-
 mm/shrinker.c                                 | 772 ++++++++++++++++++
 mm/shrinker_debug.c                           |  76 +-
 mm/vmscan.c                                   | 701 ----------------
 mm/workingset.c                               |  26 +-
 mm/zsmalloc.c                                 |  28 +-
 net/sunrpc/auth.c                             |  19 +-
 66 files changed, 1516 insertions(+), 1225 deletions(-)
 create mode 100644 mm/shrinker.c

-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
