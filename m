Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 687D3710974
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 May 2023 12:06:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q27rT-0006Go-8f;
	Thu, 25 May 2023 10:06:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1q27rR-0006Gh-Q9
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 May 2023 10:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Q+kM+TWjxXk+Cj89CRyijYjxLbQDo47dz+5qnhLfMA=; b=Mld8T8NyByGhflHLuYhWzUT+Ml
 Zw/lqEry4ARx3NBPh3wLCJz/oJCayIL6Q7IeFJ5aNdbnfxvW8LHTyGmlPEO5Y9hm7bpYBoxzoznv7
 wAESEaew/Pg0iGJR8LscMbJxO9EywUV7WMCeqTk+AE3ugqzML7BT8cXW9bY3sPqRamkU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9Q+kM+TWjxXk+Cj89CRyijYjxLbQDo47dz+5qnhLfMA=; b=YK4VXK9mKddCmkyu0jMKdxbjvS
 YGc1Ofttf4C28mUIdWhsZgUjkjOJt+kcS8azaE62X2VfA4L2BnF982xX9exQLxumsPyJIyk9ahDL2
 euPaR86NVVpiMdDA3xlSY9x8JJ1YthKqLroy3JctWaeJkTq8Rb2suthvjLV7ZDiDi9jw=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q27rH-00047K-K8 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 May 2023 10:06:22 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 45E6C68AFE; Thu, 25 May 2023 12:05:58 +0200 (CEST)
Date: Thu, 25 May 2023 12:05:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Miklos Szeredi <miklos@szeredi.hu>
Message-ID: <20230525100557.GA30242@lst.de>
References: <20230524063810.1595778-1-hch@lst.de>
 <20230524063810.1595778-10-hch@lst.de>
 <CAJfpeguT-LjhS-XrZwMystZqkxyB=HaON1zo-BTNOC0L1zCa1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJfpeguT-LjhS-XrZwMystZqkxyB=HaON1zo-BTNOC0L1zCa1Q@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 24, 2023 at 09:00:36AM +0200,
 Miklos Szeredi wrote:
 > > +ssize_t direct_write_fallback(struct kiocb *iocb, struct iov_iter *iter, 
 > > + ssize_t direct_written, ssize_t buffered_written) > [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q27rH-00047K-K8
Subject: Re: [f2fs-dev] [PATCH 09/11] fs: factor out a direct_write_fallback
 helper
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

On Wed, May 24, 2023 at 09:00:36AM +0200, Miklos Szeredi wrote:
> > +ssize_t direct_write_fallback(struct kiocb *iocb, struct iov_iter *iter,
> > +               ssize_t direct_written, ssize_t buffered_written)
> > +{
> > +       struct address_space *mapping = iocb->ki_filp->f_mapping;
> > +       loff_t pos = iocb->ki_pos - buffered_written;
> > +       loff_t end = iocb->ki_pos - 1;
> > +       int err;
> > +
> > +       /*
> > +        * If the buffered write fallback returned an error, we want to return
> > +        * the number of bytes which were written by direct I/O, or the error
> > +        * code if that was zero.
> > +        *
> > +        * Note that this differs from normal direct-io semantics, which will
> > +        * return -EFOO even if some bytes were written.
> > +        */
> > +       if (unlikely(buffered_written < 0))
> > +               return buffered_written;
> 
> Comment/code mismatch.   The comment says:
> 
> if (buffered_written < 0)
>         return direct_written ?: buffered_written;

Yeah.  And the old code matches the comment, so I'll update to that.
I'm really wondering how I could come up with a good test case for
this..


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
