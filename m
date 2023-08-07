Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EDF772F29
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 21:39:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qT653-0008Ga-Gt;
	Mon, 07 Aug 2023 19:39:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qT652-0008GO-4Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 19:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=odV9hBxIOruuCn6goUoSrw8LE149Q2SDyuHfm6jvGZk=; b=VnqFIZORMO89qIK1t+lqt9xixL
 9HzdtKd1VVqoqDT+P0JbbQY35DJQqf9O5cPxPEBcaJkQzfilJ2i6SvMWJVnDeQzHFTNoDbUi0vC90
 lr5RkHG07Gf5PKl+xo75F7e39/l5Y74VmZWlQcJlIm+0VfXHjLukdqXTZqSa3t614O44=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=odV9hBxIOruuCn6goUoSrw8LE149Q2SDyuHfm6jvGZk=; b=mbBmjN6OVtiux4H23jDqfTUzbN
 ZnQ/zGbPGAjYJX4RkQWywRSYn3YesCfDQB2iFySAwku2xiOc2jDXSNq5VJTxAvzwOdPXLtjxHHpKX
 XA4MczYtbpe8wyOzP65QrlXxQjokBP4ODQjL73o6i7vubwv21OAfTmAEJzJV3EUtGGgY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qT652-00GNU8-3r for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 19:39:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 73C90621DB;
 Mon,  7 Aug 2023 19:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7263AC433C8;
 Mon,  7 Aug 2023 19:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691437185;
 bh=E/83oEeb0rRq6smX7PPRvHC27zWaOYAH/vghT4/Cfkw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Rb9+2g0w0tmnfmL9+7rFJ7odGS32g3NvVD6Cnsmxw/SQgRVCL/aJTEmCkOJnGG4IW
 t3t+3pwUEunByoYJLfuLqOLxWkWVllEJs6OPTYQDPsRPA/kspWYPCUhS9PF8mTg5oU
 dbPvvPqcYu4ND6L4QE9Sg8na5fxImwirbf9gXQKCLxKK3hv35TPs0+KsTP3btikwBr
 MHf4GBLUZqQRy6lI22miPFyTJyVMOUxaR5u7jizaxBvrU/+Qb1b8Z+jNLcCcARxRRZ
 U9Hf/NKrYnPpwnjfGNquKi1oft22YUir+zbRKBWcHw4QMOKUXEP5HtXBL81yH4CVAp
 QoeNz/DBM872w==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 07 Aug 2023 15:38:40 -0400
MIME-Version: 1.0
Message-Id: <20230807-mgctime-v7-9-d1dec143a704@kernel.org>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
In-Reply-To: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, 
 Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>, 
 Ilya Dryomov <idryomov@gmail.com>, Jan Harkes <jaharkes@cs.cmu.edu>, 
 coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>, 
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
 Yue Hu <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
 Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 Miklos Szeredi <miklos@szeredi.hu>, Bob Peterson <rpeterso@redhat.com>, 
 Andreas Gruenbacher <agruenba@redhat.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, 
 Trond Myklebust <trond.myklebust@hammerspace.com>, 
 Anna Schumaker <anna@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>, 
 Paulo Alcantara <pc@manguebit.com>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Richard Weinberger <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>, 
 Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Amir Goldstein <amir73il@gmail.com>, "Darrick J. Wong" <djwong@kernel.org>, 
 Benjamin Coddington <bcodding@redhat.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11097; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=E/83oEeb0rRq6smX7PPRvHC27zWaOYAH/vghT4/Cfkw=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBk0Ug+ngTiz69nFoNr0s9PfN/r+KONXD6df/T+W
 qOmcWLsY7GJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZNFIPgAKCRAADmhBGVaC
 Fd5dEACCjRC+9kikBkEjdUAr+OrC4yH7ItKRQ0DzyxB11eKo9u6rgV0AZluwu4UIwjcbznhAVxk
 qAqOZUllUaNrhn+hc3wywznL8hYpFvWNqwjVCKQhuF7QOX+Rps2+o4pjUpViKdLJ01fh/jdCll2
 PD80G7D/AdQPBYOXAnTWCDhR6OxcgN4nNYu7tg7s4JaM0Uv3rOshkdYW3iMJqJaoEhaqMTWCChq
 9Tzo4+x4gTKl74OhWm64n1QnI7LAi9AzFtHxz+QrKpzYFqrgI/avYIH+vd4qVrwcj5FCIWEc2li
 DosXT/iav8fWGLRw/CeTFJq2GYVlTt0l2hGiNcA1C/o6N1oQhxt3Tqjw6UvvdpWk+Q1XGTUmuIQ
 I3issIz9cDUF4GZG2/VHN+AKQL75SUzZp6aN2qQt3qJGqHPouHDrsVSDhN09E/ogxnmcyYTrjAY
 tQkb+wGYY5fSj93k6AkmlpJy98e6Nn2POe4QTSnzOEi53HYAA83n9lf4i0fsdmoY6UFTm62kYmu
 jhT+0z4O/FYy5FLx8PpBPiof0aHhmQBQ08W/pr0uiu/cWyJEoRXSQRq1tZIKbQwz58Ynnq3Ra91
 3PKBZUBn63Yn4uJpco4GNZdLRmHIwEoqCEULuwummnm8Nd24QTYGhZRHvaMGbbW/O1Dpq5pB7gK
 cp9sZmkWSkDyTCQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The VFS always uses coarse-grained timestamps when updating
 the ctime and mtime after a change. This has the benefit of allowing
 filesystems
 to optimize away a lot metadata updates, down to around 1 p [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qT652-00GNU8-3r
Subject: [f2fs-dev] [PATCH v7 09/13] fs: add infrastructure for multigrain
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, ecryptfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The VFS always uses coarse-grained timestamps when updating the ctime
and mtime after a change. This has the benefit of allowing filesystems
to optimize away a lot metadata updates, down to around 1 per jiffy,
even when a file is under heavy writes.

Unfortunately, this has always been an issue when we're exporting via
NFSv3, which relies on timestamps to validate caches. A lot of changes
can happen in a jiffy, so timestamps aren't sufficient to help the
client decide to invalidate the cache. Even with NFSv4, a lot of
exported filesystems don't properly support a change attribute and are
subject to the same problems with timestamp granularity. Other
applications have similar issues with timestamps (e.g backup
applications).

If we were to always use fine-grained timestamps, that would improve the
situation, but that becomes rather expensive, as the underlying
filesystem would have to log a lot more metadata updates.

What we need is a way to only use fine-grained timestamps when they are
being actively queried.

POSIX generally mandates that when the the mtime changes, the ctime must
also change. The kernel always stores normalized ctime values, so only
the first 30 bits of the tv_nsec field are ever used.

Use the 31st bit of the ctime tv_nsec field to indicate that something
has queried the inode for the mtime or ctime. When this flag is set,
on the next mtime or ctime update, the kernel will fetch a fine-grained
timestamp instead of the usual coarse-grained one.

Filesytems can opt into this behavior by setting the FS_MGTIME flag in
the fstype. Filesystems that don't set this flag will continue to use
coarse-grained timestamps.

Later patches will convert individual filesystems to use the new
infrastructure.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/inode.c         | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++++--
 fs/stat.c          | 41 +++++++++++++++++++++++++--
 include/linux/fs.h | 46 ++++++++++++++++++++++++++++--
 3 files changed, 162 insertions(+), 7 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index e50d94a136fe..f55957ac80e6 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2118,10 +2118,52 @@ int file_remove_privs(struct file *file)
 }
 EXPORT_SYMBOL(file_remove_privs);
 
+/**
+ * current_mgtime - Return FS time (possibly fine-grained)
+ * @inode: inode.
+ *
+ * Return the current time truncated to the time granularity supported by
+ * the fs, as suitable for a ctime/mtime change. If the ctime is flagged
+ * as having been QUERIED, get a fine-grained timestamp.
+ */
+struct timespec64 current_mgtime(struct inode *inode)
+{
+	struct timespec64 now, ctime;
+	atomic_long_t *pnsec = (atomic_long_t *)&inode->__i_ctime.tv_nsec;
+	long nsec = atomic_long_read(pnsec);
+
+	if (nsec & I_CTIME_QUERIED) {
+		ktime_get_real_ts64(&now);
+		return timestamp_truncate(now, inode);
+	}
+
+	ktime_get_coarse_real_ts64(&now);
+	now = timestamp_truncate(now, inode);
+
+	/*
+	 * If we've recently fetched a fine-grained timestamp
+	 * then the coarse-grained one may still be earlier than the
+	 * existing ctime. Just keep the existing value if so.
+	 */
+	ctime = inode_get_ctime(inode);
+	if (timespec64_compare(&ctime, &now) > 0)
+		now = ctime;
+
+	return now;
+}
+EXPORT_SYMBOL(current_mgtime);
+
+static struct timespec64 current_ctime(struct inode *inode)
+{
+	if (is_mgtime(inode))
+		return current_mgtime(inode);
+	return current_time(inode);
+}
+
 static int inode_needs_update_time(struct inode *inode)
 {
 	int sync_it = 0;
-	struct timespec64 now = current_time(inode);
+	struct timespec64 now = current_ctime(inode);
 	struct timespec64 ctime;
 
 	/* First try to exhaust all avenues to not sync */
@@ -2552,9 +2594,43 @@ EXPORT_SYMBOL(current_time);
  */
 struct timespec64 inode_set_ctime_current(struct inode *inode)
 {
-	struct timespec64 now = current_time(inode);
+	struct timespec64 now;
+	struct timespec64 ctime;
+
+	ctime.tv_nsec = READ_ONCE(inode->__i_ctime.tv_nsec);
+	if (!(ctime.tv_nsec & I_CTIME_QUERIED)) {
+		now = current_time(inode);
 
-	inode_set_ctime(inode, now.tv_sec, now.tv_nsec);
+		/* Just copy it into place if it's not multigrain */
+		if (!is_mgtime(inode)) {
+			inode_set_ctime_to_ts(inode, now);
+			return now;
+		}
+
+		/*
+		 * If we've recently updated with a fine-grained timestamp,
+		 * then the coarse-grained one may still be earlier than the
+		 * existing ctime. Just keep the existing value if so.
+		 */
+		ctime.tv_sec = inode->__i_ctime.tv_sec;
+		if (timespec64_compare(&ctime, &now) > 0)
+			return ctime;
+
+		/*
+		 * Ctime updates are usually protected by the inode_lock, but
+		 * we can still race with someone setting the QUERIED flag.
+		 * Try to swap the new nsec value into place. If it's changed
+		 * in the interim, then just go with a fine-grained timestamp.
+		 */
+		if (cmpxchg(&inode->__i_ctime.tv_nsec, ctime.tv_nsec,
+			    now.tv_nsec) != ctime.tv_nsec)
+			goto fine_grained;
+		inode->__i_ctime.tv_sec = now.tv_sec;
+		return now;
+	}
+fine_grained:
+	ktime_get_real_ts64(&now);
+	inode_set_ctime_to_ts(inode, timestamp_truncate(now, inode));
 	return now;
 }
 EXPORT_SYMBOL(inode_set_ctime_current);
diff --git a/fs/stat.c b/fs/stat.c
index 7644e5997035..136711ae72fb 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -26,6 +26,37 @@
 #include "internal.h"
 #include "mount.h"
 
+/**
+ * fill_mg_cmtime - Fill in the mtime and ctime and flag ctime as QUERIED
+ * @stat: where to store the resulting values
+ * @request_mask: STATX_* values requested
+ * @inode: inode from which to grab the c/mtime
+ *
+ * Given @inode, grab the ctime and mtime out if it and store the result
+ * in @stat. When fetching the value, flag it as queried so the next write
+ * will use a fine-grained timestamp.
+ */
+void fill_mg_cmtime(struct kstat *stat, u32 request_mask, struct inode *inode)
+{
+	atomic_long_t *pnsec = (atomic_long_t *)&inode->__i_ctime.tv_nsec;
+
+	/* If neither time was requested, then don't report them */
+	if (!(request_mask & (STATX_CTIME|STATX_MTIME))) {
+		stat->result_mask &= ~(STATX_CTIME|STATX_MTIME);
+		return;
+	}
+
+	stat->mtime = inode->i_mtime;
+	stat->ctime.tv_sec = inode->__i_ctime.tv_sec;
+	/*
+	 * Atomically set the QUERIED flag and fetch the new value with
+	 * the flag masked off.
+	 */
+	stat->ctime.tv_nsec = atomic_long_fetch_or(I_CTIME_QUERIED, pnsec) &
+					~I_CTIME_QUERIED;
+}
+EXPORT_SYMBOL(fill_mg_cmtime);
+
 /**
  * generic_fillattr - Fill in the basic attributes from the inode struct
  * @idmap:		idmap of the mount the inode was found from
@@ -58,8 +89,14 @@ void generic_fillattr(struct mnt_idmap *idmap, u32 request_mask,
 	stat->rdev = inode->i_rdev;
 	stat->size = i_size_read(inode);
 	stat->atime = inode->i_atime;
-	stat->mtime = inode->i_mtime;
-	stat->ctime = inode_get_ctime(inode);
+
+	if (is_mgtime(inode)) {
+		fill_mg_cmtime(stat, request_mask, inode);
+	} else {
+		stat->mtime = inode->i_mtime;
+		stat->ctime = inode_get_ctime(inode);
+	}
+
 	stat->blksize = i_blocksize(inode);
 	stat->blocks = inode->i_blocks;
 
diff --git a/include/linux/fs.h b/include/linux/fs.h
index a83313f90fe3..455835d0e963 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1474,18 +1474,47 @@ static inline bool fsuidgid_has_mapping(struct super_block *sb,
 	       kgid_has_mapping(fs_userns, kgid);
 }
 
+struct timespec64 current_mgtime(struct inode *inode);
 struct timespec64 current_time(struct inode *inode);
 struct timespec64 inode_set_ctime_current(struct inode *inode);
 
+/*
+ * Multigrain timestamps
+ *
+ * Conditionally use fine-grained ctime and mtime timestamps when there
+ * are users actively observing them via getattr. The primary use-case
+ * for this is NFS clients that use the ctime to distinguish between
+ * different states of the file, and that are often fooled by multiple
+ * operations that occur in the same coarse-grained timer tick.
+ *
+ * The kernel always keeps normalized struct timespec64 values in the ctime,
+ * which means that only the first 30 bits of the value are used. Use the
+ * 31st bit of the ctime's tv_nsec field as a flag to indicate that the value
+ * has been queried since it was last updated.
+ */
+#define I_CTIME_QUERIED		(1L<<30)
+
 /**
  * inode_get_ctime - fetch the current ctime from the inode
  * @inode: inode from which to fetch ctime
  *
- * Grab the current ctime from the inode and return it.
+ * Grab the current ctime tv_nsec field from the inode, mask off the
+ * I_CTIME_QUERIED flag and return it. This is mostly intended for use by
+ * internal consumers of the ctime that aren't concerned with ensuring a
+ * fine-grained update on the next change (e.g. when preparing to store
+ * the value in the backing store for later retrieval).
+ *
+ * This is safe to call regardless of whether the underlying filesystem
+ * is using multigrain timestamps.
  */
 static inline struct timespec64 inode_get_ctime(const struct inode *inode)
 {
-	return inode->__i_ctime;
+	struct timespec64 ctime;
+
+	ctime.tv_sec = inode->__i_ctime.tv_sec;
+	ctime.tv_nsec = inode->__i_ctime.tv_nsec & ~I_CTIME_QUERIED;
+
+	return ctime;
 }
 
 /**
@@ -2259,6 +2288,7 @@ struct file_system_type {
 #define FS_USERNS_MOUNT		8	/* Can be mounted by userns root */
 #define FS_DISALLOW_NOTIFY_PERM	16	/* Disable fanotify permission events */
 #define FS_ALLOW_IDMAP         32      /* FS has been updated to handle vfs idmappings. */
+#define FS_MGTIME		64	/* FS uses multigrain timestamps */
 #define FS_RENAME_DOES_D_MOVE	32768	/* FS will handle d_move() during rename() internally. */
 	int (*init_fs_context)(struct fs_context *);
 	const struct fs_parameter_spec *parameters;
@@ -2282,6 +2312,17 @@ struct file_system_type {
 
 #define MODULE_ALIAS_FS(NAME) MODULE_ALIAS("fs-" NAME)
 
+/**
+ * is_mgtime: is this inode using multigrain timestamps
+ * @inode: inode to test for multigrain timestamps
+ *
+ * Return true if the inode uses multigrain timestamps, false otherwise.
+ */
+static inline bool is_mgtime(const struct inode *inode)
+{
+	return inode->i_sb->s_type->fs_flags & FS_MGTIME;
+}
+
 extern struct dentry *mount_bdev(struct file_system_type *fs_type,
 	int flags, const char *dev_name, void *data,
 	int (*fill_super)(struct super_block *, void *, int));
@@ -2918,6 +2959,7 @@ extern void page_put_link(void *);
 extern int page_symlink(struct inode *inode, const char *symname, int len);
 extern const struct inode_operations page_symlink_inode_operations;
 extern void kfree_link(void *);
+void fill_mg_cmtime(struct kstat *stat, u32 request_mask, struct inode *inode);
 void generic_fillattr(struct mnt_idmap *, u32, struct inode *, struct kstat *);
 void generic_fill_statx_attr(struct inode *inode, struct kstat *stat);
 extern int vfs_getattr_nosec(const struct path *, struct kstat *, u32, unsigned int);

-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
