Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB8221642C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jul 2020 04:53:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jsdjh-0000b7-GA; Tue, 07 Jul 2020 02:53:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jsdjf-0000av-Gj
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jul 2020 02:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6Muef5ZMAEojM7eaD2RMq99cLR5KiDK8RqkYT0tfPwQ=; b=Df+MW2OXzXZGk0HKHz18QqjY4G
 B5JTun9/KNxOYIqZoC/gobRdnMQZAx8hdYFf63qyoLbf92eaCBvWlr+1XihPWFx+IKVGitxfnyW2c
 4jE1Kvps0s0ty6zCOQeMneVQp47gy9v/lr2ZJae826B/Z5h4WmjLXHc8NbaraX2vRZQU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6Muef5ZMAEojM7eaD2RMq99cLR5KiDK8RqkYT0tfPwQ=; b=X
 4AeQ6dn5QzE/M58NfgFZbk/0H5P3ulsn1y3S0LZgJzLqSm5UrepARtLAr/ecD+wtZHflz8IIv0wiv
 z6YBW9M0XOjO2FpqxxjPtHX1X+4xfOadP5dCiFwOSFAgmZLS6f3/EGHc7JZeDxwo9QvwOYRftya98
 dHrjQk1tKuMlPEdg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jsdjb-009obK-UO
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jul 2020 02:53:31 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 904F4206E2;
 Tue,  7 Jul 2020 02:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594090390;
 bh=LaU+0ZYM10OLtJaGJeV0gSGOzB+lm3E8uqIIBigwAxQ=;
 h=From:To:Cc:Subject:Date:From;
 b=EEPaJCX2PoWuGAeKyyCJGVjUwLRr+2/jP9occ0NLz2F6RFVpVd6YKP5qX2jyUuX3W
 SMi6rpCzvIhG4LO+PHzse39VsfiyLZYGOct/ga5xKdNu83NxdCpsTH74Znwmo9C6wZ
 aLkAg1QOTWZ0jQjwvLyS7nYU1qjmQ9PnK5Jq4lxI=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  6 Jul 2020 19:53:09 -0700
Message-Id: <20200707025309.3124296-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jsdjb-009obK-UO
Subject: [f2fs-dev] [PATCH] dump.f2fs: dump symlink contents in lost_found
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

Let's allow to show symlink path.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/dump.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index 001b7cb..e472eb7 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -424,7 +424,8 @@ static void dump_file(struct f2fs_sb_info *sbi, struct node_info *ni,
 		return;
 	}
 
-	if (!S_ISREG(imode) || namelen == 0 || namelen > F2FS_NAME_LEN) {
+	if ((!S_ISREG(imode) && !S_ISLNK(imode)) ||
+				namelen == 0 || namelen > F2FS_NAME_LEN) {
 		MSG(force, "Not a regular file or wrong name info\n\n");
 		return;
 	}
-- 
2.27.0.383.g050319c2ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
