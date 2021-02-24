Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F703323C58
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Feb 2021 13:54:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lEtgO-0001X8-6p; Wed, 24 Feb 2021 12:54:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1lEtgM-0001X0-Nn
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Feb 2021 12:54:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r559HUYycb69vb718k0xoZMbWa9OdnkoVHpYdNdc6Z8=; b=UIMsyGTP9MKiuVD+ED3sD9+qRZ
 b6OuUmtLNcWHyfhKE7uAWfsTraBpveGBbtfrvO1elARVSwkyFu+zIvDBj2SrWtyTR+AfYZ1tXd2+z
 jaMPvxblsGG15vV+hbYqMJIvRk7dD3vPT5EARHHxG9FvJcQ1McSyIH0zLP/rADzlIgag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r559HUYycb69vb718k0xoZMbWa9OdnkoVHpYdNdc6Z8=; b=TdKMMsrA482RtR6xyWIB+wPOr6
 E+UYavGoWMO3G8NCks0tfhZwHoUOWD+tjTo8kwfK/PfaWZWNOi2I9E6UBZYDWpj/zq0JTTNYOXnVn
 Mqmv6yXkoQW7IWJgE0jts1dqpkQ21+eplcXCqcQ79R+Uk7CEhBvYU27pEQsDeIe6et4E=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lEtgI-003gVu-JC
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Feb 2021 12:54:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F157364F84;
 Wed, 24 Feb 2021 12:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614171252;
 bh=ehgJ3IMWWrx00CYOP8miAjtNa1ImwWvNCz/P8PnmuXA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tmcEQW+w/RQ6gNd3lGVFghYBEBL1SV3rhb9Ha1PgBZAdTaa6QyvzOd8uB0jb0q9ZV
 v0vvqnMhGxuH2YLvghbmzjt7D2ZLob/aycZ3XJtHzdNux2flr01dxm/RmHG8YxEaem
 P0bR+HcC8jR0KdR6auCCUt98l7EiUPyUzU2/4KonGoIOxGABY5lZK2/YtvK21eVKB1
 gBflfIJc1SSKjWyBfrr2ZQDV4mBaTOieXP3dNkvbl2rIG6YZze0IAoEI4UwyMdJMGr
 Xq4RizFcqh18SknnodToTmCQK9T9Cd91bLsAwJxLWRob12K0shJaZXa3aDApIBLjg5
 3y80EM8mEvXHw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 24 Feb 2021 07:53:23 -0500
Message-Id: <20210224125340.483162-23-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224125340.483162-1-sashal@kernel.org>
References: <20210224125340.483162-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lEtgI-003gVu-JC
Subject: [f2fs-dev] [PATCH AUTOSEL 5.4 23/40] f2fs: handle unallocated
 section and zone on pinned/atgc
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jaegeuk Kim <jaegeuk@kernel.org>

[ Upstream commit 632faca72938f9f63049e48a8c438913828ac7a9 ]

If we have large section/zone, unallocated segment makes them corrupted.

E.g.,

  - Pinned file:       -1 119304647 119304647
  - ATGC   data:       -1 119304647 119304647

Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/segment.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 325781a1ae4d6..2034b9a07d632 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -88,11 +88,11 @@
 #define BLKS_PER_SEC(sbi)					\
 	((sbi)->segs_per_sec * (sbi)->blocks_per_seg)
 #define GET_SEC_FROM_SEG(sbi, segno)				\
-	((segno) / (sbi)->segs_per_sec)
+	(((segno) == -1) ? -1: (segno) / (sbi)->segs_per_sec)
 #define GET_SEG_FROM_SEC(sbi, secno)				\
 	((secno) * (sbi)->segs_per_sec)
 #define GET_ZONE_FROM_SEC(sbi, secno)				\
-	((secno) / (sbi)->secs_per_zone)
+	(((secno) == -1) ? -1: (secno) / (sbi)->secs_per_zone)
 #define GET_ZONE_FROM_SEG(sbi, segno)				\
 	GET_ZONE_FROM_SEC(sbi, GET_SEC_FROM_SEG(sbi, segno))
 
-- 
2.27.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
