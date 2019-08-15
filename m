Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2278F5E1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Aug 2019 22:43:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hyMau-000483-RO; Thu, 15 Aug 2019 20:43:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>)
 id 1hyMat-00047f-7g; Thu, 15 Aug 2019 20:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CwQ/0EejkrmNJB3s/c5x0QrEieuuLi6e5/NeZ6sCt6E=; b=Sg9OLSrN7lGuu2SNDeytZwpCVO
 gb98Lae6ysK2dlYgueaDNDuHLz0osPJ72ncQbtwF45GY044tflKDIuwkNQx9Hwtlmuy1fD1VWDnrT
 nCP6EDbIVlYqfc2pCjjEaz4906nC5BOA/3WC+B3vFnSamGvQJJzJjRstJ0RUBMOXNZso=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CwQ/0EejkrmNJB3s/c5x0QrEieuuLi6e5/NeZ6sCt6E=; b=IAqYmaNBIsLazj8FsB59MTzmvq
 YXSrhllSdbdyzMKMwJ/5NuxV5B17daQCYVfS34lCONb7zlxAqu5soCSCtILN3iHQ00vsdehOUkcYb
 za9FWbXoPVsPsAIqaqfUmsktCLxPUpKEPLqsM0lv4hlWJCmSqi2ZN8zj5Rl6iY+yl/SI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hyMap-005ByL-84; Thu, 15 Aug 2019 20:43:35 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5BB2B2083B;
 Thu, 15 Aug 2019 20:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565901805;
 bh=4MUbuhxyjB/Z/I0+KEuHYyPv1fvr/qroc0kojX6LQUI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rmevilO9FFuTpF1TkeHr9rMjq0tx8UWAlZu1cW/zsMuDRMCXNIqbtamv/Bh9PWjxr
 uMcyMcUqmrlEz/U6ipnvwnFJksubQpe8uhV+mxBP/PuZfI7m0SnpKLNF/GD9rIRrXm
 9i2PofIAyA1t7LZj0WwS4y+NrRc1E+LScCfI1k7c=
Date: Thu, 15 Aug 2019 22:43:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: James Morris <jmorris@namei.org>
Message-ID: <20190815204322.GB6782@kroah.com>
References: <20190812193320.200472-1-salyzyn@android.com>
 <20190813084801.GA972@kroah.com>
 <alpine.LRH.2.21.1908160515130.12729@namei.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.21.1908160515130.12729@namei.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hyMap-005ByL-84
Subject: Re: [f2fs-dev] [PATCH] Add flags option to get xattr method paired
 to __vfs_getxattr
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
 jfs-discussion@lists.sourceforge.net, linux-integrity@vger.kernel.org,
 Martin Brandenburg <martin@omnibond.com>, samba-technical@lists.samba.org,
 Dominique Martinet <asmadeus@codewreck.org>, Mimi Zohar <zohar@linux.ibm.com>,
 linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, "David S. Miller" <davem@davemloft.net>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Eric Paris <eparis@parisplace.org>,
 netdev@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
 linux-afs@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Andreas Gruenbacher <agruenba@redhat.com>,
 Sage Weil <sage@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>,
 Ernesto =?iso-8859-1?Q?A=2E_Fern=E1ndez?= <ernesto.mnd.fernandez@gmail.com>,
 cluster-devel@redhat.com, selinux@vger.kernel.org,
 Vyacheslav Dubeyko <slava@dubeyko.com>,
 Casey Schaufler <casey@schaufler-ca.com>, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 kernel-team@android.com, linux-mm@kvack.org, devel@lists.orangefs.org,
 Serge Hallyn <serge@hallyn.com>, linux-cifs@vger.kernel.org,
 Eric Van Hensbergen <ericvh@gmail.com>, ecryptfs@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, reiserfs-devel@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, Joel Becker <jlbec@evilplan.org>,
 linux-mtd@lists.infradead.org, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Paul Moore <paul@paul-moore.com>, linux-nfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Theodore Ts'o <tytso@mit.edu>,
 linux-fsdevel@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Mathieu Malaterre <malat@debian.org>, Stephen Smalley <sds@tycho.nsa.gov>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Mark Salyzyn <salyzyn@android.com>, Steve French <sfrench@samba.org>,
 linux-security-module@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 Jan Kara <jack@suse.com>, Bob Peterson <rpeterso@redhat.com>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-btrfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Aug 16, 2019 at 05:20:36AM +1000, James Morris wrote:
> On Tue, 13 Aug 2019, Greg Kroah-Hartman wrote:
> 
> > On Mon, Aug 12, 2019 at 12:32:49PM -0700, Mark Salyzyn wrote:
> > > --- a/include/linux/xattr.h
> > > +++ b/include/linux/xattr.h
> > > @@ -30,10 +30,10 @@ struct xattr_handler {
> > >  	const char *prefix;
> > >  	int flags;      /* fs private flags */
> > >  	bool (*list)(struct dentry *dentry);
> > > -	int (*get)(const struct xattr_handler *, struct dentry *dentry,
> > > +	int (*get)(const struct xattr_handler *handler, struct dentry *dentry,
> > >  		   struct inode *inode, const char *name, void *buffer,
> > > -		   size_t size);
> > > -	int (*set)(const struct xattr_handler *, struct dentry *dentry,
> > > +		   size_t size, int flags);
> > > +	int (*set)(const struct xattr_handler *handler, struct dentry *dentry,
> > >  		   struct inode *inode, const char *name, const void *buffer,
> > >  		   size_t size, int flags);
> > 
> > Wow, 7 arguments.  Isn't there some nice rule of thumb that says once
> > you get more then 5, a function becomes impossible to understand?
> > 
> > Surely this could be a structure passed in here somehow, that way when
> > you add the 8th argument in the future, you don't have to change
> > everything yet again?  :)
> > 
> > I don't have anything concrete to offer as a replacement fix for this,
> > but to me this just feels really wrong...
> 
> How about something like:
> 
> struct xattr_gs_args {
> 	struct dentry *dentry;
> 	struct inode *inode;

As he said in a later message, dentry and inode is redundant, only 1 is
needed (dentry I think?)

> 	const char *name;
> 	const void *buffer;
> 	size_t size;
> 	int flags;
> };
> 
> int (*get)(const struct xattr_handler *handler, struct xattr_gs_args *args);
> int (*set)(const struct xattr_handler *handler, struct xattr_gs_args *args);

But yes, that would be much much better.

thanks,

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
