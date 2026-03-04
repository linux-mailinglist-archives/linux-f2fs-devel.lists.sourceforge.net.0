Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EO62LHGyqGlSwgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 23:30:09 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C0C2089C7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 23:30:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jd9q7dkNaL6kX2IqWsq8g3R9vtiY8mPtsc90myO2gc=; b=BCzHyWlSvZjKV2m+Dv0i7jwMek
	P52c5SSljhD1Pa9b5UortJecQLbvxI9KOM1UMUD7xxc8URWcY2cIpBsh3NsXv0KFdKqBByA3NCUck
	46lvrOmM0cmK39xYOKxk2xy8MYiGzhbLpKk2mcnzSXMVU1jXJsXWfnRIZKAd7Swc4fBQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxujB-00013y-SF;
	Wed, 04 Mar 2026 22:30:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <snitzer@kernel.org>) id 1vxuj9-00012y-T9;
 Wed, 04 Mar 2026 22:29:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y991QtG6j5sWEn7tCxDN9XrWk0OhMXb9gnZCLaNNkH4=; b=Ymf0ZLFk4BECwBpobdlOPpovKi
 uVkb0DBCaOyfzASo2KkwRvMqfgvd2TWUZiEhT2I+k7azWw5b0pUCCPDJMTLeLPzGFrCi+V2Y0ytTZ
 qeXA6P+wzDaBtEpmeqyxw7dI4VUTs9NKHQpj6jvXfkJxdi/e6DcF725RixrwR7JKR83s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y991QtG6j5sWEn7tCxDN9XrWk0OhMXb9gnZCLaNNkH4=; b=bMUmDEe12DGh8mchpWMhSEm0nf
 hjeKlkTGNvR45WdzJy/Fu1M2oIGonynnXSftQbkAcBk6zbcrV+VYRTdc9IvWbajDy6T9r0J46gQwl
 2eh5qAw/ZDvfyh/xcpF41E3HCOpMuBHD7EdACNvLqOcWSYkaqx5HiXIPSOXCTJfuJ7OY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxuj9-00020z-8G; Wed, 04 Mar 2026 22:29:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 526FB43E93;
 Wed,  4 Mar 2026 22:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E566C4CEF7;
 Wed,  4 Mar 2026 22:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772663388;
 bh=4g9Hc6BCi1UzcQ6UmFUsAKXtEqFK6/wIIRnu62xorDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H7E6g6Lm08bdby4/2tHEolh5uuAfzAVSsM3yLpncdqLzpMpx2R/jiaVVx3BrpUlHV
 zLgQZLl3q+J8YOTxOWa4cFn0qM9qtzHl3urpYxu/J8dk/Ng4eTR5ve5/MwMG2EM0x4
 13hRsUgqaHxQn1bDCNJafYTopHM59GSiSSfWDaMrsTRgNMP0a8wibVOr0aBrw1II97
 INDpQBDBhw/6g/ZfJeCr4GjGF8S8trfaYHGCsvv3rBpIoZHp4hfWrZiyJa1NX9T5Ya
 lxm3zNjb7ZsIhtDD0mqurpzxaf9es4FePOHSAnjX78l7+ajL920pZ2wjsA901PjGJl
 9YO9TEkdx8L9Q==
Date: Wed, 4 Mar 2026 17:29:46 -0500
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <aaiyWlJelhHju741@kernel.org>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <20260108-setlease-6-20-v1-24-ea4dec9b67fa@kernel.org>
 <aZ84VRrRVyGEzSJn@kernel.org>
 <e07e9b893ca04ce6ead4790e72c7f285a7159070.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e07e9b893ca04ce6ead4790e72c7f285a7159070.camel@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Mar 04, 2026 at 11:59:32AM -0500, Jeff Layton wrote:
 > On Wed, 2026-02-25 at 12:58 -0500, Mike Snitzer wrote: > > On Thu, Jan
 08, 2026 at 12:13:19PM -0500, Jeff Layton wrote: > > > Setting ->s [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vxuj9-00020z-8G
Subject: Re: [f2fs-dev] [PATCH 24/24] fs: remove simple_nosetlease()
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
From: Mike Snitzer via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Mike Snitzer <snitzer@kernel.org>
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
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, Tom Talpey <tom@talpey.com>,
 ocfs2-devel@lists.linux.dev, Bharath SM <bharathsm@microsoft.com>,
 linux-nilfs@vger.kernel.org, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, Hans de Goede <hansg@kernel.org>,
 gfs2@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 linux-erofs@lists.ozlabs.org, v9fs@lists.linux.dev,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
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
X-Rspamd-Queue-Id: B9C0C2089C7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[85];
	ARC_NA(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ionkov.net,kernel.org,gmail.com,suse.cz,manguebit.org,google.com,omnibond.com,sony.com,alarsen.net,lists.sourceforge.net,vger.kernel.org,paragon-software.com,fb.com,dilger.ca,vivo.com,lists.infradead.org,redhat.com,szeredi.hu,lists.samba.org,nod.at,fasheh.com,lists.orangefs.org,infradead.org,lists.linux.dev,linux.alibaba.com,kvack.org,dubeyko.com,codewreck.org,microsoft.com,crudebyte.com,talpey.com,suse.com,zeniv.linux.org.uk,mail.parknet.co.jp,mit.edu,fluxnic.net,lists.ozlabs.org,lwn.net,samba.org,oracle.com,huawei.com,squashfs.org.uk,linux-foundation.org,samsung.com,evilplan.org];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	NEURAL_HAM(-0.00)[-1.000];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[snitzer@kernel.org]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 11:59:32AM -0500, Jeff Layton wrote:
> On Wed, 2026-02-25 at 12:58 -0500, Mike Snitzer wrote:
> > On Thu, Jan 08, 2026 at 12:13:19PM -0500, Jeff Layton wrote:
> > > Setting ->setlease() to a NULL pointer now has the same effect as
> > > setting it to simple_nosetlease(). Remove all of the setlease
> > > file_operations that are set to simple_nosetlease, and the function
> > > itself.
> > > 
> > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > > ---
> > >  fs/9p/vfs_dir.c        |  2 --
> > >  fs/9p/vfs_file.c       |  2 --
> > >  fs/ceph/dir.c          |  2 --
> > >  fs/ceph/file.c         |  1 -
> > >  fs/fuse/dir.c          |  1 -
> > >  fs/gfs2/file.c         |  2 --
> > >  fs/libfs.c             | 18 ------------------
> > >  fs/nfs/dir.c           |  1 -
> > >  fs/nfs/file.c          |  1 -
> > >  fs/smb/client/cifsfs.c |  1 -
> > >  fs/vboxsf/dir.c        |  1 -
> > >  fs/vboxsf/file.c       |  1 -
> > >  include/linux/fs.h     |  1 -
> > >  13 files changed, 34 deletions(-)
> > > 
> > 
> > <snip>
> > 
> > > diff --git a/fs/libfs.c b/fs/libfs.c
> > > index 697c6d5fc12786c036f0086886297fb5cd52ae00..f1860dff86f2703266beecf31e9d2667af7a9684 100644
> > > --- a/fs/libfs.c
> > > +++ b/fs/libfs.c
> > > @@ -1699,24 +1699,6 @@ struct inode *alloc_anon_inode(struct super_block *s)
> > >  }
> > >  EXPORT_SYMBOL(alloc_anon_inode);
> > >  
> > > -/**
> > > - * simple_nosetlease - generic helper for prohibiting leases
> > > - * @filp: file pointer
> > > - * @arg: type of lease to obtain
> > > - * @flp: new lease supplied for insertion
> > > - * @priv: private data for lm_setup operation
> > > - *
> > > - * Generic helper for filesystems that do not wish to allow leases to be set.
> > > - * All arguments are ignored and it just returns -EINVAL.
> > > - */
> > > -int
> > > -simple_nosetlease(struct file *filp, int arg, struct file_lease **flp,
> > > -		  void **priv)
> > > -{
> > > -	return -EINVAL;
> > > -}
> > > -EXPORT_SYMBOL(simple_nosetlease);
> > > -
> > >  /**
> > >   * simple_get_link - generic helper to get the target of "fast" symlinks
> > >   * @dentry: not used here
> > > diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
> > > index 71df279febf797880ded19e45528c3df4cea2dde..23a78a742b619dea8b76ddf28f4f59a1c8a015e2 100644
> > > --- a/fs/nfs/dir.c
> > > +++ b/fs/nfs/dir.c
> > > @@ -66,7 +66,6 @@ const struct file_operations nfs_dir_operations = {
> > >  	.open		= nfs_opendir,
> > >  	.release	= nfs_closedir,
> > >  	.fsync		= nfs_fsync_dir,
> > > -	.setlease	= simple_nosetlease,
> > >  };
> > >  
> > >  const struct address_space_operations nfs_dir_aops = {
> > > diff --git a/fs/nfs/file.c b/fs/nfs/file.c
> > > index d020aab40c64ebda30d130b6acee1b9194621457..9d269561961825f88529551b0f0287920960ac62 100644
> > > --- a/fs/nfs/file.c
> > > +++ b/fs/nfs/file.c
> > > @@ -962,7 +962,6 @@ const struct file_operations nfs_file_operations = {
> > >  	.splice_read	= nfs_file_splice_read,
> > >  	.splice_write	= iter_file_splice_write,
> > >  	.check_flags	= nfs_check_flags,
> > > -	.setlease	= simple_nosetlease,
> > >  	.fop_flags	= FOP_DONTCACHE,
> > >  };
> > >  EXPORT_SYMBOL_GPL(nfs_file_operations);
> > 
> > Hey Jeff,
> > 
> > I've noticed an NFS reexport regression in v6.19 and now v7.0-rc1
> > (similar but different due to your series that requires opt-in via
> > .setlease).
> > 
> > Bisect first pointed out this commit:
> > 10dcd5110678 nfs: properly disallow delegation requests on directories
> > 
> > And now with v7.0-rc1 its the fact that NFS doesn't provide .setlease
> > so lstat() on parent dir (of file that I touch) gets -EINVAL.
> > 
> > So its a confluence of NFS's dir delegations and your setlease changes.
> > 
> > If I reexport NFSv4.2 filesystem in terms of NFSv4.1, the regression
> > is seen by doing (lstat reproducer that gemini spit out for me is
> > attached):
> > 
> > $ touch /mnt/share41/test
> > $ strace ./lstat /mnt/share41
> > ...
> > lstat("/mnt/share41", 0x7ffec0d79920)   = -1 EINVAL (Invalid argument)
> > 
> > If I immediately re-run it works:
> > ...
> > lstat("/mnt/share41", {st_mode=S_IFDIR|0777, st_size=4096, ...}) = 0
> > 
> > I'm not sure what the proper fix is yet, but I feel like you've missed
> > that NFS itself can be (re)exported?
> > 
> > 
> 
> My apologies. I missed seeing this last week.
> 
> That's a very simple reproducer! That's very strange behavior,
> especially since NFS4 does provide a setlease operation:
> 
> const struct file_operations nfs4_file_operations = {
> 	[...]
> 	.setlease       = nfs4_setlease,
> 	[...]
> };

Huh, not sure how I missed nfs4_setlease...

> I'm not sure why this would cause lstat() to return -EINVAL.

Likewise, especially given nfs4_setlease

> What's happening on the wire when this occurs?
> 
> I'll plan to take a look here soon either way.

I'll have to revisit myself, been a bit.

Will let you know.

Thanks,
Mike


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
