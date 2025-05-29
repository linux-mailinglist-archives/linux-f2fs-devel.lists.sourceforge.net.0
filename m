Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B53AC7D63
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 May 2025 13:50:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujrHbHBZnY0eVcgJGVuZcc3fT48nzi+eVlDv124iApk=; b=nMIJSMlibKqUYt9nMqCNfN1xGB
	Zq766fwleUmoyD8a4kMOF+gUCtGdMHYV5F1KabhM9WXq/A8JgGMd2F9TO+hvuby5xN+k7JEs6Lg7O
	QjtPQ2bnchobDx0/nqwbJgqWkCncmSMZOpp46JEf0CdVhi2wkD/MzPbG3HxvMYn9p+Sk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uKblm-0002Zn-Pf;
	Thu, 29 May 2025 11:49:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1uKbli-0002ZI-On
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 11:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ts9ngdqlLw2AEiZ86ZxN1Hs3ycwqqPPWcX97f26fAOg=; b=fFnekCXvZL2lp1SuahAEovuiFy
 wpyO0/WHcP+nqcR686y0hkiuX6l5S4gL12ueJ19jvaSCy1xDkbcW2Zul+hR29UT7bPbwRuBWmZ5xP
 PVnHF0nhulSTW9B5AVarjhwtMzLQDATpnTqsscUGhLEe45et4R5TPplpzgRMXelFd50w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ts9ngdqlLw2AEiZ86ZxN1Hs3ycwqqPPWcX97f26fAOg=; b=jEgQtBCxt3thJvUBfAOz7jpON4
 X4JYRSvBGTwSa9Kk659niS+Dca1cuDA/4wCTlc9y1ObuUPM2CMP1GWsjZDDSlh+URuLxgQUdwvBV6
 myAfH+spQX6tFOFM8exBJql4SqoAK811N8EOT6ivIPof/uqyI9+O2tfvv92DwLZ1zDww=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uKblh-0000xx-7h for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 11:49:54 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250529113332epoutp0336f5027e349eb91f32e429657ae8b50e~D-DtoDlot0876908769epoutp033
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 May 2025 11:33:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250529113332epoutp0336f5027e349eb91f32e429657ae8b50e~D-DtoDlot0876908769epoutp033
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1748518412;
 bh=ts9ngdqlLw2AEiZ86ZxN1Hs3ycwqqPPWcX97f26fAOg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YnrJd0etJxSguxdAPqGpBHI+1IXq2by0WL4ZxyMtjbP4IWf3nWJgjZghWV4WjPBT2
 zvZfg+ds/JYe37o+0k/LNE7kYDu6ObRDBV1Hz/OsMMWTIW4U9oTQHfsy0OiBB4LFwU
 0QSTFVgc1D4FegqpAjhsPF1Lr1Qp+CfLS0gBB78s=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
 20250529113331epcas5p31117eefbd7821d886b55aa7d388289a5~D-Ds5oUNm3109531095epcas5p34;
 Thu, 29 May 2025 11:33:31 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.183]) by
 epsnrtp04.localdomain (Postfix) with ESMTP id 4b7PQ228rNz6B9m5; Thu, 29 May
 2025 11:33:30 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20250529113224epcas5p2eea35fd0ebe445d8ad0471a144714b23~D-Ct71Fwq0469904699epcas5p2q;
 Thu, 29 May 2025 11:32:24 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250529113224epsmtrp15931173685a255cae3a7376266154c4b~D-Ct6hjf02108121081epsmtrp1t;
 Thu, 29 May 2025 11:32:24 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-0f-683845c7d353
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 A7.D0.08766.7C548386; Thu, 29 May 2025 20:32:23 +0900 (KST)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250529113219epsmtip24a8a22fe2424d5c844ec10fe7a251a72~D-CqFFjwh0869408694epsmtip2r;
 Thu, 29 May 2025 11:32:19 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, p.raghav@samsung.com,
 da.gomez@samsung.com
Date: Thu, 29 May 2025 16:44:53 +0530
Message-Id: <20250529111504.89912-3-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529111504.89912-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBIsWRmVeSWpSXmKPExsWy7bCSvO5xV4sMg5vTLCy2rdvNbjFn/Ro2
 iwvrVjNatO78z2LRNOEvs8Xqu/1sFq8Pf2K0OD31LJPFlkv2Fu8vb2OyWH1zDaPFlmP3GC0u
 P+Gz2D39H6vFzQM7mSxWrj7KZDF7ejOTxZP1s5gttn75ympxaZG7xZ69J1ks7q35z2px4cBp
 VosbE54yWjzbvZHZ4vPSFnaLg6c62C0+zQUacv7vcVaL3z/msDnIeZxaJOGxc9Zddo/NK7Q8
 Lp8t9di0qpPNY9OnSeweJ2b8ZvF4sXkmo8fuBZ+ZPHbfbGDzOHexwuP9vqtsHn1bVjF6TJ1d
 73FmwRF2jxXTLjIFCEVx2aSk5mSWpRbp2yVwZSy7dZexYLZ+xekv0xgbGM+odzFyckgImEjM
 uTqDDcQWEtjNKHH0gxxEXEZi992drBC2sMTKf8/ZIWo+MkqsmRTdxcjBwSagK/GjKbSLkYtD
 ROAms8S5s2fA6pkF/jFK7H6lA2ILC8RINHYfZgGxWQRUJRb9PgQ2h1fAVuLfhj3MEPPlJWZe
 +g4W5xSwk1i05CsjxC5biaU317JA1AtKnJz5hAVivrxE89bZzBMYBWYhSc1CklrAyLSKUTK1
 oDg3PbfYsMAwL7Vcrzgxt7g0L10vOT93EyM4MWhp7mDcvuqD3iFGJg7GQ4wSHMxKIrxN9mYZ
 QrwpiZVVqUX58UWlOanFhxilOViUxHnFX/SmCAmkJ5akZqemFqQWwWSZODilGpgk3lzo8dvA
 YsTVsvtRmXMuV0Vhd/ZOUzlbaaVZ1klcHhEpVx+eLC/JMW01Mgr78/z7reP9B64mfDqTtyE8
 +Ljm1LZtqZus02a3C/pt3hWwcK+tU80Hv0rLrC/PE+fcqFzqwCfKssbrkGqvhu+iPPN5Z6Mm
 LRH/vO1GbfSOrR+3nN/Qs8by8jnn79IFN9cu2rKL4ZUOw+z4KfM+aWqnno3xOihVumqLvML7
 hkKfdY8cmY+WvzXVfTBn/YbSkwrHIp/Mr0+6+kXw+PML2l7/N6Yw7X38+HZswPv6mUmr/fQ5
 LIIfXexZzWe9vllgf+2lSH+95pj3Wx603GTQCGcP4+A+dTDS46j+QyGbxbUr/2QpsRRnJBpq
 MRcVJwIAj/csfXsDAAA=
X-CMS-MailID: 20250529113224epcas5p2eea35fd0ebe445d8ad0471a144714b23
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250529113224epcas5p2eea35fd0ebe445d8ad0471a144714b23
References: <20250529111504.89912-1-kundan.kumar@samsung.com>
 <CGME20250529113224epcas5p2eea35fd0ebe445d8ad0471a144714b23@epcas5p2.samsung.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Introduce a new macro for_each_bdi_wb_ctx to iterate over
 multiple writeback ctxs. Added logic for allocation, init, free, registration
 and unregistration of multiple writeback contexts within a bdi. 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.33 listed in sa-trusted.bondedsender.org]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.33 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.33 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.9 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uKblh-0000xx-7h
Subject: [f2fs-dev] [PATCH 02/13] writeback: add support to initialize and
 free multiple writeback ctxs
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
Cc: linux-nfs@vger.kernel.org, gost.dev@samsung.com,
 Anuj Gupta <anuj20.g@samsung.com>, linux-f2fs-devel@lists.sourceforge.net,
 gfs2@lists.linux.dev, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Kundan Kumar <kundan.kumar@samsung.com>
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
 mm/backing-dev.c            | 79 +++++++++++++++++++++++++++----------
 2 files changed, 62 insertions(+), 21 deletions(-)

diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
index 894968e98dd8..fbccb483e59c 100644
--- a/include/linux/backing-dev.h
+++ b/include/linux/backing-dev.h
@@ -148,6 +148,10 @@ static inline bool mapping_can_writeback(struct address_space *mapping)
 	return inode_to_bdi(mapping->host)->capabilities & BDI_CAP_WRITEBACK;
 }
 
+#define for_each_bdi_wb_ctx(bdi, wb_ctx) \
+	for (int __i = 0; __i < (bdi)->nr_wb_ctx \
+		&& ((wb_ctx) = (bdi)->wb_ctx_arr[__i]) != NULL; __i++)
+
 static inline struct bdi_writeback_ctx *
 fetch_bdi_writeback_ctx(struct inode *inode)
 {
diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index 0efa9632011a..adf87b036827 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -836,16 +836,19 @@ struct bdi_writeback *wb_get_create(struct backing_dev_info *bdi,
 static int cgwb_bdi_init(struct backing_dev_info *bdi)
 {
 	int ret;
-	struct bdi_writeback_ctx *bdi_wb_ctx = bdi->wb_ctx_arr[0];
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
-	return wb_init(&bdi->wb_ctx_arr[0]->wb, bdi, GFP_KERNEL);
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
-	bdi->wb_ctx_arr[0] = (struct bdi_writeback_ctx *)
-			kzalloc(sizeof(struct bdi_writeback_ctx), GFP_KERNEL);
-	INIT_LIST_HEAD(&bdi->wb_ctx_arr[0]->wb_list);
-	init_waitqueue_head(&bdi->wb_ctx_arr[0]->wb_waitq);
+	for (int i = 0; i < bdi->nr_wb_ctx; i++) {
+		bdi->wb_ctx_arr[i] = (struct bdi_writeback_ctx *)
+			 kzalloc(sizeof(struct bdi_writeback_ctx), GFP_KERNEL);
+		if (!bdi->wb_ctx_arr[i]) {
+			pr_err("Failed to allocate %d", i);
+			while (--i >= 0)
+				kfree(bdi->wb_ctx_arr[i]);
+			kfree(bdi->wb_ctx_arr);
+			return -ENOMEM;
+		}
+		INIT_LIST_HEAD(&bdi->wb_ctx_arr[i]->wb_list);
+		init_waitqueue_head(&bdi->wb_ctx_arr[i]->wb_waitq);
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
-		kfree(bdi->wb_ctx_arr[0]);
+		for_each_bdi_wb_ctx(bdi, bdi_wb_ctx) {
+			kfree(bdi_wb_ctx);
+		}
 		kfree(bdi->wb_ctx_arr);
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
 
-	cgwb_bdi_register(bdi, bdi->wb_ctx_arr[0]);
-	set_bit(WB_registered, &bdi->wb_ctx_arr[0]->wb.state);
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
-	wb_shutdown(&bdi->wb_ctx_arr[0]->wb);
-	cgwb_bdi_unregister(bdi, bdi->wb_ctx_arr[0]);
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
-	WARN_ON_ONCE(test_bit(WB_registered, &bdi->wb_ctx_arr[0]->wb.state));
-	wb_exit(&bdi->wb_ctx_arr[0]->wb);
-	kfree(bdi->wb_ctx_arr[0]);
+
+	for_each_bdi_wb_ctx(bdi, bdi_wb_ctx) {
+		WARN_ON_ONCE(test_bit(WB_registered, &bdi_wb_ctx->wb.state));
+		wb_exit(&bdi_wb_ctx->wb);
+		kfree(bdi_wb_ctx);
+	}
 	kfree(bdi->wb_ctx_arr);
 	kfree(bdi);
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
