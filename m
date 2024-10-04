Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A439990E7A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Oct 2024 21:36:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1swo5f-00007Y-IR;
	Fri, 04 Oct 2024 19:35:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1swo5e-00007S-N6
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Oct 2024 19:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y7KmctlMl6oLEqEYUVZmUVveOuDoKLcy7F1Q1ASwnzI=; b=lKcKHQ+kchhIWs/GclPUMQ4rS4
 t4a1sIqEMAMZQT9Nluan5/ZjG8WY/q535kOxt0O1d8tyCOsAR5jBX6wLEzNyRfDF2tU0yfZHSqxZq
 rQHrjteV2rPLOCjW8hvRUPVCN7WV8GqL1r3ZS5Ph7eLvEU/KGG9+1pOBDMC/tJ+YXbkA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=y7KmctlMl6oLEqEYUVZmUVveOuDoKLcy7F1Q1ASwnzI=; b=U
 eJmt/K3F6j1ybjYTmF3iDlg7z3hlE2BnQGtktk9s4+U8ODru+EUKyp2Gpfxk6N7Ctp9izJMONY/jp
 sj6MHnxKH1NX0hr8OeVa+WWL136QcoRST4P9bUckgKtBBrqAt0vp2dXkHzUEi645XtHYpcJ4v74lZ
 0TDFx5gn2CddU4bE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1swo5d-0001lJ-Cy for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Oct 2024 19:35:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DC3E95C3D04;
 Fri,  4 Oct 2024 19:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FD9C4CEC6;
 Fri,  4 Oct 2024 19:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728070543;
 bh=FbIVHiY/rbg7WqDXDZGXK07+PNJJ+HGQxWp38nW2jbY=;
 h=From:To:Cc:Subject:Date:From;
 b=qmdjtxXKzU3KqRiKfmWuYdRtSEELcgbzOSwoMg0FXkUFegim+lyNOMDzuyPhoeBLT
 5QoVD4Akkozb9UUUwueCd7QbQ9qTkcSrGsMXoZqspwEDd2EgdTfS2R/y6v5aZWDp8C
 5oqlDQ6UUj6HWXwGY9nwpS2MVsr0IBb1FdVzgKZ2Q8fqhpClWMAdu9WJeQLq5F0k98
 rYbVURbRmHK71i/lzH/Yn6SpLqRtFM//J5NkYxFSDyvzjH2+TubvphPgU8jRUgNQ7S
 f33g87h81S0Fm2aWDDesI7oAAWDF7neK5vrLDnJ/sf7gHfjWHt+iPxzxxnCxTxoKBX
 QWw5q4eoVl39g==
To: stable@vger.kernel.org
Date: Fri,  4 Oct 2024 19:34:41 +0000
Message-ID: <20241004193442.189774-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Jann Horn <jannh@google.com> commit
 4f5a100f87f32cb65d4bb1ad282a08c92f6f591e
 upstream. The F2FS ioctls for starting and committing atomic writes check
 for inode_owner_or_capable(), but this does not give LSMs like SELinux or
 Landlock an opportunity to deny the write access - if the call [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1swo5d-0001lJ-Cy
Subject: [f2fs-dev] [PATCH 6.1] f2fs: Require FMODE_WRITE for atomic write
 ioctls
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Jann Horn <jannh@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jann Horn <jannh@google.com>

commit 4f5a100f87f32cb65d4bb1ad282a08c92f6f591e upstream.

The F2FS ioctls for starting and committing atomic writes check for
inode_owner_or_capable(), but this does not give LSMs like SELinux or
Landlock an opportunity to deny the write access - if the caller's FSUID
matches the inode's UID, inode_owner_or_capable() immediately returns true.

There are scenarios where LSMs want to deny a process the ability to write
particular files, even files that the FSUID of the process owns; but this
can currently partially be bypassed using atomic write ioctls in two ways:

 - F2FS_IOC_START_ATOMIC_REPLACE + F2FS_IOC_COMMIT_ATOMIC_WRITE can
   truncate an inode to size 0
 - F2FS_IOC_START_ATOMIC_WRITE + F2FS_IOC_ABORT_ATOMIC_WRITE can revert
   changes another process concurrently made to a file

Fix it by requiring FMODE_WRITE for these operations, just like for
F2FS_IOC_MOVE_RANGE. Since any legitimate caller should only be using these
ioctls when intending to write into the file, that seems unlikely to break
anything.

Fixes: 88b88a667971 ("f2fs: support atomic writes")
Cc: stable@vger.kernel.org
Signed-off-by: Jann Horn <jannh@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>
Reviewed-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/file.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 62f2521cd955e..2982cc5b37d78 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2103,10 +2103,13 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct inode *pinode;
 	loff_t isize;
 	int ret;
 
+	if (!(filp->f_mode & FMODE_WRITE))
+		return -EBADF;
+
 	if (!inode_owner_or_capable(mnt_userns, inode))
 		return -EACCES;
 
 	if (!S_ISREG(inode->i_mode))
 		return -EINVAL;
@@ -2200,10 +2203,13 @@ static int f2fs_ioc_commit_atomic_write(struct file *filp)
 {
 	struct inode *inode = file_inode(filp);
 	struct user_namespace *mnt_userns = file_mnt_user_ns(filp);
 	int ret;
 
+	if (!(filp->f_mode & FMODE_WRITE))
+		return -EBADF;
+
 	if (!inode_owner_or_capable(mnt_userns, inode))
 		return -EACCES;
 
 	ret = mnt_want_write_file(filp);
 	if (ret)
@@ -2232,10 +2238,13 @@ static int f2fs_ioc_abort_atomic_write(struct file *filp)
 {
 	struct inode *inode = file_inode(filp);
 	struct user_namespace *mnt_userns = file_mnt_user_ns(filp);
 	int ret;
 
+	if (!(filp->f_mode & FMODE_WRITE))
+		return -EBADF;
+
 	if (!inode_owner_or_capable(mnt_userns, inode))
 		return -EACCES;
 
 	ret = mnt_want_write_file(filp);
 	if (ret)

base-commit: aa4cd140bba57b7064b4c7a7141bebd336d32087
-- 
2.47.0.rc0.187.ge670bccf7e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
