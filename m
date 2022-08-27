Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E40785A3544
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Aug 2022 09:01:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oRppH-0000GE-M3;
	Sat, 27 Aug 2022 07:01:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oRppC-0000Ft-MT
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Aug 2022 07:01:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aV6zEYfGOCxsnjV2yVyjCc7IhKNy5KPRREeRybS2RpM=; b=Oq/AGPcU5L6uqnLw9+Z2ERVeOC
 COu9nQ8dNHwXabtwRKzHSNCjTHgrRLoFQz9eIJU34VZ3zFo/WT0ApajV6486gaCJw9n2N2IJN523G
 6ocTShgMIwMDAEAUMVKFxHGStCb2NLivU0sSZIn8ZeYsD/9RKWWJD5v+NJXeAeNB/p9Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aV6zEYfGOCxsnjV2yVyjCc7IhKNy5KPRREeRybS2RpM=; b=Wwz0RzVjsTE5fE29w13rJgVb/l
 nKmfSXibw4E7Tpk3xQ9VBb6o1dPUDm3oV2bC3mnhBfBim6zPy2GIPkcwRHoozRjTFtOCZhwlkhEQS
 hgjExgK/zAO4+3z5f+M0fCZsUv7njKl7IXqyCibgaBTSIiNGelqJ9YhZnDXMU3lFDTi4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oRppA-002PRa-Al for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Aug 2022 07:01:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A8F3261058;
 Sat, 27 Aug 2022 07:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA7DAC4347C;
 Sat, 27 Aug 2022 07:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661583692;
 bh=UvXddYd+iwueCPhRMn68McfBxmc3REsqRxfThR55PaI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Oudzvj887EqPL0I9pQyZzOoVwv9mevFDu30f0H9Vuyv4C4+bWVfn/u6xPYXgcklZ6
 hix3W58pqKbJRezEXoZBe4MgOVszQm7EFVIR9sMdju4QLGBun8yLiA4at/mLUltetp
 ot6qbnRYlhXMX2Smtxx+wMbwjEeP1Ti4KTb3VTA6EfZ5KW/w7UxpxclHnqGZuzU1Fy
 EwOaNwXFkJR0NyWFkeahBNULUcMW34XDGOwStlWJt3Ta8RWF3cAhs4+mvNyAp9nwwv
 eKrcsaqWkAl4xdJB7OW18WXmxIyWHLLjeJqjV3JdTYh2wVGUXccrTLP7VRYAI34XvQ
 OmMl1hNTS791Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Fri, 26 Aug 2022 23:58:47 -0700
Message-Id: <20220827065851.135710-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220827065851.135710-1-ebiggers@kernel.org>
References: <20220827065851.135710-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Add support for
 STATX_DIOALIGN
 to ext4, so that direct I/O alignment restrictions are exposed to userspace
 in a generic way. Acked-by: Theodore Ts'o <tytso@mit.edu> Signed-off-by:
 Eric Biggers <ebiggers@google.com> --- fs/ext4/ext4.h | 1 + fs/ext4/file.c
 | 42 ++++++++++++++++++++++++++ fs/ext4/inode.c | 37 + [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oRppA-002PRa-Al
Subject: [f2fs-dev] [PATCH v5 4/8] ext4: support STATX_DIOALIGN
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
Cc: linux-block@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Add support for STATX_DIOALIGN to ext4, so that direct I/O alignment
restrictions are exposed to userspace in a generic way.

Acked-by: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/ext4.h  |  1 +
 fs/ext4/file.c  | 42 ++++++++++++++++++++++++++----------------
 fs/ext4/inode.c | 37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+), 16 deletions(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 9bca5565547bae..e6674504ca2abe 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -2979,6 +2979,7 @@ extern struct inode *__ext4_iget(struct super_block *sb, unsigned long ino,
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
index 601214453c3aec..364774230d87ac 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -5550,6 +5550,22 @@ int ext4_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
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
@@ -5565,6 +5581,27 @@ int ext4_getattr(struct user_namespace *mnt_userns, const struct path *path,
 		stat->btime.tv_nsec = ei->i_crtime.tv_nsec;
 	}
 
+	/*
+	 * Return the DIO alignment restrictions if requested.  We only return
+	 * this information when requested, since on encrypted files it might
+	 * take a fair bit of work to get if the file wasn't opened recently.
+	 */
+	if ((request_mask & STATX_DIOALIGN) && S_ISREG(inode->i_mode)) {
+		u32 dio_align = ext4_dio_alignment(inode);
+
+		stat->result_mask |= STATX_DIOALIGN;
+		if (dio_align == 1) {
+			struct block_device *bdev = inode->i_sb->s_bdev;
+
+			/* iomap defaults */
+			stat->dio_mem_align = bdev_dma_alignment(bdev) + 1;
+			stat->dio_offset_align = bdev_logical_block_size(bdev);
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
2.37.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
