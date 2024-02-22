Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4E085EEB9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Feb 2024 02:37:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcy1m-0001U9-Tq;
	Thu, 22 Feb 2024 01:37:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rcy1m-0001U2-3b
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Feb 2024 01:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zbcmqlbQoJoNeLaxXAHlhunB0ATnBaqAAq0Z5bYtlVw=; b=FXP/GBRv1ioY5QygxzduQ0Kmlc
 Ml4DqX/6P7ftvO7nDJCb2jtQM+8ArvPfhvey/KKmVtObp4rEa/1WNFeB1mNvQqlkXQSEaZMc2wVZV
 NwNOWzXwXgwp8YPkMZRHYPyQA9ner1Rk3vsbSRCixZva3Nd8T0dGYi2mMJqMrxRQgnq4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zbcmqlbQoJoNeLaxXAHlhunB0ATnBaqAAq0Z5bYtlVw=; b=ZZZSctFMCA+36lhoqpAaMDRqgF
 rnUZQURKssUhb5Qn4brj0OiI8EslHS7dSGTAq2+6ewEylNDixpQty+Ll0EL5WDwVSn9he7q4JYOvK
 ZznSm6Xtlcq7Peky8sGhJfhjNgQGvmpm+xHHx/UukiXYd0YxQCoybSkabbGig2CfAo8w=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcy1l-0004ug-4Q for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Feb 2024 01:37:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 09D37616D5;
 Thu, 22 Feb 2024 01:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 720F4C433F1;
 Thu, 22 Feb 2024 01:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708565841;
 bh=PwtsuWG8E/oFESM40Xvr8zU779YojRz56nkBHgVSrRI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BUMp+bj6BPcHoZLgv5pdktQ/EWXRevuaUPtFYlEICYHxgy5L1Tkca46yLu+5zQKIN
 PpzKahw6JzYh3LVEMAYvoN784KIChRNxArGJSqrdQwO9RdyK4TcBaLxk0UWF4YOw1C
 P/IdR+BWTxxLsEzR0uOmwQ1nSJh9PkqaHU9McK/68XdVi0fKP2p7YFQX0H1D8PO5tO
 F2HXq2Gk+SfNrVuUNDxRuWUJMz/FdeN9MLs5FFqorHs8FoWCen4g47U22iEtuwMDei
 c4abj1Q55+ZemaJ17vquvBMrwl9wdgG4TcHm+SgA2avV929XeEF9kSPs8p8qZOapGe
 6pa8CQ5EMunzQ==
Message-ID: <c2ab9d88-b947-42e5-a1a2-204d58e0c1a8@kernel.org>
Date: Thu, 22 Feb 2024 09:37:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1708409484-27326-1-git-send-email-zhiguo.niu@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1708409484-27326-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/20 14:11,
 Zhiguo Niu wrote: > There is low probability
 that an out-of-bounds segment will be got > on a small-capacity device. In
 order to prevent subsequent write requests > allocating bloc [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcy1l-0004ug-4Q
Subject: Re: [f2fs-dev] [PATCH v4 4/4] f2fs: stop checkpoint when get a
 out-of-bounds segment
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
Cc: hongyu.jin@unisoc.com, ke.wang@unisoc.com, niuzhiguo84@gmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/2/20 14:11, Zhiguo Niu wrote:
> There is low probability that an out-of-bounds segment will be got
> on a small-capacity device. In order to prevent subsequent write requests
> allocating block address from this invalid segment, which may cause
> unexpected issue, stop checkpoint should be performed.
> 
> Also introduce a new stop cp reason: STOP_CP_REASON_NO_SEGMENT.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
> changes of v4: use more suitable MACRO name according to Chao's suggestions
> changes of v3: correct MACRO spelling and update based on the lastes code
> ---
> ---
>   fs/f2fs/segment.c       | 7 ++++++-
>   include/linux/f2fs_fs.h | 1 +
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index c25aaec..e42e34c 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2665,7 +2665,12 @@ static void get_new_segment(struct f2fs_sb_info *sbi,
>   	if (secno >= MAIN_SECS(sbi)) {
>   		secno = find_first_zero_bit(free_i->free_secmap,
>   							MAIN_SECS(sbi));
> -		f2fs_bug_on(sbi, secno >= MAIN_SECS(sbi));
> +		if (secno >= MAIN_SECS(sbi)) {
> +			f2fs_stop_checkpoint(sbi, false,
> +				STOP_CP_REASON_NO_SEGMENT);

We should relocate stop_checkpoint(sbi, false, STOP_CP_REASON_NO_SEGMENT) outside
segmap_lock spinlock, due to it may sleep in f2fs_flush_merged_writes().

Thanks,

> +			f2fs_bug_on(sbi, 1);
> +		}
> +
>   	}
>   	segno = GET_SEG_FROM_SEC(sbi, secno);
>   	zoneno = GET_ZONE_FROM_SEC(sbi, secno);
> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
> index 9b69c50..755e9a4 100644
> --- a/include/linux/f2fs_fs.h
> +++ b/include/linux/f2fs_fs.h
> @@ -75,6 +75,7 @@ enum stop_cp_reason {
>   	STOP_CP_REASON_CORRUPTED_SUMMARY,
>   	STOP_CP_REASON_UPDATE_INODE,
>   	STOP_CP_REASON_FLUSH_FAIL,
> +	STOP_CP_REASON_NO_SEGMENT,
>   	STOP_CP_REASON_MAX,
>   };
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
