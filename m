Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8B3781618
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 19 Aug 2023 02:30:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qX9rJ-0003bP-So;
	Sat, 19 Aug 2023 00:30:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qX9rI-0003bD-5x
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 19 Aug 2023 00:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QkUxYrN2zGgXnxJPpsHfd1pmHMjPNzm6jNkumTf/io4=; b=BWgPnhjARlZCuJTfgkbToAFGF4
 UnrHBXigUR610UxqyJe77NE6X1U7Bmiw8vlhTnDficbEFjZnGIp7KE4YDVE3rgLe8ZY8MVnPyBb4F
 9WMyJPGLzZV/p18nx8crbeRpS/k/h0GRuBhlaMRHsIoDTopp0KPCz/zv2+Saa0HDVj54=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QkUxYrN2zGgXnxJPpsHfd1pmHMjPNzm6jNkumTf/io4=; b=c
 q1G+mDNj64IymurP2DAiu7PX5sDoa9xUD7cd5hbR0U/re2k1oXemNafcN93SDO3fH+0oP5ehTZmRi
 12DgtSbpcHf1lZ7gX7MXXcarHhdptsCrk9sSBcWn2dALR36Eo9iZN3Vx9F5p6mfeSHQtZD2XrqNRJ
 ANGRqA8n+mKqA9r8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qX9rF-0001c5-3M for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 19 Aug 2023 00:30:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6AC8D62C42;
 Sat, 19 Aug 2023 00:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBE5C433C7;
 Sat, 19 Aug 2023 00:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692405014;
 bh=loHLBJTplHSzjTMzYqPI5s+M0gIJEHIdkekccoZcWr4=;
 h=From:To:Cc:Subject:Date:From;
 b=QDERvJKUOLBGJ30NnycmV/PQw/9dadQAkw0mGGW9nIT5qqwJAvrPA1I8qWVKcw7ks
 ZbVH1hhQs9j0zk22izyjzMJV9hfgatslK4jTq6y/DKWsRKFcL/s6n7kufi87+AAca2
 oHXeZoCzC7P+CUIoPXZbZ7YYwydEDI/MO8A8wfLzpdSpNX+kNnkFvWNd4u6RRs3+bJ
 La1MU7P+3ToQzQErM874yH8LFZ1K0WRx69yTNRUV0BCFcNYvNiG0KZVBzG4j/30Sjy
 Xn265qkiOWBCFHdCq+6g/bHMKSmH7uQ6p/wxhdxlO/emBBTkvWMbBplhuchycgOd7U
 D7W6Rk6xZiVug==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 18 Aug 2023 17:30:12 -0700
Message-ID: <20230819003012.3473675-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: ======================================================
 WARNING: possible circular locking dependency detected
 6.5.0-rc5-syzkaller-00353-gae545c3283dc #0 Not tainted [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qX9rF-0001c5-3M
Subject: [f2fs-dev] [PATCH] f2fs: avoid false alarm of circular locking
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
Cc: syzbot+e5600587fa9cbf8e3826@syzkaller.appspotmail.com,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

======================================================
WARNING: possible circular locking dependency detected
6.5.0-rc5-syzkaller-00353-gae545c3283dc #0 Not tainted
------------------------------------------------------
syz-executor273/5027 is trying to acquire lock:
ffff888077fe1fb0 (&fi->i_sem){+.+.}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2133 [inline]
ffff888077fe1fb0 (&fi->i_sem){+.+.}-{3:3}, at: f2fs_add_inline_entry+0x300/0x6f0 fs/f2fs/inline.c:644

but task is already holding lock:
ffff888077fe07c8 (&fi->i_xattr_sem){.+.+}-{3:3}, at: f2fs_down_read fs/f2fs/f2fs.h:2108 [inline]
ffff888077fe07c8 (&fi->i_xattr_sem){.+.+}-{3:3}, at: f2fs_add_dentry+0x92/0x230 fs/f2fs/dir.c:783

which lock already depends on the new lock.

the existing dependency chain (in reverse order) is:

-> #1 (&fi->i_xattr_sem){.+.+}-{3:3}:
       down_read+0x9c/0x470 kernel/locking/rwsem.c:1520
       f2fs_down_read fs/f2fs/f2fs.h:2108 [inline]
       f2fs_getxattr+0xb1e/0x12c0 fs/f2fs/xattr.c:532
       __f2fs_get_acl+0x5a/0x900 fs/f2fs/acl.c:179
       f2fs_acl_create fs/f2fs/acl.c:377 [inline]
       f2fs_init_acl+0x15c/0xb30 fs/f2fs/acl.c:420
       f2fs_init_inode_metadata+0x159/0x1290 fs/f2fs/dir.c:558
       f2fs_add_regular_entry+0x79e/0xb90 fs/f2fs/dir.c:740
       f2fs_add_dentry+0x1de/0x230 fs/f2fs/dir.c:788
       f2fs_do_add_link+0x190/0x280 fs/f2fs/dir.c:827
       f2fs_add_link fs/f2fs/f2fs.h:3554 [inline]
       f2fs_mkdir+0x377/0x620 fs/f2fs/namei.c:781
       vfs_mkdir+0x532/0x7e0 fs/namei.c:4117
       do_mkdirat+0x2a9/0x330 fs/namei.c:4140
       __do_sys_mkdir fs/namei.c:4160 [inline]
       __se_sys_mkdir fs/namei.c:4158 [inline]
       __x64_sys_mkdir+0xf2/0x140 fs/namei.c:4158
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #0 (&fi->i_sem){+.+.}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3142 [inline]
       check_prevs_add kernel/locking/lockdep.c:3261 [inline]
       validate_chain kernel/locking/lockdep.c:3876 [inline]
       __lock_acquire+0x2e3d/0x5de0 kernel/locking/lockdep.c:5144
       lock_acquire kernel/locking/lockdep.c:5761 [inline]
       lock_acquire+0x1ae/0x510 kernel/locking/lockdep.c:5726
       down_write+0x93/0x200 kernel/locking/rwsem.c:1573
       f2fs_down_write fs/f2fs/f2fs.h:2133 [inline]
       f2fs_add_inline_entry+0x300/0x6f0 fs/f2fs/inline.c:644
       f2fs_add_dentry+0xa6/0x230 fs/f2fs/dir.c:784
       f2fs_do_add_link+0x190/0x280 fs/f2fs/dir.c:827
       f2fs_add_link fs/f2fs/f2fs.h:3554 [inline]
       f2fs_mkdir+0x377/0x620 fs/f2fs/namei.c:781
       vfs_mkdir+0x532/0x7e0 fs/namei.c:4117
       ovl_do_mkdir fs/overlayfs/overlayfs.h:196 [inline]
       ovl_mkdir_real+0xb5/0x370 fs/overlayfs/dir.c:146
       ovl_workdir_create+0x3de/0x820 fs/overlayfs/super.c:309
       ovl_make_workdir fs/overlayfs/super.c:711 [inline]
       ovl_get_workdir fs/overlayfs/super.c:864 [inline]
       ovl_fill_super+0xdab/0x6180 fs/overlayfs/super.c:1400
       vfs_get_super+0xf9/0x290 fs/super.c:1152
       vfs_get_tree+0x88/0x350 fs/super.c:1519
       do_new_mount fs/namespace.c:3335 [inline]
       path_mount+0x1492/0x1ed0 fs/namespace.c:3662
       do_mount fs/namespace.c:3675 [inline]
       __do_sys_mount fs/namespace.c:3884 [inline]
       __se_sys_mount fs/namespace.c:3861 [inline]
       __x64_sys_mount+0x293/0x310 fs/namespace.c:3861
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  rlock(&fi->i_xattr_sem);
                               lock(&fi->i_sem);
                               lock(&fi->i_xattr_sem);
  lock(&fi->i_sem);

Reported-and-tested-by: syzbot+e5600587fa9cbf8e3826@syzkaller.appspotmail.com
Fixes: 5eda1ad1aaff "f2fs: fix deadlock in i_xattr_sem and inode page lock"
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/f2fs.h   | 24 +++++++++++++++---------
 fs/f2fs/inline.c |  3 ++-
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c602ff2403b6..c0b7417f1d87 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2122,15 +2122,6 @@ static inline int f2fs_down_read_trylock(struct f2fs_rwsem *sem)
 	return down_read_trylock(&sem->internal_rwsem);
 }
 
-#ifdef CONFIG_DEBUG_LOCK_ALLOC
-static inline void f2fs_down_read_nested(struct f2fs_rwsem *sem, int subclass)
-{
-	down_read_nested(&sem->internal_rwsem, subclass);
-}
-#else
-#define f2fs_down_read_nested(sem, subclass) f2fs_down_read(sem)
-#endif
-
 static inline void f2fs_up_read(struct f2fs_rwsem *sem)
 {
 	up_read(&sem->internal_rwsem);
@@ -2141,6 +2132,21 @@ static inline void f2fs_down_write(struct f2fs_rwsem *sem)
 	down_write(&sem->internal_rwsem);
 }
 
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+static inline void f2fs_down_read_nested(struct f2fs_rwsem *sem, int subclass)
+{
+	down_read_nested(&sem->internal_rwsem, subclass);
+}
+
+static inline void f2fs_down_write_nested(struct f2fs_rwsem *sem, int subclass)
+{
+	down_write_nested(&sem->internal_rwsem, subclass);
+}
+#else
+#define f2fs_down_read_nested(sem, subclass) f2fs_down_read(sem)
+#define f2fs_down_write_nested(sem, subclass) f2fs_down_write(sem)
+#endif
+
 static inline int f2fs_down_write_trylock(struct f2fs_rwsem *sem)
 {
 	return down_write_trylock(&sem->internal_rwsem);
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 4638fee16a91..0d185ad5e469 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -641,7 +641,8 @@ int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
 	}
 
 	if (inode) {
-		f2fs_down_write(&F2FS_I(inode)->i_sem);
+		f2fs_down_write_nested(&F2FS_I(inode)->i_sem,
+						SINGLE_DEPTH_NESTING);
 		page = f2fs_init_inode_metadata(inode, dir, fname, ipage);
 		if (IS_ERR(page)) {
 			err = PTR_ERR(page);
-- 
2.42.0.rc1.204.g551eb34607-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
