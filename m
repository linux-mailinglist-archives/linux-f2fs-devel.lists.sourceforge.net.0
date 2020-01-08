Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C883513494F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jan 2020 18:26:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ipF6Y-0007vI-7g; Wed, 08 Jan 2020 17:26:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ipF6U-0007v1-FC
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 17:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qzmv9Ori8AP360S8wLzMH5NFK0h0g+qtKHsRtl9Y8io=; b=ao5RdlOt2sCJMbhCXS3D5nzMxu
 0dhGGlmmbiYDbFOJjpDf85o0tzDsfm4PpBhqZ1uFuttrpnHSJwaeI2dTtKt7c4aMgWPu3uWmHQIQo
 puMV6Z9x2VrYQB4ZUUG7cIf88XiKcqk0yBmWw/+BzlNo7dQIFAzQEkeoW8epGdSn+fAw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qzmv9Ori8AP360S8wLzMH5NFK0h0g+qtKHsRtl9Y8io=; b=Gg04SoSLS1NP5KS0M8XT/Xlja5
 qXgx+JAOiJIoelmmRX4m2RkBeLzQ5ME9KAmswi5bM7hOyCP/DlKc4QuJE8X0auDtJLKLjDX/cV85v
 R3EarJEEGZ13jxANAIKhGCapVfujCYLtT0CgmncHq904OJflpnWOOFw/710BLYkV5QGg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ipF6P-00DVOK-2t
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 17:26:44 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 12EE220705;
 Wed,  8 Jan 2020 17:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578504391;
 bh=ij94aMQ07BTirE2iQNs+dEg6zAm/wuo0VueM7DAIze4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oHEjZcS3fZyHeprMzzff0S4Qy7ZcDSwpql0QpUi80QfppmiZQy/P4oJ803uYuwA5v
 x1z5xr+45sSoD3DV04KiQ0p1hjw++k6Xwnn+gSKBhtW5tfWhW2/9kVKkkQ88eIbzQA
 xNgFPef3+sqSoWBVJZJ9OaQn9qe8KNklyQnyAd9c=
Date: Wed, 8 Jan 2020 09:26:29 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200108172629.GA232722@sol.localdomain>
References: <20191218145136.172774-1-satyat@google.com>
 <20191218145136.172774-3-satyat@google.com>
 <20191218212116.GA7476@magnolia> <yq1y2v9e37b.fsf@oracle.com>
 <20191218222726.GC47399@gmail.com> <yq1fthhdttv.fsf@oracle.com>
 <20200108140730.GC2896@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108140730.GC2896@infradead.org>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: ieee-security.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ipF6P-00DVOK-2t
Subject: Re: [f2fs-dev] [PATCH v6 2/9] block: Add encryption context to
 struct bio
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
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>, Kim Boojin <boojin.kim@samsung.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Satya Tangirala <satyat@google.com>, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jan 08, 2020 at 06:07:30AM -0800, Christoph Hellwig wrote:
> On Wed, Dec 18, 2019 at 07:47:56PM -0500, Martin K. Petersen wrote:
> > Absolutely. That's why it's a union. Putting your stuff there is a
> > prerequisite as far as I'm concerned. No need to grow the bio when the
> > two features are unlikely to coexist. We can revisit that later should
> > the need arise.
> 
> With NVMe key per I/O support some form of inline encryption and PI are
> very likely to be used together in the not too far future.

The NVMe "key per I/O" draft is heavily flawed, and I don't think it will be
useful at all in the Linux kernel context.  The problem is that, as far as I can
tell, it doesn't allow the encryption algorithm and IVs to be selected, or even
standardized or made discoverable in any way.  It does say that AES-256 must be
supported, but it doesn't say which mode of operation (i.e. it could be
something inappropriate for disk encryption, like ECB), nor does it say whether
AES-256 has to be the default or not, and if it's not the default how to
discover that and select AES-256.  IV generation is also unspecified, so it
could be something insecure like always using the same IV.

So effectively the NVMe encryption will be unspecified, untestable, and
unverifiable.  That means that vendors are likely to implement it insecurely,
similar to how they're implementing self-encrypting drives insecurely [1].
(Granted, there are some reasons to think that vendors are less likely to screw
up key per I/O.  But inevitably some will still get it wrong.)

[1] https://www.ieee-security.org/TC/SP2019/papers/310.pdf

Also, since "key per I/O" won't allow selecting IVs, all the encrypted data will
be tied to its physical location on-disk.  That will make "key per I/O" unusable
in any case where encrypted blocks are moved without the key, e.g.
filesystem-level encryption on many filesystems.

And since the way that dm-crypt and fscrypt work is that you select which
algorithm and IV generator you want to use, to even use NVMe "key per I/O" with
them we'd have to add magic settings that say to use some unspecified
hardware-specific encryption format, which could be completely insecure.  As one
of the fscrypt maintainers I'd be really hesistant to accept any such patch, and
I think the dm-crypt people would feel the same way.

I've already raised these concerns in the NVMe and TCG Storage working groups,
and the people working on it refused to make any changes, as they consider "key
per I/O" to be more akin to the TCG Opal self-encrypting drive specification,
and not actually intended to be "inline encryption".

So let's not over-engineer this kernel patchset to support some broken
vaporware, please.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
