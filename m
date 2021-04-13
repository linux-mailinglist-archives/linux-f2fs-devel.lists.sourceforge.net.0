Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA07435DBF2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Apr 2021 11:56:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lWFmi-0004zE-Ak; Tue, 13 Apr 2021 09:56:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lWFmc-0004z2-L2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Apr 2021 09:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xM8uS+J8V1VHMKQY1QWr32FpL4wyhBRr//OTVwF3ohs=; b=BQ3kKbYRHAQCQA4YouP5uck/x0
 W7rOGsJk3oLErxC1SzR5Tv7QRtl4pXK4GYKeFwHvW+1j6ZRb+W7Vm92SrkKaHdoPzZXHz4bCd2AKV
 n8WidyWrtacFo7HOeYEVvuegg5C3mQbaR4YLW4gToX28qt4NqOLWcD2AHiyD2+KZQdM4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xM8uS+J8V1VHMKQY1QWr32FpL4wyhBRr//OTVwF3ohs=; b=Kw7WJx5hlaGdZUWmT+pOI4E7I6
 JZgHPixmKPiQY18/9lpbTuT1YcFUzVAIdm6xyhQZ2SgnWlw9KzyGQz4Y8j6Z+ObrIdFnKYhZ2L6kt
 t85tmw5b59A0QQUf6kYzQfr2RamQySmkkQ0w13SAx+gdwlIiFoDzgsHJmshTCfQVemKc=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lWFmX-0005Tl-Sc
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Apr 2021 09:56:34 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FKLX83QYbznZL7;
 Tue, 13 Apr 2021 17:53:28 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 13 Apr
 2021 17:56:18 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
References: <20210324031828.67133-1-yuchao0@huawei.com>
 <YFvQGxLbpmDjxEzR@google.com>
 <2dfb085b-80ce-050b-5650-986675a07488@huawei.com>
 <66e0a225-7f52-a33e-ccd6-e7bfa1067ed1@kernel.org>
 <YHUJFElliMOWMbWN@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c9b7ddbc-bba4-c024-4750-f2283a65bb18@huawei.com>
Date: Tue, 13 Apr 2021 17:56:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YHUJFElliMOWMbWN@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lWFmX-0005Tl-Sc
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid touching checkpointed
 data in get_victim()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/4/13 10:59, Jaegeuk Kim wrote:
> On 04/11, Chao Yu wrote:
>> Hi Jaegeuk,
>>
>> Could you please help to merge below cleanup diff into original patch?
>> or merge this separately if it is too late since it is near rc7.
> 
> I didn't review this tho, this gives an error in xfstests/083.
> 

 From 59c2bd34fb0c77bcede2af7e5d308c014c544a1e Mon Sep 17 00:00:00 2001
From: Chao Yu <yuchao0@huawei.com>
Date: Sun, 11 Apr 2021 14:29:34 +0800
Subject: [PATCH] f2fs: avoid duplicated codes for cleanup

f2fs_segment_has_free_slot() was copied and modified from
__next_free_blkoff(), they are almost the same, clean up to
reuse common code as much as possible.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
- fix to assign .next_blkoff in change_curseg()
  fs/f2fs/segment.c | 32 ++++++++++----------------------
  1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index d6c6c13feb43..6e740ecf0814 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2638,22 +2638,20 @@ static void new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec)
  	curseg->alloc_type = LFS;
  }

-static void __next_free_blkoff(struct f2fs_sb_info *sbi,
-			struct curseg_info *seg, block_t start)
+static int __next_free_blkoff(struct f2fs_sb_info *sbi,
+					int segno, block_t start)
  {
-	struct seg_entry *se = get_seg_entry(sbi, seg->segno);
+	struct seg_entry *se = get_seg_entry(sbi, segno);
  	int entries = SIT_VBLOCK_MAP_SIZE / sizeof(unsigned long);
  	unsigned long *target_map = SIT_I(sbi)->tmp_map;
  	unsigned long *ckpt_map = (unsigned long *)se->ckpt_valid_map;
  	unsigned long *cur_map = (unsigned long *)se->cur_valid_map;
-	int i, pos;
+	int i;

  	for (i = 0; i < entries; i++)
  		target_map[i] = ckpt_map[i] | cur_map[i];

-	pos = __find_rev_next_zero_bit(target_map, sbi->blocks_per_seg, start);
-
-	seg->next_blkoff = pos;
+	return __find_rev_next_zero_bit(target_map, sbi->blocks_per_seg, start);
  }

  /*
@@ -2665,26 +2663,16 @@ static void __refresh_next_blkoff(struct f2fs_sb_info *sbi,
  				struct curseg_info *seg)
  {
  	if (seg->alloc_type == SSR)
-		__next_free_blkoff(sbi, seg, seg->next_blkoff + 1);
+		seg->next_blkoff =
+			__next_free_blkoff(sbi, seg->segno,
+						seg->next_blkoff + 1);
  	else
  		seg->next_blkoff++;
  }

  bool f2fs_segment_has_free_slot(struct f2fs_sb_info *sbi, int segno)
  {
-	struct seg_entry *se = get_seg_entry(sbi, segno);
-	int entries = SIT_VBLOCK_MAP_SIZE / sizeof(unsigned long);
-	unsigned long *target_map = SIT_I(sbi)->tmp_map;
-	unsigned long *ckpt_map = (unsigned long *)se->ckpt_valid_map;
-	unsigned long *cur_map = (unsigned long *)se->cur_valid_map;
-	int i, pos;
-
-	for (i = 0; i < entries; i++)
-		target_map[i] = ckpt_map[i] | cur_map[i];
-
-	pos = __find_rev_next_zero_bit(target_map, sbi->blocks_per_seg, 0);
-
-	return pos < sbi->blocks_per_seg;
+	return __next_free_blkoff(sbi, segno, 0) < sbi->blocks_per_seg;
  }

  /*
@@ -2712,7 +2700,7 @@ static void change_curseg(struct f2fs_sb_info *sbi, int type, bool flush)

  	reset_curseg(sbi, type, 1);
  	curseg->alloc_type = SSR;
-	__next_free_blkoff(sbi, curseg, 0);
+	curseg->next_blkoff = __next_free_blkoff(sbi, curseg->segno, 0);

  	sum_page = f2fs_get_sum_page(sbi, new_segno);
  	if (IS_ERR(sum_page)) {
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
