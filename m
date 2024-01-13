Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F5582C922
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Jan 2024 03:34:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rOTqp-0004v0-IH;
	Sat, 13 Jan 2024 02:34:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rOTqo-0004uu-5v
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jan 2024 02:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5iosQm1jg1vMdIT6bDIPUKOhOrKMVp/JwfSihJ+zoL4=; b=c/GMVBMJCnjDiwb77vv50/TTpe
 sSW7VscY2UUuaWC5uQQmOc5NZ+TPAKiBwlpQF40hjY2PlgIP6DM+SR8c8z7ZHbVzlMh07gHmMkTm1
 doack1UOkZN6Ycu2z6Wh1z4Rq6fy8M4qSwuxWavgdiDOa81xZ/6bLnGCzejAtYCvNMdU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5iosQm1jg1vMdIT6bDIPUKOhOrKMVp/JwfSihJ+zoL4=; b=dqzGkofZ3Gg7NWXTVj3ANxRiJD
 yw4uCqzzWE7ppiqVg8/QnZoimxzw5Qmfy0ory+Kawi1ehWxTeVZ/KWBDnJaCriV/FxVNMoFcdZJYg
 U8C9X3B62v2rrh5g4Bx66KWPf/3nnfjF9CODgaXpiTL1iTf073PdSbWXtjC8VMrsN718=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rOTqj-0000tc-EE for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jan 2024 02:34:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 84AE0CE256A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 13 Jan 2024 02:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 018F2C433C7;
 Sat, 13 Jan 2024 02:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705113237;
 bh=hxcwXtTvwEHn6hIQwj9BeBtKbKvjTpJufYYmYZ76Hcc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=a22o6Q/PR0XxzNMbRJ0lqUljE0DaQkZIGPeZ8wj0c3H6cPgAcOQZlHEDplgZPSa2U
 4AK1Drk9r6PI+xPpKxDhm1F709eDC+FCo4+DSNDg2RLmvNFJayOz9ZrDvSNPTXedGf
 J7y/rkQi8huqRGqvENo63tghL3fWBbwJ/EP/F9JZDtKFnZ3xVV1MNvM9rD1fjz1bFm
 AA2QhB31sDiRNngAsLqEch/Eohdp0pjeEB9Ns+fCatnL9kgQBwPv1VOyEnbeauOWhF
 Ba0GVu2w8W0gjTd5BIP5EWPusiqVKVstDAAjLajdPnG13Gshshn7DXTAprjC8C0UJd
 G0FoRWBrABVoA==
Message-ID: <09ca35ab-e599-41c3-86ce-73a0cb776858@kernel.org>
Date: Sat, 13 Jan 2024 10:33:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240111064208.2969599-1-chao@kernel.org>
 <20240111064208.2969599-2-chao@kernel.org> <ZaHp4to18RtGShWS@google.com>
From: Chao Yu <chao@kernel.org>
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <ZaHp4to18RtGShWS@google.com>
X-Spam-Score: -4.6 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Thanks, let me resend v5 w/ blow cleanups. On 2024/1/13 9:39,
 Jaegeuk Kim wrote: > Cleaned up a bit: > > --- a/fs/f2fs/compress.c > +++
 b/fs/f2fs/compress.c > @@ -1443, 13 +1443,
 14 @@ void f2fs_compress_write_end_io(struct
 bio *bio, struct page [...] 
 Content analysis details:   (-4.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rOTqj-0000tc-EE
Subject: Re: [f2fs-dev] [PATCH v4 2/6] f2fs: compress: fix to cover normal
 cluster write with cp_rwsem
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

Thanks, let me resend v5 w/ blow cleanups.

On 2024/1/13 9:39, Jaegeuk Kim wrote:
> Cleaned up a bit:
> 
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1443,13 +1443,14 @@ void f2fs_compress_write_end_io(struct bio *bio, struct page *page)
>   }
> 
>   static int f2fs_write_raw_pages(struct compress_ctx *cc,
> -                                       int *submitted,
> +                                       int *submitted_p,
>                                          struct writeback_control *wbc,
>                                          enum iostat_type io_type)
>   {
>          struct address_space *mapping = cc->inode->i_mapping;
>          struct f2fs_sb_info *sbi = F2FS_M_SB(mapping);
> -       int _submitted, compr_blocks, ret = 0, i;
> +       int submitted, compr_blocks, i;
> +       int ret = 0;
> 
>          compr_blocks = f2fs_compressed_blocks(cc);
> 
> @@ -1492,7 +1493,7 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
>                  if (!clear_page_dirty_for_io(cc->rpages[i]))
>                          goto continue_unlock;
> 
> -               ret = f2fs_write_single_data_page(cc->rpages[i], &_submitted,
> +               ret = f2fs_write_single_data_page(cc->rpages[i], &submitted,
>                                                  NULL, NULL, wbc, io_type,
>                                                  compr_blocks, false);
>                  if (ret) {
> @@ -1514,7 +1515,7 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
>                          goto out;
>                  }
> 
> -               *submitted += _submitted;
> +               *submitted_p += submitted;
>          }
> 
>   out:
> 
> On 01/11, Chao Yu wrote:
>> When we overwrite compressed cluster w/ normal cluster, we should
>> not unlock cp_rwsem during f2fs_write_raw_pages(), otherwise data
>> will be corrupted if partial blocks were persisted before CP & SPOR,
>> due to cluster metadata wasn't updated atomically.
>>
>> Fixes: 4c8ff7095bef ("f2fs: support data compression")
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/compress.c | 20 ++++++++++++++------
>>   fs/f2fs/data.c     |  3 ++-
>>   2 files changed, 16 insertions(+), 7 deletions(-)
>>
>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>> index 9940b7886e5d..bf4cfab67aec 100644
>> --- a/fs/f2fs/compress.c
>> +++ b/fs/f2fs/compress.c
>> @@ -1448,7 +1448,8 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
>>   					enum iostat_type io_type)
>>   {
>>   	struct address_space *mapping = cc->inode->i_mapping;
>> -	int _submitted, compr_blocks, ret, i;
>> +	struct f2fs_sb_info *sbi = F2FS_M_SB(mapping);
>> +	int _submitted, compr_blocks, ret = 0, i;
>>   
>>   	compr_blocks = f2fs_compressed_blocks(cc);
>>   
>> @@ -1463,6 +1464,10 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
>>   	if (compr_blocks < 0)
>>   		return compr_blocks;
>>   
>> +	/* overwrite compressed cluster w/ normal cluster */
>> +	if (compr_blocks > 0)
>> +		f2fs_lock_op(sbi);
>> +
>>   	for (i = 0; i < cc->cluster_size; i++) {
>>   		if (!cc->rpages[i])
>>   			continue;
>> @@ -1495,26 +1500,29 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
>>   				unlock_page(cc->rpages[i]);
>>   				ret = 0;
>>   			} else if (ret == -EAGAIN) {
>> +				ret = 0;
>>   				/*
>>   				 * for quota file, just redirty left pages to
>>   				 * avoid deadlock caused by cluster update race
>>   				 * from foreground operation.
>>   				 */
>>   				if (IS_NOQUOTA(cc->inode))
>> -					return 0;
>> -				ret = 0;
>> +					goto out;
>>   				f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
>>   				goto retry_write;
>>   			}
>> -			return ret;
>> +			goto out;
>>   		}
>>   
>>   		*submitted += _submitted;
>>   	}
>>   
>> -	f2fs_balance_fs(F2FS_M_SB(mapping), true);
>> +out:
>> +	if (compr_blocks > 0)
>> +		f2fs_unlock_op(sbi);
>>   
>> -	return 0;
>> +	f2fs_balance_fs(sbi, true);
>> +	return ret;
>>   }
>>   
>>   int f2fs_write_multi_pages(struct compress_ctx *cc,
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index 81f9e2cc49e2..b171a9980f6a 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -2839,7 +2839,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
>>   		.encrypted_page = NULL,
>>   		.submitted = 0,
>>   		.compr_blocks = compr_blocks,
>> -		.need_lock = LOCK_RETRY,
>> +		.need_lock = compr_blocks ? LOCK_DONE : LOCK_RETRY,
>>   		.post_read = f2fs_post_read_required(inode) ? 1 : 0,
>>   		.io_type = io_type,
>>   		.io_wbc = wbc,
>> @@ -2920,6 +2920,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
>>   	if (err == -EAGAIN) {
>>   		err = f2fs_do_write_data_page(&fio);
>>   		if (err == -EAGAIN) {
>> +			f2fs_bug_on(sbi, compr_blocks);
>>   			fio.need_lock = LOCK_REQ;
>>   			err = f2fs_do_write_data_page(&fio);
>>   		}
>> -- 
>> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
