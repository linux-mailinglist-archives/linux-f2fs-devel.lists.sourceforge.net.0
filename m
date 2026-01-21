Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFuvDdqZcGlyYgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jan 2026 10:18:18 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 811B4543A2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jan 2026 10:18:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVpmUgeh/YUkTcLUIK3D9exPAYt596E/okR67bZclic=; b=FIxSCfH7n6A1jSM5fCeVGoym9o
	rvJ68Lzrx8p7xLkPq4YD+sHlM63YvRidjnGkagB9PumB5qEKkL1a8pwDxjHmL8x8f1AEs1Bfho85x
	1k7rdDeSRDMk0ogM2JPB7FBCNdKDSsvSTuD/va8xdIGv35D/CFtLuGk+FYQikSElJTIs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1viULn-0004WB-R8;
	Wed, 21 Jan 2026 09:18:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+bcc91a9d4ebb8e7eb2a7+8186+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1viULl-0004Vs-6u; Wed, 21 Jan 2026 09:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QMRVjotEayLOv8XTxaxuE0M55enKBYtQeaeNcrACLfc=; b=RU5+x7Eq+qonfcNI8KKf6nbQqZ
 M2WpminueeAke/Hv26tGbhd09I14E6wi9cw77mS5znWUhS525dMxWufJ9Dfxq2DJKrpVSTv627iFB
 KEd4BooX44o/enkH8NL0bvMBjtJH0JvGnmXMsXIoGweZICTaxxpnEB6++dQVYdqez16U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QMRVjotEayLOv8XTxaxuE0M55enKBYtQeaeNcrACLfc=; b=Y0t3Kz3K9LiYodlhXegfXw/+Pe
 fTXToTeBDoWl5JfujRet7qs+LX5A2Fx617gP4l2aYbHH7Fsq0oqjZZs0Te29P39h0MdOK9GNhIeYd
 5R6jFEhrb+ab5UPJVzHU4d3CU1FcTN8lM6Tl6NpMrC3M+Rpg2k3GN2hoCKnj2Cn4C46c=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1viULk-0006pi-EN; Wed, 21 Jan 2026 09:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=QMRVjotEayLOv8XTxaxuE0M55enKBYtQeaeNcrACLfc=; b=dL4371OFHyaeDBmxzj7GOgrMx3
 3K3xbidZALqODJsAS8whqERF7Cf9V7Fo7hOwrsqaJ52l4+3LZ3NOo6ToaJTvHKZRqcoXdeIkI5i2Y
 /IGCwCDyqZvkKB3vxuq/jXLgMBASekbT7z2m5uG7UV6Z1vT7LxO5FNkuYsqXQ65ggC8pblORDhMxn
 g88h/3uSdhW32hsFMLKV41gZ2EzUh0QwXmfBFzhtXFBCIM8iZiBvymXdqRapwUqUsREyNCfkJfKnN
 emlY1xCH7+a+KdQVe/KemipvA79Ca3KD2ZAnJ6dAOXDUOz1nqP1FfvsKk+szaZfJ4qnOmyQQriS0o
 bmhS62CA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1viUKw-00000005AiH-18Yv;
 Wed, 21 Jan 2026 09:17:14 +0000
Date: Wed, 21 Jan 2026 01:17:14 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <aXCZmmBRSJR3ftHn@infradead.org>
References: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org>
 <20260119-exportfs-nfsd-v2-2-d93368f903bd@kernel.org>
 <aW8ztQ-RbhxwzMk7@infradead.org>
 <56fr33ju43h6zzp6jrzrkyfag6r3jz6wpnk45oe5byy6fqyvti@d43hgikfuk7t>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56fr33ju43h6zzp6jrzrkyfag6r3jz6wpnk45oe5byy6fqyvti@d43hgikfuk7t>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 20, 2026 at 09:40:07AM +0100, Jan Kara wrote:
 > (with explanations before I couldn't quite see the difference between shmem
 > and kernfs). I'd note that fat or shmem (which are both export [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1viULk-0006pi-EN
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
 jfs-discussion@lists.sourceforge.net, Paulo Alcantara <pc@manguebit.org>,
 Alex Markuze <amarkuze@redhat.com>, Sandeep Dhavale <dhavale@google.com>,
 linux-btrfs@vger.kernel.org, Carlos Maiolino <cem@kernel.org>,
 Amir Goldstein <amir73il@gmail.com>, Dave Chinner <david@fromorbit.com>,
 linux-unionfs@vger.kernel.org,
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
 Christoph Hellwig <hch@infradead.org>, Viacheslav Dubeyko <slava@dubeyko.com>,
 steve@digidescorp.com, NeilBrown <neil@brown.name>,
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
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[78];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[omnibond.com,lists.sourceforge.net,manguebit.org,redhat.com,google.com,vger.kernel.org,kernel.org,gmail.com,fromorbit.com,paragon-software.com,fb.com,dilger.ca,vivo.com,lists.infradead.org,szeredi.hu,lists.samba.org,nod.at,fasheh.com,oracle.com,infradead.org,dubeyko.com,digidescorp.com,brown.name,kvack.org,lists.orangefs.org,microsoft.com,talpey.com,lists.linux.dev,suse.com,zeniv.linux.org.uk,linux.alibaba.com,mail.parknet.co.jp,mit.edu,lists.ozlabs.org,lwn.net,samba.org,huawei.com,squashfs.org.uk,linux-foundation.org,evilplan.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 811B4543A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 09:40:07AM +0100, Jan Kara wrote:
> (with explanations before I couldn't quite see the difference between shmem
> and kernfs). I'd note that fat or shmem (which are both exportable)
> satisfy this only with reasonably high probability as they use
> get_random_u32() for initializing their i_generation but I guess it's as
> good as it gets for them.

For tmpfs random generations are as good as it gets, in fact that's what
XFS starts with when allocating new inode clusters (which could have
previous been used for for inodes as well).

fat on the other hand looks broken, as it also set a new generation when
reading inodes from disk.  So I don't think fat should be nfs exportable,
even if the export ops predate other uses.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
