Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E6E2ADE8A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Nov 2020 19:40:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kcYZY-0008BW-Gp; Tue, 10 Nov 2020 18:40:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+e3870800156799924f84+6288+infradead.org+hch@casper.srs.infradead.org>)
 id 1kcYZS-0008AM-9L; Tue, 10 Nov 2020 18:40:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=79SE+AKjlqgBbqilhiLeZ8j33rMROxnpjj18eGnMGAA=; b=ODjEE0F81n7E8p2Jee1tT4lmyf
 oV/ZW34Q6cNW0mdCbnjFbjf6RHLwnUqI7xeBgBdOre5ngh7jrX/mb1h3Bnf0s2EC0PDDv2SAbBtxZ
 PyQXY3d6sQKM3hp/DkC57qHVWMtT9jsiR76vN9mR9Yf1ZCxKaATLlYJvuv3s068Asz38=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=79SE+AKjlqgBbqilhiLeZ8j33rMROxnpjj18eGnMGAA=; b=VpovW2+WFc1uD+6muq82Fftbwh
 A5lUuTdvGxmeYvzVznKI2ugGar4XDVtAED2ox7oK9+wPOjlgrjqh8DPeyBOEa0EvjHHSQpVcsDh8z
 NZu6/TBvCHP5lyA0mSMylQUb7lv4T5wDJmRbgJ4eLLVwQ1hImxg/eWd91RVidXygmHJc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kcYZ2-00FpZc-1D; Tue, 10 Nov 2020 18:40:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=79SE+AKjlqgBbqilhiLeZ8j33rMROxnpjj18eGnMGAA=; b=C7gMd9SPM+bIdOdwPgkWo9RDoB
 6ZF3yngMrEjxVNvOcaTcQyUm3aCrbUU9x+EALS8F1IjHfoa+o4Bq6uMxBjbSaZtgfSl0pY/4hjbvY
 2/IxXVA3IqblqosgM8IlDlPBBI3Yzh//Tjg6dzXGk5pS2OSp5/9t9rHSy9ZsoSEn9F31iQbfHZ750
 lb5ioAP6tStztsmGYbr6Rf07Bhs4I3P30WpcJPT6h/sdUNxb2hNnkvJ5cUUhds4gP+tyHx0f0e1Kl
 xu2XqNFcm/G2iD0odGhWtuXGTmb+yn+FIxXQMQD/73xyXkYo3AebaX70Iqfvaxm1ZpZh3yQgQXxfk
 x24Igmxw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kcYYb-0002os-Hv; Tue, 10 Nov 2020 18:39:53 +0000
Date: Tue, 10 Nov 2020 18:39:53 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Chris Mason <clm@fb.com>
Message-ID: <20201110183953.GA10656@infradead.org>
References: <20201103060535.8460-1-nickrterrell@gmail.com>
 <20201103060535.8460-2-nickrterrell@gmail.com>
 <20201106183846.GA28005@infradead.org>
 <D9338FE4-1518-4C7B-8C23-DBDC542DAC35@fb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D9338FE4-1518-4C7B-8C23-DBDC542DAC35@fb.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1kcYZ2-00FpZc-1D
Subject: Re: [f2fs-dev] [PATCH v5 1/9] lib: zstd: Add zstd compatibility
 wrapper
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
Cc: squashfs-devel@lists.sourceforge.net,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Nick Terrell <nickrterrell@gmail.com>, Yann Collet <cyan@fb.com>,
 Petr Malat <oss@malat.biz>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 Nick Terrell <terrelln@fb.com>, linux-crypto@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kernel Team <Kernel-team@fb.com>, Niket Agarwal <niketa@fb.com>,
 linux-btrfs@vger.kernel.org, Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 09, 2020 at 02:01:41PM -0500, Chris Mason wrote:
> You do consistently ask for a shim layer, but you haven???t explained what
> we gain by diverging from the documented and tested API of the upstream zstd
> project.  It???s an important discussion given that we hope to regularly
> update the kernel side as they make improvements in zstd.

An API that looks like every other kernel API, and doesn't cause endless
amount of churn because someone decided they need a new API flavor of
the day.  Btw, I'm not asking for a shim layer - that was the compromise
we ended up with.

If zstd folks can't maintain a sane code base maybe we should just drop
this childish churning code base from the tree.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
