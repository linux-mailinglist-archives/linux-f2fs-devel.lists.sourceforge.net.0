Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 265F2A4516D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Feb 2025 01:27:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tn5Gn-0001hD-5O;
	Wed, 26 Feb 2025 00:27:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1tn5Gl-0001h4-Rb
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Feb 2025 00:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dBTDkKhpQzNOkjeqjz5g1YE0mhCT5U0ZyWvRtu7wKPc=; b=VeZ46E0GNpfdGG+qiz5qQmHdGU
 xlJ1CkHdAlyD2X6ssQaojRNypST1CstIokBnq+s89UF6AtqkCTU0mHxNnDwdkWwqURHcw3p2ZC0t8
 lAdilN6V4NXXaJDs25703GvLTelrKc8Mh4tcS3kbxn2PmS4bCuJp/YMNhEDPVqpUNjgg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dBTDkKhpQzNOkjeqjz5g1YE0mhCT5U0ZyWvRtu7wKPc=; b=i
 IzIwyu3xZvCKMwB4twSj3TSWXC+9heBOVFiuKXKOro7iQzFBZLN/hvqiNI1WgjosIPY6eSmAwFrZ4
 LbPpkj2k/P4MerlEu190p1FNrkdyCV6kd4W5ddT91j278AsGsHIDdZiOjhqKgQj4op9a8AsqN0nPE
 Vczzi+IQsfNlv2VE=;
Received: from mail-pj1-f44.google.com ([209.85.216.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tn5Gl-0006TC-6U for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Feb 2025 00:27:23 +0000
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2fcc99efe9bso9627182a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Feb 2025 16:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740529632; x=1741134432; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dBTDkKhpQzNOkjeqjz5g1YE0mhCT5U0ZyWvRtu7wKPc=;
 b=DdytaeBBKYW+rkIEaAvsCC1vTFun5xqpjhK/zPNVPA6/nyVnKvfd0iCEcZrgIp2fWf
 v+fAwa3lnyqTiEm170TMDIBcE0EfYypwA+AAMeVwAqdDNB4Ffa+hu2YTXOGFYJ7EayDC
 5yJnuGSPjcLhZU9Veu+Ucen++9XGgj/aOcwyI3iYruEazYoN4R93cQhHkTQW15Cmt36b
 8Yd/uyhBowwH0NbYSLLi6sRt+/DWVTgJIeeTAr9Eq3hvQd9f7U8/t2FgqYy6kkGMCuqH
 mmi1EEZFUccmhqdHWVgCWh6ZAHSNE2VnfxcZ1rMDIIb+eVecmcHG4adu8m+67wZMQaXJ
 UL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740529632; x=1741134432;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dBTDkKhpQzNOkjeqjz5g1YE0mhCT5U0ZyWvRtu7wKPc=;
 b=Sa8CYBtkxO8Un2RGMJdw2T8n8NYGFCEfoeXVO3ioO8iT7tJ0Wzjb52hCE3gJ8l7wCu
 Z9SjENH/T+nk3frHWQfv6jQtliWJCcuTtDQi4H7Ddqx8PhrQVaBCI+agURTRGoF6ZAnN
 uBQV7HVU5QZcjQELOfN2RnmXviKpYittb2cEj7RGmR2XX8t+LfVGy7T+aa/WT6uH6YkV
 LdHOvZlT/gYCDB6tesFoJl6cf2iB2oFp0b/8zXrnbJBcS6NvFOcFf8xcEMrhOhbaValV
 0Fdi5fKNqcx0y5G98Hr8iK9BtOT1U3Ge0zHca2HPPMQkIxHUA1RavZnVI2iv5AuUBvOk
 hPxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqvpubkm/Dw/knl9QgZGZQ+OB2Yrs3OuwKmCWtcrhTdaEnlzMnsOWB6shY4H1+64dGcaEa97t+MxotS/FHK1uW@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxxz2ayU9jN/GmRzceduBrLTD4FpkkWP9Wf+8sVIj8vh8oKbLjh
 6QcA9RG5zsbPZllymmJpE6TcBUTRhE4L04udmKpi4kmc9EtRy2wS
X-Gm-Gg: ASbGncsLcw1GmgDXvrqExk2eO5ViJIsS6/KS2L1SvGEr4NboW758Z4oOiEM3bRiGrO3
 OhXmIgTuNwW3I0Hn7vE8dzAqvovduepTBv41ys80HO9qktEznmzIN1KSlUVnaDYfqQ+G896RYf4
 UurwrVxnUyhY7RuXA+Kohb/RVCITUYVZCnV/2SsiaNDQ7dtQUa1cH8CWO98oJNcAIzC+Rg93nbv
 kSY2qIe4Gat3EUBAAowWXZdFRGODv1zxqPwkBrguSaLRVYo9Mc7oH7Rm+xGCRjGzYg7bAXbmrw/
 LHdUgfYFu2VgxMy8SB7SN1/Oz5csnDZH6DMI+wE6tBbprUqhMUUM+QK0PvNcvbpF0N9aonmn5St
 BIUGaHcUnJvFUmbk+
X-Google-Smtp-Source: AGHT+IF9o7+WSvhvFwKtOtALZtCqxD9D2Q3TZt5mFeY3aUlILjylLpvrbMqfW33jsiAbiO4bowQFeQ==
X-Received: by 2002:a17:90b:350c:b0:2f1:30c8:6e75 with SMTP id
 98e67ed59e1d1-2fce875a087mr26635796a91.32.1740529632430; 
 Tue, 25 Feb 2025 16:27:12 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:24d1:e158:5cf8:56d])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2230a0b23e9sm20382645ad.256.2025.02.25.16.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 16:27:12 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 25 Feb 2025 16:27:07 -0800
Message-ID: <20250226002707.358601-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong add ftruncate command to do file truncate.
 Signed-off-by: Daeho Jeong --- tools/f2fs_io/f2fs_io.c | 26
 ++++++++++++++++++++++++++ 1 file changed, 26 insertions(+) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.216.44 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.216.44 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.44 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.44 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tn5Gl-0006TC-6U
Subject: [f2fs-dev] [PATCH] f2fs-tools: add ftruncate command in f2fs_io
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

add ftruncate command to do file truncate.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 tools/f2fs_io/f2fs_io.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index fa01f8f..08056a9 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -1887,6 +1887,31 @@ static void do_get_advise(int argc, char **argv, const struct cmd_desc *cmd)
 	printf("\n");
 }
 
+#define ftruncate_desc "ftruncate a file"
+#define ftruncate_help					\
+"f2fs_io ftruncate [length] [file_path]\n\n"	\
+"Do ftruncate a file in file_path with the length\n"	\
+
+static void do_ftruncate(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	int fd, ret;
+	off_t length;
+
+	if (argc != 3) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	length = atoll(argv[1]);
+	fd = xopen(argv[2], O_WRONLY, 0);
+
+	ret = ftruncate(fd, length);
+	if (ret < 0)
+		die_errno("ftruncate failed");
+	exit(0);
+}
+
 #define CMD_HIDDEN 	0x0001
 #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
 #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
@@ -1932,6 +1957,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(removexattr),
 	CMD(lseek),
 	CMD(get_advise),
+	CMD(ftruncate),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
-- 
2.48.1.658.g4767266eb4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
