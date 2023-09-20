Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4887A7833
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Sep 2023 11:57:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qitxR-00017p-Pb;
	Wed, 20 Sep 2023 09:57:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qitxO-00017i-VH
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 09:57:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RcjoXb8jmGWqUTqcLYtXgUPWWRyJuDGDJCahKS0blkg=; b=JlHIeCiMRvENK7gyCHXH4ajth4
 57B3IXu6Ubqd0ImR+zcpsrNOG8Odeg3cGU/JFq3pReX4SQege5fQUNVbJji1v08Ds8l+doYBfJWyO
 wsojJpN65CZ4hlV0KGNjZcCOHbDNmJWzaqwI79vO60h95aj01IsBaXJ1iqdO3wEsnLkU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RcjoXb8jmGWqUTqcLYtXgUPWWRyJuDGDJCahKS0blkg=; b=lOpxrh3IQZXpeD+AwiSntoUXf4
 fsvkAZYgqiKQSeev4Ut4qfGVpYpZI0KtmbfVGOyHYQQutFnRaNPkYbtW+NbyrrzDxktzGdNSQowB0
 3w8+wqbGlqnbu2shMk15PiewDQDSRvSJyiTQFAG1fTCa40NL0TeTsyrxku1/hk+WKTeI=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qitxJ-0002cU-5q for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 09:57:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 03F80CE1ABB;
 Wed, 20 Sep 2023 09:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC4BC433C9;
 Wed, 20 Sep 2023 09:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695203818;
 bh=8dU4x5PUmmjdLcmGD8FQZX0ooJMdCDj1v1oaGkGwbco=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=EPGWRT/sOx0WBr87v0UEJNUrhK9T7DN7zibPon6YUv0nH6uKKCHaF93+7R8+gnKNX
 s8+R/DpRsgYsXZTTTTkTUbu9q2cdTQuPIG8yC0uPYpHn7czUSEtbUHT1kUzmsDonLt
 D8LuESGvKMbqF+k045yKfSyWD/RK8JJiTAx+cKVPdVoGzB0EDGPX6DYZzUkqFy3gaw
 jQ65mPg83rqX/8MS6Uzw5HZJOTo2J0zNpacZuumWQKdC4SW0bLkosc4BfWuWAfNwT/
 diU/SWDioSHIpTdCFeVaL2KiuesKs7kwpzSJRrNfhoKLfQjJa/PF1Npda25D3fz2gs
 ObMc7LQZoG48Q==
Message-ID: <5ab880070c7d236928b90d9475a660cc0ab89c73.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Date: Wed, 20 Sep 2023 05:56:50 -0400
In-Reply-To: <20230920-leerung-krokodil-52ec6cb44707@brauner>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
 <4511209.uG2h0Jr0uP@nimes>
 <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
 <20230920-leerung-krokodil-52ec6cb44707@brauner>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 2023-09-20 at 10:41 +0200, Christian Brauner wrote:
 > > > f1 was last written to *after* f2 was last written to. If the timestamp
 of f1 > > > is then lower than the timestamp of f2, timestamps [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qitxJ-0002cU-5q
Subject: Re: [f2fs-dev] [PATCH v7 12/13] ext4: switch to multigrain
 timestamps
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Jan Kara <jack@suse.cz>, linux-xfs@vger.kernel.org, "Darrick
 J. Wong" <djwong@kernel.org>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-unionfs@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Hans de Goede <hdegoede@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, codalist@coda.cs.cmu.edu,
 linux-afs@lists.infradead.org, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 Amir Goldstein <l@gmail.com>, Eric Van Hensbergen <ericvh@kernel.org>,
 bug-gnulib@gnu.org, Andreas Gruenbacher <agruenba@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
 Benjamin Coddington <bcodding@redhat.com>, Tyler Hicks <code@tyhicks.com>,
 cluster-devel@redhat.com, coda@cs.cmu.edu, linux-mm@kvack.org,
 Gao Xiang <xiang@kernel.org>, Iurii Zaikin <yzaikin@google.com>,
 Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Xi Ruoyao <xry111@linuxfromscratch.org>,
 Shyam Prasad N <sprasad@microsoft.com>, ecryptfs@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, ocfs2-devel@lists.linux.dev,
 linux-cifs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 Josef Bacik <josef@toxicpanda.com>, Tom Talpey <tom@talpey.com>,
 Tejun Heo <tj@kernel.org>, Yue Hu <huyue2@coolpad.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jan Harkes <jaharkes@cs.cmu.edu>,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 devel@lists.orangefs.org, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, Bo b Peterson <rpeterso@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, Bruno Haible <bruno@clisp.org>,
 linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, 2023-09-20 at 10:41 +0200, Christian Brauner wrote:
> > > f1 was last written to *after* f2 was last written to. If the timesta=
mp of f1
> > > is then lower than the timestamp of f2, timestamps are fundamentally =
broken.
> > > =

> > > Many things in user-space depend on timestamps, such as build system
> > > centered around 'make', but also 'find ... -newer ...'.
> > > =

> > =

> > =

> > What does breakage with make look like in this situation? The "fuzz"
> > here is going to be on the order of a jiffy. The typical case for make
> > timestamp comparisons is comparing source files vs. a build target. If
> > those are being written nearly simultaneously, then that could be an
> > issue, but is that a typical behavior? It seems like it would be hard to
> > rely on that anyway, esp. given filesystems like NFS that can do lazy
> > writeback.
> > =

> > One of the operating principles with this series is that timestamps can
> > be of varying granularity between different files. Note that Linux
> > already violates this assumption when you're working across filesystems
> > of different types.
> > =

> > As to potential fixes if this is a real problem:
> > =

> > I don't really want to put this behind a mount or mkfs option (a'la
> > relatime, etc.), but that is one possibility.
> > =

> > I wonder if it would be feasible to just advance the coarse-grained
> > current_time whenever we end up updating a ctime with a fine-grained
> > timestamp? It might produce some inode write amplification. Files that
> =

> Less than ideal imho.
> =

> If this risks breaking existing workloads by enabling it unconditionally
> and there isn't a clear way to detect and handle these situations
> without risk of regression then we should move this behind a mount
> option.
> =

> So how about the following:
> =

> From cb14add421967f6e374eb77c36cc4a0526b10d17 Mon Sep 17 00:00:00 2001
> From: Christian Brauner <brauner@kernel.org>
> Date: Wed, 20 Sep 2023 10:00:08 +0200
> Subject: [PATCH] vfs: move multi-grain timestamps behind a mount option
> =

> While we initially thought we can do this unconditionally it turns out
> that this might break existing workloads that rely on timestamps in very
> specific ways and we always knew this was a possibility. Move
> multi-grain timestamps behind a vfs mount option.
> =

> Signed-off-by: Christian Brauner <brauner@kernel.org>
> ---
> =A0fs/fs_context.c     | 18 ++++++++++++++++++
> =A0fs/inode.c          |  4 ++--
> =A0fs/proc_namespace.c |  1 +
> =A0fs/stat.c           |  2 +-
> =A0include/linux/fs.h  |  4 +++-
> =A05 files changed, 25 insertions(+), 4 deletions(-)
> =

> diff --git a/fs/fs_context.c b/fs/fs_context.c
> index a0ad7a0c4680..dd4dade0bb9e 100644
> --- a/fs/fs_context.c
> +++ b/fs/fs_context.c
> @@ -44,6 +44,7 @@ static const struct constant_table common_set_sb_flag[]=
 =3D {
> =A0	{ "mand",	SB_MANDLOCK },
> =A0	{ "ro",		SB_RDONLY },
> =A0	{ "sync",	SB_SYNCHRONOUS },
> +	{ "mgtime",	SB_MGTIME },
> =A0	{ },
> =A0};
> =A0
> =

> @@ -52,18 +53,32 @@ static const struct constant_table common_clear_sb_fl=
ag[] =3D {
> =A0	{ "nolazytime",	SB_LAZYTIME },
> =A0	{ "nomand",	SB_MANDLOCK },
> =A0	{ "rw",		SB_RDONLY },
> +	{ "nomgtime",	SB_MGTIME },
> =A0	{ },
> =A0};
> =A0
> =

> +static inline int check_mgtime(unsigned int token, const struct fs_conte=
xt *fc)
> +{
> +	if (token !=3D SB_MGTIME)
> +		return 0;
> +	if (!(fc->fs_type->fs_flags & FS_MGTIME))
> +		return invalf(fc, "Filesystem doesn't support multi-grain timestamps");
> +	return 0;
> +}
> +
> =A0/*
> =A0=A0* Check for a common mount option that manipulates s_flags.
> =A0=A0*/
> =A0static int vfs_parse_sb_flag(struct fs_context *fc, const char *key)
> =A0{
> =A0	unsigned int token;
> +	int ret;
> =A0
> =

> =A0	token =3D lookup_constant(common_set_sb_flag, key, 0);
> =A0	if (token) {
> +		ret =3D check_mgtime(token, fc);
> +		if (ret)
> +			return ret;
> =A0		fc->sb_flags |=3D token;
> =A0		fc->sb_flags_mask |=3D token;
> =A0		return 0;
> @@ -71,6 +86,9 @@ static int vfs_parse_sb_flag(struct fs_context *fc, con=
st char *key)
> =A0
> =

> =A0	token =3D lookup_constant(common_clear_sb_flag, key, 0);
> =A0	if (token) {
> +		ret =3D check_mgtime(token, fc);
> +		if (ret)
> +			return ret;
> =A0		fc->sb_flags &=3D ~token;
> =A0		fc->sb_flags_mask |=3D token;
> =A0		return 0;
> diff --git a/fs/inode.c b/fs/inode.c
> index 54237f4242ff..fd1a2390aaa3 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2141,7 +2141,7 @@ EXPORT_SYMBOL(current_mgtime);
> =A0
> =

> =A0static struct timespec64 current_ctime(struct inode *inode)
> =A0{
> -	if (is_mgtime(inode))
> +	if (IS_MGTIME(inode))
> =A0		return current_mgtime(inode);
> =A0	return current_time(inode);
> =A0}
> @@ -2588,7 +2588,7 @@ struct timespec64 inode_set_ctime_current(struct in=
ode *inode)
> =A0		now =3D current_time(inode);
> =A0
> =

> =A0		/* Just copy it into place if it's not multigrain */
> -		if (!is_mgtime(inode)) {
> +		if (!IS_MGTIME(inode)) {
> =A0			inode_set_ctime_to_ts(inode, now);
> =A0			return now;
> =A0		}
> diff --git a/fs/proc_namespace.c b/fs/proc_namespace.c
> index 250eb5bf7b52..08f5bf4d2c6c 100644
> --- a/fs/proc_namespace.c
> +++ b/fs/proc_namespace.c
> @@ -49,6 +49,7 @@ static int show_sb_opts(struct seq_file *m, struct supe=
r_block *sb)
> =A0		{ SB_DIRSYNC, ",dirsync" },
> =A0		{ SB_MANDLOCK, ",mand" },
> =A0		{ SB_LAZYTIME, ",lazytime" },
> +		{ SB_MGTIME, ",mgtime" },
> =A0		{ 0, NULL }
> =A0	};
> =A0	const struct proc_fs_opts *fs_infop;
> diff --git a/fs/stat.c b/fs/stat.c
> index 6e60389d6a15..2f18dd5de18b 100644
> --- a/fs/stat.c
> +++ b/fs/stat.c
> @@ -90,7 +90,7 @@ void generic_fillattr(struct mnt_idmap *idmap, u32 requ=
est_mask,
> =A0	stat->size =3D i_size_read(inode);
> =A0	stat->atime =3D inode->i_atime;
> =A0
> =

> -	if (is_mgtime(inode)) {
> +	if (IS_MGTIME(inode)) {
> =A0		fill_mg_cmtime(stat, request_mask, inode);
> =A0	} else {
> =A0		stat->mtime =3D inode->i_mtime;
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 4aeb3fa11927..03e415fb3a7c 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1114,6 +1114,7 @@ extern int send_sigurg(struct fown_struct *fown);
> =A0#define SB_NODEV        BIT(2)	/* Disallow access to device special fi=
les */
> =A0#define SB_NOEXEC       BIT(3)	/* Disallow program execution */
> =A0#define SB_SYNCHRONOUS  BIT(4)	/* Writes are synced at once */
> +#define SB_MGTIME	BIT(5)	/* Use multi-grain timestamps */
> =A0#define SB_MANDLOCK     BIT(6)	/* Allow mandatory locks on an FS */
> =A0#define SB_DIRSYNC      BIT(7)	/* Directory modifications are synchron=
ous */
> =A0#define SB_NOATIME      BIT(10)	/* Do not update access times. */
> @@ -2105,6 +2106,7 @@ static inline bool sb_rdonly(const struct super_blo=
ck *sb) { return sb->s_flags
> =A0					((inode)->i_flags & (S_SYNC|S_DIRSYNC)))
> =A0#define IS_MANDLOCK(inode)	__IS_FLG(inode, SB_MANDLOCK)
> =A0#define IS_NOATIME(inode)	__IS_FLG(inode, SB_RDONLY|SB_NOATIME)
> +#define IS_MGTIME(inode)	__IS_FLG(inode, SB_MGTIME)
> =A0#define IS_I_VERSION(inode)	__IS_FLG(inode, SB_I_VERSION)
> =A0
> =

> =A0#define IS_NOQUOTA(inode)	((inode)->i_flags & S_NOQUOTA)
> @@ -2366,7 +2368,7 @@ struct file_system_type {
> =A0=A0*/
> =A0static inline bool is_mgtime(const struct inode *inode)
> =A0{
> -	return inode->i_sb->s_type->fs_flags & FS_MGTIME;
> +	return inode->i_sb->s_flags & SB_MGTIME;
> =A0}
> =A0
> =

> =A0extern struct dentry *mount_bdev(struct file_system_type *fs_type,

The mount option looks reasonable. Thanks for throwing together the
patch. Maybe in the future we can come up with a way to mitigate the
problems and do this unconditionally?

Reviewed-by: Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
