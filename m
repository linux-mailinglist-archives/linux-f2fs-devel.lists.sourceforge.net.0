Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F6CADC78C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 12:08:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTHd9K1ow4fYbLsuRljnDP9MgVfrUvIjftokBP0iu8k=; b=jgxBE3uCZVR6RRdiJrNEn4sZUC
	gIAtCexBeX9jL5nmYLdSgzHKV0m6Gi/ekvIn++Md0TBXUoot9OmDtqhA0hmB32f1y80ibyzGB2plS
	eB+i+IapQESNwlHx/FXBEWjPKls/m9nmoCAM8+EuLgDrRe3OhUcIjMQA+RlYzduTnw4o=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRTEx-0007C8-7m;
	Tue, 17 Jun 2025 10:08:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1uRTEv-0007C1-7g
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 10:08:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+KN9MaeqSHl9HVwIoddN2qqMWW+hXSSVzIEAt9aXyiA=; b=IbMoxLNB/xYPnsfaTjfTh1Xx+G
 Dl25bvZCyy+JdfFzAXDDIuI9568X2EuPn5L0R8yBSZm0LI3gBZhh8VwuVjGX0cUgjvZIvn4eHu0v8
 3RVTi2jjg/o8pHKP3AbvSVVV4EVQ1dmvsT+9z/1oNlNi5fwaU3WS51XJzaeg4CmyJA0A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+KN9MaeqSHl9HVwIoddN2qqMWW+hXSSVzIEAt9aXyiA=; b=axKOXIymtZniY5Eo5wg3z/UhsO
 dEvoLCpOp8zKrkuyN1QnP9eU7wf+3yGtxvcMA1gjImhJ4J5hOAbzopsriaqo7k4aSyyG56wu7M0jJ
 7vkCXk3dVXdMsRovgdd3h1Mj+qIFe6x+YYgpDhnx9osGxhJCDB16Vk0GUbXaZXzexAbo=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uRTEu-0003NE-HF for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 10:08:25 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3C4071F391;
 Tue, 17 Jun 2025 10:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1750154898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+KN9MaeqSHl9HVwIoddN2qqMWW+hXSSVzIEAt9aXyiA=;
 b=BFxWl3EanIJvzCoMFuCoJxkj0gAsdQZE7hw1XhSy1nbMZTkaRDiA1b0hI3GXl4f/MvyfyV
 Vgj0hPOQwQM8eCTvqUXeohMucxrc+c/xMO/X9kCCPSP1ukBaPJ0KWCWnZJPEEloR81K1Ci
 0OgK36M68lUZ8jSY1FnTe483u2hsBUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1750154898;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+KN9MaeqSHl9HVwIoddN2qqMWW+hXSSVzIEAt9aXyiA=;
 b=SBOIzyjoL1hV4dTxalfy2DzNiQoIlHduO9Qsz9VkAnCu7glFAk22G0mRK89A6leFQTwMJe
 mzbJXmoC2AWz7rCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1750154898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+KN9MaeqSHl9HVwIoddN2qqMWW+hXSSVzIEAt9aXyiA=;
 b=BFxWl3EanIJvzCoMFuCoJxkj0gAsdQZE7hw1XhSy1nbMZTkaRDiA1b0hI3GXl4f/MvyfyV
 Vgj0hPOQwQM8eCTvqUXeohMucxrc+c/xMO/X9kCCPSP1ukBaPJ0KWCWnZJPEEloR81K1Ci
 0OgK36M68lUZ8jSY1FnTe483u2hsBUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1750154898;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+KN9MaeqSHl9HVwIoddN2qqMWW+hXSSVzIEAt9aXyiA=;
 b=SBOIzyjoL1hV4dTxalfy2DzNiQoIlHduO9Qsz9VkAnCu7glFAk22G0mRK89A6leFQTwMJe
 mzbJXmoC2AWz7rCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2AF2E13AE2;
 Tue, 17 Jun 2025 10:08:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GPp2CpI+UWiIFwAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 17 Jun 2025 10:08:18 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id C6B34A29F0; Tue, 17 Jun 2025 12:08:13 +0200 (CEST)
Date: Tue, 17 Jun 2025 12:08:13 +0200
From: Jan Kara <jack@suse.cz>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Message-ID: <kzp4cei5qq6gbtzzng7hmqj5avzblopfzzrks4e2gahcdvr7ro@cwziankavxw4>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
 <b68145b609532e62bab603dd9686faa6562046ec.1750099179.git.lorenzo.stoakes@oracle.com>
 <aFD5AP7B80np-Szz@infradead.org>
 <b91c387e-5226-4c5e-94c3-04e80409ed62@lucifer.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b91c387e-5226-4c5e-94c3-04e80409ed62@lucifer.local>
X-Spamd-Result: default: False [-0.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 FORGED_RECIPIENTS(2.00)[m:hch@infradead.org, m:akpm@linux-foundation.org,
 m:axboe@kernel.dk, m:rodrigo.vivi@intel.com, m:airlied@gmail.com,
 m:simona@ffwll.ch, m:ericvh@kernel.org, m:lucho@ionkov.net,
 m:asmadeus@codewreck.org, m:linux_oss@crudebyte.com,
 m:marc.dionne@auristor.com, m:viro@zeniv.linux.org.uk, m:brauner@kernel.org,
 m:bcrl@kvack.org, m:amir73il@gmail.com, m:aivazian.tigran@gmail.com,
 m:kees@kernel.org, m:clm@fb.com, m:idryomov@gmail.com, m:jaharkes@cs.cmu.edu,
 m:coda@cs.cmu.edu, m:xiang@kernel.org, m:chao@kernel.org, m:zbestahu@gmail.com,
 m:dhavale@google.com, m:lihongbo22@huawei.com, m:linkinjeon@kernel.org,
 m:adilger.kernel@dilger.ca, m:jaegeuk@kernel.org, m:slava@dubeyko.com,
 m:frank.li@vivo.com, m:anton.ivanov@cambridgegreys.com,
 m:mikulas@artax.karlin.mff.cuni.cz, m:dwmw2@infradead.org, m:shaggy@kernel.org,
 m:trondmy@kernel.org, m:anna@kernel.org, m:konishi.ryusuke@gmail.com,
 m:mark@fasheh.com, m:jlbec@evilplan.org, m:me@bobcopeland.com,
 m:ronniesahlberg@gmail.com, m:chengzhihao1@huawei.com, m:cem@kernel.org
 ,m:dlemoal@kernel.org,m:naohiro.aota@wdc.com,m:jth@kernel.org,m:dan.j.williams@intel.com,m:willy@infradead.org,m:jannh@google.com,m:linux-aio@kvack.org,m:linux-mm@kvack.org,m:codalist@coda.cs.cmu.edu,s:linux-mtd@lists.infradead.org,s:linux-um@lists.infradead.org,s:ntfs3@lists.linux.dev,s:nvdimm@lists.linux.dev,s:ocfs2-devel@lists.linux.dev,s:devel@lists.orangefs.org,s:samba-technical@lists.samba.org,s:jfs-discussion@lists.sourceforge.net,s:linux-f2fs-devel@lists.sourceforge.net,s:linux-karma-devel@lists.sourceforge.net];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_DN_SOME(0.00)[];
 TAGGED_RCPT(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MISSING_XM_UA(0.00)[];
 ARC_NA(0.00)[];
 FREEMAIL_CC(0.00)[infradead.org,linux-foundation.org,oracle.com,kernel.dk,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,kernel.org,ionkov.net,codewreck.org,crudebyte.com,suse.com,redhat.com,auristor.com,zeniv.linux.org.uk,suse.cz,kvack.org,szeredi.hu,linux.dev,fb.com,toxicpanda.com,cs.cmu.edu,tyhicks.com,linux.alibaba.com,google.com,huawei.com,samsung.com,sony.com,mit.edu,dilger.ca,mail.parknet.co.jp,dubeyko.com,physik.fu-berlin.de,vivo.com,nod.at,cambridgegreys.com,sipsolutions.net,artax.karlin.mff.cuni.cz,paragon-software.com,fasheh.com,evilplan.org,bobcopeland.com,omnibond.com,samba.org,manguebit.org,microsoft.com,talpey.com,wdc.com,suse.de,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,coda.cs.cmu.edu,lists.ozlabs.org,lists.sourceforge.net,lists.orangefs.org,lists.samba.org];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLqtii8yfszk6njpjy6ku6uuao)];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; RCPT_COUNT_GT_50(0.00)[114];
 RCVD_TLS_LAST(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.30
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 17-06-25 06:25:34, Lorenzo Stoakes wrote: > On Mon,
 Jun 16, 2025 at 10:11:28PM -0700, Christoph Hellwig wrote: > > On Mon, Jun
 16, 2025 at 08:33:22PM +0100, Lorenzo Stoakes wrote: > > > Since c [...] 
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
X-Headers-End: 1uRTEu-0003NE-HF
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, nvdimm@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>, dri-devel@lists.freedesktop.org,
 ceph-devel@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Tyler Hicks <code@tyhicks.com>,
 Christoph Hellwig <hch@infradead.org>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, Jan Harkes <jaharkes@cs.cmu.edu>,
 linux-um@lists.infradead.org, Joel Becker <jlbec@evilplan.org>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
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

On Tue 17-06-25 06:25:34, Lorenzo Stoakes wrote:
> On Mon, Jun 16, 2025 at 10:11:28PM -0700, Christoph Hellwig wrote:
> > On Mon, Jun 16, 2025 at 08:33:22PM +0100, Lorenzo Stoakes wrote:
> > > Since commit c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file
> > > callback"), the f_op->mmap() hook has been deprecated in favour of
> > > f_op->mmap_prepare().
> > >
> > > Additionally, commit bb666b7c2707 ("mm: add mmap_prepare() compatibility
> > > layer for nested file systems") permits the use of the .mmap_prepare() hook
> > > even in nested filesystems like overlayfs.
> > >
> > > There are a number of places where we check only for f_op->mmap - this is
> > > incorrect now mmap_prepare exists, so update all of these to use the
> > > general helper file_has_valid_mmap_hooks().
> > >
> > > Most notably, this updates the elf logic to allow for the ability to
> > > execute binaries on filesystems which have the .mmap_prepare hook, but
> > > additionally we update nested filesystems.
> >
> > Can you please give the function a better name before spreading it?
> > file operations aren't hooks by any classic definition.
> >
> 
> can_mmap_file()?

I like this name more as well :). With this patch looks good to me. Again a
note that Fixes tag would be probably appropriate for this patch...

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
