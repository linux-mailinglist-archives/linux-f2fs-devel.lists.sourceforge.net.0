Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E567D3A006
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 08:36:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:Message-id:Date:References:In-reply-to:To:From:MIME-Version:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kC0+VFuQa/vggbzdPAVedvAnH0nyfVRJHux4/CD5stw=; b=eZAkGYmBiLQWhQu6YWZQd1a26e
	lfL/T8B6EWXQ/wd2JlCLA1brXCvusg833o8DldyXTPv/iPbYjCPwD1uRPvI8lAUs8JMFiH/XoQo/D
	aC/KmPMN5qrWZH8A34kQypHS6JaoEF8I3sKIQLlxWh4qH6g9Kb3gVC5C6GZjgFK7XMYs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhjnw-0000L4-Ks;
	Mon, 19 Jan 2026 07:36:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <neilb@ownmail.net>) id 1vhjnu-0000Kk-NR;
 Mon, 19 Jan 2026 07:36:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Message-id:Date:References:In-reply-to:
 Subject:Cc:To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:Sender
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l0q9OiSiL57A1oXpVwou+Qazcwu9lF8/fKQyDTZuHuY=; b=GRHaQh2BVAbTXy5XLQ/yMZWJw3
 c2peVYG/+iN5nOxsYzyvm7CuDEThW25Qa6xDmpUKeBzesNj3HaY8OwxWoTFBIdMeZvSt1HVDQWO0m
 rXjsoU3m3PGwf7//qeJDhJ2aTxV3Ziia/FsYtX975tOI4K0j+ABgPrRze3VLb1GkIl3A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Reply-To:Message-id:Date:References:In-reply-to:Subject:Cc:To:From:
 MIME-Version:Content-Transfer-Encoding:Content-Type:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l0q9OiSiL57A1oXpVwou+Qazcwu9lF8/fKQyDTZuHuY=; b=AypjKx28CT5BK8D4iZxhGuvlhr
 58QQBuumINT4n2A9LvSXyWtxVae9ffuAVCqDByxRKMop0jL5Z6X6RRwmckmd7ddTzT09om8SbzSdb
 hhVIdNHtzsjTmmjxSQBOUH+vhzwnYPQs6EQqtDphQI2Ojf6IASv4xKIA6OzDAwNHkzGg=;
Received: from flow-b2-smtp.messagingengine.com ([202.12.124.137])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhjnt-0001Qn-Pb; Mon, 19 Jan 2026 07:36:02 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailflow.stl.internal (Postfix) with ESMTP id 3219E130103E;
 Mon, 19 Jan 2026 02:23:06 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Mon, 19 Jan 2026 02:23:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm2; t=
 1768807386; x=1768814586; bh=l0q9OiSiL57A1oXpVwou+Qazcwu9lF8/fKQ
 yDTZuHuY=; b=irDVjFhaz/K8YtiXzQ31MDOgMGCo+Gz//EwM4OijAM0vOKynyB6
 BpwYFZYCEe3o7Gx5L4V6M4FhbipwQNJV0ujCSLBSc5IHezW/FyB/LWZraYVlaMJu
 YnnpUl4JgVLbrNIec+WcKPTR09keVUJuKuo5IR+gQesu/p0p7PhQm/pf+9OgvKR5
 WdaCaILT5Zm8fqMcKW/PAdv1HxPiIM+Z3QX4jypg1fiENCArP/M8KaRMfJ7uYtgT
 cBjjHOj9Mr9wPQirkQS2BYF8pjwZRelVojFvJtbhrJ5l9QZPmQNMkhdcWIaHKOt+
 ltoa8OTg2UGC53H+WAMXgf82R3jVtEKBVww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768807386; x=
 1768814586; bh=l0q9OiSiL57A1oXpVwou+Qazcwu9lF8/fKQyDTZuHuY=; b=K
 8ltski0YBtBzy6uowaabbff8s5zuRDbtUFWXcDtg931MBwRc16+CKDMRYekaXZHk
 LOnd7mQjODx3F7HVmyPZWvLOv8yjti4w+MIAbxpLRgNDP65uPFl9Gfl058RUJHH+
 Fk6+cJVTq4wuDdMq1Z5W9k1ZuC7iRuYcXx1GwUdvxisFOcHq/jX6VpQCI2oyR0CU
 ZM3JKGGiUVRS4Nbh4KzQMT/wi9djnt+fqIQkRVTwyAKauSyNTqZZcQHWI735MH16
 4XBGsVULicKWqCSMDT9bs+x+/xy/Gu1Q6khze7NDCvAP+QvrXTWLwqj3Y9LKIzDB
 XZKhCr7irnaORckcnoZBQ==
X-ME-Sender: <xms:1tttaQEL1zY-cqjAi3LwisLLYig4vGmVFZGnEWqvFdfPu_1cBx4ryQ>
 <xme:1tttadNPXJyKg4i6N7NiajEYCS_ixBqVWnODY0xDbeIYm-0ddIGPmXX4nPobqTrUH
 FdEox9n77yL1V53kkmfQXZnVrRbAt8y41xmdzHA26xbb4UiNw>
X-ME-Received: <xmr:1tttaX2pXmbQvkTPzq0NQg4Hf4lyVdk2Kt7K2P2YoY0rgkMkSP0qEY7AWJnIFHDorFcLBSqfoL6DkzzzXRH8ujZGIJqMnM5xQhHy1RkjUWf6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufeeileeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurheptgfgggfhvfevufgjfhffkfhrsehtjeertddttdejnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epudetfefhudevhedvfeeufedvffekveekgfdtfefggfekheejgefhteeihffggfelnecu
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
X-ME-Proxy: <xmx:1tttabHi5RQs76Xz74nOwWrYIZ47zQ7Zj71gIm-NgtkzokJPtBcMHA>
 <xmx:1tttafzYjiWXRjDGlVz6_k-3h2GeOsbL3CzwIMyCt37eR3PuktBG4w>
 <xmx:1tttaaofGHLgl2z91oIIPm_yXGWHUeCGCqWi64kkrnWVR5nBeLXySA>
 <xmx:1tttaUlKdw4URdR2-6lB_1IM56jb7LL9_P5nu35Q0sPULNdt9mAF_A>
 <xmx:2tttacnPYyzS2rQik0c4UgQtzVVe9-q502rX9-wmNn1taRjPmfmDMIhi>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jan 2026 02:22:45 -0500 (EST)
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Christoph Hellwig" <hch@infradead.org>
In-reply-to: <aW3SAKIr_QsnEE5Q@infradead.org>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>,
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>,
 <9c99197dde2eafa55a1b55dce2f0d4d02c77340a.camel@kernel.org>,
 <176877859306.16766.15009835437490907207@noble.neil.brown.name>,
 <aW3SAKIr_QsnEE5Q@infradead.org>
Date: Mon, 19 Jan 2026 18:22:42 +1100
Message-id: <176880736225.16766.4203157325432990313@noble.neil.brown.name>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 19 Jan 2026, Christoph Hellwig wrote: > On Mon, Jan
 19, 2026 at 10:23:13AM +1100, NeilBrown wrote: > > > This was Chuck's suggested
 name. His point was that STABLE means that > > > the FH's do [...] 
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
X-Headers-End: 1vhjnt-0001Qn-Pb
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
 Dave Kleikamp <shaggy@kernel.org>, linux-nfs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, ocfs2-devel@lists.linux.dev,
 Bharath SM <bharathsm@microsoft.com>, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
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

On Mon, 19 Jan 2026, Christoph Hellwig wrote:
> On Mon, Jan 19, 2026 at 10:23:13AM +1100, NeilBrown wrote:
> > > This was Chuck's suggested name. His point was that STABLE means that
> > > the FH's don't change during the lifetime of the file.
> > > 
> > > I don't much care about the flag name, so if everyone likes PERSISTENT
> > > better I'll roll with that.
> > 
> > I don't like PERSISTENT.
> > I'd rather call a spade a spade.
> > 
> >   EXPORT_OP_SUPPORTS_NFS_EXPORT
> > or
> >   EXPORT_OP_NOT_NFS_COMPATIBLE
> > 
> > The issue here is NFS export and indirection doesn't bring any benefits.
> 
> No, it absolutely is not.  And the whole concept of calling something
> after the initial or main use is a recipe for a mess.

We are calling it for it's only use.  If there was ever another use, we
could change the name if that made sense.  It is not a public name, it
is easy to change.

> 
> Pick a name that conveys what the flag is about, and document those
> semantics well.  This flag is about the fact that for a given file,
> as long as that file exists in the file system the handle is stable.
> Both stable and persistent are suitable for that, nfs is everything
> but.

My understanding is that kernfs would not get the flag.
kernfs filehandles do not change as long as the file exist.
But this is not sufficient for the files to be usefully exported.

I suspect kernfs does re-use filehandles relatively soon after the
file/object has been destroyed.  Maybe that is the real problem here:
filehandle reuse, not filehandle stability.

Jeff: could you please give details (and preserve them in future cover
letters) of which filesystems are known to have problems and what
exactly those problems are?

> 
> Remember nfs also support volatile file handles, and other applications
> might rely on this (I know of quite a few user space applications that
> do, but they are kinda hardwired to xfs anyway).

The NFS protocol supports volatile file handles.  knfsd does not.
So maybe
  EXPORT_OP_NOT_NFSD_COMPATIBLE
might be better.  or EXPORT_OP_NOT_LINUX_NFSD_COMPATIBLE.
(I prefer opt-out rather than opt-in because nfsd export was the
original purpose of export_operations, but it isn't something
I would fight for)

NeilBrown


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
