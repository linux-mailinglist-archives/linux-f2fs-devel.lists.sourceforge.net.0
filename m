Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05230764A51
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jul 2023 10:08:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOw3F-0000Fu-Oy;
	Thu, 27 Jul 2023 08:08:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qOw3C-0000E6-PQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 08:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XXAG7UeexodYStcT1Y2gz+/6q+0E2xrK+D1h2eKApUE=; b=ScW2xj3PsvzIZMqSCmIAKV8NXJ
 2XTc2kRAuSTthSepcaIN4QFB5PKTtkomIZifKETfL2pIghY8eymGijkR5KYDJJr/lPmie40J4Jk6v
 I2hUoUo90EDroI2FsGVPnKU9nvt4a7EMM+FxaQc6H1LzcFKldulaAn2ezUw8swubafMU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XXAG7UeexodYStcT1Y2gz+/6q+0E2xrK+D1h2eKApUE=; b=UA2MkMLdGp0E9oCV6U925pS2/8
 lA7ULvF3Cp/roO9rpTALW73gy2jBsEtvhXksc8Q5fl6FD548lF+To4U+BvEB/GYtVJKEQzYcccjmF
 hp8b6HtKX+8jJmYrvnRHcPLQlOTtp3fkPGdbeYrjJvfkGjOBwBXUqswa7fqOvEHkOW50=;
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qOw3C-0004Yz-7Y for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 08:08:46 +0000
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-6748a616e17so182798b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Jul 2023 01:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690445320; x=1691050120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XXAG7UeexodYStcT1Y2gz+/6q+0E2xrK+D1h2eKApUE=;
 b=FYj50vEzpqpR7/JHkZvpr0BbTAfzFzYsY4J3w1nZqjf0BTlUYZg3ENXBt/E7bux565
 4DCZMkbhxlQ4uTban0w+5H7n5bf7VgzCbRNW1xqy8V5Ii4h7bosDaVHN++mTVrl/7/23
 WZSmzaLueVj3BrcJoWAHCGvwk4IeXhgQ2bRNwNFy4V/7BgrLzTS5YJPWuEtp82HeU9Up
 caVaRRGf3jcxw3YWyZv3sYid2tLZtftHEV5/wvAbdGp4oPWlqnmvAPY3i6LJ0BE1y1ID
 4Y8Xa75Xt3wm60SqSMunOKTUxH6aZ+1fGysddWTaZe8OA5PjpbdliSp8jUu0Z/6yBQXn
 rqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690445320; x=1691050120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XXAG7UeexodYStcT1Y2gz+/6q+0E2xrK+D1h2eKApUE=;
 b=WESxAEhRMDIkqk/w4oUDbvHJeb/MgA5WTHPC4E3fftqo5bZKqtK1hFCTir5Z02Pt4v
 CyBMTVaVuheHtowidxy0RVVx/I8rAq+iT63tcNeuR5TkE3Cm/Vv57JLb8nYLE/fDSUXQ
 zFeObbd1Uic5y8cRWKkCUpx57K2/RroEUu79YEfyhctA7Cd9/7y2Ig0AdSfNMzVpXxPt
 O4MLMluJx5VB8LeyUjaSb4je+gWi0Qo80r24rZLFuWi5KBYCj4ovHZrPwzyxdHcIQxSw
 er3eQH3Nk7d0quXJYzkIzo3S5BFzbfpjEF8qvIUCcceDEU3JgA2aMc9pAySgFxWRMyQD
 ltnQ==
X-Gm-Message-State: ABy/qLYn25r3546OvshborklAu51BKTOmQgJAQ57KfdnLLrjKxblJotR
 hyftIgx3jhV+suyFecQFR5OWUw==
X-Google-Smtp-Source: APBJJlHkKWPiTWl3kfFSQlaHJ4f9EFj8oaHZmEibAoOMDshGtR3BMo+XERT90zfJYijHcIQQmSOpWQ==
X-Received: by 2002:a05:6a21:32a9:b0:136:f3ef:4d2 with SMTP id
 yt41-20020a056a2132a900b00136f3ef04d2mr6059155pzb.3.1690445320596; 
 Thu, 27 Jul 2023 01:08:40 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:08:40 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Thu, 27 Jul 2023 16:04:27 +0800
Message-Id: <20230727080502.77895-15-zhengqi.arch@bytedance.com>
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
 Content preview: Use new APIs to dynamically allocate the nfs-xattr shrinkers.
 Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com> Reviewed-by: Muchun
 Song <songmuchun@bytedance.com> --- fs/nfs/nfs42xattr.c | 87
 +++++++++++++++++++++++ 1 file changed, 44 i [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.171 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.171 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qOw3C-0004Yz-7Y
Subject: [f2fs-dev] [PATCH v3 14/49] NFSv4.2: dynamically allocate the
 nfs-xattr shrinkers
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

Use new APIs to dynamically allocate the nfs-xattr shrinkers.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 fs/nfs/nfs42xattr.c | 87 +++++++++++++++++++++++----------------------
 1 file changed, 44 insertions(+), 43 deletions(-)

diff --git a/fs/nfs/nfs42xattr.c b/fs/nfs/nfs42xattr.c
index 911f634ba3da..2ad66a8922f4 100644
--- a/fs/nfs/nfs42xattr.c
+++ b/fs/nfs/nfs42xattr.c
@@ -796,28 +796,9 @@ static unsigned long nfs4_xattr_cache_scan(struct shrinker *shrink,
 static unsigned long nfs4_xattr_entry_scan(struct shrinker *shrink,
 					   struct shrink_control *sc);
 
-static struct shrinker nfs4_xattr_cache_shrinker = {
-	.count_objects	= nfs4_xattr_cache_count,
-	.scan_objects	= nfs4_xattr_cache_scan,
-	.seeks		= DEFAULT_SEEKS,
-	.flags		= SHRINKER_MEMCG_AWARE,
-};
-
-static struct shrinker nfs4_xattr_entry_shrinker = {
-	.count_objects	= nfs4_xattr_entry_count,
-	.scan_objects	= nfs4_xattr_entry_scan,
-	.seeks		= DEFAULT_SEEKS,
-	.batch		= 512,
-	.flags		= SHRINKER_MEMCG_AWARE,
-};
-
-static struct shrinker nfs4_xattr_large_entry_shrinker = {
-	.count_objects	= nfs4_xattr_entry_count,
-	.scan_objects	= nfs4_xattr_entry_scan,
-	.seeks		= 1,
-	.batch		= 512,
-	.flags		= SHRINKER_MEMCG_AWARE,
-};
+static struct shrinker *nfs4_xattr_cache_shrinker;
+static struct shrinker *nfs4_xattr_entry_shrinker;
+static struct shrinker *nfs4_xattr_large_entry_shrinker;
 
 static enum lru_status
 cache_lru_isolate(struct list_head *item,
@@ -943,7 +924,7 @@ nfs4_xattr_entry_scan(struct shrinker *shrink, struct shrink_control *sc)
 	struct nfs4_xattr_entry *entry;
 	struct list_lru *lru;
 
-	lru = (shrink == &nfs4_xattr_large_entry_shrinker) ?
+	lru = (shrink == nfs4_xattr_large_entry_shrinker) ?
 	    &nfs4_xattr_large_entry_lru : &nfs4_xattr_entry_lru;
 
 	freed = list_lru_shrink_walk(lru, sc, entry_lru_isolate, &dispose);
@@ -971,7 +952,7 @@ nfs4_xattr_entry_count(struct shrinker *shrink, struct shrink_control *sc)
 	unsigned long count;
 	struct list_lru *lru;
 
-	lru = (shrink == &nfs4_xattr_large_entry_shrinker) ?
+	lru = (shrink == nfs4_xattr_large_entry_shrinker) ?
 	    &nfs4_xattr_large_entry_lru : &nfs4_xattr_entry_lru;
 
 	count = list_lru_shrink_count(lru, sc);
@@ -991,18 +972,34 @@ static void nfs4_xattr_cache_init_once(void *p)
 	INIT_LIST_HEAD(&cache->dispose);
 }
 
-static int nfs4_xattr_shrinker_init(struct shrinker *shrinker,
-				    struct list_lru *lru, const char *name)
+typedef unsigned long (*count_objects_cb)(struct shrinker *s,
+					  struct shrink_control *sc);
+typedef unsigned long (*scan_objects_cb)(struct shrinker *s,
+					 struct shrink_control *sc);
+
+static int __init nfs4_xattr_shrinker_init(struct shrinker **shrinker,
+					   struct list_lru *lru, const char *name,
+					   count_objects_cb count,
+					   scan_objects_cb scan, long batch, int seeks)
 {
-	int ret = 0;
+	int ret;
 
-	ret = register_shrinker(shrinker, name);
-	if (ret)
+	*shrinker = shrinker_alloc(SHRINKER_MEMCG_AWARE, name);
+	if (!*shrinker)
+		return -ENOMEM;
+
+	ret = list_lru_init_memcg(lru, *shrinker);
+	if (ret) {
+		shrinker_free(*shrinker);
 		return ret;
+	}
 
-	ret = list_lru_init_memcg(lru, shrinker);
-	if (ret)
-		unregister_shrinker(shrinker);
+	(*shrinker)->count_objects = count;
+	(*shrinker)->scan_objects = scan;
+	(*shrinker)->batch = batch;
+	(*shrinker)->seeks = seeks;
+
+	shrinker_register(*shrinker);
 
 	return ret;
 }
@@ -1010,7 +1007,7 @@ static int nfs4_xattr_shrinker_init(struct shrinker *shrinker,
 static void nfs4_xattr_shrinker_destroy(struct shrinker *shrinker,
 					struct list_lru *lru)
 {
-	unregister_shrinker(shrinker);
+	shrinker_free(shrinker);
 	list_lru_destroy(lru);
 }
 
@@ -1026,27 +1023,31 @@ int __init nfs4_xattr_cache_init(void)
 		return -ENOMEM;
 
 	ret = nfs4_xattr_shrinker_init(&nfs4_xattr_cache_shrinker,
-				       &nfs4_xattr_cache_lru,
-				       "nfs-xattr_cache");
+				       &nfs4_xattr_cache_lru, "nfs-xattr_cache",
+				       nfs4_xattr_cache_count,
+				       nfs4_xattr_cache_scan, 0, DEFAULT_SEEKS);
 	if (ret)
 		goto out1;
 
 	ret = nfs4_xattr_shrinker_init(&nfs4_xattr_entry_shrinker,
-				       &nfs4_xattr_entry_lru,
-				       "nfs-xattr_entry");
+				       &nfs4_xattr_entry_lru, "nfs-xattr_entry",
+				       nfs4_xattr_entry_count,
+				       nfs4_xattr_entry_scan, 512, DEFAULT_SEEKS);
 	if (ret)
 		goto out2;
 
 	ret = nfs4_xattr_shrinker_init(&nfs4_xattr_large_entry_shrinker,
 				       &nfs4_xattr_large_entry_lru,
-				       "nfs-xattr_large_entry");
+				       "nfs-xattr_large_entry",
+				       nfs4_xattr_entry_count,
+				       nfs4_xattr_entry_scan, 512, 1);
 	if (!ret)
 		return 0;
 
-	nfs4_xattr_shrinker_destroy(&nfs4_xattr_entry_shrinker,
+	nfs4_xattr_shrinker_destroy(nfs4_xattr_entry_shrinker,
 				    &nfs4_xattr_entry_lru);
 out2:
-	nfs4_xattr_shrinker_destroy(&nfs4_xattr_cache_shrinker,
+	nfs4_xattr_shrinker_destroy(nfs4_xattr_cache_shrinker,
 				    &nfs4_xattr_cache_lru);
 out1:
 	kmem_cache_destroy(nfs4_xattr_cache_cachep);
@@ -1056,11 +1057,11 @@ int __init nfs4_xattr_cache_init(void)
 
 void nfs4_xattr_cache_exit(void)
 {
-	nfs4_xattr_shrinker_destroy(&nfs4_xattr_large_entry_shrinker,
+	nfs4_xattr_shrinker_destroy(nfs4_xattr_large_entry_shrinker,
 				    &nfs4_xattr_large_entry_lru);
-	nfs4_xattr_shrinker_destroy(&nfs4_xattr_entry_shrinker,
+	nfs4_xattr_shrinker_destroy(nfs4_xattr_entry_shrinker,
 				    &nfs4_xattr_entry_lru);
-	nfs4_xattr_shrinker_destroy(&nfs4_xattr_cache_shrinker,
+	nfs4_xattr_shrinker_destroy(nfs4_xattr_cache_shrinker,
 				    &nfs4_xattr_cache_lru);
 	kmem_cache_destroy(nfs4_xattr_cache_cachep);
 }
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
