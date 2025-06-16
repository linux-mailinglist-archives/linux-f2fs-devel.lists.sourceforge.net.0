Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45560ADBA77
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Jun 2025 22:01:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:References:
	In-Reply-To:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=puy8BsxUs9cqodvgljGKgt8Tqf+zvxemslWPsGVDrKM=; b=lYmeOkjqj/Gm634n2HTDt4naQ0
	e7mBnJZFWaudz26t9qHU5dNTD9nIIT2cNSzImRkxx8XL36+1FbfIDP15cVxOtGOC+0vnXFB9KEXCn
	ziAZRDLn8I7bkJCraeWgAMSGNC9+vKSOu9wkOKZLhTi6rYyWLZ2ubJcjqDa1ckLla3Dk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRG0z-0006ny-3q;
	Mon, 16 Jun 2025 20:01:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kees@kernel.org>) id 1uRG0y-0006np-7x;
 Mon, 16 Jun 2025 20:01:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AomqQsJBTpg66zFC6IzNCQDm8xWbRpjPl0LqtiAdfzI=; b=dtgoVsYl+16wS5+NJNzzi1QA1I
 KGtBbRgxuMDqiysZY1bYJeHXsNeibDu2qELl2tHlZiYpqNlCJLbQG7xtqkfcsW/Z/J+JhtZ0xN5NZ
 TOAkYxn6v4bcmtfUHPUQajRkAMjRSDwitBK5cQdwOHpYRZQoEk2UlzpC57sj0HX6nI3M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References
 :In-Reply-To:Subject:CC:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AomqQsJBTpg66zFC6IzNCQDm8xWbRpjPl0LqtiAdfzI=; b=TY5PcSTvVMv1fRbACbvop1ygcF
 uguAgd0Vg48ttEl2VJSYsSua1rPFUnykpvRyZK5O+wCufT7+9E3L/fo4vAzF/husqHatoeOPGEUjg
 Ciiz55BnXd12KgzzhvFYQJw7IIDcboOyjjEmRZt/Ak927oJ3NEB8kRh/14SHfPVKNIzQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRG0w-0002JP-Ru; Mon, 16 Jun 2025 20:01:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D84805C642E;
 Mon, 16 Jun 2025 19:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC77AC4CEEA;
 Mon, 16 Jun 2025 20:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750104061;
 bh=63g4BFyDRQ9zPpgQi+aKRKc8QZqr403zshqDeyAnLYU=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=MIbLmxFkQvDlWahGwOzhitZt0cSzoXdhWUHu8g8OkqZLAupve4SlpvOS2uS1ZEWmj
 UwQ2s8yA8tAesX44zSYXdwSfJqH8TXAO82zH05g97Z/1UOjr1700+pmtNnzQBgsvl8
 4ex7UC260hPMrrevOuoNx+ItcoPEWmxAHO8kKS0LskJGXsmB+Lw+lBdLI7AmEbxTyi
 Xaylvf43oG7bbuZKo2MFBbk3fvcCNc7E3lsmsbzOnTEhXlMNNdjS9szSMRmncYZuuz
 cV+XE+08Pnq5bgJ/0F99pB6Ea9gbVg9z6nnYTpH3+D1YHFBxVujigA5wdVTvZ/xroj
 anLaWnk5pcMew==
Date: Mon, 16 Jun 2025 13:01:00 -0700
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
User-Agent: K-9 Mail for Android
In-Reply-To: <b68145b609532e62bab603dd9686faa6562046ec.1750099179.git.lorenzo.stoakes@oracle.com>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
 <b68145b609532e62bab603dd9686faa6562046ec.1750099179.git.lorenzo.stoakes@oracle.com>
Message-ID: <E0284B4E-A675-4855-87C8-CD13979710D6@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On June 16, 2025 12:33:22 PM PDT,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
 wrote: >Since commit c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file
 >callback"), the f_op->mmap() hook has been de [...] 
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
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uRG0w-0002JP-Ru
Subject: Re: [f2fs-dev] [PATCH 03/10] fs: consistently use
 file_has_valid_mmap_hooks() helper
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
From: Kees Cook via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Kees Cook <kees@kernel.org>
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
 linux-fsdevel@vger.kernel.org, Trond Myklebust <trondmy@kernel.org>,
 Dave Kleikamp <shaggy@kernel.org>, Sandeep Dhavale <dhavale@google.com>,
 Simona Vetter <simona@ffwll.ch>, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, codalist@coda.cs.cmu.edu,
 Namjae Jeon <linkinjeon@kernel.org>, ecryptfs@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 ocfs2-devel@lists.linux.dev, Pedro Falcato <pfalcato@suse.de>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, linux-block@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Martin Brandenburg <martin@omnibond.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
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



On June 16, 2025 12:33:22 PM PDT, Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
>Since commit c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file
>callback"), the f_op->mmap() hook has been deprecated in favour of
>f_op->mmap_prepare().
>
>Additionally, commit bb666b7c2707 ("mm: add mmap_prepare() compatibility
>layer for nested file systems") permits the use of the .mmap_prepare() hook
>even in nested filesystems like overlayfs.
>
>There are a number of places where we check only for f_op->mmap - this is
>incorrect now mmap_prepare exists, so update all of these to use the
>general helper file_has_valid_mmap_hooks().
>
>Most notably, this updates the elf logic to allow for the ability to
>execute binaries on filesystems which have the .mmap_prepare hook, but
>additionally we update nested filesystems.
>
>Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>---
> fs/backing-file.c     | 2 +-
> fs/binfmt_elf.c       | 4 ++--
> fs/binfmt_elf_fdpic.c | 2 +-

Thanks for the refactoring!

Acked-by: Kees Cook<kees@kernel.org>


-- 
Kees Cook


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
