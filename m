Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E5CD070B7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 09 Jan 2026 04:52:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzw3o6dj60bzKoXTOFBuphY0QuqklpuYsL/AGMmw80A=; b=iY+YY44IIF/G9OeR39rDZV1F/g
	VqDpB9bETh6EzzUgtV6eEd0I6OIzpPpZX+qQlnIIcTJRR5wo0N/dZN7fs6KIxCg0cQgbLSxbUsEiw
	Gi+5sdoavCCzrAb6Vt9Wux/XnYpaR9/Dl/XfgSAcrsc8jjhVS674m7Q6wOeGFpbAKc4w=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ve3Y1-00051M-VY;
	Fri, 09 Jan 2026 03:52:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ve3Y1-00051A-5N
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jan 2026 03:52:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=veC7eNyrW4m2oPM7MR6GO2JF2w2MvkNY+hf59UURlec=; b=CFfOe8kfvN/wvelW+xVyxmGjmy
 kJnOse9cnEaYBjfchj5clxtCZ2FOHBKWsaOGocxNicFRWMBl9hULy1waPNW2SfABsYBNCcryFApHV
 /5jDy6x+v8g07xp5HNSKJec4Ncdugqm0jk0nxBv3IXVzikTHRc9QjCxzaazBruiczHyw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=veC7eNyrW4m2oPM7MR6GO2JF2w2MvkNY+hf59UURlec=; b=Cy+FglfnDeijMbCRxtP8wxZLPz
 gBIqdM/FK+PkIX6u5Rx68emBFE7GwWkpVHb4B/T/IopEECASGoYwGOHU+bsvjX8C7/Gn/B7AWOROP
 6SKGT0M4QN+RvV1qawLVqoZil4+y8tpzfjfgQ0Tbvvcr+wJakSh5pf6qq4uIBLasax50=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ve3Y1-000120-D1 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jan 2026 03:52:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9BE3F6014C;
 Fri,  9 Jan 2026 03:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CCD6C19423;
 Fri,  9 Jan 2026 03:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767930734;
 bh=RihT2wPIG8UG2lraqVOyS4CV5JAmK2fr/T2nG15hWkQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=kfsAtZ3ViPBCCf2/KehyTc6ks+87Vp25Rwv/8cDwfkN9cot0u1eFLwWnDnzMA+tXG
 m3cv7z7AodeXYoC6uIysofUoipcoQw27tUzTVtb0Ry1ATE9gspr8yD+NRzhu306M4S
 gMolJM+fw2HWNYeaQHgg3i52zI8Ib0KBgZx3pJZy6Qh2cP5mdweEQbPiA06f8y7VnP
 VVGo+WJmQQvbTskh/eTJxBjK8O3Nnn3aycQFuwv6QlK46FfRytKqaeg5iS52S9Eu5b
 tBFV6lNkHsRC9EiVGDEaSVBDlJIiJd83q8Nd5aA6gBS3O6zg+1uBu3jFJlkusBc71p
 J1Avjq1evx9Hg==
Message-ID: <cac0eba2-8555-40c8-ba3d-6b99eb40f2db@kernel.org>
Date: Fri, 9 Jan 2026 11:52:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: liujinbao1 <jinbaoliu365@gmail.com>, jaegeuk@kernel.org
References: <20260107131543.3492385-1-jinbaoliu365@gmail.com>
Content-Language: en-US
In-Reply-To: <20260107131543.3492385-1-jinbaoliu365@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/7/2026 9:15 PM, liujinbao1 wrote: > From: liujinbao1
 <liujinbao1@xiaomi.com> > > During the f2fs_get_victim process,
 when the f2fs_need_rand_seg
 is enabled in select_policy, > p->offset is a rand [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ve3Y1-000120-D1
Subject: Re: [f2fs-dev] [PATCH] [PATCH] f2fs:Fix incomplete search range in
 f2fs_get_victim when f2fs_need_rand_seg is enabled
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
Cc: liujinbao1 <liujinbao1@xiaomi.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/7/2026 9:15 PM, liujinbao1 wrote:
> From: liujinbao1 <liujinbao1@xiaomi.com>
> 
> During the f2fs_get_victim process, when the f2fs_need_rand_seg is enabled in select_policy,
> p->offset is a random value, and the search range is from p->offset to MAIN_SECS.
> When segno >= last_segment, the loop breaks and exits directly without searching
> the range from 0 to p->offset.This results in an incomplete search when the random
> offset is not zero.

What about updating sm->last_victim[p.gc_mode] as well when p->offset is not zero
in select_policy()?

select_policy()
...
	/* let's select beginning hot/small space first. */
	if (f2fs_need_rand_seg(sbi)) {
		p->offset = get_random_u32_below(MAIN_SECS(sbi) *
						SEGS_PER_SEC(sbi));
		if (p->offset)
			sm->last_victim[p.gc_mode] = p->offset;
	}

Then we can expect p->offset being reset to zero, and last_segment being reset to
sm->last_victim[p.gc_mode] in below logic?

		if (segno >= last_segment) {
			if (sm->last_victim[p.gc_mode]) {
				last_segment =
					sm->last_victim[p.gc_mode];
				sm->last_victim[p.gc_mode] = 0;
				p.offset = 0;
				continue;
			}
			break;
		}

Thanks,

> 
> Signed-off-by: liujinbao1 <liujinbao1@xiaomi.com>
> ---
>   fs/f2fs/gc.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 384fa7e2085b..100b8fc3e65a 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -781,6 +781,7 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
>   	unsigned int valid_thresh_ratio = 100;
>   	bool is_atgc;
>   	int ret = 0;
> +	unsigned int original_offset;
>   
>   	mutex_lock(&dirty_i->seglist_lock);
>   	last_segment = MAIN_SECS(sbi) * SEGS_PER_SEC(sbi);
> @@ -799,6 +800,7 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
>   	p.min_segno = NULL_SEGNO;
>   	p.oldest_age = 0;
>   	p.min_cost = get_max_cost(sbi, &p);
> +	original_offset = p.offset;
>   
>   	is_atgc = (p.gc_mode == GC_AT || p.alloc_mode == AT_SSR);
>   	nsearched = 0;
> @@ -859,11 +861,11 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
>   				p.offset / p.ofs_unit);
>   		segno = unit_no * p.ofs_unit;
>   		if (segno >= last_segment) {
> -			if (sm->last_victim[p.gc_mode]) {
> -				last_segment =
> -					sm->last_victim[p.gc_mode];
> -				sm->last_victim[p.gc_mode] = 0;
> +			if (original_offset != 0) {
> +				last_segment = original_offset;
>   				p.offset = 0;
> +				if (sm->last_victim[p.gc_mode])
> +					sm->last_victim[p.gc_mode] = 0;
>   				continue;
>   			}
>   			break;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
