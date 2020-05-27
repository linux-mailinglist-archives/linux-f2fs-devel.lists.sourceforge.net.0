Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BF31E517D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2020 00:53:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1je4v9-00043p-JL; Wed, 27 May 2020 22:53:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1je4v8-00043j-Ug
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 May 2020 22:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zzVBYe1nVhSYnRyfMU4C5iudcF8edWINrDPqE70Sdn4=; b=BBYc1G9hlktCttWi8OxTnwxbet
 FWICH8FCEPrPSVZX3aWOteNVH+ja+eKWzmsu4YtfK8c7RRl3CmpjrG8rn3EJRRkkDj3bRrWvLayIU
 thyDNzKuUf44mTasu9/kL4siTWKMKn9spvGSQ/Xr+GylsWr1321cTOUTpHfIfmOmI1Kk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zzVBYe1nVhSYnRyfMU4C5iudcF8edWINrDPqE70Sdn4=; b=Z
 cz0PyCz+vP6es5htG1W+hbWhNprnIlZPYzQrCGJuAf6+J1Nfd21ZyrbG38V/GXtuufFHWOEs5tKhw
 lasVFnxZwfKW57XHBl1Us+Ifd+kYNyzeHlOgRd6EN9OH3LXS6YnuSMC75lbsLwcsG2hp8vzxOWiUG
 YMUwOwrsmYsVURVA=;
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1je4v7-000pbD-2D
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 May 2020 22:53:10 +0000
Received: by mail-pf1-f195.google.com with SMTP id z64so8004354pfb.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 May 2020 15:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zzVBYe1nVhSYnRyfMU4C5iudcF8edWINrDPqE70Sdn4=;
 b=ggARuZkkOP25TwSd4qLLZg+mKYjXE9AqhIbePK42obYX1Q9UFvk30Ax8Cl3C9cy7z3
 Rroj812NLnFVgF3g/s+dGE4Qiy70BAAGF344Q7Q30jGVJxJa7c8l7JFzvF2HpAItyQvW
 RCPiM3lCtWL5wT5gC0up0OH7T0o7jbNmUY6MaUWTiAkNM2EjkMdkfJVV4ee1u+5t+PiS
 MLm17aFuQcnykacvE3Fa9vpk5/na9Z6BnjtLePWG6CUa9HYbwkUdfiCfPC3v6Ka3ElZY
 JXZ220xW4XtoniCRhEuvd+lp/x59dVbZRq0ShVVuokCBkFeYxNGX2xjJBot+R/5/nd1v
 Ivhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zzVBYe1nVhSYnRyfMU4C5iudcF8edWINrDPqE70Sdn4=;
 b=sOBJ4jQm1DFdvVlLQOdA0Um+HrhugQpFIhsIUNByPQLY97wdYo+8OIjXvz0hPB3ip7
 UGEDpaCp28baq8EaxZzTTjr68Wb08/KIyOxIHbL/tNioQHUE4ndJwq3dV0Xv0wHVMWOK
 zY4OzjFJj+9XduxDus5ag2DUt7A3WZtdr8Mv71wugw0lqVnCIx0T2PDJCA4L0RgW8LNR
 SBV0IzePIe7lWw5X95g6gMivaCRRoarBemXh6OpUJONGDMRZMUbZfZbsv7iwiNBQZhTk
 8jCB7cPRFrIQVHdFDZHCD2CLkU3JGHKHW3US1rrwAj2iiHbdJMjqTyf4MmfJgDkjxril
 2HkQ==
X-Gm-Message-State: AOAM5316LxoEQRqFYule0jh8pShHma+IAJ48Tv6vNhjpoprE/jcCuSvi
 k5dfRBfdzIRA4s+ihcC2IKZ6+XxK2no=
X-Google-Smtp-Source: ABdhPJylY3MfAe5LHfiG9PfbMdrIbRF4ztpVW2IV47Ob6pPNCe8a/hlS8IaI2kz0BN2t8ZEn24Zm4A==
X-Received: by 2002:a62:f242:: with SMTP id y2mr16594pfl.111.1590619983000;
 Wed, 27 May 2020 15:53:03 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:b8f4:bbde:37ba:20bd])
 by smtp.gmail.com with ESMTPSA id o11sm2892088pfd.195.2020.05.27.15.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 15:53:02 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 28 May 2020 07:52:56 +0900
Message-Id: <20200527225256.72150-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.27.0.rc0.183.gde8f92d652-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.195 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.195 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1je4v7-000pbD-2D
Subject: [f2fs-dev] [PATCH] f2fs_io: add randread
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

I've added a new command to evaluate random read.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 tools/f2fs_io/f2fs_io.c | 64 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index d1889ff..30544c1 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -551,6 +551,69 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
+#define randread_desc "random read data from file"
+#define randread_help					\
+"f2fs_io randread [chunk_size in 4kb] [count] [IO] [file_path]\n\n"	\
+"Do random read data in file_path\n"		\
+"IO can be\n"						\
+"  buffered : buffered IO\n"				\
+"  dio      : direct IO\n"				\
+
+static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	u64 buf_size = 0, ret = 0, read_cnt = 0;
+	u64 idx, end_idx, aligned_size;
+	char *buf = NULL;
+	unsigned bs, count, i;
+	int flags = 0;
+	int fd;
+	time_t t;
+	struct stat stbuf;
+
+	if (argc != 5) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	bs = atoi(argv[1]);
+	if (bs > 1024)
+		die("Too big chunk size - limit: 4MB");
+	buf_size = bs * 4096;
+
+	buf = aligned_xalloc(4096, buf_size);
+
+	count = atoi(argv[2]);
+	if (!strcmp(argv[3], "dio"))
+		flags |= O_DIRECT;
+	else if (strcmp(argv[3], "buffered"))
+		die("Wrong IO type");
+
+	fd = xopen(argv[4], O_RDONLY | flags, 0);
+
+	if (fstat(fd, &stbuf) != 0)
+		die_errno("fstat of source file failed");
+
+	aligned_size = (u64)stbuf.st_size & ~((u64)(4096 - 1));
+	if (aligned_size < buf_size)
+		die("File is too small to random read");
+	end_idx = (u64)(aligned_size - buf_size) / (u64)4096 + 1;
+
+	srand((unsigned) time(&t));
+
+	for (i = 0; i < count; i++) {
+		idx = rand() % end_idx;
+
+		ret = pread(fd, buf, buf_size, 4096 * idx);
+		if (ret != buf_size)
+			break;
+
+		read_cnt += ret;
+	}
+	printf("Read %"PRIu64" bytes\n", read_cnt);
+	exit(0);
+}
+
 struct file_ext {
 	__u32 f_pos;
 	__u32 start_blk;
@@ -841,6 +904,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(fallocate),
 	CMD(write),
 	CMD(read),
+	CMD(randread),
 	CMD(fiemap),
 	CMD(gc_urgent),
 	CMD(defrag_file),
-- 
2.27.0.rc0.183.gde8f92d652-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
