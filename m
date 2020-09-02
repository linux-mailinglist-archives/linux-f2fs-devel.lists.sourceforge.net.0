Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF14425A58E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Sep 2020 08:29:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kDMH5-0006os-TG; Wed, 02 Sep 2020 06:29:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kDMH4-0006ol-K6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Sep 2020 06:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EsYUU8I5g60A3ycIDJI/Ukd4xor/sPtJdrvcDFwTS0g=; b=fL3dzhocyRC3KA13e/B8E/D2tB
 V7zMzqHiVzUc55/W7EbyULZVjWxHx/dZZVKfx1CnknNv2PmfYx0A7bszWTvJCqj9nruy9WHeQnInJ
 fTlc09t++0ZO/VLORmh5rJOgcZllq5CMhMcShcVpu5NZMicZjzSCkcjMDGeFM8NeY4c4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EsYUU8I5g60A3ycIDJI/Ukd4xor/sPtJdrvcDFwTS0g=; b=l
 o/n08FhrAQiG94FPf8WUGEDDLnSzMUtSMX6/7WQqz7fz518+5KBggvHNglPLT62CUKtZsHuTTWPwa
 IP9cor+NSdVwuDxOHDoRcdnfctpHAjq2isvKYDDBkj3Sc7Oz8GUm7f5wwNaO4M3ShDhrvT/StswdQ
 7Svtce/k0lxjjaGU=;
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kDMGp-008iU4-80
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Sep 2020 06:29:38 +0000
Received: by mail-pf1-f196.google.com with SMTP id u20so2293848pfn.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 01 Sep 2020 23:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EsYUU8I5g60A3ycIDJI/Ukd4xor/sPtJdrvcDFwTS0g=;
 b=mJRww8wfz9kGBfMY76OD7lV9GZgpleY9nIqAuKr4QKbvETL6E2CvnzQrMhrgPbNgkV
 VwcI+CCch9v74mSMITURijnGb+UI/7FZgM4jqhL+k7JAwY0D+nq+QIbbEA9eAsKTTUsf
 z7jp76is0GZHwSI8rvB0Dog5SXFRFnNbWwv3DJZgc+os6UhPKAx2sjQRWFZSYH5elm/2
 dbAjrRqKaqz3SyLvFV9HaaFevgiHPyoDIxzgpxc2YN9ByQobqA8AGz5UDElefdL8Y/LQ
 YEJvNznxCcfHMhmP3J7RCbP1h3UI3+42SpHZ2rBHnNLXL13u64avv+W9HLYbuK4JZu7c
 DnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EsYUU8I5g60A3ycIDJI/Ukd4xor/sPtJdrvcDFwTS0g=;
 b=WvSktwJoDBrHwe1aR1tOLGYo9Xtp1DBE9Pz7Rl2FhIG39G0y1f2hL9DXuaXnRXImmw
 F5k4TTLMEyXo4YNXIjwblUhTqaMcFwo4NIm7rghIqpF4IFqK0ViMfhI5w/ofBVhZY/AZ
 9HMKbZs0ZJepRaIAPMq8O9L/oRaFz0TkVsXe3z4/7gj0lcMvKs0khn7eoh9SrEZJtARx
 v0rluvo9aW4F7ln0U//hiuQUv4Cw4VO09b1JubwYJle665ArFx/Id7XHfhCmx66p6L2s
 ZrUvMay9VC9CXji3oCvWbFKjIyB3uIIBSvabyWUDnmA/CVVaQdWsuXmqHPstZLEKxRvS
 63pQ==
X-Gm-Message-State: AOAM533bbORy45JhnpygmHAxaBqcOfztzBK+YQYzF4pYI7XV3YmaAnHS
 vezJ6CpFBiezWIHjEQWNxPY=
X-Google-Smtp-Source: ABdhPJw0LM7jsycQU0UI4IXXA7jR/Agzl4Fk5XRkkDaiv9eU9Xnrh5doNT2wZ2xKtgoiCr3Yjk9J5g==
X-Received: by 2002:a05:6a00:23c5:: with SMTP id
 g5mr1904665pfc.160.1599028157433; 
 Tue, 01 Sep 2020 23:29:17 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id b64sm4059390pfa.200.2020.09.01.23.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 23:29:16 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed,  2 Sep 2020 15:29:10 +0900
Message-Id: <20200902062910.4061083-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
MIME-Version: 1.0
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.196 listed in list.dnswl.org]
 0.0 DKIM_ADSP_CUSTOM_MED   No valid author signature, adsp_override is
 CUSTOM_MED
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1kDMGp-008iU4-80
Subject: [f2fs-dev] [PATCH] f2fs: change i_compr_blocks of inode to atomic
 value
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
protect it by changing it with atomic type value.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/f2fs.h  | 15 +++++++++------
 fs/f2fs/file.c  | 18 ++++++++++--------
 fs/f2fs/inode.c | 11 +++++++----
 fs/f2fs/super.c |  1 +
 4 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f60414805e05..633957e14944 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -801,7 +801,7 @@ struct f2fs_inode_info {
 	struct timespec64 i_disk_time[4];/* inode disk times */
 
 	/* for file compress */
-	u64 i_compr_blocks;			/* # of compressed blocks */
+	atomic64_t i_compr_blocks;		/* # of compressed blocks */
 	unsigned char i_compress_algorithm;	/* algorithm type */
 	unsigned char i_log_cluster_size;	/* log of cluster size */
 	unsigned int i_cluster_size;		/* cluster size */
@@ -3933,14 +3933,16 @@ static inline void set_compress_context(struct inode *inode)
 static inline u64 f2fs_disable_compressed_file(struct inode *inode)
 {
 	struct f2fs_inode_info *fi = F2FS_I(inode);
+	u64 i_compr_blocks;
 
 	if (!f2fs_compressed_file(inode))
 		return 0;
 	if (S_ISREG(inode->i_mode)) {
 		if (get_dirty_pages(inode))
 			return 1;
-		if (fi->i_compr_blocks)
-			return fi->i_compr_blocks;
+		i_compr_blocks = atomic64_read(&fi->i_compr_blocks);
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
+	if (!add && !atomic64_read(&fi->i_compr_blocks))
 		return;
 
 	if (add) {
-		F2FS_I(inode)->i_compr_blocks += diff;
+		atomic64_add(diff, &fi->i_compr_blocks);
 		stat_add_compr_blocks(inode, diff);
 	} else {
-		F2FS_I(inode)->i_compr_blocks -= diff;
+		atomic64_sub(diff, &fi->i_compr_blocks);
 		stat_sub_compr_blocks(inode, diff);
 	}
 	f2fs_mark_inode_dirty_sync(inode, true);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index cc7f5670390f..4e4e369b97e5 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -564,7 +564,7 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 	bool compressed_cluster = false;
 	int cluster_index = 0, valid_blocks = 0;
 	int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
-	bool released = !F2FS_I(dn->inode)->i_compr_blocks;
+	bool released = !atomic64_read(&F2FS_I(dn->inode)->i_compr_blocks);
 
 	if (IS_INODE(dn->node_page) && f2fs_has_extra_attr(dn->inode))
 		base = get_extra_isize(dn->inode);
@@ -3436,7 +3436,7 @@ static int f2fs_get_compress_blocks(struct file *filp, unsigned long arg)
 	if (!f2fs_compressed_file(inode))
 		return -EINVAL;
 
-	blocks = F2FS_I(inode)->i_compr_blocks;
+	blocks = atomic64_read(&F2FS_I(inode)->i_compr_blocks);
 	return put_user(blocks, (u64 __user *)arg);
 }
 
@@ -3535,7 +3535,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	if (ret)
 		goto out;
 
-	if (!F2FS_I(inode)->i_compr_blocks)
+	if (!atomic64_read(&F2FS_I(inode)->i_compr_blocks))
 		goto out;
 
 	F2FS_I(inode)->i_flags |= F2FS_IMMUTABLE_FL;
@@ -3588,14 +3588,15 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 
 	if (ret >= 0) {
 		ret = put_user(released_blocks, (u64 __user *)arg);
-	} else if (released_blocks && F2FS_I(inode)->i_compr_blocks) {
+	} else if (released_blocks &&
+			atomic64_read(&F2FS_I(inode)->i_compr_blocks)) {
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: partial blocks were released i_ino=%lx "
 			"iblocks=%llu, released=%u, compr_blocks=%llu, "
 			"run fsck to fix.",
 			__func__, inode->i_ino, inode->i_blocks,
 			released_blocks,
-			F2FS_I(inode)->i_compr_blocks);
+			atomic64_read(&F2FS_I(inode)->i_compr_blocks));
 	}
 
 	return ret;
@@ -3683,7 +3684,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	if (ret)
 		return ret;
 
-	if (F2FS_I(inode)->i_compr_blocks)
+	if (atomic64_read(&F2FS_I(inode)->i_compr_blocks))
 		goto out;
 
 	f2fs_balance_fs(F2FS_I_SB(inode), true);
@@ -3747,14 +3748,15 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 
 	if (ret >= 0) {
 		ret = put_user(reserved_blocks, (u64 __user *)arg);
-	} else if (reserved_blocks && F2FS_I(inode)->i_compr_blocks) {
+	} else if (reserved_blocks &&
+			atomic64_read(&F2FS_I(inode)->i_compr_blocks)) {
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: partial blocks were released i_ino=%lx "
 			"iblocks=%llu, reserved=%u, compr_blocks=%llu, "
 			"run fsck to fix.",
 			__func__, inode->i_ino, inode->i_blocks,
 			reserved_blocks,
-			F2FS_I(inode)->i_compr_blocks);
+			atomic64_read(&F2FS_I(inode)->i_compr_blocks));
 	}
 
 	return ret;
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 66969ae852b9..e86857af9699 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -442,7 +442,8 @@ static int do_read_inode(struct inode *inode)
 					(fi->i_flags & F2FS_COMPR_FL)) {
 		if (F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
 					i_log_cluster_size)) {
-			fi->i_compr_blocks = le64_to_cpu(ri->i_compr_blocks);
+			atomic64_set(&fi->i_compr_blocks,
+					le64_to_cpu(ri->i_compr_blocks));
 			fi->i_compress_algorithm = ri->i_compress_algorithm;
 			fi->i_log_cluster_size = ri->i_log_cluster_size;
 			fi->i_cluster_size = 1 << fi->i_log_cluster_size;
@@ -460,7 +461,7 @@ static int do_read_inode(struct inode *inode)
 	stat_inc_inline_inode(inode);
 	stat_inc_inline_dir(inode);
 	stat_inc_compr_inode(inode);
-	stat_add_compr_blocks(inode, F2FS_I(inode)->i_compr_blocks);
+	stat_add_compr_blocks(inode, atomic64_read(&fi->i_compr_blocks));
 
 	return 0;
 }
@@ -619,7 +620,8 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
 			F2FS_FITS_IN_INODE(ri, F2FS_I(inode)->i_extra_isize,
 							i_log_cluster_size)) {
 			ri->i_compr_blocks =
-				cpu_to_le64(F2FS_I(inode)->i_compr_blocks);
+				cpu_to_le64(atomic64_read(
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
+			atomic64_read(&F2FS_I(inode)->i_compr_blocks));
 
 	if (likely(!f2fs_cp_error(sbi) &&
 				!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 83bf9a02f83f..65613500e1ab 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1011,6 +1011,7 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
 
 	/* Initialize f2fs-specific inode info */
 	atomic_set(&fi->dirty_pages, 0);
+	atomic64_set(&fi->i_compr_blocks, 0);
 	init_rwsem(&fi->i_sem);
 	spin_lock_init(&fi->i_size_lock);
 	INIT_LIST_HEAD(&fi->dirty_list);
-- 
2.28.0.402.g5ffc5be6b7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
