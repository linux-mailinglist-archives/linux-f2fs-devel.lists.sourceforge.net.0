Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 947EB3E9267
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 15:18:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDo86-0004if-0H; Wed, 11 Aug 2021 13:18:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <frank.li@vivo.com>) id 1mDo84-0004iQ-7C
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 13:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h2e8XZqa5YXI0doeDN9YIxWMLluf9SK2ARCVm4ObNW0=; b=aUWyVo9uMO0J4RBs1SBB1reLtQ
 1u299AX2MRIboWyzG0tdZCGy3uMS8qXeEV68fa3DK/xoTyL/6LQ1PohSlSoLtwxwt0HUKNF7TshFi
 EuJxl1oxhZ+uCSU7kOMk5XPWYSdcXzPmISQSgu45DXFGfJT82110Ilyetz0Pt56FSgnc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=h2e8XZqa5YXI0doeDN9YIxWMLluf9SK2ARCVm4ObNW0=; b=U
 SJWcYjD4XaM9Io5dnpMDCafHz//SqNzgbNbNj6FA0Ky7Ie5nBx3rm98CRyLB7V33CLjsuNTWcPACq
 XKTTh/5BlxF8xOR2D/5bbd6xeP7j60MN9CR0lFDgIpWuCGcE6r/dX/OH2nd6bgzx1qZNSEPvJD0sh
 Lv1SYffZ7Qk0MojY=;
Received: from mail-m17636.qiye.163.com ([59.111.176.36])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDo80-0006Pu-4U
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 13:18:44 +0000
Received: from comdg01144022.vivo.xyz (unknown [218.104.188.165])
 by mail-m17636.qiye.163.com (Hmail) with ESMTPA id A7411C40091;
 Wed, 11 Aug 2021 21:18:31 +0800 (CST)
From: Yangtao Li <frank.li@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 11 Aug 2021 21:18:25 +0800
Message-Id: <20210811131826.223141-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRkeHk5WQk9CGk5MHUsfSU
 JDVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MQg6AQw*Qj9KHyIyPCw6IT8f
 VjAaFChVSlVKTUlDTUNMQkpJSU5JVTMWGhIXVR0JGhUQVRcSOw0SDRRVGBQWRVlXWRILWUFZSUpD
 VUpLT1VKQ0NVSk1OWVdZCAFZQUpOQk83Bg++
X-HM-Tid: 0a7b355d4b98d996kuwsa7411c40091
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.36 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1mDo80-0006Pu-4U
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix potential memory leaks in
 create_discard_cmd_control
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
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Release f2fs_issue_discard every time it is destroyed,
otherwise it will cause memory leaks when remounting.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/segment.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index afe20c5c3c08..363779a4402d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1741,6 +1741,7 @@ void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi)
 
 		dcc->f2fs_issue_discard = NULL;
 		kthread_stop(discard_thread);
+		put_task_struct(discard_thread);
 	}
 }
 
@@ -2168,6 +2169,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 		SM_I(sbi)->dcc_info = NULL;
 		return err;
 	}
+	get_task_struct(dcc->f2fs_issue_discard);
 
 	return err;
 }
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
