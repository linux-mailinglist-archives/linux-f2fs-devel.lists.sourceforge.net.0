Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF58F1A9C68
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 13:35:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOgK7-00034n-NN; Wed, 15 Apr 2020 11:35:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1jOgK1-00034J-FW
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c9/V/6oRSlgIA4zRytOoF3D6DED5OULll5Zm3Cvzpsw=; b=ZCS6nCakGIyxktzBBXDdEpeZdk
 B3c2TAW+M7IV6vhQoZFTCD1cDXwY32y31F6S1Q2upboggYTBBf1A74HCeS7RjsTLMLFp2cky4kyJ8
 3HEUD8ru/5CcwfAfL4nqtRBXnH/PN5aH4/xPMpq4YlL3Vucpceza/8gS8citjdP4ijDE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c9/V/6oRSlgIA4zRytOoF3D6DED5OULll5Zm3Cvzpsw=; b=QG3SqeAt827J/+HvO9jmIZrstp
 nywpbXKQu1CmKjHbMraPvxC7vCLuNeKdINDDXoN0KbZvPF+zVuQVNU62Sx6ZDXrQLjSdJvsBwSkEZ
 PxpOoE83hO83SbEXqv5+AJRYYettP9zCJ6twkiShw7GjdIYU2pZPie2glcMkCM5XcVJY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOgJx-000F0e-Ix
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:35:13 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EAEA520857;
 Wed, 15 Apr 2020 11:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586950502;
 bh=Pk3LH+KtmLOnF31lo8mARZysIUUWRRZBhV3Ch4KKeVI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gCQkZOt18wS5nOnSEVmt6zMpF4xPoszlNzFqPApeVIREvWSKvQj6LkWKI/lE2bt35
 H5/+DFtW6ECEPc+7rbwNCUUKGuNgqDD0bn1p28QjAX29R5zQ+CA2V3LfQr8O7fvtzi
 RMrEt8TlWp7RAArRoRiLUly9dGKpaIF6jS+MBSXQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 15 Apr 2020 07:32:49 -0400
Message-Id: <20200415113445.11881-14-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415113445.11881-1-sashal@kernel.org>
References: <20200415113445.11881-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.4 (/)
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jOgJx-000F0e-Ix
Subject: [f2fs-dev] [PATCH AUTOSEL 5.6 014/129] f2fs: fix to avoid
 use-after-free in f2fs_write_multi_pages()
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

[ Upstream commit 95978caa138948054e06d00bfc3432b518699f1b ]

In compress cluster, if physical block number is less than logic
page number, race condition will cause use-after-free issue as
described below:

- f2fs_write_compressed_pages
 - fio.page = cic->rpages[0];
 - f2fs_outplace_write_data
					- f2fs_compress_write_end_io
					 - kfree(cic->rpages);
					 - kfree(cic);
 - fio.page = cic->rpages[1];

f2fs_write_multi_pages+0xfd0/0x1a98
f2fs_write_data_pages+0x74c/0xb5c
do_writepages+0x64/0x108
__writeback_single_inode+0xdc/0x4b8
writeback_sb_inodes+0x4d0/0xa68
__writeback_inodes_wb+0x88/0x178
wb_writeback+0x1f0/0x424
wb_workfn+0x2f4/0x574
process_one_work+0x210/0x48c
worker_thread+0x2e8/0x44c
kthread+0x110/0x120
ret_from_fork+0x10/0x18

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/compress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index c847523ab4a2e..927db1205bd81 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -845,7 +845,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 
 		blkaddr = datablock_addr(dn.inode, dn.node_page,
 							dn.ofs_in_node);
-		fio.page = cic->rpages[i];
+		fio.page = cc->rpages[i];
 		fio.old_blkaddr = blkaddr;
 
 		/* cluster header */
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
