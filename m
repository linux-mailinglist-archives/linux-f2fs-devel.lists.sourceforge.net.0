Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 442F126C3B8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Sep 2020 16:31:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kIYTJ-0004Tp-Ca; Wed, 16 Sep 2020 14:31:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+ec02f9a336edee825c28+6233+infradead.org+hch@casper.srs.infradead.org>)
 id 1kIYSj-0004Q2-VD; Wed, 16 Sep 2020 14:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qRV1VR1lw4Pk3Btc/ldGIrFcQRYbXcvusp2+nqI5T2s=; b=MfmvJw3UiJrvP4tY61DSp8gA6l
 EQiVCMbdcHKseAbq/qCxhW1FBmG4DAGv2p6RDmtCottfgotEDrL59OnqazPxcD2RrvR06Nls/5qGT
 dKUuzrUjb3Bg+QB6ThZe9F+umdLehFW3xGFkNgpEOJa7u4sz5hy12ipLTyxS7R0vp/x4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qRV1VR1lw4Pk3Btc/ldGIrFcQRYbXcvusp2+nqI5T2s=; b=g454xmNnGw30pnXx2OIlhO+Ezr
 EVaSG0A1AV4rD1MthpCP/X3KzGeZZoRsXa3Pc7Q4ocavBapDOK4Ei6Ma/HsHwgViTnfES+0uS9ril
 DY4NTAo/mm6ZH1HLcQeGLJiag5nBIGlYGWtDHlL1I5PHhgfE/L9LJLjDQiSVJxFeBvU0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kIYSb-00BUaB-NV; Wed, 16 Sep 2020 14:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qRV1VR1lw4Pk3Btc/ldGIrFcQRYbXcvusp2+nqI5T2s=; b=qAhoj5A8/WBwt5HE5/TC3r1KPb
 FSpELKFytkPr5wmYs215KBD8P/G/e8uxMWtY+kR4NsdsomnEMZXVLoO3988eucRjiNLxPE491bB/i
 BjYlmMXn9pRIytA9jX5u7YFjP0P08jsI63mZIAkxVq/1rHGAVwDJDKNiEa/hcXpmnhzmr0H2vP6HP
 Yy6FHkkcLKlF5znZYRlonAVdhIptb+JADXalWjRiYPmX8YD3tRvnddqjjTwjGoHUq2gjnM/t0dMhV
 Km0ShtrXDt2odA5/6+vWzDEISdIKWkFQXQCBW/S9EcOzSXH4dCTzRfxWT3crfildhh5MNT5yTOJCX
 vmbNY1Yw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kIYSM-0003cS-2f; Wed, 16 Sep 2020 14:30:46 +0000
Date: Wed, 16 Sep 2020 15:30:46 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Chris Mason <clm@fb.com>
Message-ID: <20200916143046.GA13543@infradead.org>
References: <20200916034307.2092020-1-nickrterrell@gmail.com>
 <20200916034307.2092020-7-nickrterrell@gmail.com>
 <20200916084958.GC31608@infradead.org>
 <CCDAB4AB-DE8D-4ADE-9221-02AE732CBAE2@fb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CCDAB4AB-DE8D-4ADE-9221-02AE732CBAE2@fb.com>
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
X-Headers-End: 1kIYSb-00BUaB-NV
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

On Wed, Sep 16, 2020 at 10:20:52AM -0400, Chris Mason wrote:
> It???s not completely clear what you???re asking for here.  If the API
> matches what???s in zstd-1.4.6, that seems like a reasonable way to label
> it.  That???s what the upstream is for this code.
> 
> I???m also not sure why we???re taking extra time to shit on the zstd
> userspace package.  Can we please be constructive or at least actionable?

Because it really doesn't matter that these crappy APIs he is
introducing match anything, especially not something done as horribly
as the zstd API.  We'll need to do this properly, and claiming
compliance to some version of this lousy API is completely irrelevant
for the kernel.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
