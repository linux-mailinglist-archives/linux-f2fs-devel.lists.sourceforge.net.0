Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50517196482
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 Mar 2020 09:38:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jI6zK-0003Iu-3S; Sat, 28 Mar 2020 08:38:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jI6zJ-0003ID-Nb
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 28 Mar 2020 08:38:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZHgNvgU6XaywbhShpi+DyT3Yz9W+DlVpT27IblHcGig=; b=FMUYVtgtvUNkXUDgGHfHYqsrA7
 g4kfxnQuvbV96WGA+Wo1fK1V15KqODLWoZgzofeF+8VlsmFYbGnbqy8cdDzlxXn5WUuKjRXuCou97
 JPSslO58qDvvaHMwTow4Q3uDmWIISMJut8KN68CUBZMEJ/P9uNSr/+2DVcX52KqRJw6g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZHgNvgU6XaywbhShpi+DyT3Yz9W+DlVpT27IblHcGig=; b=FfJfdNw3DTD5l4iDdoTSTFgkj/
 KY/0GQI0IVGQ54PlQ5YYYwIWQt+stF06x3X69zBe4S+QhMsfWHlJonR0FdnM8BrBsn78DsqAj+2nc
 Hm7zhuYZBHDCSlsLEM7rpc+i8kk44FjDahnHaWl3oDvA5mZ9+PyNHLJAIZlzffKz1Xl8=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jI6zG-00BtDd-F7
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 28 Mar 2020 08:38:41 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 5A3213A18FC3287734DC;
 Sat, 28 Mar 2020 16:38:30 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sat, 28 Mar
 2020 16:38:28 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200327102953.104035-1-yuchao0@huawei.com>
 <20200327102953.104035-3-yuchao0@huawei.com>
 <20200327193233.GB186975@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <a363b4e4-0f41-6608-b27f-ad26b8f78555@huawei.com>
Date: Sat, 28 Mar 2020 16:38:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200327193233.GB186975@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jI6zG-00BtDd-F7
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: fix to check
 f2fs_compressed_file() in f2fs_bmap()
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

On 2020/3/28 3:32, Jaegeuk Kim wrote:
> On 03/27, Chao Yu wrote:
>> Otherwise, for compressed inode, returned physical block address
>> may be wrong.
> 
> We can use bmap to check the allocated (non)compressed blocks.

Sure, I've updated it in v2.

Thanks,

> 
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>  fs/f2fs/data.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index 24643680489b..f22f3ba10a48 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -3591,6 +3591,8 @@ static sector_t f2fs_bmap(struct address_space *mapping, sector_t block)
>>  
>>  	if (f2fs_has_inline_data(inode))
>>  		return 0;
>> +	if (f2fs_compressed_file(inode))
>> +		return 0;
>>  
>>  	/* make sure allocating whole blocks */
>>  	if (mapping_tagged(mapping, PAGECACHE_TAG_DIRTY))
>> -- 
>> 2.18.0.rc1
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
