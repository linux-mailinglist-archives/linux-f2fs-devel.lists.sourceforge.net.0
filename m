Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1063201A98
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2020 20:44:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jmLzf-0006rc-AZ; Fri, 19 Jun 2020 18:44:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jmLzd-0006rS-Cu
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jun 2020 18:44:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I8jZRxKkC/tED7jx5f8IHZLW3PjB1GM6++T8daD7xc8=; b=amxM9NxlH5ZmPtXbxRME+DKK40
 1wnLNi8nnh4gHw9RdGD2pgxnq32vQa5Lw+tYia0UVwGmk8Ztjh6+q2zyoWGQl8L7ywTmWGoAUSvwM
 l+u3jXtIWHw5PQe9tW7jYYPQCQNRhEUIklhEZWhn7UaVChbVaSRmvTvT/MeZOU83GTxM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=I8jZRxKkC/tED7jx5f8IHZLW3PjB1GM6++T8daD7xc8=; b=a
 p8u6ilfySUYNnL5VJXG0SdX4ZrswdxOqxGZam5H51eTLcbMqg2GqBOU31IPZP8FYtGseIsxqLJcsU
 Y7dBm1h4hwlxtmd5QWrtAVlrH0OIJLxxkQQKFS/lb7BNz27LDIa1t9UllQIDY9DT4gEdU8TaREVEK
 GoDtSO9we8It/OhA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jmLzX-00AQgk-NH
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jun 2020 18:44:01 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE6EF204EA;
 Fri, 19 Jun 2020 18:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592592227;
 bh=vOHKXczDTbc+sSiZba/293T3SnL//O652Cb+7Xy3ZzM=;
 h=From:To:Cc:Subject:Date:From;
 b=2OKmFy2u1H3NGGHYZUf1xB8aB8CMC3RvY43EsP5Nd24NIL2pL1ctom4jYDcknVgDU
 FRMjdnpLtMKxARQuxQ4xAvEhkwU15UuoDcIXl3yLNUttevNj3+cScumpjzBc85iykc
 +vr3TfLLp65IbmP4WNSgBpnk8L0ET8OnUISogn/o=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 19 Jun 2020 11:43:46 -0700
Message-Id: <20200619184346.56536-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jmLzX-00AQgk-NH
Subject: [f2fs-dev] [PATCH] fsck.f2fs: Fix slow fsck in auto-fix mode
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Robin Hsu <robinhsu@google.com>

Split f2fs_init_nid_bitmap() into two disjoint parts:
	f2fs_early_init_nid_bitmap(), and
	f2fs_late_init_nid_bitmap(),
where f2fs_late_init_nid_bitmap() won't be called in auto-fix mode, when
no errors were found.

f2fs_late_init_nid_bitmap() contains the loop to create NID bitmap from
NAT. which is the main reason for slow fsck.

Signed-off-by: Robin Hsu <robinhsu@google.com>
---
 fsck/mount.c | 69 ++++++++++++++++++++++++++++++++--------------------
 1 file changed, 43 insertions(+), 26 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index fb45941..d0f2eab 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1288,15 +1288,14 @@ pgoff_t current_nat_addr(struct f2fs_sb_info *sbi, nid_t start, int *pack)
 	return block_addr;
 }
 
-static int f2fs_init_nid_bitmap(struct f2fs_sb_info *sbi)
+/* will not init nid_bitmap from nat */
+static int f2fs_early_init_nid_bitmap(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
 	int nid_bitmap_size = (nm_i->max_nid + BITS_PER_BYTE - 1) / BITS_PER_BYTE;
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
 	struct f2fs_summary_block *sum = curseg->sum_blk;
 	struct f2fs_journal *journal = &sum->journal;
-	struct f2fs_nat_block *nat_block;
-	block_t start_blk;
 	nid_t nid;
 	int i;
 
@@ -1310,28 +1309,6 @@ static int f2fs_init_nid_bitmap(struct f2fs_sb_info *sbi)
 	/* arbitrarily set 0 bit */
 	f2fs_set_bit(0, nm_i->nid_bitmap);
 
-	nat_block = malloc(F2FS_BLKSIZE);
-	if (!nat_block) {
-		free(nm_i->nid_bitmap);
-		return -ENOMEM;
-	}
-
-	f2fs_ra_meta_pages(sbi, 0, NAT_BLOCK_OFFSET(nm_i->max_nid),
-							META_NAT);
-
-	for (nid = 0; nid < nm_i->max_nid; nid++) {
-		if (!(nid % NAT_ENTRY_PER_BLOCK)) {
-			int ret;
-
-			start_blk = current_nat_addr(sbi, nid, NULL);
-			ret = dev_read_block(nat_block, start_blk);
-			ASSERT(ret >= 0);
-		}
-
-		if (nat_block->entries[nid % NAT_ENTRY_PER_BLOCK].block_addr)
-			f2fs_set_bit(nid, nm_i->nid_bitmap);
-	}
-
 	if (nats_in_cursum(journal) > NAT_JOURNAL_ENTRIES) {
 		MSG(0, "\tError: f2fs_init_nid_bitmap truncate n_nats(%u) to "
 			"NAT_JOURNAL_ENTRIES(%lu)\n",
@@ -1361,6 +1338,41 @@ static int f2fs_init_nid_bitmap(struct f2fs_sb_info *sbi)
 		if (addr != NULL_ADDR)
 			f2fs_set_bit(nid, nm_i->nid_bitmap);
 	}
+	return 0;
+}
+
+/* will init nid_bitmap from nat */
+static int f2fs_late_init_nid_bitmap(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_nm_info *nm_i = NM_I(sbi);
+	struct f2fs_nat_block *nat_block;
+	block_t start_blk;
+	nid_t nid;
+
+	if (!(c.func == SLOAD || c.func == FSCK))
+		return 0;
+
+	nat_block = malloc(F2FS_BLKSIZE);
+	if (!nat_block) {
+		free(nm_i->nid_bitmap);
+		return -ENOMEM;
+	}
+
+	f2fs_ra_meta_pages(sbi, 0, NAT_BLOCK_OFFSET(nm_i->max_nid),
+							META_NAT);
+	for (nid = 0; nid < nm_i->max_nid; nid++) {
+		if (!(nid % NAT_ENTRY_PER_BLOCK)) {
+			int ret;
+
+			start_blk = current_nat_addr(sbi, nid, NULL);
+			ret = dev_read_block(nat_block, start_blk);
+			ASSERT(ret >= 0);
+		}
+
+		if (nat_block->entries[nid % NAT_ENTRY_PER_BLOCK].block_addr)
+			f2fs_set_bit(nid, nm_i->nid_bitmap);
+	}
+
 	free(nat_block);
 	return 0;
 }
@@ -1565,7 +1577,7 @@ int init_node_manager(struct f2fs_sb_info *sbi)
 
 	/* copy version bitmap */
 	memcpy(nm_i->nat_bitmap, version_bitmap, nm_i->bitmap_size);
-	return f2fs_init_nid_bitmap(sbi);
+	return f2fs_early_init_nid_bitmap(sbi);
 }
 
 int build_node_manager(struct f2fs_sb_info *sbi)
@@ -3463,6 +3475,11 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
 	if (!f2fs_should_proceed(sb, get_cp(ckpt_flags)))
 		return 1;
 
+	if (f2fs_late_init_nid_bitmap(sbi)) {
+		ERR_MSG("f2fs_late_init_nid_bitmap failed\n");
+		return -1;
+	}
+
 	/* Check nat_bits */
 	if (c.func == FSCK && is_set_ckpt_flags(cp, CP_NAT_BITS_FLAG)) {
 		if (check_nat_bits(sbi, sb, cp) && c.fix_on)
-- 
2.27.0.111.gc72c7da667-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
