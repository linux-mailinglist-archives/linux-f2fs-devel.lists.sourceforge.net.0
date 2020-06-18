Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1F81FF619
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 17:03:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlw4q-0001EZ-7s; Thu, 18 Jun 2020 15:03:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jlw4o-0001ES-QS
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 15:03:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UL+8ApV4cJJsaL9i1XR4k0qibz3XspT8vONGVk524kc=; b=N+gdDBJJoSJ2GgPRFVxZaraT/7
 LzAYod0ZEnhoj9xJR/PIFKZDKzqAkEBVN86FchtH6azqGMOm0GOgoGHibPwD8V0mUSfrY4n+OgdnM
 yAdQ7Nw6TqHoY1Yv5weZD8DHJbtQYVz9xf2pJeZcshKWzmG06yT0LGXVE11CezfYv1hY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UL+8ApV4cJJsaL9i1XR4k0qibz3XspT8vONGVk524kc=; b=Fllzm2kJE8eIfE7zAva+3bNsod
 yTUQCMLilfJ5JG7d/epUSHpB86FjFkhRs5jm/YpQhGPJfyKMYsK7BpbDrlUoOLmpis8AGJu3fwYjW
 apgp48SqpTuxLsOy5t9p7aQcNaMXV0I6RJSAtUmmV42o3b/oUQLR+DFgs75zWgXKQiWk=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jlw4n-007p1S-94
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 15:03:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=UL+8ApV4cJJsaL9i1XR4k0qibz3XspT8vONGVk524kc=; b=EuLHMlaVNrGT+gpgg4ZOy214Lf
 /NetdKt4msEGn/SdU6wS7Vb3Nicec9n/1E16Pv5CLgJpT25JAXyLZqTClcv5dthiCzHK32BiNFyNn
 2Vtkj1cmYSbWiXKfh18xDTiF4w22UEYWsdQ5WG/abzsVteDtOAX8vWZ3bKmb0ydVHdoW/dmfLoAdv
 rcWXcFdBrgdT+0Rnct9YP5xWZ5E6pNPsBKwkf9wU8u6uAxjlRbX/tFeF4hooENdTFNAX/QSEm8LMc
 hZs29nl0IRtyQgR2KBWEayJ7IYD2dzdJAKDyw0r1yoEP6TVl666nT/5G8UpJw9LpuF0WelqGPXar4
 ortJ5rhQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jlw4L-0003On-LK; Thu, 18 Jun 2020 15:03:09 +0000
Date: Thu, 18 Jun 2020 08:03:09 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20200618150309.GP8681@bombadil.infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
 <20200414150233.24495-17-willy@infradead.org>
 <CAHc6FU4m1M7Tv4scX0UxSiVBqkL=Vcw_z-R7SufL8k7Bw=qPOw@mail.gmail.com>
 <20200617003216.GC8681@bombadil.infradead.org>
 <CAHpGcMK6Yu0p-FO8CciiySqh+qcWLG-t3hEaUg-rqJnS=2uhqg@mail.gmail.com>
 <20200617022157.GF8681@bombadil.infradead.org>
 <CAHc6FU7NLRHKRJJ6c2kQT0ig8ed1n+3qR-YcSCWzXOeJCUsLbA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHc6FU7NLRHKRJJ6c2kQT0ig8ed1n+3qR-YcSCWzXOeJCUsLbA@mail.gmail.com>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jlw4n-007p1S-94
Subject: Re: [f2fs-dev] [Cluster-devel] [PATCH v11 16/25] fs: Convert
 mpage_readpages to mpage_readahead
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
Cc: cluster-devel <cluster-devel@redhat.com>,
 linux-ext4 <linux-ext4@vger.kernel.org>,
 Steven Whitehouse <swhiteho@redhat.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, John Hubbard <jhubbard@nvidia.com>,
 Andreas =?iso-8859-1?Q?Gr=FCnbacher?= <andreas.gruenbacher@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Junxiao Bi <junxiao.bi@oracle.com>,
 linux-xfs <linux-xfs@vger.kernel.org>,
 William Kucharski <william.kucharski@oracle.com>,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-erofs@lists.ozlabs.org,
 Linux-MM <linux-mm@kvack.org>, ocfs2-devel@oss.oracle.com,
 Bob Peterson <rpeterso@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 18, 2020 at 02:46:03PM +0200, Andreas Gruenbacher wrote:
> On Wed, Jun 17, 2020 at 4:22 AM Matthew Wilcox <willy@infradead.org> wrot=
e:
> > On Wed, Jun 17, 2020 at 02:57:14AM +0200, Andreas Gr=FCnbacher wrote:
> > > Right, the approach from the following thread might fix this:
> > >
> > > https://lore.kernel.org/linux-fsdevel/20191122235324.17245-1-agruenba=
@redhat.com/T/#t
> >
> > In general, I think this is a sound approach.
> >
> > Specifically, I think FAULT_FLAG_CACHED can go away.  map_pages()
> > will bring in the pages which are in the page cache, so when we get to
> > gfs2_fault(), we know there's a reason to acquire the glock.
> =

> We'd still be grabbing a glock while holding a dependent page lock.
> Another process could be holding the glock and could try to grab the
> same page lock (i.e., a concurrent writer), leading to the same kind
> of deadlock.

What I'm saying is that gfs2_fault should just be:

+static vm_fault_t gfs2_fault(struct vm_fault *vmf)
+{
+	struct inode *inode =3D file_inode(vmf->vma->vm_file);
+	struct gfs2_inode *ip =3D GFS2_I(inode);
+	struct gfs2_holder gh;
+	vm_fault_t ret;
+	int err;
+
+	gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
+	err =3D gfs2_glock_nq(&gh);
+	if (err) {
+		ret =3D block_page_mkwrite_return(err);
+		goto out_uninit;
+	}
+	ret =3D filemap_fault(vmf);
+	gfs2_glock_dq(&gh);
+out_uninit:
+	gfs2_holder_uninit(&gh);
+	return ret;
+}

because by the time gfs2_fault() is called, map_pages() has already been
called and has failed to insert the necessary page, so we should just
acquire the glock now instead of trying again to look for the page in
the page cache.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
