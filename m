Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AE75BD1F2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Sep 2022 18:15:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oaJQG-0002mN-6N;
	Mon, 19 Sep 2022 16:15:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1oaJQE-0002mA-CK
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 16:15:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ETVkJGsHbRQfzGEcydO0b9qAVRVZbWDGRCa+GJ2CZig=; b=hKJjYhUBTzq8sEm3ZurPHfVboy
 L7sriEh3S2JuVwd/wm4PD2EFUSSSQsgqDoXxvLjvZs4qXcBWPzfrpiCIOqc1ErdxciDLlWps9VJ5e
 NZGwbfweYGxHU3uDpwSGbpqmO51xEP5vAjZU/Xy+SI77XZNKyZxYlDDKYrmdI6t6qsmg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ETVkJGsHbRQfzGEcydO0b9qAVRVZbWDGRCa+GJ2CZig=; b=b
 vFz2crhKyJYTTkHDDCpc21D4EAgKsK51PlUdeKm3MFq7Ld/gSAiXer1vS/GdPKj86oIrMevdnrz72
 u8+v3X8yB533nTtn4Efxe7/KxoLdrb/EzRgwPuayyg65lndlHHvGUjmimYuowBgv933JHyiSJsJ0M
 vrZegESK5NcZ+9qk=;
Received: from mail-pj1-f43.google.com ([209.85.216.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oaJQN-00044A-OK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 16:15:14 +0000
Received: by mail-pj1-f43.google.com with SMTP id fv3so136176pjb.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Sep 2022 09:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=ETVkJGsHbRQfzGEcydO0b9qAVRVZbWDGRCa+GJ2CZig=;
 b=PYqGrMnydl91H6U9MGvWS8OfrlF6MyThO+g3c1oKpoaXlO6+0aOpp3YLMDKiFt1t2W
 bXH+2VTNpWW5gQ8AztzFVjT5G2KO7uXcL+nNVb+kRivzRCoUkphAJiMBnZbRXc2+rbbw
 RTzSoLke0BFXp4EtiiO4R6+djq4KiNXX1EcIMRzueOKf4QUL7/EQbn800aTJ2WhHNnrq
 C97L84+arjfJh+TyK3vExXxc1/XBk5K0rrTyxyh7XxjMjLFIrV4Ba1CmB/Ax93eYXPhj
 OahioHMewdwVv7huybFU80brUxWDDcWDgnfsPqmwyEm2vcyAinDU+xk1ro3rNEclbRKJ
 RgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=ETVkJGsHbRQfzGEcydO0b9qAVRVZbWDGRCa+GJ2CZig=;
 b=d5py+EdX6IJVQbdOM1+b9tlJxt2aI+jeeiXj4r9rSyGP20HWWtVnAFPQZp7G/ESUQd
 yynU9cRowhBnM3Wfg/i51EoqvaQZLiRPOFvUSAIJpkpV2/jxzHkVPsJFuyGUN6DC8RsP
 SE5RaHCo2ZWkiewTD/HOWolCpxEEMR/ve3bndWXLvb0nrrbkpHf6G6h7ecUHTO2JVMcu
 ra+yJh+/XuZchdOqK90yh89MVDNndbXzupFP8Gn+660RJnwHMPfyb6AhYlgOZpJoc+y3
 +dhkn0FnSubtAV2NUo2LKEPht/Dhcc1P+yQrHBqTiUxQ+QWEQnXZNyhaiPrFMTzA8kn3
 oGnQ==
X-Gm-Message-State: ACrzQf04tykCPUhe2LwWxWuK+N1If+wqWKpzRIMo+ax6yMC37Zx/Z1jX
 RqgobuzG5VeAj3sArZ1oc96QdPhrlqk=
X-Google-Smtp-Source: AMsMyM6lgBQDlLT6qMrFgjgYD6Yw+u+vaau7eYa+5G2r7Ek5iyWbGDSNbIEOQqnvtJOHG5C3vNwGig==
X-Received: by 2002:a17:902:8c81:b0:178:a33f:8b8f with SMTP id
 t1-20020a1709028c8100b00178a33f8b8fmr541383plo.50.1663604106139; 
 Mon, 19 Sep 2022 09:15:06 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:8958:94cc:1777:6efd])
 by smtp.gmail.com with ESMTPSA id
 x21-20020aa78f15000000b00540f3ac5fb8sm20709787pfr.69.2022.09.19.09.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 09:15:05 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 19 Sep 2022 09:15:02 -0700
Message-Id: <20220919161502.2219862-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Added options in f2fs_io write command to
 support F2FS_IOC_START_ATOMIC_REPLACE. Signed-off-by: Daeho Jeong ---
 tools/f2fs_io/f2fs_io.c
 | 31 ++++++++++++++++++++++--------- tools/f2fs_io/f2fs_io.h | 1 + 2 files
 changed, 23 insertions(+), 9 deletions(-) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.43 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.43 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oaJQN-00044A-OK
Subject: [f2fs-dev] [PATCH] f2fs-tools: support F2FS_IOC_START_ATOMIC_REPLACE
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

Added options in f2fs_io write command to support
F2FS_IOC_START_ATOMIC_REPLACE.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 tools/f2fs_io/f2fs_io.c | 31 ++++++++++++++++++++++---------
 tools/f2fs_io/f2fs_io.h |  1 +
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 5be7b9e..6dcd840 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -513,7 +513,9 @@ static void do_erase(int argc, char **argv, const struct cmd_desc *cmd)
 "  osync         : O_SYNC\n"				\
 "  atomic_commit : atomic write & commit\n"		\
 "  atomic_abort  : atomic write & abort\n"		\
-"{delay} is in ms unit and optional only for atomic_commit and atomic_abort\n"
+"  atomic_rcommit: atomic replace & commit\n"	\
+"  atomic_rabort : atomic replace & abort\n"	\
+"{delay} is in ms unit and optional only for atomic operations\n"
 
 static void do_write(int argc, char **argv, const struct cmd_desc *cmd)
 {
@@ -524,7 +526,7 @@ static void do_write(int argc, char **argv, const struct cmd_desc *cmd)
 	int flags = 0;
 	int fd;
 	u64 total_time = 0, max_time = 0, max_time_t = 0;
-	bool atomic_commit = false, atomic_abort = false;
+	bool atomic_commit = false, atomic_abort = false, replace = false;
 	int useconds = 0;
 
 	srand(time(0));
@@ -551,18 +553,25 @@ static void do_write(int argc, char **argv, const struct cmd_desc *cmd)
 	else if (strcmp(argv[4], "inc_num") && strcmp(argv[4], "rand"))
 		die("Wrong pattern type");
 
-	if (!strcmp(argv[5], "dio"))
+	if (!strcmp(argv[5], "dio")) {
 		flags |= O_DIRECT;
-	else if (!strcmp(argv[5], "dsync"))
+	} else if (!strcmp(argv[5], "dsync")) {
 		flags |= O_DIRECT | O_DSYNC;
-	else if (!strcmp(argv[5], "osync"))
+	} else if (!strcmp(argv[5], "osync")) {
 		flags |= O_SYNC;
-	else if (!strcmp(argv[5], "atomic_commit"))
+	} else if (!strcmp(argv[5], "atomic_commit")) {
 		atomic_commit = true;
-	else if (!strcmp(argv[5], "atomic_abort"))
+	} else if (!strcmp(argv[5], "atomic_abort")) {
 		atomic_abort = true;
-	else if (strcmp(argv[5], "buffered"))
+	} else if (!strcmp(argv[5], "atomic_rcommit")) {
+		atomic_commit = true;
+		replace = true;
+	} else if (!strcmp(argv[5], "atomic_rabort")) {
+		atomic_abort = true;
+		replace = true;
+	} else if (strcmp(argv[5], "buffered")) {
 		die("Wrong IO type");
+	}
 
 	fd = xopen(argv[6], O_CREAT | O_WRONLY | flags, 0755);
 
@@ -572,7 +581,11 @@ static void do_write(int argc, char **argv, const struct cmd_desc *cmd)
 		if (argc == 8)
 			useconds = atoi(argv[7]) * 1000;
 
-		ret = ioctl(fd, F2FS_IOC_START_ATOMIC_WRITE);
+		if (replace)
+			ret = ioctl(fd, F2FS_IOC_START_ATOMIC_REPLACE);
+		else
+			ret = ioctl(fd, F2FS_IOC_START_ATOMIC_WRITE);
+
 		if (ret < 0) {
 			fputs("setting atomic file mode failed\n", stderr);
 			exit(1);
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index bd8db0b..58be8f8 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -90,6 +90,7 @@ typedef u32	__be32;
 						struct f2fs_comp_option)
 #define F2FS_IOC_DECOMPRESS_FILE        _IO(F2FS_IOCTL_MAGIC, 23)
 #define F2FS_IOC_COMPRESS_FILE          _IO(F2FS_IOCTL_MAGIC, 24)
+#define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
 
 #ifndef FSCRYPT_POLICY_V1
 #define FSCRYPT_POLICY_V1		0
-- 
2.37.3.968.ga6b4b080e4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
