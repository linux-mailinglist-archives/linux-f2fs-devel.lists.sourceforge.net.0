Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2990F829C6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Aug 2019 04:51:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hupYw-0000uQ-4d; Tue, 06 Aug 2019 02:50:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hupYt-0000u0-3z
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 02:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EzIlRTAxMorLM+vWVUqqaacvvr4xv/Y3VPgwueiRnCU=; b=Og9jJlGklJQEuHODgQpFLOdfrM
 Uoqkan7EJ1+XK/DDpx/TVaJ5QUsNOVMm/Sd6WDQPw77FWq1uJTT3QmVoutDlPCyaZj7ZY2rIMyjjD
 tpbKEo01eVaGUdLkDieQH5GgI5URCUDUlh10u3wgeFE/KyAw0zaALPXcAs5pwMlUmEeY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EzIlRTAxMorLM+vWVUqqaacvvr4xv/Y3VPgwueiRnCU=; b=O
 YTSASNUXr3UHG7H19I5C+ERULAXCBeCGNHdsZgkVqnFkRmrXD35E1Ie8FBq2Agk9Dr1Ntpfk6wW6q
 h4S+6wDyZb4qFm0dwBA/KJYuunXqVxXz2ENcOwM5H1gJJPz+uq0m7LfG3IxaYnSYmkMvTkDTIb5Qb
 BVuZTZax0C/vwAkc=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hupYq-00Bp7i-LM
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 02:50:55 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 8D8FEE25B2CE76F08387;
 Tue,  6 Aug 2019 10:50:44 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Tue, 6 Aug 2019 10:50:38 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 6 Aug 2019 10:50:31 +0800
Message-ID: <20190806025031.4444-1-yuchao0@huawei.com>
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
X-Headers-End: 1hupYq-00Bp7i-LM
Subject: [f2fs-dev] [PATCH v3] f2fs_io: support defrag_file
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
v3:
- remove -v option.
 tools/f2fs_io/f2fs_io.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index f087da4..6b43778 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -442,6 +442,45 @@ static void do_gc_urgent(int argc, char **argv, const struct cmd_desc *cmd)
 	}
 }
 
+#define defrag_file_desc "do defragment on file"
+#define defrag_file_help						\
+"f2fs_io defrag_file [start] [length] [file_path]\n\n"		\
+"  start     : start offset of defragment region, unit: bytes\n"	\
+"  length    : bytes number of defragment region\n"			\
+
+static void do_defrag_file(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	struct f2fs_defragment df;
+	u64 len;
+	int ret, fd;
+
+	if (argc != 4) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	df.start = atoll(argv[1]);
+	df.len = len = atoll(argv[2]);
+
+	fd = open(argv[3], O_RDWR);
+	if (fd == -1) {
+		fputs("Open failed\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	ret = ioctl(fd, F2FS_IOC_DEFRAGMENT, &df);
+	if (ret < 0) {
+		perror("F2FS_IOC_DEFRAGMENT");
+		exit(1);
+	}
+	printf("defrag %s in region[%llu, %llu]\n", argv[3],
+				df.start, df.start + len);
+	exit(0);
+}
+
+
 #define CMD_HIDDEN 	0x0001
 #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
 #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
@@ -456,6 +495,7 @@ const struct cmd_desc cmd_list[] = {
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
