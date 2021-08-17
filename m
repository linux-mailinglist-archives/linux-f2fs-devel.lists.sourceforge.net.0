Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9E73EE653
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Aug 2021 07:43:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mFrsW-0003st-CD; Tue, 17 Aug 2021 05:43:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+5498ba94aa5fdb349355+6568+infradead.org+hch@casper.srs.infradead.org>)
 id 1mFrsU-0003sc-Aw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Aug 2021 05:43:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VeKnM02wWuhrHmIkGzHEjGcNpMFRvvPghHJFGQ1kIg0=; b=W37PU1XcagDgs+2oqQUkB81+HX
 7P/oVRZUO9D7XMBI6BvWiSHAl/3GotAK8YeNEuUXSN8ITwP2emMyaWJsTkJuoRRTeMyNNli5SWh9p
 WCySGsF3lQXdEwuFrahTtNfnVfPzoLpS/0QHDcsNm7eLMNwfP8rkF8ilnlqPOV8O5lzE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VeKnM02wWuhrHmIkGzHEjGcNpMFRvvPghHJFGQ1kIg0=; b=iQPrmAMkqGq3WNodOfjbRw4sy9
 XJY4CteoP4crcM1DLTqJPUv9SNn1BrZ8tOhdWAbLKyKlq49wuz6XpGRXQKaw5WeYfbTENfYmy3Rrw
 mKLXHNVNd6XqrIwOCKu0rDw1ecZC99TTtwagL4s6ZbJjYWvUIElSgRLIi2rWSh4zWtuc=;
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mFrsQ-0002Ub-CG
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Aug 2021 05:43:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=VeKnM02wWuhrHmIkGzHEjGcNpMFRvvPghHJFGQ1kIg0=; b=wIXvWYPSodcx5cY+IU7NfDLX0S
 bkLtJBaE1CLafopA81uy6O0zlaIKaqhDtuJObSaeQpeWEevZdas4nzAxNF6ZN/fbJ6FpqWACAfsem
 Adzo0NqKx5Mq94NFjy/s4zYD8Nc5N2PkFB4FkxxLp3XHrVSSgt2/FNAtFVstq6tv3zmaI0J6Xbc8+
 Z242N+Ct8KmBPBG+h+heoSCM5FMhaosHwm1gSFVNegbrtusRkIcGffnGWL41lbtGjYsPoTxzL5ur6
 0su9nPU0ZOvguaWVj63XaEAdOKGk8nk43WYgFu2Y5R+yAEudCdm4EJHuV8ItaUGzW1RBuDgetNAUF
 fbJNmtdQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mFrre-002BMB-98; Tue, 17 Aug 2021 05:42:23 +0000
Date: Tue, 17 Aug 2021 06:42:18 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YRtMOqzZU4c1Vjje@infradead.org>
References: <20210728015154.171507-1-ebiggers@kernel.org>
 <YQRQRh1zUHSIzcC/@gmail.com> <YQS5eBljtztWwOFE@mit.edu>
 <YQd3Hbid/mFm0o24@sol.localdomain>
 <a3cdd7cb-50a7-1b37-fe58-dced586712a2@kernel.org>
 <YQg4Lukc2dXX3aJc@google.com>
 <b88328b4-db3e-0097-d8cc-f250ee678e5b@kernel.org>
 <YQidOD/zNB17fd9v@google.com> <YRsY6dyHyaChkQ6n@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YRsY6dyHyaChkQ6n@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1mFrsQ-0002Ub-CG
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove broken support for allocating
 DIO writes
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
Cc: Theodore Ts'o <tytso@mit.edu>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 16, 2021 at 07:03:21PM -0700, Eric Biggers wrote:
> Freeing preallocated blocks on error would be better than nothing, although note
> that the preallocated blocks may have filled an arbitrary sequence of holes --
> so simply truncating past EOF would *not* be sufficient.
> 
> But really filesystems need to be designed to never expose uninitialized data,
> even if I/O errors or a sudden power failure occurs.  It is unfortunate that
> f2fs apparently wasn't designed with that goal in mind.
> 
> In any case, I don't think we can proceed with any other f2fs direct I/O
> improvements until this data leakage bug can be solved one way or another.  If
> my patch to remove support for allocating writes isn't acceptable and the
> desired solution is going to require some more invasive f2fs surgery, are you or
> Chao going to work on it?  I'm not sure there's much I can do here.

Btw, this is generally a problem for buffered I/O as well, although the
window for exposing uninitialized blocks on a crash tends to be smaller.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
