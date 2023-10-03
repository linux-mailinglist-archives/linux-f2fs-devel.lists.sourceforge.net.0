Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 058AD7B7418
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Oct 2023 00:29:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qnnsu-0007rI-TV;
	Tue, 03 Oct 2023 22:28:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qnnsu-0007r7-98
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Oct 2023 22:28:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VtXk0q1dW4apf0lkD+iCSv/hG2VuOQbJfoWQcuC4RVw=; b=GtxBm2vHJXGIxnLmVNve0mKEGJ
 zk/XvL27HEFEn1RWP9J0QfbOQobA/PlJal83vg41blzlMGCjeSXoECJW5hMW4SFShhybWpk0C7dn8
 ezy/owfGOXqR2qd0ludNSxyIyuphBASBFkGLhp0Nhks3Ld5yx6mRctlwdn/V+nzas+7o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VtXk0q1dW4apf0lkD+iCSv/hG2VuOQbJfoWQcuC4RVw=; b=Q
 rloH29XP5xzIQd21dCdWuKUeVx4zUEYMJud+DKRB0VrsoMfkLIhulAD+p71h/QRroPd9TMLvsibHS
 j3i4DYbmUtd7+asZGJFr4Hp+FFD7Aa6bDf8j+4WHqbk2rAdBrt1sLj2Eny0YVIFPsZyAVuWjtS9uT
 4ZMfKjb3rw8yQ1fc=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qnnss-000KNm-7i for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Oct 2023 22:28:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0DF7FCE1872
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  3 Oct 2023 22:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF86C433C8;
 Tue,  3 Oct 2023 22:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696372121;
 bh=N7lpjVxCT2HHss06sE+LBGaCr6O03DDYpLf/qa9iClk=;
 h=From:To:Cc:Subject:Date:From;
 b=eS9Mymnj+uJb60NriPUPF7Z0q+HOSldV0CeeGxAFpFEKQ0vvRK+HxY0V4l3LWiTXj
 4WTz+gafxUMw0zYHndQ+ImEbOpzYQY558F7WWSu3Xdew1z1IlqoKaNOt3ixDYV8VFy
 TlFM118qo6FC/4cLTOWRTHmXV8PgTZCPJIm1JAL+sUvkc4HPZJAPWUpn6eNtJtdp00
 8/tlxHB4u0Ek+rIFufljupgAA2xXJ/O5ur033kerMpi2DZPIHldMRWhG0ommk8OSzg
 XGmXF+YOZncWlHDQOYVu2uR5aHM8yuThxtH/yuGKbc+vbaMXt/n/zLVO6ODhZz5kvZ
 fGMA3DyEKBntw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  3 Oct 2023 15:28:39 -0700
Message-ID: <20231003222839.1912717-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs_io fadvise [advice] [offset] [length] [file] advice can
 be "willneed" and "sequential". Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 --- man/f2fs_io.8 | 3 +++ tools/f2fs_io/f2fs_io.c | 42
 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qnnss-000KNm-7i
Subject: [f2fs-dev] [PATCH] f2fs_io: add fadvise support
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs_io fadvise [advice] [offset] [length] [file]

advice can be "willneed" and "sequential".

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 man/f2fs_io.8           |  3 +++
 tools/f2fs_io/f2fs_io.c | 42 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
index 99e31dd5dbd4..ecaab029d48e 100644
--- a/man/f2fs_io.8
+++ b/man/f2fs_io.8
@@ -47,6 +47,9 @@ going down with fsck mark
 \fBpinfile\fR \fI[get|set] [file]\fR
 Get or set the pinning status on a file.
 .TP
+\fBfadvise\fR \fI[advice] [offset] [length] [file]\fR
+Pass an advice to the specified file. The advice can be willneed and sequential.
+.TP
 \fBfallocate\fR \fI[-c] [-i] [-p] [-z] [keep_size] [offset] [length] [file]\fR
 Request that space be allocated on a file.  The
 .I keep_size
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 1f6549b46746..c812aa1458a2 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -398,6 +398,47 @@ static void do_shutdown(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
+#define fadvise_desc "fadvise"
+#define fadvise_help						\
+"f2fs_io fadvise [advice] [offset] [length] [file]\n\n"		\
+"fadvice given the file\n"					\
+"advice can be\n"						\
+" willneed\n"							\
+" sequential\n"							\
+
+static void do_fadvise(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	int fd, advice;
+	off_t offset, length;
+
+	if (argc != 5) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	fd = xopen(argv[4], O_RDWR, 0);
+
+	if (!strcmp(argv[1], "willneed")) {
+		advice = POSIX_FADV_WILLNEED;
+	} else if (!strcmp(argv[1], "sequential")) {
+		advice = POSIX_FADV_SEQUENTIAL;
+	} else {
+		fputs("Wrong advice\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	offset = atoi(argv[2]);
+	length = atoll(argv[3]);
+
+	if (posix_fadvise(fd, offset, length, advice) != 0)
+		die_errno("fadvise failed");
+
+	printf("fadvice %s to a file: %s\n", argv[1], argv[4]);
+	exit(0);
+}
+
 #define pinfile_desc "pin file control"
 #define pinfile_help						\
 "f2fs_io pinfile [get|set] [file]\n\n"			\
@@ -1499,6 +1540,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(clearflags),
 	CMD(shutdown),
 	CMD(pinfile),
+	CMD(fadvise),
 	CMD(fallocate),
 	CMD(erase),
 	CMD(write),
-- 
2.42.0.582.g8ccd20d70d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
