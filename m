Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 481119A57B3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Oct 2024 02:30:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t2gJH-0001lM-IO;
	Mon, 21 Oct 2024 00:30:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1t2gJB-0001ky-QC
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Oct 2024 00:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LhGV10fDUMfbSCab0nex45a8ClhIsz2n3ws5TnM75Fg=; b=lPrs/j2jy3drANc1us/REFAbuB
 +AEGAjcQf+NhZT9D832YbnEZ8rMTLRqGzqOLxnnFQX8KfUnydduwxG+SgmY/a7+D8IlZBUIym7tQ0
 H8I7NQYZSOZ+aCgmsbrPO6/ZRkHkjtSiz+eDh9tQ84A4PU/k5v0XwVt+nUl1VEfhkhwc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LhGV10fDUMfbSCab0nex45a8ClhIsz2n3ws5TnM75Fg=; b=eORZozscsrRqyV/heIpnoyba/8
 vqEaRnu9YhqbtHTvY5mFA+yBRcTLihZbpdMASZ2tkeUGfyV3S6Ca4r4zeAE225FO/++2Nn9EFqRE+
 u+ej+JQ6NZDAZ15Q4MfZI1LAhETpGGZ1wWaSdP1u6rYOyV1HN36rE1Ikw9lYTL76iRHM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t2gJA-0003sx-PZ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Oct 2024 00:30:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2670A5C58BE;
 Mon, 21 Oct 2024 00:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061F5C4CEC7;
 Mon, 21 Oct 2024 00:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729470598;
 bh=4QrNTfxk1O5mqgXso3Uq4Yh9fW2+aliDT+yU3NaRHjU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FdOAy7ShO/AIu2M7e2/271mIPF14WPY1XGHVgfMkByCmqKJXATBSNW69jUcXasSIz
 6Oim46eD9B5dTBWt6nmgyPg4UMAVXuJsLkLL+lNyLjytgzlCpr3IPjkMy1DF6VXbar
 8EVzZ0DEKZjdRjWlu3y1BaS5OTSPA+DBPd/1Asf81CkRl4d93oeP0JqzLo4nbyKgju
 kvA4UB7p6kTLItgXAtWMSY3Dx+Sx3wdf7P779SJHNOVnq9iLuJxD3w2UJzHd7JnH/s
 Vsuq5JUbm9HNa0fHQQMHG2fJnZeTF+dB1XXhRygSUbwAeBQzflon+jFnPmh8rCiWoX
 mGjddyhl8fmVA==
To: linux-kernel@vger.kernel.org
Date: Sun, 20 Oct 2024 17:29:34 -0700
Message-ID: <20241021002935.325878-15-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021002935.325878-1-ebiggers@kernel.org>
References: <20241021002935.325878-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.2 (---)
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
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t2gJA-0003sx-PZ
Subject: [f2fs-dev] [PATCH 14/15] jbd2: switch to using the crc32c library
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

Now that the crc32c() library function directly takes advantage of
architecture-specific optimizations, it is unnecessary to go through the
crypto API.  Just use crc32c().  This is much simpler, and it improves
performance due to eliminating the crypto API overhead.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/jbd2/Kconfig      |  2 --
 fs/jbd2/journal.c    | 25 ++-----------------------
 include/linux/jbd2.h | 31 +++----------------------------
 3 files changed, 5 insertions(+), 53 deletions(-)

diff --git a/fs/jbd2/Kconfig b/fs/jbd2/Kconfig
index 4ad2c67f93f15..9c19e1512101e 100644
--- a/fs/jbd2/Kconfig
+++ b/fs/jbd2/Kconfig
@@ -1,11 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config JBD2
 	tristate
 	select CRC32
-	select CRYPTO
-	select CRYPTO_CRC32C
 	help
 	  This is a generic journaling layer for block devices that support
 	  both 32-bit and 64-bit block numbers.  It is currently used by
 	  the ext4 and OCFS2 filesystems, but it could also be used to add
 	  journal support to other file systems or block devices such
diff --git a/fs/jbd2/journal.c b/fs/jbd2/journal.c
index 97f487c3d8fcf..56cea5a738a70 100644
--- a/fs/jbd2/journal.c
+++ b/fs/jbd2/journal.c
@@ -1373,24 +1373,16 @@ static int journal_check_superblock(journal_t *journal)
 		printk(KERN_ERR "JBD2: Can't enable checksumming v1 and v2/3 "
 		       "at the same time!\n");
 		return err;
 	}
 
-	/* Load the checksum driver */
 	if (jbd2_journal_has_csum_v2or3_feature(journal)) {
 		if (sb->s_checksum_type != JBD2_CRC32C_CHKSUM) {
 			printk(KERN_ERR "JBD2: Unknown checksum type\n");
 			return err;
 		}
 
-		journal->j_chksum_driver = crypto_alloc_shash("crc32c", 0, 0);
-		if (IS_ERR(journal->j_chksum_driver)) {
-			printk(KERN_ERR "JBD2: Cannot load crc32c driver.\n");
-			err = PTR_ERR(journal->j_chksum_driver);
-			journal->j_chksum_driver = NULL;
-			return err;
-		}
 		/* Check superblock checksum */
 		if (sb->s_checksum != jbd2_superblock_csum(journal, sb)) {
 			printk(KERN_ERR "JBD2: journal checksum error\n");
 			err = -EFSBADCRC;
 			return err;
@@ -1611,12 +1603,10 @@ static journal_t *journal_init_common(struct block_device *bdev,
 
 	return journal;
 
 err_cleanup:
 	percpu_counter_destroy(&journal->j_checkpoint_jh_count);
-	if (journal->j_chksum_driver)
-		crypto_free_shash(journal->j_chksum_driver);
 	kfree(journal->j_wbuf);
 	jbd2_journal_destroy_revoke(journal);
 	journal_fail_superblock(journal);
 	kfree(journal);
 	return ERR_PTR(err);
@@ -2194,12 +2184,10 @@ int jbd2_journal_destroy(journal_t *journal)
 	if (journal->j_proc_entry)
 		jbd2_stats_proc_exit(journal);
 	iput(journal->j_inode);
 	if (journal->j_revoke)
 		jbd2_journal_destroy_revoke(journal);
-	if (journal->j_chksum_driver)
-		crypto_free_shash(journal->j_chksum_driver);
 	kfree(journal->j_fc_wbuf);
 	kfree(journal->j_wbuf);
 	kfree(journal);
 
 	return err;
@@ -2340,23 +2328,14 @@ int jbd2_journal_set_features(journal_t *journal, unsigned long compat,
 			pr_err("JBD2: Cannot enable fast commits.\n");
 			return 0;
 		}
 	}
 
-	/* Load the checksum driver if necessary */
-	if ((journal->j_chksum_driver == NULL) &&
-	    INCOMPAT_FEATURE_ON(JBD2_FEATURE_INCOMPAT_CSUM_V3)) {
-		journal->j_chksum_driver = crypto_alloc_shash("crc32c", 0, 0);
-		if (IS_ERR(journal->j_chksum_driver)) {
-			printk(KERN_ERR "JBD2: Cannot load crc32c driver.\n");
-			journal->j_chksum_driver = NULL;
-			return 0;
-		}
-		/* Precompute checksum seed for all metadata */
+	/* Precompute checksum seed for all metadata */
+	if (INCOMPAT_FEATURE_ON(JBD2_FEATURE_INCOMPAT_CSUM_V3))
 		journal->j_csum_seed = jbd2_chksum(journal, ~0, sb->s_uuid,
 						   sizeof(sb->s_uuid));
-	}
 
 	lock_buffer(journal->j_sb_buffer);
 
 	/* If enabling v3 checksums, update superblock */
 	if (INCOMPAT_FEATURE_ON(JBD2_FEATURE_INCOMPAT_CSUM_V3)) {
diff --git a/include/linux/jbd2.h b/include/linux/jbd2.h
index 8aef9bb6ad573..33d25a3d15f14 100644
--- a/include/linux/jbd2.h
+++ b/include/linux/jbd2.h
@@ -26,11 +26,11 @@
 #include <linux/mutex.h>
 #include <linux/timer.h>
 #include <linux/slab.h>
 #include <linux/bit_spinlock.h>
 #include <linux/blkdev.h>
-#include <crypto/hash.h>
+#include <linux/crc32c.h>
 #endif
 
 #define journal_oom_retry 1
 
 /*
@@ -1239,17 +1239,10 @@ struct journal_s
 	 * An opaque pointer to fs-private information.  ext3 puts its
 	 * superblock pointer here.
 	 */
 	void *j_private;
 
-	/**
-	 * @j_chksum_driver:
-	 *
-	 * Reference to checksum algorithm driver via cryptoapi.
-	 */
-	struct crypto_shash *j_chksum_driver;
-
 	/**
 	 * @j_csum_seed:
 	 *
 	 * Precomputed journal UUID checksum for seeding other checksums.
 	 */
@@ -1748,14 +1741,11 @@ static inline bool jbd2_journal_has_csum_v2or3_feature(journal_t *j)
 	return jbd2_has_feature_csum2(j) || jbd2_has_feature_csum3(j);
 }
 
 static inline int jbd2_journal_has_csum_v2or3(journal_t *journal)
 {
-	WARN_ON_ONCE(jbd2_journal_has_csum_v2or3_feature(journal) &&
-		     journal->j_chksum_driver == NULL);
-
-	return journal->j_chksum_driver != NULL;
+	return jbd2_journal_has_csum_v2or3_feature(journal);
 }
 
 static inline int jbd2_journal_get_num_fc_blks(journal_superblock_t *jsb)
 {
 	int num_fc_blocks = be32_to_cpu(jsb->s_num_fc_blks);
@@ -1794,26 +1784,11 @@ static inline unsigned long jbd2_log_space_left(journal_t *journal)
 #define JBD_MAX_CHECKSUM_SIZE 4
 
 static inline u32 jbd2_chksum(journal_t *journal, u32 crc,
 			      const void *address, unsigned int length)
 {
-	struct {
-		struct shash_desc shash;
-		char ctx[JBD_MAX_CHECKSUM_SIZE];
-	} desc;
-	int err;
-
-	BUG_ON(crypto_shash_descsize(journal->j_chksum_driver) >
-		JBD_MAX_CHECKSUM_SIZE);
-
-	desc.shash.tfm = journal->j_chksum_driver;
-	*(u32 *)desc.ctx = crc;
-
-	err = crypto_shash_update(&desc.shash, address, length);
-	BUG_ON(err);
-
-	return *(u32 *)desc.ctx;
+	return crc32c(crc, address, length);
 }
 
 /* Return most recent uncommitted transaction */
 static inline tid_t  jbd2_get_latest_transaction(journal_t *journal)
 {
-- 
2.47.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
