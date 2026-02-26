Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJZTODpHoGkuhwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 14:14:34 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0E81A6335
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 14:14:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vM1WerpBI0DmNSq9B3Y9MuvSZXsg4Kn0E8pusk6iq/I=; b=X0peD0M/zT9ItrcWjmEQbIEzsE
	kG87ZXlsHk3R7rk0fD3tANfJ7K64vQHZiZnunbe5BOHFKRwEDg80C5FRSz7OEvCTqt1lULGhF3bPk
	lQoDSvec0ALK8U4haKDl3fC2ufZMRnNR5vJJA6OhpI9tPMAQ0FcGLz7rB9OvHEje0ohY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvbCE-0006em-Lj;
	Thu, 26 Feb 2026 13:14:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vvbCD-0006eg-36
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Feb 2026 13:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n1GVrJkaq5WHGx+GWTcqrATUrcyExqNgPTLvNqarQAI=; b=gZgQt+S6h+9sH83FjouZdrlNgy
 exdBLoaPuUQKwowFZ5ZdqKZS23sbpGj7VCa7xCmtEmHrD4oVNbEftkaAbnv+Q4PchDVKuu7+WoM05
 LEr1N4oOUYva0CUBb0lbHgbtHhHHBSs/JblCPiaS9ZrZ/rAyfh7RiIf/a9xHimU5IbYo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n1GVrJkaq5WHGx+GWTcqrATUrcyExqNgPTLvNqarQAI=; b=b2dm5wP96Bf7bX990JRo2qynJ5
 V6FRUI1J1yldJMrjCzrtWyxoSSmnfYSGL37rCHEx0miFy+CaOSloTARFzVAv7MOXQDsziCYD0uMDe
 Tzggz+cTaKyCKeFUvLn8odE/o2Z3GfNABdTwYUHSYtdyxl3Luotb8HKLiksh25esv3RY=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vvbCC-0001L1-5e for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Feb 2026 13:14:25 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A8CE71FA9C;
 Thu, 26 Feb 2026 13:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772111652; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n1GVrJkaq5WHGx+GWTcqrATUrcyExqNgPTLvNqarQAI=;
 b=RkX1tfVZOKSFeTpXbKMSQrkjS8DiWF9dl6iG0MTuiEWPjIfb7l+c9Vxhe07l9C5XMYN+gq
 D6fFh6GAOsTvBGyrY/2NpAOu2pS+8IGxhGKqDfTKmEuBb//COrtz1HtBtOzt2lTFL1PkJf
 QFtiVqtzIrIdFKM9Z8uJ33qtde+B86A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772111652;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n1GVrJkaq5WHGx+GWTcqrATUrcyExqNgPTLvNqarQAI=;
 b=ZzDwtMmLuCzQkg6CPTLYsjjNmtRbjAn3ogJRQxgqjMgB86XX3cbyMVsTJCOONSEsgoVml5
 0daFFWnfXwuUsnCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772111652; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n1GVrJkaq5WHGx+GWTcqrATUrcyExqNgPTLvNqarQAI=;
 b=RkX1tfVZOKSFeTpXbKMSQrkjS8DiWF9dl6iG0MTuiEWPjIfb7l+c9Vxhe07l9C5XMYN+gq
 D6fFh6GAOsTvBGyrY/2NpAOu2pS+8IGxhGKqDfTKmEuBb//COrtz1HtBtOzt2lTFL1PkJf
 QFtiVqtzIrIdFKM9Z8uJ33qtde+B86A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772111652;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n1GVrJkaq5WHGx+GWTcqrATUrcyExqNgPTLvNqarQAI=;
 b=ZzDwtMmLuCzQkg6CPTLYsjjNmtRbjAn3ogJRQxgqjMgB86XX3cbyMVsTJCOONSEsgoVml5
 0daFFWnfXwuUsnCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 969ED3EA62;
 Thu, 26 Feb 2026 13:14:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id XEjAJCRHoGkgSQAAD6G6ig
 (envelope-from <jack@suse.cz>); Thu, 26 Feb 2026 13:14:12 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 5EDF1A0A27; Thu, 26 Feb 2026 14:14:12 +0100 (CET)
Date: Thu, 26 Feb 2026 14:14:12 +0100
From: Jan Kara <jack@suse.cz>
To: Tal Zussman <tz2294@columbia.edu>
Message-ID: <xcmjnkxgv5qzhqouj7dk3hqrd452crzosc74lyo53iqzeicepe@d6aoxuglacqo>
References: <20260225-pagevec_cleanup-v2-0-716868cc2d11@columbia.edu>
 <20260225-pagevec_cleanup-v2-4-716868cc2d11@columbia.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260225-pagevec_cleanup-v2-4-716868cc2d11@columbia.edu>
X-Spam-Flag: NO
X-Spam-Score: -2.30
X-Spam-Level: 
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 25-02-26 18:44:28, Tal Zussman wrote: > struct pagevec
 no longer exists. Rename the macro appropriately. > > Signed-off-by: Tal
 Zussman <tz2294@columbia.edu> Looks good. Feel free to add: Reviewed-by: Jan
 Kara <jack@suse.cz> 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1vvbCC-0001L1-5e
Subject: Re: [f2fs-dev] [PATCH v2 4/4] folio_batch: Rename PAGEVEC_SIZE to
 FOLIO_BATCH_SIZE
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
Cc: nvdimm@lists.linux.dev, Paulo Alcantara <pc@manguebit.org>,
 "Darrick J. Wong" <djwong@kernel.org>, dri-devel@lists.freedesktop.org,
 ceph-devel@vger.kernel.org, linux-xfs@vger.kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Brendan Jackman <jackmanb@google.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Zi Yan <ziy@nvidia.com>, Shyam Prasad N <sprasad@microsoft.com>,
 Chris Li <chrisl@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 David Hildenbrand <david@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 Chuck Lever <chuck.lever@oracle.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>, samba-technical@lists.samba.org,
 Simona Vetter <simona@ffwll.ch>, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>,
 Hugh Dickins <hughd@google.com>, Olga Kornievskaia <okorniev@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, ocfs2-devel@lists.linux.dev,
 Jani Nikula <jani.nikula@linux.intel.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Barry Song <baohua@kernel.org>, Kairui Song <kasong@tencent.com>,
 Theodore Ts'o <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>,
 linux-f2fs-devel@lists.sourceforge.net, Anna Schumaker <anna@kernel.org>,
 Alex Markuze <amarkuze@redhat.com>, Kemeng Shi <shikemeng@huaweicloud.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Peter Xu <peterx@redhat.com>, Chris Mason <clm@fb.com>,
 Pedro Falcato <pfalcato@suse.de>, Marc Dionne <marc.dionne@auristor.com>,
 linux-afs@lists.infradead.org, Baoquan He <bhe@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, Viacheslav Dubeyko <slava@dubeyko.com>,
 NeilBrown <neil@brown.name>, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, cgroups@vger.kernel.org,
 Shakeel Butt <shakeel.butt@linux.dev>, Dan Williams <dan.j.williams@intel.com>,
 Oscar Salvador <osalvador@suse.de>, gfs2@lists.linux.dev,
 linux-nfs@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>, linux-mm@kvack.org,
 Jeff Layton <jlayton@kernel.org>, Steve French <sfrench@samba.org>,
 netfs@lists.linux.dev, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Qi Zheng <zhengqi.arch@bytedance.com>, Yuanchu Xie <yuanchu@google.com>,
 David Howells <dhowells@redhat.com>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, David Airlie <airlied@gmail.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Mark Fasheh <mark@fasheh.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Axel Rasmussen <axelrasmussen@google.com>, Jann Horn <jannh@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Tom Talpey <tom@talpey.com>,
 Bharath SM <bharathsm@microsoft.com>, David Sterba <dsterba@suse.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Wei Xu <weixugc@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tz2294@columbia.edu,m:nvdimm@lists.linux.dev,m:pc@manguebit.org,m:djwong@kernel.org,m:dri-devel@lists.freedesktop.org,m:ceph-devel@vger.kernel.org,m:linux-xfs@vger.kernel.org,m:lorenzo.stoakes@oracle.com,m:jackmanb@google.com,m:tursulin@ursulin.net,m:ziy@nvidia.com,m:sprasad@microsoft.com,m:chrisl@kernel.org,m:jhubbard@nvidia.com,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:david@kernel.org,m:surenb@google.com,m:brauner@kernel.org,m:linux-kernel@vger.kernel.org,m:chuck.lever@oracle.com,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:trondmy@kernel.org,m:samba-technical@lists.samba.org,m:simona@ffwll.ch,m:linux-cifs@vger.kernel.org,m:linux-nilfs@vger.kernel.org,m:vbabka@kernel.org,m:hughd@google.com,m:okorniev@redhat.com,m:mripard@kernel.org,m:ocfs2-devel@lists.linux.dev,m:jani.nikula@linux.intel.com,m:jaegeuk@kernel.org,m:baohua@kernel.org,m:kasong@tencent.com,m:tytso@mit.edu,m:muchun.song@linux.dev,m:linux-f2fs-devel@lists.sourcefor
 ge.net,m:anna@kernel.org,m:amarkuze@redhat.com,m:shikemeng@huaweicloud.com,m:joonas.lahtinen@linux.intel.com,m:peterx@redhat.com,m:clm@fb.com,m:pfalcato@suse.de,m:marc.dionne@auristor.com,m:linux-afs@lists.infradead.org,m:bhe@redhat.com,m:willy@infradead.org,m:slava@dubeyko.com,m:neil@brown.name,m:idryomov@gmail.com,m:linux-ext4@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:baolin.wang@linux.alibaba.com,m:rodrigo.vivi@intel.com,m:cgroups@vger.kernel.org,m:shakeel.butt@linux.dev,m:dan.j.williams@intel.com,m:osalvador@suse.de,m:gfs2@lists.linux.dev,m:linux-nfs@vger.kernel.org,m:nphamcs@gmail.com,m:linux-mm@kvack.org,m:jlayton@kernel.org,m:sfrench@samba.org,m:netfs@lists.linux.dev,m:rppt@kernel.org,m:mhocko@suse.com,m:jack@suse.cz,m:roman.gushchin@linux.dev,m:zhengqi.arch@bytedance.com,m:yuanchu@google.com,m:dhowells@redhat.com,m:joseph.qi@linux.alibaba.com,m:adilger.kernel@dilger.ca,m:airlied@gmail.com,m:agruenba@redhat.com,m:mark@fasheh.com,m:Dai.Ngo@oracle.com,m:jgg@ziepe.ca,m
 :axelrasmussen@google.com,m:jannh@google.com,m:maarten.lankhorst@linux.intel.com,m:Liam.Howlett@oracle.com,m:tom@talpey.com,m:bharathsm@microsoft.com,m:dsterba@suse.com,m:konishi.ryusuke@gmail.com,m:weixugc@google.com,m:tzimmermann@suse.de,m:hannes@cmpxchg.org,m:linux-btrfs@vger.kernel.org,m:jlbec@evilplan.org,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,suse.cz:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,columbia.edu:email];
	RCPT_COUNT_GT_50(0.00)[96];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[lists.linux.dev,manguebit.org,kernel.org,lists.freedesktop.org,vger.kernel.org,oracle.com,google.com,ursulin.net,nvidia.com,microsoft.com,zeniv.linux.org.uk,gmail.com,linux-foundation.org,lists.samba.org,ffwll.ch,redhat.com,linux.intel.com,tencent.com,mit.edu,linux.dev,lists.sourceforge.net,huaweicloud.com,fb.com,suse.de,auristor.com,lists.infradead.org,infradead.org,dubeyko.com,brown.name,linux.alibaba.com,intel.com,kvack.org,samba.org,suse.com,suse.cz,bytedance.com,dilger.ca,fasheh.com,ziepe.ca,talpey.com,cmpxchg.org,evilplan.org];
	NEURAL_HAM(-0.00)[-0.980];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0E0E81A6335
X-Rspamd-Action: no action

On Wed 25-02-26 18:44:28, Tal Zussman wrote:
> struct pagevec no longer exists. Rename the macro appropriately.
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/btrfs/extent_io.c        | 4 ++--
>  include/linux/folio_batch.h | 6 +++---
>  include/linux/folio_queue.h | 6 +++---
>  mm/shmem.c                  | 4 ++--
>  mm/swap.c                   | 2 +-
>  mm/swap_state.c             | 2 +-
>  mm/truncate.c               | 6 +++---
>  7 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
> index c373d113f1e7..d82ca509503f 100644
> --- a/fs/btrfs/extent_io.c
> +++ b/fs/btrfs/extent_io.c
> @@ -2095,13 +2095,13 @@ static void buffer_tree_tag_for_writeback(struct btrfs_fs_info *fs_info,
>  struct eb_batch {
>  	unsigned int nr;
>  	unsigned int cur;
> -	struct extent_buffer *ebs[PAGEVEC_SIZE];
> +	struct extent_buffer *ebs[FOLIO_BATCH_SIZE];
>  };
>  
>  static inline bool eb_batch_add(struct eb_batch *batch, struct extent_buffer *eb)
>  {
>  	batch->ebs[batch->nr++] = eb;
> -	return (batch->nr < PAGEVEC_SIZE);
> +	return (batch->nr < FOLIO_BATCH_SIZE);
>  }
>  
>  static inline void eb_batch_init(struct eb_batch *batch)
> diff --git a/include/linux/folio_batch.h b/include/linux/folio_batch.h
> index a2f3d3043f7e..b45946adc50b 100644
> --- a/include/linux/folio_batch.h
> +++ b/include/linux/folio_batch.h
> @@ -12,7 +12,7 @@
>  #include <linux/types.h>
>  
>  /* 31 pointers + header align the folio_batch structure to a power of two */
> -#define PAGEVEC_SIZE	31
> +#define FOLIO_BATCH_SIZE	31
>  
>  struct folio;
>  
> @@ -29,7 +29,7 @@ struct folio_batch {
>  	unsigned char nr;
>  	unsigned char i;
>  	bool percpu_pvec_drained;
> -	struct folio *folios[PAGEVEC_SIZE];
> +	struct folio *folios[FOLIO_BATCH_SIZE];
>  };
>  
>  /**
> @@ -58,7 +58,7 @@ static inline unsigned int folio_batch_count(const struct folio_batch *fbatch)
>  
>  static inline unsigned int folio_batch_space(const struct folio_batch *fbatch)
>  {
> -	return PAGEVEC_SIZE - fbatch->nr;
> +	return FOLIO_BATCH_SIZE - fbatch->nr;
>  }
>  
>  /**
> diff --git a/include/linux/folio_queue.h b/include/linux/folio_queue.h
> index 0d3765fa9d1d..f6d5f1f127c9 100644
> --- a/include/linux/folio_queue.h
> +++ b/include/linux/folio_queue.h
> @@ -29,12 +29,12 @@
>   */
>  struct folio_queue {
>  	struct folio_batch	vec;		/* Folios in the queue segment */
> -	u8			orders[PAGEVEC_SIZE]; /* Order of each folio */
> +	u8			orders[FOLIO_BATCH_SIZE]; /* Order of each folio */
>  	struct folio_queue	*next;		/* Next queue segment or NULL */
>  	struct folio_queue	*prev;		/* Previous queue segment of NULL */
>  	unsigned long		marks;		/* 1-bit mark per folio */
>  	unsigned long		marks2;		/* Second 1-bit mark per folio */
> -#if PAGEVEC_SIZE > BITS_PER_LONG
> +#if FOLIO_BATCH_SIZE > BITS_PER_LONG
>  #error marks is not big enough
>  #endif
>  	unsigned int		rreq_id;
> @@ -70,7 +70,7 @@ static inline void folioq_init(struct folio_queue *folioq, unsigned int rreq_id)
>   */
>  static inline unsigned int folioq_nr_slots(const struct folio_queue *folioq)
>  {
> -	return PAGEVEC_SIZE;
> +	return FOLIO_BATCH_SIZE;
>  }
>  
>  /**
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 149fdb051170..5e7dcf5bc5d3 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -1113,7 +1113,7 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, uoff_t lend,
>  	pgoff_t start = (lstart + PAGE_SIZE - 1) >> PAGE_SHIFT;
>  	pgoff_t end = (lend + 1) >> PAGE_SHIFT;
>  	struct folio_batch fbatch;
> -	pgoff_t indices[PAGEVEC_SIZE];
> +	pgoff_t indices[FOLIO_BATCH_SIZE];
>  	struct folio *folio;
>  	bool same_folio;
>  	long nr_swaps_freed = 0;
> @@ -1510,7 +1510,7 @@ static int shmem_unuse_inode(struct inode *inode, unsigned int type)
>  	struct address_space *mapping = inode->i_mapping;
>  	pgoff_t start = 0;
>  	struct folio_batch fbatch;
> -	pgoff_t indices[PAGEVEC_SIZE];
> +	pgoff_t indices[FOLIO_BATCH_SIZE];
>  	int ret = 0;
>  
>  	do {
> diff --git a/mm/swap.c b/mm/swap.c
> index 2e517ede6561..78b4aa811fc6 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -1018,7 +1018,7 @@ EXPORT_SYMBOL(folios_put_refs);
>  void release_pages(release_pages_arg arg, int nr)
>  {
>  	struct folio_batch fbatch;
> -	int refs[PAGEVEC_SIZE];
> +	int refs[FOLIO_BATCH_SIZE];
>  	struct encoded_page **encoded = arg.encoded_pages;
>  	int i;
>  
> diff --git a/mm/swap_state.c b/mm/swap_state.c
> index a0c64db2b275..6313b59d7eab 100644
> --- a/mm/swap_state.c
> +++ b/mm/swap_state.c
> @@ -385,7 +385,7 @@ void free_folio_and_swap_cache(struct folio *folio)
>  void free_pages_and_swap_cache(struct encoded_page **pages, int nr)
>  {
>  	struct folio_batch folios;
> -	unsigned int refs[PAGEVEC_SIZE];
> +	unsigned int refs[FOLIO_BATCH_SIZE];
>  
>  	folio_batch_init(&folios);
>  	for (int i = 0; i < nr; i++) {
> diff --git a/mm/truncate.c b/mm/truncate.c
> index df0b7a7e6aff..2931d66c16d0 100644
> --- a/mm/truncate.c
> +++ b/mm/truncate.c
> @@ -369,7 +369,7 @@ void truncate_inode_pages_range(struct address_space *mapping,
>  	pgoff_t		start;		/* inclusive */
>  	pgoff_t		end;		/* exclusive */
>  	struct folio_batch fbatch;
> -	pgoff_t		indices[PAGEVEC_SIZE];
> +	pgoff_t		indices[FOLIO_BATCH_SIZE];
>  	pgoff_t		index;
>  	int		i;
>  	struct folio	*folio;
> @@ -534,7 +534,7 @@ EXPORT_SYMBOL(truncate_inode_pages_final);
>  unsigned long mapping_try_invalidate(struct address_space *mapping,
>  		pgoff_t start, pgoff_t end, unsigned long *nr_failed)
>  {
> -	pgoff_t indices[PAGEVEC_SIZE];
> +	pgoff_t indices[FOLIO_BATCH_SIZE];
>  	struct folio_batch fbatch;
>  	pgoff_t index = start;
>  	unsigned long ret;
> @@ -672,7 +672,7 @@ int folio_unmap_invalidate(struct address_space *mapping, struct folio *folio,
>  int invalidate_inode_pages2_range(struct address_space *mapping,
>  				  pgoff_t start, pgoff_t end)
>  {
> -	pgoff_t indices[PAGEVEC_SIZE];
> +	pgoff_t indices[FOLIO_BATCH_SIZE];
>  	struct folio_batch fbatch;
>  	pgoff_t index;
>  	int i;
> 
> -- 
> 2.39.5
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
