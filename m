Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1452ADCA43
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 14:00:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+N63QCpTYH+4v6mMquOk1o9ekHBtxaePA5BP46l4Cvw=; b=A9VG0kCTVH5RjeqCqmzAubYhNL
	MoqkbYbbRaWIHo3niqvyyhT6YqhrFso/1vBbhk998J/0vjanACsXpMqxElrPtpNYFpfWaIDRqvE+c
	8iVN4JpR/TJttz5YFHabh1wtqgyCB5RakjDparYWER+412j83mfLp+u5FB8wd9q96ges=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRUzF-0002UI-Vf;
	Tue, 17 Jun 2025 12:00:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1uRUzD-0002U7-OZ;
 Tue, 17 Jun 2025 12:00:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VadYNfxPDS9mWpWiEQHS/5/7snz8zXTvd9oaZpSDKWQ=; b=R0q47IiohZuiX6iTLHZl1Y1yhS
 z612ujn1baCFZJcic7vYC6TBWfYoJlGVWJAclyWV+8cDDWWyJ7aEY4dFPj35ScY+Eq6RmXGfZH6YJ
 7AOMh+IESRpnXLb1AZ1Q7V57PpCaDbPUUWLWflRxu08WZ4yBhrf740GL1wbw47qhlAwU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VadYNfxPDS9mWpWiEQHS/5/7snz8zXTvd9oaZpSDKWQ=; b=ScDTgIis38XeHOJ094hXb/6Dl1
 UIAg17vsZMdo5PQRpaIFlYzciRvTMDnYfrkqhGHYH8svD3khIsuIz7eC2J+XJbl42fwQTQsggmNT8
 OGGRxCc1uoEL6kaMF7r1KK1NvCSYI2fylF3qxHUVXOMzf8/r7llyWOcs+C+YD3Pg7kIg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRUzD-0002Ml-6m; Tue, 17 Jun 2025 12:00:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 783D2614BC;
 Tue, 17 Jun 2025 12:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F729C4CEE3;
 Tue, 17 Jun 2025 11:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750161613;
 bh=d7N8Br27sigUm6RwJ6QKDyuMIfLKb482gs0GJECdYqY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cbm6eSpOXnYTKVf24fD5wSecYeYAtaJSPLtzA/cg7YuA4PJRPYSNZqoHGrOB9vedO
 xE+Kw4QDbA/4jdsP7oXbPhVrMP5XKHSj57b+LizHRuDadEPqGBM+ZxF2QhTJG4KKld
 niMYuWEWwMHm5apCVpkqg1uA/sm57a3OJs6XP47Q03JuvcLdBMJ4BZLJME8mGFpquF
 OAV54y1YNZFqwgygvgnolLyQkxdfAP1bT54VMRT4yd/LwvYOK0H78h2s/9FU+jHgJZ
 /1P5yb/ScvLTgMkRASvu83CdtUFgXaGEFmmqSgC4JGFIOk41SmtzQEJEUL45wKXKIE
 copUCuL9W6X/w==
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date: Tue, 17 Jun 2025 13:58:21 +0200
Message-ID: <20250617-neugliederung-erarbeiten-58c2ad93db83@brauner>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2454; i=brauner@kernel.org;
 h=from:subject:message-id; bh=d7N8Br27sigUm6RwJ6QKDyuMIfLKb482gs0GJECdYqY=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQERqz1Wd3by3g/duuF6rmP/N/MPRV+t8Tf5qpaV67t4
 jKOJ7rXO0pZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACaysIiRYfKb1+w2vf8O/mdg
 vPFO8PHqRzML+F0vTZYp4bqm1fwkeyXDP4PuJqblPl9UmcRtf/n65jge6ap97PLc+43T4+kid/k
 fMgMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 16 Jun 2025 20:33:19 +0100, Lorenzo Stoakes wrote:
 > REVIEWER'S NOTES > ================ > > I am basing this on the mm-new
 branch in Andrew's tree, so let me know if I > should rebase anythin [...]
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
X-Headers-End: 1uRUzD-0002Ml-6m
Subject: Re: [f2fs-dev] [PATCH 00/10] convert the majority of file systems
 to mmap_prepare
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, nvdimm@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>, dri-devel@lists.freedesktop.org,
 ceph-devel@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Tyler Hicks <code@tyhicks.com>,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
 Jan Harkes <jaharkes@cs.cmu.edu>, linux-um@lists.infradead.org,
 Joel Becker <jlbec@evilplan.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
 Sandeep Dhavale <dhavale@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, Namjae Jeon <linkinjeon@kernel.org>,
 ecryptfs@vger.kernel.org, Yangtao Li <frank.li@vivo.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, ocfs2-devel@lists.linux.dev,
 Pedro Falcato <pfalcato@suse.de>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 linux-block@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net, Hongbo Li <lihongbo22@huawei.com>,
 Anna Schumaker <anna@kernel.org>, Martin Brandenburg <martin@omnibond.com>,
 Kees Cook <kees@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Carlos Maiolino <cem@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Marc Dionne <marc.dionne@auristor.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 linux-afs@lists.infradead.org, Naohiro Aota <naohiro.aota@wdc.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Matthew Wilcox <willy@infradead.org>,
 coda@cs.cmu.edu, Viacheslav Dubeyko <slava@dubeyko.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, intel-gfx@lists.freedesktop.org,
 Damien Le Moal <dlemoal@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Gao Xiang <xiang@kernel.org>,
 David Howells <dhowells@redhat.com>, linux-nfs@vger.kernel.org,
 linux-mm@kvack.org, samba-technical@lists.samba.org,
 Steve French <sfrench@samba.org>, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, linux-aio@kvack.org,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Bob Copeland <me@bobcopeland.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 David Airlie <airlied@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Yue Hu <zbestahu@gmail.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 linux-bcachefs@vger.kernel.org, Jann Horn <jannh@google.com>,
 Josef Bacik <josef@toxicpanda.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Tom Talpey <tom@talpey.com>,
 Hans de Goede <hdegoede@redhat.com>, Bharath SM <bharathsm@microsoft.com>,
 "Tigran A . Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jens Axboe <axboe@kernel.dk>, Sungjong Seo <sj1557.seo@samsung.com>,
 v9fs@lists.linux.dev, Kent Overstreet <kent.overstreet@linux.dev>,
 linux-unionfs@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>,
 Jeffle Xu <jefflexu@linux.alibaba.com>,
 Johannes Berg <johannes@sipsolutions.net>, Johannes Thumshirn <jth@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 16 Jun 2025 20:33:19 +0100, Lorenzo Stoakes wrote:
> REVIEWER'S NOTES
> ================
> 
> I am basing this on the mm-new branch in Andrew's tree, so let me know if I
> should rebase anything here. Given the mm bits touched I did think perhaps
> we should take it through the mm tree, however it may be more sensible to
> take it through an fs tree - let me know!
> 
> [...]

This looks good. I fixed up the minor review comments.
Looking forward to further cleanups in this area.

---

Applied to the vfs-6.17.mmap_prepare branch of the vfs/vfs.git tree.
Patches in the vfs-6.17.mmap_prepare branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-6.17.mmap_prepare

[01/10] mm: rename call_mmap/mmap_prepare to vfs_mmap/mmap_prepare
        https://git.kernel.org/vfs/vfs/c/20ca475d9860
[02/10] mm/nommu: use file_has_valid_mmap_hooks() helper
        https://git.kernel.org/vfs/vfs/c/c6900f227f89
[03/10] fs: consistently use file_has_valid_mmap_hooks() helper
        https://git.kernel.org/vfs/vfs/c/b013ed403197
[04/10] fs/dax: make it possible to check dev dax support without a VMA
        https://git.kernel.org/vfs/vfs/c/0335f6afd348
[05/10] fs/ext4: transition from deprecated .mmap hook to .mmap_prepare
        https://git.kernel.org/vfs/vfs/c/8c90ae8fe5e3
[06/10] fs/xfs: transition from deprecated .mmap hook to .mmap_prepare
        https://git.kernel.org/vfs/vfs/c/6528d29b46d8
[07/10] mm/filemap: introduce generic_file_*_mmap_prepare() helpers
        https://git.kernel.org/vfs/vfs/c/5b44297bcfa4
[08/10] fs: convert simple use of generic_file_*_mmap() to .mmap_prepare()
        https://git.kernel.org/vfs/vfs/c/951ea2f4844c
[09/10] fs: convert most other generic_file_*mmap() users to .mmap_prepare()
        https://git.kernel.org/vfs/vfs/c/a5ee9a82981d
[10/10] fs: replace mmap hook with .mmap_prepare for simple mappings
        https://git.kernel.org/vfs/vfs/c/a1e5b36c4034


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
