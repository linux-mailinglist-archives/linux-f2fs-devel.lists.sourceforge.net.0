Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBCDADC96E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 13:32:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vt7TI6pzZTDtadDDAbbZwMNiTLmlznszYccJJ5ImUX0=; b=SNac7DxSQzxRZewq5oXHUH+2Ov
	P3ywOgO4A7V9Mak8KVLYqQ+8lNAy+bwe4Bwyr9tIa5SJ+WkxZx3tqI7Zkolxfm8NppIR/kZWX9Jbz
	9/PfINqggtKbnBsLxDwMVxdIxfvu+8Mn69MFn7gLIzqv9+17z0tHpefWIUgTCspjFpkE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRUXk-0001j4-Vr;
	Tue, 17 Jun 2025 11:31:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1uRUXj-0001iq-6M;
 Tue, 17 Jun 2025 11:31:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kP802UqZvFIBMNa5GCyuWzG8B9X7UimS58S5UFzj+vw=; b=AwyexKUL1Up9Opy1RC9HhFRAZh
 frQjxuw0c4at7DPhRF8Q5dkqT3hTibONWMGqJHtmXhcewaabCVth2ENU78e3eCIgmjE2x/LCxAImk
 y/DngMMChZgJJBw+MwpHxsK/qcr5WsB3m5aqAqBs7CrpFKDyWNYhXbJO7CDHIs4Kj844=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kP802UqZvFIBMNa5GCyuWzG8B9X7UimS58S5UFzj+vw=; b=WFL1YgUp3HVe/RZdfGDVflFHCX
 re1h35LEODRQH9eAoiN8mWRKHoBcwlOmZ6KdYAtjieBClOp3XSFywGcF8fNfHG1snDmCB0guwtWH/
 fgw62XWA3bF0q1s8B8nQxAdp1fBR2V3Q49OIV8SalG0CwwTeEmNJKM9Nc6kSy1v9e+Ig=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRUXi-0000Ug-NO; Tue, 17 Jun 2025 11:31:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0CBC2A5000A;
 Tue, 17 Jun 2025 11:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA97EC4CEE3;
 Tue, 17 Jun 2025 11:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750159903;
 bh=9Mw48Zg0cv0dF4bSYaCiGS8ZVAaR/yW9yOs0j/Ch5ps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UDGH4viTAriSsrD4EJMESxN56NOG3wDwakAG2dKKMuWb1Xf4Fvs8de+SewHJNBeF+
 W7cf9OOF3XlqlLjV4xjZHyAAIl+2Hmaf5shgfntuUPqxmNZSHVcvSybrEGy/Zs0Sz5
 lO5GkdOvkm1p5S1WQdyq44321SulB2Rp0CZfmTegP6pro4gigdlM+qKa2ZDLoXUg2A
 qvTS5EICV1TbjXcD1R7gC7TpnfC2RGg+nDK9hvxG4rTP40zQO9iKvwbcyGTSCZCNX2
 7Q47oH6NqNjWiMfBYDtaI4poxHP5TZNgcAaAQkxjOwdM6JDXsX/uiM5uicv0SA0HR+
 XZly4CVAyOHBw==
Date: Tue, 17 Jun 2025 13:31:17 +0200
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20250617-ansetzen-mathematik-08f6d9b51f3d@brauner>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
 <20250616161111.74e10321c4c421674f78d689@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250616161111.74e10321c4c421674f78d689@linux-foundation.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 16, 2025 at 04:11:11PM -0700,
 Andrew Morton wrote: > On Mon,
 16 Jun 2025 20:33:19 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
 wrote: > > > I am basing this on the mm-new branch in A [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uRUXi-0000Ug-NO
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
 linux-xfs@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Tyler Hicks <code@tyhicks.com>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, Jan Harkes <jaharkes@cs.cmu.edu>,
 linux-um@lists.infradead.org, Joel Becker <jlbec@evilplan.org>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Eric Van Hensbergen <ericvh@kernel.org>, linux-kernel@vger.kernel.org,
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
 Martin Brandenburg <martin@omnibond.com>, Kees Cook <kees@kernel.org>,
 Yuezhang Mo <yuezhang.mo@sony.com>, Carlos Maiolino <cem@kernel.org>,
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

On Mon, Jun 16, 2025 at 04:11:11PM -0700, Andrew Morton wrote:
> On Mon, 16 Jun 2025 20:33:19 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> 
> > I am basing this on the mm-new branch in Andrew's tree, so let me know if I
> > should rebase anything here. Given the mm bits touched I did think perhaps
> > we should take it through the mm tree, however it may be more sensible to
> > take it through an fs tree - let me know!
> 
> It's more fs/ than mm/ purely from a footprint point of view.  But
> there any expectation that there will be additional patches which build
> on this?
> 
> I'll scoop it into mm-new for now, see what happens.

I'm going to carry this in the vfs-6.17.mmap_prepare branch after fixing
up the various minor issues spotted in the series.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
