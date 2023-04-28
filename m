Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F616F0FDE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Apr 2023 03:04:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1psCWj-0002p2-Gu;
	Fri, 28 Apr 2023 01:03:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1psCWh-0002ot-KY
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Apr 2023 01:03:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hdzRGtM+jC8Lbk6eCK5xGCp6DOHiVXp1+0Y+GyekVsQ=; b=MQkVTuwiDMnTipbRoveoD3jNZu
 iCZ/ZnrF+JVjcd30MFbHxW/iB4ToKQaa2sVXAao29xca5l5dQEADkSVZwO29XG2+vDFjdFQzTbF7h
 /p5TvQORZc6gcyMILWSLXq9+AziTvpFVWgYkSRt3sBloemwfeUurzLaLI2cPghxRJd60=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hdzRGtM+jC8Lbk6eCK5xGCp6DOHiVXp1+0Y+GyekVsQ=; b=j0UfBpEwsNz2n5Zq3CJNg06doN
 Yh6pYnTVwZjjPXFAU19wl+pHnLeIcU619aU2pM/iC/kJSRyyMJ1sA1IL415L4kSsyraKtTnOtMZBx
 d7gQw1MvP9mJ7nsll4thV9ZCGVgFmSXKlk1OJRP3NvPwzSzUFF++F0kTjmvUsmfmi9gs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1psCWg-004vBO-3q for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Apr 2023 01:03:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B66C963F1D;
 Fri, 28 Apr 2023 01:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA979C433EF;
 Fri, 28 Apr 2023 01:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682643828;
 bh=MWkTz0nO5y2fvrZumB+rPPskXyiiOksV/05GAaM221g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JvDQBwecVOgxkrPwYu+v1ZE2Syz4HWgSmdCkD+mWMa2vI0eHJBgyPn7STtBt1DMHi
 vm50uKsprJrWXrWT7t92FY0Iz6UWkQH8HBLvDdMZBtWdQdCWPz7XwTE7dHIikf5WrO
 UfUo/uaw7f+9laePflt8GStAFuBmmWQ10a+mDUtw5I/n2OU5EJ7S++cYZf5tAfh+q6
 NRzlby4EDG3FCjvrdlGQBXfpf5zljCqwb1ghR4OciI/DOEfi/sQ/LTl9FR0npNnQ+y
 mPBWmKROkHoPZ9HsCs6uLwcLp57Mj83FhFaIHUwhmHXk8hKXT1IJgLCxcqH6eRmcDs
 K4hwbqFLzw6LQ==
Message-ID: <20801e51-623c-d2bb-6159-9d6aebc66ca9@kernel.org>
Date: Fri, 28 Apr 2023 09:03:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230425164711.19826-1-frank.li@vivo.com>
 <1a602371-d9b0-7148-c916-a02c40649d53@kernel.org>
 <ZEqhImQzKJJSNLNZ@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZEqhImQzKJJSNLNZ@google.com>
X-Spam-Score: -6.8 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/28 0:21, Jaegeuk Kim wrote: > On 04/27, Chao Yu
 wrote: >> On 2023/4/26 0:47,
 Yangtao Li wrote: >>> If a file has FI_COMPRESS_RELEASED, 
 all writes for it should not be >>> allowed. >>> >>> Fi [...] 
 Content analysis details:   (-6.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.4 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1psCWg-004vBO-3q
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: do not allow to defragment files
 have FI_COMPRESS_RELEASED
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Qi Han <hanqi@vivo.com>, Daeho Jeong <daehojeong@google.com>,
 Yangtao Li <frank.li@vivo.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/4/28 0:21, Jaegeuk Kim wrote:
> On 04/27, Chao Yu wrote:
>> On 2023/4/26 0:47, Yangtao Li wrote:
>>> If a file has FI_COMPRESS_RELEASED, all writes for it should not be
>>> allowed.
>>>
>>> Fixes: 5fdb322ff2c2 ("f2fs: add F2FS_IOC_DECOMPRESS_FILE and F2FS_IOC_COMPRESS_FILE")
>>> Signed-off-by: Qi Han <hanqi@vivo.com>
>>> Signed-off-by: Yangtao Li <frank.li@vivo.com>
>>
>> Oh, I just see v2.
>>
>> Reviewed-by: Chao Yu <chao@kernel.org>
> 
> Applied with using goto for code consistency.

It makes sense,

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> 
> +       if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
> +               err = -EINVAL;
> +               goto unlock_out;
> +       }
> +
>          /* if in-place-update policy is enabled, don't waste time here */
>          set_inode_flag(inode, FI_OPU_WRITE);
>          if (f2fs_should_update_inplace(inode, NULL)) {
> @@ -2712,6 +2717,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
>          clear_inode_flag(inode, FI_SKIP_WRITES);
>   out:
>          clear_inode_flag(inode, FI_OPU_WRITE);
> +unlock_out:
>          inode_unlock(inode);
>          if (!err)
>                  range->len = (u64)total << PAGE_SHIFT;
> 
>>
>> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
