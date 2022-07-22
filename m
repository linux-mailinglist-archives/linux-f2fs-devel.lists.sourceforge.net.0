Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C6957DAAC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jul 2022 09:14:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oEmra-0002h6-QE; Fri, 22 Jul 2022 07:14:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1oEmrY-0002gi-Ql
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jul 2022 07:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7RgkJtv/9AzmWKjMy6hzs04j6ILtHQBZMJhBJ7b6DkA=; b=KKJHk9CzuV4LMcLtUbcYMRWXEy
 81Fv+yT4oxkT4I0za+m9QgwBXCWzkNVBzYz90IctdQnHaiB2jp06y14MYPbmamGVrogrsnFBkQf0+
 GKkcwb5VnfhKrjiuYrfW7Wy6+z7Q1UpbaSzff3yZ5mOnv83MlQgCDnxSxSOKaIY1GLdw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7RgkJtv/9AzmWKjMy6hzs04j6ILtHQBZMJhBJ7b6DkA=; b=EV/cv92zS6dFRq45FyivfaUq3p
 0nFA8ogyI1E48jfHu/04UWRadxdyh1kH52uxed8SMwy/IqTLWKspzffgJUBlMZuxkA3zdJDINNNdm
 c9a7dAJXM3EY4tFwNMf5g0tpNQumjaqcZ8x9KAhUtAY6fsYirNogsYv4SWjK8KBrYhNI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oEmrW-0000qf-Ga
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jul 2022 07:14:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6DE4DB82746
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 Jul 2022 07:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A486C341CA;
 Fri, 22 Jul 2022 07:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658474043;
 bh=4idVgRAKusE9xByup3Qe2uILHisarAzGtiVXG+Gs9Ns=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CrlqaAxITMZDfNJEKkfbbQ++wx2VrrRP24INBAKyh1uGtofDHzmHR8qQJ4mEGhh9v
 2A5iTBrix2O+9LDiFMjVOjiBVCWyfJu2YBk9G/uZp3/1vG7W1zjRUiriUJi9YbEIdW
 M6nGQfauy+4eUThbhYvt2g0Z3Rj3GIGtTzdnZ4bHGijhiu8AobyAhbNPspV74U93Rn
 hJuLAwiteMlnHBFFZtBJP2qOtoi8HK3Z5VbXYcEe548sAXDLpvK8Op3K72DqMSS6Jl
 VvIrnQz7wfM1OinaUYhZs2SF5LKHGVBFuKrM3CjZMW5E7pHO+BZfVtTQ/ug+cyfiW4
 2/6i92y43Z5wQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Fri, 22 Jul 2022 00:12:23 -0700
Message-Id: <20220722071228.146690-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220722071228.146690-1-ebiggers@kernel.org>
References: <20220722071228.146690-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Add support for
 STATX_DIOALIGN
 to ext4, so that direct I/O alignment restrictions are exposed to userspace
 in a generic way. Signed-off-by: Eric Biggers <ebiggers@google.com> ---
 fs/ext4/ext4.h
 | 1 + fs/ext4/file.c | 42 ++++++++++++++++++++++++++ fs/ext4/inode.c | 36
 ++++++++++++++++++++++++++++++++++++ 3 fi [...] 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oEmrW-0000qf-Ga
Subject: [f2fs-dev] [PATCH v4 4/9] ext4: support STATX_DIOALIGN
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Add support for STATX_DIOALIGN to ext4, so that direct I/O alignment
restrictions are exposed to userspace in a generic way.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/ext4.h  |  1 +
 fs/ext4/file.c  | 42 ++++++++++++++++++++++++++----------------
 fs/ext4/inode.c | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 16 deletions(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 75b8d81b24692c..68e964394e9173 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -2968,6 +2968,7 @@ extern struct inode *__ext4_iget(struct super_block *sb, unsigned long ino,
 extern int  ext4_write_inode(struct inode *, struct writeback_control *);
 extern int  ext4_setattr(struct user_namespace *, struct dentry *,
 			 struct iattr *);
+extern u32  ext4_dio_alignment(struct inode *inode);
 extern int  ext4_getattr(struct user_namespace *, const struct path *,
 			 struct kstat *, u32, unsigned int);
 extern void ext4_evict_inode(struct inode *);
diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index 26d7426208970d..8bb1c35fd6dd5a 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -36,24 +36,34 @@
 #include "acl.h"
 #include "truncate.h"
 
-static bool ext4_dio_supported(struct kiocb *iocb, struct iov_iter *iter)
+/*
+ * Returns %true if the given DIO request should be attempted with DIO, or
+ * %false if it should fall back to buffered I/O.
+ *
+ * DIO isn't well specified; when it's unsupported (either due to the request
+ * being misaligned, or due to the file not supporting DIO at all), filesystems
+ * either fall back to buffered I/O or return EINVAL.  For files that don't use
+ * any special features like encryption or verity, ext4 has traditionally
+ * returned EINVAL for misaligned DIO.  iomap_dio_rw() uses this convention too.
+ * In this case, we should attempt the DIO, *not* fall back to buffered I/O.
+ *
+ * In contrast, in cases where DIO is unsupported due to ext4 features, ext4
+ * traditionally falls back to buffered I/O.
+ *
+ * This function implements the traditional ext4 behavior in all these cases.
+ */
+static bool ext4_should_use_dio(struct kiocb *iocb, struct iov_iter *iter)
 {
 	struct inode *inode = file_inode(iocb->ki_filp);
+	u32 dio_align = ext4_dio_alignment(inode);
 
-	if (IS_ENCRYPTED(inode)) {
-		if (!fscrypt_dio_supported(inode))
-			return false;
-		if (!IS_ALIGNED(iocb->ki_pos | iov_iter_alignment(iter),
-				i_blocksize(inode)))
-			return false;
-	}
-	if (fsverity_active(inode))
+	if (dio_align == 0)
 		return false;
-	if (ext4_should_journal_data(inode))
-		return false;
-	if (ext4_has_inline_data(inode))
-		return false;
-	return true;
+
+	if (dio_align == 1)
+		return true;
+
+	return IS_ALIGNED(iocb->ki_pos | iov_iter_alignment(iter), dio_align);
 }
 
 static ssize_t ext4_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
@@ -68,7 +78,7 @@ static ssize_t ext4_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		inode_lock_shared(inode);
 	}
 
-	if (!ext4_dio_supported(iocb, to)) {
+	if (!ext4_should_use_dio(iocb, to)) {
 		inode_unlock_shared(inode);
 		/*
 		 * Fallback to buffered I/O if the operation being performed on
@@ -516,7 +526,7 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	}
 
 	/* Fallback to buffered I/O if the inode does not support direct I/O. */
-	if (!ext4_dio_supported(iocb, from)) {
+	if (!ext4_should_use_dio(iocb, from)) {
 		if (ilock_shared)
 			inode_unlock_shared(inode);
 		else
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 84c0eb55071d65..75dd332e9da57b 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -5536,6 +5536,22 @@ int ext4_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
 	return error;
 }
 
+u32 ext4_dio_alignment(struct inode *inode)
+{
+	if (fsverity_active(inode))
+		return 0;
+	if (ext4_should_journal_data(inode))
+		return 0;
+	if (ext4_has_inline_data(inode))
+		return 0;
+	if (IS_ENCRYPTED(inode)) {
+		if (!fscrypt_dio_supported(inode))
+			return 0;
+		return i_blocksize(inode);
+	}
+	return 1; /* use the iomap defaults */
+}
+
 int ext4_getattr(struct user_namespace *mnt_userns, const struct path *path,
 		 struct kstat *stat, u32 request_mask, unsigned int query_flags)
 {
@@ -5551,6 +5567,26 @@ int ext4_getattr(struct user_namespace *mnt_userns, const struct path *path,
 		stat->btime.tv_nsec = ei->i_crtime.tv_nsec;
 	}
 
+	/*
+	 * Return the DIO alignment restrictions if requested.  We only return
+	 * this information when requested, since on encrypted files it might
+	 * take a fair bit of work to get if the file wasn't opened recently.
+	 */
+	if ((request_mask & STATX_DIOALIGN) && S_ISREG(inode->i_mode)) {
+		u32 dio_align = ext4_dio_alignment(inode);
+		unsigned int lbs = bdev_logical_block_size(inode->i_sb->s_bdev);
+
+		stat->result_mask |= STATX_DIOALIGN;
+		if (dio_align == 1) {
+			/* iomap defaults */
+			stat->dio_mem_align = lbs;
+			stat->dio_offset_align = lbs;
+		} else {
+			stat->dio_mem_align = dio_align;
+			stat->dio_offset_align = dio_align;
+		}
+	}
+
 	flags = ei->i_flags & EXT4_FL_USER_VISIBLE;
 	if (flags & EXT4_APPEND_FL)
 		stat->attributes |= STATX_ATTR_APPEND;
-- 
2.37.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
