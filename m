Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8E3283186
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Oct 2020 10:08:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4CTjcCBAHiIOuWhllVvA8dYYJg1VfqSlXbZtusmvgW8=; b=dl6qiZVAmCR4Y6ngc0v22Pyqc
	d5qLppU7456rkk0/kmvCvXl1D6D2qY1bPD4zcanmLftnmLluDJf86DXN8IUkw6jt1sveM46OblW9C
	Gb63jMZcxxTlqdqN7LVhL2ik1n26PFIpERufH9Y+PdTggfLnuI58IIq/otrGhbG3XSjqI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kPLXu-00014m-NT; Mon, 05 Oct 2020 08:08:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <378x6XwYKAHYmUnsUnaiiafY.Wig@flex--satyat.bounces.google.com>)
 id 1kPLXs-000147-LX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Oct 2020 08:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+f82j/3GlQU62Y+UZX8Y8sm58itldJWXgxM/FZt85xk=; b=P8iPBqsL78Bh+5SE/AUEWcoda
 Nqp8Tkg8hbcj2yh5yS1RZPQsDhMbOLMv2K1rKJrBWVo06pMybwc3QDuMcByFwxbDMCUVTBisT95m9
 29BNvOihofVwm0gvETlKJ+CPNINjiTh7s86fRaD0ULGICvpVSM3/zUgYoNCowp5PdVoG0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+f82j/3GlQU62Y+UZX8Y8sm58itldJWXgxM/FZt85xk=; b=kh6MqSjmeiqqzBY6HgYIv7x7x8
 TXHyZlUZ9QQSUQ1boekfR6VQoIwaprOHRtuRiTp+URvA3D9Nt+a6vkQXToPD/nAlrfZf3SVN657xi
 cgQcfolNXUmuuf+3IYh1uJtfz4IHcmOc40qQdoktP3Ks0TXLsPWKEb6BKkCvEaumqY7I=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kPLXk-0034py-0k
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Oct 2020 08:08:32 +0000
Received: by mail-yb1-f202.google.com with SMTP id s128so8939380ybc.21
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 05 Oct 2020 01:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=+f82j/3GlQU62Y+UZX8Y8sm58itldJWXgxM/FZt85xk=;
 b=a+/jJaTTU96Kl2L3e8OrrWdHr+OeqqOVvfjVHr7exfq0mYagEabyuFkeH1edmSYUio
 iO1flJe0v7aQmci2hmcQcxy0csarT7zJCvNK0vBXsSjH+mBq8iRt9uwBNQIGSsggGBtu
 kiD8XIRgunHpbeTHY2IrThmrDGDGheQj/xhPHg1hVuJOZOtn/LSpSGsV0QFEtA1FBpK0
 hI26d2U0BrBEr6f6ocgT5kBwIahP2deWttKPvE7akKTBL6hwmoP/xm/DUQKQ0h47UVRd
 9ntNvM0LQd58/HDvR0Yuhw8s1bhbYFOEbQPQPm7kag+HoRS9gP6a6ECLBiO/4/PbHzRq
 u9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=+f82j/3GlQU62Y+UZX8Y8sm58itldJWXgxM/FZt85xk=;
 b=KDr40ubzHje/00VO6Y75Zx1az/eGwXweyg3/rNci4/xQDa2ka0W7l6RbC3a3FkYTfO
 QZRupuHMB5zgvSPd2YVehtVseef66EBZxXPjaPMSTjpKBlu7GV06Qc688yAalbxHO/gU
 NcKKva90KyG0PYz86/imxUl0UQqAzonPQg7Kt+8QUXwyJsOJH665nktG0wOncRoCekuf
 tvoHoZj1tGoatBrajdCS0vtoiKty83LQTQ7sYkZ79nGRs5U+84kFIkgyh7OwHAerPTqu
 Nk6WxMHaATSANW/kALbqa8PLbmYhmRdd5tLBimnjH4uJ+tpaeELn2EwCJM1WC02HEr5V
 ej7Q==
X-Gm-Message-State: AOAM532gQIfziScbVCKjyUGwBDbpuACF4Mt75qESh39pYgrSXMOAUi9h
 T/jGhq37g+I4802c59Z7wnY6eEY2X00=
X-Google-Smtp-Source: ABdhPJwkz/io1x0y+WIuy1g8ndag+QHgzZX9J3u1S7xLPdsLKURB4BMyOE+QUxPwR3tjcapzSV74oh2t+3E=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a25:454:: with SMTP id
 81mr16674210ybe.297.1601883375806; 
 Mon, 05 Oct 2020 00:36:15 -0700 (PDT)
Date: Mon,  5 Oct 2020 07:36:04 +0000
In-Reply-To: <20201005073606.1949772-1-satyat@google.com>
Message-Id: <20201005073606.1949772-2-satyat@google.com>
Mime-Version: 1.0
References: <20201005073606.1949772-1-satyat@google.com>
X-Mailer: git-send-email 2.28.0.806.g8561365e88-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kPLXk-0034py-0k
Subject: [f2fs-dev] [PATCH 1/3] fscrypt,
 f2fs: replace fscrypt_get_devices with fscrypt_get_device
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: linux-fscrypt@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The new function takes the super_block and the index of a device, and
returns the request_queue of the device at that index (whereas the old
function would take a pointer to an array of request_queues and fill them
all up). This allows callers to avoid allocating an array of request_queues
in some cases (when they don't need the array for anything else).

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 fs/crypto/inline_crypt.c | 33 ++++++++++++++-------------------
 fs/f2fs/super.c          | 16 ++++++++++------
 include/linux/fscrypt.h  |  4 ++--
 3 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index faa25541ccb6..5bbce79df638 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -33,13 +33,15 @@ static int fscrypt_get_num_devices(struct super_block *sb)
 	return 1;
 }
 
-static void fscrypt_get_devices(struct super_block *sb, int num_devs,
-				struct request_queue **devs)
+static struct request_queue *fscrypt_get_device(struct super_block *sb,
+						unsigned int device_index)
 {
-	if (num_devs == 1)
-		devs[0] = bdev_get_queue(sb->s_bdev);
+	if (sb->s_cop->get_device)
+		return sb->s_cop->get_device(sb, device_index);
+	else if (WARN_ON_ONCE(device_index != 0))
+		return NULL;
 	else
-		sb->s_cop->get_devices(sb, devs);
+		return bdev_get_queue(sb->s_bdev);
 }
 
 static unsigned int fscrypt_get_dun_bytes(const struct fscrypt_info *ci)
@@ -70,7 +72,7 @@ int fscrypt_select_encryption_impl(struct fscrypt_info *ci)
 	struct super_block *sb = inode->i_sb;
 	struct blk_crypto_config crypto_cfg;
 	int num_devs;
-	struct request_queue **devs;
+	struct request_queue *dev;
 	int i;
 
 	/* The file must need contents encryption, not filenames encryption */
@@ -106,20 +108,14 @@ int fscrypt_select_encryption_impl(struct fscrypt_info *ci)
 	crypto_cfg.data_unit_size = sb->s_blocksize;
 	crypto_cfg.dun_bytes = fscrypt_get_dun_bytes(ci);
 	num_devs = fscrypt_get_num_devices(sb);
-	devs = kmalloc_array(num_devs, sizeof(*devs), GFP_NOFS);
-	if (!devs)
-		return -ENOMEM;
-	fscrypt_get_devices(sb, num_devs, devs);
 
 	for (i = 0; i < num_devs; i++) {
-		if (!blk_crypto_config_supported(devs[i], &crypto_cfg))
-			goto out_free_devs;
+		dev = fscrypt_get_device(sb, i);
+		if (!dev || !blk_crypto_config_supported(dev, &crypto_cfg))
+			return 0;
 	}
 
 	ci->ci_inlinecrypt = true;
-out_free_devs:
-	kfree(devs);
-
 	return 0;
 }
 
@@ -141,9 +137,6 @@ int fscrypt_prepare_inline_crypt_key(struct fscrypt_prepared_key *prep_key,
 	if (!blk_key)
 		return -ENOMEM;
 
-	blk_key->num_devs = num_devs;
-	fscrypt_get_devices(sb, num_devs, blk_key->devs);
-
 	err = blk_crypto_init_key(&blk_key->base, raw_key, crypto_mode,
 				  fscrypt_get_dun_bytes(ci), sb->s_blocksize);
 	if (err) {
@@ -158,8 +151,10 @@ int fscrypt_prepare_inline_crypt_key(struct fscrypt_prepared_key *prep_key,
 	 * aren't destroyed until after the filesystem was already unmounted
 	 * (namely, the per-mode keys in struct fscrypt_master_key).
 	 */
+	blk_key->num_devs = num_devs;
 	for (i = 0; i < num_devs; i++) {
-		if (!blk_get_queue(blk_key->devs[i])) {
+		blk_key->devs[i] = fscrypt_get_device(sb, i);
+		if (!blk_key->devs[i] || !blk_get_queue(blk_key->devs[i])) {
 			fscrypt_err(inode, "couldn't get request_queue");
 			err = -EAGAIN;
 			goto fail;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index dfa072fa8081..9a6d375cbe4b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2509,14 +2509,18 @@ static int f2fs_get_num_devices(struct super_block *sb)
 	return 1;
 }
 
-static void f2fs_get_devices(struct super_block *sb,
-			     struct request_queue **devs)
+static struct request_queue *f2fs_get_device(struct super_block *sb,
+					     unsigned int device_index)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
-	int i;
 
-	for (i = 0; i < sbi->s_ndevs; i++)
-		devs[i] = bdev_get_queue(FDEV(i).bdev);
+	if (WARN_ON_ONCE(device_index >= f2fs_get_num_devices(sb)))
+		return NULL;
+
+	if (!f2fs_is_multi_device(sbi))
+		return bdev_get_queue(sb->s_bdev);
+
+	return bdev_get_queue(FDEV(device_index).bdev);
 }
 
 static const struct fscrypt_operations f2fs_cryptops = {
@@ -2529,7 +2533,7 @@ static const struct fscrypt_operations f2fs_cryptops = {
 	.has_stable_inodes	= f2fs_has_stable_inodes,
 	.get_ino_and_lblk_bits	= f2fs_get_ino_and_lblk_bits,
 	.get_num_devices	= f2fs_get_num_devices,
-	.get_devices		= f2fs_get_devices,
+	.get_device		= f2fs_get_device,
 };
 #endif
 
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 991ff8575d0e..d835fd19a20a 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -70,8 +70,8 @@ struct fscrypt_operations {
 	void (*get_ino_and_lblk_bits)(struct super_block *sb,
 				      int *ino_bits_ret, int *lblk_bits_ret);
 	int (*get_num_devices)(struct super_block *sb);
-	void (*get_devices)(struct super_block *sb,
-			    struct request_queue **devs);
+	struct request_queue *(*get_device)(struct super_block *sb,
+					    unsigned int dev_index);
 };
 
 static inline struct fscrypt_info *fscrypt_get_info(const struct inode *inode)
-- 
2.28.0.806.g8561365e88-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
