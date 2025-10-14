Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7791BD943F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Oct 2025 14:11:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dQLxWyRBP5sRBHy1CB1mlelfWi2g1CMe5aXCnYz6N4=; b=Sb1yeOkhxYZgUyb2WhTd2G7neI
	vqDjNUEdCeEBlUfKvVpsr7t6sR7lCM91RjLXnnWIiOJoOt2KW2DfHcLzRnlD4HeCLM/ZRet1+QiID
	B3GCZGMHXuV/0zA6WU1DgGBfmDy21yCDQRYjbuJSMOLWq64rx0ysAQl59OM6jATH4s5o=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8dsY-0007GY-Iq;
	Tue, 14 Oct 2025 12:11:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1v8dsV-0007G8-IC
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9xfpeIa6BTBN9y5Yua6WUo/kfaK/tK7nGJtau+f6sKc=; b=NlyhbWWr2M66Z6kMrhjNYvjVnh
 Ujy6fH8dqD85GU/lYoxkvtAv3xhVPaHPpnR+3bf6+sa/pgcWQdGXb73ZpHYOlFbBciVyT0HD3aby3
 k8cwlQpbV10zDJbX66nhavGd9zVfzjvgB04kMKcNw4bWSM8L+SIS/B0pD21K2CX3YGpE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9xfpeIa6BTBN9y5Yua6WUo/kfaK/tK7nGJtau+f6sKc=; b=PaiqQ6SDxZ4pDnHg4Hv1m7LL/Z
 FtAYlP7IQA4wYypgHZFpARLfluLlZE7Qnck2xkcrFi7jA1Alg+1qkmRRn+AIaSKjAv5L2cF2Qh4ti
 VSBjiDdRaHiqV3VrIpuWioAKc1wRfR63xrYcsZ0rtK+UClpR/LeZdOAZ6VeC12unyAdc=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8dsU-0001QK-NI for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:11:43 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20251014121128epoutp04605fc75fbe9a51f009029fed5ffd63f9~uWmPGmb9G1207112071epoutp04j
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Oct 2025 12:11:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20251014121128epoutp04605fc75fbe9a51f009029fed5ffd63f9~uWmPGmb9G1207112071epoutp04j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1760443888;
 bh=9xfpeIa6BTBN9y5Yua6WUo/kfaK/tK7nGJtau+f6sKc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aRg1W5LYNkmKJwBmfMDXQwULILoQQMbKD5xpULndN+acw7wKF+EajcSX901J8Jl1U
 0srsAeNWSVZqvnUIK60lYB6FgmXELyMEl31IcvSy8TC5CMQsTbWbmK9OWPXlR6Tp98
 Lbh1JDG2eukum2O3hPuZuuu8mcFlIJOS0JXaVQCY=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
 20251014121128epcas5p4967119ea4614d684d93c7583f8d5a134~uWmOYhois3228732287epcas5p4S;
 Tue, 14 Oct 2025 12:11:28 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.90]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4cmCk71PPbz2SSKX; Tue, 14 Oct
 2025 12:11:27 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20251014121126epcas5p2ff20c9139bdd702c77b9de50e4f259c7~uWmM4HphY2935829358epcas5p21;
 Tue, 14 Oct 2025 12:11:26 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20251014121122epsmtip167b1288b36b0fc975fc831b21babda9a~uWmJEInWw1256612566epsmtip1C;
 Tue, 14 Oct 2025 12:11:22 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, wangyufei@vivo.com
Date: Tue, 14 Oct 2025 17:38:43 +0530
Message-Id: <20251014120845.2361-15-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251014120845.2361-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-CMS-MailID: 20251014121126epcas5p2ff20c9139bdd702c77b9de50e4f259c7
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251014121126epcas5p2ff20c9139bdd702c77b9de50e4f259c7
References: <20251014120845.2361-1-kundan.kumar@samsung.com>
 <CGME20251014121126epcas5p2ff20c9139bdd702c77b9de50e4f259c7@epcas5p2.samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The independent functions of alloc and free will be used
 while
 changing the number of writeback contexts. Signed-off-by: Kundan Kumar
 <kundan.kumar@samsung.com>
 Signed-off-by: Anuj Gupta <anuj20.g@samsung.com> --- mm/backing-dev.c | 72
 ++++++++++++++++++++++++++++++++ 1 file changed, 49 in [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v8dsU-0001QK-NI
Subject: [f2fs-dev] [PATCH v2 14/16] writeback: segregated allocation and
 free of writeback contexts
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

The independent functions of alloc and free will be used while changing
the number of writeback contexts.

Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 mm/backing-dev.c | 72 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 49 insertions(+), 23 deletions(-)

diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index 0a3204a3a3a3..2a8f3b683b2d 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -1038,8 +1038,46 @@ static void cgwb_remove_from_bdi_list(struct bdi_writeback *wb)
 
 #endif	/* CONFIG_CGROUP_WRITEBACK */
 
+static struct bdi_writeback_ctx **wb_ctx_alloc(struct backing_dev_info *bdi,
+					       int num_ctxs)
+{
+	struct bdi_writeback_ctx **wb_ctx;
+
+	wb_ctx = kcalloc(num_ctxs, sizeof(struct bdi_writeback_ctx *),
+			     GFP_KERNEL);
+	if (!wb_ctx)
+		return NULL;
+
+	for (int i = 0; i < num_ctxs; i++) {
+		wb_ctx[i] = (struct bdi_writeback_ctx *)
+			kzalloc(sizeof(struct bdi_writeback_ctx), GFP_KERNEL);
+		if (!wb_ctx[i]) {
+			pr_err("Failed to allocate %d", i);
+			while (--i >= 0)
+				kfree(wb_ctx[i]);
+			kfree(wb_ctx);
+			return NULL;
+		}
+		INIT_LIST_HEAD(&wb_ctx[i]->wb_list);
+		init_waitqueue_head(&wb_ctx[i]->wb_waitq);
+	}
+	return wb_ctx;
+}
+
+static void wb_ctx_free(struct backing_dev_info *bdi)
+{
+	struct bdi_writeback_ctx *bdi_wb_ctx;
+
+	for_each_bdi_wb_ctx(bdi, bdi_wb_ctx) {
+		kfree(bdi_wb_ctx);
+	}
+	kfree(bdi->wb_ctx);
+}
+
 int bdi_init(struct backing_dev_info *bdi)
 {
+	int ret;
+
 	bdi->dev = NULL;
 
 	kref_init(&bdi->refcnt);
@@ -1047,48 +1085,36 @@ int bdi_init(struct backing_dev_info *bdi)
 	bdi->max_ratio = 100 * BDI_RATIO_SCALE;
 	bdi->max_prop_frac = FPROP_FRAC_BASE;
 
+	INIT_LIST_HEAD(&bdi->bdi_list);
+
 	/*
 	 * User can configure nr_wb_ctx using the newly introduced sysfs knob.
 	 * echo N > /sys/class/bdi/<maj>:<min>/nwritebacks
 	 * Filesystem can also increase same during mount.
 	 */
 	bdi->nr_wb_ctx = 1;
-	bdi->wb_ctx = kcalloc(bdi->nr_wb_ctx,
-				  sizeof(struct bdi_writeback_ctx *),
-				  GFP_KERNEL);
-	INIT_LIST_HEAD(&bdi->bdi_list);
-	for (int i = 0; i < bdi->nr_wb_ctx; i++) {
-		bdi->wb_ctx[i] = (struct bdi_writeback_ctx *)
-			 kzalloc(sizeof(struct bdi_writeback_ctx), GFP_KERNEL);
-		if (!bdi->wb_ctx[i]) {
-			pr_err("Failed to allocate %d", i);
-			while (--i >= 0)
-				kfree(bdi->wb_ctx[i]);
-			kfree(bdi->wb_ctx);
-			return -ENOMEM;
-		}
-		INIT_LIST_HEAD(&bdi->wb_ctx[i]->wb_list);
-		init_waitqueue_head(&bdi->wb_ctx[i]->wb_waitq);
-	}
+
+	bdi->wb_ctx = wb_ctx_alloc(bdi, bdi->nr_wb_ctx);
+	if (!bdi->wb_ctx)
+		return -ENOMEM;
+
 	bdi->last_bdp_sleep = jiffies;
 
-	return cgwb_bdi_init(bdi);
+	ret = cgwb_bdi_init(bdi);
+	if (ret)
+		wb_ctx_free(bdi);
+	return ret;
 }
 
 struct backing_dev_info *bdi_alloc(int node_id)
 {
 	struct backing_dev_info *bdi;
-	struct bdi_writeback_ctx *bdi_wb_ctx;
 
 	bdi = kzalloc_node(sizeof(*bdi), GFP_KERNEL, node_id);
 	if (!bdi)
 		return NULL;
 
 	if (bdi_init(bdi)) {
-		for_each_bdi_wb_ctx(bdi, bdi_wb_ctx) {
-			kfree(bdi_wb_ctx);
-		}
-		kfree(bdi->wb_ctx);
 		kfree(bdi);
 		return NULL;
 	}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
