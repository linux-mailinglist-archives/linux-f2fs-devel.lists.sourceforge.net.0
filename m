Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 449C1705F0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jul 2019 18:54:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hpbZc-00007Z-2F; Mon, 22 Jul 2019 16:54:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hpbZa-00007R-Sa
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jul 2019 16:54:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FkNvOr5lS/yKRK8t5v5smOBhn2NKdWYyQ9fkrijjy0s=; b=Bd0i3KYttKI3MY3FwCEROHvHKc
 9E9NFrVpbhKmoDL0rquKEyp3wxCfG6SE9gP8KfHQA7iNjh2zB5+SyfhOZTJFd2L8ZkWkH5JSQPO6s
 ZmTLnsUtR/LhKaP5xDgolzBElS/6Fy/nbspsJsKVPtamiwkgYVhsNtv6v3QqBE6c7ncg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FkNvOr5lS/yKRK8t5v5smOBhn2NKdWYyQ9fkrijjy0s=; b=QJYafvxdWygrMkD0H/FSEUqOEA
 Yqk2gdJno3Vae6I0TRJTJqWCl5dYA/0x5eR5fCel6yr9+Fkgc9lKZgDU82fiQ90ZIBShi5VVegOde
 ijSbH3/vPUrEp/qB5xEFPLe8h68KxCipSsU8XXgpIp6ecn7i/4jvP4i3aXUnPP/XgylM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hpbZZ-00AyRT-Ic
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jul 2019 16:54:02 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E0B92199C;
 Mon, 22 Jul 2019 16:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563814431;
 bh=VGrXcuq2JJds5s8/6aDAR92CvWXdrLRgJCIHirZzjWU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hSSPFdYxo7NKJJfa6Yg/l3vEFvo4wI2jrxVl6IwvIZxHtlicp0FALyeL5MqfV2JDn
 V9IRDTsww5mYsu0KGn0ME5kjJo7bIVOmoC/PS9/9Rq7phWz4bXIzmHyx/Dqo/4mQx+
 joJUBQ1LU7SFzAKqPjJs6IMayCCv34UpCPRh84iA=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 22 Jul 2019 09:50:50 -0700
Message-Id: <20190722165101.12840-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190722165101.12840-1-ebiggers@kernel.org>
References: <20190722165101.12840-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hpbZZ-00AyRT-Ic
Subject: [f2fs-dev] [PATCH v7 06/17] fs-verity: add inode and superblock
 fields
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, linux-api@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-integrity@vger.kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Analogous to fs/crypto/, add fields to the VFS inode and superblock for
use by the fs/verity/ support layer:

- ->s_vop: points to the fsverity_operations if the filesystem supports
  fs-verity, otherwise is NULL.

- ->i_verity_info: points to cached fs-verity information for the inode
  after someone opens it, otherwise is NULL.

- S_VERITY: bit in ->i_flags that identifies verity inodes, even when
  they haven't been opened yet and thus still have NULL ->i_verity_info.

Reviewed-by: Theodore Ts'o <tytso@mit.edu>
Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/linux/fs.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 56b8e358af5c1..b3a0f5bfb06d7 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -64,6 +64,8 @@ struct workqueue_struct;
 struct iov_iter;
 struct fscrypt_info;
 struct fscrypt_operations;
+struct fsverity_info;
+struct fsverity_operations;
 struct fs_context;
 struct fs_parameter_description;
 
@@ -723,6 +725,10 @@ struct inode {
 	struct fscrypt_info	*i_crypt_info;
 #endif
 
+#ifdef CONFIG_FS_VERITY
+	struct fsverity_info	*i_verity_info;
+#endif
+
 	void			*i_private; /* fs or device private pointer */
 } __randomize_layout;
 
@@ -1427,6 +1433,9 @@ struct super_block {
 	const struct xattr_handler **s_xattr;
 #ifdef CONFIG_FS_ENCRYPTION
 	const struct fscrypt_operations	*s_cop;
+#endif
+#ifdef CONFIG_FS_VERITY
+	const struct fsverity_operations *s_vop;
 #endif
 	struct hlist_bl_head	s_roots;	/* alternate root dentries for NFS */
 	struct list_head	s_mounts;	/* list of mounts; _not_ for fs use */
@@ -1965,6 +1974,7 @@ struct super_operations {
 #endif
 #define S_ENCRYPTED	16384	/* Encrypted file (using fs/crypto/) */
 #define S_CASEFOLD	32768	/* Casefolded file */
+#define S_VERITY	65536	/* Verity file (using fs/verity/) */
 
 /*
  * Note that nosuid etc flags are inode-specific: setting some file-system
@@ -2006,6 +2016,7 @@ static inline bool sb_rdonly(const struct super_block *sb) { return sb->s_flags
 #define IS_DAX(inode)		((inode)->i_flags & S_DAX)
 #define IS_ENCRYPTED(inode)	((inode)->i_flags & S_ENCRYPTED)
 #define IS_CASEFOLDED(inode)	((inode)->i_flags & S_CASEFOLD)
+#define IS_VERITY(inode)	((inode)->i_flags & S_VERITY)
 
 #define IS_WHITEOUT(inode)	(S_ISCHR(inode->i_mode) && \
 				 (inode)->i_rdev == WHITEOUT_DEV)
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
