Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7642A9B929E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Nov 2024 14:54:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t6s6H-0004IH-Dq;
	Fri, 01 Nov 2024 13:54:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t6s6G-0004IA-Hq
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Nov 2024 13:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dwax/0GHgBbbplJLy7dokIbVlgbgUv7kkTxMeg2TQ1I=; b=QG3+dJjAMgFmzdSxT+9lSyY9iP
 XJuRC5l6dGBwhDGnxyPNDcO6fdNkcXk8F4bj2g1cGXHwvP5jrksGHZpnZbpm86mxcaXVSifW0JN01
 hcriXT0Ig8Qyxgk74efYL6CPnHftUSd1t5PkBXovI7vFa4+yBfrbQMi3ut8RNtYU89/Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dwax/0GHgBbbplJLy7dokIbVlgbgUv7kkTxMeg2TQ1I=; b=U5CSkr1lg9qYmMSWDfARea8HUF
 on4U3ECTKaSQS0FUUIRfqzf+p4g4+Q4S8/xmRFKA8EI3MQA99yUGDAp6TwZCfKs6ELqbSkN86/IpY
 3amJ/rVARaJoZn2XyHUSC88A+9IcX+n0ku6FXGd34SlOj1m4fa8wJtsBEmlqrPFDAGQQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t6s6G-0005ID-Ja for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Nov 2024 13:54:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7F3255C7C7E;
 Thu, 31 Oct 2024 07:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D03C4CEC3;
 Thu, 31 Oct 2024 07:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730359160;
 bh=G1joOcZYVzyi+CpWThJYYljoZ34bPNrUyzqzZp2mieM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=fMiC4EVapi5C1MT5gjVRtLMnN+GYG5+8V4cLi2fM6euLZJKtYxeUIMf+tfVkOjJWT
 03+c1Ys1x42N1Xpmpydoe3KKZDiJeT0DJ2pHe6uZ0enYH0DXtaW7zw3hKckQu0ahwv
 l1N7gUzyUbZTTQXP0yhg7YUagZvFybjBFAKFWsoctk0+Smdf++ORcZpcTiS/nmY4UZ
 /DLLR50GTnrEuwg3JKQ2KBgMiTJXgPMGqfXCABJhGnr0P1vTLu6fra00FgUQuhewzB
 ejFgwia1s6NPgk00bxjCYgam//rmg68NdnY25m95Fva3rOyhY1lLrpb107odGHWOS+
 yOxT2UJEy4MWQ==
Message-ID: <290e29df-3f63-4de9-a18f-c5c4190d85f1@kernel.org>
Date: Thu, 31 Oct 2024 15:19:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yi Sun <yi.sun@unisoc.com>, jaegeuk@kernel.org
References: <20241030103136.2874140-1-yi.sun@unisoc.com>
 <20241030103136.2874140-2-yi.sun@unisoc.com>
Content-Language: en-US
In-Reply-To: <20241030103136.2874140-2-yi.sun@unisoc.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/30 18:31,
 Yi Sun wrote: > When using update_sit_entry()
 to release consecutive blocks, > ensure that the consecutive blocks belong
 to the same segment. > Because after update_sit_entry_for_ [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t6s6G-0005ID-Ja
Subject: Re: [f2fs-dev] [PATCH v2 1/5] f2fs: blocks need to belong to the
 same segment when using update_sit_entry()
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, sunyibuaa@gmail.com,
 hao_hao.wang@unisoc.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/10/30 18:31, Yi Sun wrote:
> When using update_sit_entry() to release consecutive blocks,
> ensure that the consecutive blocks belong to the same segment.
> Because after update_sit_entry_for_realese(), @segno is still
> in use in update_sit_entry().

I think this patch should be merged into
"f2fs: introduce update_sit_entry_for_release()".

Thanks,

> 
> Signed-off-by: Yi Sun <yi.sun@unisoc.com>
> ---
>   fs/f2fs/segment.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index bb2fd98331cd..a5bd101c63a1 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2424,6 +2424,10 @@ static void update_segment_mtime(struct f2fs_sb_info *sbi, block_t blkaddr,
>   		SIT_I(sbi)->max_mtime = ctime;
>   }
>   
> +/*
> + * NOTE: when updating multiple blocks at the same time, please ensure
> + * that the consecutive input blocks belong to the same segment.
> + */
>   static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_entry *se,
>   				block_t blkaddr, unsigned int offset, int del)
>   {
> @@ -2434,6 +2438,8 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
>   	int i;
>   	int del_count = -del;
>   
> +	f2fs_bug_on(sbi, GET_SEGNO(sbi, blkaddr) != GET_SEGNO(sbi, blkaddr + del_count - 1));
> +
>   	for (i = 0; i < del_count; i++) {
>   		exist = f2fs_test_and_clear_bit(offset + i, se->cur_valid_map);
>   #ifdef CONFIG_F2FS_CHECK_FS
> @@ -2476,6 +2482,11 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
>   	return del;
>   }
>   
> +/*
> + * If releasing blocks, this function supports updating multiple consecutive blocks
> + * at one time, but please note that these consecutive blocks need to belong to the
> + * same segment.
> + */
>   static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
>   {
>   	struct seg_entry *se;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
