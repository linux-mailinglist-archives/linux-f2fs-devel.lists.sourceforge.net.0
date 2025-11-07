Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B825C3DF93
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 07 Nov 2025 01:26:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:Message-id:Date:References:In-reply-to:To:From:MIME-Version:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Licz7tbk8jY0rKpGvRyDZjMLN/Kvq0e71vHIjb9E9Mw=; b=FA7tU0Hd+cMKfva3VzL1DsdRKa
	N5DlzzyNiv2/Qek9m6d7ngwXYb8vwEBk+29eSUfyMo1BVEaXowpq0daUtgry6R82ITFyqNGO1QH0j
	eGvPfPKZD03CNpy/kiRho6F/zgT0S2bdg+Uj810eniUuLxeOAsLXpGjaqGxdoElCq4vc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vHAJ5-0001ga-Vj;
	Fri, 07 Nov 2025 00:26:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <neilb@ownmail.net>) id 1vHAIy-0001g9-1P;
 Fri, 07 Nov 2025 00:26:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Message-id:Date:References:In-reply-to:
 Subject:Cc:To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:Sender
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H6fp6wT7I155+JjI5U+YS+I+wpfi8UjlpY4LU8fjdU4=; b=FytqzELRlkW0ixSQB28Vxt5qzQ
 OEpCypYlmwPM+shVnsml5GKRi2Hr/W5eqQOysPg/VAeoeeoT6y7QR+TTsJC0NhcRHvcg0c9x773FV
 rzdvtueokdDmrT2EywB3rm4gkoMVVFuOADssAJTt1Sonm8ZYWdpW+Eua7ykiKl6OJNmw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Reply-To:Message-id:Date:References:In-reply-to:Subject:Cc:To:From:
 MIME-Version:Content-Transfer-Encoding:Content-Type:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H6fp6wT7I155+JjI5U+YS+I+wpfi8UjlpY4LU8fjdU4=; b=jk8h0IJ4pcpD00DQdEPHD5QGM0
 iyJmIGV5+/pLw6prVRLmtK3t+Mlnrv33IrZS9fLJ79zjCMDcQ2KPLbHWOExDeYAoDtwL53WTIQ3x9
 WaYe/VftBFKVtfsyNOzvD6rYvqFVj1kfDuWwfCRJllx4AUKYmdt8Z1ucw0+N9HO+YDbY=;
Received: from flow-a5-smtp.messagingengine.com ([103.168.172.140])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vHAIv-00019Q-IW; Fri, 07 Nov 2025 00:26:14 +0000
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailflow.phl.internal (Postfix) with ESMTP id 2F76A13801BB;
 Thu,  6 Nov 2025 19:01:16 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Thu, 06 Nov 2025 19:01:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm3; t=
 1762473676; x=1762480876; bh=H6fp6wT7I155+JjI5U+YS+I+wpfi8UjlpY4
 LU8fjdU4=; b=WZYAC5ptT+JI+E3LCYQDPMrHgn2+EeezTwSX9Fj81LnO57sEIW0
 r5bog5i33AtRsNThYOW5jDpkHJo5LmpOQU7UBC/WI2CsBHqkVpPTyHV/ApxUM1tN
 z6dVSfEJthkopAMT44s7CyEjRA2sDrA7Y2ef+eMrFuZp33UeziEFvqR18wUswgoZ
 7iPlUWWsOUPV/ZTTFBfyHToZxwjR9SvGXXZHsmi76QwHLy2cwbWHeeTpiMc4d1Bx
 XeBUu2V3z1ClTvl5FdR+kiB+ei1mybka1yZ1GjCONTkXDJfd+mNjp5j/C8/VHSTP
 dThaFVWL2uE50jq2dsohAmGrZdbMqVO7Ang==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762473676; x=
 1762480876; bh=H6fp6wT7I155+JjI5U+YS+I+wpfi8UjlpY4LU8fjdU4=; b=P
 sg2gNosOUgNreOPGLlVE9k8r0A93bFTvKl0A1YiFCaR0/yxDdKMWNofRmX2pbv2C
 pRquqzDxvSlnoOFKUo3q0Ir6NiXbOSxcJH8T5/d9/oXcWZsBYNknHCW+NvYGKU2G
 Ni1/LdQGu7Us7ontcePjlATrS/pgRVzjGEEX7HanmFiC2g+ePTDJ5SSAtpJBah0H
 UWRXuHQQCAsLEu8BLIO90FsUNkSBOy8aoz2K3RYVbczfmOyGIUeyWzmqDvAPkDRA
 jQU6SMudoXVNKkegC9Kaz3mNZdYl5nPuZwKwE6TAABXrWOiDglM1NlGb8+vPxFje
 mse7RGNm/dK9IXvzGfidw==
X-ME-Sender: <xms:xDYNaRhNbUJHsahPPmb6piowRnF47nS9W-BDbBUWZMioGCLB0QKE0Q>
 <xme:xDYNadGCoPUcs45mlm9G-M-v6BypV59NlC8i5D0rXfDdqG1vicJvxUwSAeEgzm-AW
 mM9E_dg4ffodJEGnHgTyJ5KyY9-2grnnN8X99UhFArcj-pfDw>
X-ME-Received: <xmr:xDYNaZhYRnJe2Zwy43UTfxOwR_mAMlSeo2ztdDGjHNPtTGiDI9p-9jO_eGsbdcJ0bT11eVgdtj8wsq09LuBid3ldax93JTUA9nFc7WrB4ws3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeekudeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurheptgfgggfhvfevufgjfhffkfhrsehtqhertddttdejnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epleejtdefgeeukeeiteduveehudevfeffvedutefgteduhfegvdfgtdeigeeuudejnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
 esohifnhhmrghilhdrnhgvthdpnhgspghrtghpthhtohepleegpdhmohguvgepshhmthhp
 ohhuthdprhgtphhtthhopehvihhrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhkpd
 hrtghpthhtohepfhhrrghnkhdrlhhisehvihhvohdrtghomhdprhgtphhtthhopehlihhn
 uhigqdigfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
 dquhhnihhonhhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
 uhigqdhnihhlfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
 hugidqnhhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhig
 qdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
 igqdhhrghruggvnhhinhhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
 lhhinhhugidqfhhsuggvvhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:xDYNaRZM3kLhMQrgyC03y_mvDTyKIhHr-UZRyaVoDw1bUdd3TO5KWQ>
 <xmx:xDYNab6BMLI1rNIb697RuBsl1xbiAOh3-jJjQLerAQCMMocsAIIZ6A>
 <xmx:xDYNaWzpKwiCJssErWAKaC5Omh24WDMdd_ESMwy-1QKK0c3T8HNikg>
 <xmx:xDYNadOOkUDnvT6bORX3tFjgvG8jH6RVTiJmdbw7J549hUUGJI3E9w>
 <xmx:zDYNaZmP4HdGrgNN2fuf1yLCRS5MEi7pUT3ZiXhJ138U_-MYPTZPl43i>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Nov 2025 19:00:45 -0500 (EST)
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Jeff Layton" <jlayton@kernel.org>
In-reply-to: <f5927a9bb985b9ad241bc5f9fc32acfd35340222.camel@kernel.org>
References: <20251105-create-excl-v1-1-a4cce035cc55@kernel.org>,
 <176237780417.634289.15818324160940255011@noble.neil.brown.name>,
 <6758176514cdd6e2ceacb3bd0e4d63fb8784b7c6.camel@kernel.org>,
 <f5927a9bb985b9ad241bc5f9fc32acfd35340222.camel@kernel.org>
Date: Fri, 07 Nov 2025 11:00:34 +1100
Message-id: <176247363419.634289.473957828516111884@noble.neil.brown.name>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, 07 Nov 2025, Jeff Layton wrote: > On Thu, 2025-11-06
 at 07:07 -0500, Jeff Layton wrote: > > On Thu, 2025-11-06 at 08:23 +1100,
 NeilBrown wrote: > > > On Thu, 06 Nov 2025, Jeff Layton wrote: > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [neilb(at)ownmail.net]
X-Headers-End: 1vHAIv-00019Q-IW
Subject: Re: [f2fs-dev] [PATCH] vfs: remove the excl argument from the
 ->create() inode_operation
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Paulo Alcantara <pc@manguebit.org>,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 Tyler Hicks <code@tyhicks.com>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, Jan Harkes <jaharkes@cs.cmu.edu>,
 linux-um@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
 David Hildenbrand <david@redhat.com>, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Hugh Dickins <hughd@google.com>,
 codalist@coda.cs.cmu.edu, Namjae Jeon <linkinjeon@kernel.org>,
 Yangtao Li <frank.li@vivo.com>, ocfs2-devel@lists.linux.dev,
 Jaegeuk Kim <jaegeuk@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Theodore Ts'o <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, gfs2@lists.linux.dev,
 Anna Schumaker <anna@kernel.org>, linux-efi@vger.kernel.org,
 Martin Brandenburg <martin@omnibond.com>, Kees Cook <kees@kernel.org>,
 Yuezhang Mo <yuezhang.mo@sony.com>, Carlos Maiolino <cem@kernel.org>,
 Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org,
 linux-hardening@vger.kernel.org, Marc Dionne <marc.dionne@auristor.com>,
 linux-afs@lists.infradead.org, Miklos Szeredi <miklos@szeredi.hu>,
 coda@cs.cmu.edu, Viacheslav Dubeyko <slava@dubeyko.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, ceph-devel@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, David Howells <dhowells@redhat.com>,
 linux-nfs@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 samba-technical@lists.samba.org, Steve French <sfrench@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, ntfs3@lists.linux.dev,
 Hans de Goede <hansg@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Bob Copeland <me@bobcopeland.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-mm@kvack.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Ard Biesheuvel <ardb@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, ecryptfs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, v9fs@lists.linux.dev,
 linux-unionfs@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>,
 Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, 07 Nov 2025, Jeff Layton wrote:
> On Thu, 2025-11-06 at 07:07 -0500, Jeff Layton wrote:
> > On Thu, 2025-11-06 at 08:23 +1100, NeilBrown wrote:
> > > On Thu, 06 Nov 2025, Jeff Layton wrote:
> > > > Since ce8644fcadc5 ("lookup_open(): expand the call of vfs_create()"),
> > > > the "excl" argument to the ->create() inode_operation is always set to
> > > > true. Remove it, and fix up all of the create implementations.
> > > 
> > > nonono
> > > 
> > > 
> > > > @@ -3802,7 +3802,7 @@ static struct dentry *lookup_open(struct nameidata *nd, struct file *file,
> > > >  		}
> > > >  
> > > >  		error = dir_inode->i_op->create(idmap, dir_inode, dentry,
> > > > -						mode, open_flag & O_EXCL);
> > > > +						mode);
> > > 
> > > "open_flag & O_EXCL" is not the same as "true".
> > > 
> > > It is true that "all calls to vfs_create() pass true for 'excl'"
> > > The same is NOT true for inode_operations.create.
> > > 
> > 
> > I don't think this is a problem, actually:
> > 
> > Almost all of the existing ->create() operations ignore the "excl"
> > bool. There are only two that I found that do not: NFS and GFS2. Both
> > of those have an ->atomic_open() operation though, so lookup_open()
> > will never call ->create() for those filesystems. This means that -
> > > create() _is_ always called with excl == true.
> 
> How about this for a revised changelog, which makes the above clear:
> 
>     vfs: remove the excl argument from the ->create() inode_operation
>     
>     Since ce8644fcadc5 ("lookup_open(): expand the call of vfs_create()"),
>     the "excl" argument to the ->create() inode_operation is always set to
>     true in vfs_create().
>     
>     There is another call to ->create() in lookup_open() that can set it to
>     either true or false. All of the ->create() operations in the kernel
>     ignore the excl argument, except for NFS and GFS2. Both NFS and GFS2
>     have an ->atomic_open() operation, however so lookup_open() will never
>     call ->create() on those filesystems.
>     
>     Remove the "excl" argument from the ->create() operation, and fix up the
>     filesystems accordingly.

Thanks, that is a substantial improvement.  I see your point now and I
think this is a really nice cleanup to make - thanks.

I think the commit message could be improved further by leading with the
detail that is central - that most ->create function ignore 'excl'.

 With two exceptions, ->create() methods provided by filesystems ignore
 the "excl" flag.  Those exception are NFS and GFS2 which both also
 provide ->atomic_open.

 excl is always true when ->create is called from vfs_create() (since
 commit......) so the only time it can be false is when it is called by
 lookup_open() for filesystems that do not provide ->atomic_open.

 So the excl flag to ->create is either ignored or true.  So we can
 remove it and change NFS and GFS2 to acts as though it were true.

> 
> Maybe we also need some comments or updates to Documentation/ to make
> it clear that ->create() always implies O_EXCL semantics?

Definitely, something in porting.rst and something in vfs.rst.

I would be worth saying somewhere that if the fs needs to mediate
non-exclusive creation, it must provide atomic_open().

Thanks,
NeilBrown


> -- 
> Jeff Layton <jlayton@kernel.org>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
