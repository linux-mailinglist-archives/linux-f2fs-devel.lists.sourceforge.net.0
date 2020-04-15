Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6EE1A9C98
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 13:36:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOgLb-0000HO-0y; Wed, 15 Apr 2020 11:36:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1jOgLZ-0000HD-Dz
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1+/6LXmYuLEdLDSUrgvW+/4edMAWTn9ymqgc1uWBkIQ=; b=lpal7/IBJbIufTFz8epJvPyd93
 disK94Ozwb1+VGtq7mF/YpDriChYvRY1AuCk5km10OrQl80U9qOctW8AWEEPp5VyZvozjhpf4BApH
 yPPGN0TTJbz9xicPeUyFKJwHeiPJP51nRxVr4f7OHxsuQLoiscoGYrGL3UEdbEk5wGn8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1+/6LXmYuLEdLDSUrgvW+/4edMAWTn9ymqgc1uWBkIQ=; b=bh+8SkZ3T9DCgnD0BpYbwIsT3M
 WvdBGWJfV+9k2LJsZftrqOVWuZ9yuF8/YeKkJEsgpy8aTtluFYq2AK2TX8UufvmYUHNZjK1C1TT5c
 8POGRu8Xc8CzYYI9tjLZ2cl6fTNwcWJBVm9vo69wDTs36/+LnvtO3k5RDmVa5Ommcjgk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOgLW-00GSjK-50
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:36:49 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E9FB520737;
 Wed, 15 Apr 2020 11:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586950600;
 bh=YMmXqky6rmP92ItU3MKEGwQVyOGLaDsUIhUp21CgvFo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r2vhJ/LkRGvEUrizTa+zytw+yrN3BrmRApvbdtg90Q5n9h0CPL7S4/s5ruQitycoy
 6BP210gL7YVKSkxS5C4CDpdBY6R7VT+yLVe8BmaIHBzQ3aD57o8P9VzeqCOEc/KioT
 ciSXbXmAUHF6YyhoxT+jbwrHmJj8fG8Pomc6Leeo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 15 Apr 2020 07:34:11 -0400
Message-Id: <20200415113445.11881-96-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415113445.11881-1-sashal@kernel.org>
References: <20200415113445.11881-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.3 (/)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jOgLW-00GSjK-50
Subject: [f2fs-dev] [PATCH AUTOSEL 5.6 096/129] f2fs: compress: fix to call
 missing destroy_compress_ctx()
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

From: Chao Yu <yuchao0@huawei.com>

[ Upstream commit 09ff48011e220e2b4f1d9ce2f472ecb63645cbfc ]

Otherwise, it will cause memory leak.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/compress.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 927db1205bd81..1a86e483b0907 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -395,6 +395,8 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 		cc->cpages[i] = NULL;
 	}
 
+	cops->destroy_compress_ctx(cc);
+
 	cc->nr_cpages = nr_cpages;
 
 	trace_f2fs_compress_pages_end(cc->inode, cc->cluster_idx,
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
