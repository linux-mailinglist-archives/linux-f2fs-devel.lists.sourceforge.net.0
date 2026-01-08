Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C2BD04C4A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:14:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnQRQv45MAcNJoKzWLqH0kQYIEnKV2rwrWlgeWhAvRQ=; b=RE6/0Z/GtQKt/qC5S5fVoWvIuC
	rTuRXvCoblanyiF4GSydG4EH80NSGEPjrcA72Q/uHKLu3NoDTlHD/0YjvAbHeaB/DD3cI8E6laCW3
	1ciOB9OmDd8fkAPvFRzc0iHOezLL7Aa5t13LaiNi2IRk2kJEN3P1AypLSPDH/AVeJ7gs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdtaF-0008B7-G2;
	Thu, 08 Jan 2026 17:14:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vdta7-0008AL-Tn;
 Thu, 08 Jan 2026 17:13:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+RuAZBJ1oaIr11Ri/QyKum/SHXSmRYb3aBEBbC54Mgw=; b=PqOTCtkDdjvSXsIMfEAqRZ2wyL
 VFJYdPI0mC4pLYy4Y2biphyjXZStYqPRomuzrulDBPQknntnR0V0/s3lGW2su2zj8FwwCVoo24hxz
 XDW4XOr9+wwwXyUBU6A5tJ/6KtYUZyxFsC1KW/EIkezfUxRueDFdppW5AQvWiQ8hvnGU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+RuAZBJ1oaIr11Ri/QyKum/SHXSmRYb3aBEBbC54Mgw=; b=NqmGHLYCsJ3Uu2rrjfDj63Ttum
 OO8oaTYgsEY0GmqD6lQTvvQ9K0Zk+DudN2tYQoHpwhBrgtuXbk6xdJDjtZXp/MHWHvtWsfyPBY0Oc
 59Kni0MmzBJB2cpI7YoLl/Qp9CQvtBFqOe122PM7SnqLe91JxWydzlH/NR7tjlA0PqsY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdta7-0005lR-9n; Thu, 08 Jan 2026 17:13:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E862D42A85;
 Thu,  8 Jan 2026 17:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 785E6C116D0;
 Thu,  8 Jan 2026 17:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767892429;
 bh=q6ECGD1+wntgmlJSkidx4XZzYvMNc2stbnRPzbVswr4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=niOHr0KOpKsPbW3zcxSPJ4+HdeaSJcF9n2piB+6bV/P08brOPZY60SMqx3j4YVoxN
 HY23AKzQOBHv5xbyCZODtdGvk8Iyuq3I5ZhrhCWp660sKVFvTkxAtvo6+2zeBPFcwG
 4+6DEmOnuyk0FwVI8/H5Oeq3cw+B1HbnX3m1q/5DUy6tvj/EncQX0MDAdhOTB66vc6
 Wa9Tx54LFEZPpTtzwjNRcJGznRwseKdLJWb0bgDU2EpAXO0/KhhvkoQcHVprarCLt0
 WqAdXqVBexp4OOG3pfKO1KsQRyYLMdnkS6aXHz6qetxafVfPy72aJqgerrIX0uQpWw
 vTe+PlRm/5SWg==
Date: Thu, 08 Jan 2026 12:12:56 -0500
MIME-Version: 1.0
Message-Id: <20260108-setlease-6-20-v1-1-ea4dec9b67fa@kernel.org>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
In-Reply-To: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
To: Luis de Bethencourt <luisbg@kernel.org>, 
 Salah Triki <salah.triki@gmail.com>, Nicolas Pitre <nico@fluxnic.net>, 
 Christoph Hellwig <hch@infradead.org>, Jan Kara <jack@suse.cz>, 
 Anders Larsen <al@alarsen.net>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, David Sterba <dsterba@suse.com>, 
 Chris Mason <clm@fb.com>, Gao Xiang <xiang@kernel.org>, 
 Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
 Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>, 
 Chunhai Guo <guochunhai@vivo.com>, Jan Kara <jack@suse.com>, 
 Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, 
 Dave Kleikamp <shaggy@kernel.org>, 
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
 Viacheslav Dubeyko <slava@dubeyko.com>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Phillip Lougher <phillip@squashfs.org.uk>, Carlos Maiolino <cem@kernel.org>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
 Yuezhang Mo <yuezhang.mo@sony.com>, Chuck Lever <chuck.lever@oracle.com>, 
 Alexander Aring <alex.aring@gmail.com>, 
 Andreas Gruenbacher <agruenba@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, 
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
 Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.org>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Bharath SM <bharathsm@microsoft.com>, Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6119; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=q6ECGD1+wntgmlJSkidx4XZzYvMNc2stbnRPzbVswr4=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpX+W41MOFgO/l+aT/aQwWX6yzbWOrQUKMswYuC
 zwZ2N9iXuiJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaV/luAAKCRAADmhBGVaC
 Fc7AEACr9C8Ts1FHYxAV8eYFq/mC6r3sgpT223unPjZiBqz0cBsE48A5R7g72u/qZwI83UTRJF1
 g0MThJcrJK2E67pZ+ZvH8T3pO2h3PKpZByut4pMdDc8HFu7Yytrz4TP4WTMD62O7eYsJLYX6N/g
 pNJ/yInFtIXZh/ysUQ6ruiczqr2LE06/01Cf7KHTZVDG+G9inw6x4jFdDmSSgmQEXxNbPFAnm1i
 TgiitrIv/g4OhfQBM9zycsFeMu1SX9hfL6aOgOJarrjgsuxErQqzjXDBvaP+/YDMkCvZdzQZHyK
 nYQkswujJYOnEZcN0GTnt7/8m6ZBIAhUwh+nh8MYp0nCy12JubPVU2a/DX2wx0bZfk2a0Tu9Uho
 INAlRmB9YHbI2XPziMpPuiHI7g4ALElxl1m1ttn6R+GBgUA0AMVmTG6gelfYyj/rAH36IO0XVtS
 W6o86sMi3zO5pVCs2ZU900ZMlh3Yq7+5XqW9e8IBoXGdhYHhyGqpN230Ws7usZnX7z1HUTdv0Og
 XQ00tTVueb23oPg9kHXoZNX9PdtOiilCirAcLAR9thMLLcvseGbqs+0AOBhOtr0jE0WUMqKewyr
 uMMPrn0ZRNxO4H9IhY13VzMbiPyBRz3WQFMnJi1DPqkZyCT8E4GaBKIGAJ/hhC4vg9x7K3AouKM
 MjNXCZhce9Ynapg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Add the setlease file_operation to generic_ro_fops, which
 covers file operations for several read-only filesystems (BEFS, EFS, ISOFS,
 QNX4, QNX6, CRAMFS, FREEVXFS). Also add setlease to the directory [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vdta7-0005lR-9n
Subject: [f2fs-dev] [PATCH 01/24] fs: add setlease to generic_ro_fops and
 read-only filesystem directory operations
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
From: Jeff Layton via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jeff Layton <jlayton@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net, linux-doc@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 gfs2@lists.linux.dev, linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add the setlease file_operation to generic_ro_fops, which covers file
operations for several read-only filesystems (BEFS, EFS, ISOFS, QNX4,
QNX6, CRAMFS, FREEVXFS). Also add setlease to the directory
file_operations for these filesystems.	A future patch will change the
default behavior to reject lease attempts with -EINVAL when there is no
setlease file operation defined. Add generic_setlease to retain the
ability to set leases on these filesystems.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/befs/linuxvfs.c        | 2 ++
 fs/cramfs/inode.c         | 2 ++
 fs/efs/dir.c              | 2 ++
 fs/freevxfs/vxfs_lookup.c | 2 ++
 fs/isofs/dir.c            | 2 ++
 fs/qnx4/dir.c             | 2 ++
 fs/qnx6/dir.c             | 2 ++
 fs/read_write.c           | 2 ++
 8 files changed, 16 insertions(+)

diff --git a/fs/befs/linuxvfs.c b/fs/befs/linuxvfs.c
index 9fcfdd6b8189aaf5cc3b68aa8dff4798af5bdcbc..d7c5d9270387bf6c3e94942e6331b449f90fe428 100644
--- a/fs/befs/linuxvfs.c
+++ b/fs/befs/linuxvfs.c
@@ -14,6 +14,7 @@
 #include <linux/fs_context.h>
 #include <linux/fs_parser.h>
 #include <linux/errno.h>
+#include <linux/filelock.h>
 #include <linux/stat.h>
 #include <linux/nls.h>
 #include <linux/buffer_head.h>
@@ -79,6 +80,7 @@ static const struct file_operations befs_dir_operations = {
 	.read		= generic_read_dir,
 	.iterate_shared	= befs_readdir,
 	.llseek		= generic_file_llseek,
+	.setlease	= generic_setlease,
 };
 
 static const struct inode_operations befs_dir_inode_operations = {
diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
index e54ebe402df79d43a2c7cf491d669829f7ef81b7..41b1a869cf135d014003d6bf1c343d590ae7a084 100644
--- a/fs/cramfs/inode.c
+++ b/fs/cramfs/inode.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/fs.h>
 #include <linux/file.h>
+#include <linux/filelock.h>
 #include <linux/pagemap.h>
 #include <linux/ramfs.h>
 #include <linux/init.h>
@@ -938,6 +939,7 @@ static const struct file_operations cramfs_directory_operations = {
 	.llseek		= generic_file_llseek,
 	.read		= generic_read_dir,
 	.iterate_shared	= cramfs_readdir,
+	.setlease	= generic_setlease,
 };
 
 static const struct inode_operations cramfs_dir_inode_operations = {
diff --git a/fs/efs/dir.c b/fs/efs/dir.c
index f892ac7c2a35e0094a314eeded06a974154e46d7..35ad0092c11547af68ef8baf4965b50a0a7593fe 100644
--- a/fs/efs/dir.c
+++ b/fs/efs/dir.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/buffer_head.h>
+#include <linux/filelock.h>
 #include "efs.h"
 
 static int efs_readdir(struct file *, struct dir_context *);
@@ -14,6 +15,7 @@ const struct file_operations efs_dir_operations = {
 	.llseek		= generic_file_llseek,
 	.read		= generic_read_dir,
 	.iterate_shared	= efs_readdir,
+	.setlease	= generic_setlease,
 };
 
 const struct inode_operations efs_dir_inode_operations = {
diff --git a/fs/freevxfs/vxfs_lookup.c b/fs/freevxfs/vxfs_lookup.c
index 1b0bca8b4cc686043d92246042dcf833d37712e4..138e08de976ea762a46043316f27e9a031f60c32 100644
--- a/fs/freevxfs/vxfs_lookup.c
+++ b/fs/freevxfs/vxfs_lookup.c
@@ -8,6 +8,7 @@
  * Veritas filesystem driver - lookup and other directory related code.
  */
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include <linux/time.h>
 #include <linux/mm.h>
 #include <linux/highmem.h>
@@ -36,6 +37,7 @@ const struct file_operations vxfs_dir_operations = {
 	.llseek =		generic_file_llseek,
 	.read =			generic_read_dir,
 	.iterate_shared =	vxfs_readdir,
+	.setlease =		generic_setlease,
 };
 
 
diff --git a/fs/isofs/dir.c b/fs/isofs/dir.c
index 09df40b612fbf27a1a93af2b4fbf6a607f4a1ab4..2ca16c3fe5ef3427e5bbd0631eb8323ef3c58bf1 100644
--- a/fs/isofs/dir.c
+++ b/fs/isofs/dir.c
@@ -12,6 +12,7 @@
  *  isofs directory handling functions
  */
 #include <linux/gfp.h>
+#include <linux/filelock.h>
 #include "isofs.h"
 
 int isofs_name_translate(struct iso_directory_record *de, char *new, struct inode *inode)
@@ -271,6 +272,7 @@ const struct file_operations isofs_dir_operations =
 	.llseek = generic_file_llseek,
 	.read = generic_read_dir,
 	.iterate_shared = isofs_readdir,
+	.setlease = generic_setlease,
 };
 
 /*
diff --git a/fs/qnx4/dir.c b/fs/qnx4/dir.c
index 42a529e26bd68b6de1a7738c409d5942a92066f8..6402715ab377e5686558371dd76e5a4c1cfbb787 100644
--- a/fs/qnx4/dir.c
+++ b/fs/qnx4/dir.c
@@ -13,6 +13,7 @@
  */
 
 #include <linux/buffer_head.h>
+#include <linux/filelock.h>
 #include "qnx4.h"
 
 static int qnx4_readdir(struct file *file, struct dir_context *ctx)
@@ -71,6 +72,7 @@ const struct file_operations qnx4_dir_operations =
 	.read		= generic_read_dir,
 	.iterate_shared	= qnx4_readdir,
 	.fsync		= generic_file_fsync,
+	.setlease	= generic_setlease,
 };
 
 const struct inode_operations qnx4_dir_inode_operations =
diff --git a/fs/qnx6/dir.c b/fs/qnx6/dir.c
index b4d10e45f2e41b45568fe813a3cc0aa253bcab6e..ae0c9846833d916beb7f356cfa6e9de01a6f6963 100644
--- a/fs/qnx6/dir.c
+++ b/fs/qnx6/dir.c
@@ -11,6 +11,7 @@
  *
  */
 
+#include <linux/filelock.h>
 #include "qnx6.h"
 
 static unsigned qnx6_lfile_checksum(char *name, unsigned size)
@@ -275,6 +276,7 @@ const struct file_operations qnx6_dir_operations = {
 	.read		= generic_read_dir,
 	.iterate_shared	= qnx6_readdir,
 	.fsync		= generic_file_fsync,
+	.setlease	= generic_setlease,
 };
 
 const struct inode_operations qnx6_dir_inode_operations = {
diff --git a/fs/read_write.c b/fs/read_write.c
index 833bae068770a4e410e4895132586313a9687fa2..50bff7edc91f36fe5ee24198bd51a33c278d40a2 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -20,6 +20,7 @@
 #include <linux/compat.h>
 #include <linux/mount.h>
 #include <linux/fs.h>
+#include <linux/filelock.h>
 #include "internal.h"
 
 #include <linux/uaccess.h>
@@ -30,6 +31,7 @@ const struct file_operations generic_ro_fops = {
 	.read_iter	= generic_file_read_iter,
 	.mmap_prepare	= generic_file_readonly_mmap_prepare,
 	.splice_read	= filemap_splice_read,
+	.setlease	= generic_setlease,
 };
 
 EXPORT_SYMBOL(generic_ro_fops);

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
