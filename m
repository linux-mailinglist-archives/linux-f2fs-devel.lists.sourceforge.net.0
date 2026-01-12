Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AF0D11A46
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 10:56:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QAbiuIcrWcVLDz5TF41EnZSC/BlGbJ929iu7uZ+Ac4=; b=IuAD4t/LLRLaSy7c5hSl6NHNiA
	sA9hHncGLiJs4P4D+MkQeVElBCMDTOFX/HvW5HlF8vEnrmuMHo61e7TfoRn7T2vrWFT00A246IzJd
	IFlzuFEX+AikBaA5u2xtESS//8YUeUIk8HRuncIIEHafJCKz7UEtEXLCF+0izG9Yjl6g=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfEfN-0002EW-HJ;
	Mon, 12 Jan 2026 09:56:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1vfEfL-0002EE-SB;
 Mon, 12 Jan 2026 09:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KQ0wZqwdWPtiS8p4pbW8LzccPPAucI4yXbRXcC3iXZI=; b=UFyhUIGQgWuuvFmw1ukiZbycOA
 jTZFUYq7s5OtUyC3zMfBc9mf5YNh9Jv7ugnC91db3JXopPzguHnFFUtvxZeWtSy3eHCIZtbEk5Xh+
 qOWoq+AgoCslef5/72rDMe/YWA1oBhN6TW8ghol+DzDhLbNfkRj6TUCq2eRzKOZ5AwYE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KQ0wZqwdWPtiS8p4pbW8LzccPPAucI4yXbRXcC3iXZI=; b=QNAgj57uwwsfYyR9PQ8Gw6WC4B
 XCvFzt/ekfiSpUpPGcIknIYHgqNvBxw9ST6IZP7Rx05KmlIhTaA4xi3PRfKYylOe0DKdpXD1Y8m7U
 C9C6dChJ1EhyXDWqP02mMucQ9rf0Hrk/ivmjegZC/axqphqh+IVnsImE9F+Jann+PPEo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfEfL-0002CI-9J; Mon, 12 Jan 2026 09:56:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5D58160179;
 Mon, 12 Jan 2026 09:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E7DC116D0;
 Mon, 12 Jan 2026 09:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768211800;
 bh=7FithyIBKaoedpqmHqroS7296muzq9qFftbtMNAIURw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gEU9mwaIMduY/7UbDRfY3dCfNhfrteaHYYuLXyRnnRx/QJgC20lljrEWUMS7U6O0R
 FC4KxbfeMIzSr1rRikavC/N+gC8ZfUxStYxTRJJhtfOpS2cGLgj7zxDin23MW6Wb7P
 1GOMC1no3G/npgBBoc6dk10UcMEW7fSBM4p03vkd1kqbUw8Lw6VvU4ZPPkKi6WPwPs
 cFsx7BjBlanMei3Mx7O56x77krT1lDMI8Q5IBx6rppzFEkL7VX/wsOGT2lTjE9XE60
 DtV+U34LS4bSOB3RmY3uhoDoP3WLijr7CMYxfWHp68KquGlaW4jVxNHX1fQyEK5DDo
 mEN7+/Mr4XdZg==
To: Jeff Layton <jlayton@kernel.org>
Date: Mon, 12 Jan 2026 10:56:12 +0100
Message-ID: <20260112-wolldecke-fernhalten-1ed186b0d6d4@brauner>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3741; i=brauner@kernel.org;
 h=from:subject:message-id; bh=7FithyIBKaoedpqmHqroS7296muzq9qFftbtMNAIURw=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSmHHURP88sMJN9ukDhRhXbqQequdlWvjZyfBfLe1DV5
 5jhhU9qHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABcxZfifcM15deTeLVM3FDGZ
 slyxOp2V1fLaePb0rF9Nh78+em/0gOF/0ZzNd4vlgpU/arScCRCctkFYad0Mv4pHyyuf8rps+VT
 FBQA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 08 Jan 2026 12:12:55 -0500,
 Jeff Layton wrote: > Yesterday, 
 I sent patches to fix how directory delegation support is > handled on
 filesystems
 where the should be disabled [1]. That set is > a [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vfEfL-0002CI-9J
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
From: Christian Brauner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Christian Brauner <brauner@kernel.org>
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

On Thu, 08 Jan 2026 12:12:55 -0500, Jeff Layton wrote:
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
> [...]

Applied to the vfs-7.0.leases branch of the vfs/vfs.git tree.
Patches in the vfs-7.0.leases branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-7.0.leases

[01/24] fs: add setlease to generic_ro_fops and read-only filesystem directory operations
        https://git.kernel.org/vfs/vfs/c/ca4388bf1d9e
[02/24] affs: add setlease file operation
        https://git.kernel.org/vfs/vfs/c/663cdef61a27
[03/24] btrfs: add setlease file operation
        https://git.kernel.org/vfs/vfs/c/f9688474e413
[04/24] erofs: add setlease file operation
        https://git.kernel.org/vfs/vfs/c/f8902d3df893
[05/24] ext2: add setlease file operation
        https://git.kernel.org/vfs/vfs/c/ccdc2e0569f5
[06/24] ext4: add setlease file operation
        https://git.kernel.org/vfs/vfs/c/20747a2a29c6
[07/24] exfat: add setlease file operation
        https://git.kernel.org/vfs/vfs/c/b8ca02667552
[08/24] f2fs: add setlease file operation
        https://git.kernel.org/vfs/vfs/c/9e2ac6ddb397
[09/24] fat: add setlease file operation
        https://git.kernel.org/vfs/vfs/c/a9acc8422ffb
[10/24] gfs2: add a setlease file operation
        https://git.kernel.org/vfs/vfs/c/3b514c333390
[11/24] jffs2: add setlease file operation
        https://git.kernel.org/vfs/vfs/c/c275e6e7c085
[12/24] jfs: add setlease file operation
        https://git.kernel.org/vfs/vfs/c/7dd596bb35e5
[13/24] nilfs2: add setlease file operation
        https://git.kernel.org/vfs/vfs/c/f46bb13dc5d9
[14/24] ntfs3: add setlease file operation
        https://git.kernel.org/vfs/vfs/c/6aaa1d6337b5
[15/24] ocfs2: add setlease file operation
        https://git.kernel.org/vfs/vfs/c/f15d3150279d
[16/24] orangefs: add setlease file operation
        https://git.kernel.org/vfs/vfs/c/136b43aa4b16
[17/24] overlayfs: add setlease file operation
        https://git.kernel.org/vfs/vfs/c/94a3f60af5dc
[18/24] squashfs: add setlease file operation
        https://git.kernel.org/vfs/vfs/c/dfd8676efe43
[19/24] tmpfs: add setlease file operation
        https://git.kernel.org/vfs/vfs/c/f5a3446be277
[20/24] udf: add setlease file operation
        https://git.kernel.org/vfs/vfs/c/dbe8d57d1483
[21/24] ufs: add setlease file operation
        https://git.kernel.org/vfs/vfs/c/545b4144d804
[22/24] xfs: add setlease file operation
        https://git.kernel.org/vfs/vfs/c/6163b5da2f5e
[23/24] filelock: default to returning -EINVAL when ->setlease operation is NULL
        https://git.kernel.org/vfs/vfs/c/2b10994be716
[24/24] fs: remove simple_nosetlease()
        https://git.kernel.org/vfs/vfs/c/51e49111c00b


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
