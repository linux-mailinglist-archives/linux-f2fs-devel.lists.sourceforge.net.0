Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9AE1E191C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2020 03:34:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jdOU7-0005qo-IL; Tue, 26 May 2020 01:34:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jdOU5-0005qe-Ba
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 May 2020 01:34:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:CC:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5Lzi1J+RycfJ7JMCV39RRBtH+QYlKKo2g89XZE7Ey8s=; b=CFKdC3vimIloEebfHp6nR1ssnh
 PGGCm7pnQbQqlNutdC72sHhLKHnTQQh7/y/oSApIhf1qpIh6Z4QcGy3FSDikplZ3Zad0seLAQdbMs
 v/2hGNC2BzTVe17hh/WdutnTTqzdcjHg2m56qphdnjXdm6RLRqyS1hnEbyqlSTzs5n0I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:CC:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5Lzi1J+RycfJ7JMCV39RRBtH+QYlKKo2g89XZE7Ey8s=; b=ghx7DgqYlZIuxofV1T8W8rfMfe
 E7xHUPGRZRY29dWagQTi3QD0zIrHnthWe4//3hEk4fbPC17nrL3I/OevpLzaqdrI1JzRfqBlyvNes
 DaA+Te9KorzK3S/7SaP8e7oclApW47LYRsbwHkw/skcNsaMdKc+xUshzzpMIP4LMjv/Q=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jdOTz-00Cz6r-SS
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 May 2020 01:34:25 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E4F4B5C67983534339F8;
 Tue, 26 May 2020 09:34:09 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 26 May
 2020 09:34:04 +0800
From: Chao Yu <yuchao0@huawei.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200522144752.216197-1-jaegeuk@kernel.org>
 <20200522233243.GA94020@google.com> <20200525035655.GA135148@google.com>
 <565af47c-8364-d910-8d1c-93645c12e660@huawei.com>
 <20200525150608.GA55033@google.com>
 <92afae8b-2dd3-171a-562c-404a67f9aab2@huawei.com>
Message-ID: <a44f9c2e-3859-6c5d-6f06-7c4c6b4c01c5@huawei.com>
Date: Tue, 26 May 2020 09:34:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <92afae8b-2dd3-171a-562c-404a67f9aab2@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jdOTz-00Cz6r-SS
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: avoid inifinite loop to wait for
 flushing node pages at cp_error
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/5/26 9:11, Chao Yu wrote:
> On 2020/5/25 23:06, Jaegeuk Kim wrote:
>> On 05/25, Chao Yu wrote:
>>> On 2020/5/25 11:56, Jaegeuk Kim wrote:
>>>> Shutdown test is somtimes hung, since it keeps trying to flush dirty node pages
>>>
>>> IMO, for umount case, we should drop dirty reference and dirty pages on meta/data
>>> pages like we change for node pages to avoid potential dead loop...
>>
>> I believe we're doing for them. :P
> 
> Actually, I mean do we need to drop dirty meta/data pages explicitly as below:
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 3dc3ac6fe143..4c08fd0a680a 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -299,8 +299,15 @@ static int __f2fs_write_meta_page(struct page *page,
> 
>  	trace_f2fs_writepage(page, META);
> 
> -	if (unlikely(f2fs_cp_error(sbi)))
> +	if (unlikely(f2fs_cp_error(sbi))) {
> +		if (is_sbi_flag_set(sbi, SBI_IS_CLOSE)) {
> +			ClearPageUptodate(page);
> +			dec_page_count(sbi, F2FS_DIRTY_META);
> +			unlock_page(page);
> +			return 0;
> +		}
>  		goto redirty_out;
> +	}
>  	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
>  		goto redirty_out;
>  	if (wbc->for_reclaim && page->index < GET_SUM_BLOCK(sbi, 0))
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 48a622b95b76..94b342802513 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2682,6 +2682,12 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
> 
>  	/* we should bypass data pages to proceed the kworkder jobs */
>  	if (unlikely(f2fs_cp_error(sbi))) {
> +		if (is_sbi_flag_set(sbi, SBI_IS_CLOSE)) {
> +			ClearPageUptodate(page);
> +			inode_dec_dirty_pages(inode);
> +			unlock_page(page);
> +			return 0;
> +		}

Oh, I notice previously, we will drop non-directory inode's dirty pages directly,
however, during umount, we'd better drop directory inode's dirty pages as well, right?

>  		mapping_set_error(page->mapping, -EIO);
>  		/*
>  		 * don't drop any dirty dentry pages for keeping lastest
> 
>>
>>>
>>> Thanks,
>>>
>>>> in an inifinite loop. Let's drop dirty pages at umount in that case.
>>>>
>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>> ---
>>>> v3:
>>>>  - fix wrong unlock
>>>>
>>>> v2:
>>>>  - fix typos
>>>>
>>>>  fs/f2fs/node.c | 9 ++++++++-
>>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>>>> index e632de10aedab..e0bb0f7e0506e 100644
>>>> --- a/fs/f2fs/node.c
>>>> +++ b/fs/f2fs/node.c
>>>> @@ -1520,8 +1520,15 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
>>>>  
>>>>  	trace_f2fs_writepage(page, NODE);
>>>>  
>>>> -	if (unlikely(f2fs_cp_error(sbi)))
>>>> +	if (unlikely(f2fs_cp_error(sbi))) {
>>>> +		if (is_sbi_flag_set(sbi, SBI_IS_CLOSE)) {
>>>> +			ClearPageUptodate(page);
>>>> +			dec_page_count(sbi, F2FS_DIRTY_NODES);
>>>> +			unlock_page(page);
>>>> +			return 0;
>>>> +		}
>>>>  		goto redirty_out;
>>>> +	}
>>>>  
>>>>  	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
>>>>  		goto redirty_out;
>>>>
>> .
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
