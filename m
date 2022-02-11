Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD94E4B1E51
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Feb 2022 07:13:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nIPBi-0004Kt-RB; Fri, 11 Feb 2022 06:13:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nIPBg-0004KU-EV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Feb 2022 06:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yYv5C2+HJMFiwfCp7xLVR+BjXTnmXQTfS1rioSzUU+s=; b=JobNZEI9mpWgu6aXMz8xxcy8a9
 S7pYCWIgKDaJyP/m2gQkj1MzGxQH2nDFru3iUwyNP62rXK+thy+2h7ARkUKc5bQ6vuJOU1QpYCrkc
 SsZdzlIaEc+rI8gEvFFZ2j/ZTjE7klUMyUEMxLFfaE/DsOXmbuUm0kI6P9KhUYuOu2Zk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yYv5C2+HJMFiwfCp7xLVR+BjXTnmXQTfS1rioSzUU+s=; b=IpIhQMuYZiAyKGrV8l8+NJID+d
 SEosygiQodKaUM4NBVCPwgPqi4Z0HWfkkCKcKRQCG8pCLCUlsBnsXNSwk7WUWf1c9sYhDE5N9ax+6
 kL//1bW5HnHnFEzeJMieNYkLi62T/5erCTCLx84ceuLnSjINlGc/zsKqHw/cvOlUjvwQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nIPBa-0004i5-Ba
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Feb 2022 06:13:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 686CC619F7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Feb 2022 06:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B2D8C340EB;
 Fri, 11 Feb 2022 06:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644560007;
 bh=nusYqtUDYr67sy2COTEwLJkUm+5b5gE/RxtW4gg1+6g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CIDZJTQiiXv0GRyqMLC3krA9/a0vldq057bpGmujKP1iS3mQr8MvMnwfsz5AAcaE2
 RVmYxdIIOo/ViNb0lGaLJzsXtVbuv5x2yKN+kGI/gIUwFxgrI5G0/pRhf9Vgyf/V7I
 v4pF2B14m1lzjgCZMoYv4vIYU7N9ZTPedUtomjFzfIyDIyB8nmOeAvg/JgTs1jtTNB
 xNpYQa76FB3paI8IQBCpzJAzFAre+3Z5H9yqXong0deqCxTXdLcUZmyQhbqL7nkjLa
 PeoQvTYWMYZEbkoK2RNlKevW+foClFiEAPVK1DlAk7h9DmtKxYYo9fqGX7gagroAAb
 fvgmBWZpUeycQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Thu, 10 Feb 2022 22:11:54 -0800
Message-Id: <20220211061158.227688-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220211061158.227688-1-ebiggers@kernel.org>
References: <20220211061158.227688-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Add support for
 STATX_IOALIGN to ext4,
 so that I/O alignment information is exposed to userspace in a consistent
 and easy-to-use way. Signed-off-by: Eric Biggers <ebiggers@google.com> ---
 fs/ext4/ext4.h | 1 + fs/ext4/file.c | 15 ++++ fs/ext4/inode.c | 31
 +++++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 1 [...] 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nIPBa-0004i5-Ba
Subject: [f2fs-dev] [RFC PATCH 3/7] ext4: support STATX_IOALIGN
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
Cc: linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Add support for STATX_IOALIGN to ext4, so that I/O alignment information
is exposed to userspace in a consistent and easy-to-use way.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/ext4.h  |  1 +
 fs/ext4/file.c  | 15 ++++-----------
 fs/ext4/inode.c | 31 +++++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index bcd3b9bf8069b..fcab9713005fa 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -3014,6 +3014,7 @@ extern struct inode *__ext4_iget(struct super_block *sb, unsigned long ino,
 extern int  ext4_write_inode(struct inode *, struct writeback_control *);
 extern int  ext4_setattr(struct user_namespace *, struct dentry *,
 			 struct iattr *);
+extern u32  ext4_dio_alignment(struct inode *inode);
 extern int  ext4_getattr(struct user_namespace *, const struct path *,
 			 struct kstat *, u32, unsigned int);
 extern void ext4_evict_inode(struct inode *);
diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index b68706f7db439..9c34f827a021f 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -39,19 +39,12 @@
 static bool ext4_dio_supported(struct kiocb *iocb, struct iov_iter *iter)
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
-		return false;
-	if (ext4_should_journal_data(inode))
+	if (!dio_align)
 		return false;
-	if (ext4_has_inline_data(inode))
+	if (dio_align > bdev_logical_block_size(inode->i_sb->s_bdev) &&
+	    !IS_ALIGNED(iocb->ki_pos | iov_iter_alignment(iter), dio_align))
 		return false;
 	return true;
 }
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 4cf55ef54193a..8c9d124a6378c 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -5493,6 +5493,22 @@ int ext4_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
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
+	return bdev_logical_block_size(inode->i_sb->s_bdev);
+}
+
 int ext4_getattr(struct user_namespace *mnt_userns, const struct path *path,
 		 struct kstat *stat, u32 request_mask, unsigned int query_flags)
 {
@@ -5508,6 +5524,21 @@ int ext4_getattr(struct user_namespace *mnt_userns, const struct path *path,
 		stat->btime.tv_nsec = ei->i_crtime.tv_nsec;
 	}
 
+	/*
+	 * Return the I/O alignment information if requested.  We only return
+	 * this information when requested, since on encrypted files it might
+	 * take a fair bit of work to get if the file wasn't opened recently.
+	 */
+	if ((request_mask & STATX_IOALIGN) && S_ISREG(inode->i_mode)) {
+		u32 dio_align = ext4_dio_alignment(inode);
+		unsigned int io_opt = bdev_io_opt(inode->i_sb->s_bdev);
+
+		stat->result_mask |= STATX_IOALIGN;
+		stat->mem_align_dio = dio_align;
+		stat->offset_align_dio = dio_align;
+		stat->offset_align_optimal = max(io_opt, i_blocksize(inode));
+	}
+
 	flags = ei->i_flags & EXT4_FL_USER_VISIBLE;
 	if (flags & EXT4_APPEND_FL)
 		stat->attributes |= STATX_ATTR_APPEND;
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
