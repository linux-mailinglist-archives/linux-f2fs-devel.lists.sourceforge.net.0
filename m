Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B6D133E5F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jan 2020 10:34:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ip7j4-0003GG-CI; Wed, 08 Jan 2020 09:34:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ip7j3-0003G5-7a
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 09:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q0l3R8tdx1r0gNB0Z/CGJ5LGn6dKJW6U29Pa7ovmZ6I=; b=RBfpKecpi80cPrmgjUiiUO7ZeU
 EPa1GXPgSCHeM5J9AYETaoFoVcqKJjsiAKdAfTtPQ94pW4a/lYiEiCWUT94y7NUvdJkBpCXfOhxU+
 0LFWFd82fCSOEgZoTquOvt0u20bFA0mwuKo6dO4w0We0qbTChuJOp9UV4GIcDREt9JSo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q0l3R8tdx1r0gNB0Z/CGJ5LGn6dKJW6U29Pa7ovmZ6I=; b=XPcp0/lHpxI7a3HjMxuMG9TT/V
 Las+BZtZgBfgihTCpmXrZmKnOwHn+pBxCZ3RmMNXHxCG+uDivX1VPIqoUFskYP/CShtI/pHCETmnc
 mPyBCuzzMFOH2JrwideOnwle90KxnjoC7mVMnAMuCY7tcfXKvmuOcukUdH6urRtLWLTA=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ip7is-00DJAg-My
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 09:34:05 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E513B71813FFC5664CC6;
 Wed,  8 Jan 2020 17:33:45 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 8 Jan 2020
 17:33:41 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200106080144.52363-1-yuchao0@huawei.com>
 <20200106080144.52363-2-yuchao0@huawei.com>
 <20200106192631.GF50058@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <d2d21997-42f2-217a-a4cb-66b7fe8ef3e8@huawei.com>
Date: Wed, 8 Jan 2020 17:33:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200106192631.GF50058@jaegeuk-macbookpro.roam.corp.google.com>
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
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ip7is-00DJAg-My
Subject: Re: [f2fs-dev] [PATCH 2/4] f2fs: compress: revert error path fix
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

On 2020/1/7 3:26, Jaegeuk Kim wrote:
> Hi Chao,
> 
> Could you please check this out?
> https://github.com/jaegeuk/f2fs/commits/g-dev-test

Looks good to me, I add some minor comments on github.

Any comments on below thread?

Re: [f2fs-dev] [PATCH 3/4] f2fs: compress: fix error path in prepare_compress_overwrite()

Thanks,

> 
> Thanks,
> 
> On 01/06, Chao Yu wrote:
>> Revert incorrect fix in ("TEMP: f2fs: support data compression - fix1")
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>  fs/f2fs/compress.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>> index f993b4ce1970..fc4510729654 100644
>> --- a/fs/f2fs/compress.c
>> +++ b/fs/f2fs/compress.c
>> @@ -601,7 +601,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
>>  							fgp_flag, GFP_NOFS);
>>  		if (!page) {
>>  			ret = -ENOMEM;
>> -			goto release_pages;
>> +			goto unlock_pages;
>>  		}
>>  
>>  		if (PageUptodate(page))
>> @@ -616,13 +616,13 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
>>  		ret = f2fs_read_multi_pages(cc, &bio, cc->cluster_size,
>>  						&last_block_in_bio, false);
>>  		if (ret)
>> -			goto unlock_pages;
>> +			goto release_pages;
>>  		if (bio)
>>  			f2fs_submit_bio(sbi, bio, DATA);
>>  
>>  		ret = f2fs_init_compress_ctx(cc);
>>  		if (ret)
>> -			goto unlock_pages;
>> +			goto release_pages;
>>  	}
>>  
>>  	for (i = 0; i < cc->cluster_size; i++) {
>> -- 
>> 2.18.0.rc1
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
