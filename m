Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F611C21F4
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  2 May 2020 02:29:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jUg2C-0006Rt-Bn; Sat, 02 May 2020 00:29:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jUg2A-0006Rg-J4
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 02 May 2020 00:29:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZqvFTE/VDPedXYGpjUxDK+lt8WwFX5TjbKO9MCB1/ic=; b=QzXT/C9fFdeJHIqF8d6OvO0tfw
 qoLN7V6QyJd7rPpW496OY/ZcTT6/7Vm8g14tidqVnUOwwFYGhG8KTQoHEcb2mL0l1tlHyq2N+bDio
 foP6IafRGaIu86BlGNXnqBb0GDq5puPMaKroY0d5KuZlJbobMo+33/b922evuYMQaCgg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZqvFTE/VDPedXYGpjUxDK+lt8WwFX5TjbKO9MCB1/ic=; b=i
 vikTslkYbLLWMlF8tyl5nHHWpksqkhamy+kie1obz+nOKiZLuHs0khncDoRhXY9G7DCNDO0X65YMc
 b4bx8K8mET7Z6r+kuW3TVQ3Qj+Kmk0aUhx3dvtKfuZDU/MEELFFcirOr89gydKqHaEaeGWJWaMkGS
 sltVgG1EBmlevL90=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jUg28-001Mi6-Lf
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 02 May 2020 00:29:34 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 51EED208C3;
 Sat,  2 May 2020 00:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588379361;
 bh=op8KTw6dVH3HYKvOhSfU5jV+d/47qo+/s2bCO/zN6hQ=;
 h=From:To:Cc:Subject:Date:From;
 b=CpGv4rA1v+ERm3A8fDm19LH5Ly0clnJTdl8uksjKJ+ThzlplSb3OYe+tcSidfIlu6
 WrMsSI0kjIgol80GWKPp8y6sZ6bi7OLuqcGr00sIAEfTqfLKGtmYGQna01FlYvBCmt
 hbO1dvt9K4dFCyTpXuIfvngdhq8GI0DIJol079ko=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri,  1 May 2020 17:29:18 -0700
Message-Id: <20200502002920.76569-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
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
X-Headers-End: 1jUg28-001Mi6-Lf
Subject: [f2fs-dev] [PATCH 1/3] f2fs_io: add fsync
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

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index c1edef1..c84b6ab 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -130,6 +130,30 @@ static void full_write(int fd, const void *buf, size_t count)
 	}
 }
 
+#define fsync_desc "fsync"
+#define fsync_help						\
+"f2fs_io fsync [file]\n\n"					\
+"fsync given the file\n"					\
+
+static void do_fsync(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	int fd;
+
+	if (argc != 2) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	fd = xopen(argv[1], O_WRONLY, 0);
+
+	if (fsync(fd) != 0)
+		die_errno("fsync failed");
+
+	printf("fsync a file\n");
+	exit(0);
+}
+
 #define set_verity_desc "Set fs-verity"
 #define set_verity_help					\
 "f2fs_io set_verity [file]\n\n"				\
@@ -780,6 +804,7 @@ static void do_reserve_cblocks(int argc, char **argv, const struct cmd_desc *cmd
 static void do_help(int argc, char **argv, const struct cmd_desc *cmd);
 const struct cmd_desc cmd_list[] = {
 	_CMD(help),
+	CMD(fsync),
 	CMD(set_verity),
 	CMD(getflags),
 	CMD(setflags),
-- 
2.26.2.526.g744177e7f7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
