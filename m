Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E287D5B679F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Sep 2022 08:10:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oXz7u-0007Ua-Ip;
	Tue, 13 Sep 2022 06:10:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oXz7t-0007UU-2P
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 06:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HtynjSqp0qA0WlDEOpz8kW8GQWhIvvXxq3wL2qA3kmA=; b=Qo76movsojFem2/s59tvvWs2SD
 tk/gwuD/QKPsPklvKI50Hz28ViNjsX/pLllWmmAAdEE7Dlfx5cbz0PbBU6o9+WVNQrEfIdqyhfBGC
 QE36U4h3AeRwZB9kdOOXA3tZb5p0qVZBsq9da70fA8N9n3PZwJ2g/0yw1iNh5RPdxNoc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HtynjSqp0qA0WlDEOpz8kW8GQWhIvvXxq3wL2qA3kmA=; b=K5S7r+VbOetLKZgtFPJ9rfnVU5
 K+8FPRKxC1uevROy30509/UGmv1q5rYJVUcB0zOzOBwJWIFGZCS73SZuuA/JhEbqKy64++smgbATg
 4K/bAKErg4bTDEHTuQ2mCB6B9I4nCsxHRHqPHyQqGaP8VkXFkk7DO1hUMRmEoBHCLueI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oXz83-0003VF-QN for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 06:10:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A67A361300;
 Tue, 13 Sep 2022 06:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2645BC433D7;
 Tue, 13 Sep 2022 06:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663049431;
 bh=IhIxMrIDJMLg+xDXt16nzJUbcgo7Rlw4EE1X0fQ4U4Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HOgZtmLVSvLn0cNFOE0OjpBNGAVvENuzdLx1I9kjzJCQ1IWWcDovejco5OkOZFgmt
 9oxiIU3FN6znKldm1qT37gqv0+2E5wLpyAOGRFFrUUi4EQByJf9nCVLVBO6bbrhJs3
 yQ2obZZvSmUApb6oFJFGGLoorapLyYzl1jcmzFbC5/RjVWHM4gT5hv5mCzD4jYhefi
 ThYfEAZrhPmFR0lx5NbrU6aHT612GG8rtz9/PyhNrPMheOALo0EczgP3YuTlEldnB+
 OlCbl9COLseiFXPS6WcoTcoRWZGYmwlFZMK98oCUw/wGL+ynPCPyRUFt8kyZFyE3a6
 g4eH/pBHZ88vg==
Message-ID: <4fd0acaa-8231-200b-b90c-81d1e82dd861@kernel.org>
Date: Tue, 13 Sep 2022 14:10:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: zhangqilong <zhangqilong3@huawei.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20220913030529.3944-1-zhangqilong3@huawei.com>
 <293a41a4-7c7d-aac8-0bc2-15d47b7bd538@kernel.org>
 <4430326a24364b6aa92332c1393509f4@huawei.com>
 <0cf48a6c-79ff-ef04-b630-a76faaca34c6@kernel.org>
 <ae929a5c21b441f49fc187e7e893fe61@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ae929a5c21b441f49fc187e7e893fe61@huawei.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/13 12:37, zhangqilong wrote: >> >> On 2022/9/13
 11:41, zhangqilong wrote: >>>> On 2022/9/13 11:05, Zhang Qilong wrote: >>>>>
 If we do not truncate source page cache, user can still see the > [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oXz83-0003VF-QN
Subject: Re: [f2fs-dev] =?utf-8?b?562U5aSNOiDnrZTlpI06IFtQQVRDSCAtbmV4dF0g?=
 =?utf-8?q?f2fs=3A_adding_truncate_page_cache_after_being_moved?=
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/9/13 12:37, zhangqilong wrote:
>>
>> On 2022/9/13 11:41, zhangqilong wrote:
>>>> On 2022/9/13 11:05, Zhang Qilong wrote:
>>>>> If we do not truncate source page cache, user can still see the
>>>>> previous source data after being moved. We fix it by adding
>>>>> truncating after __exchange_data_block.
>>>>>
>>>>> Fixes:4dd6f977fc778 ("f2fs: support an ioctl to move a range of data
>>>>> blocks")
>>>>> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
>>>>> ---
>>>>>     fs/f2fs/file.c | 4 ++++
>>>>>     1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c index
>>>>> 771f1f7f3690..e3ff648aa496 100644
>>>>> --- a/fs/f2fs/file.c
>>>>> +++ b/fs/f2fs/file.c
>>>>> @@ -2789,6 +2789,10 @@ static int f2fs_move_file_range(struct file
>>>> *file_in, loff_t pos_in,
>>>>>     	}
>>>>>     	f2fs_unlock_op(sbi);
>>>>>
>>>>> +	filemap_invalidate_lock(src->i_mapping);
>>>>
>>>> invalidate lock should cover __exchange_data_block()?
>>>>
>>>>> +	truncate_pagecache_range(src, pos_in, pos_in + len - 1);
>>>>
>>>> truncate_pagecache_range() should be called before
>>>> __exchange_data_block()?
>>>
>>> I have tried it, but it do not work. So I move the truncate operation
>>> to the back of __exchange_data_block that it works well. I don't know
>>> much enough, what do you think of this issue.
>>
>> Can you describe details about the testcase?
>>
>> Thanks,
>>
> 
> Process 1 						process 2
> -> open A
> -> mmap
> 	Read the data and save
> 								-> ioctl with F2FS_IOC_MOVE_RANGE   A  ->  B

The ioctl only change the data on target file (B), so Process 1 needs to
read and check data of source file (B)?

Thanks,

> 
> -> mmap
> 	Read the data that offset is same with first time and save
> 
> Compare the consistency of the data that read twice.
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
