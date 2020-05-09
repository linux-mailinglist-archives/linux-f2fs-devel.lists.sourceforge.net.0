Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B501CBC3D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 May 2020 03:56:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jXEjP-0006hT-Oq; Sat, 09 May 2020 01:56:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jXEjO-0006hH-SJ
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 May 2020 01:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z6g2MlzeUowlNYAx3AIYE+LKP8u32Zdov99jteGZj3o=; b=OzPCdiX9ivy6eEk8HHABtFgtem
 eI9D2IMXeS9Sh/IWYpouuuF9eR7qmdF0vniLgy/r31GZoMuyfN0c5KQDYlwtEibpd3tsxXjUkio6x
 jipXEpeN6FBEmMrDkT7K190e7VXRYc0P5ZpfhFGK1KQ9oDvKzb/h4SPSjtSbV7DnhtDY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z6g2MlzeUowlNYAx3AIYE+LKP8u32Zdov99jteGZj3o=; b=fwbeX7sCScnX0+EqnvIidgkA61
 2r7H5I64BVkzXUkWD6ffypZAC1tULQeRJEGaupC3V5eBcczPwibvMnPyn6C0G/KrUY9yxizQ+GChX
 vDhOEcondC89o1sO8fcY2PQo+hfeouOcPYKcpO9Rcf8rvSq6T/pzZNtVzEfS0XeBXUWs=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jXEjM-00H62j-Uk
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 May 2020 01:56:46 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 198A688844991705F75E;
 Sat,  9 May 2020 09:56:37 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sat, 9 May 2020
 09:56:33 +0800
To: Gao Xiang <hsiangkao@aol.com>
References: <20200508094709.40048-1-yuchao0@huawei.com>
 <20200508102306.GA18849@hsiangkao-HP-ZHAN-66-Pro-G1>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4db0121c-5555-b33d-d727-627ef1640f8d@huawei.com>
Date: Sat, 9 May 2020 09:56:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200508102306.GA18849@hsiangkao-HP-ZHAN-66-Pro-G1>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jXEjM-00H62j-Uk
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: allow lz4 to compress data
 partially
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Xiang,

On 2020/5/8 18:23, Gao Xiang wrote:
> Hi Chao,
> 
> On Fri, May 08, 2020 at 05:47:09PM +0800, Chao Yu wrote:
>> For lz4 worst compress case, caller should allocate buffer with size
>> of LZ4_compressBound(inputsize) for target compressed data storing.
>>
>> However lz4 supports partial data compression, so we can get rid of
>> output buffer size limitation now, then we can avoid 2 * 4KB size
>> intermediate buffer allocation when log_cluster_size is 2, and avoid
>> unnecessary compressing work of compressor if we can not save at
>> least 4KB space.
>>
>> Suggested-by: Daeho Jeong <daehojeong@google.com>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>  fs/f2fs/compress.c | 15 +++++++++------
>>  1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>> index 5e4947250262..23825f559bcf 100644
>> --- a/fs/f2fs/compress.c
>> +++ b/fs/f2fs/compress.c
>> @@ -228,7 +228,12 @@ static int lz4_init_compress_ctx(struct compress_ctx *cc)
>>  	if (!cc->private)
>>  		return -ENOMEM;
>>  
>> -	cc->clen = LZ4_compressBound(PAGE_SIZE << cc->log_cluster_size);
>> +	/*
>> +	 * we do not change cc->clen to LZ4_compressBound(inputsize) to
>> +	 * adapt worst compress case, because lz4 algorithm supports partial
>> +	 * compression.
> 
> Actually, in this case the lz4 compressed block is not valid (at least not ended
> in a valid lz4 EOF), and AFAIK the current public lz4 API cannot keep on
> compressing this block. so IMO "partial compression" for an invalid lz4
> block may be confusing.

Yes, comments could be improved to avoid confusing.

> 
> I think some words like "because lz4 implementation can handle output buffer
> budget properly" or similar stuff could be better.

It's better, let me change to use this, thanks for the advice.

Thanks,

> 
> The same to the patch title and the commit message.
> 
> Thanks,
> Gao Xiang
> 
> 
>> +	 */
>> +	cc->clen = cc->rlen - PAGE_SIZE - COMPRESS_HEADER_SIZE;
>>  	return 0;
>>  }
>>  
>> @@ -244,11 +249,9 @@ static int lz4_compress_pages(struct compress_ctx *cc)
>>  
>>  	len = LZ4_compress_default(cc->rbuf, cc->cbuf->cdata, cc->rlen,
>>  						cc->clen, cc->private);
>> -	if (!len) {
>> -		printk_ratelimited("%sF2FS-fs (%s): lz4 compress failed\n",
>> -				KERN_ERR, F2FS_I_SB(cc->inode)->sb->s_id);
>> -		return -EIO;
>> -	}
>> +	if (!len)
>> +		return -EAGAIN;
>> +
>>  	cc->clen = len;
>>  	return 0;
>>  }
>> -- 
>> 2.18.0.rc1
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
