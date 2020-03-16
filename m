Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A97E1860F6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Mar 2020 01:53:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jDdzt-0006QJ-IW; Mon, 16 Mar 2020 00:52:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jDdzr-0006QA-Uk
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Mar 2020 00:52:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OAXWphv3NZw6ANv7DQmwXfchLi3reTRCNidmJrajFhA=; b=P0B7Re9gLreyOPz1QsxILzcQrt
 V45thAcZGvftEo+aTfvFENML1wOHqRnQ/Tggw+yZRiWxH6JmAwUcMtR3a7IIImaFPZt/ZpNBbtIsj
 hpp6yxizNsyMGMN2oWTOmdgdC0LL6blatroA3IkSrTYWi10EatK2OaBfO1r3a/FRBsD0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OAXWphv3NZw6ANv7DQmwXfchLi3reTRCNidmJrajFhA=; b=d9PO1UgJ8MjT6KTL0CVAwFnv2u
 3HsYSyCNLUFqwmN/8SXPhkwbiIRgsWcb6dSGy21V+TPZIMAzG4vTetf/b0+7iGMee0sQIp7w3qKqm
 dnIAuURgKG2yV3TWW1nIajWXrh67mu2q3L3/uU7+TqbipMJDz2hAx0+jpmGdFeHn6EzU=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jDdzm-002Vsj-PC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Mar 2020 00:52:47 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 25AF7FB1864F123E307B;
 Mon, 16 Mar 2020 08:52:31 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 16 Mar
 2020 08:52:26 +0800
To: Sahitya Tummala <stummala@codeaurora.org>
References: <1584011671-20939-1-git-send-email-stummala@codeaurora.org>
 <fa7d88ee-01e2-e82c-6c79-f24b90fbd472@huawei.com>
 <20200313033912.GJ20234@codeaurora.org>
 <a8f01157-0b1b-d83a-488d-bb48cf8954ab@huawei.com>
 <20200313110846.GL20234@codeaurora.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <20d3b7ef-b216-6e46-58fd-7f1c96d4a8d3@huawei.com>
Date: Mon, 16 Mar 2020 08:52:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200313110846.GL20234@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jDdzm-002Vsj-PC
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

On 2020/3/13 19:08, Sahitya Tummala wrote:
> On Fri, Mar 13, 2020 at 02:30:55PM +0800, Chao Yu wrote:
>> On 2020/3/13 11:39, Sahitya Tummala wrote:
>>> On Fri, Mar 13, 2020 at 10:20:04AM +0800, Chao Yu wrote:
>>>> On 2020/3/12 19:14, Sahitya Tummala wrote:
>>>>> F2FS already has a default timeout of 5 secs for discards that
>>>>> can be issued during umount, but it can take more than the 5 sec
>>>>> timeout if the underlying UFS device queue is already full and there
>>>>> are no more available free tags to be used. In that case, submit_bio()
>>>>> will wait for the already queued discard requests to complete to get
>>>>> a free tag, which can potentially take way more than 5 sec.
>>>>>
>>>>> Fix this by submitting the discard requests with REQ_NOWAIT
>>>>> flags during umount. This will return -EAGAIN for UFS queue/tag full
>>>>> scenario without waiting in the context of submit_bio(). The FS can
>>>>> then handle these requests by retrying again within the stipulated
>>>>> discard timeout period to avoid long latencies.
>>>>>
>>>>> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
>>>>> ---
>>>>>  fs/f2fs/segment.c | 14 +++++++++++++-
>>>>>  1 file changed, 13 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>>>> index fb3e531..a06bbac 100644
>>>>> --- a/fs/f2fs/segment.c
>>>>> +++ b/fs/f2fs/segment.c
>>>>> @@ -1124,10 +1124,13 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
>>>>>  	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
>>>>>  	struct list_head *wait_list = (dpolicy->type == DPOLICY_FSTRIM) ?
>>>>>  					&(dcc->fstrim_list) : &(dcc->wait_list);
>>>>> -	int flag = dpolicy->sync ? REQ_SYNC : 0;
>>>>> +	int flag;
>>>>>  	block_t lstart, start, len, total_len;
>>>>>  	int err = 0;
>>>>>  
>>>>> +	flag = dpolicy->sync ? REQ_SYNC : 0;
>>>>> +	flag |= dpolicy->type == DPOLICY_UMOUNT ? REQ_NOWAIT : 0;
>>>>> +
>>>>>  	if (dc->state != D_PREP)
>>>>>  		return 0;
>>>>>  
>>>>> @@ -1203,6 +1206,11 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
>>>>>  		bio->bi_end_io = f2fs_submit_discard_endio;
>>>>>  		bio->bi_opf |= flag;
>>>>>  		submit_bio(bio);
>>>>> +		if ((flag & REQ_NOWAIT) && (dc->error == -EAGAIN)) {
>>>>
>>>> If we want to update dc->state, we need to cover it with dc->lock.
>>>
>>> Sure, will update it.
>>>
>>>>
>>>>> +			dc->state = D_PREP;
>>>>
>>>> BTW, one dc can be referenced by multiple bios, so dc->state could be updated to
>>>> D_DONE later by f2fs_submit_discard_endio(), however we just relocate it to
>>>> pending list... which is inconsistent status.
>>>
>>> In that case dc->bio_ref will reflect it and until it becomes 0, the dc->state
>>> will not be updated to D_DONE in f2fs_submit_discard_endio()?
>>
>> __submit_discard_cmd()
>>  lock()
>>  dc->state = D_SUBMIT;
>>  dc->bio_ref++;
>>  unlock()
>> ...
>>  submit_bio()
>> 				f2fs_submit_discard_endio()
>> 				 dc->error = -EAGAIN;
>> 				 lock()
>> 				 dc->bio_ref--;
>>
>>  dc->state = D_PREP;
>>
>> 				 dc->state = D_DONE;
>> 				 unlock()
>>
>> So finally, dc's state is D_DONE, and it's in wait list, then will be relocated
>> to pending list.
> 
> In case of queue full, f2fs_submit_discard_endio() will not be called

I guess the case is there are multiple bios related to one dc and partially callback
of bio is called asynchronously and the other is called synchronously, so the race
condition could happen.

Thanks,

> asynchronously. It will be called in the context of submit_bio() itself.
> So by the time, submit_bio returns dc->error will be -EAGAIN and dc->state
> will be D_DONE. 
> 
> submit_bio()
> ->blk_mq_make_request
> ->blk_mq_get_request()
>   ->bio_wouldblock_error() (called due to queue full)
>     ->bio_endio()
>     
> Thanks,
>>
>>>
>>> Thanks,
>>>
>>>>
>>>> Thanks,
>>>>
>>>>> +			err = dc->error;
>>>>> +			break;
>>>>> +		}
>>>>>  
>>>>>  		atomic_inc(&dcc->issued_discard);
>>>>>  
>>>>> @@ -1510,6 +1518,10 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
>>>>>  			}
>>>>>  
>>>>>  			__submit_discard_cmd(sbi, dpolicy, dc, &issued);
>>>>> +			if (dc->error == -EAGAIN) {
>>>>> +				congestion_wait(BLK_RW_ASYNC, HZ/50);
>>>>> +				__relocate_discard_cmd(dcc, dc);
>>>>> +			}
>>>>>  
>>>>>  			if (issued >= dpolicy->max_requests)
>>>>>  				break;
>>>>>
>>>
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
