Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 855B32A228D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Nov 2020 01:30:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZNjj-0002Qt-8P; Mon, 02 Nov 2020 00:30:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kZNji-0002Qf-2F
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Nov 2020 00:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yGekM/7+TnFh/l+UAAWNmQtELSPstlZPjlxyx94QgaY=; b=YVZTje+9Ovz0IeMOIm+5UQohQq
 EIe3lZGiI5lZHthSFPXSCzgCJ4mSZzpfMtkzM3JHAedrhyGL1t+PrviWDlQnsQgzgSayXrqpC6nmn
 1Z7+JAJO7wkgcdlXMwNE7eCf2eDdhH/Id8csMyyjE1XCp/sbB/CHNLReon/82AdshTvU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yGekM/7+TnFh/l+UAAWNmQtELSPstlZPjlxyx94QgaY=; b=i
 BM0WOJZxXJlJrn3Fe0AJeHWnxjf988ZyLXS6yiC5cfQDk7u3/+XcnuNDaxY5AsbaA0ptZ9pNWKBCr
 swXUPxMdGmJi71skiawKcd2fWfKcLg624uj2qZB2k9oPi86q6TUJvI5cVXzLCFRt++zLESqLSlTRs
 eoUfa6uVVlp7GUfw=;
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kZNjT-005hge-QL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Nov 2020 00:30:13 +0000
Received: by mail-pg1-f196.google.com with SMTP id i7so7389597pgh.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 01 Nov 2020 16:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yGekM/7+TnFh/l+UAAWNmQtELSPstlZPjlxyx94QgaY=;
 b=qsP9UI1bFvFzcJGWXvkv32qjXKWgAccTlBmah7p8N/aS68cabKVSWWyRuNpGkoe7GB
 Y5TMIWzrKIgDOjjzvCP99nx1brAUvH2Vqt+Kg2MpwVYpwcRrGWBy7VJCkFozsmfB+XRX
 WJRGxW7r0WiXEsyD3r9UZeUGQpNdivw+iYdu4wgBGK/X0PK/GqORDwr7SfpVNG9oWVww
 W8XRYqlkU9Mt733i/rITVMOys9nkaxrzL8l6TBMKGutuCGhq6gl6+8G+mHE3fuI4HPpB
 Ify3+su3+1N7u16ImlT0ybwfGqvqJm1Gf/T2ZjjFxw+WxU56mw/IlWoaMq2iWcxEVBe+
 pAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yGekM/7+TnFh/l+UAAWNmQtELSPstlZPjlxyx94QgaY=;
 b=sJ70GtJ3+jnis1Eyb/EcvNrQdGQzn03NtQrlFLK59hjBsb9l7CzW7ahZf/wtjz6TYE
 Jdv8+6Lr17p3cP+xfct/O8Hw2QfalUtiWQkIlIWKFe1G32UlcVRZaUo/kYOcUpLiW3o7
 zEym2A88L1qodIcTVXcMp2RWB2jlu/lAFSIeR4x0IF5dfY9CzUZgREWA67IZKaam2Oo3
 Dti+xZjpPgoD2foNIo/Af7gf5KB33F5G9VcCUbTSfLDFGnz6s+aEyQtIvAfZqBGYDnA6
 DLCI2jyokF1Vhmqshv/IvV83r5ttqf0RoXdnD6mVcXzmATsAs6NrasL/Yg7QSulk6yym
 bqCQ==
X-Gm-Message-State: AOAM5303qF2a45hQIhVeaZ2SJhZWgj5o/psY/sxsskfup23zP7mE0hym
 sJXdV24VpTOSE82fWTdn4H3UrZHysTM=
X-Google-Smtp-Source: ABdhPJyDQxu/pj/YKB89npcePxUhsi3fEp3uwi5IZEdqLEU8k//F3cS90E1JheytzLYXWWfU+NO6BA==
X-Received: by 2002:a17:90b:23d5:: with SMTP id
 md21mr7927828pjb.81.1604276993883; 
 Sun, 01 Nov 2020 16:29:53 -0800 (PST)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:11:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id i10sm5043053pjz.44.2020.11.01.16.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2020 16:29:53 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  2 Nov 2020 09:29:40 +0900
Message-Id: <20201102002940.1450284-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.196 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.196 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kZNjT-005hge-QL
Subject: [f2fs-dev] [PATCH] f2fs_io: add get/set compression option
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
 tools/f2fs_io/f2fs_io.c | 61 +++++++++++++++++++++++++++++++++++++++++
 tools/f2fs_io/f2fs_io.h |  9 ++++++
 2 files changed, 70 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 5a2d06e..dab0d14 100644
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
+	fd = xopen(argv[3], O_RDONLY, 0);
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
