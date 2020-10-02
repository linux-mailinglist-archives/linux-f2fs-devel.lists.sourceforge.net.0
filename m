Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE647280DB5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Oct 2020 08:55:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kOEyq-000405-W0; Fri, 02 Oct 2020 06:55:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+27a5ecbc8e1e54150000+6249+infradead.org+hch@casper.srs.infradead.org>)
 id 1kOEyX-0003zA-Jr; Fri, 02 Oct 2020 06:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wsszzdNdt8/s5qmse2DtQE9T6ptZdmllS5Ln6Q6wU9w=; b=nVXnAWsZ71xuMg0P2cWswsoPap
 S3GL4epL5cSeohoBU/BgmMgOMNKvsyhtuHDMqU5mbb/JKZxCsZ+V12IGFyPDd7Eebt9Hji/93FU7H
 aBho59dcNJGr4JNCh9WW88/E+/YaBcyA7NSiYMUJyHrHH4Sxm+6kxAHfbVVHF1RHOFSY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wsszzdNdt8/s5qmse2DtQE9T6ptZdmllS5Ln6Q6wU9w=; b=TWTzQjxer6UANyvBQ6Bi8k0rIi
 N4JO2DYPp0OFst4XJEJAq1zGddOlAhPyjp7GV09aef3BRpOXfL2uHKcapbQqa0H5ADiqmF6VapiWJ
 z3dhsJJrJ5lvyd47PsgEnyC2HjwSDLrv5+TkKMW1OBt5KloQ5TflSpd9RQ1LPjgrv8as=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kOEyL-00DnNN-5u; Fri, 02 Oct 2020 06:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wsszzdNdt8/s5qmse2DtQE9T6ptZdmllS5Ln6Q6wU9w=; b=dPcWs/vek1tL6i1nQlvOrE1uA7
 8xNJ8Oje5kX7lSLWTZyOtzuVqtVFyeYSK1k+YIC4hGdDMAVJix1JWLikC5X5IMWqei9i4rHgZwVGd
 SD0S05U3c/JiwtVUkoPuwiYZEYROVD9jo7aNA0uZo8FMJLUmj6UXjrCS4I45G+y+s0isM6bwvh7dP
 Mb6tKl+tTbGqe6MJsL9Z5CDppphb88mIwyztnvEAI6ZVtZ3QFkMZaFBUXwFdYq3zWn+lXU7X1M9Hz
 qUm9iN54MuQJB97nh2XBZhPFT665ncwJylT4Br6ojvvNBQiuEsWumjLPjZeirdZDZIV/cZjn1eiSn
 472YLMnw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kOExy-0007q1-6R; Fri, 02 Oct 2020 06:54:54 +0000
Date: Fri, 2 Oct 2020 07:54:54 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Nick Terrell <terrelln@fb.com>
Message-ID: <20201002065454.GA29993@infradead.org>
References: <20200930065318.3326526-1-nickrterrell@gmail.com>
 <20200930065336.GA13656@infradead.org>
 <8743398B-0BBB-424E-A6A7-9D8AE4EFE8ED@fb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8743398B-0BBB-424E-A6A7-9D8AE4EFE8ED@fb.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kOEyL-00DnNN-5u
Subject: Re: [f2fs-dev] [PATCH v4 0/9] Update to zstd-1.4.6
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
Cc: "squashfs-devel@lists.sourceforge.net"
 <squashfs-devel@lists.sourceforge.net>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Nick Terrell <nickrterrell@gmail.com>, Yann Collet <cyan@fb.com>,
 Petr Malat <oss@malat.biz>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 Christoph Hellwig <hch@infradead.org>, Chris Mason <clm@fb.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kernel Team <Kernel-team@fb.com>, Niket Agarwal <niketa@fb.com>,
 Btrfs BTRFS <linux-btrfs@vger.kernel.org>, Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Sep 30, 2020 at 08:05:45PM +0000, Nick Terrell wrote:
> 
> 
> > On Sep 29, 2020, at 11:53 PM, Christoph Hellwig <hch@infradead.org> wrote:
> > 
> > As you keep resend this I keep retelling you that should not do it.
> > Please provide a proper Linux API, and switch to that.  Versioned APIs
> > have absolutely no business in the Linux kernel.
> 
> The API is not versioned. We provide a stable ABI for a large section of our API,
> and the parts that aren???t ABI stable don???t change in semantics, and undergo long
> deprecation periods before being removed.
> 
> The change of callers is a one-time change to transition from the existing API
> in the kernel, which was never upstream's API, to upstream's API.

Again, please transition it to a sane kernel API.  We don't have an
"upstream" in this case.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
