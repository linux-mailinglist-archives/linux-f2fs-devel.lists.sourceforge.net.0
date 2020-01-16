Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 114F113E828
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Jan 2020 18:30:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1is8yt-00045f-2q; Thu, 16 Jan 2020 17:30:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1is8ys-00045W-KS
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jan 2020 17:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VO7ef8Jvmt8Ft+aVemlUXqZeJaLp0SQN50+ySqMGQn8=; b=VeR+kGpbUmn1ycf5VxzBOTOxnw
 /GbMBagZHAtZ6vIJ5URw5X1s056eWW6PFrTKg0AdXtJ5rBNjJJYN7pAEbJL+gqh3M3z5OIg6rr+FA
 cmq1UHlL/wGL90H9Lmz92/8dM39MzZK3BzKzqmmQl7RfRbnZEl7iJephQmxQLp8DvSTU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VO7ef8Jvmt8Ft+aVemlUXqZeJaLp0SQN50+ySqMGQn8=; b=mMNc/8hvmw7IT4McuCxeT7j/4/
 y196uRU9dsn4OJe5Q5JRjL3FLjP6fWD/ImstpLgXHN1O5qOMdZjSZKZUM2lX6bBUNrnjBgwvN/zLK
 sSJkaW+0EglpLdjpI0FIWNMUWJcoEESp1z8jjnufirgIAJwWjJAJVfeCmJSHR/c6w3DI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1is8yr-006mpO-Gi
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jan 2020 17:30:54 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD87E20728;
 Thu, 16 Jan 2020 17:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579195847;
 bh=6ToXo0U8rBrgbvu3xP30vvqRqWu7VCADypBze9Uf9o4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sbjsbkn6enfDlNX+M1NIt8dyCvcIgvwun4qoGkDzlOVpHoVCMVc/RcaR13eU5G1cQ
 X34giu429kOKqnDkrLr1TcO0ZHjNVYljaVAAT3EJHizJkSKEWNfL2sjiAH6g2v8PpO
 QVN8Up9Iy3i8m5FLIc5iFUlYyQvWOCXnOT1Fvnk8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 16 Jan 2020 12:23:40 -0500
Message-Id: <20200116172403.18149-291-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116172403.18149-1-sashal@kernel.org>
References: <20200116172403.18149-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.5 (/)
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
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1is8yr-006mpO-Gi
Subject: [f2fs-dev] [PATCH AUTOSEL 4.14 348/371] f2fs: fix potential overflow
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

[ Upstream commit a9af3fdcc4258af406879eca63d82e9d6baa892e ]

In build_sit_entries(), if valid_blocks in SIT block is smaller than
valid_blocks in journal, for below calculation:

sbi->discard_blks += old_valid_blocks - se->valid_blocks;

There will be two times potential overflow:
- old_valid_blocks - se->valid_blocks will overflow, and be a very
large number.
- sbi->discard_blks += result will overflow again, comes out a correct
result accidently.

Anyway, it should be fixed.

Fixes: d600af236da5 ("f2fs: avoid unneeded loop in build_sit_entries")
Fixes: 1f43e2ad7bff ("f2fs: introduce CP_TRIMMED_FLAG to avoid unneeded discard")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/data.c | 2 +-
 fs/f2fs/file.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index ac3fa4bbed2d..afe7dcfff036 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1512,7 +1512,7 @@ static int __write_data_page(struct page *page, bool *submitted,
 	loff_t i_size = i_size_read(inode);
 	const pgoff_t end_index = ((unsigned long long) i_size)
 							>> PAGE_SHIFT;
-	loff_t psize = (page->index + 1) << PAGE_SHIFT;
+	loff_t psize = (loff_t)(page->index + 1) << PAGE_SHIFT;
 	unsigned offset = 0;
 	bool need_balance_fs = false;
 	int err = 0;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index a90173b856f6..d98acc20a38a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1059,7 +1059,7 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 				}
 				dn.ofs_in_node++;
 				i++;
-				new_size = (dst + i) << PAGE_SHIFT;
+				new_size = (loff_t)(dst + i) << PAGE_SHIFT;
 				if (dst_inode->i_size < new_size)
 					f2fs_i_size_write(dst_inode, new_size);
 			} while (--ilen && (do_replace[i] || blkaddr[i] == NULL_ADDR));
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
