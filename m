Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFkVJLRYcmkpiwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 18:04:52 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5626AB58
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 18:04:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydekLp5YFEdJwrmLfOh/e4f3jgVZ57WMSK4m8EaXxU4=; b=DZ3iWsOkzTd1odOqDwL2xZsibP
	frMHTN8y3YieJm/hjb2G9/cRBEk5fuUXkxZdKxI+YHTaGXILqzseCywCaXXH6tnt3Y1vYeC0hUBmu
	56x/UevwST0yxqeKiwtNyusfdZ7iyspmwaivlkpU1xecWekkG/caE64FhlzML/xPWzCo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1viy6n-0004RI-IT;
	Thu, 22 Jan 2026 17:04:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1viy6l-0004R2-LE;
 Thu, 22 Jan 2026 17:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qs+XaS+FGKy5XGjHxsh2yZR3UAuTtojhMQnjtTVwQfA=; b=DQJpdVxcLrPN39oG3XjU67yA+G
 QiPmlJLZtYrmvsabCRcomxkgyxXhoWmzR5T9KckaCMfidihlh1xwFnrFusLwXUxD0QGhYd0IvJRDi
 +SDD+6ijzm9hAxr/HdHZwNOo0p8KnVbRc5Hn+cgYrmgguOK6MVwzZP5mfCGC425gTd6w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qs+XaS+FGKy5XGjHxsh2yZR3UAuTtojhMQnjtTVwQfA=; b=h1q9CMJ2tihlWsCDfQAryEZXlW
 stGrFrnIi7ciusukVFBG8Gf9AtL3dhh2iCfcRmrrVYkchafxBzjZ/Sej/xFAjgPkOtP4pXL6WZfRv
 pZj7Yd/Mr37NhOoZ5/yRgYooRlWPs15hvlbVjoetZx718N9BhvWhq5nGZ2xe3q69Mn7k=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1viy6l-0003zh-3q; Thu, 22 Jan 2026 17:04:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 528AE4099B;
 Thu, 22 Jan 2026 17:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 156DAC116C6;
 Thu, 22 Jan 2026 17:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769101464;
 bh=xwFz5Oidq8APQpCp7THEtDpXn9O+NGssd7GC7NPkIXE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ueyMX6ohlT+V7E4FTnwyr+bckr2XgM0otlsgh+U8+RB7dufNou2jXtRF8/4HiLX1h
 aiyHG+xAbRXlOpSKYNl+YW1B6es8lJGWyDpCT3G89X8Bn++QSMPHsovt5BRyWj7Z84
 MiFPflUjkr2UeHtVIt004pQ2LHYESJ6jR9ib6bF3tKB5BvchCfBJcHtl2H7eGV6Hj+
 XeQh59i2mPbJ0Z07CURTocG8MzgcrhLB0YpqMQ2BX+Q2rUwcSwiRIRCTHIiyBghAen
 fRki137MnL3p5j+2P7Cc4giyKdLsB0k8xoBASjwbPFk1rE23p0Kg5qRxi8CJQxSLFn
 VC/vMBqCcUNNQ==
Date: Thu, 22 Jan 2026 09:04:23 -0800
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20260122170423.GU5945@frogsfrogsfrogs>
References: <176885553525.16766.291581709413217562@noble.neil.brown.name>
 <aW8w2SRyFnmA2uqk@infradead.org>
 <176890126683.16766.5241619788613840985@noble.neil.brown.name>
 <aXCg-MqXH0E6IuwS@infradead.org>
 <176899164457.16766.16099772451425825775@noble.neil.brown.name>
 <364d2fd98af52a2e2c32ca286decbdc1fe1c80d3.camel@kernel.org>
 <aXDm8FPPOHs04w9m@infradead.org>
 <3210d04fa2c0b1f4312d10506cac30586cb49a3c.camel@kernel.org>
 <aXHFlF1tef68i2HU@infradead.org>
 <b491335d12e976e1ea1c07b9c14164ac69d22aea.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b491335d12e976e1ea1c07b9c14164ac69d22aea.camel@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 22, 2026 at 07:12:36AM -0500, Jeff Layton wrote:
 > On Wed, 2026-01-21 at 22:37 -0800, Christoph Hellwig wrote: > > On Wed,
 Jan 21, 2026 at 10:18:00AM -0500, Jeff Layton wrote: > > > > fat [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1viy6l-0003zh-3q
Subject: Re: [f2fs-dev] [PATCH 00/29] fs: require filesystems to explicitly
 opt-in to nfsd export support
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Martin Brandenburg <martin@omnibond.com>,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Alex Markuze <amarkuze@redhat.com>,
 Sandeep Dhavale <dhavale@google.com>, linux-btrfs@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Yue Hu <zbestahu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Viacheslav Dubeyko <slava@dubeyko.com>,
 NeilBrown <neil@brown.name>, Gao Xiang <xiang@kernel.org>,
 linux-ext4@vger.kernel.org, Salah Triki <salah.triki@gmail.com>,
 linux-mm@kvack.org, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>,
 Olga Kornievskaia <okorniev@redhat.com>, linux-cifs@vger.kernel.org,
 Dave Kleikamp <shaggy@kernel.org>, linux-nfs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, ocfs2-devel@lists.linux.dev,
 Bharath SM <bharathsm@microsoft.com>, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-erofs@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 David Woodhouse <dwmw2@infradead.org>, Trond Myklebust <trondmy@kernel.org>,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FREEMAIL_CC(0.00)[omnibond.com,lists.sourceforge.net,suse.cz,manguebit.org,redhat.com,google.com,vger.kernel.org,kernel.org,gmail.com,paragon-software.com,fb.com,dilger.ca,vivo.com,lists.infradead.org,szeredi.hu,nod.at,fasheh.com,oracle.com,infradead.org,dubeyko.com,brown.name,kvack.org,lists.orangefs.org,microsoft.com,talpey.com,lists.linux.dev,suse.com,zeniv.linux.org.uk,linux.alibaba.com,mail.parknet.co.jp,mit.edu,lists.ozlabs.org,samba.org,huawei.com,squashfs.org.uk,linux-foundation.org,evilplan.org];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[72];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[djwong@kernel.org]
X-Rspamd-Queue-Id: CA5626AB58
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 07:12:36AM -0500, Jeff Layton wrote:
> On Wed, 2026-01-21 at 22:37 -0800, Christoph Hellwig wrote:
> > On Wed, Jan 21, 2026 at 10:18:00AM -0500, Jeff Layton wrote:
> > > > fat seems to be an exception as far as the 'real' file systems go.
> > > > And it did sound to me like some of the synthetic ones had similar
> > > > issues.
> > > > 
> > > 
> > > Not sure what we can do about FAT without changing the filehandle
> > > format in some fashion. The export ops just use
> > > generic_encode_ino32_fh, and FAT doesn't have stable inode numbers.
> > > The "nostale" ops seem sane enough but it looks like they only work
> > > with the fs in r/o mode.
> > 
> > Yeah.  I guess we need to ignore this because of <history>
> > 
> 
> Yep. This is a case where the handles are not PERSISTENT but I don't
> think we can get away with making FAT unexportable. We're probably
> stuck with it.
> 
> > > > I think Amirs patch would take care of that.  Although userland nfs
> > > > servers or other storage applications using the handle syscalls would
> > > > still see them.  Then again fixing the problem that some handles
> > > > did not fulfill the long standing (but not documented well enough)
> > > > semantics probably is a good fix on it's own.
> > > 
> > > Agreed. We should try to ensure uniqueness and persistence in all
> > > filehandles both for nfsd and userland applications.
> > 
> > Sounds good to me.
> 
> 
> Unfortunately, there are already exceptions. Apparently pidfs and
> cgroupfs handles (at least) can't be extended because of userspace
> expectations:
> 
> https://lore.kernel.org/linux-nfs/20260120-irrelevant-zeilen-b3c40a8e6c30@brauner/

systemd cracking file handles??  Yeesh, I thought userspace was supposed
to treat a file handle as an opaque N-byte blob and nothing more, and
only certain "special" tools (e.g. xfsprogs on XFS) could do more than
that.

--D

> My personal take is that we should try to make handle uniqueness a goal
> for most existing filesystems, but we're going to have some that can't
> achieve that. For them we probably want to be able to flag them so they
> can be id'ed by userland.
> 
> So, we will need an export_operations flag of some sort
> (EXPORT_OP_UNIQUE_HANDLES?). At that point, we'll have to decide
> whether to deny nfsd export based on that flag:
> 
> We could deny export of any fs that doesn't set the flag, but NFSv4
> actually allows the server to advertise that it can't guarantee handle
> uniqueness. There isn't much guidance for the client on how to handle
> that though and the attribute seems to have the scope of the entire NFS
> server.
> 
> -- 
> Jeff Layton <jlayton@kernel.org>
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
