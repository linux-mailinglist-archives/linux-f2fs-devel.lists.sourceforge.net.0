Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD911A9CAD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 13:37:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOgMA-0003gq-ET; Wed, 15 Apr 2020 11:37:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1jOgM9-0003gR-5K
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YB+yV7ZFvxwKdNL5EhXcd0CtlleIyCrm8FhXsc4MBQQ=; b=YWtHVYzxtBkp8fqqR8cOynBUqg
 j6Mz2hkQbq95GgLYiX8090Qvn8u8rS8QbjdgvencXhh5kaVdMF9y6AxsOgUC2NDILYzfVHZZbelsc
 F+gQwV/iUSlUB2RWl+5Hrjs4HzaqiUc8K+gaOgrNhTWldYqbGE3f/74TlnAhXXC3Agq0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YB+yV7ZFvxwKdNL5EhXcd0CtlleIyCrm8FhXsc4MBQQ=; b=KEh7+jwG+/rYH+UC2LVwMMxvHo
 KI25i3vgmS2VyytTWAj42wU1eUlMYgK59zWzXdYJelSYivqM/1CRHDrJDlR52kRBTkmps8DakD6eE
 yGSx1mVgtFHJnhD9op4EuGKPoNzrIDAZwLsnQmRdkgPOrjWhWfSIR+guRYmebvEHmQl0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOgM7-002Xim-FL
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:37:25 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 57DE921582;
 Wed, 15 Apr 2020 11:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586950638;
 bh=a+GnE5fjJanhytnMSWobgz08WY8xeM5hUkfKKeBAIG8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eqplRrVd1IEWbUhNR05uRalj1WI7lJztrB7D0vCxY4XVT02EropWz0iE6rxrrudcu
 thZeCjvJr4yndyhkm4Uje8IoeRp+HmONrbtWAhIPGR34FLog49DvC1eADrjlK98GxD
 ls82uo7+XuHcK18NWts+OfCHDM6q/QEjzKhvONII=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 15 Apr 2020 07:34:43 -0400
Message-Id: <20200415113445.11881-128-sashal@kernel.org>
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
X-Headers-End: 1jOgM7-002Xim-FL
Subject: [f2fs-dev] [PATCH AUTOSEL 5.6 128/129] f2fs: fix to wait all node
 page writeback
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

[ Upstream commit dc5a941223edd803f476a153abd950cc3a83c3e1 ]

There is a race condition that we may miss to wait for all node pages
writeback, fix it.

- fsync()				- shrink
 - f2fs_do_sync_file
					 - __write_node_page
					  - set_page_writeback(page#0)
					  : remove DIRTY/TOWRITE flag
  - f2fs_fsync_node_pages
  : won't find page #0 as TOWRITE flag was removeD
  - f2fs_wait_on_node_pages_writeback
  : wont' wait page #0 writeback as it was not in fsync_node_list list.
					   - f2fs_add_fsync_node_entry

Fixes: 50fa53eccf9f ("f2fs: fix to avoid broken of dnode block list")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/node.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 9d02cdcdbb073..e58c4c6288346 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1562,15 +1562,16 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 	if (atomic && !test_opt(sbi, NOBARRIER))
 		fio.op_flags |= REQ_PREFLUSH | REQ_FUA;
 
-	set_page_writeback(page);
-	ClearPageError(page);
-
+	/* should add to global list before clearing PAGECACHE status */
 	if (f2fs_in_warm_node_list(sbi, page)) {
 		seq = f2fs_add_fsync_node_entry(sbi, page);
 		if (seq_id)
 			*seq_id = seq;
 	}
 
+	set_page_writeback(page);
+	ClearPageError(page);
+
 	fio.old_blkaddr = ni.blk_addr;
 	f2fs_do_write_node_page(nid, &fio);
 	set_node_addr(sbi, &ni, fio.new_blkaddr, is_fsync_dnode(page));
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
