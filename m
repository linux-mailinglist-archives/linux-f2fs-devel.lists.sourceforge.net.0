Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 346BE990E9B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Oct 2024 21:38:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1swo8P-0006SS-FC;
	Fri, 04 Oct 2024 19:38:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1swo8E-0006SG-Si
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Oct 2024 19:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Sb3lPkt+k7m2wTq2Ip6+LEM4dF2OQKPINdtDlqi7wyc=; b=RjafUQXNrEMKkEtjBvXhxjWs4g
 jMvCHCl1edwaQGSlsx9En12AJYz9dqnWhnAMZReQZpECx8ndTTdxra59FXB8eRkbvSVNrjkWRUAYI
 rr8o4JC++cXPlRO0vBVOOZNujb7c5z4AdEyha7G/f5PxXPCfKtFx46PPWi223dfhha/4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Sb3lPkt+k7m2wTq2Ip6+LEM4dF2OQKPINdtDlqi7wyc=; b=a
 Rmldx4tHqFJNCiRPvB+ir8XQ+n1iDqa5yUE3Zc1DzeKVb16jOftiJdib9IGdmR19mpiHVlMFz60sh
 StmZOwDpP+cm9g2Mjkiiar5JeKr8BxX40T3rCtklxxLiR/8VeRO1vsTVCzKRLQxdzI1xkDw+K7n1N
 J752157/Pw2Kdbr0=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1swo8E-0001xz-4Y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Oct 2024 19:38:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E134AA44D37;
 Fri,  4 Oct 2024 19:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B17C4CEC6;
 Fri,  4 Oct 2024 19:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728070699;
 bh=61RQvFcZxzV9OxImIeIelFCFhkqbd3Cj4t5qAiz9/sI=;
 h=From:To:Cc:Subject:Date:From;
 b=r2kPVUQ4XwGGJKM+skMfeVurKpxby7+wO9mD331QKrzj1NAt8Vyb+o7NN8/Um5Bxw
 u379T9rbZWrl1jfnBkiMJZbpk7RWsPWOqOLbELtwEzmL5oOo9WQH8nSq7fl1eE3J0v
 v4DBcJRvJvtKIkU5nGp8ySDAx4fcMGbUI6FqIKEHFSh+oGF7FI5Xk/SGUSWOaDFsMz
 KKEoprwqDHe0YhCpW8QJrR7t2s3T3PLUTSF3Yd3aZ6tjybKW478qOajUzsgaHmHx+8
 Mo8HZvo1CnBQhIDxJ1alVltpPytX77hGbce91aKYhht+oiP7Z+67PwxuD/9RbLEWXm
 PudRvR5EMN8Qg==
To: stable@vger.kernel.org
Date: Fri,  4 Oct 2024 19:37:49 +0000
Message-ID: <20241004193749.190266-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
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
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
X-Headers-End: 1swo8E-0001xz-4Y
Subject: [f2fs-dev] [PATCH 4.19] f2fs: Require FMODE_WRITE for atomic write
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
 fs/f2fs/file.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 043ce96ac1270..0cc2f41e81243 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1709,10 +1709,13 @@ static int f2fs_ioc_getversion(struct file *filp, unsigned long arg)
 static int f2fs_ioc_start_atomic_write(struct file *filp)
 {
 	struct inode *inode = file_inode(filp);
 	int ret;
 
+	if (!(filp->f_mode & FMODE_WRITE))
+		return -EBADF;
+
 	if (!inode_owner_or_capable(inode))
 		return -EACCES;
 
 	if (!S_ISREG(inode->i_mode))
 		return -EINVAL;
@@ -1766,10 +1769,13 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 static int f2fs_ioc_commit_atomic_write(struct file *filp)
 {
 	struct inode *inode = file_inode(filp);
 	int ret;
 
+	if (!(filp->f_mode & FMODE_WRITE))
+		return -EBADF;
+
 	if (!inode_owner_or_capable(inode))
 		return -EACCES;
 
 	ret = mnt_want_write_file(filp);
 	if (ret)
@@ -1811,10 +1817,13 @@ static int f2fs_ioc_commit_atomic_write(struct file *filp)
 static int f2fs_ioc_start_volatile_write(struct file *filp)
 {
 	struct inode *inode = file_inode(filp);
 	int ret;
 
+	if (!(filp->f_mode & FMODE_WRITE))
+		return -EBADF;
+
 	if (!inode_owner_or_capable(inode))
 		return -EACCES;
 
 	if (!S_ISREG(inode->i_mode))
 		return -EINVAL;
@@ -1846,10 +1855,13 @@ static int f2fs_ioc_start_volatile_write(struct file *filp)
 static int f2fs_ioc_release_volatile_write(struct file *filp)
 {
 	struct inode *inode = file_inode(filp);
 	int ret;
 
+	if (!(filp->f_mode & FMODE_WRITE))
+		return -EBADF;
+
 	if (!inode_owner_or_capable(inode))
 		return -EACCES;
 
 	ret = mnt_want_write_file(filp);
 	if (ret)
@@ -1875,10 +1887,13 @@ static int f2fs_ioc_release_volatile_write(struct file *filp)
 static int f2fs_ioc_abort_volatile_write(struct file *filp)
 {
 	struct inode *inode = file_inode(filp);
 	int ret;
 
+	if (!(filp->f_mode & FMODE_WRITE))
+		return -EBADF;
+
 	if (!inode_owner_or_capable(inode))
 		return -EACCES;
 
 	ret = mnt_want_write_file(filp);
 	if (ret)

base-commit: de2cffe297563c815c840cfa14b77a0868b61e53
-- 
2.47.0.rc0.187.ge670bccf7e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
