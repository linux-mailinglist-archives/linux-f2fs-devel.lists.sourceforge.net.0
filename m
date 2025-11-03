Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5019DC2A2BF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 03 Nov 2025 07:24:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nVJzlKkLfSG3C0v0iNSdwKrk4LUq2Z8z6uGCJfwqQEk=; b=UvkP3ANrFfavjDLkf+/Ktr8AiQ
	pqh1De3kxYWH8ENsmoWLovjUyTKZt1CN/KYvb3sc8IYPnlnYTnBVjNtTDf/fpJUTqpNeQQ6zTjOV1
	FklJs5hLe4jRkrCWiZtyPSEZUgDyvbo375aXtpSiKcxznfCK5oEd0M98plrGeAPYYmg4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vFnzq-0001HO-AS;
	Mon, 03 Nov 2025 06:24:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vFnzo-0001HA-Vg
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 06:24:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y9pL3sr9wEO+U8XXpmsWSLDBxeJgNhfr+QOIcf23zSw=; b=k9sQJkq0qLa0vOeU1J3Nv2E9SU
 M+bDYmE4soXJUhg+oWi4c7qWOcy11kPSTG5ecScSzxgvF0K5ow5eRSF3VGXc5gSQD7ebBsLHD5au/
 t7qpp8HJST3BVqvu55FbNhr5SpP7bx+NvY9/0msULYfF4yZyh1CcgKtiXMZMlAAaXlT0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=y9pL3sr9wEO+U8XXpmsWSLDBxeJgNhfr+QOIcf23zSw=; b=d
 gGYd2rGq+AKaYugl71I3SIDIqPh3rMIFq7avbFbfpnfN32iXqFFSOkBQkdjvdLzyYt4PXeJaN4mnj
 05QiBE4bt2l35a1athMdWGm4EefN2dJ7GEZVKqglgvfkb8Fiho+l7a0SNkyy+oS17j5PZj3oM+kj/
 SAk+SHxYk5VYju18=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vFnzp-0007TF-B9 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 06:24:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A744860234
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  3 Nov 2025 06:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73ABFC4CEE7;
 Mon,  3 Nov 2025 06:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762151082;
 bh=+H7uwdUUAo7JOSeNKZN3IHapyZpHxcs2ON2Dsh2UtDw=;
 h=From:To:Cc:Subject:Date:From;
 b=OPuZZ1QFTF7vzCR4B1R7hRZYgTWcmjaTH4sSpVCWzAwHndBd5aYdWKWWaal3yNunu
 yvG+8aIkpzuUVFdIS2G91WjNOlVyxpTrh0a3mh/Mf2AtwnxGgQeHh6JqJQX5L4q5+2
 29SBHDlCrYpaLlppX4wE1zRbVSi2IaV74V7v4rzCQZRKEU61FpvDHdBdQ0t7gWicKt
 eKXX+gAWrSyFHF2Ra/xUq4RgKp8AtPEFVFexsLc66i8328NJUqxugjQL8PtV0OVG4B
 p0d1ZoFS9b4f6QetjNhr0aZ6Oj74sdrSW8xT84otq2miGIVFhzSLvlbt3ztLu7R7v9
 pDe+4fVb3hFFQ==
To: jaegeuk@kernel.org
Date: Mon,  3 Nov 2025 14:22:56 +0800
Message-ID: <20251103062256.2657698-1-chao@kernel.org>
X-Mailer: git-send-email 2.51.2.997.g839fc31de9-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Support to freeze and thaw filesystem. Signed-off-by: Chao
 Yu <chao@kernel.org> --- man/f2fs_io.8 | 6 ++++++ tools/f2fs_io/f2fs_io.c
 | 48 +++++++++++++++++++++++++++++++++++++++++ 2 files changed,
 54 insertions(+)
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vFnzp-0007TF-B9
Subject: [f2fs-dev] [PATCH] f2fs_io: support freeze/thaw
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

Support to freeze and thaw filesystem.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 man/f2fs_io.8           |  6 ++++++
 tools/f2fs_io/f2fs_io.c | 48 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
index 708a583..5c3d204 100644
--- a/man/f2fs_io.8
+++ b/man/f2fs_io.8
@@ -215,6 +215,12 @@ Initialized to create files only.
 .B -v
 Verbose mode.
 .RE
+.TP
+\fBfreeze\fR \fI[directory]\fR
+Freeze filesystem that directory belongs to.
+.TP
+\fBthaw\fR \fI[directory]\fR
+Thaw filesystem that directory belongs to.
 .SH AUTHOR
 This version of
 .B f2fs_io
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 9baea2b..1f26c7c 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -2454,6 +2454,52 @@ static void do_test_lookup_perf(int argc, char **argv, const struct cmd_desc *cm
 	exit(0);
 }
 
+#define freeze_desc "freeze filesystem"
+#define freeze_help "f2fs_io freeze [directory_path]\n\n"
+
+static void do_freeze(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	int ret, fd;
+
+	if (argc != 2) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	fd = xopen(argv[1], O_DIRECTORY, 0);
+
+	ret = ioctl(fd, FIFREEZE);
+	if (ret < 0)
+		die_errno("FIFREEZE failed");
+
+	printf("freeze filesystem ret=%d\n", ret);
+	exit(0);
+}
+
+#define thaw_desc "thaw filesystem"
+#define thaw_help "f2fs_io thaw [directory_path]\n\n"
+
+static void do_thaw(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	int ret, fd;
+
+	if (argc != 2) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	fd = xopen(argv[1], O_DIRECTORY, 0);
+
+	ret = ioctl(fd, FITHAW);
+	if (ret < 0)
+		die_errno("FITHAW failed");
+
+	printf("thaw filesystem ret=%d\n", ret);
+	exit(0);
+}
+
 #define CMD_HIDDEN 	0x0001
 #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
 #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
@@ -2504,6 +2550,8 @@ const struct cmd_desc cmd_list[] = {
 	CMD(ftruncate),
 	CMD(test_create_perf),
 	CMD(test_lookup_perf),
+	CMD(freeze),
+	CMD(thaw),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
