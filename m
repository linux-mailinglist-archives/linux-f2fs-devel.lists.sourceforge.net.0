Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B0675F2F1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jul 2023 12:23:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qNsjG-00018o-UO;
	Mon, 24 Jul 2023 10:23:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qNsjF-00018h-US
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 10:23:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FywtQwu9mwqdLnpgsxjfsrD11oDXqt6ENbvCNRWNCVA=; b=OIpM3ib11IxNOzqajJmvzFWWmM
 G2QTo6at4Mc3ikyJRRIYifq+otz5UZdT4v5kzcspsT1XMFdYY1TYV9hnlLPXTQMFCstW63Z0SQM7S
 vTVg4h1FejYzQRpIRp5reyvL7oJN1ZLkLaRI26MVK1+pi3FrA8WT2QjjaZbvSsQjuYtQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FywtQwu9mwqdLnpgsxjfsrD11oDXqt6ENbvCNRWNCVA=; b=EpEiR/Hu3YSJVPV86Ouxu8d86d
 UNcuT7wrtY7dRrAMgLyDmbHrZxvpK6eDGrGhe+GxZhp7hEkyPccfBwa1gjDA23Xm73LDR70WxnjMr
 3svgUgSXnj1ro0swGh+mLPZrw+qkF3ZNlHTTgKhFjpKh83iFdB6cPkJXFUgG6AvEP0B8=;
Received: from mail-il1-f182.google.com ([209.85.166.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qNsjB-000564-4C for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 10:23:49 +0000
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-3461b58c61dso4032005ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jul 2023 03:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690194219; x=1690799019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FywtQwu9mwqdLnpgsxjfsrD11oDXqt6ENbvCNRWNCVA=;
 b=Iku8QU5FSsonNT60h56g8JOTKY+DVZs4cSo6/RcyiBBgKNDT/H/buGKBHFDg+ocAJk
 fTIi4eTR4kluRCJyLkbxDn9PHIy+K3g1WmoSSSp7VNy2dSttnlot+ikPcGjvc9g6BfH4
 lsT3KPqvmXuqRKHaaOx9aVsOWx63uFy5Kx0SJCxwjH/Upw7D6LevhIglDP/YltLr0Jvm
 5fotTHBiEc4oa4jJPNnLSAogTYSAZxwAA414//tjcYSxeLCCnmsGfwZRfQOy4ycs5o29
 PmPiFy1SshR1MDk8gHjZuA2E3WbRLHLIxOcBv0a1U+g3Tb89KkSsS9C4tTc7MYPRFufK
 xlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690194219; x=1690799019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FywtQwu9mwqdLnpgsxjfsrD11oDXqt6ENbvCNRWNCVA=;
 b=cYMZ+HSgcAf/4k/8zj0Ndd1dKTOBhOWy2k0dgIsj4vnhTgMIT6/5fzZPsKdQ05T315
 ZfXEvIFR6R5P99tCv6HKIgSJvsdHHVci9rkPGOtthih0Lrz5FuzSunAKPbnwYt+nsBzo
 TnvdNMr5VT0Aq7pk5VRhpgMsD1kcM6s+nNqTHfpFTB+9uyT71XiCHVxELvU/hIPmAm1w
 zW1pthi+4JD39R1pgSIuz7LsQw1R7H1OhHg3X/RgsYcnZa1ROACO+BrB6F6f+nYNFkB9
 Qh/ap7x/eJf6kntF68gDSt9D7rEMf/IOKStTL23ZiUuY6O/5F1UIfOYggbQ0EXwFFIyU
 yLGA==
X-Gm-Message-State: ABy/qLaYuq1D16AhXwNOob6GOicF9YdrUcmPCYxPp0L2XeHfy1qZekb6
 MdRZmS3HngkiSYpehXMPw+unYb61opcgwQRiy9A=
X-Google-Smtp-Source: APBJJlGle8sGTFCIz3U+SEQARZPGtcsatZf97BgxEHL69WWMCLjqGjoS5fsqRbwtJvxWPn7Q2rRfzw==
X-Received: by 2002:a17:902:cecd:b0:1b8:70d2:eb3a with SMTP id
 d13-20020a170902cecd00b001b870d2eb3amr12272091plg.0.1690192445165; 
 Mon, 24 Jul 2023 02:54:05 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:54:04 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 24 Jul 2023 17:43:52 +0800
Message-Id: <20230724094354.90817-46-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Like global slab shrink, this commit also uses refcount+RCU
 method to make memcg slab shrink lockless. Use the following script to do
 slab shrink stress test: ``` 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.182 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.182 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qNsjB-000564-4C
Subject: [f2fs-dev] [PATCH v2 45/47] mm: shrinker: make memcg slab shrink
 lockless
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

Like global slab shrink, this commit also uses refcount+RCU method to make
memcg slab shrink lockless.

Use the following script to do slab shrink stress test:

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

Save the above script, then run test and touch commands. Then we can use
the following perf command to view hotspots:

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

We can see that the first perf hotspot becomes shrink_slab, which is what
we expect.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/shrinker.c       | 121 +++++++++++++++++++++++++++-----------------
 mm/shrinker_debug.c |   4 +-
 2 files changed, 76 insertions(+), 49 deletions(-)

diff --git a/mm/shrinker.c b/mm/shrinker.c
index 8e3334749552..744361afd520 100644
--- a/mm/shrinker.c
+++ b/mm/shrinker.c
@@ -107,6 +107,12 @@ static struct shrinker_info *shrinker_info_protected(struct mem_cgroup *memcg,
 					 lockdep_is_held(&shrinker_rwsem));
 }
 
+static struct shrinker_info *shrinker_info_rcu(struct mem_cgroup *memcg,
+					       int nid)
+{
+	return rcu_dereference(memcg->nodeinfo[nid]->shrinker_info);
+}
+
 static int expand_one_shrinker_info(struct mem_cgroup *memcg, int new_size,
 				    int old_size, int new_nr_max)
 {
@@ -152,11 +158,11 @@ static int expand_shrinker_info(int new_id)
 	int new_size, old_size = 0;
 	struct mem_cgroup *memcg;
 
+	down_write(&shrinker_rwsem);
+
 	if (!root_mem_cgroup)
 		goto out;
 
-	lockdep_assert_held(&shrinker_rwsem);
-
 	new_size = shrinker_unit_size(new_nr_max);
 	old_size = shrinker_unit_size(shrinker_nr_max);
 
@@ -173,6 +179,8 @@ static int expand_shrinker_info(int new_id)
 	if (!ret)
 		shrinker_nr_max = new_nr_max;
 
+	up_write(&shrinker_rwsem);
+
 	return ret;
 }
 
@@ -198,7 +206,7 @@ void set_shrinker_bit(struct mem_cgroup *memcg, int nid, int shrinker_id)
 		struct shrinker_info_unit *unit;
 
 		rcu_read_lock();
-		info = rcu_dereference(memcg->nodeinfo[nid]->shrinker_info);
+		info = shrinker_info_rcu(memcg, nid);
 		unit = info->unit[shriner_id_to_index(shrinker_id)];
 		if (!WARN_ON_ONCE(shrinker_id >= info->map_nr_max)) {
 			/* Pairs with smp mb in shrink_slab() */
@@ -211,39 +219,40 @@ void set_shrinker_bit(struct mem_cgroup *memcg, int nid, int shrinker_id)
 
 static DEFINE_IDR(shrinker_idr);
 
-static int prealloc_memcg_shrinker(struct shrinker *shrinker)
+static int shrinker_memcg_alloc(struct shrinker *shrinker)
 {
-	int id, ret = -ENOMEM;
+	int id;
 
 	if (mem_cgroup_disabled())
 		return -ENOSYS;
 
-	down_write(&shrinker_rwsem);
-	/* This may call shrinker, so it must use down_read_trylock() */
-	id = idr_alloc(&shrinker_idr, shrinker, 0, 0, GFP_KERNEL);
+	spin_lock(&shrinker_lock);
+	id = idr_alloc(&shrinker_idr, shrinker, 0, 0, GFP_ATOMIC);
+	spin_unlock(&shrinker_lock);
+
 	if (id < 0)
-		goto unlock;
+		return -ENOMEM;
 
 	if (id >= shrinker_nr_max) {
 		if (expand_shrinker_info(id)) {
+			spin_lock(&shrinker_lock);
 			idr_remove(&shrinker_idr, id);
-			goto unlock;
+			spin_unlock(&shrinker_lock);
+			return -ENOMEM;
 		}
 	}
 	shrinker->id = id;
-	ret = 0;
-unlock:
-	up_write(&shrinker_rwsem);
-	return ret;
+
+	return 0;
 }
 
-static void unregister_memcg_shrinker(struct shrinker *shrinker)
+static void shrinker_memcg_remove(struct shrinker *shrinker)
 {
 	int id = shrinker->id;
 
 	BUG_ON(id < 0);
 
-	lockdep_assert_held(&shrinker_rwsem);
+	lockdep_assert_held(&shrinker_lock);
 
 	idr_remove(&shrinker_idr, id);
 }
@@ -253,10 +262,15 @@ static long xchg_nr_deferred_memcg(int nid, struct shrinker *shrinker,
 {
 	struct shrinker_info *info;
 	struct shrinker_info_unit *unit;
+	long nr_deferred;
 
-	info = shrinker_info_protected(memcg, nid);
+	rcu_read_lock();
+	info = shrinker_info_rcu(memcg, nid);
 	unit = info->unit[shriner_id_to_index(shrinker->id)];
-	return atomic_long_xchg(&unit->nr_deferred[shriner_id_to_offset(shrinker->id)], 0);
+	nr_deferred = atomic_long_xchg(&unit->nr_deferred[shriner_id_to_offset(shrinker->id)], 0);
+	rcu_read_unlock();
+
+	return nr_deferred;
 }
 
 static long add_nr_deferred_memcg(long nr, int nid, struct shrinker *shrinker,
@@ -264,10 +278,16 @@ static long add_nr_deferred_memcg(long nr, int nid, struct shrinker *shrinker,
 {
 	struct shrinker_info *info;
 	struct shrinker_info_unit *unit;
+	long nr_deferred;
 
-	info = shrinker_info_protected(memcg, nid);
+	rcu_read_lock();
+	info = shrinker_info_rcu(memcg, nid);
 	unit = info->unit[shriner_id_to_index(shrinker->id)];
-	return atomic_long_add_return(nr, &unit->nr_deferred[shriner_id_to_offset(shrinker->id)]);
+	nr_deferred =
+		atomic_long_add_return(nr, &unit->nr_deferred[shriner_id_to_offset(shrinker->id)]);
+	rcu_read_unlock();
+
+	return nr_deferred;
 }
 
 void reparent_shrinker_deferred(struct mem_cgroup *memcg)
@@ -299,12 +319,12 @@ void reparent_shrinker_deferred(struct mem_cgroup *memcg)
 	up_read(&shrinker_rwsem);
 }
 #else
-static int prealloc_memcg_shrinker(struct shrinker *shrinker)
+static int shrinker_memcg_alloc(struct shrinker *shrinker)
 {
 	return -ENOSYS;
 }
 
-static void unregister_memcg_shrinker(struct shrinker *shrinker)
+static void shrinker_memcg_remove(struct shrinker *shrinker)
 {
 }
 
@@ -458,6 +478,8 @@ void shrinker_put(struct shrinker *shrinker)
 	if (refcount_dec_and_test(&shrinker->refcount)) {
 		spin_lock(&shrinker_lock);
 		list_del_rcu(&shrinker->list);
+		if (shrinker->flags & SHRINKER_MEMCG_AWARE)
+			shrinker_memcg_remove(shrinker);
 		spin_unlock(&shrinker_lock);
 
 		kfree(shrinker->nr_deferred);
@@ -476,18 +498,23 @@ static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
 	if (!mem_cgroup_online(memcg))
 		return 0;
 
-	if (!down_read_trylock(&shrinker_rwsem))
-		return 0;
-
-	info = shrinker_info_protected(memcg, nid);
+again:
+	rcu_read_lock();
+	info = shrinker_info_rcu(memcg, nid);
 	if (unlikely(!info))
 		goto unlock;
 
-	for (; index < shriner_id_to_index(info->map_nr_max); index++) {
+	if (index < shriner_id_to_index(info->map_nr_max)) {
 		struct shrinker_info_unit *unit;
 
 		unit = info->unit[index];
 
+		/*
+		 * The shrinker_info_unit will not be freed, so we can
+		 * safely release the RCU lock here.
+		 */
+		rcu_read_unlock();
+
 		for_each_set_bit(offset, unit->map, SHRINKER_UNIT_BITS) {
 			struct shrink_control sc = {
 				.gfp_mask = gfp_mask,
@@ -497,13 +524,14 @@ static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
 			struct shrinker *shrinker;
 			int shrinker_id = calc_shrinker_id(index, offset);
 
+			rcu_read_lock();
 			shrinker = idr_find(&shrinker_idr, shrinker_id);
-			if (unlikely(!shrinker ||
-				     !READ_ONCE(shrinker->registered))) {
-				if (!shrinker)
-					clear_bit(offset, unit->map);
+			if (unlikely(!shrinker || !shrinker_try_get(shrinker))) {
+				clear_bit(offset, unit->map);
+				rcu_read_unlock();
 				continue;
 			}
+			rcu_read_unlock();
 
 			/* Call non-slab shrinkers even though kmem is disabled */
 			if (!memcg_kmem_online() &&
@@ -536,15 +564,20 @@ static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
 					set_shrinker_bit(memcg, nid, shrinker_id);
 			}
 			freed += ret;
-
-			if (rwsem_is_contended(&shrinker_rwsem)) {
-				freed = freed ? : 1;
-				goto unlock;
-			}
+			shrinker_put(shrinker);
 		}
+
+		/*
+		 * We have already exited the read-side of rcu critical section
+		 * before calling do_shrink_slab(), the shrinker_info may be
+		 * released in expand_one_shrinker_info(), so reacquire the
+		 * shrinker_info.
+		 */
+		index++;
+		goto again;
 	}
 unlock:
-	up_read(&shrinker_rwsem);
+	rcu_read_unlock();
 	return freed;
 }
 #else /* !CONFIG_MEMCG */
@@ -652,7 +685,7 @@ struct shrinker *shrinker_alloc(unsigned int flags, const char *fmt, ...)
 	shrinker->flags = flags;
 
 	if (flags & SHRINKER_MEMCG_AWARE) {
-		err = prealloc_memcg_shrinker(shrinker);
+		err = shrinker_memcg_alloc(shrinker);
 		if (err == -ENOSYS)
 			shrinker->flags &= ~SHRINKER_MEMCG_AWARE;
 		else if (err == 0)
@@ -697,9 +730,9 @@ void shrinker_free_non_registered(struct shrinker *shrinker)
 	shrinker->name = NULL;
 #endif
 	if (shrinker->flags & SHRINKER_MEMCG_AWARE) {
-		down_write(&shrinker_rwsem);
-		unregister_memcg_shrinker(shrinker);
-		up_write(&shrinker_rwsem);
+		spin_lock(&shrinker_lock);
+		shrinker_memcg_remove(shrinker);
+		spin_unlock(&shrinker_lock);
 	}
 
 	kfree(shrinker->nr_deferred);
@@ -731,13 +764,7 @@ void shrinker_unregister(struct shrinker *shrinker)
 		return;
 
 	WRITE_ONCE(shrinker->registered, false);
-
-	down_write(&shrinker_rwsem);
-	if (shrinker->flags & SHRINKER_MEMCG_AWARE)
-		unregister_memcg_shrinker(shrinker);
 	debugfs_entry = shrinker_debugfs_detach(shrinker, &debugfs_id);
-	up_write(&shrinker_rwsem);
-
 	shrinker_debugfs_remove(debugfs_entry, debugfs_id);
 
 	shrinker_put(shrinker);
diff --git a/mm/shrinker_debug.c b/mm/shrinker_debug.c
index c5573066adbf..badda35464c3 100644
--- a/mm/shrinker_debug.c
+++ b/mm/shrinker_debug.c
@@ -246,8 +246,7 @@ struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
 {
 	struct dentry *entry = shrinker->debugfs_entry;
 
-	lockdep_assert_held(&shrinker_rwsem);
-
+	down_write(&shrinker_rwsem);
 	kfree_const(shrinker->name);
 	shrinker->name = NULL;
 
@@ -258,6 +257,7 @@ struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
 	 */
 	smp_wmb();
 	shrinker->debugfs_entry = NULL;
+	up_write(&shrinker_rwsem);
 
 	return entry;
 }
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
