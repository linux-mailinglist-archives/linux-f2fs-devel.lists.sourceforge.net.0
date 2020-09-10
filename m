Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE83263C72
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Sep 2020 07:30:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kGF9w-0006zo-Ud; Thu, 10 Sep 2020 05:30:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kGF9v-0006zX-1N
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Sep 2020 05:30:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ixKtzEvHJH34LSnkKiSx1X4DBXGbCstuBh0eWIgEwVA=; b=nEptFBD/qmT+ZJtIvQa8i+QSqy
 mirIn1nT2Q8qN7xmMh7jJUdcNg3umdfo1mH3aiwsmhLS21dgkXhTIsr9gWuZp9J+jwS6puePW41p7
 wnj5ILO/mhzeSW3f+mLQgZBspFbsmg5SNoamBSn+ATjf4ee7z0UwTS2N1hyfiNVbf5u0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ixKtzEvHJH34LSnkKiSx1X4DBXGbCstuBh0eWIgEwVA=; b=W
 2EkqMsZCqkv1GFJnQpfduI++rldl3w16RZhHGxLRXAxw/qA9X8BM6+WAg1+lm0xEX6MOB0230W2qt
 71MY5xyMGafbMYgTwMj6FyZ+Rl6zUeo6Yz53RM2q3C4bGRdcKx/lwtQWFTT0LKQqsJussgO7/e0QK
 ftiG2tNmfcc37NZI=;
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kGF9k-001U1a-Mn
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Sep 2020 05:30:10 +0000
Received: by mail-pg1-f193.google.com with SMTP id 7so3605193pgm.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 09 Sep 2020 22:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ixKtzEvHJH34LSnkKiSx1X4DBXGbCstuBh0eWIgEwVA=;
 b=izmwG5XVoH6m8fEH4G+lo0jYPj/XSIN0G9QiaH/atBzhSGWUG5jftiJyd8ZrAAjxQZ
 ZnacTIlMABZz4QEuA5PCD4oNNO1g3XOl9jw4RZIgoOJZX5rdcCcZPMqIGXVGQa52x3ss
 9EhYfgBNWjM5xUx4yJO/JvcGmK+uKIGF7lIDycgvn4ntsVYicHgX04OjHrFIqiPelCYW
 wpYby9pQ59xM9Cr7+DxPU1fFCnFG2OoBCKpoHWdkocbKmMtxElvnXbs8qDIWkgqTlHi+
 RR0y9B4bD0pzuAP66mPRFvvzGEUcDk9m5XaA6tBRKemLQbvvfZBRq+Mycj1w2k62TLM4
 JaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ixKtzEvHJH34LSnkKiSx1X4DBXGbCstuBh0eWIgEwVA=;
 b=M7/PLS66xVesr8FsPRtNTiULL/sIRPYLyj3VPuna3Uowb7uH2clH8e5narkXKWrgrs
 iZPFh+nqj3ni5oambsnhIu1eSiYXHP7XQgDAFdRh1MEouDv6ekbSdjatiRUU/2Io9cej
 gSkfDmWFaTSqzGtNmQjQS54bVjCcYmN+RFCN2VhxRZwOYnUIJE3EkZpCb6KDf47KDvco
 bPtJ9wGlGRTiLquwi7aygUZGReKnXGhsCkE+OJUwRUvHy+daZMOXEDO27oWti4iNAFHC
 MsaFXIdD0oJiWlXZspjCpX4DPdtZQcx1huFuN46DmcRgrDsMIPEyS3u5DxXaCsrjKAVP
 P3UQ==
X-Gm-Message-State: AOAM5330AYOUewSlENneOG25Hdmo1j0SvNajUzcXQ4Mm1UsUDomdvDFP
 keY6MlCWinf3bnDG2SiKh4zsVfUsz3M=
X-Google-Smtp-Source: ABdhPJzv4Husl/kHmjP7pLDAcb/6R50kVWwlc66FsFk3E+edfGM/RGr4RvJiDrZ9mZJpSs/3/w/Pnw==
X-Received: by 2002:a63:4d8:: with SMTP id 207mr3263642pge.109.1599715794667; 
 Wed, 09 Sep 2020 22:29:54 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id mh8sm753280pjb.32.2020.09.09.22.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 22:29:53 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 10 Sep 2020 14:29:48 +0900
Message-Id: <20200910052948.2021806-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.193 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: configure.ac]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kGF9k-001U1a-Mn
Subject: [f2fs-dev] [PATCH v3] f2fs_io: change fibmap to fiemap
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Currently we support fiemap command using fibmap. It's simple and
easy to use, but we cannot use this for compressed file. To support
more different types of files, we need to change this to use fiemap.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
Changes in v3:
 - Change to use linux/fiemap.h header
Changes in v2:
 - Move declaration to header file
---
 configure.ac            |  1 +
 tools/f2fs_io/f2fs_io.c | 41 +++++++++++++++++++++--------------------
 tools/f2fs_io/f2fs_io.h | 10 ++++++++++
 3 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/configure.ac b/configure.ac
index e9acd1a..eb1e745 100644
--- a/configure.ac
+++ b/configure.ac
@@ -93,6 +93,7 @@ AC_CHECK_HEADERS(m4_flatten([
 	linux/posix_acl.h
 	linux/types.h
 	linux/xattr.h
+	linux/fiemap.h
 	mach/mach_time.h
 	mntent.h
 	scsi/sg.h
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index abb655a..5a2d06e 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -631,27 +631,18 @@ static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
-struct file_ext {
-	__u32 f_pos;
-	__u32 start_blk;
-	__u32 end_blk;
-	__u32 blk_count;
-};
-
-#ifndef FIBMAP
-#define FIBMAP          _IO(0x00, 1)    /* bmap access */
-#endif
-
 #define fiemap_desc "get block address in file"
 #define fiemap_help					\
 "f2fs_io fiemap [offset in 4kb] [count] [file_path]\n\n"\
 
 static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
 {
-	u64 offset;
-	u32 blknum;
+#if defined(HAVE_LINUX_FIEMAP_H) && defined(HAVE_LINUX_FS_H)
 	unsigned count, i;
 	int fd;
+	__u64 phy_addr;
+	struct fiemap *fm = xmalloc(sizeof(struct fiemap) +
+			sizeof(struct fiemap_extent));
 
 	if (argc != 4) {
 		fputs("Excess arguments\n\n", stderr);
@@ -659,22 +650,32 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
 		exit(1);
 	}
 
-	offset = atoi(argv[1]);
+	fm->fm_start = atoi(argv[1]) * F2FS_BLKSIZE;
+	fm->fm_length = F2FS_BLKSIZE;
+	fm->fm_extent_count = 1;
 	count = atoi(argv[2]);
 
 	fd = xopen(argv[3], O_RDONLY | O_LARGEFILE, 0);
 
-	printf("Fiemap: offset = %08"PRIx64" len = %d\n", offset, count);
+	printf("Fiemap: offset = %08"PRIx64" len = %d\n",
+					fm->fm_start / F2FS_BLKSIZE, count);
 	for (i = 0; i < count; i++) {
-		blknum = offset + i;
-
-		if (ioctl(fd, FIBMAP, &blknum) < 0)
-			die_errno("FIBMAP failed");
+		if (ioctl(fd, FS_IOC_FIEMAP, fm) < 0)
+			die_errno("FIEMAP failed");
 
-		printf("%u ", blknum);
+		phy_addr = fm->fm_extents[0].fe_physical / F2FS_BLKSIZE;
+		if (phy_addr == NEW_ADDR)
+			printf("NEW_ADDR ");
+		else
+			printf("%llu ", phy_addr);
+		fm->fm_start += F2FS_BLKSIZE;
 	}
 	printf("\n");
+	free(fm);
 	exit(0);
+#else
+	die("Not support for this platform");
+#endif
 }
 
 #define gc_urgent_desc "start/end/run gc_urgent for given time period"
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index bd19ff9..05d4cfe 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -10,6 +10,13 @@
 #ifdef HAVE_LINUX_TYPES_H
 #include <linux/types.h>
 #endif
+#ifdef HAVE_LINUX_FIEMAP_H
+#include <linux/fiemap.h>
+#endif
+#ifdef HAVE_LINUX_FS_H
+#include <linux/fs.h>
+#endif
+
 #include <sys/types.h>
 
 #ifdef UNUSED
@@ -38,6 +45,9 @@ typedef u16	__be16;
 typedef u32	__be32;
 #endif
 
+#define F2FS_BLKSIZE	4096
+#define NEW_ADDR	0xFFFFFFFF
+
 #ifndef FS_IOC_GETFLAGS
 #define FS_IOC_GETFLAGS			_IOR('f', 1, long)
 #endif
-- 
2.28.0.526.ge36021eeef-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
