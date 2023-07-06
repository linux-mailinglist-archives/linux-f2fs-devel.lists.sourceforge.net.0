Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5F97492BC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jul 2023 02:47:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qHD97-0005jW-0Q;
	Thu, 06 Jul 2023 00:46:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qHD95-0005jL-JV
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jul 2023 00:46:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VERPLtZ41/MpnO/LfB1wKmGDvnXekWKRfPmacfxBfVQ=; b=m75EbI48s3TBrxKTOXOicz7sdG
 J8rEzm+pCFRgJeTISxFpyB9wyGdbDBH0rIejWEycX1MvdWaAyfNY103XjJANQqFpzxNhEUiUFnr+T
 2IXP4e9PuqUPrfTV2kDh3yHn1TL6MDNlLEX3HT6i2CxQRUHH41GSjLt+mH75okNIRSAU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VERPLtZ41/MpnO/LfB1wKmGDvnXekWKRfPmacfxBfVQ=; b=nIn2kz5r/iDfxDU+/LlMnv/Auw
 v+bhG4E5N8uEMHDWXsgvcyoKRbtWHvgNI+QgnEr/5L98zTxh1Cws8fyoy6gQKMueGxWA42P4znF7n
 yzMhVp61cH2YFBg6OOS8DNWk5+AEqNCCo7+fWPDzXN8PPsnSWasi29VzufpF2vFAEv3Y=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qHD95-00007x-4r for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jul 2023 00:46:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 89060617D7;
 Thu,  6 Jul 2023 00:46:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1787EC433C7;
 Thu,  6 Jul 2023 00:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688604409;
 bh=K7XtV0MJ+Qrk4bv1eFylFG3uLMZzjyg4PV7PAJHk7Pk=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=Bl1SkOIpVGW6hcGbc5cMMbxqYDDiCdcSfZDOEME5PNVHWUXtVrd7PwkgRrH8kaOQe
 akXjeHKdJglMoNRnv49qPMCIJv6IlXXl7HTEG3HHY9vA832LkWy6dskn3Pix4zb1GN
 Ac8LXbPHO4oZdVnAy7WYoyqteIRAmhH1V+MjPsN4kU2ebT/yMEMDJ53iLhHRgnqlUg
 N5A9BopyHz1FoMhK56fICuN0So84NopPypNQSPfxVZKYDpFETLe5NnTPncOJErG0WR
 RgFq6/v3O1zqwbGjJeuBYGSZzHEG5oMHWKQSxdHUYj+0Wi05QlLH5m2JsVtFZTiVbX
 47ZbChLsDUvyw==
Message-ID: <cadfb8d7-f5d0-a3ec-cafb-a0c06ad7d290@kernel.org>
Date: Thu, 6 Jul 2023 08:46:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230613203947.2745943-1-jaegeuk@kernel.org>
 <ZInmkgjDnAUD5Nk0@google.com>
 <50d5fa8c-4fe9-8a03-be78-0b5383e55b62@kernel.org>
 <ZKP6EJ5dZ4f4wScp@google.com>
 <65143701-4c19-ab66-1500-abd1162639cd@kernel.org>
 <ZKWovWZDiHjMavtB@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZKWovWZDiHjMavtB@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/7/6 1:30, Jaegeuk Kim wrote: > On 07/04,
 Chao Yu wrote:
 >> On 2023/7/4 18:53, Jaegeuk Kim wrote: >>> On 07/03, Chao Yu wrote: >>>>
 On 2023/6/15 0:10, Jaegeuk Kim wrote: >>>>> If there're huge [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qHD95-00007x-4r
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: do not issue small discard commands
 during checkpoint
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

On 2023/7/6 1:30, Jaegeuk Kim wrote:
> On 07/04, Chao Yu wrote:
>> On 2023/7/4 18:53, Jaegeuk Kim wrote:
>>> On 07/03, Chao Yu wrote:
>>>> On 2023/6/15 0:10, Jaegeuk Kim wrote:
>>>>> If there're huge # of small discards, this will increase checkpoint latency
>>>>> insanely. Let's issue small discards only by trim.
>>>>>
>>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>> ---
>>>>>
>>>>>     Change log from v1:
>>>>>      - move the skip logic to avoid dangling objects
>>>>>
>>>>>     fs/f2fs/segment.c | 2 +-
>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>>>> index 8c7af8b4fc47..0457d620011f 100644
>>>>> --- a/fs/f2fs/segment.c
>>>>> +++ b/fs/f2fs/segment.c
>>>>> @@ -2193,7 +2193,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
>>>>>     			len = next_pos - cur_pos;
>>>>>     			if (f2fs_sb_has_blkzoned(sbi) ||
>>>>> -			    (force && len < cpc->trim_minlen))
>>>>> +					!force || len < cpc->trim_minlen)
>>>>>     				goto skip;
>>>>
>>>> Sorry for late reply.
>>>>
>>>> We have a configuration for such case, what do you think of setting
>>>> max_small_discards to zero? otherwise, w/ above change, max_small_discards
>>>> logic may be broken?
>>>>
>>>> What:           /sys/fs/f2fs/<disk>/max_small_discards
>>>> Date:           November 2013
>>>> Contact:        "Jaegeuk Kim" <jaegeuk.kim@samsung.com>
>>>> Description:    Controls the issue rate of discard commands that consist of small
>>>>                   blocks less than 2MB. The candidates to be discarded are cached until
>>>>                   checkpoint is triggered, and issued during the checkpoint.
>>>>                   By default, it is disabled with 0.
>>>>
>>>> Or, if we prefer to disable small_discards by default, what about below change:
>>>
>>> I think small_discards is fine, but need to avoid long checkpoint latency only.
>>
>> I didn't get you, do you mean we can still issue small discard by
>> fstrim, so small_discards functionality is fine?
> 
> You got the point.

Well, actually, what I mean is max_small_discards sysfs entry's functionality
is broken. Now, the entry can not be used to control number of small discards
committed by checkpoint.

I think there is another way to achieve "avoid long checkpoint latency caused
by committing huge # of small discards", the way is we can set max_small_discards
to small value or zero, w/ such configuration, it will take checkpoint much less
time or no time to committing small discard due to below control logic:

f2fs_flush_sit_entries()
{
...
			if (!(cpc->reason & CP_DISCARD)) {
				cpc->trim_start = segno;
				add_discard_addrs(sbi, cpc, false);
			}
...
}

add_discard_addrs()
{
...
	while (force || SM_I(sbi)->dcc_info->nr_discards <=
				SM_I(sbi)->dcc_info->max_discards) {

It will break the loop once nr_discards is larger than max_discards, if
max_discards is set to zero, checkpoint won't take time to handle small discards.

...
		if (!de) {
			de = f2fs_kmem_cache_alloc(discard_entry_slab,
						GFP_F2FS_ZERO, true, NULL);
			de->start_blkaddr = START_BLOCK(sbi, cpc->trim_start);
			list_add_tail(&de->list, head);
		}
...
	}
...

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>>>
>>>>   From eb89d9b56e817e3046d7fa17165b12416f09d456 Mon Sep 17 00:00:00 2001
>>>> From: Chao Yu <chao@kernel.org>
>>>> Date: Mon, 3 Jul 2023 09:06:53 +0800
>>>> Subject: [PATCH] Revert "f2fs: enable small discard by default"
>>>>
>>>> This reverts commit d618ebaf0aa83d175658aea5291e0c459d471d39 in order
>>>> to disable small discard by default, so that if there're huge number of
>>>> small discards, it will decrease checkpoint's latency obviously.
>>>>
>>>> Also, this patch reverts 9ac00e7cef10 ("f2fs: do not issue small discard
>>>> commands during checkpoint"), due to it breaks small discard feature which
>>>> may be configured via sysfs entry max_small_discards.
>>>>
>>>> Fixes: 9ac00e7cef10 ("f2fs: do not issue small discard commands during checkpoint")
>>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>>> ---
>>>>    fs/f2fs/segment.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>>> index 14c822e5c9c9..0a313368f18b 100644
>>>> --- a/fs/f2fs/segment.c
>>>> +++ b/fs/f2fs/segment.c
>>>> @@ -2193,7 +2193,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
>>>>    			len = next_pos - cur_pos;
>>>>
>>>>    			if (f2fs_sb_has_blkzoned(sbi) ||
>>>> -					!force || len < cpc->trim_minlen)
>>>> +			    (force && len < cpc->trim_minlen))
>>>>    				goto skip;
>>>>
>>>>    			f2fs_issue_discard(sbi, entry->start_blkaddr + cur_pos,
>>>> @@ -2269,7 +2269,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
>>>>    	atomic_set(&dcc->queued_discard, 0);
>>>>    	atomic_set(&dcc->discard_cmd_cnt, 0);
>>>>    	dcc->nr_discards = 0;
>>>> -	dcc->max_discards = MAIN_SEGS(sbi) << sbi->log_blocks_per_seg;
>>>> +	dcc->max_discards = 0;
>>>>    	dcc->max_discard_request = DEF_MAX_DISCARD_REQUEST;
>>>>    	dcc->min_discard_issue_time = DEF_MIN_DISCARD_ISSUE_TIME;
>>>>    	dcc->mid_discard_issue_time = DEF_MID_DISCARD_ISSUE_TIME;
>>>> -- 
>>>> 2.40.1
>>>>
>>>>
>>>>
>>>>>     			f2fs_issue_discard(sbi, entry->start_blkaddr + cur_pos,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
