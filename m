Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E4BCC605
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  5 Oct 2019 00:45:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iGWJn-0002fs-9O; Fri, 04 Oct 2019 22:44:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iGWJm-0002fl-5P
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Oct 2019 22:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=51Tzl3LVr8XXpnzGytHXHTPRR38KzM6RR2GFUfanxzU=; b=iqDuuFoXZW4s/Ii67JhxswVzWr
 27E8XtDENhvlSxoTJ4YZLsmpKaPqc7bC01m6D/+yNSmS1ct5rT0HS8UR6w6IdXAFnnt4tVEphPYEY
 hGZ46hz9h1mgw/oacSL93aExyq8FJbNTEp8alLSzayUMFE1v23BnEUZ5YD8FbiDmSosE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=51Tzl3LVr8XXpnzGytHXHTPRR38KzM6RR2GFUfanxzU=; b=JJp8yYYt/tmZwPUZqfRdrmMyhe
 Z7WA+5CoN0WgGSE3m72IjR6NmPym2a+POChW1ZAnGPj8WRz2WCPnUSSmJhpKWX5OB+GAnwR+Cbn96
 RL+iLeRprc+Qo9mWQ4iMxg08sjY0dIHVV8MKRYON6O8+S98K7iO/L0qkyLbm2DuJw6BU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iGWJg-00H9LF-HM
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Oct 2019 22:44:58 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 823E421D81;
 Fri,  4 Oct 2019 22:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570229082;
 bh=IPMEjHtlBoJLevI7KSKLUglzpPHwgnbur5n3S/BVzZM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JuY2PtxgHl4EjeArFP6J69zlw/A43htJiaCj6BeBbW4ktz9XCh4VQtNTdJwSwdl81
 XJDlsNvG9NN/2jJfUFpqO4O0KG3yDrG2X47Xn1eOkvkJJDzBQwQltb70jQ5anRzP+N
 F2QfRvKVVm+HgWEyusExSv47zlg8kT+6RwnIsHzQ=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri,  4 Oct 2019 15:43:17 -0700
Message-Id: <20191004224317.153566-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
In-Reply-To: <20191004224317.153566-1-ebiggers@kernel.org>
References: <20191004224317.153566-1-ebiggers@kernel.org>
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
X-Headers-End: 1iGWJg-00H9LF-HM
Subject: [f2fs-dev] [PATCH 2/2] f2fs_io: add copy command
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Add a copy command to f2fs_io, to allow testing direct I/O writes where
the source page is from a different file (mmap) or an internal kernel
page (sendfile).  It could be useful for other tests in the future too.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 tools/f2fs_io/f2fs_io.c | 108 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index f5493ff..0d90835 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -21,7 +21,9 @@
 
 #include <errno.h>
 #include <fcntl.h>
+#include <getopt.h>
 #include <inttypes.h>
+#include <limits.h>
 #include <signal.h>
 #include <stdarg.h>
 #include <stdbool.h>
@@ -29,6 +31,8 @@
 #include <stdlib.h>
 #include <string.h>
 #include <string.h>
+#include <sys/mman.h>
+#include <sys/sendfile.h>
 #include <sys/stat.h>
 #include <sys/types.h>
 #include <termios.h>
@@ -105,6 +109,27 @@ static int xopen(const char *pathname, int flags, mode_t mode)
 	return fd;
 }
 
+static ssize_t xread(int fd, void *buf, size_t count)
+{
+	ssize_t ret = read(fd, buf, count);
+
+	if (ret < 0)
+		die_errno("read failed");
+	return ret;
+}
+
+static void full_write(int fd, const void *buf, size_t count)
+{
+	while (count) {
+		ssize_t ret = write(fd, buf, count);
+
+		if (ret < 0)
+			die_errno("write failed");
+		buf = (char *)buf + ret;
+		count -= ret;
+	}
+}
+
 #define getflags_desc "getflags ioctl"
 #define getflags_help						\
 "f2fs_io getflags [file]\n\n"					\
@@ -563,6 +588,88 @@ static void do_defrag_file(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
+#define copy_desc "copy a file"
+#define copy_help							\
+"f2fs_io copy [-d] [-m] [-s] src_path dst_path\n\n"			\
+"  src_path  : path to source file\n"					\
+"  dst_path  : path to destination file\n"				\
+"  -d        : use direct I/O\n"					\
+"  -m        : mmap the source file\n"					\
+"  -s        : use sendfile\n"						\
+
+static void do_copy(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	int c;
+	int src_fd;
+	int dst_fd;
+	int open_flags = 0;
+	bool mmap_source_file = false;
+	bool use_sendfile = false;
+	ssize_t ret;
+
+	while ((c = getopt(argc, argv, "dms")) != -1) {
+		switch (c) {
+		case 'd':
+			open_flags |= O_DIRECT;
+			break;
+		case 'm':
+			mmap_source_file = true;
+			break;
+		case 's':
+			use_sendfile = true;
+			break;
+		default:
+			fputs(cmd->cmd_help, stderr);
+			exit(2);
+		}
+	}
+	argc -= optind;
+	argv += optind;
+	if (argc != 2) {
+		fputs("Wrong number of arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(2);
+	}
+	if (mmap_source_file && use_sendfile)
+		die("-m and -s are mutually exclusive");
+
+	src_fd = xopen(argv[0], O_RDONLY | open_flags, 0);
+	dst_fd = xopen(argv[1], O_WRONLY | O_CREAT | O_TRUNC | open_flags, 0644);
+
+	if (mmap_source_file) {
+		struct stat stbuf;
+		void *src_addr;
+
+		if (fstat(src_fd, &stbuf) != 0)
+			die_errno("fstat of source file failed");
+
+		if ((size_t)stbuf.st_size != stbuf.st_size)
+			die("Source file is too large");
+
+		src_addr = mmap(NULL, stbuf.st_size, PROT_READ, MAP_SHARED,
+				src_fd, 0);
+		if (src_addr == MAP_FAILED)
+			die("mmap of source file failed");
+
+		full_write(dst_fd, src_addr, stbuf.st_size);
+
+		munmap(src_addr, stbuf.st_size);
+	} else if (use_sendfile) {
+		while ((ret = sendfile(dst_fd, src_fd, NULL, INT_MAX)) > 0)
+			;
+		if (ret < 0)
+			die_errno("sendfile failed");
+	} else {
+		char *buf = aligned_xalloc(4096, 4096);
+
+		while ((ret = xread(src_fd, buf, 4096)) > 0)
+			full_write(dst_fd, buf, ret);
+		free(buf);
+	}
+	close(src_fd);
+	close(dst_fd);
+}
+
 
 #define CMD_HIDDEN 	0x0001
 #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
@@ -581,6 +688,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(fiemap),
 	CMD(gc_urgent),
 	CMD(defrag_file),
+	CMD(copy),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
-- 
2.23.0.581.g78d2f28ef7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
