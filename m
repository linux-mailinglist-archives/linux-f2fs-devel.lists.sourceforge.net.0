Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2454EAB49AF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 May 2025 04:48:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBOXLiTSM2KKqRWBql2ln03kYC6REaJoao93UaGFovU=; b=FadVnHBa24KQfWUfWjJTLACflL
	jTkqB+dAfXn51eJtr1zLPJwdGxG8SBuT52BGB7snjGacmYvRTVPfemEHLQy/FOm1/0WbY4rKombLk
	Y3LKe78XML21jLsUSmj9VLrriQX5TetsbsTSBh8imu5rcOsuvSVRKv1Y6zu90uj2exEs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEfgn-0002we-6K;
	Tue, 13 May 2025 02:48:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uEfgm-0002wX-6z
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 02:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JCkXfiYDS6X2NM9az9e0cP9BlfYpwwKbYOjS4WHzWvY=; b=nOI2MhrdRL3t9aUZeTrFJJ4HAf
 +LVQxbKVEKX4/5EJOuB8Q1Fi8zwecRPydyYTBhHetDKGdBhAohi9IvjL4EXkuQtCiJndCIuww3Y0c
 UodMEEpAUAnzJ6yNkrlmFpAwYH/5Wmhf7OFTZIjrdGpuyDqzM1VnlcHiuv86ysHqpCso=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JCkXfiYDS6X2NM9az9e0cP9BlfYpwwKbYOjS4WHzWvY=; b=ZVK4ypxhBAe0lNUfyYpwenYGeo
 ROGwAbO47MMHuWzCT1vNMHwZulki85/2JMBz8s4dxuEezBW2kZfuMZuOLLDaJnF+HxvoCXIcwWlfM
 4HXR0KMP42eQtgrA6w5hOYiOEOkvRGzp3diV+vQOdjvHudl7om4jar6roAne4dMxHyHM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uEfgl-0000wX-Dq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 02:48:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C4A2F629E6;
 Tue, 13 May 2025 02:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C679C4CEEE;
 Tue, 13 May 2025 02:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747104484;
 bh=rkT2mGhAdwV2TR/RvKtH3Yt0BAey1v915RRP1Se4YIs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=S6QR3mg6ObG0Is8VsnRB7zhIQIdGq78MoVJEKxQMyWNBJ3N2a9t/Q/puA2+5g2CUX
 QjKsTblwNViiarIPFDChNpVlBJkdrG6mDHKuTnwg+wbSM59zQV8KiZGK71X8F6+vwt
 EhKh08IKlYjzFsf/FCFWU36l7vcNLAeOfTFZXLt/oRA/30dWso7k1PjWEgmR2cvvQK
 EWhw+DLiY75GRPKoEbLwiZ0PiXYuDzvuU9hIlrne+HIpzU72p0LGWCNyORMLz8hKc+
 s5qZ5s+Lp7UNji/1by6zQ3HRurbrIT/jiZ/wbvvrhEI5bFI0HwC6mQW7PGD1CoiJGI
 EyhiQwSaCucmA==
Message-ID: <fb54f933-1669-4e89-8b85-9b88030a68d2@kernel.org>
Date: Tue, 13 May 2025 10:48:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Sandeen <sandeen@redhat.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20250423170926.76007-1-sandeen@redhat.com>
 <20250423170926.76007-8-sandeen@redhat.com>
 <b56964c2-ad30-4501-a7fd-1c0b41c407e9@kernel.org>
 <763bed71-1f44-4622-a9a0-d200f0418183@redhat.com>
 <74704f7c-135e-4614-b805-404da6195930@kernel.org>
 <3fe6be01-b9bf-4e26-b3f6-32dafe0a8162@redhat.com>
Content-Language: en-US
In-Reply-To: <3fe6be01-b9bf-4e26-b3f6-32dafe0a8162@redhat.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/13/25 10:19, Eric Sandeen wrote: > On 5/11/25 10:43 PM, 
 Chao Yu wrote: >> On 5/8/25 23:59, Eric Sandeen wrote: >>> On 5/8/25 4:19
 AM, Chao Yu wrote: >>>>> @@ -2645,21 +2603,11 @@ static int f2fs_ [...] 
 Content analysis details:   (-1.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uEfgl-0000wX-Dq
Subject: Re: [f2fs-dev] [PATCH V3 7/7] f2fs: switch to the new mount api
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>, jaegeuk@kernel.org,
 lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/13/25 10:19, Eric Sandeen wrote:
> On 5/11/25 10:43 PM, Chao Yu wrote:
>> On 5/8/25 23:59, Eric Sandeen wrote:
>>> On 5/8/25 4:19 AM, Chao Yu wrote:
>>>>> @@ -2645,21 +2603,11 @@ static int f2fs_remount(struct
>>>>> super_block *sb, int *flags, char *data)
>>>>>
>>>>> default_options(sbi, true);
>>>>>
>>>>> -	memset(&fc, 0, sizeof(fc)); -	memset(&ctx, 0, sizeof(ctx)); 
>>>>> -	fc.fs_private = &ctx; -	fc.purpose =
>>>>> FS_CONTEXT_FOR_RECONFIGURE; - -	/* parse mount options */ -
>>>>> err = parse_options(&fc, data); -	if (err) -		goto
>>>>> restore_opts;
>>>> There is a retry flow during f2fs_fill_super(), I intenionally
>>>> inject a fault into f2fs_fill_super() to trigger the retry flow,
>>>> it turns out that mount option may be missed w/ below testcase:
>>>
>>> I never did understand that retry logic (introduced in ed2e621a95d
>>> long ago). What errors does it expect to be able to retry, with
>>> success?
>>
>> IIRC, it will retry mount if there is recovery failure due to
>> inconsistent metadata.
> 
> Sure, I just wonder what would cause inconsistent metadata to become consistent
> after 1 retry ...

I don't remember, Jaegeuk, do you remember?

Thanks,

> 
>>>
>>> Anyway ...
>>>
>>> Can you show me (as a patch) exactly what you did to trigger the
>>> retry, just so we are looking at the same thing?
>>
>> You can try this?
> 
> Ok, thanks!
> -Eric
> 
>> --- fs/f2fs/super.c | 6 ++++++ 1 file changed, 6 insertions(+)
>>
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c index
>> 0ee783224953..10f0e66059f8 100644 --- a/fs/f2fs/super.c +++ b/fs/
>> f2fs/super.c @@ -5066,6 +5066,12 @@ static int
>> f2fs_fill_super(struct super_block *sb, struct fs_context *fc) goto
>> reset_checkpoint; }
>>
>> +	if (retry_cnt) { +		err = -EIO; +		skip_recovery = true; +		goto
>> free_meta; +	} + /* recover fsynced data */ if (!test_opt(sbi,
>> DISABLE_ROLL_FORWARD) && !test_opt(sbi, NORECOVERY)) {
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
