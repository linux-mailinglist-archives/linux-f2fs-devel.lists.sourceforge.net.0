Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5E03E3CEB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  8 Aug 2021 23:52:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mCqis-0008TQ-DO; Sun, 08 Aug 2021 21:52:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1mCqir-0008TF-He
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 Aug 2021 21:52:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZBisvwrIQ7iEb0ZHHGpaTqr2PuP/8UAbapg7LIgk4LI=; b=Tf2V5VG96x7RapggO7bhTz7+gl
 Fwu6yISuV+hLEmY4Uut1KDL102a1BmVwMKRuRb+9svHxW/V05s9Uwbb95SROvNT23dbfD4oQJJ7HR
 jG+mOkYmMK9K3Us9ioqs8AVhjXo39mI991Xy/Dh68yTcPBsev7zP2ysx5fux8RjQYPwU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZBisvwrIQ7iEb0ZHHGpaTqr2PuP/8UAbapg7LIgk4LI=; b=N
 PktqOgxijATT/BOe5+Y7dm9AxpA3LnvFUEY0o/Lefw/+MueifGmb9rHbf3nwzs+xvpiInjBBzvCB7
 JVwusF/756u6mFMK7n+Fb1j1xMQxFBykNgR7WD6MPiaYa///LEc3IpoTJ7ZhIHmXP1oMg+4Iy7CJf
 H0Uv5C8steLgd8NQ=;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mCqip-00027v-HB
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 Aug 2021 21:52:45 +0000
Received: by mail-pj1-f46.google.com with SMTP id oa17so9564pjb.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 08 Aug 2021 14:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZBisvwrIQ7iEb0ZHHGpaTqr2PuP/8UAbapg7LIgk4LI=;
 b=ZYrBruw90MxhenNP5nSUlZ7lVFgEVfBoBAGLjXQcW3Xln3BInDaDrA/ThNjX/Arw38
 NvaL4QhoMEhEISmhK+7011NbHShaXVTRTV81c02eYSVTqaVJSaOPVuOhxWyxCZVHK26/
 QXLbuvQv4Rb4UQlRwV9zTcbf11Rh8pYgDL1YfwDl3BWdt6CkZFkhfVB70PoVubBitWmP
 iR/u5IARvpJRadGXg/2NHpDSYUB/IYuA4EKggm9aIS0ATV7SER8MXfPCY0z7jEOlxCFJ
 nNQMgbBVXCsyOk0ZH+r3PRox4SHpTLstaTszVtyBYlJRM/vbcYAg4rDxjHBsAKW5C1DI
 b04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZBisvwrIQ7iEb0ZHHGpaTqr2PuP/8UAbapg7LIgk4LI=;
 b=a+ZpfEaKImbMh2XIs+dnuz2F563Zvm2R6EqHj8Cz9iNaH31115O3SSK2nEruxB9Yl7
 sG7NJ+NF1WNUO2sTcN9iVwevNfReuuXV8dFO8p2bB1Phqs80iYzgrdNKS+rt++0J3hB8
 KEmWEQTgUH4NafOCiB5+of7P13aoEJF7RMwXQcXWfigzxtpgBE5i25SNdxxC294si/HK
 LKx1JkXGSvhIad2xdqHjG3QuHijViFQhEScn1jHVC2lx4pS9VnOzw44Nutcyuwj6yVnT
 zhFa3afH4VGrt8B7aSXo/VOiiZXQ60d92LoG8JMV4ZJ+FqolB8jMyLtsXAscyE6fgJvc
 s20Q==
X-Gm-Message-State: AOAM530FiJsmT4FN1ib71KSKxGg5Xh6q9PdY8EBt83kqbYcIXZAsorsJ
 4LVwWxDc3QLfnYaZNeviDNc=
X-Google-Smtp-Source: ABdhPJwSR4vBkyzWqC2fCEK7SqwJ5+3XQFoc+BgyNBy1Eu9dvKa+2s9azqsRBVxmCLw6PjUKzob0OQ==
X-Received: by 2002:a62:d404:0:b029:3a1:8a54:728 with SMTP id
 a4-20020a62d4040000b02903a18a540728mr15210415pfh.37.1628459557831; 
 Sun, 08 Aug 2021 14:52:37 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:82f:f0c4:8925:ebc2])
 by smtp.gmail.com with ESMTPSA id r13sm20265080pgi.78.2021.08.08.14.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 14:52:37 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Sun,  8 Aug 2021 14:52:33 -0700
Message-Id: <20210808215234.1939266-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.46 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.46 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mCqip-00027v-HB
Subject: [f2fs-dev] [PATCH] f2fs-tools: change fiemap print out format
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

Given fiemap way to print out extents in the kernel, we can correctly
print the layout of each file in a unit of extent, not block. So, I
changed fiemap print out way like below.

Fiemap: offset = 0 len = 60
	logical addr.    physical addr.   length           flags
0	0000000000000000 00000020032df000 0000000000004000 00001008
1	0000000000004000 00000020032e0000 0000000000004000 00001008
2	0000000000008000 00000020032e1000 0000000000004000 00001008
3	000000000000c000 00000020032e2000 0000000000004000 00001008

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 tools/f2fs_io/f2fs_io.c | 53 ++++++++++++++++++++++++++---------------
 1 file changed, 34 insertions(+), 19 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 42dbd60..0d2948e 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -731,11 +731,11 @@ static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
 #if defined(HAVE_LINUX_FIEMAP_H) && defined(HAVE_LINUX_FS_H)
 static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
 {
-	unsigned count, i;
-	int fd;
-	__u64 phy_addr;
-	struct fiemap *fm = xmalloc(sizeof(struct fiemap) +
-			sizeof(struct fiemap_extent));
+	unsigned int i;
+	int fd, extents_mem_size;
+	u64 start, length;
+	u32 mapped_extents;
+	struct fiemap *fm = xmalloc(sizeof(struct fiemap));
 
 	if (argc != 4) {
 		fputs("Excess arguments\n\n", stderr);
@@ -743,26 +743,41 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
 		exit(1);
 	}
 
-	fm->fm_start = atoi(argv[1]) * F2FS_BLKSIZE;
-	fm->fm_length = F2FS_BLKSIZE;
-	fm->fm_extent_count = 1;
-	count = atoi(argv[2]);
+	memset(fm, 0, sizeof(struct fiemap));
+	start = atoi(argv[1]) * F2FS_BLKSIZE;
+	length = atoi(argv[2]) * F2FS_BLKSIZE;
+	fm->fm_start = start;
+	fm->fm_length = length;
 
 	fd = xopen(argv[3], O_RDONLY | O_LARGEFILE, 0);
 
-	printf("Fiemap: offset = %08"PRIx64" len = %d\n",
-				(u64)fm->fm_start / F2FS_BLKSIZE, count);
-	for (i = 0; i < count; i++) {
-		if (ioctl(fd, FS_IOC_FIEMAP, fm) < 0)
-			die_errno("FIEMAP failed");
+	printf("Fiemap: offset = %"PRIu64" len = %"PRIu64"\n",
+				start / F2FS_BLKSIZE, length / F2FS_BLKSIZE);
+	if (ioctl(fd, FS_IOC_FIEMAP, fm) < 0)
+		die_errno("FIEMAP failed");
+
+	mapped_extents = fm->fm_mapped_extents;
+	extents_mem_size = sizeof(struct fiemap_extent) * mapped_extents;
+	free(fm);
+	fm = xmalloc(sizeof(struct fiemap) + extents_mem_size);
 
-		phy_addr = fm->fm_extents[0].fe_physical / F2FS_BLKSIZE;
-		printf("%llu: %llu\n", fm->fm_start / F2FS_BLKSIZE, phy_addr);
+	memset(fm, 0, sizeof(struct fiemap));
+	memset(fm->fm_extents, 0, extents_mem_size);
+	fm->fm_start = start;
+	fm->fm_length = length;
+	fm->fm_extent_count = mapped_extents;
 
-		if (fm->fm_extents[0].fe_flags & FIEMAP_EXTENT_LAST)
-			break;
+	if (ioctl(fd, FS_IOC_FIEMAP, fm) < 0)
+		die_errno("FIEMAP failed");
 
-		fm->fm_start += F2FS_BLKSIZE;
+	printf("\t%-17s%-17s%-17s%s\n", "logical addr.", "physical addr.", "length", "flags");
+	for (i = 0; i < fm->fm_mapped_extents; i++) {
+		printf("%d\t%.16llx %.16llx %.16llx %.8x\n", i,
+		    fm->fm_extents[i].fe_logical, fm->fm_extents[i].fe_physical,
+		    fm->fm_extents[i].fe_length, fm->fm_extents[i].fe_flags);
+
+		if (fm->fm_extents[i].fe_flags & FIEMAP_EXTENT_LAST)
+			break;
 	}
 	printf("\n");
 	free(fm);
-- 
2.32.0.605.g8dce9f2422-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
