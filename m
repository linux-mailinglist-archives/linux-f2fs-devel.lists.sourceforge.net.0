Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A0BA33871
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Feb 2025 08:04:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tiTGm-0007Xh-Al;
	Thu, 13 Feb 2025 07:04:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang66@gmail.com>) id 1tiTGl-0007Xb-MP
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Feb 2025 07:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UmOI+78seSj2NHx96gfWR65A5VrwR0Dmhx6vqiydy6s=; b=abW8mg8GXOq40+xwMQOboo7kr5
 wxTh098td8XtBkylqw6+ll0/f5Q6ECkeP4LdNPc/vZXK8ta/Tq97UB7k2aBuRDFylYD1jixD/KPOc
 Y2kifqrTASL7C6URSgJ0DCTMxipzyKi530t3c0aPLvJ5MLLhMv2lkTSnRbnFhkwB9Z+4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UmOI+78seSj2NHx96gfWR65A5VrwR0Dmhx6vqiydy6s=; b=M
 ZnmVdzVTnwJ7m2px7d0T0dX2Nx5sAt4spuZLLeDq3deKYzbg54ha2zjZjAWThKKhxaDKqaXxUBZLg
 EXNDHT8AO8AqgYgPdCUYtCVIXc3O2mEKK8iUe1qUyjiNVmFUx3TZFq3A1mcbWOBfsGeSabxd8g2jM
 HoWHtLL0XOUMgVG0=;
Received: from mail-pj1-f52.google.com ([209.85.216.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tiTGl-0006hD-FK for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Feb 2025 07:04:20 +0000
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2fa8ada664fso947445a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Feb 2025 23:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739430254; x=1740035054; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UmOI+78seSj2NHx96gfWR65A5VrwR0Dmhx6vqiydy6s=;
 b=eDVfOoV6D9JdzRDcU20gXjjAepC4fhGb8acyftPKSOHCEPM26RNR8566G1Y1p2YC2H
 w2jNOcfTrNTPMbJZHMXQHQeC8IOmFNCivtt/bwjcBmV8aLYNr0aqLZVw//oFrlQN4nPu
 FtVcBIfCO2T1JiEEy95rcSaBrBkTlpom+ApxdH7NdXq2BIPpOD3yjjhtfdaLgBcauf53
 jck+lK8REJ3nMr7qLV4KwbKumTh0xP5E4zifcJcESXLrldHfvoL6PRrkItu6/KyAlC+8
 5S5quHYxMrksustPjpJ4TA8lAMQerQf3TPpF6NlDtlIa9asSs6LXyk57218oGOn8Afe5
 F5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739430254; x=1740035054;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UmOI+78seSj2NHx96gfWR65A5VrwR0Dmhx6vqiydy6s=;
 b=cenuRPHkLyq6Ke4/MbotuJYNc+IPTpNYkdZ8WyCvB3gj8cATXoT3yifQRj2gHDgM0B
 uWnBIEGp9GSZ2Ra9QjaexyVHt4PbP0R2gP7eAnL8ZTTQIohktp5gY+B2AxgovI/kqWc5
 WvIDjZT65rEM3josUFFk8+0ZYzc3w86GcDcnxc8aSxYzBapec5LuXKR64xnqAf7YROKn
 2tP2EPo0oZqk/d2yyNsUmukhuyY+rDCe2Hnqfel6rVwqQgLyqX9umnTU1DWL8BHOKyA7
 xlEr3gUIjIPjSs8PZ5Gu2iQoOvDd58CqqxRCpg6n49AbtL9ZiUKdS3z3eUX+a4GhDKbO
 90UQ==
X-Gm-Message-State: AOJu0Yyb+DBcKAKtDp4UbulU1rT4LxWObLbtCNiN6zKWCUjbQoXV5wuT
 kuHxyBxxT/nsRv22OCHlT6RNsrx4nnogE9v4/V3oPToM0ibcZAFv
X-Gm-Gg: ASbGncsQ4H3gGeRsE17h4BTYUbhgCE0wohJIZG7uOclNMbAZKJB36eIzzvyJXFngIXZ
 Iaag0ajzkloYpQcZ6pO7DoZ/ynMOhPZkHp9joWzivTt9vTwrmMRo8Qjfcjg84SIXhheuLODlqff
 UsXngazAiM0EvQrzScEie6kETqro8PW/A3gY/Mkx0H4I8Bf8TF7i7d2/N7VJSZZqcGk6eoNMGwC
 fsnbn8AGA1z6LHRa64PaXYewhhbNb8tZjgY+NSYhXc4LZmdKU9QrvhI1/1pVRlyQaKiaqv/8pZ8
 t9Qx5CRQc/L9iNpqhJnDdSGvwQ==
X-Google-Smtp-Source: AGHT+IFr+OQA93ocKG+X9+3yrakNiil5zlU5VLBnIpnnSByv8JTobxATRzcraikScphFcl3Ql+EFEw==
X-Received: by 2002:a17:90b:51c6:b0:2f2:ab09:c256 with SMTP id
 98e67ed59e1d1-2fbf5c6abf5mr10806348a91.33.1739430253752; 
 Wed, 12 Feb 2025 23:04:13 -0800 (PST)
Received: from zyy.mioffice.cn ([2408:8607:1b00:8:b27b:25ff:fe28:43a8])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fbf999b5cesm2492217a91.34.2025.02.12.23.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 23:04:13 -0800 (PST)
From: YangYang Zang <zangyangyang66@gmail.com>
X-Google-Original-From: YangYang Zang <zangyangyang1@xiaomi.com>
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Thu, 13 Feb 2025 15:03:40 +0800
Message-ID: <20250213070340.388007-1-zangyangyang1@xiaomi.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Now we can only set pin for files with size 0, so we need
 to call fallocate frequently. Therefore, add an optional option to the set
 subcommand to call fallocate when setting pinfile. Signed-off-by: YangYang
 Zang --- tools/f2fs_io/f2fs_io.c | 24 ++++++++++++++++++------ 1 file changed, 
 18 insertions(+), 6 deletions(-) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.52 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.216.52 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.216.52 listed in bl.score.senderscore.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [zangyangyang66[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [zangyangyang66[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.52 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tiTGl-0006hD-FK
Subject: [f2fs-dev] [PATCH] f2fs_io: fallocate when setting pinfile
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
Cc: YangYang Zang <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Now we can only set pin for files with size 0,
so we need to call fallocate frequently.
Therefore, add an optional option to the set
subcommand to call fallocate when setting pinfile.

Signed-off-by: YangYang Zang <zangyangyang1@xiaomi.com>
---
 tools/f2fs_io/f2fs_io.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index fa01f8f..20682c9 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -478,21 +478,22 @@ static void do_fadvise(int argc, char **argv, const struct cmd_desc *cmd)
 
 #define pinfile_desc "pin file control"
 #define pinfile_help						\
-"f2fs_io pinfile [get|set|unset] [file]\n\n"			\
-"get/set pinning given the file\n"				\
+"f2fs_io pinfile [get|set|unset] [file] {size}\n\n"		\
+"get/set/unset pinning given the file\n"			\
+"{size} is fallocate length and optional only for set operations\n"
 
 static void do_pinfile(int argc, char **argv, const struct cmd_desc *cmd)
 {
 	u32 pin;
 	int ret, fd;
 
-	if (argc != 3) {
+	if (argc < 3 || argc > 4) {
 		fputs("Excess arguments\n\n", stderr);
 		fputs(cmd->cmd_help, stderr);
 		exit(1);
 	}
 
-	fd = xopen(argv[2], O_RDONLY, 0);
+	fd = xopen(argv[2], O_RDWR, 0);
 
 	ret = -1;
 	if (!strcmp(argv[1], "set")) {
@@ -500,8 +501,19 @@ static void do_pinfile(int argc, char **argv, const struct cmd_desc *cmd)
 		ret = ioctl(fd, F2FS_IOC_SET_PIN_FILE, &pin);
 		if (ret != 0)
 			die_errno("F2FS_IOC_SET_PIN_FILE failed");
-		printf("%s pinfile: %u blocks moved in %s\n",
-					argv[1], ret, argv[2]);
+		if (argc != 4) {
+			printf("%s pinfile: %u blocks moved in %s\n",
+						argv[1], ret, argv[2]);
+			exit(0);
+		}
+
+		struct stat st;
+		if (fallocate(fd, 0, 0, atoll(argv[3])) != 0)
+			die_errno("fallocate failed");
+		if (fstat(fd, &st) != 0)
+			die_errno("fstat failed");
+		printf("%s pinfile: %u blocks moved and fallocate %"PRIu64" bytes in %s\n",
+					argv[1], ret, st.st_size, argv[2]);
 	} else if (!strcmp(argv[1], "unset")) {
 		pin = 0;
 		ret = ioctl(fd, F2FS_IOC_SET_PIN_FILE, &pin);
-- 
2.43.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
