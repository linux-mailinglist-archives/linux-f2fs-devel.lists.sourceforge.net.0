Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFBF50691F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Apr 2022 12:49:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nglQZ-0004Kx-6W; Tue, 19 Apr 2022 10:49:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <xuyang2018.jy@fujitsu.com>) id 1nglQX-0004Kq-Jv
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 10:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fz8SqrOoJRAH5VgPokOekSx4pC2GeAEfvOCpXEqbC9Q=; b=gYTJa4rNWyHzjs4BAyD5GPCLMF
 UuPBXiFOR4/tNIc7lZ9c/N4ASaWOzOXOhbFSOK2yYzCF1oBi8+DX+AMClNGleL1I88/eC3LHx3SZF
 pM7wgf5vLjpNou7/iwXX3wB+O9tDFxcob8ABOgalMXsx3xxmv+P2/oIWOGmWowFlRChk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fz8SqrOoJRAH5VgPokOekSx4pC2GeAEfvOCpXEqbC9Q=; b=HEX187mM6BZTM3vZID2KRpQ9cS
 kkD8VEGvbPSQAQ6JmgDykypRVtORv+UGHaVaHPyhR9qOk+nJDlpOB0iXdb/pl9M0qElc6NtvczzFS
 rFQ4J7mzr5dZSOmsOl4nEgymV8ezNDticWirXKSZGXff6iSfaJ6UjoEHQLDKHqpPLLF8=;
Received: from mail1.bemta34.messagelabs.com ([195.245.231.1])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nglQW-003kVB-86
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 10:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1650365376; i=@fujitsu.com;
 bh=Fz8SqrOoJRAH5VgPokOekSx4pC2GeAEfvOCpXEqbC9Q=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=tkOmuFrOFDuLZNUi6gI154M1rEx2njVP3wBRxNHLpwFSqetYkJ+wxyWOo5TioVf2X
 ciYpJ3bXpWCtVYXrTcK5zGxQgYX1WZCStU+p9c2KBperUraw9of1Pb6yfXV1FD5iQ4
 sMV8bLk565aYNXvmyFNpYkxJYu44q0ehWkkP3P1lqaTZWqCazPsz9+Eb0QRKhisloG
 RELs8UpkEDWZwH+QfVLbeQilI1nN/2795r7GjX/xGgt5IyiCjKsFuOcXNe+5Lz7Fto
 9O1idnVmDR8qRxif2WpQm7NkKEkYDMgNiI46sD3ECT3GSUv6LwryaMK4CTknT1azt9
 /frmTUwwGaeSw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPKsWRWlGSWpSXmKPExsViZ8MxSXf/5Lg
 kgx/brCxeH/7EaPHh5iQmi9NTzzJZbDl2j9Hi8hM+i5/LVrFbXFrkbrFn70kWiwsHTrNa7Pqz
 g91i5eOtTBbn/x5ndeDxOLVIwmPTqk42jxebZzJ67F7wmcnj8yY5j01P3jIFsEWxZuYl5Vcks
 GZ0d19hK2jxrti88StLA+My+y5GLg4hgS2MEqfbVrJ0MXICOQuYJE52CEEk9jBKbHw2nwkkwS
 agKfGscwEziC0ioCyx4MYxNpAiZoEzTBKXri1hBEkICyRILGs7ADaJRUBV4vyLL2BxXgEPiUd
 bDrCD2BICChJTHr4HG8Qp4Cmx8e17qM0eEtcPb2GGqBeUODnzCVicWUBC4uCLF8wQvYoSlzq+
 MULYFRKzZrUxQdhqElfPbWKewCg4C0n7LCTtCxiZVjFaJRVlpmeU5CZm5ugaGhjoGhqa6hob6
 5qb6CVW6SbqpZbqlqcWl+ga6SWWF+ulFhfrFVfmJuek6OWllmxiBMZXSrGi1w7GVyt+6h1ilO
 RgUhLlrY+KSxLiS8pPqcxILM6ILyrNSS0+xCjDwaEkwVs6ASgnWJSanlqRlpkDjHWYtAQHj5I
 I7+R+oDRvcUFibnFmOkTqFKMlx/md+/cyc6xtOAAk/376u5dZiCUvPy9VSpxXrAWoQQCkIaM0
 D24cLB1dYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMu3ES0BSezLwSuK2vgA5iAjqoekosy
 EEliQgpqQYmu4uVKvVTL5Wvu3M1z2CifFNO1u7N77bJNEy2vbTN6k2sx/mcuAl1P/R+a7m+Px
 UbxbChoCPxfdpnfbmon3OKmSftVPw2acck9sAHLAqllc1fu3hP3RNmTjhRkxry8VCbrn7BjFi
 vnJM/CzR3nNn4jfnLteVyGbGZL8pX1a30ar68/TXrxtcidppXRQ9suR7r9mpC8Y1Ln7dp7Yx7
 N5X9Ro210mQrJo7vN7TubA0T/Dz3fnP6p9ajjokng/7VMK2b2P7bd+Gb5m/nPsn9mygTqThD0
 rmnK0zvbpyHDhPbGoaAHT7++Uv2FjJPNzq896CxqnRE4qrDX5+f3nPL5rBJt+nLt1c/XZR5X5
 iyZNsqayWW4oxEQy3mouJEACUPgr7CAwAA
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-11.tower-571.messagelabs.com!1650365375!271969!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25071 invoked from network); 19 Apr 2022 10:49:35 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
 by server-11.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Apr 2022 10:49:35 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
 by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 73E15100441;
 Tue, 19 Apr 2022 11:49:35 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6601A10034F;
 Tue, 19 Apr 2022 11:49:35 +0100 (BST)
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Apr 2022 11:49:03 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <linux-fsdevel@vger.kernel.org>
Date: Tue, 19 Apr 2022 19:47:13 +0800
Message-ID: <1650368834-2420-7-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently, vfs only passes mode argument to filesystem, then
 use inode_init_owner() to strip S_ISGID. Some filesystem(ie ext4/btrfs) will
 call inode_init_owner firstly, then posxi acl setup, but xfs u [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [195.245.231.1 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [195.245.231.1 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nglQW-003kVB-86
Subject: [f2fs-dev] [PATCH v4 7/8] fs: strip file's S_ISGID mode on vfs
 instead of on underlying filesystem
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
Cc: linux-nfs@vger.kernel.org, Yang Xu <xuyang2018.jy@fujitsu.com>,
 djwong@kernel.org, david@fromorbit.com, brauner@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 viro@zeniv.linux.org.uk, jlayton@kernel.org, ceph-devel@vger.kernel.org,
 ntfs3@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Currently, vfs only passes mode argument to filesystem, then use inode_init_owner()
to strip S_ISGID. Some filesystem(ie ext4/btrfs) will call inode_init_owner
firstly, then posxi acl setup, but xfs uses the contrary order. It will affect
S_ISGID clear especially we filter S_IXGRP by umask or acl.

Regardless of which filesystem is in use, failure to strip the SGID correctly is
considered a security failure that needs to be fixed. The current VFS infrastructure
requires the filesystem to do everything right and not step on any landmines to
strip the SGID bit, when in fact it can easily be done at the VFS and the filesystems
then don't even need to be aware that the SGID needs to be (or has been stripped) by
the operation the user asked to be done.

Vfs has all the info it needs - it doesn't need the filesystems to do everything
correctly with the mode and ensuring that they order things like posix acl setup
functions correctly with inode_init_owner() to strip the SGID bit.

Just strip the SGID bit at the VFS, and then the filesystems can't get it wrong.

Also, the inode_sgid_strip() api should be used before IS_POSIXACL() because
this api may change mode.

Only the following places use inode_init_owner
"
arch/powerpc/platforms/cell/spufs/inode.c:      inode_init_owner(&init_user_ns, inode, dir, mode | S_IFDIR);
arch/powerpc/platforms/cell/spufs/inode.c:      inode_init_owner(&init_user_ns, inode, dir, mode | S_IFDIR);
fs/9p/vfs_inode.c:      inode_init_owner(&init_user_ns, inode, NULL, mode);
fs/bfs/dir.c:   inode_init_owner(&init_user_ns, inode, dir, mode);
fs/btrfs/inode.c:       inode_init_owner(mnt_userns, inode, dir, mode);
fs/btrfs/tests/btrfs-tests.c:   inode_init_owner(&init_user_ns, inode, NULL, S_IFREG);
fs/ext2/ialloc.c:               inode_init_owner(&init_user_ns, inode, dir, mode);
fs/ext4/ialloc.c:               inode_init_owner(mnt_userns, inode, dir, mode);
fs/f2fs/namei.c:        inode_init_owner(mnt_userns, inode, dir, mode);
fs/hfsplus/inode.c:     inode_init_owner(&init_user_ns, inode, dir, mode);
fs/hugetlbfs/inode.c:           inode_init_owner(&init_user_ns, inode, dir, mode);
fs/jfs/jfs_inode.c:     inode_init_owner(&init_user_ns, inode, parent, mode);
fs/minix/bitmap.c:      inode_init_owner(&init_user_ns, inode, dir, mode);
fs/nilfs2/inode.c:      inode_init_owner(&init_user_ns, inode, dir, mode);
fs/ntfs3/inode.c:       inode_init_owner(mnt_userns, inode, dir, mode);
fs/ocfs2/dlmfs/dlmfs.c:         inode_init_owner(&init_user_ns, inode, NULL, mode);
fs/ocfs2/dlmfs/dlmfs.c: inode_init_owner(&init_user_ns, inode, parent, mode);
fs/ocfs2/namei.c:       inode_init_owner(&init_user_ns, inode, dir, mode);
fs/omfs/inode.c:        inode_init_owner(&init_user_ns, inode, NULL, mode);
fs/overlayfs/dir.c:     inode_init_owner(&init_user_ns, inode, dentry->d_parent->d_inode, mode);
fs/ramfs/inode.c:               inode_init_owner(&init_user_ns, inode, dir, mode);
fs/reiserfs/namei.c:    inode_init_owner(&init_user_ns, inode, dir, mode);
fs/sysv/ialloc.c:       inode_init_owner(&init_user_ns, inode, dir, mode);
fs/ubifs/dir.c: inode_init_owner(&init_user_ns, inode, dir, mode);
fs/udf/ialloc.c:        inode_init_owner(&init_user_ns, inode, dir, mode);
fs/ufs/ialloc.c:        inode_init_owner(&init_user_ns, inode, dir, mode);
fs/xfs/xfs_inode.c:             inode_init_owner(mnt_userns, inode, dir, mode);
fs/zonefs/super.c:      inode_init_owner(&init_user_ns, inode, parent, S_IFDIR | 0555);
kernel/bpf/inode.c:     inode_init_owner(&init_user_ns, inode, dir, mode);
mm/shmem.c:             inode_init_owner(&init_user_ns, inode, dir, mode);
"

They are used in filesystem init new inode function and these init inode functions are used
by following operations:
mkdir
symlink
mknod
create
tmpfile
rename

We don't care about mkdir because we don't strip SGID bit for directory except fs.xfs.irix_sgid_inherit.
But we even call it in do_mkdirat() since inode_sgid_strip() will skip directories anyway. This will
enforce the same ordering for all relevant operations and it will make the code more uniform and
easier to understand by using new helper prepare_mode().

symlink and rename only use valid mode that doesn't have SGID bit.

We have added inode_sgid_strip api for the remaining operations.

In addition to the above six operations, four filesystems has a little difference
1) btrfs has btrfs_create_subvol_root to create new inode but used non SGID bit mode and can ignore
2) ocfs2 reflink function should add inode_sgid_strip api manually because we don't add it in vfs
3) spufs which doesn't really go hrough the regular VFS callpath because it has separate system call
spu_create, but it t only allows the creation of directories and only allows bits in 0777 and can ignore
4)bpf use vfs_mkobj in bpf_obj_do_pin with "S_IFREG | ((S_IRUSR | S_IWUSR) & ~current_umask()) mode and
use bpf_mkobj_ops in bpf_iter_link_pin_kernel with S_IFREG | S_IRUSR; , so bpf is also not affected

This patch also changed grpid behaviour for ext4/xfs because the mode passed to them may been
changed by inode_sgid_strip.

Also as Christian Brauner said"
The patch itself is useful as it would move a security sensitive operation that is currently burried in
individual filesystems into the vfs layer. But it has a decent regression  potential since it might strip
filesystems that have so far relied on getting the S_ISGID bit with a mode argument. So this needs a lot
of testing and long exposure in -next for at least one full kernel cycle."

Suggested-by: Dave Chinner <david@fromorbit.com>
Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 fs/inode.c         |  2 --
 fs/namei.c         | 22 +++++++++-------------
 fs/ocfs2/namei.c   |  1 +
 include/linux/fs.h |  9 +++++++++
 4 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index 3215e61a0021..0eb1dab99893 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2246,8 +2246,6 @@ void inode_init_owner(struct user_namespace *mnt_userns, struct inode *inode,
 		/* Directories are special, and always inherit S_ISGID */
 		if (S_ISDIR(mode))
 			mode |= S_ISGID;
-		else
-			inode_sgid_strip(mnt_userns, dir, &mode);
 	} else
 		inode_fsgid_set(inode, mnt_userns);
 	inode->i_mode = mode;
diff --git a/fs/namei.c b/fs/namei.c
index 73646e28fae0..f86614ab841f 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -3287,8 +3287,7 @@ static struct dentry *lookup_open(struct nameidata *nd, struct file *file,
 	if (open_flag & O_CREAT) {
 		if (open_flag & O_EXCL)
 			open_flag &= ~O_TRUNC;
-		if (!IS_POSIXACL(dir->d_inode))
-			mode &= ~current_umask();
+		prepare_mode(mnt_userns, dir->d_inode, &mode);
 		if (likely(got_write))
 			create_error = may_o_create(mnt_userns, &nd->path,
 						    dentry, mode);
@@ -3521,8 +3520,7 @@ struct dentry *vfs_tmpfile(struct user_namespace *mnt_userns,
 	child = d_alloc(dentry, &slash_name);
 	if (unlikely(!child))
 		goto out_err;
-	if (!IS_POSIXACL(dir))
-		mode &= ~current_umask();
+	prepare_mode(mnt_userns, dir, &mode);
 	error = dir->i_op->tmpfile(mnt_userns, dir, child, mode);
 	if (error)
 		goto out_err;
@@ -3850,13 +3848,12 @@ static int do_mknodat(int dfd, struct filename *name, umode_t mode,
 	if (IS_ERR(dentry))
 		goto out1;
 
-	if (!IS_POSIXACL(path.dentry->d_inode))
-		mode &= ~current_umask();
+	mnt_userns = mnt_user_ns(path.mnt);
+	prepare_mode(mnt_userns, path.dentry->d_inode, &mode);
 	error = security_path_mknod(&path, dentry, mode, dev);
 	if (error)
 		goto out2;
 
-	mnt_userns = mnt_user_ns(path.mnt);
 	switch (mode & S_IFMT) {
 		case 0: case S_IFREG:
 			error = vfs_create(mnt_userns, path.dentry->d_inode,
@@ -3943,6 +3940,7 @@ int do_mkdirat(int dfd, struct filename *name, umode_t mode)
 	struct path path;
 	int error;
 	unsigned int lookup_flags = LOOKUP_DIRECTORY;
+	struct user_namespace *mnt_userns;
 
 retry:
 	dentry = filename_create(dfd, name, &path, lookup_flags);
@@ -3950,15 +3948,13 @@ int do_mkdirat(int dfd, struct filename *name, umode_t mode)
 	if (IS_ERR(dentry))
 		goto out_putname;
 
-	if (!IS_POSIXACL(path.dentry->d_inode))
-		mode &= ~current_umask();
+	mnt_userns = mnt_user_ns(path.mnt);
+	prepare_mode(mnt_userns, path.dentry->d_inode, &mode);
 	error = security_path_mkdir(&path, dentry, mode);
-	if (!error) {
-		struct user_namespace *mnt_userns;
-		mnt_userns = mnt_user_ns(path.mnt);
+	if (!error)
 		error = vfs_mkdir(mnt_userns, path.dentry->d_inode, dentry,
 				  mode);
-	}
+
 	done_path_create(&path, dentry);
 	if (retry_estale(error, lookup_flags)) {
 		lookup_flags |= LOOKUP_REVAL;
diff --git a/fs/ocfs2/namei.c b/fs/ocfs2/namei.c
index c75fd54b9185..c81b8e0847aa 100644
--- a/fs/ocfs2/namei.c
+++ b/fs/ocfs2/namei.c
@@ -198,6 +198,7 @@ static struct inode *ocfs2_get_init_inode(struct inode *dir, umode_t mode)
 	if (S_ISDIR(mode))
 		set_nlink(inode, 2);
 	inode_init_owner(&init_user_ns, inode, dir, mode);
+	inode_sgid_strip(&init_user_ns, dir, &mode);
 	status = dquot_initialize(inode);
 	if (status)
 		return ERR_PTR(status);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 4a617aaab6f6..8c2f4cde974b 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3458,6 +3458,15 @@ static inline bool dir_relax_shared(struct inode *inode)
 	return !IS_DEADDIR(inode);
 }
 
+static inline void prepare_mode(struct user_namespace *mnt_userns,
+				const struct inode *dir, umode_t *mode)
+{
+	inode_sgid_strip(mnt_userns, dir, mode);
+
+	if (!IS_POSIXACL(dir))
+		*mode &= ~current_umask();
+}
+
 extern bool path_noexec(const struct path *path);
 extern void inode_nohighmem(struct inode *inode);
 
-- 
2.27.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
