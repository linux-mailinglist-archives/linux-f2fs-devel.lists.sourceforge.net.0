Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72540A34CBA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Feb 2025 19:02:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tidXB-0006g2-3b;
	Thu, 13 Feb 2025 18:01:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tidX9-0006fu-Pp
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Feb 2025 18:01:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=etkomFXr4/IuIcI4nHoogOxKooxq2q9LY3Zkr/OSmOo=; b=C11cfH0BbmqMc2Qc8Pr396LGHr
 lxiX/pkbyh3xQh2QHqjV4q87g8SoZDxWUDztwGd28dVXYev2TqUsx5VmJ2SczstQUYhBrmIZhRWtf
 8Rcs+v+WcSD9mIHTusSzi6lZCifEpTVxmxex7Ipa4zV1VfEjgQJdisVmq1eNZ6lM4ja4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=etkomFXr4/IuIcI4nHoogOxKooxq2q9LY3Zkr/OSmOo=; b=R
 X5qcVBmyUMOLQphCPvbhXblgFp4p5luoMSvKIKtUMof1CYwmBIQLD89L1gXtvHEjYvAZyxBG+Wq4b
 /i846WmPku6bxa4G9A0zSR2JLhsJ6NG88owbrfsj2Kb18siU6RmY7AYmYkBFk2moHWUbxzrE6v+V0
 BixHWP64B9IIgFxY=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tidX9-0000YX-1q for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Feb 2025 18:01:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1ABCCA42821
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 13 Feb 2025 17:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F74C4CED1;
 Thu, 13 Feb 2025 18:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739469704;
 bh=Q+OW2aGUNBqv2QBKefyntT017Lfwys1/4EA4EGN3rXQ=;
 h=From:To:Cc:Subject:Date:From;
 b=SxwPjd1c0aICOqFsiiVB1vgiSO3XFbnUQZKSQiYJdVNSt6ke7lnkr4Q/xvGH8seA8
 9adgl2lG0NEsz+Bwkz0hCyA/dNdayCGFwVAhmBsMA2xQ8dNhLDBVuMhsAO9pJ4aCF/
 eJb8CZPAYlL33ZSMGDFMsKlI9bE0GO35dguMS8U8jYoshGyBZgIq6wqNL19+6Sb+4V
 VFTpGJVpwHo6Kp3X/VuuNL5HRruUJwRJQ2eUuni0+946Ru0fr+7s0pzG0Clf1l1Rug
 Rfa4nvVpxj2cQWy+3sS1TWlU+s4IYPP1RyIePDYySzz5nBSBeafaBJH8Av7DBqB8/k
 I7sc6O8624GWw==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 13 Feb 2025 18:01:40 +0000
Message-ID: <20250213180142.1366047-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
MIME-Version: 1.0
X-Spam-Score: -4.0 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 tools/f2fs_io/f2fs_io.c | 9 +++++++++ 1 file changed,
 9 insertions(+) diff --git a/tools/f2fs_io/f2fs_io.c
 b/tools/f2fs_io/f2fs_io.c index fa01f8fd4809..e7ad22e08ba5 100644 ---
 a/tools/f2fs_io/f2fs_io.c
 +++ b/tools/f2fs_io/f2fs_io.c @@ -441,7 +441,10 @@ static void do_s [...]
 Content analysis details:   (-4.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tidX9-0000YX-1q
Subject: [f2fs-dev] [PATCH 1/2] f2fs_io: support fadvise dontneed, random,
 and noreuse
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

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index fa01f8fd4809..e7ad22e08ba5 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -441,7 +441,10 @@ static void do_shutdown(int argc, char **argv, const struct cmd_desc *cmd)
 "fadvice given the file\n"					\
 "advice can be\n"						\
 " willneed\n"							\
+" dontneed\n"							\
+" noreuse\n"							\
 " sequential\n"							\
+" random\n"							\
 
 static void do_fadvise(int argc, char **argv, const struct cmd_desc *cmd)
 {
@@ -458,8 +461,14 @@ static void do_fadvise(int argc, char **argv, const struct cmd_desc *cmd)
 
 	if (!strcmp(argv[1], "willneed")) {
 		advice = POSIX_FADV_WILLNEED;
+	} else if (!strcmp(argv[1], "dontneed")) {
+		advice = POSIX_FADV_DONTNEED;
+	} else if (!strcmp(argv[1], "noreuse")) {
+		advice = POSIX_FADV_NOREUSE;
 	} else if (!strcmp(argv[1], "sequential")) {
 		advice = POSIX_FADV_SEQUENTIAL;
+	} else if (!strcmp(argv[1], "random")) {
+		advice = POSIX_FADV_RANDOM;
 	} else {
 		fputs("Wrong advice\n\n", stderr);
 		fputs(cmd->cmd_help, stderr);
-- 
2.48.1.601.g30ceb7b040-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
