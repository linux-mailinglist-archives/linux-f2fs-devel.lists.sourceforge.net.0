Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6573F2A63
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Aug 2021 12:55:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mH2Aw-0007PX-Gh; Fri, 20 Aug 2021 10:55:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mH2Av-0007PG-6g
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 10:55:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XNf5ZMomiAV4wZcdPuWvR10WjPrN6E241gva6+5JPdA=; b=GtS9FBkshZZqK9K0ijagsDSytR
 VPtJ9WHTuMsuzH/fveFtCl5b51CdZSSHzLXK9ipDGTKq6qgine3Qn9zEMPslhalLzdyGLysFAW9z0
 xQ+APpQbKak0W8Hqj7S2MEShZPFLwELNQGGOZnsyrloXsqhrHWCnKOs4R/+cqPsPGnLc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XNf5ZMomiAV4wZcdPuWvR10WjPrN6E241gva6+5JPdA=; b=K
 Z2AOdPtQKNpPQj9VaCZc7biDQdu2DIo6xNs5Ul+sDdwNUllroQcu63ZnAI2cZoaBgwrP6pl3+r3NK
 JcDMTtnihNvPeuaMPMR1IQb5oTOA8sXzI78kEqUbQM773FhpaVX5C7a2b4IpnmrlM2gRsWa0AHxYk
 970c+rbQ6E+5PVW8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mH2Au-00Ccwb-Cb
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 10:55:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF18660C3E;
 Fri, 20 Aug 2021 10:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629456895;
 bh=CRw2lp9v6AwHZj0pyvyeUQGN8R+8RXDz9isP8uy49Y8=;
 h=From:To:Cc:Subject:Date:From;
 b=VmyJBPQvbLm3enrejBnztOfNMIPDxlfjQf8rZ9vQcfYnd4lKcvzEsPK9uBNIgBQ3x
 sDydMdbgsa7QnL6s9Sfq2mszm3gfz33sp90VOtCX+w07X1qfNstVTYEjPOZGtGS7aD
 lY0XbhcqlRgFjrcsd9duOPha8wAuFWrM/kaJfMC67UqtyKF7XXNHyXJiL3aDBwVFuR
 YCcSYyyugubD37sbnzzy01Z8AbJIuItUf7+32u4U7ElqivJlDF1yylH1yUiuHjy1d0
 5yQ3dKmEddN2NI26DbgRUKAbRbaKAcmt9vJRQkUJimZubYlMUwsTnAHb1joOGY8yvO
 R757FQjCFe0DQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 20 Aug 2021 18:54:59 +0800
Message-Id: <20210820105459.27545-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If all free_nat_bitmap are available, we can rebuild nat_bits
 from free_nat_bitmap entirely during umount, let's make another chance to
 reenable nat_bits for image. Signed-off-by: Chao Yu <chao@kernel.org> ---
 v4: - rebase to last dev-branch fs/f2fs/checkpoint.c | 21 ++++++---
 fs/f2fs/f2fs.h
 | 32 + fs/f2fs/node.c | 101 +++++++++++++++++++++++++++++++ [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mH2Au-00Ccwb-Cb
Subject: [f2fs-dev] [PATCH v4] f2fs: rebuild nat_bits during umount
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If all free_nat_bitmap are available, we can rebuild nat_bits from
free_nat_bitmap entirely during umount, let's make another chance
to reenable nat_bits for image.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v4:
- rebase to last dev-branch
 fs/f2fs/checkpoint.c |  21 ++++++---
 fs/f2fs/f2fs.h       |  32 +-------------
 fs/f2fs/node.c       | 101 +++++++++++++++++++++++++++++++++----------
 3 files changed, 95 insertions(+), 59 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 41960c55c343..b75b52e2017e 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1302,12 +1302,20 @@ static void update_ckpt_flags(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	struct f2fs_checkpoint *ckpt = F2FS_CKPT(sbi);
 	unsigned long flags;
 
-	spin_lock_irqsave(&sbi->cp_lock, flags);
+	if (cpc->reason & CP_UMOUNT) {
+		if (le32_to_cpu(ckpt->cp_pack_total_block_count) >
+			sbi->blocks_per_seg - NM_I(sbi)->nat_bits_blocks) {
+			clear_ckpt_flags(sbi, CP_NAT_BITS_FLAG);
+			f2fs_notice(sbi, "Disable nat_bits due to no space");
+		} else if (!is_set_ckpt_flags(sbi, CP_NAT_BITS_FLAG) &&
+						f2fs_nat_bitmap_enabled(sbi)) {
+			f2fs_enable_nat_bits(sbi);
+			set_ckpt_flags(sbi, CP_NAT_BITS_FLAG);
+			f2fs_notice(sbi, "Rebuild and enable nat_bits");
+		}
+	}
 
-	if ((cpc->reason & CP_UMOUNT) &&
-			le32_to_cpu(ckpt->cp_pack_total_block_count) >
-			sbi->blocks_per_seg - NM_I(sbi)->nat_bits_blocks)
-		disable_nat_bits(sbi, false);
+	spin_lock_irqsave(&sbi->cp_lock, flags);
 
 	if (cpc->reason & CP_TRIMMED)
 		__set_ckpt_flags(ckpt, CP_TRIMMED_FLAG);
@@ -1493,7 +1501,8 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	start_blk = __start_cp_next_addr(sbi);
 
 	/* write nat bits */
-	if (enabled_nat_bits(sbi, cpc)) {
+	if ((cpc->reason & CP_UMOUNT) &&
+			is_set_ckpt_flags(sbi, CP_NAT_BITS_FLAG)) {
 		__u64 cp_ver = cur_cp_version(ckpt);
 		block_t blk;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index fe1097e678da..340097544bfe 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2078,36 +2078,6 @@ static inline void clear_ckpt_flags(struct f2fs_sb_info *sbi, unsigned int f)
 	spin_unlock_irqrestore(&sbi->cp_lock, flags);
 }
 
-static inline void disable_nat_bits(struct f2fs_sb_info *sbi, bool lock)
-{
-	unsigned long flags;
-	unsigned char *nat_bits;
-
-	/*
-	 * In order to re-enable nat_bits we need to call fsck.f2fs by
-	 * set_sbi_flag(sbi, SBI_NEED_FSCK). But it may give huge cost,
-	 * so let's rely on regular fsck or unclean shutdown.
-	 */
-
-	if (lock)
-		spin_lock_irqsave(&sbi->cp_lock, flags);
-	__clear_ckpt_flags(F2FS_CKPT(sbi), CP_NAT_BITS_FLAG);
-	nat_bits = NM_I(sbi)->nat_bits;
-	NM_I(sbi)->nat_bits = NULL;
-	if (lock)
-		spin_unlock_irqrestore(&sbi->cp_lock, flags);
-
-	kvfree(nat_bits);
-}
-
-static inline bool enabled_nat_bits(struct f2fs_sb_info *sbi,
-					struct cp_control *cpc)
-{
-	bool set = is_set_ckpt_flags(sbi, CP_NAT_BITS_FLAG);
-
-	return (cpc) ? (cpc->reason & CP_UMOUNT) && set : set;
-}
-
 static inline void f2fs_lock_op(struct f2fs_sb_info *sbi)
 {
 	down_read(&sbi->cp_rwsem);
@@ -3543,6 +3513,7 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from);
 int f2fs_truncate_xattr_node(struct inode *inode);
 int f2fs_wait_on_node_pages_writeback(struct f2fs_sb_info *sbi,
 					unsigned int seq_id);
+bool f2fs_nat_bitmap_enabled(struct f2fs_sb_info *sbi);
 int f2fs_remove_inode_page(struct inode *inode);
 struct page *f2fs_new_inode_page(struct inode *inode);
 struct page *f2fs_new_node_page(struct dnode_of_data *dn, unsigned int ofs);
@@ -3567,6 +3538,7 @@ int f2fs_recover_xattr_data(struct inode *inode, struct page *page);
 int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct page *page);
 int f2fs_restore_node_summary(struct f2fs_sb_info *sbi,
 			unsigned int segno, struct f2fs_summary_block *sum);
+void f2fs_enable_nat_bits(struct f2fs_sb_info *sbi);
 int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc);
 int f2fs_build_node_manager(struct f2fs_sb_info *sbi);
 void f2fs_destroy_node_manager(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 161173de5a2d..4b4a82cacf9a 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2212,6 +2212,24 @@ static void __move_free_nid(struct f2fs_sb_info *sbi, struct free_nid *i,
 	}
 }
 
+bool f2fs_nat_bitmap_enabled(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_nm_info *nm_i = NM_I(sbi);
+	unsigned int i;
+	bool ret = true;
+
+	down_read(&nm_i->nat_tree_lock);
+	for (i = 0; i < nm_i->nat_blocks; i++) {
+		if (!test_bit_le(i, nm_i->nat_block_bitmap)) {
+			ret = false;
+			break;
+		}
+	}
+	up_read(&nm_i->nat_tree_lock);
+
+	return ret;
+}
+
 static void update_free_nid_bitmap(struct f2fs_sb_info *sbi, nid_t nid,
 							bool set, bool build)
 {
@@ -2883,7 +2901,23 @@ static void __adjust_nat_entry_set(struct nat_entry_set *nes,
 	list_add_tail(&nes->set_list, head);
 }
 
-static void __update_nat_bits(struct f2fs_sb_info *sbi, nid_t start_nid,
+static void __update_nat_bits(struct f2fs_nm_info *nm_i, unsigned int nat_ofs,
+							unsigned int valid)
+{
+	if (valid == 0) {
+		__set_bit_le(nat_ofs, nm_i->empty_nat_bits);
+		__clear_bit_le(nat_ofs, nm_i->full_nat_bits);
+		return;
+	}
+
+	__clear_bit_le(nat_ofs, nm_i->empty_nat_bits);
+	if (valid == NAT_ENTRY_PER_BLOCK)
+		__set_bit_le(nat_ofs, nm_i->full_nat_bits);
+	else
+		__clear_bit_le(nat_ofs, nm_i->full_nat_bits);
+}
+
+static void update_nat_bits(struct f2fs_sb_info *sbi, nid_t start_nid,
 						struct page *page)
 {
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
@@ -2892,7 +2926,7 @@ static void __update_nat_bits(struct f2fs_sb_info *sbi, nid_t start_nid,
 	int valid = 0;
 	int i = 0;
 
-	if (!enabled_nat_bits(sbi, NULL))
+	if (!is_set_ckpt_flags(sbi, CP_NAT_BITS_FLAG))
 		return;
 
 	if (nat_index == 0) {
@@ -2903,17 +2937,36 @@ static void __update_nat_bits(struct f2fs_sb_info *sbi, nid_t start_nid,
 		if (le32_to_cpu(nat_blk->entries[i].block_addr) != NULL_ADDR)
 			valid++;
 	}
-	if (valid == 0) {
-		__set_bit_le(nat_index, nm_i->empty_nat_bits);
-		__clear_bit_le(nat_index, nm_i->full_nat_bits);
-		return;
+
+	__update_nat_bits(nm_i, nat_index, valid);
+}
+
+void f2fs_enable_nat_bits(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_nm_info *nm_i = NM_I(sbi);
+	unsigned int nat_ofs;
+
+	down_read(&nm_i->nat_tree_lock);
+
+	for (nat_ofs = 0; nat_ofs < nm_i->nat_blocks; nat_ofs++) {
+		unsigned int valid = 0, nid_ofs = 0;
+
+		/* handle nid zero due to it should never be used */
+		if (unlikely(nat_ofs == 0)) {
+			valid = 1;
+			nid_ofs = 1;
+		}
+
+		for (; nid_ofs < NAT_ENTRY_PER_BLOCK; nid_ofs++) {
+			if (!test_bit_le(nid_ofs,
+					nm_i->free_nid_bitmap[nat_ofs]))
+				valid++;
+		}
+
+		__update_nat_bits(nm_i, nat_ofs, valid);
 	}
 
-	__clear_bit_le(nat_index, nm_i->empty_nat_bits);
-	if (valid == NAT_ENTRY_PER_BLOCK)
-		__set_bit_le(nat_index, nm_i->full_nat_bits);
-	else
-		__clear_bit_le(nat_index, nm_i->full_nat_bits);
+	up_read(&nm_i->nat_tree_lock);
 }
 
 static int __flush_nat_entry_set(struct f2fs_sb_info *sbi,
@@ -2932,7 +2985,7 @@ static int __flush_nat_entry_set(struct f2fs_sb_info *sbi,
 	 * #1, flush nat entries to journal in current hot data summary block.
 	 * #2, flush nat entries to nat page.
 	 */
-	if (enabled_nat_bits(sbi, cpc) ||
+	if ((cpc->reason & CP_UMOUNT) ||
 		!__has_cursum_space(journal, set->entry_cnt, NAT_JOURNAL))
 		to_journal = false;
 
@@ -2979,7 +3032,7 @@ static int __flush_nat_entry_set(struct f2fs_sb_info *sbi,
 	if (to_journal) {
 		up_write(&curseg->journal_rwsem);
 	} else {
-		__update_nat_bits(sbi, start_nid, page);
+		update_nat_bits(sbi, start_nid, page);
 		f2fs_put_page(page, 1);
 	}
 
@@ -3010,7 +3063,7 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	 * during unmount, let's flush nat_bits before checking
 	 * nat_cnt[DIRTY_NAT].
 	 */
-	if (enabled_nat_bits(sbi, cpc)) {
+	if (cpc->reason & CP_UMOUNT) {
 		down_write(&nm_i->nat_tree_lock);
 		remove_nats_in_journal(sbi);
 		up_write(&nm_i->nat_tree_lock);
@@ -3026,7 +3079,7 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	 * entries, remove all entries from journal and merge them
 	 * into nat entry set.
 	 */
-	if (enabled_nat_bits(sbi, cpc) ||
+	if (cpc->reason & CP_UMOUNT ||
 		!__has_cursum_space(journal,
 			nm_i->nat_cnt[DIRTY_NAT], NAT_JOURNAL))
 		remove_nats_in_journal(sbi);
@@ -3063,15 +3116,18 @@ static int __get_nat_bitmaps(struct f2fs_sb_info *sbi)
 	__u64 cp_ver = cur_cp_version(ckpt);
 	block_t nat_bits_addr;
 
-	if (!enabled_nat_bits(sbi, NULL))
-		return 0;
-
 	nm_i->nat_bits_blocks = F2FS_BLK_ALIGN((nat_bits_bytes << 1) + 8);
 	nm_i->nat_bits = f2fs_kvzalloc(sbi,
 			nm_i->nat_bits_blocks << F2FS_BLKSIZE_BITS, GFP_KERNEL);
 	if (!nm_i->nat_bits)
 		return -ENOMEM;
 
+	nm_i->full_nat_bits = nm_i->nat_bits + 8;
+	nm_i->empty_nat_bits = nm_i->full_nat_bits + nat_bits_bytes;
+
+	if (!is_set_ckpt_flags(sbi, CP_NAT_BITS_FLAG))
+		return 0;
+
 	nat_bits_addr = __start_cp_addr(sbi) + sbi->blocks_per_seg -
 						nm_i->nat_bits_blocks;
 	for (i = 0; i < nm_i->nat_bits_blocks; i++) {
@@ -3088,13 +3144,12 @@ static int __get_nat_bitmaps(struct f2fs_sb_info *sbi)
 
 	cp_ver |= (cur_cp_crc(ckpt) << 32);
 	if (cpu_to_le64(cp_ver) != *(__le64 *)nm_i->nat_bits) {
-		disable_nat_bits(sbi, true);
+		clear_ckpt_flags(sbi, CP_NAT_BITS_FLAG);
+		f2fs_notice(sbi, "Disable nat_bits due to incorrect cp_ver (%llu, %llu)",
+			cp_ver, le64_to_cpu(*(__le64 *)nm_i->nat_bits));
 		return 0;
 	}
 
-	nm_i->full_nat_bits = nm_i->nat_bits + 8;
-	nm_i->empty_nat_bits = nm_i->full_nat_bits + nat_bits_bytes;
-
 	f2fs_notice(sbi, "Found nat_bits in checkpoint");
 	return 0;
 }
@@ -3105,7 +3160,7 @@ static inline void load_free_nid_bitmap(struct f2fs_sb_info *sbi)
 	unsigned int i = 0;
 	nid_t nid, last_nid;
 
-	if (!enabled_nat_bits(sbi, NULL))
+	if (!is_set_ckpt_flags(sbi, CP_NAT_BITS_FLAG))
 		return;
 
 	for (i = 0; i < nm_i->nat_blocks; i++) {
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
