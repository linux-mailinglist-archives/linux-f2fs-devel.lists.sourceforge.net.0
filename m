Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FF3A4A213
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Feb 2025 19:48:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1to5PF-0007l6-5m;
	Fri, 28 Feb 2025 18:48:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1to5PC-0007kx-P5
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Feb 2025 18:48:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x3dgsDqmXfnliiABPeZAGz8rEkw2FZi/RjCThCqfSpo=; b=iZE+b5jfEbMFjHsA4Wl7mdBKQ9
 ZA2feN98HMy6yGxWTT4pQG2XIXPEK0Gh5pdB0U/ZDZxnKECKViUlzw2OrYiXLvnbL44Euu3VkZu51
 m5lQhS2xPnOX7lYFFQQW9myHVmGHHCIjBYRnc50ByvJTgQqd67i78gcHLTvI+xW4uDCc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=x3dgsDqmXfnliiABPeZAGz8rEkw2FZi/RjCThCqfSpo=; b=W
 wuFUnczeUaQZ4vWnOeBQN42BWcr8TEmPIYw1l9oipdey44ssPGSz4HG09eyqUpXyo0jHDbmYD34Pw
 Vw63M4mR+y8LHLYyaV7RJrYNmESJbibWoaMt5lcDCyev+R7W7j4o9WnCdd4GM6Rl2kmPWwtgu8PpZ
 maBQzYYPjnUvgo1U=;
Received: from mail-pj1-f50.google.com ([209.85.216.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1to5P7-0007vs-Ks for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Feb 2025 18:48:15 +0000
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2fbffe0254fso5084575a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 28 Feb 2025 10:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740768479; x=1741373279; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x3dgsDqmXfnliiABPeZAGz8rEkw2FZi/RjCThCqfSpo=;
 b=c+Fxfa14VZ/oWfazq+eEV9degS/B2tU7nGtsLEt/FkzumvfvlimuyEety5iXh/P4RT
 26CmaTUWYhtHo83es2U/fH1r7B5xFj1VGZwQCq4iKBAMVxOQ1ZkKFsfy9bhqKmQsAA2F
 MQtPprE737gFhpBqy5QDcmM7Ya0YfSZXs/rCr94Amx95Qcx1mZd4+dC6HT0UuHgkDPK7
 ZwQwYjD2+8lJbIyuMDydahpgWYJ+qZGfeGhNETGXe5neWcx3xFxUmKtXjx066N/ASJNa
 affI4RfrqSZeJcJnu+uSZ0sXm7tJksw80EIflQYraH+y85i2rfc82qyezll5j6cYW0pG
 egGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740768479; x=1741373279;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x3dgsDqmXfnliiABPeZAGz8rEkw2FZi/RjCThCqfSpo=;
 b=e8mFNyExTz3zG+0ZYpalStf6CcNtcXoHXpglw9Krq0b9NGYbkAZmn3k7u+HNzZzJtv
 m881pen16NQDR+JHZBnMCogMwMCwmDmRHUjD3aTdrKnbHesdVLOIM9trCq1kIpwRzMWo
 PytoneOJcpgfSw60840lK1U4zFR466PeEPkIKR8pyK/qa9lcaEuEZ9G/osSingHhBoCc
 G2gAFbPDrdo+NQvrUc8zVhGdqfDjZ/PXuUQxeCBXD8aRaa4KNcvD3RCc0ov53RabplDD
 2UxePfUuuLUTghMxQGmfmR4V6o0vKofJHbKb12EqsEhHQ8ENrBs8jJfK3y3qJFyTjDLh
 a56g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPk+wa158zU1L2d1uVwzDUcjFeS8BBBSKLHYvoJzoTZP9LQkzkxYIAqVxGk5ox0Dh+CxBxT1XCKYkI+RAk1riJ@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyMIl8cUCFrVwcU/1cCEJa/IEAXxGyivngNBMuLWNRTYb6OlVCp
 dHVVAA/WrN+OM+d2+VLSijihT7Y/N8UKeN62qnc2FvjvNhZtpf8p
X-Gm-Gg: ASbGncv//AORpKHTWhLjXe6jHK3XAtwfRkQZa9wJrpfObXauPejohOfuwTTCy1eaWO3
 4jSQzlMeFMbeDvHvNLuW1vHWh5dj3uxwJEqIz3DSBzihj8nlXDicm0IKjAkVvN3QPoWwPxIYQ+V
 bRS8Gd7lkMblbO3AOQi8H0OxQ3ESjkDAd42ncXzhaAuCQP81LVMyn0IlEmiXAFBmZZFUhvTNXqv
 noSxPaEjH8iG54/bn70EfefWEBr8VTRgs8u7XdVVSREfcy3JeeDpdiynwUrV3V6c+HWSzf+m0HB
 JZJyXi7cnS0SkG6wWQUNTwJ3Zut4KTfTHo9mu9E/7pRwaKgQuyH/PtDkE5w5HDIwHFL9WlcuJlC
 PnEuim0u32a8WixKDzQ==
X-Google-Smtp-Source: AGHT+IE0AAxJrN5/b5vWobqize86OydpOF89aPSPX1g8h8GWdL+zHxB2tvIYlSBKzE1qSJDUXslo7w==
X-Received: by 2002:a17:90b:268f:b0:2fe:b016:a6ac with SMTP id
 98e67ed59e1d1-2febab71afcmr8040270a91.15.1740768478584; 
 Fri, 28 Feb 2025 10:47:58 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:adc7:2cc2:39e7:4e21])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fea696d58esm4164285a91.30.2025.02.28.10.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 10:47:58 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 28 Feb 2025 10:47:52 -0800
Message-ID: <20250228184752.1668252-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong add ftruncate command to do file truncate.
 Signed-off-by: Daeho Jeong --- v2: update f2fs_io documentation ---
 man/f2fs_io.8
 | 3 +++ tools/f2fs_io/f2fs_io.c | 26 ++++++++++++++++++++++++++ 2 files
 changed, 29 insertions(+) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.216.50 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.216.50 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.50 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.50 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1to5P7-0007vs-Ks
Subject: [f2fs-dev] [PATCH v2] f2fs-tools: add ftruncate command in f2fs_io
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
v2: update f2fs_io documentation
---
 man/f2fs_io.8           |  3 +++
 tools/f2fs_io/f2fs_io.c | 26 ++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
index 2ff22f7..648fba6 100644
--- a/man/f2fs_io.8
+++ b/man/f2fs_io.8
@@ -180,6 +180,9 @@ Trigger gc to move data blocks from specified address range
 .TP
 \fBget_advise\fR \fI[file]\fR
 Get i_advise value and info in file
+.TP
+\fBftruncate\fR \fI[length] [file_path]\fR
+Do ftruncate a file in file_path with the length
 .SH AUTHOR
 This version of
 .B f2fs_io
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
2.48.1.711.g2feabab25a-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
