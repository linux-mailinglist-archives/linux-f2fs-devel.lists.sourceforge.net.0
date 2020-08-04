Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 612E323BAF0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Aug 2020 15:15:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k2wnI-00025U-6H; Tue, 04 Aug 2020 13:15:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k2wnG-00025D-Jp
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Aug 2020 13:15:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xsp1e6i9N1KhYU3MUaI3Tg582xSMiFGL/AXIbtK/vCk=; b=nWKNybIbQKKGVH6mtyZ/pSzqUo
 x17rh4y2SC51s7Nf8PEz82IYV99iggvMh93g3yRI6o2siG950dtXaT35f+pPVUnB2f0nJkHRjrXyZ
 QBmyJ1+4qsEZfvOnuFfWpu4LfNkleAYHvPtQiWdeKY95sLw+p7n4MQ4YRpehICeB0c78=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xsp1e6i9N1KhYU3MUaI3Tg582xSMiFGL/AXIbtK/vCk=; b=Z
 xMXNeXJwI6PVSq03yGyAaTGumFKB785oY0gyMDdjhgY/KVk8mPjl7V52x5AlM5iLpl4vr16CqEhYi
 2h0luAK59SPh/iWnIpoG27k9xrpWF6QVgXSyVQ06hotpNvvk3aiE6NqYUEmLWuGNN3iE0BrO/mpsE
 rbTQHW6LY8RT6hk8=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k2wnE-00980K-6D
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Aug 2020 13:15:50 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3CEB399AF20FFEB6E940;
 Tue,  4 Aug 2020 21:15:23 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Tue, 4 Aug 2020 21:15:16 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 4 Aug 2020 21:14:44 +0800
Message-ID: <20200804131449.50517-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.8 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k2wnE-00980K-6D
Subject: [f2fs-dev] [PATCH v2 0/5] Support Age-Threshold based Garbage
 Collection for f2fs
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

This patch series introduce a new garbage collection algorithm named ATGC
(Age Threshold based Garbage Collection) in order to enhance efficiency and
effect of background garbage collection.

ATGC algorithm tries to fliter few oldest candidates according to defined
age threshold, it selects source section in those candidates and then
select target segment which has almost the same age of source section,
finally, it migrates valid blocks from source section into target segment
with SSR allocator, enhancement shows in below aspects:
- it avoids selecting young victim section which may have high update
frequency;
- SSR write avoids unneeded movement of blocks locate in target segment;
- source section and target segment has almost the same age (update
frequency), it keeps well hot/cold separation effect;

Patch 1 introduces in-memory curseg, since it only exists in memory, so it
avoids on-disk layout change whenever we want to add a new type of log.
Firstly, adapting aligned pinfile allocation to use in-memory curseg,
later, we will use in-memory curseg in ATGC feature for migration as well.

Patch 2 changes segment's mtime definition from recording last update time
to recording average update time, so that it can indicate more precise
update time of each valid blocks in segment.

Patch 3 changes segment mtime update policy during GC, 1) don't update
original segment's mtime; 2) inherit segment's mtime from original segment
to target segment.

Patch 4 adds to support 64-bits key in rb-tree node entry, and introduce
f2fs_lookup_rb_tree_ext() to support lookup functionality with 64-bits key.

Patch 5 adds to support ATGC skeleton to enhance effect and efficiency
of BGGC.

Test and result:
- create 160 dirty segments:
 * half of them have 128 valid blocks per segment
 * left of them have 384 valid blocks per segment
- run background GC

Benefit: GC count and block movement count both decrease obviously:

- Before:
GC calls: 162 (BG: 220)

Try to move 41454 blocks (BG: 41454)
  - data blocks : 40960 (40960)

SSR: 0 blocks in 0 segments
LFS: 41364 blocks in 81 segments

- After:
GC calls: 75 (BG: 76)

Try to move 12813 blocks (BG: 12813)
  - data blocks : 12544 (12544)
 
SSR: 12032 blocks in 77 segments
LFS: 855 blocks in 2 segments

v1 -> v2:
- patch 1/5: fix wrong log type
- patch 3/5: add missing blank line in between functions
- patch 5/5: add mount option to enable atgc

Chao Yu (5):
  f2fs: introduce inmem curseg
  f2fs: record average update time of segment
  f2fs: inherit mtime of original block during GC
  f2fs: support 64-bits key in f2fs rb-tree node entry
  f2fs: support age threshold based garbage collection

 Documentation/filesystems/f2fs.rst |   2 +
 fs/f2fs/checkpoint.c               |   7 +-
 fs/f2fs/data.c                     |   2 +-
 fs/f2fs/debug.c                    |  10 +-
 fs/f2fs/extent_cache.c             |  37 ++-
 fs/f2fs/f2fs.h                     |  51 +++-
 fs/f2fs/file.c                     |   5 +-
 fs/f2fs/gc.c                       | 372 ++++++++++++++++++++++++++++-
 fs/f2fs/gc.h                       |  25 ++
 fs/f2fs/segment.c                  | 332 +++++++++++++++++++------
 fs/f2fs/segment.h                  |  40 +++-
 fs/f2fs/super.c                    |  35 ++-
 include/trace/events/f2fs.h        |   8 +-
 13 files changed, 818 insertions(+), 108 deletions(-)

-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
