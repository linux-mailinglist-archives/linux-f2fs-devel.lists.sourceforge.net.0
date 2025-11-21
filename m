Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AAEC773DF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Nov 2025 05:22:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zX7N45HXoPgUHiLO+ROJeUNdOs8tkElb6D2OQgSUGHg=; b=Q7XYaqSefFozdkPYoYLzr8G5gM
	GRxCbT3NX9ZNPWJgzwP5jJgd/cvKcO9mhNDD8q9hT76/NklRU0bBrD/h/9vMaBcOr9YYrN7cgpuC6
	IXbdNfKpv4zlrsx09wVFrUsxH9V68j/mk0UKlZSSuJlTi5RP4GqCRbJxYcahXaZXnYBs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMIfS-0005rR-Dt;
	Fri, 21 Nov 2025 04:22:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1vMIfR-0005rL-9K
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 04:22:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RtfILe7M/y6h7GRu89gildDYXQDPaHfJbR7EMAPvGEs=; b=dClLYrwLp4h6bHHVrfy959orUq
 w+yy53CS8QD6uDyylxFSBBx3ybcX1vH5NrKhNRcH2FPGsjPlPix9J09RJrbiLtlEcWpKYTh9f8y3Y
 qCpN1RexqRmORF/5ThE2hU3OH1maBhSaU2F/ULOST8MWtsLWMH/rc62QzR4yWRabFodk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RtfILe7M/y6h7GRu89gildDYXQDPaHfJbR7EMAPvGEs=; b=bz+Jv+dUsFi0whQBvSvxoiU1TM
 i1yDU/s6OE5Mih2061nZGr9YMnVWVAYEB9VN4FgKe2Dijfa/lcVu5mlrLNh1H+MtdKCDYFMCaVnFc
 X73ZgnWuaWT+H6MTHHSZFodgskRMzPK9NfCWUN7PPBPtIM9gH8eB9tH5d88VkCtCsQ3g=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMIfQ-000778-Ce for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 04:22:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=RtfILe7M/y6h7GRu89gildDYXQDPaHfJbR7EMAPvGEs=; b=pbszIUkGt5QpYpTvCpY2eKLc4q
 yqwvzPN3e8ia319WGovFqgv4VQQ8uv+yhj8upvHyeJBOfNCOrCVn/PySR1Sy1K4rlF0ciX6oOJaUK
 KQD5wgVFNbiMEzQ2LhKEp2ApuATlSwBSS1udIeh3cznVp1eQiUdy0YCNPXFTKFLHIW4xpPtP/In53
 FHBeZDYSbCfuWyzdIOviPiREzOqo/0QkN2tWft9Bzp0LfXQF8Gsbglbd00KfXYk290vj1ZAXJEWJU
 4WDX+l4uOnUAwJH3MMHJt9GpPfrKE4J/Bazd4EVhxPpBtNzdwwqiOSt8f0Xhk2Vrb+Yykxz/aqN10
 5PWr139w==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vMIfI-00000002IJw-2Iwl;
 Fri, 21 Nov 2025 04:22:32 +0000
Date: Fri, 21 Nov 2025 04:22:32 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <aR_pCGtcc7ASeA77@casper.infradead.org>
References: <20251121032718.1993528-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251121032718.1993528-1-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Nov 21, 2025 at 03:27:18AM +0000, Jaegeuk Kim wrote:
 > This patch introduces a new POSIX_FADV_MLOCK which 1) invalidates the range
 of > cached pages, 2) sets the mapping as inaccessible, 3) PO [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vMIfQ-000778-Ce
Subject: Re: [f2fs-dev] [PATCH] [RFC] mm/fadvise: introduce POSIX_FADV_MLOCK
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
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Nov 21, 2025 at 03:27:18AM +0000, Jaegeuk Kim wrote:
> This patch introduces a new POSIX_FADV_MLOCK which 1) invalidates the range of
> cached pages, 2) sets the mapping as inaccessible, 3) POSIX_FADV_WILLNEED loads
> pages directly to the inaccessible mapping.

... what?

This seems like something which is completely different from mlock().
So it needs a different name.

But I don't understand the point of this, whatever it's called.  Need
more information.

> The inaccessible pages will be invalidated by evict_inode or explicit munlock().
> 
> Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> Cc: Christian Brauner <brauner@kernel.org>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  include/uapi/linux/fadvise.h |  2 ++
>  mm/fadvise.c                 | 14 ++++++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/include/uapi/linux/fadvise.h b/include/uapi/linux/fadvise.h
> index 0862b87434c2..06018688b99b 100644
> --- a/include/uapi/linux/fadvise.h
> +++ b/include/uapi/linux/fadvise.h
> @@ -19,4 +19,6 @@
>  #define POSIX_FADV_NOREUSE	5 /* Data will be accessed once.  */
>  #endif
>  
> +#define POSIX_FADV_MLOCK	8 /* Load pages into inaccessible map.  */
> +
>  #endif	/* FADVISE_H_INCLUDED */
> diff --git a/mm/fadvise.c b/mm/fadvise.c
> index 588fe76c5a14..849b151d2024 100644
> --- a/mm/fadvise.c
> +++ b/mm/fadvise.c
> @@ -56,6 +56,7 @@ int generic_fadvise(struct file *file, loff_t offset, loff_t len, int advice)
>  		case POSIX_FADV_WILLNEED:
>  		case POSIX_FADV_NOREUSE:
>  		case POSIX_FADV_DONTNEED:
> +		case POSIX_FADV_MLOCK:
>  			/* no bad return value, but ignore advice */
>  			break;
>  		default:
> @@ -93,6 +94,19 @@ int generic_fadvise(struct file *file, loff_t offset, loff_t len, int advice)
>  		file->f_mode &= ~FMODE_RANDOM;
>  		spin_unlock(&file->f_lock);
>  		break;
> +	case POSIX_FADV_MLOCK:
> +		/* Remove the cached pages. */
> +		if (!mapping_unevictable(mapping)) {
> +			invalidate_inode_pages2_range(mapping,
> +					offset >> PAGE_SHIFT,
> +					(offset + len - 1) >> PAGE_SHIFT);
> +
> +			/* set the mapping is unevictable */
> +			filemap_invalidate_lock(mapping);
> +			mapping_set_inaccessible(mapping);
> +			filemap_invalidate_unlock(mapping);
> +		}
> +		fallthrough;
>  	case POSIX_FADV_WILLNEED:
>  		/* First and last PARTIAL page! */
>  		start_index = offset >> PAGE_SHIFT;
> -- 
> 2.52.0.487.g5c8c507ade-goog
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
