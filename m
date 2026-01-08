Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 29363D0518A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:40:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=POELJM+wp2EcIrzCEx5McBVPI+0/NC7REubmQSZV5wM=; b=myqE36cF2Yjq1B9WTvfUDB8EV3
	Qjm+8s2yIg/tGSh7cz7KjBA2R3PjmgeRyaHpv805rceFtrNiBWXpC77kZ7rwJ9aB80JfOyuU9jxi+
	V8yNJpiGi8Qg4/F/o3qCPEOMiYFQ+Cq0lW43fUn8PNpqhwuXz8jRLnabccM00cfAMDKY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdtzs-0005lx-3T;
	Thu, 08 Jan 2026 17:40:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vdtzq-0005lp-3w
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jan 2026 17:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pbYulziCehk0+dq0CXHXUlJblsepps/x0pBz736+F88=; b=SW7u8CU1YT+/2LEudV4BwKstt2
 KuyFve2iqOyOQjwVb35JFHOugMcMqP+bI9HelZbecHjqELBZ3s0Tl1ePskUSzqMh20kvhhbXgsrf4
 QIf9o/tvKaaeR8SZlYmwR1Oy2TMPNUV4h33OT61H3lYXx7kPjmGxyE5IojvaQuC+9JIU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pbYulziCehk0+dq0CXHXUlJblsepps/x0pBz736+F88=; b=B1d8Q5vbhQiStNDTZR1tAWgyu0
 4PEH19CMJvG6cHhWofxI4EvTAX3R1QTRmGTpU+rv1SZh9GTr8tyeS8EogmAcPiEMxF+c+4Ywx5pVZ
 wYTbZNRE8K9kf4+mQTO8rVwl/bQY4tBodk+ShLPUS48fn2+nWXi5kEisR/1hmz6BLUYY=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vdtzp-0000Js-WC for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jan 2026 17:40:30 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 722E55CBEB;
 Thu,  8 Jan 2026 17:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1767894008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pbYulziCehk0+dq0CXHXUlJblsepps/x0pBz736+F88=;
 b=v6o0xZIIolBq3Kc+VF6+9Ya5E6t2G34FsAJ4qlruIPlrp3yRFZ1mosmLKssOtf8GopFPv6
 pdM5KNdg6uqkpzJC2OCiQs93p2MdVtM1C1AsH2TngC8tV9OjZ7anbkGl2iE3fhCSU9mvhX
 K1VxnfPudBQRQJ1Q1ovU0oM49Yj5Rmo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1767894008;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pbYulziCehk0+dq0CXHXUlJblsepps/x0pBz736+F88=;
 b=iQxzzizVuPHl0WVwxtpKrivs8r+dbY1HBg67emHdQ+8PTu3CciNeemY/i1L/NaN8QOR0LX
 w4waIzEE2aIOLGCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1767894008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pbYulziCehk0+dq0CXHXUlJblsepps/x0pBz736+F88=;
 b=v6o0xZIIolBq3Kc+VF6+9Ya5E6t2G34FsAJ4qlruIPlrp3yRFZ1mosmLKssOtf8GopFPv6
 pdM5KNdg6uqkpzJC2OCiQs93p2MdVtM1C1AsH2TngC8tV9OjZ7anbkGl2iE3fhCSU9mvhX
 K1VxnfPudBQRQJ1Q1ovU0oM49Yj5Rmo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1767894008;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pbYulziCehk0+dq0CXHXUlJblsepps/x0pBz736+F88=;
 b=iQxzzizVuPHl0WVwxtpKrivs8r+dbY1HBg67emHdQ+8PTu3CciNeemY/i1L/NaN8QOR0LX
 w4waIzEE2aIOLGCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5CF653EA65;
 Thu,  8 Jan 2026 17:40:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id TDitFvjrX2kXBAAAD6G6ig
 (envelope-from <jack@suse.cz>); Thu, 08 Jan 2026 17:40:08 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 0782CA0B23; Thu,  8 Jan 2026 18:40:08 +0100 (CET)
Date: Thu, 8 Jan 2026 18:40:07 +0100
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <m3mywef74xhcakianlrovrnaadnhzhfqjfusulkcnyioforfml@j2xnk7dzkmv4>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 08-01-26 12:12:55, Jeff Layton wrote: > Yesterday,
 I sent patches to fix how directory delegation support is > handled on
 filesystems
 where the should be disabled [1]. That set is > appropriate [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: suse.cz]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [195.135.223.131 listed in list.dnswl.org]
X-Headers-End: 1vdtzp-0000Js-WC
Subject: Re: [f2fs-dev] [PATCH 00/24] vfs: require filesystems to explicitly
 opt-in to lease support
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

On Thu 08-01-26 12:12:55, Jeff Layton wrote:
> Yesterday, I sent patches to fix how directory delegation support is
> handled on filesystems where the should be disabled [1]. That set is
> appropriate for v6.19. For v7.0, I want to make lease support be more
> opt-in, rather than opt-out:
> 
> For historical reasons, when ->setlease() file_operation is set to NULL,
> the default is to use the kernel-internal lease implementation. This
> means that if you want to disable them, you need to explicitly set the
> ->setlease() file_operation to simple_nosetlease() or the equivalent.
> 
> This has caused a number of problems over the years as some filesystems
> have inadvertantly allowed leases to be acquired simply by having left
> it set to NULL. It would be better if filesystems had to opt-in to lease
> support, particularly with the advent of directory delegations.
> 
> This series has sets the ->setlease() operation in a pile of existing
> local filesystems to generic_setlease() and then changes
> kernel_setlease() to return -EINVAL when the setlease() operation is not
> set.
> 
> With this change, new filesystems will need to explicitly set the
> ->setlease() operations in order to provide lease and delegation
> support.
> 
> I mainly focused on filesystems that are NFS exportable, since NFS and
> SMB are the main users of file leases, and they tend to end up exporting
> the same filesystem types. Let me know if I've missed any.

So, what about kernfs and fuse? They seem to be exportable and don't have
.setlease set...

								Honza

> 
> [1]: https://lore.kernel.org/linux-fsdevel/20260107-setlease-6-19-v1-0-85f034abcc57@kernel.org/
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
> Jeff Layton (24):
>       fs: add setlease to generic_ro_fops and read-only filesystem directory operations
>       affs: add setlease file operation
>       btrfs: add setlease file operation
>       erofs: add setlease file operation
>       ext2: add setlease file operation
>       ext4: add setlease file operation
>       exfat: add setlease file operation
>       f2fs: add setlease file operation
>       fat: add setlease file operation
>       gfs2: add a setlease file operation
>       jffs2: add setlease file operation
>       jfs: add setlease file operation
>       nilfs2: add setlease file operation
>       ntfs3: add setlease file operation
>       ocfs2: add setlease file operation
>       orangefs: add setlease file operation
>       overlayfs: add setlease file operation
>       squashfs: add setlease file operation
>       tmpfs: add setlease file operation
>       udf: add setlease file operation
>       ufs: add setlease file operation
>       xfs: add setlease file operation
>       filelock: default to returning -EINVAL when ->setlease operation is NULL
>       fs: remove simple_nosetlease()
> 
>  Documentation/filesystems/porting.rst |  9 +++++++++
>  Documentation/filesystems/vfs.rst     |  9 ++++++---
>  fs/9p/vfs_dir.c                       |  2 --
>  fs/9p/vfs_file.c                      |  2 --
>  fs/affs/dir.c                         |  2 ++
>  fs/affs/file.c                        |  2 ++
>  fs/befs/linuxvfs.c                    |  2 ++
>  fs/btrfs/file.c                       |  2 ++
>  fs/btrfs/inode.c                      |  2 ++
>  fs/ceph/dir.c                         |  2 --
>  fs/ceph/file.c                        |  1 -
>  fs/cramfs/inode.c                     |  2 ++
>  fs/efs/dir.c                          |  2 ++
>  fs/erofs/data.c                       |  2 ++
>  fs/erofs/dir.c                        |  2 ++
>  fs/exfat/dir.c                        |  2 ++
>  fs/exfat/file.c                       |  2 ++
>  fs/ext2/dir.c                         |  2 ++
>  fs/ext2/file.c                        |  2 ++
>  fs/ext4/dir.c                         |  2 ++
>  fs/ext4/file.c                        |  2 ++
>  fs/f2fs/dir.c                         |  2 ++
>  fs/f2fs/file.c                        |  2 ++
>  fs/fat/dir.c                          |  2 ++
>  fs/fat/file.c                         |  2 ++
>  fs/freevxfs/vxfs_lookup.c             |  2 ++
>  fs/fuse/dir.c                         |  1 -
>  fs/gfs2/file.c                        |  3 +--
>  fs/isofs/dir.c                        |  2 ++
>  fs/jffs2/dir.c                        |  2 ++
>  fs/jffs2/file.c                       |  2 ++
>  fs/jfs/file.c                         |  2 ++
>  fs/jfs/namei.c                        |  2 ++
>  fs/libfs.c                            | 20 ++------------------
>  fs/locks.c                            |  3 +--
>  fs/nfs/dir.c                          |  1 -
>  fs/nfs/file.c                         |  1 -
>  fs/nilfs2/dir.c                       |  3 ++-
>  fs/nilfs2/file.c                      |  2 ++
>  fs/ntfs3/dir.c                        |  3 +++
>  fs/ntfs3/file.c                       |  3 +++
>  fs/ocfs2/file.c                       |  5 +++++
>  fs/orangefs/dir.c                     |  4 +++-
>  fs/orangefs/file.c                    |  1 +
>  fs/overlayfs/file.c                   |  2 ++
>  fs/overlayfs/readdir.c                |  2 ++
>  fs/qnx4/dir.c                         |  2 ++
>  fs/qnx6/dir.c                         |  2 ++
>  fs/read_write.c                       |  2 ++
>  fs/smb/client/cifsfs.c                |  1 -
>  fs/squashfs/dir.c                     |  2 ++
>  fs/squashfs/file.c                    |  4 +++-
>  fs/udf/dir.c                          |  2 ++
>  fs/udf/file.c                         |  2 ++
>  fs/ufs/dir.c                          |  2 ++
>  fs/ufs/file.c                         |  2 ++
>  fs/vboxsf/dir.c                       |  1 -
>  fs/vboxsf/file.c                      |  1 -
>  fs/xfs/xfs_file.c                     |  3 +++
>  include/linux/fs.h                    |  1 -
>  mm/shmem.c                            |  2 ++
>  61 files changed, 116 insertions(+), 42 deletions(-)
> ---
> base-commit: 731ce71a6c8adb8b8f873643beacaeedc1564500
> change-id: 20260107-setlease-6-20-299eb5695c5a
> 
> Best regards,
> -- 
> Jeff Layton <jlayton@kernel.org>
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
