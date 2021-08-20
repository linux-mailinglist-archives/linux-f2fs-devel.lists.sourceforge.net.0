Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFAC3F2F8C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Aug 2021 17:36:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mH6ZK-0001Gg-Ch; Fri, 20 Aug 2021 15:36:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1mH6ZJ-0001GQ-9G
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 15:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EVaM21zboKi9bHEQ0ttFpVnASIsPfjTlp97ppLGTj1U=; b=VwxMmf3FawE7Si76LwAW0im2ec
 yRuSVA89pZ27ATd2Wp8uPK9xn13irIqVMAm+C1+04Jo+6L6LF/ajRUPYpAtnETYjYN2RnN3J4tx1+
 0X/dYMS2PC06OImbvVJEJ48bWZSehg18841ISRzfTCKaYJFs7nj0p2gyYQKPhfFOrotM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EVaM21zboKi9bHEQ0ttFpVnASIsPfjTlp97ppLGTj1U=; b=k
 Lf7TjN26Bdjq4DxyVOKs38ntc3PGdaV3Hc+qsONE7UeFxsVi/aF6kis9il0NwJwDwa+231MH1u1HX
 P6X83kVvgtty9ps6C/xQxGeo9M+mm9LNnkKiYVhni4iYuxtbVYhE6UrAEQg+lgYxW1mJOdzEJm6Gp
 NZ7QVgxyata2DZyk=;
Received: from mail-pg1-f181.google.com ([209.85.215.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mH6ZE-0005aS-RH
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 15:36:29 +0000
Received: by mail-pg1-f181.google.com with SMTP id k14so9544154pga.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 20 Aug 2021 08:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EVaM21zboKi9bHEQ0ttFpVnASIsPfjTlp97ppLGTj1U=;
 b=Sojg/FHkKWx5wUVjCacavd+y6ZfzcktO5t3SV5aDArCmtppXNu/zhRNw43x79Vb/dL
 BAxy4fkdbNL1WJcQ+PN+/md+CQbQJh3QC9TuCKFtG0SAZN+pVKuzBIV4ZID/TfpCL9co
 +DulgMA2PlokWE3+Q2VOE8jbQ+3nazlsB7+HlPuGRSkc0cjdtrTYlubveGVGvlS54zmR
 QdFrCukummdFJN0jWJM/t/GvJ70rJh0iNCaCzIkWXLfwMnEHPVD9MFtyKfXsOnpy7I5/
 K0OOmTufWPY+OfWKjLbPBOVMUvm0Mk66HfL4sAhCKLIyfAAUJgvQ4kZWdS0nFH3tLzYS
 59ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EVaM21zboKi9bHEQ0ttFpVnASIsPfjTlp97ppLGTj1U=;
 b=ubGQYHaVl/I+onh6rY9WojwJTbH938BFlPO4FcPPlkODiwSZs6fb7YFokaHxoCEcnO
 U6zuoNmXoV1wxICPRk0k3jI5FiD3GXubS1K6le4oH2KhmSTQ+gDpSwGF1hWg0sKVLL36
 CX2e1q4YEPYJ/oP4jNNLQHVlPk4BsBqnlSUE2/EZ/BBZSw9t+vo1R22qU5k7iulvyf2I
 mY//yQfCx5tPq7PUIc0E0k4UPHBSy8aC6w+C2u33nHaJVCPwqaJggxHfrYo1SN5xsuYC
 yrxRuWb+bsCg9JTi3X71+cEA0p+7Uw6c9gW1kQfsFUFcEj7Nc+FysJ5GATO2GrjvrSOl
 vAag==
X-Gm-Message-State: AOAM532u34NCPXrut4YVm7S9kwMXqbdW1FvVovX4NVSUPRQEonzAuyzD
 eS9S7f4xKTR1TOW6iN2pgMc=
X-Google-Smtp-Source: ABdhPJwcdA24G6Cd01HsD0eemjnvTy4qFsaRW6JSBJ3Zhbi7SEB0630kvaIfGiynoPsRWd5pIP9biw==
X-Received: by 2002:a63:5f88:: with SMTP id t130mr19367782pgb.6.1629473779239; 
 Fri, 20 Aug 2021 08:36:19 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:ab38:89b9:1824:6a27])
 by smtp.gmail.com with ESMTPSA id h24sm6684821pjv.3.2021.08.20.08.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 08:36:18 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 20 Aug 2021 08:36:14 -0700
Message-Id: <20210820153615.275030-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.181 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.181 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1mH6ZE-0005aS-RH
Subject: [f2fs-dev] [PATCH v2] f2fs-tools: change fiemap print out format
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
v2: merged two separate memset into one
---
 tools/f2fs_io/f2fs_io.c | 52 ++++++++++++++++++++++++++---------------
 1 file changed, 33 insertions(+), 19 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 42dbd60..ae4d405 100644
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
@@ -743,26 +743,40 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
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
+	memset(fm, 0, sizeof(struct fiemap) + extents_mem_size);
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
2.33.0.rc2.250.ged5fa647cd-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
