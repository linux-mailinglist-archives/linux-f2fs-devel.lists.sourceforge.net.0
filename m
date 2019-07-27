Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CAD77A5F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Jul 2019 17:45:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hrOsw-0002b2-EU; Sat, 27 Jul 2019 15:45:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hrOsv-0002at-5l
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 27 Jul 2019 15:45:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ve2ILVeoyvvEEq30S6mKWzkK/ADnvZzwt0knd+o+9P4=; b=kMHli43/x04WKbHCUK4fUCIREs
 QU0jNkpBsOn9Yqe0cMuq41KAY1VcmIIoa/fgAalbcmYZawy9Lfj5AetaeuGcAVT8+c90mgoGrdIfl
 xddEUvdEZCMblA/3SORPi89zOFMLL2r6GHm3kepWmdhmEObwvAHcbnLJGUdyViNt0nk4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ve2ILVeoyvvEEq30S6mKWzkK/ADnvZzwt0knd+o+9P4=; b=A
 h7L9ZHkWS2oMa7csT+bFOqv7Xarf0cJTxiZfjYqgn17Yi3bCHr1hBSbu0zroFIT0QUg7lQeISTSGp
 j6/c+PyWlt5DtvXmAtgzOnhDEOumv3duTGVNh3kI4VMImau9qqI7CZ4IoEdeVSWMJfT8OATk5Ydxm
 gu88/xpLb9pq2nLE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hrOsq-007Kdq-VR
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 27 Jul 2019 15:45:25 +0000
Received: from localhost.localdomain (unknown [180.111.32.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3745120840;
 Sat, 27 Jul 2019 15:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564242315;
 bh=xhy2yW210hlKgAGygUKox66DXlIGoQdsapEPKKUyZz4=;
 h=From:To:Cc:Subject:Date:From;
 b=t4du5pV0RN7cch3u6PdiXwdS+gZtV68G6mx4f9y2ObZFUKcm3a/pwSeekg8QSiSC7
 Kmiom4xFI3hnMWV/RWQZYcov//+wTOaNSzViu6qjsH07p+f0Q1t+YDPSPja1uBDzn4
 g8QTzMd2tZN8D5JwtXNN/kWaDdgIaAakO/AZFEgM=
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sat, 27 Jul 2019 23:44:34 +0800
Message-Id: <20190727154434.5946-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hrOsq-007Kdq-VR
Subject: [f2fs-dev] [PATCH v2] f2fs_io: support defrag_file
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

From: Chao Yu <yuchao0@huawei.com>

Support 'defrag_file' sub command to trigger file based defragment via
ioctl in f2fs.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- remove unneeded debug info.
- fix compile warning.
 tools/f2fs_io/f2fs_io.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index f087da4..59ef8a7 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -442,6 +442,46 @@ static void do_gc_urgent(int argc, char **argv, const struct cmd_desc *cmd)
 	}
 }
 
+#define defrag_file_desc "do defragment on file"
+#define defrag_file_help						\
+"f2fs_io defrag_file [start] [length] [-v] [file_path]\n\n"		\
+"  start     : start offset of defragment region, unit: bytes\n"	\
+"  length    : bytes number of defragment region\n"			\
+"  -v        : be verbose\n"						\
+
+static void do_defrag_file(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	struct f2fs_defragment df;
+	u64 len;
+	int ret, fd;
+
+	if (argc != 5) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	df.start = atoll(argv[1]);
+	df.len = len = atoll(argv[2]);
+
+	fd = open(argv[4], O_RDWR);
+	if (fd == -1) {
+		fputs("Open failed\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+printf("%lu, %lu\n", df.start, df.len);
+	ret = ioctl(fd, F2FS_IOC_DEFRAGMENT, &df);
+	if (ret < 0) {
+		perror("F2FS_IOC_DEFRAGMENT");
+		exit(1);
+	}
+	printf("defrag %s in region[%lu, %lu]\n", argv[3],
+				df.start, df.start + len);
+	exit(0);
+}
+
+
 #define CMD_HIDDEN 	0x0001
 #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
 #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
@@ -456,6 +496,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(read),
 	CMD(fiemap),
 	CMD(gc_urgent),
+	CMD(defrag_file),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
