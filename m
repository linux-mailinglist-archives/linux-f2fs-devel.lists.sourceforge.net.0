Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4593F3849
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Nov 2019 20:14:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iSnEo-0006OE-8d; Thu, 07 Nov 2019 19:14:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iSnEn-0006O7-3l
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Nov 2019 19:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=88DE+9k1wDHTOdCyyiOTS7Ndhb3FoB3yB0lKUJgzK30=; b=PJLZBhDv/zIGk7tNCGPwanqAqb
 bx4snNUeqqXJLV+jtG4+BoOo17T85CejQ8Lp4QSsZQhiDz9sFGHAaoUjndIjFrDGfe7Hjs4z/PGTw
 jsMRdTUgWrKsk8RPH250bm7pOsgJZxhPNjovboH7e0rVMKpKJ6+Tiucldw5j8K80B0mA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=88DE+9k1wDHTOdCyyiOTS7Ndhb3FoB3yB0lKUJgzK30=; b=iQ9ruqUR1SHAI+Pj9PySxOh8cf
 13eTTjPvQ/8WyqZLksqqwxsggVTgYIfWmvxS31h6joYRioDA48GHYOx2z8gIlZF3GDz4CHgHeQFqJ
 ZiK0fiUd4IMkGXJJTOCkXAh2U2kViKBDj4vZYpuN7iQDznzb7Brm+En+NFBHG7zHirDM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iSnEl-005IlG-Op
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Nov 2019 19:14:33 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1864521882;
 Thu,  7 Nov 2019 19:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573154066;
 bh=PBhjHpiHePnx25/oiu/RFRiHoTI/vsJnixuQBq2ayKs=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=NA/+2iwH76buFPFddJDOLteOPDxueMx0ZqUkz4q4sgatD7WE0HwiekBN1DZf2HS6X
 pSVpgG9XF56kj24epcDNdyWLx5xLXJ1f4pmFRoxdOk14loUZapQd6kB5z9I9azLy5G
 0igDseg4Etza1atj9U48yc2+2xOveYm4kujqEsTg=
Date: Thu, 7 Nov 2019 11:14:25 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20191107191425.GA46490@jaegeuk-macbookpro.roam.corp.google.com>
References: <20191022171602.93637-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022171602.93637-1-jaegeuk@kernel.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1iSnEl-005IlG-Op
Subject: Re: [f2fs-dev] [PATCH 1/2 v2] f2fs: support aligned pinned file
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

This patch supports 2MB-aligned pinned file, which can guarantee no GC at all
by allocating fully valid 2MB segment.

Check free segments by has_not_enough_free_secs() with large budget.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
v2 from v1:
 - avoid to allocate gc'ed segment and pinned segment consecutively
 - avoid to allocate SSR segment

 fs/f2fs/f2fs.h     |  4 +++-
 fs/f2fs/file.c     | 42 +++++++++++++++++++++++++++++++++++++-----
 fs/f2fs/recovery.c |  2 +-
 fs/f2fs/segment.c  | 31 +++++++++++++++++++++++++++----
 fs/f2fs/segment.h  |  2 ++
 fs/f2fs/super.c    |  1 +
 fs/f2fs/sysfs.c    |  2 ++
 7 files changed, 73 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ca342f4c7db1..c681f51e351b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -890,6 +890,7 @@ enum {
 	CURSEG_WARM_NODE,	/* direct node blocks of normal files */
 	CURSEG_COLD_NODE,	/* indirect node blocks */
 	NO_CHECK_TYPE,
+	CURSEG_COLD_DATA_PINNED,/* cold data for pinned file */
 };
 
 struct flush_cmd {
@@ -1301,6 +1302,7 @@ struct f2fs_sb_info {
 
 	/* threshold for gc trials on pinned files */
 	u64 gc_pin_file_threshold;
+	struct rw_semaphore pin_sem;
 
 	/* maximum # of trials to find a victim segment for SSR and GC */
 	unsigned int max_victim_search;
@@ -3116,7 +3118,7 @@ void f2fs_release_discard_addrs(struct f2fs_sb_info *sbi);
 int f2fs_npages_for_summary_flush(struct f2fs_sb_info *sbi, bool for_ra);
 void allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
 					unsigned int start, unsigned int end);
-void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi);
+void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi, int type);
 int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range);
 bool f2fs_exist_trim_candidates(struct f2fs_sb_info *sbi,
 					struct cp_control *cpc);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 29bc0a542759..c31a5bbc8090 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1545,12 +1545,44 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 	if (off_end)
 		map.m_len++;
 
-	if (f2fs_is_pinned_file(inode))
-		map.m_seg_type = CURSEG_COLD_DATA;
+	if (!map.m_len)
+		return 0;
+
+	if (f2fs_is_pinned_file(inode)) {
+		block_t len = (map.m_len >> sbi->log_blocks_per_seg) <<
+					sbi->log_blocks_per_seg;
+		block_t done = 0;
+
+		if (map.m_len % sbi->blocks_per_seg)
+			len += sbi->blocks_per_seg;
+
+		map.m_len = sbi->blocks_per_seg;
+next_alloc:
+		if (has_not_enough_free_secs(sbi, 0,
+			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))) {
+			mutex_lock(&sbi->gc_mutex);
+			err = f2fs_gc(sbi, true, false, NULL_SEGNO);
+			if (err && err != -ENODATA && err != -EAGAIN)
+				goto out_err;
+		}
 
-	err = f2fs_map_blocks(inode, &map, 1, (f2fs_is_pinned_file(inode) ?
-						F2FS_GET_BLOCK_PRE_DIO :
-						F2FS_GET_BLOCK_PRE_AIO));
+		down_write(&sbi->pin_sem);
+		map.m_seg_type = CURSEG_COLD_DATA_PINNED;
+		f2fs_allocate_new_segments(sbi, CURSEG_COLD_DATA);
+		err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_DIO);
+		up_write(&sbi->pin_sem);
+
+		done += map.m_len;
+		len -= map.m_len;
+		map.m_lblk += map.m_len;
+		if (!err && len)
+			goto next_alloc;
+
+		map.m_len = done;
+	} else {
+		err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_AIO);
+	}
+out_err:
 	if (err) {
 		pgoff_t last_off;
 
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 783773e4560d..76477f71d4ee 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -711,7 +711,7 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 		f2fs_put_page(page, 1);
 	}
 	if (!err)
-		f2fs_allocate_new_segments(sbi);
+		f2fs_allocate_new_segments(sbi, NO_CHECK_TYPE);
 	return err;
 }
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 25c750cd0272..8bb37f8a1845 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2690,7 +2690,7 @@ void allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
 	up_read(&SM_I(sbi)->curseg_lock);
 }
 
-void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi)
+void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi, int type)
 {
 	struct curseg_info *curseg;
 	unsigned int old_segno;
@@ -2699,10 +2699,17 @@ void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi)
 	down_write(&SIT_I(sbi)->sentry_lock);
 
 	for (i = CURSEG_HOT_DATA; i <= CURSEG_COLD_DATA; i++) {
+		if (type != NO_CHECK_TYPE && i != type)
+			continue;
+
 		curseg = CURSEG_I(sbi, i);
-		old_segno = curseg->segno;
-		SIT_I(sbi)->s_ops->allocate_segment(sbi, i, true);
-		locate_dirty_segment(sbi, old_segno);
+		if (type == NO_CHECK_TYPE || curseg->next_blkoff ||
+				get_valid_blocks(sbi, curseg->segno, false) ||
+				get_ckpt_valid_blocks(sbi, curseg->segno)) {
+			old_segno = curseg->segno;
+			SIT_I(sbi)->s_ops->allocate_segment(sbi, i, true);
+			locate_dirty_segment(sbi, old_segno);
+		}
 	}
 
 	up_write(&SIT_I(sbi)->sentry_lock);
@@ -3068,6 +3075,19 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 {
 	struct sit_info *sit_i = SIT_I(sbi);
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
+	bool put_pin_sem = false;
+
+	if (type == CURSEG_COLD_DATA) {
+		/* GC during CURSEG_COLD_DATA_PINNED allocation */
+		if (down_read_trylock(&sbi->pin_sem)) {
+			put_pin_sem = true;
+		} else {
+			type = CURSEG_WARM_DATA;
+			curseg = CURSEG_I(sbi, type);
+		}
+	} else if (type == CURSEG_COLD_DATA_PINNED) {
+		type = CURSEG_COLD_DATA;
+	}
 
 	down_read(&SM_I(sbi)->curseg_lock);
 
@@ -3133,6 +3153,9 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 	mutex_unlock(&curseg->curseg_mutex);
 
 	up_read(&SM_I(sbi)->curseg_lock);
+
+	if (put_pin_sem)
+		up_read(&sbi->pin_sem);
 }
 
 static void update_device_state(struct f2fs_io_info *fio)
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 325781a1ae4d..a95467b202ea 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -313,6 +313,8 @@ struct sit_entry_set {
  */
 static inline struct curseg_info *CURSEG_I(struct f2fs_sb_info *sbi, int type)
 {
+	if (type == CURSEG_COLD_DATA_PINNED)
+		type = CURSEG_COLD_DATA;
 	return (struct curseg_info *)(SM_I(sbi)->curseg_array + type);
 }
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f320fd11db48..c02a47ce551b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2853,6 +2853,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	spin_lock_init(&sbi->dev_lock);
 
 	init_rwsem(&sbi->sb_lock);
+	init_rwsem(&sbi->pin_sem);
 }
 
 static int init_percpu_info(struct f2fs_sb_info *sbi)
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index b558b64a4c9c..f164959e4224 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -154,6 +154,8 @@ static ssize_t features_show(struct f2fs_attr *a,
 	if (f2fs_sb_has_casefold(sbi))
 		len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
 				len ? ", " : "", "casefold");
+	len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
+				len ? ", " : "", "pin_file");
 	len += snprintf(buf + len, PAGE_SIZE - len, "\n");
 	return len;
 }
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
