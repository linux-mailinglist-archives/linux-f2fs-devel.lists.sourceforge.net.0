Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B317AA4B6FA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Mar 2025 04:47:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1towm3-0004JU-DI;
	Mon, 03 Mar 2025 03:47:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1towm2-0004JO-5e
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 03:47:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y9OP0ZNZ0DoXc13T1ZpphuL62ecH0C0VStuaemsevtE=; b=cb/biH7Yk4kRBNsz1U++ByMbiu
 +E2EHg2BGnpVJWYjBfOO3mmpMteO1jebBi88pNHG2JXZS0aXml0eJ8ixFKl694c42H31QgGMmTOho
 gNGSlvlvdE2AnWInDnCnne41C3wjj+sF37Qr5Fo2bd9MUc6vjmypahi/7NPT06mEoyl8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=y9OP0ZNZ0DoXc13T1ZpphuL62ecH0C0VStuaemsevtE=; b=k
 PvJhGIaa8NyJydw+OJy9SACh8hP8Cdcl/CL8aQ4E+2XOmZc5U0x2kX90jO4g3zYYxGqGaPX1QPpCf
 84iWKqh04lt0CjfjEN1BCk2EVRm+Mkekr+5YbClgaV//n0PwnLq4sYNs41hma7SUJdK+olEXaDUhn
 EkPc8gvAdmpJjOY0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1towlr-0006mk-Ro for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 03:47:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 939775C54F0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  3 Mar 2025 03:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23DEFC4CED6;
 Mon,  3 Mar 2025 03:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740973626;
 bh=BVBmcQAmVr/ur3DLIub5SstGY8DrlNsRhltWL/Vq42k=;
 h=From:To:Cc:Subject:Date:From;
 b=rok62VNcLKiPyovKiFHZ7zIVbdYCkutgj71TVsuDQYQC8KHXQE1QrL6ZxI5245Dce
 qNfORbAXWHcg3PIuTD3faM2F13M9TGim/BM/VdDHX51ZcYTXK3YGgkNcVXPVFXs/Sz
 O0ii0OIY2yayIN93WiVPRUW0rXnhwlvmGKDVWqTiMN/sV97iOYwjGoxHZsunT1yOaI
 C1GY+NBmv+mhNZskaklg0XfXqt0OCXbUp+F4pBJ/Z2JOeLtKXBSBP27lrme9B2dk9M
 PLRfT3wAxBPmNxqfJRTioK7gdAdv3aKqC/gDsDO/20nHACJUcCkkRJXGKWewXK/FfQ
 68Q8O7I4jt8ng==
To: jaegeuk@kernel.org
Date: Mon,  3 Mar 2025 11:46:58 +0800
Message-ID: <20250303034658.1355526-1-chao@kernel.org>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Support F2FS_NOLINEAR_LOOKUP_FLAG in f2fs_io {get, set,
 clear}flags.
 Signed-off-by: Chao Yu <chao@kernel.org> Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 --- man/f2fs_io.8 | 4 ++-- tools/f2fs_io/f2fs_io.c | 19 ++++++++++++++++---
 tools/f2fs_io/f2fs_io.h | 5 +++++ 3 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1towlr-0006mk-Ro
Subject: [f2fs-dev] [PATCH] f2fs_io: support F2FS_NOLINEAR_LOOKUP_FLAG
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Support F2FS_NOLINEAR_LOOKUP_FLAG in f2fs_io {get,set,clear}flags.

Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 man/f2fs_io.8           |  4 ++--
 tools/f2fs_io/f2fs_io.c | 19 ++++++++++++++++---
 tools/f2fs_io/f2fs_io.h |  5 +++++
 3 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
index 2ff22f7..97a893b 100644
--- a/man/f2fs_io.8
+++ b/man/f2fs_io.8
@@ -22,11 +22,11 @@ Get the flags associated with the specified file.
 .TP
 \fBsetflags\fR \fI[flag] [file]\fR
 Set an f2fs file on specified file.  The flag can be casefold,
-compression, nocompression, immutable, and nocow.
+compression, nocompression, immutable, nocow, and nolinear_lookup.
 .TP
 \fBclearflags\fR \fI[flag] [file]\fR
 Clear the specified flag on the target file, which can be compression,
- nocompression, immutable, and nocow.
+ nocompression, immutable, nocow, and nolinear_lookup.
 .TP
 \fBshutdown\fR \fIshutdown filesystem\fR
 Freeze and stop all IOs for the file system mounted on
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index fa01f8f..c0c54e2 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -240,7 +240,8 @@ static void do_set_verity(int argc, char **argv, const struct cmd_desc *cmd)
 "  casefold\n"							\
 "  compression\n"						\
 "  nocompression\n"						\
-"  immutable\n"
+"  immutable\n"							\
+"  nolinear_lookup\n"
 
 static void do_getflags(int argc, char **argv, const struct cmd_desc *cmd)
 {
@@ -304,6 +305,12 @@ static void do_getflags(int argc, char **argv, const struct cmd_desc *cmd)
 		printf("immutable");
 		exist = 1;
 	}
+	if (flag & F2FS_NOLINEAR_LOOKUP_FLAG) {
+		if (exist)
+			printf(",");
+		printf("nolinear_lookup");
+		exist = 1;
+	}
 	if (!exist)
 		printf("none");
 	printf("\n");
@@ -319,7 +326,8 @@ static void do_getflags(int argc, char **argv, const struct cmd_desc *cmd)
 "  compression\n"						\
 "  nocompression\n"						\
 "  immutable\n"							\
-"  nocow\n"
+"  nocow\n"							\
+"  nolinear_lookup\n"
 
 static void do_setflags(int argc, char **argv, const struct cmd_desc *cmd)
 {
@@ -349,6 +357,8 @@ static void do_setflags(int argc, char **argv, const struct cmd_desc *cmd)
 		flag |= FS_IMMUTABLE_FL;
 	else if (!strcmp(argv[1], "nocow"))
 		flag |= FS_NOCOW_FL;
+	else if (!strcmp(argv[1], "nolinear_lookup"))
+		flag |= F2FS_NOLINEAR_LOOKUP_FLAG;
 
 	ret = ioctl(fd, F2FS_IOC_SETFLAGS, &flag);
 	printf("set a flag on %s ret=%d, flags=%s\n", argv[2], ret, argv[1]);
@@ -363,7 +373,8 @@ static void do_setflags(int argc, char **argv, const struct cmd_desc *cmd)
 "  compression\n"						\
 "  nocompression\n"						\
 "  immutable\n"							\
-"  nocow\n"
+"  nocow\n"							\
+"  nolinear_lookup\n"
 
 static void do_clearflags(int argc, char **argv, const struct cmd_desc *cmd)
 {
@@ -391,6 +402,8 @@ static void do_clearflags(int argc, char **argv, const struct cmd_desc *cmd)
 		flag &= ~FS_IMMUTABLE_FL;
 	else if (!strcmp(argv[1], "nocow"))
 		flag &= ~FS_NOCOW_FL;
+	else if (!strcmp(argv[1], "nolinear_lookup"))
+		flag &= ~F2FS_NOLINEAR_LOOKUP_FLAG;
 
 	ret = ioctl(fd, F2FS_IOC_SETFLAGS, &flag);
 	printf("clear a flag on %s ret=%d, flags=%s\n", argv[2], ret, argv[1]);
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index 14c9dc1..c32def7 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -246,3 +246,8 @@ struct f2fs_comp_option {
 	u8 algorithm;
 	u8 log_cluster_size;
 };
+
+/* for F2FS_IOC_{GET,SET,CLEAR}_FLAGS_EX */
+enum {
+	F2FS_NOLINEAR_LOOKUP_FLAG = 0x08000000,
+};
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
