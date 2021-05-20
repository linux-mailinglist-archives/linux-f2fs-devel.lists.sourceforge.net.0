Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F86D389BC6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 May 2021 05:18:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ljZCV-0006Pi-3F; Thu, 20 May 2021 03:18:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ljZCT-0006Pb-Fw
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 May 2021 03:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r4Vx9bmWYl4bTrhlKoXB5YzyHXV6Z2FKcFCw2jVVhrg=; b=mdJgBxJ0ccaobv08CaiKrOJ+47
 RDQEb9j/UZF7jiqoQSNE2jnq4B0QToL2eJYsffn3ccfNX301uzZ0Na+PkBv8fP0VlIsujk2FioFZh
 DYjQvqcez0pqxTfIqUcsvRmnYBzSYz3TOeKjJTCGgtXdJIMfTZW7j6exs2pM8IIO1SK0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r4Vx9bmWYl4bTrhlKoXB5YzyHXV6Z2FKcFCw2jVVhrg=; b=Q0ozcAyl+zAKPI7flMEngqJkif
 5xszh0+b7Xt0/k02V1SgtAHM38MVLUvm7ExkcWeEbeXzIgNqDVPs79hWUvhGdgXt5q32CD6ZVg7ba
 F531uVhBJfjQ6MSugHNWRwSJIbUASAFe1HelNPDvA0EwJtVlXQJbr7dD/OCeTnmlQOWQ=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ljZCF-0002HU-Oi
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 May 2021 03:18:18 +0000
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FlvwW0D9ZzqV75;
 Thu, 20 May 2021 11:14:19 +0800 (CST)
Received: from dggemx753-chm.china.huawei.com (10.0.44.37) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 20 May 2021 11:17:41 +0800
Received: from [10.136.110.154] (10.136.110.154) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 20 May 2021 11:17:41 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210518095458.99728-1-yuchao0@huawei.com>
 <YKXHo0LAdE5fa77J@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <96cc500d-18df-e9b5-98aa-066a2acfacc9@huawei.com>
Date: Thu, 20 May 2021 11:17:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YKXHo0LAdE5fa77J@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-ClientProxiedBy: dggemx703-chm.china.huawei.com (10.1.199.50) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1ljZCF-0002HU-Oi
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: compress: fix to disallow wildcard
 extension for hot/cold file
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

On 2021/5/20 10:21, Jaegeuk Kim wrote:
> On 05/18, Chao Yu wrote:
>> If all files are hot or cold, hot/cold separation is not needed anymore,
>> so let's disallow configure wildcard extension.
> 
> We need to be able to set hot/cold on the fly?

I got your concern, so do you prefer to keep "*" extension configuration
for hot/cold file?

Thanks,

> 
>>
>> Fixes: 4c8ff7095bef ("f2fs: support data compression")
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>   fs/f2fs/f2fs.h  |  1 +
>>   fs/f2fs/namei.c | 12 ++++++++----
>>   fs/f2fs/sysfs.c |  3 +++
>>   3 files changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index b753cc88c77e..ecb13c3b458d 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -3322,6 +3322,7 @@ void f2fs_handle_failed_inode(struct inode *inode);
>>   /*
>>    * namei.c
>>    */
>> +bool f2fs_is_wildcard_char(const char *ext);
>>   int f2fs_update_extension_list(struct f2fs_sb_info *sbi, const char *name,
>>   							bool hot, bool set);
>>   struct dentry *f2fs_get_parent(struct dentry *child);
>> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
>> index a9cd9cf97229..8d78b96a8b3b 100644
>> --- a/fs/f2fs/namei.c
>> +++ b/fs/f2fs/namei.c
>> @@ -153,15 +153,17 @@ static struct inode *f2fs_new_inode(struct inode *dir, umode_t mode)
>>   	return ERR_PTR(err);
>>   }
>>   
>> +bool f2fs_is_wildcard_char(const char *ext)
>> +{
>> +	return *ext == '*' && strlen(ext) == 1;
>> +}
>> +
>>   static inline int is_extension_exist(const unsigned char *s, const char *sub)
>>   {
>>   	size_t slen = strlen(s);
>>   	size_t sublen = strlen(sub);
>>   	int i;
>>   
>> -	if (sublen == 1 && *sub == '*')
>> -		return 1;
>> -
>>   	/*
>>   	 * filename format of multimedia file should be defined as:
>>   	 * "filename + '.' + extension + (optional: '.' + temp extension)".
>> @@ -306,9 +308,11 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
>>   	ext = F2FS_OPTION(sbi).extensions;
>>   
>>   	for (i = 0; i < ext_cnt; i++) {
>> +		if (f2fs_is_wildcard_char(ext[i]))
>> +			goto set_compress;
>>   		if (!is_extension_exist(name, ext[i]))
>>   			continue;
>> -
>> +set_compress:
>>   		set_compress_context(inode);
>>   		return;
>>   	}
>> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
>> index dc71bc968c72..ff5acb4de1b6 100644
>> --- a/fs/f2fs/sysfs.c
>> +++ b/fs/f2fs/sysfs.c
>> @@ -343,6 +343,9 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>>   		if (strlen(name) >= F2FS_EXTENSION_LEN)
>>   			return -EINVAL;
>>   
>> +		if (f2fs_is_wildcard_char(name))
>> +			return -EINVAL;
>> +
>>   		down_write(&sbi->sb_lock);
>>   
>>   		ret = f2fs_update_extension_list(sbi, name, hot, set);
>> -- 
>> 2.29.2
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
