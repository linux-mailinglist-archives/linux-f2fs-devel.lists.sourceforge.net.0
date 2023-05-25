Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEBE710981
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 May 2023 12:10:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q27v6-0006Kz-SI;
	Thu, 25 May 2023 10:10:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1q27v5-0006Ks-QF
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 May 2023 10:10:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IUR/eF3fmCh6yLsrTi60POyjHyPORNO396GBCktNTE8=; b=B/CXFFdbwL5moqn7YP5miVYDlE
 Nw5hH0eKA2hYd44Unov9lOzvvHLWkmqc3tk+Rf81J5+riPUuzo1JnBTBagJxUnHfHsIOVxNd32sqs
 QSuolLnuzci30lh/JoZ1aTMVhNw4zfq3V8amjZn9nY6OTw+Kv7+KCmxhIzIEGobmOMOI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IUR/eF3fmCh6yLsrTi60POyjHyPORNO396GBCktNTE8=; b=jMdP77y6v5bJJGtZ4h9jUV7uW5
 pZdpkPq7xljlYCF6vsUYsMAmZD38Ie0G3X4Pn1qM1c6ZyFe7WKOkAiNlEzBjoHE5KZWCWR4VSAQT/
 yJCsixXtV95bNkW0yaZ3DK+znJSiwyBxOQUYu0SFl283kQooCYxZPQ2K6tNfRY1jRkkA=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q27uv-0004Gh-8k for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 May 2023 10:10:08 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3423B68AFE; Thu, 25 May 2023 12:09:48 +0200 (CEST)
Date: Thu, 25 May 2023 12:09:47 +0200
From: Christoph Hellwig <hch@lst.de>
To: Miklos Szeredi <miklos@szeredi.hu>
Message-ID: <20230525100947.GB30242@lst.de>
References: <20230524063810.1595778-1-hch@lst.de>
 <20230524063810.1595778-11-hch@lst.de>
 <CAJfpeguxVXm2pDeNk9M_S_0+ing1dFstaCfB30WcTRCjwwsJvg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJfpeguxVXm2pDeNk9M_S_0+ing1dFstaCfB30WcTRCjwwsJvg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 24, 2023 at 09:07:22AM +0200,
 Miklos Szeredi wrote:
 > > - endbyte = pos + written_buffered - 1; > > + endbyte = iocb->ki_pos
 + written_buffered - 1; > > Wrong endpos. > > > > > - err = fil [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q27uv-0004Gh-8k
Subject: Re: [f2fs-dev] [PATCH 10/11] fuse: update ki_pos in
 fuse_perform_write
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
 Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 24, 2023 at 09:07:22AM +0200, Miklos Szeredi wrote:
> > -               endbyte = pos + written_buffered - 1;
> > +               endbyte = iocb->ki_pos + written_buffered - 1;
> 
> Wrong endpos.
> 
> >
> > -               err = filemap_write_and_wait_range(file->f_mapping, pos,
> > +               err = filemap_write_and_wait_range(file->f_mapping,
> > +                                                  iocb->ki_pos,
> 
> Wrong startpos.

Yeah, fixed for the next version.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
