Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D49752D1FDC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Dec 2020 02:19:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmRfF-0006B0-6M; Tue, 08 Dec 2020 01:19:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kmRfD-0006As-9m
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 01:19:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PrsSakMBTlbeh9Q4//NzHQKO3B7cCZIrXJgqANEuIBg=; b=ZtIgmoFS8lIshEcDLFAsVTh1e8
 auzwtWBS7coHKW+U2Z+mvnG/OeYXWXxBcooVZ95lI/KVcy6GcX/D8kIqp0I+LVFOSlunEGs+Zn/ao
 2tDzGoFi+pZqJXXJfLDeahC0jicEERxAFzDTi7bPyHPaxRePROUvWWoe6z048EbVZmhk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PrsSakMBTlbeh9Q4//NzHQKO3B7cCZIrXJgqANEuIBg=; b=j
 8DK7+eL9MksgEjKEOYNHLnj4Rn+2UT6aJN2LfbPCMbsRw+cKzarnGx6vqmzV3YG6vsiEr0OPhqzie
 DRLpzySZCpKueNDYvsy5dOJfwAgce1vTKXbul0UwATiSm+PHRv5+lGjSv/DPBDhB211rK3aBnqi7d
 a19+Yr+2EwHxscwg=;
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kmRf9-00605A-3k
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 01:19:35 +0000
Received: by mail-pg1-f193.google.com with SMTP id 69so2831985pgg.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 07 Dec 2020 17:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PrsSakMBTlbeh9Q4//NzHQKO3B7cCZIrXJgqANEuIBg=;
 b=jrsVn+LjSectCFxDcGauzyHN+tj1YF634c2eS6YXB6DJ6tJ7LhIDYZRkqpg0qjSIrX
 ynX4WlzgIFOb5D1cr4aiJUP5jI9kz8nBQqUxRODyEC6iYZOJlRefZVpBnqPProMFYPtD
 2p1opqYXw12vOfq/bBABMmqePe2l7Gat/O0SU+r/a4sIVqUCAx6Upon5IxU83RwvwAti
 0N3rDDlpKJD0N0cvzYW0hJFJc04fiYlf1ZTJAUwibxyDjuVTXwik8yEtptLld5bLHKKc
 fqF1dpIkq/slJ6emgr8XKqV8b4N5EALV5jI7PWw+Z4MBqWOflX9u3GplYiSl8uXks5XJ
 NfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PrsSakMBTlbeh9Q4//NzHQKO3B7cCZIrXJgqANEuIBg=;
 b=JftEgntfbpm/qHfPYeUMIsCwHIEMXLSGcGOoToiPOxVxb78aH1nEnORU/tioIr78y4
 WzZGPKmmxAg+LlACezNQLR25/pkR06dsJZ55aSshqroKLXR8eUG1NAUYD6ueXTFUhyUA
 uZg0QBrR2+Zkm6FY0IG2mAJ/Wqizw7pOscgGRbUEVs3RlQcbVD4dIApAr8hHmYcT6qsZ
 z9Duef1tXn5Xo8vyTheNxJVZQtkMT3S6eiaTfJIEiXOc3uMRAwRRU6UucYfpQ81sBGkm
 XJWnzAhkbBIpSZd8xq8cZwgO2T+JWeb+CutAWQ6J/tDFQ4wdF9LgOs8IVMEWi/+kJMhu
 TYUQ==
X-Gm-Message-State: AOAM530euy01HZTnBjYMctvdpdkzd+2jNS5lRg58AJHVNDpf7AMe+lzB
 p23Ole4NDS8UGkdD1aSTkCIviqycdTg=
X-Google-Smtp-Source: ABdhPJyfoGZOdODI1PGhlkxU5TcVBX4dHfgScXO48/NJfdf/kOHrV0cJqVbyqMtLYP7EjJIbl/vYAg==
X-Received: by 2002:a17:90a:9289:: with SMTP id
 n9mr1554326pjo.67.1607390358097; 
 Mon, 07 Dec 2020 17:19:18 -0800 (PST)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:11:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id ck20sm618294pjb.20.2020.12.07.17.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 17:19:17 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  8 Dec 2020 10:19:10 +0900
Message-Id: <20201208011910.3518929-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.193 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kmRf9-00605A-3k
Subject: [f2fs-dev] [PATCH] f2fs_io: add compress/decompress commands
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

Added new commands, compress and decompress, to support
F2FS_IOC_COMPRESS_FILE and F2FS_IOC_DECOMPRESS_FILE.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 tools/f2fs_io/f2fs_io.c | 46 +++++++++++++++++++++++++++++++++++++++++
 tools/f2fs_io/f2fs_io.h |  2 ++
 2 files changed, 48 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 7e6cfd8..e7e0a17 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -965,6 +965,50 @@ static void do_set_coption(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
+#define decompress_desc "decompress an already compressed file"
+#define decompress_help "f2fs_io decompress [file_path]\n\n"
+
+static void do_decompress(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	int fd, ret;
+
+	if (argc != 2) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	fd = xopen(argv[1], O_WRONLY, 0);
+
+	ret = ioctl(fd, F2FS_IOC_DECOMPRESS_FILE);
+	if (ret < 0)
+		die_errno("F2FS_IOC_DECOMPRESS_FILE failed");
+
+	exit(0);
+}
+
+#define compress_desc "compress a compression enabled file"
+#define compress_help "f2fs_io compress [file_path]\n\n"
+
+static void do_compress(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	int fd, ret;
+
+	if (argc != 2) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	fd = xopen(argv[1], O_WRONLY, 0);
+
+	ret = ioctl(fd, F2FS_IOC_COMPRESS_FILE);
+	if (ret < 0)
+		die_errno("F2FS_IOC_COMPRESS_FILE failed");
+
+	exit(0);
+}
+
 #define CMD_HIDDEN 	0x0001
 #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
 #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
@@ -991,6 +1035,8 @@ const struct cmd_desc cmd_list[] = {
 	CMD(reserve_cblocks),
 	CMD(get_coption),
 	CMD(set_coption),
+	CMD(decompress),
+	CMD(compress),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index cb56e8c..d53e576 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -88,6 +88,8 @@ typedef u32	__be32;
 						struct f2fs_comp_option)
 #define F2FS_IOC_SET_COMPRESS_OPTION    _IOW(F2FS_IOCTL_MAGIC, 22,      \
 						struct f2fs_comp_option)
+#define F2FS_IOC_DECOMPRESS_FILE        _IO(F2FS_IOCTL_MAGIC, 23)
+#define F2FS_IOC_COMPRESS_FILE          _IO(F2FS_IOCTL_MAGIC, 24)
 
 #define F2FS_IOC_SET_ENCRYPTION_POLICY	FS_IOC_SET_ENCRYPTION_POLICY
 #define F2FS_IOC_GET_ENCRYPTION_POLICY	FS_IOC_GET_ENCRYPTION_POLICY
-- 
2.29.2.576.ga3fc446d84-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
