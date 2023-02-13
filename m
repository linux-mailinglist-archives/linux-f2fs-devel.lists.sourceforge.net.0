Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D94E369418E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Feb 2023 10:42:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pRVLl-0006oQ-3M;
	Mon, 13 Feb 2023 09:42:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pRVLi-0006oH-EU
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Feb 2023 09:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qBDI/SMl9IwC3hGPz7Abvj4QeZ4twtYDZZ/8k7BELRM=; b=PF7FrIXxrdL3S6WmqRA+9QqG8F
 IkGoW7d9ZlrXe98wRQUBP4TOHIo8GmFgFfd/BZNV/5j+SBMVh7z2PDieImekWzprQK1O6KuEq9eFe
 nhiTNyIU35dpgXAk5yfM/6aRnIP+JxAZ7UTjESqaKw8+hTRLx9ue7y+TMcdTaXeus61M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qBDI/SMl9IwC3hGPz7Abvj4QeZ4twtYDZZ/8k7BELRM=; b=gGwHrpi17rWHCO//UKp/6lCUu8
 AouLCeFEpTb1/4u1LkER1Q+TeGnCsVZwgFCKL8Z9utqWjf17zzGw+/yd9IzBEGuPdgAg17n2j73Mf
 UyROXF3Qn5agu1PvSSMy4EMj1TDZ3/QdLtVWefniVSpa7HMWv8PN/UpxKA+TrqVTYEdE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pRVLg-0007q7-Bg for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Feb 2023 09:42:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 21D2B60EF8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Feb 2023 09:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43C4C433EF;
 Mon, 13 Feb 2023 09:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676281321;
 bh=l5IXwvpcb8RzRjt++C3qtxOkpWxUcc0oGQB/6S5HGGo=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=LVkw+rgN+9Fgdoh/f2VrvBjyOV+W8qNMS/+rNX0nb3i8RRBZM71EJlvn3xZXGCK5M
 r0XtiVL2akR1QcwgfSuzfHXQO6Cwgn6DmTXAWWvxiz7z+q8Hgsq2zxSA43MLuZeYG+
 Hon37E+1SCCkkhiXt0aB9FUlUbEl5ZOViK0tHycYVLK0al7EdzxPqcvpUIFkvmZcXn
 hn53E5XLixMT9PQN1bVkzlXscNWmyJyrJwXkZMyHi+Ssu5q9XMsPTdhtG1nRUJ4WgK
 rDm2p9PV5EAqdCWveNcwcA7HlLvtd5eSAe9Jb2dwJVT6c1H7XM+PyU6kY7jVxkReek
 DUGORYGTAd6MQ==
Message-ID: <1a66e32b-efc0-626b-b585-7f2bfac506a7@kernel.org>
Date: Mon, 13 Feb 2023 17:41:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20230210213250.3471246-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230210213250.3471246-1-jaegeuk@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/2/11 5:32, Jaegeuk Kim wrote: > MAIN_SEGS is for data
 area, while TOTAL_SEGS includes data and metadata. Good catch! Could you
 please add fixes line? 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pRVLg-0007q7-Bg
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix wrong segment count
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/2/11 5:32, Jaegeuk Kim wrote:
> MAIN_SEGS is for data area, while TOTAL_SEGS includes data and metadata.

Good catch!

Could you please add fixes line?

Thanks,

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/segment.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 8ee5e5db9287..6003fbaf4b7d 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -720,7 +720,7 @@ static inline unsigned char curseg_alloc_type(struct f2fs_sb_info *sbi,
>   
>   static inline void check_seg_range(struct f2fs_sb_info *sbi, unsigned int segno)
>   {
> -	f2fs_bug_on(sbi, segno > TOTAL_SEGS(sbi) - 1);
> +	f2fs_bug_on(sbi, segno > MAIN_SEGS(sbi) - 1);
>   }
>   
>   static inline void verify_fio_blkaddr(struct f2fs_io_info *fio)
> @@ -775,7 +775,7 @@ static inline int check_block_count(struct f2fs_sb_info *sbi,
>   
>   	/* check segment usage, and check boundary of a given segment number */
>   	if (unlikely(GET_SIT_VBLOCKS(raw_sit) > usable_blks_per_seg
> -					|| segno > TOTAL_SEGS(sbi) - 1)) {
> +					|| segno > MAIN_SEGS(sbi) - 1)) {
>   		f2fs_err(sbi, "Wrong valid blocks %d or segno %u",
>   			 GET_SIT_VBLOCKS(raw_sit), segno);
>   		set_sbi_flag(sbi, SBI_NEED_FSCK);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
