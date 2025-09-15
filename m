Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6F8B56F07
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Sep 2025 05:53:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajnEDYxd6K1kV6NLLUeqORsVhmWuVDKYuCQGosn+kyw=; b=bA/kyNaq23yxQDE3gvyveQKNlN
	VNhXDcTpgWDgTN06uiQpZ+BvqFLVz7P/BZIRApxkyAN6Tgm0+G5koknI5OVsJe+Jy2kyL/Z1g1BUc
	85g5rZvB8IA+BLrWj1gM0jzNVwgxlqhHoipQaYy0lnoiCTHa4zYDRjb40ZWYCQVEa3ZU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uy0H8-0004En-J8;
	Mon, 15 Sep 2025 03:53:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1uy0H4-0004EY-Bg
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Sep 2025 03:53:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PHrvv40s48Dqz44eq3bPOFH92o5ofFFqq99gSbG+ASk=; b=cTPmvcTYTGcxg8dGm4ciedq2qO
 FkJqV8baI/Zsyei0H7oSrm7xXXsVer4BafKogUvvseHUEiIt5/EiEiXe4JP89PVZamhuEK0KDRUI3
 WytQptVJRgxtcox5gNX/tshO2E67nBlZTLlPQJFawC95Lt9798QRcLTCzryaUgDJIMm8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PHrvv40s48Dqz44eq3bPOFH92o5ofFFqq99gSbG+ASk=; b=LFEmb90OZHjpYXzLVs4LRtJfDZ
 MmQPiQD/M7CvGcj3TSe090L5POX/WJ8qgt3x9LIEKmdssXOExiH3mAkYhw7tYk+q1YE4Jpo9dEuXD
 TqScSfUJd+aH1tECqUQrL0+Wee1PhjGCv5YpQ8OYKxoVEoz2XU+ggANRRizUQPKGbqtE=;
Received: from mta20.hihonor.com ([81.70.206.69])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uy0H3-0003ln-RW for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Sep 2025 03:53:06 +0000
Received: from w013.hihonor.com (unknown [10.68.26.19])
 by mta20.hihonor.com (SkyGuard) with ESMTPS id 4cQB1h0NxbzYl56X;
 Mon, 15 Sep 2025 11:52:24 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w013.hihonor.com
 (10.68.26.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 15 Sep
 2025 11:52:53 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 15 Sep
 2025 11:52:52 +0800
From: wangzijie <wangzijie1@honor.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 15 Sep 2025 11:52:46 +0800
Message-ID: <20250915035246.98055-2-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250915035246.98055-1-wangzijie1@honor.com>
References: <20250915035246.98055-1-wangzijie1@honor.com>
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
 Content preview:  When we get wrong extent info data, and look up extent_node
 in rb tree, it will cause infinite loop (CONFIG_F2FS_CHECK_FS=n). Avoiding
 this by return NULL. Signed-off-by: wangzijie <wangzijie1@honor.com> ---
 fs/f2fs/extent_cache.c | 1 + 1 file changed, 1 insertion(+) 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [81.70.206.69 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uy0H3-0003ln-RW
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: fix infinite loop in
 __insert_extent_tree()
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

When we get wrong extent info data, and look up extent_node in rb tree,
it will cause infinite loop (CONFIG_F2FS_CHECK_FS=n). Avoiding this by
return NULL.

Signed-off-by: wangzijie <wangzijie1@honor.com>
---
 fs/f2fs/extent_cache.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 199c1e7a8..6ed6f3d1d 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -605,6 +605,7 @@ static struct extent_node *__insert_extent_tree(struct f2fs_sb_info *sbi,
 			leftmost = false;
 		} else {
 			f2fs_bug_on(sbi, 1);
+			return NULL;
 		}
 	}
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
