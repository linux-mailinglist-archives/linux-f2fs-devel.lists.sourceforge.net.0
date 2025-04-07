Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24238A7D1FA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Apr 2025 04:09:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u1bv2-0006XV-VV;
	Mon, 07 Apr 2025 02:09:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u1bv1-0006XK-W6
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Apr 2025 02:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B/tiK+b6QEpU9b8/oe5R0IkZ3TAGRdmqyzP1G0VKbj0=; b=MTIaYsctTC/sgFu0GqoVli/4ds
 q/hNC/+eh+B/bt8pcyBeT0v7KY2KDABIQ0VSSl7Yd+nBo7+28tVNAK7iIy92xu6oxL3ndVXCyEc9J
 oQbEuWanQ5tZNANwomICYIShlij7wsKqzxgwhNcZEPRFLbXaTK0kWrWwL4akEQbXb6p0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B/tiK+b6QEpU9b8/oe5R0IkZ3TAGRdmqyzP1G0VKbj0=; b=mCfJSq9p8+sby3H18qaXcwUbJz
 9E5H94OiSeEzMfVA5FHA2cqO2iaNMPLV8JQxfNDRpOtZv8SIpQyUoCg0dMvzfM4bBoZV0ZPHuw9BW
 JTYGqmF5WCPDYFY0SBSXR7GfMuWMOcqW5jaA8ob/j3OIvaR9ldHUsYTzQ14UoE77dVLU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u1bun-0005XB-0P for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Apr 2025 02:09:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D054D61126;
 Mon,  7 Apr 2025 02:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C498CC4CEE3;
 Mon,  7 Apr 2025 02:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743991713;
 bh=xm2ScceSyaOMTCAkQf3KIDsk6uIz8avCUOolRNi4Fuk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=cAQeyW70FWP6Nri9RCE9s1AysIfjqTm2A7Y3SDdBHqRrT7Oj0KLsF/Ge+J4bsMWwg
 ds3u1ZjrFNXvnkfpWKl2NIoIv8rYGvX8Bm5q2lHrKx4uUxZz/PuqMnjDhCocFXTlD6
 bFp3lqCE2DiBO2CLXdKXfXSb+qj8N+7pjTCS3zi9oPyTeZ29tOmXk3MYng8grKJSoQ
 qvwKFgUXakpp6xjD5AHzpsIIWx1FR+AGbJlACJvgO+3eghM78u2+ahv2f9/rxcYhhP
 +mYnMKVkvkwMcnqlz7LzDige1CBB7vTEldOpLlWNSWzgrgUSzU+vyuMbgLRCwedAvW
 bvv1/jDs2ibbA==
Message-ID: <7059eada-a51d-4f68-b62a-0f2c89c9b01c@kernel.org>
Date: Mon, 7 Apr 2025 10:08:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, "yohan.joung" <yohan.joung@sk.com>
References: <20250403232107.2960-1-yohan.joung@sk.com>
 <Z_A5SWl1ueMTZxV0@google.com>
Content-Language: en-US
In-Reply-To: <Z_A5SWl1ueMTZxV0@google.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/5/25 03:55, Jaegeuk Kim wrote: > Hi Yohan,
 > > I modified this patch after applying the clean up by > >
 https://lore.kernel.org/linux-f2fs-devel/20250404195442.413945-1-jaegeuk@kernel.org/T/#u
 > [...] Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u1bun-0005XB-0P
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: prevent the current section from
 being selected as a victim during GC
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: pilhyun.kim@sk.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/5/25 03:55, Jaegeuk Kim wrote:
> Hi Yohan,
> 
> I modified this patch after applying the clean up by
> 
> https://lore.kernel.org/linux-f2fs-devel/20250404195442.413945-1-jaegeuk@kernel.org/T/#u
> 
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -486,6 +486,11 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
> 
>         free_i->free_sections++;
> 
> +       if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[BG_GC]) == secno)
> +               sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
> +       if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[FG_GC]) == secno)
> +               sbi->next_victim_seg[FG_GC] = NULL_SEGNO;

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> +
>  unlock_out:
>         spin_unlock(&free_i->segmap_lock);
>  }
> 
> On 04/04, yohan.joung wrote:
>> When selecting a victim using next_victim_seg in a large section, the
>> selected section might already have been cleared and designated as the
>> new current section, making it actively in use.
>> This behavior causes inconsistency between the SIT and SSA.
>>
>> F2FS-fs (dm-54): Inconsistent segment (70961) type [0, 1] in SSA and SIT
>> Call trace:
>> dump_backtrace+0xe8/0x10c
>> show_stack+0x18/0x28
>> dump_stack_lvl+0x50/0x6c
>> dump_stack+0x18/0x28
>> f2fs_stop_checkpoint+0x1c/0x3c
>> do_garbage_collect+0x41c/0x271c
>> f2fs_gc+0x27c/0x828
>> gc_thread_func+0x290/0x88c
>> kthread+0x11c/0x164
>> ret_from_fork+0x10/0x20
>>
>> issue scenario
>> segs_per_sec=2
>> - seg#0 and seg#1 are all dirty
>> - all valid blocks are removed in seg#1
>> - gc select this sec and next_victim_seg=seg#0
>> - migrate seg#0, next_victim_seg=seg#1
>> - checkpoint -> sec(seg#0, seg#1)  becomes free
>> - allocator assigns sec(seg#0, seg#1) to curseg
>> - gc tries to migrate seg#1
>>
>> Signed-off-by: yohan.joung <yohan.joung@sk.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>  fs/f2fs/segment.h | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
>> index 0465dc00b349..0773283babfa 100644
>> --- a/fs/f2fs/segment.h
>> +++ b/fs/f2fs/segment.h
>> @@ -474,8 +474,15 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
>>  		next = find_next_bit(free_i->free_segmap,
>>  				start_segno + SEGS_PER_SEC(sbi), start_segno);
>>  		if (next >= start_segno + usable_segs) {
>> -			if (test_and_clear_bit(secno, free_i->free_secmap))
>> +			if (test_and_clear_bit(secno, free_i->free_secmap)) {
>>  				free_i->free_sections++;
>> +
>> +				if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[BG_GC]) == secno)
>> +					sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
>> +
>> +				if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[FG_GC]) == secno)
>> +					sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
>> +			}
>>  		}
>>  	}
>>  skip_free:
>> -- 
>> 2.33.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
