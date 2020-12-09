Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8372D3848
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Dec 2020 02:31:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmoKb-00012D-AC; Wed, 09 Dec 2020 01:31:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kmoKZ-000126-Vs
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 01:31:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yd279BvTN6ZrBHEDGb8Qgcq3ww0WHfNP0DAXIJ4A2Xc=; b=KCSBoikNVwxTK2a51jcgr266+j
 jOpAQmm6hgrsWO9al2EbOdwSrJmdsVT6sBT+llXQ3vKDq3k021SKPeb0FXGsh9NFBohfabzaSD2fV
 eyjlFzSDbci8iy7LfiMHsmx7j6bwgdmLIEDiOw5kHOleG07dUA53r/o7FbKdLwGZkynE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yd279BvTN6ZrBHEDGb8Qgcq3ww0WHfNP0DAXIJ4A2Xc=; b=IULEQeZ6R+2tX3b//Rt+ouEqit
 QMik9HC+a/WiLeDw7KlPqwjvpRIoMsoABRnS2ZEfv9ThcIV5CMZnR1g7tIN0UqCAeodTnUsvfd027
 UnepZ9Ch+2j3vdnXVnumslbeF4r6TlF6gLXF/vbtkIA/nHoZsVBZsb9lnpdkS8jRzfL4=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmoKM-004IsA-2f
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 01:31:47 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CrKHm2lYQzLnRn;
 Wed,  9 Dec 2020 09:30:44 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 9 Dec 2020
 09:31:16 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20201207120114.25642-1-jack.qiu@huawei.com>
 <20201207120114.25642-3-jack.qiu@huawei.com> <X85dFjmqLmo/RsQn@google.com>
 <529dd167-3951-1fb9-a1c3-9ae6cdbc8dfb@huawei.com>
 <X87ZENVuVkTFGdRe@google.com>
 <1c0006ea-3bb9-93ef-914b-69a8b06f902e@huawei.com>
 <X88mThRozv5cjCFD@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <cbff5c7d-26c4-da2d-f706-54e7441b9855@huawei.com>
Date: Wed, 9 Dec 2020 09:31:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <X88mThRozv5cjCFD@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kmoKM-004IsA-2f
Subject: Re: [f2fs-dev] [PATCH v3 2/3] f2fs: inline: remove redundant
 FI_DATA_EXIST set
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/8 15:07, Jaegeuk Kim wrote:
> On 12/08, Chao Yu wrote:
>> On 2020/12/8 9:38, Jaegeuk Kim wrote:
>>> On 12/08, Chao Yu wrote:
>>>> On 2020/12/8 0:49, Jaegeuk Kim wrote:
>>>>> On 12/07, Jack Qiu wrote:
>>>>>> FI_DATA_EXIST has been set in recover_inline_flags, no need set in
>>>>>> f2fs_recover_inline_data again. Just remove it.
>>>>>>
>>>>>> Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
>>>>>> ---
>>>>>>     fs/f2fs/inline.c | 1 -
>>>>>>     1 file changed, 1 deletion(-)
>>>>>>
>>>>>> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
>>>>>> index 0399531efcd3..0a8f7eefca7d 100644
>>>>>> --- a/fs/f2fs/inline.c
>>>>>> +++ b/fs/f2fs/inline.c
>>>>>> @@ -286,7 +286,6 @@ int f2fs_recover_inline_data(struct inode *inode, struct page *npage)
>>>>>>     		memcpy(dst_addr, src_addr, MAX_INLINE_DATA(inode));
>>>>>>
>>>>>>     		set_inode_flag(inode, FI_INLINE_DATA);
>>>>>> -		set_inode_flag(inode, FI_DATA_EXIST);
>>>>>
>>>>> Wait, recover_inline_flags() sets this based on on-disk flag, but this tries to
>>>>> recover it back.
>>>>
>>>> Should this flag only be recovered with the way like __recover_inline_status()?
>>>> otherwise, the data_exist status may be not be consistent with real condition.
>>>
>>> Well, we cannot say consistency on this, since user can write zero data. This
>>
>> I can see that FI_DATA_EXIST flag only decide that whether f2fs_convert_inline_page()
>> will copy inline data into first page, if user write all zero data in inline area,
>> there is no need to do the copy, as first page contains all zero already.
>>
>> So, IMO, the flag indicates more like a FI_NON_ZERO_DATA_EXIST status? that would be
>> consistent with our implementation in __recover_inline_status().
> 
> IIRC, original intention is FI_DATA_EXIST, and non-zero case was added to avoid
> potential inconsistency case. So, it's not intened for FI_NON_ZERO_DATA_EXIST.

Why we can encounter such inconsistency? is there any bug before adding that patch?

> Still I don't see any problem on this, but  looking at the iteration overhead on
>     do_read_inode() -> __recover_inlint_status().

Yup, it's trivial, I'm fine to keep it as it is.

Thanks,

> 
>>
>> Thanks,
>>
>>> can avoid __recover_inline_state() regardless of there-in data which is zero or
>>> not.
>>>
>>>>
>>>> Thanks,
>>>>
>>>>>
>>>>>>
>>>>>>     		set_page_dirty(ipage);
>>>>>>     		f2fs_put_page(ipage, 1);
>>>>>> --
>>>>>> 2.17.1
>>>>>>
>>>>>>
>>>>>>
>>>>>> _______________________________________________
>>>>>> Linux-f2fs-devel mailing list
>>>>>> Linux-f2fs-devel@lists.sourceforge.net
>>>>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> Linux-f2fs-devel mailing list
>>>>> Linux-f2fs-devel@lists.sourceforge.net
>>>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>>>> .
>>>>>
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
