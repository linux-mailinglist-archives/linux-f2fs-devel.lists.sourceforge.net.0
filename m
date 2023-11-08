Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F377E5C69
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Nov 2023 18:29:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r0mMv-000427-TX;
	Wed, 08 Nov 2023 17:29:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1r0mMv-000421-0o
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Nov 2023 17:29:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HJ0iusR/nb11s5+WQdNV6JH/9Rw/JS7cYiIWlXPv0Ys=; b=PZBhCNul2FK0ajKzeZ08FS6JLS
 A4xU+owVwFMK05wJXP9pUdTwb321EhWsBm6XSo2D3EJfxLB+M9wNuHpchHYAEQu85uMrNp0ZWeON/
 whzQa/fnbkaUajvdqdpD5Pm7xFBpia8nukkQu4rh7ZNJzHudPRk0115qQ8jkmNreTUns=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=HJ0iusR/nb11s5+WQdNV6JH/9Rw/JS7cYiIWlXPv0Ys=; b=Q
 azZkWFwK+0+MwKS7Pjl2UsYcsrrhWqHh2DEqHO1P7lFHIyFD69YoI2LpQ77bl405KmbU9PA78xczB
 D0gEpzEYbPCMQ6X20laSnvKkLmtDFkPGIh1QlMC18WiHAfsRQkx0/rEuHlCcQTWQczzCvdV1l1zqa
 IG2Pz3NCd1YURWGA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r0mMs-00Gef6-7X for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Nov 2023 17:29:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0B7F6616BF;
 Wed,  8 Nov 2023 17:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA42C433C7;
 Wed,  8 Nov 2023 17:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699464563;
 bh=T/0mKptvvESma/AQB1GrlQxI5LkrrrNNFxmZXf/2u3w=;
 h=From:To:Cc:Subject:Date:From;
 b=R4VNL8vD2jsgFwiVczOa56SyeIyuYYP9pqZEKEKy1lGIEFNqlW02NaeXY51uuIFE/
 ChG0+7My0SnXwVcwqmJDlFuZPdRjevTASIt5qdyi0jBVfdtRRt1PkunmFZjo0LI+81
 sTS8LGM9EccuIj08wCU65Ohfo6EDBhocxy7DIowTQai4hP2nhZWmjK4Y10VTKCiRRo
 oJ7QTcR6L4t67QODGD4Wt221tgt3lhoN2QHK7SYOSp4uyEw2SJQU1RpVtYtAtRf3cA
 TmFbYNMxhm08DcE32EWSacSGRjeTk3G42vih7iHqB9n15UgK2VHjW22lrewqxcAKg6
 LVc4XltfyuAdw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  8 Nov 2023 09:29:22 -0800
Message-ID: <20231108172922.1325972-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong <daehojeong@google.com> Make nat journal
 and nat cache have the same content. Signed-off-by: Daeho Jeong
 <daehojeong@google.com>
 Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- fsck/fsck.c | 1 -
 fsck/fsck.h
 | 2 -- fsck/mount.c | 54 ++++++++++++++++++++++++++++ [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r0mMs-00Gef6-7X
Subject: [f2fs-dev] [PATCH] f2fs-tools: synchronize nat journal with nat
 cache
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Make nat journal and nat cache have the same content.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/fsck.c  |  1 -
 fsck/fsck.h  |  2 --
 fsck/mount.c | 54 ++++++++++++++++++++++++++++------------------------
 3 files changed, 29 insertions(+), 28 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index c97dceb406b3..55eddcaa21da 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -735,7 +735,6 @@ fix:
 		struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 
 		FIX_MSG("Relink root inode, blkaddr: 0x%x", last_blkaddr);
-		update_nat_journal_blkaddr(sbi, root_ino, last_blkaddr);
 		update_nat_blkaddr(sbi, root_ino, root_ino, last_blkaddr);
 
 		if (f2fs_test_bit(root_ino, fsck->nat_area_bitmap))
diff --git a/fsck/fsck.h b/fsck/fsck.h
index c85a0741b257..f6f15e7781b8 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -205,8 +205,6 @@ extern void update_sum_entry(struct f2fs_sb_info *, block_t,
 				struct f2fs_summary *);
 extern void get_node_info(struct f2fs_sb_info *, nid_t, struct node_info *);
 extern void nullify_nat_entry(struct f2fs_sb_info *, u32);
-extern void update_nat_journal_blkaddr(struct f2fs_sb_info *sbi, u32 nid,
-					block_t blkaddr);
 extern void rewrite_sit_area_bitmap(struct f2fs_sb_info *);
 extern void build_nat_area_bitmap(struct f2fs_sb_info *);
 extern void build_sit_area_bitmap(struct f2fs_sb_info *);
diff --git a/fsck/mount.c b/fsck/mount.c
index 7871f2f48c81..72516f403734 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2479,10 +2479,25 @@ void update_data_blkaddr(struct f2fs_sb_info *sbi, nid_t nid,
 void update_nat_blkaddr(struct f2fs_sb_info *sbi, nid_t ino,
 					nid_t nid, block_t newaddr)
 {
-	struct f2fs_nat_block *nat_block;
+	struct f2fs_nat_block *nat_block = NULL;
+	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
+	struct f2fs_journal *journal = F2FS_SUMMARY_BLOCK_JOURNAL(curseg->sum_blk);
+	struct f2fs_nat_entry *entry;
 	pgoff_t block_addr;
 	int entry_off;
-	int ret;
+	int ret, i;
+
+	for (i = 0; i < nats_in_cursum(journal); i++) {
+		if (le32_to_cpu(nid_in_journal(journal, i)) == nid) {
+			entry = &nat_in_journal(journal, i);
+			entry->block_addr = cpu_to_le32(newaddr);
+			if (ino)
+				entry->ino = cpu_to_le32(ino);
+			MSG(0, "update nat(nid:%d) blkaddr [0x%x] in journal\n",
+							nid, newaddr);
+			goto update_cache;
+		}
+	}
 
 	nat_block = (struct f2fs_nat_block *)calloc(F2FS_BLKSIZE, 1);
 	ASSERT(nat_block);
@@ -2493,15 +2508,19 @@ void update_nat_blkaddr(struct f2fs_sb_info *sbi, nid_t ino,
 	ret = dev_read_block(nat_block, block_addr);
 	ASSERT(ret >= 0);
 
+	entry = &nat_block->entries[entry_off];
 	if (ino)
-		nat_block->entries[entry_off].ino = cpu_to_le32(ino);
-	nat_block->entries[entry_off].block_addr = cpu_to_le32(newaddr);
-	if (c.func == FSCK)
-		F2FS_FSCK(sbi)->entries[nid] = nat_block->entries[entry_off];
+		entry->ino = cpu_to_le32(ino);
+	entry->block_addr = cpu_to_le32(newaddr);
 
 	ret = dev_write_block(nat_block, block_addr);
 	ASSERT(ret >= 0);
-	free(nat_block);
+update_cache:
+	if (c.func == FSCK)
+		F2FS_FSCK(sbi)->entries[nid] = *entry;
+
+	if (nat_block)
+		free(nat_block);
 }
 
 void get_node_info(struct f2fs_sb_info *sbi, nid_t nid, struct node_info *ni)
@@ -3120,6 +3139,9 @@ void nullify_nat_entry(struct f2fs_sb_info *sbi, u32 nid)
 	int ret;
 	int i = 0;
 
+	if (c.func == FSCK)
+		F2FS_FSCK(sbi)->entries[nid].block_addr = 0;
+
 	/* check in journal */
 	for (i = 0; i < nats_in_cursum(journal); i++) {
 		if (le32_to_cpu(nid_in_journal(journal, i)) == nid) {
@@ -3153,24 +3175,6 @@ void nullify_nat_entry(struct f2fs_sb_info *sbi, u32 nid)
 	free(nat_block);
 }
 
-void update_nat_journal_blkaddr(struct f2fs_sb_info *sbi, u32 nid,
-					block_t blkaddr)
-{
-	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
-	struct f2fs_journal *journal = F2FS_SUMMARY_BLOCK_JOURNAL(curseg->sum_blk);
-	int i;
-
-	for (i = 0; i < nats_in_cursum(journal); i++) {
-		if (le32_to_cpu(nid_in_journal(journal, i)) == nid) {
-			nat_in_journal(journal, i).block_addr =
-						cpu_to_le32(blkaddr);
-			MSG(0, "update nat(nid:%d) blkaddr [0x%x] in journal\n",
-							nid, blkaddr);
-			return;
-		}
-	}
-}
-
 void duplicate_checkpoint(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
-- 
2.42.0.869.gea05f2083d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
