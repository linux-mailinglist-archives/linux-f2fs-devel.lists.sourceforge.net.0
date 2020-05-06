Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBF81C6A4E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 May 2020 09:45:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWEkg-0000Wv-Fq; Wed, 06 May 2020 07:45:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jWEke-0000WZ-M7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 07:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AiF7vz67DMyrLX96EoxAKTtK4KdqCnLrecAoEeB+/FM=; b=KfpsxwSvI71iBvSYzZiJjbHsbj
 MXJV8Zsy7XVEPz4RARzdfS1vmpw5FxxtnvijqueRZ8ikmgdcO1tqqVEPepBf4FS/RL1NAs5QCeTyr
 XO7yomotM0d8Ygv7AA3nDKlcm3rJp2MtSLEbVEDvGikUcj3vXe6Ux+JjEhJyeJqTf5sA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AiF7vz67DMyrLX96EoxAKTtK4KdqCnLrecAoEeB+/FM=; b=dvyGppsCsxHbgncTk27uE2LuhD
 hTbmJGm2iDFOOPok8GD7re4tDTky1OMISsoYpnKU2t7AnVl3t5rFQAbz0yyz5bF7mxjJlNYhExY1O
 xdhrEwuGXcjXPDrLLRaokstNg370NtQy2l5BcQhOhmHUIpp089EKqy9gU5P9SSaFySOs=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWEkc-00FhFk-MN
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 07:45:56 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D4F1DBA18A7654661CE1;
 Wed,  6 May 2020 15:45:45 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 6 May 2020
 15:45:43 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
References: <20200504143039.155644-1-jaegeuk@kernel.org>
 <7177aab9-630e-e077-7005-0023c93134b3@kernel.org>
 <20200505230559.GA203407@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <9aaeac5e-4511-5c81-653c-23a85b3c335a@huawei.com>
Date: Wed, 6 May 2020 15:45:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200505230559.GA203407@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWEkc-00FhFk-MN
Subject: Re: [f2fs-dev] [PATCH] f2fs: change maximum zstd compression buffer
 size
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/5/6 7:05, Jaegeuk Kim wrote:
> On 05/05, Chao Yu wrote:
>> On 2020-5-4 22:30, Jaegeuk Kim wrote:
>>> From: Daeho Jeong <daehojeong@google.com>
>>>
>>> Current zstd compression buffer size is one page and header size less
>>> than cluster size. By this, zstd compression always succeeds even if
>>> the real compression data is failed to fit into the buffer size, and
>>> eventually reading the cluster returns I/O error with the corrupted
>>> compression data.
>>
>> What's the root cause of this issue? I didn't get it.
>>
>>>
>>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
>>> ---
>>>  fs/f2fs/compress.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>>> index 4c7eaeee52336..a9fa8049b295f 100644
>>> --- a/fs/f2fs/compress.c
>>> +++ b/fs/f2fs/compress.c
>>> @@ -313,7 +313,7 @@ static int zstd_init_compress_ctx(struct compress_ctx *cc)
>>>  	cc->private = workspace;
>>>  	cc->private2 = stream;
>>>
>>> -	cc->clen = cc->rlen - PAGE_SIZE - COMPRESS_HEADER_SIZE;
>>> +	cc->clen = ZSTD_compressBound(PAGE_SIZE << cc->log_cluster_size);
>>
>> In my machine, the value is 66572 which is much larger than size of dst
>> buffer, so, in where we can tell the real size of dst buffer to zstd
>> compressor? Otherwise, if compressed data size is larger than dst buffer
>> size, when we flush compressed data into dst buffer, we may suffer overflow.
> 
> Could you give it a try compress_log_size=2 and check decompression works?

I tried some samples before submitting the patch, did you encounter app's data
corruption when using zstd algorithm? If so, let me check this issue.

Thanks,

> 
>>
>>>  	return 0;
>>>  }
>>>
>>> @@ -330,7 +330,7 @@ static int zstd_compress_pages(struct compress_ctx *cc)
>>>  	ZSTD_inBuffer inbuf;
>>>  	ZSTD_outBuffer outbuf;
>>>  	int src_size = cc->rlen;
>>> -	int dst_size = src_size - PAGE_SIZE - COMPRESS_HEADER_SIZE;
>>> +	int dst_size = cc->clen;
>>>  	int ret;
>>>
>>>  	inbuf.pos = 0;
>>>
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
