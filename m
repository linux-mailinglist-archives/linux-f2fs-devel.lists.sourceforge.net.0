Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2FAD230AA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 09:14:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NHXLzGbs1TjVkFUyB1px/ce4iO5+pt0a9DgQPoOfCY=; b=CD7zkTLm+s3lII6zFdKkbUrUsa
	Lj41ohET8P5Uz/7wp7REXi2ZDFSq9PWHXiw4n+k/7sjxLaNO2H/dETUCOCFWdHlHL7qGKcDMLk/7I
	IGgPpvHP6KEf31jfhwWHbO6Uf8+CmzPBOypdZWD/6Yxsy5YDZKQvdyWTIJ8dSVFm98cU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgIV4-0005ZM-NG;
	Thu, 15 Jan 2026 08:14:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1vgIV3-0005Z7-7t;
 Thu, 15 Jan 2026 08:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FXFHeU8QpH/lQamvGnH1b8chwcMeSz98NW19o+yr6yo=; b=bweIxZzGFQzCx8iS3DjkeKGZcZ
 1ITHPBngtX2xI5/XKNj3AzWE++6lGOXSwm9688Vp2Lcbz6sbpvu29hGjXWdcYP3jogaFRMjfxYyKi
 3WDW+52lj2vSyZEN9FzbVGKJ9VuzZPnGnfshiQxsxAACLzVbsko458V6vdVPHUmrEt3o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FXFHeU8QpH/lQamvGnH1b8chwcMeSz98NW19o+yr6yo=; b=c8HjDiAgrJYpFY2F32IQgXFdQa
 Key3yAT18c7IHs1JG4zwXLT4YmZyKvSA0+lutbg/6cx4YPqecnGEFNXIBlO7U64j79XSdW+/Keh1v
 LrYtvbQ/d1X+tfA8IpFky8NLZXRZYJE5Sz2wr2WA8EHqlwRFfcL0H7EqSTKw4G0Er2dI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgIV2-0006EW-6B; Thu, 15 Jan 2026 08:14:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3DB4B406A8;
 Thu, 15 Jan 2026 08:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64986C116D0;
 Thu, 15 Jan 2026 08:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768464870;
 bh=WiSNn2zvCUvnX3icYjakRozNqyZdq45DKgsu3cHWUEo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XnbS2cfpntTwX4GFJAoawDW2AeA5ZSsT+/PONrd75H6dIfGkNvM5vgeSHaOAPv8dM
 FrUnVk8caQ2ZgKDdkW59pGpZdLQn5pXMBsCnewkG8ZRPBAs5NmgswKQgR2jlXOGTLH
 1XC97DnUwAHpyZvcxc/R/9ANrCDd89hPll0MVVz035TWRgfHi07Ohy3FXm8Oi6cHMd
 K1B5BtZtQ3crjd06l/WXb42A7DNOvPmKTEyhkbAB9zRLk0VcQ62qYkO65llb6ehby+
 4dGtOQAqLPZ8prbPHH4nyrrHNN5EkPlne7JgZK52gq0fyn0vzFLiAfA69H2k4JHDn4
 iObH+Pt4IvcIg==
Date: Thu, 15 Jan 2026 09:14:06 +0100
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20260115-inspektion-kochbuch-505d8f94829e@brauner>
References: <cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com>
 <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
 <20260113-mondlicht-raven-82fc4eb70e9d@brauner>
 <aWZcoyQLvbJKUxDU@infradead.org>
 <ce418800f06aa61a7f47f0d19394988f87a3da07.camel@kernel.org>
 <aWc3mwBNs8LNFN4W@infradead.org>
 <CAOQ4uxhMjitW_DC9WK9eku51gE1Ft+ENhD=qq3uehwrHO=RByA@mail.gmail.com>
 <aWeUv2UUJ_NdgozS@infradead.org>
 <20260114-klarstellen-blamieren-0b7d40182800@brauner>
 <aWiMaMwI6nYGX9Bq@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aWiMaMwI6nYGX9Bq@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 14, 2026 at 10:42:48PM -0800, Christoph Hellwig
 wrote: > On Wed, Jan 14, 2026 at 04:20:13PM +0100, Christian Brauner wrote:
 > > > You're still think of it the wrong way. If we do have file [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vgIV2-0006EW-6B
Subject: Re: [f2fs-dev] [PATCH 00/24] vfs: require filesystems to explicitly
 opt-in to lease support
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
 Alexander Aring <alex.aring@gmail.com>, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Sandeep Dhavale <dhavale@google.com>,
 Martin Brandenburg <martin@omnibond.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Anders Larsen <al@alarsen.net>, Amir Goldstein <amir73il@gmail.com>,
 jfs-discussion@lists.sourceforge.net, linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ilya Dryomov <idryomov@gmail.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Yue Hu <zbestahu@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, samba-technical@lists.samba.org,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 devel@lists.orangefs.org, Hugh Dickins <hughd@google.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, ntfs3@lists.linux.dev,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-mm@kvack.org,
 Viacheslav Dubeyko <slava@dubeyko.com>, linux-btrfs@vger.kernel.org,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, Carlos Maiolino <cem@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Shyam Prasad N <sprasad@microsoft.com>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-doc@vger.kernel.org,
 linux-cifs@vger.kernel.org, Tom Talpey <tom@talpey.com>,
 ocfs2-devel@lists.linux.dev, Bharath SM <bharathsm@microsoft.com>,
 linux-nilfs@vger.kernel.org, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, Hans de Goede <hansg@kernel.org>,
 gfs2@lists.linux.dev, linux-nfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 linux-erofs@lists.ozlabs.org, v9fs@lists.linux.dev,
 Jonathan Corbet <corbet@lwn.net>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 Trond Myklebust <trondmy@kernel.org>, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jan 14, 2026 at 10:42:48PM -0800, Christoph Hellwig wrote:
> On Wed, Jan 14, 2026 at 04:20:13PM +0100, Christian Brauner wrote:
> > > You're still think of it the wrong way.  If we do have file systems
> > > that break the original exportfs semantics we need to fix that, and
> > > something like a "stable handles" flag will work well for that.  But
> > > a totally arbitrary "is exportable" flag is total nonsense.
> > 
> > File handles can legitimately be conceptualized independently of
> > exporting a filesystem. If we wanted to tear those concepts apart
> > implementation wise we could.
> > 
> > It is complete nonsense to expect the kernel to support exporting any
> > arbitrary internal filesystem or to not support file handles at all.
> 
> You are going even further down the path of entirely missing the point
> (or the two points by now).

You're arguing for the sake of arguing imho. You're getting exactly what
we're all saying as evidenced by the last paragraph in your mail: it is
entirely what this whole thing is about.

> If a file systems meets all technical requirements of being nfsd
> exportable and the users asks for it, it is not our job to make an
> arbitrary policy decision to say no.

This is an entirely irrelevant point because we're talking about
cgroupfs, nsfs, and pidfs. And they don't meet this criteria. cgroupfs
is a _local resource management filesystem_ why would we ever want to
support exporting it over the network. It allows to break the local
delegation model as I've explained. cgroupfs shows _local processes_. So
a server will see completely nonsensical PID identifiers listed in
cgroup files and it can fsck around with processes in a remote system.
Hard NAK. Entirely irrelevant if that filesystem meets the theoretical
standards.

> If it does not meet the technical requirements it obviously should
> not be exportable.  And it seems like the spread of file handles
> beyond nfs exporting created some ambiguity here, which we need to
> fix.

We are all in agreement here.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
