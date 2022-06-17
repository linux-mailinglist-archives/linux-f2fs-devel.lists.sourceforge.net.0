Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E2D54EF03
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jun 2022 03:59:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o21GN-00049g-Vn; Fri, 17 Jun 2022 01:59:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1o21GL-00049a-Rn
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jun 2022 01:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=brYVI8UfZuIkJD6o7HR1Ufe4sSwOwSMk8x7ApsiDq0E=; b=Kuv2kbMUPrOXcVJllrj+sbZelc
 Un40kMjs5GSq3YVOkYd2LO0CIGptj8RkFpGbrTD6hZjmYRM4g2C/0a9byHKh8eVpx4XmH5iqUO05T
 mHssHhFkqST7FOBwNzeDNKhH+1kw4KepMv9rqqaO9JhYEhfYedFZJG+/PGdRB/q+wbdM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=brYVI8UfZuIkJD6o7HR1Ufe4sSwOwSMk8x7ApsiDq0E=; b=GztC349XfYx4LOfsGkO6iRFQ5V
 69M4UREgqTmuHwh+lhgNiJ+EryIASPItAP2SvKEpiKRVvfD5A7ZUrHqW+G8rqjRTSk5Gykt+KLVTA
 nYgBWHh9VZ0B/Jh09DoZWYRgFZlFx3vxMw7HAUsfh2xq/Vdmla+v62NEaLZYpLgCnGXI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o21GJ-0008FU-VA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jun 2022 01:59:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AE55B6177D;
 Fri, 17 Jun 2022 01:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C11C34114;
 Fri, 17 Jun 2022 01:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655431131;
 bh=4ORWnSpPdZuo8VrELNzZCEyTwfy250F3Ymy9hC/UahI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=G6Cu20e5iVIFpcWbnk/TK1ovW3Z+HVhF2jc9uNaAIPaGXK39jnst+NSNnT4Kw3TIz
 o2Hx8PZUF7I4Z7064li25SsSwO2g1CEsRYvWOoxuxKibhXKvrBb7MVF/xDy4fYxjZJ
 gUq0aZDV2MWmz6gPGYatbYLbtnDKUPQU1WQpRWiPzYugJU/0n2VDN7N8exjcyyX34f
 sC8Wm+J8OCnOVotrV1BNPXbjy7hAP3nRU2YQj86aGDmD5w/0Df8w7bKGRmYn4QtHvG
 MqbRleU9XIedbI7n8Xeq1RD3z2t5McZsos3V2y2FmEhQImsSPWAKeRjVnNANNJ9zqR
 HIyY5ODzvqfWg==
Message-ID: <3e244ae3-67af-a347-3eb4-1d006984a080@kernel.org>
Date: Fri, 17 Jun 2022 09:58:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220610183240.2269085-1-daeho43@gmail.com>
 <1815f3c2-0802-5b3f-7e98-9f89c5b9e07d@kernel.org>
 <YqoOzdxeG78RniEK@google.com>
 <fbd81c67-42b6-1e96-32d6-391dcafe181c@kernel.org>
 <YqtY4VVs9DrU3H5p@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YqtY4VVs9DrU3H5p@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/17 0:22, Jaegeuk Kim wrote: > On 06/16, Chao Yu
 wrote: >> On 2022/6/16 0:54, Jaegeuk Kim wrote: >>> On 06/15, Chao Yu wrote:
 >>>> On 2022/6/11 2:32, Daeho Jeong wrote: >>>>> From: Daeho Jeon [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o21GJ-0008FU-VA
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix iostat related lock protection
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/6/17 0:22, Jaegeuk Kim wrote:
> On 06/16, Chao Yu wrote:
>> On 2022/6/16 0:54, Jaegeuk Kim wrote:
>>> On 06/15, Chao Yu wrote:
>>>> On 2022/6/11 2:32, Daeho Jeong wrote:
>>>>> From: Daeho Jeong <daehojeong@google.com>
>>>>>
>>>>> Made iostat related locks safe to be called from irq context again.
>>>>>
>>>>
>>>> Will be better to add a 'Fixes' line?
>>>
>>> Added some tags. Thanks,
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=f8ed39ad779fbc5d37d08e83643384fc06e4bae4
>>
>> It looks there are several patches not in mailing list?
>>
> 
> Which one doe you mean?

f2fs: do not skip updating inode when retrying to flush node page

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=27ef61f3bf3d15caa3f4ceef60163da3f143787d

f2fs: run GCs synchronously given user requests

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=503bbcc92f0baba2a59b0a6cb4f12cf5d7141978

f2fs: attach inline_data after setting compression

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=0c837862d93c8e2e0bbb6d33efa0ff10e603c0c5

And also current patch w/ Fixes line.

Thanks,

> 
>> Thanks,
>>
>>>
>>>
>>>>
>>>> Thanks,
>>>>
>>>>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
>>>>> ---
>>>>>     fs/f2fs/iostat.c | 31 ++++++++++++++++++-------------
>>>>>     1 file changed, 18 insertions(+), 13 deletions(-)
>>>>>
>>>>> diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
>>>>> index be599f31d3c4..d84c5f6cc09d 100644
>>>>> --- a/fs/f2fs/iostat.c
>>>>> +++ b/fs/f2fs/iostat.c
>>>>> @@ -91,8 +91,9 @@ static inline void __record_iostat_latency(struct f2fs_sb_info *sbi)
>>>>>     	unsigned int cnt;
>>>>>     	struct f2fs_iostat_latency iostat_lat[MAX_IO_TYPE][NR_PAGE_TYPE];
>>>>>     	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
>>>>> +	unsigned long flags;
>>>>> -	spin_lock_bh(&sbi->iostat_lat_lock);
>>>>> +	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
>>>>>     	for (idx = 0; idx < MAX_IO_TYPE; idx++) {
>>>>>     		for (io = 0; io < NR_PAGE_TYPE; io++) {
>>>>>     			cnt = io_lat->bio_cnt[idx][io];
>>>>> @@ -106,7 +107,7 @@ static inline void __record_iostat_latency(struct f2fs_sb_info *sbi)
>>>>>     			io_lat->bio_cnt[idx][io] = 0;
>>>>>     		}
>>>>>     	}
>>>>> -	spin_unlock_bh(&sbi->iostat_lat_lock);
>>>>> +	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
>>>>>     	trace_f2fs_iostat_latency(sbi, iostat_lat);
>>>>>     }
>>>>> @@ -115,14 +116,15 @@ static inline void f2fs_record_iostat(struct f2fs_sb_info *sbi)
>>>>>     {
>>>>>     	unsigned long long iostat_diff[NR_IO_TYPE];
>>>>>     	int i;
>>>>> +	unsigned long flags;
>>>>>     	if (time_is_after_jiffies(sbi->iostat_next_period))
>>>>>     		return;
>>>>>     	/* Need double check under the lock */
>>>>> -	spin_lock_bh(&sbi->iostat_lock);
>>>>> +	spin_lock_irqsave(&sbi->iostat_lock, flags);
>>>>>     	if (time_is_after_jiffies(sbi->iostat_next_period)) {
>>>>> -		spin_unlock_bh(&sbi->iostat_lock);
>>>>> +		spin_unlock_irqrestore(&sbi->iostat_lock, flags);
>>>>>     		return;
>>>>>     	}
>>>>>     	sbi->iostat_next_period = jiffies +
>>>>> @@ -133,7 +135,7 @@ static inline void f2fs_record_iostat(struct f2fs_sb_info *sbi)
>>>>>     				sbi->prev_rw_iostat[i];
>>>>>     		sbi->prev_rw_iostat[i] = sbi->rw_iostat[i];
>>>>>     	}
>>>>> -	spin_unlock_bh(&sbi->iostat_lock);
>>>>> +	spin_unlock_irqrestore(&sbi->iostat_lock, flags);
>>>>>     	trace_f2fs_iostat(sbi, iostat_diff);
>>>>> @@ -145,25 +147,27 @@ void f2fs_reset_iostat(struct f2fs_sb_info *sbi)
>>>>>     	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
>>>>>     	int i;
>>>>> -	spin_lock_bh(&sbi->iostat_lock);
>>>>> +	spin_lock_irq(&sbi->iostat_lock);
>>>>>     	for (i = 0; i < NR_IO_TYPE; i++) {
>>>>>     		sbi->rw_iostat[i] = 0;
>>>>>     		sbi->prev_rw_iostat[i] = 0;
>>>>>     	}
>>>>> -	spin_unlock_bh(&sbi->iostat_lock);
>>>>> +	spin_unlock_irq(&sbi->iostat_lock);
>>>>> -	spin_lock_bh(&sbi->iostat_lat_lock);
>>>>> +	spin_lock_irq(&sbi->iostat_lat_lock);
>>>>>     	memset(io_lat, 0, sizeof(struct iostat_lat_info));
>>>>> -	spin_unlock_bh(&sbi->iostat_lat_lock);
>>>>> +	spin_unlock_irq(&sbi->iostat_lat_lock);
>>>>>     }
>>>>>     void f2fs_update_iostat(struct f2fs_sb_info *sbi,
>>>>>     			enum iostat_type type, unsigned long long io_bytes)
>>>>>     {
>>>>> +	unsigned long flags;
>>>>> +
>>>>>     	if (!sbi->iostat_enable)
>>>>>     		return;
>>>>> -	spin_lock_bh(&sbi->iostat_lock);
>>>>> +	spin_lock_irqsave(&sbi->iostat_lock, flags);
>>>>>     	sbi->rw_iostat[type] += io_bytes;
>>>>>     	if (type == APP_BUFFERED_IO || type == APP_DIRECT_IO)
>>>>> @@ -172,7 +176,7 @@ void f2fs_update_iostat(struct f2fs_sb_info *sbi,
>>>>>     	if (type == APP_BUFFERED_READ_IO || type == APP_DIRECT_READ_IO)
>>>>>     		sbi->rw_iostat[APP_READ_IO] += io_bytes;
>>>>> -	spin_unlock_bh(&sbi->iostat_lock);
>>>>> +	spin_unlock_irqrestore(&sbi->iostat_lock, flags);
>>>>>     	f2fs_record_iostat(sbi);
>>>>>     }
>>>>> @@ -185,6 +189,7 @@ static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx,
>>>>>     	struct f2fs_sb_info *sbi = iostat_ctx->sbi;
>>>>>     	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
>>>>>     	int idx;
>>>>> +	unsigned long flags;
>>>>>     	if (!sbi->iostat_enable)
>>>>>     		return;
>>>>> @@ -202,12 +207,12 @@ static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx,
>>>>>     			idx = WRITE_ASYNC_IO;
>>>>>     	}
>>>>> -	spin_lock_bh(&sbi->iostat_lat_lock);
>>>>> +	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
>>>>>     	io_lat->sum_lat[idx][iotype] += ts_diff;
>>>>>     	io_lat->bio_cnt[idx][iotype]++;
>>>>>     	if (ts_diff > io_lat->peak_lat[idx][iotype])
>>>>>     		io_lat->peak_lat[idx][iotype] = ts_diff;
>>>>> -	spin_unlock_bh(&sbi->iostat_lat_lock);
>>>>> +	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
>>>>>     }
>>>>>     void iostat_update_and_unbind_ctx(struct bio *bio, int rw)
>>>>
>>>>
>>>> _______________________________________________
>>>> Linux-f2fs-devel mailing list
>>>> Linux-f2fs-devel@lists.sourceforge.net
>>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
