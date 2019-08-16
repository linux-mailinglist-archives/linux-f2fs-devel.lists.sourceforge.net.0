Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEAD8F925
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Aug 2019 04:42:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hySBx-0002mw-Vk; Fri, 16 Aug 2019 02:42:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hySBw-0002mp-O5
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 02:42:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4muY78hGToEgf7MoTQ1Hpxex4SK2EV4Y+3EgcE5kHdU=; b=Kp2U9lNy7sGBQcEfu6agsz1kY0
 eZsQW+WZT7F24t2ndiMUlin2eGITyzAvbdFR3MVv8FOjoSoZlOfPFPxWKm/GyUcxl934+wtFEvXKN
 qA6AT/HyrJhjNXt8EcK7ombw1beHiWQSZHrDurV8omctl7gGDAFSMQNTT8GlV49k+Vkw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4muY78hGToEgf7MoTQ1Hpxex4SK2EV4Y+3EgcE5kHdU=; b=URqmaFYDhNpNF5n4Av12eh5PgT
 CMkr8vucq+WtvbfslSlLLae8sYxdUTewdNOHdvHo3SyY7VNKsITi856RvLaoA34rvovQLAHkRI9dM
 kA0Sj0p8UgBl4TNQfrKTzVXY+6YfSYWX6VHG5BrzbLiRkm5sg9I/Odo3iH/Hy9usr8iE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hySBp-0050Ul-WD
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 02:42:12 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB7DD206C2;
 Fri, 16 Aug 2019 02:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565923318;
 bh=mlVTHD0srxBjEUHB+C5QX0v3kBC0rnLOk9ncjbYDh8Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ezk9IfhRMpOlYhNYttulHetl0lv2aIfiaueqOdE4yt/tae1njr2d12wqYu8Rh75le
 3DoifcCVYlDVcinO+QupclXkTMwTvyko0yDc/PD8q6seUgRQzBVhhme7wevjbGOi9N
 VYU6sMG2lKHh0efKo61C9pGDbjsxGXBWTD+oXedA=
Date: Thu, 15 Aug 2019 19:41:58 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20190816024157.GC73510@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190809152328.94814-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809152328.94814-1-jaegeuk@kernel.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hySBp-0050Ul-WD
Subject: Re: [f2fs-dev] [PATCH v2] f2fs_io: add get/setflags
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

Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>
---
- Add + flags for now

 tools/f2fs_io/f2fs_io.c | 98 +++++++++++++++++++++++++++++++++++++++++
 tools/f2fs_io/f2fs_io.h | 14 ++++++
 2 files changed, 112 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index a5a9836..add40c4 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -45,6 +45,102 @@ struct cmd_desc {
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
+
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
+
+	ret = ioctl(fd, F2FS_IOC_GETFLAGS, &flag);
+	printf("get a flag on %s ret=%d, flags=%lx\n", argv[1], ret, flag);
+	if (ret)
+		exit(1);
+
+	if (!strcmp(argv[1], "casefold"))
+		flag |= FS_CASEFOLD_FL;
+	else if (!strcmp(argv[1], "compression"))
+		flag |= FS_COMPR_FL;
+	else if (!strcmp(argv[1], "nocompression"))
+		flag |= FS_NOCOMP_FL;
+
+	ret = ioctl(fd, F2FS_IOC_SETFLAGS, &flag);
+	printf("set a flag on %s ret=%d, flags=%s\n", argv[2], ret, argv[1]);
+	exit(0);
+}
+
 #define shutdown_desc "shutdown filesystem"
 #define shutdown_help					\
 "f2fs_io shutdown [level] [dir]\n\n"			\
@@ -488,6 +584,8 @@ static void do_defrag_file(int argc, char **argv, const struct cmd_desc *cmd)
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
