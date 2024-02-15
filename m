Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E033D856E5A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Feb 2024 21:11:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rai4h-0004Zd-EC;
	Thu, 15 Feb 2024 20:11:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rai4e-0004ZW-KM
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Feb 2024 20:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RYLTFvOYvCyE+kba2OweNWpInmcv7a9h94/NURW8+cU=; b=bAIQJdfiBKqHxf1ZJywr49qrFt
 TYHCWtqCpPMT6h8vcAPxrkqdDY0UoavnuBFjtqfL6bTmnJRceH7q9+FoPAyqPlW47AzK6dk8UzNVX
 npeCFbAgZ04FEzjaLjnpvEk9nlpyffQ5n/p+7JT3kxqMEoQCRB25r26pw4T3NRt/+RRU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RYLTFvOYvCyE+kba2OweNWpInmcv7a9h94/NURW8+cU=; b=m
 ygDMLkAiilCEjTovAWPn1EyfUYQQHL8/WTY2kQDOAZ821nKrEVsTDFW78wZnYivZ4TL4zjTxymLlt
 1ZlyeCdYs7XAI8pBUesq+aq/WyBNP9K5F0CYXLgxtk+6eLJaxD1TnbIHCJQOA5oJ7J3OwJc8VzWWO
 rak3mSqTAz50u4GY=;
Received: from mail-pj1-f41.google.com ([209.85.216.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rai4Z-0002Mj-W8 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Feb 2024 20:11:12 +0000
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-290fb65531eso927906a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 15 Feb 2024 12:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708027858; x=1708632658; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RYLTFvOYvCyE+kba2OweNWpInmcv7a9h94/NURW8+cU=;
 b=Hc+d0bTygVdXeZ8JPmYIts1canlN2Jyqg4gqiazUJ4Hz3wkovKYHm/zfU+7FjdO5D6
 0LXA2rf0BymI1U88lBZRV10HG39HN1XV49zGDvdL8jSp56F+MmVPLA4Bu9FKd/C4HO1l
 vBXVseBzyxgwE+VgLEtvkJP/HEn1JAiQv39HEpWwcW2L52z/oFDVaI5NRGpEPhhNQW3F
 zp0GoELBTPxtezsgLO/4337Cx9QiqaI6Czt8pUO89LHxR/hppJUqmqQsENAv0EiMgsjx
 Exf+rv9LWyd4qXC+CvrGQaArQuW7CcNfYN9NM07m1xVI6BPiUg5IjwXaV9I4hlgUXMQO
 hC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708027858; x=1708632658;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RYLTFvOYvCyE+kba2OweNWpInmcv7a9h94/NURW8+cU=;
 b=g5nzPoQsV7cjhi7W+jnUvweAO4KibOJ/SSX6V/n/mqEct8/YOedG753a6+Ko7tX7Fb
 AxtXMv3TVn5j5keDMMc3wcG7ZnHX5finUD/vBbou3kMWcNR5o0EjSP7lYYucAwcT4FIW
 zA0couInOAwytQIUOkaVvUC0YOdKcjRyl9PJDRVFBj59iFsdPLZkyJumNKbS4vj4sQ0W
 82XBaDFMoJorDHAyYvIW5Ik/QQjF3Ot0lKm5Nj6NE9WJr2hmf7Cso1B6v8Ylt4n2jQYt
 49fCeqLE7iyPhQvzr9HM99834vdRCFSsEeAvE22xmw3p9CbgWnkXS5cteEsmPc6ryCKx
 s9nQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTzm3MlWDrgkRPGQuL2vyU16+0Bg4EkctCrtKR/+M/nWGSfKs9+IsWUfSejf+EWq3SFJ06EWsi0xEZPYmPqfbfHxw+YK7atenFh638cUSkQTguv9aUAQ==
X-Gm-Message-State: AOJu0YxhsRxVXLJK7lLvcOavZbge4zI3J3OACQ128PV39DlWD0d46WMn
 Y5RI8HUSuQgXIHIv7LxQn9tbeUnnaGIsOx8KL5GLad68B1Gh3m5/
X-Google-Smtp-Source: AGHT+IF/f1VEogR6Uy8rp0FVSURwgFmslmsw9/F+c36lGr0fuaLy2YqoQeWhc9ydqLeBf6xnhL/51Q==
X-Received: by 2002:a17:90b:2398:b0:299:3174:74df with SMTP id
 mr24-20020a17090b239800b00299317474dfmr203778pjb.20.1708027857570; 
 Thu, 15 Feb 2024 12:10:57 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:3772:8174:2d71:3b60])
 by smtp.gmail.com with ESMTPSA id
 st13-20020a17090b1fcd00b00298ca3a93f1sm3842499pjb.4.2024.02.15.12.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 12:10:57 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 15 Feb 2024 12:10:53 -0800
Message-ID: <20240215201053.2364270-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Added lseek command to support lseek() for
 SEEK_DATA and SEEK_HOLE. Signed-off-by: Daeho Jeong ---
 tools/f2fs_io/f2fs_io.c
 | 38 ++++++++++++++++++++++++++++++++++++++ 1 file changed, 38 insertions(+)
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.41 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.41 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rai4Z-0002Mj-W8
Subject: [f2fs-dev] [PATCH] f2fs_io: add lseek command to execute lseek()
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

Added lseek command to support lseek() for SEEK_DATA and SEEK_HOLE.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 tools/f2fs_io/f2fs_io.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index e7d286a..b5c5b97 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -1630,6 +1630,43 @@ static void do_removexattr(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
+#define lseek_desc "do lseek for SEEK_DATA or SEEK_HOLE for a file"
+#define lseek_help					\
+"f2fs_io lseek [whence] [offset] [file_path]\n\n"	\
+"Do lseek file data in file_path\n"			\
+"whence can be\n"					\
+"  data     : SEEK_DATA, return the file offset to the next data location from offset\n"\
+"  hole     : SEEK_HOLE, return the file offset to the next hole from offset\n"
+
+static void do_lseek(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	int fd, whence;
+	off_t offset, ret;
+
+	if (argc != 4) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	offset = atoi(argv[2]);
+
+	if (!strcmp(argv[1], "data"))
+		whence = SEEK_DATA;
+	else if (!strcmp(argv[1], "hole"))
+		whence = SEEK_HOLE;
+	else
+		die("Wrong whence type");
+
+	fd = xopen(argv[3], O_RDONLY, 0);
+
+	ret = lseek(fd, offset, whence);
+	if (ret < 0)
+		die_errno("lseek failed");
+	printf("returned offset=%ld\n", ret);
+	exit(0);
+}
+
 #define CMD_HIDDEN 	0x0001
 #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
 #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
@@ -1671,6 +1708,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(listxattr),
 	CMD(setxattr),
 	CMD(removexattr),
+	CMD(lseek),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
-- 
2.43.0.687.g38aa6559b0-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
