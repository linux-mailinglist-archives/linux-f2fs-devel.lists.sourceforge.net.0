Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 976FD9A0098
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Oct 2024 07:28:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t0waJ-0000Mg-FZ;
	Wed, 16 Oct 2024 05:28:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Yi.Sun@unisoc.com>) id 1t0waH-0000MY-FK
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Oct 2024 05:28:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CtGvWiRe+XgESzFrWgI+leZCaxpVgwcEI/BcoYBKiaI=; b=O2NXIlNphqPemJ95yXBqbGS1PW
 9dExgpCCer06Vx9UlU3IHnIqUSouOfUOVhQuhL3AGuCos24Tdw//vgd9Ab6O9mTnCLw5VLk6f9isI
 cdTUjp2TR6uMJuKpRUqRK8zCa9zcKntClXz2shHcTemT5oFFIPuQS8ONVbZ0r1uLTQ+I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CtGvWiRe+XgESzFrWgI+leZCaxpVgwcEI/BcoYBKiaI=; b=P
 lyvWSHtJjnASafOlEwE9ReCiPzNjpbn0bFfmInWBnQynMj5uA111Bruah9n2ncwoVr8Fq2eNL0pD7
 buzTHFN45SdBDW6qtVmdMhftt0VfDELFhnOZwHr2ckRMcasGkM0qs+fV8qnG6pI9veVmjcRDpLDog
 MxBKRfS8mTD3RwjU=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t0waF-00044D-CR for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Oct 2024 05:28:32 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 49G5S3G0033818;
 Wed, 16 Oct 2024 13:28:03 +0800 (+08)
 (envelope-from Yi.Sun@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4XSzy16Q0Wz2SW4QH;
 Wed, 16 Oct 2024 13:27:53 +0800 (CST)
Received: from tj10379pcu.spreadtrum.com (10.5.32.15) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 16 Oct 2024 13:28:00 +0800
From: Yi Sun <yi.sun@unisoc.com>
To: <chao@kernel.org>
Date: Wed, 16 Oct 2024 13:27:56 +0800
Message-ID: <20241016052758.3400359-1-yi.sun@unisoc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.5.32.15]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 49G5S3G0033818
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
 and up_write(). If some blocks are continuous and belong to the same segment, 
 we can process these blocks at the same time. This can reduce the number
 of calls to the down_write() and the up_write(), thereby improvin [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1t0waF-00044D-CR
Subject: [f2fs-dev] [RFC PATCH 0/2] Speed up f2fs truncate
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
Cc: ke.wang@unisoc.com, yi.sun@unisoc.com, linux-kernel@vger.kernel.org,
 sunyibuaa@gmail.com, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hao_hao.wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Deleting large files is time-consuming, and a large part
of the time is spent in f2fs_invalidate_blocks()
->down_write(sit_info->sentry_lock) and up_write().

If some blocks are continuous and belong to the same segment,
we can process these blocks at the same time. This can reduce
the number of calls to the down_write() and the up_write(),
thereby improving the overall speed of doing truncate.

Test steps:
Set the CPU and DDR frequencies to the maximum.
dd if=/dev/random of=./test.txt bs=1M count=100000
sync
rm test.txt

Time Comparison of rm:
original        optimization            ratio
7.17s		3.27s			54.39%

Hi, currently I have only optimized the f2fs doing truncate route,
and other functions using f2fs_invalidate_blocks() are not taken
into consideration. So new function
f2fs_invalidate_compress_pages_range() and
check_f2fs_invalidate_consecutive_blocks() are not general functions.
Is this modification acceptable?

Yi Sun (2):
  f2fs: introduce update_sit_entry_for_release()
  f2fs: introduce f2fs_invalidate_consecutive_blocks() for truncate

 fs/f2fs/compress.c |  14 ++++++
 fs/f2fs/f2fs.h     |   5 ++
 fs/f2fs/file.c     |  34 ++++++++++++-
 fs/f2fs/segment.c  | 116 +++++++++++++++++++++++++++++++--------------
 4 files changed, 133 insertions(+), 36 deletions(-)

-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
