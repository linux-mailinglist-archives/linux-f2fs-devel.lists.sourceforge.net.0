Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18438D3C2E5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 10:04:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1da64bnxPcj3Kt+5AW6XMOQuKxx+BmIPgFUsDUTHs28=; b=ankK0w2gyHphaBMRz2IYCIAVUo
	7DzS9M5NXR1i4N9XCRjbuUcebwt7QWdOEmYzmmjqz99WFyfYLFFayG9mMD8i6UYeV11FpjBX4yIbB
	/Q7YF8kiZ3cH8udHqGw28AEd16zfLUilY13IMb7TERbaDUi2zqpoxIT+YviECc3HSy3E=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vi7f6-0003Vj-OX;
	Tue, 20 Jan 2026 09:04:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1vi7f4-0003VE-G3;
 Tue, 20 Jan 2026 09:04:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xsSgKIDuo4qDjit1pBG7rOXsILAbrUIuqR6z6YgwzJI=; b=BL9g7Ws0omuExH2PcAEVmMicu5
 14eMJZzT4MYwvW+s8cfVmlgUH5L6rgNZc8j5PmWa6ovUhOqQRRZYAdCWkdtxUCRBSZWqRRZmqwsUM
 wsa6bmYRGOdqw8xVq7vpPniHkhZZDSj3lhlvnlZr1WEyk49X1qjUfaXz2F4JDWp71ti4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xsSgKIDuo4qDjit1pBG7rOXsILAbrUIuqR6z6YgwzJI=; b=lQaiZ+qzELO6hiT2uWAdV2u0Hy
 JPhELj9GbLhDuFdmE83Cn0mEFcZkZDfbkRSGgCcLr4MxfDJD8iTgu4v8TvW/4b0JsKwV+xf2m3ej+
 pHXzpugXDCvM2IC3WaoNmOvS03BqI/VUfOwaQDDicNi+cbDN2MtMOsZ2qLMXigw/JkT4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vi7f4-0005nr-Lp; Tue, 20 Jan 2026 09:04:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E0AFA4412C;
 Tue, 20 Jan 2026 09:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27E6C16AAE;
 Tue, 20 Jan 2026 09:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768899859;
 bh=JhDsyPDpvGvdyDqhxS7TmcgEIlTc18FPxLf75vE9wzQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fGDb6CKy+f5LfPcob1huzIh9QAzk76QrguP0qOMXMNMmAKfWnMvffuvnLOaaLC7ew
 wiubvCikcdnsEOdPZbW0H4zHWxmUCevg43yAEJPXPT7hXH00W12HfQMEdyIDGD9O0j
 nz71osv3r1RJtNqoyCLf3dZK5Tzfa3wtmYACMeGkq0oSzzypljd57xjg95SjtXty51
 UWd/sW/tdqfH5YKWLFRsczUlBeW+ZFhuEDFDscE+KtGNfb9dtk0DPBFCrkx1ut54Lk
 X+2fXMq+FuO5POPWMylL14pwRJfTUXJAHUYehRsOz+2S0efemBjlbHErutvPMV85s8
 rd90Iu7ZfyW+Q==
Date: Tue, 20 Jan 2026 10:04:02 +0100
To: NeilBrown <neil@brown.name>
Message-ID: <20260120-entmilitarisieren-wanken-afd04b910897@brauner>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 <9c99197dde2eafa55a1b55dce2f0d4d02c77340a.camel@kernel.org>
 <176877859306.16766.15009835437490907207@noble.neil.brown.name>
 <aW3SAKIr_QsnEE5Q@infradead.org>
 <176880736225.16766.4203157325432990313@noble.neil.brown.name>
 <20260119-kanufahren-meerjungfrau-775048806544@brauner>
 <176885553525.16766.291581709413217562@noble.neil.brown.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <176885553525.16766.291581709413217562@noble.neil.brown.name>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 20, 2026 at 07:45:35AM +1100, NeilBrown wrote:
 > On Mon, 19 Jan 2026, Christian Brauner wrote: > > On Mon, Jan 19, 2026
 at 06:22:42PM +1100, NeilBrown wrote: > > > On Mon, 19 Jan 2026, Chr [...]
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vi7f4-0005nr-Lp
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

On Tue, Jan 20, 2026 at 07:45:35AM +1100, NeilBrown wrote:
> On Mon, 19 Jan 2026, Christian Brauner wrote:
> > On Mon, Jan 19, 2026 at 06:22:42PM +1100, NeilBrown wrote:
> > > On Mon, 19 Jan 2026, Christoph Hellwig wrote:
> > > > On Mon, Jan 19, 2026 at 10:23:13AM +1100, NeilBrown wrote:
> > > > > > This was Chuck's suggested name. His point was that STABLE means that
> > > > > > the FH's don't change during the lifetime of the file.
> > > > > > 
> > > > > > I don't much care about the flag name, so if everyone likes PERSISTENT
> > > > > > better I'll roll with that.
> > > > > 
> > > > > I don't like PERSISTENT.
> > > > > I'd rather call a spade a spade.
> > > > > 
> > > > >   EXPORT_OP_SUPPORTS_NFS_EXPORT
> > > > > or
> > > > >   EXPORT_OP_NOT_NFS_COMPATIBLE
> > > > > 
> > > > > The issue here is NFS export and indirection doesn't bring any benefits.
> > > > 
> > > > No, it absolutely is not.  And the whole concept of calling something
> > > > after the initial or main use is a recipe for a mess.
> > > 
> > > We are calling it for it's only use.  If there was ever another use, we
> > > could change the name if that made sense.  It is not a public name, it
> > > is easy to change.
> > > 
> > > > 
> > > > Pick a name that conveys what the flag is about, and document those
> > > > semantics well.  This flag is about the fact that for a given file,
> > > > as long as that file exists in the file system the handle is stable.
> > > > Both stable and persistent are suitable for that, nfs is everything
> > > > but.
> > > 
> > > My understanding is that kernfs would not get the flag.
> > > kernfs filehandles do not change as long as the file exist.
> > > But this is not sufficient for the files to be usefully exported.
> > > 
> > > I suspect kernfs does re-use filehandles relatively soon after the
> > > file/object has been destroyed.  Maybe that is the real problem here:
> > > filehandle reuse, not filehandle stability.
> > > 
> > > Jeff: could you please give details (and preserve them in future cover
> > > letters) of which filesystems are known to have problems and what
> > > exactly those problems are?
> > > 
> > > > 
> > > > Remember nfs also support volatile file handles, and other applications
> > > > might rely on this (I know of quite a few user space applications that
> > > > do, but they are kinda hardwired to xfs anyway).
> > > 
> > > The NFS protocol supports volatile file handles.  knfsd does not.
> > > So maybe
> > >   EXPORT_OP_NOT_NFSD_COMPATIBLE
> > > might be better.  or EXPORT_OP_NOT_LINUX_NFSD_COMPATIBLE.
> > > (I prefer opt-out rather than opt-in because nfsd export was the
> > > original purpose of export_operations, but it isn't something
> > > I would fight for)
> > 
> > I prefer one of the variants you proposed here but I don't particularly
> > care. It's not a hill worth dying on. So if Christoph insists on the
> > other name then I say let's just go with it.
> > 
> 
> This sounds like you are recommending that we give in to bullying.
> I would rather the decision be made based on the facts of the case, not
> the opinions that are stated most bluntly.
> 
> I actually think that what Christoph wants is actually quite different
> from what Jeff wants, and maybe two flags are needed.  But I don't yet
> have a clear understanding of what Christoph wants, so I cannot be sure.

I've tried to indirectly ask whether you would be willing to compromise
here or whether you want to insist on your alternative name. Apparently
that didn't come through.

I'm unclear what your goal is in suggesting that I recommend "we" give
into bullying. All it achieved was to further derail this thread.

I also think it's not very helpful at v6 of the discussion to start
figuring out what the actual key rift between Jeff's and Christoph's
position is. If you've figured it out and gotten an agreement and this
is already in, send a follow-up series.

If I don't like it I can always just rename it to EXPORT_OP_DONKEY_KONG
when applying.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
