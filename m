Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F388300E9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jan 2024 09:01:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rQ0rK-0003RN-ID;
	Wed, 17 Jan 2024 08:01:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rQ0rJ-0003RA-1m
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jan 2024 08:01:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IOOsplWBX/FWwLYw30kvJFAiaGIcndHxRRDbMOcL68w=; b=UBXx6EnPzjlpQxscN0G6u/rTti
 GLzqIv35t9rhMK7HJFxq18+E9qtDWjtwDA+I2MAXg8YTYf4AvNR/yFiyKuaVDlUP8K4t3vYzG7MJr
 wkur0FMGQUBriuMuTc/FrVrKNxXWVbOCheBE9QdmUKDJNBQFMj3t+9wVKe/ZqJRUEBcg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IOOsplWBX/FWwLYw30kvJFAiaGIcndHxRRDbMOcL68w=; b=J
 2A4jo9+kyZ3aBNzmInaICmw0JfGNnLhrukRh61+dOBSmTT323r48c8tgfLR+kQSHAZpHYwE3Ydv/6
 t6sidUqa61xU9wz2wvYNgpMnjk0CS39iabMV/K2l0a8EB/cMTr5KbuTqMgZ6oxJHy2QKypt5WPWVa
 6I2S/yGJ5aMHTgSc=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rQ0rD-0005v6-A6 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jan 2024 08:01:13 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 40H80Onq001047;
 Wed, 17 Jan 2024 16:00:24 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4TFJ5k6lPYz2RN15k;
 Wed, 17 Jan 2024 15:53:14 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 17 Jan 2024 16:00:22 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 17 Jan 2024 15:59:58 +0800
Message-ID: <1705478398-10890-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 40H80Onq001047
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Now IS_DNODE is used in f2fs_flush_inline_data and it has
 some problems: 1. Just only inodes may include inline data,not all direct
 nodes 2. When system IO is busy, it is inefficient to lock a direct [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rQ0rD-0005v6-A6
Subject: [f2fs-dev] [PATCH] f2fs: use IS_INODE replace IS_DNODE in
 f2fs_flush_inline_data
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
Cc: ke.wang@unisoc.com, zhiguo.niu@unisoc.com, niuzhiguo84@gmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Now IS_DNODE is used in f2fs_flush_inline_data and it has some problems:
1. Just only inodes may include inline data,not all direct nodes
2. When system IO is busy, it is inefficient to lock a direct node page
but not an inode page. Besides, if this direct node page is being
locked by others for IO, f2fs_flush_inline_data will be blocked here,
which will affects the checkpoint process, this is unreasonable.

So IS_INODE should be used in f2fs_flush_inline_data.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/node.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 541c4ad..a8fe49a3 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1919,7 +1919,7 @@ void f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
 		for (i = 0; i < nr_folios; i++) {
 			struct page *page = &fbatch.folios[i]->page;
 
-			if (!IS_DNODE(page))
+			if (!IS_INODE(page))
 				continue;
 
 			lock_page(page);
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
