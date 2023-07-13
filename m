Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02540752D61
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Jul 2023 01:01:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qK5Ja-0006ln-VQ;
	Thu, 13 Jul 2023 23:01:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qK5JT-0006lZ-7h
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Jul 2023 23:01:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B/0oagySbS3Ifk2UJ6Hmx4LuRWkoKIToXNE7lkONKcc=; b=V3dHasTcDih68cdTjMqmGJ8Ft9
 kbnUil3wFURmRD0zvVIztiGsuxua5QJfn13q4KhwHDBmrsCztH9EzCmgC+ecJnxN22krNQtZ6ASho
 9UJI7PDwU2TELE94n+I+l/f4f2+o5nJZuaz8NB32K4du9XsJanZm8g2E56wtlDz2wYcs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B/0oagySbS3Ifk2UJ6Hmx4LuRWkoKIToXNE7lkONKcc=; b=du4lwLgHHdlQpGrGVY4Ev5Inle
 etp65zTnHRZ09SzETyHuOtoFcASwCwe4bZMqbKRTiS5OtHJ7uXjky/XNEiHA4wy1mqi3l/f0n9s9F
 zSXV+RyF1rZWuHpNHrBxtZIVJLmVOpqpvujd0zErm0YSo+Ncl2zFnD9BDC+HA6zQNaKU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qK5JS-0006E9-8t for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Jul 2023 23:01:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7D8C461AD2;
 Thu, 13 Jul 2023 23:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB019C433B6;
 Thu, 13 Jul 2023 23:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689289281;
 bh=Dy0ObexSdjvGFnE5GNrBxiftdRymvhQ5lbJx72BKffY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=B0VXtoarm7to3z75jta+r86rymInA0rcOZXXK6PDKyjttw0yeeQ9Oa/YGe0WPfeLw
 Aqagg2qZGm2iD6O77zF6UEpGttkdBeZ1KtYNAK7yCsHmbrkDzuuzwIxPLcP4GO43wI
 w39CalEOT65TGDELmucNcEdz39fGNSEIdSWn3pWnfkNQrJywJdCraylNm9TttY5Jra
 pGZ/outKj00jmCqSJqFF6+vMYT/UgsykUhifnnNjDCMaq/UK/yjZqJD95sei8IkN69
 Yjpg4lSMArs8ujYS9j9CZbgze6idfR5gLc5rQLXioEN5xsUXGMQdyyJnSBdudTqHOd
 n9mfYLATGMhVA==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 13 Jul 2023 19:00:51 -0400
MIME-Version: 1.0
Message-Id: <20230713-mgctime-v5-2-9eb795d2ae37@kernel.org>
References: <20230713-mgctime-v5-0-9eb795d2ae37@kernel.org>
In-Reply-To: <20230713-mgctime-v5-0-9eb795d2ae37@kernel.org>
To: Eric Van Hensbergen <ericvh@kernel.org>, 
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
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, 
 Trond Myklebust <trond.myklebust@hammerspace.com>, 
 Anna Schumaker <anna@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>, 
 Paulo Alcantara <pc@manguebit.com>, Ronnie Sahlberg <lsahlber@redhat.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Richard Weinberger <richard@nod.at>, Hans de Goede <hdegoede@redhat.com>, 
 Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=12090; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=Dy0ObexSdjvGFnE5GNrBxiftdRymvhQ5lbJx72BKffY=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBksIIuQ6/aMqdFkrW889tZd28XDGD/NKP3ZyaCk
 jSGPEQm+rOJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZLCCLgAKCRAADmhBGVaC
 Fa3EEACPAYF/UdPqY2NWkaVzk8H/NAcHUW/hPvIS9vjNZruwFmXFj/LYyMvcp0tofMwLRgMcCAE
 Vph+wO/c807cLy5llDvTlTm0TjzPef3az0VN3Q8Gzb/2Nnh81yJnaQqOzRwFI1Dobw4ieNMzoU6
 4toolNwW0tdDD7IU/urQP+4n7wFZT9iHmcto7q5Ef6rFla5COdzyRUSOPKFltzFKgjBiF2ZUbi1
 9rPgV9imtCZWp7fH8mkRIVmoRaIrx24GtSlBnp/pBU+0KzjVNXDvvnegezzxutC4fSPJuW2h5pZ
 PiakxgsAa14RATd/5YXrIc+yNNZfeC0pRUmGgHOGL10njpjBp7Vo0nCcxoKc1I2kDO9N0tnniRi
 QyijUzdhFi4tOGbKQFjGi7GTuQekgkvLj3T2CiHuUcXH4phso83iPzj97egR0thkirGb6Cvv/CY
 uy76MlvwYeCIYaBQkk7dZtQOpLjIjI239VoHsf8OgmrImV9FVxAoJ4yB0PhSCnXl1crVKzEUphQ
 eemlORwSpndKSNmSnOacohNIRXM4Mqzq1NZM/oJVsRkcHkTc2M6q3C/agLX+m3kKOnc5xOjo8Cm
 Oq7V4ramHqhM83+/svEq1p6QVyO5KLsFUjSv20Q208e+yhCjvDrQ7s4NNP/Yqb8o/hZn8Clw7W2
 cnsnAuyIF+Bo72A==
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
X-Headers-End: 1qK5JS-0006E9-8t
Subject: [f2fs-dev] [PATCH v5 2/8] fs: add infrastructure for multigrain
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
Cc: Jeff Layton <jlayton@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, ecryptfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
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
 fs/inode.c         | 98 ++++++++++++++++++++++++++++++++++++++----------------
 fs/stat.c          | 41 +++++++++++++++++++++--
 include/linux/fs.h | 45 +++++++++++++++++++++++--
 3 files changed, 151 insertions(+), 33 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index d4ab92233062..369621e7faf5 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1919,6 +1919,21 @@ int inode_update_time(struct inode *inode, struct timespec64 *time, int flags)
 }
 EXPORT_SYMBOL(inode_update_time);
 
+/**
+ * current_coarse_time - Return FS time
+ * @inode: inode.
+ *
+ * Return the current coarse-grained time truncated to the time
+ * granularity supported by the fs.
+ */
+static struct timespec64 current_coarse_time(struct inode *inode)
+{
+	struct timespec64 now;
+
+	ktime_get_coarse_real_ts64(&now);
+	return timestamp_truncate(now, inode);
+}
+
 /**
  *	atime_needs_update	-	update the access time
  *	@path: the &struct path to update
@@ -1952,7 +1967,7 @@ bool atime_needs_update(const struct path *path, struct inode *inode)
 	if ((mnt->mnt_flags & MNT_NODIRATIME) && S_ISDIR(inode->i_mode))
 		return false;
 
-	now = current_time(inode);
+	now = current_coarse_time(inode);
 
 	if (!relatime_need_update(mnt, inode, now))
 		return false;
@@ -1986,7 +2001,7 @@ void touch_atime(const struct path *path)
 	 * We may also fail on filesystems that have the ability to make parts
 	 * of the fs read only, e.g. subvolumes in Btrfs.
 	 */
-	now = current_time(inode);
+	now = current_coarse_time(inode);
 	inode_update_time(inode, &now, S_ATIME);
 	__mnt_drop_write(mnt);
 skip_update:
@@ -2072,6 +2087,56 @@ int file_remove_privs(struct file *file)
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
+static struct timespec64 current_mgtime(struct inode *inode)
+{
+	struct timespec64 now;
+	atomic_long_t *pnsec = (atomic_long_t *)&inode->__i_ctime.tv_nsec;
+	long nsec = atomic_long_read(pnsec);
+
+	if (nsec & I_CTIME_QUERIED) {
+		ktime_get_real_ts64(&now);
+	} else {
+		struct timespec64 ctime;
+
+		ktime_get_coarse_real_ts64(&now);
+
+		/*
+		 * If we've recently fetched a fine-grained timestamp
+		 * then the coarse-grained one may still be earlier than the
+		 * existing one. Just keep the existing ctime if so.
+		 */
+		ctime = inode_get_ctime(inode);
+		if (timespec64_compare(&ctime, &now) > 0)
+			now = ctime;
+	}
+
+	return timestamp_truncate(now, inode);
+}
+
+/**
+ * current_time - Return timestamp suitable for ctime update
+ * @inode: inode to eventually be updated
+ *
+ * Return the current time, which is usually coarse-grained but may be fine
+ * grained if the filesystem uses multigrain timestamps and the existing
+ * ctime was queried since the last update.
+ */
+struct timespec64 current_time(struct inode *inode)
+{
+	if (is_mgtime(inode))
+		return current_mgtime(inode);
+	return current_coarse_time(inode);
+}
+EXPORT_SYMBOL(current_time);
+
 static int inode_needs_update_time(struct inode *inode, struct timespec64 *now)
 {
 	int sync_it = 0;
@@ -2480,37 +2545,12 @@ struct timespec64 timestamp_truncate(struct timespec64 t, struct inode *inode)
 }
 EXPORT_SYMBOL(timestamp_truncate);
 
-/**
- * current_time - Return FS time
- * @inode: inode.
- *
- * Return the current time truncated to the time granularity supported by
- * the fs.
- *
- * Note that inode and inode->sb cannot be NULL.
- * Otherwise, the function warns and returns time without truncation.
- */
-struct timespec64 current_time(struct inode *inode)
-{
-	struct timespec64 now;
-
-	ktime_get_coarse_real_ts64(&now);
-
-	if (unlikely(!inode->i_sb)) {
-		WARN(1, "current_time() called with uninitialized super_block in the inode");
-		return now;
-	}
-
-	return timestamp_truncate(now, inode);
-}
-EXPORT_SYMBOL(current_time);
-
 /**
  * inode_set_ctime_current - set the ctime to current_time
  * @inode: inode
  *
- * Set the inode->i_ctime to the current value for the inode. Returns
- * the current value that was assigned to i_ctime.
+ * Set the inode->__i_ctime to the current value for the inode. Returns
+ * the current value that was assigned to __i_ctime.
  */
 struct timespec64 inode_set_ctime_current(struct inode *inode)
 {
diff --git a/fs/stat.c b/fs/stat.c
index 062f311b5386..51effd1c2bc2 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -26,6 +26,37 @@
 #include "internal.h"
 #include "mount.h"
 
+/**
+ * fill_mg_cmtime - Fill in the mtime and ctime and flag ctime as QUERIED
+ * @request_mask: STATX_* values requested
+ * @inode: inode from which to grab the c/mtime
+ * @stat: where to store the resulting values
+ *
+ * Given @inode, grab the ctime and mtime out if it and store the result
+ * in @stat. When fetching the value, flag it as queried so the next write
+ * will use a fine-grained timestamp.
+ */
+void fill_mg_cmtime(u32 request_mask, struct inode *inode, struct kstat *stat)
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
  * @idmap:	idmap of the mount the inode was found from
@@ -58,8 +89,14 @@ void generic_fillattr(struct mnt_idmap *idmap, u32 request_mask,
 	stat->rdev = inode->i_rdev;
 	stat->size = i_size_read(inode);
 	stat->atime = inode->i_atime;
-	stat->mtime = inode->i_mtime;
-	stat->ctime = inode_get_ctime(inode);
+
+	if (is_mgtime(inode)) {
+		fill_mg_cmtime(request_mask, inode, stat);
+	} else {
+		stat->mtime = inode->i_mtime;
+		stat->ctime = inode_get_ctime(inode);
+	}
+
 	stat->blksize = i_blocksize(inode);
 	stat->blocks = inode->i_blocks;
 
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 42d1434cc427..a0bdbefbf293 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1477,15 +1477,43 @@ static inline bool fsuidgid_has_mapping(struct super_block *sb,
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
@@ -2261,6 +2289,7 @@ struct file_system_type {
 #define FS_USERNS_MOUNT		8	/* Can be mounted by userns root */
 #define FS_DISALLOW_NOTIFY_PERM	16	/* Disable fanotify permission events */
 #define FS_ALLOW_IDMAP         32      /* FS has been updated to handle vfs idmappings. */
+#define FS_MGTIME		64	/* FS uses multigrain timestamps */
 #define FS_RENAME_DOES_D_MOVE	32768	/* FS will handle d_move() during rename() internally. */
 	int (*init_fs_context)(struct fs_context *);
 	const struct fs_parameter_spec *parameters;
@@ -2284,6 +2313,17 @@ struct file_system_type {
 
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
@@ -2919,6 +2959,7 @@ extern void page_put_link(void *);
 extern int page_symlink(struct inode *inode, const char *symname, int len);
 extern const struct inode_operations page_symlink_inode_operations;
 extern void kfree_link(void *);
+void fill_mg_cmtime(u32 request_mask, struct inode *inode, struct kstat *stat);
 void generic_fillattr(struct mnt_idmap *, u32, struct inode *, struct kstat *);
 void generic_fill_statx_attr(struct inode *inode, struct kstat *stat);
 extern int vfs_getattr_nosec(const struct path *, struct kstat *, u32, unsigned int);

-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
