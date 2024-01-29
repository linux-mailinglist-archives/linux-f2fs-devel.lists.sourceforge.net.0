Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D57258402B2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jan 2024 11:22:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUOmn-0001F4-CC;
	Mon, 29 Jan 2024 10:22:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rUOml-0001Ey-Gp
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 10:22:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hTuUer4yaG6DVAm2a9jKK2HUeFUSVWlzPOvFgdzGE5Y=; b=QKYA/Jf3ipYTT2B99GKnwe22bN
 DmKxukoBxYnLWg6kIsP+QkWkzcidM7HAVRTEpp9W+yGpLTlwkQmyq59zoSHobSGNGB5ztvAyb/Wls
 8g9uyYeWSnQiLgDfsBWxu2Bae4OHcy9DH3CC74x+EllEkN5Uyj2ckfdj5YtzPOIJ/c2A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hTuUer4yaG6DVAm2a9jKK2HUeFUSVWlzPOvFgdzGE5Y=; b=d
 ZSPhWyEa0LPcUi+oZV4DIRxtlaHaMFpzxZweIdwLz1FwQH2RwfyIpXTWgNsZ9yI/NgK41R3cCY6ES
 JYtKqAUGhM0J4etyXv/Gq6RxRx2fxwbaRrG1apJgdrB3qOFFaf68O3rZLN3GQgiFhF+WBlgrHXCN2
 jmaVRTVKDq3KJ7Gs=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rUOmg-0005CX-GK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 10:22:40 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 40TALmxZ021624;
 Mon, 29 Jan 2024 18:21:48 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4TNkfv3tnnz2R5Td1;
 Mon, 29 Jan 2024 18:14:15 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 29 Jan 2024 18:21:46 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 29 Jan 2024 18:21:24 +0800
Message-ID: <1706523684-24540-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 40TALmxZ021624
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  A panic issue happened in a reboot test in small capacity
 device as following: 1.The device size is 64MB, and main area has 24 segments, 
 and CONFIG_F2FS_CHECK_FS is not enabled. 2.There is no any free [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rUOmg-0005CX-GK
Subject: [f2fs-dev] [PATCH 0/3] f2fs: fix panic issue in small capacity
 device
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hongyu.jin@unisoc.com,
 zhiguo.niu@unisoc.com, niuzhiguo84@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

A panic issue happened in a reboot test in small capacity device
as following:
1.The device size is 64MB, and main area has 24 segments, and
CONFIG_F2FS_CHECK_FS is not enabled.
2.There is no any free segments left shown in free_segmap_info,
then another write request cause get_new_segment get a out-of-bound
segment with segno 24.
3.panic happen in update_sit_entry because access invalid bitmap
pointer.

More detail shown in following three patches.
The three patches are splited here because the modifications are
relatively independent and more readable.

Zhiguo Niu (3):
  f2fs: correct counting methods of free_segments in __set_inuse
  f2fs: fix panic issue in update_sit_entry
  f2fs: enhance judgment conditions of GET_SEGNO

 fs/f2fs/file.c    | 7 ++++++-
 fs/f2fs/segment.c | 9 ++++++---
 fs/f2fs/segment.h | 7 ++++---
 3 files changed, 16 insertions(+), 7 deletions(-)

-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
