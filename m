Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACBF9004FB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Jun 2024 15:33:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sFZiX-0001Wv-9x;
	Fri, 07 Jun 2024 13:33:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1sFZiV-0001Wo-ST
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 13:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PcY+IMjQpk0PL4/bmmieIepic/SgBBF32UMJe2Qyub0=; b=CjfMeeQ1XaWlRIW4jQ+jBdzCyF
 PQiE27NhritcrzyKfCH/TZflh/MSpUvAtQFL36XT07EPV0Qf78ER2oA21EHeifXYZqg9/hT7YSrCT
 fVEqSnihjnFd/SySkgZIeY74FyiciqmbUFfIbfxkve4kSYhkaTtY/+umX+KwyvcTn/js=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PcY+IMjQpk0PL4/bmmieIepic/SgBBF32UMJe2Qyub0=; b=IbpglvAVSX7Mn1tKmNzZG9OS0q
 FdT533XTYIP1Q61HROWMlFGpiYKkgP01FMcx6x3wi3X4wFhOL8i7c3s2V058adscRq7dHg1AfNoBn
 ToS0Et6H4XPW6Hqd5MDhKnWO+Ypm02CdzSxbl/G20mQ8loIfL8LomTyIp3BpV5Gw/IX0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sFZiW-00061s-CH for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 13:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=PcY+IMjQpk0PL4/bmmieIepic/SgBBF32UMJe2Qyub0=; b=KJHFk5Yl2xkpDxC6WonNt/UB7P
 +qlM+bli9bb3xGiCC8qffan2T7bDtw9DgUbGWU5Hz84acTNc0GCBbmQSCmtjEVvWcNDSY24fzSOre
 hgD/aFQJ6iAMGFT7JuGAXaS/zz3yiE4AsNdbtJ25bR9foaWNbeMlXtRTCXb/qfFwJIvdLP7gIFI+n
 R2xAyncyOpK/515eFn97bWb+vYQGafbVNACL5Rvr+6NCV1hVuwIg/DqUGzWmLmFweaGm5XQx73rR0
 u+rnLsty4M7KIsTs4TrdL/4kq6+3MSBS+JNEor2XuHS7BLFOTqthUJPowoVUBokchD6HlJu49musL
 0Z76zymw==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sFZiJ-00000006HUe-3L41;
 Fri, 07 Jun 2024 13:33:03 +0000
Date: Fri, 7 Jun 2024 14:33:03 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZmMMDy9eeCU2igqj@casper.infradead.org>
References: <20240607101829.389015-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607101829.389015-1-chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jun 07, 2024 at 06:18:29PM +0800, Chao Yu wrote: >
 @@ -1990, 6 +1989,
 12 @@ static inline struct f2fs_super_block *F2FS_RAW_SUPER(struct
 f2fs_sb_info *sbi) > return (struct f2fs_super_block *)(s [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-trusted.bondedsender.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sFZiW-00061s-CH
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: get rid of buffer_head use
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jun 07, 2024 at 06:18:29PM +0800, Chao Yu wrote:
> @@ -1990,6 +1989,12 @@ static inline struct f2fs_super_block *F2FS_RAW_SUPER(struct f2fs_sb_info *sbi)
>  	return (struct f2fs_super_block *)(sbi->raw_super);
>  }
>  
> +static inline struct f2fs_super_block *F2FS_SUPER_BLOCK(struct folio *folio)
> +{
> +	return (struct f2fs_super_block *)(page_address(folio_page(folio, 0)) +
> +							F2FS_SUPER_OFFSET);
> +}

This assumes that the superblock is in the first page of the folio.
That's not necessarily guaranteed; let's say you have a 64KiB folio
that covers the start of the bdev.

I don't quite know how to write this because f2fs defines its block size
in terms of PAGE_SIZE, which just seems like nonsense to me.  If you
format a filesystem on a 16KiB PAGE_SIZE machine and then try to mount
it on a machine with a 4KiB PAGE_SIZE, it's going to go horribly wrong.

You'd need to pass in something that indicates whether you're trying to
access the first or second superblock; there's no way to tell from the
folio which one it is.

> +static int __f2fs_commit_super(struct f2fs_sb_info *sbi, struct folio *folio,
> +								bool update)
>  {
> -	lock_buffer(bh);
> -	if (super)
> -		memcpy(bh->b_data + F2FS_SUPER_OFFSET, super, sizeof(*super));
> -	set_buffer_dirty(bh);
> -	unlock_buffer(bh);
> -
> +	struct bio *bio;
>  	/* it's rare case, we can do fua all the time */
> -	return __sync_dirty_buffer(bh, REQ_SYNC | REQ_PREFLUSH | REQ_FUA);
> +	blk_opf_t opf = REQ_OP_WRITE | REQ_SYNC | REQ_PREFLUSH | REQ_FUA;
> +	int ret;
> +
> +	folio_lock(folio);
> +	folio_wait_writeback(folio);
> +	if (update)
> +		memcpy(F2FS_SUPER_BLOCK(folio), F2FS_RAW_SUPER(sbi),
> +					sizeof(struct f2fs_super_block));
> +	folio_mark_dirty(folio);
> +	folio_clear_dirty_for_io(folio);
> +	folio_start_writeback(folio);
> +	folio_unlock(folio);
> +
> +	bio = bio_alloc(sbi->sb->s_bdev, 1, opf, GFP_NOFS);
> +
> +	/* it doesn't need to set crypto context for superblock update */
> +	bio->bi_iter.bi_sector = SECTOR_FROM_BLOCK(folio_index(folio));
> +
> +	if (!bio_add_folio(bio, folio, PAGE_SIZE, 0))
> +		f2fs_bug_on(sbi, 1);

Better make that folio_size(folio) to support bs>PS.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
