Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 441C6380171
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 May 2021 03:16:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lhMR0-0005w6-M3; Fri, 14 May 2021 01:16:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <yuchao0@huawei.com>) id 1lhMQy-0005vy-43
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 May 2021 01:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sEAJxdxakavFt5xMnXGHwvpw5l+iA2/q1cMx9/pW1Ak=; b=mZMIqQ+fpAotjW/I8EZ3h96DZX
 fJT5FE/jcG0jBmdstO3W5QQWz55T2u5rdiHZ00bpkgXVCAyJ5Pehlq2AJ3D6jkLLtM1kLRO9bOjxP
 PCHBYUtDwv2KzEuNFax26piesKRQqvhf7v+jQATwAMstiQtw1U19VEim+tv+uoxthuAw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sEAJxdxakavFt5xMnXGHwvpw5l+iA2/q1cMx9/pW1Ak=; b=DLgpQgCbpwqiFWLHR+LX65eWEo
 pCuMVX9n1SnUejbIPk1d0azeCOGGoRQ3tq6M+WzsRHsyPEL2NWJi1gYun8N3XXf5w4h+KIUxzu8Au
 Rq9/VbKIBkd3wU2tuuNpeFBUrJUG/XpDLGpKiN2sxHbccpTdUb4bVZfvYUwmK3TfZOEA=;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lhMQv-0005j5-Dj
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 May 2021 01:16:07 +0000
Received: from dggemx753-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Fh9Vl5My2z60Xm;
 Fri, 14 May 2021 09:12:31 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 14 May 2021 09:15:55 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20210507094455.1695-1-changfengnan@vivo.com>
 <YJlUpHJLONlORWWl@google.com> <000b01d74656$518e96f0$f4abc4d0$@vivo.com>
 <YJr8PuZlOBqb+Qv1@google.com>
 <15efccda-b8e3-80bc-13b7-b2d62a1cac15@huawei.com>
 <YJ2Xflx6eF2P89Km@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <7f6b707c-dd45-21fe-e1f7-624fafcda3d3@huawei.com>
Date: Fri, 14 May 2021 09:15:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YJ2Xflx6eF2P89Km@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-ClientProxiedBy: dggemx702-chm.china.huawei.com (10.1.199.49) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lhMQv-0005j5-Dj
Subject: Re: [f2fs-dev] =?utf-8?b?562U5aSNOiBbUEFUQ0ggdjRdIGYyZnM6IGNvbXBy?=
 =?utf-8?q?ess=3A_avoid_unnecessary_check_in_f2fs=5Fprepare=5Fcompress=5Fo?=
 =?utf-8?q?verwrite?=
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, changfengnan@vivo.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/5/14 5:17, Eric Biggers wrote:
> On Wed, May 12, 2021 at 09:52:19AM +0800, Chao Yu wrote:
>> On 2021/5/12 5:50, Jaegeuk Kim wrote:
>>> On 05/11, changfengnan@vivo.com wrote:
>>>> Hi Jaegeuk:
>>>>
>>>> If there're existing clusters beyond i_size, may cause data corruption, but
>>>> will this happen in normal? maybe some error can cause this, if i_size is
>>>> error the data beyond size still can't handle properly.  Is there normal
>>>> case can casue existing clusters beyond i_size?
>>>
>>> We don't have a rule to sync between i_size and i_blocks.
>>
>> I can't image a case that compressed cluster may cross filesize, it looks it's
>> a bug if that happened, but I'm not sure I have considered all cases. So, I
>> prefer to add a check condition as below, then testing w/ xfstest/por_fsstress
>> for a while.
>>
>> Subject: [PATCH] f2fs: compress: compressed cluster should not cross i_size
>>
>> ---
>>   fs/f2fs/data.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index 06d1e58d3882..9acca358d578 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -3325,6 +3325,8 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
>>   			err = ret;
>>   			goto fail;
>>   		} else if (ret) {
>> +			f2fs_bug_on(sbi, index >=
>> +				DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE));
>>   			return 0;
>>   		}
>>   	}
> 
> If a file has both fs-verity and compression enabled, it can have compressed
> clusters past i_size.

Correct, any other case we missed for a writable file? let us know.

Thanks,

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
