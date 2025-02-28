Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 727BBA4A275
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Feb 2025 20:09:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1to5jZ-0004sC-US;
	Fri, 28 Feb 2025 19:09:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1to5jY-0004s2-RS
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Feb 2025 19:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RBWHALs+pQra8EBxbjJTamIGlpgwDEYEyC8sfc9N6p4=; b=NUSP2XsXABiYvq7I8gEWoQREwx
 NYunzKyrJ9hPBOOx07xw48bLIPFsEDeK++aHjQ4bdHZ71VtK9JjpOKtLvYu9q1kpt9Zi0ss80ZxYJ
 TrasWPjx8+3EEfsfOHOGslSGw7G6oRUoXC0iloQlImj5unjEOYBMq1EY4AE0CAl8eg14=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RBWHALs+pQra8EBxbjJTamIGlpgwDEYEyC8sfc9N6p4=; b=U9/bRoVxz3wk3wrhQIO0FZ6UpJ
 lepCYKBrJm6+GAWWNnY4/zcqcHwF1VDGPD/A8Sf4qpdmNF/p5gRCTtOVgFm9n+MxvKeUpE9ebYuq8
 TUUYSYlKZoT1Aq/I17hkUSFLOV7Ug2RSga27L+KgEH/6r5/AVYO9sobqQHPdudl92wNI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1to5jO-0000ZR-T6 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Feb 2025 19:09:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A647D5C6995
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 28 Feb 2025 19:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B553C4CED6;
 Fri, 28 Feb 2025 19:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740769741;
 bh=9YuEuWyD2rw96fYZspKuWjKx/UU5T7CzTFvFhynJyvo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S7P9mm+21YhRrnfZg62atZ+HolVEiqZnquBpwotZK6LlQxfxNoFjTSwfJ2iVZon3b
 R0CwnncJ1Abz+o67KjSZ/SQ4KNVie7m4YcA1+/5VUbqDGBHaxWMS5oTAF66Jd1cBFx
 eZynDJ/lFHkW/63M0xXCL5tTZU4QIp4BCmOi3Z7Fdoo+sWzDCCxk254scps8oLR74+
 lKf5UxFEp2shLW4JoTJnWuYP3QX55+qArBpvsggOays4bbe2ShDYDxVTEsba4I/i+e
 fJCE0+p+x+JBOQEmz1oIN+vr5D+vmcnk7V1uMDRgFUflr0gE6q90prKxcM7Qbtl2cs
 1UHJUI7fzmicg==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 28 Feb 2025 19:08:54 +0000
Message-ID: <20250228190854.422890-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
In-Reply-To: <20250228190854.422890-1-jaegeuk@kernel.org>
References: <20250228190854.422890-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This adds a command to call ioctl(F2FS_IOC_IO_PRIO).
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- man/f2fs_io.8 | 3 +++
 tools/f2fs_io/f2fs_io.c
 | 35 +++++++++++++++++++++++++++++++++++ tools/f2fs_io/f2fs_io.h | 7 +++++++
 3 files changed, 45 inser [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1to5jO-0000ZR-T6
Subject: [f2fs-dev] [PATCH 2/2] f2fs_io: add ioprio command to give a io
 priority hint
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This adds a command to call ioctl(F2FS_IOC_IO_PRIO).

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 man/f2fs_io.8           |  3 +++
 tools/f2fs_io/f2fs_io.c | 35 +++++++++++++++++++++++++++++++++++
 tools/f2fs_io/f2fs_io.h |  7 +++++++
 3 files changed, 45 insertions(+)

diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
index 5def508e494f..b71965cf447a 100644
--- a/man/f2fs_io.8
+++ b/man/f2fs_io.8
@@ -181,6 +181,9 @@ Trigger gc to move data blocks from specified address range
 .TP
 \fBget_advise\fR \fI[file]\fR
 Get i_advise value and info in file
+.TP
+\fBioprio\fR \fI[hint] [file]\fR
+Set ioprio to the file. The ioprio can be ioprio_write.
 .SH AUTHOR
 This version of
 .B f2fs_io
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 05126c8b44a6..155d44f147ad 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -498,6 +498,40 @@ static void do_fadvise(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
+#define ioprio_desc "ioprio"
+#define ioprio_help						\
+"f2fs_io ioprio [hint] [file]\n\n"				\
+"ioprio given the file\n"					\
+"hint can be\n"							\
+" ioprio_write\n"						\
+
+static void do_ioprio(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	int fd, hint;
+
+	if (argc != 3) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	fd = xopen(argv[2], O_RDWR, 0);
+
+	if (!strcmp(argv[1], "ioprio_write")) {
+		hint = F2FS_IOPRIO_WRITE;
+	} else {
+		fputs("Not supported hint\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	if (ioctl(fd, F2FS_IOC_IO_PRIO, &hint) != 0)
+		die_errno("ioprio failed");
+
+	printf("ioprio_hint %d to a file: %s\n", hint, argv[2]);
+	exit(0);
+}
+
 #define pinfile_desc "pin file control"
 #define pinfile_help						\
 "f2fs_io pinfile [get|set|unset] [file] {size}\n\n"		\
@@ -1966,6 +2000,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(removexattr),
 	CMD(lseek),
 	CMD(get_advise),
+	CMD(ioprio),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index c32def72fe45..22102884faab 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -94,6 +94,8 @@ typedef u32	__be32;
 #define F2FS_IOC_DECOMPRESS_FILE        _IO(F2FS_IOCTL_MAGIC, 23)
 #define F2FS_IOC_COMPRESS_FILE          _IO(F2FS_IOCTL_MAGIC, 24)
 #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
+#define F2FS_IOC_GET_DEV_ALIAS_FILE	_IOR(F2FS_IOCTL_MAGIC, 26, __u32)
+#define F2FS_IOC_IO_PRIO		_IOW(F2FS_IOCTL_MAGIC, 28, __u32)
 
 #ifndef FSCRYPT_POLICY_V1
 #define FSCRYPT_POLICY_V1		0
@@ -193,6 +195,11 @@ struct fsverity_enable_arg {
 #define FADVISE_VERITY_BIT	0x40
 #define FADVISE_TRUNC_BIT	0x80
 
+/* used for F2FS_IOC_IO_PRIO */
+enum {
+	F2FS_IOPRIO_WRITE = 1,  /* high write priority */
+};
+
 #ifndef FS_IMMUTABLE_FL
 #define FS_IMMUTABLE_FL			0x00000010 /* Immutable file */
 #endif
-- 
2.48.1.711.g2feabab25a-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
