Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C043C1F9F12
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2020 20:08:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jktXU-0001w8-EC; Mon, 15 Jun 2020 18:08:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jktXS-0001vy-B2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 18:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hAn/ETTbE8sGJ5Ex7qUmbXM1iWClbVAtvNgQ8RE+XFs=; b=k3BtMsQ2+MszxcyqG+cjPZFAT6
 w+wUBkwioic3UKnQ8E03Xf8uMD4TJ2omVGMfCyVTLyiAWZ0sWPGbexTX0PnmnfGgGrjb1kbxEhoSz
 vlMerwtoW2y7XSDRC2CMeuO0azpU+k6t+92Ijv/sO81GPO0ybcXRyWpdE3wRnU0XfDFs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hAn/ETTbE8sGJ5Ex7qUmbXM1iWClbVAtvNgQ8RE+XFs=; b=lz7yEkqdsiZlA9mXpmZKmGkh5w
 uehDZHztKMsoxiYArCQGDZd1nYb/5kli89DeCoFBUauGmFwQKIR0plzWEQduuCcwB4S46ik9o7QWN
 eq9IiEHtCqtzFvIwUPOE505eeInX1UHqT6QiD8eHpElsdFTqJyGKp6R3Yp9dKIQbt6no=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jktXO-006sUh-Do
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 18:08:54 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E226220810;
 Mon, 15 Jun 2020 18:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592244525;
 bh=vQQY3ryymkSZQbX5+01NqooffyfjpyJ36nsgxqhhK1A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i+oxWjkWFVU6FVl4CLYyB6Xn1c0WlVtg4fGWShd73ADrNfMtPpMESCtc4wvPNr4WL
 rn+IBIkxjdl1cpIlh1h0Wn7bbRa2keU8R8aGpEvXCuJoJvH0g7zHNqBOFQ1OWRwTwA
 u3blfEmjgq3rOdxsIuFW/8NsBqG3QXUqSdFmRBwI=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 15 Jun 2020 11:08:41 -0700
Message-Id: <20200615180843.153299-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
In-Reply-To: <20200615180843.153299-1-jaegeuk@kernel.org>
References: <20200615180843.153299-1-jaegeuk@kernel.org>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jktXO-006sUh-Do
Subject: [f2fs-dev] [PATCH 2/4] lib: fix include path for blkid.h
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Rolf Eike Beer <eb@emlix.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Rolf Eike Beer <eb@emlix.com>

$ pkg-config --cflags blkid
-I/usr/include/blkid

The "blkid/" directory is actually part of the include path. This usually still
works because most people have the path one level up in their default include
path.

Signed-off-by: Rolf Eike Beer <eb@emlix.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 mkfs/f2fs_format_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index 282c94e..3d86c44 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -23,7 +23,7 @@
 
 #include "config.h"
 #ifdef HAVE_LIBBLKID
-#  include <blkid/blkid.h>
+#  include <blkid.h>
 #endif
 
 #include "f2fs_fs.h"
-- 
2.27.0.290.gba653c62da-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
