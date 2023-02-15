Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4235697F1D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Feb 2023 16:07:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pSJNJ-0006xq-Pn;
	Wed, 15 Feb 2023 15:07:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pSJNI-0006xk-J0
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Feb 2023 15:07:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XaEZM0OvFiOvJ1GVUZQCL6+88cHxjppRgO5vRkZKTJU=; b=NHQfBFRsnhU7LtS94rml216rF4
 6h0FK3USK/J8GUSwW3f+2n8uyfPmqra8uH7T0dUwN9w1ZqxaXd3vjdWQftMpWA5iZAY2M5hJMMwRT
 5qGgC3kt7drII5/GTwRxg3u780Iu2ImoQpgQsLWTDOX9SvP6+st3tkF5+TGhV/ihol0Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XaEZM0OvFiOvJ1GVUZQCL6+88cHxjppRgO5vRkZKTJU=; b=eV0vTqRWJrpuwETK+U2+M5POMt
 wjiNSX3L5gRdDKHENf8eON0w4HDLSXwJJLxTgQlg8ARQgT0ZdGBZocFTLUju2bWh8hmT5RvGBgJA8
 gc94LMAPzxtdThTPjVkUVV8ujLmlxA7mPmn3zi+34p+3+v3eKWPR5ETRYCcCNvl02QsA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pSJNH-0007eG-6k for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Feb 2023 15:07:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 953FD61B75;
 Wed, 15 Feb 2023 15:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05F33C433EF;
 Wed, 15 Feb 2023 15:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676473626;
 bh=g4lVOohaJiHCnZenvdv47LjjxECvnXyXGuo9zGit+Hc=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=U626YwjyunoFDLPBetDBtXBER9WrtslNZG1WXf7eiEWLOK3IMbKE3DGHc33maLCQN
 SlBbj4TFH6H5wlS/S7C0KoVhxzTC+cg7AH+H/qacpmlqdGfW0QTTCzb2x4As7gLuDU
 qq7mM/LFtECDemKhpyB+pPObFOIxt506s27cYear5N4CeQvtcy3zN7CA8dpYb1cK31
 ghpDAfPrGd0Jg1PTHzo7P88/LbfFO5w75xYOoNIR/nInYWKu8pH/LYZvZ/PWqJIg5a
 8wkIO6mvVYt968oFGD6ZAq6B/gr0pi8frSPFJ2PoOuR0Ciioy0CtQ0dNnQbae7Nw9P
 ORmvh2woerw1w==
Message-ID: <cf7eae6b-61ea-accb-f981-023fb022919c@kernel.org>
Date: Wed, 15 Feb 2023 23:07:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: yonggil.song@samsung.com, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CGME20230215024850epcms2p22be2cc864d82b44f31c19a7ef28770b6@epcms2p2>
 <20230215024850epcms2p22be2cc864d82b44f31c19a7ef28770b6@epcms2p2>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230215024850epcms2p22be2cc864d82b44f31c19a7ef28770b6@epcms2p2>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/2/15 10:48, Yonggil Song wrote: > When f2fs skipped
 a gc round during victim migration, there was a bug which > would skip all
 upcoming gc rounds unconditionally because skipped_gc_rwsem > was [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pSJNH-0007eG-6k
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: fix uninitialized skipped_gc_rwsem
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
Cc: Seokhwan Kim <sukka.kim@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/2/15 10:48, Yonggil Song wrote:
> When f2fs skipped a gc round during victim migration, there was a bug which
> would skip all upcoming gc rounds unconditionally because skipped_gc_rwsem
> was not initialized. It fixes the bug by correctly initializing the
> skipped_gc_rwsem inside the gc loop.

It makes sense to me.

> 
> Fixes: d147ea4adb96 ("f2fs: introduce f2fs_gc_control to consolidate f2fs_gc parameters")

How does this commits introduce the bug?

Thanks,

> Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index b22f49a6f128..81d326abaac1 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1786,8 +1786,8 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>   				prefree_segments(sbi));
>   
>   	cpc.reason = __get_cp_reason(sbi);
> -	sbi->skipped_gc_rwsem = 0;
>   gc_more:
> +	sbi->skipped_gc_rwsem = 0;
>   	if (unlikely(!(sbi->sb->s_flags & SB_ACTIVE))) {
>   		ret = -EINVAL;
>   		goto stop;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
