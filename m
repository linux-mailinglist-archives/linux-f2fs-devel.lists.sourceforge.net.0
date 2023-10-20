Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 147EB7D061C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Oct 2023 03:22:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qteDW-0000rO-Ke;
	Fri, 20 Oct 2023 01:22:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qteDV-0000rI-Ra
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Oct 2023 01:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mp3m7Wck8Tj+/JZMkV3nskRyj8t4yVSOK4ORBNaBNco=; b=ZV/L2lyppHbxXS4XAGfbW3GXYn
 eJV+MaNspBn9Ze4s9p/Tp4d6onkS6bileoq5xPEg/z0lOwANeORk3Ozbx+Emngy9GAxs1JK84LBpj
 AjWLbDLUP1nibcCrTwebYgYhruVerhgxpo6i6MF5s8eGj06BPaEUKKd2JyoVca9d6IeA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Mp3m7Wck8Tj+/JZMkV3nskRyj8t4yVSOK4ORBNaBNco=; b=a
 GwNA3rVhSx0oTrlUXWLIKQCY4CR7TX0xh4NeFLEi/V22VsIKEbjzqePqOKfiSvdKcEPrn3aJxZVC+
 ilzAtR93D5uNPrOMPtafqDbI2a9FWHa9nMjLvdWsa3obw8zbWVBv0FCZ2jOpfXECy7vGYJ0fmbggO
 tBKuDzvl7WUUCgPY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qteDU-003siL-VQ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Oct 2023 01:22:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 77C5161C5D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 20 Oct 2023 01:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D46C433C8;
 Fri, 20 Oct 2023 01:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697764935;
 bh=bsUAFvciYZ5H5iM4IYuVPHhbmudSIbqO7L1aINivF3Y=;
 h=From:To:Cc:Subject:Date:From;
 b=f6M0Eolx0lmrHIW2yfDbpG+9r8eERp43RZoD7jNy8rMgVZtClnmjMMEIKdn2yVbuO
 ldzDQvczTJzKRA5aaNdyej9hdDW6DmfNAjp+8Uc4cxMBTUsUtmeIsN8jFJ6e6Msn2m
 dXgEuoN6Aop6MfNXP5y9cay4in/w1Vcj7FK4c9C3sJQ6+05HTjw1KnDx/N9cmNNIYz
 9+ANsgpXE9JrFmUG5+/+pvUbBM9EaFtw1Y/zFHRnbkOGWmxQb0vZp68dWVikJdRfHi
 aan5jTTXjhoXj6l75Sgmmhcz9PiaR4I0x1B6oaj9lUsrpY1+5AAHIWjzR8/PX4fO+X
 9klOH2Y+Z+5Kw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 19 Oct 2023 18:22:13 -0700
Message-ID: <20231020012213.2606422-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's add list/setattrs commands. Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org> --- tools/f2fs_io/f2fs_io.c | 88
 +++++++++++++++++++++++++++++++++++++++++ 1 file changed,
 88 insertions(+) diff --git a/tools/f2fs_io/f2fs_io.c
 b/tools/f2fs_io/f2fs_io.c
 index c812aa1458a2..a6a0de6d8dbd 100644 --- a/tools/f2fs_io/f2fs_io.c +++
 b/tools/f2fs_io/f2fs_io.c @@ -35,6 +35,7 @@ #include <termios.h [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qteDU-003siL-VQ
Subject: [f2fs-dev] [PATCH] f2fs_io: add list/setattr command
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

Let's add list/setattrs commands.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 88 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index c812aa1458a2..a6a0de6d8dbd 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -35,6 +35,7 @@
 #include <termios.h>
 #include <time.h>
 #include <unistd.h>
+#include <sys/xattr.h>
 
 #ifdef HAVE_CONFIG_H
 #include <config.h>
@@ -1526,6 +1527,91 @@ static void do_gc_range(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
+#define listxattr_desc "listxattr"
+#define listxattr_help "f2fs_io listxattr [file_path]\n\n"
+
+static void do_listxattr(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	char *buf, *key, *val;
+	ssize_t buflen, vallen, keylen;
+
+	if (argc != 2) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	buflen = listxattr(argv[1], NULL, 0);
+	if (buflen == -1) {
+		perror("listxattr");
+		exit(1);
+	}
+	if (buflen == 0) {
+		printf("%s has no attributes.\n", argv[1]);
+		exit(0);
+	}
+	buf = xmalloc(buflen);
+	buflen = listxattr(argv[1], buf, buflen);
+	if (buflen == -1) {
+		perror("listxattr");
+		exit(1);
+	}
+
+	key = buf;
+	while (buflen > 0) {
+		printf("%s: ", key);
+		vallen = getxattr(argv[1], key, NULL, 0);
+		if (vallen == -1) {
+			perror("getxattr");
+			exit(1);
+		}
+		if (vallen == 0) {
+			printf("<no value>");
+		} else {
+			val = xmalloc(vallen + 1);
+			vallen = getxattr(argv[1], key, val, vallen);
+			if (vallen == -1) {
+				perror("getxattr");
+				exit(1);
+			}
+			val[vallen] = 0;
+			printf("%s", val);
+			free(val);
+		}
+		printf("\n");
+		keylen = strlen(key) + 1;
+		buflen -= keylen;
+		key += keylen;
+	}
+	exit(0);
+}
+
+#define setxattr_desc "setxattr"
+#define setxattr_help "f2fs_io setxattr [name] [value] [file_path]\n\n"
+
+static void do_setxattr(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	int ret;
+
+	if (argc != 4) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	ret = setxattr(argv[3], argv[1], argv[2], strlen(argv[2]), XATTR_CREATE);
+	printf("setxattr %s CREATE: name: %s, value: %s: ret=%d\n",
+			argv[3], argv[1], argv[2], ret);
+	if (ret < 0 && errno == EEXIST) {
+		ret = setxattr(argv[3], argv[1], argv[2], strlen(argv[2]), XATTR_REPLACE);
+		printf("setxattr %s REPLACE: name: %s, value: %s: ret=%d\n",
+				argv[3], argv[1], argv[2], ret);
+	}
+	if (ret < 0)
+		perror("setxattr");
+	exit(0);
+}
+
 #define CMD_HIDDEN 	0x0001
 #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
 #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
@@ -1564,6 +1650,8 @@ const struct cmd_desc cmd_list[] = {
 	CMD(precache_extents),
 	CMD(move_range),
 	CMD(gc_range),
+	CMD(listxattr),
+	CMD(setxattr),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
-- 
2.42.0.655.g421f12c284-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
