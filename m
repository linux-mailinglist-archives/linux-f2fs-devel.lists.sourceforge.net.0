Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 487C3A34CB9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Feb 2025 19:02:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tidXC-0000aG-3i;
	Thu, 13 Feb 2025 18:01:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tidXA-0000a2-FV
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Feb 2025 18:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q3PMBiP7Lh/PxcU1rUAlxxaDPxhMvsqacoNlOtuXYeM=; b=hOJAIr5+t+pPsjsY3RjGAd1L9Q
 Ifvww5btnT/gahPQFv3hpUCf+6aBrnLA3uKKlJnXWkO8N3igtOqY3p0O2X3YNgLvj1rZME+QbhN+f
 BV1cZnThDjwfWOu7sulxmQELVZCrt4SM/PoonfdfSwFR7X1U7gqXYeiM++B52aF+UQtU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q3PMBiP7Lh/PxcU1rUAlxxaDPxhMvsqacoNlOtuXYeM=; b=OrNwwx/UaOVyLAckN2Cbyjt8EH
 5yT+h5VClhoACFY7uumZ++jt+6jFP2rd+2tHjw9BTbpDo0idzuIIkNx1ZcV99//+tQlHKfSizV/wB
 esKxPiXIgDmVpShW/+w66M/DDiOo9Q46P6vi/aP7FHBDhE502HOAm7aUE1EpYEgZRnk4=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tidXA-0000Yc-H0 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Feb 2025 18:01:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 745C6A42856
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 13 Feb 2025 18:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066ABC4CED1;
 Thu, 13 Feb 2025 18:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739469705;
 bh=5Ht0aqGayuk3D3oNUAS+pLAdoWL0DVQmV9mJtV85wnw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VUcQQfuJzaas1cM00rgbJ9QMeWCQV0Ej+4fMjp/f4leqhJIUy7v/bqNrgeQ9hvj7S
 0VUPyOoRYCvF3hmq7PP6Ne+N2m9ufpe/qoSa4AGc7Dnwz5zABcrBpAkNQwuBrCNV0i
 Dawg0W4b3H45vDdkH8jDUA/AE2c9JShFhtccH7VSjebkb0s+oLDxi1EkiX2IhyDKOT
 FuWOnD9o2atRloqCKK2I/LZF/txxsgpdxy2qmNIQUt2h/HZ2Boi/3bHV8ZrC/Tq/6F
 xZOIoWIvY8nh67dGGqypV2ZLodU6gXUk5VB6G5/i8MtKSTV0mmoJ6pEw9BVl4Ui5Om
 g4zEElxkMJwog==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 13 Feb 2025 18:01:41 +0000
Message-ID: <20250213180142.1366047-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
In-Reply-To: <20250213180142.1366047-1-jaegeuk@kernel.org>
References: <20250213180142.1366047-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -4.0 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This adds a command to call ioctl(F2FS_IOC_IO_PRIO).
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- tools/f2fs_io/f2fs_io.c | 35
 +++++++++++++++++++++++++++++++++++
 tools/f2fs_io/f2fs_io.h | 7 +++++++ 2 files changed, 42 insertions(+) 
 Content analysis details:   (-4.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tidXA-0000Yc-H0
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
 tools/f2fs_io/f2fs_io.c | 35 +++++++++++++++++++++++++++++++++++
 tools/f2fs_io/f2fs_io.h |  7 +++++++
 2 files changed, 42 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index e7ad22e08ba5..c4a0a6c4cf85 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -485,6 +485,40 @@ static void do_fadvise(int argc, char **argv, const struct cmd_desc *cmd)
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
 "f2fs_io pinfile [get|set|unset] [file]\n\n"			\
@@ -1941,6 +1975,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(removexattr),
 	CMD(lseek),
 	CMD(get_advise),
+	CMD(ioprio),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index 14c9dc1fda46..f2d0a0827ca5 100644
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
2.48.1.601.g30ceb7b040-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
