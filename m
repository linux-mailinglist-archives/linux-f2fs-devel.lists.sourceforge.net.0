Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE5424F264
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Aug 2020 08:18:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kA5oT-0000vE-NE; Mon, 24 Aug 2020 06:18:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kA5oR-0000v0-Jr
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Aug 2020 06:18:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5hAA+wCyPe8fM5j4dMXVkijwsZ/Ria5XYU8I4epx544=; b=jRex+FiB+FtWTQlT9BCm4bkNLr
 LgqDte7D0z0U2WdjKy6DjHcqMHNgHHmbfdcaN2oZ9mTiMK+IpADizD+ThUhhPPVchcvZsdeya/RZl
 gTSrYKrvi8IqX9NuVGKHLB53GMLajZoIrzNNOH9QVr9UnnrrrHsF/QHlrYfwagsufn28=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5hAA+wCyPe8fM5j4dMXVkijwsZ/Ria5XYU8I4epx544=; b=m0qtE0Yxw8rt2Fi7QCYX20OZAM
 Qf5frKnduer5Uj1mW4qBg+JSaoUOg711zB6YEeltGdbA6SfFeW0KOkJHVXOLybfIQSpzId8yp6IBR
 SU+6aEeR59LseFTi9FP29i6Ds73VKwlm79zodR39uOjcKQxfQQYHHHYIdNphofCaP+NA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kA5oQ-002Evl-Ff
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Aug 2020 06:18:35 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 92272214F1;
 Mon, 24 Aug 2020 06:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598249899;
 bh=z1QylT8I+NmBP0tutYhzY5oX1yelfT7mim0uD9smtgw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J03KdJQJPdY77kdOSQzv1oF4glUgsguRLqZPw0bmItnjV4mkJE5kE2RoajSp2OA2U
 27gS97vYGnq70XXtnvPMkPnmelOpJ2j1BFFb6SLZjQ7BCzkaB8YdwP8CBA5bGWNP6A
 Kp0XyIGXauI0bFNXQVHCYVjI6Ho7Gg6A1rHVfTck=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sun, 23 Aug 2020 23:17:09 -0700
Message-Id: <20200824061712.195654-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200824061712.195654-1-ebiggers@kernel.org>
References: <20200824061712.195654-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kA5oQ-002Evl-Ff
Subject: [f2fs-dev] [RFC PATCH 5/8] f2fs: use fscrypt_prepare_new_inode()
 and fscrypt_set_context()
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
Cc: Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Convert f2fs to use the new functions fscrypt_prepare_new_inode() and
fscrypt_set_context().  This avoids calling
fscrypt_get_encryption_info() from under f2fs_lock_op(), which can
deadlock because fscrypt_get_encryption_info() isn't GFP_NOFS-safe.

For more details about this problem, see the earlier patch
"fscrypt: add fscrypt_prepare_new_inode() and fscrypt_set_context()".

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/dir.c   |  2 +-
 fs/f2fs/f2fs.h  | 16 ----------------
 fs/f2fs/namei.c |  7 ++++++-
 3 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 069f498af1e38..d627ca97fc500 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -537,7 +537,7 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 			goto put_error;
 
 		if (IS_ENCRYPTED(inode)) {
-			err = fscrypt_inherit_context(dir, inode, page, false);
+			err = fscrypt_set_context(inode, page);
 			if (err)
 				goto put_error;
 		}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 16322ea5b4630..eb37d1974ba8e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4022,22 +4022,6 @@ static inline bool f2fs_lfs_mode(struct f2fs_sb_info *sbi)
 	return F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS;
 }
 
-static inline bool f2fs_may_encrypt(struct inode *dir, struct inode *inode)
-{
-#ifdef CONFIG_FS_ENCRYPTION
-	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
-	umode_t mode = inode->i_mode;
-
-	/*
-	 * If the directory encrypted or dummy encryption enabled,
-	 * then we should encrypt the inode.
-	 */
-	if (IS_ENCRYPTED(dir) || DUMMY_ENCRYPTION_ENABLED(sbi))
-		return (S_ISREG(mode) || S_ISDIR(mode) || S_ISLNK(mode));
-#endif
-	return false;
-}
-
 static inline bool f2fs_may_compress(struct inode *inode)
 {
 	if (IS_SWAPFILE(inode) || f2fs_is_pinned_file(inode) ||
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 84e4bbc1a64de..45f324511a19e 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -28,6 +28,7 @@ static struct inode *f2fs_new_inode(struct inode *dir, umode_t mode)
 	nid_t ino;
 	struct inode *inode;
 	bool nid_free = false;
+	bool encrypt = false;
 	int xattr_size = 0;
 	int err;
 
@@ -69,13 +70,17 @@ static struct inode *f2fs_new_inode(struct inode *dir, umode_t mode)
 		F2FS_I(inode)->i_projid = make_kprojid(&init_user_ns,
 							F2FS_DEF_PROJID);
 
+	err = fscrypt_prepare_new_inode(dir, inode, &encrypt);
+	if (err)
+		goto fail_drop;
+
 	err = dquot_initialize(inode);
 	if (err)
 		goto fail_drop;
 
 	set_inode_flag(inode, FI_NEW_INODE);
 
-	if (f2fs_may_encrypt(dir, inode))
+	if (encrypt)
 		f2fs_set_encrypted_inode(inode);
 
 	if (f2fs_sb_has_extra_attr(sbi)) {
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
