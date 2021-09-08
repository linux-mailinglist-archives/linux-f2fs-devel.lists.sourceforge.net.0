Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7958C4040BE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Sep 2021 23:51:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mO5Tv-0004BZ-7g; Wed, 08 Sep 2021 21:51:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1mO5Tt-0004BT-Dv
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Sep 2021 21:51:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+Gh3uUeccBpyVomCIlekGcz2B4AV+XF0RcbdvCeX4X0=; b=dexSqwxsClR+zE/mrQMP6hoHSQ
 6ACaqX2pIZwxvABoiSQYzuEuoxPObKxu8pNOK/td5nh4Fmh2q5cx5e2wBEdXi8Yw9Y58Br92/9927
 ql8cE46yh4EfxiDk+vnYF2iJ1p6dDm3PqyVmHLtLcZZvug8FEtyggoPZGFFUSCyJfFXQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+Gh3uUeccBpyVomCIlekGcz2B4AV+XF0RcbdvCeX4X0=; b=IKdkonm9ZZKZHh3so0Nv7QgUCg
 3kDBR3zzlhE5c7PrriiPPFF5uH2pyhuJwfsE/iipA4lbkWpGBogzaP2NqFMDTvZ5Rvc8mpmsD0JZi
 Kks+G5LW1ENEpC//nJz4dwy44rxeLc/LlQvjrk3vzvhnlv/nJKiOgzu9zEhiRO7jHoG0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mO5Tp-0003YV-JY
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Sep 2021 21:51:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE0216115B;
 Wed,  8 Sep 2021 21:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631137889;
 bh=Q7/Auj+gxb7Tq2h7AKECQp7f+V7wXd8uIeRwsSwC2uI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g6B3xPzWzmSOWbVujz05WcWiMqbJmrvjf663bftxNBe3SpFvKrqnf9HjmQt02WCYM
 SWydEF5fnJe2PDJt02TSsWwnOJNVN0DQIA8QyX31MW4y4bh6/xnq2+ec4fqkHIuubd
 SvzFgbwlnsZrqqazTbtxtlvrW9iAUFJ0MBEqmS/KMjUsF4ZUwPLf58CtQO2n3YuINH
 mUhMtIpAHEDSWvdU8iX5EZZMCqDZHUUQ0lA4wUD7b1eC2QFKcNXTByJg0iLHO3eXl9
 YqTesOY0LwkjQtsa9SStbmzHvBr/PfEGeGubbTW0QRwltraAP+uT2feQHOEReo6aol
 SXsE9sw2hR4Kw==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Date: Wed,  8 Sep 2021 14:50:33 -0700
Message-Id: <20210908215033.1122580-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
In-Reply-To: <20210908215033.1122580-1-ebiggers@kernel.org>
References: <20210908215033.1122580-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 2.0 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mO5Tp-0003YV-JY
Subject: [f2fs-dev] [PATCH 4/4] ubifs: report correct st_size for encrypted
 symlinks
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

commit 064c734986011390b4d111f1a99372b7f26c3850 upstream.

The stat() family of syscalls report the wrong size for encrypted
symlinks, which has caused breakage in several userspace programs.

Fix this by calling fscrypt_symlink_getattr() after ubifs_getattr() for
encrypted symlinks.  This function computes the correct size by reading
and decrypting the symlink target (if it's not already cached).

For more details, see the commit which added fscrypt_symlink_getattr().

Fixes: ca7f85be8d6c ("ubifs: Add support for encrypted symlinks")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20210702065350.209646-5-ebiggers@kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ubifs/file.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index d7d2fdda4bbd..3dbb5ac630e4 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1642,6 +1642,16 @@ static const char *ubifs_get_link(struct dentry *dentry,
 	return fscrypt_get_symlink(inode, ui->data, ui->data_len, done);
 }
 
+static int ubifs_symlink_getattr(const struct path *path, struct kstat *stat,
+				 u32 request_mask, unsigned int query_flags)
+{
+	ubifs_getattr(path, stat, request_mask, query_flags);
+
+	if (IS_ENCRYPTED(d_inode(path->dentry)))
+		return fscrypt_symlink_getattr(path, stat);
+	return 0;
+}
+
 const struct address_space_operations ubifs_file_address_operations = {
 	.readpage       = ubifs_readpage,
 	.writepage      = ubifs_writepage,
@@ -1669,7 +1679,7 @@ const struct inode_operations ubifs_file_inode_operations = {
 const struct inode_operations ubifs_symlink_inode_operations = {
 	.get_link    = ubifs_get_link,
 	.setattr     = ubifs_setattr,
-	.getattr     = ubifs_getattr,
+	.getattr     = ubifs_symlink_getattr,
 #ifdef CONFIG_UBIFS_FS_XATTR
 	.listxattr   = ubifs_listxattr,
 #endif
-- 
2.33.0.153.gba50c8fa24-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
