Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E532608C0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Sep 2020 04:44:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kFTch-0003B7-JY; Tue, 08 Sep 2020 02:44:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kFTcg-0003Av-2q
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Sep 2020 02:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uyIb8kUMY8DJ99Mz9wl8Y+7UFHI10JP2O3HyXXLiNng=; b=U4oKPRFLHRLUE5+KQv0qH+9CFq
 M35gFR428E1cpBgtQobo3K2BwDt2qOkHezYzBiY7oMqefpqB/aaOIk15ngcz1j1Q8LD5XK//GyWLb
 +cZWM2pE5WwFvia7EfqFPnBJKb4jIDtvDL4mWjmHKs2ohTBj66oD5TF9mi3bfXnPkUyw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uyIb8kUMY8DJ99Mz9wl8Y+7UFHI10JP2O3HyXXLiNng=; b=R
 hxsMklnL33Fhv7Oq/+sGw6j/FD/yIqd99cXCYomo6JFk9Vj/1uj7OO2l8lMlzcfnPv1bNUvFYr0eu
 VkmUkJN5/zQbW4/W4kNdee4BhPwGK26MBAYSyUpZ+M/gW3R0XPUGxBTPJdZKO6BaC+Cks2SNLSoWP
 9L47CxQPFbaGdY6g=;
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kFTcY-00GBFb-Fk
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Sep 2020 02:44:42 +0000
Received: by mail-pg1-f193.google.com with SMTP id e33so9020597pgm.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 07 Sep 2020 19:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uyIb8kUMY8DJ99Mz9wl8Y+7UFHI10JP2O3HyXXLiNng=;
 b=epDLSiQGwIFoyGNw3Whmj8GwHhv+9u9qRdqbSXpCKUSjBHR7bQF2QDdNcpKnvP0i71
 1kdtwXP4HDtjhRIl96iWCK8Y/+vJ7sNQQwgd6lmfSS1xLh8sJNQYUBARXiNHY75bS0mZ
 zFQsAIzIFo1AAyQkiUuMcjJeUzp3MPSKOvwY4pIW3gpar/00YSgFcKcs/dyqO8pZd+t4
 gPJb/f46UghYuXc35HDVtS9gkG9QPhyuk0z8Xh4a9FGz7RSvnSwkJt9wJXU+cHQ8zVnq
 M0AC6f+zpCfUKhLJ4hWlPnm7YfZrDaOsSy+7Ns7H1sdCHakEqTLaHOmkmBZjJf4VHoPw
 e3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uyIb8kUMY8DJ99Mz9wl8Y+7UFHI10JP2O3HyXXLiNng=;
 b=g9RJcycf0Z8JW7syIZofCqoW8RUzdtMG031H4+y2c0zZjzqOQvW2TG13iYdFP012WQ
 3YLflez4ZONtZpquXQnTgmer+hW3mzxsCk42UeEcv/79G5YtC6PlWHMkGgNQO36fEh2s
 V/59u6faoe2dlkzyVHX3wewXjXWoc+GsiddXRBJWHA05b4JWXRvARBe/7BxE+X0xpF9N
 6ZCs76s7b2+OWF/FnX6ejECsUNXWNaoMm4lR31AF8EzAinhR5cwXCboehK8L2+JDhF4y
 uz4K/qHfxPElww2DI1kH1mgMMXNMF9L+ElIT/uwSoGzLQWS9JWg1jzJmITdXF5tZl0u3
 mpSw==
X-Gm-Message-State: AOAM533IcjEycHMqcn0BrHjAIMX8p/JdxulLydd+AcTj3wtdLEwGgzyy
 kgpg7jQjMn3c9w7DK7YAUp0=
X-Google-Smtp-Source: ABdhPJxGHsQ76hm+ReEOCRqG6aTZvmVLsH5cxN9pg3XVPJYJR9LYAW9OIjXajjtmue3LMl24X7zgFw==
X-Received: by 2002:a63:7e4c:: with SMTP id o12mr18295834pgn.270.1599533058699; 
 Mon, 07 Sep 2020 19:44:18 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id k24sm16237390pfg.148.2020.09.07.19.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 19:44:17 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue,  8 Sep 2020 11:44:10 +0900
Message-Id: <20200908024411.2692388-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.193 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kFTcY-00GBFb-Fk
Subject: [f2fs-dev] [PATCH v3 1/2] f2fs: change i_compr_blocks of inode to
 atomic value
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

writepages() can be concurrently invoked for the same file by different
threads such as a thread fsyncing the file and a kworker kernel thread.
So, changing i_compr_blocks without protection is racy and we need to
protect it by changing it with atomic type value. Plus, we don't need
a 64bit value for i_compr_blocks, so just we will use a atomic value,
not atomic64.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
Changes in v3:
 - Roll back to the original flow except changing atomic64 to atomic
Changes in v2:
 - Change atomic64 to atomic and remove unnecessary part

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/f2fs.h  | 17 ++++++++++-------
 fs/f2fs/file.c  | 22 ++++++++++++----------
 fs/f2fs/inode.c | 11 +++++++----
 fs/f2fs/super.c |  1 +
 4 files changed, 30 insertions(+), 21 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f60414805e05..c615e75c82fd 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -801,7 +801,7 @@ struct f2fs_inode_info {
 	struct timespec64 i_disk_time[4];/* inode disk times */
 
 	/* for file compress */
-	u64 i_compr_blocks;			/* # of compressed blocks */
+	atomic_t i_compr_blocks;		/* # of compressed blocks */
 	unsigned char i_compress_algorithm;	/* algorithm type */
 	unsigned char i_log_cluster_size;	/* log of cluster size */
 	unsigned int i_cluster_size;		/* cluster size */
@@ -3930,17 +3930,19 @@ static inline void set_compress_context(struct inode *inode)
 	f2fs_mark_inode_dirty_sync(inode, true);
 }
 
-static inline u64 f2fs_disable_compressed_file(struct inode *inode)
+static inline u32 f2fs_disable_compressed_file(struct inode *inode)
 {
 	struct f2fs_inode_info *fi = F2FS_I(inode);
+	u32 i_compr_blocks;
 
 	if (!f2fs_compressed_file(inode))
 		return 0;
 	if (S_ISREG(inode->i_mode)) {
 		if (get_dirty_pages(inode))
 			return 1;
-		if (fi->i_compr_blocks)
-			return fi->i_compr_blocks;
+		i_compr_blocks = atomic_read(&fi->i_compr_blocks);
+		if (i_compr_blocks)
+			return i_compr_blocks;
 	}
 
 	fi->i_flags &= ~F2FS_COMPR_FL;
@@ -4057,16 +4059,17 @@ static inline void f2fs_i_compr_blocks_update(struct inode *inode,
 						u64 blocks, bool add)
 {
 	int diff = F2FS_I(inode)->i_cluster_size - blocks;
+	struct f2fs_inode_info *fi = F2FS_I(inode);
 
 	/* don't update i_compr_blocks if saved blocks were released */
-	if (!add && !F2FS_I(inode)->i_compr_blocks)
+	if (!add && !atomic_read(&fi->i_compr_blocks))
 		return;
 
 	if (add) {
-		F2FS_I(inode)->i_compr_blocks += diff;
+		atomic_add(diff, &fi->i_compr_blocks);
 		stat_add_compr_blocks(inode, diff);
 	} else {
-		F2FS_I(inode)->i_compr_blocks -= diff;
+		atomic_sub(diff, &fi->i_compr_blocks);
 		stat_sub_compr_blocks(inode, diff);
 	}
 	f2fs_mark_inode_dirty_sync(inode, true);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index cc7f5670390f..adc4acad488a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -564,7 +564,7 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 	bool compressed_cluster = false;
 	int cluster_index = 0, valid_blocks = 0;
 	int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
-	bool released = !F2FS_I(dn->inode)->i_compr_blocks;
+	bool released = !atomic_read(&F2FS_I(dn->inode)->i_compr_blocks);
 
 	if (IS_INODE(dn->node_page) && f2fs_has_extra_attr(dn->inode))
 		base = get_extra_isize(dn->inode);
@@ -3436,7 +3436,7 @@ static int f2fs_get_compress_blocks(struct file *filp, unsigned long arg)
 	if (!f2fs_compressed_file(inode))
 		return -EINVAL;
 
-	blocks = F2FS_I(inode)->i_compr_blocks;
+	blocks = atomic_read(&F2FS_I(inode)->i_compr_blocks);
 	return put_user(blocks, (u64 __user *)arg);
 }
 
@@ -3535,7 +3535,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	if (ret)
 		goto out;
 
-	if (!F2FS_I(inode)->i_compr_blocks)
+	if (!atomic_read(&F2FS_I(inode)->i_compr_blocks))
 		goto out;
 
 	F2FS_I(inode)->i_flags |= F2FS_IMMUTABLE_FL;
@@ -3588,14 +3588,15 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 
 	if (ret >= 0) {
 		ret = put_user(released_blocks, (u64 __user *)arg);
-	} else if (released_blocks && F2FS_I(inode)->i_compr_blocks) {
+	} else if (released_blocks &&
+			atomic_read(&F2FS_I(inode)->i_compr_blocks)) {
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: partial blocks were released i_ino=%lx "
-			"iblocks=%llu, released=%u, compr_blocks=%llu, "
+			"iblocks=%llu, released=%u, compr_blocks=%u, "
 			"run fsck to fix.",
 			__func__, inode->i_ino, inode->i_blocks,
 			released_blocks,
-			F2FS_I(inode)->i_compr_blocks);
+			atomic_read(&F2FS_I(inode)->i_compr_blocks));
 	}
 
 	return ret;
@@ -3683,7 +3684,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	if (ret)
 		return ret;
 
-	if (F2FS_I(inode)->i_compr_blocks)
+	if (atomic_read(&F2FS_I(inode)->i_compr_blocks))
 		goto out;
 
 	f2fs_balance_fs(F2FS_I_SB(inode), true);
@@ -3747,14 +3748,15 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 
 	if (ret >= 0) {
 		ret = put_user(reserved_blocks, (u64 __user *)arg);
-	} else if (reserved_blocks && F2FS_I(inode)->i_compr_blocks) {
+	} else if (reserved_blocks &&
+			atomic_read(&F2FS_I(inode)->i_compr_blocks)) {
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: partial blocks were released i_ino=%lx "
-			"iblocks=%llu, reserved=%u, compr_blocks=%llu, "
+			"iblocks=%llu, reserved=%u, compr_blocks=%u, "
 			"run fsck to fix.",
 			__func__, inode->i_ino, inode->i_blocks,
 			reserved_blocks,
-			F2FS_I(inode)->i_compr_blocks);
+			atomic_read(&F2FS_I(inode)->i_compr_blocks));
 	}
 
 	return ret;
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 66969ae852b9..2ed935c13aed 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -442,7 +442,8 @@ static int do_read_inode(struct inode *inode)
 					(fi->i_flags & F2FS_COMPR_FL)) {
 		if (F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
 					i_log_cluster_size)) {
-			fi->i_compr_blocks = le64_to_cpu(ri->i_compr_blocks);
+			atomic_set(&fi->i_compr_blocks,
+					le64_to_cpu(ri->i_compr_blocks));
 			fi->i_compress_algorithm = ri->i_compress_algorithm;
 			fi->i_log_cluster_size = ri->i_log_cluster_size;
 			fi->i_cluster_size = 1 << fi->i_log_cluster_size;
@@ -460,7 +461,7 @@ static int do_read_inode(struct inode *inode)
 	stat_inc_inline_inode(inode);
 	stat_inc_inline_dir(inode);
 	stat_inc_compr_inode(inode);
-	stat_add_compr_blocks(inode, F2FS_I(inode)->i_compr_blocks);
+	stat_add_compr_blocks(inode, atomic_read(&fi->i_compr_blocks));
 
 	return 0;
 }
@@ -619,7 +620,8 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
 			F2FS_FITS_IN_INODE(ri, F2FS_I(inode)->i_extra_isize,
 							i_log_cluster_size)) {
 			ri->i_compr_blocks =
-				cpu_to_le64(F2FS_I(inode)->i_compr_blocks);
+				cpu_to_le64(atomic_read(
+					&F2FS_I(inode)->i_compr_blocks));
 			ri->i_compress_algorithm =
 				F2FS_I(inode)->i_compress_algorithm;
 			ri->i_log_cluster_size =
@@ -768,7 +770,8 @@ void f2fs_evict_inode(struct inode *inode)
 	stat_dec_inline_dir(inode);
 	stat_dec_inline_inode(inode);
 	stat_dec_compr_inode(inode);
-	stat_sub_compr_blocks(inode, F2FS_I(inode)->i_compr_blocks);
+	stat_sub_compr_blocks(inode,
+			atomic_read(&F2FS_I(inode)->i_compr_blocks));
 
 	if (likely(!f2fs_cp_error(sbi) &&
 				!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 83bf9a02f83f..813aa207824c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1011,6 +1011,7 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
 
 	/* Initialize f2fs-specific inode info */
 	atomic_set(&fi->dirty_pages, 0);
+	atomic_set(&fi->i_compr_blocks, 0);
 	init_rwsem(&fi->i_sem);
 	spin_lock_init(&fi->i_size_lock);
 	INIT_LIST_HEAD(&fi->dirty_list);
-- 
2.28.0.526.ge36021eeef-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
