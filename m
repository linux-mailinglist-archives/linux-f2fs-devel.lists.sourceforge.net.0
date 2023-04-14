Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 716F96E1AEB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Apr 2023 05:52:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pnATy-0004x8-88;
	Fri, 14 Apr 2023 03:52:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pnATv-0004x2-RD
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Apr 2023 03:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zySx4DtnSCf42FOeCTZyaoB+LyDJx8w/E22nufSqM+E=; b=NBxycf8Kfshv5fq7bJk4mvPcV3
 mB2QoSkkTg9FKZ0ivDUzWlczPUJGvzW5gj1G+i32OQXRDnSO0Y4lDB5ZPXFlXYUAUTbBymnFkYqkx
 3LNoRSVF5Y9Yt9mCpjuu95ElCIKbqIvSKvQvplSuS/dwmDXM0sYpt2a+xf1sgEdEg4m4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zySx4DtnSCf42FOeCTZyaoB+LyDJx8w/E22nufSqM+E=; b=T
 /L6OZCm5sBnPSFMMQEpvWGP//kUvTC6sZFfOW3EgvBTgmO+CKa0nLtiHT7Aac/4Qg3A6u1QgzDX4y
 SEqD6YdVGQ57EdwcMPEpSQ1avrmC9EhRLhnoY73jyB5bPKjTxvOf1dpPc2qz0H6ImW+BIjSdZ+7zQ
 lHyJsCDczBpCyEOc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pnATt-0007br-E3 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Apr 2023 03:52:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DEA566439D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 14 Apr 2023 03:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2029DC433EF;
 Fri, 14 Apr 2023 03:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681444327;
 bh=2OZjLyuZbTpmrO6wdlIl6V5Qr+G/51dg2DCyfu4DFGM=;
 h=From:To:Cc:Subject:Date:From;
 b=ZyAzHh9mKJchl1ViZGwr6pV02WzwKDchFirhFW2PfWVMq/aGRry3Ku3qOXmYaz1+O
 IT5Uyx80e2QwRtcuW9X28FHfqccAVprkiMNyJwiKrfCOdGd+d/mrSsxkp7L6Wt2z0G
 ykdIZkmemDcJwBJ4rGKA4gGkjzl/lXItFOl/cPaRakFRaZ3uwamVJJhrkFNdifxdoz
 1GaSu77sLe7MVsSJyhX/JaYVSLw62A/lud9pFVDZKEWRl1w47pN4hEwQkmIiHn/SD7
 73G3mb51ozMVvf0Ms869a8CKT2zQdM2uqsxBwoyQtZnUZqZpOL1Z8Ru3HmrBmyONme
 3r9GxXS0mc3qQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 14 Apr 2023 11:51:46 +0800
Message-Id: <20230414035146.1381029-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch supports a new sub-command 'checkpoint' in f2fs_io
 to trigger filesystem checkpoint via F2FS_IOC_WRITE_CHECKPOINT ioctl.
 Signed-off-by:
 Chao Yu <chao@kernel.org> --- man/f2fs_io.8 | 3 +++ tools/f2fs_io/f2fs_io.c
 | 25 +++++++++++++++++++++++++ 2 files changed, 28 insertions(+) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pnATt-0007br-E3
Subject: [f2fs-dev] [PATCH] f2fs_io: support checkpoint command
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch supports a new sub-command 'checkpoint' in f2fs_io to
trigger filesystem checkpoint via F2FS_IOC_WRITE_CHECKPOINT ioctl.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 man/f2fs_io.8           |  3 +++
 tools/f2fs_io/f2fs_io.c | 25 +++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
index 33789c2..f1a48ca 100644
--- a/man/f2fs_io.8
+++ b/man/f2fs_io.8
@@ -135,6 +135,9 @@ Reserve free blocks to prepare decompressing blocks in the file.
 .TP
 \fBgc\fR \fI[sync_mode] [file]\fR
 Trigger filesystem GC
+.TP
+\fBcheckpoint\fR \fI[file]\fR
+Trigger filesystem checkpoint
 .SH AUTHOR
 This version of
 .B f2fs_io
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 6dcd840..9cfca71 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -1310,6 +1310,30 @@ static void do_gc(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
+#define checkpoint_desc "trigger filesystem checkpoint"
+#define checkpoint_help "f2fs_io checkpoint [file_path]\n\n"
+
+static void do_checkpoint(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	int ret, fd;
+
+	if (argc != 2) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	fd = xopen(argv[1], O_WRONLY, 0);
+
+	ret = ioctl(fd, F2FS_IOC_WRITE_CHECKPOINT);
+	if (ret < 0)
+		die_errno("F2FS_IOC_WRITE_CHECKPOINT failed");
+
+	printf("trigger filesystem checkpoint ret=%d\n", ret);
+	exit(0);
+}
+
+
 #define CMD_HIDDEN 	0x0001
 #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
 #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
@@ -1342,6 +1366,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(get_filename_encrypt_mode),
 	CMD(rename),
 	CMD(gc),
+	CMD(checkpoint),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
