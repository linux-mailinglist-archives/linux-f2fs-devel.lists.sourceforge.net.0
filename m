Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E06EC7BE76
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jul 2019 12:34:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hslwE-0003Pw-N2; Wed, 31 Jul 2019 10:34:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hslwD-0003Pd-LD
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Jul 2019 10:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m62lC0bs6yEsLquVEAtHyAkWERHBFGBLWyioivzoCO4=; b=Anp6djKvw0OgR1iLzPPZR6wi4p
 luWs6SgrrLogYEVNLWtZasV1olXASyZB4osbiHb7kql8JPLluECRhgO1kBuME8YYXTN7h44/KxBtZ
 rwaM0QGa0pQgLbXVKYPJJ4a9blRsfMU+nGECHp/tGqXVvkS/FxXBGAcAe7d7QL/rXvqc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m62lC0bs6yEsLquVEAtHyAkWERHBFGBLWyioivzoCO4=; b=YMGmiGaG76+kwXVXeu5kWohQNu
 /yMAwJWAnFzinVZc9JSGdRKoHwRjX3SuC3MelPfuUxKjjRn3CTJUJsJ4+qWqvKG4E295eyK7sdlLU
 JRoMhRELlzniPbKOQC3pEfppU16XD8XjECU7Y5zhpTffhJE95W1DAZrUhyRBXnXKgyZU=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hslwC-005C0t-2b
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Jul 2019 10:34:29 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D53D883A38C8AFE22C2B;
 Wed, 31 Jul 2019 18:34:15 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 31 Jul
 2019 18:34:12 +0800
To: Sahitya Tummala <stummala@codeaurora.org>
References: <1564377626-12898-1-git-send-email-stummala@codeaurora.org>
 <a5acb5cb-2e77-902f-0a5e-063f7cbd0643@kernel.org>
 <20190730043630.GG8289@codeaurora.org>
 <609a502b-1e7f-c9b2-e864-421ffeda298b@huawei.com>
 <20190731034159.GH8289@codeaurora.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <7288dcd4-b168-7656-d1af-7e2cafa4f720@huawei.com>
Date: Wed, 31 Jul 2019 18:34:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190731034159.GH8289@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hslwC-005C0t-2b
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix indefinite loop in f2fs_gc()
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Sahitya,

On 2019/7/31 11:41, Sahitya Tummala wrote:
> Hi Chao,
> 
> On Tue, Jul 30, 2019 at 08:35:46PM +0800, Chao Yu wrote:
>> Hi Sahitya,
>>
>> On 2019/7/30 12:36, Sahitya Tummala wrote:
>>> Hi Chao,
>>>
>>> On Tue, Jul 30, 2019 at 12:00:45AM +0800, Chao Yu wrote:
>>>> Hi Sahitya,
>>>>
>>>> On 2019-7-29 13:20, Sahitya Tummala wrote:
>>>>> Policy - foreground GC, LFS mode and greedy GC mode.
>>>>>
>>>>> Under this policy, f2fs_gc() loops forever to GC as it doesn't have
>>>>> enough free segements to proceed and thus it keeps calling gc_more
>>>>> for the same victim segment.  This can happen if the selected victim
>>>>> segment could not be GC'd due to failed blkaddr validity check i.e.
>>>>> is_alive() returns false for the blocks set in current validity map.
>>>>>
>>>>> Fix this by not resetting the sbi->cur_victim_sec to NULL_SEGNO, when
>>>>> the segment selected could not be GC'd. This helps to select another
>>>>> segment for GC and thus helps to proceed forward with GC.
>>>>>
>>>>> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
>>>>> ---
>>>>>  fs/f2fs/gc.c | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>>>>> index 8974672..7bbcc4a 100644
>>>>> --- a/fs/f2fs/gc.c
>>>>> +++ b/fs/f2fs/gc.c
>>>>> @@ -1303,7 +1303,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
>>>>>  		round++;
>>>>>  	}
>>>>>  
>>>>> -	if (gc_type == FG_GC)
>>>>> +	if (gc_type == FG_GC && seg_freed)
>>>>>  		sbi->cur_victim_sec = NULL_SEGNO;
>>>>
>>>> In some cases, we may remain last victim in sbi->cur_victim_sec, and jump out of
>>>> GC cycle, then SSR can skip the last victim due to sec_usage_check()...
>>>>
>>>
>>> I see. I have a few questions on how to fix this issue. Please share your
>>> comments.
>>>
>>> 1. Do you think the scenario described is valid? It happens rarely, not very
>>
>> IIRC, we suffered endless gc loop due to there is valid block belong to an
>> opened atomic write file. (because we will skip directly once we hit atomic file)
>>
>> For your case, I'm not sure that would happen, did you look into is_alive(), why
>> will it fail? block address not match? If so, it looks like summary info and
>> dnode block and nat entry are inconsistent.
> 
> Yes, from the ramdumps, I could see that block address is not matching and
> hence, is_alive() could fail in the issue scenario. Have you observed any such
> cases before? What could be the reason for this mismatch?

Alright, I didn't suffer such case before...

I don't know, too few clues to find the root cause. I guess maybe:
- random data caused by emmc/ufs firmware bugs
- bit-flip or memory overflow
- f2fs bugs

So, for the solution, I suggest to detect such inconsistency, and tag in
somewhere to just get rid of selecting the corrupted section.

BTW, do you try fsck on that image? what's the result?

Thanks,

> 
> Thanks,
> 
>>
>>> easy to reproduce.  From the dumps, I see that only block is set as valid in
>>> the sentry->cur_valid_map for which I see that summary block check is_alive()
>>> could return false. As only one block is set as valid, chances are there it
>>> can be always selected as the victim by get_victim_by_default() under FG_GC.
>>>
>>> 2. What are the possible scenarios where summary block check is_alive() could
>>> fail for a segment?
>>
>> I guess, maybe after check_valid_map(), the block is been truncated before
>> is_alive(). If so the victim should be prefree directly instead of being
>> selected again...
>>
>>>
>>> 3. How does GC handle such segments?
>>
>> I think that's not a normal case, or I'm missing something.
>>
>> Thanks,
>>
>>>
>>> Thanks,
>>>
>>>> Thanks,
>>>>
>>>>>  
>>>>>  	if (sync)
>>>>>
>>>
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
