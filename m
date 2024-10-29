Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 846439B4440
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 09:28:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5han-0007Wc-Jg;
	Tue, 29 Oct 2024 08:28:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1t5hal-0007WT-HA
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 08:28:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kHSPuITwZU9y/ciu6tUGw29UjrcSJgyuYv+6kXWMYSw=; b=bcPoZPPvRByUZmfutpfpTOKebq
 iKwFmZYmpbVh3Syvcjn68Zl/vbqyLpGt8VPLIWgAZHERc7Q9Bj94Jr+9jCGlfvdmK24hGN5x88p5+
 EJpsaan0yKsS5Ts4ilfiGOTXbOgRcTcLCVLWd7/N0f6tGKr/Dj1d0ui3iJ/+VN83SJPc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kHSPuITwZU9y/ciu6tUGw29UjrcSJgyuYv+6kXWMYSw=; b=h
 sPFe8aDzwhAfv8z8YrRf848D7L0D1o8hrzXY+MYts5b48/A18bxpYuBTxTa16dg8YBTVMDTYqc2ja
 l/LV9uEWYYZQsm+mIJnzmH022b4OM+WFpPQUoHgpk04xkV4BA8SCzFVpUcqyeI+mG7ccINVYtJaXk
 sMtWAXqFNuayDWhw=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5haj-00042C-P8 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 08:28:43 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 49T8S8nh094583;
 Tue, 29 Oct 2024 16:28:08 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Xd3KJ2Grxz2K4lJF;
 Tue, 29 Oct 2024 16:27:32 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Tue, 29 Oct 2024 16:28:05 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Tue, 29 Oct 2024 16:27:46 +0800
Message-ID: <1730190466-13015-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 49T8S8nh094583
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: F2FS_BLKSIZE and 4096 are both used in f2fs_io for IO/buffer
 size, but F2FS_BLKSIZE may confuse user becasue it may be 4KB, 16KB, so use
 macro F2FS_DEFAULT_BLKSIZE to unify F2FS_BLKSIZE and 4096 in f2 [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1t5haj-00042C-P8
Subject: [f2fs-dev] [PATCH V2] f2fs-io: unify default block size
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

F2FS_BLKSIZE and 4096 are both used in f2fs_io for
IO/buffer size, but F2FS_BLKSIZE may confuse user becasue
it may be 4KB, 16KB, so use macro F2FS_DEFAULT_BLKSIZE
to unify F2FS_BLKSIZE and 4096 in f2fs_io, also adjust
"-c" parameters in mkfs man, to be consistent with commit
c35fa8cd75ac ("mkfs.f2fs: change -c option description").

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
V2: unify default block size in f2fs_io.c
---
 man/mkfs.f2fs.8         |  2 +-
 tools/f2fs_io/f2fs_io.c | 37 ++++++++++++++++++++-----------------
 tools/f2fs_io/f2fs_io.h |  2 +-
 3 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
index de885be..8b3b0cc 100644
--- a/man/mkfs.f2fs.8
+++ b/man/mkfs.f2fs.8
@@ -122,7 +122,7 @@ block size matches the page size.
 The default value is 4096.
 .TP
 .BI \-c " device-list"
-Build f2fs with these additional comma separated devices, so that the user can
+Build f2fs with these additional devices, so that the user can
 see all the devices as one big volume.
 Supports up to 7 devices except meta device.
 .TP
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 95f575f..837f8a9 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -209,7 +209,7 @@ static void do_set_verity(int argc, char **argv, const struct cmd_desc *cmd)
 	struct fsverity_enable_arg args = {.version = 1};
 
 	args.hash_algorithm = FS_VERITY_HASH_ALG_SHA256;
-	args.block_size = 4096;
+	args.block_size = F2FS_DEFAULT_BLKSIZE;
 
 	if (argc != 2) {
 		fputs("Excess arguments\n\n", stderr);
@@ -659,11 +659,11 @@ static void do_write_with_advice(int argc, char **argv,
 	if (bs > 1024)
 		die("Too big chunk size - limit: 4MB");
 
-	buf_size = bs * 4096;
+	buf_size = bs * F2FS_DEFAULT_BLKSIZE;
 
 	offset = atoi(argv[2]) * buf_size;
 
-	buf = aligned_xalloc(4096, buf_size);
+	buf = aligned_xalloc(F2FS_DEFAULT_BLKSIZE, buf_size);
 	count = atoi(argv[3]);
 
 	if (!strcmp(argv[4], "zero"))
@@ -874,11 +874,11 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 	bs = atoi(argv[1]);
 	if (bs > 1024)
 		die("Too big chunk size - limit: 4MB");
-	buf_size = bs * 4096;
+	buf_size = bs * F2FS_DEFAULT_BLKSIZE;
 
 	offset = atoi(argv[2]) * buf_size;
 
-	buf = aligned_xalloc(4096, buf_size);
+	buf = aligned_xalloc(F2FS_DEFAULT_BLKSIZE, buf_size);
 
 	count = atoi(argv[3]);
 	if (!strcmp(argv[4], "dio"))
@@ -898,9 +898,11 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 
 	advice = atoi(argv[5]);
 	if (advice) {
-		if (posix_fadvise(fd, 0, 4096, POSIX_FADV_SEQUENTIAL) != 0)
+		if (posix_fadvise(fd, 0, F2FS_DEFAULT_BLKSIZE,
+				POSIX_FADV_SEQUENTIAL) != 0)
 			die_errno("fadvise failed");
-		if (posix_fadvise(fd, 0, 4096, POSIX_FADV_WILLNEED) != 0)
+		if (posix_fadvise(fd, 0, F2FS_DEFAULT_BLKSIZE,
+				POSIX_FADV_WILLNEED) != 0)
 			die_errno("fadvise failed");
 		printf("fadvise SEQUENTIAL|WILLNEED to a file: %s\n", argv[7]);
 	}
@@ -976,9 +978,9 @@ static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
 	bs = atoi(argv[1]);
 	if (bs > 1024)
 		die("Too big chunk size - limit: 4MB");
-	buf_size = bs * 4096;
+	buf_size = bs * F2FS_DEFAULT_BLKSIZE;
 
-	buf = aligned_xalloc(4096, buf_size);
+	buf = aligned_xalloc(F2FS_DEFAULT_BLKSIZE, buf_size);
 
 	count = atoi(argv[2]);
 	if (!strcmp(argv[3], "dio"))
@@ -991,17 +993,17 @@ static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
 	if (fstat(fd, &stbuf) != 0)
 		die_errno("fstat of source file failed");
 
-	aligned_size = (u64)stbuf.st_size & ~((u64)(4096 - 1));
+	aligned_size = (u64)stbuf.st_size & ~((u64)(F2FS_DEFAULT_BLKSIZE - 1));
 	if (aligned_size < buf_size)
 		die("File is too small to random read");
-	end_idx = (u64)(aligned_size - buf_size) / (u64)4096 + 1;
+	end_idx = (u64)(aligned_size - buf_size) / (u64)F2FS_DEFAULT_BLKSIZE + 1;
 
 	srand((unsigned) time(&t));
 
 	for (i = 0; i < count; i++) {
 		idx = rand() % end_idx;
 
-		ret = pread(fd, buf, buf_size, 4096 * idx);
+		ret = pread(fd, buf, buf_size, F2FS_DEFAULT_BLKSIZE * idx);
 		if (ret != buf_size)
 			break;
 
@@ -1031,15 +1033,16 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
 	}
 
 	memset(fm, 0, sizeof(struct fiemap));
-	start = (u64)atoi(argv[1]) * F2FS_BLKSIZE;
-	length = (u64)atoi(argv[2]) * F2FS_BLKSIZE;
+	start = (u64)atoi(argv[1]) * F2FS_DEFAULT_BLKSIZE;
+	length = (u64)atoi(argv[2]) * F2FS_DEFAULT_BLKSIZE;
 	fm->fm_start = start;
 	fm->fm_length = length;
 
 	fd = xopen(argv[3], O_RDONLY | O_LARGEFILE, 0);
 
 	printf("Fiemap: offset = %"PRIu64" len = %"PRIu64"\n",
-				start / F2FS_BLKSIZE, length / F2FS_BLKSIZE);
+				start / F2FS_DEFAULT_BLKSIZE,
+				length / F2FS_DEFAULT_BLKSIZE);
 	if (ioctl(fd, FS_IOC_FIEMAP, fm) < 0)
 		die_errno("FIEMAP failed");
 
@@ -1219,9 +1222,9 @@ static void do_copy(int argc, char **argv, const struct cmd_desc *cmd)
 		if (ret < 0)
 			die_errno("sendfile failed");
 	} else {
-		char *buf = aligned_xalloc(4096, 4096);
+		char *buf = aligned_xalloc(F2FS_DEFAULT_BLKSIZE, F2FS_DEFAULT_BLKSIZE);
 
-		while ((ret = xread(src_fd, buf, 4096)) > 0)
+		while ((ret = xread(src_fd, buf, F2FS_DEFAULT_BLKSIZE)) > 0)
 			full_write(dst_fd, buf, ret);
 		free(buf);
 	}
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index e55db5f..14c9dc1 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -48,7 +48,7 @@ typedef u16	__be16;
 typedef u32	__be32;
 #endif
 
-#define F2FS_BLKSIZE	4096
+#define F2FS_DEFAULT_BLKSIZE	4096
 #define NEW_ADDR	0xFFFFFFFF
 
 #ifndef FS_IOC_GETFLAGS
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
