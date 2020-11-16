Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 256622B4BB4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Nov 2020 17:53:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kehkZ-0002Cp-OP; Mon, 16 Nov 2020 16:53:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+29a21e8ca386e11a5a78+6294+infradead.org+hch@casper.srs.infradead.org>)
 id 1kehkW-0002Cd-OS; Mon, 16 Nov 2020 16:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=58n1C0eF5U2Ce08w2RFY+aBzbpcHaYmfH6ddU03MxV8=; b=TsG4tIwEcLjzW0xmjb1kuD650z
 7+2WDdCRxQzPxtcTujfqIaaVC/22sGdzwaBpBsGucd/nHmBP/GpafV/Q1hguX5HsPcPnmVURg9Dlw
 1rANNS4vABpkeIa5NXQLaorExhR8aADO5Pf/Yheo4Tcj/AfdRFq4Rq3wPrLUt3FT7ZtE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=58n1C0eF5U2Ce08w2RFY+aBzbpcHaYmfH6ddU03MxV8=; b=ShXSovnFbAiUPA3IVj+P4xA+v4
 CXt5mpOuZywDf7+j2M03llk/pfnOab5la5EHHsgsbgY9dqtt8Sayz1Qn14ZZg9xoo77Be4XUZjP9T
 z5vIQfxWPiLjXiOJ6DAzRilnOQZvaFGuX5//lBHmfFxfFgC2/jbaZCY8ibhruzzvBVKg=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kehkJ-007DKM-E4; Mon, 16 Nov 2020 16:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=58n1C0eF5U2Ce08w2RFY+aBzbpcHaYmfH6ddU03MxV8=; b=gHrMs+m4c5i43VOs6wLtvFKYRG
 hIV0TPWTqtDWpuJrTpZQKB+oCEMm5Ky8IhUC50h3NG48uWzVxVfc7TahHNVAJHMup37uN/yJ+XLG3
 Iveqb1Z6SH0J8WIsABBdYiZe3Z8EZQ0raI8cNQsIF4BJsmK6RMW/Zk3rH/+rDC7Oa4YhGMReuXkW0
 v/9k0FjKgBpKkpqd+TJS3dvuQWCdg5YQ4L71zeLRAbQibkCvCyRQuiv0kCYsd6eyqhOyakjtzky8y
 SM8VE2wCWtMToxcnlmSWzF+Wc7/wzZ5MUQZPiyiNwLVclaI+VDXsD1eQJkvz+MqsXYretJAZxdUbA
 gm1VNQdw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kehjz-00062Z-Rv; Mon, 16 Nov 2020 16:52:31 +0000
Date: Mon, 16 Nov 2020 16:52:31 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Chris Mason <clm@fb.com>
Message-ID: <20201116165231.GA22834@infradead.org>
References: <20201103060535.8460-1-nickrterrell@gmail.com>
 <20201103060535.8460-2-nickrterrell@gmail.com>
 <20201106183846.GA28005@infradead.org>
 <D9338FE4-1518-4C7B-8C23-DBDC542DAC35@fb.com>
 <20201110183953.GA10656@infradead.org>
 <4ED61269-0F19-46EB-ACE3-C6D81E0A9136@fb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ED61269-0F19-46EB-ACE3-C6D81E0A9136@fb.com>
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
X-Headers-End: 1kehkJ-007DKM-E4
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

On Tue, Nov 10, 2020 at 02:24:35PM -0500, Chris Mason wrote:
> I think APIs change based on the needs of the project.  We do this all the
> time in the kernel, and we don???t think twice about updating users of the
> API as needed.

We update kernel APIs when:

 - we need additional functionality
 - thew new API is clearly better than the old one

None of that seems to be the case here.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
