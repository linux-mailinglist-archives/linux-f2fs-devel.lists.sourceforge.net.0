Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6201AA4D12
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Sep 2019 03:16:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i4axg-0004Nx-Vi; Mon, 02 Sep 2019 01:16:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i4axf-0004Nq-Gh
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Sep 2019 01:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w4TUTeVCzT2ryxGF2To9sg8dqqBIB9uUmKKkh8vCK9o=; b=DyQLbgfVeuIh0O+8/UeesZMUSj
 7n8ST7rDPx3cFc0tM4FECIOXvlre0cq5FxmQNISZcHIQgHo/AP5RuHujRek+Oi6oyMcOIQJkvZ2Fc
 0U1m8jZBFXNsQLZZt/liQKMDD3RuDCfiy18q+op6LRgfdC7eDVv+vjezdPsq56G6EcjQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w4TUTeVCzT2ryxGF2To9sg8dqqBIB9uUmKKkh8vCK9o=; b=ANMj1GbTBCCm6S7jlmJnmQ/je6
 escAQLYHq7m5znC8e9D4TIcxoXciesV3AYKleQi5MmmOLRsxJz+LG7bx3e9a6iUpKEscVJUxddbfC
 TwPp/dNw8Y36/tbhd9/SDijJ1hDyz0yYo52882m3kMl1uyL+v9gaVnlZEslH0/ZnbZ6M=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i4axd-00CfQM-DP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Sep 2019 01:16:51 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 05DDA2834E6AD09C6159;
 Mon,  2 Sep 2019 09:16:42 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 2 Sep 2019
 09:16:35 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190219081529.5106-1-yuchao0@huawei.com>
 <d2b3c101-0399-4e85-5765-7b6504aaca74@huawei.com>
 <20190901071757.GA49907@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <024fe351-8e25-35cd-47a7-9755498c73f4@huawei.com>
Date: Mon, 2 Sep 2019 09:16:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190901071757.GA49907@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1i4axd-00CfQM-DP
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

On 2019/9/1 15:17, Jaegeuk Kim wrote:
> On 08/31, Chao Yu wrote:
>> On 2019/2/19 16:15, Chao Yu wrote:
>>> @@ -1976,10 +2035,13 @@ static int __write_data_page(struct page *page, bool *submitted,
>>>  	}
>>>  
>>>  	unlock_page(page);
>>> -	if (!S_ISDIR(inode->i_mode) && !IS_NOQUOTA(inode))
>>> +	if (!S_ISDIR(inode->i_mode) && !IS_NOQUOTA(inode)) {
>>> +		f2fs_submit_ipu_bio(sbi, bio, page);
>>>  		f2fs_balance_fs(sbi, need_balance_fs);
>>> +	}
>>
>> Above bio submission was added to avoid below deadlock:
>>
>> - __write_data_page
>>  - f2fs_do_write_data_page
>>   - set_page_writeback        ---- set writeback flag
>>   - f2fs_inplace_write_data
>>  - f2fs_balance_fs
>>   - f2fs_gc
>>    - do_garbage_collect
>>     - gc_data_segment
>>      - move_data_page
>>       - f2fs_wait_on_page_writeback
>>        - wait_on_page_writeback  --- wait writeback
>>
>> However, it breaks the merge of IPU IOs, to solve this issue, it looks we need
>> to add global bio cache for such IPU merge case, then later
>> f2fs_wait_on_page_writeback can check whether writebacked page is cached or not,
>> and do the submission if necessary.
>>
>> Jaegeuk, any thoughts?
> 
> How about calling f2fs_submit_ipu_bio() when we need to do GC in the same
> context?

However it also could happen in race case:

Thread A				Thread B
- __write_data_page (inode x, page y)
 - f2fs_do_write_data_page
  - set_page_writeback        ---- set writeback flag in page y
  - f2fs_inplace_write_data
 - f2fs_balance_fs
					 - lock gc_mutex
 - lock gc_mutex
					  - f2fs_gc
					   - do_garbage_collect
					    - gc_data_segment
					     - move_data_page
					      - f2fs_wait_on_page_writeback
					       - wait_on_page_writeback  --- wait writeback of page y

So it needs a global bio cache for merged IPU pages, how about adding a list to
link all ipu bios in struct f2fs_bio_info?

struct f2fs_bio_info {
	....
	struct list_head ipu_bio_list;	/* track all ipu bio */
	spinlock_t ipu_bio_lock;	/* protect ipu bio list */
}

> 
>>
>> Thanks,
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
