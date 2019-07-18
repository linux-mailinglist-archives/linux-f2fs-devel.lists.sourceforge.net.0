Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC356C7C6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jul 2019 05:29:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hnx72-0006Zm-IN; Thu, 18 Jul 2019 03:29:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hnx72-0006Zd-1c
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jul 2019 03:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8mepPNleepC0/vbKViMx0H59HtmijL8iTO7gFQZzq2w=; b=eNfJvUgGa2sXCgNBt8gK0EkNZv
 f0dtskMuEszIWZyS7Amjd/WueVBPwbiJLas5CT8TulkdIdka4O7yXb3xt2XpQBFX7ksHC08Hrkspa
 zUM7orC0LcZ0thU0fu/FPKli7tY+oCMlsuFxLN4aKadnuf24/dys1wLenCQWPp0WliSU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8mepPNleepC0/vbKViMx0H59HtmijL8iTO7gFQZzq2w=; b=l
 II9B2KkWhIeL7Okyg1P0fRspp/RoUrr33TusvGoxiSOqIQgEESorsfZzAQek5Stjrd34TC1rsZjq8
 byuI+33QJW4Uy68f4wpZS6/iIw9g9APmtRcpniwRzmQeZLabN0CWq65nOCnC/QTxNkOBbF1DvN/55
 uVZXoysXlAc6H1P8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hnx6x-005r5J-JA
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jul 2019 03:29:43 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3CAE721841;
 Thu, 18 Jul 2019 03:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563420572;
 bh=rnZdaWZ2L8qifzOaUf/wwwXl66ElCyIq9aZFdYraSdQ=;
 h=From:To:Cc:Subject:Date:From;
 b=kFwscFsdmcCZNrYaJFLImtxv0s/NLsN5+R82KSnExGcT4gzTr2VqVtNS2UlZiVJbK
 Wwhqbr0rI9l1Xs682yeQmOki/GwlzYmTTlyjku4WGqaBBARtkv3SrGsO6xrqNC5E5U
 Gr7sGQiZKZvKVOUaHthpu27SC+8BzRqyRI7uzxxc=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 17 Jul 2019 20:29:29 -0700
Message-Id: <20190718032929.80184-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hnx6x-005r5J-JA
Subject: [f2fs-dev] [PATCH] f2fs_io: add fallocate
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This simply supports keep_size.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 45 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 7fd4425..f087da4 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -141,6 +141,50 @@ static void do_pinfile(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
+#define fallocate_desc "fallocate"
+#define fallocate_help						\
+"f2fs_io fallocate [keep_size] [offset] [length] [file]\n\n"	\
+"fallocate given the file\n"					\
+" [keep_size] : 1 or 0\n"					\
+
+static void do_fallocate(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	int fd;
+	off_t offset, length;
+	struct stat sb;
+	int mode = 0;
+
+	if (argc != 5) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	if (!strcmp(argv[1], "1"))
+		mode |= FALLOC_FL_KEEP_SIZE;
+
+	offset = atoi(argv[2]);
+	length = atoi(argv[3]);
+
+	fd = open(argv[4], O_RDWR);
+	if (fd == -1) {
+		fputs("Open failed\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	if (fallocate(fd, mode, offset, length)) {
+		fputs("fallocate failed\n\n", stderr);
+		exit(1);
+	}
+	if (fstat(fd, &sb) == -1) {
+		fputs("Stat failed\n\n", stderr);
+		exit(1);
+	}
+	printf("fallocated a file: i_size=%"PRIu64", i_blocks=%"PRIu64"\n", sb.st_size, sb.st_blocks);
+	exit(0);
+}
+
 #define write_desc "write data into file"
 #define write_help					\
 "f2fs_io write [chunk_size in 4kb] [offset in chunk_size] [count] [pattern] [IO] [file_path]\n\n"	\
@@ -407,6 +451,7 @@ const struct cmd_desc cmd_list[] = {
 	_CMD(help),
 	CMD(shutdown),
 	CMD(pinfile),
+	CMD(fallocate),
 	CMD(write),
 	CMD(read),
 	CMD(fiemap),
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
