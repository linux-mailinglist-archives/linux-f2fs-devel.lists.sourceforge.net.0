Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7122A5A9C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Nov 2020 00:36:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ka5r2-0000aR-Ts; Tue, 03 Nov 2020 23:36:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1ka5r1-0000aE-Rp
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 23:36:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S0+bzA9s7UKxsAZSBmq5cQ30e/XxfLYDpoojIw6IapI=; b=dHrNVVbzwwCptonYgufpxv176E
 vRK9769CmsD2pnlWJKWoNv4DvrRCWhAAIP3E4gJcTQWMkYWrG04kHETdoaq/oS+HZEEcNUDiU80VB
 BPCRBAmTEPm0OwylxHL/zX2s2qVyLzIqCeg4VI84qgzCtFLAAm3pMucLd2XXfOMXu6lI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=S0+bzA9s7UKxsAZSBmq5cQ30e/XxfLYDpoojIw6IapI=; b=m
 WmkjFziIM7aZWaDTHvja8WNou86gNfj+x5R7W7bCt/BZRNSkhv6poLKQttE7dqqwRmDaF5tvS3tZd
 GRo9yMtWU8N0NAH1HcjDaiBkknB4+vMnGS5rxfFTCVNH89J2SMPe4U8LDLZ3yKtNWMFeprK9wtyA/
 uz87NkYxuvzk8N90=;
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ka5qw-008QMp-ET
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 23:36:43 +0000
Received: by mail-pf1-f196.google.com with SMTP id e7so15689465pfn.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 03 Nov 2020 15:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S0+bzA9s7UKxsAZSBmq5cQ30e/XxfLYDpoojIw6IapI=;
 b=GnkgjZ4V8Mpuxwh8634uGhR4JY+mTyktfUh0yGEX+giA0w25biqOVecK0archgURGw
 hGuWsUwxs8FpU6UAZqTmhWRtmDLabujEZm0bk9ZKZkPwKl5oCnXNpF1+SZJCloIitcVJ
 tbLXvsM1at5qYb9MBK9U4fBMXgMWceUXsnRgfJjjAl3o7RowiQpHjpRU5UICiCJ3DEID
 OtCRbhJSQEz0KJMlESnjNv8ThDvs+an9nR4PRHaHiD6r2RBE2qeHJVweGGpT/TAbZNyG
 bTbiHY4p9dGrK44NNeV+sS2Ej2dGhiFbRTcdODHETL9C9pEEkXo71DLNPV0cf4BKp4f8
 EpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S0+bzA9s7UKxsAZSBmq5cQ30e/XxfLYDpoojIw6IapI=;
 b=VRZGEncdInGxlLUL9pAY6ipcQZFKilT/qbn8YTNkQCRQOWk1LOBBh1+CS2mNK31oGL
 gDWFym0ksmr01nlnfgV0muz71pEL+r5kJjkrjnhKb3aDQe9grtb7qXemR5tBLK5NlhaY
 oFfc9mFQVarJEB8ISqhi8KvC2prN0uGi4Hx/IbK7KyPRhcBUGz9GlFUDvm+vzjWY/gOW
 i4PuPbdPH16O6HsgbudnKj8yN04GEvQqlNBK0C6uGzFxG26altEUXAOPCydPFxwJN4m1
 6AWOZ7EiBG0mWTZlcOTKJYRkADZJ7LEc4ZJsAUnO7whjGP2hy5bhnwSQxOc7I47ZM28z
 Pxeg==
X-Gm-Message-State: AOAM533RRkKXcripDH+ewvaKkuHqc4yjX0VAkr8+oG9BbjgdHmvMgPid
 k9asbxKhuL5bnVLXNe3ngbg=
X-Google-Smtp-Source: ABdhPJwMOnE5FwtsYa0OytLzoxFJWsQq7QuLt7z6A7c10GT9ViKR4VQQfU/TU2qz7t9r4qfNS+RjNA==
X-Received: by 2002:a62:e40b:0:b029:18b:2d21:45cd with SMTP id
 r11-20020a62e40b0000b029018b2d2145cdmr6231150pfh.36.1604446585723; 
 Tue, 03 Nov 2020 15:36:25 -0800 (PST)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:11:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id cm20sm237082pjb.18.2020.11.03.15.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 15:36:24 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed,  4 Nov 2020 08:36:14 +0900
Message-Id: <20201103233614.2092498-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.196 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.196 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ka5qw-008QMp-ET
Subject: [f2fs-dev] [PATCH v2] f2fs_io: add get/set compression option
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Added new commands, get_coption and set_coption, to support
F2FS_IOC_GET_COMPRESS_OPTION and F2FS_IOC_SET_COMPRESS_OPTION.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---

v2: changed the file open option of set_coption to write only.
---
 tools/f2fs_io/f2fs_io.c | 61 +++++++++++++++++++++++++++++++++++++++++
 tools/f2fs_io/f2fs_io.h |  9 ++++++
 2 files changed, 70 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 5a2d06e..7e6cfd8 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -905,6 +905,65 @@ static void do_reserve_cblocks(int argc, char **argv, const struct cmd_desc *cmd
 	exit(0);
 }
 
+#define get_coption_desc "get compression option of a compressed file"
+#define get_coption_help						\
+"f2fs_io get_coption [file]\n\n"	\
+"  algorithm        : compression algorithm (0:lzo, 1: lz4, 2:zstd, 3:lzorle)\n"	\
+"  log_cluster_size : compression cluster log size (2 <= log_size <= 8)\n"
+
+static void do_get_coption(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	struct f2fs_comp_option option;
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
+	ret = ioctl(fd, F2FS_IOC_GET_COMPRESS_OPTION, &option);
+	if (ret < 0)
+		die_errno("F2FS_IOC_GET_COMPRESS_OPTION failed");
+
+	printf("compression algorithm:%u\n", option.algorithm);
+	printf("compression cluster log size:%u\n", option.log_cluster_size);
+
+	exit(0);
+}
+
+#define set_coption_desc "set compression option of a compressed file"
+#define set_coption_help						\
+"f2fs_io set_coption [algorithm] [log_cluster_size] [file_path]\n\n"	\
+"  algorithm        : compression algorithm (0:lzo, 1: lz4, 2:zstd, 3:lzorle)\n"	\
+"  log_cluster_size : compression cluster log size (2 <= log_size <= 8)\n"
+
+static void do_set_coption(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	struct f2fs_comp_option option;
+	int fd, ret;
+
+	if (argc != 4) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	option.algorithm = atoi(argv[1]);
+	option.log_cluster_size = atoi(argv[2]);
+
+	fd = xopen(argv[3], O_WRONLY, 0);
+
+	ret = ioctl(fd, F2FS_IOC_SET_COMPRESS_OPTION, &option);
+	if (ret < 0)
+		die_errno("F2FS_IOC_SET_COMPRESS_OPTION failed");
+
+	printf("set compression option: algorithm=%u, log_cluster_size=%u\n",
+			option.algorithm, option.log_cluster_size);
+	exit(0);
+}
 
 #define CMD_HIDDEN 	0x0001
 #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
@@ -930,6 +989,8 @@ const struct cmd_desc cmd_list[] = {
 	CMD(get_cblocks),
 	CMD(release_cblocks),
 	CMD(reserve_cblocks),
+	CMD(get_coption),
+	CMD(set_coption),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index 05d4cfe..cb56e8c 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -84,6 +84,10 @@ typedef u32	__be32;
 					_IOR(F2FS_IOCTL_MAGIC, 18, __u64)
 #define F2FS_IOC_RESERVE_COMPRESS_BLOCKS				\
 					_IOR(F2FS_IOCTL_MAGIC, 19, __u64)
+#define F2FS_IOC_GET_COMPRESS_OPTION    _IOR(F2FS_IOCTL_MAGIC, 21,      \
+						struct f2fs_comp_option)
+#define F2FS_IOC_SET_COMPRESS_OPTION    _IOW(F2FS_IOCTL_MAGIC, 22,      \
+						struct f2fs_comp_option)
 
 #define F2FS_IOC_SET_ENCRYPTION_POLICY	FS_IOC_SET_ENCRYPTION_POLICY
 #define F2FS_IOC_GET_ENCRYPTION_POLICY	FS_IOC_GET_ENCRYPTION_POLICY
@@ -164,3 +168,8 @@ struct f2fs_flush_device {
 	u32 dev_num;		/* device number to flush */
 	u32 segments;		/* # of segments to flush */
 };
+
+struct f2fs_comp_option {
+	u8 algorithm;
+	u8 log_cluster_size;
+};
-- 
2.29.1.341.ge80a0c044ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
