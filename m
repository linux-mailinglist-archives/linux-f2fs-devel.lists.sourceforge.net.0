Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A569B213144
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Jul 2020 04:13:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jrBCu-0004BL-2C; Fri, 03 Jul 2020 02:13:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jrBCs-0004B8-LM
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jul 2020 02:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wwqTjgCMlwxcbcZGemOfcEty2C+GpcanAUM4E0SaIQA=; b=Y3aAoVRnEUmW0ulRhUeVoJz+Vy
 EP6PePRJRnueLV5Pyw9HDaLWunHnQBmB/OHaYCC5qkm2e5MB8P5QhLhzVxL2HRfaVTULakLY7/K/W
 Y8BayvPDZr+K43pzaAcEnvn9NbHN7wrzyHgJLnJuGLz0Wj/bGpMUPZk8P0dW6honxDws=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wwqTjgCMlwxcbcZGemOfcEty2C+GpcanAUM4E0SaIQA=; b=d2DnyqvwxO2OtEQPpQi8qZ5nr3
 TdKMVSGXKynFR6yDEgteP873m8mCjNNSwOCYWkdFHb48NxLZ8itqsGyIeG+HGDo1kWiLefXVrZG80
 Ylwpvr+ncK2OC/dv2uv+/R4IVXuSGheOvPQ2ZVAaetY/91wZjlUoENbFIYONS384Yrk4=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jrBCq-006SVd-LL
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jul 2020 02:13:38 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id ABB822F59E07BC97FD66;
 Fri,  3 Jul 2020 10:13:20 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 3 Jul 2020
 10:13:17 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200630100428.19105-1-yuchao0@huawei.com>
 <20200630100428.19105-2-yuchao0@huawei.com>
 <20200701161927.GD1724572@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <70776961-0430-0a9f-cf26-09a2cc192b07@huawei.com>
Date: Fri, 3 Jul 2020 10:13:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200701161927.GD1724572@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jrBCq-006SVd-LL
Subject: Re: [f2fs-dev] [PATCH RFC 2/5] f2fs: record average update time of
 segment
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

On 2020/7/2 0:19, Jaegeuk Kim wrote:
> On 06/30, Chao Yu wrote:
>> Previously, once we update one block in segment, we will update mtime of
>> segment to last time, making aged segment becoming freshest, result in
>> that GC with cost benefit algorithm missing such segment, So this patch
>> changes to record mtime as average block updating time instead of last
>> updating time.
>>
>> It's not needed to reset mtime for prefree segment, as se->valid_blocks
>> is zero, then old se->mtime won't take any weight with below calculation:
>>
>> 	se->mtime = (se->mtime * se->valid_blocks + mtime) /
>> 				(se->valid_blocks + 1);
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>  fs/f2fs/segment.c | 21 ++++++++++++++++++---
>>  1 file changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 863ec6f1fb87..906c313835ad 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -2150,6 +2150,22 @@ static void __set_sit_entry_type(struct f2fs_sb_info *sbi, int type,
>>  		__mark_sit_entry_dirty(sbi, segno);
>>  }
>>  
>> +static void update_segment_mtime(struct f2fs_sb_info *sbi, block_t blkaddr)
>> +{
>> +	unsigned int segno = GET_SEGNO(sbi, blkaddr);
>> +	struct seg_entry *se = get_seg_entry(sbi, segno);
>> +	unsigned long long mtime = get_mtime(sbi, false);
>> +
>> +	if (!se->mtime) {
> 
> Don't need {}.

Updated,

BTW, have fixed below compile error:

   m68k-linux-ld: fs/f2fs/segment.o: in function `update_segment_mtime':
   fs/f2fs/segment.c:2162: undefined reference to `__udivdi3'

Thanks,

> 
>> +		se->mtime = mtime;
>> +	} else {
>> +		se->mtime = (se->mtime * se->valid_blocks + mtime) /
>> +						(se->valid_blocks + 1);
>> +	}
>> +	if (mtime > SIT_I(sbi)->max_mtime)
>> +		SIT_I(sbi)->max_mtime = mtime;
>> +}
>> +
>>  static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
>>  {
>>  	struct seg_entry *se;
>> @@ -2169,10 +2185,9 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
>>  	f2fs_bug_on(sbi, (new_vblocks >> (sizeof(unsigned short) << 3) ||
>>  				(new_vblocks > sbi->blocks_per_seg)));
>>  
>> +	update_segment_mtime(sbi, blkaddr);
>> +
>>  	se->valid_blocks = new_vblocks;
>> -	se->mtime = get_mtime(sbi, false);
>> -	if (se->mtime > SIT_I(sbi)->max_mtime)
>> -		SIT_I(sbi)->max_mtime = se->mtime;
>>  
>>  	/* Update valid block bitmap */
>>  	if (del > 0) {
>> -- 
>> 2.26.2
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
