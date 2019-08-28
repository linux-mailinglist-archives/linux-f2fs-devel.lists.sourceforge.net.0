Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AED89FDB4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Aug 2019 10:58:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i2tmj-0003LZ-4A; Wed, 28 Aug 2019 08:58:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <amir73il@gmail.com>)
 id 1i2tmg-0003Kz-SW; Wed, 28 Aug 2019 08:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZkpFpnYPlZJ9QcxAWETe0exvhhGufV9GcXx8KPl75dQ=; b=eEZrUjQe6+4ZcjB3ildHnb48F7
 Z6vDCtti+iHCSrkbJbLf5xrw70eaKKhSVfAM64GVCI6hykh/VC5ZztEzoIVkfFJfp7D8XzZETLJeg
 MIYoc8jnlNlGQA1ZggjjPvmOIRgLluK1NefpjoW7vddPEG2qkZmIZmoGyXl6FPps7qDI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZkpFpnYPlZJ9QcxAWETe0exvhhGufV9GcXx8KPl75dQ=; b=OOkwtfjxMZbVgl2SVjO8rNuZDk
 lXDD15pTYhu1Kco/vHg0VscAQqLR7EssBlNcVqVim7XKqMjmCTHSinv+5OMFTSE/xoU0hqBVnfLwT
 OOYIdNyR5cU32EQUzQISRpDHZhLgPeEwPwjhtvZqV4nEhEqsgiuVMYsJDSqoB3NFw4NU=;
Received: from mail-yb1-f194.google.com ([209.85.219.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1i2tmf-000gKd-JM; Wed, 28 Aug 2019 08:58:30 +0000
Received: by mail-yb1-f194.google.com with SMTP id c9so553218ybf.2;
 Wed, 28 Aug 2019 01:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZkpFpnYPlZJ9QcxAWETe0exvhhGufV9GcXx8KPl75dQ=;
 b=c/7IxRS5bV7/Y1D6aqVDN4h5XY8CLwleVTKbXnD1xvkPuYpdCL6KG1pUCZedAgswVL
 jl/Y/H3TL3Y7v26WGEvK2/K7kQDXltg3Gh1B2bsEXgA+f3ZfuZKs0Owowo137ADQO4O+
 cpzdYN/uTyuwxI00FWQlSRJrDeSiVoypEr2jK5PPgACNzrThi9kqlMgnjpNIbvs06isz
 sSk1xx9N3A6v0UgaCkxeg+WxsqAscnJ0NMP/ilLoKpdluNCBKsgYaS4spNoOe+kfNZNB
 7XBDgWqpy6pn08EBwgtZBm+9GjktdL94w9YatMNYYgi1jW7re8aGyyVgQPga7XhLViSE
 j9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZkpFpnYPlZJ9QcxAWETe0exvhhGufV9GcXx8KPl75dQ=;
 b=WHcfB9qhaXdOJRdtqt+RcZIFu2rVPl0dZmhmFk4tB7w0MG/uYNZoBW+ROrVk7wct13
 vy0mwDbNLOsb5OXS3nzFsNxo6LR7MgDVGlkqFB2pRnVyXlYTJH9Nrja7DfjhjyH6miTc
 Grd24a/Eb1G94GbMOQMB+KJrbSVh58fGvot+xfGwxc1pK7fCicKfDqBaisdYitTdR1xY
 IWosBZtvQMH7kBeEs1m/KuTjGuAJ6xYGxizPsCCPdsyD/Pc1h9MzGfcizyN238ZiaC6T
 zAJCRkIcZ/xUTU0IEqRjqBP1IMv5i7bfmBkOyPQM5GC4b+9eoZiT7PJDb5gkksODlyFK
 Rg3w==
X-Gm-Message-State: APjAAAVqeLc/fG68U0AAPd3MUh4NpzTLWwbzH/EwUl9Sprh0gLDQmGos
 nZF1NzU807rUB6CrLCV9e8+uxx7UBY0ljlz8cPk=
X-Google-Smtp-Source: APXvYqzSub2GIlA5tBXI/WsJGtSH+6zioYqDGzlUhxxxj30lJtRuCO2Hlbsd4xVOf5z0HjodsXgoZMdYp6cwy9sWUoQ=
X-Received: by 2002:a25:c486:: with SMTP id u128mr2051352ybf.428.1566982703595; 
 Wed, 28 Aug 2019 01:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190820180716.129882-1-salyzyn@android.com>
 <20190827141952.GB10098@quack2.suse.cz>
In-Reply-To: <20190827141952.GB10098@quack2.suse.cz>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 28 Aug 2019 11:58:12 +0300
Message-ID: <CAOQ4uxgVWyiEV2s3KNT40jkUjEkn_v2MN5Z--HW=LoA_aZwNOw@mail.gmail.com>
To: Mark Salyzyn <salyzyn@android.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (amir73il[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.194 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1i2tmf-000gKd-JM
Subject: Re: [f2fs-dev] [PATCH v7] Add flags option to get xattr method
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Eric Sandeen <sandeen@sandeen.net>,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs <linux-xfs@vger.kernel.org>,
 James Morris <jmorris@namei.org>, devel@lists.orangefs.org,
 Eric Van Hensbergen <ericvh@gmail.com>, Joel Becker <jlbec@evilplan.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Jan Kara <jack@suse.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Kleikamp <shaggy@kernel.org>,
 linux-doc@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>,
 CIFS <linux-cifs@vger.kernel.org>, Paul Moore <paul@paul-moore.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Hugh Dickins <hughd@google.com>,
 kernel-team@android.com, selinux@vger.kernel.org,
 Brian Foster <bfoster@redhat.com>, reiserfs-devel@vger.kernel.org,
 Casey Schaufler <casey@schaufler-ca.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Miklos Szeredi <miklos@szeredi.hu>,
 linux-f2fs-devel@lists.sourceforge.net,
 Benjamin Coddington <bcodding@redhat.com>,
 linux-integrity <linux-integrity@vger.kernel.org>,
 Martin Brandenburg <martin@omnibond.com>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, Vyacheslav Dubeyko <slava@dubeyko.com>,
 Allison Henderson <allison.henderson@oracle.com>,
 Ilya Dryomov <idryomov@gmail.com>, Ext4 <linux-ext4@vger.kernel.org>,
 Stephen Smalley <sds@tycho.nsa.gov>, Serge Hallyn <serge@hallyn.com>,
 Eric Paris <eparis@parisplace.org>, ceph-devel@vger.kernel.org,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Steve French <sfrench@samba.org>, Bob Peterson <rpeterso@redhat.com>,
 Tejun Heo <tj@kernel.org>, linux-erofs@lists.ozlabs.org,
 Anna Schumaker <anna.schumaker@netapp.com>, ocfs2-devel@oss.oracle.com,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Eric Biggers <ebiggers@google.com>,
 Dominique Martinet <asmadeus@codewreck.org>, Jeff Mahoney <jeffm@suse.com>,
 Adrian Hunter <adrian.hunter@intel.com>, David Howells <dhowells@redhat.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, devel@driverdev.osuosl.org,
 "J. Bruce Fields" <bfields@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Sage Weil <sage@redhat.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 =?UTF-8?Q?Ernesto_A=2E_Fern=C3=A1ndez?= <ernesto.mnd.fernandez@gmail.com>,
 cluster-devel@redhat.com, v9fs-developer@lists.sourceforge.net,
 Bharath Vedartham <linux.bhar@gmail.com>, Jann Horn <jannh@google.com>,
 ecryptfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 Dave Chinner <dchinner@redhat.com>, David Sterba <dsterba@suse.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Netdev <netdev@vger.kernel.org>,
 overlayfs <linux-unionfs@vger.kernel.org>, stable <stable@vger.kernel.org>,
 Tyler Hicks <tyhicks@canonical.com>,
 LSM List <linux-security-module@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 David Woodhouse <dwmw2@infradead.org>,
 Linux Btrfs <linux-btrfs@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 28, 2019 at 11:15 AM Jan Kara via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On Tue 20-08-19 11:06:48, Mark Salyzyn wrote:
> > diff --git a/Documentation/filesystems/Locking b/Documentation/filesystems/Locking
> > index 204dd3ea36bb..e2687f21c7d6 100644
> > --- a/Documentation/filesystems/Locking
> > +++ b/Documentation/filesystems/Locking
> > @@ -101,12 +101,10 @@ of the locking scheme for directory operations.
> >  ----------------------- xattr_handler operations -----------------------
> >  prototypes:
> >       bool (*list)(struct dentry *dentry);
> > -     int (*get)(const struct xattr_handler *handler, struct dentry *dentry,
> > -                struct inode *inode, const char *name, void *buffer,
> > -                size_t size);
> > -     int (*set)(const struct xattr_handler *handler, struct dentry *dentry,
> > -                struct inode *inode, const char *name, const void *buffer,
> > -                size_t size, int flags);
> > +     int (*get)(const struct xattr_handler *handler,
> > +                struct xattr_gs_flags);
> > +     int (*set)(const struct xattr_handler *handler,
> > +                struct xattr_gs_flags);
>
> The prototype here is really "struct xattr_gs_flags *args", isn't it?
> Otherwise feel free to add:
>
> Reviewed-by: Jan Kara <jack@suse.cz>
>
> for the ext2, ext4, ocfs2, reiserfs, and the generic fs/* bits.
>
>                                                                 Honza

Mark,

That's some CC list you got there... but I never got any of your
patches because they did not
reach fsdevel list.

Did you get a rejection message from ML server?

Thanks,
Amir.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
