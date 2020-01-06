Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E136130E44
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jan 2020 09:02:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ioNL1-0004DW-1u; Mon, 06 Jan 2020 08:02:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ioNKz-0004DO-N2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jan 2020 08:02:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z24SyhueFvCeacIA5kVChaWXmwLpqrKPVQAHlSINtlE=; b=N6CqY0ei5yfO21Pn6eJk2X3T1G
 phL2usSZ6O8+31azsFAXhwYERjGjDhFLvrJ/D92iiP4anUm0xxUiu1MRR1rJen17Imzk32xJ1dtG6
 tq7c71DdhICSt5gwCA9V3nENZ2ORdgMEJV/Mqq/PQS+J4bHIvdFTlIZMHU0b1R3xFT0E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=z24SyhueFvCeacIA5kVChaWXmwLpqrKPVQAHlSINtlE=; b=f
 /91xhrex4o7f/rAe5eD8Az/588SrbEmxrxmTNzGqprGnIQdSCpBy14vHb+U3NZBJSVaqNVjP6chlV
 CB23wFpuJHNwJ7Ff8zJwUYLe4F4kFYqYmH9MVvHl9jP7yAUwQj2bRpxbleVHBcf/SunlHXemJJGfp
 4vVaUoemiBIU5DBY=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ioNKx-00BaJV-Ve
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jan 2020 08:02:09 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E51A1A58AD1726910730;
 Mon,  6 Jan 2020 16:01:55 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Mon, 6 Jan 2020 16:01:47 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 6 Jan 2020 16:01:41 +0800
Message-ID: <20200106080144.52363-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ioNKx-00BaJV-Ve
Subject: [f2fs-dev] [PATCH 1/4] f2fs: compress: fix panic in mkwrite
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

[ 1237.458208] invalid opcode: 0000 [#1] SMP PTI
[ 1237.458228] CPU: 9 PID: 6291 Comm: fsstress Tainted: G           OE     5.5.0-rc1 #36
[ 1237.458255] Hardware name: Xen HVM domU, BIOS 4.1.2_115-908.790. 06/05/2017
[ 1237.458299] RIP: 0010:f2fs_vm_page_mkwrite+0x1c6/0x630 [f2fs]
[ 1237.458321] Code: d6 fe ff ff 49 8b 75 20 48 89 df e8 24 0a 05 00 85 c0 41 89 c7 78 8e 0f 84 bd fe ff ff 45 31 f6 41 83 ff 02 0f 85 c3 fe ff ff <0f> 0b 45 84 f6 0f 84 e4 00 00 00 ba 01 00 00 00 be 05 00 00 00 48
[ 1237.458374] RSP: 0000:ffffaecdc0c1bd38 EFLAGS: 00010246
[ 1237.458395] RAX: 0000000000000002 RBX: ffff9241c5b5d8c0 RCX: 0000000000000000
[ 1237.458418] RDX: ffffeeb715d42407 RSI: ffff9242d8085168 RDI: 0000000000000000
[ 1237.458441] RBP: ffff9243f1c67000 R08: 0000000000017677 R09: 0000000000000004
[ 1237.458463] R10: 0000000000000000 R11: ffff9242d8085000 R12: ffffaecdc0c1bdf8
[ 1237.458488] R13: ffffeeb715d037c0 R14: 0000000000000000 R15: 0000000000000002
[ 1237.458512] FS:  00007f71f28ce700(0000) GS:ffff92443d840000(0000) knlGS:0000000000000000
[ 1237.458540] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1237.458561] CR2: 00007f71f28c9000 CR3: 00000007e0ba2003 CR4: 00000000001606e0
[ 1237.458586] Call Trace:
[ 1237.458611]  do_page_mkwrite+0x5a/0xc0
[ 1237.458630]  __handle_mm_fault+0xb81/0x12a0
[ 1237.458648]  ? do_mmap+0x4bd/0x640
[ 1237.458665]  handle_mm_fault+0xe3/0x1d0
[ 1237.458686]  __do_page_fault+0x288/0x500
[ 1237.458704]  do_page_fault+0x30/0x120
[ 1237.458725]  page_fault+0x3e/0x50

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/file.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 9aeadf14413c..f18d1262b274 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -72,7 +72,10 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 			err = ret;
 			goto err;
 		} else if (ret) {
-			f2fs_bug_on(sbi, ret == CLUSTER_HAS_SPACE);
+			if (ret == CLUSTER_HAS_SPACE) {
+				err = -EAGAIN;
+				goto err;
+			}
 			need_alloc = false;
 		}
 	}
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
