Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAF04FF09F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Apr 2022 09:35:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1neXWn-0008Hd-SJ; Wed, 13 Apr 2022 07:35:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1neXWm-0008HX-R8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 07:35:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JZoTDdYFdQwjAJgWrmhHZ814aCaa8JpV/rHBDagZ9d0=; b=U8klo11Hy9Zvz366joaJ/CNMVB
 PnAGDejjk76Qrjk52Rnz5f9PiJuPFXX48Uldo8d7fJhik1rAl8GCVXOOAhUCciVcWFCcAbZCIgHsT
 Q+t6k64uOF5tw+2wqYklGX2n1N+QdCMoBPa92A2uc5qq/91eY8dkkENJfcHHN1SD+LrY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JZoTDdYFdQwjAJgWrmhHZ814aCaa8JpV/rHBDagZ9d0=; b=I
 +XewSwnNBlel2p1AaqGFjYSJNm8uqY5wtHclg6zhpAvqmIsHXLgYoZFWIk9+CMqwUUnC4l7gyWDXm
 vjm60H47w+L7vq58dL5+mOQaE1s6D4WW5p2P97EpbmR9VqyKN9uayCns9cUEx+HLbDq/BQTWIunck
 2MVoJsfZ3n0VFpkw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1neXWg-00Ey3r-PP
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 07:34:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 67C5461157;
 Wed, 13 Apr 2022 07:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40746C385A4;
 Wed, 13 Apr 2022 07:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649835284;
 bh=JfKQqUtSRO+n6Mg/TdQQXoXDb3x9otKPEADPuS48Q9E=;
 h=From:To:Cc:Subject:Date:From;
 b=WxIUJY1IyYpjBmBGKI4lf3FFiHg36Hua/HbjwvJIIJIICkCg7/CdRudCJEcz+QR64
 x97ixjiiMOhKy6cjtTnAxyEPTgE4ONIEZzl7/Z5Qua+VzJHHqSijn/tazbVtHhvkeQ
 f/Y7xOvYe0V8ZXU/GtLkQob3cGhtCnJ1GJVpHNSW7UHUB1v76O4Apy2QBkVSu8wb1f
 zFvr1wuagVY4qQTEEaJXSzjGJ63iP2s/hXo4K+Kikxp0c3B2DmzwEWUWaZ1jX4VMR9
 ipJa7x0zwe+XB3ouL8AqpWmvZHjSBEco5PvtwgBTH9YOQ4sQva+OAEG2Y3jp/VDLMH
 352k61dPl1Caw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 13 Apr 2022 15:34:38 +0800
Message-Id: <20220413073438.18874-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Previously, during foreground GC, if victims contain data
 of pinned file, it will fail migration of the data, and meanwhile i_gc_failures
 of that pinned file may increase, and when it exceeds threshol [...] 
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
X-Headers-End: 1neXWg-00Ey3r-PP
Subject: [f2fs-dev] [PATCH v5] f2fs: give priority to select unpinned
 section for foreground GC
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Previously, during foreground GC, if victims contain data of pinned file,
it will fail migration of the data, and meanwhile i_gc_failures of that
pinned file may increase, and when it exceeds threshold, GC will unpin
the file, result in breaking pinfile's semantics.

In order to mitigate such condition, let's record and skip section which
has pinned file's data and give priority to select unpinned one.

Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
v5:
- clean up codes
 fs/f2fs/gc.c      | 83 +++++++++++++++++++++++++++++++++++++++--------
 fs/f2fs/segment.c |  8 +++++
 fs/f2fs/segment.h |  3 ++
 3 files changed, 80 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 6a7e4148ff9d..0b3325fe4ffd 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -646,6 +646,51 @@ static void release_victim_entry(struct f2fs_sb_info *sbi)
 	f2fs_bug_on(sbi, !list_empty(&am->victim_list));
 }
 
+static bool f2fs_pin_section(struct f2fs_sb_info *sbi, unsigned int segno)
+{
+	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
+	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
+
+	if (!dirty_i->enable_pin_section)
+		return false;
+	if (!test_and_set_bit(secno, dirty_i->pinned_secmap))
+		dirty_i->pinned_secmap_cnt++;
+	return true;
+}
+
+static bool f2fs_pinned_section_exists(struct dirty_seglist_info *dirty_i)
+{
+	return dirty_i->enable_pin_section && dirty_i->pinned_secmap_cnt;
+}
+
+static bool f2fs_section_is_pinned(struct dirty_seglist_info *dirty_i,
+						unsigned int secno)
+{
+	return f2fs_pinned_section_exists(dirty_i) &&
+			test_bit(secno, dirty_i->pinned_secmap);
+}
+
+static void f2fs_unpin_all_sections(struct f2fs_sb_info *sbi, bool enable)
+{
+	unsigned int bitmap_size = f2fs_bitmap_size(MAIN_SECS(sbi));
+
+	memset(DIRTY_I(sbi)->pinned_secmap, 0, bitmap_size);
+	DIRTY_I(sbi)->pinned_secmap_cnt = 0;
+	DIRTY_I(sbi)->enable_pin_section = enable;
+}
+
+static bool f2fs_gc_pinned_control(struct inode *inode, int gc_type,
+							unsigned int segno)
+{
+	if (!f2fs_is_pinned_file(inode))
+		return 0;
+	if (gc_type != FG_GC)
+		return -EBUSY;
+	if (!f2fs_pin_section(F2FS_I_SB(inode), segno))
+		f2fs_pin_file_control(inode, true);
+	return -EAGAIN;
+}
+
 /*
  * This function is called from two paths.
  * One is garbage collection and the other is SSR segment selection.
@@ -787,6 +832,9 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
 		if (gc_type == BG_GC && test_bit(secno, dirty_i->victim_secmap))
 			goto next;
 
+		if (gc_type == FG_GC && f2fs_section_is_pinned(dirty_i, secno))
+			goto next;
+
 		if (is_atgc) {
 			add_victim_entry(sbi, &p, segno);
 			goto next;
@@ -1201,12 +1249,9 @@ static int move_data_block(struct inode *inode, block_t bidx,
 		goto out;
 	}
 
-	if (f2fs_is_pinned_file(inode)) {
-		if (gc_type == FG_GC)
-			f2fs_pin_file_control(inode, true);
-		err = -EAGAIN;
+	err = f2fs_gc_pinned_control(inode, gc_type, segno);
+	if (err)
 		goto out;
-	}
 
 	set_new_dnode(&dn, inode, NULL, NULL, 0);
 	err = f2fs_get_dnode_of_data(&dn, bidx, LOOKUP_NODE);
@@ -1351,12 +1396,10 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 		err = -EAGAIN;
 		goto out;
 	}
-	if (f2fs_is_pinned_file(inode)) {
-		if (gc_type == FG_GC)
-			f2fs_pin_file_control(inode, true);
-		err = -EAGAIN;
+
+	err = f2fs_gc_pinned_control(inode, gc_type, segno);
+	if (err)
 		goto out;
-	}
 
 	if (gc_type == BG_GC) {
 		if (PageWriteback(page)) {
@@ -1476,14 +1519,15 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		ofs_in_node = le16_to_cpu(entry->ofs_in_node);
 
 		if (phase == 3) {
+			int err;
+
 			inode = f2fs_iget(sb, dni.ino);
 			if (IS_ERR(inode) || is_bad_inode(inode) ||
 					special_file(inode->i_mode))
 				continue;
 
-			if (is_inode_flag_set(inode, FI_PIN_FILE) &&
-							gc_type == FG_GC) {
-				f2fs_pin_file_control(inode, true);
+			err = f2fs_gc_pinned_control(inode, gc_type, segno);
+			if (err == -EAGAIN) {
 				iput(inode);
 				return submitted;
 			}
@@ -1766,9 +1810,17 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
 		ret = -EINVAL;
 		goto stop;
 	}
+retry:
 	ret = __get_victim(sbi, &segno, gc_type);
-	if (ret)
+	if (ret) {
+		/* allow to search victim from sections has pinned data */
+		if (ret == -ENODATA && gc_type == FG_GC &&
+				f2fs_pinned_section_exists(DIRTY_I(sbi))) {
+			f2fs_unpin_all_sections(sbi, false);
+			goto retry;
+		}
 		goto stop;
+	}
 
 	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type, force);
 	if (gc_type == FG_GC &&
@@ -1811,6 +1863,9 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
 	SIT_I(sbi)->last_victim[ALLOC_NEXT] = 0;
 	SIT_I(sbi)->last_victim[FLUSH_DEVICE] = init_segno;
 
+	if (gc_type == FG_GC && f2fs_pinned_section_exists(DIRTY_I(sbi)))
+		f2fs_unpin_all_sections(sbi, true);
+
 	trace_f2fs_gc_end(sbi->sb, ret, total_freed, sec_freed,
 				get_pages(sbi, F2FS_DIRTY_NODES),
 				get_pages(sbi, F2FS_DIRTY_DENTS),
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 22dfeb991529..93c7bae57a25 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4734,6 +4734,13 @@ static int init_victim_secmap(struct f2fs_sb_info *sbi)
 	dirty_i->victim_secmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
 	if (!dirty_i->victim_secmap)
 		return -ENOMEM;
+
+	dirty_i->pinned_secmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
+	if (!dirty_i->pinned_secmap)
+		return -ENOMEM;
+
+	dirty_i->pinned_secmap_cnt = 0;
+	dirty_i->enable_pin_section = true;
 	return 0;
 }
 
@@ -5322,6 +5329,7 @@ static void destroy_victim_secmap(struct f2fs_sb_info *sbi)
 {
 	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
 
+	kvfree(dirty_i->pinned_secmap);
 	kvfree(dirty_i->victim_secmap);
 }
 
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 5c94caf0c0a1..8a591455d796 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -294,6 +294,9 @@ struct dirty_seglist_info {
 	struct mutex seglist_lock;		/* lock for segment bitmaps */
 	int nr_dirty[NR_DIRTY_TYPE];		/* # of dirty segments */
 	unsigned long *victim_secmap;		/* background GC victims */
+	unsigned long *pinned_secmap;		/* pinned victims from foreground GC */
+	unsigned int pinned_secmap_cnt;		/* count of victims which has pinned data */
+	bool enable_pin_section;		/* enable pinning section */
 };
 
 /* victim selection function for cleaning and SSR */
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
