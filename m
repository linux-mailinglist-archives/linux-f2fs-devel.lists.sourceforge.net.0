Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E54A63D01
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Mar 2025 04:20:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tu123-0006LZ-NB;
	Mon, 17 Mar 2025 03:20:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tu122-0006LT-Pw
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Mar 2025 03:20:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I1dIyDtpubE2ZF6+Qfe3OY/GthKcyPImati0/i8uwOk=; b=R3QIfej2XL+c9wnpNxw2kRujxT
 J6Ijtwc6We+wyroBkPJJvlHpge73NojZPKSxPLDav1ApyGmBIXFZZCFGIKVH6Zy6iSUqSMRCIvbA3
 MWYtde7oCmWwA5mo5djlEhw1yXHmGHlZi8WRB5SiLMakdvWNC3vumx/vPg3x5l5JS1eo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I1dIyDtpubE2ZF6+Qfe3OY/GthKcyPImati0/i8uwOk=; b=kbD9eUf2IHqXsHRrMsFJnLPgvF
 TRZ+sObyFEvMoOQE28Cl099HnPvI7hSzE19HYo7RB9+iHrZxpNztmsbiJsx/RcZwsBuHvxhAKe6m6
 3AoyY48epVquXqu2jTYrBN2PFWuX+5DCpIXa0WHVOksQQ2Za/7Zgm0VnQFPloBu3tgh4=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tu11r-0002fQ-Hd for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Mar 2025 03:20:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 45999A48A10;
 Mon, 17 Mar 2025 03:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE44C4CEDD;
 Mon, 17 Mar 2025 03:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742181628;
 bh=na9zDyLGCts4zvbhbnkO+YnZ1DfpFRD6cSk88Yd3fd8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=g/Q2ClrZM9mzpJD9kygj613MO2sLMyM7EwJ5BhQ2LE2zFtc/VXz/OuSMFs6glsIqR
 JgYH+oXbyioDQkWpGMGNQZMAJkUlyUd4V7vokitTy3e2w6Av2EZoFpHJyhx/EL2eK0
 Ui3ooDZVGhBc78nktNMBwfZ2vNBKXG3tdHdx44XzUo6dmIGYC12xTST1eXnjrvkgMq
 6AFjre2q9RnIPx+acObHEkiTse7lEU7Cb1IPHG/O/T9IyycStt+kZzI3UkUAL9HUds
 tM3xcpo2NsokBHXeg24du/Hp8b1yrrNTT7Omn+0XkYswHun3z98PaFR/lkiVVZE10g
 DrF2T41b6xpqg==
Message-ID: <d1d43936-1de7-4550-8bf2-f4c604b367d1@kernel.org>
Date: Mon, 17 Mar 2025 11:20:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yohan Joung <jyh429@gmail.com>, jaegeuk@kernel.org, daeho43@gmail.com
References: <20250312134805.362-1-yohan.joung@sk.com>
Content-Language: en-US
In-Reply-To: <20250312134805.362-1-yohan.joung@sk.com>
X-Spam-Score: -2.8 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/12/25 21:48, Yohan Joung wrote: > this is unnecessary
 when we know we are overwriting already allocated > blocks and the overhead
 of starting a transaction can be significant > especially for mul [...] 
 Content analysis details:   (-2.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tu11r-0002fQ-Hd
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: optimize f2fs DIO overwrites
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/12/25 21:48, Yohan Joung wrote:
> this is unnecessary when we know we are overwriting already allocated
> blocks and the overhead of starting a transaction can be significant
> especially for multithreaded workloads doing small writes.
> 
> Signed-off-by: Yohan Joung <yohan.joung@sk.com>
> ---
>  fs/f2fs/data.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index d872f785a996..b55d253f7be9 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -4181,7 +4181,8 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>  	map.m_next_pgofs = &next_pgofs;
>  	map.m_seg_type = f2fs_rw_hint_to_seg_type(F2FS_I_SB(inode),
>  						inode->i_write_hint);
> -	if (flags & IOMAP_WRITE)
> +	if ((flags & IOMAP_WRITE) &&
> +		!f2fs_overwrite_io(inode, offset, length))

Can you please add a comment for this change? Otherwise it looks
fine to me.

Thanks,

>  		map.m_may_create = true;
>  
>  	err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DIO);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
