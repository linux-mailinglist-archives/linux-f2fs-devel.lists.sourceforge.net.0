Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7721E152484
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Feb 2020 02:40:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iz9fq-0004ct-1L; Wed, 05 Feb 2020 01:40:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iz9fo-0004cf-Uk
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Feb 2020 01:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2fK6zMfEnGUN3zm0KimX+IUR7M3QnDEwV0PIO8DrBCA=; b=YiK1F56MeQGwWpFUxl24U6THvO
 9BY71BOlga9w8wMFr7LjtlroVkQnLyy6VgD0wVFZVpzk5FQsfdgT+D1I6RwQARMwtr4akdtrGw5qO
 1Bobe2XkiEB3rjUUQhaLcavzu3LvN42i4E5JZvoYlHe8cOfFGTKvSZULNX77HBT6CVb8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2fK6zMfEnGUN3zm0KimX+IUR7M3QnDEwV0PIO8DrBCA=; b=WikqikVp0n7cYqY0OAG2mFhHbK
 moDSLf2bzcIg5+XhPh00I8dAvqyW0K/oGsOHrSsqQdnBY5LenMHuN1nLX/gnzcnBlYEA1s588mJD2
 nTdMUXHhsYQTHvsAi0khy7tEUjkJbsuX8v3XAtA6QZY7xD7AYoHGl5MHpXANTDBM2At0=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iz9fk-00AVHj-FB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Feb 2020 01:40:12 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E418031958F4B04BFA3;
 Wed,  5 Feb 2020 09:39:50 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 5 Feb 2020
 09:39:48 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200120100045.70210-1-yuchao0@huawei.com>
 <20200123221855.GA7917@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <0d3f284a-5b98-3d6f-cc9f-47431053f42c@huawei.com>
Date: Wed, 5 Feb 2020 09:39:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200123221855.GA7917@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mail-archive.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iz9fk-00AVHj-FB
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to force keeping write barrier for
 strict fsync mode
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

On 2020/1/24 6:18, Jaegeuk Kim wrote:
> On 01/20, Chao Yu wrote:
>> If barrier is enabled, for strict fsync mode, we should force to
>> use atomic write semantics to avoid data corruption due to no
>> barrier support in lower device.
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>  fs/f2fs/file.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 86ddbb55d2b1..c9dd45f82fbd 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -241,6 +241,13 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
>>  	};
>>  	unsigned int seq_id = 0;
>>  
>> +	/*
>> +	 * for strict fsync mode, force to keep atomic write sematics to avoid
>> +	 * data corruption if lower device doesn't support write barrier.
>> +	 */
>> +	if (!atomic && F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_STRICT)
>> +		atomic = true;
> 
> This allows to relax IO ordering and cache flush. I'm not sure that's what you
> want to do here for strict mode.

I intend to solve potential data corruption mentioned in below report:

https://www.mail-archive.com/linux-f2fs-devel@lists.sourceforge.net/msg15126.html

It occurs in this scenario:

- write page #0; persist
- overwrite page #0
- fsync
 - write data page #0 OPU into device's cache
 - write inode page into device's cache
 - issue flush

If SPO is triggered during flush command, inode page can be persisted before data
page #0, so that after recovery, inode page can be recovered with new physical block
address of data page #0, however there may contains dummy data in new physical block
address.

So what user see is after overwrite & fsync + SPO, old data in file was corrupted, if
any user do care about such case, we can enhance to avoid the corruption in strict mode
and suggest user to use fsync's strict mode.

Thoughts?

Thanks,

> 
>> +
>>  	if (unlikely(f2fs_readonly(inode->i_sb) ||
>>  				is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
>>  		return 0;
>> -- 
>> 2.18.0.rc1
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
