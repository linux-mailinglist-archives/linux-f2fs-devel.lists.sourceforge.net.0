Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D66FD17B6D5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Mar 2020 07:38:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jA6dH-00005v-Fa; Fri, 06 Mar 2020 06:38:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jA6dF-00005g-UT
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Mar 2020 06:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C5zoaa5eSQ0YEcxWivtVmzm0vCfteOfOlQXn0BbNco4=; b=fb5g51YMq3a+LOC9mwAILfZhHZ
 Z3L+sksv+VjPujQiCwXYgpR1qeeg2iqKqchZJEQlZEp/br60T/loRNt0w8ivPYYPy0Nj3CtFW686n
 TfnggYZIQRD9zTWg7vXODlWf+6vbad2IpEP1lcaYjgH8jsUpcm6dCnMexOaAXyue20FM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=C5zoaa5eSQ0YEcxWivtVmzm0vCfteOfOlQXn0BbNco4=; b=B
 o0N8/9NOuPZXhpNtiMdFAdMMBzeYdD2UB2oOuiRBTLyEiLeL5Gn4jesL0c/UkaK1a94BwuQWd5Mnj
 uHWH9GrB+z52GyPIjpgq/fBefMNTQop4JzjAPMhc3HijzgPp09s6tHSjmacEC0PB4SrkfoWheLRGw
 lGmEr4u3nxLNVkjk=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jA6dD-0008n0-BI
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Mar 2020 06:38:49 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 43DB8308021B958191F8;
 Fri,  6 Mar 2020 14:38:40 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Fri, 6 Mar 2020 14:38:30 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 6 Mar 2020 14:38:25 +0800
Message-ID: <20200306063825.22643-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jA6dD-0008n0-BI
Subject: [f2fs-dev] [PATCH] f2fs_io: support compress blocks ioctls
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

Adds to support below three commands to operate reserved blocks
in compressed inode.
- get_cblocks
- release_cblocks
- reserve_cblocks

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 tools/f2fs_io/f2fs_io.c | 78 +++++++++++++++++++++++++++++++++++++++++
 tools/f2fs_io/f2fs_io.h |  6 ++++
 2 files changed, 84 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 68e27ed..c1edef1 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -697,6 +697,81 @@ static void do_copy(int argc, char **argv, const struct cmd_desc *cmd)
 	close(dst_fd);
 }
 
+#define get_cblocks_desc "get number of reserved blocks on compress inode"
+#define get_cblocks_help "f2fs_io get_cblocks [file]\n\n"
+
+static void do_get_cblocks(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	unsigned long long blkcnt;
+	int ret, fd;
+
+	if (argc != 2) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	fd = xopen(argv[1], O_RDONLY, 0);
+
+	ret = ioctl(fd, F2FS_IOC_GET_COMPRESS_BLOCKS, &blkcnt);
+	if (ret < 0)
+		die_errno("F2FS_IOC_GET_COMPRESS_BLOCKS failed");
+
+	printf("%llu\n", blkcnt);
+
+	exit(0);
+}
+
+#define release_cblocks_desc "release reserved blocks on compress inode"
+#define release_cblocks_help "f2fs_io release_cblocks [file]\n\n"
+
+static void do_release_cblocks(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	unsigned long long blkcnt;
+	int ret, fd;
+
+	if (argc != 2) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	fd = xopen(argv[1], O_RDONLY, 0);
+
+	ret = ioctl(fd, F2FS_IOC_RELEASE_COMPRESS_BLOCKS, &blkcnt);
+	if (ret < 0)
+		die_errno("F2FS_IOC_RELEASE_COMPRESS_BLOCKS failed");
+
+	printf("%llu\n", blkcnt);
+
+	exit(0);
+}
+
+#define reserve_cblocks_desc "reserve blocks on compress inode"
+#define reserve_cblocks_help "f2fs_io reserve_cblocks [file]\n\n"
+
+static void do_reserve_cblocks(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	unsigned long long blkcnt;
+	int ret, fd;
+
+	if (argc != 2) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	fd = xopen(argv[1], O_RDONLY, 0);
+
+	ret = ioctl(fd, F2FS_IOC_RESERVE_COMPRESS_BLOCKS, &blkcnt);
+	if (ret < 0)
+		die_errno("F2FS_IOC_RESERVE_COMPRESS_BLOCKS failed");
+
+	printf("%llu\n", blkcnt);
+
+	exit(0);
+}
+
 
 #define CMD_HIDDEN 	0x0001
 #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
@@ -717,6 +792,9 @@ const struct cmd_desc cmd_list[] = {
 	CMD(gc_urgent),
 	CMD(defrag_file),
 	CMD(copy),
+	CMD(get_cblocks),
+	CMD(release_cblocks),
+	CMD(reserve_cblocks),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index 3b2892c..c6ea7ff 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -68,6 +68,12 @@ typedef u32	__be32;
 #define F2FS_IOC_SET_PIN_FILE		_IOW(F2FS_IOCTL_MAGIC, 13, __u32)
 #define F2FS_IOC_GET_PIN_FILE		_IOR(F2FS_IOCTL_MAGIC, 14, __u32)
 #define F2FS_IOC_PRECACHE_EXTENTS	_IO(F2FS_IOCTL_MAGIC, 15)
+#define F2FS_IOC_RESIZE_FS		_IOW(F2FS_IOCTL_MAGIC, 16, __u64)
+#define F2FS_IOC_GET_COMPRESS_BLOCKS	_IOR(F2FS_IOCTL_MAGIC, 17, __u64)
+#define F2FS_IOC_RELEASE_COMPRESS_BLOCKS				\
+					_IOR(F2FS_IOCTL_MAGIC, 18, __u64)
+#define F2FS_IOC_RESERVE_COMPRESS_BLOCKS				\
+					_IOR(F2FS_IOCTL_MAGIC, 19, __u64)
 
 #define F2FS_IOC_SET_ENCRYPTION_POLICY	FS_IOC_SET_ENCRYPTION_POLICY
 #define F2FS_IOC_GET_ENCRYPTION_POLICY	FS_IOC_GET_ENCRYPTION_POLICY
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
