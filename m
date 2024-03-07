Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BE2874829
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Mar 2024 07:29:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ri7G5-00037v-Tc;
	Thu, 07 Mar 2024 06:29:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ri7G4-00037p-6W
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Mar 2024 06:29:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xHFGfne+Zx1m1xWv+wVYn6qo8V9+BZX84PPGKT2Ww2M=; b=ErdAS+1BitDqF0hILOaQTyJ79t
 jj/5LbPVZEtp9eR1QORyXxeAXqOgiYoIiJpV1HsXirwzsVoU3eQVYoRPl/KRuVHKghCvuZSA+0DQ8
 px4F56M5P+PF40/WKH+87JfMKs/wFK6JvAtD9kOZDqNQt8uW4EvlKRivXHzjZtIWfP0M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xHFGfne+Zx1m1xWv+wVYn6qo8V9+BZX84PPGKT2Ww2M=; b=R
 AJ1KzoatpkazqYzdEbayBuNzUd72J/RfnNOVmegWWxJravdrK24ra1n9FrPNb4k+yib9/8lcBt7h+
 l49ZprVkbJFRGvaQpvy1+lsIhPJHQgaWwTgfktUN4rnKsbBe8nR5vwVSQDqKc3bpQHLqlX969Xlf7
 74/EoOzY+Kc7zGn8=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ri7Fv-0001vA-WA for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Mar 2024 06:29:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6ADD6CE2418
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  7 Mar 2024 06:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84843C433C7;
 Thu,  7 Mar 2024 06:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709792961;
 bh=Pyf0sBf1M+zVbXfkJWnm6kmcU9kViiN95ISPGFo1Az8=;
 h=From:To:Cc:Subject:Date:From;
 b=lYzVi+kJvsKuTy0kVKljzBrcxJfm1qdpo9Q2pj2PJfWFxvysvNnjIfGd4s/hwddGg
 RwolmNkRc9htu5E3H9Py7huWjm16zRB3SS/wk2E7aZgd4uBTjEiUi30IRfG9XE9vel
 xc4BKgoLHMkDgUajPNfQg2kNMpciFeRMpsJRAlnl2IU2PrCaTNNbUSajpLQtE6ZuqM
 JTGmL4DB3upIH66dLZhRunt5pZJHn70NPY652RFgqc4C7WC+NdASy34gOzYFUQ4RvV
 vFqbOMe4ZOmYa7V1IXRPfzmpLRxCBTK3a+gYHBOriSsrCYivf5CxXXIu3mkjRZVmPb
 TzV9Z5gVHTKHg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu,  7 Mar 2024 14:29:13 +0800
Message-Id: <20240307062913.3259249-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Support get_advise command to get i_advise field value and
 info in file. For example: f2fs_io get_advise /mnt/f2fs/foo.so i_advise=0x11, 
 advise_type: cold keep_size Signed-off-by: Chao Yu <chao@kernel.org> ---
 man/f2fs_io.8 | 3 +++ tools/f2fs_io/f2fs_io.c | 41
 +++++++++++++++++++++++++++++++++++++++++
 tools/f2fs_io/f2fs_io.h | 6 ++++++ 3 files changed, 50 inserti [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ri7Fv-0001vA-WA
Subject: [f2fs-dev] [PATCH] f2fs_io: support get_advise command
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Support get_advise command to get i_advise field value and info
in file.

For example:
f2fs_io get_advise /mnt/f2fs/foo.so
i_advise=0x11, advise_type: cold keep_size

Signed-off-by: Chao Yu <chao@kernel.org>
---
 man/f2fs_io.8           |  3 +++
 tools/f2fs_io/f2fs_io.c | 41 +++++++++++++++++++++++++++++++++++++++++
 tools/f2fs_io/f2fs_io.h |  6 ++++++
 3 files changed, 50 insertions(+)

diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
index ecaab02..f097bde 100644
--- a/man/f2fs_io.8
+++ b/man/f2fs_io.8
@@ -171,6 +171,9 @@ Move a range of data blocks from source file to destination file
 .TP
 \fBgc_range\fR \fI[sync_mode] [start in 4kb] [length in 4kb] [file]\fR
 Trigger gc to move data blocks from specified address range
+.TP
+\fBget_advise\fR \fI[file]\fR
+Get i_advise value and info in file
 .SH AUTHOR
 This version of
 .B f2fs_io
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 7059cbf..b8e4f02 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -1743,6 +1743,46 @@ static void do_lseek(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
+#define get_advise_desc "get_advise"
+#define get_advise_help "f2fs_io get_advise [file_path]\n\n"
+
+static void do_get_advise(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	int ret;
+	unsigned char value;
+
+	if (argc != 2) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	ret = getxattr(argv[1], F2FS_SYSTEM_ADVISE_NAME, &value, sizeof(value));
+	if (ret != sizeof(value)) {
+		perror("getxattr");
+		exit(1);
+	}
+
+	printf("i_advise=0x%x, advise_type: ", value);
+	if (value & FADVISE_COLD_BIT)
+		printf("cold ");
+	if (value & FADVISE_LOST_PINO_BIT)
+		printf("lost_pino ");
+	if (value & FADVISE_ENCRYPT_BIT)
+		printf("encrypt ");
+	if (value & FADVISE_ENC_NAME_BIT)
+		printf("enc_name ");
+	if (value & FADVISE_KEEP_SIZE_BIT)
+		printf("keep_size ");
+	if (value & FADVISE_HOT_BIT)
+		printf("hot ");
+	if (value & FADVISE_VERITY_BIT)
+		printf("verity ");
+	if (value & FADVISE_TRUNC_BIT)
+		printf("trunc ");
+	printf("\n");
+}
+
 #define CMD_HIDDEN 	0x0001
 #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
 #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
@@ -1786,6 +1826,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(setxattr),
 	CMD(removexattr),
 	CMD(lseek),
+	CMD(get_advise),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index d2641cb..b5c82f5 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -169,7 +169,13 @@ struct fscrypt_get_policy_ex_arg {
 
 #define F2FS_SYSTEM_ADVISE_NAME	"system.advise"
 #define FADVISE_COLD_BIT	0x01
+#define FADVISE_LOST_PINO_BIT	0x02
+#define FADVISE_ENCRYPT_BIT	0x04
+#define FADVISE_ENC_NAME_BIT	0x08
+#define FADVISE_KEEP_SIZE_BIT	0x10
 #define FADVISE_HOT_BIT		0x20
+#define FADVISE_VERITY_BIT	0x40
+#define FADVISE_TRUNC_BIT	0x80
 
 #ifndef FS_IMMUTABLE_FL
 #define FS_IMMUTABLE_FL			0x00000010 /* Immutable file */
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
