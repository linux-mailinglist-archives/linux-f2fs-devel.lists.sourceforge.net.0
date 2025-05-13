Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DB1AB4B93
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 May 2025 08:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qi5I/WRUcI4v6ESjrurPMH7qXnMa5THJLqa8OCfnxMc=; b=FR8Abo32osqxryp8VEQY9dchSF
	F6hk3gv8pfQqf3vesKEZzwJWD1ypPjqpYbjYlW8YFhLYyETa3r4Hd4gXbsVacHozwSYVXfCgIpJRx
	WQSMQ9zQQ1P25rFdrpgQbEDGIhsdrWj+CMeTxIw5DRv56g4a3US9U/81qy/lhIKThMj8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEiiK-00067P-Ny;
	Tue, 13 May 2025 06:02:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+dca7e289515a8c765a4c+7933+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1uEii3-00066x-Pu for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 06:01:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A9+ePvYxBnyCpeSa++Q34/8DfLYzSgwHO2oMji9uOIQ=; b=dZnoEGghrR0RLNRXtg6J/0ns4Y
 4VDP80HB1Jpe7KP0bGWvTjAn3+BIADW40l1F7/xLGndJ/CSYB9tw4ATTgYY+Gh5ohkc5CP5mG0G/M
 nn9HgfQ2al9tOIogjr6Rejkzg6MdtdsJ3byo+jnXkV7barpsT4JELnnFRor/bswDVMU4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A9+ePvYxBnyCpeSa++Q34/8DfLYzSgwHO2oMji9uOIQ=; b=g6EAvOh5IviRhBOjdb2aXRzzbT
 tLwqhp9mCZbUK8pZ0fqnMCMp+y5KXCuC/HAswWC10/dlkYlrDN2gDHpAD/F70wVsPkBbn+B0QQjDA
 mWz/dhaL08OElZm175FeLEX4tRODP9qqO3VDCPIUWY/cdt5CtUtOe7TVokbCo5ZL6zLw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uEihy-0007rW-Se for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 06:01:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=A9+ePvYxBnyCpeSa++Q34/8DfLYzSgwHO2oMji9uOIQ=; b=QgWBWBZxk5kchoGsEbfFc5YWrc
 tsUszgBF82Jg6HPTRlcKrwDQmLalAjZ+ko+mhlrfLcsPf1BTzYxz6XeHZyR27xJ/26bgEXdC+6KQo
 TbYk8JfE2+DMkt+qKPq4v2b9RdodX7GtY7VjiIyKgif+f1Vu4Q2Zc9Qhrn7DSkUgWD02H8O/cT84J
 q8oda3E5fA349eQHdRw/Q/P843fKjXgFNviL756KpO3AJymNsazO845/BcPHtYCzpxdFn1XcQLLr2
 LBgkZI2mTXv81xLStUpvcqEJgkuglhtwgnajJBKc6EZwvsp2bY3YYXxYCKBUjwr4FM6Zin4aPXNCa
 mOaIFYAA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uEiho-0000000BSQc-1Rge;
 Tue, 13 May 2025 06:01:32 +0000
Date: Mon, 12 May 2025 23:01:32 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <aCLgPLUiFsiCzSBK@infradead.org>
References: <20250513055721.2918793-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250513055721.2918793-1-chao@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, May 13, 2025 at 01:57:20PM +0800, Chao Yu wrote: >
 .init_{,de}compress_ctx uses kvmalloc() to alloc memory, it will try > to
 allocate physically continuous page first, it may cause more memory [...]
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1uEihy-0007rW-Se
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: use vmalloc instead of kvmalloc in
 .init_{, de}compress_ctx
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
Cc: linux-mm@kvack.org, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, May 13, 2025 at 01:57:20PM +0800, Chao Yu wrote:
> .init_{,de}compress_ctx uses kvmalloc() to alloc memory, it will try
> to allocate physically continuous page first, it may cause more memory
> allocation pressure, let's use vmalloc instead to mitigate it.

Shouldn't this be handled in kvmalloc instead of working around it in
callers?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
