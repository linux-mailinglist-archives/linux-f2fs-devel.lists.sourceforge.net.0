Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1B125B8DB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Sep 2020 04:45:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kDfFO-0001S7-Ac; Thu, 03 Sep 2020 02:45:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kDfFM-0001S0-Fo
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Sep 2020 02:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iIZHxnxKzzP7HSQTXQfsi01nKmvKP0Zxwnv1z/R0SSU=; b=DHlQPqk5R5Yo6FKkcL6JMFDA7c
 +9BvbrR680XLYXFam1sIw8AC0pByH91ZoNJZlMnmFbwd4GPmBXnYlbECkx++32oRxIF9pJQoFye1S
 h/6T/8czpc2QfzifnVF6cRwZqQgUtbssgBQjEEYMpDwj/0Z9v2ewCG6mm1gmnJBFELFg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iIZHxnxKzzP7HSQTXQfsi01nKmvKP0Zxwnv1z/R0SSU=; b=W
 JzVkX4OlWlvi8kXszXLeVAZ7QJMWxyAljMcgw0MkYdqLkI3+4xfTm61uG+OzA4FlQOii3jwpOa4fo
 flwQV5LOYQdqxpxOSXmDL/sYWHlNvUKufpeMwOvhcjxvfzEtRRrHbNrBFU7vUWDf6z5CE3pneaHyt
 18CnNLBfMEmMc7Yg=;
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kDfFF-00Asmi-MD
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Sep 2020 02:45:08 +0000
Received: by mail-pg1-f196.google.com with SMTP id 7so861099pgm.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 02 Sep 2020 19:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iIZHxnxKzzP7HSQTXQfsi01nKmvKP0Zxwnv1z/R0SSU=;
 b=vC9bub+VwRzIe10a7yozSo/jhJlJgqugVdBw/j8oRxYNMAH/D3r38X8JcM589Jmvpj
 vUsKt9/gswUHWZLv+/y7Hd5RZoJYPcjY0VIo4H8C/50jjdCrixly4fYftujpXiOdjczn
 aGz4suPQuZyVvo+vIUKNFTVHWtdUGCcE0P4Ryju/ZUnPh+B9U6KVsLN2nMA9LS3U+5ao
 9npRqEmF4QaoG8ivrNDnlp9kxEGC7+b50QAguSZ/oivmQ9pL/pkuNkhUiU4FycHWvSjq
 V+f5Iby0ZviZfa5H1uWaXpsVIibp0+abqsSXkOE1e2ZOWQGrOBTV8ebuOso5xTjecwRY
 2ZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iIZHxnxKzzP7HSQTXQfsi01nKmvKP0Zxwnv1z/R0SSU=;
 b=Ln+hEkpPJ0T6gZwlTsJrQjf4UFQdp7s2ANwc98a0uKSCZ/Vb11swS4sBW8A74Ll9FX
 5dkH7aPjTPKy1ZjpnCotQCeX2CsghgDHAQzl49JNuKuQn1lhjiJmOCFw3Y9HngogWDo5
 jD7qYommUM1W8MRHottUGdxL8VFx5ACpaa1oHCWyobh0nmbZgYm5HFSh801qMCImyzAg
 E7mBfJ4M8izbyI4RmTNnHV74oOUijnnlAqftb3Bn1lPxiP7DX8w87TQcWSeioXvyXtRZ
 YbBMDRPzy0q6NEHi5n9NOX+wG1dPCGgDwBohWfaZD3pYvpQsg1suZ9G1aTnkWpjuEEjA
 Mldw==
X-Gm-Message-State: AOAM531Z6XQW3h3FXCIxZadiSdDO0wOUPZi2LswPNOWB3v4vbXuRpUpJ
 6+HbU14Xhffe7Dan59La96R4XerQ2J4=
X-Google-Smtp-Source: ABdhPJxV4kJHClt+k8KmlnZ8Jft8MGWtU4NApjP3ofGcUEgq/AqQibpuKKnl59msllSzOJePOyaC9Q==
X-Received: by 2002:a17:902:7003:: with SMTP id
 y3mr147542plk.152.1599101094716; 
 Wed, 02 Sep 2020 19:44:54 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id h14sm331312pfe.67.2020.09.02.19.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 19:44:54 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  3 Sep 2020 11:44:42 +0900
Message-Id: <20200903024442.296703-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.196 listed in wl.mailspike.net]
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
X-Headers-End: 1kDfFF-00Asmi-MD
Subject: [f2fs-dev] [PATCH v2] f2fs_io: change fibmap to fiemap
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
Changes in v2:
 - Move declaration to header file
---
 tools/f2fs_io/f2fs_io.c | 37 +++++++++++++++++--------------------
 tools/f2fs_io/f2fs_io.h | 26 ++++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 20 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index abb655a..9a651c0 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -631,27 +631,17 @@ static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
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
 	unsigned count, i;
 	int fd;
+	__u64 phy_addr;
+	struct fiemap *fm = xmalloc(sizeof(struct fiemap) +
+			sizeof(struct fiemap_extent));
 
 	if (argc != 4) {
 		fputs("Excess arguments\n\n", stderr);
@@ -659,21 +649,28 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
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
+		if (ioctl(fd, FIEMAP, fm) < 0)
+			die_errno("FIEMAP failed");
 
-		printf("%u ", blknum);
+		phy_addr = fm->fm_extent[0].fe_physical / F2FS_BLKSIZE;
+		if (phy_addr == NEW_ADDR)
+			printf("NEW_ADDR ");
+		else
+			printf("%llu ", phy_addr);
+		fm->fm_start += F2FS_BLKSIZE;
 	}
 	printf("\n");
+	free(fm);
 	exit(0);
 }
 
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index bd19ff9..62d6e7b 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -38,6 +38,9 @@ typedef u16	__be16;
 typedef u32	__be32;
 #endif
 
+#define F2FS_BLKSIZE	4096
+#define NEW_ADDR	0xFFFFFFFF
+
 #ifndef FS_IOC_GETFLAGS
 #define FS_IOC_GETFLAGS			_IOR('f', 1, long)
 #endif
@@ -132,6 +135,29 @@ typedef u32	__be32;
 #define FS_CASEFOLD_FL			0x40000000 /* Folder is case insensitive */
 #endif
 
+struct fiemap_extent {
+	u64 fe_logical;
+	u64 fe_physical;
+	u64 fe_length;
+	u64 fe_reserved64[2];
+	u32 fe_flags;
+	u32 fe_reserved[3];
+};
+
+struct fiemap {
+	u64 fm_start;
+	u64 fm_length;
+	u32 fm_flags;
+	u32 fm_mapped_extents;
+	u32 fm_extent_count;
+	u32 fm_reserved;
+	struct fiemap_extent fm_extent[0];
+};
+
+#ifndef FIEMAP
+#define FIEMAP				_IOWR('f', 11, struct fiemap)
+#endif
+
 struct f2fs_gc_range {
 	u32 sync;
 	u64 start;
-- 
2.28.0.526.ge36021eeef-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
