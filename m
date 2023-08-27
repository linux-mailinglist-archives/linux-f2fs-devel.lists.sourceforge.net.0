Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07253789F14
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 27 Aug 2023 15:33:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qaFtp-00074M-SJ;
	Sun, 27 Aug 2023 13:33:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hao.xu@linux.dev>) id 1qaFto-00074D-18
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Aug 2023 13:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/SxFJtissRd8EFEKfjvtrzUrKe2UZWHAXBAv8XN+2Ws=; b=BqezphXfOBGbJgvy4VLbT2yBVy
 EwS4yzHPHm0j0NhFcL24G5bhiLo1wSWvYi5wAg/xhmAIN9dPUS6bt9Fdtyrn9ENq2+Kn4O/o1ufv+
 Qfww7kqywEuzJCzRlnro2BWQnWzPm/462fj/mO0VdDOIQRMSVKfPx16sqY3tVNq/DRrY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/SxFJtissRd8EFEKfjvtrzUrKe2UZWHAXBAv8XN+2Ws=; b=aLlVSIYFDyGXn0nrH3NuAvEZKR
 6Ci9K8TOhZGKBiI5+I5yPpaDcEdH17FefQTQeVCxorLiZGp1QVwslxpqJA+eNfBdvCM9oVyQDqjvF
 nY1x5FP0VgbE1mJraH+J9u8SQNG5R8FoLLtPU8Zb0BoMZEn72g6Z/AG7pRgw14WdPXAs=;
Received: from out-249.mta1.migadu.com ([95.215.58.249])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qaFtl-00H3ro-RF for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Aug 2023 13:33:50 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1693143223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/SxFJtissRd8EFEKfjvtrzUrKe2UZWHAXBAv8XN+2Ws=;
 b=eP0/0pozPhJqhF9X0LVypWfPixS8Ogox1mSys0p44e7ItbiSDBlkHW42EuiOoGiIwrzhGw
 tZ/ULBZZYg3CYueJM7OBSSuL9VrufdTT1Ge7QZSiTjhbDK29Ks9eejLI5UabQHt/7N12hX
 DZgpFPTC3SJN3d95V92Kgu+jAWVmYA0=
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Sun, 27 Aug 2023 21:28:30 +0800
Message-Id: <20230827132835.1373581-7-hao.xu@linux.dev>
In-Reply-To: <20230827132835.1373581-1-hao.xu@linux.dev>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Hao Xu <howeyxu@tencent.com> Add a nowait boolean
 parameter
 for touch_atime() to support nowait semantics. It is true only when io_uring
 is the initial caller. Signed-off-by: Hao Xu <howeyxu@tencent.com> ---
 fs/cachefiles/namei.c
 | 2 +- fs/ecryptfs/file.c | 4 ++-- fs/inode.c | 7 ++++--- fs/namei.c | 4
 ++-- fs/nfsd/vfs.c | 2 +- fs/overlayfs/file.c | 2 +- fs/o [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1qaFtl-00H3ro-RF
Subject: [f2fs-dev] [PATCH 06/11] vfs: add a nowait parameter for
 touch_atime()
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 bpf@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Hao Xu <howeyxu@tencent.com>

Add a nowait boolean parameter for touch_atime() to support nowait
semantics. It is true only when io_uring is the initial caller.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/cachefiles/namei.c | 2 +-
 fs/ecryptfs/file.c    | 4 ++--
 fs/inode.c            | 7 ++++---
 fs/namei.c            | 4 ++--
 fs/nfsd/vfs.c         | 2 +-
 fs/overlayfs/file.c   | 2 +-
 fs/overlayfs/inode.c  | 2 +-
 fs/stat.c             | 2 +-
 include/linux/fs.h    | 4 ++--
 kernel/bpf/inode.c    | 4 ++--
 net/unix/af_unix.c    | 4 ++--
 11 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index d9d22d0ec38a..7a21bf0e36b8 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -591,7 +591,7 @@ static bool cachefiles_open_file(struct cachefiles_object *object,
 	 * used to keep track of culling, and atimes are only updated by read,
 	 * write and readdir but not lookup or open).
 	 */
-	touch_atime(&file->f_path);
+	touch_atime(&file->f_path, false);
 	dput(dentry);
 	return true;
 
diff --git a/fs/ecryptfs/file.c b/fs/ecryptfs/file.c
index ce0a3c5ed0ca..3db7006cc440 100644
--- a/fs/ecryptfs/file.c
+++ b/fs/ecryptfs/file.c
@@ -39,7 +39,7 @@ static ssize_t ecryptfs_read_update_atime(struct kiocb *iocb,
 	rc = generic_file_read_iter(iocb, to);
 	if (rc >= 0) {
 		path = ecryptfs_dentry_to_lower_path(file->f_path.dentry);
-		touch_atime(path);
+		touch_atime(path, false);
 	}
 	return rc;
 }
@@ -64,7 +64,7 @@ static ssize_t ecryptfs_splice_read_update_atime(struct file *in, loff_t *ppos,
 	rc = filemap_splice_read(in, ppos, pipe, len, flags);
 	if (rc >= 0) {
 		path = ecryptfs_dentry_to_lower_path(in->f_path.dentry);
-		touch_atime(path);
+		touch_atime(path, false);
 	}
 	return rc;
 }
diff --git a/fs/inode.c b/fs/inode.c
index 8fefb69e1f84..e83b836f2d09 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1961,17 +1961,17 @@ bool atime_needs_update(const struct path *path, struct inode *inode)
 	return true;
 }
 
-void touch_atime(const struct path *path)
+int touch_atime(const struct path *path, bool nowait)
 {
 	struct vfsmount *mnt = path->mnt;
 	struct inode *inode = d_inode(path->dentry);
 	struct timespec64 now;
 
 	if (!atime_needs_update(path, inode))
-		return;
+		return 0;
 
 	if (!sb_start_write_trylock(inode->i_sb))
-		return;
+		return 0;
 
 	if (__mnt_want_write(mnt) != 0)
 		goto skip_update;
@@ -1989,6 +1989,7 @@ void touch_atime(const struct path *path)
 	__mnt_drop_write(mnt);
 skip_update:
 	sb_end_write(inode->i_sb);
+	return 0;
 }
 EXPORT_SYMBOL(touch_atime);
 
diff --git a/fs/namei.c b/fs/namei.c
index e56ff39a79bc..35731d405730 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -1776,12 +1776,12 @@ static const char *pick_link(struct nameidata *nd, struct path *link,
 		return ERR_PTR(-ELOOP);
 
 	if (!(nd->flags & LOOKUP_RCU)) {
-		touch_atime(&last->link);
+		touch_atime(&last->link, false);
 		cond_resched();
 	} else if (atime_needs_update(&last->link, inode)) {
 		if (!try_to_unlazy(nd))
 			return ERR_PTR(-ECHILD);
-		touch_atime(&last->link);
+		touch_atime(&last->link, false);
 	}
 
 	error = security_inode_follow_link(link->dentry, inode,
diff --git a/fs/nfsd/vfs.c b/fs/nfsd/vfs.c
index 8a2321d19194..3179e7b5d209 100644
--- a/fs/nfsd/vfs.c
+++ b/fs/nfsd/vfs.c
@@ -1569,7 +1569,7 @@ nfsd_readlink(struct svc_rqst *rqstp, struct svc_fh *fhp, char *buf, int *lenp)
 	if (unlikely(!d_is_symlink(path.dentry)))
 		return nfserr_inval;
 
-	touch_atime(&path);
+	touch_atime(&path, false);
 
 	link = vfs_get_link(path.dentry, &done);
 	if (IS_ERR(link))
diff --git a/fs/overlayfs/file.c b/fs/overlayfs/file.c
index 21245b00722a..6ff466ef98ea 100644
--- a/fs/overlayfs/file.c
+++ b/fs/overlayfs/file.c
@@ -255,7 +255,7 @@ static void ovl_file_accessed(struct file *file)
 		inode->i_ctime = upperinode->i_ctime;
 	}
 
-	touch_atime(&file->f_path);
+	touch_atime(&file->f_path, false);
 }
 
 static rwf_t ovl_iocb_to_rwf(int ifl)
diff --git a/fs/overlayfs/inode.c b/fs/overlayfs/inode.c
index a63e57447be9..66e03025e748 100644
--- a/fs/overlayfs/inode.c
+++ b/fs/overlayfs/inode.c
@@ -703,7 +703,7 @@ int ovl_update_time(struct inode *inode, struct timespec64 *ts, int flags)
 		};
 
 		if (upperpath.dentry) {
-			touch_atime(&upperpath);
+			touch_atime(&upperpath, false);
 			inode->i_atime = d_inode(upperpath.dentry)->i_atime;
 		}
 	}
diff --git a/fs/stat.c b/fs/stat.c
index 7c238da22ef0..713773e61110 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -485,7 +485,7 @@ static int do_readlinkat(int dfd, const char __user *pathname,
 		if (d_is_symlink(path.dentry) || inode->i_op->readlink) {
 			error = security_inode_readlink(path.dentry);
 			if (!error) {
-				touch_atime(&path);
+				touch_atime(&path, false);
 				error = vfs_readlink(path.dentry, buf, bufsiz);
 			}
 		}
diff --git a/include/linux/fs.h b/include/linux/fs.h
index f3e315e8efdd..ba54879089ac 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2201,13 +2201,13 @@ enum file_time_flags {
 };
 
 extern bool atime_needs_update(const struct path *, struct inode *);
-extern void touch_atime(const struct path *);
+extern int touch_atime(const struct path *path, bool nowait);
 int inode_update_time(struct inode *inode, struct timespec64 *time, int flags);
 
 static inline void file_accessed(struct file *file)
 {
 	if (!(file->f_flags & O_NOATIME))
-		touch_atime(&file->f_path);
+		touch_atime(&file->f_path, false);
 }
 
 extern int file_modified(struct file *file);
diff --git a/kernel/bpf/inode.c b/kernel/bpf/inode.c
index 4174f76133df..bc020b45d5c8 100644
--- a/kernel/bpf/inode.c
+++ b/kernel/bpf/inode.c
@@ -517,7 +517,7 @@ static void *bpf_obj_do_get(int path_fd, const char __user *pathname,
 
 	raw = bpf_any_get(inode->i_private, *type);
 	if (!IS_ERR(raw))
-		touch_atime(&path);
+		touch_atime(&path, false);
 
 	path_put(&path);
 	return raw;
@@ -591,7 +591,7 @@ struct bpf_prog *bpf_prog_get_type_path(const char *name, enum bpf_prog_type typ
 		return ERR_PTR(ret);
 	prog = __get_prog_inode(d_backing_inode(path.dentry), type);
 	if (!IS_ERR(prog))
-		touch_atime(&path);
+		touch_atime(&path, false);
 	path_put(&path);
 	return prog;
 }
diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index 123b35ddfd71..5868e4e47320 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -1084,7 +1084,7 @@ static struct sock *unix_find_bsd(struct sockaddr_un *sunaddr, int addr_len,
 
 	err = -EPROTOTYPE;
 	if (sk->sk_type == type)
-		touch_atime(&path);
+		touch_atime(&path, false);
 	else
 		goto sock_put;
 
@@ -1114,7 +1114,7 @@ static struct sock *unix_find_abstract(struct net *net,
 
 	dentry = unix_sk(sk)->path.dentry;
 	if (dentry)
-		touch_atime(&unix_sk(sk)->path);
+		touch_atime(&unix_sk(sk)->path, false);
 
 	return sk;
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
