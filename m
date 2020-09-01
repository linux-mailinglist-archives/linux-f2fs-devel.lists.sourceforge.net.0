Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A61A025863C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Sep 2020 05:37:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kCx6k-0001yQ-90; Tue, 01 Sep 2020 03:37:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kCx6i-0001yG-IO
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Sep 2020 03:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W26WVAXDUgciA/+TeC3PK4FPBrRKOiUHfGEjVhYQoT4=; b=ISdwdFZGRAHIrZ3BhDRfrmXiZ3
 XyGaNHqb8xKltDULOV3jHlyqPQN9MG9cTIZKOqkPedmsfjRdMSkxB7Hu90ZP0lxhIiW2vDfK/vW0N
 7Sh2V7yGM+WMnwNspxxEpFZE88B9IQtHdKxD4kuu0pf+2Zy7QJdLSRcr8+2jy7dzZxf0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=W26WVAXDUgciA/+TeC3PK4FPBrRKOiUHfGEjVhYQoT4=; b=l
 fLIRnUcex+AEnBlCpfC1ZNgKmNKrJynrX18EFjBGPMw44vBvT9cWyAQ/cWTjehsG5rMijzPLIFl/j
 0roZuw5JmW3ZCDDxVPNw6FlNKwgHIgQudkCGTZZ0CKAoiERCMdBtkyIK3eh3N8vwkY78dgC4+jwo/
 fpCzrQQrzOEdYElg=;
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kCx6b-008USZ-4G
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Sep 2020 03:37:16 +0000
Received: by mail-pg1-f194.google.com with SMTP id 67so1902409pgd.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 31 Aug 2020 20:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W26WVAXDUgciA/+TeC3PK4FPBrRKOiUHfGEjVhYQoT4=;
 b=dBxEqQQ3095dghBPKUh9gCXDyal1RoSdhpwqd/IjukYcdI38ro/lYHXfOrb4TPksV9
 eFVWRTzNWB8PQj0uNB3ZLV/vCuEP5wv9x5vhJhv/385/wEzF1huSSEsKCaHxNMuQSRfl
 ScO8VZHVsv6Nqo1PA0zP9xJvRNAT+QfEWzl6FQZcNv8t3VgWXW4QZQSQlQc7ALGrYUed
 SY1DbTreiRH5DOuD5kyUFkOL6PMHmaReporqtlasYKqSvVTvvat2i2eoc/I5KhC9Kvmf
 GwEtC56eq4ywmQYUPUviVLCRJDRnLsiM4/vt4tyZbHFcxyRbhk5wMsFhIPsgu9E5cjlf
 tlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W26WVAXDUgciA/+TeC3PK4FPBrRKOiUHfGEjVhYQoT4=;
 b=VI6Ele2hnjgetXs+WXNU4AZJE6JmN3B0VMYeUNmkeAvILo/46QQmrr/6sA3o3geBJS
 gAr0dcWIK4fLc8cw9NJ6HvAVSKjSydxzbKZs5MZf8iNkPMx/cISyUJDvYtWPPrXVpgcE
 yGvHmq6NAvr2GEtJzNAitEPfoJgLZzXWBfRAE43Sdc15avjaz+srFcPOMW3wcSeq1IbR
 pNOTjjoKi3NXG7iJcXyaOqoCMXpp66u4r72uQAAHpOo+TpexWOBNScq4AYCajEOpLVbx
 hYDXQziuaky2CSQNXXxVHVUGpp/GA2BTMPgF4EgdS7DHlZlZDdi4BGdpRm2PXZDCLMQp
 dUvg==
X-Gm-Message-State: AOAM533Q7SrZ6AcZkEDS6Pkei5KqpE9hnHPGq4jfELQO7AfH15lyGTtD
 u9epu4B31N+b65YwPiFWU9894GCfV4I=
X-Google-Smtp-Source: ABdhPJzHL/fB3/6V9e3aMtAeKB4BHtSk5Yyx6A9gHBy+FfYVk67CUblb8DDq0iNC6kQV89ld8GgWsg==
X-Received: by 2002:a62:8003:: with SMTP id j3mr4016608pfd.221.1598931423108; 
 Mon, 31 Aug 2020 20:37:03 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id g5sm1052747pjx.53.2020.08.31.20.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 20:37:02 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  1 Sep 2020 12:36:49 +0900
Message-Id: <20200901033649.3537459-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kCx6b-008USZ-4G
Subject: [f2fs-dev] [PATCH] f2fs_io: change fibmap to fiemap
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
 tools/f2fs_io/f2fs_io.c | 56 ++++++++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 17 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index abb655a..fc81b93 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -631,27 +631,42 @@ static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
-struct file_ext {
-	__u32 f_pos;
-	__u32 start_blk;
-	__u32 end_blk;
-	__u32 blk_count;
+struct fiemap_extent {
+	__u64 fe_logical;
+	__u64 fe_physical;
+	__u64 fe_length;
+	__u64 fe_reserved64[2];
+	__u32 fe_flags;
+	__u32 fe_reserved[3];
 };
 
-#ifndef FIBMAP
-#define FIBMAP          _IO(0x00, 1)    /* bmap access */
+struct fiemap {
+	__u64 fm_start;
+	__u64 fm_length;
+	__u32 fm_flags;
+	__u32 fm_mapped_extents;
+	__u32 fm_extent_count;
+	__u32 fm_reserved;
+	struct fiemap_extent fm_extent[0];
+};
+
+#ifndef FIEMAP
+#define FIEMAP		_IOWR('f', 11, struct fiemap)
 #endif
 
+#define NEW_ADDR	0xFFFFFFFF
+
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
@@ -659,21 +674,28 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
 		exit(1);
 	}
 
-	offset = atoi(argv[1]);
+	fm->fm_start = atoi(argv[1]) * 4096;
+	fm->fm_length = 4096;
+	fm->fm_extent_count = 1;
 	count = atoi(argv[2]);
 
 	fd = xopen(argv[3], O_RDONLY | O_LARGEFILE, 0);
 
-	printf("Fiemap: offset = %08"PRIx64" len = %d\n", offset, count);
+	printf("Fiemap: offset = %08"PRIx64" len = %d\n",
+						fm->fm_start / 4096, count);
 	for (i = 0; i < count; i++) {
-		blknum = offset + i;
-
-		if (ioctl(fd, FIBMAP, &blknum) < 0)
-			die_errno("FIBMAP failed");
-
-		printf("%u ", blknum);
+		if (ioctl(fd, FIEMAP, fm) < 0)
+			die_errno("FIEMAP failed");
+
+		phy_addr = fm->fm_extent[0].fe_physical / 4096;
+		if (phy_addr == NEW_ADDR)
+			printf("NEW_ADDR ");
+		else
+			printf("%llu ", phy_addr);
+		fm->fm_start += 4096;
 	}
 	printf("\n");
+	free(fm);
 	exit(0);
 }
 
-- 
2.28.0.402.g5ffc5be6b7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
