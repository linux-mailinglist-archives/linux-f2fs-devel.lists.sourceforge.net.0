Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BEA764A1B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jul 2023 10:07:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOw1U-0007al-6G;
	Thu, 27 Jul 2023 08:07:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qOw1R-0007af-Km
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 08:06:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BqN9tp9prAKwSL/xaaZwvgP8yGlZqKh7lkz65rMIkwI=; b=Y3/+/Z0Mmp3n+CKvu3cFKrhiGg
 ui+XDmcR12kgM2MQz20+66Qdkvmezl+bir0JBHshXz53zxQAQw4z3OGT+bzD0qVeyIiDSc8HERI6t
 vl877yPcUm0z7y2nLHeu7ueVHwHnvpWm9VBQ1bV9vmi1151x6qn3VMQ8AaYgfuNyJs30=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BqN9tp9prAKwSL/xaaZwvgP8yGlZqKh7lkz65rMIkwI=; b=WjomrTlpcCm9RHRHuYJEJm6rZ9
 wvdUjtZy/h0Aq6HQRs8H+tQbsEFmZ2sQfVL1gxOA/wSmPlSLf5DcZCJeJJWoymL+sLLxmOKmW35rV
 WpUWzfYXrxUwIlnAVszKAzBI5d37Qjh41hTyltwzQYaYq7VXI4/px+Qfu+GE2TXlB89I=;
Received: from mail-pf1-f172.google.com ([209.85.210.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qOw1P-0004Tp-Od for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 08:06:56 +0000
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-6862d4a1376so188334b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Jul 2023 01:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690445210; x=1691050010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BqN9tp9prAKwSL/xaaZwvgP8yGlZqKh7lkz65rMIkwI=;
 b=GBN6icr0hE5mqHPTJBEmQxE0sSmLZpA0St1dP4Z/yKynevT5W5Jxqj0TR7Mr4urM6a
 rcvFQA+K57yE1B1k6K85qRXWvWixdU3NSLe4VzCycF5GoWTLlRciA5X2RKhqi0HQoE8b
 1a0IYfWezvO06Io3dLOeFyq1ZqsXTQYxhrgkmMYVYzQ0UKpbC4ibvswUM8qhqUbr7+wb
 uRN2A2UnEH8zWwCm8m7EgP4dOqoYkNd5OlXdJtG3fRVi7RhcVNJSFfLr6LMTE1C8b+sp
 ezPa3QCc3RdGZTkOuGv4gf4U4junA2Kk+3yhYNlyx/A90D5GFHra7wi3SwF/mLuKqPhB
 hHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690445210; x=1691050010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BqN9tp9prAKwSL/xaaZwvgP8yGlZqKh7lkz65rMIkwI=;
 b=FvFJWyvTOzTBT/g2WJ0zz+IvrBKFaHYPy7DvE2grvafn9zQywng9q4Nkn4Yk3zxEB5
 vRKhxvGpZVombtq2u4s35YSrK0IRjBG3Bkep1XxP6TN/GKGHCzR8wy5U6GLUF/gL7hjX
 SrOBYmKcmFTzcIcn4QGo4nCwG6xUzmBz2pZN66qmV6UuJ66HVzgSSOsH+PJEnXO4w8/v
 t/3jX69u60OpN6nQk1D3+1ZeCiRWKOHg+d886P58nLcIquYgAvP95CnyX9+Ff9w02uJD
 q+aAi6tywmKauwuH3LbLUc0+JODPoBvy+k6Iws34Ug5Gb5mAhJ1KfuWjfom+mXxuaCG/
 2H3A==
X-Gm-Message-State: ABy/qLadw8LI3XhsVWx8AORJ9MLAN4vPPeZ1qDb/3sP9vOIyx9xWGY7S
 21wFzIQTPRTza/OT4wBdOLSc6A==
X-Google-Smtp-Source: APBJJlGqyHUGzcwYP72gZn72jBkXTN2mSwLe5z3KDdW3R9YyUcC+gdVHx8KhimUXzhfrGyXx8SlIVg==
X-Received: by 2002:a05:6a20:918e:b0:11a:dbb3:703b with SMTP id
 v14-20020a056a20918e00b0011adbb3703bmr5539836pzd.6.1690445210111; 
 Thu, 27 Jul 2023 01:06:50 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:06:48 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Thu, 27 Jul 2023 16:04:18 +0800
Message-Id: <20230727080502.77895-6-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently, the shrinker instances can be divided into the
 following three types: a) global shrinker instance statically defined in the
 kernel,
 such as workingset_shadow_shrinker. b) global shrinker instance statically
 defined in the kernel modules, such as mmu_shrinker in x86. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.172 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.172 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qOw1P-0004Tp-Od
Subject: [f2fs-dev] [PATCH v3 05/49] mm: shrinker: add infrastructure for
 dynamically allocating shrinker
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

Currently, the shrinker instances can be divided into the following three
types:

a) global shrinker instance statically defined in the kernel, such as
   workingset_shadow_shrinker.

b) global shrinker instance statically defined in the kernel modules, such
   as mmu_shrinker in x86.

c) shrinker instance embedded in other structures.

For case a, the memory of shrinker instance is never freed. For case b,
the memory of shrinker instance will be freed after synchronize_rcu() when
the module is unloaded. For case c, the memory of shrinker instance will
be freed along with the structure it is embedded in.

In preparation for implementing lockless slab shrink, we need to
dynamically allocate those shrinker instances in case c, then the memory
can be dynamically freed alone by calling kfree_rcu().

So this commit adds the following new APIs for dynamically allocating
shrinker, and add a private_data field to struct shrinker to record and
get the original embedded structure.

1. shrinker_alloc()

Used to allocate shrinker instance itself and related memory, it will
return a pointer to the shrinker instance on success and NULL on failure.

2. shrinker_register()

Used to register the shrinker instance, which is same as the current
register_shrinker_prepared().

3. shrinker_free()

Used to unregister (if needed) and free the shrinker instance.

In order to simplify shrinker-related APIs and make shrinker more
independent of other kernel mechanisms, subsequent submissions will use
the above API to convert all shrinkers (including case a and b) to
dynamically allocated, and then remove all existing APIs.

This will also have another advantage mentioned by Dave Chinner:

```
The other advantage of this is that it will break all the existing
out of tree code and third party modules using the old API and will
no longer work with a kernel using lockless slab shrinkers. They
need to break (both at the source and binary levels) to stop bad
things from happening due to using uncoverted shrinkers in the new
setup.
```

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/linux/shrinker.h |   7 +++
 mm/internal.h            |  11 +++++
 mm/shrinker.c            | 101 +++++++++++++++++++++++++++++++++++++++
 mm/shrinker_debug.c      |  17 ++++++-
 4 files changed, 134 insertions(+), 2 deletions(-)

diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
index 8dc15aa37410..cc23ff0aee20 100644
--- a/include/linux/shrinker.h
+++ b/include/linux/shrinker.h
@@ -70,6 +70,8 @@ struct shrinker {
 	int seeks;	/* seeks to recreate an obj */
 	unsigned flags;
 
+	void *private_data;
+
 	/* These are for internal use */
 	struct list_head list;
 #ifdef CONFIG_MEMCG
@@ -95,6 +97,11 @@ struct shrinker {
  * non-MEMCG_AWARE shrinker should not have this flag set.
  */
 #define SHRINKER_NONSLAB	(1 << 3)
+#define SHRINKER_ALLOCATED	(1 << 4)
+
+struct shrinker *shrinker_alloc(unsigned int flags, const char *fmt, ...);
+void shrinker_register(struct shrinker *shrinker);
+void shrinker_free(struct shrinker *shrinker);
 
 extern int __printf(2, 3) prealloc_shrinker(struct shrinker *shrinker,
 					    const char *fmt, ...);
diff --git a/mm/internal.h b/mm/internal.h
index 8b82038dcc6a..38434175df86 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1144,6 +1144,9 @@ unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
 
 #ifdef CONFIG_SHRINKER_DEBUG
 extern int shrinker_debugfs_add(struct shrinker *shrinker);
+extern int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
+				       const char *fmt, va_list ap);
+extern void shrinker_debugfs_name_free(struct shrinker *shrinker);
 extern struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
 					      int *debugfs_id);
 extern void shrinker_debugfs_remove(struct dentry *debugfs_entry,
@@ -1153,6 +1156,14 @@ static inline int shrinker_debugfs_add(struct shrinker *shrinker)
 {
 	return 0;
 }
+static inline int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
+					      const char *fmt, va_list ap)
+{
+	return 0;
+}
+static inline void shrinker_debugfs_name_free(struct shrinker *shrinker)
+{
+}
 static inline struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
 						     int *debugfs_id)
 {
diff --git a/mm/shrinker.c b/mm/shrinker.c
index 043c87ccfab4..43a375f954f3 100644
--- a/mm/shrinker.c
+++ b/mm/shrinker.c
@@ -550,6 +550,107 @@ unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
 	return freed;
 }
 
+struct shrinker *shrinker_alloc(unsigned int flags, const char *fmt, ...)
+{
+	struct shrinker *shrinker;
+	unsigned int size;
+	va_list ap;
+	int err;
+
+	shrinker = kzalloc(sizeof(struct shrinker), GFP_KERNEL);
+	if (!shrinker)
+		return NULL;
+
+	va_start(ap, fmt);
+	err = shrinker_debugfs_name_alloc(shrinker, fmt, ap);
+	va_end(ap);
+	if (err)
+		goto err_name;
+
+	shrinker->flags = flags | SHRINKER_ALLOCATED;
+
+	if (flags & SHRINKER_MEMCG_AWARE) {
+		err = prealloc_memcg_shrinker(shrinker);
+		if (err == -ENOSYS)
+			shrinker->flags &= ~SHRINKER_MEMCG_AWARE;
+		else if (err == 0)
+			goto done;
+		else
+			goto err_flags;
+	}
+
+	/*
+	 * The nr_deferred is available on per memcg level for memcg aware
+	 * shrinkers, so only allocate nr_deferred in the following cases:
+	 *  - non memcg aware shrinkers
+	 *  - !CONFIG_MEMCG
+	 *  - memcg is disabled by kernel command line
+	 */
+	size = sizeof(*shrinker->nr_deferred);
+	if (flags & SHRINKER_NUMA_AWARE)
+		size *= nr_node_ids;
+
+	shrinker->nr_deferred = kzalloc(size, GFP_KERNEL);
+	if (!shrinker->nr_deferred)
+		goto err_flags;
+
+done:
+	return shrinker;
+
+err_flags:
+	shrinker_debugfs_name_free(shrinker);
+err_name:
+	kfree(shrinker);
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(shrinker_alloc);
+
+void shrinker_register(struct shrinker *shrinker)
+{
+	if (unlikely(!(shrinker->flags & SHRINKER_ALLOCATED))) {
+		pr_warn("Must use shrinker_alloc() to dynamically allocate the shrinker");
+		return;
+	}
+
+	down_write(&shrinker_rwsem);
+	list_add_tail(&shrinker->list, &shrinker_list);
+	shrinker->flags |= SHRINKER_REGISTERED;
+	shrinker_debugfs_add(shrinker);
+	up_write(&shrinker_rwsem);
+}
+EXPORT_SYMBOL_GPL(shrinker_register);
+
+void shrinker_free(struct shrinker *shrinker)
+{
+	struct dentry *debugfs_entry = NULL;
+	int debugfs_id;
+
+	if (!shrinker)
+		return;
+
+	down_write(&shrinker_rwsem);
+	if (shrinker->flags & SHRINKER_REGISTERED) {
+		list_del(&shrinker->list);
+		debugfs_entry = shrinker_debugfs_detach(shrinker, &debugfs_id);
+		shrinker->flags &= ~SHRINKER_REGISTERED;
+	} else {
+		shrinker_debugfs_name_free(shrinker);
+	}
+
+	if (shrinker->flags & SHRINKER_MEMCG_AWARE)
+		unregister_memcg_shrinker(shrinker);
+	up_write(&shrinker_rwsem);
+
+	if (debugfs_entry)
+		shrinker_debugfs_remove(debugfs_entry, debugfs_id);
+
+	kfree(shrinker->nr_deferred);
+	shrinker->nr_deferred = NULL;
+
+	kfree(shrinker);
+}
+EXPORT_SYMBOL_GPL(shrinker_free);
+
 /*
  * Add a shrinker callback to be called from the vm.
  */
diff --git a/mm/shrinker_debug.c b/mm/shrinker_debug.c
index f1becfd45853..506257585408 100644
--- a/mm/shrinker_debug.c
+++ b/mm/shrinker_debug.c
@@ -191,6 +191,20 @@ int shrinker_debugfs_add(struct shrinker *shrinker)
 	return 0;
 }
 
+int shrinker_debugfs_name_alloc(struct shrinker *shrinker, const char *fmt,
+				va_list ap)
+{
+	shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
+
+	return shrinker->name ? 0 : -ENOMEM;
+}
+
+void shrinker_debugfs_name_free(struct shrinker *shrinker)
+{
+	kfree_const(shrinker->name);
+	shrinker->name = NULL;
+}
+
 int shrinker_debugfs_rename(struct shrinker *shrinker, const char *fmt, ...)
 {
 	struct dentry *entry;
@@ -239,8 +253,7 @@ struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
 
 	lockdep_assert_held(&shrinker_rwsem);
 
-	kfree_const(shrinker->name);
-	shrinker->name = NULL;
+	shrinker_debugfs_name_free(shrinker);
 
 	*debugfs_id = entry ? shrinker->debugfs_id : -1;
 	shrinker->debugfs_entry = NULL;
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
