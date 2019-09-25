Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D89BD662
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Sep 2019 04:32:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iCx5z-00021j-2O; Wed, 25 Sep 2019 02:31:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iCx5x-00021a-6E
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Sep 2019 02:31:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wePULYvo8/TL/SbH5SkmzZdSmTSOONeJztdAUNDIEq8=; b=WVR1Swn04VIpHtVixn985dLPm6
 OQpLi8F8CSL45BzqcStKtZlWS/Jk66eFMkhRgqayrhXudPCGQkA3yIxbVcw9+CjOSxR1jqDVyLpfw
 IdqUTJj/HTEuL5AI/uev2ACEsS7BQ3xmzYGZ/Dfb4BVDo6t24chZvcKpbV7Ju/XDArlM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wePULYvo8/TL/SbH5SkmzZdSmTSOONeJztdAUNDIEq8=; b=Y
 6ow9VkylIU2s/cNgxew4KQPZzFrL4/Mpa5Q57zRDVz+DQV+UIksxl+rBZHK9a8N0767Fk5aBtF2pk
 iSHND32iHhEQxcf+H73fpUzfKmaEYTVZ60Hwbz0zUS67UXSzTCSOOBPnxch8112umtQEiwfwwqK0p
 uxDeV9qD7VKF9dBs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iCx5o-005waU-VV
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Sep 2019 02:31:57 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7533C205F4;
 Wed, 25 Sep 2019 02:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569378698;
 bh=EJ/0dBNAFodDlmV+K53bEsq0xAbNAIhe68y4836YB3s=;
 h=From:To:Cc:Subject:Date:From;
 b=EBnU6jazmFDBgRdwygtrMycRrlgxSWaPOfRiT/ZI0nTgUbq8fhor+tUX/yWSl0grE
 iMebLHkX/XgiBImJFaUe6tGLPNFsCJssK47yP1wOYVD1RuJm/3NWbxy+aeemEtXxzQ
 zTKnHud35JE6eAKIy26wCw8ClGVW17yqieveTV9k=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 24 Sep 2019 19:31:36 -0700
Message-Id: <20190925023136.70056-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: configure.ac]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iCx5o-005waU-VV
Subject: [f2fs-dev] [PATCH] f2fs-tools: release 1.13.0
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

This release includes:
 - enable VERITY by default on Android
 - introduce some preen mode in fsck.f2fs
 - add f2fs_io tool
 - add casefolding support

And, there are lots of bug fixes.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 VERSION      | 4 ++--
 configure.ac | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/VERSION b/VERSION
index 7ba7212..3ccde23 100644
--- a/VERSION
+++ b/VERSION
@@ -1,2 +1,2 @@
-1.12.0
-2018-11-12
+1.13.0
+2019-09-24
diff --git a/configure.ac b/configure.ac
index a2dff96..9b0e872 100644
--- a/configure.ac
+++ b/configure.ac
@@ -213,12 +213,12 @@ AC_CONFIG_FILES([
 ])
 
 # export library version info for mkfs/libf2fs_format_la
-AC_SUBST(FMT_CURRENT, 5)
+AC_SUBST(FMT_CURRENT, 6)
 AC_SUBST(FMT_REVISION, 0)
 AC_SUBST(FMT_AGE, 0)
 
 # export library version info for lib/libf2fs_la
-AC_SUBST(LIBF2FS_CURRENT, 6)
+AC_SUBST(LIBF2FS_CURRENT, 7)
 AC_SUBST(LIBF2FS_REVISION, 0)
 AC_SUBST(LIBF2FS_AGE, 0)
 
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
