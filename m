Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D89DADC7CA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 12:14:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oEKTV4MP2nlbIjowgSk5lI2Nqapl1vShctfnLT9aTu4=; b=SikW5aVrFAZeOoWmr/pPvpETzd
	oQhRXNnbJ8hSeyTWe9Tkccv9nSnYXthVZz9zQwzbq00Bf9GYLj5Lasm5a1jE+NjTJZM5p0/CV58R4
	QolilZAHhF65WCVCLysRIC2l19tHiqTg/EucDmkprmLYm3mtocsGIb0TEpgMaNxfltu0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRTKU-0008Tg-Nr;
	Tue, 17 Jun 2025 10:14:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1uRTKS-0008TY-LI
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 10:14:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HumSZqJEc3NqTuF1gCNLL1DjTVit469VH90oXWtD97g=; b=BAePwi2m1lRCWaXITlqzNm0Vc6
 V0V2dHvKG+2H5t9w5zNAQ9V5PIIF70byl5D43finOeeil380++yYuFJITQuopT60/YdYHYt1pMxcz
 rfz6FtWM5J1RW+Vl0ZFH30+18fp7sne8ktK8RPRPmWs0ZVJQWOKKjVeB9hKmPc3sRrnw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HumSZqJEc3NqTuF1gCNLL1DjTVit469VH90oXWtD97g=; b=YETNO+YmCrrvp0wQwJTZcvRBht
 fykOSJX0Grn0jnJHe87ieuCyWH+9uCqYY2ElOMXQ6ufRsIac5cU0p1rj7oVTGfuzQYAWI/hqhK5A3
 TfPh3pBFXIoGzC9FQoeLEbuetzm/hBjm8fwAFp3Xcp4PK/b9DJImQgMMvpQlyrXfemMQ=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uRTKR-0003md-Gn for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 10:14:08 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8FA321F454;
 Tue, 17 Jun 2025 10:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1750155240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HumSZqJEc3NqTuF1gCNLL1DjTVit469VH90oXWtD97g=;
 b=GCA4vRTtep8lSNqForgDoEbiH2FHffylKbTQW8ADGX0ygw7y0YzgmvKyJudwz1c+pn/vrP
 oiM1utFqq3DKasuCS+rvGIM3fht87NThulP97W1MoOrovEYbQlceN3dPfOwqPwPdTl/wzO
 Jc9QPnSqRm9TOoCgWTtotAyb95FVifI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1750155240;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HumSZqJEc3NqTuF1gCNLL1DjTVit469VH90oXWtD97g=;
 b=vofk+nlPab1BttxugZRXW6jQtLNByPTK8FyDt52WanP8wxnuDGkGdmSvEDafeB/gXZrhW8
 SgAfoWxD1JFY7mAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1750155240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HumSZqJEc3NqTuF1gCNLL1DjTVit469VH90oXWtD97g=;
 b=GCA4vRTtep8lSNqForgDoEbiH2FHffylKbTQW8ADGX0ygw7y0YzgmvKyJudwz1c+pn/vrP
 oiM1utFqq3DKasuCS+rvGIM3fht87NThulP97W1MoOrovEYbQlceN3dPfOwqPwPdTl/wzO
 Jc9QPnSqRm9TOoCgWTtotAyb95FVifI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1750155240;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HumSZqJEc3NqTuF1gCNLL1DjTVit469VH90oXWtD97g=;
 b=vofk+nlPab1BttxugZRXW6jQtLNByPTK8FyDt52WanP8wxnuDGkGdmSvEDafeB/gXZrhW8
 SgAfoWxD1JFY7mAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 78C6613A69;
 Tue, 17 Jun 2025 10:14:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 52RxHeg/UWhYGQAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 17 Jun 2025 10:14:00 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 33D4AA29F0; Tue, 17 Jun 2025 12:14:00 +0200 (CEST)
Date: Tue, 17 Jun 2025 12:14:00 +0200
From: Jan Kara <jack@suse.cz>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Message-ID: <3m4hxh7ybqgwr2fzymzsp4wiz254hdeelkdaajw3gxbdw7fezt@53eblikg32e3>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
 <c7dc90e44a9e75e750939ea369290d6e441a18e6.1750099179.git.lorenzo.stoakes@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c7dc90e44a9e75e750939ea369290d6e441a18e6.1750099179.git.lorenzo.stoakes@oracle.com>
X-Spam-Flag: NO
X-Spam-Score: -0.30
X-Spamd-Result: default: False [-0.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 FORGED_RECIPIENTS(2.00)[m:akpm@linux-foundation.org, m:axboe@kernel.dk,
 m:rodrigo.vivi@intel.com, m:airlied@gmail.com, m:simona@ffwll.ch,
 m:ericvh@kernel.org, m:lucho@ionkov.net, m:asmadeus@codewreck.org,
 m:linux_oss@crudebyte.com, m:marc.dionne@auristor.com,
 m:viro@zeniv.linux.org.uk, m:brauner@kernel.org, m:bcrl@kvack.org,
 m:amir73il@gmail.com, m:aivazian.tigran@gmail.com, m:kees@kernel.org,
 m:clm@fb.com, m:idryomov@gmail.com, m:jaharkes@cs.cmu.edu, m:coda@cs.cmu.edu,
 m:xiang@kernel.org, m:chao@kernel.org, m:zbestahu@gmail.com,
 m:dhavale@google.com, m:lihongbo22@huawei.com, m:linkinjeon@kernel.org,
 m:adilger.kernel@dilger.ca, m:jaegeuk@kernel.org, m:slava@dubeyko.com,
 m:frank.li@vivo.com, m:anton.ivanov@cambridgegreys.com,
 m:mikulas@artax.karlin.mff.cuni.cz, m:dwmw2@infradead.org, m:shaggy@kernel.org,
 m:trondmy@kernel.org, m:anna@kernel.org, m:konishi.ryusuke@gmail.com,
 m:mark@fasheh.com, m:jlbec@evilplan.org, m:me@bobcopeland.com,
 m:ronniesahlberg@gmail.com, m:chengzhihao1@huawei.com, m:cem@kernel.org,
 m:dlemoal@kernel.or
 g,m:naohiro.aota@wdc.com,m:jth@kernel.org,m:dan.j.williams@intel.com,m:willy@infradead.org,m:jannh@google.com,m:linux-aio@kvack.org,m:linux-mm@kvack.org,m:codalist@coda.cs.cmu.edu,s:linux-mtd@lists.infradead.org,s:linux-um@lists.infradead.org,s:ntfs3@lists.linux.dev,s:nvdimm@lists.linux.dev,s:ocfs2-devel@lists.linux.dev,s:devel@lists.orangefs.org,s:samba-technical@lists.samba.org,s:jfs-discussion@lists.sourceforge.net,s:linux-f2fs-devel@lists.sourceforge.net,s:linux-karma-devel@lists.sourceforge.net];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCVD_TLS_LAST(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_COUNT_THREE(0.00)[3];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linux-foundation.org,oracle.com,kernel.dk,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,kernel.org,ionkov.net,codewreck.org,crudebyte.com,suse.com,redhat.com,auristor.com,zeniv.linux.org.uk,suse.cz,kvack.org,szeredi.hu,linux.dev,fb.com,toxicpanda.com,cs.cmu.edu,tyhicks.com,linux.alibaba.com,google.com,huawei.com,samsung.com,sony.com,mit.edu,dilger.ca,mail.parknet.co.jp,dubeyko.com,physik.fu-berlin.de,vivo.com,nod.at,cambridgegreys.com,sipsolutions.net,artax.karlin.mff.cuni.cz,infradead.org,paragon-software.com,fasheh.com,evilplan.org,bobcopeland.com,omnibond.com,samba.org,manguebit.org,microsoft.com,talpey.com,wdc.com,suse.de,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,coda.cs.cmu.edu,lists.ozlabs.org,lists.sourceforge.net,lists.orangefs.org,lists.samba.org];
 R_RATELIMIT(0.00)[to_ip_from(RLb58ib84xst5oy51ju4zaburj)];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_GT_50(0.00)[113];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 MISSING_XM_UA(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email]
X-Spam-Level: 
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 16-06-25 20:33:27,
 Lorenzo Stoakes wrote: > Since commit
 c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file > callback"),
 the f_op->mmap()
 hook has been deprecated in favour of > f_op->mmap_ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uRTKR-0003md-Gn
Subject: Re: [f2fs-dev] [PATCH 08/10] fs: convert simple use of
 generic_file_*_mmap() to .mmap_prepare()
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

On Mon 16-06-25 20:33:27, Lorenzo Stoakes wrote:
> Since commit c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file
> callback"), the f_op->mmap() hook has been deprecated in favour of
> f_op->mmap_prepare().
> 
> We have provided generic .mmap_prepare() equivalents, so update all file
> systems that specify these directly in their file_operations structures.
> 
> This updates 9p, adfs, affs, bfs, fat, hfs, hfsplus, hostfs, hpfs, jffs2,
> jfs, minix, omfs, ramfs and ufs file systems directly.
> 
> It updates generic_ro_fops which impacts qnx4, cramfs, befs, squashfs,
> frebxfs, qnx6, efs, romfs, erofs and isofs file systems.
> 
> There are remaining file systems which use generic hooks in a less direct
> way which we address in a subsequent commit.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/9p/vfs_file.c        | 2 +-
>  fs/adfs/file.c          | 2 +-
>  fs/affs/file.c          | 2 +-
>  fs/bfs/file.c           | 2 +-
>  fs/fat/file.c           | 2 +-
>  fs/hfs/inode.c          | 2 +-
>  fs/hfsplus/inode.c      | 2 +-
>  fs/hostfs/hostfs_kern.c | 2 +-
>  fs/hpfs/file.c          | 2 +-
>  fs/jffs2/file.c         | 2 +-
>  fs/jfs/file.c           | 2 +-
>  fs/minix/file.c         | 2 +-
>  fs/omfs/file.c          | 2 +-
>  fs/ramfs/file-mmu.c     | 2 +-
>  fs/read_write.c         | 2 +-
>  fs/ufs/file.c           | 2 +-
>  16 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/9p/vfs_file.c b/fs/9p/vfs_file.c
> index 348cc90bf9c5..2ff3e0ac7266 100644
> --- a/fs/9p/vfs_file.c
> +++ b/fs/9p/vfs_file.c
> @@ -516,7 +516,7 @@ const struct file_operations v9fs_file_operations = {
>  	.open = v9fs_file_open,
>  	.release = v9fs_dir_release,
>  	.lock = v9fs_file_lock,
> -	.mmap = generic_file_readonly_mmap,
> +	.mmap_prepare = generic_file_readonly_mmap_prepare,
>  	.splice_read = v9fs_file_splice_read,
>  	.splice_write = iter_file_splice_write,
>  	.fsync = v9fs_file_fsync,
> diff --git a/fs/adfs/file.c b/fs/adfs/file.c
> index ee80718aaeec..cd13165fd904 100644
> --- a/fs/adfs/file.c
> +++ b/fs/adfs/file.c
> @@ -25,7 +25,7 @@
>  const struct file_operations adfs_file_operations = {
>  	.llseek		= generic_file_llseek,
>  	.read_iter	= generic_file_read_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>  	.fsync		= generic_file_fsync,
>  	.write_iter	= generic_file_write_iter,
>  	.splice_read	= filemap_splice_read,
> diff --git a/fs/affs/file.c b/fs/affs/file.c
> index 7a71018e3f67..fbac204b7055 100644
> --- a/fs/affs/file.c
> +++ b/fs/affs/file.c
> @@ -999,7 +999,7 @@ const struct file_operations affs_file_operations = {
>  	.llseek		= generic_file_llseek,
>  	.read_iter	= generic_file_read_iter,
>  	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>  	.open		= affs_file_open,
>  	.release	= affs_file_release,
>  	.fsync		= affs_file_fsync,
> diff --git a/fs/bfs/file.c b/fs/bfs/file.c
> index fa66a09e496a..6685c3411fe7 100644
> --- a/fs/bfs/file.c
> +++ b/fs/bfs/file.c
> @@ -27,7 +27,7 @@ const struct file_operations bfs_file_operations = {
>  	.llseek 	= generic_file_llseek,
>  	.read_iter	= generic_file_read_iter,
>  	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>  	.splice_read	= filemap_splice_read,
>  };
>  
> diff --git a/fs/fat/file.c b/fs/fat/file.c
> index e887e9ab7472..4fc49a614fb8 100644
> --- a/fs/fat/file.c
> +++ b/fs/fat/file.c
> @@ -204,7 +204,7 @@ const struct file_operations fat_file_operations = {
>  	.llseek		= generic_file_llseek,
>  	.read_iter	= generic_file_read_iter,
>  	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>  	.release	= fat_file_release,
>  	.unlocked_ioctl	= fat_generic_ioctl,
>  	.compat_ioctl	= compat_ptr_ioctl,
> diff --git a/fs/hfs/inode.c b/fs/hfs/inode.c
> index a81ce7a740b9..d419586d668d 100644
> --- a/fs/hfs/inode.c
> +++ b/fs/hfs/inode.c
> @@ -690,7 +690,7 @@ static const struct file_operations hfs_file_operations = {
>  	.llseek		= generic_file_llseek,
>  	.read_iter	= generic_file_read_iter,
>  	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>  	.splice_read	= filemap_splice_read,
>  	.fsync		= hfs_file_fsync,
>  	.open		= hfs_file_open,
> diff --git a/fs/hfsplus/inode.c b/fs/hfsplus/inode.c
> index f331e9574217..0af7e302730c 100644
> --- a/fs/hfsplus/inode.c
> +++ b/fs/hfsplus/inode.c
> @@ -366,7 +366,7 @@ static const struct file_operations hfsplus_file_operations = {
>  	.llseek		= generic_file_llseek,
>  	.read_iter	= generic_file_read_iter,
>  	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>  	.splice_read	= filemap_splice_read,
>  	.fsync		= hfsplus_file_fsync,
>  	.open		= hfsplus_file_open,
> diff --git a/fs/hostfs/hostfs_kern.c b/fs/hostfs/hostfs_kern.c
> index 702c41317589..bc22b6cc72af 100644
> --- a/fs/hostfs/hostfs_kern.c
> +++ b/fs/hostfs/hostfs_kern.c
> @@ -382,7 +382,7 @@ static const struct file_operations hostfs_file_fops = {
>  	.splice_write	= iter_file_splice_write,
>  	.read_iter	= generic_file_read_iter,
>  	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>  	.open		= hostfs_open,
>  	.release	= hostfs_file_release,
>  	.fsync		= hostfs_fsync,
> diff --git a/fs/hpfs/file.c b/fs/hpfs/file.c
> index 449a3fc1b8d9..a1a44e3edb19 100644
> --- a/fs/hpfs/file.c
> +++ b/fs/hpfs/file.c
> @@ -255,7 +255,7 @@ const struct file_operations hpfs_file_ops =
>  	.llseek		= generic_file_llseek,
>  	.read_iter	= generic_file_read_iter,
>  	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>  	.release	= hpfs_file_release,
>  	.fsync		= hpfs_file_fsync,
>  	.splice_read	= filemap_splice_read,
> diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
> index 13c18ccc13b0..1e05f7fe5dd4 100644
> --- a/fs/jffs2/file.c
> +++ b/fs/jffs2/file.c
> @@ -54,7 +54,7 @@ const struct file_operations jffs2_file_operations =
>   	.read_iter =	generic_file_read_iter,
>   	.write_iter =	generic_file_write_iter,
>  	.unlocked_ioctl=jffs2_ioctl,
> -	.mmap =		generic_file_readonly_mmap,
> +	.mmap_prepare =	generic_file_readonly_mmap_prepare,
>  	.fsync =	jffs2_fsync,
>  	.splice_read =	filemap_splice_read,
>  	.splice_write = iter_file_splice_write,
> diff --git a/fs/jfs/file.c b/fs/jfs/file.c
> index 01b6912e60f8..5e47951db630 100644
> --- a/fs/jfs/file.c
> +++ b/fs/jfs/file.c
> @@ -143,7 +143,7 @@ const struct file_operations jfs_file_operations = {
>  	.llseek		= generic_file_llseek,
>  	.read_iter	= generic_file_read_iter,
>  	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>  	.splice_read	= filemap_splice_read,
>  	.splice_write	= iter_file_splice_write,
>  	.fsync		= jfs_fsync,
> diff --git a/fs/minix/file.c b/fs/minix/file.c
> index 906d192ab7f3..dca7ac71f049 100644
> --- a/fs/minix/file.c
> +++ b/fs/minix/file.c
> @@ -17,7 +17,7 @@ const struct file_operations minix_file_operations = {
>  	.llseek		= generic_file_llseek,
>  	.read_iter	= generic_file_read_iter,
>  	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>  	.fsync		= generic_file_fsync,
>  	.splice_read	= filemap_splice_read,
>  };
> diff --git a/fs/omfs/file.c b/fs/omfs/file.c
> index 98358d405b6a..319c04e63964 100644
> --- a/fs/omfs/file.c
> +++ b/fs/omfs/file.c
> @@ -332,7 +332,7 @@ const struct file_operations omfs_file_operations = {
>  	.llseek = generic_file_llseek,
>  	.read_iter = generic_file_read_iter,
>  	.write_iter = generic_file_write_iter,
> -	.mmap = generic_file_mmap,
> +	.mmap_prepare = generic_file_mmap_prepare,
>  	.fsync = generic_file_fsync,
>  	.splice_read = filemap_splice_read,
>  };
> diff --git a/fs/ramfs/file-mmu.c b/fs/ramfs/file-mmu.c
> index b45c7edc3225..b11f5b20b78b 100644
> --- a/fs/ramfs/file-mmu.c
> +++ b/fs/ramfs/file-mmu.c
> @@ -41,7 +41,7 @@ static unsigned long ramfs_mmu_get_unmapped_area(struct file *file,
>  const struct file_operations ramfs_file_operations = {
>  	.read_iter	= generic_file_read_iter,
>  	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>  	.fsync		= noop_fsync,
>  	.splice_read	= filemap_splice_read,
>  	.splice_write	= iter_file_splice_write,
> diff --git a/fs/read_write.c b/fs/read_write.c
> index 0ef70e128c4a..80fdab99f9e4 100644
> --- a/fs/read_write.c
> +++ b/fs/read_write.c
> @@ -28,7 +28,7 @@
>  const struct file_operations generic_ro_fops = {
>  	.llseek		= generic_file_llseek,
>  	.read_iter	= generic_file_read_iter,
> -	.mmap		= generic_file_readonly_mmap,
> +	.mmap_prepare	= generic_file_readonly_mmap_prepare,
>  	.splice_read	= filemap_splice_read,
>  };
>  
> diff --git a/fs/ufs/file.c b/fs/ufs/file.c
> index 487ad1fc2de6..c2a391c17df7 100644
> --- a/fs/ufs/file.c
> +++ b/fs/ufs/file.c
> @@ -38,7 +38,7 @@ const struct file_operations ufs_file_operations = {
>  	.llseek		= generic_file_llseek,
>  	.read_iter	= generic_file_read_iter,
>  	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>  	.open           = generic_file_open,
>  	.fsync		= generic_file_fsync,
>  	.splice_read	= filemap_splice_read,
> -- 
> 2.49.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
