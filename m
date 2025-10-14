Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4CBBD940F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Oct 2025 14:11:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BosuD1THJuJAC31lHj4qEBuKZ4KzVrH35gZT7EqaqtE=; b=OmzwxLlX+Gcw3WN730blL5dV7t
	oe79J5z5wolve1bhL4tR5LCIEYBrEr2w3Q0ppGZ8gDgSWWsbtTqZe2wPRS7VqyPLvRHZEmoDr1L//
	vWiwUBXTsPHS3RYnMJYxRZM+s5nqujnoSCP07vykJ0DNBZEuKijG1kY+3RaX9MpKG8k4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8ds3-0007DP-Qi;
	Tue, 14 Oct 2025 12:11:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1v8drx-0007Cs-AG
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/c9uP8WFDKEPNYMrrAFtFep8Nz4Xp2VTqpgzQSUqfpI=; b=hOWqMYsr04dl5posFEKs/h5Uuv
 Z1DHDU7SLbOhaUf5C6bqnJSmjho/lsS1D9a4WXZ+X/c/3Zj+G90EKBv8iya4kW+gZTN0JaD9bShsD
 77/r0fTswLfrGh3wXNb7rvCy2Xyyv5bxQZqtFJd3GS45JnabOoMQN6LbZC9sfwhsDChA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/c9uP8WFDKEPNYMrrAFtFep8Nz4Xp2VTqpgzQSUqfpI=; b=ZWdg1cdR+uz6raVUaAcLO+NHe3
 C5FSxqyymcNFnjRG12dr2Zqxb3FZrgXMNL0b89l2j5kbxXwmJbrwRe6DCs0YoIaADfHD13MmnIJC3
 ALoWnaUll/1vnEYd2algICAeV7Bha0Cc3J6C+Vim3C3UFK9crs4wotcZq0LwDb1JP+8Q=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8drn-0001Mu-1C for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:11:05 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20251014121051epoutp02789f10fcbec97714410475195b6be0d0~uWlsUTcl12267322673epoutp02_
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Oct 2025 12:10:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20251014121051epoutp02789f10fcbec97714410475195b6be0d0~uWlsUTcl12267322673epoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1760443851;
 bh=/c9uP8WFDKEPNYMrrAFtFep8Nz4Xp2VTqpgzQSUqfpI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DJ2sBHXm3mNyOFFCZ1PEByN5AJSZVwNvAFJxR60eE6o4rljWlJxgjVs2Cpw0wG6DQ
 GUNLbMp+BJPKIJ8njBtJpDdz0Qh+WGJJHj5riYa1Kkvx0Oufk/gvQVToxfiYqbwQnX
 IPQJnE2fhqw3CCLt9Dr5xA5fdvc23OzhcW+m6GJI=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
 20251014121050epcas5p2744521b1cd7ab3333db2e5cacdfc7f33~uWlq7rEWC1888918889epcas5p29;
 Tue, 14 Oct 2025 12:10:50 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.89]) by
 epsnrtp04.localdomain (Postfix) with ESMTP id 4cmCjP14hQz6B9m5; Tue, 14 Oct
 2025 12:10:49 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20251014121048epcas5p4e8665c2e4e12367465aa4d4ec1de84d9~uWlpTljEg1794917949epcas5p4R;
 Tue, 14 Oct 2025 12:10:48 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20251014121042epsmtip1c3105d716cc6a7bb92c6dfdb8c45772e~uWlj45mPs1256612566epsmtip1k;
 Tue, 14 Oct 2025 12:10:42 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, wangyufei@vivo.com
Date: Tue, 14 Oct 2025 17:38:36 +0530
Message-Id: <20251014120845.2361-8-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251014120845.2361-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-CMS-MailID: 20251014121048epcas5p4e8665c2e4e12367465aa4d4ec1de84d9
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251014121048epcas5p4e8665c2e4e12367465aa4d4ec1de84d9
References: <20251014120845.2361-1-kundan.kumar@samsung.com>
 <CGME20251014121048epcas5p4e8665c2e4e12367465aa4d4ec1de84d9@epcas5p4.samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Modify sync related functions to iterate over all writeback
 contexts. Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
 Signed-off-by:
 Anuj Gupta <anuj20.g@samsung.com> --- fs/fs-writeback.c | 66
 +++++++++++++++++++++++++++++++ 1 file changed, 44 in [...] 
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
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [203.254.224.25 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v8drn-0001Mu-1C
Subject: [f2fs-dev] [PATCH v2 07/16] writeback: modify sync related
 functions to iterate over all writeback contexts
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

Modify sync related functions to iterate over all writeback contexts.

Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 fs/fs-writeback.c | 66 +++++++++++++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 22 deletions(-)

diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index 432f392c8256..7bf1f6c1c0ba 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -2753,11 +2753,13 @@ static void wait_sb_inodes(struct super_block *sb)
 	mutex_unlock(&sb->s_sync_lock);
 }
 
-static void __writeback_inodes_sb_nr(struct super_block *sb, unsigned long nr,
-				     enum wb_reason reason, bool skip_if_busy)
+static void __writeback_inodes_sb_nr_ctx(struct super_block *sb,
+					 unsigned long nr,
+					 enum wb_reason reason,
+					 bool skip_if_busy,
+					 struct bdi_writeback_ctx *bdi_wb_ctx)
 {
-	struct backing_dev_info *bdi = sb->s_bdi;
-	DEFINE_WB_COMPLETION(done, bdi->wb_ctx[0]);
+	DEFINE_WB_COMPLETION(done, bdi_wb_ctx);
 	struct wb_writeback_work work = {
 		.sb			= sb,
 		.sync_mode		= WB_SYNC_NONE,
@@ -2767,13 +2769,23 @@ static void __writeback_inodes_sb_nr(struct super_block *sb, unsigned long nr,
 		.reason			= reason,
 	};
 
+	bdi_split_work_to_wbs(sb->s_bdi, bdi_wb_ctx, &work, skip_if_busy);
+	wb_wait_for_completion(&done);
+}
+
+static void __writeback_inodes_sb_nr(struct super_block *sb, unsigned long nr,
+				     enum wb_reason reason, bool skip_if_busy)
+{
+	struct backing_dev_info *bdi = sb->s_bdi;
+	struct bdi_writeback_ctx *bdi_wb_ctx;
+
 	if (!bdi_has_dirty_io(bdi) || bdi == &noop_backing_dev_info)
 		return;
 	WARN_ON(!rwsem_is_locked(&sb->s_umount));
 
-	bdi_split_work_to_wbs(sb->s_bdi, bdi->wb_ctx[0], &work,
-			      skip_if_busy);
-	wb_wait_for_completion(&done);
+	for_each_bdi_wb_ctx(bdi, bdi_wb_ctx)
+		__writeback_inodes_sb_nr_ctx(sb, nr, reason, skip_if_busy,
+					     bdi_wb_ctx);
 }
 
 /**
@@ -2826,17 +2838,11 @@ void try_to_writeback_inodes_sb(struct super_block *sb, enum wb_reason reason)
 }
 EXPORT_SYMBOL(try_to_writeback_inodes_sb);
 
-/**
- * sync_inodes_sb	-	sync sb inode pages
- * @sb: the superblock
- *
- * This function writes and waits on any dirty inode belonging to this
- * super_block.
- */
-void sync_inodes_sb(struct super_block *sb)
+static void sync_inodes_bdi_wb_ctx(struct super_block *sb,
+				   struct backing_dev_info *bdi,
+				   struct bdi_writeback_ctx *bdi_wb_ctx)
 {
-	struct backing_dev_info *bdi = sb->s_bdi;
-	DEFINE_WB_COMPLETION(done, bdi->wb_ctx[0]);
+	DEFINE_WB_COMPLETION(done, bdi_wb_ctx);
 	struct wb_writeback_work work = {
 		.sb		= sb,
 		.sync_mode	= WB_SYNC_ALL,
@@ -2847,6 +2853,25 @@ void sync_inodes_sb(struct super_block *sb)
 		.for_sync	= 1,
 	};
 
+	/* protect against inode wb switch, see inode_switch_wbs_work_fn() */
+	bdi_down_write_wb_ctx_switch_rwsem(bdi_wb_ctx);
+	bdi_split_work_to_wbs(bdi, bdi_wb_ctx, &work, false);
+	wb_wait_for_completion(&done);
+	bdi_up_write_wb_ctx_switch_rwsem(bdi_wb_ctx);
+}
+
+/**
+ * sync_inodes_sb	-	sync sb inode pages
+ * @sb: the superblock
+ *
+ * This function writes and waits on any dirty inode belonging to this
+ * super_block.
+ */
+void sync_inodes_sb(struct super_block *sb)
+{
+	struct backing_dev_info *bdi = sb->s_bdi;
+	struct bdi_writeback_ctx *bdi_wb_ctx;
+
 	/*
 	 * Can't skip on !bdi_has_dirty() because we should wait for !dirty
 	 * inodes under writeback and I_DIRTY_TIME inodes ignored by
@@ -2856,11 +2881,8 @@ void sync_inodes_sb(struct super_block *sb)
 		return;
 	WARN_ON(!rwsem_is_locked(&sb->s_umount));
 
-	/* protect against inode wb switch, see inode_switch_wbs_work_fn() */
-	bdi_down_write_wb_ctx_switch_rwsem(bdi->wb_ctx[0]);
-	bdi_split_work_to_wbs(bdi, bdi->wb_ctx[0], &work, false);
-	wb_wait_for_completion(&done);
-	bdi_up_write_wb_ctx_switch_rwsem(bdi->wb_ctx[0]);
+	for_each_bdi_wb_ctx(bdi, bdi_wb_ctx)
+		sync_inodes_bdi_wb_ctx(sb, bdi, bdi_wb_ctx);
 
 	wait_sb_inodes(sb);
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
