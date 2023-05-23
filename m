Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD48370E14D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 May 2023 18:02:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q1USY-0001Zs-GI;
	Tue, 23 May 2023 16:02:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1q1USW-0001ZX-9L
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 May 2023 16:02:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P1cg1lro73aIsxAqkDpaQ1HJTCIwEkgkw0qDkJM6b+M=; b=PRurC+jfKbW5ijQTiqSqIdxNRM
 VJ4CKac5cUJ1rcVuBPZ+KcbUO7LAfSphS6W8DqZ3pcm4tTrd6DN/OfenQmM/BzAJ8f3C8Yc1IFuhP
 mc6jgxyAb06z3Ya5B9d9wkVM3fz297tBrSjLWTqjfG//VNNfSrfNjAGM1sM85h5hyyJE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P1cg1lro73aIsxAqkDpaQ1HJTCIwEkgkw0qDkJM6b+M=; b=TX6aXIlAlGEjZVD9cKUx48fyfr
 HukJnAgRuPAiUPzdWYvCPh51CriCQjOqrKZD8eEzyFzCxrNovQJBVJmsDMRceFsSxTT2SlTZAyAkU
 oVeMGNjtgrcdYjZ3WpBvcnZM6OG7QUVddrYKLxhveR/GMF/Qmr2Fc/kCVU/qZz/cgdBs=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q1USV-00067t-IN for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 May 2023 16:02:01 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 32BF46732D; Tue, 23 May 2023 18:01:47 +0200 (CEST)
Date: Tue, 23 May 2023 18:01:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Damien Le Moal <dlemoal@kernel.org>
Message-ID: <20230523160146.GA15391@lst.de>
References: <20230519093521.133226-1-hch@lst.de>
 <20230519093521.133226-7-hch@lst.de>
 <5703f49d-177a-a810-6f1c-b32aa1abcde7@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5703f49d-177a-a810-6f1c-b32aa1abcde7@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, May 22, 2023 at 08:56:34AM +0900,
 Damien Le Moal wrote:
 > On 5/19/23 18:35, Christoph Hellwig wrote: > > Add a helper to invalidate
 page cache after a dio write. > > > > Signed-off-by: Christo [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1q1USV-00067t-IN
Subject: Re: [f2fs-dev] [PATCH 06/13] filemap: add a
 kiocb_invalidate_post_write helper
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Christoph Hellwig <hch@lst.de>, Andreas Gruenbacher <agruenba@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Matthew Wilcox <willy@infradead.org>,
 cluster-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, May 22, 2023 at 08:56:34AM +0900, Damien Le Moal wrote:
> On 5/19/23 18:35, Christoph Hellwig wrote:
> > Add a helper to invalidate page cache after a dio write.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Nit: kiocb_invalidate_post_dio_write() may be a better name to be explicit about
> the fact that this is for DIOs only ?

I've renamed it to kiocb_invalidate_post_direct_write, thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
