Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B7B2197E1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jul 2020 07:30:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtP8v-0002kX-9w; Thu, 09 Jul 2020 05:30:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jtP8t-0002kK-9J
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 05:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6L+dDSS+71ZIhQE6FKc5Ob7ttZIkB/Wlbs6iIjK3p6Q=; b=KAzo3gAQfymMkxbRwq3sSBxqBj
 5SVTtwZKgyyoY0I0NIwaSHYk5aSj+OGr0hVpuSDDtDhsHKJb8HH1RXRPa9OzZquYr3Woe2frQpu4i
 MznHXLQzr1QzzFmyPlRVpd8ZE2bsyY1PfxeyF3EcctNMBqJp1xzbk6U3p7eLf+yjVh74=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6L+dDSS+71ZIhQE6FKc5Ob7ttZIkB/Wlbs6iIjK3p6Q=; b=n
 AX+EuqSzsMmISiW08omIt/igw6w8fEaFnNwqphlAPz+b08bKidvn/YOFnZjHOVgKxFC4lp0fQ9HdK
 rgVnbj6lTEhrfLZT0tLRe2z/Z9M1SzN4QsShLHEn7t6gKwRWnhQ3QMsnvrq1hiBpcclKAtHFzdEav
 G/9CR4yIdnseWe6o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtP8m-00Bnam-8s
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 05:30:43 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4FF55206A1;
 Thu,  9 Jul 2020 05:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594272628;
 bh=4IX4LY45faliARN3WG0EnS0QUvtq8EhBAHND+vk7uOs=;
 h=From:To:Cc:Subject:Date:From;
 b=Ah473ElMO1z3Tf02N5OGRiMwSHdvVhYVuHm0rbf16M6X/Aov5QMICL3UtvboLG0Mr
 hnCJI+kS+5D6PRPDv/teU0Q5B+rPtf0gmXAQ98zHF83tiAn1gFWPNKFGmp37bMBZFA
 KVFEAOjkk+JVSYtHWd70kvWfe1pwff7yEEj5HYGI=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed,  8 Jul 2020 22:30:27 -0700
Message-Id: <20200709053027.351974-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtP8m-00Bnam-8s
Subject: [f2fs-dev] [PATCH] f2fs: don't skip writeback of quota data
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

It doesn't need to bypass flushing quota data in background.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 44645f4f914b6..72e8b50e588c1 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3148,7 +3148,7 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
 	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
 		goto skip_write;
 
-	if ((S_ISDIR(inode->i_mode) || IS_NOQUOTA(inode)) &&
+	if (S_ISDIR(inode->i_mode) &&
 			wbc->sync_mode == WB_SYNC_NONE &&
 			get_dirty_pages(inode) < nr_pages_to_skip(sbi, DATA) &&
 			f2fs_available_free_memory(sbi, DIRTY_DENTS))
-- 
2.27.0.383.g050319c2ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
