Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC877199C2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jun 2023 12:31:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4faK-0003TF-33;
	Thu, 01 Jun 2023 10:31:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q4faJ-0003T9-8p
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 10:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6tZoW86LnslWJIFXxhLKaIqFwtfJR0kUPtrxU6el33c=; b=GBl+TSc/FnS6dGY7VASVIwvCpq
 WvT+OYbB3QN9GVHOPFPviSI1CE+3n+b6qGA4ZydvRBbkpmxGtXibUk82H3pEVGjrX+GRP2emB6shI
 8Ot3p5iMqyKdEZVkB9BT1zGGlZGFtNn5qaU/BwZS0OdbsrV1VzPO7mq3lb0OQUzGpcU4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6tZoW86LnslWJIFXxhLKaIqFwtfJR0kUPtrxU6el33c=; b=I
 YUKnxZ4Q6BOF9nnxYLSnLPw9TQRKC7knPPfGMDhF9Nv8Ar5IPhkAvYGFBrwcWYUtGrikEuNUB7xZU
 f4y+6ggjbX+nOt/9M1yAVwX0laKsCGM5dxJ6XfB7m0uNhzjT1VyvEmOwJLnmjVuN/psbUfXzEkM4e
 CKvGsNrfOa9ROFPg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4faE-008Esa-Vo for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 10:31:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 969756434C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  1 Jun 2023 10:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D263C433D2;
 Thu,  1 Jun 2023 10:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685615461;
 bh=/UUetYgv2gACpBnJ/guVq2cNeMZaEvkHuj6i/aXY5iQ=;
 h=From:To:Cc:Subject:Date:From;
 b=WlZRQ4DnBQQITF6iTlX76sfLOyiF6+oFSdyLiB9IzSNDtMyJ5Qd3hBTaQYoHUW8Dh
 NRqmeXuEdpedS1Wntq916GnAjVXX/YCEhGqxR5yW2o8s1ObTaHkdZH5wl73OObaC3b
 BEVZoXLVYh0gPkx7yeCibRHAPDiUotynY63j20iKitNcNEG3aDhV8FqLjiZrqmUv8w
 C+fqGoAnbrfO9iRF8A0Bv6+oLQuNIr5Wlvo9baJVoR7gxaKwig6RxAyJNzqe0rGRVF
 eKtFjTl2EyaBSYEoZXg+27iVOkHZ08e/NIMhtVh7f87Wgoziuu/btDPMZvBcdsEZ+z
 ca1llqDbFbrPA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu,  1 Jun 2023 18:30:54 +0800
Message-Id: <20230601103054.1761833-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch supports a new sub-command 'gc_range' in f2fs_io
 to trigger gc to move blocks in specified range via
 F2FS_IOC_GARBAGE_COLLECT_RANGE
 ioctl. Signed-off-by: Chao Yu <chao@kernel.org> --- man/f2fs_io.8 | 3 +++
 tools/f2fs_io/f2fs_io.c | 35 +++++++++++++++++++++++++++++++++++ 2 files
 changed, 38 insertions(+) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q4faE-008Esa-Vo
Subject: [f2fs-dev] [PATCH] f2fs_io: support gc_range command
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

This patch supports a new sub-command 'gc_range' in f2fs_io to trigger
gc to move blocks in specified range via F2FS_IOC_GARBAGE_COLLECT_RANGE
ioctl.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 man/f2fs_io.8           |  3 +++
 tools/f2fs_io/f2fs_io.c | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
index b25f807..c5eadde 100644
--- a/man/f2fs_io.8
+++ b/man/f2fs_io.8
@@ -144,6 +144,9 @@ Trigger precache extents
 .TP
 \fBmove_range\fR \fI[src_path] [dst_path] [src_start] [dst_start] [length]\fR
 Move a range of data blocks from source file to destination file
+.TP
+\fBgc_range\fR \fI[sync_mode] [start in 4kb] [length in 4kb] [file]\fR
+Trigger gc to move data blocks from specified address range
 .SH AUTHOR
 This version of
 .B f2fs_io
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index ea9143b..b8102b5 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -1419,6 +1419,40 @@ static void do_move_range(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
+#define gc_range_desc "trigger filesystem gc_range"
+#define gc_range_help "f2fs_io gc_range [sync_mode] [start] [length] [file_path]\n\n"\
+"  sync_mode : 0: asynchronous, 1: synchronous\n"			\
+"  start     : start offset of defragment region, unit: 4kb\n"	\
+"  length    : bytes number of defragment region, unit: 4kb\n"	\
+
+static void do_gc_range(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	struct f2fs_gc_range range;
+	int ret, fd;
+
+	if (argc != 5) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	range.sync = atoi(argv[1]);
+	range.start = (u64)atoi(argv[2]);
+	range.len = (u64)atoi(argv[3]);
+
+	fd = xopen(argv[4], O_RDWR, 0);
+
+	ret = ioctl(fd, F2FS_IOC_GARBAGE_COLLECT_RANGE, &range);
+	if (ret < 0) {
+		die_errno("F2FS_IOC_GARBAGE_COLLECT_RANGE failed");
+	}
+
+	printf("trigger %s gc_range [%lu, %lu] ret=%d\n",
+		range.sync ? "synchronous" : "asynchronous",
+		range.start, range.len, ret);
+	exit(0);
+}
+
 #define CMD_HIDDEN 	0x0001
 #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
 #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
@@ -1454,6 +1488,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(checkpoint),
 	CMD(precache_extents),
 	CMD(move_range),
+	CMD(gc_range),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
