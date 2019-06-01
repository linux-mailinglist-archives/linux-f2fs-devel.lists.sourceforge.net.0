Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E0431C6A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Jun 2019 15:21:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hX3x5-0003cz-By; Sat, 01 Jun 2019 13:21:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1hX3x3-0003cE-Qg
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:21:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N9bKorZD++1KN8+LKYOB0y8ys7DlPu5L8uCRUa9x0Lk=; b=W6l8XkC5dAsslZlPw8GbDuk1cy
 4TEzorlnpSRxknh5AFFTEIFNQaZW3+hacMzZEIB6FaKrjttXNPDzq4rPiNXfYtBuhqJAZBVJgD3BP
 2MIS4OLZD+k3r0pyRtQEGGTMBEbRhaln06uGPUKHFSZTnOs6gbBHNya9AswO8IKyPyqM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N9bKorZD++1KN8+LKYOB0y8ys7DlPu5L8uCRUa9x0Lk=; b=ei1qsGS3T08N5HZfQFIqWUIuNz
 YsBAQ1wF36AaX1q7tDMoeuxsqAMh0ibGUprNivBQgPnxug9Yv/0NMzDzfeMls7rO0R3pcQ0xIt44k
 R/XaNWNzx1gYQn8xiG6bMjGWm9X5JMi6cwf8UkLjJ4xnKPw62bknPJppBhKDwkpW02Wg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hX3x0-00EcHH-Sx
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:21:36 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A17C8272F3;
 Sat,  1 Jun 2019 13:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559395289;
 bh=QlXIHikvXIYteNVMeavySQDatlybYcwTP55rPq29LTE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y2J9+ONMv7oIsB9dgdVqsZzSXvdto6CSM/9116b/CpAvtli1/4Fwbs4dUcnUoegF7
 qWxAQ7ET1AU/Nn0FOX/dIvb084aNhWxBw9WUbZLSbtcIXIh1jtrpUmBiSGlzNepGib
 MgL+zglUdfxZqG6mdA5KXS8yu3RVWkV3p1uRChPM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat,  1 Jun 2019 09:17:24 -0400
Message-Id: <20190601131934.25053-52-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601131934.25053-1-sashal@kernel.org>
References: <20190601131934.25053-1-sashal@kernel.org>
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
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hX3x0-00EcHH-Sx
Subject: [f2fs-dev] [PATCH AUTOSEL 5.0 052/173] f2fs: fix to do checksum
 even if inode page is uptodate
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

[ Upstream commit b42b179bda9ff11075a6fc2bac4d9e400513679a ]

As Jungyeon reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=203221

- Overview
When mounting the attached crafted image and running program, this error is reported.

The image is intentionally fuzzed from a normal f2fs image for testing and I enabled option CONFIG_F2FS_CHECK_FS on.

- Reproduces
cc poc_07.c
mkdir test
mount -t f2fs tmp.img test
cp a.out test
cd test
sudo ./a.out

- Messages
 kernel BUG at fs/f2fs/node.c:1279!
 RIP: 0010:read_node_page+0xcf/0xf0
 Call Trace:
  __get_node_page+0x6b/0x2f0
  f2fs_iget+0x8f/0xdf0
  f2fs_lookup+0x136/0x320
  __lookup_slow+0x92/0x140
  lookup_slow+0x30/0x50
  walk_component+0x1c1/0x350
  path_lookupat+0x62/0x200
  filename_lookup+0xb3/0x1a0
  do_fchmodat+0x3e/0xa0
  __x64_sys_chmod+0x12/0x20
  do_syscall_64+0x43/0xf0
  entry_SYSCALL_64_after_hwframe+0x44/0xa9

On below paths, we can have opportunity to readahead inode page
- gc_node_segment -> f2fs_ra_node_page
- gc_data_segment -> f2fs_ra_node_page
- f2fs_fill_dentries -> f2fs_ra_node_page

Unlike synchronized read, on readahead path, we can set page uptodate
before verifying page's checksum, then read_node_page() will trigger
kernel panic once it encounters a uptodated page w/ incorrect checksum.

So considering readahead scenario, we have to do checksum each time
when loading inode page even if it is uptodated.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/inode.c | 4 ++--
 fs/f2fs/node.c  | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 8c8d40e07ebaf..24c81703ec56f 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -176,8 +176,8 @@ bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct page *page)
 
 	if (provided != calculated)
 		f2fs_msg(sbi->sb, KERN_WARNING,
-			"checksum invalid, ino = %x, %x vs. %x",
-			ino_of_node(page), provided, calculated);
+			"checksum invalid, nid = %lu, ino_of_node = %x, %x vs. %x",
+			page->index, ino_of_node(page), provided, calculated);
 
 	return provided == calculated;
 }
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 63bb6134d39ae..e29d5f6735ae9 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1281,9 +1281,10 @@ static int read_node_page(struct page *page, int op_flags)
 	int err;
 
 	if (PageUptodate(page)) {
-#ifdef CONFIG_F2FS_CHECK_FS
-		f2fs_bug_on(sbi, !f2fs_inode_chksum_verify(sbi, page));
-#endif
+		if (!f2fs_inode_chksum_verify(sbi, page)) {
+			ClearPageUptodate(page);
+			return -EBADMSG;
+		}
 		return LOCKED_PAGE;
 	}
 
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
