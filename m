Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 679038EF53
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Aug 2019 17:30:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hyHi9-0007yO-B0; Thu, 15 Aug 2019 15:30:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>)
 id 1hyHi7-0007yB-He; Thu, 15 Aug 2019 15:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X/BkUWy4IvPObAr3TZ97hiqLlbnJs23S4pR9xNSIEjw=; b=mrbd/xxkhrAj5n75icOMG8QUEH
 JWb35KRsWeLcuo/DYQZosy6cw//s3tfLJsEpV8/448YziVuvbPepaZtoNK3zmkZ2xqt3jUN3RH/4N
 XdpOxTLJQ01b1VqKeMda6HAZCcvBTHZo9Q0qTsLmANm/t47LW3hLOygFAzOR6KeFW0CE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X/BkUWy4IvPObAr3TZ97hiqLlbnJs23S4pR9xNSIEjw=; b=Ax6JLU8IVg5rDzhp53BCK6IkjR
 0JqceLpUhKcmoYdyj2YW1FMN430puvFhUj1BhQX4B1a1GAqAB8Ool3LM3GenCLtftjASY3ElIYghA
 F6+2Z5wEzTgLmEmFwmKIzEPD5+ZK4cIQ5iqA5c5TOWBfh9Q1xb7HK+W45KtmiUiqlqSI=;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hyHi0-004bQR-Nq; Thu, 15 Aug 2019 15:30:43 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 84639B02E;
 Thu, 15 Aug 2019 15:30:28 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id F3E6E1E4200; Thu, 15 Aug 2019 17:30:24 +0200 (CEST)
Date: Thu, 15 Aug 2019 17:30:24 +0200
From: Jan Kara <jack@suse.cz>
To: Mark Salyzyn <salyzyn@android.com>
Message-ID: <20190815153024.GP14313@quack2.suse.cz>
References: <20190813145527.26289-1-salyzyn@android.com>
 <20190814110022.GB26273@quack2.suse.cz>
 <71d66fd1-cc94-fd0c-dfa7-115ba8a6b95a@android.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71d66fd1-cc94-fd0c-dfa7-115ba8a6b95a@android.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hyHi0-004bQR-Nq
Subject: Re: [f2fs-dev] [PATCH v2] Add flags option to get xattr method
 paired to __vfs_getxattr
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
 jfs-discussion@lists.sourceforge.net,
 Phillip Lougher <phillip@squashfs.org.uk>, Jan Kara <jack@suse.cz>,
 linux-integrity@vger.kernel.org, Martin Brandenburg <martin@omnibond.com>,
 samba-technical@lists.samba.org, Dominique Martinet <asmadeus@codewreck.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-mm@kvack.org, Chris Mason <clm@fb.com>, netdev@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-xfs@vger.kernel.org,
 Eric Paris <eparis@parisplace.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-afs@lists.infradead.org, Stephen Smalley <sds@tycho.nsa.gov>,
 Mike Marshall <hubcap@omnibond.com>, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 Sage Weil <sage@redhat.com>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 linux-unionfs@vger.kernel.org, Hugh Dickins <hughd@google.com>,
 James Morris <jmorris@namei.org>, cluster-devel@redhat.com,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Vyacheslav Dubeyko <slava@dubeyko.com>,
 Casey Schaufler <casey@schaufler-ca.com>, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 kernel-team@android.com, devel@lists.orangefs.org,
 Serge Hallyn <serge@hallyn.com>, Eric Van Hensbergen <ericvh@gmail.com>,
 ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 Josef Bacik <josef@toxicpanda.com>, reiserfs-devel@vger.kernel.org,
 Bob Peterson <rpeterso@redhat.com>, Joel Becker <jlbec@evilplan.org>,
 Anna Schumaker <anna.schumaker@netapp.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 selinux@vger.kernel.org, Trond Myklebust <trond.myklebust@hammerspace.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, David Howells <dhowells@redhat.com>,
 linux-nfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-fsdevel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miklos Szeredi <miklos@szeredi.hu>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Tyler Hicks <tyhicks@canonical.com>, Steve French <sfrench@samba.org>,
 Ernesto =?iso-8859-1?Q?A=2E_Fern=E1ndez?= <ernesto.mnd.fernandez@gmail.com>,
 linux-btrfs@vger.kernel.org, linux-security-module@vger.kernel.org,
 Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>,
 linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>,
 ocfs2-devel@oss.oracle.com, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed 14-08-19 07:54:16, Mark Salyzyn wrote:
> On 8/14/19 4:00 AM, Jan Kara wrote:
> > On Tue 13-08-19 07:55:06, Mark Salyzyn wrote:
> > ...
> > > diff --git a/fs/xattr.c b/fs/xattr.c
> > > index 90dd78f0eb27..71f887518d6f 100644
> > > --- a/fs/xattr.c
> > > +++ b/fs/xattr.c
> > ...
> > >   ssize_t
> > >   __vfs_getxattr(struct dentry *dentry, struct inode *inode, const char *name,
> > > -	       void *value, size_t size)
> > > +	       void *value, size_t size, int flags)
> > >   {
> > >   	const struct xattr_handler *handler;
> > > -
> > > -	handler = xattr_resolve_name(inode, &name);
> > > -	if (IS_ERR(handler))
> > > -		return PTR_ERR(handler);
> > > -	if (!handler->get)
> > > -		return -EOPNOTSUPP;
> > > -	return handler->get(handler, dentry, inode, name, value, size);
> > > -}
> > > -EXPORT_SYMBOL(__vfs_getxattr);
> > > -
> > > -ssize_t
> > > -vfs_getxattr(struct dentry *dentry, const char *name, void *value, size_t size)
> > > -{
> > > -	struct inode *inode = dentry->d_inode;
> > >   	int error;
> > > +	if (flags & XATTR_NOSECURITY)
> > > +		goto nolsm;
> > Hum, is it OK for XATTR_NOSECURITY to skip even the xattr_permission()
> > check? I understand that for reads of security xattrs it actually does not
> > matter in practice but conceptually that seems wrong to me as
> > XATTR_NOSECURITY is supposed to skip just security-module checks to avoid
> > recursion AFAIU.
> 
> Good catch I think.
> 
> I was attempting to make this change purely inert, no change in
> functionality, only a change in API. Adding a call to xattr_permission would
> incur a change in overall functionality, as it would introduce into the
> current and original __vfs_getxattr a call to xattr_permission that was not
> there before.
> 
> (I will have to defer the real answer and requirements to the security
> folks)
> 
> AFAIK you are correct, and to make the call would reduce the attack surface,
> trading a very small amount of CPU utilization, for a much larger amount of
> trust.
> 
> Given the long history of this patch set (for overlayfs) and the large
> amount of stakeholders, I would _prefer_ to submit a followup independent
> functionality/security change to _vfs_get_xattr _after_ this makes it in.

You're right. The problem was there before. So ack to changing this later.

> > > diff --git a/include/uapi/linux/xattr.h b/include/uapi/linux/xattr.h
> > > index c1395b5bd432..1216d777d210 100644
> > > --- a/include/uapi/linux/xattr.h
> > > +++ b/include/uapi/linux/xattr.h
> > > @@ -17,8 +17,9 @@
> > >   #if __UAPI_DEF_XATTR
> > >   #define __USE_KERNEL_XATTR_DEFS
> > > -#define XATTR_CREATE	0x1	/* set value, fail if attr already exists */
> > > -#define XATTR_REPLACE	0x2	/* set value, fail if attr does not exist */
> > > +#define XATTR_CREATE	 0x1	/* set value, fail if attr already exists */
> > > +#define XATTR_REPLACE	 0x2	/* set value, fail if attr does not exist */
> > > +#define XATTR_NOSECURITY 0x4	/* get value, do not involve security check */
> > >   #endif
> > It seems confusing to export XATTR_NOSECURITY definition to userspace when
> > that is kernel-internal flag. I'd just define it in include/linux/xattr.h
> > somewhere from the top of flags space (like 0x40000000).
> > 
> > Otherwise the patch looks OK to me (cannot really comment on the security
> > module aspect of this whole thing though).
> 
> Good point. However, we do need to keep these flags together to reduce
> maintenance risk, I personally abhor two locations for flags bits even if
> one comes from the opposite bit-side; collisions are undetectable at build
> time. Although I have not gone through the entire thought experiment, I am
> expecting that fuse could possibly benefit from this flag (if exposed) since
> it also has a security recursion. That said, fuse is probably the example of
> a gaping wide attack surface if user space had access to it ... your
> xattr_permissions call addition requested above would be realistically, not
> just pedantically, required!

Yeah, flags bits in two places are bad as well. So maybe at least
#ifdef __KERNEL__ bit around the definitiona and a comment that it is
kernel internal flag?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
