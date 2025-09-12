Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B5BB54804
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Sep 2025 11:39:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+fno511GW56ChNQzoQ2tY1gACSYbJn+4Lmm1U2TTFxY=; b=ChYWIccj4yTrGc9Ux74aWsMF+r
	gyOl9almjB5E3m2MlX1JhNrc8wadNvcU/xADAFc5HmvJfG3/KmH/pKgjFeu4YCxRCtw/C8ZFDHKJA
	KQoXgAcNgVOV0I6NYG8RcSVXtwYoAbjRFmVjP5pjG12RaqHIW+hL1XpP204LJupAe/og=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ux0FE-0003gl-CC;
	Fri, 12 Sep 2025 09:39:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ux0FC-0003ge-8l
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Sep 2025 09:39:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jPNUacv0O7fRysCu3jrCmu5UbAOEB2zqXqgUr6YoZGg=; b=GTg/m5XW2aMHTmPQNOhw2UJJKK
 BymcICVw1qHvqWlL+iSuoYPk3144J5u2S8HcGjTduP3nIXaee69CnE/4zkO556MWVjXZSYn+5lD55
 dnnwq00gtfYkdO3808oNLGI1Ygwn5lvEpIhRWL2ahc3ck9yYXfXtszyP7Wrr91tht2dQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jPNUacv0O7fRysCu3jrCmu5UbAOEB2zqXqgUr6YoZGg=; b=X
 I8G0ezfbJfGzm80GXdNnMlxnMAdh0BYXAz+hW0AoT2kLEWPMejCWrBmDmio29J7wfsFg1N+Br5gDw
 P+zX/+vYsVKtZcFoOm/trD+CddNc0cqqixxjsHBSev6MBhiHkJiptWL0HGOAi3vrHPtlYX+GKnqz9
 5iPeXfihyGCxRceY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ux0FB-00051A-Nw for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Sep 2025 09:39:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D4CF7601E8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Sep 2025 09:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87B1C4CEF1;
 Fri, 12 Sep 2025 09:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757669930;
 bh=C2C7RcRgI+D6tUKplepFjuIGNKR+l3pPP2sgq1FegGs=;
 h=From:To:Cc:Subject:Date:From;
 b=L3GZr48lQ48DqpOQds2/ux8pi30yfFwp6lMWAKNU33jL0GOujdt4zW+qs1tu2yB2O
 TJDufuG8i1SDQPae5lPD7tvKrIWBbn20JyZxcyNkBj+4hfbr4Rr0Dsq1AjYj6rTvg3
 b5AF6aupMKeZe7jvhdz2qZSubqtORlb18uC893UeIAtg7mKYi039/ywcbHCsBiwBBk
 yPvmN6EfBmrXOrDL/ET/zC/d1/kolJW+Zvk8VJXcAqVa55x5St416xpgh2Kycfnve0
 hishI/KsPfRcfEBoHR8QRPWLHLo1NVJk739O8lh3ZZOAJPg1/vXre3VwRHHo9HpF9a
 /FL2qx+PYnzLw==
To: jaegeuk@kernel.org
Date: Fri, 12 Sep 2025 16:12:50 +0800
Message-Id: <20250912081250.44383-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Script to reproduce: mkfs.f2fs -O extra_attr,
 compression /dev/vdb
 -f mount /dev/vdb /mnt/f2fs -o mode=lfs,noextent_cache cd /mnt/f2fs f2fs_io
 write 1 0 1024 rand dsync testfile xfs_io testfile -c "fsy [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ux0FB-00051A-Nw
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to update map->m_next_extent
 correctly in f2fs_map_blocks()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Script to reproduce:
mkfs.f2fs -O extra_attr,compression /dev/vdb -f
mount /dev/vdb /mnt/f2fs -o mode=lfs,noextent_cache
cd /mnt/f2fs
f2fs_io write 1 0 1024 rand dsync testfile
xfs_io testfile -c "fsync"
f2fs_io write 1 0 512 rand dsync testfile
xfs_io testfile -c "fsync"
cd /
umount /mnt/f2fs
mount /dev/vdb /mnt/f2fs
f2fs_io precache_extents /mnt/f2fs/testfile
umount /mnt/f2fs

Tracepoint output:
f2fs_update_read_extent_tree_range: dev = (253,16), ino = 4, pgofs = 0, len = 512, blkaddr = 1055744, c_len = 0
f2fs_update_read_extent_tree_range: dev = (253,16), ino = 4, pgofs = 513, len = 351, blkaddr = 17921, c_len = 0
f2fs_update_read_extent_tree_range: dev = (253,16), ino = 4, pgofs = 864, len = 160, blkaddr = 18272, c_len = 0

During precache_extents, there is off-by-one issue, we should update
map->m_next_extent to pgofs rather than pgofs + 1, if last blkaddr is
valid and not contiguous to previous extent.

Fixes: c4020b2da4c9 ("f2fs: support F2FS_IOC_PRECACHE_EXTENTS")
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- clean up codes
 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6bb03add93fe..d747850e765f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1782,7 +1782,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 				map->m_len - ofs);
 		}
 		if (map->m_next_extent)
-			*map->m_next_extent = pgofs + 1;
+			*map->m_next_extent = is_hole ? pgofs + 1 : pgofs;
 	}
 	f2fs_put_dnode(&dn);
 unlock_out:
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
