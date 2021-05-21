Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C529C38CDD4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 May 2021 21:00:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lkANv-000690-3h; Fri, 21 May 2021 19:00:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lkANs-00068m-TV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 May 2021 19:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LQgtC2t1FtI7a7H+ltUX65dtcyDE6YSLW6Sic9BRZs4=; b=El5i9bRFYFsA8L06MpxacWWsUB
 PnAe0qltMng81sDSKjnE6I9yqVcRZVYwXvWe17nQQijT/pT5NZKoTdArPAyFuwGw4Wz2KXk+69FdX
 wSiPvwVyBW1MvPTvl1xLmS7XF1hAw0MmzVK+19UdbW2WYh0LEYDUjEwEfXmrF/AVTLAQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LQgtC2t1FtI7a7H+ltUX65dtcyDE6YSLW6Sic9BRZs4=; b=d
 Z61SKaA2sOJa25W0XKfZXlDl90PAWIuXgiyM10DnKCD557Z1XI/xqDtVrILlPvVvpdH25A7yWsiC2
 2OaTkFDXd48etSw0/000yfX+pJ6qdbCGO4srRjKCt+LClw9jpjMY1K9PNHb/4/bGBE+brX+TfFe/B
 zQPmLBahlh6zMtqg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lkANl-000gIu-Aa
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 May 2021 19:00:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F4A761244;
 Fri, 21 May 2021 19:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621623617;
 bh=t9RDAo8jm5ZgVpoUEYuQtZOyzEFQpNpbg7eqcxxT/+s=;
 h=From:To:Cc:Subject:Date:From;
 b=qBKv5NmClLFh9YnG9a1uMsZp/UDR16fDTigg6Lz3y0IKy+S/WgUpwPzq1eoKuuoEt
 /z5mBrjkRf0aaAV1ef/2clTPhdmlhC39Zu7f4HgQffYPNRIEMCjlzQ+4MFlV9ovETR
 DsBDAyu05v+Lu9NCXOIELpPTjttfqGiZl4qFgvi9u8NNuOG3QV9LSGNgQAU0YECbIl
 eVRa3ME0WW19szMTWm9w1IZHuPmQFYHtMw63B+e1F847lt5P6uZoUbbEr5rKJovTpT
 ZUKxbQ5P0dVkgpW9iDfWB6s8MtOsnFCtZqBqJHUXcsp962rjv5wxSLjEjpr+3/tttb
 PVT2wJ0uvMMuw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 21 May 2021 12:00:04 -0700
Message-Id: <20210521190005.2483242-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lkANl-000gIu-Aa
Subject: [f2fs-dev] [PATCH 1/2] f2fs_io: add to show immutable bit
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

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index fa7d3f5e4b36..aa1a7e4dd623 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -213,7 +213,8 @@ static void do_set_verity(int argc, char **argv, const struct cmd_desc *cmd)
 "  verity\n"							\
 "  casefold\n"							\
 "  compression\n"						\
-"  nocompression\n"
+"  nocompression\n"						\
+"  immutable\n"
 
 static void do_getflags(int argc, char **argv, const struct cmd_desc *cmd)
 {
@@ -271,6 +272,12 @@ static void do_getflags(int argc, char **argv, const struct cmd_desc *cmd)
 		printf("nocow(pinned)");
 		exist = 1;
 	}
+	if (flag & FS_IMMUTABLE_FL) {
+		if (exist)
+			printf(",");
+		printf("immutable");
+		exist = 1;
+	}
 	if (!exist)
 		printf("none");
 	printf("\n");
@@ -284,7 +291,8 @@ static void do_getflags(int argc, char **argv, const struct cmd_desc *cmd)
 "flag can be\n"							\
 "  casefold\n"							\
 "  compression\n"						\
-"  nocompression\n"
+"  nocompression\n"						\
+"  noimmutable\n"
 
 static void do_setflags(int argc, char **argv, const struct cmd_desc *cmd)
 {
@@ -310,6 +318,8 @@ static void do_setflags(int argc, char **argv, const struct cmd_desc *cmd)
 		flag |= FS_COMPR_FL;
 	else if (!strcmp(argv[1], "nocompression"))
 		flag |= FS_NOCOMP_FL;
+	else if (!strcmp(argv[1], "noimmutable"))
+		flag &= ~FS_IMMUTABLE_FL;
 
 	ret = ioctl(fd, F2FS_IOC_SETFLAGS, &flag);
 	printf("set a flag on %s ret=%d, flags=%s\n", argv[2], ret, argv[1]);
-- 
2.31.1.818.g46aad6cb9e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
