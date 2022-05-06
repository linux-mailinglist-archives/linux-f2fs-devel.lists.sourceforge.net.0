Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F7F51D5C3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 May 2022 12:30:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nmvEW-0002Gk-RN; Fri, 06 May 2022 10:30:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nmvEV-0002GT-Ec
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 May 2022 10:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZvNPL2PB9Uk7BU8IK76jlAseheaargwoVqtpCGGrVPk=; b=Ek1r9JAFv/9j+jOlUABigY2SV+
 bGZ7p4WscCn3UJpc/oSd2s0USVU5/BG7n691x1KYth2JYCTFC2SBWW3KB7nBFb1Mv1WllEsejqx0y
 abc0byOqtd0tt2NAQmgVfVzJaI/cUqcmkBKiTFtJaC+MNBNQWqGLA7nbwRtrA/BDs2f4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZvNPL2PB9Uk7BU8IK76jlAseheaargwoVqtpCGGrVPk=; b=n
 C5DM+fSLuctaMpHxGglsB/eojvzbUiN2wKnWHDiev/zYdbSiE+oAnvIW06/QlowqATpwCPYEfALCT
 j8dLsF93aG6K2+KsqS5pnsvDxBbx9L3+7ELjY2u8Lbb4HWsaxuD3tB5UCsLufvlMPFi+mXpns6nLx
 UomiOWOr1AZGODIg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nmvET-0039lM-Ey
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 May 2022 10:30:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C26A76115F;
 Fri,  6 May 2022 10:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C69C385A8;
 Fri,  6 May 2022 10:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651833039;
 bh=DiC3LgVjn8hlSeyL4s67pXS3JbouAUm5Bbc8inASkBc=;
 h=From:To:Cc:Subject:Date:From;
 b=U/OBdulIAlCLfqgoEGO6OKme7mlmOgrkvdCfo+kMlaJ9tvprCQ3QCQKZHRAqk4Jni
 /JRHqTtVcfkjg797uWMZKsN7tfaZNoUt0D9SkTlcZCaJ+dMu18vtPECsDWB1lZkAPO
 vPF5+JE1tDVMWnE4TALzoSwFeG4mSs6R1mDb5rmJokymVJVGu/dufbonYLd/SIaa82
 yrU+VavrzivCk6C45doAsgqA2Yve0s0omBFoXH1qriBo5SHmDuyR5H7O8g6imqVV4A
 I++/Na+TvE1JW4FgQPPSRunA+45voIAVqM7/Y9/Aeaksjg9dVOeLS8P95YbcKM28qy
 Z0cj8ZgYRk+vw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri,  6 May 2022 18:30:31 +0800
Message-Id: <20220506103031.2883390-1-chao@kernel.org>
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
X-Headers-End: 1nmvET-0039lM-Ey
Subject: [f2fs-dev] [PATCH v6] f2fs: give priority to select unpinned
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
v6:
- fix f2fs_pinned_section_exists() to allow reenabling pin_section.
 fs/f2fs/gc.c      | 85 +++++++++++++++++++++++++++++++++++++++--------
 fs/f2fs/segment.c |  8 +++++
 fs/f2fs/segment.h |  3 ++
 3 files changed, 82 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 6a7e4148ff9d..3d027198f536 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -646,6 +646,54 @@ static void release_victim_entry(struct f2fs_sb_info *sbi)
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
+	return dirty_i->pinned_secmap_cnt;
+}
+
+static bool f2fs_section_is_pinned(struct dirty_seglist_info *dirty_i,
+						unsigned int secno)
+{
+	return dirty_i->enable_pin_section &&
+		f2fs_pinned_section_exists(dirty_i) &&
+		test_bit(secno, dirty_i->pinned_secmap);
+}
+
+static void f2fs_unpin_all_sections(struct f2fs_sb_info *sbi, bool enable)
+{
+	unsigned int bitmap_size = f2fs_bitmap_size(MAIN_SECS(sbi));
+
+	if (f2fs_pinned_section_exists(DIRTY_I(sbi))) {
+		memset(DIRTY_I(sbi)->pinned_secmap, 0, bitmap_size);
+		DIRTY_I(sbi)->pinned_secmap_cnt = 0;
+	}
+	DIRTY_I(sbi)->enable_pin_section = enable;
+}
+
+static int f2fs_gc_pinned_control(struct inode *inode, int gc_type,
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
@@ -787,6 +835,9 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
 		if (gc_type == BG_GC && test_bit(secno, dirty_i->victim_secmap))
 			goto next;
 
+		if (gc_type == FG_GC && f2fs_section_is_pinned(dirty_i, secno))
+			goto next;
+
 		if (is_atgc) {
 			add_victim_entry(sbi, &p, segno);
 			goto next;
@@ -1201,12 +1252,9 @@ static int move_data_block(struct inode *inode, block_t bidx,
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
@@ -1351,12 +1399,9 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 		err = -EAGAIN;
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
 
 	if (gc_type == BG_GC) {
 		if (PageWriteback(page)) {
@@ -1476,14 +1521,15 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
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
@@ -1766,9 +1812,17 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
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
@@ -1811,6 +1865,9 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
 	SIT_I(sbi)->last_victim[ALLOC_NEXT] = 0;
 	SIT_I(sbi)->last_victim[FLUSH_DEVICE] = init_segno;
 
+	if (gc_type == FG_GC)
+		f2fs_unpin_all_sections(sbi, true);
+
 	trace_f2fs_gc_end(sbi->sb, ret, total_freed, sec_freed,
 				get_pages(sbi, F2FS_DIRTY_NODES),
 				get_pages(sbi, F2FS_DIRTY_DENTS),
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c9b3224ef936..8c17fed8987e 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4643,6 +4643,13 @@ static int init_victim_secmap(struct f2fs_sb_info *sbi)
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
 
@@ -5231,6 +5238,7 @@ static void destroy_victim_secmap(struct f2fs_sb_info *sbi)
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
