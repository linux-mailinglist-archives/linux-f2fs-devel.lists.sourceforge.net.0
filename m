Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A45EA379C27
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 May 2021 03:39:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgHMQ-0001pn-PY; Tue, 11 May 2021 01:38:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lgHMP-0001pZ-Jq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 01:38:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7uxvLQ1W3MV2+O5rmTcQ2BEahaFajvmuHOWzPLZsXdk=; b=F3JeZlyGfQXtwlno7iqKHS7m/3
 Jf7boqjyQbPOtoW4WnzrgoNv8oFESxDT31OpC+OWD9vSt0H4H3lM6Nc9vmnDA2oKlI6rhnqwimWlM
 onnTWr4gRpBRoJBfC2k+cx/f0Pw8SWn0hoi5y/laUk0fg1uI9yUMStINeQ+J+Bl77o9U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7uxvLQ1W3MV2+O5rmTcQ2BEahaFajvmuHOWzPLZsXdk=; b=DfgmdeJc7L+tATgLpC3UpoyJDI
 hoxIudvgNHZxq5Ri/FW1lpAhRN3c1Muta85xRLKOzpLdFDbTyZElWJLY9AhhDAXJr48JUfXNjL7jl
 Itnb1Z3hjXlI7SQfkIT76Leu+zg4+o6U9/mgiFm9QMGfrK4QBTa2HxF+Y4vLE6srguYQ=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lgHMJ-003GAQ-Jb
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 01:38:57 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FfL9r42TpzkldC;
 Tue, 11 May 2021 09:36:32 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 11 May
 2021 09:38:38 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210510093032.35466-1-yuchao0@huawei.com>
 <20210510093032.35466-3-yuchao0@huawei.com> <YJlaz20Atq+TUnHu@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <0b1ec8ef-6861-1fe9-16ac-bba6e673659a@huawei.com>
Date: Tue, 11 May 2021 09:38:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YJlaz20Atq+TUnHu@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lgHMJ-003GAQ-Jb
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: compress: fix to assign
 cc.cluster_idx correctly
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

On 2021/5/11 0:09, Jaegeuk Kim wrote:
> On 05/10, Chao Yu wrote:
>> In f2fs_destroy_compress_ctx(), after f2fs_destroy_compress_ctx(),
>> cc.cluster_idx will be cleared w/ NULL_CLUSTER, f2fs_cluster_blocks()
>> may check wrong cluster metadata, fix it.
>>
>> Fixes: 4c8ff7095bef ("f2fs: support data compression")
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>   fs/f2fs/compress.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>> index 340815cd0887..30b003447510 100644
>> --- a/fs/f2fs/compress.c
>> +++ b/fs/f2fs/compress.c
>> @@ -1066,6 +1066,8 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
>>   			f2fs_put_rpages(cc);
>>   			f2fs_unlock_rpages(cc, i + 1);
>>   			f2fs_destroy_compress_ctx(cc);
>> +			cc->cluster_idx = index >>
>> +					F2FS_I(cc->inode)->i_log_cluster_size;
> 
> I didn't test tho, how about this?

Looks more clean. :)

Thanks,

> 
>>From 904abb77e82ea982f68960148b75d0a12f771c2e Mon Sep 17 00:00:00 2001
> From: Chao Yu <yuchao0@huawei.com>
> Date: Mon, 10 May 2021 17:30:32 +0800
> Subject: [PATCH] f2fs: compress: fix to assign cc.cluster_idx correctly
> 
> In f2fs_destroy_compress_ctx(), after f2fs_destroy_compress_ctx(),
> cc.cluster_idx will be cleared w/ NULL_CLUSTER, f2fs_cluster_blocks()
> may check wrong cluster metadata, fix it.
> 
> Fixes: 4c8ff7095bef ("f2fs: support data compression")
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/compress.c | 17 +++++++++--------
>   fs/f2fs/data.c     |  6 +++---
>   2 files changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 79348bc56e35..925a5ca3744a 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -145,13 +145,14 @@ int f2fs_init_compress_ctx(struct compress_ctx *cc)
>   	return cc->rpages ? 0 : -ENOMEM;
>   }
>   
> -void f2fs_destroy_compress_ctx(struct compress_ctx *cc)
> +void f2fs_destroy_compress_ctx(struct compress_ctx *cc, bool reuse)
>   {
>   	page_array_free(cc->inode, cc->rpages, cc->cluster_size);
>   	cc->rpages = NULL;
>   	cc->nr_rpages = 0;
>   	cc->nr_cpages = 0;
> -	cc->cluster_idx = NULL_CLUSTER;
> +	if (!reuse)
> +		cc->cluster_idx = NULL_CLUSTER;
>   }
>   
>   void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page)
> @@ -1034,7 +1035,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
>   		ret = f2fs_read_multi_pages(cc, &bio, cc->cluster_size,
>   					&last_block_in_bio, false, true);
>   		f2fs_put_rpages(cc);
> -		f2fs_destroy_compress_ctx(cc);
> +		f2fs_destroy_compress_ctx(cc, true);
>   		if (ret)
>   			goto out;
>   		if (bio)
> @@ -1061,7 +1062,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
>   release_and_retry:
>   			f2fs_put_rpages(cc);
>   			f2fs_unlock_rpages(cc, i + 1);
> -			f2fs_destroy_compress_ctx(cc);
> +			f2fs_destroy_compress_ctx(cc, true);
>   			goto retry;
>   		}
>   	}
> @@ -1094,7 +1095,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
>   unlock_pages:
>   	f2fs_put_rpages(cc);
>   	f2fs_unlock_rpages(cc, i);
> -	f2fs_destroy_compress_ctx(cc);
> +	f2fs_destroy_compress_ctx(cc, true);
>   out:
>   	return ret;
>   }
> @@ -1130,7 +1131,7 @@ bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
>   		set_cluster_dirty(&cc);
>   
>   	f2fs_put_rpages_wbc(&cc, NULL, false, 1);
> -	f2fs_destroy_compress_ctx(&cc);
> +	f2fs_destroy_compress_ctx(&cc, false);
>   
>   	return first_index;
>   }
> @@ -1350,7 +1351,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>   	f2fs_put_rpages(cc);
>   	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
>   	cc->cpages = NULL;
> -	f2fs_destroy_compress_ctx(cc);
> +	f2fs_destroy_compress_ctx(cc, false);
>   	return 0;
>   
>   out_destroy_crypt:
> @@ -1512,7 +1513,7 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
>   	err = f2fs_write_raw_pages(cc, submitted, wbc, io_type);
>   	f2fs_put_rpages_wbc(cc, wbc, false, 0);
>   destroy_out:
> -	f2fs_destroy_compress_ctx(cc);
> +	f2fs_destroy_compress_ctx(cc, false);
>   	return err;
>   }
>   
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 96f1a354f89f..33e56ae84e35 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2287,7 +2287,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>   							max_nr_pages,
>   							&last_block_in_bio,
>   							rac != NULL, false);
> -				f2fs_destroy_compress_ctx(&cc);
> +				f2fs_destroy_compress_ctx(&cc, false);
>   				if (ret)
>   					goto set_error_page;
>   			}
> @@ -2332,7 +2332,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>   							max_nr_pages,
>   							&last_block_in_bio,
>   							rac != NULL, false);
> -				f2fs_destroy_compress_ctx(&cc);
> +				f2fs_destroy_compress_ctx(&cc, false);
>   			}
>   		}
>   #endif
> @@ -3033,7 +3033,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   		}
>   	}
>   	if (f2fs_compressed_file(inode))
> -		f2fs_destroy_compress_ctx(&cc);
> +		f2fs_destroy_compress_ctx(&cc, false);
>   #endif
>   	if (retry) {
>   		index = 0;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
