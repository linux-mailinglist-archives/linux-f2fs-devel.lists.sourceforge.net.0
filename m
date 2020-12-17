Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADDF2DD3A4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Dec 2020 16:05:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9ewVPKjlGLLBRv/LSkiNk8VxWa/rNgz/bo8CYCOdyjo=; b=h3xbBvJqzSALVpwv8ejzn1lXA
	NW2G2NOdEglzvqomOzb3c9/IJbbEirbSRAYIFDk6HBivkAy15dolEgziRGM9qBZSUtgT7jJozo4m3
	O5IjWH8HIamMC5bic1ZO9HUW8CR9v0YuKw6GqIAQfJj3P+LvCdhbb4SYK6Wd422DVF3hE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpupx-0004Oc-13; Thu, 17 Dec 2020 15:05:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3jnPbXwYKAOcbJchJcPXXPUN.LXV@flex--satyat.bounces.google.com>)
 id 1kpupv-0004OV-Gm
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 15:04:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vImsZiFdTHwkHvYcMVg9vkl4TS9ilxgm2hcpSKGUI6o=; b=U8ojuwDQ+lZW68MCKXlQk0+oK
 j4rurp675sZVuG0q73JBfZVRMLUWh9G/GNBPsyW5+p42F8lUMUhYuZJA9rGE862nwV94GnCQ/y3S+
 sNSMmX77GmNqd9jQHbCSH5aHAl5LC7C4dWgpyp2EO1yOB0yMP8hMNxiQ+xa1Ho9wM5/0c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vImsZiFdTHwkHvYcMVg9vkl4TS9ilxgm2hcpSKGUI6o=; b=ODektQESGbZn617u/4CBHkrx04
 6etQkz6Em7h6F0F5TmUZhh6yo7SOI840wEV3Jk6xSCUZBVG5GSpyasaGeFzKsv/y0AnRo8GwOHvFJ
 DBSLbr6qeeRFlC/brol0unGqRIaRx7bJ3F6JsMcuixbpl7YRE3jrP/s5AuKlV4uNVb3A=;
Received: from mail-pf1-f201.google.com ([209.85.210.201])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kpupo-000F0C-GM
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 15:04:59 +0000
Received: by mail-pf1-f201.google.com with SMTP id w135so18728391pff.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 17 Dec 2020 07:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=vImsZiFdTHwkHvYcMVg9vkl4TS9ilxgm2hcpSKGUI6o=;
 b=EuvNwY3rCeWO5HYtJrYL4Y77B+kKQrU+xPDGZUssXoasZNrW4MFoUbntCZXDQHydgM
 cAiW1QFNaeJi3gXhq9+8GpgHcsRzE6LiPz1/6ua6/n3YP4/NoV8LoBTTIXmr6OGC2VPe
 Xb/Izr25I2HjkhB5ZywHvlH9Q/gSEBEFPxh8KEB0vohoNzlSZ7NLxJ9FFS/EG/FEYfHv
 4iQA9kux469iusWYTfyLvD/FmO3sIjYB3FfSTz64g50SdFYZYWdFnfpBm6xTWwm88Iq0
 /173QfX2QijUxkY0KohQrUxpynvoB7BHr0sBnLqIU1uxj24afDQAE0Cj6YNLY0BFFn0M
 DpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=vImsZiFdTHwkHvYcMVg9vkl4TS9ilxgm2hcpSKGUI6o=;
 b=q6AvKvL90KOaboa9r7leJDLiKchwZkJBqlGJ7xqywiOpLbJzXViBEeu748U/LjAsU8
 QiElTgEEoxE8GsTCAJ8mkuyBfRc15f35lKFOxVLyIWJvWQid/KFhUM5ONcHyLtFSFk1x
 qRnm14PF23homhF90VzmO+JXi8VhD03MLo8La2DOqeYGZERlO4rRffvfDdQv0A7Sjlez
 A64CGKiGBzI8xtZ5c6yIX/f0910/tfn8xuI3ZrUe1h4yJzNw8VrO71msHpLU0/8PaGxV
 k4C53M15UdMVlAsbHEY4jwEKI97z682GFo3YjTHIMRVYlBwVMbUmAXRzq5c2CFZB7+DQ
 Ufww==
X-Gm-Message-State: AOAM530rXkM/6PKmIccvMp96d2O+zIEsA9GSGEy7BV7PR0QGJ/8lxkFo
 g52iX6J0If/Xq5v0YtcxGaPHbJDs8YM=
X-Google-Smtp-Source: ABdhPJzqNWRRkleWOjCheiehg+lSY+hNLM17V3/Joig5Hn4L2LfKC8xk88VBvI1LMpMdXp4yHJclGkJNokU=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a62:c312:0:b029:1a9:19c7:a8e with SMTP id
 v18-20020a62c3120000b02901a919c70a8emr6575809pfg.74.1608217486744; Thu, 17
 Dec 2020 07:04:46 -0800 (PST)
Date: Thu, 17 Dec 2020 15:04:33 +0000
In-Reply-To: <20201217150435.1505269-1-satyat@google.com>
Message-Id: <20201217150435.1505269-2-satyat@google.com>
Mime-Version: 1.0
References: <20201217150435.1505269-1-satyat@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.201 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.201 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kpupo-000F0C-GM
Subject: [f2fs-dev] [PATCH v2 1/3] fscrypt,
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
index c57bebfa48fe..8234217b42f4 100644
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
-	devs = kmalloc_array(num_devs, sizeof(*devs), GFP_KERNEL);
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
 
@@ -140,9 +136,6 @@ int fscrypt_prepare_inline_crypt_key(struct fscrypt_prepared_key *prep_key,
 	if (!blk_key)
 		return -ENOMEM;
 
-	blk_key->num_devs = num_devs;
-	fscrypt_get_devices(sb, num_devs, blk_key->devs);
-
 	err = blk_crypto_init_key(&blk_key->base, raw_key, crypto_mode,
 				  fscrypt_get_dun_bytes(ci), sb->s_blocksize);
 	if (err) {
@@ -157,8 +150,10 @@ int fscrypt_prepare_inline_crypt_key(struct fscrypt_prepared_key *prep_key,
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
index 00eff2f51807..4872973d7a22 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2538,14 +2538,18 @@ static int f2fs_get_num_devices(struct super_block *sb)
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
@@ -2558,7 +2562,7 @@ static const struct fscrypt_operations f2fs_cryptops = {
 	.has_stable_inodes	= f2fs_has_stable_inodes,
 	.get_ino_and_lblk_bits	= f2fs_get_ino_and_lblk_bits,
 	.get_num_devices	= f2fs_get_num_devices,
-	.get_devices		= f2fs_get_devices,
+	.get_device		= f2fs_get_device,
 };
 #endif
 
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index a8f7a43f031b..a7d1af4932aa 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -68,8 +68,8 @@ struct fscrypt_operations {
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
2.29.2.729.g45daf8777d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
