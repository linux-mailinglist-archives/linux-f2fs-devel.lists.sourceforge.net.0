Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CE61BB5D3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Apr 2020 07:21:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jTIgj-0003MV-Gj; Tue, 28 Apr 2020 05:21:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+04e88780fe354b781c6f+6092+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1jTIgi-0003MK-Cq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Apr 2020 05:21:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=btOt+GJLXunt0yTMMtppqrdFkNuz4JVhPhDALsvkRkA=; b=ApYpNo44z+QmRlnbtdV/ZMnFX+
 ZZiSj+VZahfdAJ/596hjiLE6f0jSRNtsUvCcZYIH5Y4SARTvODUDEMKWxoTYHMdOjW4X8CXWMRWSX
 WLShVQmvd9eME9SlIrH+3CN5X9XfDKXaJeZXYP6wwS6/UjgCFNdnE0GZPunmX7CvhYwk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=btOt+GJLXunt0yTMMtppqrdFkNuz4JVhPhDALsvkRkA=; b=NwSuPSCcC1+gWIwB0kvnqlckkD
 /xBBve+/Sq21+kGegn8cX0Tacc/7dE3wjOjfqvoGLikHBhfpGRUFD696RidkeOZ4raciRTQOqoNGs
 /SJLFRqglGnK7XTKjUtRzrvM1uxyUCp+zilhbOU6zip+vGwRxKVd+jIO04a6WpvEqWgA=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jTIgh-00HB1v-5o
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Apr 2020 05:21:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=btOt+GJLXunt0yTMMtppqrdFkNuz4JVhPhDALsvkRkA=; b=kz5m517ctvWWh0t+4t+NNx9Rkl
 oSOdlk3JhkkXMDaa1VXuyAuOlgzyjrq+DfEknFCzMsNsNY5Y11InfWh1vPzPfatUmjLvaIt+vuyJ7
 UjVnIOCXBM+KbNMLyHebA828UmsFNiFJ4M+556kOcvZpoViWvsHil2m5CkXcO5J5Qpa+N4z5ORNKF
 SJtdsfnm2D+NUex27zd3t0dsPhZMOzLWY4+NYcDsQTzWVp9eAQxz4w6HYzBAgdHV2epdrEUQgn20a
 jtZtq0M/x7iQLMizoT6OXUEY/2Vt6UyCtDMCx1tEOo/VMDd7gBUh36aJT/v98gAZEmK75nZJQvdue
 Ivt3QYjA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jTIgb-0007Fy-Dl; Tue, 28 Apr 2020 05:21:37 +0000
Date: Mon, 27 Apr 2020 22:21:37 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200428052137.GA18572@infradead.org>
References: <20200408035654.247908-1-satyat@google.com>
 <20200408035654.247908-4-satyat@google.com>
 <20200422093502.GB12290@infradead.org>
 <20200428025400.GB52406@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428025400.GB52406@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jTIgh-00HB1v-5o
Subject: Re: [f2fs-dev] [PATCH v10 03/12] block: Inline encryption support
 for blk-mq
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
Cc: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 Kim Boojin <boojin.kim@samsung.com>, Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 28, 2020 at 02:54:00AM +0000, Satya Tangirala wrote:
> It's modified by additions in the next patch in the series and I
> thought I should introduce the function with the final type from the
> get go - is that alright?

It is probably ok, let me review the next patch in more detail.

> > >  	__blk_queue_split(q, &bio, &nr_segs);
> > > @@ -2011,6 +2015,15 @@ static blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
> > >  
> > >  	blk_mq_bio_to_request(rq, bio, nr_segs);
> > >  
> > > +	ret = blk_crypto_init_request(rq);
> > > +	if (ret != BLK_STS_OK) {
> > > +		bio->bi_status = ret;
> > > +		bio_endio(bio);
> > > +		blk_mq_free_request(rq);
> > > +		return BLK_QC_T_NONE;
> > > +	}
> > 
> > Didn't Eric have a comment last round that we shoul dtry this before
> > attaching the bio to simplify error handling?
> > 
> In the previous round, I believe Eric commented that I should call
> blk_crypto_init_request after bio_to_request so that we can do away
> with some of the arguments to blk_crypto_init_request and also a
> boilerplate function used only while calling blk_crypto_init_request.
> I realize you wrote "And we can fail just the request on an error, so
> yes this doesn't seem too bad." in response to this particular
> comment of Eric's, and it seems I might not actually have understood
> what that meant - did you have something in mind different from what I'm
> doing here?

No, this looks ok, sorry for the noise.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
