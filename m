Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D666DC42859
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 08 Nov 2025 07:32:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gj5cYumCssdzCrlJIiHE6ooQtVEBuwMWuG+RtLL+eQ=; b=LmPi/TCXYtJP8p5R684bY8FTji
	5hJ7BpX47mbGCxmEAF2FFh1r2FjEAfUHFfBaidHnjk+pjEvoRjrfraK/F9u5imwv2hM1QydLmXudM
	sJNU6oiU41bP8XMXDdNJWd7pfrZfjUWrAYMLPfpblo5HO1ze4tTed0ZhmuunAcwgw4zM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vHcUQ-0003cw-3K;
	Sat, 08 Nov 2025 06:31:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <asmadeus@codewreck.org>) id 1vHcUL-0003cd-JH;
 Sat, 08 Nov 2025 06:31:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LTM5LkyL3mfB0IbHJeS1oRharyj4iNDNdaZ7y5irjmg=; b=DnzaufUhsKuCnw/Let6ku7+kn2
 1YV/u+276LisnmCAqrsiamrACo3fUOhztJB4q0Z2hBF4wlwpQuI/3GIORmxXjp9oE3k5pSsIn8Xz2
 Q99YL/atqvcqnRUFuoil7jcdIp4hzb1KfqDxp+si3yfm0uAHWNHJv04yQHwYUBOUFPeQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LTM5LkyL3mfB0IbHJeS1oRharyj4iNDNdaZ7y5irjmg=; b=m5P1eTyUCVTW52/h9QvF1r5B/k
 +wp1LbEPRHTfPfVw54gU6MUev6Wwf0LZxe/kSN3cgrsSoKPxDhNbe1Z0nj8XJ4aXFgv5HwJk71QXf
 5Z7ms2KS5KihuHzWLZwvE4YSK1gLnGFX1U7tehuxmH+woIzg1n1v0erGi3gyWwGlE27Y=;
Received: from submarine.notk.org ([62.210.214.84])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1vHcUJ-0001QA-Tt; Sat, 08 Nov 2025 06:31:53 +0000
Received: from gaia.codewreck.org (localhost [127.0.0.1])
 by submarine.notk.org (Postfix) with ESMTPS id A419014C2D3;
 Sat,  8 Nov 2025 07:12:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
 s=2; t=1762582373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LTM5LkyL3mfB0IbHJeS1oRharyj4iNDNdaZ7y5irjmg=;
 b=B+D3byKtJ5aLyRiu2rooP0B2TJlyh9NnWKaBHKY3oGl5WrI9R/ZTOokRqfrmQkRjA4d6PF
 hVA+2jtaIxDHKJVm19YOlIu00RJFzbMjiJ2IJMY5v8SjTtfCjEZWBxEPfRtzuPasj++KiY
 8Sahe5eVbfmwmhQeo5uzL3Rp7AKK7Nzr7m3ipU5qmaiTEStLej1x9iBcfVqKnY9WidAi8X
 rwVB6qqUGBZMEcUSkoPWBbqf240gmgWcLbAb7B4RNHuho0O1rPy72OuweBfiXGGrgaJqO1
 amO1aDXHVrMyRWIApKs7c+o9NFvUODZZvMkcXugNCGdZ2S65dzPgh2BACKmoHA==
Received: from localhost (gaia.codewreck.org [local])
 by gaia.codewreck.org (OpenSMTPD) with ESMTPA id 26a2c8b4;
 Sat, 8 Nov 2025 06:12:25 +0000 (UTC)
Date: Sat, 8 Nov 2025 15:12:10 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <aQ7fOmknHIxcxuha@codewreck.org>
References: <20251107-create-excl-v2-1-f678165d7f3f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251107-create-excl-v2-1-f678165d7f3f@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Jeff Layton wrote on Fri, Nov 07, 2025 at 10:05:03AM -0500:
 > With two exceptions, ->create() methods provided by filesystems ignore
 > the "excl" flag. Those exception are NFS and GFS2 which both also [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1vHcUJ-0001QA-Tt
Subject: Re: [f2fs-dev] [PATCH v2] vfs: remove the excl argument from the
 ->create() inode_operation
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Paulo Alcantara <pc@manguebit.org>,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 Tyler Hicks <code@tyhicks.com>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, Jan Harkes <jaharkes@cs.cmu.edu>,
 linux-um@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
 David Hildenbrand <david@redhat.com>, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Hugh Dickins <hughd@google.com>,
 codalist@coda.cs.cmu.edu, Namjae Jeon <linkinjeon@kernel.org>,
 Yangtao Li <frank.li@vivo.com>, ocfs2-devel@lists.linux.dev,
 Jaegeuk Kim <jaegeuk@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Theodore Ts'o <tytso@mit.edu>, Miklos Szeredi <miklos@szeredi.hu>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, gfs2@lists.linux.dev,
 Anna Schumaker <anna@kernel.org>, linux-efi@vger.kernel.org,
 Martin Brandenburg <martin@omnibond.com>, Kees Cook <kees@kernel.org>,
 Yuezhang Mo <yuezhang.mo@sony.com>, Carlos Maiolino <cem@kernel.org>,
 Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org,
 linux-hardening@vger.kernel.org, Marc Dionne <marc.dionne@auristor.com>,
 linux-afs@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 NeilBrown <neilb@ownmail.net>, linux-doc@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, coda@cs.cmu.edu,
 Viacheslav Dubeyko <slava@dubeyko.com>, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, ceph-devel@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, David Howells <dhowells@redhat.com>,
 linux-nfs@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 samba-technical@lists.samba.org, Steve French <sfrench@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, ntfs3@lists.linux.dev,
 Hans de Goede <hansg@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Muchun Song <muchun.song@linux.dev>, Jan Kara <jack@suse.cz>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Bob Copeland <me@bobcopeland.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-mm@kvack.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Ard Biesheuvel <ardb@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, ecryptfs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, v9fs@lists.linux.dev,
 linux-unionfs@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>,
 Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jeff Layton wrote on Fri, Nov 07, 2025 at 10:05:03AM -0500:
> With two exceptions, ->create() methods provided by filesystems ignore
> the "excl" flag.  Those exception are NFS and GFS2 which both also
> provide ->atomic_open.
> 
> Since ce8644fcadc5 ("lookup_open(): expand the call of vfs_create()"),
> the "excl" argument to the ->create() inode_operation is always set to
> true in vfs_create(). The ->create() call in lookup_open() sets it
> according to the O_EXCL open flag, but is never called if the filesystem
> provides ->atomic_open().
> 
> The excl flag is therefore always either ignored or true.  Remove it,
> and change NFS and GFS2 to act as if it were always true.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Good cleanup, just one whitespace nitpick below but:
Reviewed-by: Dominique Martinet <asmadeus@codewreck.org>


> diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
> index 4f13b01e42eb5e2ad9d60cbbce7e47d09ad831e6..7a55e491e0c87a0d18909bd181754d6d68318059 100644
> --- a/Documentation/filesystems/vfs.rst
> +++ b/Documentation/filesystems/vfs.rst
> @@ -505,7 +505,10 @@ otherwise noted.
>  	if you want to support regular files.  The dentry you get should
>  	not have an inode (i.e. it should be a negative dentry).  Here
>  	you will probably call d_instantiate() with the dentry and the
> -	newly created inode
> +        newly created inode. This operation should always provide O_EXCL

This and the block below change halfway from tab (old text) to spaces
(your patch)

Looks like the file has a few space-indented sections though so it won't
be the first if that goes in as is, the html-rendering doesn't seem to
care :)

Cheers,
-- 
Dominique Martinet | Asmadeus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
