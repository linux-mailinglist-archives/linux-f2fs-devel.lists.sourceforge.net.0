Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2636A5AA008
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Sep 2022 21:33:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oTpwO-00065n-20;
	Thu, 01 Sep 2022 19:33:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oTpwM-00065h-L8
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Sep 2022 19:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pl/FujNe06EhUEGV/JMUrLUCjlu7CUXaowzn60dAifw=; b=WJamBmIKnH8u6rvLTy/y1w3UcP
 x5sfy/2kMkmt5n9UMMghmVrTY3g/gL2+ctXQZh3JLCkKJej2O34nJBVJpOz6X3BwrwEodVBNvDbqI
 wVkO5MFJ/JRKZ+ATiKpfbaxyefI8MLH7z8xL53whJAG57y2wHDBMizrJJOcfTggGsiQ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pl/FujNe06EhUEGV/JMUrLUCjlu7CUXaowzn60dAifw=; b=htDYmJrD4Z8T5okLfAYv2CrqD+
 XBzUFTJ3rIaHh1pJvONI1lN1ao08Z7+wUHBNw3RJ9ihdTPeeh4LHeQz0OKX612NuJzfHwzQ/Gjcya
 IfMaAr9YoFFoPfLA6Sr1gumhptoQ9ilp+wnPLUXbQXxVVVxElmxIOi9Rm8M/IoKRpqHo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oTpwL-00ASB8-Ol for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Sep 2022 19:33:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8697961E06;
 Thu,  1 Sep 2022 19:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBAEFC433B5;
 Thu,  1 Sep 2022 19:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662060793;
 bh=SkdS+xROn4bRaFI1lIubPayCXNPKCvqepI4eeR5Jx10=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rp6mt1eOK/kJvOpInYbZkOLFtUZeO9kitihmHwQmPl/aQ0WzfkPvA4omwdJmqpPLd
 bfXcIxCX6nU5R3wQsP7JmsMPw8X1HAZXSgdiWKsSTHgXbj4AUVZbqwr/mN5nwsXERW
 wt2+aQRhBkoPjRe0fg90BPqysfJbu2jxB0o8OVXwsfAJE+YHb2xPvvJoo7YUdT2Egq
 Mjo74kU81rDXnFA9yfvjAQg+37hEsFjFMgrYONQW+9jAgklUIoOPq1cf7AqBT6cBBu
 F72EkmYaqKx6xeF7eUfyqaD3b0WDfTu/TJwoig64EEC7phq3Fa6VAMDXhwbHB/WUDy
 ILxh/a6rj7B0Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Thu,  1 Sep 2022 12:32:08 -0700
Message-Id: <20220901193208.138056-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901193208.138056-1-ebiggers@kernel.org>
References: <20220901193208.138056-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Christoph Hellwig <hch@lst.de> request_queues are a
 block layer implementation detail that should not leak into file systems.
 Change the fscrypt inline crypto code to retrieve block devices instead of
 request_queues from the file s [...] 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oTpwL-00ASB8-Ol
Subject: [f2fs-dev] [PATCH v4 3/3] fscrypt: work on block_devices instead of
 request_queues
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
Cc: linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Christoph Hellwig <hch@lst.de>

request_queues are a block layer implementation detail that should not
leak into file systems.  Change the fscrypt inline crypto code to
retrieve block devices instead of request_queues from the file system.
As part of that, clean up the interaction with multi-device file systems
by returning both the number of devices and the actual device array in a
single method call.

Signed-off-by: Christoph Hellwig <hch@lst.de>
[ebiggers: bug fixes and minor tweaks]
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/inline_crypt.c | 81 ++++++++++++++++++++--------------------
 fs/f2fs/super.c          | 24 ++++++------
 include/linux/fscrypt.h  | 21 +++++------
 3 files changed, 62 insertions(+), 64 deletions(-)

diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index 7d1e2ec722538a..c40bd55bc78127 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -21,20 +21,22 @@
 
 #include "fscrypt_private.h"
 
-static int fscrypt_get_num_devices(struct super_block *sb)
+static struct block_device **fscrypt_get_devices(struct super_block *sb,
+						 unsigned int *num_devs)
 {
-	if (sb->s_cop->get_num_devices)
-		return sb->s_cop->get_num_devices(sb);
-	return 1;
-}
+	struct block_device **devs;
 
-static void fscrypt_get_devices(struct super_block *sb, int num_devs,
-				struct request_queue **devs)
-{
-	if (num_devs == 1)
-		devs[0] = bdev_get_queue(sb->s_bdev);
-	else
-		sb->s_cop->get_devices(sb, devs);
+	if (sb->s_cop->get_devices) {
+		devs = sb->s_cop->get_devices(sb, num_devs);
+		if (devs)
+			return devs;
+	}
+	devs = kmalloc(sizeof(*devs), GFP_KERNEL);
+	if (!devs)
+		return ERR_PTR(-ENOMEM);
+	devs[0] = sb->s_bdev;
+	*num_devs = 1;
+	return devs;
 }
 
 static unsigned int fscrypt_get_dun_bytes(const struct fscrypt_info *ci)
@@ -68,15 +70,17 @@ static unsigned int fscrypt_get_dun_bytes(const struct fscrypt_info *ci)
  * helpful for debugging problems where the "wrong" implementation is used.
  */
 static void fscrypt_log_blk_crypto_impl(struct fscrypt_mode *mode,
-					struct request_queue **devs,
-					int num_devs,
+					struct block_device **devs,
+					unsigned int num_devs,
 					const struct blk_crypto_config *cfg)
 {
-	int i;
+	unsigned int i;
 
 	for (i = 0; i < num_devs; i++) {
+		struct request_queue *q = bdev_get_queue(devs[i]);
+
 		if (!IS_ENABLED(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK) ||
-		    __blk_crypto_cfg_supported(devs[i]->crypto_profile, cfg)) {
+		    __blk_crypto_cfg_supported(q->crypto_profile, cfg)) {
 			if (!xchg(&mode->logged_blk_crypto_native, 1))
 				pr_info("fscrypt: %s using blk-crypto (native)\n",
 					mode->friendly_name);
@@ -93,9 +97,9 @@ int fscrypt_select_encryption_impl(struct fscrypt_info *ci)
 	const struct inode *inode = ci->ci_inode;
 	struct super_block *sb = inode->i_sb;
 	struct blk_crypto_config crypto_cfg;
-	int num_devs;
-	struct request_queue **devs;
-	int i;
+	struct block_device **devs;
+	unsigned int num_devs;
+	unsigned int i;
 
 	/* The file must need contents encryption, not filenames encryption */
 	if (!S_ISREG(inode->i_mode))
@@ -123,20 +127,20 @@ int fscrypt_select_encryption_impl(struct fscrypt_info *ci)
 		return 0;
 
 	/*
-	 * On all the filesystem's devices, blk-crypto must support the crypto
-	 * configuration that the file would use.
+	 * On all the filesystem's block devices, blk-crypto must support the
+	 * crypto configuration that the file would use.
 	 */
 	crypto_cfg.crypto_mode = ci->ci_mode->blk_crypto_mode;
 	crypto_cfg.data_unit_size = sb->s_blocksize;
 	crypto_cfg.dun_bytes = fscrypt_get_dun_bytes(ci);
-	num_devs = fscrypt_get_num_devices(sb);
-	devs = kmalloc_array(num_devs, sizeof(*devs), GFP_KERNEL);
-	if (!devs)
-		return -ENOMEM;
-	fscrypt_get_devices(sb, num_devs, devs);
+
+	devs = fscrypt_get_devices(sb, &num_devs);
+	if (IS_ERR(devs))
+		return PTR_ERR(devs);
 
 	for (i = 0; i < num_devs; i++) {
-		if (!blk_crypto_config_supported(devs[i], &crypto_cfg))
+		if (!blk_crypto_config_supported(bdev_get_queue(devs[i]),
+						 &crypto_cfg))
 			goto out_free_devs;
 	}
 
@@ -157,7 +161,7 @@ int fscrypt_prepare_inline_crypt_key(struct fscrypt_prepared_key *prep_key,
 	struct super_block *sb = inode->i_sb;
 	enum blk_crypto_mode_num crypto_mode = ci->ci_mode->blk_crypto_mode;
 	struct blk_crypto_key *blk_key;
-	struct request_queue **devs;
+	struct block_device **devs;
 	unsigned int num_devs;
 	unsigned int i;
 	int err;
@@ -174,15 +178,14 @@ int fscrypt_prepare_inline_crypt_key(struct fscrypt_prepared_key *prep_key,
 	}
 
 	/* Start using blk-crypto on all the filesystem's block devices. */
-	num_devs = fscrypt_get_num_devices(sb);
-	devs = kmalloc_array(num_devs, sizeof(*devs), GFP_KERNEL);
-	if (!devs) {
-		err = -ENOMEM;
+	devs = fscrypt_get_devices(sb, &num_devs);
+	if (IS_ERR(devs)) {
+		err = PTR_ERR(devs);
 		goto fail;
 	}
-	fscrypt_get_devices(sb, num_devs, devs);
 	for (i = 0; i < num_devs; i++) {
-		err = blk_crypto_start_using_key(blk_key, devs[i]);
+		err = blk_crypto_start_using_key(blk_key,
+						 bdev_get_queue(devs[i]));
 		if (err)
 			break;
 	}
@@ -210,7 +213,7 @@ void fscrypt_destroy_inline_crypt_key(struct super_block *sb,
 				      struct fscrypt_prepared_key *prep_key)
 {
 	struct blk_crypto_key *blk_key = prep_key->blk_key;
-	struct request_queue **devs;
+	struct block_device **devs;
 	unsigned int num_devs;
 	unsigned int i;
 
@@ -218,12 +221,10 @@ void fscrypt_destroy_inline_crypt_key(struct super_block *sb,
 		return;
 
 	/* Evict the key from all the filesystem's block devices. */
-	num_devs = fscrypt_get_num_devices(sb);
-	devs = kmalloc_array(num_devs, sizeof(*devs), GFP_KERNEL);
-	if (devs) {
-		fscrypt_get_devices(sb, num_devs, devs);
+	devs = fscrypt_get_devices(sb, &num_devs);
+	if (!IS_ERR(devs)) {
 		for (i = 0; i < num_devs; i++)
-			blk_crypto_evict_key(devs[i], blk_key);
+			blk_crypto_evict_key(bdev_get_queue(devs[i]), blk_key);
 		kfree(devs);
 	}
 	kfree_sensitive(blk_key);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 2451623c05a7a8..26817b5aeac781 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3039,23 +3039,24 @@ static void f2fs_get_ino_and_lblk_bits(struct super_block *sb,
 	*lblk_bits_ret = 8 * sizeof(block_t);
 }
 
-static int f2fs_get_num_devices(struct super_block *sb)
+static struct block_device **f2fs_get_devices(struct super_block *sb,
+					      unsigned int *num_devs)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
+	struct block_device **devs;
+	int i;
 
-	if (f2fs_is_multi_device(sbi))
-		return sbi->s_ndevs;
-	return 1;
-}
+	if (!f2fs_is_multi_device(sbi))
+		return NULL;
 
-static void f2fs_get_devices(struct super_block *sb,
-			     struct request_queue **devs)
-{
-	struct f2fs_sb_info *sbi = F2FS_SB(sb);
-	int i;
+	devs = kmalloc_array(sbi->s_ndevs, sizeof(*devs), GFP_KERNEL);
+	if (!devs)
+		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < sbi->s_ndevs; i++)
-		devs[i] = bdev_get_queue(FDEV(i).bdev);
+		devs[i] = FDEV(i).bdev;
+	*num_devs = sbi->s_ndevs;
+	return devs;
 }
 
 static const struct fscrypt_operations f2fs_cryptops = {
@@ -3066,7 +3067,6 @@ static const struct fscrypt_operations f2fs_cryptops = {
 	.empty_dir		= f2fs_empty_dir,
 	.has_stable_inodes	= f2fs_has_stable_inodes,
 	.get_ino_and_lblk_bits	= f2fs_get_ino_and_lblk_bits,
-	.get_num_devices	= f2fs_get_num_devices,
 	.get_devices		= f2fs_get_devices,
 };
 #endif
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index d86f43bd955029..3a3f7cb7b90f67 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -161,24 +161,21 @@ struct fscrypt_operations {
 				      int *ino_bits_ret, int *lblk_bits_ret);
 
 	/*
-	 * Return the number of block devices to which the filesystem may write
-	 * encrypted file contents.
+	 * Return an array of pointers to the block devices to which the
+	 * filesystem may write encrypted file contents, NULL if the filesystem
+	 * only has a single such block device, or an ERR_PTR() on error.
+	 *
+	 * On successful non-NULL return, *num_devs is set to the number of
+	 * devices in the returned array.  The caller must free the returned
+	 * array using kfree().
 	 *
 	 * If the filesystem can use multiple block devices (other than block
 	 * devices that aren't used for encrypted file contents, such as
 	 * external journal devices), and wants to support inline encryption,
 	 * then it must implement this function.  Otherwise it's not needed.
 	 */
-	int (*get_num_devices)(struct super_block *sb);
-
-	/*
-	 * If ->get_num_devices() returns a value greater than 1, then this
-	 * function is called to get the array of request_queues that the
-	 * filesystem is using -- one per block device.  (There may be duplicate
-	 * entries in this array, as block devices can share a request_queue.)
-	 */
-	void (*get_devices)(struct super_block *sb,
-			    struct request_queue **devs);
+	struct block_device **(*get_devices)(struct super_block *sb,
+					     unsigned int *num_devs);
 };
 
 static inline struct fscrypt_info *fscrypt_get_info(const struct inode *inode)
-- 
2.37.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
