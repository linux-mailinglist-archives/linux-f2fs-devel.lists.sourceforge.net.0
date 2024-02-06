Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F7B84C017
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Feb 2024 23:33:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rXU0G-0006hv-KX;
	Tue, 06 Feb 2024 22:33:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rXU0F-0006hg-EM
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Feb 2024 22:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gVd6xrn9TMNrvJaedeT5HJ5aap1fph73205495XGdnA=; b=E5Y/yT1nww/Jo5+UXBaDVJLp+/
 H3CXiT7zrrSKS38kJZwJI9M9VGHFvj0opDa3tfWtCNXqmytyzHGL0v9qPHgTHrhA8fizpTSjWlPYz
 jJm8/YUadcimOt7hSIjIwM+oTgJbfkrQPZon4vYh67baqhVXoG858RlUA6vVG6K9cwOQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gVd6xrn9TMNrvJaedeT5HJ5aap1fph73205495XGdnA=; b=eVHP0uf6jhgRX5jnAc6rgl42uX
 e5ahbWClDakYXbal4ecn/aTOORWqQ7AchXSSnOPwSDrWEOXEzycSCh2ssnbJ1rTuhZkzk8QUK/obX
 PlyDjG5sjNH1lhRoa2JUBuTgKSw2RXykDn/jVYSX8kdlKCI9vv8P43+fgorWX0WUBXRQ=;
Received: from mail-pl1-f181.google.com ([209.85.214.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rXU0C-00041n-1M for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Feb 2024 22:33:19 +0000
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1d911c2103aso347605ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 06 Feb 2024 14:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707258786; x=1707863586; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gVd6xrn9TMNrvJaedeT5HJ5aap1fph73205495XGdnA=;
 b=QgwN2b8xxQa8AJ6ulCU4RdDvO+mt5FOzTfQWu/RH8bM7ZDLJ1VyOZRNC5EbVhl2MDO
 NR7oAY0bfG8US+L0tQPM2f1ewOqPGG+yhZfKM86NSYDYV2DfeRYqz+AzpHajM8YUKVjt
 ordeXQW74SGdWBrRlkx6AFZwx90fOcbhP8cIQXUwfMPTjNqmtsue5aMfglM7O/CVPXjz
 EJsgwZeC7lwUGUpcSZuXfGMSW/lowSfZlbgGlH4UTZ4RVS/f0dcsgdFonYLFS8uolM9I
 I/PD4RBHt/OhXVaBjWLBpnRV8DNX/7EqFdyVL2mVH/IvALjV4gxnNeUBl5BZEDkhBCfw
 1MDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707258786; x=1707863586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gVd6xrn9TMNrvJaedeT5HJ5aap1fph73205495XGdnA=;
 b=e8KrvnxSh2Gy9Hh6tzl1AfUgPNOrZXqYbIl3cF3spG+2YoAp7O3BYd8rXUFqvx2wek
 00SKm3yXNTGkYG4H+uDBHCP5tFQUMzMEoxPRN9AxC+1PaNkHxwLwXpHKXgmvfIVKbuuI
 1aL73M7PYarUX1ve9SHcsoT50koiLFfYHPV36na7EoBSKYsy4OVCAC0nkWE2lpXE/0wP
 SxfFAGJSCSdoSXiy2kG0mOSWU9X64Fj+sFH8Md4oAA6E2VBUcvIp1IZro2D0V3SPHS1o
 PGXbG/1eL7upfZqV+X7MdPocgo5aG3Prqa6xZqFDwRiU/Lx4QQtezQunqKbyngIaQ1ib
 Or0Q==
X-Gm-Message-State: AOJu0YzeZK3QxA0XoMEaKZCvhLhv1NsnQORLlWu2xPKhaclDrEJbJHpq
 4DA5GG+JVpv5dArRIuHdd037wsiONusRrNZhh7MXu+m1AqN7FPoV
X-Google-Smtp-Source: AGHT+IH6UEA4hxydRSoFtVeVirqAnHesA5Z7tbM/OPK/nita++SgODnG0JRhIqmNJ999L2H3TNGvAg==
X-Received: by 2002:a17:902:7406:b0:1d8:ed67:c360 with SMTP id
 g6-20020a170902740600b001d8ed67c360mr2837481pll.65.1707258785913; 
 Tue, 06 Feb 2024 14:33:05 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV4Y5JNu1CAKFjge2yJIaLgiUcGpSyXnxnZWHumvqm5xHT9aPmENYYvGjRjDJomle+RDUhL1traW2GuUxD6IMxBPfgzV5nhSLXV7kUA1VihvW/trsb0jyhPm/80vAlIw2ex4bfgcYxeGy5Laztoj22+7LdtlTBLSz4YSu0a/RQrfxx5Kg==
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:6e38:9e6f:4818:7d04])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a170902dc8300b001d6f091ca04sm32371pld.13.2024.02.06.14.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 14:33:05 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue,  6 Feb 2024 14:32:56 -0800
Message-ID: <20240206223257.3461359-2-daeho43@gmail.com>
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
In-Reply-To: <20240206223257.3461359-1-daeho43@gmail.com>
References: <20240206223257.3461359-1-daeho43@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Support file pinning with conventional
 storage
 area for zoned devices Signed-off-by: Daeho Jeong Signed-off-by: Jaegeuk
 Kim --- fs/f2fs/f2fs.h | 14 +++++++++- fs/f2fs/file.c | 24 ++++++++++++----
 fs/f2fs/gc.c | 14 +++++++--- fs/f2fs/segment.c | 71 ++++++++++++++++++ [...]
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.181 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.181 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rXU0C-00041n-1M
Subject: [f2fs-dev] [PATCH 2/3] f2fs: support file pinning for zoned devices
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

Support file pinning with conventional storage area for zoned devices

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/f2fs.h    | 14 +++++++++-
 fs/f2fs/file.c    | 24 ++++++++++++----
 fs/f2fs/gc.c      | 14 +++++++---
 fs/f2fs/segment.c | 71 +++++++++++++++++++++++++++++++++++++++++------
 fs/f2fs/segment.h | 10 +++++++
 5 files changed, 114 insertions(+), 19 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 543898482f8b..9b8b4d6a0d61 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3708,7 +3708,8 @@ void f2fs_get_new_segment(struct f2fs_sb_info *sbi,
 			unsigned int *newseg, bool new_sec, int dir);
 void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
 					unsigned int start, unsigned int end);
-void f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type, bool force);
+int f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type, bool force);
+int f2fs_allocate_pinning_section(struct f2fs_sb_info *sbi);
 void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi);
 int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range);
 bool f2fs_exist_trim_candidates(struct f2fs_sb_info *sbi,
@@ -3886,6 +3887,9 @@ void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi);
 block_t f2fs_start_bidx_of_node(unsigned int node_ofs, struct inode *inode);
 int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control);
 void f2fs_build_gc_manager(struct f2fs_sb_info *sbi);
+int f2fs_gc_range(struct f2fs_sb_info *sbi,
+		unsigned int start_seg, unsigned int end_seg,
+		bool dry_run, unsigned int dry_run_sections);
 int f2fs_resize_fs(struct file *filp, __u64 block_count);
 int __init f2fs_create_garbage_collection_cache(void);
 void f2fs_destroy_garbage_collection_cache(void);
@@ -4540,6 +4544,14 @@ static inline bool f2fs_lfs_mode(struct f2fs_sb_info *sbi)
 	return F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS;
 }
 
+static inline bool f2fs_valid_pinned_area(struct f2fs_sb_info *sbi,
+					  block_t blkaddr)
+{
+	int devi = f2fs_target_device_index(sbi, blkaddr);
+
+	return !bdev_is_zoned(FDEV(devi).bdev);
+}
+
 static inline bool f2fs_low_mem_mode(struct f2fs_sb_info *sbi)
 {
 	return F2FS_OPTION(sbi).memory_mode == MEMORY_MODE_LOW;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 25b119cf3499..4078e7616aef 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1735,9 +1735,11 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 
 		f2fs_down_write(&sbi->pin_sem);
 
-		f2fs_lock_op(sbi);
-		f2fs_allocate_new_section(sbi, CURSEG_COLD_DATA_PINNED, false);
-		f2fs_unlock_op(sbi);
+		err = f2fs_allocate_pinning_section(sbi);
+		if (err) {
+			f2fs_up_write(&sbi->pin_sem);
+			goto out_err;
+		}
 
 		map.m_seg_type = CURSEG_COLD_DATA_PINNED;
 		err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_PRE_DIO);
@@ -3187,6 +3189,7 @@ int f2fs_pin_file_control(struct inode *inode, bool inc)
 static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	__u32 pin;
 	int ret = 0;
 
@@ -3196,7 +3199,7 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 	if (!S_ISREG(inode->i_mode))
 		return -EINVAL;
 
-	if (f2fs_readonly(F2FS_I_SB(inode)->sb))
+	if (f2fs_readonly(sbi->sb))
 		return -EROFS;
 
 	ret = mnt_want_write_file(filp);
@@ -3209,9 +3212,18 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 		clear_inode_flag(inode, FI_PIN_FILE);
 		f2fs_i_gc_failures_write(inode, 0);
 		goto done;
+	} else if (f2fs_is_pinned_file(inode)) {
+		goto done;
 	}
 
-	if (f2fs_should_update_outplace(inode, NULL)) {
+	if (f2fs_sb_has_blkzoned(sbi) && F2FS_HAS_BLOCKS(inode)) {
+		ret = -EFBIG;
+		goto out;
+	}
+
+	/* Let's allow file pinning on zoned device. */
+	if (!f2fs_sb_has_blkzoned(sbi) &&
+	    f2fs_should_update_outplace(inode, NULL)) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -3233,7 +3245,7 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 	set_inode_flag(inode, FI_PIN_FILE);
 	ret = F2FS_I(inode)->i_gc_failures[GC_FAILURE_PIN];
 done:
-	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
+	f2fs_update_time(sbi, REQ_TIME);
 out:
 	inode_unlock(inode);
 	mnt_drop_write_file(filp);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index a46d5053f965..100695540087 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1983,10 +1983,12 @@ void f2fs_build_gc_manager(struct f2fs_sb_info *sbi)
 	init_atgc_management(sbi);
 }
 
-static int f2fs_gc_range(struct f2fs_sb_info *sbi,
-		unsigned int start_seg, unsigned int end_seg, bool dry_run)
+int f2fs_gc_range(struct f2fs_sb_info *sbi,
+		unsigned int start_seg, unsigned int end_seg,
+		bool dry_run, unsigned int dry_run_sections)
 {
 	unsigned int segno;
+	unsigned int gc_secs = dry_run_sections;
 
 	for (segno = start_seg; segno <= end_seg; segno += sbi->segs_per_sec) {
 		struct gc_inode_list gc_list = {
@@ -1994,11 +1996,15 @@ static int f2fs_gc_range(struct f2fs_sb_info *sbi,
 			.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
 		};
 
-		do_garbage_collect(sbi, segno, &gc_list, FG_GC, true);
+		do_garbage_collect(sbi, segno, &gc_list, FG_GC,
+						dry_run_sections == 0);
 		put_gc_inode(&gc_list);
 
 		if (!dry_run && get_valid_blocks(sbi, segno, true))
 			return -EAGAIN;
+		if (dry_run && dry_run_sections &&
+		    !get_valid_blocks(sbi, segno, true) && --gc_secs == 0)
+			break;
 
 		if (fatal_signal_pending(current))
 			return -ERESTARTSYS;
@@ -2036,7 +2042,7 @@ static int free_segment_range(struct f2fs_sb_info *sbi,
 		f2fs_allocate_segment_for_resize(sbi, type, start, end);
 
 	/* do GC to move out valid blocks in the range */
-	err = f2fs_gc_range(sbi, start, end, dry_run);
+	err = f2fs_gc_range(sbi, start, end, dry_run, 0);
 	if (err || dry_run)
 		goto out;
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 7901ede58113..7d5e9476d8d5 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2640,7 +2640,8 @@ static int is_next_segment_free(struct f2fs_sb_info *sbi,
  * This function should be returned with success, otherwise BUG
  */
 static void get_new_segment(struct f2fs_sb_info *sbi,
-			unsigned int *newseg, bool new_sec, int dir)
+			unsigned int *newseg, bool new_sec, int dir,
+			bool pinning)
 {
 	struct free_segmap_info *free_i = FREE_I(sbi);
 	unsigned int segno, secno, zoneno;
@@ -2660,6 +2661,17 @@ static void get_new_segment(struct f2fs_sb_info *sbi,
 		if (segno < GET_SEG_FROM_SEC(sbi, hint + 1))
 			goto got_it;
 	}
+
+	/*
+	 * If we format f2fs on zoned storage, let's try to get pinned sections
+	 * from beginning of the storage, which should be a conventional one.
+	 */
+	if (f2fs_sb_has_blkzoned(sbi)) {
+		segno = pinning ?
+			0 : max(first_zoned_segno(sbi), *newseg);
+		left_start = hint = GET_SEC_FROM_SEG(sbi, segno);
+	}
+
 find_other_zone:
 	secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
 	if (secno >= MAIN_SECS(sbi)) {
@@ -2788,12 +2800,13 @@ static unsigned int __get_next_segno(struct f2fs_sb_info *sbi, int type)
  * Allocate a current working segment.
  * This function always allocates a free segment in LFS manner.
  */
-static void new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec)
+static int new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
 	unsigned short seg_type = curseg->seg_type;
 	unsigned int segno = curseg->segno;
 	int dir = ALLOC_LEFT;
+	bool pinning = type == CURSEG_COLD_DATA_PINNED;
 
 	if (curseg->inited)
 		write_sum_page(sbi, curseg->sum_blk,
@@ -2805,13 +2818,21 @@ static void new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec)
 		dir = ALLOC_RIGHT;
 
 	segno = __get_next_segno(sbi, type);
-	get_new_segment(sbi, &segno, new_sec, dir);
+	get_new_segment(sbi, &segno, new_sec, dir, pinning);
+
+	if (new_sec && pinning &&
+	    !f2fs_valid_pinned_area(sbi, START_BLOCK(sbi, segno))) {
+		__set_free(sbi, segno);
+		return -EAGAIN;
+	}
+
 	curseg->next_segno = segno;
 	reset_curseg(sbi, type, 1);
 	curseg->alloc_type = LFS;
 	if (F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_BLK)
 		curseg->fragment_remained_chunk =
 				get_random_u32_inclusive(1, sbi->max_fragment_chunk);
+	return 0;
 }
 
 static int __next_free_blkoff(struct f2fs_sb_info *sbi,
@@ -3084,7 +3105,7 @@ void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
 	f2fs_up_read(&SM_I(sbi)->curseg_lock);
 }
 
-static void __allocate_new_segment(struct f2fs_sb_info *sbi, int type,
+static int __allocate_new_segment(struct f2fs_sb_info *sbi, int type,
 						bool new_sec, bool force)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
@@ -3094,21 +3115,49 @@ static void __allocate_new_segment(struct f2fs_sb_info *sbi, int type,
 	    !curseg->next_blkoff &&
 	    !get_valid_blocks(sbi, curseg->segno, new_sec) &&
 	    !get_ckpt_valid_blocks(sbi, curseg->segno, new_sec))
-		return;
+		return 0;
 
 	old_segno = curseg->segno;
-	new_curseg(sbi, type, true);
+	if (new_curseg(sbi, type, true))
+		return -EAGAIN;
 	stat_inc_seg_type(sbi, curseg);
 	locate_dirty_segment(sbi, old_segno);
+	return 0;
 }
 
-void f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type, bool force)
+int f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type, bool force)
 {
+	int ret;
+
 	f2fs_down_read(&SM_I(sbi)->curseg_lock);
 	down_write(&SIT_I(sbi)->sentry_lock);
-	__allocate_new_segment(sbi, type, true, force);
+	ret = __allocate_new_segment(sbi, type, true, force);
 	up_write(&SIT_I(sbi)->sentry_lock);
 	f2fs_up_read(&SM_I(sbi)->curseg_lock);
+
+	return ret;
+}
+
+int f2fs_allocate_pinning_section(struct f2fs_sb_info *sbi)
+{
+	int err;
+	bool gc_required = true;
+
+retry:
+	f2fs_lock_op(sbi);
+	err = f2fs_allocate_new_section(sbi, CURSEG_COLD_DATA_PINNED, false);
+	f2fs_unlock_op(sbi);
+
+	if (f2fs_sb_has_blkzoned(sbi) && err && gc_required) {
+		f2fs_down_write(&sbi->gc_lock);
+		f2fs_gc_range(sbi, 0, GET_SEGNO(sbi, FDEV(0).end_blk), true, 1);
+		f2fs_up_write(&sbi->gc_lock);
+
+		gc_required = false;
+		goto retry;
+	}
+
+	return err;
 }
 
 void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi)
@@ -3474,6 +3523,10 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 	 * new segment.
 	 */
 	if (segment_full) {
+		if (type == CURSEG_COLD_DATA_PINNED &&
+		    !((curseg->segno + 1) % sbi->segs_per_sec))
+			goto skip_new_segment;
+
 		if (from_gc) {
 			get_atssr_segment(sbi, type, se->type,
 						AT_SSR, se->mtime);
@@ -3485,6 +3538,8 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 			stat_inc_seg_type(sbi, curseg);
 		}
 	}
+
+skip_new_segment:
 	/*
 	 * segment dirty status should be updated after segment allocation,
 	 * so we just need to update status only one time after previous
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 8129be788bd5..8b6996ddc9ba 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -969,3 +969,13 @@ static inline void wake_up_discard_thread(struct f2fs_sb_info *sbi, bool force)
 	dcc->discard_wake = true;
 	wake_up_interruptible_all(&dcc->discard_wait_queue);
 }
+
+static inline unsigned int first_zoned_segno(struct f2fs_sb_info *sbi)
+{
+	int devi;
+
+	for (devi = 0; devi < sbi->s_ndevs; devi++)
+		if (bdev_is_zoned(FDEV(devi).bdev))
+			return GET_SEGNO(sbi, FDEV(devi).start_blk);
+	return 0;
+}
-- 
2.43.0.594.gd9cf4e227d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
