Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCEA8F5B0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Aug 2019 22:23:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hyMHG-0003uv-0U; Thu, 15 Aug 2019 20:23:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jmorris@namei.org>)
 id 1hyMHE-0003uc-6V; Thu, 15 Aug 2019 20:23:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:Message-ID:
 In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2eL823Jqvx1j1kcFLhAmk6F9wnIxhnSdO5FaHYmKU8I=; b=kKdSuMeCtGJMIwqDHVdCwsoIIK
 C1ZGYmrl3fruLpQgoBRGhHR5imX44U78R5GYdn9hlV30cV/Pd78DdLKoQEGP27NSBeOVMNQJR30pL
 OFveD3Ipopk2wqfm8ECiQ8RJKDvsF+MoxXj5uGzHwHBnTzuBkFEkJ2GbDygcAcPJg/eA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2eL823Jqvx1j1kcFLhAmk6F9wnIxhnSdO5FaHYmKU8I=; b=a2fg5L5fdFC72Rua/cY3wPVh2Z
 dAMLgFqAiUvNYEbsdRRK3FM727iYPoqW6KW9m5Isp0MGuSN7Yu3SL5aIFhJn2fdw114VJd+YIisTR
 rVe+T3VYlO9/M9tlSgmFu4tNGFYPBP5JCBryq7lVoKHiP7FcwN0+Fkq8VuWrf5Zg2PFw=;
Received: from namei.org ([65.99.196.166])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hyMHB-004mCm-2G; Thu, 15 Aug 2019 20:23:16 +0000
Received: from localhost (localhost [127.0.0.1])
 by namei.org (8.14.4/8.14.4) with ESMTP id x7FJKa6b013630;
 Thu, 15 Aug 2019 19:20:36 GMT
Date: Fri, 16 Aug 2019 05:20:36 +1000 (AEST)
From: James Morris <jmorris@namei.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <20190813084801.GA972@kroah.com>
Message-ID: <alpine.LRH.2.21.1908160515130.12729@namei.org>
References: <20190812193320.200472-1-salyzyn@android.com>
 <20190813084801.GA972@kroah.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: namei.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hyMHB-004mCm-2G
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
 =?ISO-8859-15?Q?Ernesto_A=2E_Fern=E1ndez?= <ernesto.mnd.fernandez@gmail.com>,
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

On Tue, 13 Aug 2019, Greg Kroah-Hartman wrote:

> On Mon, Aug 12, 2019 at 12:32:49PM -0700, Mark Salyzyn wrote:
> > --- a/include/linux/xattr.h
> > +++ b/include/linux/xattr.h
> > @@ -30,10 +30,10 @@ struct xattr_handler {
> >  	const char *prefix;
> >  	int flags;      /* fs private flags */
> >  	bool (*list)(struct dentry *dentry);
> > -	int (*get)(const struct xattr_handler *, struct dentry *dentry,
> > +	int (*get)(const struct xattr_handler *handler, struct dentry *dentry,
> >  		   struct inode *inode, const char *name, void *buffer,
> > -		   size_t size);
> > -	int (*set)(const struct xattr_handler *, struct dentry *dentry,
> > +		   size_t size, int flags);
> > +	int (*set)(const struct xattr_handler *handler, struct dentry *dentry,
> >  		   struct inode *inode, const char *name, const void *buffer,
> >  		   size_t size, int flags);
> 
> Wow, 7 arguments.  Isn't there some nice rule of thumb that says once
> you get more then 5, a function becomes impossible to understand?
> 
> Surely this could be a structure passed in here somehow, that way when
> you add the 8th argument in the future, you don't have to change
> everything yet again?  :)
> 
> I don't have anything concrete to offer as a replacement fix for this,
> but to me this just feels really wrong...

How about something like:

struct xattr_gs_args {
	struct dentry *dentry;
	struct inode *inode;
	const char *name;
	const void *buffer;
	size_t size;
	int flags;
};

int (*get)(const struct xattr_handler *handler, struct xattr_gs_args *args);
int (*set)(const struct xattr_handler *handler, struct xattr_gs_args *args);


-- 
James Morris
<jmorris@namei.org>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
