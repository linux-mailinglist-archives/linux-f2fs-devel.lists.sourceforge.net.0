Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B564D37D18A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 May 2021 20:01:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgtAp-0006t8-I6; Wed, 12 May 2021 18:01:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1lgtAn-0006su-8p
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 18:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S9ycmTD5rvXjvEaCE9hxvJCbl7ucoPeUE/0NlpOlSy8=; b=IToIW3BnCfDnYXyZE/ILAaRlPv
 B1zJ8ZjeSTbxQbM6NTFgGUSZmkK4IyPPOT3qHV9HzdHPCO6RvNG6jEP1nytFGPeIWGJeUs9g/gkIg
 aQVWSvsyWFqcRt8SyDq7d83zDPZ7JkPoDJVcuz4ozV10FXSQaMdvW1WIJa91u0ukF3SI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S9ycmTD5rvXjvEaCE9hxvJCbl7ucoPeUE/0NlpOlSy8=; b=Yr6jeWy13B/usXIsowsM1NBNjc
 lrmAKysayWKmyM/LCNotbgvBf+aDe26sMzaH0S3O7xLnSb/V7LVeYvYZmpdM4XrZNV3J5nu40lft2
 PeS0fh+HlWRw0p7fGFZLGrIs3Lx0RbIn8uE50vhVK6vowIZIMZE017gGWHtPT/TLZgzY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lgtAl-005mVK-W0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 18:01:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25F3E6142E;
 Wed, 12 May 2021 18:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620842482;
 bh=bWz4/XD3J30A/jYe5Mc4TCW/KGYds5fBxUPj4yitj6c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mQqvSBI1DnWzi3L0XGxU2FxMfYPcxcwg5rhMxKdBPgqOX5B+vTNNdj/aqwjWZSMcX
 dZoB9AOpxWkohLNDdeXd9TDmKq0mw5IDj+IKzgIh+776b890LcSSp4Risa8VlLicfS
 x00RpVIHFH9768n8nxNXBqjdkEe9K5ooMTsABEoQV78Ie/uIEZCy+Iqyz/TQgVcRrg
 YTGcpmB4RXCmmvZwi5egTbzFuD7OBWiHVYdS3IPk44JqxkELtrhv2tir92OVyNsJAv
 SBzEuA73s81GKIjiXgpSMoFaAfO0iRHFMGpbU182pRfTFxdbo5J0M0Oi/yfs0ZlZKt
 aWkF/39sUj+WQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 12 May 2021 14:00:39 -0400
Message-Id: <20210512180104.664121-12-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210512180104.664121-1-sashal@kernel.org>
References: <20210512180104.664121-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.8 (/)
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
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lgtAl-005mVK-W0
Subject: [f2fs-dev] [PATCH AUTOSEL 5.12 12/37] f2fs: fix to avoid NULL
 pointer dereference
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
Cc: Sasha Levin <sashal@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yi Chen <chenyi77@huawei.com>

[ Upstream commit 594b6d0428ae304e0b44457398beb458b938f005 ]

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
pc : f2fs_put_page+0x1c/0x26c
lr : __revoke_inmem_pages+0x544/0x75c
f2fs_put_page+0x1c/0x26c
__revoke_inmem_pages+0x544/0x75c
__f2fs_commit_inmem_pages+0x364/0x3c0
f2fs_commit_inmem_pages+0xc8/0x1a0
f2fs_ioc_commit_atomic_write+0xa4/0x15c
f2fs_ioctl+0x5b0/0x1574
file_ioctl+0x154/0x320
do_vfs_ioctl+0x164/0x740
__arm64_sys_ioctl+0x78/0xa4
el0_svc_common+0xbc/0x1d0
el0_svc_handler+0x74/0x98
el0_svc+0x8/0xc

In f2fs_put_page, we access page->mapping is NULL.
The root cause is:
In some cases, the page refcount and ATOMIC_WRITTEN_PAGE
flag miss set for page-priavte flag has been set.
We add f2fs_bug_on like this:

f2fs_register_inmem_page()
{
	...
	f2fs_set_page_private(page, ATOMIC_WRITTEN_PAGE);

	f2fs_bug_on(F2FS_I_SB(inode), !IS_ATOMIC_WRITTEN_PAGE(page));
	...
}

The bug on stack follow link this:
PC is at f2fs_register_inmem_page+0x238/0x2b4
LR is at f2fs_register_inmem_page+0x2a8/0x2b4
f2fs_register_inmem_page+0x238/0x2b4
f2fs_set_data_page_dirty+0x104/0x164
set_page_dirty+0x78/0xc8
f2fs_write_end+0x1b4/0x444
generic_perform_write+0x144/0x1cc
__generic_file_write_iter+0xc4/0x174
f2fs_file_write_iter+0x2c0/0x350
__vfs_write+0x104/0x134
vfs_write+0xe8/0x19c
SyS_pwrite64+0x78/0xb8

To fix this issue, let's add page refcount add page-priavte flag.
The page-private flag is not cleared and needs further analysis.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Ge Qiu <qiuge@huawei.com>
Signed-off-by: Dehe Gu <gudehe@huawei.com>
Signed-off-by: Yi Chen <chenyi77@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/segment.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c2866561263e..9010c3d9715e 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -186,7 +186,10 @@ void f2fs_register_inmem_page(struct inode *inode, struct page *page)
 {
 	struct inmem_pages *new;
 
-	f2fs_set_page_private(page, ATOMIC_WRITTEN_PAGE);
+	if (PagePrivate(page))
+		set_page_private(page, (unsigned long)ATOMIC_WRITTEN_PAGE);
+	else
+		f2fs_set_page_private(page, ATOMIC_WRITTEN_PAGE);
 
 	new = f2fs_kmem_cache_alloc(inmem_entry_slab, GFP_NOFS);
 
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
