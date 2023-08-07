Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 214D6772F12
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 21:39:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qT64R-00027e-B1;
	Mon, 07 Aug 2023 19:39:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qT64P-00027M-Nt
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 19:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DUlXR9dWQDH3T2ku60GUgPm3Z8tUKiS4ne1Zxz+2SYQ=; b=NeK1QhjVkSg58r9ZyKjbIwqlTA
 79O50Ep3IZH413MbgYXl4FhioV6B7fYz3aAxTom8oYT47YwEB6IqVNKx/5+zsFtxjiYzpa5FyjEC2
 2nLZerzjxNe2hqCkYs5pjD4lyeT44z/g4m20V6cg3qoXHmK632ZFCpCbiX3YZulGVNZs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DUlXR9dWQDH3T2ku60GUgPm3Z8tUKiS4ne1Zxz+2SYQ=; b=NR3beZvVapTqW5Db++ARUYF6cc
 9DUPBn64bc9vngu4Khtrn2dk4qtlunkAffbG8JWZAKJ8G0RrHqzkRRmgS5Ur6ryjgwdyE/Spr4AG/
 gpJeuphnc7/1G35m15i6/eXQJlYIOa75WBt0hlRlkJkeJqV36jpYDYDaFBroBNQ4YyH8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qT64N-0002bo-O8 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 19:39:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2896E621E1;
 Mon,  7 Aug 2023 19:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53CBAC433C8;
 Mon,  7 Aug 2023 19:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691437145;
 bh=c6Pn7MHvNlpH2XYBl6Q+eSLWZltLuR1g5CejPMxJHLg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=rnOlWm10rYTe6qOxo+HjOYyd53/YPygic8GIbCK0glL6lHAvDa3L+2dgg65DdEWoc
 QCvOyUM4o/KGwZka879ebiZUesSgio3+P6FBqqK3QvfZpWSgQwUnzlA61EGf/1EL5R
 p3n1XOeZB0Iid2kQfyukLgVQTc0bZr92JrZ78skB7cVDfqriJQck8t1Eyxj9uv2eoI
 POrR0jVC26utAJ97OQ1+6der5j+G+bHgervYfGOz0V5rqeAPcxj9Esf7WkP/Yet3zD
 RhnXCWKmhZa0pDQUouE77dppIHaiYE4XM0pBvN9MSSq9yeb0ehkZ9i8+Kqjk8geTx1
 MVPzlTxHB4a4A==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 07 Aug 2023 15:38:34 -0400
MIME-Version: 1.0
Message-Id: <20230807-mgctime-v7-3-d1dec143a704@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8078; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=c6Pn7MHvNlpH2XYBl6Q+eSLWZltLuR1g5CejPMxJHLg=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBk0Ug9xhyiOiJxxIfKX2c3tg98g8sSp5LQ21GSY
 mzWI+/GCS2JAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCZNFIPQAKCRAADmhBGVaC
 FSzyD/9trWoynNfuWyY2cs6DBpaQQUV1pUEIFhN3cQn4D1Dj4pn7ZlrYbtaZoLZ00j/ocCZY8Cm
 OST1VE54JDQXwO32hBnXeM7G96Xn7zoRH+pqQYZPbR9kUjpu+aNn6ffZxRbMP9NIzQQ+N8ghne5
 Z7jufKj2R2Uw0drlgyYUcxJ65kEGr9rFzCJE/YalbmpYvHTz/ytdS17m/ehiKt8YSSFHSlH8dw2
 IMnxIjc1hTHm6Zzohb1yvcmnWCVoz+P2c4sKhLQjHhWslSapU8kYqN8GxTMaHZTfNu5fSFodfmw
 gDKWuekjA31txotjHOPG3MMTnGLmTF08E4pH6Rm05pHpkh4nB+tcB3+Un+AXQlgt32/AEWkPc77
 emLQ4B011pQb97XrODSs8U/viLyMEDTJaeml4+OXdMN/LbxDEw5SqZwVC/mRotC12Oyhq9FMvOd
 GzGdKdwcV/yxvGo+lWThX8az+eUTbFXUeUFSFAY1ba7HcCPCDTrmLAn8gSwHMDOhyn69WQnLXrg
 TiFxvFC2v9g1ufJHiN702KiosiBViIYVdYHCdtiwFjToHpTj8jbrgCWnPX6D8gnebZyjPZrsHyl
 1e14BtVt8dQL92uLDufxrU+HAvzADZHUAHd3M7wIPV+ITM0tH7b1GTiFD6Evho+3GsGmFY2iQNR
 iA6s6+xRq9xJUrg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: In future patches we're going to change how the ctime is
 updated
 to keep track of when it has been queried. The way that the update_time
 operation
 works (and a lot of its callers) make this difficult, [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qT64N-0002bo-O8
Subject: [f2fs-dev] [PATCH v7 03/13] fs: drop the timespec64 arg from
 generic_update_time
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

In future patches we're going to change how the ctime is updated
to keep track of when it has been queried. The way that the update_time
operation works (and a lot of its callers) make this difficult, since
they grab a timestamp early and then pass it down to eventually be
copied into the inode.

All of the existing update_time callers pass in the result of
current_time() in some fashion. Drop the "time" parameter from
generic_update_time, and rework it to fetch its own timestamp.

This change means that an update_time could fetch a different timestamp
than was seen in inode_needs_update_time. update_time is only ever
called with one of two flag combinations: Either S_ATIME is set, or
S_MTIME|S_CTIME|S_VERSION are set.

With this change we now treat the flags argument as an indicator that
some value needed to be updated when last checked, rather than an
indication to update specific timestamps.

Rework the logic for updating the timestamps and put it in a new
inode_update_timestamps helper that other update_time routines can use.
S_ATIME is as treated as we always have, but if any of the other three
are set, then we attempt to update all three.

Also, some callers of generic_update_time need to know what timestamps
were actually updated. Change it to return an S_* flag mask to indicate
that and rework the callers to expect it.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/gfs2/inode.c     |  3 +-
 fs/inode.c          | 84 +++++++++++++++++++++++++++++++++++++++++------------
 fs/orangefs/inode.c |  3 +-
 fs/ubifs/file.c     |  6 ++--
 fs/xfs/xfs_iops.c   |  6 ++--
 include/linux/fs.h  |  3 +-
 6 files changed, 80 insertions(+), 25 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 200cabf3b393..f1f04557aa21 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -2155,7 +2155,8 @@ static int gfs2_update_time(struct inode *inode, struct timespec64 *time,
 		if (error)
 			return error;
 	}
-	return generic_update_time(inode, time, flags);
+	generic_update_time(inode, flags);
+	return 0;
 }
 
 static const struct inode_operations gfs2_file_iops = {
diff --git a/fs/inode.c b/fs/inode.c
index 3fc251bfaf73..e07e45f6cd01 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1881,29 +1881,76 @@ static int relatime_need_update(struct vfsmount *mnt, struct inode *inode,
 	return 0;
 }
 
-int generic_update_time(struct inode *inode, struct timespec64 *time, int flags)
+/**
+ * inode_update_timestamps - update the timestamps on the inode
+ * @inode: inode to be updated
+ * @flags: S_* flags that needed to be updated
+ *
+ * The update_time function is called when an inode's timestamps need to be
+ * updated for a read or write operation. This function handles updating the
+ * actual timestamps. It's up to the caller to ensure that the inode is marked
+ * dirty appropriately.
+ *
+ * In the case where any of S_MTIME, S_CTIME, or S_VERSION need to be updated,
+ * attempt to update all three of them. S_ATIME updates can be handled
+ * independently of the rest.
+ *
+ * Returns a set of S_* flags indicating which values changed.
+ */
+int inode_update_timestamps(struct inode *inode, int flags)
 {
-	int dirty_flags = 0;
+	int updated = 0;
+	struct timespec64 now;
+
+	if (flags & (S_MTIME|S_CTIME|S_VERSION)) {
+		struct timespec64 ctime = inode_get_ctime(inode);
 
-	if (flags & (S_ATIME | S_CTIME | S_MTIME)) {
-		if (flags & S_ATIME)
-			inode->i_atime = *time;
-		if (flags & S_CTIME)
-			inode_set_ctime_to_ts(inode, *time);
-		if (flags & S_MTIME)
-			inode->i_mtime = *time;
-
-		if (inode->i_sb->s_flags & SB_LAZYTIME)
-			dirty_flags |= I_DIRTY_TIME;
-		else
-			dirty_flags |= I_DIRTY_SYNC;
+		now = inode_set_ctime_current(inode);
+		if (!timespec64_equal(&now, &ctime))
+			updated |= S_CTIME;
+		if (!timespec64_equal(&now, &inode->i_mtime)) {
+			inode->i_mtime = now;
+			updated |= S_MTIME;
+		}
+		if (IS_I_VERSION(inode) && inode_maybe_inc_iversion(inode, updated))
+			updated |= S_VERSION;
+	} else {
+		now = current_time(inode);
 	}
 
-	if ((flags & S_VERSION) && inode_maybe_inc_iversion(inode, false))
-		dirty_flags |= I_DIRTY_SYNC;
+	if (flags & S_ATIME) {
+		if (!timespec64_equal(&now, &inode->i_atime)) {
+			inode->i_atime = now;
+			updated |= S_ATIME;
+		}
+	}
+	return updated;
+}
+EXPORT_SYMBOL(inode_update_timestamps);
+
+/**
+ * generic_update_time - update the timestamps on the inode
+ * @inode: inode to be updated
+ * @flags: S_* flags that needed to be updated
+ *
+ * The update_time function is called when an inode's timestamps need to be
+ * updated for a read or write operation. In the case where any of S_MTIME, S_CTIME,
+ * or S_VERSION need to be updated we attempt to update all three of them. S_ATIME
+ * updates can be handled done independently of the rest.
+ *
+ * Returns a S_* mask indicating which fields were updated.
+ */
+int generic_update_time(struct inode *inode, int flags)
+{
+	int updated = inode_update_timestamps(inode, flags);
+	int dirty_flags = 0;
 
+	if (updated & (S_ATIME|S_MTIME|S_CTIME))
+		dirty_flags = inode->i_sb->s_flags & SB_LAZYTIME ? I_DIRTY_TIME : I_DIRTY_SYNC;
+	if (updated & S_VERSION)
+		dirty_flags |= I_DIRTY_SYNC;
 	__mark_inode_dirty(inode, dirty_flags);
-	return 0;
+	return updated;
 }
 EXPORT_SYMBOL(generic_update_time);
 
@@ -1915,7 +1962,8 @@ int inode_update_time(struct inode *inode, struct timespec64 *time, int flags)
 {
 	if (inode->i_op->update_time)
 		return inode->i_op->update_time(inode, time, flags);
-	return generic_update_time(inode, time, flags);
+	generic_update_time(inode, flags);
+	return 0;
 }
 EXPORT_SYMBOL(inode_update_time);
 
diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
index a52c30e80f45..3afa2a69bc63 100644
--- a/fs/orangefs/inode.c
+++ b/fs/orangefs/inode.c
@@ -903,9 +903,10 @@ int orangefs_permission(struct mnt_idmap *idmap,
 int orangefs_update_time(struct inode *inode, struct timespec64 *time, int flags)
 {
 	struct iattr iattr;
+
 	gossip_debug(GOSSIP_INODE_DEBUG, "orangefs_update_time: %pU\n",
 	    get_khandle_from_ino(inode));
-	generic_update_time(inode, time, flags);
+	flags = generic_update_time(inode, flags);
 	memset(&iattr, 0, sizeof iattr);
         if (flags & S_ATIME)
 		iattr.ia_valid |= ATTR_ATIME;
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 436b27d7c58f..df9086b19cd0 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1387,8 +1387,10 @@ int ubifs_update_time(struct inode *inode, struct timespec64 *time,
 			.dirtied_ino_d = ALIGN(ui->data_len, 8) };
 	int err, release;
 
-	if (!IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT))
-		return generic_update_time(inode, time, flags);
+	if (!IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT)) {
+		generic_update_time(inode, flags);
+		return 0;
+	}
 
 	err = ubifs_budget_space(c, &req);
 	if (err)
diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 3a9363953ef2..731f45391baa 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1042,8 +1042,10 @@ xfs_vn_update_time(
 
 	if (inode->i_sb->s_flags & SB_LAZYTIME) {
 		if (!((flags & S_VERSION) &&
-		      inode_maybe_inc_iversion(inode, false)))
-			return generic_update_time(inode, now, flags);
+		      inode_maybe_inc_iversion(inode, false))) {
+			generic_update_time(inode, flags);
+			return 0;
+		}
 
 		/* Capture the iversion update that just occurred */
 		log_flags |= XFS_ILOG_CORE;
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 85977cdeda94..bb3c2c4f871f 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2343,7 +2343,8 @@ extern int current_umask(void);
 
 extern void ihold(struct inode * inode);
 extern void iput(struct inode *);
-extern int generic_update_time(struct inode *, struct timespec64 *, int);
+int inode_update_timestamps(struct inode *inode, int flags);
+int generic_update_time(struct inode *, int);
 
 /* /sys/fs */
 extern struct kobject *fs_kobj;

-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
