Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B17375F076
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jul 2023 11:51:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qNsDt-0006q0-8T;
	Mon, 24 Jul 2023 09:51:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qNsDr-0006pu-Tp
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 09:51:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xAp7xgO7HdkgEPthzXwizc0Cva5ED0l1RHYipwvkRG8=; b=eSjYVUTXt3CuSSPWBRqWw034/0
 hUQyUQeqQxAjooBloNGC8+V693+c3PXdH8XqRCLncG52tFt6aM+Iaox8IxY/lYOB0G9Yexya3wmKJ
 EqLTMv4NsxjNwAzW/4vpjHvy1txerChxXIE9OPqLN+zro5q/HC1Oc5Hh6sxGscKV2RWE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xAp7xgO7HdkgEPthzXwizc0Cva5ED0l1RHYipwvkRG8=; b=ky08D//0bUjZr3VAmGEmmHGMNW
 y8g55Ue6CnXrFJs1JFUdp31qaSwYlPFTbiYU/fJJ0DtMnBXTLZ+QesZ76cyVKziJlzRaELwz/pXoE
 Szs6j1PXmrr0kPC4B1oHPpY23o/hizUkd87ruzNFFcznb1gOtT8jHI0Wvh8VaiyMcLs4=;
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qNsDr-0003ye-O5 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 09:51:24 +0000
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-682eef7d752so1028573b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jul 2023 02:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690192278; x=1690797078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xAp7xgO7HdkgEPthzXwizc0Cva5ED0l1RHYipwvkRG8=;
 b=fRZXTeDPI05cJ99onG6DHJxkfUMlRPnq7Rn/QLZ0is9nue6C7hI7NNrzzE1XiOtAsL
 jxaHqrHBeq2Kf9jVwHj0j/XI9pIc497j4STLT+aC4pqDVI/sTYYX/yRdxwUotEPFTVId
 GY6yzphCUZ5+EFCVJ7JaghU1AWJbzYCjuDnxJCswtZl+SwAhy4mi16E/MR1hRCsGjB+T
 cO99YDds8K867Aux+2jYQKZaNAhIQlxOtUrunaQPHSUBJtgcDiwvPSTxsjcEQk1O8lD+
 xr5m1LPO8Me4hvXm4e3bCHxSQGeRnDCDrCn2S6Pyj7qX4IByYBH740sUkYoEJ/i3i/6k
 qY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690192278; x=1690797078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xAp7xgO7HdkgEPthzXwizc0Cva5ED0l1RHYipwvkRG8=;
 b=bjHshCtokuSz0/3buBx1YKMOmcjyDr8R9Iy2/bIKHV6yJehsynxlGB7URFac2NYE+k
 JoiH7s1WA5Auz78o96Oep70TRIBYxSWufy060EwfzuzMhICf8OneX+Sh+9973iT9ttNe
 ida+LrBa95dMbjcIrbrtTIdZ9uFHuUQKQvkgcu5LysDPRi+Z02uUcl7FgckJ125awu18
 cpsiPrEOAUh1J9gbpvm351Qu4ybWpKooL5pS+u4OexJP1BmI6E4YTjlkKSwBLZ4tlZjp
 uCVHxTYRYkWo46CaylN1Ag8SckrFlg6b3U/dfuhi4hKxNtfVI44fb3zq1RR+YSntQXM9
 74wQ==
X-Gm-Message-State: ABy/qLZNWDA4ziecTO7SEnCIJGN5m9o8hJ778QzyoUdQn09Y+TgLJhiD
 05slBw9JnsCTfObjLlRlY5iIuQ==
X-Google-Smtp-Source: APBJJlHQq2D/WuDC+k4NqN86HhNTJ9MoR7Y5JtfL6V1jvtKqTGYGB1+jpVAvGxo9g3eH8SGsNzYhlw==
X-Received: by 2002:a17:902:f681:b0:1b8:a469:53d8 with SMTP id
 l1-20020a170902f68100b001b8a46953d8mr12728311plg.0.1690192278196; 
 Mon, 24 Jul 2023 02:51:18 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:51:17 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 24 Jul 2023 17:43:38 +0800
Message-Id: <20230724094354.90817-32-zhengqi.arch@bytedance.com>
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
 Content preview:  In preparation for implementing lockless slab shrink, use
 new APIs to dynamically allocate the mbcache shrinker, so that it can be freed
 asynchronously using kfree_rcu(). Then it doesn't need to wait [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.175 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.175 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qNsDr-0003ye-O5
Subject: [f2fs-dev] [PATCH v2 31/47] mbcache: dynamically allocate the
 mbcache shrinker
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

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the mbcache shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct mb_cache.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 fs/mbcache.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/fs/mbcache.c b/fs/mbcache.c
index 2a4b8b549e93..bfecebeec828 100644
--- a/fs/mbcache.c
+++ b/fs/mbcache.c
@@ -37,7 +37,7 @@ struct mb_cache {
 	struct list_head	c_list;
 	/* Number of entries in cache */
 	unsigned long		c_entry_count;
-	struct shrinker		c_shrink;
+	struct shrinker		*c_shrink;
 	/* Work for shrinking when the cache has too many entries */
 	struct work_struct	c_shrink_work;
 };
@@ -293,8 +293,7 @@ EXPORT_SYMBOL(mb_cache_entry_touch);
 static unsigned long mb_cache_count(struct shrinker *shrink,
 				    struct shrink_control *sc)
 {
-	struct mb_cache *cache = container_of(shrink, struct mb_cache,
-					      c_shrink);
+	struct mb_cache *cache = shrink->private_data;
 
 	return cache->c_entry_count;
 }
@@ -333,8 +332,7 @@ static unsigned long mb_cache_shrink(struct mb_cache *cache,
 static unsigned long mb_cache_scan(struct shrinker *shrink,
 				   struct shrink_control *sc)
 {
-	struct mb_cache *cache = container_of(shrink, struct mb_cache,
-					      c_shrink);
+	struct mb_cache *cache = shrink->private_data;
 	return mb_cache_shrink(cache, sc->nr_to_scan);
 }
 
@@ -377,15 +375,20 @@ struct mb_cache *mb_cache_create(int bucket_bits)
 	for (i = 0; i < bucket_count; i++)
 		INIT_HLIST_BL_HEAD(&cache->c_hash[i]);
 
-	cache->c_shrink.count_objects = mb_cache_count;
-	cache->c_shrink.scan_objects = mb_cache_scan;
-	cache->c_shrink.seeks = DEFAULT_SEEKS;
-	if (register_shrinker(&cache->c_shrink, "mbcache-shrinker")) {
+	cache->c_shrink = shrinker_alloc(0, "mbcache-shrinker");
+	if (!cache->c_shrink) {
 		kfree(cache->c_hash);
 		kfree(cache);
 		goto err_out;
 	}
 
+	cache->c_shrink->count_objects = mb_cache_count;
+	cache->c_shrink->scan_objects = mb_cache_scan;
+	cache->c_shrink->seeks = DEFAULT_SEEKS;
+	cache->c_shrink->private_data = cache;
+
+	shrinker_register(cache->c_shrink);
+
 	INIT_WORK(&cache->c_shrink_work, mb_cache_shrink_worker);
 
 	return cache;
@@ -406,7 +409,7 @@ void mb_cache_destroy(struct mb_cache *cache)
 {
 	struct mb_cache_entry *entry, *next;
 
-	unregister_shrinker(&cache->c_shrink);
+	shrinker_unregister(cache->c_shrink);
 
 	/*
 	 * We don't bother with any locking. Cache must not be used at this
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
