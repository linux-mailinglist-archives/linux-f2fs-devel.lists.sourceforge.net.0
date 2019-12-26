Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D120512AA0E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Dec 2019 04:42:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ikK2i-0003lE-Qq; Thu, 26 Dec 2019 03:42:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ikK2b-0003ku-Pg
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Dec 2019 03:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mb5uhjn9firG3m8nUpFk0q91xsfVDR8ahaCvEvX1s3w=; b=RvIrYgiowey1SKNhxL78vjK/OO
 bMMJMnfKxf5VaZBsR5EfHoe4CEziatvqQ7Ard2UxLtjmb4Ykc88YabNxThtC0TgLGA0ooWOV3e2zf
 uYxW81OhnNsj9qOt4UWIO7lYsSpMXtjFGHvZ+U5weSmmMvpZ9LUQviVXPX8DBF8KYzlQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Mb5uhjn9firG3m8nUpFk0q91xsfVDR8ahaCvEvX1s3w=; b=mj9TmsiUDZSoiQe2/vHGXl1bmD
 tGL+EGiqLgUD87PqQDI/IBZBoGfWgYW9aZ1m7/N53jWBqYn1fPRt8ZINhT3IH+m4tnEb7Y4zRHeK4
 9XDnf9Vv1PchlZanQuDH41MdkRLUhGAHg94wXCh9h2iCTzz53pwrA/S9kYtLrtiH2XlU=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ikK2X-00FPTh-Uy
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Dec 2019 03:42:25 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 44DEA9AECB4CD7818790;
 Thu, 26 Dec 2019 11:42:10 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 26 Dec
 2019 11:42:08 +0800
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20191223040020.109570-1-yuchao0@huawei.com>
 <CAMuHMdUDMv_mMw_ZU4BtuRKX1OvMhjLWw2owTcAP-0D4j5XROw@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <2d2b3477-3eb4-7dd3-09b1-8c686e519c0e@huawei.com>
Date: Thu, 26 Dec 2019 11:42:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUDMv_mMw_ZU4BtuRKX1OvMhjLWw2owTcAP-0D4j5XROw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ikK2X-00FPTh-Uy
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce DEFAULT_IO_TIMEOUT_JIFFIES
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
Cc: Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/12/23 16:41, Geert Uytterhoeven wrote:
> Hi,
> 
> CC linux-fsdevel
> 
> On Mon, Dec 23, 2019 at 5:01 AM Chao Yu <yuchao0@huawei.com> wrote:
>> As Geert Uytterhoeven reported:
>>
>> for parameter HZ/50 in congestion_wait(BLK_RW_ASYNC, HZ/50);
>>
>> On some platforms, HZ can be less than 50, then unexpected 0 timeout
>> jiffies will be set in congestion_wait().
>>
>> This patch introduces a macro DEFAULT_IO_TIMEOUT_JIFFIES to limit
>> mininum value of timeout jiffies.
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> 
> Thanks for your patch!
> 
>> ---
>>  fs/f2fs/compress.c |  3 ++-
>>  fs/f2fs/data.c     |  5 +++--
>>  fs/f2fs/f2fs.h     |  2 ++
>>  fs/f2fs/gc.c       |  3 ++-
>>  fs/f2fs/inode.c    |  3 ++-
>>  fs/f2fs/node.c     |  3 ++-
>>  fs/f2fs/recovery.c |  6 ++++--
>>  fs/f2fs/segment.c  | 12 ++++++++----
>>  fs/f2fs/super.c    |  6 ++++--
>>  9 files changed, 29 insertions(+), 14 deletions(-)
>>
>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>> index 1bc86a54ad71..ee4fe8e644aa 100644
>> --- a/fs/f2fs/compress.c
>> +++ b/fs/f2fs/compress.c
>> @@ -945,7 +945,8 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
>>                         } else if (ret == -EAGAIN) {
>>                                 ret = 0;
>>                                 cond_resched();
>> -                               congestion_wait(BLK_RW_ASYNC, HZ/50);
>> +                               congestion_wait(BLK_RW_ASYNC,
>> +                                       DEFAULT_IO_TIMEOUT_JIFFIES);
>>                                 lock_page(cc->rpages[i]);
>>                                 clear_page_dirty_for_io(cc->rpages[i]);
>>                                 goto retry_write;
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index f1f5c701228d..78b5c0b0287e 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -2320,7 +2320,8 @@ int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
>>                 /* flush pending IOs and wait for a while in the ENOMEM case */
>>                 if (PTR_ERR(fio->encrypted_page) == -ENOMEM) {
>>                         f2fs_flush_merged_writes(fio->sbi);
>> -                       congestion_wait(BLK_RW_ASYNC, HZ/50);
>> +                       congestion_wait(BLK_RW_ASYNC,
>> +                                       DEFAULT_IO_TIMEOUT_JIFFIES);
>>                         gfp_flags |= __GFP_NOFAIL;
>>                         goto retry_encrypt;
>>                 }
>> @@ -2900,7 +2901,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>>                                         if (wbc->sync_mode == WB_SYNC_ALL) {
>>                                                 cond_resched();
>>                                                 congestion_wait(BLK_RW_ASYNC,
>> -                                                               HZ/50);
>> +                                                       DEFAULT_IO_TIMEOUT_JIFFIES);
>>                                                 goto retry_write;
>>                                         }
>>                                         goto next;
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 16edbf4e05e8..4bdc20a94185 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -559,6 +559,8 @@ enum {
>>
>>  #define DEFAULT_RETRY_IO_COUNT 8       /* maximum retry read IO count */
>>
>> +#define        DEFAULT_IO_TIMEOUT_JIFFIES      (max_t(long, HZ/50, 1))
>> +
>>  /* maximum retry quota flush count */
>>  #define DEFAULT_RETRY_QUOTA_FLUSH_COUNT                8
>>
> 
> Seeing other file systems (ext4, xfs) and even core MM code suffers from
> the same issue, perhaps it makes sense to move this into congestion_wait(),
> i.e. increase the timeout to 1 if it's zero in the latter function?

Yup, maybe I can submit a RFC patch to change congestion_wait(), before that
we still need this f2fs change.

Thanks,

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
