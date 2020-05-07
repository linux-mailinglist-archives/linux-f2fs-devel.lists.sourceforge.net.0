Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B66F1C8020
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 May 2020 04:49:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWWaz-0001xh-Jr; Thu, 07 May 2020 02:49:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jWWax-0001xQ-MO
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 May 2020 02:49:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VNwzwJtzAfyUnic1uoeJGT2pMVjkMdCq8OB+iUIx/jc=; b=UR6t7h93D2XMNBC2mBT0vekj9j
 oa1OXri34phW1cn9eQhzQ3ci40gZOa+nEk3YnZ9cHTnUUrBy413cpqoSiSf54bLByxSykHXxln16K
 oWxSRqtsEh/dqplXc4ugwjgmkg1KrEvWFlT/EVrEVLUB/FdwhAa2ds/VRuMsQ/nLiIJY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VNwzwJtzAfyUnic1uoeJGT2pMVjkMdCq8OB+iUIx/jc=; b=GTUuqvFlema7s2OAgp/rtItJmE
 29oTLs8GtBqaON2pXapkXAKZ/mwkUNCTeofJ14f7N9MzulKcpRtrroHoVB/JF3RJ3xhPJHFqGLFw/
 Lr2mYzw41XCOnNHVwovzsNyBbIfuNxwmsoeu7OYNs/9hMJ0YQnN5YB2MRPrO5P9R3RHU=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWWau-00AbX2-1g
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 May 2020 02:49:07 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 1DE0E82E181631CA2E78;
 Thu,  7 May 2020 10:48:50 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 7 May 2020
 10:48:48 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200504143039.155644-1-jaegeuk@kernel.org>
 <7177aab9-630e-e077-7005-0023c93134b3@kernel.org>
 <20200505230559.GA203407@google.com>
 <9aaeac5e-4511-5c81-653c-23a85b3c335a@huawei.com>
 <20200506145608.GD107238@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <96140ec8-0fa9-9e4d-4459-1f26737865bf@huawei.com>
Date: Thu, 7 May 2020 10:48:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200506145608.GD107238@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWWau-00AbX2-1g
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

On 2020/5/6 22:56, Jaegeuk Kim wrote:
> On 05/06, Chao Yu wrote:
>> On 2020/5/6 7:05, Jaegeuk Kim wrote:
>>> On 05/05, Chao Yu wrote:
>>>> On 2020-5-4 22:30, Jaegeuk Kim wrote:
>>>>> From: Daeho Jeong <daehojeong@google.com>
>>>>>
>>>>> Current zstd compression buffer size is one page and header size less
>>>>> than cluster size. By this, zstd compression always succeeds even if
>>>>> the real compression data is failed to fit into the buffer size, and
>>>>> eventually reading the cluster returns I/O error with the corrupted
>>>>> compression data.
>>>>
>>>> What's the root cause of this issue? I didn't get it.
>>>>
>>>>>
>>>>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
>>>>> ---
>>>>>  fs/f2fs/compress.c | 4 ++--
>>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>>>>> index 4c7eaeee52336..a9fa8049b295f 100644
>>>>> --- a/fs/f2fs/compress.c
>>>>> +++ b/fs/f2fs/compress.c
>>>>> @@ -313,7 +313,7 @@ static int zstd_init_compress_ctx(struct compress_ctx *cc)
>>>>>  	cc->private = workspace;
>>>>>  	cc->private2 = stream;
>>>>>
>>>>> -	cc->clen = cc->rlen - PAGE_SIZE - COMPRESS_HEADER_SIZE;
>>>>> +	cc->clen = ZSTD_compressBound(PAGE_SIZE << cc->log_cluster_size);
>>>>
>>>> In my machine, the value is 66572 which is much larger than size of dst
>>>> buffer, so, in where we can tell the real size of dst buffer to zstd
>>>> compressor? Otherwise, if compressed data size is larger than dst buffer
>>>> size, when we flush compressed data into dst buffer, we may suffer overflow.
>>>
>>> Could you give it a try compress_log_size=2 and check decompression works?
>>
>> I tried some samples before submitting the patch, did you encounter app's data
>> corruption when using zstd algorithm? If so, let me check this issue.
> 
> Daeho reported:
> 1. cp -a src_file comp_dir/dst_file (comp_dir is a directory for compression)
> 2. sync comp_dir/dst_file
> 3. echo 3 > /proc/sys/vm/drop_caches
> 4. cat comp_dir/dst_file > dump (it returns I/O error depending on the file).

Let me check this issue.

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>>>
>>>>>  	return 0;
>>>>>  }
>>>>>
>>>>> @@ -330,7 +330,7 @@ static int zstd_compress_pages(struct compress_ctx *cc)
>>>>>  	ZSTD_inBuffer inbuf;
>>>>>  	ZSTD_outBuffer outbuf;
>>>>>  	int src_size = cc->rlen;
>>>>> -	int dst_size = src_size - PAGE_SIZE - COMPRESS_HEADER_SIZE;
>>>>> +	int dst_size = cc->clen;
>>>>>  	int ret;
>>>>>
>>>>>  	inbuf.pos = 0;
>>>>>
>>>
>>>
>>> _______________________________________________
>>> Linux-f2fs-devel mailing list
>>> Linux-f2fs-devel@lists.sourceforge.net
>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
