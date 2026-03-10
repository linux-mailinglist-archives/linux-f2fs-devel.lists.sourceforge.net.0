Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UB9PKAsusGlHgwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 15:43:23 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA472524D5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 15:43:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCgjUTY7vT1S63Jq4plNBBOrDBd+vZ8vvktIFkLKlGM=; b=Z5DZ0EaXs4T84SYrR0Q0vwR6Ew
	QO+oOqUMTStGs+hFBl5VZqgN2tYWfu1ZWDpQoW6uiCclAN7G7OM7MnorfKNjovgHXxEjLoaURKFSX
	fSHT/cYy42t0/WAnj7UPTjJBV8Ha63KkpZk146/Is8AbPM/f/OVl9AanAY93d0paIF/M=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzyIh-0003M6-NO;
	Tue, 10 Mar 2026 14:43:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1vzyIg-0003Ly-EH
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 14:43:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BMpkjIBAlArWoSNA1cagHtqrYddD4BAtLIKx0zMiI/c=; b=U6Rumld78x67+R9s3eT8aEWtex
 SJLe+gqAKE6TUqAJ/drrCa6qdu5KEtYoogvPtE3x0BgYrEZDBxYhbECtDxYJXISUj9Yhg0j3uD8tz
 QVN294I7UUGzMHVP3H1RKEC4LBN2eburvbbFNDKd0Ks9q0OLYO1B4pvHOdlMpML/ejrM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BMpkjIBAlArWoSNA1cagHtqrYddD4BAtLIKx0zMiI/c=; b=IrV6qehnUawGSX81mmhHDEoZTr
 AMT1JhqV3Or6fRfIrqIugKYb2vgL1P+9cGFE7Td7AM+DqQA9irApD1arSGl7LRrYuoY5YcG0DEm7l
 X3uPEG7hqH9MESy4gyOeYvge0YzOhyXeh5ncWgWMLfHw1GbGcXR3UO+oijiJiDa9CJyU=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzyIf-0001vH-VH for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 14:43:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773153778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BMpkjIBAlArWoSNA1cagHtqrYddD4BAtLIKx0zMiI/c=;
 b=Wu6auwHR35+CvewBNjz4Y2soT3YOiRe29xV2QAAMRWj9PiGDJlsxAAZaH5fGBHFNdl1IKR
 q9KQc53P0Rc8iySp3DxwSVVP9xiXv30K+31Z1DLJM2lUkC+6hjpO2ixSBua24aGGPWQ4ro
 qR2NWFS6iW3AxnmukJ3sK6SFcZqC1SE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-qbDJevreNdKnJ4033UYUiw-1; Tue, 10 Mar 2026 10:42:57 -0400
X-MC-Unique: qbDJevreNdKnJ4033UYUiw-1
X-Mimecast-MFC-AGG-ID: qbDJevreNdKnJ4033UYUiw_1773153776
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-b8f5bce308dso1148922066b.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Mar 2026 07:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773153776; x=1773758576;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BMpkjIBAlArWoSNA1cagHtqrYddD4BAtLIKx0zMiI/c=;
 b=gCtvNObGwQK8AfVMTUQk2fFKG7CR5JICQh7YRke7U2gR80Vd0CIGOun09DA19b/anf
 UYwQRd57c4ZNcBmuZvyrCR3SrkYem2gGzgKZ21yUI801mnfqBb3/+Q4cwFhMSH+SPRVa
 azw2JxJP1DybI61e+1hiSM7i+MMNkRA3LBK8UFCtlntEZBR2pLAPFuv8TWfR+vJhxMcp
 dfF+tuxaKx/Jbupaz7Oa9hUwx6ah5noGgItZb4UcbKSBnTRVwuKZn72lSKRBJpulLQOr
 Fb9kCUVfuui2y5TB8OTUkpPzCOjfGdj7fuv7eEZ976Ij/vQw2+xu5IQrT5SpMDf7AWLs
 NHpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQ0nOuu9Cverc+i6nSyfban+9qhQfm+PHgiz0zPHCfl6Notffl3MAEi6jQjP6/4K0K3AXrAtuh0Y/00FpbeTvS@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwYxAZgHZQznJv7T/4qVxJRRgZr5lmiIWo8iv33HcNNeuTgD6Sn
 cp4KiyyHRBSfH1HwONsH2Qb6X1qfNm+nvlX3xRhJDMA/7aYjNkyWLDui9WC2K4kNlV3NnBGM2Sk
 KBZ9QSuQi3gcpQiKA7j0b6GgNxL46jEtP1A63Fiuw22DeGqFrS/gk7+Zi4FxfskW5F/ex063raq
 6ZZw==
X-Gm-Gg: ATEYQzwBGz7N3w+/Brr+qQWAGFtH60MHDcNEDSW/EmmqGlVSPiStv2itQ8CVERzJJdF
 mdwmn5yM7QB1bOzt1clC4mk7Iobei5HZzWvVZoqwLoGAWqSP5mJCOZk/S0xD0ZXX8xQ80UzrkDQ
 pp8P3wkvuJ1KE10JiCkWHAHPJpDy3OV33IjspagrcVBDpUA27MBYvf+u2E0v0fiF9HgSsqdxeYR
 r/2+MNdJtnAA9Tx6FtR2NAuwUeYE6dberpQQlXHl27M/aiqFOggi7iz045z74W/rawJuAXnmMOC
 ABHGN1BDF5weakEceGBUYpxLzsxDU2+h8/nS34AGbxzNNf0yK9q/j7VmrpLucl6guvyAfj6B2BR
 qp+7qAFPiHrE=
X-Received: by 2002:a17:907:98d:b0:b93:edc0:e2e8 with SMTP id
 a640c23a62f3a-b942e02c34cmr869671266b.48.1773153776095; 
 Tue, 10 Mar 2026 07:42:56 -0700 (PDT)
X-Received: by 2002:a17:907:98d:b0:b93:edc0:e2e8 with SMTP id
 a640c23a62f3a-b942e02c34cmr869668766b.48.1773153775426; 
 Tue, 10 Mar 2026 07:42:55 -0700 (PDT)
Received: from thinky ([217.30.74.39]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b94dad4271esm420956866b.32.2026.03.10.07.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 07:42:55 -0700 (PDT)
Date: Tue, 10 Mar 2026 15:42:54 +0100
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <usl6wrms76zioxpq7xqzo26plpvw642pqrb2zxe4nysnmipm2o@ntl5ml3okjyq>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-11-aalbersh@kernel.org>
 <20260310010502.GB1105363@frogsfrogsfrogs>
MIME-Version: 1.0
In-Reply-To: <20260310010502.GB1105363@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ayoc7XVLg8PdwfvWa3l4dE8X9E68xFaK9e90lHFa9rg_1773153776
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-03-09 18:05:02, Darrick J. Wong wrote: > > + /* >
 > + * Handling of fsverity "holes". We hit this for two case: > > + * 1. No
 need to go further, the hole after fsverity > > + * descriptor is [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vzyIf-0001vH-VH
Subject: Re: [f2fs-dev] [PATCH v4 10/25] iomap: teach iomap to handle
 fsverity holes and verify data holes
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
From: Andrey Albershteyn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org,
 Andrey Albershteyn <aalbersh@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: BEA472524D5
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
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,redhat.com:s=mimecast20190719];
	FORGED_RECIPIENTS(0.00)[m:djwong@kernel.org,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,redhat.com:-];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[aalbersh@redhat.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

On 2026-03-09 18:05:02, Darrick J. Wong wrote:
> > +		/*
> > +		 * Handling of fsverity "holes". We hit this for two case:
> > +		 *   1. No need to go further, the hole after fsverity
> > +		 *	descriptor is the end of the fsverity metadata.
> > +		 *
> > +		 *   2. This folio contains merkle tree blocks which need to be
> > +		 *	synthesized. If we already have fsverity info (ctx->vi)
> > +		 *	synthesize these blocks.
> > +		 */
> > +		if ((iomap->flags & IOMAP_F_FSVERITY) &&
> > +		    iomap->type == IOMAP_HOLE) {
> > +			/*
> > +			 * Don't cause lookup if we already have fsverity
> > +			 * context from the previous tree hole
> > +			 */
> > +			if (!ctx->vi)
> > +				ctx->vi = fsverity_get_info(iter->inode);
> > +			if (ctx->vi)
> 
> Is it an error if ctx->vi isn't set here? 

no

> We won't fill the folio
> with the zerohash, but we'll set uptodate anyway...
> 
> > +				fsverity_folio_zero_hash(folio, poff, plen,
> > +							 ctx->vi);
> > +			iomap_set_range_uptodate(folio, poff, plen);
> 
> ...though I suppose it's the case that the uninitialized folio contents
> will most likely cause fsverity to report data corruption so at least
> it's obvious.
> 
> OTOH it does seem a little strange to set uptodate having not
> initialized the folio contents.

This the first case described in the comment above:

+		 * Handling of fsverity "holes". We hit this for two case:
+		 *   1. No need to go further, the hole after fsverity
+		 *	descriptor is the end of the fsverity metadata.

fsverity will not read this part of the folio. I think this can be
zeroed, but I don't really see the point to do so as no one will
read it and we use this folio once, for reading the descriptor.

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
