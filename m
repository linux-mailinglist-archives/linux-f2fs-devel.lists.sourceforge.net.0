Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AC9D3B8C8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 21:46:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:Message-id:Date:References:In-reply-to:To:From:MIME-Version:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtpREL8Y08tZ8KkfUst8C1rXJ6FeVkZRvAAH0UZGhfY=; b=cW4cEyFVilFi8Bwud2sNFmZESA
	Zy38pQTzGH2aPrguKwRU2u9JkftEHElJlNS+iS3YzHlLXr5tevQkci6TWrKapDi/wePn3xyKekAiW
	u/dbZ7xxMKIRro5saKOApH7FUhBCQi6KR2lrYxweBFIWt7PjlC6p2OOmysWoyzBBjqpI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhw8Z-0002GB-0S;
	Mon, 19 Jan 2026 20:46:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <neilb@ownmail.net>) id 1vhw8W-0002Fc-Ew;
 Mon, 19 Jan 2026 20:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Message-id:Date:References:In-reply-to:
 Subject:Cc:To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:Sender
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v4LtkcerTNcKdHBuxb989VhIuXJUmGOFYwT3m9zCWpQ=; b=ZCXf/1YtvdELyikKbCPw3HF56e
 WxTQVngHchc/jMT2ZKe1O7KfpIoCruArRbmWdc2h05g53Q7Jg6im5Wu/uCyRmQ0H32zNosTDUrMA/
 TKE0U8EvvMEIcZL1ceCA/JauKQKGaCRYSD/ZEKVRZG6mDV+UIjsX88d9k6D/wrdqCJM0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Reply-To:Message-id:Date:References:In-reply-to:Subject:Cc:To:From:
 MIME-Version:Content-Transfer-Encoding:Content-Type:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v4LtkcerTNcKdHBuxb989VhIuXJUmGOFYwT3m9zCWpQ=; b=ErhH2hKP3C7NowIPyrUTZuCUFm
 MJXmYMRUypBkGNvMokytKMLmi0DX6miwtfytzix4STXL7zOkhtdCp1btqQdEkB9ZsW2y2rljGcxHN
 JIoPXMp2IOXBI37RjZeIegJV6scIuNSaGXjIc7+CMbTKlttDoG914DIJQvYObGmcuivY=;
Received: from flow-b3-smtp.messagingengine.com ([202.12.124.138])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhw8V-0003Jb-FO; Mon, 19 Jan 2026 20:46:09 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailflow.stl.internal (Postfix) with ESMTP id C9DA613010D8;
 Mon, 19 Jan 2026 15:45:59 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Mon, 19 Jan 2026 15:46:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm2; t=
 1768855559; x=1768862759; bh=v4LtkcerTNcKdHBuxb989VhIuXJUmGOFYwT
 3m9zCWpQ=; b=Lc0EYW6ibUUqVQJUKzaim23Euwd0BGgFRXe5DALzfEojg7VN6rT
 B6DiPIhAD3IC7M+5XEsbPahQ32cVgcxSRShqrzfxc+w2dQttIp0GWIrdUpX55qw0
 1YJfvLNEex4MDg629sJRt0DIagYZ7O2YgHGEWRwCbzJK6pewaTBy/LwbN/3UuIrH
 D1X+l3ArslIHe9m6/MxEM+BHkwyONj/QBcgvUoddEjQn2rtqiXm8XIlcaUBBGYcG
 L51CiT0gWDAG38s7mrfim3JvqvUewVVj4jdamfv/vGEC6XVs37En7pvh86V+RKx9
 u1Btsigj5UNDPW1ltBPZUH8SSA1nKU+SOjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768855559; x=
 1768862759; bh=v4LtkcerTNcKdHBuxb989VhIuXJUmGOFYwT3m9zCWpQ=; b=e
 xt14fYhTflITcl6YnaiRNNIPiieIuY3T2ekw4mgpmY/v/o1D6Rm9og97ySUxlRr7
 FuBeLtlEdjDnDlXWSfPcQ5AbZapLP6oLiXJHFrRkIH0gKfaYLMLYjIQO36N4L42d
 r+sxyuyT+2Dw0f4nF6Lb5U2/7dD8/gO1shUXevXTcOuhLj1lVMOynN4dkejCogfQ
 7OuzydzQDyp0GPeNwjKBxultpJ+adDUHRpRjZpvqCu+f30BBcE9P8TFFL51mFFSd
 5nqf/ngi6HPQpjIzif8UMR8pgDgY3x6Ww4kDrS1yWA5BVy+Nd5cITHqHPkkjbEzT
 FALc3wWKIrn/NhNHGyWNw==
X-ME-Sender: <xms:BJhuaSbEzFcWy9Pk6146wE82fhYm_CxjTiFHqGZKgwA0vYGamqcSmg>
 <xme:BJhuaSwoBnyfk0eKn4-Aohsxi2pWCriN6dRenPPaxnkZL7_MsdqbsQlFS_j1eycjJ
 snQClQFRDDxmckQGHACK4fSLzS3RfNjJQu9JuQvNfYNBDMQpQ>
X-ME-Received: <xmr:BJhuaSJdRJMi7-ZpoAEIl9nJ6TzUD9unJMV7r6q_QrUGstq03Bv3pQ2jFX3ElyETlEyXOOSz_dMOZCxbyCO3448TMs1hLaDXJLozABR1b4SI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufeekheehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurheptgfgggfhvfevufgjfhffkfhrsehtqhertddttdejnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epleejtdefgeeukeeiteduveehudevfeffvedutefgteduhfegvdfgtdeigeeuudejnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
 esohifnhhmrghilhdrnhgvthdpnhgspghrtghpthhtohepjedvpdhmohguvgepshhmthhp
 ohhuthdprhgtphhtthhopehvihhrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhkpd
 hrtghpthhtohepghhuohgthhhunhhhrghisehvihhvohdrtghomhdprhgtphhtthhopehl
 ihhnuhigqdigfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
 hugidquhhnihhonhhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
 ihhnuhigqdhnihhlfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
 hinhhugidqnhhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
 uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
 hnuhigqdhfshguvghvvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
 lhhinhhugidqvgigthegsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:BJhuaSBO9clKpBY1c8tqtIkxX8-Yutqel2bbB8TbvrqddamOXX7Ykg>
 <xmx:BJhuaRhuOPQDyCA_KFYnfcdaAOzKUXr3io07nJfde0jw7wudsjV9Bg>
 <xmx:BJhuade95jkbwLWPmv5m35H6i7zd7TYoRjmUJ2fQMpOWq-IJ6QyQ1w>
 <xmx:BJhuaelSBffgMjviuHAjgSaIv0cuzLl42YuUELeDiPJYohFPRx_JkA>
 <xmx:B5huacYgAtwv-dw4ucg_ORya8hJwBFrWvyIGFRHLnxavffYq8g3321NH>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jan 2026 15:45:39 -0500 (EST)
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Christian Brauner" <brauner@kernel.org>
In-reply-to: <20260119-kanufahren-meerjungfrau-775048806544@brauner>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>,
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>,
 <9c99197dde2eafa55a1b55dce2f0d4d02c77340a.camel@kernel.org>,
 <176877859306.16766.15009835437490907207@noble.neil.brown.name>,
 <aW3SAKIr_QsnEE5Q@infradead.org>,
 <176880736225.16766.4203157325432990313@noble.neil.brown.name>,
 <20260119-kanufahren-meerjungfrau-775048806544@brauner>
Date: Tue, 20 Jan 2026 07:45:35 +1100
Message-id: <176885553525.16766.291581709413217562@noble.neil.brown.name>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 19 Jan 2026, Christian Brauner wrote: > On Mon, Jan
 19, 2026 at 06:22:42PM +1100, NeilBrown wrote: > > On Mon, 19 Jan 2026,
 Christoph
 Hellwig wrote: > > > On Mon, Jan 19, 2026 at 10:23:13AM +1 [...] 
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
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [neilb(at)ownmail.net]
X-Headers-End: 1vhw8V-0003Jb-FO
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
Reply-To: NeilBrown <neil@brown.name>
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

On Mon, 19 Jan 2026, Christian Brauner wrote:
> On Mon, Jan 19, 2026 at 06:22:42PM +1100, NeilBrown wrote:
> > On Mon, 19 Jan 2026, Christoph Hellwig wrote:
> > > On Mon, Jan 19, 2026 at 10:23:13AM +1100, NeilBrown wrote:
> > > > > This was Chuck's suggested name. His point was that STABLE means that
> > > > > the FH's don't change during the lifetime of the file.
> > > > > 
> > > > > I don't much care about the flag name, so if everyone likes PERSISTENT
> > > > > better I'll roll with that.
> > > > 
> > > > I don't like PERSISTENT.
> > > > I'd rather call a spade a spade.
> > > > 
> > > >   EXPORT_OP_SUPPORTS_NFS_EXPORT
> > > > or
> > > >   EXPORT_OP_NOT_NFS_COMPATIBLE
> > > > 
> > > > The issue here is NFS export and indirection doesn't bring any benefits.
> > > 
> > > No, it absolutely is not.  And the whole concept of calling something
> > > after the initial or main use is a recipe for a mess.
> > 
> > We are calling it for it's only use.  If there was ever another use, we
> > could change the name if that made sense.  It is not a public name, it
> > is easy to change.
> > 
> > > 
> > > Pick a name that conveys what the flag is about, and document those
> > > semantics well.  This flag is about the fact that for a given file,
> > > as long as that file exists in the file system the handle is stable.
> > > Both stable and persistent are suitable for that, nfs is everything
> > > but.
> > 
> > My understanding is that kernfs would not get the flag.
> > kernfs filehandles do not change as long as the file exist.
> > But this is not sufficient for the files to be usefully exported.
> > 
> > I suspect kernfs does re-use filehandles relatively soon after the
> > file/object has been destroyed.  Maybe that is the real problem here:
> > filehandle reuse, not filehandle stability.
> > 
> > Jeff: could you please give details (and preserve them in future cover
> > letters) of which filesystems are known to have problems and what
> > exactly those problems are?
> > 
> > > 
> > > Remember nfs also support volatile file handles, and other applications
> > > might rely on this (I know of quite a few user space applications that
> > > do, but they are kinda hardwired to xfs anyway).
> > 
> > The NFS protocol supports volatile file handles.  knfsd does not.
> > So maybe
> >   EXPORT_OP_NOT_NFSD_COMPATIBLE
> > might be better.  or EXPORT_OP_NOT_LINUX_NFSD_COMPATIBLE.
> > (I prefer opt-out rather than opt-in because nfsd export was the
> > original purpose of export_operations, but it isn't something
> > I would fight for)
> 
> I prefer one of the variants you proposed here but I don't particularly
> care. It's not a hill worth dying on. So if Christoph insists on the
> other name then I say let's just go with it.
> 

This sounds like you are recommending that we give in to bullying.
I would rather the decision be made based on the facts of the case, not
the opinions that are stated most bluntly.

I actually think that what Christoph wants is actually quite different
from what Jeff wants, and maybe two flags are needed.  But I don't yet
have a clear understanding of what Christoph wants, so I cannot be sure.

NeilBrown



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
