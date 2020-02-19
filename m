Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F753163AE3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 04:13:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4FnS-0003oR-1J; Wed, 19 Feb 2020 03:13:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j4FnR-0003oK-5p
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UlM3P0ty6uH2+fjLQtXWhCXKl4rvEtxt0uIjSFge6+Q=; b=K91MTqhvWnPZait+2BZV2vQ6Kd
 geTI2XblI+Jv2g42xMohuW9hRGuYyqep1iPIA72DHFbRncqwBAT0pU4ak4oyyHJG4IlQbx2NTYOP4
 k2HjsOIM0jXjhGJyaVmAG8DVd1UU7WVOQu2wBmzh44mM5sIjZa2wqLA9A8tPOMbc5PHU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UlM3P0ty6uH2+fjLQtXWhCXKl4rvEtxt0uIjSFge6+Q=; b=bKgJsbo20KdW0STvgP6I4areuK
 6pTXPgIuWptuD+n3tOhYbL23zmBGt6ao9gx7YCcYTx6WxhkVYg2KYiYxgdnBOiQfUfOvvAYVP4/Wc
 wZd3LN2uK/nvFkoi0Sbn/2ouLX1lPoaF7wQBSrZAT9BDlPYlK2jTOhytP5iqkRFseDNM=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4FnP-00H9tt-2y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:13:09 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B6A5C55E6B2C8D28D29B;
 Wed, 19 Feb 2020 11:12:58 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 19 Feb
 2020 11:12:53 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200218102136.32150-1-yuchao0@huawei.com>
 <20200219024928.GA96609@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <52705a9b-306b-c6b0-0f48-c12149e7b915@huawei.com>
Date: Wed, 19 Feb 2020 11:12:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200219024928.GA96609@google.com>
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
X-Headers-End: 1j4FnP-00H9tt-2y
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: avoid __GFP_NOFAIL in
 f2fs_bio_alloc
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

On 2020/2/19 10:49, Jaegeuk Kim wrote:
> On 02/18, Chao Yu wrote:
>> __f2fs_bio_alloc() won't fail due to memory pool backend, remove unneeded
>> __GFP_NOFAIL flag in __f2fs_bio_alloc().
> 
> It it safe for old kernels as well when thinking backports?

^1da177e4c3f4 (Linus Torvalds     2005-04-16 15:20:36 -0700  134)       struct bio *bio = mempool_alloc(bs->bio_pool, gfp_mask);

It looks if we have a backend mempool, we will never fail to allocate bio
for very long time, we don't need to backport to 2.6.x kernel, right?

Thanks,

> 
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>  fs/f2fs/data.c | 12 ++++--------
>>  fs/f2fs/f2fs.h |  2 +-
>>  2 files changed, 5 insertions(+), 9 deletions(-)
>>
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index baf12318ec64..3a4ece26928c 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -54,17 +54,13 @@ static inline struct bio *__f2fs_bio_alloc(gfp_t gfp_mask,
>>  	return bio_alloc_bioset(gfp_mask, nr_iovecs, &f2fs_bioset);
>>  }
>>  
>> -struct bio *f2fs_bio_alloc(struct f2fs_sb_info *sbi, int npages, bool no_fail)
>> +struct bio *f2fs_bio_alloc(struct f2fs_sb_info *sbi, int npages, bool noio)
>>  {
>> -	struct bio *bio;
>> -
>> -	if (no_fail) {
>> +	if (noio) {
>>  		/* No failure on bio allocation */
>> -		bio = __f2fs_bio_alloc(GFP_NOIO, npages);
>> -		if (!bio)
>> -			bio = __f2fs_bio_alloc(GFP_NOIO | __GFP_NOFAIL, npages);
>> -		return bio;
>> +		return __f2fs_bio_alloc(GFP_NOIO, npages);
>>  	}
>> +
>>  	if (time_to_inject(sbi, FAULT_ALLOC_BIO)) {
>>  		f2fs_show_injection_info(sbi, FAULT_ALLOC_BIO);
>>  		return NULL;
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 5316ac3eacdf..65f569949d42 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -3343,7 +3343,7 @@ void f2fs_destroy_checkpoint_caches(void);
>>   */
>>  int __init f2fs_init_bioset(void);
>>  void f2fs_destroy_bioset(void);
>> -struct bio *f2fs_bio_alloc(struct f2fs_sb_info *sbi, int npages, bool no_fail);
>> +struct bio *f2fs_bio_alloc(struct f2fs_sb_info *sbi, int npages, bool noio);
>>  int f2fs_init_bio_entry_cache(void);
>>  void f2fs_destroy_bio_entry_cache(void);
>>  void f2fs_submit_bio(struct f2fs_sb_info *sbi,
>> -- 
>> 2.18.0.rc1
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
