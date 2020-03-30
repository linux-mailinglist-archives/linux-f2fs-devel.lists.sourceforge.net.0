Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD8E1978AB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Mar 2020 12:16:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jIrTT-0002tP-QV; Mon, 30 Mar 2020 10:16:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jIrTR-0002tE-LS
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Mar 2020 10:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:CC:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6Yc6od5BATbDgVUJv4c6FP3qJhT0rTc8ERfehgyxgtY=; b=apgahQsDSLFWGlAB7ydMJoJRul
 z7++QnROeyR3IUZTejrmlqD+3yk73q1aIjFrt0Pwhg1xw4XQoCOa/HD7ifT5RPvAGoBKLAZf07Hx/
 IjdnoqIVyqFY6SV6oA7GpkOlmYvQH/tGtPJq8fVwOnzD48cRm2Vg411mIWsPuMRfQeE4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:CC:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6Yc6od5BATbDgVUJv4c6FP3qJhT0rTc8ERfehgyxgtY=; b=Z/97vYDVKfTzDwmL/yALDtGPIP
 MtO60Wy05T81/ckIvJS207hyOeF/ilJO3zy5nseQ9HlYEDB2zYkpVGLes16jUAdcMDelZT7dA/oEg
 uqpUL4s1WmeKLvAjbwZmkIW/irAQ+dTGsVfLBwZm2khdmYhDBy5/BUj9DxMfuDLCf55c=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jIrTO-00CEik-Uw
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Mar 2020 10:16:53 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 0B6A386AA6E7D272DAC8;
 Mon, 30 Mar 2020 18:16:44 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 30 Mar
 2020 18:16:40 +0800
From: Chao Yu <yuchao0@huawei.com>
To: Sahitya Tummala <stummala@codeaurora.org>
References: <1584506689-5041-1-git-send-email-stummala@codeaurora.org>
 <29d4adc4-482d-3d92-1470-3405989ea231@huawei.com>
 <20200326133700.GR20234@codeaurora.org>
 <2b0d8d4c-a981-4edc-d8ca-fe199a63ea79@huawei.com>
 <20200327030542.GS20234@codeaurora.org>
 <20200330065335.GT20234@codeaurora.org>
 <9adc5c7e-7936-bac7-58b1-50631f8ac5eb@huawei.com>
Message-ID: <5ec3b2e1-162c-e62d-1834-100c8ae39ff7@huawei.com>
Date: Mon, 30 Mar 2020 18:16:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <9adc5c7e-7936-bac7-58b1-50631f8ac5eb@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jIrTO-00CEik-Uw
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix long latency due to discard during
 umount
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

On 2020/3/30 16:38, Chao Yu wrote:
> Hi Sahitya,
> 
> Bad news, :( I guess we didn't catch the root cause, as after applying v3,
> I still can reproduce this issue:
> 
> generic/003 10s ...  30s

I use zram as backend device of fstest,

Call Trace:
 dump_stack+0x66/0x8b
 f2fs_submit_discard_endio+0x88/0xa0 [f2fs]
 generic_make_request_checks+0x70/0x5f0
 generic_make_request+0x3e/0x2e0
 submit_bio+0x72/0x140
 __submit_discard_cmd.isra.50+0x4a8/0x710 [f2fs]
 __issue_discard_cmd+0x171/0x3a0 [f2fs]

Does this mean zram uses single queue, so we may always fail to submit 'nowait'
IO due to below condition:

	/*
	 * Non-mq queues do not honor REQ_NOWAIT, so complete a bio
	 * with BLK_STS_AGAIN status in order to catch -EAGAIN and
	 * to give a chance to the caller to repeat request gracefully.
	 */
	if ((bio->bi_opf & REQ_NOWAIT) && !queue_is_mq(q)) {
		status = BLK_STS_AGAIN;
		goto end_io;
	}



> 
> Thanks,
> 
> On 2020/3/30 14:53, Sahitya Tummala wrote:
>> Hi Chao,
>>
>> On Fri, Mar 27, 2020 at 08:35:42AM +0530, Sahitya Tummala wrote:
>>> On Fri, Mar 27, 2020 at 09:51:43AM +0800, Chao Yu wrote:
>>>>
>>>> With this patch, most of xfstest cases cost 5 * n second longer than before.
>>>>
>>>> E.g. generic/003, during umount(), we looped into retrying one bio
>>>> submission.
>>>>
>>>> [61279.829724] F2FS-fs (zram1): Found nat_bits in checkpoint
>>>> [61279.885337] F2FS-fs (zram1): Mounted with checkpoint version = 5cf3cb8e
>>>> [61281.912832] submit discard bio start [23555,1]
>>>> [61281.912835] f2fs_submit_discard_endio [23555,1] err:-11
>>>> [61281.912836] submit discard bio end [23555,1]
>>>> [61281.912836] move dc to retry list [23555,1]
>>>>
>>>> ...
>>>>
>>>> [61286.881212] submit discard bio start [23555,1]
>>>> [61286.881217] f2fs_submit_discard_endio [23555,1] err:-11
>>>> [61286.881223] submit discard bio end [23555,1]
>>>> [61286.881224] move dc to retry list [23555,1]
>>>> [61286.905198] submit discard bio start [23555,1]
>>>> [61286.905203] f2fs_submit_discard_endio [23555,1] err:-11
>>>> [61286.905205] submit discard bio end [23555,1]
>>>> [61286.905206] move dc to retry list [23555,1]
>>>> [61286.929157] F2FS-fs (zram1): Issue discard(23555, 23555, 1) failed, ret: -11
>>>>
>>>> Could you take a look at this issue?
>>>
>>> Let me check and get back on this.
>>
>> I found the issue. The dc with multiple bios is getting requeued again and
>> again in case if one of its bio gets -EAGAIN error. Even the successfully
>> completed bios are getting requeued again resulting into long latency.
>> I have fixed it by splitting the dc in such case so that we can requeue only
>> the leftover bios into a new dc and retry that later within the 5 sec timeout.
>>
>> Please help to review v3 posted and if it looks good, I would like to request
>> you to test the earlier regression scenario with it to check the result again?
>>
>> thanks,
>>
>>>
>>> Thanks,
>>>
>>>>
>>>> Thanks,
>>>>
>>>>>
>>>>> Thanks,
>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>>> +				break;
>>>>>>> +			}
>>>>>>> +		}
>>>>>>>  
>>>>>>>  		atomic_inc(&dcc->issued_discard);
>>>>>>>  
>>>>>>> @@ -1463,6 +1477,40 @@ static unsigned int __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
>>>>>>>  	return issued;
>>>>>>>  }
>>>>>>>  
>>>>>>> +static bool __should_discard_retry(struct f2fs_sb_info *sbi,
>>>>> s> > +		struct discard_policy *dpolicy)
>>>>>>> +{
>>>>>>> +	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
>>>>>>> +	struct discard_cmd *dc, *tmp;
>>>>>>> +	bool retry = false;
>>>>>>> +	unsigned long flags;
>>>>>>> +
>>>>>>> +	if (dpolicy->type != DPOLICY_UMOUNT)
>>>>>>> +		f2fs_bug_on(sbi, 1);
>>>>>>> +
>>>>>>> +	mutex_lock(&dcc->cmd_lock);
>>>>>>> +	list_for_each_entry_safe(dc, tmp, &(dcc->retry_list), list) {
>>>>>>> +		if (dpolicy->timeout != 0 &&
>>>>>>> +			f2fs_time_over(sbi, dpolicy->timeout)) {
>>>>>>> +			retry = false;
>>>>>>> +			break;
>>>>>>> +		}
>>>>>>> +
>>>>>>> +		spin_lock_irqsave(&dc->lock, flags);
>>>>>>> +		if (!dc->bio_ref) {
>>>>>>> +			dc->state = D_PREP;
>>>>>>> +			dc->error = 0;
>>>>>>> +			reinit_completion(&dc->wait);
>>>>>>> +			__relocate_discard_cmd(dcc, dc);
>>>>>>> +			retry = true;
>>>>>>> +		}
>>>>>>> +		spin_unlock_irqrestore(&dc->lock, flags);
>>>>>>> +	}
>>>>>>> +	mutex_unlock(&dcc->cmd_lock);
>>>>>>> +
>>>>>>> +	return retry;
>>>>>>> +}
>>>>>>> +
>>>>>>>  static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
>>>>>>>  					struct discard_policy *dpolicy)
>>>>>>>  {
>>>>>>> @@ -1470,12 +1518,13 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
>>>>>>>  	struct list_head *pend_list;
>>>>>>>  	struct discard_cmd *dc, *tmp;
>>>>>>>  	struct blk_plug plug;
>>>>>>> -	int i, issued = 0;
>>>>>>> +	int i, err, issued = 0;
>>>>>>>  	bool io_interrupted = false;
>>>>>>>  
>>>>>>>  	if (dpolicy->timeout != 0)
>>>>>>>  		f2fs_update_time(sbi, dpolicy->timeout);
>>>>>>>  
>>>>>>> +retry:
>>>>>>>  	for (i = MAX_PLIST_NUM - 1; i >= 0; i--) {
>>>>>>>  		if (dpolicy->timeout != 0 &&
>>>>>>>  				f2fs_time_over(sbi, dpolicy->timeout))
>>>>>>> @@ -1509,7 +1558,10 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
>>>>>>>  				break;
>>>>>>>  			}
>>>>>>>  
>>>>>>> -			__submit_discard_cmd(sbi, dpolicy, dc, &issued);
>>>>>>> +			err = __submit_discard_cmd(sbi, dpolicy, dc, &issued);
>>>>>>> +			if (err == -EAGAIN)
>>>>>>> +				congestion_wait(BLK_RW_ASYNC,
>>>>>>> +						DEFAULT_IO_TIMEOUT);
>>>>>>>  
>>>>>>>  			if (issued >= dpolicy->max_requests)
>>>>>>>  				break;
>>>>>>> @@ -1522,6 +1574,10 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
>>>>>>>  			break;
>>>>>>>  	}
>>>>>>>  
>>>>>>> +	if (!list_empty(&dcc->retry_list) &&
>>>>>>> +		__should_discard_retry(sbi, dpolicy))
>>>>>>> +		goto retry;
>>>>>>> +
>>>>>>>  	if (!issued && io_interrupted)
>>>>>>>  		issued = -1;
>>>>>>>  
>>>>>>> @@ -1613,6 +1669,12 @@ static unsigned int __wait_discard_cmd_range(struct f2fs_sb_info *sbi,
>>>>>>>  		goto next;
>>>>>>>  	}
>>>>>>>  
>>>>>>> +	if (dpolicy->type == DPOLICY_UMOUNT &&
>>>>>>> +		!list_empty(&dcc->retry_list)) {
>>>>>>> +		wait_list = &dcc->retry_list;
>>>>>>> +		goto next;
>>>>>>> +	}
>>>>>>> +
>>>>>>>  	return trimmed;
>>>>>>>  }
>>>>>>>  
>>>>>>> @@ -2051,6 +2113,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
>>>>>>>  	for (i = 0; i < MAX_PLIST_NUM; i++)
>>>>>>>  		INIT_LIST_HEAD(&dcc->pend_list[i]);
>>>>>>>  	INIT_LIST_HEAD(&dcc->wait_list);
>>>>>>> +	INIT_LIST_HEAD(&dcc->retry_list);
>>>>>>>  	INIT_LIST_HEAD(&dcc->fstrim_list);
>>>>>>>  	mutex_init(&dcc->cmd_lock);
>>>>>>>  	atomic_set(&dcc->issued_discard, 0);
>>>>>>>
>>>>>
>>>
>>> -- 
>>> --
>>> Sent by a consultant of the Qualcomm Innovation Center, Inc.
>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
>>
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
