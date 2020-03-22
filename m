Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACA118E7FB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 Mar 2020 11:14:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jFxcW-0004E0-E9; Sun, 22 Mar 2020 10:14:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1jFxcT-0004Cf-3e
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 22 Mar 2020 10:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FzIU/LTRkKOWj/gZluCklrVJSslK9qzfbotN6bEBdI8=; b=Nyz+5Krbntf5N8bOhveMK17FJ8
 fedcLYAz5AE/dll/f5edB1p38t36oxjsssgO27KgxhPoCwKYSfR/IW20vXM5Azgjn7Q0eUMO/Mnm5
 6tgzTTMwm+dfq66KfxehhxH3XOaKPKrywqPadWoPh9rObOzRf4/hQIqRnVUzNwuT4YYc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FzIU/LTRkKOWj/gZluCklrVJSslK9qzfbotN6bEBdI8=; b=h
 KFNWC3JTw719FFKBDo9SWamw/2Wkv2C60WcAYtkylVTlN/GbkLWpFe4dFLNM+rrFX67Usj/tMtE/o
 /5OS1AiNQwaS4YwaElkUa2liAg+V86aeNt2rwK0PeBlKFazNVx3MhAZrAMZXQ/UXa3ZA1Ev+JmSGQ
 chDqV+SdBUHHnEUg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jFxcL-00CUYr-GK
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 22 Mar 2020 10:14:13 +0000
Received: from localhost.localdomain (unknown [49.65.245.234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C9D720714;
 Sun, 22 Mar 2020 10:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584872034;
 bh=qY9djTHVMcBmEzN9Ipo6IH5R9rBsmSjSqKMdxBMQC1o=;
 h=From:To:Cc:Subject:Date:From;
 b=JFQ3bapbhpAGomNejw8wBGvtc6TB+wY0L5rdIUygbi+6IrbM8Zxn6YJFQN0EZlXAF
 ofTHqNSDSTNpoRjToBKXCwqBLY9UWwufS+4ILZn7OVtDO2wgNDUq/4sXh46jDJxP7o
 1QIezIEuI0pkM96ESAbsbpZaUDo0gvFWy+iFcgXc=
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 22 Mar 2020 18:13:27 +0800
Message-Id: <20200322101327.5979-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jFxcL-00CUYr-GK
Subject: [f2fs-dev] [PATCH] f2fs: fix potential .flags overflow on 32bit
 architecture
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

From: Chao Yu <yuchao0@huawei.com>

f2fs_inode_info.flags is unsigned long variable, it has 32 bits
in 32bit architecture, since we introduced FI_MMAP_FILE flag
when we support data compression, we may access memory cross
the border of .flags field, corrupting .i_sem field, result in
below deadlock.

To fix this issue, let's introduce .extra_flags to grab extra
space to store those new flags.

Call Trace:
 __schedule+0x8d0/0x13fc
 ? mark_held_locks+0xac/0x100
 schedule+0xcc/0x260
 rwsem_down_write_slowpath+0x3ab/0x65d
 down_write+0xc7/0xe0
 f2fs_drop_nlink+0x3d/0x600 [f2fs]
 f2fs_delete_inline_entry+0x300/0x440 [f2fs]
 f2fs_delete_entry+0x3a1/0x7f0 [f2fs]
 f2fs_unlink+0x500/0x790 [f2fs]
 vfs_unlink+0x211/0x490
 do_unlinkat+0x483/0x520
 sys_unlink+0x4a/0x70
 do_fast_syscall_32+0x12b/0x683
 entry_SYSENTER_32+0xaa/0x102

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/f2fs.h  | 26 ++++++++++++++++++++------
 fs/f2fs/inode.c |  1 +
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index fcafa68212eb..fcd22df2e9ca 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -695,6 +695,7 @@ struct f2fs_inode_info {
 
 	/* Use below internally in f2fs*/
 	unsigned long flags;		/* use to pass per-file flags */
+	unsigned long extra_flags;	/* extra flags */
 	struct rw_semaphore i_sem;	/* protect fi info */
 	atomic_t dirty_pages;		/* # of dirty pages */
 	f2fs_hash_t chash;		/* hash value of given file name */
@@ -2569,7 +2570,7 @@ enum {
 };
 
 static inline void __mark_inode_dirty_flag(struct inode *inode,
-						int flag, bool set)
+					unsigned long long flag, bool set)
 {
 	switch (flag) {
 	case FI_INLINE_XATTR:
@@ -2588,20 +2589,33 @@ static inline void __mark_inode_dirty_flag(struct inode *inode,
 
 static inline void set_inode_flag(struct inode *inode, int flag)
 {
-	if (!test_bit(flag, &F2FS_I(inode)->flags))
-		set_bit(flag, &F2FS_I(inode)->flags);
+	if ((1 << flag) <= sizeof(unsigned long)) {
+		if (!test_bit(flag, &F2FS_I(inode)->flags))
+			set_bit(flag, &F2FS_I(inode)->flags);
+	} else {
+		if (!test_bit(flag - 32, &F2FS_I(inode)->extra_flags))
+			set_bit(flag - 32, &F2FS_I(inode)->extra_flags);
+	}
 	__mark_inode_dirty_flag(inode, flag, true);
 }
 
 static inline int is_inode_flag_set(struct inode *inode, int flag)
 {
-	return test_bit(flag, &F2FS_I(inode)->flags);
+	if ((1 << flag) <= sizeof(unsigned long))
+		return test_bit(flag, &F2FS_I(inode)->flags);
+	else
+		return test_bit(flag - 32, &F2FS_I(inode)->extra_flags);
 }
 
 static inline void clear_inode_flag(struct inode *inode, int flag)
 {
-	if (test_bit(flag, &F2FS_I(inode)->flags))
-		clear_bit(flag, &F2FS_I(inode)->flags);
+	if ((1 << flag) <= sizeof(unsigned long)) {
+		if (test_bit(flag, &F2FS_I(inode)->flags))
+			clear_bit(flag, &F2FS_I(inode)->flags);
+	} else {
+		if (test_bit(flag - 32, &F2FS_I(inode)->extra_flags))
+			clear_bit(flag - 32, &F2FS_I(inode)->extra_flags);
+	}
 	__mark_inode_dirty_flag(inode, flag, false);
 }
 
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 44e08bf2e2b4..ca924d7e0e30 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -363,6 +363,7 @@ static int do_read_inode(struct inode *inode)
 	if (S_ISREG(inode->i_mode))
 		fi->i_flags &= ~F2FS_PROJINHERIT_FL;
 	fi->flags = 0;
+	fi->extra_flags = 0;
 	fi->i_advise = ri->i_advise;
 	fi->i_pino = le32_to_cpu(ri->i_pino);
 	fi->i_dir_level = ri->i_dir_level;
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
