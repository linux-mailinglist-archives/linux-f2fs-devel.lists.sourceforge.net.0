Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4199FAB70
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Dec 2024 09:13:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tPdYc-0008HM-AN;
	Mon, 23 Dec 2024 08:12:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Yi.Sun@unisoc.com>) id 1tPdYa-0008Gl-RG
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Dec 2024 08:12:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ogggsIG4pBZdEfLcFiKzkuOlZ3xZbgD3moKjDXlMp+s=; b=Ex9o80eAl8g6A3hg3gqIcUIty1
 UTvQA8jvaDaBBFbT/GHJAEsnV0DTuq3WAhIySwGORV7pN6FW4PVEMNNvU8u2wCEaZWfNBxizTYic6
 5N8M6wofOnyRH/6SGwg/L3q3t6sHBw2F88f+NlTlAMGzcg2n3zBG9j8IhVptZdKeMZi4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ogggsIG4pBZdEfLcFiKzkuOlZ3xZbgD3moKjDXlMp+s=; b=W
 UcvPdQahHcENDpeDEKpLH0c4iDifSV0/EP8OOtUGRWFORVMN158qkIhef8gzmT6JU+gPo7y2RJ6ap
 kCj/LUcjxlxuyXCNI27w+YhHymHK2Qf3al8r3fMX6i2iDoBhQr7zvJkej2XMMR34wkHeNJABUEjf6
 KX/bGbJowGaLkoSY=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tPdYa-0007E4-3K for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Dec 2024 08:12:53 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 4BN8AmNM033124;
 Mon, 23 Dec 2024 16:10:48 +0800 (+08)
 (envelope-from Yi.Sun@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4YGrHq276fz2MnTyj;
 Mon, 23 Dec 2024 16:08:23 +0800 (CST)
Received: from tj10379pcu1.spreadtrum.com (10.5.32.15) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 23 Dec 2024 16:10:46 +0800
From: Yi Sun <yi.sun@unisoc.com>
To: <chao@kernel.org>, <jaegeuk@kernel.org>
Date: Mon, 23 Dec 2024 16:10:40 +0800
Message-ID: <20241223081044.1126291-1-yi.sun@unisoc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.5.32.15]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 4BN8AmNM033124
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Deleting large files is time-consuming, and a large part of
 the time is spent in f2fs_invalidate_blocks()
 ->down_write(sit_info->sentry_lock)
 and up_write(). If some blocks are continuous, we can process these blocks
 at the same time. This can reduce the number of calls to the down_write()
 and the up_write(), thereby improving the overall speed of doing tr [...]
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1tPdYa-0007E4-3K
Subject: [f2fs-dev] [PATCH v4 0/4] Speed up f2fs truncate
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
 linux-f2fs-devel@lists.sourceforge.net, sunyibuaa@gmail.com, yi.sun@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Deleting large files is time-consuming, and a large part
of the time is spent in f2fs_invalidate_blocks()
->down_write(sit_info->sentry_lock) and up_write().

If some blocks are continuous, we can process these blocks
at the same time. This can reduce the number of calls to
the down_write() and the up_write(), thereby improving the
overall speed of doing truncate.

Test steps:
Set the CPU and DDR frequencies to the maximum.
dd if=/dev/random of=./test.txt bs=1M count=100000
sync
rm test.txt

Time Comparison of rm:
original        optimization            ratio
7.17s           3.27s                   54.39%

----
v4:
- introduce update_sit_entry_for_alloc().
- [patch 2,3,4 / 4] have no changes compared to v3.

Yi Sun (4):
  f2fs: introduce update_sit_entry_for_release/alloc()
  f2fs: update_sit_entry_for_release() supports consecutive blocks.
  f2fs: add parameter @len to f2fs_invalidate_blocks()
  f2fs: Optimize f2fs_truncate_data_blocks_range()

 fs/f2fs/compress.c |   4 +-
 fs/f2fs/f2fs.h     |   3 +-
 fs/f2fs/file.c     |  78 +++++++++++++++++--
 fs/f2fs/node.c     |   4 +-
 fs/f2fs/segment.c  | 185 +++++++++++++++++++++++++++++----------------
 5 files changed, 198 insertions(+), 76 deletions(-)

-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
