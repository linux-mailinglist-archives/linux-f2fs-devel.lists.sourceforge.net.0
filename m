Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 844B564E131
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Dec 2022 19:45:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p5tEh-0001Ty-E5;
	Thu, 15 Dec 2022 18:45:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1p5tES-0001TU-2q
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Dec 2022 18:45:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2f3RFg8lKPZEmxg/33DtgJz7ZsALqBstxpKP4BpvF/I=; b=eXDnmP/nsdWT74/PWOgHtwdEsr
 lrJsuDqdaHkMcuWGedqFrKeSakfLk3LZB/MVtC4TjQLZjSaCC24Ud26L36KmhFdgwypiuWSTAn1QE
 c536I6rKFzBy3BIjv8kYV8fn0dwMoAOVuAggztY13Q8QIuOeN6eM1blZcZbkuE6Ev5ec=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2f3RFg8lKPZEmxg/33DtgJz7ZsALqBstxpKP4BpvF/I=; b=e77qY72CqzjcVldZRCKcRq3X1/
 doHIN28+79StiniWVeu0wAmDseatAlNonYE7ucWXxZFIxO6HjpbNSdTeqfHvXXpNGsoZS0w5EJPYo
 AlLPdt8zE1fyhqFpA/rFakRAG0IhwwvO2mxjE1+QkPy9Z5/Qz9wL7mc5UWGUQXc+09yU=;
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p5tEQ-0000e0-Oi for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Dec 2022 18:45:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2f3RFg8lKPZEmxg/33DtgJz7ZsALqBstxpKP4BpvF/I=; b=qmWy52v5M1Cn1nsPjbLE5vPwki
 rauwwLIkT3RZ4l8uaifRy3cFnwWg/FJ0qrTlWwiG2l6ZyhDnHfedJCjngdVQqJ/DTGZ5tQRKJrFBv
 U3hFPfNGg5EWx7AmLYPg+X1dDEgGur5NyuHGFFb29shQ8BLcCmpJf2gYLsdCOj0UphiodCYqlxIqY
 VVpnqh6CfUAfhKt/G3eW5HqVc1Wn28TFt/Jxms44MKyzI/5ri+A4K5UhxzjL/M4V0MAokjJH+nR0Z
 0MphCPLU3nK9wyxTT5aY5yWu/dp/FFC+Y4yevD/QRKd10VebhMJjdMTpnLlmc8p0ybTxbNqUOQI0s
 mVh/Z0xQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p5tED-00EdoE-Pj; Thu, 15 Dec 2022 18:45:09 +0000
Date: Thu, 15 Dec 2022 18:45:09 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y5trNfldXrM4FIyU@casper.infradead.org>
References: <0a95ba7b-9335-ce03-0f47-5d9f4cce988f@kernel.org>
 <20221212191317.9730-1-vishal.moola@gmail.com>
 <6770f692-490e-34fc-46f8-4f65aa071f58@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6770f692-490e-34fc-46f8-4f65aa071f58@kernel.org>
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Dec 15, 2022 at 09:48:41AM +0800, Chao Yu wrote: >
 On 2022/12/13 3:13,
 Vishal Moola (Oracle) wrote: > > +add_more: > > + pages[nr_pages]
 = folio_page(folio,idx); > > + folio_ref_inc(folio); > [...] 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1p5tEQ-0000e0-Oi
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: Convert f2fs_write_cache_pages()
 to use filemap_get_folios_tag()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Dec 15, 2022 at 09:48:41AM +0800, Chao Yu wrote:
> On 2022/12/13 3:13, Vishal Moola (Oracle) wrote:
> > +add_more:
> > +			pages[nr_pages] = folio_page(folio,idx);
> > +			folio_ref_inc(folio);
> 
> It looks if CONFIG_LRU_GEN is not set, folio_ref_inc() does nothing. For those
> folios recorded in pages array, we need to call folio_get() here to add one more
> reference on each of them?

static inline void folio_get(struct folio *folio)
{
        VM_BUG_ON_FOLIO(folio_ref_zero_or_close_to_overflow(folio), folio);
        folio_ref_inc(folio);
}

That said, folio_ref_inct() is very much MM-internal and filesystems
should be using folio_get(), so please make that modification in the
next revision, Vishal.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
