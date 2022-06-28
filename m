Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BF155F20D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jun 2022 01:47:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o6Kvx-000412-CW; Tue, 28 Jun 2022 23:47:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1o6Kvw-00040w-Hk
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jun 2022 23:47:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OKTRZMrdPIdfsiSIbOw5nNCNvJ4oKg5uvCZWfu37onU=; b=XMV2FZxMhY+woxlwcGDrL8s15Q
 mVbnuYDVe0t22zalPUvmaUU+/+79gwbIO6rj6XQkIECl8ITtkbUxpNrY7WAlcqbStJ+3E0VFGbO9j
 szbLqJxK1GzaZb0iqhK8hUj9HI+docm/cCCb5gIEuxhHoJOKDvj08MkBJl9l5F47NjVU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OKTRZMrdPIdfsiSIbOw5nNCNvJ4oKg5uvCZWfu37onU=; b=CQIwt12B0obOPLUkEuS5wNCsB1
 SIDm+QOGjtZxqOujItsbq/tqPyZ2LYuV6GEQkpO9wYVFksDwePkOZvaGcmohp5YmuVhLEFQniyW2t
 h4s37iAriyIwXK2CrKlatai33gohY1O+WyBtllO/pe67jJobVRj9VYqwrsIWtvGf6lOE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o6Kvs-0002dQ-DM
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jun 2022 23:47:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F38161B76
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 28 Jun 2022 23:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F4EC341CC;
 Tue, 28 Jun 2022 23:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656460056;
 bh=jMweakuotTV8bJtWOanoi9NZQqPD97x5eWAPdG7SVLQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GIPP6cyo4AquWnm7SezW1gUJH5E68U2gNS7yD2ucYJKAi6JhmhUrYx7PdaslUkO/5
 3IZRnRAyid3J/rgIvAxSo14xfKW9reE8ML/GByIoNa1q6CPc8Nt7gL2NMcXFAIom1Q
 VAqFaA/cFQ9YL1eZoTDznNHkapN5bNB2CA56PqDYle1bI+jyf5YxLhnsAhsS2nhKoj
 fysOZjEfB8wjO3+P6+YCuH8IfBsccX37omwfxAugn6SaVoQfIQup4a3uaAf+1A4l7G
 ew4I+rq2JbMgRQ1hAgK1yOR7AqvkTLcgLXiYzqElH77Mg8tj585c2o6md8XmYrj/aN
 GePWzptd9VWhA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 28 Jun 2022 16:47:32 -0700
Message-Id: <20220628234733.3330502-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220628234733.3330502-1-jaegeuk@kernel.org>
References: <20220628234733.3330502-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch fixes counting unusable blocks set by zone
 capacity
 when checking the valid block count in a section. Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> --- fs/f2fs/debug.c | 2 +- fs/f2fs/file.c | 6 +++---
 fs/f2fs/gc.c | 4 ++-- fs/f2fs/segment.c | 7 +++---- fs/f2fs/segment.h | 8
 ++++---- 5 files changed, [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o6Kvs-0002dQ-DM
Subject: [f2fs-dev] [PATCH 2/3] f2fs: adjust zone capacity when considering
 valid block count
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch fixes counting unusable blocks set by zone capacity when
checking the valid block count in a section.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/debug.c   | 2 +-
 fs/f2fs/file.c    | 6 +++---
 fs/f2fs/gc.c      | 4 ++--
 fs/f2fs/segment.c | 7 +++----
 fs/f2fs/segment.h | 8 ++++----
 5 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index c92625ef16d0..c01471573977 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -39,7 +39,7 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi)
 
 	bimodal = 0;
 	total_vblocks = 0;
-	blks_per_sec = BLKS_PER_SEC(sbi);
+	blks_per_sec = CAP_BLKS_PER_SEC(sbi);
 	hblks_per_sec = blks_per_sec / 2;
 	for (segno = 0; segno < MAIN_SEGS(sbi); segno += sbi->segs_per_sec) {
 		vblocks = get_valid_blocks(sbi, segno, true);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 2d1114b0ceef..0f29af7876a6 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1681,7 +1681,7 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 		return 0;
 
 	if (f2fs_is_pinned_file(inode)) {
-		block_t sec_blks = BLKS_PER_SEC(sbi);
+		block_t sec_blks = CAP_BLKS_PER_SEC(sbi);
 		block_t sec_len = roundup(map.m_len, sec_blks);
 
 		map.m_len = sec_blks;
@@ -2432,7 +2432,7 @@ static int __f2fs_ioc_gc_range(struct file *filp, struct f2fs_gc_range *range)
 			ret = -EAGAIN;
 		goto out;
 	}
-	range->start += BLKS_PER_SEC(sbi);
+	range->start += CAP_BLKS_PER_SEC(sbi);
 	if (range->start <= end)
 		goto do_more;
 out:
@@ -2557,7 +2557,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 		goto out;
 	}
 
-	sec_num = DIV_ROUND_UP(total, BLKS_PER_SEC(sbi));
+	sec_num = DIV_ROUND_UP(total, CAP_BLKS_PER_SEC(sbi));
 
 	/*
 	 * make sure there are enough free section for LFS allocation, this can
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index d5fb426e0747..c38bdaf831af 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -487,7 +487,7 @@ static void atgc_lookup_victim(struct f2fs_sb_info *sbi,
 	unsigned long long age, u, accu;
 	unsigned long long max_mtime = sit_i->dirty_max_mtime;
 	unsigned long long min_mtime = sit_i->dirty_min_mtime;
-	unsigned int sec_blocks = BLKS_PER_SEC(sbi);
+	unsigned int sec_blocks = CAP_BLKS_PER_SEC(sbi);
 	unsigned int vblocks;
 	unsigned int dirty_threshold = max(am->max_candidate_count,
 					am->candidate_ratio *
@@ -1487,7 +1487,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		 */
 		if ((gc_type == BG_GC && has_not_enough_free_secs(sbi, 0, 0)) ||
 			(!force_migrate && get_valid_blocks(sbi, segno, true) ==
-							BLKS_PER_SEC(sbi)))
+							CAP_BLKS_PER_SEC(sbi)))
 			return submitted;
 
 		if (check_valid_map(sbi, segno, off) == 0)
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 447b03579049..ce571c0d7126 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -728,7 +728,7 @@ static void __locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
 				get_valid_blocks(sbi, segno, true);
 
 			f2fs_bug_on(sbi, unlikely(!valid_blocks ||
-					valid_blocks == BLKS_PER_SEC(sbi)));
+					valid_blocks == CAP_BLKS_PER_SEC(sbi)));
 
 			if (!IS_CURSEC(sbi, secno))
 				set_bit(secno, dirty_i->dirty_secmap);
@@ -764,7 +764,7 @@ static void __remove_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
 			unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
 
 			if (!valid_blocks ||
-					valid_blocks == BLKS_PER_SEC(sbi)) {
+					valid_blocks == CAP_BLKS_PER_SEC(sbi)) {
 				clear_bit(secno, dirty_i->dirty_secmap);
 				return;
 			}
@@ -4483,7 +4483,6 @@ static void init_dirty_segmap(struct f2fs_sb_info *sbi)
 	struct free_segmap_info *free_i = FREE_I(sbi);
 	unsigned int segno = 0, offset = 0, secno;
 	block_t valid_blocks, usable_blks_in_seg;
-	block_t blks_per_sec = BLKS_PER_SEC(sbi);
 
 	while (1) {
 		/* find dirty segment based on free segmap */
@@ -4512,7 +4511,7 @@ static void init_dirty_segmap(struct f2fs_sb_info *sbi)
 		valid_blocks = get_valid_blocks(sbi, segno, true);
 		secno = GET_SEC_FROM_SEG(sbi, segno);
 
-		if (!valid_blocks || valid_blocks == blks_per_sec)
+		if (!valid_blocks || valid_blocks == CAP_BLKS_PER_SEC(sbi))
 			continue;
 		if (IS_CURSEC(sbi, secno))
 			continue;
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 813a892cd979..d1d63766f2c7 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -612,10 +612,10 @@ static inline bool has_not_enough_free_secs(struct f2fs_sb_info *sbi,
 					get_pages(sbi, F2FS_DIRTY_DENTS) +
 					get_pages(sbi, F2FS_DIRTY_IMETA);
 	unsigned int total_dent_blocks = get_pages(sbi, F2FS_DIRTY_DENTS);
-	unsigned int node_secs = total_node_blocks / BLKS_PER_SEC(sbi);
-	unsigned int dent_secs = total_dent_blocks / BLKS_PER_SEC(sbi);
-	unsigned int node_blocks = total_node_blocks % BLKS_PER_SEC(sbi);
-	unsigned int dent_blocks = total_dent_blocks % BLKS_PER_SEC(sbi);
+	unsigned int node_secs = total_node_blocks / CAP_BLKS_PER_SEC(sbi);
+	unsigned int dent_secs = total_dent_blocks / CAP_BLKS_PER_SEC(sbi);
+	unsigned int node_blocks = total_node_blocks % CAP_BLKS_PER_SEC(sbi);
+	unsigned int dent_blocks = total_dent_blocks % CAP_BLKS_PER_SEC(sbi);
 	unsigned int free, need_lower, need_upper;
 
 	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
-- 
2.37.0.rc0.161.g10f37bed90-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
