Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D08CA5E30
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2019 01:35:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i4vqi-0002JF-VT; Mon, 02 Sep 2019 23:35:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1i4vqi-0002J7-L1
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Sep 2019 23:35:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WGl7HTWO5XEJxWJhALO8eIEEb7qn8IQiGa6FCex61E0=; b=J9xuG43hW1CJNgYADWecz4rf37
 fRwF8XPYZ7PcbvIlRxXOFbfEGhAieOZjJS+1XhL97CTyLA699EDg+lkPHkRN9gxN0U2azMAXjYjZA
 pNT3TXba2uYnDg+V1m7iZJnvSrat9bZBSrX/g5L9gP7BDagGs3scNJ3M4QmKDp4u9io8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WGl7HTWO5XEJxWJhALO8eIEEb7qn8IQiGa6FCex61E0=; b=Exxl0QK4EDhGB4YjtCAQMJA5ug
 nefTkgHQ+qQH+VQoazTUCpEiblf4jNRg396N1MLXikI685ZDS4ltiWvc4qZHgJ4yrLHFBPMBz51Uu
 iW5i9aeIwA/xJLoyDCpDoBaL3qGu3zHe6vobx0Bf+XezEA8O/PxRue8dbv1enu3jCF8M=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i4vqh-007ktT-H7
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Sep 2019 23:35:04 +0000
Received: from [192.168.0.102] (unknown [180.111.100.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D7E2204EC;
 Mon,  2 Sep 2019 23:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567467297;
 bh=F9/9OqcGcQEtIqJp2H7jCpVfE3oPKJOonibTvF9TjfM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Vr1+k3iGVD46bLwn/jETtwy5lV4TZtL4Mpt9XVqsL2JZiaTIEK3zG6VKP1Jok2yJU
 RwT/ZeAvU7cQ42ZN3f7GvxXgvXR1SzQBfs7UQMaxSxBMtBZr4Avm1b/p+beTEgdpyb
 eacGXZpTyB2fnFJ3Ii/rCuYaMuzvo3OnvMLQbHeQ=
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
References: <20190219081529.5106-1-yuchao0@huawei.com>
 <d2b3c101-0399-4e85-5765-7b6504aaca74@huawei.com>
 <20190901071757.GA49907@jaegeuk-macbookpro.roam.corp.google.com>
 <024fe351-8e25-35cd-47a7-9755498c73f4@huawei.com>
 <20190902230449.GD71929@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <969f59f7-a171-f303-8a4a-ee1430036b27@kernel.org>
Date: Tue, 3 Sep 2019 07:34:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190902230449.GD71929@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i4vqh-007ktT-H7
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: add bio cache for IPU
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

On 2019-9-3 7:04, Jaegeuk Kim wrote:
> On 09/02, Chao Yu wrote:
>> On 2019/9/1 15:17, Jaegeuk Kim wrote:
>>> On 08/31, Chao Yu wrote:
>>>> On 2019/2/19 16:15, Chao Yu wrote:
>>>>> @@ -1976,10 +2035,13 @@ static int __write_data_page(struct page *page, bool *submitted,
>>>>>  	}
>>>>>  
>>>>>  	unlock_page(page);
>>>>> -	if (!S_ISDIR(inode->i_mode) && !IS_NOQUOTA(inode))
>>>>> +	if (!S_ISDIR(inode->i_mode) && !IS_NOQUOTA(inode)) {
>>>>> +		f2fs_submit_ipu_bio(sbi, bio, page);
>>>>>  		f2fs_balance_fs(sbi, need_balance_fs);
>>>>> +	}
>>>>
>>>> Above bio submission was added to avoid below deadlock:
>>>>
>>>> - __write_data_page
>>>>  - f2fs_do_write_data_page
>>>>   - set_page_writeback        ---- set writeback flag
>>>>   - f2fs_inplace_write_data
>>>>  - f2fs_balance_fs
>>>>   - f2fs_gc
>>>>    - do_garbage_collect
>>>>     - gc_data_segment
>>>>      - move_data_page
>>>>       - f2fs_wait_on_page_writeback
>>>>        - wait_on_page_writeback  --- wait writeback
>>>>
>>>> However, it breaks the merge of IPU IOs, to solve this issue, it looks we need
>>>> to add global bio cache for such IPU merge case, then later
>>>> f2fs_wait_on_page_writeback can check whether writebacked page is cached or not,
>>>> and do the submission if necessary.
>>>>
>>>> Jaegeuk, any thoughts?
>>>
>>> How about calling f2fs_submit_ipu_bio() when we need to do GC in the same
>>> context?
>>
>> However it also could happen in race case:
>>
>> Thread A				Thread B
>> - __write_data_page (inode x, page y)
>>  - f2fs_do_write_data_page
>>   - set_page_writeback        ---- set writeback flag in page y
>>   - f2fs_inplace_write_data
>>  - f2fs_balance_fs
>> 					 - lock gc_mutex
>>  - lock gc_mutex
>> 					  - f2fs_gc
>> 					   - do_garbage_collect
>> 					    - gc_data_segment
>> 					     - move_data_page
>> 					      - f2fs_wait_on_page_writeback
>> 					       - wait_on_page_writeback  --- wait writeback of page y
>>
>> So it needs a global bio cache for merged IPU pages, how about adding a list to
>> link all ipu bios in struct f2fs_bio_info?
> 
> Hmm, I can't think of better solution than adding a list. In this case, blk_plug
> doesn't work well?

Only submitted bio will be taken care of plug, for our case, the bio is still
pending though, I guess plug won't help.

Thanks,

> 
>>
>> struct f2fs_bio_info {
>> 	....
>> 	struct list_head ipu_bio_list;	/* track all ipu bio */
>> 	spinlock_t ipu_bio_lock;	/* protect ipu bio list */
>> }
>>
>>>
>>>>
>>>> Thanks,
>>> .
>>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
