Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1FB41B6EC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Sep 2021 21:08:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mVISr-0003TG-8m; Tue, 28 Sep 2021 19:08:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1mVISq-0003T7-Dd
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Sep 2021 19:08:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gwrgcAG6L2mKfMkvvNxOZ6Aix+kWpPT7+CFcHGZ+OII=; b=M1PKwFdK+7rDzDkiAJruAldjk7
 k1TXLEVRbVAG5BScBMjzZ1Zr/vR2Xun5wl7CdLTQA8jbmv0mcJwEbkGWZ5NOExRPAv+LSb18aHUuR
 1YQHLwNrz2pKBCSQPD5WoQ8ZhCqOoLFTNwunH+eF40U328MXBZE8Zw234vUv32/Mz2fc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gwrgcAG6L2mKfMkvvNxOZ6Aix+kWpPT7+CFcHGZ+OII=; b=H+NMbesgGwhA95Twlo/TyHW5kA
 PGzRG9SVpnkjDhjoSP5+HeoMqu2yWL1mrfN63aGwoBafURfHpyzdKTmSHmWA0TdjGcqKa4K4x89CY
 QPhBSGrpurMOBSkDLyJUpeyO9l25jH18Tk5E922vz1rNvHcm07TAopNflFtAQFKH+4xs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mVISo-00013d-7d
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Sep 2021 19:08:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D1A6A61209;
 Tue, 28 Sep 2021 19:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632856095;
 bh=fBHQNVYni7drO15VqxNgNsWT8o0vf2pPho5LYOalSRI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TnpH9gDVSVlXr0aZrYOoY3tVtnsZ1nVyg0JOOHTM9WoJ42V+Z87TT2zYROFgX7Nky
 izF1Uue4tgAx2q0ZiX/lBTl2Exqnfboptzkr9jSgKjnJ2AolissG/LAekzxyjXEbjW
 7deKIW9u2yhceCfxFyoMKyMYYSef1kYxm6qV3iHzevty4bRfh9U5Y3QEK2VimaT8UH
 W9ZLyiRY5DK1Jf60+hkXgl3WKB0DdoY4s5PTTSHorUZ2ycbn8Dv+UiOLPlBcg/x6Ym
 qups0fDbeEQwfR/8gjbpAUvCSeOhChmwRICo6Cl1FwwseQ8nZq9Mup/qIFPhdRDOEI
 cW6hNOKH2dGYA==
Date: Tue, 28 Sep 2021 12:08:14 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YVNoHudG5c65X85G@google.com>
References: <20210928151911.11189-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210928151911.11189-1-chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 09/28, Chao Yu wrote: > In f2fs_file_write_iter(), let's
 use f2fs_overwrite_io() to > check whethere it is overwrite case, for such
 case, we can skip > f2fs_preallocate_blocks() in order to avoid f [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mVISo-00013d-7d
Subject: Re: [f2fs-dev] [PATCH] f2fs: skip f2fs_preallocate_blocks() for
 overwrite case
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

On 09/28, Chao Yu wrote:
> In f2fs_file_write_iter(), let's use f2fs_overwrite_io() to
> check whethere it is overwrite case, for such case, we can skip
> f2fs_preallocate_blocks() in order to avoid f2fs_do_map_lock(),
> which may be blocked by checkpoint() potentially.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/file.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 13deae03df06..51fecb2f4db5 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4321,6 +4321,10 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		preallocated = true;
>  		target_size = iocb->ki_pos + iov_iter_count(from);
>  
> +		if (f2fs_overwrite_io(inode, iocb->ki_pos,
> +						iov_iter_count(from)))
> +			goto write;

This calls f2fs_map_blocks() which can be duplicate, if it's not the overwirte
case. Do we have other benefit?

> +
>  		err = f2fs_preallocate_blocks(iocb, from);
>  		if (err) {
>  out_err:
> -- 
> 2.32.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
