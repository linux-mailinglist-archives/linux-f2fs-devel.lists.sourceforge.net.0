Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 361FE26D85C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Sep 2020 12:05:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kIqnV-0001pw-8f; Thu, 17 Sep 2020 10:05:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+c88049fb72e75cdfbebb+6234+infradead.org+hch@casper.srs.infradead.org>)
 id 1kIqnO-0001pa-O7; Thu, 17 Sep 2020 10:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=etDu0solC5EHZ0a6cTnafdPGtZwvbpt/Q8uDwacTzb0=; b=StqdSR5ttxN7n4JY+mZeBM816x
 u14aCULSaWqxSiBVKT/JZTHFAiJWXEmcSGnjOFeQrSHxwtlZxv6pr5W8Ps0fvGIlJifZoZI3AsXPa
 TnSWD6fzz8bhnSU1MsIysNElkoiKQZj7SvLSJitPxwvW/km5zer5I2QoeveDgu3Zn43c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=etDu0solC5EHZ0a6cTnafdPGtZwvbpt/Q8uDwacTzb0=; b=U+39bXwKFexEWJhTrMLOj+HQZ3
 KsRDcwWUPhbFsx3HbLwb5Rjt1Gkw7fAGcK3HaPqZpuYy8dk9wvlNTbZ2P1J5bH3wu70pfxs/N8wIC
 dMX8dgM232cCRfSLmh61AtZ8BuivdEb44u8cNxnOXmeRes04kL0a0eX3To+CZzeb2PiU=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kIqnH-00Dzkr-7Y; Thu, 17 Sep 2020 10:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=etDu0solC5EHZ0a6cTnafdPGtZwvbpt/Q8uDwacTzb0=; b=T6E1hto/3ToiS8tEe7XA6ZOPy9
 yaNF0YLLVxqLa0YJWuGC9geGUEt8Hy4qoH4Pp52NSuKJyxc9jtFzsMsCaP5q3u8w+Lgjq+NYS1pig
 uyOaqV36xtAolloyVQruPOXo+likgIAY9YgMNVRVuKech2GAFb0zBapdM+74nUPJJUKKpNqO0UfSS
 ZndZBx0Y/nPQG6s1N9rvUGUHnAJ13mbDBbWl7qu/X3ozlNMnm1qkI0m3Vz/BRt8n+gN2WzZzPhW0Q
 GP9v3fCEozhHXdvVXwV8b2HrAxL+BWnTpz4UE0ZwfxqLmHj8nGf85YleQo6QTcXR9dKJuUol8RLPI
 /Pb6boJw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kIqmg-0007Lt-NG; Thu, 17 Sep 2020 10:04:58 +0000
Date: Thu, 17 Sep 2020 11:04:58 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Rik van Riel <riel@surriel.com>
Message-ID: <20200917100458.GA28031@infradead.org>
References: <20200916034307.2092020-1-nickrterrell@gmail.com>
 <20200916034307.2092020-7-nickrterrell@gmail.com>
 <20200916084958.GC31608@infradead.org>
 <CCDAB4AB-DE8D-4ADE-9221-02AE732CBAE2@fb.com>
 <20200916143046.GA13543@infradead.org>
 <1CAB33F1-95DB-4BC5-9023-35DD2E4E0C20@fb.com>
 <20200916144618.GB16392@infradead.org>
 <4D04D534-75BD-4B13-81B9-31B9687A6B64@fb.com>
 <b1eec667d42849f757bbd55f014739509498a59d.camel@surriel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b1eec667d42849f757bbd55f014739509498a59d.camel@surriel.com>
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
X-Headers-End: 1kIqnH-00Dzkr-7Y
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
Cc: "squashfs-devel@lists.sourceforge.net"
 <squashfs-devel@lists.sourceforge.net>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Nick Terrell <nickrterrell@gmail.com>, Yann Collet <cyan@fb.com>,
 Petr Malat <oss@malat.biz>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 Christoph Hellwig <hch@infradead.org>, Chris Mason <clm@fb.com>,
 Nick Terrell <terrelln@fb.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Kernel Team <Kernel-team@fb.com>, Niket Agarwal <niketa@fb.com>,
 Btrfs BTRFS <linux-btrfs@vger.kernel.org>, Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Sep 16, 2020 at 09:35:51PM -0400, Rik van Riel wrote:
> > One possibility is to have a kernel wrapper on top of the zstd API to
> > make it
> > more ergonomic. I personally don???t really see the value in it, since
> > it adds
> > another layer of indirection between zstd and the caller, but it
> > could be done.
> 
> Zstd would not be the first part of the kernel to
> come from somewhere else, and have wrappers when
> it gets integrated into the kernel. There certainly
> is precedence there.
> 
> It would be interesting to know what Christoph's
> preference is.

Yes, I think kernel wrappers would be a pretty sensible step forward.
That also avoid the need to do strange upgrades to a new version,
and instead we can just change APIs on a as-needed basis.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
