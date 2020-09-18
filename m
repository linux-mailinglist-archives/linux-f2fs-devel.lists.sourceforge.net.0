Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8575426EAEF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Sep 2020 04:02:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kJ5jS-0006Dj-AZ; Fri, 18 Sep 2020 02:02:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1kJ5jR-0006Dc-DO
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Sep 2020 02:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ph69cU/ENB8+91zzjgCplgFQUBaiCXsxiY47dDXnwyE=; b=hH8oQAfqDCbrkKyIyDcVCNjloJ
 ixoBKlRzlRlrnp7wYghO0WpXqp1k4wMTr+NrejR8/kESkwIvsnMzp0DuJXUGoFH6/Nl9DjtZ0F5hG
 1oPjJna+/INqJEv0EZ0T4djPR6qqkJ6HCx4FEPE09ySZPtjIJUqjv0ULGtgvqVJAsl/0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ph69cU/ENB8+91zzjgCplgFQUBaiCXsxiY47dDXnwyE=; b=PAsFPuEgBPoMNkbeTNmduL+tDl
 VouI3y5JqLdl8/atW9UCLsamBSWQr9fALpi+QnNoTlAfvx+p636Klg7l9y+ZlZCm/t7DnZ8selN1n
 4cb7faSObeOyycMg4BDM3oAt5jSHnEl+9wwrzOGeJlwYV/iZ0x/6/26ML1K3UHmjwRKM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kJ5jM-00DiO4-Rb
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Sep 2020 02:02:37 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C91F323741;
 Fri, 18 Sep 2020 02:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600394547;
 bh=gIhC3ilpTfqrolrhepjUWk2QSeVf3R4QWY5CuNHCfWE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LOO6QKLYLr+xCVL7uFXInMt1joP5edQIJgjXgL65MsZFwzRwxA20BdOPyJtlqfuqf
 SjndfXVgQAUT26vyPFq7xCqMoGbmLKxiBe5uKR0iudcv38w41+GVOcEJCxh0FS1Mgm
 tMHZQO6F2Mpn3z7rWmwvwsC9i379ySgVs6u+EL4k=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 17 Sep 2020 21:56:44 -0400
Message-Id: <20200918020110.2063155-64-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020110.2063155-1-sashal@kernel.org>
References: <20200918020110.2063155-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kJ5jM-00DiO4-Rb
Subject: [f2fs-dev] [PATCH AUTOSEL 5.4 064/330] f2fs: stop GC when the
 victim becomes fully valid
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
 linux-f2fs-devel@lists.sourceforge.net, Ramon Pantin <pantin@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jaegeuk Kim <jaegeuk@kernel.org>

[ Upstream commit 803e74be04b32f7785742dcabfc62116718fbb06 ]

We must stop GC, once the segment becomes fully valid. Otherwise, it can
produce another dirty segments by moving valid blocks in the segment partially.

Ramon hit no free segment panic sometimes and saw this case happens when
validating reliable file pinning feature.

Signed-off-by: Ramon Pantin <pantin@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/gc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index e611d768efde3..a78aa5480454f 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1012,8 +1012,14 @@ next_step:
 		block_t start_bidx;
 		nid_t nid = le32_to_cpu(entry->nid);
 
-		/* stop BG_GC if there is not enough free sections. */
-		if (gc_type == BG_GC && has_not_enough_free_secs(sbi, 0, 0))
+		/*
+		 * stop BG_GC if there is not enough free sections.
+		 * Or, stop GC if the segment becomes fully valid caused by
+		 * race condition along with SSR block allocation.
+		 */
+		if ((gc_type == BG_GC && has_not_enough_free_secs(sbi, 0, 0)) ||
+				get_valid_blocks(sbi, segno, false) ==
+							sbi->blocks_per_seg)
 			return submitted;
 
 		if (check_valid_map(sbi, segno, off) == 0)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
