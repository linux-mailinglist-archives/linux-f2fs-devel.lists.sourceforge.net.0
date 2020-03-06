Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3619D17B4FC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Mar 2020 04:38:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jA3oC-0001i4-2Z; Fri, 06 Mar 2020 03:37:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jA3oA-0001hx-UZ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Mar 2020 03:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ENfVu79ZypkJlp5nyuWizTHH+Z5w0tr5TwZoGktxzoo=; b=MdGxV18QM9ydgSi2rJ/2+ns3PQ
 R8vro9tEtsErxn3zAI6f6TlMYy/7VPXFh6kBzl1NZDvFvgaJYMNudYmFuOR+AIYpgyCqIVYtZNDHk
 YYfM4sFC8nnEI3aW8RwcOBJdgmU49p6Fwy7nyDYD+A6PDIrkj3vKG0xuBVkKnMJPK938=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ENfVu79ZypkJlp5nyuWizTHH+Z5w0tr5TwZoGktxzoo=; b=H
 43TWXbnMvGHkZxXOIBzznmfv4+rLRRWEvDHe6OqBKJUxrLmeFgXdvcH1ZifHoLiOCNq+ll3NPOtcD
 BckNQfO3r4dDYE1V7Y+FlwYAz+eNjA2BCbQ73O7Z5zHqcyE4VbugmLVmp9RJ16l8fk3vmc0l5N9XU
 YRuJUX9ahkEEoZGY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jA3o8-0000Zg-3w
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Mar 2020 03:37:54 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E94202072D;
 Fri,  6 Mar 2020 03:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583465863;
 bh=Jc9hqYzhqVr+tpRXdXKicL3LcEAs5kEnmNW4DY12w/w=;
 h=From:To:Cc:Subject:Date:From;
 b=VbiZNxgAGjgqzzWFzmlcQBX6K/bluwBDMDxgkLumPFHnxFOmh78Xx75VVh+se9buv
 fcpDJEqYMOYeBrJEzVYxAFKffHNjdU8EmQYvFoLYZawdsBdaYK1p3p6Ldm/nw5YEs7
 ZP5HITtGojGCcnjU6yPQylGwfy3Jdhzxf46jCL1E=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  5 Mar 2020 19:37:41 -0800
Message-Id: <20200306033741.113980-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
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
X-Headers-End: 1jA3o8-0000Zg-3w
Subject: [f2fs-dev] [PATCH] Include private/fs_config.h directly when needed
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
Cc: Tom Cherry <tomcherry@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Tom Cherry <tomcherry@google.com>

This is no longer a transitive include of android_filesystem_config.h

Signed-off-by: Tom Cherry <tomcherry@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/sload.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fsck/sload.c b/fsck/sload.c
index f601916..c064f7f 100644
--- a/fsck/sload.c
+++ b/fsck/sload.c
@@ -34,6 +34,7 @@ static fs_config_f fs_config_func = NULL;
 #include <selinux/android.h>
 #include <private/android_filesystem_config.h>
 #include <private/canned_fs_config.h>
+#include <private/fs_config.h>
 #endif
 
 static int filter_dot(const struct dirent *d)
-- 
2.25.1.481.gfbce0eb801-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
