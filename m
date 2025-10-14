Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F711BD93F7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Oct 2025 14:10:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sH0+/W8OyMHvlCNn1nK4YQR9+YLqJ74lkbQdcTZzeU=; b=JnAJDF+taoiYuVRIa+090hnxAI
	OKc3zpf69xpE/gXjvNbB6PZe9ZJzvEqTtA+0GmXP9HlSUE8EcSdyH9ziCMwtimPgZ7f/Zf50XpAv2
	5M/o20SIjbvM7AJm1Rav5ER+5c2InGAezaCR4kh4dZK3ot4qCNl25lX24lc7qOLNDpvA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8drV-0000hG-VG;
	Tue, 14 Oct 2025 12:10:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1v8drT-0000h7-Ox
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:10:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eHJ+QzB7bCnBbwX1a/ip7LbHhQnCIhG/2G0p09gVgzE=; b=XgxzsdTvL/hpqEdtCV9lsjVxP7
 fTp6KJE6QpUsOCynjI6Sd7NiRLZhz1lZUWQJwkrWZ2wod+6BnJHFvYMds8Zln8IvFS9rjxyGUk9jN
 qgkS/HUKELCcPDD4dBhZ+NH5Z+Ps5M0lH7gIYhlY+OEkM0WkKXn1IEInUlqMuegJEX90=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eHJ+QzB7bCnBbwX1a/ip7LbHhQnCIhG/2G0p09gVgzE=; b=d4HJZY6hpR5NGjcNEV0mxAeeNc
 aq0nLxiWAO8diI3mQZGQSjkJd2PnsW0ZjoSszpx+HoI6CmsxJSAflYEiuqcayPEG7TIy9UYpKwAkq
 tof2NWQGDh7E3Zz6XVORzL0R6QOpqAgMLS8olPYKDHLd6uDDKzPcS2yvSZmQLj1kkj4I=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8drQ-0001Lz-QO for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:10:37 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20251014121023epoutp01deec5153b5bcd066ef1a1b5dae469ca7~uWlSCYnTm1129411294epoutp01B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Oct 2025 12:10:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20251014121023epoutp01deec5153b5bcd066ef1a1b5dae469ca7~uWlSCYnTm1129411294epoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1760443823;
 bh=eHJ+QzB7bCnBbwX1a/ip7LbHhQnCIhG/2G0p09gVgzE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l345k14G559CrmfftgGwIQZN6qFnhJbE7WwE9ntPZzWwRWY4QmDA6cicbz9z00rDg
 Neh0PIEXc0Mk9inH40jgB9AIlwJ48EUnI30qGlJTiMr+Nc5LkA97O2+kPiF3sADRHG
 x8x3EULaNt14QJy3S2H9MFB52LDExUUIN6Qo5p3U=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
 20251014121022epcas5p18ca54217626ae6f7cf1a4881989cd40d~uWlRJ98ZF0673806738epcas5p1P;
 Tue, 14 Oct 2025 12:10:22 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.92]) by
 epsnrtp03.localdomain (Postfix) with ESMTP id 4cmChs371hz3hhT3; Tue, 14 Oct
 2025 12:10:21 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20251014121020epcas5p36ca8a0d6d74f7b81996bb367329feb4a~uWlPfM4OW0426604266epcas5p3o;
 Tue, 14 Oct 2025 12:10:20 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20251014121014epsmtip1dd1dae420667f5e45f691b22f2193ab7~uWlJvBsTP1256112561epsmtip1j;
 Tue, 14 Oct 2025 12:10:14 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, wangyufei@vivo.com
Date: Tue, 14 Oct 2025 17:38:31 +0530
Message-Id: <20251014120845.2361-3-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251014120845.2361-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-CMS-MailID: 20251014121020epcas5p36ca8a0d6d74f7b81996bb367329feb4a
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251014121020epcas5p36ca8a0d6d74f7b81996bb367329feb4a
References: <20251014120845.2361-1-kundan.kumar@samsung.com>
 <CGME20251014121020epcas5p36ca8a0d6d74f7b81996bb367329feb4a@epcas5p3.samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Introduce a new macro for_each_bdi_wb_ctx to iterate over
 multiple writeback ctxs. Added logic for allocation, init, free, registration
 and unregistration of multiple writeback contexts within a bdi. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v8drQ-0001Lz-QO
Subject: [f2fs-dev] [PATCH v2 02/16] writeback: add support to initialize
 and free multiple writeback ctxs
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
Cc: linux-nfs@vger.kernel.org, gost.dev@samsung.com, anuj20.g@samsung.com,
 vishak.g@samsung.com, linux-f2fs-devel@lists.sourceforge.net,
 gfs2@lists.linux.dev, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 kundan.kumar@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Introduce a new macro for_each_bdi_wb_ctx to iterate over multiple
writeback ctxs. Added logic for allocation, init, free, registration
and unregistration of multiple writeback contexts within a bdi.

Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 include/linux/backing-dev.h |  4 ++
 mm/backing-dev.c            | 81 +++++++++++++++++++++++++++----------
 2 files changed, 63 insertions(+), 22 deletions(-)

diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
index 92674543ac8a..951ab5497500 100644
--- a/include/linux/backing-dev.h
+++ b/include/linux/backing-dev.h
@@ -148,6 +148,10 @@ static inline bool mapping_can_writeback(struct address_space *mapping)
 	return inode_to_bdi(mapping->host)->capabilities & BDI_CAP_WRITEBACK;
 }
 
+#define for_each_bdi_wb_ctx(bdi, wbctx) \
+	for (int __i = 0; __i < (bdi)->nr_wb_ctx \
+		&& ((wbctx) = (bdi)->wb_ctx[__i]) != NULL; __i++)
+
 static inline struct bdi_writeback_ctx *
 fetch_bdi_writeback_ctx(struct inode *inode)
 {
diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index 8b7125349f6c..47196d326e16 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -835,17 +835,20 @@ struct bdi_writeback *wb_get_create(struct backing_dev_info *bdi,
 
 static int cgwb_bdi_init(struct backing_dev_info *bdi)
 {
-	int ret;
-	struct bdi_writeback_ctx *bdi_wb_ctx = bdi->wb_ctx[0];
+	int ret = 0;
+	struct bdi_writeback_ctx *bdi_wb_ctx;
 
-	INIT_RADIX_TREE(&bdi_wb_ctx->cgwb_tree, GFP_ATOMIC);
-	mutex_init(&bdi->cgwb_release_mutex);
-	init_rwsem(&bdi_wb_ctx->wb_switch_rwsem);
+	for_each_bdi_wb_ctx(bdi, bdi_wb_ctx) {
+		INIT_RADIX_TREE(&bdi_wb_ctx->cgwb_tree, GFP_ATOMIC);
+		mutex_init(&bdi->cgwb_release_mutex);
+		init_rwsem(&bdi_wb_ctx->wb_switch_rwsem);
 
-	ret = wb_init(&bdi_wb_ctx->wb, bdi, GFP_KERNEL);
-	if (!ret) {
-		bdi_wb_ctx->wb.memcg_css = &root_mem_cgroup->css;
-		bdi_wb_ctx->wb.blkcg_css = blkcg_root_css;
+		ret = wb_init(&bdi_wb_ctx->wb, bdi, GFP_KERNEL);
+		if (!ret) {
+			bdi_wb_ctx->wb.memcg_css = &root_mem_cgroup->css;
+			bdi_wb_ctx->wb.blkcg_css = blkcg_root_css;
+		} else
+			return ret;
 	}
 	return ret;
 }
@@ -992,7 +995,16 @@ subsys_initcall(cgwb_init);
 
 static int cgwb_bdi_init(struct backing_dev_info *bdi)
 {
-	return wb_init(&bdi->wb_ctx[0]->wb, bdi, GFP_KERNEL);
+	struct bdi_writeback_ctx *bdi_wb_ctx;
+
+	for_each_bdi_wb_ctx(bdi, bdi_wb_ctx) {
+		int ret;
+
+		ret = wb_init(&bdi_wb_ctx->wb, bdi, GFP_KERNEL);
+		if (ret)
+			return ret;
+	}
+	return 0;
 }
 
 static void cgwb_bdi_unregister(struct backing_dev_info *bdi,
@@ -1026,10 +1038,19 @@ int bdi_init(struct backing_dev_info *bdi)
 				  sizeof(struct bdi_writeback_ctx *),
 				  GFP_KERNEL);
 	INIT_LIST_HEAD(&bdi->bdi_list);
-	bdi->wb_ctx[0] = (struct bdi_writeback_ctx *)
-			kzalloc(sizeof(struct bdi_writeback_ctx), GFP_KERNEL);
-	INIT_LIST_HEAD(&bdi->wb_ctx[0]->wb_list);
-	init_waitqueue_head(&bdi->wb_ctx[0]->wb_waitq);
+	for (int i = 0; i < bdi->nr_wb_ctx; i++) {
+		bdi->wb_ctx[i] = (struct bdi_writeback_ctx *)
+			 kzalloc(sizeof(struct bdi_writeback_ctx), GFP_KERNEL);
+		if (!bdi->wb_ctx[i]) {
+			pr_err("Failed to allocate %d", i);
+			while (--i >= 0)
+				kfree(bdi->wb_ctx[i]);
+			kfree(bdi->wb_ctx);
+			return -ENOMEM;
+		}
+		INIT_LIST_HEAD(&bdi->wb_ctx[i]->wb_list);
+		init_waitqueue_head(&bdi->wb_ctx[i]->wb_waitq);
+	}
 	bdi->last_bdp_sleep = jiffies;
 
 	return cgwb_bdi_init(bdi);
@@ -1038,13 +1059,16 @@ int bdi_init(struct backing_dev_info *bdi)
 struct backing_dev_info *bdi_alloc(int node_id)
 {
 	struct backing_dev_info *bdi;
+	struct bdi_writeback_ctx *bdi_wb_ctx;
 
 	bdi = kzalloc_node(sizeof(*bdi), GFP_KERNEL, node_id);
 	if (!bdi)
 		return NULL;
 
 	if (bdi_init(bdi)) {
-		kfree(bdi->wb_ctx[0]);
+		for_each_bdi_wb_ctx(bdi, bdi_wb_ctx) {
+			kfree(bdi_wb_ctx);
+		}
 		kfree(bdi->wb_ctx);
 		kfree(bdi);
 		return NULL;
@@ -1109,6 +1133,7 @@ int bdi_register_va(struct backing_dev_info *bdi, const char *fmt, va_list args)
 {
 	struct device *dev;
 	struct rb_node *parent, **p;
+	struct bdi_writeback_ctx *bdi_wb_ctx;
 
 	if (bdi->dev)	/* The driver needs to use separate queues per device */
 		return 0;
@@ -1118,8 +1143,11 @@ int bdi_register_va(struct backing_dev_info *bdi, const char *fmt, va_list args)
 	if (IS_ERR(dev))
 		return PTR_ERR(dev);
 
-	cgwb_bdi_register(bdi, bdi->wb_ctx[0]);
-	set_bit(WB_registered, &bdi->wb_ctx[0]->wb.state);
+	for_each_bdi_wb_ctx(bdi, bdi_wb_ctx) {
+		cgwb_bdi_register(bdi, bdi_wb_ctx);
+		set_bit(WB_registered, &bdi_wb_ctx->wb.state);
+	}
+
 	bdi->dev = dev;
 
 	bdi_debug_register(bdi, dev_name(dev));
@@ -1174,12 +1202,17 @@ static void bdi_remove_from_list(struct backing_dev_info *bdi)
 
 void bdi_unregister(struct backing_dev_info *bdi)
 {
+	struct bdi_writeback_ctx *bdi_wb_ctx;
+
 	timer_delete_sync(&bdi->laptop_mode_wb_timer);
 
 	/* make sure nobody finds us on the bdi_list anymore */
 	bdi_remove_from_list(bdi);
-	wb_shutdown(&bdi->wb_ctx[0]->wb);
-	cgwb_bdi_unregister(bdi, bdi->wb_ctx[0]);
+
+	for_each_bdi_wb_ctx(bdi, bdi_wb_ctx) {
+		wb_shutdown(&bdi_wb_ctx->wb);
+		cgwb_bdi_unregister(bdi, bdi_wb_ctx);
+	}
 
 	/*
 	 * If this BDI's min ratio has been set, use bdi_set_min_ratio() to
@@ -1205,11 +1238,15 @@ static void release_bdi(struct kref *ref)
 {
 	struct backing_dev_info *bdi =
 			container_of(ref, struct backing_dev_info, refcnt);
+	struct bdi_writeback_ctx *bdi_wb_ctx;
 
 	WARN_ON_ONCE(bdi->dev);
-	WARN_ON_ONCE(test_bit(WB_registered, &bdi->wb_ctx[0]->wb.state));
-	wb_exit(&bdi->wb_ctx[0]->wb);
-	kfree(bdi->wb_ctx[0]);
+
+	for_each_bdi_wb_ctx(bdi, bdi_wb_ctx) {
+		WARN_ON_ONCE(test_bit(WB_registered, &bdi_wb_ctx->wb.state));
+		wb_exit(&bdi_wb_ctx->wb);
+		kfree(bdi_wb_ctx);
+	}
 	kfree(bdi->wb_ctx);
 	kfree(bdi);
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
