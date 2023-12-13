Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 906328108EF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Dec 2023 05:01:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rDGR7-0005Wg-Bo;
	Wed, 13 Dec 2023 04:01:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rDGR6-0005WJ-13
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Dec 2023 04:01:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=juNvika9Iv0hLkWRYuJunKg8SMvR/GV2QLxDR31XtkY=; b=eTD/XmA0xWMENavg5qpO3FCwO8
 JFeitell29pS9FqZAqrzu3Rp5SwlL7XWanjcoCZBoemI6JlOTAQwk2UFS4iHwtHula/ZCG/p+xJwQ
 fB3RU0wvjGyBRRmd/Vc9JOhx0wzZv3aIxecwZprmHr2zWwUK7XW6+zXeVJju7U2kikec=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=juNvika9Iv0hLkWRYuJunKg8SMvR/GV2QLxDR31XtkY=; b=hZbDLUiDHKmHyueOhX6ukKb2T6
 WzJqEw6BUVW2j4fME0frrJHtQ4bEUbATWpgbwhTot1F3MmYeN2bLprjEmBVSSK7LWRqz6apGeKXU6
 /mwPzVuI4TLo1WcBn7JCNLbYIV14AyfGKAS4LEpIxrmpxINfO7IVCMhaZmQ2cBDI61jc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rDGR5-0004CG-3f for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Dec 2023 04:01:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id BE803B81AEA;
 Wed, 13 Dec 2023 04:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB210C433CA;
 Wed, 13 Dec 2023 04:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702440075;
 bh=MXkG62tBxNzKaC2hGyVPIcOh4y8FqN22hk/A2QkDrYY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N0xUrrhoiFunIf+5zqQPPouKtbxCTpPg4bawzEMB8tUSfJSn2kq/eOa67HjGtSrJ0
 mB5Fb0H8YhUa6d6/4zbx1dM9tTktsZkfqfAcgT+HPXZjqrsRNoLorvOgSdeapMhd/g
 WOXEnXI6sK/GP09CfVUBpkcOW13moSS+9Ui3mLTFBJIf63mQJ3sSAqwIAGoVnyL8V0
 0GMgkr+dfXSHy8FGSZMwDTZSLwTJLQ00NmN2evgwWALBUpXGzkzCkOsAja9vEz2rnE
 pBRklcQXiUyo6e5Jf1eHb6cgyCpACwwqXF84YocufKt733Y9wOxdZkfRIeMiu9F/Mq
 ELzyK6geMFU4A==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Tue, 12 Dec 2023 20:00:17 -0800
Message-ID: <20231213040018.73803-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213040018.73803-1-ebiggers@kernel.org>
References: <20231213040018.73803-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
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
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rDGR5-0004CG-3f
Subject: [f2fs-dev] [PATCH 2/3] f2fs: move release of block devices to after
 kill_block_super()
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
Cc: linux-fscrypt@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Josef Bacik <josef@toxicpanda.com>, linux-btrfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
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
 fs/f2fs/super.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 033af907c3b1d..ba95a341a9a36 100644
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
@@ -4924,20 +4921,25 @@ static void kill_f2fs_super(struct super_block *sb)
 				.reason = CP_UMOUNT,
 			};
 			stat_inc_cp_call_count(sbi, TOTAL_CALL);
 			f2fs_write_checkpoint(sbi, &cpc);
 		}
 
 		if (is_sbi_flag_set(sbi, SBI_IS_RECOVERED) && f2fs_readonly(sb))
 			sb->s_flags &= ~SB_RDONLY;
 	}
 	kill_block_super(sb);
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
