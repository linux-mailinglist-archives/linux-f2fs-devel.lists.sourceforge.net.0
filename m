Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 709BF3E0271
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Aug 2021 15:53:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBHKF-00057L-Pr; Wed, 04 Aug 2021 13:52:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from
 <BATV+fa00d9d3bad65a365552+6555+infradead.org+hch@casper.srs.infradead.org>)
 id 1mBHKE-00057E-LG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Aug 2021 13:52:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sQHuzcjS6P96HYdRIf7uqQ4lnDNFAoSA8AvFOLfc/M4=; b=EmFEtYZ2pr1SHw+6xgcYvpc0fe
 2BQemUATNL/POQTDOgiO/N0Q+bwadLaL2rH6zofKwji06vPTAk+MENwrugVQ3ZpHYq23N3E4uxwCP
 CnG8TCcS9GtzeBsx9z+dbuPlxV7YxLFZRzugbpksNYmYTHDZJWiL1fTy02WL14chBN5I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sQHuzcjS6P96HYdRIf7uqQ4lnDNFAoSA8AvFOLfc/M4=; b=Uzdl0QUMGJx3DSEkM2h2Or90PR
 MrJTlzUux97Acv4K+VgXDFdiytVCFToipm48DdvZgj8HDYpP2uJlK8aV9Ah0iHD0N8M6AQOYAOdHX
 zMsp2UqhKvEkJ1PTzl0f1qwH2eJKw9ubAGToka2UMHkfEHBRMtP/RgwdoUoNm2Ha1vcU=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mBHKD-00C9wp-3V
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Aug 2021 13:52:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sQHuzcjS6P96HYdRIf7uqQ4lnDNFAoSA8AvFOLfc/M4=; b=tewNok//YUiPhUzswLRFPp3jXc
 PuQKMVAbnitnz6zWHQzh8f6a/RQc9KVm15hvF7mMIUaPZt/jrMllAsqYk4YTJHKNB1aUYp9c3Hidm
 Upeu+cPbKwVMygr0h+RzLCHAC+sONRLA/6CkStl0UZTuRxjrHM3HsJItd63qdoupvZCJT6BEgwrAC
 dd8mLHSVuiShgokS+uG1Fm6GAsRC7MuugPO+3QW53ogsr+OfrXzRIHA6u894yWnTn/2PDQsg1vVR3
 i+/d/SXddJC4/Nc15pt2Iw3zncwB6dSBWBMks2GIEWXwrzVvQvg7iDB7Ga6EmnB2eEY+VqGTfWH3b
 0ZN9VGOQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mBHJU-005uPG-Qe; Wed, 04 Aug 2021 13:52:13 +0000
Date: Wed, 4 Aug 2021 14:52:04 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YQqbhMtVZvCF30r9@infradead.org>
References: <20210730100530.4401-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210730100530.4401-1-chao@kernel.org>
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
X-Headers-End: 1mBHKD-00C9wp-3V
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce nosmall_discard mount option
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
Cc: jaegeuk@kernel.org, Chao Yu <chao.yu@linux.dev>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 30, 2021 at 06:05:30PM +0800, Chao Yu wrote:
> This patch introduces a new mountoption "nosmall_discard" to support
> disabling small discard functionality, note that the mountoption can not
> be removed by remount() due to related metadata should always be
> initialized during mount().

Why does this need an option?  It should be enable IFF and only IFF a
SMR drive is detected.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
