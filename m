Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2121B9DF7B0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Dec 2024 02:10:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tHuwr-0003bB-DJ;
	Mon, 02 Dec 2024 01:10:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1tHuwp-0003ZL-7A
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Dec 2024 01:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hdpLlMUCirJAUkXR86UAeieeAY737MZjkGDM93jO0a8=; b=nWiSKz88ok6IheUXR4SG95blwX
 e3jT757ytdNP21+ge/l00P27h9w4k7UZmo5X75+UlrNEFCmStFabTyHfnFo/OQ30mv9IsySXa8tTz
 Bqi0PXUZ89rzIZX7jWKvzhbxEqcswTdUuDw/pvAiVT7puP2P8Z5DRs5bzCp+qfi8Dzrw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hdpLlMUCirJAUkXR86UAeieeAY737MZjkGDM93jO0a8=; b=KDo4TjyyXAfYV/3D4NYfGGaZl+
 Ex1ZboaC3NqeFKHSkwGxZAtwS1+M1B/tCdBQwPehDZq/lGDj3FrWCrv6p3wZI4DgqJVZNWm/zrhRx
 XkVBLAzww+omOvfRgdb8T3VmdVV7O6MsCW5rMp3fpoGM5TPZqG7wYsbcS9ykghQLcSaA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tHuwf-0006ML-Ca for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Dec 2024 01:09:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 66CBE5C64E4;
 Mon,  2 Dec 2024 01:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67E5C4CEDC;
 Mon,  2 Dec 2024 01:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733101778;
 bh=KoUVq0drmqDqH2C3r8/i3kiLa4MEP4LpLWyGCvNZTpc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mYB6xWFB5p3wQOx9VHLybImcjIyOOm10NEjAsKMz0V9qmNxy7Th7UPbGJo8J96+vp
 fZmsVjnvHF4t2qe5xRLZ7LeZqfuvLl5/ym3ri7geL25mgb7TzB5ekEZB31vxqqdXwh
 g1v8AyUfJLEr5SlG0UQZFrddNfrGVpUQMFa1AUOCpsWqj1goJns0XIJssUbF5rKT3k
 R8voy7flPqVk0dH8j7P31ok9zo0IGEBxDbXem7pEaoQ+QIFIYjWhTZZ9FFeqJWITAx
 G8YoYTi2/CYEZafc4fippB4FQCDX8/kv66SY8bCormq9CW8Q1uMqEKZpmdcOLr5GuQ
 wznRVzs5HqmAg==
To: linux-kernel@vger.kernel.org
Date: Sun,  1 Dec 2024 17:08:41 -0800
Message-ID: <20241202010844.144356-17-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202010844.144356-1-ebiggers@kernel.org>
References: <20241202010844.144356-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -8.2 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Now that the
 crc32c()
 library function directly takes advantage of architecture-specific
 optimizations, 
 it is unnecessary to go through the crypto API. Just use crc32c(). This is
 much simpler, and it [...] 
 Content analysis details:   (-8.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tHuwf-0006ML-Ca
Subject: [f2fs-dev] [PATCH v4 16/19] ext4: switch to using the crc32c library
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, linux-scsi@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>, x86@kernel.org,
 linux-mips@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Now that the crc32c() library function directly takes advantage of
architecture-specific optimizations, it is unnecessary to go through the
crypto API.  Just use crc32c().  This is much simpler, and it improves
performance due to eliminating the crypto API overhead.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Acked-by: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/Kconfig |  3 +--
 fs/ext4/ext4.h  | 25 +++----------------------
 fs/ext4/super.c | 15 ---------------
 3 files changed, 4 insertions(+), 39 deletions(-)

diff --git a/fs/ext4/Kconfig b/fs/ext4/Kconfig
index e20d59221fc0..c9ca41d91a6c 100644
--- a/fs/ext4/Kconfig
+++ b/fs/ext4/Kconfig
@@ -29,12 +29,11 @@ config EXT3_FS_SECURITY
 config EXT4_FS
 	tristate "The Extended 4 (ext4) filesystem"
 	select BUFFER_HEAD
 	select JBD2
 	select CRC16
-	select CRYPTO
-	select CRYPTO_CRC32C
+	select CRC32
 	select FS_IOMAP
 	select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
 	help
 	  This is the next generation of the ext3 filesystem.
 
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 74f2071189b2..4e7de7eaa374 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -31,11 +31,11 @@
 #include <linux/wait.h>
 #include <linux/sched/signal.h>
 #include <linux/blockgroup_lock.h>
 #include <linux/percpu_counter.h>
 #include <linux/ratelimit.h>
-#include <crypto/hash.h>
+#include <linux/crc32c.h>
 #include <linux/falloc.h>
 #include <linux/percpu-rwsem.h>
 #include <linux/fiemap.h>
 #ifdef __KERNEL__
 #include <linux/compat.h>
@@ -1660,13 +1660,10 @@ struct ext4_sb_info {
 	struct task_struct *s_mmp_tsk;
 
 	/* record the last minlen when FITRIM is called. */
 	unsigned long s_last_trim_minblks;
 
-	/* Reference to checksum algorithm driver via cryptoapi */
-	struct crypto_shash *s_chksum_driver;
-
 	/* Precomputed FS UUID checksum for seeding other checksums */
 	__u32 s_csum_seed;
 
 	/* Reclaim extents from extent status tree */
 	struct shrinker *s_es_shrinker;
@@ -2461,23 +2458,11 @@ static inline __le16 ext4_rec_len_to_disk(unsigned len, unsigned blocksize)
 #define DX_HASH_LAST 			DX_HASH_SIPHASH
 
 static inline u32 ext4_chksum(struct ext4_sb_info *sbi, u32 crc,
 			      const void *address, unsigned int length)
 {
-	struct {
-		struct shash_desc shash;
-		char ctx[4];
-	} desc;
-
-	BUG_ON(crypto_shash_descsize(sbi->s_chksum_driver)!=sizeof(desc.ctx));
-
-	desc.shash.tfm = sbi->s_chksum_driver;
-	*(u32 *)desc.ctx = crc;
-
-	BUG_ON(crypto_shash_update(&desc.shash, address, length));
-
-	return *(u32 *)desc.ctx;
+	return crc32c(crc, address, length);
 }
 
 #ifdef __KERNEL__
 
 /* hash info structure used by the directory hash */
@@ -3274,15 +3259,11 @@ extern void ext4_group_desc_csum_set(struct super_block *sb, __u32 group,
 extern int ext4_register_li_request(struct super_block *sb,
 				    ext4_group_t first_not_zeroed);
 
 static inline int ext4_has_metadata_csum(struct super_block *sb)
 {
-	WARN_ON_ONCE(ext4_has_feature_metadata_csum(sb) &&
-		     !EXT4_SB(sb)->s_chksum_driver);
-
-	return ext4_has_feature_metadata_csum(sb) &&
-	       (EXT4_SB(sb)->s_chksum_driver != NULL);
+	return ext4_has_feature_metadata_csum(sb);
 }
 
 static inline int ext4_has_group_desc_csum(struct super_block *sb)
 {
 	return ext4_has_feature_gdt_csum(sb) || ext4_has_metadata_csum(sb);
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 785809f33ff4..fdf4817a7dbc 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1378,12 +1378,10 @@ static void ext4_put_super(struct super_block *sb)
 	 * Now that we are completely done shutting down the
 	 * superblock, we need to actually destroy the kobject.
 	 */
 	kobject_put(&sbi->s_kobj);
 	wait_for_completion(&sbi->s_kobj_unregister);
-	if (sbi->s_chksum_driver)
-		crypto_free_shash(sbi->s_chksum_driver);
 	kfree(sbi->s_blockgroup_lock);
 	fs_put_dax(sbi->s_daxdev, NULL);
 	fscrypt_free_dummy_policy(&sbi->s_dummy_enc_policy);
 #if IS_ENABLED(CONFIG_UNICODE)
 	utf8_unload(sb->s_encoding);
@@ -4632,19 +4630,10 @@ static int ext4_init_metadata_csum(struct super_block *sb, struct ext4_super_blo
 		return -EINVAL;
 	}
 	ext4_setup_csum_trigger(sb, EXT4_JTR_ORPHAN_FILE,
 				ext4_orphan_file_block_trigger);
 
-	/* Load the checksum driver */
-	sbi->s_chksum_driver = crypto_alloc_shash("crc32c", 0, 0);
-	if (IS_ERR(sbi->s_chksum_driver)) {
-		int ret = PTR_ERR(sbi->s_chksum_driver);
-		ext4_msg(sb, KERN_ERR, "Cannot load crc32c driver.");
-		sbi->s_chksum_driver = NULL;
-		return ret;
-	}
-
 	/* Check superblock checksum */
 	if (!ext4_superblock_csum_verify(sb, es)) {
 		ext4_msg(sb, KERN_ERR, "VFS: Found ext4 filesystem with "
 			 "invalid superblock checksum.  Run e2fsck?");
 		return -EFSBADCRC;
@@ -5685,13 +5674,10 @@ failed_mount8: __maybe_unused
 	flush_work(&sbi->s_sb_upd_work);
 	ext4_stop_mmpd(sbi);
 	del_timer_sync(&sbi->s_err_report);
 	ext4_group_desc_free(sbi);
 failed_mount:
-	if (sbi->s_chksum_driver)
-		crypto_free_shash(sbi->s_chksum_driver);
-
 #if IS_ENABLED(CONFIG_UNICODE)
 	utf8_unload(sb->s_encoding);
 #endif
 
 #ifdef CONFIG_QUOTA
@@ -7492,8 +7478,7 @@ static void __exit ext4_exit_fs(void)
 }
 
 MODULE_AUTHOR("Remy Card, Stephen Tweedie, Andrew Morton, Andreas Dilger, Theodore Ts'o and others");
 MODULE_DESCRIPTION("Fourth Extended Filesystem");
 MODULE_LICENSE("GPL");
-MODULE_SOFTDEP("pre: crc32c");
 module_init(ext4_init_fs)
 module_exit(ext4_exit_fs)
-- 
2.47.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
