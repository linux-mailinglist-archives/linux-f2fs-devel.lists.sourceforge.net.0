Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C4E3C7C15
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jul 2021 04:51:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m3Uzm-00054p-5d; Wed, 14 Jul 2021 02:51:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m3Uzl-00054j-Dy
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Jul 2021 02:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WjP0RqjlYFYQgVWECI9ewTm/lrnlDURFHHqfL9aa3z0=; b=WvSaUEDVMpjv9GUl8NA7d0FGI8
 hRmiuu0KCCD64E+DGu/I5T24W5WJRkN4+Sp3TkVOFlzBk/puz0kIYkZUQWdNGjVcYfdc6kOuOE2sD
 39iTXLgj2Ecp3oICGElnRA700RHTYdocEsPC8kGB5a74F2aKde0DGVn2Z56AKnMO2F9o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WjP0RqjlYFYQgVWECI9ewTm/lrnlDURFHHqfL9aa3z0=; b=dP+WegdAG7EweTr4pgAFf15LEt
 sSdszLa3Lcoe93OiD6gIKCUVH6qPLc4gnXjqxqcGTx9H9Bf27PGV1YBPa4iFqZcLQScc16bhdHTZE
 VOMevC+KIRWyycn/ns5gZYg0BHceQUC3RvZ1S/6yCY/uCD/gHKoUJFJi+N8/nWtWKjtQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m3Uze-007ZxU-T3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Jul 2021 02:51:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11DF66136E;
 Wed, 14 Jul 2021 02:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626231080;
 bh=TPrasmTq/xhjGBP6pq3SGLmKcWsOlA85wtzjRFrOM9I=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=sKj6AdGs/MMqcffnMPYX/Z96oP+K+ByRAuShjlkbrxVScdrdGf1H4VS3GBJYB1qJW
 AttAZvg/vpaPmQeixeIfXHm+zThzzU3Vb50q4OieKpoUvuPOpQS2YOiX6TJuZ5Ixbl
 nq6Ac1KFqcdXBR+SailN9omVogNm/GCVdhJcE67mCKn85YlKveFi5AjADdOeXpIvP9
 ZzaSnWw8DH5nrzJamZP4Q+0iieDa+Mm4eVMYbh5iKRLxKT7x2miEzQeQi9Qqs0Z7sM
 uFpv5wdx/cYiPOvmFjEyZGuHMLLN6n/nsRtP64y9a97UNiNd+mqAc0m00H17ktvqqa
 09t4wgGrcYR9g==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210601101024.119356-1-yuchao0@huawei.com>
 <YN32/NsjqJONbvz7@google.com>
 <648a96f7-2c83-e9ed-0cbd-4ee8e4797724@kernel.org>
 <YN5srPRZaPN9gpZ0@google.com>
 <b828fc22-f15a-8be4-631a-ed4ecb631386@kernel.org>
 <YOXo3CT5sBvj6p0J@google.com>
 <55e069f7-662d-630c-1201-d0163b38bc17@kernel.org>
 <YO4jGkKLQWZKrgny@google.com>
 <8f8d5645-9860-3e16-a09d-1a988ca6be72@kernel.org>
 <YO5JptcNuT28JJtX@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <c6abf9b4-adbb-f3a6-39a5-5b77ea8b1545@kernel.org>
Date: Wed, 14 Jul 2021 10:51:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YO5JptcNuT28JJtX@google.com>
Content-Language: en-US
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mail-archive.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m3Uze-007ZxU-T3
Subject: Re: [f2fs-dev] [PATCH v2 RFC] f2fs: fix to force keeping write
 barrier for strict fsync mode
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

On 2021/7/14 10:19, Jaegeuk Kim wrote:
> On 07/14, Chao Yu wrote:
>> On 2021/7/14 7:34, Jaegeuk Kim wrote:
>>> On 07/13, Chao Yu wrote:
>>>> On 2021/7/8 1:48, Jaegeuk Kim wrote:
>>>>> On 07/02, Chao Yu wrote:
>>>>>> On 2021/7/2 9:32, Jaegeuk Kim wrote:
>>>>>>> On 07/02, Chao Yu wrote:
>>>>>>>> On 2021/7/2 1:10, Jaegeuk Kim wrote:
>>>>>>>>> On 06/01, Chao Yu wrote:
>>>>>>>>>> [1] https://www.mail-archive.com/linux-f2fs-devel@lists.sourceforge.net/msg15126.html
>>>>>>>>>>
>>>>>>>>>> As [1] reported, if lower device doesn't support write barrier, in below
>>>>>>>>>> case:
>>>>>>>>>>
>>>>>>>>>> - write page #0; persist
>>>>>>>>>> - overwrite page #0
>>>>>>>>>> - fsync
>>>>>>>>>>       - write data page #0 OPU into device's cache
>>>>>>>>>>       - write inode page into device's cache
>>>>>>>>>>       - issue flush
>>>>>>>>>
>>>>>>>>> Well, we have preflush for node writes, so I don't think this is the case.
>>>>>>>>>
>>>>>>>>>       fio.op_flags |= REQ_PREFLUSH | REQ_FUA;
>>>>>>>>
>>>>>>>> This is only used for atomic write case, right?
>>>>>>>>
>>>>>>>> I mean the common case which is called from f2fs_issue_flush() in
>>>>>>>> f2fs_do_sync_file().
>>>>>>>
>>>>>>> How about adding PREFLUSH when writing node blocks aligned to the above set?
>>>>>>
>>>>>> You mean implementation like v1 as below?
>>>>>>
>>>>>> https://lore.kernel.org/linux-f2fs-devel/20200120100045.70210-1-yuchao0@huawei.com/
>>>>>
>>>>> Yea, I think so. :P
>>>>
>>>> I prefer v2, we may have several schemes to improve performance with v2, e.g.
>>>> - use inplace IO to avoid newly added preflush
>>>> - use flush_merge option to avoid redundant preflush
>>>> - if lower device supports barrier IO, we can avoid newly added preflush
>>>
>>> Doesn't v2 give one more flush than v1? Why do you want to take worse one and
>>
>> FUA implies an extra preflush command or similar mechanism in lower device to keep data
>> in bio being persistent before this command's completion.
>>
>> Also if lower device doesn't support FUA natively, block layer turns it into an empty
>> PREFLUSH command.
>>
>> So, it's hard to say which one will win the benchmark game, maybe we need some
>> performance data before making the choice, but you know, it depends on device's
>> character.
> 
> I was looking at # of bios.
> 
>>
>>> try to improve back? Not clear the benefit on v2.
>>
>> Well, if user suffer and complain performance regression with v1, any plan to improve it?
>>
>> I just thought about plan B/C/D for no matter v1 or v2.
> 
> I assumed you wanted v2 since it might be used for B/C/D improvements. But, it
> seems it wasn't. My point is to save one bio, but piggyback the flag to the
> device driver.

I doubt the conclusion...but it needs to get some data to prove it.

I think the right way is merging v1 now to fix the bug firstly, and let me do
the comparison on them a little bit later to see whether we need another
implementation... thoughts?

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>>>
>>>> Thanks,
>>>>
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> And please see do_checkpoint(), we call f2fs_flush_device_cache() and
>>>>>>>> commit_checkpoint() separately to keep persistence order of CP datas.
>>>>>>>>
>>>>>>>> See commit 46706d5917f4 ("f2fs: flush cp pack except cp pack 2 page at first")
>>>>>>>> for details.
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>>
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> If SPO is triggered during flush command, inode page can be persisted
>>>>>>>>>> before data page #0, so that after recovery, inode page can be recovered
>>>>>>>>>> with new physical block address of data page #0, however there may
>>>>>>>>>> contains dummy data in new physical block address.
>>>>>>>>>>
>>>>>>>>>> Then what user will see is: after overwrite & fsync + SPO, old data in
>>>>>>>>>> file was corrupted, if any user do care about such case, we can suggest
>>>>>>>>>> user to use STRICT fsync mode, in this mode, we will force to trigger
>>>>>>>>>> preflush command to persist data in device cache in prior to node
>>>>>>>>>> writeback, it avoids potential data corruption during fsync().
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>>>>>>>>>> ---
>>>>>>>>>> v2:
>>>>>>>>>> - fix this by adding additional preflush command rather than using
>>>>>>>>>> atomic write flow.
>>>>>>>>>>       fs/f2fs/file.c | 14 ++++++++++++++
>>>>>>>>>>       1 file changed, 14 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>>>>>>>> index 7d5311d54f63..238ca2a733ac 100644
>>>>>>>>>> --- a/fs/f2fs/file.c
>>>>>>>>>> +++ b/fs/f2fs/file.c
>>>>>>>>>> @@ -301,6 +301,20 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
>>>>>>>>>>       				f2fs_exist_written_data(sbi, ino, UPDATE_INO))
>>>>>>>>>>       			goto flush_out;
>>>>>>>>>>       		goto out;
>>>>>>>>>> +	} else {
>>>>>>>>>> +		/*
>>>>>>>>>> +		 * for OPU case, during fsync(), node can be persisted before
>>>>>>>>>> +		 * data when lower device doesn't support write barrier, result
>>>>>>>>>> +		 * in data corruption after SPO.
>>>>>>>>>> +		 * So for strict fsync mode, force to trigger preflush to keep
>>>>>>>>>> +		 * data/node write order to avoid potential data corruption.
>>>>>>>>>> +		 */
>>>>>>>>>> +		if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_STRICT &&
>>>>>>>>>> +								!atomic) {
>>>>>>>>>> +			ret = f2fs_issue_flush(sbi, inode->i_ino);
>>>>>>>>>> +			if (ret)
>>>>>>>>>> +				goto out;
>>>>>>>>>> +		}
>>>>>>>>>>       	}
>>>>>>>>>>       go_write:
>>>>>>>>>>       	/*
>>>>>>>>>> -- 
>>>>>>>>>> 2.29.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
