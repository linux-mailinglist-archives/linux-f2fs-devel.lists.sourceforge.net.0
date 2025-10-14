Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 682E1BD9419
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Oct 2025 14:11:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLm6B3aZ/wALVkwge5Uj+tV3PIzyvD9yosLq7tKejs8=; b=li00FpfS+xZ6oBNEpHR4ifcjcJ
	DH2Qb5DBVkRofHn0k1URVgOIpLBLyqM4BCCBKfbEbsPq06OiqkIZbud0RDN4S/JsUriXzTiIwQ3zY
	ZMY1hoTx1lHMw//7Zj43s8m24j8sATgPDhlpey8wsDTzK1rGRUqJUK8tZqkwpRiak/LY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8ds7-0000k4-NX;
	Tue, 14 Oct 2025 12:11:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1v8ds6-0000jf-Bz
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9L9Dd+P57Nr9ie5r9Dy2BGUr0ErT9/3lAp5Du2+fgsc=; b=RsRSKtSX56ZF0URbIbNNb6ZpBB
 jdL8FB2oI690eE8q9Zi7IFhPLJKDcFEFTRGfCrTgvV66MS9jjnv9LpVmV+o7OzEBg8fiso+lG+IJf
 lFISoJHPowUduacvAzd5BbZZlKokMUVwvG+bey6/hWzgtVQq1yS+D7LVwXTecKdQ196U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9L9Dd+P57Nr9ie5r9Dy2BGUr0ErT9/3lAp5Du2+fgsc=; b=HLLxuASjQa2h1yGa0iLVwfWJA5
 wfF6J7WGM20w8n1MKNbHzKNLBRlS+JcPqk56p/ReRe4XCYc7mVyeAza5VLH2awbDdaVySjDgXk3J7
 NuMXlCRfwrT8xTptIzZSyZvv2mtniPRDYlWuOiy6c1C9qsY5lC4xz50PLDUNaaAaJSBs=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8ds4-0001OF-EF for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:11:17 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20251014121104epoutp043b35e5e7d299af50057cf770af07ceef~uWl4qToVx1207112071epoutp04U
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Oct 2025 12:11:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20251014121104epoutp043b35e5e7d299af50057cf770af07ceef~uWl4qToVx1207112071epoutp04U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1760443864;
 bh=9L9Dd+P57Nr9ie5r9Dy2BGUr0ErT9/3lAp5Du2+fgsc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VWzGZvfiHiU5Yz8K8MUBF/sznhrM9+sNgjg53fdyEgQwvRJICwiS7dfGfPgYSvCSE
 Tymm6YJMjuSzD80p3C5TV0qzpTpD3b/5G+fop71hg8uZbZo2J6z2RBVvyYgoY6Eq7V
 8qbcsIs6NS+JZaKd8csOvwhgE2lkkHX724BTgY2o=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
 20251014121104epcas5p2bc15fe91af3f477ce59f23de07a762e7~uWl4GCzCQ2441424414epcas5p2z;
 Tue, 14 Oct 2025 12:11:04 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
 epsnrtp03.localdomain (Postfix) with ESMTP id 4cmCjg1c1Qz3hhT7; Tue, 14 Oct
 2025 12:11:03 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20251014121102epcas5p3280cd3e6bf16a2fb6a7fe483751f07a7~uWl2mt8mp0753907539epcas5p3l;
 Tue, 14 Oct 2025 12:11:02 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20251014121056epsmtip121363f1d7a311e444423e431a609c5f4~uWlxNY78_1239712397epsmtip1d;
 Tue, 14 Oct 2025 12:10:56 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, wangyufei@vivo.com
Date: Tue, 14 Oct 2025 17:38:38 +0530
Message-Id: <20251014120845.2361-10-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251014120845.2361-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-CMS-MailID: 20251014121102epcas5p3280cd3e6bf16a2fb6a7fe483751f07a7
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251014121102epcas5p3280cd3e6bf16a2fb6a7fe483751f07a7
References: <20251014120845.2361-1-kundan.kumar@samsung.com>
 <CGME20251014121102epcas5p3280cd3e6bf16a2fb6a7fe483751f07a7@epcas5p3.samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add support to handle multiple writeback contexts and check
 for dirty_exceeded across all the writeback contexts. Made a new helper for
 same. Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com> Signed-off-by:
 Anuj Gupta <anuj20.g@samsung.com> --- fs/f2fs/node.c | 4 ++--
 fs/f2fs/segment.h
 | 2 +- include/linux/backing-dev.h | 18 ++++++++++ [...] 
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
 [203.254.224.34 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v8ds4-0001OF-EF
Subject: [f2fs-dev] [PATCH v2 09/16] f2fs: add support in f2fs to handle
 multiple writeback contexts
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

Add support to handle multiple writeback contexts and check for
dirty_exceeded across all the writeback contexts.

Made a new helper for same.

Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 fs/f2fs/node.c              |  4 ++--
 fs/f2fs/segment.h           |  2 +-
 include/linux/backing-dev.h | 18 +++++++++++++++---
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 1693da9417f9..cd75aa98a1ca 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -73,7 +73,7 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
 		if (excess_cached_nats(sbi))
 			res = false;
 	} else if (type == DIRTY_DENTS) {
-		if (sbi->sb->s_bdi->wb_ctx[0]->wb.dirty_exceeded)
+		if (bdi_wb_dirty_limit_exceeded(sbi->sb->s_bdi))
 			return false;
 		mem_size = get_pages(sbi, F2FS_DIRTY_DENTS);
 		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100) >> 1);
@@ -114,7 +114,7 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
 		res = false;
 #endif
 	} else {
-		if (!sbi->sb->s_bdi->wb_ctx[0]->wb.dirty_exceeded)
+		if (!bdi_wb_dirty_limit_exceeded(sbi->sb->s_bdi))
 			return true;
 	}
 	return res;
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 7e5b7b1a5d2b..8487bd5d4394 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -993,7 +993,7 @@ static inline bool sec_usage_check(struct f2fs_sb_info *sbi, unsigned int secno)
  */
 static inline int nr_pages_to_skip(struct f2fs_sb_info *sbi, int type)
 {
-	if (sbi->sb->s_bdi->wb_ctx[0]->wb.dirty_exceeded)
+	if (bdi_wb_dirty_limit_exceeded(sbi->sb->s_bdi))
 		return 0;
 
 	if (type == DATA)
diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
index 59bbb69d300c..bb35f8fa4973 100644
--- a/include/linux/backing-dev.h
+++ b/include/linux/backing-dev.h
@@ -51,6 +51,21 @@ static inline bool wb_has_dirty_io(struct bdi_writeback *wb)
 	return test_bit(WB_has_dirty_io, &wb->state);
 }
 
+#define for_each_bdi_wb_ctx(bdi, wbctx) \
+	for (int __i = 0; __i < (bdi)->nr_wb_ctx \
+		&& ((wbctx) = (bdi)->wb_ctx[__i]) != NULL; __i++)
+
+static inline bool bdi_wb_dirty_limit_exceeded(struct backing_dev_info *bdi)
+{
+	struct bdi_writeback_ctx *bdi_wb_ctx;
+
+	for_each_bdi_wb_ctx(bdi, bdi_wb_ctx) {
+		if (bdi_wb_ctx->wb.dirty_exceeded)
+			return true;
+	}
+	return false;
+}
+
 static inline bool bdi_has_dirty_io(struct backing_dev_info *bdi)
 {
 	/*
@@ -149,9 +164,6 @@ static inline bool mapping_can_writeback(struct address_space *mapping)
 }
 
 #define DEFAULT_WB_CTX 0
-#define for_each_bdi_wb_ctx(bdi, wbctx) \
-	for (int __i = 0; __i < (bdi)->nr_wb_ctx \
-		&& ((wbctx) = (bdi)->wb_ctx[__i]) != NULL; __i++)
 
 static inline struct bdi_writeback_ctx *
 fetch_bdi_writeback_ctx(struct inode *inode)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
