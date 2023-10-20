Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9DE7D0689
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Oct 2023 04:40:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qtfQo-0005ju-Os;
	Fri, 20 Oct 2023 02:40:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qtfQk-0005jb-Lq
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Oct 2023 02:40:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NwQf5KbdQheT71fcog7xLmBrciaymRvPgq3sihow3qQ=; b=WMgjrfvRl+sXVzLHjLNuOJPXON
 U6X8uJpD4ZrbjvWnE5twSuaRK1MFs2Rq4bhB5uxAu1sgd/XRUxurZWvWemFA7+Evwk/TvBrAJOegm
 OMDqPOGNVNjGrA1pROWzF5IY6IVZpLzGNSeS9vP27UAjAxtHC8u5eRzAFAInxvPRuylQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NwQf5KbdQheT71fcog7xLmBrciaymRvPgq3sihow3qQ=; b=IAmxG+rMk3f29Dc9/juyDvZgQx
 iLuR2ErOpkAectMViA8xt/jLtye8zjzULNQ+Zf7JXASQYzSZ/Rghbl4nOkb18DDYM/ZXwyeoyvL75
 65b+D4OrW0t6KZS72xzevsPm9zgZS7brnwCGp3oBsgBeB3chmoEMaOzDCAn+ItEK8ZXE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qtfQh-0006rD-Dm for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Oct 2023 02:40:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CC7866152C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 20 Oct 2023 02:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7653AC433C8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 20 Oct 2023 02:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697769594;
 bh=pShlm2SzYGBDwuulpbboRW792NZmEYMM8Ftcvf8t+v8=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=eVxQ2jn4LB4c8dWTyHMl0G/zvHY93u1uKslIo1dUK0399nNrTeauGVA2qRltVjWEf
 zy8k0TZwfRhWV47I1w9TbS7x8ipuW5Wm/Y7Tzl8eO+/ammxex2B3EzVWFc8XCCpjZp
 OBlbQiBksNXvljTf4uWJsOGpE9N73ZDYpePp3DaLEu/1g/qCR3HBLGicsRD2q9BuwZ
 gbVB8rPq+Gdss66HH9bOlkg6lLUyDuTcHTg+GAnAwkkq3H4ZpyDcvKdzbHh+RsxcNM
 qUf4v6weuIdCNnhwMVMUpF8jUvVCeWJLqNa5czaGO6cZMM9lJNW6PcN9/6f6/lwXaa
 PQ00Kz9ael7Ig==
Date: Thu, 19 Oct 2023 19:39:52 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <ZTHoeBTX7SlbIxOg@google.com>
References: <20231020012213.2606422-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231020012213.2606422-1-jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's add list/set/removexattrs commands. Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- - add removexattrs 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qtfQh-0006rD-Dm
Subject: Re: [f2fs-dev] [PATCH v2] f2fs_io: add list/setattr command
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's add list/set/removexattrs commands.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 - add removexattrs

 tools/f2fs_io/f2fs_io.c | 107 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index c812aa1458a2..e7d286a67939 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -35,6 +35,7 @@
 #include <termios.h>
 #include <time.h>
 #include <unistd.h>
+#include <sys/xattr.h>
 
 #ifdef HAVE_CONFIG_H
 #include <config.h>
@@ -1526,6 +1527,109 @@ static void do_gc_range(int argc, char **argv, const struct cmd_desc *cmd)
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
+#define removexattr_desc "removexattr"
+#define removexattr_help "f2fs_io removexattr [name] [file_path]\n\n"
+
+static void do_removexattr(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	int ret;
+
+	if (argc != 3) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	ret = removexattr(argv[2], argv[1]);
+	printf("removexattr %s REMOVE: name: %s: ret=%d\n", argv[1], argv[2], ret);
+	exit(0);
+}
+
 #define CMD_HIDDEN 	0x0001
 #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
 #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
@@ -1564,6 +1668,9 @@ const struct cmd_desc cmd_list[] = {
 	CMD(precache_extents),
 	CMD(move_range),
 	CMD(gc_range),
+	CMD(listxattr),
+	CMD(setxattr),
+	CMD(removexattr),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
-- 
2.42.0.655.g421f12c284-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
