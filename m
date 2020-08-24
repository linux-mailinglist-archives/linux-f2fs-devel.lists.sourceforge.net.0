Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E338250B50
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Aug 2020 00:03:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kAKZB-0002bR-KN; Mon, 24 Aug 2020 22:03:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kAKZ9-0002bK-U6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Aug 2020 22:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/NNGPGPNkk3YgZO92RraK/sKX8QBPhdwH8xNnpyvgho=; b=AgiayHP/vvAxu9nXZidj/pyR1+
 IFN9zXU0iNGpVdl3FelLFCqlVrNlgO7I70khBmOat5egQIL6jatfzC8kG7le7WUpzO0qWznPWRXC8
 vFMp5e0weMCqtOLHwBPv9QQIsIvEvCtiW+e99fkY/cuXC1OZRKQVnNbBHu/EeDvIQNZA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/NNGPGPNkk3YgZO92RraK/sKX8QBPhdwH8xNnpyvgho=; b=i
 iutuyGbNYt8dNpPaVx4+gO6YCvmu05iJHyZu/DvEC3NziiJlg7b3ASX9en3KNR5JKSYLpl9FMcNp/
 cpxfCJ35euOQKc8MjSNh2o9sscyEktNY7TWXMHuadTVi8ZvqwboBY09IzcTVI/Ydn+d1yTElfIoNu
 3mE2fLd4fgDhKp9A=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kAKZ5-005cNK-Kn
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Aug 2020 22:03:47 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2AF3E20706;
 Mon, 24 Aug 2020 22:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598306618;
 bh=Wyr5CqDqSr09PGAHE7MnPQ/1D0TmISzN4bf1TCYLcZc=;
 h=From:To:Cc:Subject:Date:From;
 b=jtSjrVIL031yaSIOi45auNzjosKWg6PaB8/BQOOaIRx6dR/r7xheEjc6ezm44GWJP
 UjfYh1C8a/iFmHQZjhYKVW0COS+NfleZFX6MGi4PG8ap+yKD9aRV2FNfDNxC7oKBc9
 Z2vPXPhvGF9/RbEtWa2PIbaQwugEnfX3fZdK9ImU=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 24 Aug 2020 15:03:20 -0700
Message-Id: <20200824220320.39331-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
MIME-Version: 1.0
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kAKZ5-005cNK-Kn
Subject: [f2fs-dev] [PATCH] f2fs-tools: release 1.14.0
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

This release includes mainly, but not limited to:
 - add IO cache to speed up fsck.f2fs run
 - support casefolding
 - support data compression
 - support zns zone-capacity
 - enhance fsck.f2fs for zoned device
 - enhance f2fs_io tool

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 VERSION      | 4 ++--
 configure.ac | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/VERSION b/VERSION
index 3ccde23..9043463 100644
--- a/VERSION
+++ b/VERSION
@@ -1,2 +1,2 @@
-1.13.0
-2019-09-24
+1.14.0
+2020-08-24
diff --git a/configure.ac b/configure.ac
index e9acd1a..1e5619d 100644
--- a/configure.ac
+++ b/configure.ac
@@ -218,12 +218,12 @@ AC_CHECK_MEMBER([struct blk_zone.capacity],
 		[], [[#include <linux/blkzoned.h>]])
 
 # export library version info for mkfs/libf2fs_format_la
-AC_SUBST(FMT_CURRENT, 6)
+AC_SUBST(FMT_CURRENT, 7)
 AC_SUBST(FMT_REVISION, 0)
 AC_SUBST(FMT_AGE, 0)
 
 # export library version info for lib/libf2fs_la
-AC_SUBST(LIBF2FS_CURRENT, 7)
+AC_SUBST(LIBF2FS_CURRENT, 8)
 AC_SUBST(LIBF2FS_REVISION, 0)
 AC_SUBST(LIBF2FS_AGE, 0)
 
-- 
2.28.0.297.g1956fa8f8d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
