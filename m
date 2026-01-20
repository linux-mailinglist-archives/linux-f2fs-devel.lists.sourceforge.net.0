Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLz+KOSqb2lUEwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 17:18:44 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D0747487
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 17:18:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:Date:To:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JV6HMSmbO1oxqnSjAcEG5HqGL5BsZq3fIY+B7Sncrqg=; b=jERQGUwqhJVdTnj+4i8ijFDg1d
	GtttkJ/igE7e9LlAT1ydfJLx5uG8GVgrYTLBsmQM4qfkQFnnKIIj3EjwSIPZY/8RLzQWiIsWYnxBL
	iodNI91LFg3KppxzU6hdrOrl8Edfax22TJFqVdxr3wvar0KHdtj3YgDN3QW2C59nSBAI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1viC06-0000ME-Ub;
	Tue, 20 Jan 2026 13:42:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1viC04-0000Lm-Rs;
 Tue, 20 Jan 2026 13:42:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZPh1bIEeClZlMd7bH2zfFr1HL2hgNaprhlSBrD/6mSY=; b=jfVLXdDTdBm5b84mPkNOC7Hznf
 Ch/QCosRTCHVkAt18rjbpQa+f4fO4L0OicrzHYOnPo7SyOERvhSB5m+7SJUrvMhzhSgUVlBxPjbXM
 lBO/x6GgEnj3YMJ/wVY3mKH3cy70KgCPedY6yWd+Rq8oFPqoJSyMTEvXzz4LF84jhsvU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZPh1bIEeClZlMd7bH2zfFr1HL2hgNaprhlSBrD/6mSY=; b=DJA1/OyjPf0tCPA1a0D8UP3gQ6
 UsVmLbkHd7Y65hMaQee3H8LVMHXwMJeylEVxoOr946OVPWVwInd/4nx7RfZx2CUGnpROZRDqq3Dlq
 8BVMPVaJ3qF6HnsnDHyXpAwrBcXxikA05PyyZlRlxFKD9yivdVNVyunYh8YyAB+fViXc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1viC05-0005tV-0V; Tue, 20 Jan 2026 13:42:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1D83860010;
 Tue, 20 Jan 2026 13:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C70C19423;
 Tue, 20 Jan 2026 13:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768916537;
 bh=70xOEysdn9UJBfJ6hZvmemjOLtpi4tu/aOHR5XtOJmA=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=E3IfCvhFSjcgHbt8sW4iAN9Q+Fhoo2DaD/SdAlRpv5OIPZC2KO18v2JPtkn+685tY
 EBsUPVQuLfdcLN8M507Lkfwl8ntIF0Bxo5A8li5m903Umi34vm1DpY9uf/HNucGVJk
 F42IDUQfsCdgr/65dLR+KmnfcUTo2tbwQSuLHJeNzLBOvxJ1phqg7/EtJLJ2nk3Msj
 qqRAXA3jTIzPkUx4cdGr6x4p8vu4y8RPPuuf65DOzOMlgsNdx+yjN5G7O9ww9z7EyI
 blrbxcoszpmxC+JpNJCS2rZImSbbScoXp5uZ/dSFvVnxzxRU9sK+DrZte9HsbyjIjH
 xlDkN+7kByVlw==
Message-ID: <cd6d3f59b22d3febfe7e58fc740df2715e2b9ee3.camel@kernel.org>
To: Chuck Lever <chuck.lever@oracle.com>, Christian Brauner
 <brauner@kernel.org>,  Alexander Viro <viro@zeniv.linux.org.uk>, NeilBrown
 <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>,  Dai Ngo
 <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, Amir Goldstein
 <amir73il@gmail.com>,  Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Andrew Morton	
 <akpm@linux-foundation.org>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger	
 <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, Gao Xiang
 <xiang@kernel.org>,  Chao Yu <chao@kernel.org>, Yue Hu
 <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,  Sandeep
 Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>, Chunhai
 Guo <guochunhai@vivo.com>,  Carlos Maiolino	 <cem@kernel.org>, Ilya Dryomov
 <idryomov@gmail.com>, Alex Markuze	 <amarkuze@redhat.com>, Viacheslav
 Dubeyko <slava@dubeyko.com>, Chris Mason	 <clm@fb.com>, David Sterba
 <dsterba@suse.com>, Luis de Bethencourt	 <luisbg@kernel.org>, Salah Triki
 <salah.triki@gmail.com>, Phillip Lougher	 <phillip@squashfs.org.uk>, Steve
 French <sfrench@samba.org>, Paulo Alcantara	 <pc@manguebit.org>, Ronnie
 Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N	
 <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, Miklos
 Szeredi	 <miklos@szeredi.hu>, Mike Marshall <hubcap@omnibond.com>, Martin
 Brandenburg	 <martin@omnibond.com>, Mark Fasheh <mark@fasheh.com>, Joel
 Becker	 <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Ryusuke
 Konishi <konishi.ryusuke@gmail.com>,  Trond Myklebust <trondmy@kernel.org>,
 Anna Schumaker <anna@kernel.org>, Dave Kleikamp <shaggy@kernel.org>, David
 Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Jan
 Kara <jack@suse.cz>,  Andreas Gruenbacher	 <agruenba@redhat.com>, OGAWA
 Hirofumi <hirofumi@mail.parknet.co.jp>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Date: Tue, 20 Jan 2026 08:42:09 -0500
In-Reply-To: <8808c9f0-a998-448c-a4b6-b88fabb2ca23@oracle.com>
References: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org>
 <20260119-exportfs-nfsd-v2-31-d93368f903bd@kernel.org>
 <8808c9f0-a998-448c-a4b6-b88fabb2ca23@oracle.com>
Autocrypt: addr=jlayton@kernel.org; prefer-encrypt=mutual;
 keydata=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
 QZIQXVeAA+smfTT0tDrisj1U5x6ZB9b3nBg65kc=
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 2026-01-19 at 11:47 -0500, Chuck Lever wrote: > On
 1/19/26 11:26 AM, Jeff Layton wrote: > > Get rid of the dprintk messages
 in check_export(). Instead add new > > tracepoints that show the ter [...]
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
X-Headers-End: 1viC05-0005tV-0V
Subject: Re: [f2fs-dev] [PATCH v2 31/31] nfsd: convert dprintks in
 check_export() to tracepoints
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
From: Jeff Layton via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jeff Layton <jlayton@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net, linux-doc@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, linux-unionfs@vger.kernel.org,
 gfs2@lists.linux.dev, linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 David Laight <david.laight.linux@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, ocfs2-devel@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[oracle.com,kernel.org,zeniv.linux.org.uk,brown.name,redhat.com,talpey.com,gmail.com,google.com,linux.alibaba.com,linux-foundation.org,mit.edu,dilger.ca,suse.com,huawei.com,vivo.com,dubeyko.com,fb.com,squashfs.org.uk,samba.org,manguebit.org,microsoft.com,szeredi.hu,omnibond.com,fasheh.com,evilplan.org,paragon-software.com,infradead.org,nod.at,suse.cz,mail.parknet.co.jp,lwn.net];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.sourceforge.net,vger.kernel.org,fromorbit.com,lists.linux.dev,kvack.org,lists.infradead.org,gmail.com,infradead.org,lists.orangefs.org,lists.samba.org,lists.ozlabs.org];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[77];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[jlayton@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: F3D0747487
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 2026-01-19 at 11:47 -0500, Chuck Lever wrote:
> On 1/19/26 11:26 AM, Jeff Layton wrote:
> > Get rid of the dprintk messages in check_export(). Instead add new
> > tracepoints that show the terminal inode and the flags.
> > 
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> >  fs/nfsd/export.c | 11 ++++++-----
> >  fs/nfsd/trace.h  | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 58 insertions(+), 5 deletions(-)
> > 
> > diff --git a/fs/nfsd/export.c b/fs/nfsd/export.c
> > index bc703cf58bfa210c7c57d49f22f15bc10d7cfc91..3cc336b953b38573966c43000f31cd341380837b 100644
> > --- a/fs/nfsd/export.c
> > +++ b/fs/nfsd/export.c
> > @@ -435,31 +435,32 @@ static int check_export(const struct path *path, int *flags, unsigned char *uuid
> >  	if (!(inode->i_sb->s_type->fs_flags & FS_REQUIRES_DEV) &&
> >  	    !(*flags & NFSEXP_FSID) &&
> >  	    uuid == NULL) {
> > -		dprintk("exp_export: export of non-dev fs without fsid\n");
> > +		trace_nfsd_check_export_need_fsid(inode, *flags);
> >  		return -EINVAL;
> >  	}
> >  
> >  	if (!exportfs_can_decode_fh(inode->i_sb->s_export_op)) {
> > -		dprintk("exp_export: export of invalid fs type.\n");
> > +		trace_nfsd_check_export_invalid_fstype(inode, *flags);
> >  		return -EINVAL;
> >  	}
> >  
> >  	if (!(inode->i_sb->s_export_op->flags & EXPORT_OP_STABLE_HANDLES)) {
> > -		dprintk("%s: fs does not provide stable filehandles!\n", __func__);
> > +		trace_nfsd_check_export_no_stable_fh(inode, *flags);
> >  		return -EINVAL;
> >  	}
> >  
> >  	if (is_idmapped_mnt(path->mnt)) {
> >  		dprintk("exp_export: export of idmapped mounts not yet supported.\n");

Doh! I left the above dprintk() in -- fixed in tree.

> > +		trace_nfsd_check_export_idmapped(inode, *flags);
> >  		return -EINVAL;
> >  	}
> >  
> >  	if (inode->i_sb->s_export_op->flags & EXPORT_OP_NOSUBTREECHK &&
> >  	    !(*flags & NFSEXP_NOSUBTREECHECK)) {
> > -		dprintk("%s: %s does not support subtree checking!\n",
> > -			__func__, inode->i_sb->s_type->name);
> > +		trace_nfsd_check_export_subtree(inode, *flags);
> >  		return -EINVAL;
> >  	}
> > +	trace_nfsd_check_export_success(inode, *flags);
> >  	return 0;
> >  }
> >  
> > diff --git a/fs/nfsd/trace.h b/fs/nfsd/trace.h
> > index 5ae2a611e57f4b4e51a4d9eb6e0fccb66ad8d288..e3f5fe1181b605b34cb70d53f32739c3ef9b82f6 100644
> > --- a/fs/nfsd/trace.h
> > +++ b/fs/nfsd/trace.h
> > @@ -339,6 +339,58 @@ DEFINE_EVENT_CONDITION(nfsd_fh_err_class, nfsd_##name,	\
> >  DEFINE_NFSD_FH_ERR_EVENT(set_fh_dentry_badexport);
> >  DEFINE_NFSD_FH_ERR_EVENT(set_fh_dentry_badhandle);
> >  
> > +#define show_export_flags(val)						\
> 
> Whacky. I thought we had one of these already, but I can't find one.
> 
> 
> > +	__print_flags(val, "|",						\
> > +		{ NFSEXP_READONLY,		"READONLY" },		\
> > +		{ NFSEXP_INSECURE_PORT,		"INSECURE" },		\
> > +		{ NFSEXP_ROOTSQUASH,		"ROOTSQUASH" },		\
> > +		{ NFSEXP_ALLSQUASH,		"ALLSQUASH" },		\
> > +		{ NFSEXP_ASYNC,			"ASYNC" },		\
> > +		{ NFSEXP_GATHERED_WRITES,	"GATHERED_WRITES" },	\
> > +		{ NFSEXP_NOREADDIRPLUS,		"NOREADDIRPLUS" },	\
> > +		{ NFSEXP_SECURITY_LABEL,	"SECURITY_LABEL" },	\
> > +		{ NFSEXP_NOHIDE,		"NOHIDE" },		\
> > +		{ NFSEXP_NOSUBTREECHECK,	"NOSUBTREECHECK" },	\
> > +		{ NFSEXP_NOAUTHNLM,		"NOAUTHNLM" },		\
> > +		{ NFSEXP_MSNFS,			"MSNFS" },		\
> > +		{ NFSEXP_FSID,			"FSID" },		\
> > +		{ NFSEXP_CROSSMOUNT,		"CROSSMOUNT" },		\
> > +		{ NFSEXP_NOACL,			"NOACL" },		\
> > +		{ NFSEXP_V4ROOT,		"V4ROOT" },		\
> > +		{ NFSEXP_PNFS,			"PNFS" })
> > +
> > +DECLARE_EVENT_CLASS(nfsd_check_export_class,
> > +	TP_PROTO(const struct inode *inode,
> > +		 int flags),
> > +	TP_ARGS(inode, flags),
> > +	TP_STRUCT__entry(
> > +		__field(dev_t, dev)
> > +		__field(ino_t, ino)
> > +		__field(int, flags)
> > +	),
> > +	TP_fast_assign(
> > +		__entry->dev = inode->i_sb->s_dev;
> > +		__entry->ino = inode->i_ino;
> > +		__entry->flags = flags;
> > +	),
> > +	TP_printk("dev=%u:%u:%lu flags=%s",
> > +		  MAJOR(__entry->dev), MINOR(__entry->dev),
> > +		  __entry->ino, show_export_flags(__entry->flags))
> > +)
> > +
> > +#define DEFINE_NFSD_CHECK_EXPORT_EVENT(name)			\
> > +DEFINE_EVENT(nfsd_check_export_class, nfsd_check_export_##name,	\
> > +	TP_PROTO(const struct inode *inode,			\
> > +		 int flags),					\
> > +	TP_ARGS(inode, flags))
> > +
> > +DEFINE_NFSD_CHECK_EXPORT_EVENT(need_fsid);
> > +DEFINE_NFSD_CHECK_EXPORT_EVENT(invalid_fstype);
> > +DEFINE_NFSD_CHECK_EXPORT_EVENT(no_stable_fh);
> > +DEFINE_NFSD_CHECK_EXPORT_EVENT(idmapped);
> > +DEFINE_NFSD_CHECK_EXPORT_EVENT(subtree);
> > +DEFINE_NFSD_CHECK_EXPORT_EVENT(success);
> > +
> >  TRACE_EVENT(nfsd_exp_find_key,
> >  	TP_PROTO(const struct svc_expkey *key,
> >  		 int status),
> > 
> 
> 'Twould be nice to report the namespace or client address that
> was making the failing request, but maybe that information is
> not available in check_export.
>
> Reviewed-by: Chuck Lever <chuck.lever@oracle.com>
> 

That might be possible, but it means refactoring check_export().

Given that we're still haggling over the flag name and semantics, lets
drop this patch from the series for now.

Once the other bits are settled, I'll respin the tracepoint patches on
top. That part can be better sorted out on the linux-nfs ml anyway.

Thanks!
-- 
Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
