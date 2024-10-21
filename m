Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA199A57C0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Oct 2024 02:30:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t2gJO-0005ij-Gu;
	Mon, 21 Oct 2024 00:30:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1t2gJH-0005hO-Cs
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Oct 2024 00:30:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k/OfLUqQHLysvg3ybfXGU6fWaoCD3U2ehR5MGc2/rak=; b=QlX3AmFE+ClLZqQM0aOrmp6G3H
 PWqyPuK1ByFM7nVCwZ+QDFNPqDhdXipd9V31LFx+doL/5QWS9nibsMwVOJMhHHeXqwLZR6FBP8OUH
 6R872itRVNXaTfiMupMkzvVYwUog6DGmVTkn9OltjA+/dSUAkebjf0H8bHiD190QQzBE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k/OfLUqQHLysvg3ybfXGU6fWaoCD3U2ehR5MGc2/rak=; b=NcKQlyQwkTN6UG0ukuygSweqTR
 Gjnh4yf0/9iBNaSDbqOI34B1gfBdWCNAgC23p9ocIPYws1fuKjXnnqNvFc8JOKWfW3eRr06/A88Wj
 rH/M2QhmH4ma5gnzpiwtxciz2mLPFdNVYcH6Z1cDpWbdFZ9J9rkgPFoauJeEzC9ujvyY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t2gJF-0003tj-W5 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Oct 2024 00:30:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B3AC55C5815;
 Mon, 21 Oct 2024 00:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B75C4CEE5;
 Mon, 21 Oct 2024 00:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729470598;
 bh=2edVn3yzlgvTIcU4OYne6VaRBmOeBMvpuDRrHbVNdrI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NFFk4W0dyvHD7M3v36IIWTb5ySBBZX5uZ/VLRYiArPPR5++D/baWB8d+lyfAaBOhk
 rztTLk/6ilOUZBWwQxzKVpNgy7hbS+bAqO2cV8DFYmzWDyAaKEezQcPZFBrYh8vShT
 roh7zUz+tjlNZy+E9vuB5Q59JQnN14hGjhkd5gjyQeUJqlHGIc+Uf3/5EwjEZ4O6Ps
 TvEpzXEcAb/PHAsselt3G1remC4TFMm//VXM0Ciyn11PZQ9zsIxfN5iARYumUTBA9J
 8pJ0BrJoKwcW+JUENnQzEDWoyb2qcx6NpA2gan0ia3pz9LbggvtIVcVcrMMhn+Rn2b
 w+zTkdQuRqfwg==
To: linux-kernel@vger.kernel.org
Date: Sun, 20 Oct 2024 17:29:35 -0700
Message-ID: <20241021002935.325878-16-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021002935.325878-1-ebiggers@kernel.org>
References: <20241021002935.325878-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Now that the crc32()
 library function takes advantage of architecture-specific optimizations,
 it is unnecessary to go through the crypto API. Just use crc32(). This is
 much simpler, and it improves pe [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t2gJF-0003tj-W5
Subject: [f2fs-dev] [PATCH 15/15] f2fs: switch to using the crc32 library
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-mips@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Now that the crc32() library function takes advantage of
architecture-specific optimizations, it is unnecessary to go through the
crypto API.  Just use crc32().  This is much simpler, and it improves
performance due to eliminating the crypto API overhead.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/Kconfig |  3 +--
 fs/f2fs/f2fs.h  | 19 +------------------
 fs/f2fs/super.c | 15 ---------------
 3 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index 68a1e23e1557c..5916a02fb46dd 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -2,12 +2,11 @@
 config F2FS_FS
 	tristate "F2FS filesystem support"
 	depends on BLOCK
 	select BUFFER_HEAD
 	select NLS
-	select CRYPTO
-	select CRYPTO_CRC32
+	select CRC32
 	select F2FS_FS_XATTR if FS_ENCRYPTION
 	select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
 	select FS_IOMAP
 	select LZ4_COMPRESS if F2FS_FS_LZ4
 	select LZ4_DECOMPRESS if F2FS_FS_LZ4
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 33f5449dc22d5..1fc5c2743c8d4 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1761,13 +1761,10 @@ struct f2fs_sb_info {
 
 	/* For write statistics */
 	u64 sectors_written_start;
 	u64 kbytes_written;
 
-	/* Reference to checksum algorithm driver via cryptoapi */
-	struct crypto_shash *s_chksum_driver;
-
 	/* Precomputed FS UUID checksum for seeding other checksums */
 	__u32 s_chksum_seed;
 
 	struct workqueue_struct *post_read_wq;	/* post read workqueue */
 
@@ -1941,25 +1938,11 @@ static inline unsigned int f2fs_time_to_wait(struct f2fs_sb_info *sbi,
  * Inline functions
  */
 static inline u32 __f2fs_crc32(struct f2fs_sb_info *sbi, u32 crc,
 			      const void *address, unsigned int length)
 {
-	struct {
-		struct shash_desc shash;
-		char ctx[4];
-	} desc;
-	int err;
-
-	BUG_ON(crypto_shash_descsize(sbi->s_chksum_driver) != sizeof(desc.ctx));
-
-	desc.shash.tfm = sbi->s_chksum_driver;
-	*(u32 *)desc.ctx = crc;
-
-	err = crypto_shash_update(&desc.shash, address, length);
-	BUG_ON(err);
-
-	return *(u32 *)desc.ctx;
+	return crc32(crc, address, length);
 }
 
 static inline u32 f2fs_crc32(struct f2fs_sb_info *sbi, const void *address,
 			   unsigned int length)
 {
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 87ab5696bd482..003d3bcb0caa2 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1670,12 +1670,10 @@ static void f2fs_put_super(struct super_block *sb)
 
 	f2fs_destroy_post_read_wq(sbi);
 
 	kvfree(sbi->ckpt);
 
-	if (sbi->s_chksum_driver)
-		crypto_free_shash(sbi->s_chksum_driver);
 	kfree(sbi->raw_super);
 
 	f2fs_destroy_page_array_cache(sbi);
 	f2fs_destroy_xattr_caches(sbi);
 #ifdef CONFIG_QUOTA
@@ -4419,19 +4417,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		INIT_LIST_HEAD(&sbi->inode_list[i]);
 		spin_lock_init(&sbi->inode_lock[i]);
 	}
 	mutex_init(&sbi->flush_lock);
 
-	/* Load the checksum driver */
-	sbi->s_chksum_driver = crypto_alloc_shash("crc32", 0, 0);
-	if (IS_ERR(sbi->s_chksum_driver)) {
-		f2fs_err(sbi, "Cannot load crc32 driver.");
-		err = PTR_ERR(sbi->s_chksum_driver);
-		sbi->s_chksum_driver = NULL;
-		goto free_sbi;
-	}
-
 	/* set a block size */
 	if (unlikely(!sb_set_blocksize(sb, F2FS_BLKSIZE))) {
 		f2fs_err(sbi, "unable to set blocksize");
 		goto free_sbi;
 	}
@@ -4872,12 +4861,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	fscrypt_free_dummy_policy(&F2FS_OPTION(sbi).dummy_enc_policy);
 	kvfree(options);
 free_sb_buf:
 	kfree(raw_super);
 free_sbi:
-	if (sbi->s_chksum_driver)
-		crypto_free_shash(sbi->s_chksum_driver);
 	kfree(sbi);
 	sb->s_fs_info = NULL;
 
 	/* give only one another chance */
 	if (retry_cnt > 0 && skip_recovery) {
@@ -5080,7 +5067,5 @@ module_init(init_f2fs_fs)
 module_exit(exit_f2fs_fs)
 
 MODULE_AUTHOR("Samsung Electronics's Praesto Team");
 MODULE_DESCRIPTION("Flash Friendly File System");
 MODULE_LICENSE("GPL");
-MODULE_SOFTDEP("pre: crc32");
-
-- 
2.47.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
