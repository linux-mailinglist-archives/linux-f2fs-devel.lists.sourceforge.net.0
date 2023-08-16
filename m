Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F8B77D85B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Aug 2023 04:20:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qW68y-0003EA-Ei;
	Wed, 16 Aug 2023 02:20:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <39CLcZAYKANc6KHL7G9HH9E7.5HF@flex--drosen.bounces.google.com>)
 id 1qW68x-0003E3-Uq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Aug 2023 02:20:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iTr7HAKWpBensaRIYG4CBZPMVmoz2vxieul5vJXQRDo=; b=RrkuTCfLhDpNVIibizsmo4UsKn
 ZMaYAeZW8uT1yP0HNTJQ6SgaIBSP5t4m7+84Xcx4r/NH1bkLIeWR3pmUNUJyjwGUadiRdTdaw4F6R
 yjYdihI/FCwU0f2IOcTmb6WSqibeLnUtkjsHPiCBv6AJCNH72WMddomiYBwqCenhSbLA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iTr7HAKWpBensaRIYG4CBZPMVmoz2vxieul5vJXQRDo=; b=Z27v+pMD2EiIUGzAYg6ponMFeo
 AxWZT5wSUcL24AQAE8J/bZbluTcU82XJEkCpILSYRsy4Hz3FjeSrCs8YpF6kVgKgXr7NfeuRFfVwI
 3A6aNs6jHrMLDHX2bV7WFHMFKui4YJ8wMLoxEshxAFrlQjrMxjoTAFcKMad0UedxONkI=;
Received: from mail-pl1-f202.google.com ([209.85.214.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qW68x-006jE5-H3 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Aug 2023 02:20:20 +0000
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-1bde651db83so29979595ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Aug 2023 19:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1692152414; x=1692757214;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=iTr7HAKWpBensaRIYG4CBZPMVmoz2vxieul5vJXQRDo=;
 b=Lf0TG8ohTEAa1u/OOxyETmy2fpu5KUYt6rOvC/0/cwtFV7ND91BSWJwVgjiWVjqVOD
 NSy6PxhOlYp1baYvddDAvXGXaqFUPNF0fgjnXV7859WDULSm+tWab7gQE6br3TTYxTs5
 QlEGIxSDchNVEnxs4TyisXGfWTLeHxrqyw6hgDdhV6+xQbEqNo9xARia7fZ2qVx1rO+/
 UB9ry0tMBoImsS5RGF/2oZxywEWGRCvFfMjlzWex9E8MrOuCQOgrbqUm2YHRfQBK+GSx
 gms8vvab2JrvtQsRK7sRZ6jY9FbIZaiD34qwqnUH+ELzNXbF9/Vw4sohor1HKobmGgvg
 eHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692152414; x=1692757214;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iTr7HAKWpBensaRIYG4CBZPMVmoz2vxieul5vJXQRDo=;
 b=ef5M+57zYadWTb2MtmfrnprX7X/ZDhvcOWqreL3qaYkujxtukeOKp9x+o4Kyx2XRJl
 +w3e1mD9AQztgNHApLbrsFWHFs0q0zZHRPBDVdhawOYPGkWZrmG9Nhv4GXjD6zrAYJlH
 8tpQeqQBNULU776GBiLdb2MI5Pdt/923Q3WS1RVZRlvJ22lrKrfWnlvP2bqQVSR5Hhjk
 d99Ievsn8YBihLmDNXIk5HJepfvRKJuCrIZP8XHGwkLNc/XQbPVq+4IL7oQag6iir471
 bCYyZaEUWN+rDoUvF9jQ4vW8YHYJcYyZShZreLYhH8Znr/5n12D1pmPg/tHPTVC0RNzd
 aDUA==
X-Gm-Message-State: AOJu0Yzkd860xpDkAqfde+6ct40ex3YsboIYIP0QFDcD13PyORRSRFBP
 LsTm9Kj8FID8SioVi4gurEj7QZCn+TTzCWYHW46ETE+9jXNFTxS3daDCNyFX7BXqM25HXTJ818u
 Xu60AG6QiR1GStql1iaO0ymoOlwHO3jRsmrGQQHUf06956/JaMHmXRb3aCxR32vjCSV6ByY9cDB
 6lEc1qyl4=
X-Google-Smtp-Source: AGHT+IGs7F+E3YEa9T5M4mscnecF0cnx8Epu1G2l8cc1clq4db2ejO3JIn/oKvYoKyG5Li6Px6lyslxqv3w=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:19fa:33cd:f272:37ec])
 (user=drosen job=sendgmr) by 2002:a81:4524:0:b0:57a:793:7fb0 with SMTP id
 s36-20020a814524000000b0057a07937fb0mr4154ywa.3.1692148468877; Tue, 15 Aug
 2023 18:14:28 -0700 (PDT)
Date: Tue, 15 Aug 2023 18:13:59 -0700
In-Reply-To: <20230816011359.1964484-1-drosen@google.com>
Mime-Version: 1.0
References: <20230816011359.1964484-1-drosen@google.com>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
Message-ID: <20230816011359.1964484-8-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.202 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.202 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1qW68x-006jE5-H3
Subject: [f2fs-dev] [PATCH 7/7] f2fs-tools: Support different block sizes
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
 fsck/dir.c               |  2 +-
 fsck/dump.c              |  4 ++--
 fsck/fsck.h              |  3 ---
 fsck/mount.c             | 27 +++++++++++++++++++++------
 include/f2fs_fs.h        | 10 +++++++---
 lib/libf2fs.c            |  2 ++
 man/sload.f2fs.8         |  2 +-
 mkfs/f2fs_format_main.c  | 12 +++++++++++-
 mkfs/f2fs_format_utils.c |  2 +-
 9 files changed, 46 insertions(+), 18 deletions(-)

diff --git a/fsck/dir.c b/fsck/dir.c
index 05d291c..21d9da3 100644
--- a/fsck/dir.c
+++ b/fsck/dir.c
@@ -474,7 +474,7 @@ static void init_inode_block(struct f2fs_sb_info *sbi,
 
 	if (de->file_type == F2FS_FT_DIR) {
 		mode |= S_IFDIR;
-		size = 4096;
+		size = F2FS_BLKSIZE;
 		links++;
 		blocks++;
 	} else if (de->file_type == F2FS_FT_REG_FILE) {
diff --git a/fsck/dump.c b/fsck/dump.c
index 5a9c440..ecadfdd 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -687,8 +687,8 @@ static void dump_data_offset(u32 blk_addr, int ofs_in_node)
 	bidx +=  ofs_in_node;
 
 	setlocale(LC_ALL, "");
-	MSG(0, " - Data offset       : 0x%x (4KB), %'u (bytes)\n",
-				bidx, bidx * 4096);
+	MSG(0, " - Data offset       : 0x%x (BLOCK), %'u (bytes)\n",
+				bidx, bidx * F2FS_BLKSIZE);
 	free(node_blk);
 }
 
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
index 732bfb3..0ba087e 100644
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
@@ -1007,7 +1011,7 @@ int sanity_check_raw_super(struct f2fs_super_block *sb, enum SB_ADDR sb_addr)
 		return -1;
 	}
 
-	/* Currently, support 512/1024/2048/4096 bytes sector size */
+	/* Currently, support powers of 2 from 512 to BLOCK SIZE bytes sector size */
 	if (get_sb(log_sectorsize) > F2FS_MAX_LOG_SECTOR_SIZE ||
 			get_sb(log_sectorsize) < F2FS_MIN_LOG_SECTOR_SIZE) {
 		MSG(0, "Invalid log sectorsize (%u)\n", get_sb(log_sectorsize));
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
index 838ba7e..59e6f40 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -689,6 +689,8 @@ void f2fs_init_configuration(void)
 
 	memset(&c, 0, sizeof(struct f2fs_configuration));
 	c.ndevs = 1;
+	c.blksize = 1 << DEFAULT_BLKSIZE_BITS;
+	c.blksize_bits = DEFAULT_BLKSIZE_BITS;
 	c.sectors_per_blk = DEFAULT_SECTORS_PER_BLOCK;
 	c.blks_per_seg = DEFAULT_BLOCKS_PER_SEGMENT;
 	c.wanted_total_sectors = -1;
diff --git a/man/sload.f2fs.8 b/man/sload.f2fs.8
index ed5ee4b..f213dea 100644
--- a/man/sload.f2fs.8
+++ b/man/sload.f2fs.8
@@ -82,7 +82,7 @@ independently.
 Specify cluster size in power of two blocks.
 The minimum value is 2 (4 blocks, default).
 The maximum value is 8 (256 blocks).
-Note that a block contains 4096 bytes.
+Note that a block contains 4096 or 16384 bytes.
 This option must be used with option \fB\-c\fR.
 .TP
 .BI \-a " compression-algorithm"
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index c0f4253..7470322 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -52,6 +52,7 @@ static void mkfs_usage()
 	MSG(0, "\nUsage: mkfs.f2fs [options] device [sectors]\n");
 	MSG(0, "[options]:\n");
 	MSG(0, "  -a heap-based allocation [default:0]\n");
+	MSG(0, "  -b filesystem block size [default:4096]\n");
 	MSG(0, "  -c device1[,device2,...] up to 7 additional devices, except meta device\n");
 	MSG(0, "  -d debug level [default:0]\n");
 	MSG(0, "  -e [cold file ext list] e.g. \"mp3,gif,mov\"\n");
@@ -177,7 +178,7 @@ static void add_default_options(void)
 
 static void f2fs_parse_options(int argc, char *argv[])
 {
-	static const char *option_string = "qa:c:C:d:e:E:g:hil:mo:O:rR:s:S:z:t:T:U:Vfw:Z:";
+	static const char *option_string = "qa:b:c:C:d:e:E:g:hil:mo:O:rR:s:S:z:t:T:U:Vfw:Z:";
 	static const struct option long_opts[] = {
 		{ .name = "help", .has_arg = 0, .flag = NULL, .val = 'h' },
 		{ .name = NULL, .has_arg = 0, .flag = NULL, .val = 0 }
@@ -194,6 +195,15 @@ static void f2fs_parse_options(int argc, char *argv[])
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
diff --git a/mkfs/f2fs_format_utils.c b/mkfs/f2fs_format_utils.c
index 448fbaa..579a39a 100644
--- a/mkfs/f2fs_format_utils.c
+++ b/mkfs/f2fs_format_utils.c
@@ -126,7 +126,7 @@ static bool is_wiped_device(int i)
 	int fd = dev->fd;
 	char *buf, *zero_buf;
 	bool wiped = true;
-	int nblocks = 4096;	/* 16MB size */
+	int nblocks = (4096 * 4096) / F2FS_BLKSIZE;	/* 16MB size */
 	int j;
 
 	/* let's trim the other devices except the first device */
-- 
2.41.0.694.ge786442a9b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
