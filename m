Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C978AB3C0D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 May 2025 17:27:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=baHgUy/Fm2C21pYxOy2g6DA6C8CG4j9n1FOAelSFvlQ=; b=FQ1wpIt12cr9vxSGyzhdujW0mZ
	VIDi1AJcThAnbfb/bOaiv7624TmCC0w8jNmXRGACjhr69lmiLZ6goP8qzXsTiQliKLqLIqzboLRoI
	Ep7fxNH+uyFwBJHVf/TFa9MV2+hj8nq+vu4IHNd0OsSjYrcs78OEqZ6ESAqQVe30YM/g=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEV3q-0002m5-UG;
	Mon, 12 May 2025 15:27:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uEV3p-0002lt-Gz
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 15:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=clXgqY6LG38+ty9Ld5e8w0GjJ7NFJiLwoD6+8f6rqns=; b=dFjBLmyClCbhhE4L3nqTvt2juH
 dHz8NnConwcMS3CSEW3aDE7ZtJBY2cy2zyr1IGeUcX67GXlwFLg8Fs7G4md53ARaai9PhsAOFz9OG
 ncvCK2z4WwasnAkqbZGrzSWp1gs6KpA77Dpoxusr6w9oi1T1d4f07N0VpCbUpq36s1JI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=clXgqY6LG38+ty9Ld5e8w0GjJ7NFJiLwoD6+8f6rqns=; b=LQYoeCZ/5dnPXKy716E8c+L9Vc
 KTTsy35NZWH1tiCDr9T29mI+62ZTOq79t6AwoJTzNRmd0FyV933X+CjrbP6vQK1ojwusdLY1KIarm
 CjUbbw792YSPXsq3Le5saKs3vHduZXUPqOEU6gC7fmiCIESTPgMxLvZktBWUVIvIJsOw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uEV3o-0001a9-Qe for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 15:27:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 23A6E629D0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 May 2025 15:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC177C4CEE7;
 Mon, 12 May 2025 15:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747063629;
 bh=R1srgJZKiVKfqoiHkN2fnKJzVCfbE1bdF6q6xYCtsyI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KMZVXZ4aQIytHkvaKeT0brW0iZxzznXFdO7CHRHBWHzAA2FEsosRJRcZki7B+NVH2
 cwIjylxq4F6Xrk3QDR2e8aOdiANknoWCR1LbbIP9EPCh3RxofKRSUTCHgmPwP/2P4m
 LDX1xQrN1UGqilYJJ/6KmD4GqVhvTfV2AtHn+gb4ce0SCrl47ga9bTukIuek7+/Xt6
 bUgFdTFa521ICv3GfbYys5hmjhl6EJx9134nB0DkYBvA3GanUFEoxKX/f6fIv4BNJk
 man5047KgW+3eDNuVXJAnMoSp7YRrjNB9OpKcMP4wnlMVICfruegexChJTAVXRA2eZ
 GlUJto5X+mMFg==
Date: Mon, 12 May 2025 15:27:08 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <aCITTEkOYqZdYTy1@google.com>
References: <20250512115442.2640895-1-chao@kernel.org>
 <20250512115442.2640895-2-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250512115442.2640895-2-chao@kernel.org>
X-Spam-Score: -1.7 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/12,
 Chao Yu wrote: > mapping_read_folio_gfp() will return
 a folio, it should always be > uptodate, let's check folio uptodate status
 to detect any potenial > bug. If it's supposed to be uptodate, can you add
 f2fs_bug_on() only? 
 Content analysis details:   (-1.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uEV3o-0001a9-Qe
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: add f2fs_bug_on() in
 f2fs_quota_read()
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/12, Chao Yu wrote:
> mapping_read_folio_gfp() will return a folio, it should always be
> uptodate, let's check folio uptodate status to detect any potenial
> bug.

If it's supposed to be uptodate, can you add f2fs_bug_on() only?

> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/super.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 0ee783224953..ea207a9edc10 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2973,6 +2973,17 @@ static ssize_t f2fs_quota_read(struct super_block *sb, int type, char *data,
>  			goto repeat;
>  		}
>  
> +		/*
> +		 * should never happen, just leave f2fs_bug_on() here to catch
> +		 * any potential bug.
> +		 */
> +		if (unlikely(!folio_test_uptodate(folio))) {
> +			f2fs_folio_put(folio, true);
> +			set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
> +			f2fs_bug_on(F2FS_SB(sb), 1);
> +			return -EIO;
> +		}
> +
>  		memcpy_from_folio(data, folio, offset, tocopy);
>  		f2fs_folio_put(folio, true);
>  
> -- 
> 2.49.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
