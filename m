Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE3BB1029F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Jul 2025 10:02:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjBBTtEthIv6fNQf4CXbtKHHZ0kOuEzl1aL0/ZsnI2w=; b=Bit2+t+k0WetEwtOaq6o4nzKT+
	PKP2dUNXvCGh/P+7e432i3SWcEi2sFG5APFt3Xp9Zm47IKcUZdY7xpilZhkGHacmnVRbXaPJk8z9S
	w1X8LhDxXXMNoRI4Kr1T3u1S18Utuy13bJZxyPiyH8gMBFX966p+z4j+t0oeBGHtsY9o=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uequB-0007mO-5k;
	Thu, 24 Jul 2025 08:02:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uequ9-0007mA-SL
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 08:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nS8xFyAD+UKgL/mUzRE5ARhStV4d2VAHdpN/83kpMME=; b=aYWfiztIwLRDNKo2PURfk1JahI
 AIabuBSz2p9geqgJvjKAf3YjVrajzgoZF5aV/lHcLkdql8lRUVEmcF/3y3Zg3/ioSzxbCyDFrW++m
 84uMsOwmcn7inR9Jmyr6ujD06NrZYjjooigWcDc25tn0ONcfffkQ20QoZjgGqelx9X38=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nS8xFyAD+UKgL/mUzRE5ARhStV4d2VAHdpN/83kpMME=; b=TMXN7O9EIrf7717zAzEybRoA2C
 SUD6YFU/COUDxr3LPwFM22GzVGWEJRMg+BlyerQ2impkp+8VzqmpeNlz/r5vP0Dp4A3hv7RxAAhZ3
 qZ+gdDvNxkiMyEtjUgkpg0fXoOrHazYrw4slizmZTk+VGhRVuhAqXAyjmd4MenGtkPG0=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uequA-0007nG-8C for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 08:02:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9E986A55FD3;
 Thu, 24 Jul 2025 08:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52509C4CEED;
 Thu, 24 Jul 2025 08:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753344127;
 bh=fRw8i8MgDaa/zzz+GjX6hF/zrmeBnpKlxypHhTvVhO8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s8owUmmZeNt0ePvr/wi77YEo5E8/bYUnl+kURZ0+4axx0KbSmu9x5yuiujJ7UvAL1
 dDoSrXB1uP4fxehiuINAymABYtwBx1iCWpuJ+SmXM2KkyNj/xuL41IZ27zfC1+DHwG
 q2EHIKeGagVkTjtAy2SPYhxSC91aR6gc5iqP5mijB0tGij3XCQZMdxfELyxHqmrlIG
 b9xap2n3JOpcgltjDowCCOLkoS5q6coidBwV6Z3lN6HAczyne/mUj+SNAauOEaeUGm
 EutRU5qSLDoViVWC3iSBWKitB2gWiwzO8NbgnHOiJtLwvva6TE3oolmSAU8oAfndqG
 20bNrQDNWO3xg==
To: jaegeuk@kernel.org
Date: Thu, 24 Jul 2025 16:01:44 +0800
Message-ID: <20250724080144.3689181-3-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250724080144.3689181-1-chao@kernel.org>
References: <20250724080144.3689181-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  w/ "mode=lfs" mount option, generic/299 will cause system
 panic as below: [ cut here ] kernel BUG at fs/f2fs/segment.c:2835! Call Trace:
 <TASK> f2fs_allocate_data_block+0x6f4/0xc50 f2fs_map_blocks+0x970/0x1550
 f2fs_iomap_begin+0xb2/0x1e0 iomap_iter+0 [...] 
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
X-Headers-End: 1uequA-0007nG-8C
Subject: [f2fs-dev] [PATCH 3/3] f2fs: fix to trigger foreground gc during
 f2fs_map_blocks() in lfs mode
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

w/ "mode=lfs" mount option, generic/299 will cause system panic as below:

------------[ cut here ]------------
kernel BUG at fs/f2fs/segment.c:2835!
Call Trace:
 <TASK>
 f2fs_allocate_data_block+0x6f4/0xc50
 f2fs_map_blocks+0x970/0x1550
 f2fs_iomap_begin+0xb2/0x1e0
 iomap_iter+0x1d6/0x430
 __iomap_dio_rw+0x208/0x9a0
 f2fs_file_write_iter+0x6b3/0xfa0
 aio_write+0x15d/0x2e0
 io_submit_one+0x55e/0xab0
 __x64_sys_io_submit+0xa5/0x230
 do_syscall_64+0x84/0x2f0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
RIP: 0010:new_curseg+0x70f/0x720

The root cause of we run out-of-space is: in f2fs_map_blocks(), f2fs may
trigger foreground gc only if it allocates any physical block, it will be
a little bit later when there is multiple threads writing data w/
aio/dio/bufio method in parallel, since we always use OPU in lfs mode, so
f2fs_map_blocks() does block allocations aggressively.

In order to fix this issue, let's give a chance to trigger foreground
gc in prior to block allocation in f2fs_map_blocks().

Fixes: 36abef4e796d ("f2fs: introduce mode=lfs mount option")
Cc: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 4e62f7f00b70..ffcaf91c1703 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1573,8 +1573,11 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	end = pgofs + maxblocks;
 
 next_dnode:
-	if (map->m_may_create)
+	if (map->m_may_create) {
+		if (f2fs_lfs_mode(sbi))
+			f2fs_balance_fs(sbi, true);
 		f2fs_map_lock(sbi, flag);
+	}
 
 	/* When reading holes, we need its node page */
 	set_new_dnode(&dn, inode, NULL, NULL, 0);
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
