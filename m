Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB9C79FE14
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Sep 2023 10:15:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qghV7-0000hQ-I2;
	Thu, 14 Sep 2023 08:15:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qghV5-0000h1-VF
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Sep 2023 08:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OzsB3ne8LPQcK1axEa6Zf8GMRlwdZ3Fkl0uUFjgBN8I=; b=gBVubvFy4NU8pBhYflDq48C2tP
 AHVaZHNB45NGGYMgQpqingHjFTNE+5YLqMCfaAWaQT8D7mD9G+URIdj3cW9QSuOKOF8jAu5OadkEK
 llbUE/YbPd2NWNDTnnouEsy2hgFZvEuatj6khKX5EYFdXO8UUyL4tF+2rVWQEKnaJDgA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OzsB3ne8LPQcK1axEa6Zf8GMRlwdZ3Fkl0uUFjgBN8I=; b=XRZN6l9DTWOWKEKQF2tUB2ptLY
 DWDo86pRPm/o82+lAxm2jAbuRgQXaT7W78RPsIpMiG9cfNjl3oCdsH/T3UCgFQv+8e1oDEJv4oxq2
 zIOI3yfgsRhJdVVOqYEtK/xc2q54iboZRu94VWtwI7CEQn9SmYPcsgTuWuXuGVKLkZwo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qghV2-005AYj-BZ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Sep 2023 08:15:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ECA9F61CB4;
 Thu, 14 Sep 2023 08:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B881C433CB;
 Thu, 14 Sep 2023 08:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694679290;
 bh=cdkAH/oskwHvzF8j12szEYgbjRbtZUXjU97VQhihgfw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Epb0jzo2Y5M8tvOFynD8JdYf2XrKhRdrms+dV1TRYHtgizjmhz7JQ2z3sjbrROjmI
 ow1Z3JjCpFx+DVF2BeXs0MoGhA/VLhRLfH9+eFkYxZnif/TXqNNrpM3WzlywwuutI3
 sk8Httf9+1G1RJzFnXV539Dj/L+L1GkhpuD+AxP1j0+HWIliJBoOEl89/mvdeOtE/P
 4FgSh8tipx0+JLG9paJ1ZTqLosdS16lFUdHYL3dRYiiNT49f4Xo5DwgF3YOUCa0k7M
 Kq1KF0errdmA7q9LyRZogmL2LZMrXmy3+nMLl9vdPhqPzzohVQm2CVqo5fk3FPWsrK
 ki9XXhnpX4tsQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Thu, 14 Sep 2023 01:12:52 -0700
Message-ID: <20230914081255.193502-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230914081255.193502-1-ebiggers@kernel.org>
References: <20230914081255.193502-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Replace
 FS_CFLG_OWN_PAGES
 with a bit flag 'needs_bounce_pages' which has the opposite meaning. I.e.,
 filesystems now opt into the bounce page pool instead of opt out. Make
 fscrypt_alloc_bounce_page() [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qghV2-005AYj-BZ
Subject: [f2fs-dev] [PATCH v2 2/5] fscrypt: make the bounce page pool opt-in
 instead of opt-out
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Replace FS_CFLG_OWN_PAGES with a bit flag 'needs_bounce_pages' which has
the opposite meaning.  I.e., filesystems now opt into the bounce page
pool instead of opt out.  Make fscrypt_alloc_bounce_page() check that
the bounce page pool has been initialized.

I believe the opt in makes more sense, since nothing else in
fscrypt_operations is opt out, and these days filesystems can choose to
use blk-crypto which doesn't need the fscrypt bounce page pool.  Also, I
happen to be planning to add two more flags, and I wanted to fix the
"FS_CFLG_" name anyway as it wasn't prefixed with "FSCRYPT_".

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ceph/crypto.c        |  1 +
 fs/crypto/crypto.c      |  9 ++++++++-
 fs/ext4/crypto.c        |  1 +
 fs/f2fs/super.c         |  1 +
 fs/ubifs/crypto.c       |  1 -
 include/linux/fscrypt.h | 19 ++++++++++---------
 6 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/fs/ceph/crypto.c b/fs/ceph/crypto.c
index e4d5cd56a80b9..cc63f1e6fdef6 100644
--- a/fs/ceph/crypto.c
+++ b/fs/ceph/crypto.c
@@ -133,6 +133,7 @@ static const union fscrypt_policy *ceph_get_dummy_policy(struct super_block *sb)
 }
 
 static struct fscrypt_operations ceph_fscrypt_ops = {
+	.needs_bounce_pages	= 1,
 	.get_context		= ceph_crypt_get_context,
 	.set_context		= ceph_crypt_set_context,
 	.get_dummy_policy	= ceph_get_dummy_policy,
diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 6a837e4b80dcb..803347a5d0a6d 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -49,6 +49,13 @@ EXPORT_SYMBOL(fscrypt_enqueue_decrypt_work);
 
 struct page *fscrypt_alloc_bounce_page(gfp_t gfp_flags)
 {
+	if (WARN_ON_ONCE(!fscrypt_bounce_page_pool)) {
+		/*
+		 * Oops, the filesystem called a function that uses the bounce
+		 * page pool, but it forgot to set needs_bounce_pages.
+		 */
+		return NULL;
+	}
 	return mempool_alloc(fscrypt_bounce_page_pool, gfp_flags);
 }
 
@@ -325,7 +332,7 @@ int fscrypt_initialize(struct super_block *sb)
 		return 0;
 
 	/* No need to allocate a bounce page pool if this FS won't use it. */
-	if (sb->s_cop->flags & FS_CFLG_OWN_PAGES)
+	if (!sb->s_cop->needs_bounce_pages)
 		return 0;
 
 	mutex_lock(&fscrypt_init_mutex);
diff --git a/fs/ext4/crypto.c b/fs/ext4/crypto.c
index 8cdb7bbc655b0..a9221be67f2a7 100644
--- a/fs/ext4/crypto.c
+++ b/fs/ext4/crypto.c
@@ -240,6 +240,7 @@ static void ext4_get_ino_and_lblk_bits(struct super_block *sb,
 }
 
 const struct fscrypt_operations ext4_cryptops = {
+	.needs_bounce_pages	= 1,
 	.legacy_key_prefix_for_backcompat = "ext4:",
 	.get_context		= ext4_get_context,
 	.set_context		= ext4_set_context,
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 8de799a8bad04..276535af5bf3c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3231,6 +3231,7 @@ static struct block_device **f2fs_get_devices(struct super_block *sb,
 }
 
 static const struct fscrypt_operations f2fs_cryptops = {
+	.needs_bounce_pages	= 1,
 	.legacy_key_prefix_for_backcompat = "f2fs:",
 	.get_context		= f2fs_get_context,
 	.set_context		= f2fs_set_context,
diff --git a/fs/ubifs/crypto.c b/fs/ubifs/crypto.c
index fab90f9a8eaff..f0ca403777d9a 100644
--- a/fs/ubifs/crypto.c
+++ b/fs/ubifs/crypto.c
@@ -88,7 +88,6 @@ int ubifs_decrypt(const struct inode *inode, struct ubifs_data_node *dn,
 }
 
 const struct fscrypt_operations ubifs_crypt_operations = {
-	.flags			= FS_CFLG_OWN_PAGES,
 	.legacy_key_prefix_for_backcompat = "ubifs:",
 	.get_context		= ubifs_crypt_get_context,
 	.set_context		= ubifs_crypt_set_context,
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 70e0d4917dd59..32290e5fa9abb 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -59,18 +59,19 @@ struct fscrypt_name {
 
 #ifdef CONFIG_FS_ENCRYPTION
 
-/*
- * If set, the fscrypt bounce page pool won't be allocated (unless another
- * filesystem needs it).  Set this if the filesystem always uses its own bounce
- * pages for writes and therefore won't need the fscrypt bounce page pool.
- */
-#define FS_CFLG_OWN_PAGES (1U << 1)
-
 /* Crypto operations for filesystems */
 struct fscrypt_operations {
 
-	/* Set of optional flags; see above for allowed flags */
-	unsigned int flags;
+	/*
+	 * If set, then fs/crypto/ will allocate a global bounce page pool.  The
+	 * bounce page pool is required by the following functions:
+	 *
+	 * - fscrypt_encrypt_pagecache_blocks()
+	 * - fscrypt_zeroout_range() for files not using inline crypto
+	 *
+	 * If the filesystem doesn't use those, it doesn't need to set this.
+	 */
+	unsigned int needs_bounce_pages : 1;
 
 	/*
 	 * This field exists only for backwards compatibility reasons and should
-- 
2.42.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
