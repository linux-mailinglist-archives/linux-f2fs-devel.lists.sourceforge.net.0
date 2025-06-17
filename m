Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD97ADC7BB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 12:13:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2k2+RE7fewyO8H4xHa9mBfRCXShBjicAgag6cXChKH4=; b=jtkD8rWZUOXAATTX3UeJ1M54ME
	zQwIU6y75UpCRXmU33Z0xre/oRL0Z4Fk09aYa9U+VJh2nMkE4tZxfCsYQitXMpXXZX62AP37rQY/X
	MrUs/hUEeYzFnQ0kCEJHz0U4nkbDr3gZdRDXe87pJtH0Fxx9x4TDe10CSLDzeoLQE1RE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRTJP-0008Qu-RT;
	Tue, 17 Jun 2025 10:13:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1uRTJN-0008Qe-I3
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 10:13:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4vW1BLf3KmtZV1m8k5bHUaabgyxSpXUIU3DYk4FH3CY=; b=DsMdXVtGarsxavpCAFYLCCNyUs
 uFVoCOc53oTO0Hs/24qMVeonhEQC6+/3T8uqQpa0q0J53UQmmy0bjbt7qeAd0dzky3nkONc85KdWJ
 tJJG7pzzuMoI/PRP4uXdCZyFKZpMIsX+B7xlTQ82alcVa1HU+SalTMzmm5h3MnHqD628=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4vW1BLf3KmtZV1m8k5bHUaabgyxSpXUIU3DYk4FH3CY=; b=UlkG1b2IBuDem7w4hik5dOQy01
 rZ3X9Y40VgLjQjjxM3ndI1/vIXJ+pguyslhEHw49rICdMLBaMsYjw7de8G5ee/cuhpFaUSVkZy/cU
 L5Cn3NePv2/GNptAbCYIw0Ykfo6YKstTPAWCtDiQjnm42XuX8/Y6bT99YqJncGPgYL6E=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uRTJM-0003iR-Na for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 10:13:01 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0CA06211C6;
 Tue, 17 Jun 2025 10:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1750155169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4vW1BLf3KmtZV1m8k5bHUaabgyxSpXUIU3DYk4FH3CY=;
 b=lYQbxJ10XiF36NJ1nZX42utoD9Yi9TyH4Ri/ANfsedxpT2Cx0Qq8W/p6zKiFmiP7s3zPkO
 vbi/Khf10BE1V8jJeg5U2LP+5M9mZ+tGSED0JBxpGQbaWchHGHnUfgJnCPLHc2FZta69oj
 vTfJbMV67J/+PmBScr0eGy8Ap6QA134=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1750155169;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4vW1BLf3KmtZV1m8k5bHUaabgyxSpXUIU3DYk4FH3CY=;
 b=6Svwy5fMZHrfWJ0JoGLiBFzbzdphbHyONhbgAax6JbhOcNZmQutxQUD0ZOoTNQkgIB0GQQ
 bUpA7yCdSF8Rm6Dw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=lYQbxJ10;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=6Svwy5fM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1750155169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4vW1BLf3KmtZV1m8k5bHUaabgyxSpXUIU3DYk4FH3CY=;
 b=lYQbxJ10XiF36NJ1nZX42utoD9Yi9TyH4Ri/ANfsedxpT2Cx0Qq8W/p6zKiFmiP7s3zPkO
 vbi/Khf10BE1V8jJeg5U2LP+5M9mZ+tGSED0JBxpGQbaWchHGHnUfgJnCPLHc2FZta69oj
 vTfJbMV67J/+PmBScr0eGy8Ap6QA134=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1750155169;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4vW1BLf3KmtZV1m8k5bHUaabgyxSpXUIU3DYk4FH3CY=;
 b=6Svwy5fMZHrfWJ0JoGLiBFzbzdphbHyONhbgAax6JbhOcNZmQutxQUD0ZOoTNQkgIB0GQQ
 bUpA7yCdSF8Rm6Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EF8D713AE1;
 Tue, 17 Jun 2025 10:12:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gIh2OqA/UWgEGQAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 17 Jun 2025 10:12:48 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id A6C44A29F0; Tue, 17 Jun 2025 12:12:48 +0200 (CEST)
Date: Tue, 17 Jun 2025 12:12:48 +0200
From: Jan Kara <jack@suse.cz>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Message-ID: <cxjn2u5nokhbgjvlb5qm6sgcrhbo7o6owhxz6ke5h43tydgrxm@yrcmyxzjzh4n>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
 <30622c1f0b98c66840bc8c02668bda276a810b70.1750099179.git.lorenzo.stoakes@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <30622c1f0b98c66840bc8c02668bda276a810b70.1750099179.git.lorenzo.stoakes@oracle.com>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
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
 MID_RHS_NOT_FQDN(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_COUNT_THREE(0.00)[3]; FUZZY_BLOCKED(0.00)[rspamd.com];
 ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_TLS_LAST(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linux-foundation.org,oracle.com,kernel.dk,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,kernel.org,ionkov.net,codewreck.org,crudebyte.com,suse.com,redhat.com,auristor.com,zeniv.linux.org.uk,suse.cz,kvack.org,szeredi.hu,linux.dev,fb.com,toxicpanda.com,cs.cmu.edu,tyhicks.com,linux.alibaba.com,google.com,huawei.com,samsung.com,sony.com,mit.edu,dilger.ca,mail.parknet.co.jp,dubeyko.com,physik.fu-berlin.de,vivo.com,nod.at,cambridgegreys.com,sipsolutions.net,artax.karlin.mff.cuni.cz,infradead.org,paragon-software.com,fasheh.com,evilplan.org,bobcopeland.com,omnibond.com,samba.org,manguebit.org,microsoft.com,talpey.com,wdc.com,suse.de,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,coda.cs.cmu.edu,lists.ozlabs.org,lists.sourceforge.net,lists.orangefs.org,lists.samba.org];
 RCPT_COUNT_GT_50(0.00)[113]; TO_MATCH_ENVRCPT_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TAGGED_RCPT(0.00)[]; MISSING_XM_UA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; DKIM_TRACE(0.00)[suse.cz:+];
 R_RATELIMIT(0.00)[to_ip_from(RL8arm4hbwhmgx6ohorfcej1yh)];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 0CA06211C6
X-Spam-Score: -0.51
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 16-06-25 20:33:26,
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
X-Headers-End: 1uRTJM-0003iR-Na
Subject: Re: [f2fs-dev] [PATCH 07/10] mm/filemap: introduce
 generic_file_*_mmap_prepare() helpers
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

On Mon 16-06-25 20:33:26, Lorenzo Stoakes wrote:
> Since commit c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file
> callback"), the f_op->mmap() hook has been deprecated in favour of
> f_op->mmap_prepare().
> 
> The generic mmap handlers are very simple, so we can very easily convert
> these in advance of converting file systems which use them.
> 
> This patch does so.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  include/linux/fs.h |  6 ++++--
>  mm/filemap.c       | 29 +++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 7120f80255b3..65cffc445fcc 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -3395,8 +3395,10 @@ extern void inode_add_lru(struct inode *inode);
>  extern int sb_set_blocksize(struct super_block *, int);
>  extern int sb_min_blocksize(struct super_block *, int);
>  
> -extern int generic_file_mmap(struct file *, struct vm_area_struct *);
> -extern int generic_file_readonly_mmap(struct file *, struct vm_area_struct *);
> +int generic_file_mmap(struct file *, struct vm_area_struct *);
> +int generic_file_mmap_prepare(struct vm_area_desc *desc);
> +int generic_file_readonly_mmap(struct file *, struct vm_area_struct *);
> +int generic_file_readonly_mmap_prepare(struct vm_area_desc *desc);
>  extern ssize_t generic_write_checks(struct kiocb *, struct iov_iter *);
>  int generic_write_checks_count(struct kiocb *iocb, loff_t *count);
>  extern int generic_write_check_limits(struct file *file, loff_t pos,
> diff --git a/mm/filemap.c b/mm/filemap.c
> index 93fbc2ef232a..e75608cbf420 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -3847,6 +3847,18 @@ int generic_file_mmap(struct file *file, struct vm_area_struct *vma)
>  	return 0;
>  }
>  
> +int generic_file_mmap_prepare(struct vm_area_desc *desc)
> +{
> +	struct file *file = desc->file;
> +	struct address_space *mapping = file->f_mapping;
> +
> +	if (!mapping->a_ops->read_folio)
> +		return -ENOEXEC;
> +	file_accessed(file);
> +	desc->vm_ops = &generic_file_vm_ops;
> +	return 0;
> +}
> +
>  /*
>   * This is for filesystems which do not implement ->writepage.
>   */
> @@ -3856,6 +3868,13 @@ int generic_file_readonly_mmap(struct file *file, struct vm_area_struct *vma)
>  		return -EINVAL;
>  	return generic_file_mmap(file, vma);
>  }
> +
> +int generic_file_readonly_mmap_prepare(struct vm_area_desc *desc)
> +{
> +	if (is_shared_maywrite(desc->vm_flags))
> +		return -EINVAL;
> +	return generic_file_mmap_prepare(desc);
> +}
>  #else
>  vm_fault_t filemap_page_mkwrite(struct vm_fault *vmf)
>  {
> @@ -3865,15 +3884,25 @@ int generic_file_mmap(struct file *file, struct vm_area_struct *vma)
>  {
>  	return -ENOSYS;
>  }
> +int generic_file_mmap_prepare(struct vm_area_desc *desc)
> +{
> +	return -ENOSYS;
> +}
>  int generic_file_readonly_mmap(struct file *file, struct vm_area_struct *vma)
>  {
>  	return -ENOSYS;
>  }
> +int generic_file_readonly_mmap_prepare(struct vm_area_desc *desc)
> +{
> +	return -ENOSYS;
> +}
>  #endif /* CONFIG_MMU */
>  
>  EXPORT_SYMBOL(filemap_page_mkwrite);
>  EXPORT_SYMBOL(generic_file_mmap);
> +EXPORT_SYMBOL(generic_file_mmap_prepare);
>  EXPORT_SYMBOL(generic_file_readonly_mmap);
> +EXPORT_SYMBOL(generic_file_readonly_mmap_prepare);
>  
>  static struct folio *do_read_cache_folio(struct address_space *mapping,
>  		pgoff_t index, filler_t filler, struct file *file, gfp_t gfp)
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
