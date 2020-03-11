Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7781A180EBC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2020 04:46:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jBsJk-0001Au-5w; Wed, 11 Mar 2020 03:46:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jBsJg-0001Ah-D9
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 03:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=azdcEwZk7hKF1T+MlBZJoAtNXoOB+Jgzttg2MkCZjv4=; b=UY+r7SHR5K7NhLIyPn3Kw3uQzk
 RMr5JbHXHnC4ZmWDuUjqXyVbR+lLQDtz8kN7B03ZO5dQCE1ydUJP7mJ9BSzmi46XWvUVAt3hfSh7X
 nHrftLGPuORtRmziiJU4nkxMNEeO5GJOs8BiNxXsTt+v17PlQgATnQYFR0Bjuimds6Pc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=azdcEwZk7hKF1T+MlBZJoAtNXoOB+Jgzttg2MkCZjv4=; b=XGQhqsThnsqutgqbVzONd1zuKz
 J3ZAelG7ofza3QO9l2mLOFYUJlKqC/uRSIMRVF4zwdivMfWS1dVd0FJ3Nh/gOvfn1pyRBmw/N9Pyk
 cmvKzqLHFW9lIh0D6nxIKUeEUFy+R+5BVH6q+q9Btrr1/GOC0POXFImPSFPZ/9DEe1x8=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jBsJc-0089Sr-NV
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 03:45:56 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id B66BC64527A1541740A0;
 Wed, 11 Mar 2020 11:45:41 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 11 Mar
 2020 11:45:37 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200310125009.12966-1-yuchao0@huawei.com>
 <20200310125009.12966-2-yuchao0@huawei.com>
 <20200310163239.GC240315@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <303612de-fa66-8e8a-0d02-dac322832e46@huawei.com>
Date: Wed, 11 Mar 2020 11:45:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200310163239.GC240315@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jBsJc-0089Sr-NV
Subject: Re: [f2fs-dev] [PATCH 2/5] f2fs: force compressed data into warm
 area
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

On 2020/3/11 0:32, Jaegeuk Kim wrote:
> On 03/10, Chao Yu wrote:
>> Generally, data shows better continuity in warm data area as its
>> default allocation direction is right, in order to enhance
>> sequential read/write performance of compress inode, let's force
>> compress data into warm area.

It looks cold data's allocation direction is right as well, I missed
to notice that previously due to I tested in small-sized image, and
f2fs_tuning_parameters() enables ALLOC_MODE_REUSE, then cold data
allocation always searchs free segment from segno #0, it breaks
continuity of physical blocks.

> 
> Not quite sure tho, compressed blocks are logically cold, no?

Correct.

Please ignore this patch. :P

Thanks,

> 
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>  fs/f2fs/segment.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 601d67e72c50..ab1bc750712a 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -3037,9 +3037,10 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
>>  	if (fio->type == DATA) {
>>  		struct inode *inode = fio->page->mapping->host;
>>  
>> -		if (is_cold_data(fio->page) || file_is_cold(inode) ||
>> -				f2fs_compressed_file(inode))
>> +		if (is_cold_data(fio->page) || file_is_cold(inode))
>>  			return CURSEG_COLD_DATA;
>> +		if (f2fs_compressed_file(inode))
>> +			return CURSEG_WARM_DATA;
>>  		if (file_is_hot(inode) ||
>>  				is_inode_flag_set(inode, FI_HOT_DATA) ||
>>  				f2fs_is_atomic_file(inode) ||
>> -- 
>> 2.18.0.rc1
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
