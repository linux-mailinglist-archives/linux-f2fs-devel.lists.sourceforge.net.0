Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A2BD3C24B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 09:40:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+Ebfvr25+tdCVE/nPBsAmQHO+Lc+/htpR/M7CPHI84=; b=TYbAMNkpXNNIwifzBNCJPf62Lb
	bFxzMG89DJAgfoCAySEi/VupTl9PTkcI5LTeVRfX9mGPk9wDQcLwcUk8fHL/ayxGN+TTiwVtlfXWW
	fM9iJRRcCBsdMsrHyNFsLXPTnPi2grsubgLGk0Z0T5IWyC6V+MedL5Xsxw0Y3PzH2jOc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vi7Hd-00013j-2F;
	Tue, 20 Jan 2026 08:40:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vi7Hb-00013d-BV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 08:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=241NHzkrAsafry/49JFnJwfuSaj964PJNO6i4H5lhSI=; b=lkigG+/He5+E2Jy3NmlZINAl3B
 ageF/BGm3AbI7uL6LKqA+Xjr69A4VPGEW3iffnwG34Ub1FC872monMikab8Ib58UYUJ2ysoABw+Ag
 IgLX/VdaPTCRO51+zmAbYzZB3BFbeniPfItBPrOczbWjFDhqweK1vB9GETr/4I+xxWxA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=241NHzkrAsafry/49JFnJwfuSaj964PJNO6i4H5lhSI=; b=C43NhYlSEGv2NDTPCwSEY4WiJ+
 Z5lolc2qqzoszgmIHF9Frh9Knv/HvVfiF1YyIGWv5NEx3D/XHI95zgQ5pcWeZwSKd/hvminDqqpcK
 0+Ta1oM92iWcI9eRLpOsAHVstQT/dUNgtoNDdPYGZT13RFzlDHXw3rMQekyiyS7BX9sU=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vi7Ha-0004ID-Am for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 08:40:15 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AD0C55BCC3;
 Tue, 20 Jan 2026 08:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1768898407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=241NHzkrAsafry/49JFnJwfuSaj964PJNO6i4H5lhSI=;
 b=lXbl/VQVuVPBPaq9av5smG5OFa/NhiwefeYAnKTxiTxM2QX9a0Jsbdpis0tVJFy+unWMtD
 bNh/ywftBTm5m2O2e7f0QmCLthEIxPwfSwEbrsfum9UBevwRj24bv8DnE2XCtOBZOykvGt
 AUYIB66up1nxz+RBb/9UrZZim7/aN7w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1768898407;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=241NHzkrAsafry/49JFnJwfuSaj964PJNO6i4H5lhSI=;
 b=LDOUWFgZ9L1jfR2KXNRaliX4q7afY0RWN0QEnpzcnPdpU998Wx8+N3DLW81My4a1pFp2EE
 dwI54JIvYwP/B5AA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="lXbl/VQV";
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=LDOUWFgZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1768898407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=241NHzkrAsafry/49JFnJwfuSaj964PJNO6i4H5lhSI=;
 b=lXbl/VQVuVPBPaq9av5smG5OFa/NhiwefeYAnKTxiTxM2QX9a0Jsbdpis0tVJFy+unWMtD
 bNh/ywftBTm5m2O2e7f0QmCLthEIxPwfSwEbrsfum9UBevwRj24bv8DnE2XCtOBZOykvGt
 AUYIB66up1nxz+RBb/9UrZZim7/aN7w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1768898407;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=241NHzkrAsafry/49JFnJwfuSaj964PJNO6i4H5lhSI=;
 b=LDOUWFgZ9L1jfR2KXNRaliX4q7afY0RWN0QEnpzcnPdpU998Wx8+N3DLW81My4a1pFp2EE
 dwI54JIvYwP/B5AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9D31D3EA65;
 Tue, 20 Jan 2026 08:40:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 3csLJmc/b2l8AwAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 20 Jan 2026 08:40:07 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 47975A09DA; Tue, 20 Jan 2026 09:40:07 +0100 (CET)
Date: Tue, 20 Jan 2026 09:40:07 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <56fr33ju43h6zzp6jrzrkyfag6r3jz6wpnk45oe5byy6fqyvti@d43hgikfuk7t>
References: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org>
 <20260119-exportfs-nfsd-v2-2-d93368f903bd@kernel.org>
 <aW8ztQ-RbhxwzMk7@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aW8ztQ-RbhxwzMk7@infradead.org>
X-Spamd-Result: default: False [-2.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_TLS_LAST(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_COUNT_THREE(0.00)[3]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_CC(0.00)[kernel.org,zeniv.linux.org.uk,oracle.com,brown.name,redhat.com,talpey.com,gmail.com,google.com,linux.alibaba.com,linux-foundation.org,mit.edu,dilger.ca,suse.com,huawei.com,vivo.com,dubeyko.com,fb.com,squashfs.org.uk,samba.org,manguebit.org,microsoft.com,szeredi.hu,omnibond.com,fasheh.com,evilplan.org,paragon-software.com,infradead.org,nod.at,suse.cz,mail.parknet.co.jp,lwn.net,fromorbit.com,vger.kernel.org,kvack.org,lists.ozlabs.org,lists.samba.org,lists.orangefs.org,lists.linux.dev,lists.sourceforge.net,lists.infradead.org];
 DKIM_TRACE(0.00)[suse.cz:+]; TO_MATCH_ENVRCPT_SOME(0.00)[];
 RCPT_COUNT_GT_50(0.00)[78]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLpnapcpkwxdkc5mopt1ezhhna)];
 MISSING_XM_UA(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email, imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Score: -2.51
X-Rspamd-Queue-Id: AD0C55BCC3
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 19-01-26 23:50:13, Christoph Hellwig wrote: > On Mon, 
 Jan 19, 2026 at 11:26:19AM -0500,
 Jeff Layton wrote: > > + EXPORT_OP_STABLE_HANDLES
 - This filesystem provides filehandles that are > > + s [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1vi7Ha-0004ID-Am
Subject: Re: [f2fs-dev] [PATCH v2 02/31] exportfs: add new
 EXPORT_OP_STABLE_HANDLES flag
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
Cc: Martin Brandenburg <martin@omnibond.com>,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Alex Markuze <amarkuze@redhat.com>,
 Sandeep Dhavale <dhavale@google.com>, linux-btrfs@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 Dave Chinner <david@fromorbit.com>, linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Yue Hu <zbestahu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 samba-technical@lists.samba.org, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, linux-doc@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Viacheslav Dubeyko <slava@dubeyko.com>, NeilBrown <neil@brown.name>,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, linux-mm@kvack.org,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
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
 Jonathan Corbet <corbet@lwn.net>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 David Woodhouse <dwmw2@infradead.org>,
 David Laight <david.laight.linux@gmail.com>,
 Trond Myklebust <trondmy@kernel.org>, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon 19-01-26 23:50:13, Christoph Hellwig wrote:
> On Mon, Jan 19, 2026 at 11:26:19AM -0500, Jeff Layton wrote:
> > +  EXPORT_OP_STABLE_HANDLES - This filesystem provides filehandles that are
> > +    stable across the lifetime of a file. This is a hard requirement for export
> > +    via nfsd. Any filesystem that is eligible to be exported via nfsd must
> > +    indicate this guarantee by setting this flag. Most disk-based filesystems
> > +    can do this naturally. Pseudofilesystems that are for local reporting and
> > +    control (e.g. kernfs, pidfs, nsfs) usually can't support this.
> 
> Suggested rewording, taking some of the ideas from Dave Chinners earlier
> comments into account:
> 
>   EXPORT_OP_STABLE_HANDLES - This filesystem provides filehandles that are
>     stable across the lifetime of a file.  A file in this context is an
>     instantiated inode reachable by one or more file names, or still open after
>     the last name has been unlinked.  Reuses of the same on-disk inode structure
>     are considered new files and must provide different file handles from the
>     previous incarnation.  Most file systems designed to store user data
>     naturally provide this capability.  Pseudofilesystems that are for local
>     reporting and control (e.g. kernfs, pidfs, nsfs) usually can't support this.
> 
>     This flags is a hard requirement for export via nfsd. Any filesystem that
>     is eligible to be exported via nfsd must indicate this guarantee by
>     setting this flag.

I like this. It certainly makes the requirement of stability clearer to me
(with explanations before I couldn't quite see the difference between shmem
and kernfs). I'd note that fat or shmem (which are both exportable)
satisfy this only with reasonably high probability as they use
get_random_u32() for initializing their i_generation but I guess it's as
good as it gets for them.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
