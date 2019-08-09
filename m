Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D1787DEE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Aug 2019 17:23:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hw6k2-0008Nw-N6; Fri, 09 Aug 2019 15:23:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hw6k1-0008Np-F8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 15:23:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rtcpxnyC948cMow/1vt5QPRyLTknRIIDSeqsAbh2Tig=; b=dGNuuM6Vm8fo9yJDVBh0wIJ/en
 cSYlEzihMDItOKsezTxgmsPS1HzUjWE4bmmKW8KA8SH3OjyUkBCk20S2Y3hSrwqHTjXuZrGIWcXHm
 hWevL66OrgUXmlu/rMeDF0ybW20f5KjnF4MPZCERpeCdAP+jO344q3IQwtwSuq18KITw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rtcpxnyC948cMow/1vt5QPRyLTknRIIDSeqsAbh2Tig=; b=B
 HSAYCBCN6snLKKSCj4yqPyBfMH26aokg+coSTk77zMKNI7gkUMEA4K/tnp1YgagPnwXOsClaGdGUW
 3RHAGub6auydehbJG2Met8eXO2DK1oO72CaM/Uk+E+uZgA44Rzo7YBU4fWGgY5GwvuCuD7Lj1IH0a
 wculgRpBYIjNk9HY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hw6k0-00G464-81
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 15:23:41 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DAAB120B7C;
 Fri,  9 Aug 2019 15:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565364212;
 bh=/GBiGEWPxo9iFcza9RZEsQzg9Ktt1E/Z85xHUT48ngI=;
 h=From:To:Cc:Subject:Date:From;
 b=XsnMbw1/a1o3P92Mkz8DVSJ6pz6J9qQuvLLGe2UjGx/TMMTlU5LyttT0C8o6ZixLS
 GwxUdnOe0FRKRDfE29QNcJH3dm/LSKDC0Uj541fn3Cq7qAGKfFIvjbdG9DKVp7hS6z
 a8CTfzuBZaj9c1Va7aGP8x3N7ggRFClXR8mzPhM0=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri,  9 Aug 2019 08:23:28 -0700
Message-Id: <20190809152328.94814-1-jaegeuk@kernel.org>
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
X-Headers-End: 1hw6k0-00G464-81
Subject: [f2fs-dev] [PATCH] f2fs_io: add get/setflags
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
Cc: Jaegeuk Kim <jaegeuk@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jaegeuk Kim <jaegeuk@google.com>

Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>
---
 tools/f2fs_io/f2fs_io.c | 91 +++++++++++++++++++++++++++++++++++++++++
 tools/f2fs_io/f2fs_io.h | 14 +++++++
 2 files changed, 105 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 6b43778..b57c458 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -45,6 +45,95 @@ struct cmd_desc {
 	int cmd_flags;
 };
 
+#define getflags_desc "getflags ioctl"
+#define getflags_help						\
+"f2fs_io getflags [file]\n\n"					\
+"get a flag given the file\n"					\
+"flag can show \n"						\
+"  casefold\n"							\
+"  compression\n"						\
+"  nocompression\n"
+
+static void do_getflags(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	long flag;
+	int ret, fd;
+	int exist = 0;
+
+	if (argc != 2) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	fd = open(argv[1], O_RDONLY);
+	if (fd == -1) {
+		fputs("Open failed\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+	ret = ioctl(fd, F2FS_IOC_GETFLAGS, &flag);
+	printf("get a flag on %s ret=%d, flags=", argv[1], ret);
+	if (flag & FS_CASEFOLD_FL) {
+		printf("casefold");
+		exist = 1;
+	}
+	if (flag & FS_COMPR_FL) {
+		if (exist)
+			printf(",");
+		printf("compression");
+		exist = 1;
+	}
+	if (flag & FS_NOCOMP_FL) {
+		if (exist)
+			printf(",");
+		printf("nocompression");
+		exist = 1;
+	}
+	if (!exist)
+		printf("none");
+	printf("\n");
+	exit(0);
+}
+
+#define setflags_desc "setflags ioctl"
+#define setflags_help						\
+"f2fs_io setflags [flag] [file]\n\n"				\
+"set a flag given the file\n"					\
+"flag can be\n"							\
+"  casefold\n"							\
+"  compression\n"						\
+"  nocompression\n"
+
+static void do_setflags(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	long flag;
+	int ret, fd;
+
+	if (argc != 3) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	fd = open(argv[2], O_RDONLY);
+	if (fd == -1) {
+		fputs("Open failed\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+	if (!strcmp(argv[1], "casefold"))
+		flag = FS_CASEFOLD_FL;
+	else if (!strcmp(argv[1], "compression"))
+		flag = FS_COMPR_FL;
+	else if (!strcmp(argv[1], "nocompression"))
+		flag = FS_NOCOMP_FL;
+
+	ret = ioctl(fd, F2FS_IOC_SETFLAGS, &flag);
+	printf("set a flag: %s ret=%d\n", argv[2], ret);
+	exit(0);
+}
+
 #define shutdown_desc "shutdown filesystem"
 #define shutdown_help					\
 "f2fs_io shutdown [level] [dir]\n\n"			\
@@ -488,6 +577,8 @@ static void do_defrag_file(int argc, char **argv, const struct cmd_desc *cmd)
 static void do_help(int argc, char **argv, const struct cmd_desc *cmd);
 const struct cmd_desc cmd_list[] = {
 	_CMD(help),
+	CMD(getflags),
+	CMD(setflags),
 	CMD(shutdown),
 	CMD(pinfile),
 	CMD(fallocate),
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index 95fd5be..5768c1b 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -41,9 +41,13 @@ typedef u32	__be32;
 #ifndef FS_IOC_GETFLAGS
 #define FS_IOC_GETFLAGS			_IOR('f', 1, long)
 #endif
+#ifndef FS_IOC_SETFLAGS
+#define FS_IOC_SETFLAGS			_IOW('f', 2, long)
+#endif
 
 #define F2FS_IOCTL_MAGIC		0xf5
 #define F2FS_IOC_GETFLAGS		FS_IOC_GETFLAGS
+#define F2FS_IOC_SETFLAGS		FS_IOC_SETFLAGS
 
 #define F2FS_IOC_START_ATOMIC_WRITE	_IO(F2FS_IOCTL_MAGIC, 1)
 #define F2FS_IOC_COMMIT_ATOMIC_WRITE	_IO(F2FS_IOCTL_MAGIC, 2)
@@ -98,6 +102,16 @@ typedef u32	__be32;
 #define F2FS_IOC_FSGETXATTR		FS_IOC_FSGETXATTR
 #define F2FS_IOC_FSSETXATTR		FS_IOC_FSSETXATTR
 
+#ifndef FS_NOCOMP_FL
+#define FS_NOCOMP_FL			0x00000400 /* Don't compress */
+#endif
+#ifndef FS_COMPR_FL
+#define FS_COMPR_FL			0x00000004 /* Compress file */
+#endif
+#ifndef FS_CASEFOLD_FL
+#define FS_CASEFOLD_FL			0x40000000 /* Folder is case insensitive */
+#endif
+
 struct f2fs_gc_range {
 	u32 sync;
 	u64 start;
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
