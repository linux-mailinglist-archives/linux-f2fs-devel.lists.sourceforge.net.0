Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 061C95420B2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jun 2022 03:55:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nykv8-0000sw-Rt; Wed, 08 Jun 2022 01:55:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nykv7-0000sp-9c
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jun 2022 01:55:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SWKy9Jy1ux9o5DLUsQrSb4F3duIFMXjS8uRDRKN4FxU=; b=LL4zTwBsYzQ1imaPpyUfxH955k
 UroHuGIMxPF17zg90JMzhZvxAVsBMfO34vNWHNYnxGM2A/DoU4XRnJaRgZYphii6igzLP2sP67EBZ
 d5k9X0qaNqmL+VB1dKLTWdJwqE449MeaT8KZ4naVYqzJwLu6rPMukzRm+9+oVwMql/70=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SWKy9Jy1ux9o5DLUsQrSb4F3duIFMXjS8uRDRKN4FxU=; b=CBSIIWI24h4n3+mWRqUnfhf66m
 zdXS9FSsGeBWi22bcqnggyRLcINx1xAFTBe7uK3vg+ghTnE12a6NILDGAhM6lHDWBjkMz7VJcn/Ge
 s9s1IbjNC0cVwWUI9rqHZh0YOncg2CHcPgV0X0VaaFvhF5RqTliGspW1l+I3l/pL7yZM=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nykv4-0003HQ-MU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jun 2022 01:55:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D4E09CE253A;
 Wed,  8 Jun 2022 01:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B01BC34114;
 Wed,  8 Jun 2022 01:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654653323;
 bh=g0eRvCvsbj0vd1ddpKE3HGxutqzWrRDV3j74Tmy79iQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KTSGcBRrLzFt/i/GY6srnZSqmZaWnsvpDRHrelpk0awPP587/ItRHen+P8oGL8/Rs
 r47h1jN0NQZzonHvQ7imJh3a4T1d1mDMzbZ4UfchmWLzBRIXKR1iEMxwHXULqVErrO
 FZO7K1rzUcC2nThbNIIHTbfD/QioE1OzyOY4PfhMkiTzslybFWvTFPzoSiGb5R8eWv
 RQCFw4t5htxtZZ8gPSNeCOxk1k91V7iQTzhcVS9BQBFJZgUbDjSX7rDo0yObUtHbhX
 H/+8LNuvRuztQpl/ipfP4XM7ZnxX4zJBn1Wbzv/NDkEICp+oPSmM74Y6Z3hE/i0TcP
 nT+jsKEuSVIAA==
Message-ID: <73fc3d5a-b2c7-194a-82d3-3eb923f96321@kernel.org>
Date: Wed, 8 Jun 2022 09:57:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Fengnan Chang <fengnanchang@gmail.com>
References: <20220511071419.100386-1-fengnanchang@gmail.com>
 <Yp+cwxXag2ZPbvb8@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Yp+cwxXag2ZPbvb8@google.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/8 2:45, Jaegeuk Kim wrote: > On 05/11,
 Fengnan Chang
 wrote: >> When decompressed failed, f2fs_prepare_compress_overwrite will
 enter >> endless loop, may casue hungtask. >> >> [ 14.088665] F2 [...] 
 Content analysis details:   (-7.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.2 NICE_REPLY_A           Looks like a legit reply (A)
 -1.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nykv4-0003HQ-MU
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix hungtask when decompressed fail
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/6/8 2:45, Jaegeuk Kim wrote:
> On 05/11, Fengnan Chang wrote:
>> When decompressed failed, f2fs_prepare_compress_overwrite will enter
>> endless loop, may casue hungtask.
>>
>> [   14.088665] F2FS-fs (nvme0n1): lz4 decompress failed, ret:-4155
>> [   14.089851] F2FS-fs (nvme0n1): lz4 decompress failed, ret:-4155
>>
>> Signed-off-by: Fengnan Chang <fengnanchang@gmail.com>
>> ---
>>   fs/f2fs/compress.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>> index 12a56f9e1572..6a65443fd9b3 100644
>> --- a/fs/f2fs/compress.c
>> +++ b/fs/f2fs/compress.c
>> @@ -1060,7 +1060,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
>>   	sector_t last_block_in_bio;
>>   	unsigned fgp_flag = FGP_LOCK | FGP_WRITE | FGP_CREAT;
>>   	pgoff_t start_idx = start_idx_of_cluster(cc);
>> -	int i, ret;
>> +	int i, ret, retry_count = 3;
>>   
>>   retry:
>>   	ret = f2fs_is_compressed_cluster(cc->inode, start_idx);
>> @@ -1120,7 +1120,12 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
>>   			f2fs_put_rpages(cc);
>>   			f2fs_unlock_rpages(cc, i + 1);
>>   			f2fs_destroy_compress_ctx(cc, true);
>> -			goto retry;
> 
> Do we need to return EIO right away?
> 			if (!page)

page point is valid here, however page is not uptodate here.

Maybe we can set Pg_error flag if decompress failed, and here, we can break the
loop if Pg_error flag was set?

Thanks,

> 				goto retry;
> 			ret = -EIO;
> 			goto out;
> 
>> +			if (retry_count--)
>> +				goto retry;
>> +			else {
>> +				ret = -EIO;
>> +				goto out;
>> +			}
>>   		}
>>   	}
>>   
>> -- 
>> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
