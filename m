Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE5033ED98
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Mar 2021 10:56:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lMSut-0006jz-LK; Wed, 17 Mar 2021 09:56:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lMSus-0006jM-7W
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Mar 2021 09:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4ZkmqXKS3ma9wIxxmK3bPiSZLD89LmKVkqXX0gbju2A=; b=inmZqsxJRa6+B5N6hPZ5Caf+qk
 FAIIy7AedomxHTouG4oGI93szLtGbuCmDsKFN+19s2UVeV9JxFLVQFcFd3j9oAoXcw9goTNPel38L
 eSe8t5BGl9HAIi9kDeUQG36cJHbNeoMLqjnaf4Nae7mIHUPVC/XhkgWuhDfVsa6v9ADk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4ZkmqXKS3ma9wIxxmK3bPiSZLD89LmKVkqXX0gbju2A=; b=YN9nuwZRSzohqvDo2qyiGKX+7c
 Xzl+yKxq4rR0nudZNIMPdkMh/flWjPnHYQ+BX9yoepBHA9jftD1J3Y23Pdl/lNUMZwbKrAd8ajEG0
 Y6JxV0ziLOFFti6m8uHqZ9W18irnZ8brd+uijfFGFzzo0gawBmJ1YNw6JiamX5NdJOz4=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lMSum-0005LF-Gb
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Mar 2021 09:56:38 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F0lr90phfzkZ6Y;
 Wed, 17 Mar 2021 17:54:49 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Wed, 17 Mar 2021 17:56:12 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 17 Mar 2021 17:56:04 +0800
Message-ID: <20210317095604.125820-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317095604.125820-1-yuchao0@huawei.com>
References: <20210317095604.125820-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lMSum-0005LF-Gb
Subject: [f2fs-dev] [PATCH 2/2] f2fs: fix error path of f2fs_remount()
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

In error path of f2fs_remount(), it missed to restart/stop kernel thread
or enable/disable checkpoint, then mount option status may not be
consistent with real condition of filesystem, so let's reorder remount
flow a bit as below and do recovery correctly in error path:

1) handle gc thread
2) handle ckpt thread
3) handle flush thread
4) handle checkpoint disabling

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/super.c | 47 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 6716af216dca..fa60f08c30bb 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1942,8 +1942,9 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	struct f2fs_mount_info org_mount_opt;
 	unsigned long old_sb_flags;
 	int err;
-	bool need_restart_gc = false;
-	bool need_stop_gc = false;
+	bool need_restart_gc = false, need_stop_gc = false;
+	bool need_restart_ckpt = false, need_stop_ckpt = false;
+	bool need_restart_flush = false, need_stop_flush = false;
 	bool no_extent_cache = !test_opt(sbi, EXTENT_CACHE);
 	bool disable_checkpoint = test_opt(sbi, DISABLE_CHECKPOINT);
 	bool no_io_align = !F2FS_IO_ALIGNED(sbi);
@@ -2081,19 +2082,10 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		clear_sbi_flag(sbi, SBI_IS_CLOSE);
 	}
 
-	if (checkpoint_changed) {
-		if (test_opt(sbi, DISABLE_CHECKPOINT)) {
-			err = f2fs_disable_checkpoint(sbi);
-			if (err)
-				goto restore_gc;
-		} else {
-			f2fs_enable_checkpoint(sbi);
-		}
-	}
-
 	if ((*flags & SB_RDONLY) || test_opt(sbi, DISABLE_CHECKPOINT) ||
 			!test_opt(sbi, MERGE_CHECKPOINT)) {
 		f2fs_stop_ckpt_thread(sbi);
+		need_restart_ckpt = true;
 	} else {
 		err = f2fs_start_ckpt_thread(sbi);
 		if (err) {
@@ -2102,6 +2094,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 			    err);
 			goto restore_gc;
 		}
+		need_stop_ckpt = true;
 	}
 
 	/*
@@ -2111,11 +2104,24 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	if ((*flags & SB_RDONLY) || !test_opt(sbi, FLUSH_MERGE)) {
 		clear_opt(sbi, FLUSH_MERGE);
 		f2fs_destroy_flush_cmd_control(sbi, false);
+		need_restart_flush = true;
 	} else {
 		err = f2fs_create_flush_cmd_control(sbi);
 		if (err)
-			goto restore_gc;
+			goto restore_ckpt;
+		need_stop_flush = true;
 	}
+
+	if (checkpoint_changed) {
+		if (test_opt(sbi, DISABLE_CHECKPOINT)) {
+			err = f2fs_disable_checkpoint(sbi);
+			if (err)
+				goto restore_flush;
+		} else {
+			f2fs_enable_checkpoint(sbi);
+		}
+	}
+
 skip:
 #ifdef CONFIG_QUOTA
 	/* Release old quota file names */
@@ -2130,6 +2136,21 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	adjust_unusable_cap_perc(sbi);
 	*flags = (*flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME);
 	return 0;
+restore_flush:
+	if (need_restart_flush) {
+		if (f2fs_create_flush_cmd_control(sbi))
+			f2fs_warn(sbi, "background flush thread has stopped");
+	} else if (need_stop_flush) {
+		clear_opt(sbi, FLUSH_MERGE);
+		f2fs_destroy_flush_cmd_control(sbi, false);
+	}
+restore_ckpt:
+	if (need_restart_ckpt) {
+		if (f2fs_start_ckpt_thread(sbi))
+			f2fs_warn(sbi, "background ckpt thread has stopped");
+	} else if (need_stop_ckpt) {
+		f2fs_stop_ckpt_thread(sbi);
+	}
 restore_gc:
 	if (need_restart_gc) {
 		if (f2fs_start_gc_thread(sbi))
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
