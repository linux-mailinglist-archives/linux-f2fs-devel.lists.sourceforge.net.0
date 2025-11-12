Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CAADBC503BF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Nov 2025 02:48:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+y6NQX/6mlxOl1FCROTcmVie5ArdhoyuQOt153ePnVs=; b=j8ACfX1PZW7129rEiTZ/DSySZo
	W560yTuTKIaahWb/5Hv96q1ekFvkmj7B1+8iIX1nWd3K4kMbIHUOFEfR8mRv945ibyfbbFioD5Ib0
	HYDEcLu6W0tRt3ijQkHO2JsiOSHTn4k171en2WFcBfxYkWyq8M8Pdg1olL4Of2LYzJqU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIzy1-0006dJ-OS;
	Wed, 12 Nov 2025 01:48:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vIzy0-0006dD-EC
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Nov 2025 01:48:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qINicFXnxxqQCJ3Aky0ZqnVGL1InwO54BphZielxX5g=; b=Yco2DG7k1DuvAFbqozNyoUb/U/
 XWkWdhJPYTPCaIvX/6OgHcOXGwLEZ6+MHeEYK/kW3bksuSwdDJtXSp1B/4JjBgz5AJ3GzRDJHHlQz
 OGxSIKSka0eO8vKp+1hG1SrfCyJkiBifUaUNuaryQiS+tN5JvNIbdW14KTH3Ek5ZO2zU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qINicFXnxxqQCJ3Aky0ZqnVGL1InwO54BphZielxX5g=; b=S5IQWbK3plyt7cmmflnpn6Cv99
 +hrKz1Bd93E98HMW3EYkTcCuG6chjtUzcsxSNc9SIgFA1ZvBhaLlNVPM6b9ztaAKC9aOzs5Nc2lUW
 /EFGxfx3X1GhejmSUbpmVJ6aTpynUGCBZzblBwo462xJEKMKzGoIbE60IxB7ujmZfUkQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIzy0-0004uZ-1H for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Nov 2025 01:48:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BB87943DEC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Nov 2025 01:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF49C2BCB2;
 Wed, 12 Nov 2025 01:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762912081;
 bh=l89OBBRuQN/2/Z1dA51l4gZkGX3b0zGt4ZmsQETNW/s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L6KYpWbIiBqm5vcfQSXUIGVJZzyFysOP0qOUCKRymJJiifLwvg9C6M9WDAJbRGqpF
 FoEVyBxSA0eCYIzL1NNpI5Ci+x8Pz2qm7bPLHsS5iDSOd5I94rrECvCpmpjD+w5cD+
 gtOGHkOdwFqZjbYbDyU+ALOqL42T3nJ3hS2H45TQ0fGmrO+dl7/Ok5cddWHEBSmNPm
 gL1Cpfc5XS3sBPHCINH5NqhzcCzkv6mykk77W3B+vDhmoKM0qPP9lXx7XOTmmiS4RM
 RJWuM63YGteGtGeycYyXxSCqLyoUX4qyQpAnM+bQce9slz566bXJz63lLlS8++nvRF
 0YbqbTt75gLsA==
To: jaegeuk@kernel.org
Date: Wed, 12 Nov 2025 09:47:49 +0800
Message-ID: <20251112014749.2006439-3-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
In-Reply-To: <20251112014749.2006439-1-chao@kernel.org>
References: <20251112014749.2006439-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch changes default schedule timeout value from 20ms
 to 1ms, in order to give caller more chances to check whether IO or non-IO
 congestion condition has already been mitigable. In addition, default interval
 of periodical discard submission is kept to 20ms. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vIzy0-0004uZ-1H
Subject: [f2fs-dev] [PATCH v2 3/3] f2fs: change default schedule timeout
 value
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch changes default schedule timeout value from 20ms to 1ms,
in order to give caller more chances to check whether IO or non-IO
congestion condition has already been mitigable.

In addition, default interval of periodical discard submission is
kept to 20ms.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- no changes
 fs/f2fs/f2fs.h    | 6 ++++--
 fs/f2fs/segment.c | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 0d0e0a01a659..74cbbd84f39b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -407,6 +407,8 @@ struct discard_entry {
 #define DEFAULT_DISCARD_GRANULARITY		16
 /* default maximum discard granularity of ordered discard, unit: block count */
 #define DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY	16
+/* default interval of periodical discard submission */
+#define DEFAULT_DISCARD_INTERVAL	(msecs_to_jiffies(20))
 
 /* max discard pend list number */
 #define MAX_PLIST_NUM		512
@@ -656,8 +658,8 @@ enum {
 
 #define DEFAULT_RETRY_IO_COUNT	8	/* maximum retry read IO or flush count */
 
-/* IO/non-IO congestion wait timeout value, default: 20ms */
-#define	DEFAULT_SCHEDULE_TIMEOUT	(msecs_to_jiffies(20))
+/* IO/non-IO congestion wait timeout value, default: 1ms */
+#define	DEFAULT_SCHEDULE_TIMEOUT	(msecs_to_jiffies(1))
 
 /* timeout value injected, default: 1000ms */
 #define DEFAULT_FAULT_TIMEOUT	(msecs_to_jiffies(1000))
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 993ec8afe2db..8375dca7ed9e 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3471,7 +3471,7 @@ static unsigned int __issue_discard_cmd_range(struct f2fs_sb_info *sbi,
 			blk_finish_plug(&plug);
 			mutex_unlock(&dcc->cmd_lock);
 			trimmed += __wait_all_discard_cmd(sbi, NULL);
-			f2fs_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
+			f2fs_schedule_timeout(DEFAULT_DISCARD_INTERVAL);
 			goto next;
 		}
 skip:
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
