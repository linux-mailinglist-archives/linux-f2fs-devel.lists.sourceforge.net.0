Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C7726BFBE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Sep 2020 10:49:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kIT8F-0007h7-78; Wed, 16 Sep 2020 08:49:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+ec02f9a336edee825c28+6233+infradead.org+hch@casper.srs.infradead.org>)
 id 1kIT87-0007fE-8W; Wed, 16 Sep 2020 08:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yFjrMsePDJlQkzG4d2Vn8z/692IKzJ049uA8PvEMcO4=; b=SzDYLHd7wUTtCn7C8mFNcTg3Z+
 wiwaeRCW2Gcq7awTO68IwBLGfYFTW00PWzcgKSvQ0tJ3R6BzC5IhSBsVLtXbYoJFNwc0uijN/vr+n
 tX8KbIbLpWFPT/Zj79rWVnoG1amBDdR9L0GnEOO+2yRoDTD1TJBdJjx37e/4jcC3a4UM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yFjrMsePDJlQkzG4d2Vn8z/692IKzJ049uA8PvEMcO4=; b=dowsZy4u99HGveSJCjyeWJ1J++
 V5ldK35+x+lQlKI4nGgfJVTv19y1kgPqzrAe+67WA48pv0yqFJhtb5foiqBXXECDZRwElv0uNHYoW
 h+I1Y4Zf4+T1H5OhaiyPQy2OPAfmKT32S9n9DULyAOlMUAtbda9kId83PFXBtmNcIdng=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kIT7y-00B5Js-QY; Wed, 16 Sep 2020 08:49:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yFjrMsePDJlQkzG4d2Vn8z/692IKzJ049uA8PvEMcO4=; b=Ncdb8mKIyo2jzNf/4eaE4LnpE4
 vFj38ShjIXOy8kyLU7yoLOGb+kFF78Rsm0VwpmpGVyTX3s306CGrpGaxuvnR2qMJRP/c+7onbjD2o
 xlf88CQo90s+kNfDXNdGx9DpBk2YXjtyBEKR057ZhUmbPSKKoohMzOxPdp7lOD776J/L8ar5x3vPr
 tCur5rOtVXOE1W9N7ysn155eEtqs8hrBxog4BoZUqAD++P78ZzqZzJWUKHLBbQ7CHtoPIBSnVqexZ
 2weYDIUQokHvqdlyaP1xT/gi4Ao0WZ/BebOnYeahK2Pb4/KNNOKj97cffPeG/WKbGYSFx+5AdAQky
 jzrMrnIw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kIT7l-0008Lu-46; Wed, 16 Sep 2020 08:49:09 +0000
Date: Wed, 16 Sep 2020 09:49:09 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Nick Terrell <nickrterrell@gmail.com>
Message-ID: <20200916084909.GB31608@infradead.org>
References: <20200916034307.2092020-1-nickrterrell@gmail.com>
 <20200916034307.2092020-5-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916034307.2092020-5-nickrterrell@gmail.com>
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
X-Headers-End: 1kIT7y-00B5Js-QY
Subject: Re: [f2fs-dev] [PATCH 4/9] crypto: zstd: Switch to zstd-1.4.6 API
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
 Herbert Xu <herbert@gondor.apana.org.au>, Yann Collet <cyan@fb.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Petr Malat <oss@malat.biz>, Chris Mason <clm@fb.com>,
 Nick Terrell <terrelln@fb.com>, linux-crypto@vger.kernel.org,
 Kernel Team <Kernel-team@fb.com>, Niket Agarwal <niketa@fb.com>,
 linux-btrfs@vger.kernel.org, Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> +	const size_t wksp_size = ZSTD_estimateCCtxSize(ZSTD_DEF_LEVEL);
> +
> +	if (ZSTD_isError(wksp_size)) {
> +		ret = -EINVAL;
> +		goto out_free;
> +	}

Pleas switch to properly named functions when you touch this.

The API names here look like a cat threw up on the keyboard.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
