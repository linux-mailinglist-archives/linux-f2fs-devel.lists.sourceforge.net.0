Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D2B323C2F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Feb 2021 13:52:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lEteG-0002FV-4b; Wed, 24 Feb 2021 12:52:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1lEtdh-00028e-BK
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Feb 2021 12:51:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hf3m5bmrjFNXNyzLVA4zVf+071b0OJY8HVKJHIyF7pQ=; b=gwY7Z7ImCXbCFOPXIUBoUYz6J0
 s9nROHG5ykT3L3i1N+g2zOuAa0qYxXHzwYrAxy2ExEnj86DQ5nH42/2sLIz3fDoutIZX5heY2bkpC
 YXJG/GJ1Z3Yxky/kEcSlTfUlAL6+lWamlwRmb2ybpQA6BO+fdGMePGqu9l01OosxZYlM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hf3m5bmrjFNXNyzLVA4zVf+071b0OJY8HVKJHIyF7pQ=; b=BS0OI4c0oI35d18tXg7X5hzqUR
 APZzQVG3ciaR5NvZyv/DBmG5/uKBiNoDQNZ+kXzAoFcCWs0Sex50gK8OcSPUYyOvngQydD3V0KP+n
 wZ5Pben4YjkPUAZB/f829EWdaLNI8pTNAJG7+8eDmWjs3izKiexkor974rI96PGKwIo0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lEtdd-003gJF-4t
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Feb 2021 12:51:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0102464F12;
 Wed, 24 Feb 2021 12:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614171082;
 bh=n5JcjEhi872PhCEaGoFNpYBHWSow5ZMF50i74ogSC3k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kk+D3FkGDE5SLU0fzzzOhpaeV2Tp7S3uwP/PLTGQly7MwVqBJ7RELLE8baJQvPoUN
 Ba5PWBvgaebl2nS0CuE76F4CZVo9dpYwzGvXWpuuTW2nGbLxXwAQ31i5FSaA0Hd9x1
 /vvF+GujrAzPACxVt3eDJl8M2HZmyU2CysiUs9P6FEZK/kk9pWJic3hfqKsbLKFi4P
 hzuS2LdU6A5zo0wYobvR8Jhs49SwlyaqA7jB3RoLzMjlUnPTvDYGMousY9TJOzzZf8
 A/lgaxtyVlKikqPBvhEEQBY7XBroQ8gLHWkt3GpIJgiWFH17JpzeCR/abC7POR3RZ/
 lRAk0ZoYnUONQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 24 Feb 2021 07:49:59 -0500
Message-Id: <20210224125026.481804-41-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224125026.481804-1-sashal@kernel.org>
References: <20210224125026.481804-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
 for more information. [URIs: huawei.com]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lEtdd-003gJF-4t
Subject: [f2fs-dev] [PATCH AUTOSEL 5.11 41/67] f2fs: handle unallocated
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
index e81eb0748e2a9..229814b4f4a6c 100644
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
2.27.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
