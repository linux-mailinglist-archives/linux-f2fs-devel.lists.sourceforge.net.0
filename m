Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44345B51887
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Sep 2025 15:58:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bmE203GXmh8zG7OS3qixrO3FkRr/dMwTXpq8ftIZvEo=; b=MsFhIvBPG/A1xFTMezturj9k1D
	Peb7PH0Va+aXfIPQw3RtyPtOQkP8n4RrJtWlBf16Jv1LavBpAIlqFR3d8xpnkWjmcwWWhomamA2ZS
	EqIox6cZnO+BbYSwWz3R2k0WZgOGIWEWCGJIIw8rDIrw+RAnamVF4HFBDHdWigkKy8tE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uwLLX-0005U9-Qp;
	Wed, 10 Sep 2025 13:58:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1uwLLV-0005U2-Uq
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Sep 2025 13:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wvUQTcG3SbdHjADFcOIBR5Wv7dKb3YuZTkVfGMjxCjE=; b=iy8Mydj6+AHKQiEiKW0UjSl7nE
 aciimD9Udcr8Dt+rwkk9dW0gbOuh+L/hc3GVLqENZ+GspnO/l5Cvk5dtQR+IRCt7ysRWWD8itXIQu
 VSC8MpV+INoeZ5mXpmlHwyXu4cXqN4LVDdGk5+oM30K3D25TQhnNx66qSOVJLz48SYq4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wvUQTcG3SbdHjADFcOIBR5Wv7dKb3YuZTkVfGMjxCjE=; b=C
 H86ShyjE6AFpTuqzqTJ5Z6it+ssmxzDi+KPab8JE7Nk7XyxB/Cl5VdT/pYevqOwBgBYuv7gV5bbfq
 FHXqf5MiGk5zUY5iNutu18cVjWure0yv946iRjP7F0P/rEQA2Kx6kwDxoWO3uHYy5Zct8KJ7tHwBr
 0HWvwYDiikVyJHNk=;
Received: from mta20.hihonor.com ([81.70.206.69])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uwLLV-0002Yg-E6 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Sep 2025 13:58:49 +0000
Received: from w013.hihonor.com (unknown [10.68.26.19])
 by mta20.hihonor.com (SkyGuard) with ESMTPS id 4cMMhy5mjNzYkxhK;
 Wed, 10 Sep 2025 21:58:10 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w013.hihonor.com
 (10.68.26.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 10 Sep
 2025 21:58:37 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 10 Sep
 2025 21:58:36 +0800
From: wangzijie <wangzijie1@honor.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 10 Sep 2025 21:58:34 +0800
Message-ID: <20250910135835.2751574-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w001.hihonor.com (10.68.25.235) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: When the data layout is like this: dnode1: dnode2: [0] A [0]
 NEW_ADDR [1] A+1 [1] 0x0 ... .... [1016] A+1016 [1017] B (B!=A+1017) [1017]
 0x0 We can build this kind of layout by following steps(with
 i_extra_isize:36):
 ./f2fs_io write 1 0 1881 rand dsync testfile ./f2fs_io write 1 1881 1 rand
 buffered testfile ./f2fs_io fallocate 0 7708672 4 [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [81.70.206.69 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uwLLV-0002Yg-E6
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix wrong extent_info data for
 precache extents
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
Cc: wangzijie <wangzijie1@honor.com>, linux-kernel@vger.kernel.org,
 feng.han@honor.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When the data layout is like this:
dnode1:                     dnode2:
[0]      A                  [0]    NEW_ADDR
[1]      A+1                [1]    0x0
...                         ....
[1016]   A+1016
[1017]   B (B!=A+1017)      [1017] 0x0

We can build this kind of layout by following steps(with i_extra_isize:36):
./f2fs_io write 1 0 1881 rand dsync testfile
./f2fs_io write 1 1881 1 rand buffered testfile
./f2fs_io fallocate 0 7708672 4096 testfile

And when we map first data block in dnode2, we will get wrong extent_info data:
map->m_len = 1
ofs = start_pgofs - map->m_lblk = 1882 - 1881 = 1

ei.fofs = start_pgofs = 1882
ei.len = map->m_len - ofs = 1 - 1 = 0

Fix it by skipping updating this kind of extent info.

Signed-off-by: wangzijie <wangzijie1@honor.com>
---
 fs/f2fs/data.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 7961e0ddf..b8bb71852 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1649,6 +1649,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 
 		switch (flag) {
 		case F2FS_GET_BLOCK_PRECACHE:
+			if (__is_valid_data_blkaddr(map->m_pblk) &&
+				start_pgofs - map->m_lblk == map->m_len)
+				map->m_flags &= ~F2FS_MAP_MAPPED;
 			goto sync_out;
 		case F2FS_GET_BLOCK_BMAP:
 			map->m_pblk = 0;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
