Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F9877804
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Jul 2019 11:51:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hrJMQ-0004xX-Lt; Sat, 27 Jul 2019 09:51:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hrJMP-0004xP-1p
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 27 Jul 2019 09:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QiSMzd1DgIfllY8NmSZHm7abAJMgRAeX2GFzMXMKxi8=; b=FHomg7+4ufL0sD+D2nIdT5+DCC
 A1gkRG9uhoJ+qDwyhuq9aRlvuAkNOlfrHuFWuIHiF7xSj5s5ke4utVJpy1na0YArQ36f9wAR0iNVr
 q5ZJbYnvIOyPtMhhFfU+lrcGvd6/PrtQwbKB0YxpD4IOx6wXcAsS5tiKR5G0T3mISB9o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QiSMzd1DgIfllY8NmSZHm7abAJMgRAeX2GFzMXMKxi8=; b=W
 hEVjTJvaa6qR686l/JzrtIQebUlIv0ppbLsi0NAON/stvgmxtFsmL3RQg7SWytHTyzqquxgODMBqB
 6IgoKqAm17dgKaPod41vmIbl10otytut5v1xnrb+dGZA4Mne2Sh6FLhsqYfcNzdHQBh5sI+pXNGDe
 fvPf1Wj/vkzpYQEQ=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hrJMN-0015me-1U
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 27 Jul 2019 09:51:28 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E0CD73AC648E48BD04C6;
 Sat, 27 Jul 2019 17:35:47 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Sat, 27 Jul 2019 17:35:36 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Sat, 27 Jul 2019 17:35:23 +0800
Message-ID: <20190727093523.30194-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hrJMN-0015me-1U
Subject: [f2fs-dev] [PATCH] f2fs_io: support defrag_file
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

Support 'defrag_file' sub command to trigger file based defragment via
ioctl in f2fs.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 tools/f2fs_io/f2fs_io.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 288c2f2..76ba52e 100644
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
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
