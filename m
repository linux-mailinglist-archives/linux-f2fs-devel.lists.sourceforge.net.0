Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBE575F2E1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jul 2023 12:21:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qNsgc-00015f-QL;
	Mon, 24 Jul 2023 10:21:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qNsgU-00015E-4T
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 10:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6ldGbVJmWFW3GnmiCRXjaV59N76MCfDcOlWufUCYnHU=; b=Jhf7UB+Dm/oGUnCrIIhNJUXNoj
 TP+y2fAZx+/rO0OI512Gep04hlsYwmIVuD480wf6XZ0oAUtlPRwBuI8hlSRlwiScmLkQD9CrzWr+9
 jEjbSYjkCjvX/nfZ2yWOqmdA0ndmOyqaYyKI3DjMfLjwwrdCoLWSU4Y5HLSEM4BJxS6k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6ldGbVJmWFW3GnmiCRXjaV59N76MCfDcOlWufUCYnHU=; b=Z2EdVCBb6Dw4/q6BZ7sjfGj/dX
 sErANLJCtrPoIln2KxWStfBrZoPZZiq8uddNRDDOKEtSKlI2R/Tj5d6vtvSwYf0xO25Rs1u6N4Ebk
 qbIWVCwN1WqaYow1Iu6Em4ftT7nl1oOuETkAkRigicJHAn1EskTRQBvCJw3POicH+axM=;
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qNsgQ-000Q8b-EZ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 10:20:58 +0000
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-3a437f94084so250968b6e.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jul 2023 03:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690194049; x=1690798849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ldGbVJmWFW3GnmiCRXjaV59N76MCfDcOlWufUCYnHU=;
 b=b6Tw/MHBxbsBAHyEZtKhD2trwUcJ9AnRKL/YMQAx7zre0DF8SwxGlZ9TP/BeRGocvt
 GOrjrwPvkR6Fv71kerhe2cUjX/PSTJoMw+WHTA2TjUt3TTSMZp0EwLs25rZiyXi/hInn
 06PlIpBOb/C+ZxeplDN1ajEUGDp2rbg4bLCV6qlQLOj3pjMntSdaKrNQZ8Y9dzXjvmAB
 59/NlCydq7M/CCbm0A9rP3KiNw94dTBfmaHdzSqyFktBUP4SRk5RNzEt1i0DAjJJmRgz
 3QeOfzjI8gazfh3tYW8OobmTVLNcomeodsiji7OfZw7TZurCbJWtW+1cVdTqfkzxByTo
 dKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690194049; x=1690798849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ldGbVJmWFW3GnmiCRXjaV59N76MCfDcOlWufUCYnHU=;
 b=R5+8USOa9fqVlQh34NwmKm2vPo5q794nPtBygxk497hVcI7rZxBM2SSeLQk7M8dCKQ
 EBHmTCtD8XD9YQ45XskXJocWwcwIXuu1LcE7OgY7uX//zIapilPSvTE3UeH+Odo7IE2/
 XRb7+D1xA76/D+ROYGPy3WmFHPndDOdi0AnSPzprCDxvISWNzKEBVuTJCwyZDBmnwBBn
 6Vihl45Unhf58E/Rv3hi/l2qBugc8m7556KthCJ1m7z7C+tEc91X7fIF6mqRsUwCchzW
 76+8JV7kpHy+kORglG1YkdX6Ofs8MGlSF6+/w37iCG5/OMsxrJZRI1g0TAsm0DMKwWFB
 JFeA==
X-Gm-Message-State: ABy/qLY1JRD3JWMrJ0WCqxI1TqMpxkTPd1GF4EUbFBSOndsi3GIEeSFi
 FCfQ3HTRIoWjMBYwGaiFjJsTWq6u+1lyUlgae70=
X-Google-Smtp-Source: APBJJlGryO879V9BaBQDHKX8zWib3yCjxEUuCoHfosN5ailAJ/cPY/8UIz/oHWPeLcNN21dHKE1QRw==
X-Received: by 2002:a17:902:ea01:b0:1bb:83ec:832 with SMTP id
 s1-20020a170902ea0100b001bb83ec0832mr8344187plg.2.1690192421320; 
 Mon, 24 Jul 2023 02:53:41 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:53:41 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 24 Jul 2023 17:43:50 +0800
Message-Id: <20230724094354.90817-44-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently, we maintain two linear arrays per node per memcg, 
 which are shrinker_info::map and shrinker_info::nr_deferred. And we need
 to resize them when the shrinker_nr_max is exceeded, that is, allo [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.182 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.182 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qNsgQ-000Q8b-EZ
Subject: [f2fs-dev] [PATCH v2 43/47] mm: shrinker: add a secondary array for
 shrinker_info::{map, nr_deferred}
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

Currently, we maintain two linear arrays per node per memcg, which are
shrinker_info::map and shrinker_info::nr_deferred. And we need to resize
them when the shrinker_nr_max is exceeded, that is, allocate a new array,
and then copy the old array to the new array, and finally free the old
array by RCU.

For shrinker_info::map, we do set_bit() under the RCU lock, so we may set
the value into the old map which is about to be freed. This may cause the
value set to be lost. The current solution is not to copy the old map when
resizing, but to set all the corresponding bits in the new map to 1. This
solves the data loss problem, but bring the overhead of more pointless
loops while doing memcg slab shrink.

For shrinker_info::nr_deferred, we will only modify it under the read lock
of shrinker_rwsem, so it will not run concurrently with the resizing. But
after we make memcg slab shrink lockless, there will be the same data loss
problem as shrinker_info::map, and we can't work around it like the map.

For such resizable arrays, the most straightforward idea is to change it
to xarray, like we did for list_lru [1]. We need to do xa_store() in the
list_lru_add()-->set_shrinker_bit(), but this will cause memory
allocation, and the list_lru_add() doesn't accept failure. A possible
solution is to pre-allocate, but the location of pre-allocation is not
well determined.

Therefore, this commit chooses to introduce a secondary array for
shrinker_info::{map, nr_deferred}, so that we only need to copy this
secondary array every time the size is resized. Then even if we get the
old secondary array under the RCU lock, the found map and nr_deferred are
also true, so no data is lost.

[1]. https://lore.kernel.org/all/20220228122126.37293-13-songmuchun@bytedance.com/

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/linux/memcontrol.h |  12 +-
 include/linux/shrinker.h   |  17 +++
 mm/shrinker.c              | 250 +++++++++++++++++++++++--------------
 3 files changed, 172 insertions(+), 107 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 58eb7ca65699..1a2e9d15822d 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -21,6 +21,7 @@
 #include <linux/vmstat.h>
 #include <linux/writeback.h>
 #include <linux/page-flags.h>
+#include <linux/shrinker.h>
 
 struct mem_cgroup;
 struct obj_cgroup;
@@ -88,17 +89,6 @@ struct mem_cgroup_reclaim_iter {
 	unsigned int generation;
 };
 
-/*
- * Bitmap and deferred work of shrinker::id corresponding to memcg-aware
- * shrinkers, which have elements charged to this memcg.
- */
-struct shrinker_info {
-	struct rcu_head rcu;
-	atomic_long_t *nr_deferred;
-	unsigned long *map;
-	int map_nr_max;
-};
-
 struct lruvec_stats_percpu {
 	/* Local (CPU and cgroup) state */
 	long state[NR_VM_NODE_STAT_ITEMS];
diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
index 23ea9360c5d8..36977a70bebb 100644
--- a/include/linux/shrinker.h
+++ b/include/linux/shrinker.h
@@ -5,6 +5,23 @@
 #include <linux/atomic.h>
 #include <linux/types.h>
 
+#define SHRINKER_UNIT_BITS	BITS_PER_LONG
+
+/*
+ * Bitmap and deferred work of shrinker::id corresponding to memcg-aware
+ * shrinkers, which have elements charged to the memcg.
+ */
+struct shrinker_info_unit {
+	atomic_long_t nr_deferred[SHRINKER_UNIT_BITS];
+	DECLARE_BITMAP(map, SHRINKER_UNIT_BITS);
+};
+
+struct shrinker_info {
+	struct rcu_head rcu;
+	int map_nr_max;
+	struct shrinker_info_unit *unit[];
+};
+
 /*
  * This struct is used to pass information from page reclaim to the shrinkers.
  * We consolidate the values for easier extension later.
diff --git a/mm/shrinker.c b/mm/shrinker.c
index 3c4d3fe2fa17..8a1fe844f1a4 100644
--- a/mm/shrinker.c
+++ b/mm/shrinker.c
@@ -10,15 +10,50 @@ DECLARE_RWSEM(shrinker_rwsem);
 #ifdef CONFIG_MEMCG
 static int shrinker_nr_max;
 
-/* The shrinker_info is expanded in a batch of BITS_PER_LONG */
-static inline int shrinker_map_size(int nr_items)
+static inline int shrinker_unit_size(int nr_items)
 {
-	return (DIV_ROUND_UP(nr_items, BITS_PER_LONG) * sizeof(unsigned long));
+	return (DIV_ROUND_UP(nr_items, SHRINKER_UNIT_BITS) * sizeof(struct shrinker_info_unit *));
 }
 
-static inline int shrinker_defer_size(int nr_items)
+static inline void shrinker_unit_free(struct shrinker_info *info, int start)
 {
-	return (round_up(nr_items, BITS_PER_LONG) * sizeof(atomic_long_t));
+	struct shrinker_info_unit **unit;
+	int nr, i;
+
+	if (!info)
+		return;
+
+	unit = info->unit;
+	nr = DIV_ROUND_UP(info->map_nr_max, SHRINKER_UNIT_BITS);
+
+	for (i = start; i < nr; i++) {
+		if (!unit[i])
+			break;
+
+		kvfree(unit[i]);
+		unit[i] = NULL;
+	}
+}
+
+static inline int shrinker_unit_alloc(struct shrinker_info *new,
+				       struct shrinker_info *old, int nid)
+{
+	struct shrinker_info_unit *unit;
+	int nr = DIV_ROUND_UP(new->map_nr_max, SHRINKER_UNIT_BITS);
+	int start = old ? DIV_ROUND_UP(old->map_nr_max, SHRINKER_UNIT_BITS) : 0;
+	int i;
+
+	for (i = start; i < nr; i++) {
+		unit = kvzalloc_node(sizeof(*unit), GFP_KERNEL, nid);
+		if (!unit) {
+			shrinker_unit_free(new, start);
+			return -ENOMEM;
+		}
+
+		new->unit[i] = unit;
+	}
+
+	return 0;
 }
 
 void free_shrinker_info(struct mem_cgroup *memcg)
@@ -30,6 +65,7 @@ void free_shrinker_info(struct mem_cgroup *memcg)
 	for_each_node(nid) {
 		pn = memcg->nodeinfo[nid];
 		info = rcu_dereference_protected(pn->shrinker_info, true);
+		shrinker_unit_free(info, 0);
 		kvfree(info);
 		rcu_assign_pointer(pn->shrinker_info, NULL);
 	}
@@ -38,28 +74,27 @@ void free_shrinker_info(struct mem_cgroup *memcg)
 int alloc_shrinker_info(struct mem_cgroup *memcg)
 {
 	struct shrinker_info *info;
-	int nid, size, ret = 0;
-	int map_size, defer_size = 0;
+	int nid, ret = 0;
+	int array_size = 0;
 
 	down_write(&shrinker_rwsem);
-	map_size = shrinker_map_size(shrinker_nr_max);
-	defer_size = shrinker_defer_size(shrinker_nr_max);
-	size = map_size + defer_size;
+	array_size = shrinker_unit_size(shrinker_nr_max);
 	for_each_node(nid) {
-		info = kvzalloc_node(sizeof(*info) + size, GFP_KERNEL, nid);
-		if (!info) {
-			free_shrinker_info(memcg);
-			ret = -ENOMEM;
-			break;
-		}
-		info->nr_deferred = (atomic_long_t *)(info + 1);
-		info->map = (void *)info->nr_deferred + defer_size;
+		info = kvzalloc_node(sizeof(*info) + array_size, GFP_KERNEL, nid);
+		if (!info)
+			goto err;
 		info->map_nr_max = shrinker_nr_max;
+		if (shrinker_unit_alloc(info, NULL, nid))
+			goto err;
 		rcu_assign_pointer(memcg->nodeinfo[nid]->shrinker_info, info);
 	}
 	up_write(&shrinker_rwsem);
 
 	return ret;
+
+err:
+	free_shrinker_info(memcg);
+	return -ENOMEM;
 }
 
 static struct shrinker_info *shrinker_info_protected(struct mem_cgroup *memcg,
@@ -69,15 +104,12 @@ static struct shrinker_info *shrinker_info_protected(struct mem_cgroup *memcg,
 					 lockdep_is_held(&shrinker_rwsem));
 }
 
-static int expand_one_shrinker_info(struct mem_cgroup *memcg,
-				    int map_size, int defer_size,
-				    int old_map_size, int old_defer_size,
-				    int new_nr_max)
+static int expand_one_shrinker_info(struct mem_cgroup *memcg, int new_size,
+				    int old_size, int new_nr_max)
 {
 	struct shrinker_info *new, *old;
 	struct mem_cgroup_per_node *pn;
 	int nid;
-	int size = map_size + defer_size;
 
 	for_each_node(nid) {
 		pn = memcg->nodeinfo[nid];
@@ -90,21 +122,18 @@ static int expand_one_shrinker_info(struct mem_cgroup *memcg,
 		if (new_nr_max <= old->map_nr_max)
 			continue;
 
-		new = kvmalloc_node(sizeof(*new) + size, GFP_KERNEL, nid);
+		new = kvmalloc_node(sizeof(*new) + new_size, GFP_KERNEL, nid);
 		if (!new)
 			return -ENOMEM;
 
-		new->nr_deferred = (atomic_long_t *)(new + 1);
-		new->map = (void *)new->nr_deferred + defer_size;
 		new->map_nr_max = new_nr_max;
 
-		/* map: set all old bits, clear all new bits */
-		memset(new->map, (int)0xff, old_map_size);
-		memset((void *)new->map + old_map_size, 0, map_size - old_map_size);
-		/* nr_deferred: copy old values, clear all new values */
-		memcpy(new->nr_deferred, old->nr_deferred, old_defer_size);
-		memset((void *)new->nr_deferred + old_defer_size, 0,
-		       defer_size - old_defer_size);
+		/* copy old values, allocate all new values */
+		memcpy(new->unit, old->unit, old_size);
+		if (shrinker_unit_alloc(new, old, nid)) {
+			kvfree(new);
+			return -ENOMEM;
+		}
 
 		rcu_assign_pointer(pn->shrinker_info, new);
 		kvfree_rcu(old, rcu);
@@ -116,9 +145,8 @@ static int expand_one_shrinker_info(struct mem_cgroup *memcg,
 static int expand_shrinker_info(int new_id)
 {
 	int ret = 0;
-	int new_nr_max = round_up(new_id + 1, BITS_PER_LONG);
-	int map_size, defer_size = 0;
-	int old_map_size, old_defer_size = 0;
+	int new_nr_max = round_up(new_id + 1, SHRINKER_UNIT_BITS);
+	int new_size, old_size = 0;
 	struct mem_cgroup *memcg;
 
 	if (!root_mem_cgroup)
@@ -126,15 +154,12 @@ static int expand_shrinker_info(int new_id)
 
 	lockdep_assert_held(&shrinker_rwsem);
 
-	map_size = shrinker_map_size(new_nr_max);
-	defer_size = shrinker_defer_size(new_nr_max);
-	old_map_size = shrinker_map_size(shrinker_nr_max);
-	old_defer_size = shrinker_defer_size(shrinker_nr_max);
+	new_size = shrinker_unit_size(new_nr_max);
+	old_size = shrinker_unit_size(shrinker_nr_max);
 
 	memcg = mem_cgroup_iter(NULL, NULL, NULL);
 	do {
-		ret = expand_one_shrinker_info(memcg, map_size, defer_size,
-					       old_map_size, old_defer_size,
+		ret = expand_one_shrinker_info(memcg, new_size, old_size,
 					       new_nr_max);
 		if (ret) {
 			mem_cgroup_iter_break(NULL, memcg);
@@ -148,17 +173,34 @@ static int expand_shrinker_info(int new_id)
 	return ret;
 }
 
+static inline int shriner_id_to_index(int shrinker_id)
+{
+	return shrinker_id / SHRINKER_UNIT_BITS;
+}
+
+static inline int shriner_id_to_offset(int shrinker_id)
+{
+	return shrinker_id % SHRINKER_UNIT_BITS;
+}
+
+static inline int calc_shrinker_id(int index, int offset)
+{
+	return index * SHRINKER_UNIT_BITS + offset;
+}
+
 void set_shrinker_bit(struct mem_cgroup *memcg, int nid, int shrinker_id)
 {
 	if (shrinker_id >= 0 && memcg && !mem_cgroup_is_root(memcg)) {
 		struct shrinker_info *info;
+		struct shrinker_info_unit *unit;
 
 		rcu_read_lock();
 		info = rcu_dereference(memcg->nodeinfo[nid]->shrinker_info);
+		unit = info->unit[shriner_id_to_index(shrinker_id)];
 		if (!WARN_ON_ONCE(shrinker_id >= info->map_nr_max)) {
 			/* Pairs with smp mb in shrink_slab() */
 			smp_mb__before_atomic();
-			set_bit(shrinker_id, info->map);
+			set_bit(shriner_id_to_offset(shrinker_id), unit->map);
 		}
 		rcu_read_unlock();
 	}
@@ -207,26 +249,31 @@ static long xchg_nr_deferred_memcg(int nid, struct shrinker *shrinker,
 				   struct mem_cgroup *memcg)
 {
 	struct shrinker_info *info;
+	struct shrinker_info_unit *unit;
 
 	info = shrinker_info_protected(memcg, nid);
-	return atomic_long_xchg(&info->nr_deferred[shrinker->id], 0);
+	unit = info->unit[shriner_id_to_index(shrinker->id)];
+	return atomic_long_xchg(&unit->nr_deferred[shriner_id_to_offset(shrinker->id)], 0);
 }
 
 static long add_nr_deferred_memcg(long nr, int nid, struct shrinker *shrinker,
 				  struct mem_cgroup *memcg)
 {
 	struct shrinker_info *info;
+	struct shrinker_info_unit *unit;
 
 	info = shrinker_info_protected(memcg, nid);
-	return atomic_long_add_return(nr, &info->nr_deferred[shrinker->id]);
+	unit = info->unit[shriner_id_to_index(shrinker->id)];
+	return atomic_long_add_return(nr, &unit->nr_deferred[shriner_id_to_offset(shrinker->id)]);
 }
 
 void reparent_shrinker_deferred(struct mem_cgroup *memcg)
 {
-	int i, nid;
+	int nid, index, offset;
 	long nr;
 	struct mem_cgroup *parent;
 	struct shrinker_info *child_info, *parent_info;
+	struct shrinker_info_unit *child_unit, *parent_unit;
 
 	parent = parent_mem_cgroup(memcg);
 	if (!parent)
@@ -237,9 +284,13 @@ void reparent_shrinker_deferred(struct mem_cgroup *memcg)
 	for_each_node(nid) {
 		child_info = shrinker_info_protected(memcg, nid);
 		parent_info = shrinker_info_protected(parent, nid);
-		for (i = 0; i < child_info->map_nr_max; i++) {
-			nr = atomic_long_read(&child_info->nr_deferred[i]);
-			atomic_long_add(nr, &parent_info->nr_deferred[i]);
+		for (index = 0; index < shriner_id_to_index(child_info->map_nr_max); index++) {
+			child_unit = child_info->unit[index];
+			parent_unit = parent_info->unit[index];
+			for (offset = 0; offset < SHRINKER_UNIT_BITS; offset++) {
+				nr = atomic_long_read(&child_unit->nr_deferred[offset]);
+				atomic_long_add(nr, &parent_unit->nr_deferred[offset]);
+			}
 		}
 	}
 	up_read(&shrinker_rwsem);
@@ -405,7 +456,7 @@ static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
 {
 	struct shrinker_info *info;
 	unsigned long ret, freed = 0;
-	int i;
+	int offset, index = 0;
 
 	if (!mem_cgroup_online(memcg))
 		return 0;
@@ -417,56 +468,63 @@ static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
 	if (unlikely(!info))
 		goto unlock;
 
-	for_each_set_bit(i, info->map, info->map_nr_max) {
-		struct shrink_control sc = {
-			.gfp_mask = gfp_mask,
-			.nid = nid,
-			.memcg = memcg,
-		};
-		struct shrinker *shrinker;
+	for (; index < shriner_id_to_index(info->map_nr_max); index++) {
+		struct shrinker_info_unit *unit;
 
-		shrinker = idr_find(&shrinker_idr, i);
-		if (unlikely(!shrinker || !(shrinker->flags & SHRINKER_REGISTERED))) {
-			if (!shrinker)
-				clear_bit(i, info->map);
-			continue;
-		}
+		unit = info->unit[index];
 
-		/* Call non-slab shrinkers even though kmem is disabled */
-		if (!memcg_kmem_online() &&
-		    !(shrinker->flags & SHRINKER_NONSLAB))
-			continue;
+		for_each_set_bit(offset, unit->map, SHRINKER_UNIT_BITS) {
+			struct shrink_control sc = {
+				.gfp_mask = gfp_mask,
+				.nid = nid,
+				.memcg = memcg,
+			};
+			struct shrinker *shrinker;
+			int shrinker_id = calc_shrinker_id(index, offset);
 
-		ret = do_shrink_slab(&sc, shrinker, priority);
-		if (ret == SHRINK_EMPTY) {
-			clear_bit(i, info->map);
-			/*
-			 * After the shrinker reported that it had no objects to
-			 * free, but before we cleared the corresponding bit in
-			 * the memcg shrinker map, a new object might have been
-			 * added. To make sure, we have the bit set in this
-			 * case, we invoke the shrinker one more time and reset
-			 * the bit if it reports that it is not empty anymore.
-			 * The memory barrier here pairs with the barrier in
-			 * set_shrinker_bit():
-			 *
-			 * list_lru_add()     shrink_slab_memcg()
-			 *   list_add_tail()    clear_bit()
-			 *   <MB>               <MB>
-			 *   set_bit()          do_shrink_slab()
-			 */
-			smp_mb__after_atomic();
-			ret = do_shrink_slab(&sc, shrinker, priority);
-			if (ret == SHRINK_EMPTY)
-				ret = 0;
-			else
-				set_shrinker_bit(memcg, nid, i);
-		}
-		freed += ret;
+			shrinker = idr_find(&shrinker_idr, shrinker_id);
+			if (unlikely(!shrinker || !(shrinker->flags & SHRINKER_REGISTERED))) {
+				if (!shrinker)
+					clear_bit(offset, unit->map);
+				continue;
+			}
 
-		if (rwsem_is_contended(&shrinker_rwsem)) {
-			freed = freed ? : 1;
-			break;
+			/* Call non-slab shrinkers even though kmem is disabled */
+			if (!memcg_kmem_online() &&
+			    !(shrinker->flags & SHRINKER_NONSLAB))
+				continue;
+
+			ret = do_shrink_slab(&sc, shrinker, priority);
+			if (ret == SHRINK_EMPTY) {
+				clear_bit(offset, unit->map);
+				/*
+				 * After the shrinker reported that it had no objects to
+				 * free, but before we cleared the corresponding bit in
+				 * the memcg shrinker map, a new object might have been
+				 * added. To make sure, we have the bit set in this
+				 * case, we invoke the shrinker one more time and reset
+				 * the bit if it reports that it is not empty anymore.
+				 * The memory barrier here pairs with the barrier in
+				 * set_shrinker_bit():
+				 *
+				 * list_lru_add()     shrink_slab_memcg()
+				 *   list_add_tail()    clear_bit()
+				 *   <MB>               <MB>
+				 *   set_bit()          do_shrink_slab()
+				 */
+				smp_mb__after_atomic();
+				ret = do_shrink_slab(&sc, shrinker, priority);
+				if (ret == SHRINK_EMPTY)
+					ret = 0;
+				else
+					set_shrinker_bit(memcg, nid, shrinker_id);
+			}
+			freed += ret;
+
+			if (rwsem_is_contended(&shrinker_rwsem)) {
+				freed = freed ? : 1;
+				goto unlock;
+			}
 		}
 	}
 unlock:
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
