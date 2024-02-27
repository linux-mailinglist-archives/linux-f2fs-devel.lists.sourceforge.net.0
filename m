Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF87869E4A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Feb 2024 18:50:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rf1b6-0001ag-LQ;
	Tue, 27 Feb 2024 17:50:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rf1b4-0001aX-19
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 17:50:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h/8jspnH+YKtNW5qt3Wug3HFjqQ5IsuWiYgMj5TwX0s=; b=bz7TtjZjU0AGbktA+lEBgy3hhv
 wvPS2zVsyRxVHu2bxwFccgVB63MHVVtDmU/0YwokP9fHRiyfkTLTE8FvyhmolhC6TMeAzCbm93Mwj
 d0ljAr/5YFKC5CjFoKtUMLTHi1DzUyoIYLTLCpB8lQEQvlrooXep/lEXEVXOAyQvteFs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h/8jspnH+YKtNW5qt3Wug3HFjqQ5IsuWiYgMj5TwX0s=; b=Ueuh06iNcKowHnfHZ5LwG3xT3q
 V6+8aSTmfSl4FolygtFJWREGUmI9/NoMdDiDCpir0x044/XCzqcPpZuzL8lapmKyKoOscVPon6plb
 UWqMwBr8Zz5Yk+M8Q8xere3pWlnsk384OxAVM0RcvSVDyPMU0wVAuA2eofKioba4uDvw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rf1b4-0007Uu-0M for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 17:50:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 91B1C61307
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 27 Feb 2024 17:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226DDC433F1;
 Tue, 27 Feb 2024 17:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709056219;
 bh=DDIKRf6Ufecl9u57nNBqnT2apz/dSFBQ9/B2HzYZIKc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MiavqekT8D8nUaX8Elm1x2Eu9AMmI2cT+u3IkMJ9CSglk2muojEs+Y49uOoEuqYv1
 mbPo+W/3LR01UUG7RnQgOSrJMzzZ+lLZxueIEWbCTFbxuIsP7YELh1pGfcuD7W+NW0
 nZN4yT37tv0ebz6G6jckbv6AVNrpBWoQYzpTYxFtmiTDqCYG5fzlYetCOgjh4tr8mt
 zQRi4DSaVHM/6/gnShQkQyVfvSo9b2bB3/4G2qeGRdW5td0adH84w2IySP2V4BMS1F
 YupOmDsM9mSqb8QR2kG7XkIBohQ9D2lU70KdApgbqz+WIhpqbxt+No8jCL/0SKPmlJ
 xvYBKRJCnCaJQ==
Date: Tue, 27 Feb 2024 09:50:17 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Zd4g2SgQn3v_ZJMj@google.com>
References: <20240222121851.883141-1-chao@kernel.org>
 <20240222121851.883141-2-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240222121851.883141-2-chao@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/22, Chao Yu wrote: > f2fs_stop_checkpoint(, false) is
 complex and it may sleep, so we should > move it outside segmap_lock spinlock
 coverage in get_new_segment(). Chao, I merged this patch into 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rf1b4-0007Uu-0M
Subject: Re: [f2fs-dev] [PATCH 2/4] f2fs: fix to don't call
 f2fs_stop_checkpoint in spinlock coverage
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/22, Chao Yu wrote:
> f2fs_stop_checkpoint(, false) is complex and it may sleep, so we should
> move it outside segmap_lock spinlock coverage in get_new_segment().

Chao, I merged this patch into

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev-test&id=f3b576d209983b5d6e1cb130bfc8ca1f0bbcad6d

> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/segment.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index d0209ea77dd2..8edc42071e6f 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2646,6 +2646,7 @@ static void get_new_segment(struct f2fs_sb_info *sbi,
>  	unsigned int old_zoneno = GET_ZONE_FROM_SEG(sbi, *newseg);
>  	bool init = true;
>  	int i;
> +	int ret = 0;
>  
>  	spin_lock(&free_i->segmap_lock);
>  
> @@ -2671,9 +2672,8 @@ static void get_new_segment(struct f2fs_sb_info *sbi,
>  		secno = find_first_zero_bit(free_i->free_secmap,
>  							MAIN_SECS(sbi));
>  		if (secno >= MAIN_SECS(sbi)) {
> -			f2fs_stop_checkpoint(sbi, false,
> -				STOP_CP_REASON_NO_SEGMENT);
> -			f2fs_bug_on(sbi, 1);
> +			ret = -ENOSPC;
> +			goto out_unlock;
>  		}
>  	}
>  	segno = GET_SEG_FROM_SEC(sbi, secno);
> @@ -2704,7 +2704,13 @@ static void get_new_segment(struct f2fs_sb_info *sbi,
>  	f2fs_bug_on(sbi, test_bit(segno, free_i->free_segmap));
>  	__set_inuse(sbi, segno);
>  	*newseg = segno;
> +out_unlock:
>  	spin_unlock(&free_i->segmap_lock);
> +
> +	if (ret) {
> +		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_NO_SEGMENT);
> +		f2fs_bug_on(sbi, 1);
> +	}
>  }
>  
>  static void reset_curseg(struct f2fs_sb_info *sbi, int type, int modified)
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
