Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B016D6761
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 17:32:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjieG-0004sz-2g;
	Tue, 04 Apr 2023 15:32:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+8568051c7530f6265d9e+7163+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pjieE-0004st-DE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 15:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H6mc1gZhtXSneS6nte5uW4UZFELa9ivi94Hze/v8bew=; b=WGBOVrWWzj3sitcOVVAb+TK0mk
 rl+oGkE0d3B6RpkW3sEYfrZiuAXdCJDf+SVR52DOcbxhRLoAA4bS+gpYqTn44b9D8SEv0U7Cd/RQg
 7eIxLJ0d4mGtzgzMLA624eWcZTB+xd1bRC2474dfYmYhsXGbCkHOr4LhvGpmeRxrTE/0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H6mc1gZhtXSneS6nte5uW4UZFELa9ivi94Hze/v8bew=; b=P3rAsZvJsgwHgx3NsUIoT3CrxS
 7Uqbtrp8g5XycCpuUUJqXlggO0LakQLn4tmqn8PyhbZ1qmtsQZn3Ev6GoUGnD19xvLrlh5344Wy00
 qGuv89OD5yRiMi/qXbwJIxj5HZusbOPDSfu0xt+gGjrt9dVk/y8YIMA4RXig2radH8y0=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjieB-00F1tk-6H for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 15:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=H6mc1gZhtXSneS6nte5uW4UZFELa9ivi94Hze/v8bew=; b=kS4170334H5m+oxgCVnmmbfs8Z
 HGcIrZO4ewhSv2x0uhcAurkfo8ppu67vASYNQq3Qd/M7iEqY5WYIWA/GGhfxTL0EqayVfGzm0ZgHC
 RchX/7zGEAnuEBysywlPXrCE17YdeutDLtHd4/UKlCfF6zaadmNmMBQRlJl7JNc1aJGI1/8ZBFQSX
 oTFeOYFfjZrVqlcF0ADAK6KzacZHHooO5I7DqGlmnK4NjCY3zQqecMMXo+G0O9qTZWVipvtosDIJI
 LaE1ceqK0n3y/4ZeJwIN/yytH+VCppgyUpHfoyunWwsKECUUoQYnJ48JKxsRMHBOhpLOZ0mtdfMi1
 q75JIVDw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pjidr-0020pf-02; Tue, 04 Apr 2023 15:32:15 +0000
Date: Tue, 4 Apr 2023 08:32:14 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <ZCxC/pQixOq03ltH@infradead.org>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-9-aalbersh@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404145319.2057051-9-aalbersh@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 04, 2023 at 04:53:04PM +0200, Andrey Albershteyn
 wrote: > Make filesystems create readpage context,
 similar as > iomap_writepage_ctx
 in write path. This will allow filesystem to > pass _op [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1pjieB-00F1tk-6H
Subject: Re: [f2fs-dev] [PATCH v2 08/23] iomap: hoist iomap_readpage_ctx
 from the iomap_readahead/_folio
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
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, agruenba@redhat.com, hch@infradead.org,
 djwong@kernel.org, damien.lemoal@opensource.wdc.com,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 cluster-devel@redhat.com, dchinner@redhat.com, rpeterso@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 04, 2023 at 04:53:04PM +0200, Andrey Albershteyn wrote:
> Make filesystems create readpage context, similar as
> iomap_writepage_ctx in write path. This will allow filesystem to
> pass _ops to iomap for ioend configuration (->prepare_ioend) which
> in turn would be used to set BIO end callout (bio->bi_end_io).
> 
> This will be utilized in further patches by fs-verity to verify
> pages on BIO completion by XFS.

Hmm.  Can't we just have a version of the readpage helper that just
gets the ops passed instead of creating all this boilerplate code?

For writepage XFS embedds the context in it's own structure, so it's
kindof needed, but I don't think we'll need that here.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
