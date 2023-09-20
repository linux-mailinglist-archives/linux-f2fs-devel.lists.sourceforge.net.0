Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E745F7A7621
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Sep 2023 10:42:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qisme-00087W-Fd;
	Wed, 20 Sep 2023 08:42:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1qisma-00086z-8V
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 08:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JPVLs+ailQPGvp2aD9cC7DxzF6awll0owVtFyLPqCmY=; b=am0wABWqJo2Wg4hM4LdTLU4GZx
 /Bk3teU+NKuo4MoL05cupAz1wps8RB+2Kg0TZQo1BaDZZ8+1OJ9qay2U0OBFTlBRvxCA234d64cEL
 78e97nKw1LDATTtkKIEC/TOUlu46u1SQ+vFRwNzuOgeKJmV9gGtOysz42SMFzBXXzkfM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JPVLs+ailQPGvp2aD9cC7DxzF6awll0owVtFyLPqCmY=; b=P0ZfcRwOsHH4dD1f8xgxP6gfcG
 BwbJ/cbX4ihGLEPXrf+MBZJsaWzW2dUolslniD/luIETU3IyXsCkcd/GeklqWi2I0FuMzODuVkzC1
 W1GtCQ6RFQymXIYjXR0AN0dGu6VD/EbGcNVNrQghwy7wa7nSXRq1WkF76tDMzLMe9a3Q=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qismU-0006Qs-Vb for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 08:42:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4BC92CE193B;
 Wed, 20 Sep 2023 08:41:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F97CC433C8;
 Wed, 20 Sep 2023 08:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695199310;
 bh=qGh90UNcKG/Be9UhcsQucQmAlzzaN0ybdDwui9BIyYs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BFXFNGFoQU2CKw9WyfGOIqib6ndJAqnLiG0gf5coXTntD9bzGoDVbWnIjqFY5yw7w
 /iL0Uod2MFZ8DEr6puUf1sJCredMIGJpWb79vtbE1ushIQwYZMxYIi/wrGi9Fb08X3
 lSA57r158BOH8f+EL6t2kjQEmID+gvoToIjnVUls1kcLXlPyD1YnLKMqHSQHxJwNle
 vpfc8azuJlJ8vyz4F1Ic7z+BrOBPimV2UU0lRBnSM6gAhS5GK9UYFCZFWZn+W0Rcg0
 ZifyAdzqTfctk3qOLSOZL59aCo+mxjvM+Qd6lemjUSliLN+1OQBJgtNIB7A++8sTra
 7xjjm3n+ayagw==
Date: Wed, 20 Sep 2023 10:41:30 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20230920-leerung-krokodil-52ec6cb44707@brauner>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
 <4511209.uG2h0Jr0uP@nimes>
 <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > > f1 was last written to *after* f2 was last written to.
 If the timestamp of f1 > > is then lower than the timestamp of f2, timestamps
 are fundamentally broken. > > > > Many things in user-space dep [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qismU-0006Qs-Vb
Subject: Re: [f2fs-dev] [PATCH v7 12/13] ext4: switch to multigrain
 timestamps
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Jan Kara <jack@suse.cz>, linux-xfs@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-unionfs@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Hans de Goede <hdegoede@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, codalist@coda.cs.cmu.edu,
 linux-afs@lists.infradead.org, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 Amir Goldstein <l@gmail.com>, Eric Van Hensbergen <ericvh@kernel.org>,
 bug-gnulib@gnu.org, Andreas Gruenbacher <agruenba@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
 Benjamin Coddington <bcodding@redhat.com>, Tyler Hicks <code@tyhicks.com>,
 cluster-devel@redhat.com, coda@cs.cmu.edu, linux-mm@kvack.org,
 Gao Xiang <xiang@kernel.org>, Iurii Zaikin <yzaikin@google.com>,
 Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Xi Ruoyao <xry111@linuxfromscratch.org>,
 Shyam Prasad N <sprasad@microsoft.com>, ecryptfs@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, ocfs2-devel@lists.linux.dev,
 linux-cifs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 Josef Bacik <josef@toxicpanda.com>, Tom Talpey <tom@talpey.com>,
 Tejun Heo <tj@kernel.org>, Yue Hu <huyue2@coolpad.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jan Harkes <jaharkes@cs.cmu.edu>,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 devel@lists.orangefs.org, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, Bo b Peterson <rpeterso@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, Bruno Haible <bruno@clisp.org>,
 linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> > f1 was last written to *after* f2 was last written to. If the timestamp of f1
> > is then lower than the timestamp of f2, timestamps are fundamentally broken.
> > 
> > Many things in user-space depend on timestamps, such as build system
> > centered around 'make', but also 'find ... -newer ...'.
> > 
> 
> 
> What does breakage with make look like in this situation? The "fuzz"
> here is going to be on the order of a jiffy. The typical case for make
> timestamp comparisons is comparing source files vs. a build target. If
> those are being written nearly simultaneously, then that could be an
> issue, but is that a typical behavior? It seems like it would be hard to
> rely on that anyway, esp. given filesystems like NFS that can do lazy
> writeback.
> 
> One of the operating principles with this series is that timestamps can
> be of varying granularity between different files. Note that Linux
> already violates this assumption when you're working across filesystems
> of different types.
> 
> As to potential fixes if this is a real problem:
> 
> I don't really want to put this behind a mount or mkfs option (a'la
> relatime, etc.), but that is one possibility.
> 
> I wonder if it would be feasible to just advance the coarse-grained
> current_time whenever we end up updating a ctime with a fine-grained
> timestamp? It might produce some inode write amplification. Files that

Less than ideal imho.

If this risks breaking existing workloads by enabling it unconditionally
and there isn't a clear way to detect and handle these situations
without risk of regression then we should move this behind a mount
option.

So how about the following:

From cb14add421967f6e374eb77c36cc4a0526b10d17 Mon Sep 17 00:00:00 2001
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 20 Sep 2023 10:00:08 +0200
Subject: [PATCH] vfs: move multi-grain timestamps behind a mount option

While we initially thought we can do this unconditionally it turns out
that this might break existing workloads that rely on timestamps in very
specific ways and we always knew this was a possibility. Move
multi-grain timestamps behind a vfs mount option.

Signed-off-by: Christian Brauner <brauner@kernel.org>
---
 fs/fs_context.c     | 18 ++++++++++++++++++
 fs/inode.c          |  4 ++--
 fs/proc_namespace.c |  1 +
 fs/stat.c           |  2 +-
 include/linux/fs.h  |  4 +++-
 5 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/fs/fs_context.c b/fs/fs_context.c
index a0ad7a0c4680..dd4dade0bb9e 100644
--- a/fs/fs_context.c
+++ b/fs/fs_context.c
@@ -44,6 +44,7 @@ static const struct constant_table common_set_sb_flag[] = {
 	{ "mand",	SB_MANDLOCK },
 	{ "ro",		SB_RDONLY },
 	{ "sync",	SB_SYNCHRONOUS },
+	{ "mgtime",	SB_MGTIME },
 	{ },
 };
 
@@ -52,18 +53,32 @@ static const struct constant_table common_clear_sb_flag[] = {
 	{ "nolazytime",	SB_LAZYTIME },
 	{ "nomand",	SB_MANDLOCK },
 	{ "rw",		SB_RDONLY },
+	{ "nomgtime",	SB_MGTIME },
 	{ },
 };
 
+static inline int check_mgtime(unsigned int token, const struct fs_context *fc)
+{
+	if (token != SB_MGTIME)
+		return 0;
+	if (!(fc->fs_type->fs_flags & FS_MGTIME))
+		return invalf(fc, "Filesystem doesn't support multi-grain timestamps");
+	return 0;
+}
+
 /*
  * Check for a common mount option that manipulates s_flags.
  */
 static int vfs_parse_sb_flag(struct fs_context *fc, const char *key)
 {
 	unsigned int token;
+	int ret;
 
 	token = lookup_constant(common_set_sb_flag, key, 0);
 	if (token) {
+		ret = check_mgtime(token, fc);
+		if (ret)
+			return ret;
 		fc->sb_flags |= token;
 		fc->sb_flags_mask |= token;
 		return 0;
@@ -71,6 +86,9 @@ static int vfs_parse_sb_flag(struct fs_context *fc, const char *key)
 
 	token = lookup_constant(common_clear_sb_flag, key, 0);
 	if (token) {
+		ret = check_mgtime(token, fc);
+		if (ret)
+			return ret;
 		fc->sb_flags &= ~token;
 		fc->sb_flags_mask |= token;
 		return 0;
diff --git a/fs/inode.c b/fs/inode.c
index 54237f4242ff..fd1a2390aaa3 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2141,7 +2141,7 @@ EXPORT_SYMBOL(current_mgtime);
 
 static struct timespec64 current_ctime(struct inode *inode)
 {
-	if (is_mgtime(inode))
+	if (IS_MGTIME(inode))
 		return current_mgtime(inode);
 	return current_time(inode);
 }
@@ -2588,7 +2588,7 @@ struct timespec64 inode_set_ctime_current(struct inode *inode)
 		now = current_time(inode);
 
 		/* Just copy it into place if it's not multigrain */
-		if (!is_mgtime(inode)) {
+		if (!IS_MGTIME(inode)) {
 			inode_set_ctime_to_ts(inode, now);
 			return now;
 		}
diff --git a/fs/proc_namespace.c b/fs/proc_namespace.c
index 250eb5bf7b52..08f5bf4d2c6c 100644
--- a/fs/proc_namespace.c
+++ b/fs/proc_namespace.c
@@ -49,6 +49,7 @@ static int show_sb_opts(struct seq_file *m, struct super_block *sb)
 		{ SB_DIRSYNC, ",dirsync" },
 		{ SB_MANDLOCK, ",mand" },
 		{ SB_LAZYTIME, ",lazytime" },
+		{ SB_MGTIME, ",mgtime" },
 		{ 0, NULL }
 	};
 	const struct proc_fs_opts *fs_infop;
diff --git a/fs/stat.c b/fs/stat.c
index 6e60389d6a15..2f18dd5de18b 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -90,7 +90,7 @@ void generic_fillattr(struct mnt_idmap *idmap, u32 request_mask,
 	stat->size = i_size_read(inode);
 	stat->atime = inode->i_atime;
 
-	if (is_mgtime(inode)) {
+	if (IS_MGTIME(inode)) {
 		fill_mg_cmtime(stat, request_mask, inode);
 	} else {
 		stat->mtime = inode->i_mtime;
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 4aeb3fa11927..03e415fb3a7c 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1114,6 +1114,7 @@ extern int send_sigurg(struct fown_struct *fown);
 #define SB_NODEV        BIT(2)	/* Disallow access to device special files */
 #define SB_NOEXEC       BIT(3)	/* Disallow program execution */
 #define SB_SYNCHRONOUS  BIT(4)	/* Writes are synced at once */
+#define SB_MGTIME	BIT(5)	/* Use multi-grain timestamps */
 #define SB_MANDLOCK     BIT(6)	/* Allow mandatory locks on an FS */
 #define SB_DIRSYNC      BIT(7)	/* Directory modifications are synchronous */
 #define SB_NOATIME      BIT(10)	/* Do not update access times. */
@@ -2105,6 +2106,7 @@ static inline bool sb_rdonly(const struct super_block *sb) { return sb->s_flags
 					((inode)->i_flags & (S_SYNC|S_DIRSYNC)))
 #define IS_MANDLOCK(inode)	__IS_FLG(inode, SB_MANDLOCK)
 #define IS_NOATIME(inode)	__IS_FLG(inode, SB_RDONLY|SB_NOATIME)
+#define IS_MGTIME(inode)	__IS_FLG(inode, SB_MGTIME)
 #define IS_I_VERSION(inode)	__IS_FLG(inode, SB_I_VERSION)
 
 #define IS_NOQUOTA(inode)	((inode)->i_flags & S_NOQUOTA)
@@ -2366,7 +2368,7 @@ struct file_system_type {
  */
 static inline bool is_mgtime(const struct inode *inode)
 {
-	return inode->i_sb->s_type->fs_flags & FS_MGTIME;
+	return inode->i_sb->s_flags & SB_MGTIME;
 }
 
 extern struct dentry *mount_bdev(struct file_system_type *fs_type,
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
