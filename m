Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E4A30A7C5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Feb 2021 13:41:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l6YVo-0004aV-LS; Mon, 01 Feb 2021 12:41:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1l6YVn-0004aO-7I
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Feb 2021 12:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+hKDfmjdPnyrqhf3WVo5a6EDh6mV+pCxgdT7ZFkMYQs=; b=UVB8t/iwBlkyA39t+Q9JYLQFk9
 /V6WZmnj7B2JDNl5lMTHXN0pPbMF3nAPKhWsq8bYleRnGQdxtCUg1rIsN08TgcsXZN/LhruuMeuwJ
 +H4f1GwlgkCYjitNf90HratHqgbsB9XeRIhZ66QbgAkVuR1FzCqCCBR3xR1HemhR5Zmg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+hKDfmjdPnyrqhf3WVo5a6EDh6mV+pCxgdT7ZFkMYQs=; b=kzZMdTBZTsG/F9FXBR5mpLnnxE
 7ioLk1OHwUoLUkRPRXil2ebo4YTXkuhEljue+p4bzFKUafsJgJIqdiJfNEnP7sRTTukKjdsCqF8TH
 gZtLhiq5BQvM/EqTYiaRebpM4773rCMSPI6EIAgcmrJIIqz5C3jI5rZIdd3cCz4CJTsI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l6YVh-00AbgQ-11
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Feb 2021 12:40:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B7BB064DAF;
 Mon,  1 Feb 2021 12:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612183241;
 bh=jhwNBzyC/o5yTSw30Y9cZ74FJik5O4OyLsFrVMfWDRk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RLlnLX+rmgNDp499ERxzP8bzTrBS5b6WICyo9JpIfcCv6rkT2AjXMklnCvzJ50fHI
 rSeB61QY7x0FNSuzUOXf0EqmOt3HZD2cf/xmb4sZc5QM5GOJz4amvLearRuKRoIcBh
 mUBGyF7jjmMFojxaRjsNkl1/QpJFyseMMllcFc7Z0WNjfZNJi+EXIzz1TkTkxeOqCR
 0w2pz2dpryvi0ujsFG0y/hVP4tqSS3iaW7MH6pqE5r2H3xi5a3ZKWDzKUhmb+KWouz
 9dZTXnL+0sbSJlIo3C/Bd65k3i4nGdiBB2uXvvyjZwSfrrmnGMZrEnNnDxSmw3By8G
 iMVsFfEzBJkuw==
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20210201000606.2206740-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <7e2f440e-6500-04c8-1115-880754a18efa@kernel.org>
Date: Mon, 1 Feb 2021 20:40:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210201000606.2206740-1-daeho43@gmail.com>
Content-Language: en-US
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l6YVh-00AbgQ-11
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix checkpoint mount option wrong
 combination
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/2/1 8:06, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> As checkpoint=merge comes in, mount option setting related to
> checkpoint had been mixed up. Fixed it.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   fs/f2fs/super.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 56696f6cfa86..8231c888c772 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -930,20 +930,25 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   				return -EINVAL;
>   			F2FS_OPTION(sbi).unusable_cap_perc = arg;
>   			set_opt(sbi, DISABLE_CHECKPOINT);
> +			clear_opt(sbi, MERGE_CHECKPOINT);
>   			break;
>   		case Opt_checkpoint_disable_cap:
>   			if (args->from && match_int(args, &arg))
>   				return -EINVAL;
>   			F2FS_OPTION(sbi).unusable_cap = arg;
>   			set_opt(sbi, DISABLE_CHECKPOINT);
> +			clear_opt(sbi, MERGE_CHECKPOINT);
>   			break;
>   		case Opt_checkpoint_disable:
>   			set_opt(sbi, DISABLE_CHECKPOINT);
> +			clear_opt(sbi, MERGE_CHECKPOINT);
>   			break;
>   		case Opt_checkpoint_enable:
>   			clear_opt(sbi, DISABLE_CHECKPOINT);
> +			clear_opt(sbi, MERGE_CHECKPOINT);

What if: -o checkpoint=merge,checkpoint=enable

Can you please explain the rule of merge/disable/enable combination and their 
result? e.g.
checkpoint=merge,checkpoint=enable
checkpoint=enable,checkpoint=merge
checkpoint=merge,checkpoint=disable
checkpoint=disable,checkpoint=merge

If the rule/result is clear, it should be documented.

Thanks,


>   			break;
>   		case Opt_checkpoint_merge:
> +			clear_opt(sbi, DISABLE_CHECKPOINT);
>   			set_opt(sbi, MERGE_CHECKPOINT);
>   			break;
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
> @@ -1142,12 +1147,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   		return -EINVAL;
>   	}
>   
> -	if (test_opt(sbi, DISABLE_CHECKPOINT) &&
> -			test_opt(sbi, MERGE_CHECKPOINT)) {
> -		f2fs_err(sbi, "checkpoint=merge cannot be used with checkpoint=disable\n");
> -		return -EINVAL;
> -	}
> -
>   	/* Not pass down write hints if the number of active logs is lesser
>   	 * than NR_CURSEG_PERSIST_TYPE.
>   	 */
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
