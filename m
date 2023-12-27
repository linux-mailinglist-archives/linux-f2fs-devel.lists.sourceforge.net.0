Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1FE81F0D1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Dec 2023 18:17:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rIXXB-0007EA-E4;
	Wed, 27 Dec 2023 17:17:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rIXX8-0007E3-3q
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Dec 2023 17:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EYHlpKE6S+zR6/nCF7g+4uplzls0l4LkrJsYkcm2H1g=; b=LmJ6qLyyfY7OwGsvKNVnaKXtTU
 wFX0FW8xfpxq5B8fXpMQl5xSBCW8/Y2xr7dFFxbBOoKwkoP+gSIVZ3xMeMLkQOeVg/IU3sXNmeh38
 eak8PcjBqtO2V1ERVdxv0sGVMDlVlGZhfMyroaJJH8EwAo5oqMamFJRI6jrKfGKDeHnw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EYHlpKE6S+zR6/nCF7g+4uplzls0l4LkrJsYkcm2H1g=; b=guyS3TyTjyg32y4fkg30lhW79I
 HL8lvrhdl9tTkjQ8Mg7BuU79HngCTiCCJT5TklrJX2SzHzaSCvh9nDKHAvhUcE6nnGvuHonCeuwSr
 EbRVeBPD1abVz7gV0C110p6gEiOMCIdkePPbBA9IzQWCBgdUCwmn2HmZwWoDn+jHVL1g=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rIXX7-0003Ms-54 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Dec 2023 17:17:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A08DC60F6E;
 Wed, 27 Dec 2023 17:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E073BC433C9;
 Wed, 27 Dec 2023 17:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703697443;
 bh=UyjBwW0wkBL1qZTGRKDJoSDef6ohi3jee7V8AMdA4uw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OQu7/lTIHfd75ne/sZPgjpyc/3bfqgWFPzfyQMdqUvuXrwoDPgwM7phinskqLWQMi
 uLoQhRNHLb17IcTT0Do1M8fDVSXZZDpJxB2bsRC24STR4FXpvg1IcYPLK9s7D/UECM
 flRtpxML1xFv3R9sNj9pLlLFdVlmSXi0EoegJXzbLTBTKhdV1Rro9IAA7tkR4Me9jd
 kgIP+CBKu/OPte/qRzzufoAgAuQxfm6+E0gOFbWaKn90IwtFmc5CecF/5RlOyDTUyy
 vD6U7MAuytD2CcVqoCh9iNMVJKntlOzPgvdJZxN4x0+qgUBjcEqBFSjE0+OzTdigVu
 XBU2xoE3fARTg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Wed, 27 Dec 2023 11:14:28 -0600
Message-ID: <20231227171429.9223-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231227171429.9223-1-ebiggers@kernel.org>
References: <20231227171429.9223-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -8.0 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Call
 destroy_device_list()
 and free the f2fs_sb_info from kill_f2fs_super(),
 after the call to kill_block_super().
 This is necessary to order it after the call to fscrypt_destroy_keyring()
 once generi [...] 
 Content analysis details:   (-8.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rIXX7-0003Ms-54
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: move release of block devices to
 after kill_block_super()
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
Cc: linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Josef Bacik <josef@toxicpanda.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Call destroy_device_list() and free the f2fs_sb_info from
kill_f2fs_super(), after the call to kill_block_super().  This is
necessary to order it after the call to fscrypt_destroy_keyring() once
generic_shutdown_super() starts calling fscrypt_destroy_keyring() just
after calling ->put_super.  This is because fscrypt_destroy_keyring()
may call into f2fs_get_devices() via the fscrypt_operations.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/super.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 033af907c3b1d..d66e0692ac02e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1710,42 +1710,39 @@ static void f2fs_put_super(struct super_block *sb)
 	f2fs_destroy_node_manager(sbi);
 	f2fs_destroy_segment_manager(sbi);
 
 	/* flush s_error_work before sbi destroy */
 	flush_work(&sbi->s_error_work);
 
 	f2fs_destroy_post_read_wq(sbi);
 
 	kvfree(sbi->ckpt);
 
-	sb->s_fs_info = NULL;
 	if (sbi->s_chksum_driver)
 		crypto_free_shash(sbi->s_chksum_driver);
 	kfree(sbi->raw_super);
 
-	destroy_device_list(sbi);
 	f2fs_destroy_page_array_cache(sbi);
 	f2fs_destroy_xattr_caches(sbi);
 	mempool_destroy(sbi->write_io_dummy);
 #ifdef CONFIG_QUOTA
 	for (i = 0; i < MAXQUOTAS; i++)
 		kfree(F2FS_OPTION(sbi).s_qf_names[i]);
 #endif
 	fscrypt_free_dummy_policy(&F2FS_OPTION(sbi).dummy_enc_policy);
 	destroy_percpu_info(sbi);
 	f2fs_destroy_iostat(sbi);
 	for (i = 0; i < NR_PAGE_TYPE; i++)
 		kvfree(sbi->write_io[i]);
 #if IS_ENABLED(CONFIG_UNICODE)
 	utf8_unload(sb->s_encoding);
 #endif
-	kfree(sbi);
 }
 
 int f2fs_sync_fs(struct super_block *sb, int sync)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 	int err = 0;
 
 	if (unlikely(f2fs_cp_error(sbi)))
 		return 0;
 	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
@@ -4895,23 +4892,23 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 }
 
 static struct dentry *f2fs_mount(struct file_system_type *fs_type, int flags,
 			const char *dev_name, void *data)
 {
 	return mount_bdev(fs_type, flags, dev_name, data, f2fs_fill_super);
 }
 
 static void kill_f2fs_super(struct super_block *sb)
 {
-	if (sb->s_root) {
-		struct f2fs_sb_info *sbi = F2FS_SB(sb);
+	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 
+	if (sb->s_root) {
 		set_sbi_flag(sbi, SBI_IS_CLOSE);
 		f2fs_stop_gc_thread(sbi);
 		f2fs_stop_discard_thread(sbi);
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 		/*
 		 * latter evict_inode() can bypass checking and invalidating
 		 * compress inode cache.
 		 */
 		if (test_opt(sbi, COMPRESS_CACHE))
@@ -4924,20 +4921,26 @@ static void kill_f2fs_super(struct super_block *sb)
 				.reason = CP_UMOUNT,
 			};
 			stat_inc_cp_call_count(sbi, TOTAL_CALL);
 			f2fs_write_checkpoint(sbi, &cpc);
 		}
 
 		if (is_sbi_flag_set(sbi, SBI_IS_RECOVERED) && f2fs_readonly(sb))
 			sb->s_flags &= ~SB_RDONLY;
 	}
 	kill_block_super(sb);
+	/* Release block devices last, after fscrypt_destroy_keyring(). */
+	if (sbi) {
+		destroy_device_list(sbi);
+		kfree(sbi);
+		sb->s_fs_info = NULL;
+	}
 }
 
 static struct file_system_type f2fs_fs_type = {
 	.owner		= THIS_MODULE,
 	.name		= "f2fs",
 	.mount		= f2fs_mount,
 	.kill_sb	= kill_f2fs_super,
 	.fs_flags	= FS_REQUIRES_DEV | FS_ALLOW_IDMAP,
 };
 MODULE_ALIAS_FS("f2fs");
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
