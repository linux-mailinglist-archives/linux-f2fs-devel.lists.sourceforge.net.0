Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AB393D4BF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jul 2024 16:05:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sXLZ1-0003Ex-Cx;
	Fri, 26 Jul 2024 14:04:54 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+e745cedb76d36d7a47d5+7642+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1sXLYz-0003Eq-R9 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 14:04:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vOWFGTk3bX2JnJgg72QTxHrQdHDuBA3HzMoxxCzGYMQ=; b=ChfnV6OV5OOGgLpvdOUppymTUx
 jHdAyO+zbm2qiwEJHYD12IMbr80vhxGTaJT5sW/kqfOobOdYyUjOBODYv6VaVvpJc5kDQAaiGHhAT
 ckT8hXcYXwVnwqPILTvQv68h9UqHOwaeabszyQGVmM4nZa5P5CdJhQIS4xApj3eSPF5U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vOWFGTk3bX2JnJgg72QTxHrQdHDuBA3HzMoxxCzGYMQ=; b=kHOhy5uzae4bRNwCvHmtAALCIv
 EQRHvhxnOk21Z0EExJHJeT7cNaVLScFUBWK1oz2ACPkEVigSPoudYx2GgdfA2m0M+eacCr8DdU+Re
 HBwAZXx6OBOX52US4AZBc2DvyvLqe6Jb83DGTeKfAjudHQblxVIkJyXJo2w2XV/aF6Ws=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sXLYy-0007xi-EO for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 14:04:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=vOWFGTk3bX2JnJgg72QTxHrQdHDuBA3HzMoxxCzGYMQ=; b=suO6XDt/eOV0jFSI7gqQoOPT+2
 jp85W3VnB5jiIuQJdG/Mnu7EQ1Oq1C/+uCdtOIwnS17Vr3IZ1iAbq4ju03OfuES452pMKdNqYazou
 PA78iP23EoVIA/ZnT09UKBzTQpyZTd7hwcaE5p5ScLMA0tQdS+4LwquQK2PLSnezYVY5Ei8uMSCSp
 n06A1WG9iOXmrW6R/RPhxBcaCj+/vliP1+8mmQ8uPvaIi/8uZ0ANGycblbWJWuvb9DD4mc1l3d1Cm
 uO2hRGid65D/hCPtXAmwVlyU4vppYFOUrBEuFCDoZWe9NGliRHJWJ1+NKqYfsKmJSLG+I8Q6vICI6
 d1Jalw7A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sXLYh-000000045IF-3eRS;
 Fri, 26 Jul 2024 14:04:35 +0000
Date: Fri, 26 Jul 2024 07:04:35 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Youling Tang <youling.tang@linux.dev>
Message-ID: <ZqOs84hdYkSV_YWd@infradead.org>
References: <Zp-_RDk5n5431yyh@infradead.org>
 <0a63dfd1-ead3-4db3-a38c-2bc1db65f354@linux.dev>
 <ZqEhMCjdFwC3wF4u@infradead.org>
 <895360e3-97bb-4188-a91d-eaca3302bd43@linux.dev>
 <ZqJjsg3s7H5cTWlT@infradead.org>
 <61beb54b-399b-442d-bfdb-bad23cefa586@app.fastmail.com>
 <ZqJwa2-SsIf0aA_l@infradead.org>
 <68584887-3dec-4ce5-8892-86af50651c41@libero.it>
 <ZqKreStOD-eRkKZU@infradead.org>
 <91bfea9b-ad7e-4f35-a2c1-8cd41499b0c0@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <91bfea9b-ad7e-4f35-a2c1-8cd41499b0c0@linux.dev>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jul 26, 2024 at 04:54:59PM +0800, Youling Tang wrote:
 > Based on this patch, we may need to do these things with this > > > 1.
 Change the order of *.o in the Makefile (the same order as before [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in bl.score.senderscore.com]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sXLYy-0007xi-EO
Subject: Re: [f2fs-dev] [PATCH 1/4] module: Add module_subinit{_noexit} and
 module_subeixt helper macros
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 Youling Tang <tangyouling@kylinos.cn>, linux-f2fs-devel@lists.sourceforge.net,
 Theodore Ts'o <tytso@mit.edu>, Arnd Bergmann <arnd@arndb.de>,
 kreijack@inwind.it, Josef Bacik <josef@toxicpanda.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Chris Mason <clm@fb.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-btrfs@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 26, 2024 at 04:54:59PM +0800, Youling Tang wrote:
> Based on this patch, we may need to do these things with this
>
>
> 1. Change the order of *.o in the Makefile (the same order as before the
> change)

While we'll need to be careful, we don't need to match the exact
order.  Most of the calls simply create slab caches / mempools and
similar things and the order for those does not matter at all.

Of course the register_filesytem calls need to be last, and sysfs
registration probably should be second to last, but for the vast
amount of calls the order does not matter as long as it is unwound
in reverse order.

> 2. We need to define module_subinit through the ifdef MODULE
> distinction,

Yes.

> When one of the subinit runs in a module fails, it is difficult
> to rollback execution of subexit.

By having both section in the same order, you an just walk the
exit section backwards from the offset that failed.  Of course that
only matters for the modular case as normal initcalls don't get
unwound when built-in either.

> 4. The order in which subinit is called is not intuitively known
> (although it can be found in the Makefile).

Link order through make file is already a well known concept due to
it mattering for built-in code.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
