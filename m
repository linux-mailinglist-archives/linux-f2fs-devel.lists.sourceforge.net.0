Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 157486D3840
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  2 Apr 2023 16:15:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1piyUr-000209-3T;
	Sun, 02 Apr 2023 14:15:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1piyUp-000203-OB
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 02 Apr 2023 14:15:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eE84xFbKYxv9pgkiGvPr7oi7B9EOkyp58vepT4Ook/s=; b=B7xT2si+yHjPgporty35I0iot5
 zguPMHb7Hr0h5HraAgky9pmxS5tTHeS1rVKyRPCQ9XexqKPLCYJ46RxhepTXWRmYFdZnncuey2BUi
 qKGKPeso1D/53jmpV5+m5NBBTtRb0t+4VApKchqyhvv7B49GHRPqtty4H7ZGOVJxNtVc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eE84xFbKYxv9pgkiGvPr7oi7B9EOkyp58vepT4Ook/s=; b=m
 zyN4Sx3Uk7fbaZrU8nX1TkQLH33KAWYvkZ1tiao62s8/pcg5YQBSaiSLXNf9NtNJT72Xv32CeGPAS
 hknmbMl/0jMrYnCyIShXvMosQF/lFZA6iFqUavl7FZxCi/A3xkp0RjOvawNISyx+8EqmgCocFyKii
 EwxKd2KzNemDqZW0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1piyUl-0002mt-Ux for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 02 Apr 2023 14:15:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 88E9E6121D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  2 Apr 2023 14:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85983C433D2;
 Sun,  2 Apr 2023 14:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680444938;
 bh=tCU5Yhb0UoGm036hwYtIgx/g76ED23SwwoKMWbj5iBo=;
 h=From:To:Cc:Subject:Date:From;
 b=FWWE+05Z4dS0nWU9RO8XOsHRE7aIy87ZTH9WzlrESgT4c3qf2NQA30chDE3+XRjEx
 QSMhzQvb0jVJPzlgMlxVVkPG/YNzO2LAA2n5wKaD7mVcfPSSsKNIzOtX0l2k3rf8Wk
 CBSjyXxQq7U69LRt9LfjYAK6h0W6yYvbLqnL9G9TU0YC7QCifq3Qsqe+9P2Vs6hVAc
 905E4b+ypRDV2bDDNgDLyp537ijxGQb5CmPk22aC4VuuPwWJQxLx0DZ3uXnu6LqYXU
 BV0K2+4WgW7UiQpeDFmaYc8adEKhHUm4+eQi7z3F4SbKWdy7BpRDSyG/2GN78jvTax
 7ADrlOxGRBtVA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun,  2 Apr 2023 19:27:06 +0800
Message-Id: <20230402112706.42211-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  With -O quota mkfs option, xfstests generic/417 fails due
 to fsck detects data corruption on quota inodes. [ASSERT]
 (fsck_chk_quota_files:2051)
 --> Quota file is missing or invalid quota file content found. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1piyUl-0002mt-Ux
Subject: [f2fs-dev] [PATCH] f2fs: fix to recover quota data correctly
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

With -O quota mkfs option, xfstests generic/417 fails due to fsck detects
data corruption on quota inodes.

[ASSERT] (fsck_chk_quota_files:2051)  --> Quota file is missing or invalid quota file content found.

The root cause is there is a hole f2fs doesn't hold quota inodes,
so all recovered quota data will be dropped due to SBI_POR_DOING
flag was set.
- f2fs_fill_super
 - f2fs_recover_orphan_inodes
  - f2fs_enable_quota_files
  - f2fs_quota_off_umount
<--- quota inodes were dropped --->
 - f2fs_recover_fsync_data
  - f2fs_enable_quota_files
  - f2fs_quota_off_umount

This patch tries to eliminate the hole by holding quota inodes
during entire recovery flow as below:
- f2fs_fill_super
 - f2fs_recover_quota_begin
 - f2fs_recover_orphan_inodes
 - f2fs_recover_fsync_data
 - f2fs_recover_quota_end

Then, recovered quota data can be persisted after SBI_POR_DOING
is cleared.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/checkpoint.c | 23 +-----------------
 fs/f2fs/debug.c      |  1 +
 fs/f2fs/f2fs.h       |  1 +
 fs/f2fs/recovery.c   | 17 +------------
 fs/f2fs/super.c      | 57 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 61 insertions(+), 38 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index d98f37d174d5..8e1db5752fff 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -703,11 +703,7 @@ static int recover_orphan_inode(struct f2fs_sb_info *sbi, nid_t ino)
 int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
 {
 	block_t start_blk, orphan_blocks, i, j;
-	unsigned int s_flags = sbi->sb->s_flags;
 	int err = 0;
-#ifdef CONFIG_QUOTA
-	int quota_enabled;
-#endif
 
 	if (!is_set_ckpt_flags(sbi, CP_ORPHAN_PRESENT_FLAG))
 		return 0;
@@ -717,18 +713,8 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
 		return 0;
 	}
 
-	if (s_flags & SB_RDONLY) {
+	if (is_sbi_flag_set(sbi, SBI_IS_WRITABLE))
 		f2fs_info(sbi, "orphan cleanup on readonly fs");
-		sbi->sb->s_flags &= ~SB_RDONLY;
-	}
-
-#ifdef CONFIG_QUOTA
-	/*
-	 * Turn on quotas which were not enabled for read-only mounts if
-	 * filesystem has quota feature, so that they are updated correctly.
-	 */
-	quota_enabled = f2fs_enable_quota_files(sbi, s_flags & SB_RDONLY);
-#endif
 
 	start_blk = __start_cp_addr(sbi) + 1 + __cp_payload(sbi);
 	orphan_blocks = __start_sum_addr(sbi) - 1 - __cp_payload(sbi);
@@ -762,13 +748,6 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
 out:
 	set_sbi_flag(sbi, SBI_IS_RECOVERED);
 
-#ifdef CONFIG_QUOTA
-	/* Turn quotas off */
-	if (quota_enabled)
-		f2fs_quota_off_umount(sbi->sb);
-#endif
-	sbi->sb->s_flags = s_flags; /* Restore SB_RDONLY status */
-
 	return err;
 }
 
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 99c7fc832ec7..61c35b59126e 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -352,6 +352,7 @@ static const char *s_flag[MAX_SBI_FLAG] = {
 	[SBI_QUOTA_NEED_REPAIR]	= "quota_need_repair",
 	[SBI_IS_RESIZEFS]	= "resizefs",
 	[SBI_IS_FREEZING]	= "freezefs",
+	[SBI_IS_WRITABLE]	= "writable",
 };
 
 static const char *ipu_mode_names[F2FS_IPU_MAX] = {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 0448fdda5278..2d4a7ef62537 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1296,6 +1296,7 @@ enum {
 	SBI_QUOTA_NEED_REPAIR,			/* quota file may be corrupted */
 	SBI_IS_RESIZEFS,			/* resizefs is in process */
 	SBI_IS_FREEZING,			/* freezefs is in process */
+	SBI_IS_WRITABLE,			/* remove ro mountoption transiently */
 	MAX_SBI_FLAG,
 };
 
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index dfd41908b12d..58c1a0096f7d 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -825,19 +825,9 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	unsigned long s_flags = sbi->sb->s_flags;
 	bool need_writecp = false;
 	bool fix_curseg_write_pointer = false;
-#ifdef CONFIG_QUOTA
-	int quota_enabled;
-#endif
 
-	if (s_flags & SB_RDONLY) {
+	if (is_sbi_flag_set(sbi, SBI_IS_WRITABLE))
 		f2fs_info(sbi, "recover fsync data on readonly fs");
-		sbi->sb->s_flags &= ~SB_RDONLY;
-	}
-
-#ifdef CONFIG_QUOTA
-	/* Turn on quotas so that they are updated correctly */
-	quota_enabled = f2fs_enable_quota_files(sbi, s_flags & SB_RDONLY);
-#endif
 
 	INIT_LIST_HEAD(&inode_list);
 	INIT_LIST_HEAD(&tmp_inode_list);
@@ -909,11 +899,6 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 		}
 	}
 
-#ifdef CONFIG_QUOTA
-	/* Turn quotas off */
-	if (quota_enabled)
-		f2fs_quota_off_umount(sbi->sb);
-#endif
 	sbi->sb->s_flags = s_flags; /* Restore SB_RDONLY status */
 
 	return ret ? ret : err;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 26d5ddd4a589..d016f398fcad 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2534,6 +2534,54 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 }
 
 #ifdef CONFIG_QUOTA
+static bool f2fs_need_recovery(struct f2fs_sb_info *sbi)
+{
+	/* need to recovery orphan */
+	if (is_set_ckpt_flags(sbi, CP_ORPHAN_PRESENT_FLAG))
+		return true;
+	/* need to recovery data */
+	if (test_opt(sbi, DISABLE_ROLL_FORWARD))
+		return false;
+	if (test_opt(sbi, NORECOVERY))
+		return false;
+	return !is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG);
+}
+
+static bool f2fs_recover_quota_begin(struct f2fs_sb_info *sbi)
+{
+	bool readonly = f2fs_readonly(sbi->sb);
+
+	if (!f2fs_need_recovery(sbi))
+		return false;
+
+	/* it doesn't need to check f2fs_sb_has_readonly() */
+	if (f2fs_hw_is_readonly(sbi))
+		return false;
+
+	if (readonly) {
+		sbi->sb->s_flags &= ~SB_RDONLY;
+		set_sbi_flag(sbi, SBI_IS_WRITABLE);
+	}
+
+	/*
+	 * Turn on quotas which were not enabled for read-only mounts if
+	 * filesystem has quota feature, so that they are updated correctly.
+	 */
+	return f2fs_enable_quota_files(sbi, readonly);
+}
+
+static void f2fs_recover_quota_end(struct f2fs_sb_info *sbi,
+						bool quota_enabled)
+{
+	if (quota_enabled)
+		f2fs_quota_off_umount(sbi->sb);
+
+	if (is_sbi_flag_set(sbi, SBI_IS_WRITABLE)) {
+		clear_sbi_flag(sbi, SBI_IS_WRITABLE);
+		sbi->sb->s_flags |= SB_RDONLY;
+	}
+}
+
 /* Read data from quotafile */
 static ssize_t f2fs_quota_read(struct super_block *sb, int type, char *data,
 			       size_t len, loff_t off)
@@ -4224,6 +4272,9 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	int recovery, i, valid_super_block;
 	struct curseg_info *seg_i;
 	int retry_cnt = 1;
+#ifdef CONFIG_QUOTA
+	bool quota_enabled = false;
+#endif
 
 try_onemore:
 	err = -EINVAL;
@@ -4519,6 +4570,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		if (err)
 			f2fs_err(sbi, "Cannot turn on quotas: error %d", err);
 	}
+
+	quota_enabled = f2fs_recover_quota_begin(sbi);
 #endif
 	/* if there are any orphan inodes, free them */
 	err = f2fs_recover_orphan_inodes(sbi);
@@ -4576,6 +4629,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		}
 	}
 
+#ifdef CONFIG_QUOTA
+	f2fs_recover_quota_end(sbi, quota_enabled);
+#endif
+
 	/*
 	 * If the f2fs is not readonly and fsync data recovery succeeds,
 	 * check zoned block devices' write pointer consistency.
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
