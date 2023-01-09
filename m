Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5134D661CCD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Jan 2023 04:45:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pEj6F-0006HL-4l;
	Mon, 09 Jan 2023 03:45:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pEj6D-0006H7-6e
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jan 2023 03:45:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BdLqJeLtzpNkFpkUgEU+4QDrBz/bontDoMJt5v1nsWQ=; b=jtMfEKmyETlRU9pGXG6ksnHNmf
 L5Uo5CRO28Ed6DNl1luZlBDS3wTvCHLSFis5MNHMw6AVFuNJBs1HOqUf8HVMStghMK+yuBhkM5O1m
 8FB+a6Fplz00Joy4ueSszg1Wmnw6Apvm9Jttn1yf/duYj1foiuCoAesugnY731IZRQt0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BdLqJeLtzpNkFpkUgEU+4QDrBz/bontDoMJt5v1nsWQ=; b=HqEoll8ek2w4rL8IE9K3PRgqCr
 CSkGJYLPufKuiMnk3NBGcNbmsDyb7oLbKYTUV7wKP+7HJXmjl/DxC8aihj3M+DLM064ljnLoUMKjX
 DdGF/wLnmhzp048/wOpAEbCndxyP1uzaqtIKZceXmzBuAa38wZCik7JRNcvdcKkNLP00=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pEj6B-0003Wa-E9 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jan 2023 03:45:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 05EA860EE9;
 Mon,  9 Jan 2023 03:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F702C433F2;
 Mon,  9 Jan 2023 03:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673235917;
 bh=p3rbTOR1QFjXLaPSnR9uaBLuFIGzPk439CwPaP0U//8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=usr0EL8S2TWfVQj+6ygM2g8ntOS+6+nOYBoOMFpmSClbP1nd1kNQp7S0NZOFyUCNs
 k2HR7uMtEeEmp/KhHGsdYqzmficO41WyG+xvUemkT6xd84HnuKBzV/4Xfi2dJT0z4i
 dMa7uGrneuB8tYADOtTa07DJDdXbNYBoDFtdTdL0CBA2yvp5YnleqCg3GSwv2DmxyQ
 QkkSp9uRuKu7VHPhSnMJtuQx5DD8x37MVu9xe2Hndbhn6e+gIVTpFzufWGr3LOuvGC
 Qr1b7CW/u8GPRXJRMSIgx2+ptZfrdPBBj4WN0rLjQuXO3O1tdu/ZqfSJVkY7yVvQnS
 e1Av9wykN6wnw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon,  9 Jan 2023 11:44:52 +0800
Message-Id: <20230109034453.490176-4-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230109034453.490176-1-chao@kernel.org>
References: <20230109034453.490176-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Syzbot reports a kernel panic as below: kernel BUG at
 fs/inode.c:1763!
 RIP: 0010:iput+0x68/0x80 fs/inode.c:1763 Call Trace:
 f2fs_abort_atomic_write+0xea/0x4f0
 fs/f2fs/segment.c:196 f2fs_ioc_commit_atomic_write+0x19f/0x260
 fs/f2fs/file.c:215 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pEj6B-0003Wa-E9
Subject: [f2fs-dev] [PATCH 4/5] f2fs: fix to avoid race condition of
 f2fs_abort_atomic_write()
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
Cc: syzbot+9b7be0f1263ed2dbfbba@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Syzbot reports a kernel panic as below:

kernel BUG at fs/inode.c:1763!
RIP: 0010:iput+0x68/0x80 fs/inode.c:1763
Call Trace:
 f2fs_abort_atomic_write+0xea/0x4f0 fs/f2fs/segment.c:196
 f2fs_ioc_commit_atomic_write+0x19f/0x260 fs/f2fs/file.c:2157
 __f2fs_ioctl+0x26f0/0xaaf0 fs/f2fs/file.c:4154
 f2fs_ioctl+0x18e/0x220 fs/f2fs/file.c:4242
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __x64_sys_ioctl+0x197/0x210 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

The root cause is there may be race case in between f2fs_abort_atomic_write()
called from f2fs_file_flush() and f2fs_ioc_commit_atomic_write().

Thread A				Thread B
- close
 - close_fd
  - filp_close
   - f2fs_file_flush
					- f2fs_ioctl
					 - f2fs_ioc_commit_atomic_write
					  - f2fs_abort_atomic_write
					   - iput(cow_inode)
					    - f2fs_evict_inode
					     - clear_inode
					      - inode->i_state = I_FREEING | I_CLEAR;
    - f2fs_abort_atomic_write
     - iput(cow_inode)
      - BUG_ON(inode->i_state & I_CLEAR)
					   - cow_inode = NULL
     - cow_inode = NULL

So let's cover f2fs_abort_atomic_write() with f2fs_inode_info.i_atomic_sem
lock to avoid this race condition.

Reported-by: syzbot+9b7be0f1263ed2dbfbba@syzkaller.appspotmail.com
Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h    | 1 +
 fs/f2fs/segment.c | 6 +++++-
 fs/f2fs/super.c   | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 70ed01aca6f6..fa41c0dad308 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -854,6 +854,7 @@ struct f2fs_inode_info {
 	struct extent_tree *extent_tree[NR_EXTENT_CACHES];
 					/* cached extent_tree entry */
 	struct inode *cow_inode;	/* copy-on-write inode for atomic write */
+	struct f2fs_rwsem i_atomic_sem;	/* protect atomic write context */
 
 	/* avoid racing between foreground op and gc */
 	struct f2fs_rwsem i_gc_rwsem[2];
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 5f7e42b355eb..245d7adef6c6 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -189,8 +189,10 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
 {
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 
+	f2fs_down_write(&fi->i_atomic_sem);
+
 	if (!f2fs_is_atomic_file(inode))
-		return;
+		goto out_unlock;
 
 	clear_inode_flag(fi->cow_inode, FI_COW_FILE);
 	iput(fi->cow_inode);
@@ -208,6 +210,8 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
 		f2fs_i_size_write(inode, fi->original_i_size);
 		fi->original_i_size = 0;
 	}
+out_unlock:
+	f2fs_up_write(&fi->i_atomic_sem);
 }
 
 static int __replace_atomic_write_block(struct inode *inode, pgoff_t index,
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 0e8b3e27fa14..3edc8630eb4b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1411,6 +1411,7 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
 	init_f2fs_rwsem(&fi->i_gc_rwsem[READ]);
 	init_f2fs_rwsem(&fi->i_gc_rwsem[WRITE]);
 	init_f2fs_rwsem(&fi->i_xattr_sem);
+	init_f2fs_rwsem(&fi->i_atomic_sem);
 
 	/* Will be used by directory only */
 	fi->i_dir_level = F2FS_SB(sb)->dir_level;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
