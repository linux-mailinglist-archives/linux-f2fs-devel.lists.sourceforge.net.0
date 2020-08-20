Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C46224AA75
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Aug 2020 02:01:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k8Y1d-0000Cu-2w; Thu, 20 Aug 2020 00:01:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1k8Y1b-0000Ch-Pd
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Aug 2020 00:01:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0F8/HC3SdyG65btVmEN6fOmb74BHRB/Z0PwoWxNmCHc=; b=J1Jir+IEbWeo+8qYyHSvNsFfgr
 9Szhqd3FfD+CL0Yh6h2HxJkKaCOX3heQ4iSpRMEULNDHW3nO1wUflIPipqSNbvRTgKZd38xc4BGca
 cvmiPqrkIg95o+LfStr1SJ3gBh+OwS++XXpc069sqH2jyracr9DZgfHLvIUxUJdCQAN8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0F8/HC3SdyG65btVmEN6fOmb74BHRB/Z0PwoWxNmCHc=; b=JtXMT11njGKwI2nQhNsDYzRB7+
 aKYVJsefmFrdDnwWwPjzVqFD/INuur5aeeyxKr3hlb2XsWmn72ZpVymqpZ6lPt62ZS5RN48CmXf0z
 WM/VfFBv//o2MxEPZtw6wP7C6yRG+O0vuldJ3x790rPZB/O7NPU1hxp8iXZXWQc4LsYw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k8Y1Z-00GXPS-HD
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Aug 2020 00:01:47 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 62190207FB;
 Thu, 20 Aug 2020 00:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597881688;
 bh=Y+kpkmPLL8WjooRROXARVVZ8iA84IVdF6B0u8hywCAQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gZqPtsZYJlwjziUt8SDt7GU27LTo68VY2dgYLGQnEIONFmzkzwoAdIrhUDfstGXYa
 SXjVs5jU9p0wkI5HCECm0mWyqJkjVcBXlWfnCCLR5RDdT73kK1STLf97zpG772Q2BY
 RnrMjv4tEoBzWO2ZQK3rdetabOVcK3bbR9Zp5iA0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 19 Aug 2020 20:00:57 -0400
Message-Id: <20200820000116.214821-8-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200820000116.214821-1-sashal@kernel.org>
References: <20200820000116.214821-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: unisoc.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1k8Y1Z-00GXPS-HD
Subject: [f2fs-dev] [PATCH AUTOSEL 5.8 08/27] f2fs: should avoid inode
 eviction in synchronous path
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
 Zhiguo Niu <Zhiguo.Niu@unisoc.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jaegeuk Kim <jaegeuk@kernel.org>

[ Upstream commit b0f3b87fb3abc42c81d76c6c5795f26dbdb2f04b ]

https://bugzilla.kernel.org/show_bug.cgi?id=208565

PID: 257    TASK: ecdd0000  CPU: 0   COMMAND: "init"
  #0 [<c0b420ec>] (__schedule) from [<c0b423c8>]
  #1 [<c0b423c8>] (schedule) from [<c0b459d4>]
  #2 [<c0b459d4>] (rwsem_down_read_failed) from [<c0b44fa0>]
  #3 [<c0b44fa0>] (down_read) from [<c044233c>]
  #4 [<c044233c>] (f2fs_truncate_blocks) from [<c0442890>]
  #5 [<c0442890>] (f2fs_truncate) from [<c044d408>]
  #6 [<c044d408>] (f2fs_evict_inode) from [<c030be18>]
  #7 [<c030be18>] (evict) from [<c030a558>]
  #8 [<c030a558>] (iput) from [<c047c600>]
  #9 [<c047c600>] (f2fs_sync_node_pages) from [<c0465414>]
 #10 [<c0465414>] (f2fs_write_checkpoint) from [<c04575f4>]
 #11 [<c04575f4>] (f2fs_sync_fs) from [<c0441918>]
 #12 [<c0441918>] (f2fs_do_sync_file) from [<c0441098>]
 #13 [<c0441098>] (f2fs_sync_file) from [<c0323fa0>]
 #14 [<c0323fa0>] (vfs_fsync_range) from [<c0324294>]
 #15 [<c0324294>] (do_fsync) from [<c0324014>]
 #16 [<c0324014>] (sys_fsync) from [<c0108bc0>]

This can be caused by flush_dirty_inode() in f2fs_sync_node_pages() where
iput() requires f2fs_lock_op() again resulting in livelock.

Reported-by: Zhiguo Niu <Zhiguo.Niu@unisoc.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/node.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 03e24df1c84f5..e61ce7fb0958b 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1924,8 +1924,12 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 				goto continue_unlock;
 			}
 
-			/* flush inline_data, if it's async context. */
-			if (do_balance && is_inline_node(page)) {
+			/* flush inline_data/inode, if it's async context. */
+			if (!do_balance)
+				goto write_node;
+
+			/* flush inline_data */
+			if (is_inline_node(page)) {
 				clear_inline_node(page);
 				unlock_page(page);
 				flush_inline_data(sbi, ino_of_node(page));
@@ -1938,7 +1942,7 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 				if (flush_dirty_inode(page))
 					goto lock_node;
 			}
-
+write_node:
 			f2fs_wait_on_page_writeback(page, NODE, true, true);
 
 			if (!clear_page_dirty_for_io(page))
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
