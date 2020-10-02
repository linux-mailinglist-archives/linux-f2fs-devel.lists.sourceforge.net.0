Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FE3280DBB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Oct 2020 08:57:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kOF08-00048j-7g; Fri, 02 Oct 2020 06:57:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+27a5ecbc8e1e54150000+6249+infradead.org+hch@casper.srs.infradead.org>)
 id 1kOF03-000474-Dk; Fri, 02 Oct 2020 06:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7BVc1iS3g2oQv2YGmBM3HrMQTsBjA+89qcd8GM2sLng=; b=bjAtEA4VZK44hKmaJDqtl+C2hQ
 HTCTu3QGO75oQBVUG2mmZibHpyXHCdllpOs/tNC8u8Chwjf1XAxpImDxpLI+osXvtPV+r4xls2p92
 mHvh4KH0Q4WNdfrRdkaJBD9D5ZSPNQkkvLjLAh0mDF5fNpCzl76rmjRg//ZUuTX0XVEk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7BVc1iS3g2oQv2YGmBM3HrMQTsBjA+89qcd8GM2sLng=; b=i4lFtrED1ZnczB2+G/g/3UH5W/
 1k0F0WTIl3Ol+1WbiyQhJF7HftXTNVD7nE00i+YuUvgRWAzeewaBmc4o+GRq6Wd5FMXbXlkjtJoz+
 w67GAQddPnvyZ9TxMR2fDJZhRNlvVgp0w85IID44/XqON8KPi5IDY3sRjVipWco0hYoM=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kOEzk-00DnQO-OE; Fri, 02 Oct 2020 06:57:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7BVc1iS3g2oQv2YGmBM3HrMQTsBjA+89qcd8GM2sLng=; b=Bk5FHae+b+QyMOChRUDesucsC9
 cNTWeKMSdi5ShHkGtSxVNNyzCENJAEE35Iz/fjAI6csahpZBqru27BB0BdeIg+wZKiPU+u7arWZFX
 wUDUxJSFgkWpbxYD2LToCbQZzVPm9dmK/EQ7ELbEjXa10fJ0kX32auyOB8vZLGjd1JL+5vn3fQ450
 rKI+zNIp8Ujsbi+EM5CK7wDKELZNKTBcc6ZOIAvGhMRluSXr0SvlMchFfSIDNfXjRcRfsWgx8TUZ7
 gdyAHPb0PqBs33Mt2ScZ0zoZ+w7vda1l5MDpHdT7cFbO7p82agANNb/YKo65a5IYjG4pf51fZnHRt
 YFjCDKDw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kOEzR-0007zp-Q5; Fri, 02 Oct 2020 06:56:25 +0000
Date: Fri, 2 Oct 2020 07:56:25 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Nick Terrell <terrelln@fb.com>
Message-ID: <20201002065625.GB29993@infradead.org>
References: <20200930065318.3326526-1-nickrterrell@gmail.com>
 <293CD1BC-DBED-4344-AC84-C85E0DD7914D@fb.com>
 <20201001101833.GT6756@twin.jikos.cz>
 <D369584C-5BA4-4C08-BFE9-8DB79A05CC31@fb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D369584C-5BA4-4C08-BFE9-8DB79A05CC31@fb.com>
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
X-Headers-End: 1kOEzk-00DnQO-OE
Subject: Re: [f2fs-dev] [GIT PULL][PATCH v4 0/9] Update to zstd-1.4.6
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
 Christoph Hellwig <hch@infradead.org>, Nick Terrell <nickrterrell@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dsterba@suse.cz" <dsterba@suse.cz>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Petr Malat <oss@malat.biz>,
 Chris Mason <clm@fb.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Yann Collet <cyan@fb.com>, Kernel Team <Kernel-team@fb.com>,
 Niket Agarwal <niketa@fb.com>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>,
 Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Oct 01, 2020 at 06:35:34PM +0000, Nick Terrell wrote:
> I???m open to suggestions on how to get a zstd update done better. I don???t
> know of any way to break this patch up into smaller patches that all compile.
> The code is all generated directly from upstream and modified to work in the
> kernel by automated scripts.

Documentation/process/submitting-patches.rst:


"Separate your changes
---------------------

Separate each **logical change** into a separate patch.

For example, if your changes include both bug fixes and performance
enhancements for a single driver, separate those changes into two
or more patches.  If your changes include an API update, and a new
driver which uses that new API, separate those into two patches."

It's not that hard, is it?  Please do your very basic homework instead
of pretending to be a special snowflake and then come back.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
