Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A97764B2F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jul 2023 10:14:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOw8Y-0001jG-2B;
	Thu, 27 Jul 2023 08:14:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qOw8U-0001iR-HO
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 08:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sPvPF+4cfnCSPpn5pwfgQmnhLHHD8eUNQAmayNodhE0=; b=XEDSC/lH2yXHBxMN8+7IKkpe7g
 EFKxzw46qTtpUhb6d7HlcrgJ3DvElnhveUK4cM4t5UjGPh4KXNMmAZUwObVqKQo2TiUh5obffGF1R
 Ntdu3WkZdOoEUmhKFG6HqyFMxNWs6r6+9kxQo8KNrUauw+ZhW9zFwLwbav+84lTK4Kfo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sPvPF+4cfnCSPpn5pwfgQmnhLHHD8eUNQAmayNodhE0=; b=EhN6jf7p0Ec/k/HY2c1mgfrsm/
 PFbgD6U4OpnjJP+uRqf9jdIlP7PimFxAoPBb1IdOR4auOU9q3nr8E2z1ZZ8HcWNQ3sF7mc2zxg6EU
 Ti6QLHO1OQt7cIJkhLWxV/44kT2/r1XM6ez5lchwf7JPKlX/i/oZnD+9q6vHUJG+fMaQ=;
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qOw8U-0004qV-Ub for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 08:14:15 +0000
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-6748a616e17so183905b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Jul 2023 01:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690445649; x=1691050449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sPvPF+4cfnCSPpn5pwfgQmnhLHHD8eUNQAmayNodhE0=;
 b=YUtSHImzHFhUVx7c3A38/9eSWP8Y2UYGj1FAohSpraRjdigKG79oH7xXGVv/st6Oxo
 VyXpyLT7a2poDQM1BLbe2YZ2f+F4NjGwYTjXKgOmjtdNRT3EltoPRUERX0NGCPGwABx/
 guLbSxl8SczSn7UsZFsKIT2jSYiALWPELONV4dGxl+BgYW8LTo4BMAXY89ObnQ5bwB+z
 TeqwZ6TJLFD7PjgbTEQMgvSuaTCzQbN9MksnEsjGQ7GcxsQYflnPZl/UkK6mnnTiCX+x
 HfuT7U9+62kKpSnlvuoFhz2dd+gEGZ79L6Z5RTD7Q/dArvGRObCoRNap6LnHLL+kySjl
 YAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690445649; x=1691050449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sPvPF+4cfnCSPpn5pwfgQmnhLHHD8eUNQAmayNodhE0=;
 b=SAm+omiVDvJDoh1eaxqcGM6qMSD1P8Y4o/0ipDebIoDCI1bajfyBozfHt/HyUq7sdP
 FUlieMLGeyvzh+K+vXhq2yk64a7zYxcJ/WpmqQDDF4G9/FJz+ZSg7PgoShEEvVVTzPRL
 fcTe4LiUNStoLrmzzddgrEooIFmipxFvtyuzxH7zfHD2XUdWJE4A/9cpgLuuqyxMk4hK
 Bs0kJ2AQsk6E6ksN3NURSurrxUnajO+wyStjg+sRgbN51SP5PDoeSj4y2IjShJD+Qx21
 sAlWjyeqOoofp3ULs74lryNqAjmbRPODWXYxU/SGRl8/B1/kPbJ32jcVgHChJZlNRhAW
 QGJQ==
X-Gm-Message-State: ABy/qLb/E7+nsocRveYPnfa8UNUozBOxKk2rTipiNG8MpI8tIBkVu8DG
 czbeD0pX3JzC1TedyKawH1jNTg==
X-Google-Smtp-Source: APBJJlHWG/nG8cYGh+bA6ihiUuY1h+OmDGzY+AfGFIW0cwXlJC7qa3aS8ftT4KQ6i8EuYK6gaQtAEg==
X-Received: by 2002:a05:6a20:918e:b0:11a:dbb3:703b with SMTP id
 v14-20020a056a20918e00b0011adbb3703bmr5557054pzd.6.1690445649366; 
 Thu, 27 Jul 2023 01:14:09 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:14:08 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Thu, 27 Jul 2023 16:04:54 +0800
Message-Id: <20230727080502.77895-42-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In preparation for implementing lockless slab shrink, use
 new APIs to dynamically allocate the mm-zspool shrinker, so that it can be
 freed asynchronously using kfree_rcu(). Then it doesn't need to wai [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.175 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.175 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qOw8U-0004qV-Ub
Subject: [f2fs-dev] [PATCH v3 41/49] zsmalloc: dynamically allocate the
 mm-zspool shrinker
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
 Muchun Song <songmuchun@bytedance.com>, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the mm-zspool shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct zs_pool.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/zsmalloc.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index b96230402a8d..e63302e07c97 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -229,7 +229,7 @@ struct zs_pool {
 	struct zs_pool_stats stats;
 
 	/* Compact classes */
-	struct shrinker shrinker;
+	struct shrinker *shrinker;
 
 #ifdef CONFIG_ZSMALLOC_STAT
 	struct dentry *stat_dentry;
@@ -2086,8 +2086,7 @@ static unsigned long zs_shrinker_scan(struct shrinker *shrinker,
 		struct shrink_control *sc)
 {
 	unsigned long pages_freed;
-	struct zs_pool *pool = container_of(shrinker, struct zs_pool,
-			shrinker);
+	struct zs_pool *pool = shrinker->private_data;
 
 	/*
 	 * Compact classes and calculate compaction delta.
@@ -2105,8 +2104,7 @@ static unsigned long zs_shrinker_count(struct shrinker *shrinker,
 	int i;
 	struct size_class *class;
 	unsigned long pages_to_free = 0;
-	struct zs_pool *pool = container_of(shrinker, struct zs_pool,
-			shrinker);
+	struct zs_pool *pool = shrinker->private_data;
 
 	for (i = ZS_SIZE_CLASSES - 1; i >= 0; i--) {
 		class = pool->size_class[i];
@@ -2121,18 +2119,24 @@ static unsigned long zs_shrinker_count(struct shrinker *shrinker,
 
 static void zs_unregister_shrinker(struct zs_pool *pool)
 {
-	unregister_shrinker(&pool->shrinker);
+	shrinker_free(pool->shrinker);
 }
 
 static int zs_register_shrinker(struct zs_pool *pool)
 {
-	pool->shrinker.scan_objects = zs_shrinker_scan;
-	pool->shrinker.count_objects = zs_shrinker_count;
-	pool->shrinker.batch = 0;
-	pool->shrinker.seeks = DEFAULT_SEEKS;
+	pool->shrinker = shrinker_alloc(0, "mm-zspool:%s", pool->name);
+	if (!pool->shrinker)
+		return -ENOMEM;
+
+	pool->shrinker->scan_objects = zs_shrinker_scan;
+	pool->shrinker->count_objects = zs_shrinker_count;
+	pool->shrinker->batch = 0;
+	pool->shrinker->seeks = DEFAULT_SEEKS;
+	pool->shrinker->private_data = pool;
 
-	return register_shrinker(&pool->shrinker, "mm-zspool:%s",
-				 pool->name);
+	shrinker_register(pool->shrinker);
+
+	return 0;
 }
 
 static int calculate_zspage_chain_size(int class_size)
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
