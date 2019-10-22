Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB97DE0A50
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2019 19:16:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iMxlW-0001fi-HF; Tue, 22 Oct 2019 17:16:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iMxlS-0001fZ-KS
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 17:16:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AobpdwgIsqOLUcdR47Pk4n20fWKXM7OT3+U6uzaxsaM=; b=G6d4RkHXJmZrLCjHiUQY3G8JZm
 3x/C3tCXR6ytGpV8hJlyWdmw2Of+f9UOr6jkX1qz9ajreLF4u65UvVMoEBaJTFa8ph0es9svyIL3l
 147xwjP3fvhMGTcIisM3SMll/XnpAhguPIJUoYZjc27uluL4azDTRpautg1ErRUWnBk0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=AobpdwgIsqOLUcdR47Pk4n20fWKXM7OT3+U6uzaxsaM=; b=W
 WlhfZaO4TsIi0VnUHYlfLF94X6Kwh9ZrblbCnuqUOaMga8acHPcgEu6FGQSUk3tTwzYkreUA62X3Y
 WzWM7R1HUNQI/IE/XpckF4PwVcF4NONnZm4duiQyKye3h+IXM6F+I4c5Rps78TSgfrviWMMr54Efh
 RjASx6hK0Lxfzbmw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iMxlR-00BjWL-7z
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 17:16:10 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E3E420679;
 Tue, 22 Oct 2019 17:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571764563;
 bh=mhjoDEVCxOjWE7ihz07zZD1WRHwkqur2dO1djnXzC8Y=;
 h=From:To:Cc:Subject:Date:From;
 b=KcEyqFu60OGYyRfU9vpKllmZL0XEhENKfQfnDs6yASkC3HiFpAjwQpny7BA5PVrVd
 aGUL9aNUPWbilBE7U5r9tlzUsp0qE/pNgtijeUhJuvTPzx5roapYQprS6PS7FZe4pG
 wDGo/ELgyil1nq4G4YwR9PxnXW1IwJKupvvUMlzU=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 22 Oct 2019 10:16:01 -0700
Message-Id: <20191022171602.93637-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iMxlR-00BjWL-7z
Subject: [f2fs-dev] [PATCH 1/2] f2fs: support aligned pinned file
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

This patch supports 2MB-aligned pinned file, which can guarantee no GC at all
by allocating fully valid 2MB segment.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/f2fs.h     |  4 +++-
 fs/f2fs/file.c     | 39 ++++++++++++++++++++++++++++++++++-----
 fs/f2fs/recovery.c |  2 +-
 fs/f2fs/segment.c  | 21 ++++++++++++++++++++-
 fs/f2fs/segment.h  |  2 ++
 fs/f2fs/super.c    |  1 +
 fs/f2fs/sysfs.c    |  2 ++
 7 files changed, 63 insertions(+), 8 deletions(-)

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
index 29bc0a542759..f6c038e8a6a7 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1545,12 +1545,41 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
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
 
-	err = f2fs_map_blocks(inode, &map, 1, (f2fs_is_pinned_file(inode) ?
-						F2FS_GET_BLOCK_PRE_DIO :
-						F2FS_GET_BLOCK_PRE_AIO));
+		map.m_len = sbi->blocks_per_seg;
+next_alloc:
+		mutex_lock(&sbi->gc_mutex);
+		err = f2fs_gc(sbi, true, false, NULL_SEGNO);
+		if (err && err != -ENODATA && err != -EAGAIN)
+			goto out_err;
+
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
index 25c750cd0272..253d72c2663c 100644
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
@@ -2699,6 +2699,9 @@ void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi)
 	down_write(&SIT_I(sbi)->sentry_lock);
 
 	for (i = CURSEG_HOT_DATA; i <= CURSEG_COLD_DATA; i++) {
+		if (type != NO_CHECK_TYPE && i != type)
+			continue;
+
 		curseg = CURSEG_I(sbi, i);
 		old_segno = curseg->segno;
 		SIT_I(sbi)->s_ops->allocate_segment(sbi, i, true);
@@ -3068,6 +3071,19 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
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
 
@@ -3133,6 +3149,9 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
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
