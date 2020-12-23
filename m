Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD622E2117
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Dec 2020 21:03:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ksALk-0007v2-Jl; Wed, 23 Dec 2020 20:03:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ksALj-0007uv-Lf
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Dec 2020 20:03:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZHCX7+4uOB3+eEPtEoMeS+65nc2tXCWaBIaKV7jYxkM=; b=YE3U7VMhqcGTRFleHdTrHD6KWN
 2F4fqogii49owTpvPln7ODN5+bhVKrcyf/2iMSiHCzWJHkzGcaJBXK+anDn4jX93HxFY87ISfbQUG
 MdQqd5efauVXGRPtfYhJqwrR1WkNxBVRe0p7mBfqCFW6NgtbtNiunEtfkZt/aUQYS9Jo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZHCX7+4uOB3+eEPtEoMeS+65nc2tXCWaBIaKV7jYxkM=; b=l
 z1YjqLJQwyhgploLEAgBgur7vkcqWcwd4kHA11wEuMauEuQP+z8Kr51ryLQvdK/3gksdmkSKxeuIh
 XvzeBp3cm7ifZq3QBQ+AS9JA7ic8uq++8vSzwP8V+V27t0wFuaER8OPYBF2qfHe5Q9s5xv3VHRt/O
 0ieW2WpGNP4qGMSo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ksALe-007CCH-I4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Dec 2020 20:03:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 119F820575;
 Wed, 23 Dec 2020 20:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608753772;
 bh=OzQGdhwS/4twVbEa/nGXLGrUFMVqdR1IXK6igwQCBaY=;
 h=From:To:Cc:Subject:Date:From;
 b=iqJNWX99Qx764DXvmwDVsolI1kGuOUhAJqcvb7dobdR0xZeRJ2LqiPRSICKTeRnw7
 ulDaoNW/8Qjfpc/RmXhH06bY/kLQImUlj9Hrmd+EeEizahP1aXYWjhW3w+rSE8VYPe
 JU4ryaZkcNRjaehLC3EvmquVhYqys9v8eqBLGs4YuGNSHvyjT+AGX0yM9EAFKUm+Up
 llJQuEw3x7Ctcj4mItL68MWklO+C6i9AqLCrflvkQxZctYttOv+tvbhSDIVYS3l2r2
 ItJymhgjrFzjDfvgSUYf7ahJ4pdoeP/sXzVQEYcTDTAixDBI8c+08vXVHMSLrwSdH1
 QoGd5L1ZYUU0g==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed, 23 Dec 2020 12:02:42 -0800
Message-Id: <20201223200242.2078243-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
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
X-Headers-End: 1ksALe-007CCH-I4
Subject: [f2fs-dev] [PATCH] f2fs: handle unallocated section and zone on
 pinned/atgc
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

If we have large section/zone, unallocated segment makes them corrupted.

E.g.,

  - Pinned file:       -1 119304647 119304647
  - ATGC   data:       -1 119304647 119304647

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/segment.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index e81eb0748e2a..229814b4f4a6 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -101,11 +101,11 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
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
2.29.2.729.g45daf8777d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
