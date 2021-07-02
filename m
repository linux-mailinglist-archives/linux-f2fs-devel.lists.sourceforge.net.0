Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC863B9C88
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Jul 2021 08:55:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lzD4r-00082b-81; Fri, 02 Jul 2021 06:55:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1lzD4p-00082M-Hh
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Jul 2021 06:55:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O3NGSCkh0hnQlaNEpxOcMwB9yIc4wz9Bkksdr179CJg=; b=ef2Efmn56fqD+cvBrgOoOqh9Lo
 8EbwPJ0hI5I1eSQZ1BhRz1f1Of/WwCgZnOLQu1iQ+mDkfNnLgIHm/xvXlbsm3jPaHy3LdnvwQx0f7
 5Xjy14LDvBMRtszPg1iuBxTPQOxKik8UyV4gPDFxTlPH7XzUOD7PcvDGtAu8Gtim2QDw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O3NGSCkh0hnQlaNEpxOcMwB9yIc4wz9Bkksdr179CJg=; b=dOJxZxtVxsDOqA0Prz0MEl7h/d
 Cq66OkKPpm6OIoudLnyC7u2pgOwGZ3cMA+P8ISBvACASGbEUMZtzLXRrOCqdmunjgvjJtoeOIj+hQ
 7lsCl3ZJkJomRXqridnk2XE55ejv/n744YMgd1kcz0Uo0YBGZR5BWuLqamuvElfUyGfw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lzD4m-0004OM-Vh
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Jul 2021 06:55:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 659D461413;
 Fri,  2 Jul 2021 06:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625208891;
 bh=oytk1FqAK/cRWx3e72Lrjf5gkgDm1h+IK3FE/F4jrDw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fBRQEhrJJ96bGUI9d8xd7QPa3WJ5ACNQiNFFlLiciyLDX/+kJJiMK4kdY7t2a/Hu8
 L/JOKII31seusjSyqQH0p0zJVYGN3K/WIcgd4EvZ76bvtCnhC2R1Qi/gBZ1nIw4M5l
 /qtnEb4tJYlMpY81DoSUpGC6zCG/nQqQ/+GfV7vfTFAIkkyWTE3QNeeLSLVuC6wUlG
 ZFUirevxfCcRDTK+uQT13qFXoBgPqyIzKhznOb6tw3I87oy1lri67ZPC8T7fSxItPB
 ZiksVnwYTJeunNRiKmM8dyfsMgSZAi9iigVse/a8GYIuCo22x+3oUZcck+67uOfckh
 4dfuQHiZ4sTjQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Thu,  1 Jul 2021 23:53:48 -0700
Message-Id: <20210702065350.209646-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210702065350.209646-1-ebiggers@kernel.org>
References: <20210702065350.209646-1-ebiggers@kernel.org>
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
X-Headers-End: 1lzD4m-0004OM-Vh
Subject: [f2fs-dev] [PATCH 3/5] f2fs: report correct st_size for encrypted
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

The stat() family of syscalls report the wrong size for encrypted
symlinks, which has caused breakage in several userspace programs.

Fix this by calling fscrypt_symlink_getattr() after f2fs_getattr() for
encrypted symlinks.  This function computes the correct size by reading
and decrypting the symlink target (if it's not already cached).

For more details, see the commit which added fscrypt_symlink_getattr().

Fixes: cbaf042a3cc6 ("f2fs crypto: add symlink encryption")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/namei.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index a9cd9cf97229..e2d540ae2293 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -1305,9 +1305,19 @@ static const char *f2fs_encrypted_get_link(struct dentry *dentry,
 	return target;
 }
 
+static int f2fs_encrypted_symlink_getattr(struct user_namespace *mnt_userns,
+					  const struct path *path,
+					  struct kstat *stat, u32 request_mask,
+					  unsigned int query_flags)
+{
+	f2fs_getattr(mnt_userns, path, stat, request_mask, query_flags);
+
+	return fscrypt_symlink_getattr(path, stat);
+}
+
 const struct inode_operations f2fs_encrypted_symlink_inode_operations = {
 	.get_link	= f2fs_encrypted_get_link,
-	.getattr	= f2fs_getattr,
+	.getattr	= f2fs_encrypted_symlink_getattr,
 	.setattr	= f2fs_setattr,
 	.listxattr	= f2fs_listxattr,
 };
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
