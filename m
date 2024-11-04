Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DBB9BAA58
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Nov 2024 02:37:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t7m1d-0004D2-4W;
	Mon, 04 Nov 2024 01:37:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t7m1b-0004Cm-3k
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 01:36:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rrD7YvAZA8CT19i/sPpkO8jMbpO92R4+EjMZSWcFURY=; b=m4JReKEAoHVkHDLRl0Cpblmnfz
 4yWS+4pEJkkmGeEkW8Z/wEXGdMnwjovBqW2uvce6D6vErfmLsKx3MldkFejUtH/lhDamRGmbin/WE
 P71+iNW/ju7B349n3eYV/0bRqr52Xnt9sLpueiNxQgIbBhcThiVZKRg2I2Ga48WlLgJs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rrD7YvAZA8CT19i/sPpkO8jMbpO92R4+EjMZSWcFURY=; b=T
 8sLXeucW5qoaTg2IWq+T8J0IsCd5jRG+XDB4IsVuaKZ9eLYx35o8n6hZcRkkySeKjR9pvXNdQK/Fw
 OnV0bzzJBmQR6H5VEk9Jm/e6b+86T/1EIPahFsK++lPfryfAinFtiyW9fTNme1HtdEWzAp3VVRI0y
 Mn1p7poqXW76Wgmk=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t7m1b-0006zO-7Q for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 01:36:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 251C2A42147;
 Mon,  4 Nov 2024 01:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3F4C4CECD;
 Mon,  4 Nov 2024 01:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730684208;
 bh=kOryAQM4duw0dSZR9ghUXtvCm+rxu8rIgQehlsp/gC8=;
 h=From:To:Cc:Subject:Date:From;
 b=uILrES3AeTFNzGrP0HbXzeqOAQnTjG8RSuGibrOCTfqPQdvBNStI13HOt38a7K8m8
 cE3h+lKkIE6+V1julMJmaEr8Yv6i3Ea/aEDHqjr71SYezE4ZUUEmgnCmVuLuK3PdS6
 tTSKd/i9n0S/dPJcTGppzTuFiQlyO3gDmWp1vTB4tjdF0Yr7lGPcqyJgUifBsa73Q3
 mxQBchudFUnl/jiBMH44blwC1LIKSqIZkR1G8tMeJWQZHHGkDOXjJ0/0Ky2WZhl613
 z9uRjXjEVDqsNbh/v/OmrKW8aSdtlX3v7698t2jdIKW87xcXTeXaWBDq0tWvd4EzJR
 +P8XrtkaWR8Xw==
To: jaegeuk@kernel.org
Date: Mon,  4 Nov 2024 09:35:51 +0800
Message-Id: <20241104013551.218037-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs_map_blocks() supports to map continuous holes or
 preallocated
 address, we should avoid setting F2FS_MAP_MAPPED for these cases only,
 otherwise, 
 it may fail f2fs_iomap_begin(), and make direct wri [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t7m1b-0006zO-7Q
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to map blocks correctly for direct
 write
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: kernel test robot <oliver.sang@intel.com>, linux-kernel@vger.kernel.org,
 Cyril Hrubis <chrubis@suse.cz>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs_map_blocks() supports to map continuous holes or preallocated
address, we should avoid setting F2FS_MAP_MAPPED for these cases
only, otherwise, it may fail f2fs_iomap_begin(), and make direct
write fallbacking to use buffered IO and flush, result in performance
regression.

Fixes: 9f0f6bf42714 ("f2fs: support to map continuous holes or preallocated address")
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202409122103.e45aa13b-oliver.sang@intel.com
Cc: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- fix wrong commit tile
- clean up code and comment suggested by Jaegeuk
 fs/f2fs/data.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 306b86b0595d..7d1bb9518a40 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1676,7 +1676,8 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 		/* reserved delalloc block should be mapped for fiemap. */
 		if (blkaddr == NEW_ADDR)
 			map->m_flags |= F2FS_MAP_DELALLOC;
-		if (flag != F2FS_GET_BLOCK_DIO || !is_hole)
+		/* DIO READ and hole case, should not map the blocks. */
+		if (!(flag == F2FS_GET_BLOCK_DIO && is_hole && !map->m_may_create))
 			map->m_flags |= F2FS_MAP_MAPPED;
 
 		map->m_pblk = blkaddr;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
