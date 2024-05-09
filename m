Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D768C149D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 May 2024 20:20:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s58Mx-0000N4-OO;
	Thu, 09 May 2024 18:19:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1s58Mv-0000Mw-Ce
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 May 2024 18:19:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mg3HwjqEc2ZWsKqhcpViEOtUQpAVaqFthT91OSEbTLU=; b=jguz9FD3ssdSCN/afiX6AUxMOe
 MTrAfkoWPwQ8dRnfpWI3AGAgYlNuAJRz6HHwMh1Cw9kzsJb50rW9syloyaRHaXT/r8W+l5EjSBz5b
 tS5paxhlyHJnZUvCpmgFMEld/VH5JEyPay4JzxA5XVtQiARAkCy0v6upQ14m6LzdREfs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Mg3HwjqEc2ZWsKqhcpViEOtUQpAVaqFthT91OSEbTLU=; b=Mu3BsynY2b8JztNOqAhKevSMqy
 7XT2KTBQOEQwarF+lC2zDK/UaS2aEJ1c2efcHXES8PLZ7lmDfypZotvGdtN186DqT/jqstFAT0trS
 FNx+uHtLjM8G5srCs6PIVU2+snwYm7+2llfnXTsYgE3x1P6PjR5zx7CD/8UkbM2cV+Js=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s58Mu-0002Uh-P7 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 May 2024 18:19:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4CA0BCE18F1;
 Thu,  9 May 2024 18:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50157C116B1;
 Thu,  9 May 2024 18:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715278780;
 bh=/t2pB7QSKYBgF36Vts5qeGbyY0WPmNyjKYluvoaa0e8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sfCzvEu3z3WHRI1nraVl6WeK1wotw9++4gucuIDqKxMu5wUS/QYU4aFM+u13Ot/29
 ilihfAxTJySycWkwZWHBRBctf/dDFrBNmw9zUC0zIAvXcvLXHVi/MFpp7ZGqFUhZoG
 lWBKWGZtV8iFVlZqyQcngV3ZaHRB+DoNcAYC84c/QWFY26T2fwO3th9B4WN4yncRKA
 6REhCvNjCrscVWbiHuWWP4lrQi8mAqL6PXjCg7wdpgeftsOHUaq1tVXBvgdkmhUqIV
 LhYk/fUpJnP5+zYDzLugEYyf57oPesdOBkk5wL4gTP5LkSTNeE0V2P06vtnPjAEKCQ
 1rYQMvEWRSNuQ==
Date: Thu, 9 May 2024 18:19:38 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <Zj0TuhzHzevgxGfe@google.com>
References: <20240507175628.2460390-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240507175628.2460390-1-daeho43@gmail.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/07,
 Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > Following the semantic for dirty segments in checkpoint disabled mode,
 > apply the same rule to dirty sections. > > Signed- [...] 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s58Mu-0002Uh-P7
Subject: Re: [f2fs-dev] [PATCH] f2fs: allow dirty sections with zero valid
 block for checkpoint disabled
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/07, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Following the semantic for dirty segments in checkpoint disabled mode,
> apply the same rule to dirty sections.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  fs/f2fs/segment.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 6474b7338e81..2463398b243f 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -771,8 +771,11 @@ static void __locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
>  			block_t valid_blocks =
>  				get_valid_blocks(sbi, segno, true);
>  
> -			f2fs_bug_on(sbi, unlikely(!valid_blocks ||
> -					valid_blocks == CAP_BLKS_PER_SEC(sbi)));
> +			if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED))
> +				f2fs_bug_on(sbi, unlikely(!valid_blocks));
> +
> +			f2fs_bug_on(sbi, unlikely(valid_blocks ==
> +					CAP_BLKS_PER_SEC(sbi)));

What about:
f2fs_bug_on(sbi,
	(!is_sbi_flag_set(sbi, SBI_CP_DISABLED) && !valid_blocks) ||
	valid_blocks == CAP_BLKS_PER_SEC(sbi));

>  
>  			if (!IS_CURSEC(sbi, secno))
>  				set_bit(secno, dirty_i->dirty_secmap);
> -- 
> 2.45.0.rc1.225.g2a3ae87e7f-goog
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
