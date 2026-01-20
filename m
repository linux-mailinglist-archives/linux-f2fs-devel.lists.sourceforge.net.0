Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B781DD3C3E8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 10:42:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:Message-id:Date:References:In-reply-to:To:From:MIME-Version:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RcVVhDG/N/EfIbMIWW1PMZ8smZxjEkaEv0D6g/UUXqk=; b=TLxiAiuEovKXf1cYcB5Fcyy9ye
	6e/iyNGVSWR86FIXa2qxMkEAU2RRUwchUQS/6SrPEQnzbVBhLnQ3VxyHsL7CRSYfe75xvQ1wbAzoj
	rf7EG4p0s5KzjcxiKuPSGj7cr9sJKuncRoroL6t67EoF+a4Qsa6TsT7jJG+dlpaXF2QM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vi8Fo-0000xk-Gt;
	Tue, 20 Jan 2026 09:42:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <neilb@ownmail.net>) id 1vi8Fm-0000xR-Lf;
 Tue, 20 Jan 2026 09:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Message-id:Date:References:In-reply-to:
 Subject:Cc:To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:Sender
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8LV/m+2BySRP4UTa8KO6B5ANmTiLCS01qCPx3K33a4E=; b=az6+pmQeM/NK37qjA3FXPABTPF
 mGRElVvzvk5ZsXTTVFryW5pCMX9B+iDePzRQfOHOOjIIQt5HJdpE8tO9o0ED23QpRQ5xaEvXNsLCT
 U3+mORNF5f4dGLa4kP7cMJKIqvhQhEUc/KXfmpiRxM+3uYRuXq/LcokxmAL3f0FAdro0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Reply-To:Message-id:Date:References:In-reply-to:Subject:Cc:To:From:
 MIME-Version:Content-Transfer-Encoding:Content-Type:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8LV/m+2BySRP4UTa8KO6B5ANmTiLCS01qCPx3K33a4E=; b=P3kRVzDOBNkSB4mocmtLPDUp1g
 7ot3WdoaqjypjkbpyMMBG8JfappfyuHa6fQkLb6kRbL0FZZmW7PocgT5+XKevXNyczL2BcXk7fkXF
 aGJVXsOKMVN/hSdRD4hv872MnaLmRC08/xMwFmpjG4duIa1u5sBx5Qk1Djge9jL64t1w=;
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vi8Fm-0000Hp-0J; Tue, 20 Jan 2026 09:42:26 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailflow.stl.internal (Postfix) with ESMTP id 69A65130083C;
 Tue, 20 Jan 2026 04:42:13 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Tue, 20 Jan 2026 04:42:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm2; t=
 1768902133; x=1768909333; bh=8LV/m+2BySRP4UTa8KO6B5ANmTiLCS01qCP
 x3K33a4E=; b=QBLgYxDPwqb8F/HKOO4s4mzyuJJ5MMUd1laQIcZ9FLfjSQIHZc+
 1PekC9F5KiYouciRAURW5scRiZfUfVf+lHhWler9vaCX34KwsDgrcH+K5GMcSPhm
 01zfr2TzcAnR+XzN7ZoF4Ce1ogYn2127mD1CbQtGo5JcXSrLM5DudreAqJPMM+d1
 pEZdVLpH1i/ogNehoKQHjAQzn/eGcaPjc942Em7vOAIEwadjFSKz28MGc0I4d8PJ
 d+9coMB/qwxJWZ/EAe0Ypz4WGmhqrnEngeKyp+9XDQoyLvIZ2mymsJ4bkGZ81TV2
 9WZ0ZuIw8lEEQvuro+dbp9T/f1kCrvifu9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768902133; x=
 1768909333; bh=8LV/m+2BySRP4UTa8KO6B5ANmTiLCS01qCPx3K33a4E=; b=I
 lJarExedh8uzTTah/bHx79/YyztFkui/cYw/IFWC48OO9ny2YOytT0/PMAHPrEDb
 AyA1750snwOOTIfNl1On1EDKsnlM6Q77auuvSlGsq3AxJq08dwSFRCRJ1TyTja2v
 +tCSqzwbvZw7q2vVw6dZHjcUAN1pOOX3Zdb9iGaOEaZKjE7VYix7rALrimtuXK4G
 S1EmLbVnF9+emGzsZoKwIU1ZYEvNciORd/LEYYeVM2jaUNvrhdFzl3xvTnxrXXO8
 gSL7ILssNaIMxQAvCboeFOkje0ZJkqebBwPR89zdsWbkDmGoBagFfPVqH96/r7xd
 UUf6p6EbYyj35tCGpABfw==
X-ME-Sender: <xms:801vaS1HQqJTkLN0qOfNxDYR4QEeodh9pOzlm5q1a7-te1bwVk57KQ>
 <xme:801vaY92pFHUjDCZ7ioN3ccEM76jeUEkRPxfdpf9xsPE7OOAmasiRMHpY3FbvAzGy
 Ib4JB5h0uHGt7LJIgiS1xo9p7Tuy3xjN92zLOGtkOHkCRc-bw>
X-ME-Received: <xmr:801vaYkPNCbWybQZ_Z8VogKxTEtLNy5ht-LA6lJgxbV_7j9EyJUyIE6sAp6pW0R92ATQU3P6FFEfKSEQt9nWaYMYiqesHSX-YaV04pjX969V>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugedttdejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:801vac0dgfcvMTCBXINaH24yiyKEFUIE1Ls5XDW5vogt4-eXS0CHcA>
 <xmx:801vaegrkt6HTpXA0iTS6Ch9yRl9FxpkN1c8EoOi51B2W-NRG0Cc9w>
 <xmx:801vaSZ2kk4EgEdqpha3AierzEi87LlnWdGD9QbopkHA9JEx5vqJWw>
 <xmx:801vaRWFkRpjMuQy6ymBG7IFYgOaPEcaBxpo8w9DagSZ9_XbM_Rmug>
 <xmx:9U1vaQUrUz_-VltF1IDMQy_Zdp8PR5Bulioc2EaRPWdDYTmHji8Q8eiD>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jan 2026 04:41:53 -0500 (EST)
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Christian Brauner" <brauner@kernel.org>
In-reply-to: <20260120-entmilitarisieren-wanken-afd04b910897@brauner>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>,
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>,
 <9c99197dde2eafa55a1b55dce2f0d4d02c77340a.camel@kernel.org>,
 <176877859306.16766.15009835437490907207@noble.neil.brown.name>,
 <aW3SAKIr_QsnEE5Q@infradead.org>,
 <176880736225.16766.4203157325432990313@noble.neil.brown.name>,
 <20260119-kanufahren-meerjungfrau-775048806544@brauner>,
 <176885553525.16766.291581709413217562@noble.neil.brown.name>,
 <20260120-entmilitarisieren-wanken-afd04b910897@brauner>
Date: Tue, 20 Jan 2026 20:41:50 +1100
Message-id: <176890211061.16766.16354247063052030403@noble.neil.brown.name>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 20 Jan 2026, Christian Brauner wrote: > On Tue, Jan
 20, 2026 at 07:45:35AM +1100, NeilBrown wrote: > > On Mon, 19 Jan 2026,
 Christian
 Brauner wrote: > > > On Mon, Jan 19, 2026 at 06:22:42PM +1 [...] 
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
X-Headers-End: 1vi8Fm-0000Hp-0J
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

On Tue, 20 Jan 2026, Christian Brauner wrote:
> On Tue, Jan 20, 2026 at 07:45:35AM +1100, NeilBrown wrote:
> > On Mon, 19 Jan 2026, Christian Brauner wrote:
> > > On Mon, Jan 19, 2026 at 06:22:42PM +1100, NeilBrown wrote:
> > > > On Mon, 19 Jan 2026, Christoph Hellwig wrote:
> > > > > On Mon, Jan 19, 2026 at 10:23:13AM +1100, NeilBrown wrote:
> > > > > > > This was Chuck's suggested name. His point was that STABLE means that
> > > > > > > the FH's don't change during the lifetime of the file.
> > > > > > > 
> > > > > > > I don't much care about the flag name, so if everyone likes PERSISTENT
> > > > > > > better I'll roll with that.
> > > > > > 
> > > > > > I don't like PERSISTENT.
> > > > > > I'd rather call a spade a spade.
> > > > > > 
> > > > > >   EXPORT_OP_SUPPORTS_NFS_EXPORT
> > > > > > or
> > > > > >   EXPORT_OP_NOT_NFS_COMPATIBLE
> > > > > > 
> > > > > > The issue here is NFS export and indirection doesn't bring any benefits.
> > > > > 
> > > > > No, it absolutely is not.  And the whole concept of calling something
> > > > > after the initial or main use is a recipe for a mess.
> > > > 
> > > > We are calling it for it's only use.  If there was ever another use, we
> > > > could change the name if that made sense.  It is not a public name, it
> > > > is easy to change.
> > > > 
> > > > > 
> > > > > Pick a name that conveys what the flag is about, and document those
> > > > > semantics well.  This flag is about the fact that for a given file,
> > > > > as long as that file exists in the file system the handle is stable.
> > > > > Both stable and persistent are suitable for that, nfs is everything
> > > > > but.
> > > > 
> > > > My understanding is that kernfs would not get the flag.
> > > > kernfs filehandles do not change as long as the file exist.
> > > > But this is not sufficient for the files to be usefully exported.
> > > > 
> > > > I suspect kernfs does re-use filehandles relatively soon after the
> > > > file/object has been destroyed.  Maybe that is the real problem here:
> > > > filehandle reuse, not filehandle stability.
> > > > 
> > > > Jeff: could you please give details (and preserve them in future cover
> > > > letters) of which filesystems are known to have problems and what
> > > > exactly those problems are?
> > > > 
> > > > > 
> > > > > Remember nfs also support volatile file handles, and other applications
> > > > > might rely on this (I know of quite a few user space applications that
> > > > > do, but they are kinda hardwired to xfs anyway).
> > > > 
> > > > The NFS protocol supports volatile file handles.  knfsd does not.
> > > > So maybe
> > > >   EXPORT_OP_NOT_NFSD_COMPATIBLE
> > > > might be better.  or EXPORT_OP_NOT_LINUX_NFSD_COMPATIBLE.
> > > > (I prefer opt-out rather than opt-in because nfsd export was the
> > > > original purpose of export_operations, but it isn't something
> > > > I would fight for)
> > > 
> > > I prefer one of the variants you proposed here but I don't particularly
> > > care. It's not a hill worth dying on. So if Christoph insists on the
> > > other name then I say let's just go with it.
> > > 
> > 
> > This sounds like you are recommending that we give in to bullying.
> > I would rather the decision be made based on the facts of the case, not
> > the opinions that are stated most bluntly.
> > 
> > I actually think that what Christoph wants is actually quite different
> > from what Jeff wants, and maybe two flags are needed.  But I don't yet
> > have a clear understanding of what Christoph wants, so I cannot be sure.
> 
> I've tried to indirectly ask whether you would be willing to compromise
> here or whether you want to insist on your alternative name. Apparently
> that didn't come through.

This would be the "not a hill worthy dying on" part of your statement.
I think I see that implication now.
But no, I don't think compromise is relevant.  I think the problem
statement as originally given by Jeff is misleading, and people have
been misled to an incorrect name.

> 
> I'm unclear what your goal is in suggesting that I recommend "we" give
> into bullying. All it achieved was to further derail this thread.
> 

The "We" is the same as the "us" in "let's just go with it".


> I also think it's not very helpful at v6 of the discussion to start
> figuring out what the actual key rift between Jeff's and Christoph's
> position is. If you've figured it out and gotten an agreement and this
> is already in, send a follow-up series.

v6?  v2 was posted today.  But maybe you are referring the some other
precursors.

The introductory statement in v2 is

   This patchset adds a flag that indicates whether the filesystem supports
   stable filehandles (i.e. that they don't change over the life of the
   file). It then makes any filesystem that doesn't set that flag
   ineligible for nfsd export.

Nobody else questioned the validity of that.  I do.
No evidence was given that there are *any* filesystems that don't
support stable filehandles.  The only filesystem mentioned is cgroups
and it DOES provide stable filehandles.

NeilBrown


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
