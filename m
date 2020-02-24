Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABF116B5BD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Feb 2020 00:36:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6NHA-0005Ui-4H; Mon, 24 Feb 2020 23:36:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+fd4c774fa746ae91f5d1+6028+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1j6NH8-0005US-Fr
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 23:36:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=su7zxcSpmTZRMT/KaDln9XS6SD5jlWklN/1EnJqLTaY=; b=fUu3ZeOJxVw4QQBiiWRPR2m0Ao
 SRy8LN83WIj3JO2UavKWGJI2FXTSIaY8iVX6X2murHlKE0d4SW6lobNAG0ZG74XRa5Q6JnVMj7fxF
 oNlVoJ6YK3GPD0qNGFvcES/4lrABFwzmqIqu8Mj3cZsbfJNLnDp+HQQWh6B4JDFW2N2w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=su7zxcSpmTZRMT/KaDln9XS6SD5jlWklN/1EnJqLTaY=; b=L5kfIGizGRYAokMY7k8x9t3MwF
 w9YUqU6oir+X7AqPpQEXGBsvD2m5fDJZZhEk918med7U9vszsIlz7+YMFUJpHspdil15hB99BGTEE
 jBoeJ/E1aVdi/mZrgv9aefBSC29AjOoaRWwTUsDromJZveTwqkr2Z0WPuUBAN/wdE0TI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6NH7-005WeM-DR
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 23:36:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=su7zxcSpmTZRMT/KaDln9XS6SD5jlWklN/1EnJqLTaY=; b=a8iBiTmLkCfR2U9kE0H0YYhTfn
 o/scgFru4hBFHzGI47rRZprkclexGVaEqLsg/rB+QSE6MOYe5nK5Y1JE/sYlvoTfKu9jWgQOBc04h
 sbbQ4fEsVPSyaV0j12+5FyNyWHxuj2OsU1d8qRaMZxJ/8ab/QhwonRXL1U4J2B0RsT1evDF4WLvD3
 Nki3qFEibQFrRTlru5egSP0PRrZb4Qdm9/KhXRx+RzSljbgj93kiY7faRf0dBqTSaibeFHOp3N4tJ
 wbdqJqnYtIVPFODIAQhv+tQ+vb02DXh4rvICJ6LbuJXKYUDZHVJSycZVvB6U1fjvMp3txTYeymc1R
 4jZ/y1eA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j6NGz-0001wx-Mm; Mon, 24 Feb 2020 23:36:25 +0000
Date: Mon, 24 Feb 2020 15:36:25 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200224233625.GB30288@infradead.org>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-4-satyat@google.com>
 <20200221173539.GA6525@infradead.org>
 <20200221183437.GC925@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221183437.GC925@sol.localdomain>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j6NH7-005WeM-DR
Subject: Re: [f2fs-dev] [PATCH v7 3/9] block: blk-crypto-fallback for Inline
 Encryption
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
Cc: linux-block@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Satya Tangirala <satyat@google.com>, Christoph Hellwig <hch@infradead.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 21, 2020 at 10:34:37AM -0800, Eric Biggers wrote:
> On Fri, Feb 21, 2020 at 09:35:39AM -0800, Christoph Hellwig wrote:
> > High-level question:  Does the whole keyslot manager concept even make
> > sense for the fallback?  With the work-queue we have item that exectutes
> > at a time per cpu.  So just allocatea per-cpu crypto_skcipher for
> > each encryption mode and there should never be a slot limitation.  Or
> > do I miss something?
> 
> It does make sense because if blk-crypto-fallback didn't use a keyslot manager,
> it would have to call crypto_skcipher_setkey() on the I/O path for every bio to
> ensure that the CPU's crypto_skcipher has the correct key.  That's undesirable,
> because setting a new key can be expensive with some encryption algorithms, and
> also it can require a memory allocation which can fail.  For example, with the
> Adiantum algorithm, setting a key requires encrypting ~1100 bytes of data in
> order to generate subkeys.  It's better to set a key once and use it many times.

I didn't think of such expensive operations when setting the key.
Note that you would not have to do it on every I/O, as chances are high
you'll get I/O from the same submitter and thus the same key, and we
can optimize for that case pretty easily.

But if you think the keyslot manager is better I accept that, this was
just a throught when looking over the code.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
