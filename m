Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F322273DE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Jul 2020 02:38:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxgJ3-0001x2-0v; Tue, 21 Jul 2020 00:38:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jxgIz-0001wq-PE
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 00:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DNgIftFNoZdIR8JDpgMZkHpUs9DY2vj6HR4gUFOpztc=; b=PGkLTBhgMZTCEchS49rEYTL1zJ
 beqCysIp2dDvcGZprcr4myF02gErVszurXLtWcY6boVfO56R5qv9CKHzGScp6uLZOw+dtNQb9Ncrl
 G2nvyMfDLnlLHiXxt3xnTojlSFyWjibpT9eJCFrsdX2vlkGYNTomqPKt+B2Rrv48EQCs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DNgIftFNoZdIR8JDpgMZkHpUs9DY2vj6HR4gUFOpztc=; b=N
 mojt6c3VGTVvKTXFjbQUvuiPf8Y5Xyl1cyNEd9dd3T6vDDPA8Xz/W1rzmIZl04+ZMQ36DfSgNzWPO
 quFZTdH2OZfiBgqQmyT9dGaq3/wZZPHJizXMMcOt+Pncuyy9mO4by2T4XUzNWTWvPAbCLHnR48G+g
 JZfnQfFVspblxPUE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jxgIx-00ERME-M0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 00:38:49 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 83EA3208E4;
 Tue, 21 Jul 2020 00:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595291916;
 bh=lg8SYlBLo99XrJ8hqhGxr4cCIq+bw6mxuOXkqLJbJRQ=;
 h=From:To:Cc:Subject:Date:From;
 b=cVZijLJDh+pvjZVdXHn5sU1nicrUZ0/EWopnOP5SGMaMtAtvrwrFYydHZHYDmW/Zk
 W+kc9SwJ111GKHRURSxk3xxZONEYYL93KEwlLd9yvWD4+FyHEd24KCsqqQNhGEaksV
 ohvxIqFY00KPftG9iXn2Z/WeZ36tF+12APajzwWw=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 20 Jul 2020 17:38:32 -0700
Message-Id: <20200721003834.2754992-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
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
X-Headers-End: 1jxgIx-00ERME-M0
Subject: [f2fs-dev] [PATCH 1/3] f2fs_io: add mmap read operation
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

This patch adds an option, mmap, when reading data.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 30544c1..6266454 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -489,15 +489,18 @@ static void do_write(int argc, char **argv, const struct cmd_desc *cmd)
 "IO can be\n"						\
 "  buffered : buffered IO\n"				\
 "  dio      : direct IO\n"				\
+"  mmap     : mmap IO\n"				\
 
 static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 {
 	u64 buf_size = 0, ret = 0, read_cnt = 0;
 	u64 offset;
 	char *buf = NULL;
+	char *data;
 	char *print_buf = NULL;
 	unsigned bs, count, i, print_bytes;
 	int flags = 0;
+	int do_mmap = 0;
 	int fd;
 
 	if (argc != 7) {
@@ -518,6 +521,8 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 	count = atoi(argv[3]);
 	if (!strcmp(argv[4], "dio"))
 		flags |= O_DIRECT;
+	else if (!strcmp(argv[4], "mmap"))
+		do_mmap = 1;
 	else if (strcmp(argv[4], "buffered"))
 		die("Wrong IO type");
 
@@ -529,8 +534,20 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 
 	fd = xopen(argv[6], O_RDONLY | flags, 0);
 
+	if (do_mmap) {
+		data = mmap(NULL, count * buf_size, PROT_READ,
+						MAP_SHARED, fd, offset);
+		if (data == MAP_FAILED)
+			die("Mmap failed");
+	}
+
 	for (i = 0; i < count; i++) {
-		ret = pread(fd, buf, buf_size, offset + buf_size * i);
+		if (do_mmap) {
+			memcpy(buf, data + offset + buf_size * i, buf_size);
+			ret = buf_size;
+		} else {
+			ret = pread(fd, buf, buf_size, offset + buf_size * i);
+		}
 		if (ret != buf_size)
 			break;
 
-- 
2.28.0.rc0.105.gf9edc3c819-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
