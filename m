Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AF7929BF3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Jul 2024 08:09:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sQhYx-0007o4-7c;
	Mon, 08 Jul 2024 06:09:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sQhYw-0007nt-CU
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Jul 2024 06:09:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dyfqM6zMu1UstYW3qh/x5dAXnu0x47+tz8oHkS+m6Lo=; b=TMUWXFbvF0sAdb/lFOFLBU3WU1
 AVsXdG3QvgCVYmFj6JNTTzHxbMLoCImxJaGf+NLwyL+KgXghsIHRkvIQ3QSlMY0Pa4Jd3dfas8ZS8
 AbAl0/QRJtAjaegQZtAglrQHVqahXPt1xUHRFRl/Ywg8Y5vF5h0BBe/X6F8sfuvDc9KU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dyfqM6zMu1UstYW3qh/x5dAXnu0x47+tz8oHkS+m6Lo=; b=E9cj2yrHIo1F1Eh4VfjCHlZLZK
 7ih0Vbn1RMRkdnF6OlKDcM6f1FHtqWfc/CcSO2RewL1yyT2tCjSGi8sEXAE6uqH0Kcz+IFtjCP1Ii
 G9KRoCUp/gIf8d8vrmmCMKAnPhkRGtzsFKpqj/fpk+nyMALvXSqAJdoLwiSbjM3r/p7o=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sQhYw-0000Ff-Pe for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Jul 2024 06:09:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A742D60ABF;
 Mon,  8 Jul 2024 06:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F5CDC116B1;
 Mon,  8 Jul 2024 06:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720418956;
 bh=e31UxuCuU39AhhqKTDVLOunVMLNlFlDSQUdrPqdpEDU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WOXKt8uKJH0PeJD6Yi3tS2aMI7LdZ4xtVjfS1BwN5GjMj6kNzoSllY+1f/Y4WFu0c
 oYzSnS3zDWNyvQGVst6SUWgwarRZGugewokpxlwqMupDgAZivnhvoZ+t+sYkrBjAx7
 lA/AEtvjiEfvlWKdsr/iBO7KojWcOhsAKoqBIOXvgYzSyJ4wfeuAYRt1D/cwby/veC
 f9shb3VGjmlmxyf2K+Xpx95UvFQ/c8Z0UXZxyyrFZ1u7ZapLJxHeQOMIjv17UesABc
 Fhqu2TUT2Qb6X0DCYM40yk/xxNgtOwhrD/BdvDIGnGe7qGcwPP15J96X2auvMn1MVk
 1B9rAhZjMe0Hg==
Message-ID: <5919b47f-616a-441d-bfe8-9c03739b61d7@kernel.org>
Date: Mon, 8 Jul 2024 14:09:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <20240706091634.1970874-1-shengyong@oppo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240706091634.1970874-1-shengyong@oppo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/6 17:16,
 Sheng Yong wrote: > get_ckpt_valid_blocks()
 checks valid ckpt blocks in current section. > It counts all vblocks from
 the first to the last segment in the > large section. However, [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sQhYw-0000Ff-Pe
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix start segno of large section
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

On 2024/7/6 17:16, Sheng Yong wrote:
> get_ckpt_valid_blocks() checks valid ckpt blocks in current section.
> It counts all vblocks from the first to the last segment in the
> large section. However, START_SEGNO() is used to get the first segno
> in an SIT block. This patch fixes that to get the correct start segno.
> 
> Fixes: 61461fc921b7 ("f2fs: fix to avoid touching checkpointed data in get_victim()")
> Signed-off-by: Sheng Yong <shengyong@oppo.com>
> ---
>   fs/f2fs/segment.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index e1c0f418aa11..6ed5bc811d2c 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -347,7 +347,8 @@ static inline unsigned int get_ckpt_valid_blocks(struct f2fs_sb_info *sbi,
>   				unsigned int segno, bool use_section)
>   {
>   	if (use_section && __is_large_section(sbi)) {
> -		unsigned int start_segno = START_SEGNO(segno);
> +		unsigned int start_segno = segno / SEGS_PER_SEC(sbi) *
> +							SEGS_PER_SEC(sbi);

How about using macro?

	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
	unsigned int start_seno = GET_SEG_FROM_SEC(sbi, secno);

Thanks,

>   		unsigned int blocks = 0;
>   		int i;
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
