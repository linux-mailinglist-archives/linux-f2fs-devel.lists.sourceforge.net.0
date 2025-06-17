Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7625ADC836
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 12:28:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shB25qXaihlj1KdASg06tOCb/iTiA2XdnLC1CMVJMbQ=; b=PNXyvxWv0vnYGo/1fdYVD7bdrF
	mKeVJEysazo/xvs3nQ2+fCCkhTIEeT3j4+Uqkn7Wj+FtVJBQMTjfD4X9ozfdYbrmuDGkje3gZm6hG
	bvxwM9m6lv1311ipp5ttbxA5Zw8uM8CisnH/7EbHsrv+uC8xH1uAA3b/+1P94xQOY+A0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRTYJ-0006Rl-JT;
	Tue, 17 Jun 2025 10:28:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1uRTYH-0006Rf-RN
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 10:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yRL1pzyzWfZkEwjIrh5EPK0DyvqO4jGpH7nTdQIDJOU=; b=DishOerVvhTRtylOCcPZmzn0qo
 ylTAwx/XOXGL3unUpG879F6a/3UKBV8NI7aKP4JNipZMIpb8+ToPj+F54GIC1enYC8YDlRSBOmM+H
 /6k1pxMPIbDR9MfdzAlpeXpQSeokcQ34LrgTJ2RC74BPRjewx/AxlkTT8rynoVcBqSng=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yRL1pzyzWfZkEwjIrh5EPK0DyvqO4jGpH7nTdQIDJOU=; b=Imqkeyo4eeCql41FVEMXqy55aJ
 ZBFr4gNXTstFTGX9NWdOoyJkXFnccsVVu73zDo1tBq4niE92VcLncVp1NOIFz/bzGdyuRHv8fXlVP
 QbyvEB2GiBXKh4hm+79bC9/+ufeGSOfskOzYeBZHYEaWULeAZDxwpiwjIMJLwSP5UZVw=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uRTYH-0004iD-38 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 10:28:25 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BECB9211C4;
 Tue, 17 Jun 2025 10:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1750156098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yRL1pzyzWfZkEwjIrh5EPK0DyvqO4jGpH7nTdQIDJOU=;
 b=WmjG5bytiy7I3a/BBLvW+VsIqotD5+JByi3+kYC+pJMvBTbqXyJesHTAiZz3I9gAH/sqUN
 odZ44BsgYcizKb8oLgEt7TVYvcI+tsVcCM6mtUrfDsIhCmfjtb9owBPB4UGS70/DLklX3/
 Jo0XXlko/aZ2t3BgHpHVI8npx+gZ584=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1750156098;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yRL1pzyzWfZkEwjIrh5EPK0DyvqO4jGpH7nTdQIDJOU=;
 b=pnny5t+1R3s5+oz10RPJdQZOZNrWl6PZC680u7CImBF6HezK9+Kt7F3opuQwryTFcHQpGE
 YCJF0/Vphg/IO3AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1750156097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yRL1pzyzWfZkEwjIrh5EPK0DyvqO4jGpH7nTdQIDJOU=;
 b=V8XAlhZjNOq8a7kiGH50OFfxbQped1myZsJ2VgF89KEp1B7ttzza88fJJmn8NOg1DW9f4B
 dsvPKunu7OasSmWwBpOOEngmUB1By6xbruLi8CNwnB8xMEMKKX3pNnCpg41JdP5EXk1cj4
 +u3B2fWZyjPE8HDYsGAxwXD53Fd47Mk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1750156097;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yRL1pzyzWfZkEwjIrh5EPK0DyvqO4jGpH7nTdQIDJOU=;
 b=ZOSe9hUD5u6zOvVCb2BXorJhOv5ONladUC3MF82cZkGy3ZY15cD1s7zoZ2vwuLM5JGKDm5
 jOxbp0QBEPV9MGAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A12C913AE1;
 Tue, 17 Jun 2025 10:28:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MhydJkFDUWjGHQAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 17 Jun 2025 10:28:17 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 4465FA29F0; Tue, 17 Jun 2025 12:28:17 +0200 (CEST)
Date: Tue, 17 Jun 2025 12:28:17 +0200
From: Jan Kara <jack@suse.cz>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Message-ID: <6nktgdc7ygt6hncfnl33d2jlwvlydspiiklwf6oxiqxxcjhzs2@j6f36ktyv774>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
 <f528ac4f35b9378931bd800920fee53fc0c5c74d.1750099179.git.lorenzo.stoakes@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f528ac4f35b9378931bd800920fee53fc0c5c74d.1750099179.git.lorenzo.stoakes@oracle.com>
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
 MIME_GOOD(-0.10)[text/plain]; FUZZY_BLOCKED(0.00)[rspamd.com];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,oracle.com:email,suse.cz:email,suse.com:email];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; RCVD_TLS_LAST(0.00)[];
 RCVD_COUNT_THREE(0.00)[3]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linux-foundation.org,oracle.com,kernel.dk,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,kernel.org,ionkov.net,codewreck.org,crudebyte.com,suse.com,redhat.com,auristor.com,zeniv.linux.org.uk,suse.cz,kvack.org,szeredi.hu,linux.dev,fb.com,toxicpanda.com,cs.cmu.edu,tyhicks.com,linux.alibaba.com,google.com,huawei.com,samsung.com,sony.com,mit.edu,dilger.ca,mail.parknet.co.jp,dubeyko.com,physik.fu-berlin.de,vivo.com,nod.at,cambridgegreys.com,sipsolutions.net,artax.karlin.mff.cuni.cz,infradead.org,paragon-software.com,fasheh.com,evilplan.org,bobcopeland.com,omnibond.com,samba.org,manguebit.org,microsoft.com,talpey.com,wdc.com,suse.de,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,coda.cs.cmu.edu,lists.ozlabs.org,lists.sourceforge.net,lists.orangefs.org,lists.samba.org];
 RCPT_COUNT_GT_50(0.00)[113]; TO_MATCH_ENVRCPT_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; TO_DN_SOME(0.00)[];
 TAGGED_RCPT(0.00)[]; MISSING_XM_UA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLb58ib84xst5oy51ju4zaburj)];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.30
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 16-06-25 20:33:29,
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uRTYH-0004iD-38
Subject: Re: [f2fs-dev] [PATCH 10/10] fs: replace mmap hook with
 .mmap_prepare for simple mappings
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

On Mon 16-06-25 20:33:29, Lorenzo Stoakes wrote:
> Since commit c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file
> callback"), the f_op->mmap() hook has been deprecated in favour of
> f_op->mmap_prepare().
> 
> This callback is invoked in the mmap() logic far earlier, so error handling
> can be performed more safely without complicated and bug-prone state
> unwinding required should an error arise.
> 
> This hook also avoids passing a pointer to a not-yet-correctly-established
> VMA avoiding any issues with referencing this data structure.
> 
> It rather provides a pointer to the new struct vm_area_desc descriptor type
> which contains all required state and allows easy setting of required
> parameters without any consideration needing to be paid to locking or
> reference counts.
> 
> Note that nested filesystems like overlayfs are compatible with an
> .mmap_prepare() callback since commit bb666b7c2707 ("mm: add mmap_prepare()
> compatibility layer for nested file systems").
> 
> In this patch we apply this change to file systems with relatively simple
> mmap() hook logic - exfat, ceph, f2fs, bcachefs, zonefs, btrfs, ocfs2,
> orangefs, nilfs2, romfs, ramfs and aio.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Two small nits below. Otherwise feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index 60a621b00c65..37522137c380 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -2330,13 +2330,14 @@ static const struct vm_operations_struct ceph_vmops = {
>  	.page_mkwrite	= ceph_page_mkwrite,
>  };
>  
> -int ceph_mmap(struct file *file, struct vm_area_struct *vma)
> +int ceph_mmap_prepare(struct vm_area_desc *desc)
>  {
> +	struct file *file = desc->file;
>  	struct address_space *mapping = file->f_mapping;

Pointless local variable here...

>  
>  	if (!mapping->a_ops->read_folio)
>  		return -ENOEXEC;
> -	vma->vm_ops = &ceph_vmops;
> +	desc->vm_ops = &ceph_vmops;
>  	return 0;
>  }
>  
...
> diff --git a/fs/exfat/file.c b/fs/exfat/file.c
> index 841a5b18e3df..d63213c8a823 100644
> --- a/fs/exfat/file.c
> +++ b/fs/exfat/file.c
> @@ -683,13 +683,14 @@ static const struct vm_operations_struct exfat_file_vm_ops = {
>  	.page_mkwrite	= exfat_page_mkwrite,
>  };
>  
> -static int exfat_file_mmap(struct file *file, struct vm_area_struct *vma)
> +static int exfat_file_mmap_prepare(struct vm_area_desc *desc)
>  {
> +	struct file *file = desc->file;

Missing empty line here.

>  	if (unlikely(exfat_forced_shutdown(file_inode(file)->i_sb)))
>  		return -EIO;
>  
>  	file_accessed(file);
> -	vma->vm_ops = &exfat_file_vm_ops;
> +	desc->vm_ops = &exfat_file_vm_ops;
>  	return 0;
>  }
>  

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
