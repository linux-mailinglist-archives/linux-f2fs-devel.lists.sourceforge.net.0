Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FC7771F6D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 13:10:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qSy86-0001m2-LQ;
	Mon, 07 Aug 2023 11:10:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qSy84-0001lq-R0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 11:10:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GEi4MYuk0OEYflth0Mb1DlFyZuiRlqXPhzGhOI28yow=; b=b6jEjP54Wu+3DpSUncYgSGc15b
 XplMTe1k5iHtoABiUXnDbo52SljL2wmeNou7H9DgIz/2uraNIcz6YqAoKtI7x8eQfxi35muHIfj3r
 LOL1h24KQ/xOd/2Utb2tAWP0vzHo38YmzB4u6DndXLb5bn8nkn78U/y8Ini8isT2GMzQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GEi4MYuk0OEYflth0Mb1DlFyZuiRlqXPhzGhOI28yow=; b=NeRd4kVY8f8CzcvHSu6nF4lrA6
 Y7djt7jLCXnqmHSBuyE0oWHF8RTvG/M04NDTncOuXXQ53Oy5f1hmnpnYj0h5K52OokyvOgNLSkuIt
 FrojpmlmYpZrmqPjWuPFGDVmIV/dLnKZP4+PC0kRraWklEjgqMXUrhWFK6uhFsD8Gx/w=;
Received: from mail-pf1-f177.google.com ([209.85.210.177])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qSy83-00FrUh-WD for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 11:10:29 +0000
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-6879986a436so689457b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 07 Aug 2023 04:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1691406622; x=1692011422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GEi4MYuk0OEYflth0Mb1DlFyZuiRlqXPhzGhOI28yow=;
 b=BEvTj+xwW+T88pT01ic9HCjfMsNsUtdxPovUDtMtpNRFgKOF7OPKZlfnwvdpMrZsO1
 yoJN3VDoQT6bqGjHEFD+GOFUbTFyPWQ9AmgWQHHMtUKtDFwB2AaCD8h8ed/2/nFlj6R/
 H6RbchdxL8KOcvrs5+S0zZOQ7z5kmO5+1Ob9A43qfRUa8zWOsgqkDlWkIZ6Nce8P3hyT
 6WUFOueyKbkU0/JQe7kyXIgtpN16Nt1532HkzF1M6pOxV7CrOQJaiVOX1MvieAVDT9mZ
 7Wp39SMBYWooErXp+bNrum847BTmBIxZLX39IVOZTRIPZyaqqeRkUBu+bq48TNvJ2qgU
 oNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691406622; x=1692011422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GEi4MYuk0OEYflth0Mb1DlFyZuiRlqXPhzGhOI28yow=;
 b=ejdUN05OdeLNLtivbFjxXfF23QcmsR7VlGYOX8fnR6XS8BpIIuYndTuKJTMSomMvYK
 XBM8YCfvofk10QT7UOlrt6BdY4pR5S6l8TVOYQFcqF1F3xR4bs02lwFzBMiTD80g8JeL
 nCs19kL9RFqcxjq+Ero3shv7uXXiO9N2C575G1ZAeDE4S41HfhrvhLcbJGu0xekG5WDl
 2gAlmcouYfUjoOip2MPphmemVEd02kq2vGNhCbGaI1PVWmV0faL2o3MyMk3GxBjbI0RB
 O9iAsth5nn+cPdyssh1RcPHDv8FIvLUw2AjsDPjznpIzVCZQOk08jpFEkwSk9lwl0+Tv
 Eecg==
X-Gm-Message-State: ABy/qLbkgGfidaMzxnZkoWcNp8ZWpEEL68FIMYu16ovPS57voSsWIqtB
 XKC0qIZ/thfn9xD+DWVC/mI+3g==
X-Google-Smtp-Source: APBJJlH6EApx+wddxarWw2nzmVwQ6n81Kim8/orhAtf/liUQAlYr06Fft6gh/8UZFDYZK5CJyxwGZw==
X-Received: by 2002:a17:903:22c6:b0:1b8:2ba0:c9a8 with SMTP id
 y6-20020a17090322c600b001b82ba0c9a8mr33072978plg.2.1691406622170; 
 Mon, 07 Aug 2023 04:10:22 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 04:10:21 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev,
 simon.horman@corigine.com, dlemoal@kernel.org
Date: Mon,  7 Aug 2023 19:08:50 +0800
Message-Id: <20230807110936.21819-3-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The mm/vmscan.c file is too large,
 so separate the shrinker-related
 code from it into a separate file. No functional changes. Signed-off-by:
 Qi Zheng <zhengqi.arch@bytedance.com> --- mm/Makefile | 4 +- mm/internal.h
 | 2 + mm/shrinker.c | 709 ++++++++++++++++++++++++++++++++++++++++++++++++++
 mm/vmscan.c | 701 [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.177 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.177 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qSy83-00FrUh-WD
Subject: [f2fs-dev] [PATCH v4 02/48] mm: vmscan: move shrinker-related code
 into a separate file
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

The mm/vmscan.c file is too large, so separate the shrinker-related
code from it into a separate file. No functional changes.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/Makefile   |   4 +-
 mm/internal.h |   2 +
 mm/shrinker.c | 709 ++++++++++++++++++++++++++++++++++++++++++++++++++
 mm/vmscan.c   | 701 -------------------------------------------------
 4 files changed, 713 insertions(+), 703 deletions(-)
 create mode 100644 mm/shrinker.c

diff --git a/mm/Makefile b/mm/Makefile
index ec65984e2ade..33873c8aedb3 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -48,8 +48,8 @@ endif
 
 obj-y			:= filemap.o mempool.o oom_kill.o fadvise.o \
 			   maccess.o page-writeback.o folio-compat.o \
-			   readahead.o swap.o truncate.o vmscan.o shmem.o \
-			   util.o mmzone.o vmstat.o backing-dev.o \
+			   readahead.o swap.o truncate.o vmscan.o shrinker.o \
+			   shmem.o util.o mmzone.o vmstat.o backing-dev.o \
 			   mm_init.o percpu.o slab_common.o \
 			   compaction.o show_mem.o shmem_quota.o\
 			   interval_tree.o list_lru.o workingset.o \
diff --git a/mm/internal.h b/mm/internal.h
index 6f21926393af..b98c29f0a471 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1147,6 +1147,8 @@ struct vma_prepare {
 /*
  * shrinker related functions
  */
+unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
+			  int priority);
 
 #ifdef CONFIG_SHRINKER_DEBUG
 extern int shrinker_debugfs_add(struct shrinker *shrinker);
diff --git a/mm/shrinker.c b/mm/shrinker.c
new file mode 100644
index 000000000000..043c87ccfab4
--- /dev/null
+++ b/mm/shrinker.c
@@ -0,0 +1,709 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/memcontrol.h>
+#include <linux/rwsem.h>
+#include <linux/shrinker.h>
+#include <trace/events/vmscan.h>
+
+#include "internal.h"
+
+LIST_HEAD(shrinker_list);
+DECLARE_RWSEM(shrinker_rwsem);
+
+#ifdef CONFIG_MEMCG
+static int shrinker_nr_max;
+
+/* The shrinker_info is expanded in a batch of BITS_PER_LONG */
+static inline int shrinker_map_size(int nr_items)
+{
+	return (DIV_ROUND_UP(nr_items, BITS_PER_LONG) * sizeof(unsigned long));
+}
+
+static inline int shrinker_defer_size(int nr_items)
+{
+	return (round_up(nr_items, BITS_PER_LONG) * sizeof(atomic_long_t));
+}
+
+void free_shrinker_info(struct mem_cgroup *memcg)
+{
+	struct mem_cgroup_per_node *pn;
+	struct shrinker_info *info;
+	int nid;
+
+	for_each_node(nid) {
+		pn = memcg->nodeinfo[nid];
+		info = rcu_dereference_protected(pn->shrinker_info, true);
+		kvfree(info);
+		rcu_assign_pointer(pn->shrinker_info, NULL);
+	}
+}
+
+int alloc_shrinker_info(struct mem_cgroup *memcg)
+{
+	struct shrinker_info *info;
+	int nid, size, ret = 0;
+	int map_size, defer_size = 0;
+
+	down_write(&shrinker_rwsem);
+	map_size = shrinker_map_size(shrinker_nr_max);
+	defer_size = shrinker_defer_size(shrinker_nr_max);
+	size = map_size + defer_size;
+	for_each_node(nid) {
+		info = kvzalloc_node(sizeof(*info) + size, GFP_KERNEL, nid);
+		if (!info) {
+			free_shrinker_info(memcg);
+			ret = -ENOMEM;
+			break;
+		}
+		info->nr_deferred = (atomic_long_t *)(info + 1);
+		info->map = (void *)info->nr_deferred + defer_size;
+		info->map_nr_max = shrinker_nr_max;
+		rcu_assign_pointer(memcg->nodeinfo[nid]->shrinker_info, info);
+	}
+	up_write(&shrinker_rwsem);
+
+	return ret;
+}
+
+static struct shrinker_info *shrinker_info_protected(struct mem_cgroup *memcg,
+						     int nid)
+{
+	return rcu_dereference_protected(memcg->nodeinfo[nid]->shrinker_info,
+					 lockdep_is_held(&shrinker_rwsem));
+}
+
+static int expand_one_shrinker_info(struct mem_cgroup *memcg,
+				    int map_size, int defer_size,
+				    int old_map_size, int old_defer_size,
+				    int new_nr_max)
+{
+	struct shrinker_info *new, *old;
+	struct mem_cgroup_per_node *pn;
+	int nid;
+	int size = map_size + defer_size;
+
+	for_each_node(nid) {
+		pn = memcg->nodeinfo[nid];
+		old = shrinker_info_protected(memcg, nid);
+		/* Not yet online memcg */
+		if (!old)
+			return 0;
+
+		/* Already expanded this shrinker_info */
+		if (new_nr_max <= old->map_nr_max)
+			continue;
+
+		new = kvmalloc_node(sizeof(*new) + size, GFP_KERNEL, nid);
+		if (!new)
+			return -ENOMEM;
+
+		new->nr_deferred = (atomic_long_t *)(new + 1);
+		new->map = (void *)new->nr_deferred + defer_size;
+		new->map_nr_max = new_nr_max;
+
+		/* map: set all old bits, clear all new bits */
+		memset(new->map, (int)0xff, old_map_size);
+		memset((void *)new->map + old_map_size, 0, map_size - old_map_size);
+		/* nr_deferred: copy old values, clear all new values */
+		memcpy(new->nr_deferred, old->nr_deferred, old_defer_size);
+		memset((void *)new->nr_deferred + old_defer_size, 0,
+		       defer_size - old_defer_size);
+
+		rcu_assign_pointer(pn->shrinker_info, new);
+		kvfree_rcu(old, rcu);
+	}
+
+	return 0;
+}
+
+static int expand_shrinker_info(int new_id)
+{
+	int ret = 0;
+	int new_nr_max = round_up(new_id + 1, BITS_PER_LONG);
+	int map_size, defer_size = 0;
+	int old_map_size, old_defer_size = 0;
+	struct mem_cgroup *memcg;
+
+	if (!root_mem_cgroup)
+		goto out;
+
+	lockdep_assert_held(&shrinker_rwsem);
+
+	map_size = shrinker_map_size(new_nr_max);
+	defer_size = shrinker_defer_size(new_nr_max);
+	old_map_size = shrinker_map_size(shrinker_nr_max);
+	old_defer_size = shrinker_defer_size(shrinker_nr_max);
+
+	memcg = mem_cgroup_iter(NULL, NULL, NULL);
+	do {
+		ret = expand_one_shrinker_info(memcg, map_size, defer_size,
+					       old_map_size, old_defer_size,
+					       new_nr_max);
+		if (ret) {
+			mem_cgroup_iter_break(NULL, memcg);
+			goto out;
+		}
+	} while ((memcg = mem_cgroup_iter(NULL, memcg, NULL)) != NULL);
+out:
+	if (!ret)
+		shrinker_nr_max = new_nr_max;
+
+	return ret;
+}
+
+void set_shrinker_bit(struct mem_cgroup *memcg, int nid, int shrinker_id)
+{
+	if (shrinker_id >= 0 && memcg && !mem_cgroup_is_root(memcg)) {
+		struct shrinker_info *info;
+
+		rcu_read_lock();
+		info = rcu_dereference(memcg->nodeinfo[nid]->shrinker_info);
+		if (!WARN_ON_ONCE(shrinker_id >= info->map_nr_max)) {
+			/* Pairs with smp mb in shrink_slab() */
+			smp_mb__before_atomic();
+			set_bit(shrinker_id, info->map);
+		}
+		rcu_read_unlock();
+	}
+}
+
+static DEFINE_IDR(shrinker_idr);
+
+static int prealloc_memcg_shrinker(struct shrinker *shrinker)
+{
+	int id, ret = -ENOMEM;
+
+	if (mem_cgroup_disabled())
+		return -ENOSYS;
+
+	down_write(&shrinker_rwsem);
+	/* This may call shrinker, so it must use down_read_trylock() */
+	id = idr_alloc(&shrinker_idr, shrinker, 0, 0, GFP_KERNEL);
+	if (id < 0)
+		goto unlock;
+
+	if (id >= shrinker_nr_max) {
+		if (expand_shrinker_info(id)) {
+			idr_remove(&shrinker_idr, id);
+			goto unlock;
+		}
+	}
+	shrinker->id = id;
+	ret = 0;
+unlock:
+	up_write(&shrinker_rwsem);
+	return ret;
+}
+
+static void unregister_memcg_shrinker(struct shrinker *shrinker)
+{
+	int id = shrinker->id;
+
+	BUG_ON(id < 0);
+
+	lockdep_assert_held(&shrinker_rwsem);
+
+	idr_remove(&shrinker_idr, id);
+}
+
+static long xchg_nr_deferred_memcg(int nid, struct shrinker *shrinker,
+				   struct mem_cgroup *memcg)
+{
+	struct shrinker_info *info;
+
+	info = shrinker_info_protected(memcg, nid);
+	return atomic_long_xchg(&info->nr_deferred[shrinker->id], 0);
+}
+
+static long add_nr_deferred_memcg(long nr, int nid, struct shrinker *shrinker,
+				  struct mem_cgroup *memcg)
+{
+	struct shrinker_info *info;
+
+	info = shrinker_info_protected(memcg, nid);
+	return atomic_long_add_return(nr, &info->nr_deferred[shrinker->id]);
+}
+
+void reparent_shrinker_deferred(struct mem_cgroup *memcg)
+{
+	int i, nid;
+	long nr;
+	struct mem_cgroup *parent;
+	struct shrinker_info *child_info, *parent_info;
+
+	parent = parent_mem_cgroup(memcg);
+	if (!parent)
+		parent = root_mem_cgroup;
+
+	/* Prevent from concurrent shrinker_info expand */
+	down_read(&shrinker_rwsem);
+	for_each_node(nid) {
+		child_info = shrinker_info_protected(memcg, nid);
+		parent_info = shrinker_info_protected(parent, nid);
+		for (i = 0; i < child_info->map_nr_max; i++) {
+			nr = atomic_long_read(&child_info->nr_deferred[i]);
+			atomic_long_add(nr, &parent_info->nr_deferred[i]);
+		}
+	}
+	up_read(&shrinker_rwsem);
+}
+#else
+static int prealloc_memcg_shrinker(struct shrinker *shrinker)
+{
+	return -ENOSYS;
+}
+
+static void unregister_memcg_shrinker(struct shrinker *shrinker)
+{
+}
+
+static long xchg_nr_deferred_memcg(int nid, struct shrinker *shrinker,
+				   struct mem_cgroup *memcg)
+{
+	return 0;
+}
+
+static long add_nr_deferred_memcg(long nr, int nid, struct shrinker *shrinker,
+				  struct mem_cgroup *memcg)
+{
+	return 0;
+}
+#endif /* CONFIG_MEMCG */
+
+static long xchg_nr_deferred(struct shrinker *shrinker,
+			     struct shrink_control *sc)
+{
+	int nid = sc->nid;
+
+	if (!(shrinker->flags & SHRINKER_NUMA_AWARE))
+		nid = 0;
+
+	if (sc->memcg &&
+	    (shrinker->flags & SHRINKER_MEMCG_AWARE))
+		return xchg_nr_deferred_memcg(nid, shrinker,
+					      sc->memcg);
+
+	return atomic_long_xchg(&shrinker->nr_deferred[nid], 0);
+}
+
+
+static long add_nr_deferred(long nr, struct shrinker *shrinker,
+			    struct shrink_control *sc)
+{
+	int nid = sc->nid;
+
+	if (!(shrinker->flags & SHRINKER_NUMA_AWARE))
+		nid = 0;
+
+	if (sc->memcg &&
+	    (shrinker->flags & SHRINKER_MEMCG_AWARE))
+		return add_nr_deferred_memcg(nr, nid, shrinker,
+					     sc->memcg);
+
+	return atomic_long_add_return(nr, &shrinker->nr_deferred[nid]);
+}
+
+#define SHRINK_BATCH 128
+
+static unsigned long do_shrink_slab(struct shrink_control *shrinkctl,
+				    struct shrinker *shrinker, int priority)
+{
+	unsigned long freed = 0;
+	unsigned long long delta;
+	long total_scan;
+	long freeable;
+	long nr;
+	long new_nr;
+	long batch_size = shrinker->batch ? shrinker->batch
+					  : SHRINK_BATCH;
+	long scanned = 0, next_deferred;
+
+	freeable = shrinker->count_objects(shrinker, shrinkctl);
+	if (freeable == 0 || freeable == SHRINK_EMPTY)
+		return freeable;
+
+	/*
+	 * copy the current shrinker scan count into a local variable
+	 * and zero it so that other concurrent shrinker invocations
+	 * don't also do this scanning work.
+	 */
+	nr = xchg_nr_deferred(shrinker, shrinkctl);
+
+	if (shrinker->seeks) {
+		delta = freeable >> priority;
+		delta *= 4;
+		do_div(delta, shrinker->seeks);
+	} else {
+		/*
+		 * These objects don't require any IO to create. Trim
+		 * them aggressively under memory pressure to keep
+		 * them from causing refetches in the IO caches.
+		 */
+		delta = freeable / 2;
+	}
+
+	total_scan = nr >> priority;
+	total_scan += delta;
+	total_scan = min(total_scan, (2 * freeable));
+
+	trace_mm_shrink_slab_start(shrinker, shrinkctl, nr,
+				   freeable, delta, total_scan, priority);
+
+	/*
+	 * Normally, we should not scan less than batch_size objects in one
+	 * pass to avoid too frequent shrinker calls, but if the slab has less
+	 * than batch_size objects in total and we are really tight on memory,
+	 * we will try to reclaim all available objects, otherwise we can end
+	 * up failing allocations although there are plenty of reclaimable
+	 * objects spread over several slabs with usage less than the
+	 * batch_size.
+	 *
+	 * We detect the "tight on memory" situations by looking at the total
+	 * number of objects we want to scan (total_scan). If it is greater
+	 * than the total number of objects on slab (freeable), we must be
+	 * scanning at high prio and therefore should try to reclaim as much as
+	 * possible.
+	 */
+	while (total_scan >= batch_size ||
+	       total_scan >= freeable) {
+		unsigned long ret;
+		unsigned long nr_to_scan = min(batch_size, total_scan);
+
+		shrinkctl->nr_to_scan = nr_to_scan;
+		shrinkctl->nr_scanned = nr_to_scan;
+		ret = shrinker->scan_objects(shrinker, shrinkctl);
+		if (ret == SHRINK_STOP)
+			break;
+		freed += ret;
+
+		count_vm_events(SLABS_SCANNED, shrinkctl->nr_scanned);
+		total_scan -= shrinkctl->nr_scanned;
+		scanned += shrinkctl->nr_scanned;
+
+		cond_resched();
+	}
+
+	/*
+	 * The deferred work is increased by any new work (delta) that wasn't
+	 * done, decreased by old deferred work that was done now.
+	 *
+	 * And it is capped to two times of the freeable items.
+	 */
+	next_deferred = max_t(long, (nr + delta - scanned), 0);
+	next_deferred = min(next_deferred, (2 * freeable));
+
+	/*
+	 * move the unused scan count back into the shrinker in a
+	 * manner that handles concurrent updates.
+	 */
+	new_nr = add_nr_deferred(next_deferred, shrinker, shrinkctl);
+
+	trace_mm_shrink_slab_end(shrinker, shrinkctl->nid, freed, nr, new_nr, total_scan);
+	return freed;
+}
+
+#ifdef CONFIG_MEMCG
+static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
+			struct mem_cgroup *memcg, int priority)
+{
+	struct shrinker_info *info;
+	unsigned long ret, freed = 0;
+	int i;
+
+	if (!mem_cgroup_online(memcg))
+		return 0;
+
+	if (!down_read_trylock(&shrinker_rwsem))
+		return 0;
+
+	info = shrinker_info_protected(memcg, nid);
+	if (unlikely(!info))
+		goto unlock;
+
+	for_each_set_bit(i, info->map, info->map_nr_max) {
+		struct shrink_control sc = {
+			.gfp_mask = gfp_mask,
+			.nid = nid,
+			.memcg = memcg,
+		};
+		struct shrinker *shrinker;
+
+		shrinker = idr_find(&shrinker_idr, i);
+		if (unlikely(!shrinker || !(shrinker->flags & SHRINKER_REGISTERED))) {
+			if (!shrinker)
+				clear_bit(i, info->map);
+			continue;
+		}
+
+		/* Call non-slab shrinkers even though kmem is disabled */
+		if (!memcg_kmem_online() &&
+		    !(shrinker->flags & SHRINKER_NONSLAB))
+			continue;
+
+		ret = do_shrink_slab(&sc, shrinker, priority);
+		if (ret == SHRINK_EMPTY) {
+			clear_bit(i, info->map);
+			/*
+			 * After the shrinker reported that it had no objects to
+			 * free, but before we cleared the corresponding bit in
+			 * the memcg shrinker map, a new object might have been
+			 * added. To make sure, we have the bit set in this
+			 * case, we invoke the shrinker one more time and reset
+			 * the bit if it reports that it is not empty anymore.
+			 * The memory barrier here pairs with the barrier in
+			 * set_shrinker_bit():
+			 *
+			 * list_lru_add()     shrink_slab_memcg()
+			 *   list_add_tail()    clear_bit()
+			 *   <MB>               <MB>
+			 *   set_bit()          do_shrink_slab()
+			 */
+			smp_mb__after_atomic();
+			ret = do_shrink_slab(&sc, shrinker, priority);
+			if (ret == SHRINK_EMPTY)
+				ret = 0;
+			else
+				set_shrinker_bit(memcg, nid, i);
+		}
+		freed += ret;
+
+		if (rwsem_is_contended(&shrinker_rwsem)) {
+			freed = freed ? : 1;
+			break;
+		}
+	}
+unlock:
+	up_read(&shrinker_rwsem);
+	return freed;
+}
+#else /* !CONFIG_MEMCG */
+static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
+			struct mem_cgroup *memcg, int priority)
+{
+	return 0;
+}
+#endif /* CONFIG_MEMCG */
+
+/**
+ * shrink_slab - shrink slab caches
+ * @gfp_mask: allocation context
+ * @nid: node whose slab caches to target
+ * @memcg: memory cgroup whose slab caches to target
+ * @priority: the reclaim priority
+ *
+ * Call the shrink functions to age shrinkable caches.
+ *
+ * @nid is passed along to shrinkers with SHRINKER_NUMA_AWARE set,
+ * unaware shrinkers will receive a node id of 0 instead.
+ *
+ * @memcg specifies the memory cgroup to target. Unaware shrinkers
+ * are called only if it is the root cgroup.
+ *
+ * @priority is sc->priority, we take the number of objects and >> by priority
+ * in order to get the scan target.
+ *
+ * Returns the number of reclaimed slab objects.
+ */
+unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
+			  int priority)
+{
+	unsigned long ret, freed = 0;
+	struct shrinker *shrinker;
+
+	/*
+	 * The root memcg might be allocated even though memcg is disabled
+	 * via "cgroup_disable=memory" boot parameter.  This could make
+	 * mem_cgroup_is_root() return false, then just run memcg slab
+	 * shrink, but skip global shrink.  This may result in premature
+	 * oom.
+	 */
+	if (!mem_cgroup_disabled() && !mem_cgroup_is_root(memcg))
+		return shrink_slab_memcg(gfp_mask, nid, memcg, priority);
+
+	if (!down_read_trylock(&shrinker_rwsem))
+		goto out;
+
+	list_for_each_entry(shrinker, &shrinker_list, list) {
+		struct shrink_control sc = {
+			.gfp_mask = gfp_mask,
+			.nid = nid,
+			.memcg = memcg,
+		};
+
+		ret = do_shrink_slab(&sc, shrinker, priority);
+		if (ret == SHRINK_EMPTY)
+			ret = 0;
+		freed += ret;
+		/*
+		 * Bail out if someone want to register a new shrinker to
+		 * prevent the registration from being stalled for long periods
+		 * by parallel ongoing shrinking.
+		 */
+		if (rwsem_is_contended(&shrinker_rwsem)) {
+			freed = freed ? : 1;
+			break;
+		}
+	}
+
+	up_read(&shrinker_rwsem);
+out:
+	cond_resched();
+	return freed;
+}
+
+/*
+ * Add a shrinker callback to be called from the vm.
+ */
+static int __prealloc_shrinker(struct shrinker *shrinker)
+{
+	unsigned int size;
+	int err;
+
+	if (shrinker->flags & SHRINKER_MEMCG_AWARE) {
+		err = prealloc_memcg_shrinker(shrinker);
+		if (err != -ENOSYS)
+			return err;
+
+		shrinker->flags &= ~SHRINKER_MEMCG_AWARE;
+	}
+
+	size = sizeof(*shrinker->nr_deferred);
+	if (shrinker->flags & SHRINKER_NUMA_AWARE)
+		size *= nr_node_ids;
+
+	shrinker->nr_deferred = kzalloc(size, GFP_KERNEL);
+	if (!shrinker->nr_deferred)
+		return -ENOMEM;
+
+	return 0;
+}
+
+#ifdef CONFIG_SHRINKER_DEBUG
+int prealloc_shrinker(struct shrinker *shrinker, const char *fmt, ...)
+{
+	va_list ap;
+	int err;
+
+	va_start(ap, fmt);
+	shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
+	va_end(ap);
+	if (!shrinker->name)
+		return -ENOMEM;
+
+	err = __prealloc_shrinker(shrinker);
+	if (err) {
+		kfree_const(shrinker->name);
+		shrinker->name = NULL;
+	}
+
+	return err;
+}
+#else
+int prealloc_shrinker(struct shrinker *shrinker, const char *fmt, ...)
+{
+	return __prealloc_shrinker(shrinker);
+}
+#endif
+
+void free_prealloced_shrinker(struct shrinker *shrinker)
+{
+#ifdef CONFIG_SHRINKER_DEBUG
+	kfree_const(shrinker->name);
+	shrinker->name = NULL;
+#endif
+	if (shrinker->flags & SHRINKER_MEMCG_AWARE) {
+		down_write(&shrinker_rwsem);
+		unregister_memcg_shrinker(shrinker);
+		up_write(&shrinker_rwsem);
+		return;
+	}
+
+	kfree(shrinker->nr_deferred);
+	shrinker->nr_deferred = NULL;
+}
+
+void register_shrinker_prepared(struct shrinker *shrinker)
+{
+	down_write(&shrinker_rwsem);
+	list_add_tail(&shrinker->list, &shrinker_list);
+	shrinker->flags |= SHRINKER_REGISTERED;
+	shrinker_debugfs_add(shrinker);
+	up_write(&shrinker_rwsem);
+}
+
+static int __register_shrinker(struct shrinker *shrinker)
+{
+	int err = __prealloc_shrinker(shrinker);
+
+	if (err)
+		return err;
+	register_shrinker_prepared(shrinker);
+	return 0;
+}
+
+#ifdef CONFIG_SHRINKER_DEBUG
+int register_shrinker(struct shrinker *shrinker, const char *fmt, ...)
+{
+	va_list ap;
+	int err;
+
+	va_start(ap, fmt);
+	shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
+	va_end(ap);
+	if (!shrinker->name)
+		return -ENOMEM;
+
+	err = __register_shrinker(shrinker);
+	if (err) {
+		kfree_const(shrinker->name);
+		shrinker->name = NULL;
+	}
+	return err;
+}
+#else
+int register_shrinker(struct shrinker *shrinker, const char *fmt, ...)
+{
+	return __register_shrinker(shrinker);
+}
+#endif
+EXPORT_SYMBOL(register_shrinker);
+
+/*
+ * Remove one
+ */
+void unregister_shrinker(struct shrinker *shrinker)
+{
+	struct dentry *debugfs_entry;
+	int debugfs_id;
+
+	if (!(shrinker->flags & SHRINKER_REGISTERED))
+		return;
+
+	down_write(&shrinker_rwsem);
+	list_del(&shrinker->list);
+	shrinker->flags &= ~SHRINKER_REGISTERED;
+	if (shrinker->flags & SHRINKER_MEMCG_AWARE)
+		unregister_memcg_shrinker(shrinker);
+	debugfs_entry = shrinker_debugfs_detach(shrinker, &debugfs_id);
+	up_write(&shrinker_rwsem);
+
+	shrinker_debugfs_remove(debugfs_entry, debugfs_id);
+
+	kfree(shrinker->nr_deferred);
+	shrinker->nr_deferred = NULL;
+}
+EXPORT_SYMBOL(unregister_shrinker);
+
+/**
+ * synchronize_shrinkers - Wait for all running shrinkers to complete.
+ *
+ * This is equivalent to calling unregister_shrink() and register_shrinker(),
+ * but atomically and with less overhead. This is useful to guarantee that all
+ * shrinker invocations have seen an update, before freeing memory, similar to
+ * rcu.
+ */
+void synchronize_shrinkers(void)
+{
+	down_write(&shrinker_rwsem);
+	up_write(&shrinker_rwsem);
+}
+EXPORT_SYMBOL(synchronize_shrinkers);
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 80e9a222e522..0a0f4c2fd519 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -35,7 +35,6 @@
 #include <linux/cpuset.h>
 #include <linux/compaction.h>
 #include <linux/notifier.h>
-#include <linux/rwsem.h>
 #include <linux/delay.h>
 #include <linux/kthread.h>
 #include <linux/freezer.h>
@@ -188,246 +187,7 @@ struct scan_control {
  */
 int vm_swappiness = 60;
 
-LIST_HEAD(shrinker_list);
-DECLARE_RWSEM(shrinker_rwsem);
-
 #ifdef CONFIG_MEMCG
-static int shrinker_nr_max;
-
-/* The shrinker_info is expanded in a batch of BITS_PER_LONG */
-static inline int shrinker_map_size(int nr_items)
-{
-	return (DIV_ROUND_UP(nr_items, BITS_PER_LONG) * sizeof(unsigned long));
-}
-
-static inline int shrinker_defer_size(int nr_items)
-{
-	return (round_up(nr_items, BITS_PER_LONG) * sizeof(atomic_long_t));
-}
-
-static struct shrinker_info *shrinker_info_protected(struct mem_cgroup *memcg,
-						     int nid)
-{
-	return rcu_dereference_protected(memcg->nodeinfo[nid]->shrinker_info,
-					 lockdep_is_held(&shrinker_rwsem));
-}
-
-static int expand_one_shrinker_info(struct mem_cgroup *memcg,
-				    int map_size, int defer_size,
-				    int old_map_size, int old_defer_size,
-				    int new_nr_max)
-{
-	struct shrinker_info *new, *old;
-	struct mem_cgroup_per_node *pn;
-	int nid;
-	int size = map_size + defer_size;
-
-	for_each_node(nid) {
-		pn = memcg->nodeinfo[nid];
-		old = shrinker_info_protected(memcg, nid);
-		/* Not yet online memcg */
-		if (!old)
-			return 0;
-
-		/* Already expanded this shrinker_info */
-		if (new_nr_max <= old->map_nr_max)
-			continue;
-
-		new = kvmalloc_node(sizeof(*new) + size, GFP_KERNEL, nid);
-		if (!new)
-			return -ENOMEM;
-
-		new->nr_deferred = (atomic_long_t *)(new + 1);
-		new->map = (void *)new->nr_deferred + defer_size;
-		new->map_nr_max = new_nr_max;
-
-		/* map: set all old bits, clear all new bits */
-		memset(new->map, (int)0xff, old_map_size);
-		memset((void *)new->map + old_map_size, 0, map_size - old_map_size);
-		/* nr_deferred: copy old values, clear all new values */
-		memcpy(new->nr_deferred, old->nr_deferred, old_defer_size);
-		memset((void *)new->nr_deferred + old_defer_size, 0,
-		       defer_size - old_defer_size);
-
-		rcu_assign_pointer(pn->shrinker_info, new);
-		kvfree_rcu(old, rcu);
-	}
-
-	return 0;
-}
-
-void free_shrinker_info(struct mem_cgroup *memcg)
-{
-	struct mem_cgroup_per_node *pn;
-	struct shrinker_info *info;
-	int nid;
-
-	for_each_node(nid) {
-		pn = memcg->nodeinfo[nid];
-		info = rcu_dereference_protected(pn->shrinker_info, true);
-		kvfree(info);
-		rcu_assign_pointer(pn->shrinker_info, NULL);
-	}
-}
-
-int alloc_shrinker_info(struct mem_cgroup *memcg)
-{
-	struct shrinker_info *info;
-	int nid, size, ret = 0;
-	int map_size, defer_size = 0;
-
-	down_write(&shrinker_rwsem);
-	map_size = shrinker_map_size(shrinker_nr_max);
-	defer_size = shrinker_defer_size(shrinker_nr_max);
-	size = map_size + defer_size;
-	for_each_node(nid) {
-		info = kvzalloc_node(sizeof(*info) + size, GFP_KERNEL, nid);
-		if (!info) {
-			free_shrinker_info(memcg);
-			ret = -ENOMEM;
-			break;
-		}
-		info->nr_deferred = (atomic_long_t *)(info + 1);
-		info->map = (void *)info->nr_deferred + defer_size;
-		info->map_nr_max = shrinker_nr_max;
-		rcu_assign_pointer(memcg->nodeinfo[nid]->shrinker_info, info);
-	}
-	up_write(&shrinker_rwsem);
-
-	return ret;
-}
-
-static int expand_shrinker_info(int new_id)
-{
-	int ret = 0;
-	int new_nr_max = round_up(new_id + 1, BITS_PER_LONG);
-	int map_size, defer_size = 0;
-	int old_map_size, old_defer_size = 0;
-	struct mem_cgroup *memcg;
-
-	if (!root_mem_cgroup)
-		goto out;
-
-	lockdep_assert_held(&shrinker_rwsem);
-
-	map_size = shrinker_map_size(new_nr_max);
-	defer_size = shrinker_defer_size(new_nr_max);
-	old_map_size = shrinker_map_size(shrinker_nr_max);
-	old_defer_size = shrinker_defer_size(shrinker_nr_max);
-
-	memcg = mem_cgroup_iter(NULL, NULL, NULL);
-	do {
-		ret = expand_one_shrinker_info(memcg, map_size, defer_size,
-					       old_map_size, old_defer_size,
-					       new_nr_max);
-		if (ret) {
-			mem_cgroup_iter_break(NULL, memcg);
-			goto out;
-		}
-	} while ((memcg = mem_cgroup_iter(NULL, memcg, NULL)) != NULL);
-out:
-	if (!ret)
-		shrinker_nr_max = new_nr_max;
-
-	return ret;
-}
-
-void set_shrinker_bit(struct mem_cgroup *memcg, int nid, int shrinker_id)
-{
-	if (shrinker_id >= 0 && memcg && !mem_cgroup_is_root(memcg)) {
-		struct shrinker_info *info;
-
-		rcu_read_lock();
-		info = rcu_dereference(memcg->nodeinfo[nid]->shrinker_info);
-		if (!WARN_ON_ONCE(shrinker_id >= info->map_nr_max)) {
-			/* Pairs with smp mb in shrink_slab() */
-			smp_mb__before_atomic();
-			set_bit(shrinker_id, info->map);
-		}
-		rcu_read_unlock();
-	}
-}
-
-static DEFINE_IDR(shrinker_idr);
-
-static int prealloc_memcg_shrinker(struct shrinker *shrinker)
-{
-	int id, ret = -ENOMEM;
-
-	if (mem_cgroup_disabled())
-		return -ENOSYS;
-
-	down_write(&shrinker_rwsem);
-	/* This may call shrinker, so it must use down_read_trylock() */
-	id = idr_alloc(&shrinker_idr, shrinker, 0, 0, GFP_KERNEL);
-	if (id < 0)
-		goto unlock;
-
-	if (id >= shrinker_nr_max) {
-		if (expand_shrinker_info(id)) {
-			idr_remove(&shrinker_idr, id);
-			goto unlock;
-		}
-	}
-	shrinker->id = id;
-	ret = 0;
-unlock:
-	up_write(&shrinker_rwsem);
-	return ret;
-}
-
-static void unregister_memcg_shrinker(struct shrinker *shrinker)
-{
-	int id = shrinker->id;
-
-	BUG_ON(id < 0);
-
-	lockdep_assert_held(&shrinker_rwsem);
-
-	idr_remove(&shrinker_idr, id);
-}
-
-static long xchg_nr_deferred_memcg(int nid, struct shrinker *shrinker,
-				   struct mem_cgroup *memcg)
-{
-	struct shrinker_info *info;
-
-	info = shrinker_info_protected(memcg, nid);
-	return atomic_long_xchg(&info->nr_deferred[shrinker->id], 0);
-}
-
-static long add_nr_deferred_memcg(long nr, int nid, struct shrinker *shrinker,
-				  struct mem_cgroup *memcg)
-{
-	struct shrinker_info *info;
-
-	info = shrinker_info_protected(memcg, nid);
-	return atomic_long_add_return(nr, &info->nr_deferred[shrinker->id]);
-}
-
-void reparent_shrinker_deferred(struct mem_cgroup *memcg)
-{
-	int i, nid;
-	long nr;
-	struct mem_cgroup *parent;
-	struct shrinker_info *child_info, *parent_info;
-
-	parent = parent_mem_cgroup(memcg);
-	if (!parent)
-		parent = root_mem_cgroup;
-
-	/* Prevent from concurrent shrinker_info expand */
-	down_read(&shrinker_rwsem);
-	for_each_node(nid) {
-		child_info = shrinker_info_protected(memcg, nid);
-		parent_info = shrinker_info_protected(parent, nid);
-		for (i = 0; i < child_info->map_nr_max; i++) {
-			nr = atomic_long_read(&child_info->nr_deferred[i]);
-			atomic_long_add(nr, &parent_info->nr_deferred[i]);
-		}
-	}
-	up_read(&shrinker_rwsem);
-}
 
 /* Returns true for reclaim through cgroup limits or cgroup interfaces. */
 static bool cgroup_reclaim(struct scan_control *sc)
@@ -468,27 +228,6 @@ static bool writeback_throttling_sane(struct scan_control *sc)
 	return false;
 }
 #else
-static int prealloc_memcg_shrinker(struct shrinker *shrinker)
-{
-	return -ENOSYS;
-}
-
-static void unregister_memcg_shrinker(struct shrinker *shrinker)
-{
-}
-
-static long xchg_nr_deferred_memcg(int nid, struct shrinker *shrinker,
-				   struct mem_cgroup *memcg)
-{
-	return 0;
-}
-
-static long add_nr_deferred_memcg(long nr, int nid, struct shrinker *shrinker,
-				  struct mem_cgroup *memcg)
-{
-	return 0;
-}
-
 static bool cgroup_reclaim(struct scan_control *sc)
 {
 	return false;
@@ -557,39 +296,6 @@ static void flush_reclaim_state(struct scan_control *sc)
 	}
 }
 
-static long xchg_nr_deferred(struct shrinker *shrinker,
-			     struct shrink_control *sc)
-{
-	int nid = sc->nid;
-
-	if (!(shrinker->flags & SHRINKER_NUMA_AWARE))
-		nid = 0;
-
-	if (sc->memcg &&
-	    (shrinker->flags & SHRINKER_MEMCG_AWARE))
-		return xchg_nr_deferred_memcg(nid, shrinker,
-					      sc->memcg);
-
-	return atomic_long_xchg(&shrinker->nr_deferred[nid], 0);
-}
-
-
-static long add_nr_deferred(long nr, struct shrinker *shrinker,
-			    struct shrink_control *sc)
-{
-	int nid = sc->nid;
-
-	if (!(shrinker->flags & SHRINKER_NUMA_AWARE))
-		nid = 0;
-
-	if (sc->memcg &&
-	    (shrinker->flags & SHRINKER_MEMCG_AWARE))
-		return add_nr_deferred_memcg(nr, nid, shrinker,
-					     sc->memcg);
-
-	return atomic_long_add_return(nr, &shrinker->nr_deferred[nid]);
-}
-
 static bool can_demote(int nid, struct scan_control *sc)
 {
 	if (!numa_demotion_enabled)
@@ -671,413 +377,6 @@ static unsigned long lruvec_lru_size(struct lruvec *lruvec, enum lru_list lru,
 	return size;
 }
 
-/*
- * Add a shrinker callback to be called from the vm.
- */
-static int __prealloc_shrinker(struct shrinker *shrinker)
-{
-	unsigned int size;
-	int err;
-
-	if (shrinker->flags & SHRINKER_MEMCG_AWARE) {
-		err = prealloc_memcg_shrinker(shrinker);
-		if (err != -ENOSYS)
-			return err;
-
-		shrinker->flags &= ~SHRINKER_MEMCG_AWARE;
-	}
-
-	size = sizeof(*shrinker->nr_deferred);
-	if (shrinker->flags & SHRINKER_NUMA_AWARE)
-		size *= nr_node_ids;
-
-	shrinker->nr_deferred = kzalloc(size, GFP_KERNEL);
-	if (!shrinker->nr_deferred)
-		return -ENOMEM;
-
-	return 0;
-}
-
-#ifdef CONFIG_SHRINKER_DEBUG
-int prealloc_shrinker(struct shrinker *shrinker, const char *fmt, ...)
-{
-	va_list ap;
-	int err;
-
-	va_start(ap, fmt);
-	shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
-	va_end(ap);
-	if (!shrinker->name)
-		return -ENOMEM;
-
-	err = __prealloc_shrinker(shrinker);
-	if (err) {
-		kfree_const(shrinker->name);
-		shrinker->name = NULL;
-	}
-
-	return err;
-}
-#else
-int prealloc_shrinker(struct shrinker *shrinker, const char *fmt, ...)
-{
-	return __prealloc_shrinker(shrinker);
-}
-#endif
-
-void free_prealloced_shrinker(struct shrinker *shrinker)
-{
-#ifdef CONFIG_SHRINKER_DEBUG
-	kfree_const(shrinker->name);
-	shrinker->name = NULL;
-#endif
-	if (shrinker->flags & SHRINKER_MEMCG_AWARE) {
-		down_write(&shrinker_rwsem);
-		unregister_memcg_shrinker(shrinker);
-		up_write(&shrinker_rwsem);
-		return;
-	}
-
-	kfree(shrinker->nr_deferred);
-	shrinker->nr_deferred = NULL;
-}
-
-void register_shrinker_prepared(struct shrinker *shrinker)
-{
-	down_write(&shrinker_rwsem);
-	list_add_tail(&shrinker->list, &shrinker_list);
-	shrinker->flags |= SHRINKER_REGISTERED;
-	shrinker_debugfs_add(shrinker);
-	up_write(&shrinker_rwsem);
-}
-
-static int __register_shrinker(struct shrinker *shrinker)
-{
-	int err = __prealloc_shrinker(shrinker);
-
-	if (err)
-		return err;
-	register_shrinker_prepared(shrinker);
-	return 0;
-}
-
-#ifdef CONFIG_SHRINKER_DEBUG
-int register_shrinker(struct shrinker *shrinker, const char *fmt, ...)
-{
-	va_list ap;
-	int err;
-
-	va_start(ap, fmt);
-	shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
-	va_end(ap);
-	if (!shrinker->name)
-		return -ENOMEM;
-
-	err = __register_shrinker(shrinker);
-	if (err) {
-		kfree_const(shrinker->name);
-		shrinker->name = NULL;
-	}
-	return err;
-}
-#else
-int register_shrinker(struct shrinker *shrinker, const char *fmt, ...)
-{
-	return __register_shrinker(shrinker);
-}
-#endif
-EXPORT_SYMBOL(register_shrinker);
-
-/*
- * Remove one
- */
-void unregister_shrinker(struct shrinker *shrinker)
-{
-	struct dentry *debugfs_entry;
-	int debugfs_id;
-
-	if (!(shrinker->flags & SHRINKER_REGISTERED))
-		return;
-
-	down_write(&shrinker_rwsem);
-	list_del(&shrinker->list);
-	shrinker->flags &= ~SHRINKER_REGISTERED;
-	if (shrinker->flags & SHRINKER_MEMCG_AWARE)
-		unregister_memcg_shrinker(shrinker);
-	debugfs_entry = shrinker_debugfs_detach(shrinker, &debugfs_id);
-	up_write(&shrinker_rwsem);
-
-	shrinker_debugfs_remove(debugfs_entry, debugfs_id);
-
-	kfree(shrinker->nr_deferred);
-	shrinker->nr_deferred = NULL;
-}
-EXPORT_SYMBOL(unregister_shrinker);
-
-/**
- * synchronize_shrinkers - Wait for all running shrinkers to complete.
- *
- * This is equivalent to calling unregister_shrink() and register_shrinker(),
- * but atomically and with less overhead. This is useful to guarantee that all
- * shrinker invocations have seen an update, before freeing memory, similar to
- * rcu.
- */
-void synchronize_shrinkers(void)
-{
-	down_write(&shrinker_rwsem);
-	up_write(&shrinker_rwsem);
-}
-EXPORT_SYMBOL(synchronize_shrinkers);
-
-#define SHRINK_BATCH 128
-
-static unsigned long do_shrink_slab(struct shrink_control *shrinkctl,
-				    struct shrinker *shrinker, int priority)
-{
-	unsigned long freed = 0;
-	unsigned long long delta;
-	long total_scan;
-	long freeable;
-	long nr;
-	long new_nr;
-	long batch_size = shrinker->batch ? shrinker->batch
-					  : SHRINK_BATCH;
-	long scanned = 0, next_deferred;
-
-	freeable = shrinker->count_objects(shrinker, shrinkctl);
-	if (freeable == 0 || freeable == SHRINK_EMPTY)
-		return freeable;
-
-	/*
-	 * copy the current shrinker scan count into a local variable
-	 * and zero it so that other concurrent shrinker invocations
-	 * don't also do this scanning work.
-	 */
-	nr = xchg_nr_deferred(shrinker, shrinkctl);
-
-	if (shrinker->seeks) {
-		delta = freeable >> priority;
-		delta *= 4;
-		do_div(delta, shrinker->seeks);
-	} else {
-		/*
-		 * These objects don't require any IO to create. Trim
-		 * them aggressively under memory pressure to keep
-		 * them from causing refetches in the IO caches.
-		 */
-		delta = freeable / 2;
-	}
-
-	total_scan = nr >> priority;
-	total_scan += delta;
-	total_scan = min(total_scan, (2 * freeable));
-
-	trace_mm_shrink_slab_start(shrinker, shrinkctl, nr,
-				   freeable, delta, total_scan, priority);
-
-	/*
-	 * Normally, we should not scan less than batch_size objects in one
-	 * pass to avoid too frequent shrinker calls, but if the slab has less
-	 * than batch_size objects in total and we are really tight on memory,
-	 * we will try to reclaim all available objects, otherwise we can end
-	 * up failing allocations although there are plenty of reclaimable
-	 * objects spread over several slabs with usage less than the
-	 * batch_size.
-	 *
-	 * We detect the "tight on memory" situations by looking at the total
-	 * number of objects we want to scan (total_scan). If it is greater
-	 * than the total number of objects on slab (freeable), we must be
-	 * scanning at high prio and therefore should try to reclaim as much as
-	 * possible.
-	 */
-	while (total_scan >= batch_size ||
-	       total_scan >= freeable) {
-		unsigned long ret;
-		unsigned long nr_to_scan = min(batch_size, total_scan);
-
-		shrinkctl->nr_to_scan = nr_to_scan;
-		shrinkctl->nr_scanned = nr_to_scan;
-		ret = shrinker->scan_objects(shrinker, shrinkctl);
-		if (ret == SHRINK_STOP)
-			break;
-		freed += ret;
-
-		count_vm_events(SLABS_SCANNED, shrinkctl->nr_scanned);
-		total_scan -= shrinkctl->nr_scanned;
-		scanned += shrinkctl->nr_scanned;
-
-		cond_resched();
-	}
-
-	/*
-	 * The deferred work is increased by any new work (delta) that wasn't
-	 * done, decreased by old deferred work that was done now.
-	 *
-	 * And it is capped to two times of the freeable items.
-	 */
-	next_deferred = max_t(long, (nr + delta - scanned), 0);
-	next_deferred = min(next_deferred, (2 * freeable));
-
-	/*
-	 * move the unused scan count back into the shrinker in a
-	 * manner that handles concurrent updates.
-	 */
-	new_nr = add_nr_deferred(next_deferred, shrinker, shrinkctl);
-
-	trace_mm_shrink_slab_end(shrinker, shrinkctl->nid, freed, nr, new_nr, total_scan);
-	return freed;
-}
-
-#ifdef CONFIG_MEMCG
-static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
-			struct mem_cgroup *memcg, int priority)
-{
-	struct shrinker_info *info;
-	unsigned long ret, freed = 0;
-	int i;
-
-	if (!mem_cgroup_online(memcg))
-		return 0;
-
-	if (!down_read_trylock(&shrinker_rwsem))
-		return 0;
-
-	info = shrinker_info_protected(memcg, nid);
-	if (unlikely(!info))
-		goto unlock;
-
-	for_each_set_bit(i, info->map, info->map_nr_max) {
-		struct shrink_control sc = {
-			.gfp_mask = gfp_mask,
-			.nid = nid,
-			.memcg = memcg,
-		};
-		struct shrinker *shrinker;
-
-		shrinker = idr_find(&shrinker_idr, i);
-		if (unlikely(!shrinker || !(shrinker->flags & SHRINKER_REGISTERED))) {
-			if (!shrinker)
-				clear_bit(i, info->map);
-			continue;
-		}
-
-		/* Call non-slab shrinkers even though kmem is disabled */
-		if (!memcg_kmem_online() &&
-		    !(shrinker->flags & SHRINKER_NONSLAB))
-			continue;
-
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
-
-		if (rwsem_is_contended(&shrinker_rwsem)) {
-			freed = freed ? : 1;
-			break;
-		}
-	}
-unlock:
-	up_read(&shrinker_rwsem);
-	return freed;
-}
-#else /* CONFIG_MEMCG */
-static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
-			struct mem_cgroup *memcg, int priority)
-{
-	return 0;
-}
-#endif /* CONFIG_MEMCG */
-
-/**
- * shrink_slab - shrink slab caches
- * @gfp_mask: allocation context
- * @nid: node whose slab caches to target
- * @memcg: memory cgroup whose slab caches to target
- * @priority: the reclaim priority
- *
- * Call the shrink functions to age shrinkable caches.
- *
- * @nid is passed along to shrinkers with SHRINKER_NUMA_AWARE set,
- * unaware shrinkers will receive a node id of 0 instead.
- *
- * @memcg specifies the memory cgroup to target. Unaware shrinkers
- * are called only if it is the root cgroup.
- *
- * @priority is sc->priority, we take the number of objects and >> by priority
- * in order to get the scan target.
- *
- * Returns the number of reclaimed slab objects.
- */
-static unsigned long shrink_slab(gfp_t gfp_mask, int nid,
-				 struct mem_cgroup *memcg,
-				 int priority)
-{
-	unsigned long ret, freed = 0;
-	struct shrinker *shrinker;
-
-	/*
-	 * The root memcg might be allocated even though memcg is disabled
-	 * via "cgroup_disable=memory" boot parameter.  This could make
-	 * mem_cgroup_is_root() return false, then just run memcg slab
-	 * shrink, but skip global shrink.  This may result in premature
-	 * oom.
-	 */
-	if (!mem_cgroup_disabled() && !mem_cgroup_is_root(memcg))
-		return shrink_slab_memcg(gfp_mask, nid, memcg, priority);
-
-	if (!down_read_trylock(&shrinker_rwsem))
-		goto out;
-
-	list_for_each_entry(shrinker, &shrinker_list, list) {
-		struct shrink_control sc = {
-			.gfp_mask = gfp_mask,
-			.nid = nid,
-			.memcg = memcg,
-		};
-
-		ret = do_shrink_slab(&sc, shrinker, priority);
-		if (ret == SHRINK_EMPTY)
-			ret = 0;
-		freed += ret;
-		/*
-		 * Bail out if someone want to register a new shrinker to
-		 * prevent the registration from being stalled for long periods
-		 * by parallel ongoing shrinking.
-		 */
-		if (rwsem_is_contended(&shrinker_rwsem)) {
-			freed = freed ? : 1;
-			break;
-		}
-	}
-
-	up_read(&shrinker_rwsem);
-out:
-	cond_resched();
-	return freed;
-}
-
 static unsigned long drop_slab_node(int nid)
 {
 	unsigned long freed = 0;
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
