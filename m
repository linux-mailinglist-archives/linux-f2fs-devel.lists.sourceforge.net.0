Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB94F4ACE08
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Feb 2022 02:35:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nHFQB-0007nM-GM; Tue, 08 Feb 2022 01:35:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nHFQ9-0007nG-NK
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Feb 2022 01:35:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=skj+eszkqLXUYOuhn7LkXLiyJbFr3reeIStVeComn6A=; b=XKWt9zlOZZkQxgEt5WGu2uPxqI
 NbTmI+l8PA98ehvfVGRY3gw8uF8n7BzX2581pF2LGzxo4wyge92M08PIYERHVK4YIgAiOYimHEeLR
 Ow215jeAmZp7r/rxIiWvA/7QwPfuggUzMujWiIeU50b9bCESUiFqbFUWKL/pqYsMooZs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=skj+eszkqLXUYOuhn7LkXLiyJbFr3reeIStVeComn6A=; b=mDbECQ6UYSHhPM7pxUeZ/iTJeJ
 DUBagivbSL4YsGO0Z4Nmzaqrfb0mFx6nG8m5pgOlSN/RNiQSFLaekN8Qxf5TQiPqc/bb1jX6p6cTy
 rKWG9I04jUSTAFG1Xt2q7fJPoBVkfFOOTpgM+m087UdQV5A0RP2kvNPBm954FCIfN6JI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nHFQ4-0001Y1-MI
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Feb 2022 01:35:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9DC67B81780
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  8 Feb 2022 01:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B730C004E1;
 Tue,  8 Feb 2022 01:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644284136;
 bh=o+NEaHYg1oMwFFbJTVtbm24NxkjLxuhPYXj4L9pEGzo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZJpocSefDus7E3fo3k8k2+rstHENI67GChkDgaAffdBlqoIpcz1c3oGu5gDUsKnVC
 xUQHcsoEXzv1Heh4q//VHqx9XQLrGcRKMcC7uB6+xveGlZdlrwaKR61GYLHPhBCklK
 IHmLL5S6mw25t4f/cgqQXt2xi4/DVcjUXBuKta/Z/kZz1cPgW09y5zKxRqrpsA6gxL
 hWiyMlm21Ht63uRb1VA3OyhLsg5lvQ8Cyr28tkezF4mCxXojH56VSUHsMaMHJB2SPw
 Yl2ak0Kv7pMq2FLrzjyu4GoiLTlH0yqGX2qwrTRRsSfWNegTjaKAjiZAEGQ+WwrTzm
 QLaijvOHNFDLQ==
Message-ID: <59da7f3e-92bd-1165-00e3-3dc18ae19aea@kernel.org>
Date: Tue, 8 Feb 2022 09:35:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220207113516.9489-1-chao@kernel.org>
 <YgFvqnoa61BspqmW@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YgFvqnoa61BspqmW@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/2/8 3:14, Jaegeuk Kim wrote: > On 02/07,
 Chao Yu wrote: >> During checkpoint,
 we have committed preflush command via f2fs_flush_device_cache()
 > > 787 int f2fs_flush_device_cache(struct f2fs_s [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nHFQ4-0001Y1-MI
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid unneeded preflush during
 checkpoint()
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

On 2022/2/8 3:14, Jaegeuk Kim wrote:
> On 02/07, Chao Yu wrote:
>> During checkpoint, we have committed preflush command via f2fs_flush_device_cache()
> 
>   787 int f2fs_flush_device_cache(struct f2fs_sb_info *sbi)
>   788 {
>   789         int ret = 0, i;
>   790
>   791         if (!f2fs_is_multi_device(sbi))
>   792                 return 0;
> 
> Seems a wrong assumption.

Oh, I missed that f2fs_flush_device_cache was introduced to flush devices except
first device when multi-device feature is on.

	for (i = 1; i < sbi->s_ndevs; i++) {
		int count = DEFAULT_RETRY_IO_COUNT;

So, this patch seems wrong...

Instead, below case looks wrong since it needs to trigger flush during checkpoint()
no matter nobarrier is on or off.

	if (test_opt(sbi, NOBARRIER))
		return 0;

Thanks,

> 
>> to persist all metadata pages except last #2 CP pack page, so we don't need to
>> commit another preflush command in commit_checkpoint(), remove it to avoid unneeded
>> write cache overhead.
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/data.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index 8c417864c66a..15ac18bbbc8e 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -598,7 +598,7 @@ static void __f2fs_submit_merged_write(struct f2fs_sb_info *sbi,
>>   		io->fio.op = REQ_OP_WRITE;
>>   		io->fio.op_flags = REQ_META | REQ_PRIO | REQ_SYNC;
>>   		if (!test_opt(sbi, NOBARRIER))
>> -			io->fio.op_flags |= REQ_PREFLUSH | REQ_FUA;
>> +			io->fio.op_flags |= REQ_FUA;
>>   	}
>>   	__submit_merged_bio(io);
>>   	up_write(&io->io_rwsem);
>> -- 
>> 2.32.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
