Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 168F984C22D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Feb 2024 03:02:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rXXGC-0001iC-11;
	Wed, 07 Feb 2024 02:02:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rXXGA-0001i6-QI
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Feb 2024 02:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BVsEEWLQGZX07FZQldrpv0fblveMaQMwFSNSeOK+Uvg=; b=hvsdpNmyGfX2CfgKBKLFM1kgA7
 LGrgstuioHiobSP/oipjD0Cwe6TJ08JbNvX2cpb6rUNoq1ZGuKCu3kAEreVPSHHUZLxc1B/5YfCAJ
 BOG7HXmpAEnhl+W1/RPVd0RZwODuqM+rRgGwEv7DivE2U6Gqub2nLxh6d8D4z7gQCRZo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BVsEEWLQGZX07FZQldrpv0fblveMaQMwFSNSeOK+Uvg=; b=E
 pBxFobw9skAemd5BcjnZ0PYvk3hHotGh0qXw8yNXxc7S5MUqK2sJSj6Iz2/yknsU832jZaDpTCFzt
 G81GDOUlVhtFItKpwv+xpiFDp9scYnS4dME28IDNzgq/5eoAOCUo2rS6hsdQSTCmjUn06kOmocczi
 UvrA7fFqp4y5upRg=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rXXG9-00071x-DC for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Feb 2024 02:01:59 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 41721Nq0075264;
 Wed, 7 Feb 2024 10:01:23 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4TV3Hv3prTz2K4cJ2;
 Wed,  7 Feb 2024 10:01:15 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 7 Feb 2024 10:01:20 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 7 Feb 2024 10:01:00 +0800
Message-ID: <1707271264-5551-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 41721Nq0075264
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rXXG9-00071x-DC
Subject: [f2fs-dev] [PATCH v2 0/4] f2fs: fix panic issue in small capacity
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

More detail shown in following patch sets.
The three patches are splited here because the modifications are
relatively independent and more readable.

---
Changes of v2: stop checkpoint when get a out-of-bound segment
---

Zhiguo Niu (4):
  f2fs: correct counting methods of free_segments in __set_inuse
  f2fs: fix panic issue in update_sit_entry
  f2fs: enhance judgment conditions of GET_SEGNO
  f2fs: stop checkpoint when get a out-of-bounds segment

 fs/f2fs/file.c          |  7 ++++++-
 fs/f2fs/segment.c       | 21 ++++++++++++++++-----
 fs/f2fs/segment.h       |  7 ++++---
 include/linux/f2fs_fs.h |  1 +
 4 files changed, 27 insertions(+), 9 deletions(-)

-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
