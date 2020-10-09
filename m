Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EFC289BB5
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 10 Oct 2020 00:21:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kR0ls-0000fA-8O; Fri, 09 Oct 2020 22:21:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kR0lo-0000ew-5q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Oct 2020 22:21:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PyMmyAPQGUVnjeK3LLAjy5gdMwYfK7y4rtQZfnkgKoA=; b=f232RqeY0lSu8ovT2KpAdd73Dy
 lvLJ7sOqNv+oZ9WrVkCjtX6MhJZx3vPd2unNerGGcuRIbfKWUFnlD00VDEDEAZ89xgxSmYgpooott
 EQhy6DifW3AM1QgGJVv2JSz2ZzpwrkXdOHtsXzBtHVtO8kaFbk6qwuOJc7VGYqVRM2cw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
 Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PyMmyAPQGUVnjeK3LLAjy5gdMwYfK7y4rtQZfnkgKoA=; b=T
 WyJ5zrL5Q4mWbRDdDjTrTT+v+ETpVTl/M88A9+bn3izny+3siQOh4UpO0DMuPXL1/PuNBlRu1DBI6
 8AhK4HsgF+QmdbLwLDkyQ2KfZ9ieumVkHLPIb+xT/ckwLD4cYlAtPK/JnwRmfrowlnx+oauPEPGlD
 fbqODDbeJeuJ2sqg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kR0lb-004hs8-Of
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Oct 2020 22:21:48 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F63322281;
 Fri,  9 Oct 2020 22:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602282090;
 bh=b0QYoWJ4F1WKIt0I1G7QvmM3e40+q3joXMgKY+q8cOE=;
 h=From:To:Subject:Date:From;
 b=pCQYEc43BEOVLbNiW1Y9/SoLAip+b3E24g6IPm/rLkuovuWkIL5Ylkb/xJKi0OLvU
 oLBDyS+RTcQbgxIhrb1C1VusyAu2m3WeBgt9/go52DetRRpE+/TM9vCxaiTTgn67Ks
 bgIwVMQ8+Rv1gC/0dtCsQFbjJBgfeCI4Af8POmtg=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>
Date: Fri,  9 Oct 2020 15:20:56 -0700
Message-Id: <20201009222056.5376-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kR0lb-004hs8-Of
Subject: [f2fs-dev] [f2fs-tools PATCH] mkfs.f2fs.8: document the verity
 feature
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

From: Eric Biggers <ebiggers@google.com>

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 man/mkfs.f2fs.8 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
index e2aee76..1bdd778 100644
--- a/man/mkfs.f2fs.8
+++ b/man/mkfs.f2fs.8
@@ -183,7 +183,7 @@ Enable inode creation time feature. Requires extra attr.
 Enable lost+found feature.
 .TP
 .B verity
-Reserved feature.
+Enable support for verity protected files (a.k.a. fs-verity).
 .TP
 .B sb_checksum
 Enable superblock checksum.
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
