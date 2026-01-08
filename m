Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A3CD0517B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:40:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGJvcGfi1Zk9jZxaslaaYQS24vXA4C102+H+7hATBSc=; b=EkCfGIEm8fgOlNhm9DLWvyqzxy
	Dqgo2+cAU6JU/41/i/Hoxbqwcpo9YNLxkJeYK+NAD3v426HQyaHg9kIfRQovECemVQhTvwt2LNRlv
	OchsDoWlZ8LZSt97yI4VSVoiDu4EfMORL7GI8G0UZiKMMTdAaY+m68f8mqWi7jvHntTs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdtzj-0004u7-Dj;
	Thu, 08 Jan 2026 17:40:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vdtzh-0004tx-RR
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jan 2026 17:40:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F+CPMws/FnGYdGWk6ohH7U7LIk13uVJdlWREsvgP22k=; b=AiBsGE3J/dOUJwqIQ7hrC79NG3
 iHMrBPu+LAXcAQSJgtzZnOUOKCDvoKbmvI+ac9IfRHM9cs2XrYMXs3ZybSr1OA1BmniwNaLUHe7NW
 FTsp7fePe6o+Jn50k/WMivp1XWtd88HAgowH3kaFKc43PalSZhwS8uhrgPoZHS5FT6G0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F+CPMws/FnGYdGWk6ohH7U7LIk13uVJdlWREsvgP22k=; b=eYMqW5zcAM+P/f+hJEXZPXpwX9
 Am4JPBFI4/0xi5RhbbKDqGTZcE946UN4V+yCY2yh/s8uKMgi499exp18IgvOfDIN8i6S9JcebJJNf
 5rvLnAeaHChyszD6aZ8FcD8pqrOZmw2emnTa9m/Xif+ieCJK9aN9ynROfvQzczgsyvJg=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vdtzf-0000Iz-8k for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jan 2026 17:40:19 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 35D805CBBF;
 Thu,  8 Jan 2026 17:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1767893658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F+CPMws/FnGYdGWk6ohH7U7LIk13uVJdlWREsvgP22k=;
 b=v/EZdGITitw8CsQiMuaGfXbUwWWx8X5TD/YRa/XZZpZ68ngQ9xwJ0IIhpHdhcnkJ73fsRf
 p+mufimcDsVx7itgUk6q88o1BMvGZdhe3E1n/AChQ7pU+p1eYtiCRpkctujSCJSu5bivTP
 E3j+OIjCP6YUECLftS1PCmGaQtp0d/g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1767893658;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F+CPMws/FnGYdGWk6ohH7U7LIk13uVJdlWREsvgP22k=;
 b=ThMGOBotWNLGznhXYptjblJw1E5rrD2imFij6R6Qug5s3TyXHn8Vw/C9Wgt+x5X6XILeTi
 WJvEzDPbx8aSLDBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1767893658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F+CPMws/FnGYdGWk6ohH7U7LIk13uVJdlWREsvgP22k=;
 b=v/EZdGITitw8CsQiMuaGfXbUwWWx8X5TD/YRa/XZZpZ68ngQ9xwJ0IIhpHdhcnkJ73fsRf
 p+mufimcDsVx7itgUk6q88o1BMvGZdhe3E1n/AChQ7pU+p1eYtiCRpkctujSCJSu5bivTP
 E3j+OIjCP6YUECLftS1PCmGaQtp0d/g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1767893658;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F+CPMws/FnGYdGWk6ohH7U7LIk13uVJdlWREsvgP22k=;
 b=ThMGOBotWNLGznhXYptjblJw1E5rrD2imFij6R6Qug5s3TyXHn8Vw/C9Wgt+x5X6XILeTi
 WJvEzDPbx8aSLDBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 214E83EA65;
 Thu,  8 Jan 2026 17:34:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4jgcCJrqX2kmfQAAD6G6ig
 (envelope-from <jack@suse.cz>); Thu, 08 Jan 2026 17:34:18 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id C390EA0B23; Thu,  8 Jan 2026 18:34:13 +0100 (CET)
Date: Thu, 8 Jan 2026 18:34:13 +0100
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <j3qkk6xh6q76uorxfrqfp5gubc44qe6d3gqeshb55yxi3miexu@udfpls76gitt>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <20260108-setlease-6-20-v1-23-ea4dec9b67fa@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108-setlease-6-20-v1-23-ea4dec9b67fa@kernel.org>
X-Spam-Score: -2.30
X-Spamd-Result: default: False [-2.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 MISSING_XM_UA(0.00)[]; TAGGED_RCPT(0.00)[];
 FREEMAIL_CC(0.00)[kernel.org,gmail.com,fluxnic.net,infradead.org,suse.cz,alarsen.net,zeniv.linux.org.uk,suse.com,fb.com,linux.alibaba.com,google.com,huawei.com,vivo.com,mit.edu,dilger.ca,mail.parknet.co.jp,nod.at,dubeyko.com,paragon-software.com,fasheh.com,evilplan.org,omnibond.com,szeredi.hu,squashfs.org.uk,linux-foundation.org,samsung.com,sony.com,oracle.com,redhat.com,lwn.net,ionkov.net,codewreck.org,crudebyte.com,samba.org,manguebit.org,microsoft.com,talpey.com,vger.kernel.org,lists.ozlabs.org,lists.sourceforge.net,lists.infradead.org,lists.linux.dev,lists.orangefs.org,kvack.org,lists.samba.org];
 RCVD_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLwapsqjcu3srfensh8n36bg4p)];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; RCPT_COUNT_GT_50(0.00)[86];
 RCVD_TLS_LAST(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 08-01-26 12:13:18, Jeff Layton wrote: > Now that most
 filesystems where we expect to need lease support have > their ->setlease()
 operations explicitly set, change kernel_setlease() > to return [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vdtzf-0000Iz-8k
Subject: Re: [f2fs-dev] [PATCH 23/24] filelock: default to returning -EINVAL
 when ->setlease operation is NULL
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

On Thu 08-01-26 12:13:18, Jeff Layton wrote:
> Now that most filesystems where we expect to need lease support have
> their ->setlease() operations explicitly set, change kernel_setlease()
> to return -EINVAL when the setlease is a NULL pointer.
> 
> Also update the Documentation/ with info about this change.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  Documentation/filesystems/porting.rst | 9 +++++++++
>  Documentation/filesystems/vfs.rst     | 9 ++++++---
>  fs/locks.c                            | 3 +--
>  3 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/filesystems/porting.rst b/Documentation/filesystems/porting.rst
> index 3397937ed838e5e7dfacc6379a9d71481cc30914..c0f7103628ab5ed70d142a5c7f6d95ca4734c741 100644
> --- a/Documentation/filesystems/porting.rst
> +++ b/Documentation/filesystems/porting.rst
> @@ -1334,3 +1334,12 @@ end_creating() and the parent will be unlocked precisely when necessary.
>  
>  kill_litter_super() is gone; convert to DCACHE_PERSISTENT use (as all
>  in-tree filesystems have done).
> +
> +---
> +
> +**mandatory**
> +
> +The ->setlease() file_operation must now be explicitly set in order to provide
> +support for leases. When set to NULL, the kernel will now return -EINVAL to
> +attempts to set a lease. Filesystems that wish to use the kernel-internal lease
> +implementation should set it to generic_setlease().
> diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
> index 670ba66b60e4964927164a57e68adc0edfc681ee..21dc8921dd9ebedeafc4c108de7327f172138b6e 100644
> --- a/Documentation/filesystems/vfs.rst
> +++ b/Documentation/filesystems/vfs.rst
> @@ -1180,9 +1180,12 @@ otherwise noted.
>  	method is used by the splice(2) system call
>  
>  ``setlease``
> -	called by the VFS to set or release a file lock lease.  setlease
> -	implementations should call generic_setlease to record or remove
> -	the lease in the inode after setting it.
> +	called by the VFS to set or release a file lock lease.  Local
> +	filesystems that wish to use the kernel-internal lease implementation
> +	should set this to generic_setlease(). Other setlease implementations
> +	should call generic_setlease() to record or remove the lease in the inode
> +	after setting it. When set to NULL, attempts to set or remove a lease will
> +	return -EINVAL.
>  
>  ``fallocate``
>  	called by the VFS to preallocate blocks or punch a hole.
> diff --git a/fs/locks.c b/fs/locks.c
> index e2036aa4bd3734be415296f9157d8f17166878aa..ea38a18f373c2202ba79e8e37125f8d32a0e2d42 100644
> --- a/fs/locks.c
> +++ b/fs/locks.c
> @@ -2016,8 +2016,7 @@ kernel_setlease(struct file *filp, int arg, struct file_lease **lease, void **pr
>  		setlease_notifier(arg, *lease);
>  	if (filp->f_op->setlease)
>  		return filp->f_op->setlease(filp, arg, lease, priv);
> -	else
> -		return generic_setlease(filp, arg, lease, priv);
> +	return -EINVAL;
>  }
>  EXPORT_SYMBOL_GPL(kernel_setlease);
>  
> 
> -- 
> 2.52.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
