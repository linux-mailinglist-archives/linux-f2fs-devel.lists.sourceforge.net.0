Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C289543849
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jun 2022 18:03:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nyy95-0003BT-JV; Wed, 08 Jun 2022 16:03:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>) id 1nyy94-0003BM-Ml
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jun 2022 16:02:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JYL5LzwJMvkTknN2K06oEaqVJPOmxsFkjiVJNTycVrw=; b=DxpDU//6QWZT9cFtl3GykoUTBr
 nRmKFNaxB4eJQPPPXVLmptgYJJV18vrlMz+f/4+m6K5U6pgVcJo6PXD/Cdfj+/FAPrSGxvrnCkOjk
 fXahM+/Vo2sv2s7fht9Qch4Rc6K6nXVuet7iqtQFr20DBngMeXK4vlhaPB511Upo6HFs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JYL5LzwJMvkTknN2K06oEaqVJPOmxsFkjiVJNTycVrw=; b=VMRf6yU/VdNkzwuArYnvBD+XkT
 spC/APJjVc/UfkO8Xp/h5ZC2JYVn+904GztebRkojPGPKa1PTXstGsy4dP4/ENb5RkPkkPPgq5tAc
 Y79KxIFj3vtqc19x+X0tnezTcBDUO9iFeeIvZB8CLTp/ZzcAAVKpquKoggJim5RBi4Xs=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nyy92-00009P-Ua
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jun 2022 16:02:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=JYL5LzwJMvkTknN2K06oEaqVJPOmxsFkjiVJNTycVrw=; b=X+I1FhaXH6WS4+ZGaHmjXumtnF
 hSMv1wP/ojs80wam+20Lk7FXy18+7BcczL5HefwpYesKkTphZ1xvan83qkGvXvbh1X1hcfU4CYk+3
 a8IhuvNpYCyrYbi/279R8dZs9dPVbn7b0rkDGr1JfKpud+bH/f/7KCuDr0VrxNhUfV1UdTGe/Exrp
 bdjE400FzSvqmUVCnGHFO59IlhUWLZPlD33Eh4sWfaa45ILPYlUY7CwO2mDsrpL1ilaXKfGB/Kt0I
 tAKJeNKT5w2M4QSVh/EDJ92w5JF6VHLuksFN5sICMhG7SlEO5/KMmexF9zTbYI2fuNTkUefBjh9O4
 45XHM6Bw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyy8m-00CmAT-Km; Wed, 08 Jun 2022 16:02:40 +0000
Date: Wed, 8 Jun 2022 17:02:40 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YqDIIH2d7iu1o7D0@casper.infradead.org>
References: <20220605193854.2371230-1-willy@infradead.org>
 <20220605193854.2371230-4-willy@infradead.org>
 <YqBXjjkRZsP8K8fO@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YqBXjjkRZsP8K8fO@infradead.org>
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 08, 2022 at 01:02:22AM -0700, Christoph Hellwig
 wrote: > On Sun, Jun 05, 2022 at 08:38:47PM +0100, Matthew Wilcox (Oracle)
 wrote: > > If the folio is large, it may overlap the beginning or [...] 
 Content analysis details:   (2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nyy92-00009P-Ua
Subject: Re: [f2fs-dev] [PATCH 03/10] ext4: Convert
 mpage_release_unused_pages() to use filemap_get_folios()
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
Cc: linux-nilfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 08, 2022 at 01:02:22AM -0700, Christoph Hellwig wrote:
> On Sun, Jun 05, 2022 at 08:38:47PM +0100, Matthew Wilcox (Oracle) wrote:
> > If the folio is large, it may overlap the beginning or end of the
> > unused range.  If it does, we need to avoid invalidating it.
> 
> It's never going to be larger for ext4, is it?  But either way,
> those precautions looks fine.

I don't want to say "never".  Today, it's not, but if ext4 ever does
gain support for large folios, then this is a precaution it will need
to take.  I'm trying not to leave traps when I do conversions.

> Reviewed-by: Christoph Hellwig <hch@lst.de>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
