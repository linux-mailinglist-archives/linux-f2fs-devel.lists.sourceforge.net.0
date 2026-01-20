Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C86D3C0E2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 08:50:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqvcJrCjs/Edw0P/Ah+unt5nqBmbiNhQh4S7z9rXyVs=; b=IcPuNYhWKGyiUO6Sst9GvNupcK
	9tBGMKi4cu1WlWlkn9T9ZlVHk/FnMwGm+k4eF0jMB4fAKFRg3ncrhTTfpMXWFI8xwtnH3DUeT5Pbi
	FcDPybiTd5/VeyxD5q4ZgzYqE4Go3V1P3L/GlX8tjv3FYOcsVK8GPb9EYReurtT56jtM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vi6Vk-0004mX-04;
	Tue, 20 Jan 2026 07:50:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+6f87a82fb8d0462b7f15+8185+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vi6Vi-0004m8-Cp; Tue, 20 Jan 2026 07:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=haSfZvoEvPhBBZDnUW3y3BhJEQ36mgFSvpNiOqhvJvI=; b=ObgatRlM7g4dVSrX98nCzoJ14y
 Xf8FT+WgLFg+pLAagIFB5MjcOptcr+Kv5AaDuHD21vtWYbe7tT00nMpLW+SUojRG6NKyWb+lLoRi9
 yThnN6rvN3rIzAfbnuIuzvnlJxqrkUG3iZl5wLITURy2NnpbvQgzU2PrfcZJ0P5Xz1Rw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=haSfZvoEvPhBBZDnUW3y3BhJEQ36mgFSvpNiOqhvJvI=; b=PVkifm+jEKp7mPKmdJMjBzW5TW
 9+tA5iD+ZG8sbD5jVnOxfFByFJZTMgVWg6sBxiUFTADObYqVYbMGrD5O4hdlAOuNlI2GN3KnHEkm4
 ISBX9uh7RULsG3OrfekP4bTePETUfjKU+vXj5Pz3+cp7B9i4jppwKByOS9JuwgA6VbHo=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vi6Vi-0000Qb-Q9; Tue, 20 Jan 2026 07:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=haSfZvoEvPhBBZDnUW3y3BhJEQ36mgFSvpNiOqhvJvI=; b=N18Lfx2l0cTzfa3HEHbSStwRPv
 iyXHar7+IL8UusFL6sjIudxhuirPKAhJMeBNA+7JTaSgRPwHzsN72C9/ED13gd4R3bzZoK6cN15el
 2OOL3ox9rvwKCy+jqAl20MM1KOQeI06m0Nqc7qZlyinWokSDH6OADy7uwk70GRUXw1dKPRbjqr1Mx
 G0x+S1U8gEmAS0uHHMxQqMK+KDGwlJXyI4/nRqaD3y/MPBEQbIe1RJKnMGnpCsJCrYQkezP6l13YD
 Bk/y5So46wc2umpZT0PCIQ7tT9Ms4VQ/Y3zVPPZ8bLDLhE9SURfv9f85/RpFqttM9TA+n04nUeD09
 UJSC4XRw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vi6VB-00000003NIK-3jXc;
 Tue, 20 Jan 2026 07:50:15 +0000
Date: Mon, 19 Jan 2026 23:50:13 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <aW8ztQ-RbhxwzMk7@infradead.org>
References: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org>
 <20260119-exportfs-nfsd-v2-2-d93368f903bd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260119-exportfs-nfsd-v2-2-d93368f903bd@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 19, 2026 at 11:26:19AM -0500, Jeff Layton wrote:
 > + EXPORT_OP_STABLE_HANDLES - This filesystem provides filehandles that
 are > + stable across the lifetime of a file. This is a hard requi [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1vi6Vi-0000Qb-Q9
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
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 linux-doc@vger.kernel.org, Hugh Dickins <hughd@google.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
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
 Jonathan Corbet <corbet@lwn.net>, samba-technical@lists.samba.org,
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

On Mon, Jan 19, 2026 at 11:26:19AM -0500, Jeff Layton wrote:
> +  EXPORT_OP_STABLE_HANDLES - This filesystem provides filehandles that are
> +    stable across the lifetime of a file. This is a hard requirement for export
> +    via nfsd. Any filesystem that is eligible to be exported via nfsd must
> +    indicate this guarantee by setting this flag. Most disk-based filesystems
> +    can do this naturally. Pseudofilesystems that are for local reporting and
> +    control (e.g. kernfs, pidfs, nsfs) usually can't support this.

Suggested rewording, taking some of the ideas from Dave Chinners earlier
comments into account:

  EXPORT_OP_STABLE_HANDLES - This filesystem provides filehandles that are
    stable across the lifetime of a file.  A file in this context is an
    instantiated inode reachable by one or more file names, or still open after
    the last name has been unlinked.  Reuses of the same on-disk inode structure
    are considered new files and must provide different file handles from the
    previous incarnation.  Most file systems designed to store user data
    naturally provide this capability.  Pseudofilesystems that are for local
    reporting and control (e.g. kernfs, pidfs, nsfs) usually can't support this.

    This flags is a hard requirement for export via nfsd. Any filesystem that
    is eligible to be exported via nfsd must indicate this guarantee by
    setting this flag.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
