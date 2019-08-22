Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C684B99E0D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Aug 2019 19:47:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i0rBb-0005Ga-Pe; Thu, 22 Aug 2019 17:47:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1i0rBZ-0005GS-TI
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Aug 2019 17:47:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=29SAr1qDTldN+nX5NN6g6Y2Ozt5jNtu7drrv5Q3SWTc=; b=IMVCdiVWe3uYskhyjsNPVjzrXY
 CwgfcaFcJHTkBrR1i+aLbHcXMR94e5d77q18gw5IvXLHUhu60vCULMoC//z2+OEoyv406+JEe2lM6
 676heVbPZEVxVZKo9uoUGNqNLw7WYvzc0w7OIpje1Nl8zFXFxwn1QDoCxQmtPz0O6fnI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=29SAr1qDTldN+nX5NN6g6Y2Ozt5jNtu7drrv5Q3SWTc=; b=a3IkA5p1v8CCaIWr1xETejJgZe
 mQ9R9cPOUlGmqt2jNT/+FWvvXAbOvX6q0ZEO7dVZQQPf1t9OxCzx7Izh7ev24uXtxotd6nZJK/8A8
 DGiEgdnoHZhXxzWS+8v5CwSTuQi5BR1DjmV/kWa76jDLkxLKBc668BYdJa/eJ6rQMHE8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i0rBX-00GJX0-DE
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Aug 2019 17:47:45 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE85B20870;
 Thu, 22 Aug 2019 17:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566496057;
 bh=S+KYZfe8Nd1Bvyq+l97kdNG7/t2iLAT4oMHAHboqYv8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kvpQCaRXI3PiI6+xOUkrv4oE410cO0yzWOaI8Z3oCIOSiJh0vsOsCMbzYDOOr5U2X
 0cI3iDsr8eFd8DlU/3ukWs00JNTMzgFQUWSyTjUxIe5CJfG3NSyN0MUuojSqXAw5Bk
 2UAVIG1HvnnNxKWrtP1JJpkC1RjJK4MC5hJ8xQaw=
Date: Thu, 22 Aug 2019 10:47:36 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190822174736.GA88722@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190726074120.3278-1-yuchao0@huawei.com>
 <20190819202007.GA23891@jaegeuk-macbookpro.roam.corp.google.com>
 <99a2713a-50d2-8a77-87d9-661ab7ed3a0c@huawei.com>
 <20190820174121.GB58214@jaegeuk-macbookpro.roam.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820174121.GB58214@jaegeuk-macbookpro.roam.corp.google.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i0rBX-00GJX0-DE
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: allocate memory in batch in
 build_sit_info()
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

On 08/20, Jaegeuk Kim wrote:
> On 08/20, Chao Yu wrote:
> > On 2019/8/20 4:20, Jaegeuk Kim wrote:
> > > On 07/26, Chao Yu wrote:
> > >> build_sit_info() allocate all bitmaps for each segment one by one,
> > >> it's quite low efficiency, this pach changes to allocate large
> > >> continuous memory at a time, and divide it and assign for each bitmaps
> > >> of segment. For large size image, it can expect improving its mount
> > >> speed.
> > > 
> > > Hmm, I hit a kernel panic when mounting a partition during fault injection test:
> > > 
> > > 726 #ifdef CONFIG_F2FS_CHECK_FS
> > > 727         if (f2fs_test_bit(offset, sit_i->sit_bitmap) !=
> > > 728                         f2fs_test_bit(offset, sit_i->sit_bitmap_mir))
> > > 729                 f2fs_bug_on(sbi, 1);
> > > 730 #endif
> > 
> > We didn't change anything about sit_i->sit_bitmap{_mir,}, it's so wired we panic
> > here... :(
> > 
> > I double check the change, but find nothing suspicious, btw, my fault injection
> > testcase shows normal.
> > 
> > Jaegeuk, do you have any idea about this issue?
> 
> I'm bisecting. :P

It was caused by wrong bitmap size in "f2fs: Fix indefinite loop in f2fs_gc()".
Fixed by:
---
 fs/f2fs/segment.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 9b20ce3b87cc..cc230fc829e1 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3950,7 +3950,7 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 	struct sit_info *sit_i;
 	unsigned int sit_segs, start;
 	char *src_bitmap, *bitmap;
-	unsigned int bitmap_size;
+	unsigned int bitmap_size, main_bitmap_size, sit_bitmap_size;
 
 	/* allocate memory for SIT information */
 	sit_i = f2fs_kzalloc(sbi, sizeof(struct sit_info), GFP_KERNEL);
@@ -3966,8 +3966,8 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 	if (!sit_i->sentries)
 		return -ENOMEM;
 
-	bitmap_size = f2fs_bitmap_size(MAIN_SEGS(sbi));
-	sit_i->dirty_sentries_bitmap = f2fs_kvzalloc(sbi, bitmap_size,
+	main_bitmap_size = f2fs_bitmap_size(MAIN_SEGS(sbi));
+	sit_i->dirty_sentries_bitmap = f2fs_kvzalloc(sbi, main_bitmap_size,
 								GFP_KERNEL);
 	if (!sit_i->dirty_sentries_bitmap)
 		return -ENOMEM;
@@ -4016,19 +4016,21 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 	sit_segs = le32_to_cpu(raw_super->segment_count_sit) >> 1;
 
 	/* setup SIT bitmap from ckeckpoint pack */
-	bitmap_size = __bitmap_size(sbi, SIT_BITMAP);
+	sit_bitmap_size = __bitmap_size(sbi, SIT_BITMAP);
 	src_bitmap = __bitmap_ptr(sbi, SIT_BITMAP);
 
-	sit_i->sit_bitmap = kmemdup(src_bitmap, bitmap_size, GFP_KERNEL);
+	sit_i->sit_bitmap = kmemdup(src_bitmap, sit_bitmap_size, GFP_KERNEL);
 	if (!sit_i->sit_bitmap)
 		return -ENOMEM;
 
 #ifdef CONFIG_F2FS_CHECK_FS
-	sit_i->sit_bitmap_mir = kmemdup(src_bitmap, bitmap_size, GFP_KERNEL);
+	sit_i->sit_bitmap_mir = kmemdup(src_bitmap,
+					sit_bitmap_size, GFP_KERNEL);
 	if (!sit_i->sit_bitmap_mir)
 		return -ENOMEM;
 
-	sit_i->invalid_segmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
+	sit_i->invalid_segmap = f2fs_kvzalloc(sbi,
+					main_bitmap_size, GFP_KERNEL);
 	if (!sit_i->invalid_segmap)
 		return -ENOMEM;
 #endif
@@ -4039,7 +4041,7 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 	sit_i->sit_base_addr = le32_to_cpu(raw_super->sit_blkaddr);
 	sit_i->sit_blocks = sit_segs << sbi->log_blocks_per_seg;
 	sit_i->written_valid_blocks = 0;
-	sit_i->bitmap_size = bitmap_size;
+	sit_i->bitmap_size = sit_bitmap_size;
 	sit_i->dirty_sentries = 0;
 	sit_i->sents_per_block = SIT_ENTRY_PER_BLOCK;
 	sit_i->elapsed_time = le64_to_cpu(sbi->ckpt->elapsed_time);
-- 
2.19.0.605.g01d371f741-goog

> 
> > 
> > Thanks,
> > 
> > > 
> > > For your information, I'm testing without this patch.
> > > 
> > > Thanks,
> > > 
> > >>
> > >> Signed-off-by: Chen Gong <gongchen4@huawei.com>
> > >> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > >> ---
> > >> v2:
> > >> - fix warning triggered in kmalloc() if requested memory size exceeds 4MB.
> > >>  fs/f2fs/segment.c | 51 +++++++++++++++++++++--------------------------
> > >>  fs/f2fs/segment.h |  1 +
> > >>  2 files changed, 24 insertions(+), 28 deletions(-)
> > >>
> > >> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > >> index a661ac32e829..d720eacd9c57 100644
> > >> --- a/fs/f2fs/segment.c
> > >> +++ b/fs/f2fs/segment.c
> > >> @@ -3941,7 +3941,7 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
> > >>  	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
> > >>  	struct sit_info *sit_i;
> > >>  	unsigned int sit_segs, start;
> > >> -	char *src_bitmap;
> > >> +	char *src_bitmap, *bitmap;
> > >>  	unsigned int bitmap_size;
> > >>  
> > >>  	/* allocate memory for SIT information */
> > >> @@ -3964,27 +3964,31 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
> > >>  	if (!sit_i->dirty_sentries_bitmap)
> > >>  		return -ENOMEM;
> > >>  
> > >> +#ifdef CONFIG_F2FS_CHECK_FS
> > >> +	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * 4;
> > >> +#else
> > >> +	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * 3;
> > >> +#endif
> > >> +	sit_i->bitmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
> > >> +	if (!sit_i->bitmap)
> > >> +		return -ENOMEM;
> > >> +
> > >> +	bitmap = sit_i->bitmap;
> > >> +
> > >>  	for (start = 0; start < MAIN_SEGS(sbi); start++) {
> > >> -		sit_i->sentries[start].cur_valid_map
> > >> -			= f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
> > >> -		sit_i->sentries[start].ckpt_valid_map
> > >> -			= f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
> > >> -		if (!sit_i->sentries[start].cur_valid_map ||
> > >> -				!sit_i->sentries[start].ckpt_valid_map)
> > >> -			return -ENOMEM;
> > >> +		sit_i->sentries[start].cur_valid_map = bitmap;
> > >> +		bitmap += SIT_VBLOCK_MAP_SIZE;
> > >> +
> > >> +		sit_i->sentries[start].ckpt_valid_map = bitmap;
> > >> +		bitmap += SIT_VBLOCK_MAP_SIZE;
> > >>  
> > >>  #ifdef CONFIG_F2FS_CHECK_FS
> > >> -		sit_i->sentries[start].cur_valid_map_mir
> > >> -			= f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
> > >> -		if (!sit_i->sentries[start].cur_valid_map_mir)
> > >> -			return -ENOMEM;
> > >> +		sit_i->sentries[start].cur_valid_map_mir = bitmap;
> > >> +		bitmap += SIT_VBLOCK_MAP_SIZE;
> > >>  #endif
> > >>  
> > >> -		sit_i->sentries[start].discard_map
> > >> -			= f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE,
> > >> -							GFP_KERNEL);
> > >> -		if (!sit_i->sentries[start].discard_map)
> > >> -			return -ENOMEM;
> > >> +		sit_i->sentries[start].discard_map = bitmap;
> > >> +		bitmap += SIT_VBLOCK_MAP_SIZE;
> > >>  	}
> > >>  
> > >>  	sit_i->tmp_map = f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
> > >> @@ -4492,21 +4496,12 @@ static void destroy_free_segmap(struct f2fs_sb_info *sbi)
> > >>  static void destroy_sit_info(struct f2fs_sb_info *sbi)
> > >>  {
> > >>  	struct sit_info *sit_i = SIT_I(sbi);
> > >> -	unsigned int start;
> > >>  
> > >>  	if (!sit_i)
> > >>  		return;
> > >>  
> > >> -	if (sit_i->sentries) {
> > >> -		for (start = 0; start < MAIN_SEGS(sbi); start++) {
> > >> -			kvfree(sit_i->sentries[start].cur_valid_map);
> > >> -#ifdef CONFIG_F2FS_CHECK_FS
> > >> -			kvfree(sit_i->sentries[start].cur_valid_map_mir);
> > >> -#endif
> > >> -			kvfree(sit_i->sentries[start].ckpt_valid_map);
> > >> -			kvfree(sit_i->sentries[start].discard_map);
> > >> -		}
> > >> -	}
> > >> +	if (sit_i->sentries)
> > >> +		kvfree(sit_i->bitmap);
> > >>  	kvfree(sit_i->tmp_map);
> > >>  
> > >>  	kvfree(sit_i->sentries);
> > >> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> > >> index b74602813a05..ec4d568fd58c 100644
> > >> --- a/fs/f2fs/segment.h
> > >> +++ b/fs/f2fs/segment.h
> > >> @@ -226,6 +226,7 @@ struct sit_info {
> > >>  	block_t sit_base_addr;		/* start block address of SIT area */
> > >>  	block_t sit_blocks;		/* # of blocks used by SIT area */
> > >>  	block_t written_valid_blocks;	/* # of valid blocks in main area */
> > >> +	char *bitmap;			/* all bitmaps pointer */
> > >>  	char *sit_bitmap;		/* SIT bitmap pointer */
> > >>  #ifdef CONFIG_F2FS_CHECK_FS
> > >>  	char *sit_bitmap_mir;		/* SIT bitmap mirror */
> > >> -- 
> > >> 2.18.0.rc1
> > > .
> > > 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
