Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EC09B788D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Oct 2024 11:22:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t6SJr-0008IB-4u;
	Thu, 31 Oct 2024 10:22:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t6SJp-0008I3-Lr
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Oct 2024 10:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XWqzf9LoFWjYSmqYo191TIieTpcELol93FNvkEYRcNY=; b=dg36zVd1sFoiyDXj0etRT56fEr
 ey5Cj71mfjEGsjLYI/RtnpmdVjP/xWfpcfY6tssGKQOMeNaNp56bqEPdGh82J8s6Pgd50c+dR1XyP
 GqpMAMH49tQqPTEBNkq/wgsLzLUUQ5gg9H6MBjBp1QaTQJK6P4ath/aOhVEWdkpSuSok=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XWqzf9LoFWjYSmqYo191TIieTpcELol93FNvkEYRcNY=; b=K
 te+VAyKHiKQXnFKWxp2gBZZ3GYoqLD8PGaTwN37i6syF5R3GxyopGSgwW6HpF/mBXtFRlYkrZi01d
 dWstRkCWQp+RLiPOrPIEkDYRvrv7+4OJ693Yl+hbItNvsTVuw0luD3LUJZBqgRUmptALOU4yw3lMp
 ufgUsFTsIPupe19M=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t6SJn-0007m7-6L for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Oct 2024 10:22:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C057FA43F0E;
 Thu, 31 Oct 2024 10:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914AAC4CEC3;
 Thu, 31 Oct 2024 10:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730370128;
 bh=atsobAgsQWm0gfnvx5sgtWzsfSlYFgDXXPQwPH8yk+Y=;
 h=From:To:Cc:Subject:Date:From;
 b=gRjiE2Zv6K9mIqVk9q+GdWt/ROugF/OwrG5lQ/nv/sDCE2ym8wB1AJ9Ack4T/ZWYH
 b2OxvXNIXTmOqsDJgUixOHHOhJo8shjwFknIFUZL/fhx917RW4qf5snZhZG4bPFR7k
 USi0uHznV7jJKUcNk3KQPjJvHAf+Fam9RX47mIiAQIIblImxgP1LrpmeKyZFr5OMhO
 6VowpHORBmg/zQGQFkuIzqnyl7YSltegWMVjCNXk1AMk87SJfqZVmcPxhcXhBrrDSA
 2iBrLewg7PoBA8oz9K8X+6v7/lQY2TARdgBVHmduX3yY5gCe6gFQVG0jRiVuQbyd/g
 SUuR/qeL7DIzw==
To: jaegeuk@kernel.org
Date: Thu, 31 Oct 2024 18:22:00 +0800
Message-Id: <20241031102200.440407-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.6 (/)
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
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t6SJn-0007m7-6L
Subject: [f2fs-dev] [PATCH] f2fs: fix to map blocks correctly for direct read
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
 fs/f2fs/data.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 306b86b0595d..38b85160c6bd 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1676,7 +1676,12 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 		/* reserved delalloc block should be mapped for fiemap. */
 		if (blkaddr == NEW_ADDR)
 			map->m_flags |= F2FS_MAP_DELALLOC;
-		if (flag != F2FS_GET_BLOCK_DIO || !is_hole)
+		/*
+		 * f2fs_map_blocks() supports to map continuous holes or
+		 * preallocated address, don't set F2FS_MAP_MAPPED for these
+		 * cases only.
+		 */
+		if (flag != F2FS_GET_BLOCK_DIO || map->m_may_create || !is_hole)
 			map->m_flags |= F2FS_MAP_MAPPED;
 
 		map->m_pblk = blkaddr;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
