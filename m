Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAkTAi3ukGltdwEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Feb 2026 22:50:37 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA4B13DABD
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Feb 2026 22:50:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9E47e1oXgGHfRKUu7W90WLebk+GhH7R28lncxRCGuA=; b=KJgxuMzRAjVa0zaFAqMDxHsNvP
	IaQYQ1NGLm0nnLxdfAsumMsqNtSva7FTR6K9iRfI8Iltr8dpQV1r8thmwFK9fXP2D/NfODQ2IcgcT
	sheQGCMxGxEgzy+/d11ggiDW9x0+dXmcdiJdUNPGbZMWi6aEbj1Dwo5pIsTrn0p7Gq3Y=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vrNX2-0005bk-3i;
	Sat, 14 Feb 2026 21:50:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vrNWv-0005bX-Jq
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Feb 2026 21:50:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xs5kRCBq4aBpkaJBjkZ+J6qHWYQI/jZ4Tf7wPcD/NjA=; b=iUH4ctpG+fqM0rvVSazqKybwH4
 PoOAJbEENS7+nw1o+lIpopnOEjv+Tvadln+svkA5kfnC9gj4yJD0yeNkjteK+XxaZgKEdi2I/WFyX
 afcpmufXjz53GPE/B+dpq0Rdceqt/MzWRA+DK2hgWhXNveTDdMfRnNcSEkQZsyKE2je4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xs5kRCBq4aBpkaJBjkZ+J6qHWYQI/jZ4Tf7wPcD/NjA=; b=Am34dRKXaGUxh0pNFNf0pNwWx4
 NwAffWusRGFxXv3HHXDq0wq5SbKMdkXtSkNcHdl8rh6SnrkrliKebngKbBkA7X6TA53eb8cY1to1w
 rjoy2zAA2VcFUCQ67dinq44noY59DlJLX3CsQAhnOhbEqNlCph3O+BprwanXqu7ueRHA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vrNWv-0005GS-0O for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Feb 2026 21:50:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ABCC240A92;
 Sat, 14 Feb 2026 21:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE25C16AAE;
 Sat, 14 Feb 2026 21:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771105810;
 bh=ByCxnIXhkyF8adSYpVRD9YFch315vVu5Im4dAbrrJq8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aIxIqnhKAaO+g3BCIpmUeJYgBci67fffn8afyPqxaFJcFDVB+H/Igiut73MylpdPa
 OdF5P9lvsZEEqUV54RLP+4xaSRrm4Qqf2B/HDAAcIKnDgEdC6HT7zLy7xMQLnHwqiR
 Y4Yk0jU+oF8LV6BLWOjtZfIOd4b6nLvYvuJiLOViHYgxWP3NvUFYHl6N7Dt7Ilpcfc
 ORAFgQwAB85553FBC0r2SQ40d3nWnW83pxKt09dx8FMbYYWUhKALJqFLGne8lTEEC5
 O/stAdrOWq2DVDmq4gNbxNITFDStIlQcFbz89v601w0jjpxidKR2aexfiHooD7ifXu
 Pyeb7rj8Lk4UQ==
Date: Sat, 14 Feb 2026 13:50:08 -0800
To: fsverity@lists.linux.dev
Message-ID: <20260214215008.GA15997@quark>
References: <20260214211830.15437-1-ebiggers@kernel.org>
 <20260214211830.15437-2-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260214211830.15437-2-ebiggers@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Feb 14, 2026 at 01:18:29PM -0800, Eric Biggers wrote:
 > Replace the only remaining caller of fsverity_verify_page() with a > direct
 call to fsverity_verify_blocks(). This will allow > fsverity [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vrNWv-0005GS-0O
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: use fsverity_verify_blocks()
 instead of fsverity_verify_page()
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fsverity@lists.linux.dev,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:torvalds@linux-foundation.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,linux-foundation.org:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org]
X-Rspamd-Queue-Id: 2CA4B13DABD
X-Rspamd-Action: no action

On Sat, Feb 14, 2026 at 01:18:29PM -0800, Eric Biggers wrote:
> Replace the only remaining caller of fsverity_verify_page() with a
> direct call to fsverity_verify_blocks().  This will allow
> fsverity_verify_page() to be removed.
> 
> Make it large-folio-aware by using the page's offset in the folio
> instead of 0, though the rest of f2fs_verify_cluster() and f2fs
> decompression as a whole still assumes small folios.
> 
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  fs/f2fs/compress.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 006a80acd1de..11c4de515f98 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1811,15 +1811,19 @@ static void f2fs_verify_cluster(struct work_struct *work)
>  	int i;
>  
>  	/* Verify, update, and unlock the decompressed pages. */
>  	for (i = 0; i < dic->cluster_size; i++) {
>  		struct page *rpage = dic->rpages[i];
> +		struct folio *rfolio;
> +		size_t offset;
>  
>  		if (!rpage)
>  			continue;
> +		rfolio = page_folio(rpage);
> +		offset = folio_page_idx(rfolio, rpage) * PAGE_SIZE;
>  
> -		if (fsverity_verify_page(dic->vi, rpage))
> +		if (fsverity_verify_blocks(dic->vi, rfolio, PAGE_SIZE, offset))
>  			SetPageUptodate(rpage);
>  		else
>  			ClearPageUptodate(rpage);
>  		unlock_page(rpage);

Let me know if you'd prefer that we verified the whole folio here
instead.  Either way, the behavior will be still incorrect if this
function is passed a large folio (which it's not).  Either we'd mark the
whole folio up-to-date after verifying only one page in it, or we'd
access pages that were not in the array of pages passed to the function.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
