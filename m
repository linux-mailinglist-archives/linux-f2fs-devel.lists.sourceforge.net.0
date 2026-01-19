Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D284D3A2E6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 10:27:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0whgBj98wmG05ip4v36NxjoMjECECvZG3AHIhytVv8=; b=drlLZvJBNXquz37GnZ685ZDN5f
	cOmAHq3cHV27wsSchXGvQcjLpYdxj62wkq15OTjawPM7BWkX9nlvfMSCa82BiTGBNP9mkDJ/GkHX/
	kwOIyoaCtdghSZQhg+mvWByIIkrvD5YEvra9v6UDt4PHYB84cje0X091Vw6PWBEuNYbw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhlXx-0005Xq-G2;
	Mon, 19 Jan 2026 09:27:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1vhlXv-0005XX-Tq;
 Mon, 19 Jan 2026 09:27:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=48N7Q6quaXG2VUerPh0mhwn+AwJxdPQoMhUkebk+erI=; b=YSCHDUv1bBXkULj6XgaFG/wM+s
 hGhXMUcrHNOLdjlMPmymNWD6wFgwlBLmUVJdcb1GfPEmMkTQ+Uy0LHll+QFhdfAt4OI7kyzWp/ay6
 oEQCFTq5t3Mv42QaHY9E2iZ0cLi5oKkHU2e+GBaCC+lMKFgIRB6XMCmQ22eLxVXFe9Os=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=48N7Q6quaXG2VUerPh0mhwn+AwJxdPQoMhUkebk+erI=; b=gUOMhkdhLPunZ8KkTzKdpKwEWh
 uwNKcrtM9wJ5xF8QT1tc+RRVdPdMZAvrBL3B/yHyeKc+xPVB0RLZCsngmnR7Vu+bNSHuZzTD45LQH
 KdfuFtMrusok3CpvYyHVLL8086JlOJS621Pzh/4ph9liQ7L66oj3LjZ2EayQ+Uib3cpo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhlXv-0000MY-CA; Mon, 19 Jan 2026 09:27:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 393BA60151;
 Mon, 19 Jan 2026 09:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB482C116C6;
 Mon, 19 Jan 2026 09:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768814847;
 bh=Zn6TWVYgqMMEo3G81dyTmE6wcI+Sd3bTAPgjzlTxSPs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mu2QXGlUo4aerUV1P+3KG6SEVjE4I5PwhJE94jSGcKGFEsi89NRvYzLMGsZyQmRMx
 AFrdo2vU9n6IMbv1w/EO9SLvuETafk1mFU5xlxvhkxtXkEJNYxoKBYE396mdxVzJZb
 W5ZtaIJuQRCJeroGKA0KDWsJMPfBkIPP+baoniV9KyAuTgFx19+cYmtPt33Z2z6QMh
 W/hxfZCWesZN7MEjTCRbAXitVDu+eK0Xl7sEvoG3LmudoMrRbWd+So2BZh0JGzK2g9
 bPKHftczmsMNxhRS3WkfraWatirsn1eEv2j+V31oLZsNC4UpAnMV0UccclyHU9DeQT
 92D5SL9b9rhFA==
Date: Mon, 19 Jan 2026 10:27:11 +0100
To: NeilBrown <neil@brown.name>
Message-ID: <20260119-kanufahren-meerjungfrau-775048806544@brauner>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 <9c99197dde2eafa55a1b55dce2f0d4d02c77340a.camel@kernel.org>
 <176877859306.16766.15009835437490907207@noble.neil.brown.name>
 <aW3SAKIr_QsnEE5Q@infradead.org>
 <176880736225.16766.4203157325432990313@noble.neil.brown.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <176880736225.16766.4203157325432990313@noble.neil.brown.name>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 19, 2026 at 06:22:42PM +1100, NeilBrown wrote:
 > On Mon, 19 Jan 2026, Christoph Hellwig wrote: > > On Mon, Jan 19, 2026
 at 10:23:13AM +1100, NeilBrown wrote: > > > > This was Chuck's sugge [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vhlXv-0000MY-CA
Subject: Re: [f2fs-dev] [PATCH 00/29] fs: require filesystems to explicitly
 opt-in to nfsd export support
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
From: Christian Brauner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: Martin Brandenburg <martin@omnibond.com>,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Alex Markuze <amarkuze@redhat.com>,
 Sandeep Dhavale <dhavale@google.com>, linux-btrfs@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Yue Hu <zbestahu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Viacheslav Dubeyko <slava@dubeyko.com>,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, linux-mm@kvack.org,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
 Olga Kornievskaia <okorniev@redhat.com>, linux-cifs@vger.kernel.org,
 Dave Kleikamp <shaggy@kernel.org>, Tom Talpey <tom@talpey.com>,
 ocfs2-devel@lists.linux.dev, Bharath SM <bharathsm@microsoft.com>,
 David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev,
 linux-nfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-erofs@lists.ozlabs.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 Chuck Lever <chuck.lever@oracle.com>, Hongbo Li <lihongbo22@huawei.com>,
 Anna Schumaker <anna@kernel.org>, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 David Woodhouse <dwmw2@infradead.org>, Trond Myklebust <trondmy@kernel.org>,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 19, 2026 at 06:22:42PM +1100, NeilBrown wrote:
> On Mon, 19 Jan 2026, Christoph Hellwig wrote:
> > On Mon, Jan 19, 2026 at 10:23:13AM +1100, NeilBrown wrote:
> > > > This was Chuck's suggested name. His point was that STABLE means that
> > > > the FH's don't change during the lifetime of the file.
> > > > 
> > > > I don't much care about the flag name, so if everyone likes PERSISTENT
> > > > better I'll roll with that.
> > > 
> > > I don't like PERSISTENT.
> > > I'd rather call a spade a spade.
> > > 
> > >   EXPORT_OP_SUPPORTS_NFS_EXPORT
> > > or
> > >   EXPORT_OP_NOT_NFS_COMPATIBLE
> > > 
> > > The issue here is NFS export and indirection doesn't bring any benefits.
> > 
> > No, it absolutely is not.  And the whole concept of calling something
> > after the initial or main use is a recipe for a mess.
> 
> We are calling it for it's only use.  If there was ever another use, we
> could change the name if that made sense.  It is not a public name, it
> is easy to change.
> 
> > 
> > Pick a name that conveys what the flag is about, and document those
> > semantics well.  This flag is about the fact that for a given file,
> > as long as that file exists in the file system the handle is stable.
> > Both stable and persistent are suitable for that, nfs is everything
> > but.
> 
> My understanding is that kernfs would not get the flag.
> kernfs filehandles do not change as long as the file exist.
> But this is not sufficient for the files to be usefully exported.
> 
> I suspect kernfs does re-use filehandles relatively soon after the
> file/object has been destroyed.  Maybe that is the real problem here:
> filehandle reuse, not filehandle stability.
> 
> Jeff: could you please give details (and preserve them in future cover
> letters) of which filesystems are known to have problems and what
> exactly those problems are?
> 
> > 
> > Remember nfs also support volatile file handles, and other applications
> > might rely on this (I know of quite a few user space applications that
> > do, but they are kinda hardwired to xfs anyway).
> 
> The NFS protocol supports volatile file handles.  knfsd does not.
> So maybe
>   EXPORT_OP_NOT_NFSD_COMPATIBLE
> might be better.  or EXPORT_OP_NOT_LINUX_NFSD_COMPATIBLE.
> (I prefer opt-out rather than opt-in because nfsd export was the
> original purpose of export_operations, but it isn't something
> I would fight for)

I prefer one of the variants you proposed here but I don't particularly
care. It's not a hill worth dying on. So if Christoph insists on the
other name then I say let's just go with it.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
