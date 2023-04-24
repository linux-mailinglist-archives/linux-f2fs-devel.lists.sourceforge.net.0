Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6143D6ECC38
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Apr 2023 14:42:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pqvWo-0004IB-Ny;
	Mon, 24 Apr 2023 12:42:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1pqvWn-0004Hz-V1
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 12:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iYXieGe9fPqTUexJRiJtdF9YaRduizg0r9Rnrl9HpAE=; b=KrZPEqhhl0wPbUo/QDiYxFPbE4
 97gWaubz4/BUftNXPuOTnEMUQ0rFjujjL1UPpbXOJWebrF+jQGdvRHnKDl78+Od1NVV97GvQTZZSj
 MuSUJgoeNyLamCXAAsejPKlon/RlnJK6Ypg+oeZ+oiG9QzxFoOmCCPSLgqf99Z2ogKAw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iYXieGe9fPqTUexJRiJtdF9YaRduizg0r9Rnrl9HpAE=; b=XoxBp9TNl8TXm+XfYu9++L1JtS
 FepxYWFMwzlgxCQhSnUxDruU7ShzB8siWh0o7CARuS2nbj/nfGvB+k92LpP5LLzGUXj/QnTbzknQh
 gYosUOdsgoo8wYwP8BxAK6UzcUmyI3l1PDyA+wt4v8qP22phCjrumEPBuhWopg+D9fB8=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pqvWl-0000s2-3J for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 12:42:45 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 72FF26732D; Mon, 24 Apr 2023 14:42:34 +0200 (CEST)
Date: Mon, 24 Apr 2023 14:42:34 +0200
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20230424124234.GA5786@lst.de>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-4-hch@lst.de> <ZEZ2gCYFlurJfeDE@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZEZ2gCYFlurJfeDE@casper.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Apr 24, 2023 at 01:30:56PM +0100,
 Matthew Wilcox wrote:
 > On Mon, Apr 24, 2023 at 07:49:12AM +0200, Christoph Hellwig wrote: > >
 block_page_mkwrite_return is neither block nor mkwrite specific [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1pqvWl-0000s2-3J
Subject: Re: [f2fs-dev] [PATCH 03/17] fs: rename and move
 block_page_mkwrite_return
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-nfs@vger.kernel.org, cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Apr 24, 2023 at 01:30:56PM +0100, Matthew Wilcox wrote:
> On Mon, Apr 24, 2023 at 07:49:12AM +0200, Christoph Hellwig wrote:
> > block_page_mkwrite_return is neither block nor mkwrite specific, and
> > should not be under CONFIG_BLOCK.  Move it to mm.h and rename it to
> > errno_to_vmfault.
> 
> Could you move it about 300 lines down and put it near vmf_error()
> so we think about how to unify the two at some point?
> 
> Perhaps it should better be called vmf_fs_error() for now since the
> errnos it handles are the kind generated by filesystems.

I'll look into unifying them for the next version.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
