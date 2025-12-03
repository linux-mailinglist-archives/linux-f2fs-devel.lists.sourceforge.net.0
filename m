Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C73F2C9EAED
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 03 Dec 2025 11:19:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfTj7ZOYwmrTk9YyOQf1lF9phU9sPypB50nCa5wZPVg=; b=c3R+JF7jBp28ZUOP/ut1LmJZ01
	WOmv7jjZTIi+WhhzfcD2Zf4e01D2cClXzAFCAmZCXY6s30EhbGMrxT/3ZgnJxlMWUpULl71ysgrPa
	7GkOREO39TngK6YKDC+Xllsc9YtiPC3Xnh1075KTui6BSeIfbVsO+TkH1nWE04KEmBOg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQjxE-0007MA-Ac;
	Wed, 03 Dec 2025 10:19:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1vQjxC-0007Lr-Nd;
 Wed, 03 Dec 2025 10:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i9QD6HVcKhaudvgQUmcrPWxae5Gbkj5XejxdA7YCuNM=; b=cCZbuoHS5ulvqGx1Wvi7SYaW+M
 Oow0KlCPU9aBLbgywucqhMZzjISJDgnQJImfzNUZdSZypN2YfALTp+bLoLm9AmfUa44ScVvJH96Zm
 aSFMfSs8I08k6gvj+eJALzOIRV3x2bz7DT8C3rmieGtNcUhGq7vwRfxuXdvC4GATYjHg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i9QD6HVcKhaudvgQUmcrPWxae5Gbkj5XejxdA7YCuNM=; b=QjBxLzJNMvsN+pcyFhmOFIe4X1
 5CUbR/J4AmukP9732cJZ8dGx6+tFO0LLCtdto9cHc9o38w3nNUg5n5hjGTGA6qnQxd0fVrBZWIUtN
 smPyXOzGSU3elk4zYZpbUCEDMx7y7wOG17Ewp2bC8E8xj1OkcWUaZLva+Dmy3+d9+XNo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQjxC-0000V4-16; Wed, 03 Dec 2025 10:19:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BE02C40235;
 Wed,  3 Dec 2025 10:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25361C113D0;
 Wed,  3 Dec 2025 10:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764757150;
 bh=1ALGFmGlgOHY6f+bdLdgKebsX+au1yQ5dTRhimTaFoA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Sia1MYILwN3OHyU8vJVbFzEbPmh+E9Rkdc13NmENJiNAQwujMzrx7aLJDYQwnRJH2
 icv0Cs7+2DiJlUtJrJ3jFjsxz5e5SC+H4b4cDPm/4/s+aTZepyO4AvrHMcRjPs8po7
 P0lAluHlqilBXk1Sh/B/XN0TZMdipTL7EolZ0FehsZ8XGO0/aidHMHK8ayQiiiT5TA
 U6OOgYna9Ec2DgYD68Hcv9/StfMLZVIApf1YAZumWdYivMJy+S1b4NF19fKc5R60wD
 vv/cJLS0nI7ttPeXB8OyKOFM1iSYjxfn/4avfs6o2Xu7czGUpIFQziUIbMv79dw+WM
 YExRE41C2xh0g==
To: Jeff Layton <jlayton@kernel.org>
Date: Wed,  3 Dec 2025 11:18:32 +0100
Message-ID: <20251203-sechzehn-lethargisch-cd739d4ff49a@brauner>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251201-create-excl-v3-1-8933a444b046@kernel.org>
References: <20251201-create-excl-v3-1-8933a444b046@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370; i=brauner@kernel.org;
 h=from:subject:message-id; bh=1ALGFmGlgOHY6f+bdLdgKebsX+au1yQ5dTRhimTaFoA=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQa8NXdfyOWEe7C1j7j3H39MtmOfckhfYU3uPbO3GJ5W
 X9idSdfRykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwER6JjEyXElxiNLjXsTcG/zF
 veHQZtE3X3LuXMnZx/2vIaPja/5RBYb/9Vo7JnHefOS2MX2Dr5zm5id7fnmJz3GXVk7n4Wu5Kpf
 KBAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 01 Dec 2025 08:11:42 -0500, Jeff Layton wrote: > With
 three exceptions, ->create() methods provided by filesystems ignore > the
 "excl" flag. Those exception are NFS, GFS2 and vboxsf which all [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQjxC-0000V4-16
Subject: Re: [f2fs-dev] [PATCH RESEND v3] vfs: remove the excl argument from
 the ->create() inode_operation
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
From: Christian Brauner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: Latchesar Ionkov <lucho@ionkov.net>, Paulo Alcantara <pc@manguebit.org>,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 Tyler Hicks <code@tyhicks.com>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, Jan Harkes <jaharkes@cs.cmu.edu>,
 linux-um@lists.infradead.org, Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Hildenbrand <david@kernel.org>, Eric Van Hensbergen <ericvh@kernel.org>,
 David Howells <dhowells@redhat.com>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
 linux-doc@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Hugh Dickins <hughd@google.com>,
 codalist@coda.cs.cmu.edu, Namjae Jeon <linkinjeon@kernel.org>,
 ecryptfs@vger.kernel.org, Yangtao Li <frank.li@vivo.com>,
 ocfs2-devel@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Theodore Ts'o <tytso@mit.edu>,
 Muchun Song <muchun.song@linux.dev>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Anna Schumaker <anna@kernel.org>,
 linux-efi@vger.kernel.org, Martin Brandenburg <martin@omnibond.com>,
 Kees Cook <kees@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Carlos Maiolino <cem@kernel.org>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, Miklos Szeredi <miklos@szeredi.hu>,
 NeilBrown <neilb@ownmail.net>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, coda@cs.cmu.edu,
 Viacheslav Dubeyko <slava@dubeyko.com>, NeilBrown <neil@brown.name>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, ceph-devel@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-nfs@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 samba-technical@lists.samba.org, Steve French <sfrench@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, ntfs3@lists.linux.dev,
 Hans de Goede <hansg@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Bob Copeland <me@bobcopeland.com>, gfs2@lists.linux.dev, linux-mm@kvack.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Ard Biesheuvel <ardb@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Tom Talpey <tom@talpey.com>,
 Bharath SM <bharathsm@microsoft.com>,
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

On Mon, 01 Dec 2025 08:11:42 -0500, Jeff Layton wrote:
> With three exceptions, ->create() methods provided by filesystems ignore
> the "excl" flag.  Those exception are NFS, GFS2 and vboxsf which all also
> provide ->atomic_open.
> 
> Since ce8644fcadc5 ("lookup_open(): expand the call of vfs_create()"),
> the "excl" argument to the ->create() inode_operation is always set to
> true in vfs_create(). The ->create() call in lookup_open() sets it
> according to the O_EXCL open flag, but is never called if the filesystem
> provides ->atomic_open().
> 
> [...]

Applied to the vfs-6.20.mkdir branch of the vfs/vfs.git tree.
Patches in the vfs-6.20.mkdir branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-6.20.mkdir

[1/1] vfs: remove the excl argument from the ->create() inode_operation
      https://git.kernel.org/vfs/vfs/c/7d91315b4335


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
