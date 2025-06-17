Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6696ADC9FF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 13:54:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JaEvjrcAwvZbVxYbyo7qfirba3HoOfg9x+bcSMMZ3wU=; b=N9zZpKiph4bm/nawsbU2pzwjTC
	n6DjUZ2CDSoGlnDgWpC+EaQ/SNDPp7wRKT8pnLV8v6pAv+Zsc0EvwdBaeySeO4p8Tt8BQ5sPfD1qP
	3jnSSadnKld7hdqM8GnsAGEyvl4dvRw5vrJru+rIt/g4rYctFsDgBQ7Z26NGOrJZ+EHk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRUtz-0005XT-2n;
	Tue, 17 Jun 2025 11:54:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1uRUtx-0005XE-QS;
 Tue, 17 Jun 2025 11:54:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M830G6MWsfr8Yer9Q+Whdt4JLPiVfTD/TS3CVpERxzY=; b=F/5/I9Jd1vGW1/9FGW7nYNXzlf
 JUaLVZb27SwkOi5N0dd03wBJRypO3tQ2mSb6m/GgrgNZy8pYeFYEVzeWlAM3l4aPB+PzEfEix/7O1
 x3qzdYbwjTJTFc1Of2mb0VIxwbpwPse58bTfinAGOf5UHj1x+wSsJfRbiWJaAHruwTJI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M830G6MWsfr8Yer9Q+Whdt4JLPiVfTD/TS3CVpERxzY=; b=X9cVRwl/bGKU7lpAJILJMOKZFo
 9OuZcJWzo0uPQ5o226KWwomn2EMVm8rHCSgj/WaYTJanBdj+Ucmf68Ln6E5LRj8SCjY5Kr0I+SyBy
 OYV3ptcWJSN4XhpBhm2Nik/wP5kw+DuKW9OVkQVrsW6eabWaiPQmJhA4tMNPdQD1mJxg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRUtx-00023H-Ai; Tue, 17 Jun 2025 11:54:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E01744A5E1;
 Tue, 17 Jun 2025 11:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE2BC4CEE3;
 Tue, 17 Jun 2025 11:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750161287;
 bh=FM4A89teoGTiVHD+mgfi0AiySK9n5DYBMecgMr0uDqg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tFaXplkY5nyo20ol4Egr1jKpFof+Bu6EVWj8rd7Q/XVflaJDEuUt2QBZbBOzt+ds9
 QqRJ0416pNcF2gR1cOk/fhlCLM2NyYyFsqO7E+6LcmkPsrh7dOxbot5r+EPV6Mf/Eg
 m8Y6DUqcdfGWwY+D64Xca2p2YAi1GLXZEZrvZUt4zBrfooL7qgslbeGTMTkIs72Kmi
 ZyPQ8xq03VfK0FOehVNSaD+X4yl6DS92oWcHFB7su60iMijW1l2mzbjqhQKi8Q2XlY
 I0aiDlWsnalkNnHvD2WZzlIylBsOw4cpNRmvr5us4RCENbN2fbk5X67yCW3LloR+n5
 oLveA9uaTcrqQ==
Date: Tue, 17 Jun 2025 13:54:21 +0200
To: Jan Kara <jack@suse.cz>
Message-ID: <20250617-allenfalls-brummen-3ce2da5794f8@brauner>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
 <08db85970d89b17a995d2cffae96fb4cc462377f.1750099179.git.lorenzo.stoakes@oracle.com>
 <gexpfonlstqrggxbwxlorn7c6qvt42e2dof6lahipfyfecgfru@vexc23jbaxwc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <gexpfonlstqrggxbwxlorn7c6qvt42e2dof6lahipfyfecgfru@vexc23jbaxwc>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 17, 2025 at 12:23:41PM +0200, Jan Kara wrote:
 > On Mon 16-06-25 20:33:28,
 Lorenzo Stoakes wrote: > > Update nearly all generic_file_mmap()
 and generic_file_readonly_mmap() > > callers to u [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uRUtx-00023H-Ai
Subject: Re: [f2fs-dev] [PATCH 09/10] fs: convert most other
 generic_file_*mmap() users to .mmap_prepare()
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, nvdimm@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>, dri-devel@lists.freedesktop.org,
 ceph-devel@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Tyler Hicks <code@tyhicks.com>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, Jan Harkes <jaharkes@cs.cmu.edu>,
 linux-um@lists.infradead.org, Joel Becker <jlbec@evilplan.org>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Eric Van Hensbergen <ericvh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
 Sandeep Dhavale <dhavale@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, Namjae Jeon <linkinjeon@kernel.org>,
 ecryptfs@vger.kernel.org, Yangtao Li <frank.li@vivo.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, ocfs2-devel@lists.linux.dev,
 Pedro Falcato <pfalcato@suse.de>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 linux-block@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net, Hongbo Li <lihongbo22@huawei.com>,
 Anna Schumaker <anna@kernel.org>, Martin Brandenburg <martin@omnibond.com>,
 Kees Cook <kees@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Carlos Maiolino <cem@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Marc Dionne <marc.dionne@auristor.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 linux-afs@lists.infradead.org, Naohiro Aota <naohiro.aota@wdc.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Matthew Wilcox <willy@infradead.org>,
 coda@cs.cmu.edu, Viacheslav Dubeyko <slava@dubeyko.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, intel-gfx@lists.freedesktop.org,
 Damien Le Moal <dlemoal@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Gao Xiang <xiang@kernel.org>,
 David Howells <dhowells@redhat.com>, linux-nfs@vger.kernel.org,
 linux-mm@kvack.org, samba-technical@lists.samba.org,
 Steve French <sfrench@samba.org>, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, jfs-discussion@lists.sourceforge.net,
 linux-aio@kvack.org, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Bob Copeland <me@bobcopeland.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 David Airlie <airlied@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Yue Hu <zbestahu@gmail.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 linux-bcachefs@vger.kernel.org, Jann Horn <jannh@google.com>,
 Josef Bacik <josef@toxicpanda.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Tom Talpey <tom@talpey.com>,
 Hans de Goede <hdegoede@redhat.com>, Bharath SM <bharathsm@microsoft.com>,
 "Tigran A . Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jens Axboe <axboe@kernel.dk>, Sungjong Seo <sj1557.seo@samsung.com>,
 v9fs@lists.linux.dev, Kent Overstreet <kent.overstreet@linux.dev>,
 linux-unionfs@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>,
 Jeffle Xu <jefflexu@linux.alibaba.com>,
 Johannes Berg <johannes@sipsolutions.net>, Johannes Thumshirn <jth@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 17, 2025 at 12:23:41PM +0200, Jan Kara wrote:
> On Mon 16-06-25 20:33:28, Lorenzo Stoakes wrote:
> > Update nearly all generic_file_mmap() and generic_file_readonly_mmap()
> > callers to use generic_file_mmap_prepare() and
> > generic_file_readonly_mmap_prepare() respectively.
> > 
> > We update blkdev, 9p, afs, erofs, ext2, nfs, ntfs3, smb, ubifs and vboxsf
> > file systems this way.
> > 
> > Remaining users we cannot yet update are ecryptfs, fuse and cramfs. The
> > former two are nested file systems that must support any underlying file
> > ssytem, and cramfs inserts a mixed mapping which currently requires a VMA.
> > 
> > Once all file systems have been converted to mmap_prepare(), we can then
> > update nested file systems.
> > 
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
> Overall the patch looks good. Just a couple of notes regarding pointless
> local variable being created...
> 
> > ---
> >  block/fops.c           |  9 +++++----
> >  fs/9p/vfs_file.c       | 11 ++++++-----
> >  fs/afs/file.c          | 11 ++++++-----
> >  fs/erofs/data.c        | 16 +++++++++-------
> >  fs/ext2/file.c         | 12 +++++++-----
> >  fs/nfs/file.c          | 13 +++++++------
> >  fs/nfs/internal.h      |  2 +-
> >  fs/nfs/nfs4file.c      |  2 +-
> >  fs/ntfs3/file.c        | 15 ++++++++-------
> >  fs/smb/client/cifsfs.c | 12 ++++++------
> >  fs/smb/client/cifsfs.h |  4 ++--
> >  fs/smb/client/file.c   | 14 ++++++++------
> >  fs/ubifs/file.c        |  8 ++++----
> >  fs/vboxsf/file.c       |  8 ++++----
> >  14 files changed, 74 insertions(+), 63 deletions(-)
> > 
> > diff --git a/block/fops.c b/block/fops.c
> > index 1309861d4c2c..5a0ebc81e489 100644
> > --- a/block/fops.c
> > +++ b/block/fops.c
> > @@ -911,14 +911,15 @@ static long blkdev_fallocate(struct file *file, int mode, loff_t start,
> >  	return error;
> >  }
> >  
> > -static int blkdev_mmap(struct file *file, struct vm_area_struct *vma)
> > +static int blkdev_mmap_prepare(struct vm_area_desc *desc)
> >  {
> > +	struct file *file = desc->file;
> >  	struct inode *bd_inode = bdev_file_inode(file);
> 
> I guess no need to create 'file' variable here since it has only one use in
> the line above...

Agreed, fixed in-tree.

> > -static int afs_file_mmap(struct file *file, struct vm_area_struct *vma)
> > +static int afs_file_mmap_prepare(struct vm_area_desc *desc)
> >  {
> > +	struct file *file = desc->file;
> >  	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
> 
> Same comment about pointless local variable here as well.

Same.

> > -static int erofs_file_mmap(struct file *file, struct vm_area_struct *vma)
> > +static int erofs_file_mmap_prepare(struct vm_area_desc *desc)
> >  {
> > +	struct file *file = desc->file;
> > +
> >  	if (!IS_DAX(file_inode(file)))
> 
> And here...

Same.

> > -int cifs_file_strict_mmap(struct file *file, struct vm_area_struct *vma)
> > +int cifs_file_strict_mmap_prepare(struct vm_area_desc *desc)
> >  {
> > +	struct file *file = desc->file;
> >  	int xid, rc = 0;
> >  	struct inode *inode = file_inode(file);
> 
> Again pointless local variable 'file' here.

Same.

> > -int cifs_file_mmap(struct file *file, struct vm_area_struct *vma)
> > +int cifs_file_mmap_prepare(struct vm_area_desc *desc)
> >  {
> > +	struct file *file = desc->file;
> >  	int rc, xid;
> 
> And here (the only use is in cifs_revalidate_file(file)).

Same.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
