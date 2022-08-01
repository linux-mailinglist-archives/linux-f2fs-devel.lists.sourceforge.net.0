Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F551586DCC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Aug 2022 17:32:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oIXP2-000718-4a; Mon, 01 Aug 2022 15:32:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daeho43@gmail.com>) id 1oIXP1-00070x-2f
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Aug 2022 15:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=58O5KgclSAk428/9CaeCSINMTyAXe65Q2E+LYB9ZunI=; b=HasdY8iawjMnmmZnopVwSakedp
 sdeWnmmqvpgbG+sD0+RypNaevy7EzBTEuIZtO1E5L38U+LmiHVM6JneC/QeARMr2rqd35N9DtO5yx
 OLdEvhwdQOOu3EPaX1ftZdiAiE+3wFtbs+nPo8+13fb549Ijc3z4CKjCCoCiQpVDZWvw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=58O5KgclSAk428/9CaeCSINMTyAXe65Q2E+LYB9ZunI=; b=F
 FJWvjDta71sg2gCU0IQxCQQIfQ7IdMGlUVBK61L/sSZAVBbQ8DjqcU3HkDLf2Rds0ykfs5tsftteA
 yy935o4bLevIVu7fbDCP/duQi/EFlkMzD8gthGPBmE2hGjRnW0QBpe0YegAyCpt27Y6mzgw27J/xp
 Zu3JMN4qraNmC6jE=;
Received: from mail-pj1-f47.google.com ([209.85.216.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1oIXP0-0004RD-5z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Aug 2022 15:32:18 +0000
Received: by mail-pj1-f47.google.com with SMTP id t22so3133844pjy.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 01 Aug 2022 08:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=58O5KgclSAk428/9CaeCSINMTyAXe65Q2E+LYB9ZunI=;
 b=hdGwyLKhBSvFqSAdYtPM94obeKxxPB04Gd8llerE84DMUco0CBI7aO6kOydR7iXMUZ
 Dswr0RA0rGkgmDXtHrPifikjNl+kZ2wWbNr578RYodQuaELZ+MHByJ45k69DDYY+jqoU
 6NIEr/5KMAUyCoGBlJ9r5uiVME0BWgKDLNO7WTyBkcwoyVxkHND0qZpGuPyXzS46JVP9
 Y9GRen1RyqRfxufkXx6VgoI19ug3g7bMBzpdnOloi1JpQ3LZ+0k7lVkfMeaz7dZXncR4
 Sl9G0+sf7397D4/y34XkPq3AqhliHzAsQRtQBUEb7dgvZIZwK1rS67VMSzaWDzqonvaU
 m+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=58O5KgclSAk428/9CaeCSINMTyAXe65Q2E+LYB9ZunI=;
 b=b4uxu0/GGqxsc3gzcQlrFl7Cc4ssIxP9Ri/xHQB7EqWpcCtsRXp2fiUXcAiFk9f7qK
 OKo0LXhODNDUBbV5yfd/hL6GnTlSJOhAlYSKOt6Wpj6nygRhefjM7jewi3jSuewlohFE
 qbqlPbcGFk7rrBvF7quOZwsPB/wXsD9PljubhtA5nZzqJmhLq2mXwq4SdZh1A/5dpaeV
 2qIiE9sZeRLyNStPPuw8/bfZUDK1w4jPttURoMlHE+hLW/XF0vlNyPlyoazROfib38+Z
 XqAPTnyORRTO10MS/aHiXfdPtCpFhW3x3sPZszb8CVN3EACFKziNqIr3ZJfB4haduwuV
 Ijig==
X-Gm-Message-State: ACgBeo26D/9RfwEE8yVSWaknNa4r+nTMQuKhGA3IEq4LYt5mPbYK6yZi
 E3/MvL9tXhpLSoMaSpOIs/Q=
X-Google-Smtp-Source: AA6agR5gkZgEDh+ByjvltOTflhYu2NZpoFfNr1gH/P2+w9XXvDMzj9xsh4Of9PunRrF7LwjhQWb6BA==
X-Received: by 2002:a17:90b:33cd:b0:1f0:3655:17a8 with SMTP id
 lk13-20020a17090b33cd00b001f0365517a8mr19555757pjb.33.1659367932472; 
 Mon, 01 Aug 2022 08:32:12 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:7c40:5eed:9318:104a])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a170902e88c00b0016bff65d5cbsm9907113plg.194.2022.08.01.08.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 08:32:12 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon,  1 Aug 2022 08:32:09 -0700
Message-Id: <20220801153209.1653546-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Fixed null inode reference when doing
 foreground
 GC for data segments of COW inodes. Below is a finding by Ye Bin . 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.47 listed in list.dnswl.org]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.47 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oIXP0-0004RD-5z
Subject: [f2fs-dev] [PATCH] f2fs: fix null inode reference when FG GC for
 atomic file
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
Cc: Daeho Jeong <daehojeong@google.com>, Ye Bin <yebin10@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Fixed null inode reference when doing foreground GC for data segments of
COW inodes.

Below is a finding by Ye Bin <yebin10@huawei.com>.

There is issue as follows when test f2fs atomic write:
F2FS-fs (loop0): Can't find valid F2FS filesystem in 2th superblock
F2FS-fs (loop0): invalid crc_offset: 0
F2FS-fs (loop0): f2fs_check_nid_range: out-of-range nid=1, run fsck to fix.
F2FS-fs (loop0): f2fs_check_nid_range: out-of-range nid=2, run fsck to fix.
==================================================================
BUG: KASAN: null-ptr-deref in f2fs_get_dnode_of_data+0xac/0x16d0
Read of size 8 at addr 0000000000000028 by task rep/1990

CPU: 4 PID: 1990 Comm: rep Not tainted 5.19.0-rc6-next-20220715 #266
Call Trace:
 <TASK>
 dump_stack_lvl+0x6e/0x91
 print_report.cold+0x49a/0x6bb
 kasan_report+0xa8/0x130
 f2fs_get_dnode_of_data+0xac/0x16d0
 f2fs_do_write_data_page+0x2a5/0x1030
 move_data_page+0x3c5/0xdf0
 do_garbage_collect+0x2015/0x36c0
 f2fs_gc+0x554/0x1d30
 f2fs_balance_fs+0x7f5/0xda0
 f2fs_write_single_data_page+0xb66/0xdc0
 f2fs_write_cache_pages+0x716/0x1420
 f2fs_write_data_pages+0x84f/0x9a0
 do_writepages+0x130/0x3a0
 filemap_fdatawrite_wbc+0x87/0xa0
 file_write_and_wait_range+0x157/0x1c0
 f2fs_do_sync_file+0x206/0x12d0
 f2fs_sync_file+0x99/0xc0
 vfs_fsync_range+0x75/0x140
 f2fs_file_write_iter+0xd7b/0x1850
 vfs_write+0x645/0x780
 ksys_write+0xf1/0x1e0
 do_syscall_64+0x3b/0x90
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

As the previous commit changed atomic write way which new a cow_inode for
atomic write file, and also mark cow_inode as FI_ATOMIC_FILE.
When f2fs_do_write_data_page write cow_inode will use cow_inode's cow_inode
which is NULL. Then will trigger null-ptr-deref.
To solve above issue, don't mark cow_inode as FI_ATOMIC_FILE.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Ye Bin <yebin10@huawei.com>
Fiexes: 3db1de0e582c("f2fs: change the current atomic write way")
---
 fs/f2fs/f2fs.h    | 6 ++++++
 fs/f2fs/file.c    | 2 +-
 fs/f2fs/segment.c | 4 ++--
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ecd870e5d6da..3bc69bb36cb4 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -757,6 +757,7 @@ enum {
 	FI_ENABLE_COMPRESS,	/* enable compression in "user" compression mode */
 	FI_COMPRESS_RELEASED,	/* compressed blocks were released */
 	FI_ALIGNED_WRITE,	/* enable aligned write */
+	FI_COW_FILE,		/* indicate copy-on-write file for atomic write */
 	FI_MAX,			/* max flag, never be used */
 };
 
@@ -3236,6 +3237,11 @@ static inline bool f2fs_is_atomic_file(struct inode *inode)
 	return is_inode_flag_set(inode, FI_ATOMIC_FILE);
 }
 
+static inline bool f2fs_is_cow_file(struct inode *inode)
+{
+	return is_inode_flag_set(inode, FI_COW_FILE);
+}
+
 static inline bool f2fs_is_first_block_written(struct inode *inode)
 {
 	return is_inode_flag_set(inode, FI_FIRST_BLOCK_WRITTEN);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 8098ed890e94..9a3571e6f564 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2061,7 +2061,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
 
 	set_inode_flag(inode, FI_ATOMIC_FILE);
-	set_inode_flag(fi->cow_inode, FI_ATOMIC_FILE);
+	set_inode_flag(fi->cow_inode, FI_COW_FILE);
 	clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
 	f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 7b1d2c29aba6..f14c5a807312 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -193,7 +193,7 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
 	if (f2fs_is_atomic_file(inode)) {
 		if (clean)
 			truncate_inode_pages_final(inode->i_mapping);
-		clear_inode_flag(fi->cow_inode, FI_ATOMIC_FILE);
+		clear_inode_flag(fi->cow_inode, FI_COW_FILE);
 		iput(fi->cow_inode);
 		fi->cow_inode = NULL;
 		release_atomic_write_cnt(inode);
@@ -3172,7 +3172,7 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 			return CURSEG_COLD_DATA;
 		if (file_is_hot(inode) ||
 				is_inode_flag_set(inode, FI_HOT_DATA) ||
-				f2fs_is_atomic_file(inode))
+				f2fs_is_cow_file(inode))
 			return CURSEG_HOT_DATA;
 		return f2fs_rw_hint_to_seg_type(inode->i_write_hint);
 	} else {
-- 
2.37.1.455.g008518b4e5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
