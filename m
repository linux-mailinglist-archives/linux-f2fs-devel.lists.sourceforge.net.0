Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F13B8379C13
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 May 2021 03:30:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgHEa-0007qk-Tu; Tue, 11 May 2021 01:30:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <yuchao0@huawei.com>) id 1lgHEP-0007qC-TM
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 01:30:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fJmsx/AB2ENMXxE6ja6cSm4Ny0xBDxq82ujJ/KhItd8=; b=DYnFiQc/Pos2Wi7o+my9uktDN8
 kytG6mpq+8P4CPULPer7MCNUli9XoHghqdljV8K9qZrqo0lrLNg0H+6qR1ypB8nAPQzyqgZw1drvU
 mvCOmVSij21n+GrsUalb1vWnbqfkz+yySEfrFEP6KcFpSKy8e52BHw+oz8/OFvlBWKe4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fJmsx/AB2ENMXxE6ja6cSm4Ny0xBDxq82ujJ/KhItd8=; b=ADE27ukjbsCZ4NGby3efX9KTuK
 oWtSQH95kYWaLmtaB83dGeAUU7tM33CfBnxyVA06tyYXclk0IvaJVAuQQ8nRK8X9POwqGxBgcgmF4
 6LHm2ziZy0L9jEU/mEgcPQZ5nHG0MUT3V8bFndPc/avFkguz/lovvlNGLJYGHjWWOsFE=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgHEG-0001iB-G2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 01:30:41 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FfKyx2KKCzmg1X;
 Tue, 11 May 2021 09:27:05 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 11 May
 2021 09:30:22 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <CGME20210429062005epcms2p352ef77f96ab66cbffe0c0ab6c1b62d8a@epcms2p3>
 <20210429062005epcms2p352ef77f96ab66cbffe0c0ab6c1b62d8a@epcms2p3>
 <3a0ab201-9546-d523-abc7-79df5f637f14@huawei.com>
 <YJN0nTgadoq8vDaG@google.com>
 <bd0fa15b-01c3-9f70-3eb8-ec2b54a0ee8f@huawei.com>
 <YJlHmP/ej8/IsHL3@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <6e95edca-4802-7650-4771-5389067935dc@huawei.com>
Date: Tue, 11 May 2021 09:30:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YJlHmP/ej8/IsHL3@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lgHEG-0001iB-G2
Subject: Re: [f2fs-dev] [PATCH] f2fs: set file as cold when file
 defragmentation
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/5/10 22:47, Jaegeuk Kim wrote:
> On 05/06, Chao Yu wrote:
>> On 2021/5/6 12:46, Jaegeuk Kim wrote:
>>> On 05/06, Chao Yu wrote:
>>>> On 2021/4/29 14:20, Daejun Park wrote:
>>>>> In file defragmentation by ioctl, all data blocks in the file are
>>>>> re-written out-of-place. File defragmentation implies user will not update
>>>>> and mostly read the file. So before the defragmentation, we set file
>>>>> temperature as cold for better block allocation.
>>>>
>>>> I don't think all fragmented files are cold, e.g. db file.
>>>
>>> I have a bit different opinion. I think one example would be users want to
>>> defragment a file, when the they want to get higher read bandwidth for
>>
>> Multimedia file was already defined as cold file now via default extension
>> list?
> 
> I just gave an example. And default is default.
> 
>>
>>> usually multimedia files. That's likely to be cold files. Moreover, I don't
>>> think they want to defragment db files which will be fragmented soon?
>>
>> I guess like db files have less update but more access?
> 
> I think both, and we set it as hot.

Then hot and cold bit will set to the same db file after defragmentation?

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>>>
>>>> We have separated interface (via f2fs_xattr_advise_handler, e.g. setfattr -n
>>>> "system.advise" -v value) to indicate this file is a hot/cold file, so my
>>>> suggestion is after file defragmentation, if you think this file is cold, and
>>>> use setxattr() to set it as cold.
>>>>
>>>> Thanks,
>>>>
>>>>>
>>>>> Signed-off-by: Daejun Park <daejun7.park@samsung.com>
>>>>> ---
>>>>>     fs/f2fs/file.c | 3 +++
>>>>>     1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>>> index d697c8900fa7..dcac965a05fe 100644
>>>>> --- a/fs/f2fs/file.c
>>>>> +++ b/fs/f2fs/file.c
>>>>> @@ -2669,6 +2669,9 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
>>>>>     	map.m_len = pg_end - pg_start;
>>>>>     	total = 0;
>>>>> +	if (!file_is_cold(inode))
>>>>> +		file_set_cold(inode);
>>>>> +
>>>>>     	while (map.m_lblk < pg_end) {
>>>>>     		pgoff_t idx;
>>>>>     		int cnt = 0;
>>>>>
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
