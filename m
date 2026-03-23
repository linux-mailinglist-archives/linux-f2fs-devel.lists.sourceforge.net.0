Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOShHToYwWn5QQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 11:38:50 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D07C2F0525
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 11:38:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojMEYr4Ljqmc9bcMFDzHTPbtllMemxert74ZBndarnw=; b=Kkr3Pc/OuTIyWRlmKJ3M4JQUo4
	xFBHLNoEsMerXUREtmgxrxnyLAPYVNF0kdB1wVYAM0VVSuLoixzEqhRkqZ41sdX2kifgE/QPyOq92
	ROtpSD5v/bj52xOLZM9SldQN35wa6hBSlCnoo956XwoHbfmx3QReLc1uxKnmjhqFofKk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4cg6-000622-MA;
	Mon, 23 Mar 2026 10:38:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1w4cg4-00061u-Ss
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 10:38:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M9Q5YwhMzpkzLLVnKmwixlzrqrgzgzGnIKjosupGbMM=; b=E7MzwFWlHVq+s0BJ0kPlYNje7L
 NvjMVvCwZWPaUe1RewR3RDJEY2nm0q5i9EfSRxkyikMkJqDyS1QeM/ZU/wEREsI+S1QBQkrByV+4X
 lpqyp4GZtk8ZdeSdXpK3isQLZmWxjmxaQGuz7LFlb6VI8j+5dfakjrPRombrCIYnEhOk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M9Q5YwhMzpkzLLVnKmwixlzrqrgzgzGnIKjosupGbMM=; b=CjI8XtUqVo8GDMFGUCOfYLGv4g
 lnssO7WarXwxgUCfYr8q6JjN6JNL0wNrCuxiwU2VOmyMK45qRjFs3/BYRVhimeBbstqIDcK5ryD8t
 y8IcvooN1GXVni1X05z9FjZY4UqLW72c6FYilkFjJbTDfODHxiFR1vy27j+lP5JsikWk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w4cg4-0004OB-71 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 10:38:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9BAEC60051;
 Mon, 23 Mar 2026 10:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0445CC4CEF7;
 Mon, 23 Mar 2026 10:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1774262301;
 bh=OanLvAzLoCtPPwv/8OlJP1MxN0NnhKqnCNID1B3gcys=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BpYRntfFwZ8AbRLRrnqSzcxUvNUHCDu5yqy5DhRiR1DtAGvwwI25l3vKod27xYyOG
 6Ul07wr37Qdmf70eRoHlqVzr2t53aE/YVTzSZI2BYUR12mcqhybQhC/yHfc3zQlXhD
 F9TFTGkLFhaZ6qbSb6naAZsHCfb3dWDspn7BL7jY=
Date: Mon, 23 Mar 2026 11:38:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: George Saad <geoo115@gmail.com>
Message-ID: <2026032346-vanquish-ion-a604@gregkh>
References: <2026032354-country-saddlebag-5331@gregkh>
 <20260323093828.763205-1-geoo115@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260323093828.763205-1-geoo115@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 23, 2026 at 09:38:28AM +0000, George Saad wrote:
 > In f2fs_compress_write_end_io(), dec_page_count(sbi, type) at line 1492
 > can bring the F2FS_WB_CP_DATA counter to zero, unblocking > f2f [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w4cg4-0004OB-71
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix use-after-free of sbi in
 f2fs_compress_write_end_io()
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [3.49 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:geoo115@gmail.com,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,linuxfoundation.org:s=korg];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,linuxfoundation.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 4D07C2F0525
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 09:38:28AM +0000, George Saad wrote:
> In f2fs_compress_write_end_io(), dec_page_count(sbi, type) at line 1492
> can bring the F2FS_WB_CP_DATA counter to zero, unblocking
> f2fs_wait_on_all_pages() in f2fs_put_super() on a concurrent unmount
> CPU. The unmount path then proceeds to call
> f2fs_destroy_page_array_cache(sbi) and kfree(sbi). Meanwhile, the bio
> completion callback is still executing: when it reaches
> page_array_free(sbi, ...), it dereferences sbi->page_array_slab_size
> and sbi->page_array_slab within the now-freed f2fs_sb_info structure.
> 
> This is the same class of bug as CVE-2026-23234 (which fixed the
> equivalent race in f2fs_write_end_io() in data.c), but in the
> compressed writeback completion path that was not covered by that fix.
> 
> Fix this by caching sbi->page_array_slab and sbi->page_array_slab_size
> into local variables at function entry, before dec_page_count(). At
> function entry, sbi is guaranteed valid because the F2FS_WB_CP_DATA
> counter is still nonzero (this invocation has not yet decremented it),
> preventing the unmount path from proceeding past
> f2fs_wait_on_all_pages(). The cached values are then used in place of
> the post-decrement sbi dereference.
> 
> Fixes: 4c8ff7095bef ("f2fs: support data compression")
> Signed-off-by: George Saad <geoo115@gmail.com>
> ---
>  fs/f2fs/compress.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 7b68bf229..c3d837df3 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1479,11 +1479,20 @@ void f2fs_compress_write_end_io(struct bio *bio, struct folio *folio)
>  {
>  	struct page *page = &folio->page;
>  	struct f2fs_sb_info *sbi = bio->bi_private;
> +	struct kmem_cache *pa_slab = sbi->page_array_slab;
> +	unsigned int pa_slab_size = sbi->page_array_slab_size;
>  	struct compress_io_ctx *cic = folio->private;
>  	enum count_type type = WB_DATA_TYPE(folio,
>  				f2fs_is_compressed_page(folio));
>  	int i;
>  
> +	/*
> +	 * Cache sbi fields before dec_page_count(), which may unblock
> +	 * f2fs_wait_on_all_pages() in the unmount path, allowing
> +	 * f2fs_put_super() to free sbi.  At this point sbi is still
> +	 * valid because the F2FS_WB_CP_DATA counter is nonzero.
> +	 */
> +
>  	if (unlikely(bio->bi_status != BLK_STS_OK))
>  		mapping_set_error(cic->inode->i_mapping, -EIO);
>  
> @@ -1500,7 +1509,10 @@ void f2fs_compress_write_end_io(struct bio *bio, struct folio *folio)
>  		end_page_writeback(cic->rpages[i]);
>  	}
>  
> -	page_array_free(sbi, cic->rpages, cic->nr_rpages);
> +	if (likely(sizeof(struct page *) * cic->nr_rpages <= pa_slab_size))
> +		kmem_cache_free(pa_slab, cic->rpages);
> +	else
> +		kfree(cic->rpages);
>  	kmem_cache_free(cic_entry_slab, cic);
>  }
>  
> -- 
> 2.53.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
