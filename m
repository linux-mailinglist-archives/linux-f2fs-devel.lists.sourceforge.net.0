Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DDBD23286
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 09:33:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLs4bkQkWODpxb9lpsShDESLHvQRJeRUf/joKLzx/GY=; b=OBvxvWodORLb7/vTEEgG+mLde/
	S6WZFtH3JPPUq/t1BtfStZHaGhUgQ6mgqobvgl1d/as1O/L1bZW/e4SjP5VOT5nU+am6PUvtyXE7y
	T8hDivkdHH2n1uo5nIQQ4Mq+4F9GW88AiF2uwXTq+ZEH0LN9x7Cz7pfiyjeTjEvZ5wuI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgInb-0008HB-A1;
	Thu, 15 Jan 2026 08:33:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+cdf73ff56b16bd1381a0+8180+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vgInZ-0008Gn-1a; Thu, 15 Jan 2026 08:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ggIby7ZJJhhdPb6y5rH3a2GAOEpyxb4btFDkRofMARo=; b=TtODUel1RYOZvJ2atz0Vw4/bMy
 Jh5oodRKLwQueV3lAXKJG+8PZtY79pK6/Ru1vc5fMwal5ultEUauqynYXAA41AjnJ4iGsIpB2HnGa
 OAI159YgIq1iz+JvSaEVHM1+LR+Jz0JXo3x7BVC1snx5+1yr7EXxqVOjf6a/fJpe7laQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ggIby7ZJJhhdPb6y5rH3a2GAOEpyxb4btFDkRofMARo=; b=F2wdmfJGs/1qZP9a+NMR16AQ3g
 IdAqoqYysceUuKJ0H5+IwSe+wecSD7lKxpIWmbB17dpgq8F8AvIyOFd/lBkfN+gQ24IpZkqgDazmW
 YXoztshu3HyEgVZ2yWOZJihlltK8nrdxepSUQW8TkYrQyYxwaESgNBFWAS5kQmlMf/nU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgInZ-0007Rv-Al; Thu, 15 Jan 2026 08:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ggIby7ZJJhhdPb6y5rH3a2GAOEpyxb4btFDkRofMARo=; b=c+60rQr76h1PsKAd5LgZT9hsxs
 aNKhr+6hZylxOZstJG/1DgKDn3jLBV6CLqh93j+WnurQG7htCVWPbVvx6tOOUVmORqsU2McpPOkHx
 u9JemdngkpC4GOWQM49sG2cFmQXbWsrsABlaLCyNQvNPEl+M5kVweygSwI21MwVsu9pML78e/uHxP
 vmIIVXx4fyMCNx3hPFAoWaY/UvrDQx3Aoog9gQ+mt7L4rBcvXKQQLFteJUrzRcG5+ThbjMMlIeFyn
 n6rc9wHtWg+gNCftYd7qw5Q1lztuERemrK6iJ3CvqvoWgP9e6ucBOBNhWhZlZCMCcpDFLJa8qwA8J
 WF22tmyA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vgImu-0000000C08y-0V2p;
 Thu, 15 Jan 2026 08:33:04 +0000
Date: Thu, 15 Jan 2026 00:33:04 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Christian Brauner <brauner@kernel.org>
Message-ID: <aWimQEokuib7fXjY@infradead.org>
References: <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
 <20260113-mondlicht-raven-82fc4eb70e9d@brauner>
 <aWZcoyQLvbJKUxDU@infradead.org>
 <ce418800f06aa61a7f47f0d19394988f87a3da07.camel@kernel.org>
 <aWc3mwBNs8LNFN4W@infradead.org>
 <CAOQ4uxhMjitW_DC9WK9eku51gE1Ft+ENhD=qq3uehwrHO=RByA@mail.gmail.com>
 <aWeUv2UUJ_NdgozS@infradead.org>
 <20260114-klarstellen-blamieren-0b7d40182800@brauner>
 <aWiMaMwI6nYGX9Bq@infradead.org>
 <20260115-inspektion-kochbuch-505d8f94829e@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115-inspektion-kochbuch-505d8f94829e@brauner>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 15, 2026 at 09:14:06AM +0100, Christian Brauner
 wrote: > On Wed, Jan 14, 2026 at 10:42:48PM -0800, Christoph Hellwig wrote:
 > > On Wed, Jan 14, 2026 at 04:20:13PM +0100, Christian Brauner [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1vgInZ-0007Rv-Al
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
 Christoph Hellwig <hch@infradead.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 linux-mm@kvack.org, Viacheslav Dubeyko <slava@dubeyko.com>,
 linux-btrfs@vger.kernel.org, Gao Xiang <xiang@kernel.org>,
 linux-ext4@vger.kernel.org, Salah Triki <salah.triki@gmail.com>,
 Carlos Maiolino <cem@kernel.org>, Dominique Martinet <asmadeus@codewreck.org>,
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

On Thu, Jan 15, 2026 at 09:14:06AM +0100, Christian Brauner wrote:
> On Wed, Jan 14, 2026 at 10:42:48PM -0800, Christoph Hellwig wrote:
> > On Wed, Jan 14, 2026 at 04:20:13PM +0100, Christian Brauner wrote:
> > > > You're still think of it the wrong way.  If we do have file systems
> > > > that break the original exportfs semantics we need to fix that, and
> > > > something like a "stable handles" flag will work well for that.  But
> > > > a totally arbitrary "is exportable" flag is total nonsense.
> > > 
> > > File handles can legitimately be conceptualized independently of
> > > exporting a filesystem. If we wanted to tear those concepts apart
> > > implementation wise we could.
> > > 
> > > It is complete nonsense to expect the kernel to support exporting any
> > > arbitrary internal filesystem or to not support file handles at all.
> > 
> > You are going even further down the path of entirely missing the point
> > (or the two points by now).
> 
> You're arguing for the sake of arguing imho. You're getting exactly what
> we're all saying as evidenced by the last paragraph in your mail: it is
> entirely what this whole thing is about.

I can't even parse what you mean.  And no, I hate these stupid
arguments, and I have much better things to do than dragging this on.

> > If a file systems meets all technical requirements of being nfsd
> > exportable and the users asks for it, it is not our job to make an
> > arbitrary policy decision to say no.
> 
> This is an entirely irrelevant point because we're talking about
> cgroupfs, nsfs, and pidfs. And they don't meet this criteria. cgroupfs
> is a _local resource management filesystem_ why would we ever want to
> support exporting it over the network. It allows to break the local
> delegation model as I've explained. cgroupfs shows _local processes_. So
> a server will see completely nonsensical PID identifiers listed in
> cgroup files and it can fsck around with processes in a remote system.

None of that is a technical argument.  The lack of stable file handles
would be one, and I think we came to the conclusion yesterday that
this is the case.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
