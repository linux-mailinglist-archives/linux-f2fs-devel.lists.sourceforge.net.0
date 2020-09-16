Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D843826C3DA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Sep 2020 16:46:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kIYhp-0003pu-DY; Wed, 16 Sep 2020 14:46:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+ec02f9a336edee825c28+6233+infradead.org+hch@casper.srs.infradead.org>)
 id 1kIYho-0003pk-8I; Wed, 16 Sep 2020 14:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I+Wrsf2OsM4H/FvG28XmzjWSyq2hOoPWFZhAVEE3RCk=; b=cx2JtR/NPbMNycsp0Y3Is9STxf
 BJhXSsaZ3TN4hqucQkjs+Yo5dH62BZLDP/fuuk6XNYP94VleclZtSL1UaOxnQP6HKn05CPRMda0+8
 NDuU/2WzWL7aCc554735cgmEniYidsFV6IusG3+4fDdeJvYm1UCMxSE8FyWgWYTP4BvM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I+Wrsf2OsM4H/FvG28XmzjWSyq2hOoPWFZhAVEE3RCk=; b=eajFoTHvx/UE4pj2l620OPVrhw
 bc5IOaK/1mZs5FXuJa9c59RyPJleZQe27X9Mn0l8C92zUOBgpqTEBsl14oc55RPfoeIFQwDM3MlO9
 B7V9WRCwEnM3kGyIKXt1tNZJAyEUKdwy1zi6QbOeVisn2JCxCHccUGn7mk9VyZeOg6MQ=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kIYhj-00CYc5-K8; Wed, 16 Sep 2020 14:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=I+Wrsf2OsM4H/FvG28XmzjWSyq2hOoPWFZhAVEE3RCk=; b=vuzIdI2myzrcSR8N8YUZIxJs7P
 Sx91GDqxw7SKvTK3Q/nRp4WnHClkpkK/1OSKRygFhe90fZaV9fh+k7GQDAKnGLqU52NU1R7o24SfD
 seMr7Y2+IlmkwzW5l1W2SFiJm7EC1UQvsJqgorQoJrd0mihZ0kd7Vp8ebhVZCF0Q0ELXjj/VrFWna
 ctPysIiI3CtHiEShBsJMczKgdXTh3NyyyLxs+T7ZmyrJaIQAuUEi+E+Z480NRxWRE3n4HU0iyYgbT
 oc26VCkL3wOc32lThfhoy8TDA7vL4lHIHRx7dN1lyrOOFn10v1O1A0ycsq6YvIr+h+Hpjh/++0yzE
 tDUCoKHA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kIYhO-0004Yh-Kj; Wed, 16 Sep 2020 14:46:18 +0000
Date: Wed, 16 Sep 2020 15:46:18 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Chris Mason <clm@fb.com>
Message-ID: <20200916144618.GB16392@infradead.org>
References: <20200916034307.2092020-1-nickrterrell@gmail.com>
 <20200916034307.2092020-7-nickrterrell@gmail.com>
 <20200916084958.GC31608@infradead.org>
 <CCDAB4AB-DE8D-4ADE-9221-02AE732CBAE2@fb.com>
 <20200916143046.GA13543@infradead.org>
 <1CAB33F1-95DB-4BC5-9023-35DD2E4E0C20@fb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1CAB33F1-95DB-4BC5-9023-35DD2E4E0C20@fb.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
X-Headers-End: 1kIYhj-00CYc5-K8
Subject: Re: [f2fs-dev] [PATCH 5/9] btrfs: zstd: Switch to the zstd-1.4.6 API
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
 Kernel Team <Kernel-team@fb.com>, Niket Agarwal <niketa@fb.com>,
 linux-btrfs@vger.kernel.org, Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Sep 16, 2020 at 10:43:04AM -0400, Chris Mason wrote:
> Otherwise we just end up with drift and kernel-specific bugs that are harder
> to debug.  To the extent those APIs make us contort the kernel code, I???m
> sure Nick is interested in improving things in both places.

Seriously, we do not care elsewhere.  Why would zlib be any different?

> There are probably 1000 constructive ways to have that conversation.  Please
> choose one of those instead of being an asshole.

I think you are the asshole here by ignoring the practices we are using
elsewhere and think your employers pet project is somehow special.  It
is not, and claiming so is everything but constructive.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
