Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 397C37891D2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Aug 2023 00:44:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZfXb-0001KC-WA;
	Fri, 25 Aug 2023 22:44:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3yC7pZAYKAPccqnrdmfnnfkd.bnl@flex--drosen.bounces.google.com>)
 id 1qZfXa-0001K2-Jk for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:44:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ma47L4jaVLdbFhNW27vq8zn9BPtySpWvE3JcMEM4mZs=; b=bBQ3IQpunZcsjYlccvM9ci/9Y5
 6ZWpGHwDmOkfdkqn0BSrNYxrVDLtbiiOTyBBDljzrOdI71rng3VzurlzP5M2JLmi9t+6n4ozro/dG
 Krt8/l2FTg4FoQCKPp98zvhi7xGiq3TaVLBonDSqtnguEtLeDoo3Kra3btl64DQIv/YE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ma47L4jaVLdbFhNW27vq8zn9BPtySpWvE3JcMEM4mZs=; b=FA/Ev+ZlEaN5jf0vBTyVxSSb8o
 tPAuLUFjX3bPWMQm6wzOyHzJibmYerj0Drt/sFvBpCj+JjgDil/HgBa8ldM8sZ1Xq4jCA8pqfyPxz
 +idMeTLlf+qTOdc5fKj8nX4unOGNwSr90Icd0cS473dJ8gp6bukYKhp6O3S0Ju6+ubUE=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZfXZ-00FcBR-SB for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:44:30 +0000
Received: by mail-yb1-f202.google.com with SMTP id
 3f1490d57ef6-d72f3290e6eso1720708276.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Aug 2023 15:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1693003464; x=1693608264;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ma47L4jaVLdbFhNW27vq8zn9BPtySpWvE3JcMEM4mZs=;
 b=jPpwxfs7PQezFELNbB4y+lwlaM8PmstIQY471RKU06/7zq2tYRs0GBXzyTjQc0pylL
 tlQP2IU61fuZheWu3W1aPrItJ+WCF3V7kwqhNkEKQ/trW/45qSHHrtj76F7ueXLjCnwO
 17krg13Q69TSF7HNoteHyDItpcFgbEnVvjpkwKXrG+XwPJNOSO49MCFeaKf8b3mqCRtk
 Hd4y8whe6jlD+nkk0H6dnKrD+ZPsA/SzzHiwf0ht2i/vRUBMTGDSNpBj13zckCNZXPBH
 D1WhAiOaD1p5C3urK6hsTrXqxhSuADzNpUcZuSp5h5N49PgivHf3EOe2TzuC/p7dORmk
 NxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693003464; x=1693608264;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ma47L4jaVLdbFhNW27vq8zn9BPtySpWvE3JcMEM4mZs=;
 b=cLvCCZnUYcbM5ISx+0/4Sfe9YAqju31jVPwbcshkpnlP9fN65qd2RUMLlsMnJOXc2j
 /SoWBSE84YRrhT5LgHdSCxoJwP5k8x1o0MUuRkmiFJeFSQZN4QeCudyeGzyP50YWTiS4
 qB0kwj2Pi7Mq74leQqJLNVKRsy+saWbOwTDpfoh8nOm3+N4J1zIaPZQhgfnzEcryZ1Xs
 eMThHGGp8PlzR5/xHfQ5dgX7U+8J8UkytUonZSiS6ETladjlExHKYiadE5GFXwhRhkZ9
 YrPVBGvKD3u29QDHIuIHlSrkioogiSt0rbT3Yk0UEQ3DZiWkGtJ3wxA4tvpBDUhLY6Ci
 M44g==
X-Gm-Message-State: AOJu0Yy2e9TMv2xDfhKHjBt2TSQh/8H5mlp0zuT1cNFUoP/LlBB5o1E8
 WMvzZSWyAUCVvca+RRarckZzxwtOMwA3N93dRcYvozg6tv4f0NfEx59ok6JJptmnizfqIUZcgft
 Gs37mY2Mx1dfzJmTCYyQoSIkduLg6Fi2UclIzVWn3oLuDNgGT9hdannFDiMJ2S8zlgJaiAtlEdl
 3TLXtjAXQ=
X-Google-Smtp-Source: AGHT+IHgAERMO7nLPIedGaRmT1QmfxqCM0Wbl9YnxZBVkfd/IwaZaJQvww2kZehXiXCDXRfgEQOGYq62czk=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:ad1d:adc4:c021:b463])
 (user=drosen job=sendgmr) by 2002:a05:6902:a8d:b0:d77:d70c:b5cd with SMTP id
 cd13-20020a0569020a8d00b00d77d70cb5cdmr356669ybb.12.1693003464207; Fri, 25
 Aug 2023 15:44:24 -0700 (PDT)
Date: Fri, 25 Aug 2023 15:44:00 -0700
In-Reply-To: <20230825224400.2206278-1-drosen@google.com>
Mime-Version: 1.0
References: <20230825224400.2206278-1-drosen@google.com>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
Message-ID: <20230825224400.2206278-8-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This adds support for 4K and 16K block size using the same
 binary. mkfs can choose block size via the -b option, with other tools getting
 the blocksize from the superblock. On mount time, we can't rely on block
 size for the location for the superblock, since that information is in the
 superblock. If the first superblock is corrupt, we will attempt to find the
 second supe [...] 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.202 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1qZfXZ-00FcBR-SB
Subject: [f2fs-dev] [PATCH v2 7/7] f2fs-tools: Support different block sizes
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This adds support for 4K and 16K block size using the same binary.
mkfs can choose block size via the -b option, with other tools getting
the blocksize from the superblock.

On mount time, we can't rely on block size for the location for the
superblock, since that information is in the superblock. If the first
superblock is corrupt, we will attempt to find the second superblock at
a 4K block offset, and then a 16K block offset if that fails.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fsck/fsck.h             |  3 ---
 fsck/mount.c            | 25 ++++++++++++++++++++-----
 include/f2fs_fs.h       | 10 +++++++---
 lib/libf2fs.c           |  2 ++
 mkfs/f2fs_format_main.c | 12 +++++++++++-
 5 files changed, 40 insertions(+), 12 deletions(-)

diff --git a/fsck/fsck.h b/fsck/fsck.h
index 89d0b22..091b5d8 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -127,9 +127,6 @@ struct f2fs_fsck {
 };
 
 #define BLOCK_SZ		F2FS_BLKSIZE
-struct block {
-	unsigned char buf[BLOCK_SZ];
-};
 
 enum NODE_TYPE {
 	TYPE_INODE = 37,
diff --git a/fsck/mount.c b/fsck/mount.c
index 6220d91..0ba087e 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -994,11 +994,15 @@ int sanity_check_raw_super(struct f2fs_super_block *sb, enum SB_ADDR sb_addr)
 		return -1;
 
 	blocksize = 1 << get_sb(log_blocksize);
-	if (F2FS_BLKSIZE != blocksize) {
-		MSG(0, "Invalid blocksize (%u), supports only (%u)\n",
-			blocksize, F2FS_BLKSIZE);
+	if (blocksize < F2FS_MIN_BLKSIZE || blocksize > F2FS_MAX_BLKSIZE) {
+		MSG(0, "Invalid blocksize (%u), must be between 4KB and 16KB\n",
+			blocksize);
 		return -1;
 	}
+	c.blksize_bits = get_sb(log_blocksize);
+	c.blksize = blocksize;
+	c.sectors_per_blk = F2FS_BLKSIZE / c.sector_size;
+	check_block_struct_sizes();
 
 	/* check log blocks per segment */
 	if (get_sb(log_blocks_per_seg) != 9) {
@@ -3854,9 +3858,20 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
 	sbi->active_logs = NR_CURSEG_TYPE;
 	ret = validate_super_block(sbi, SB0_ADDR);
 	if (ret) {
+		/* Assuming 4K Block Size */
+		c.blksize_bits = 12;
+		c.blksize = 1 << c.blksize_bits;
+		MSG(0, "Looking for secondary superblock assuming 4K Block Size\n");
 		ret = validate_super_block(sbi, SB1_ADDR);
-		if (ret)
-			return -1;
+		if (ret) {
+			/* Trying 16K Block Size */
+			c.blksize_bits = 14;
+			c.blksize = 1 << c.blksize_bits;
+			MSG(0, "Looking for secondary superblock assuming 16K Block Size\n");
+			ret = validate_super_block(sbi, SB1_ADDR);
+			if (ret)
+				return -1;
+		}
 	}
 	sb = F2FS_RAW_SUPER(sbi);
 
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index adbd381..a5587d3 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -392,7 +392,7 @@ static inline uint64_t bswap_64(uint64_t val)
 #define MAX_DEVICES		8
 
 #define F2FS_BYTES_TO_BLK(bytes)    ((bytes) >> F2FS_BLKSIZE_BITS)
-#define F2FS_BLKSIZE_BITS 12	/* 4KB block */
+#define F2FS_BLKSIZE_BITS c.blksize_bits
 
 /* for mkfs */
 #define	F2FS_NUMBER_OF_CHECKPOINT_PACK	2
@@ -400,6 +400,7 @@ static inline uint64_t bswap_64(uint64_t val)
 #define	DEFAULT_SECTORS_PER_BLOCK	(1 << (F2FS_BLKSIZE_BITS - SECTOR_SHIFT))
 #define	DEFAULT_BLOCKS_PER_SEGMENT	512
 #define DEFAULT_SEGMENTS_PER_SECTION	1
+#define DEFAULT_BLKSIZE_BITS		12	/* 4096	*/
 
 #define VERSION_LEN		256
 #define VERSION_TIMESTAMP_LEN	4
@@ -628,9 +629,10 @@ enum {
  */
 #define F2FS_SUPER_OFFSET		1024	/* byte-size offset */
 #define F2FS_MIN_LOG_SECTOR_SIZE	9	/* 9 bits for 512 bytes */
-#define F2FS_MAX_LOG_SECTOR_SIZE	F2FS_BLKSIZE_BITS	/* 12 bits for 4096 bytes */
-#define F2FS_BLKSIZE			(1 << F2FS_BLKSIZE_BITS)/* support only 4KB block */
+#define F2FS_MAX_LOG_SECTOR_SIZE	F2FS_BLKSIZE_BITS	/* max sector size is block size */
+#define F2FS_MIN_BLKSIZE		4096
 #define F2FS_MAX_BLKSIZE		16384
+#define F2FS_BLKSIZE			c.blksize	/* support configurable block size */
 #define F2FS_MAX_EXTENSION		64	/* # of extension entries */
 #define F2FS_EXTENSION_LEN		8	/* max size of extension */
 #define F2FS_BLK_ALIGN(x)	(((x) + F2FS_BLKSIZE - 1) / F2FS_BLKSIZE)
@@ -1510,6 +1512,8 @@ struct f2fs_configuration {
 	uint32_t lpf_ino;
 	uint32_t root_uid;
 	uint32_t root_gid;
+	uint32_t blksize;
+	uint32_t blksize_bits;
 
 	/* defragmentation parameters */
 	int defrag_shrink;
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 8f2cc3b..995e42d 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -686,6 +686,8 @@ void f2fs_init_configuration(void)
 
 	memset(&c, 0, sizeof(struct f2fs_configuration));
 	c.ndevs = 1;
+	c.blksize = 1 << DEFAULT_BLKSIZE_BITS;
+	c.blksize_bits = DEFAULT_BLKSIZE_BITS;
 	c.sectors_per_blk = DEFAULT_SECTORS_PER_BLOCK;
 	c.blks_per_seg = DEFAULT_BLOCKS_PER_SEGMENT;
 	c.wanted_total_sectors = -1;
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index b2b84dd..349ee75 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -50,6 +50,7 @@ static void mkfs_usage()
 	MSG(0, "\nUsage: mkfs.f2fs [options] device [sectors]\n");
 	MSG(0, "[options]:\n");
 	MSG(0, "  -a heap-based allocation [default:0]\n");
+	MSG(0, "  -b filesystem block size [default:4096]\n");
 	MSG(0, "  -c device1[,device2,...] up to 7 additional devices, except meta device\n");
 	MSG(0, "  -d debug level [default:0]\n");
 	MSG(0, "  -e [cold file ext list] e.g. \"mp3,gif,mov\"\n");
@@ -175,7 +176,7 @@ static void add_default_options(void)
 
 static void f2fs_parse_options(int argc, char *argv[])
 {
-	static const char *option_string = "qa:c:C:d:e:E:g:hil:mo:O:rR:s:S:z:t:T:U:Vfw:Z:";
+	static const char *option_string = "qa:b:c:C:d:e:E:g:hil:mo:O:rR:s:S:z:t:T:U:Vfw:Z:";
 	static const struct option long_opts[] = {
 		{ .name = "help", .has_arg = 0, .flag = NULL, .val = 'h' },
 		{ .name = NULL, .has_arg = 0, .flag = NULL, .val = 0 }
@@ -192,6 +193,15 @@ static void f2fs_parse_options(int argc, char *argv[])
 		case 'a':
 			c.heap = atoi(optarg);
 			break;
+		case 'b':
+			c.blksize = atoi(optarg);
+			c.blksize_bits = log_base_2(c.blksize);
+			c.sectors_per_blk = DEFAULT_SECTORS_PER_BLOCK;
+			if ((1 << c.blksize_bits) != c.blksize) {
+				MSG(0, "Error: Block size must be power of 2");
+				mkfs_usage();
+			}
+			break;
 		case 'c':
 			if (c.ndevs >= MAX_DEVICES) {
 				MSG(0, "Error: Too many devices\n");
-- 
2.42.0.rc2.253.gd59a3bf2b4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
