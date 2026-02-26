Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPw/MUhHoGk9hwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 14:14:48 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C30F51A6356
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 14:14:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1InfVLThoMq27ltrPVx7+mETyDolwy4JBoxFXQMjvhg=; b=eGqhI70ii27KJGIcQRK5uMoYZa
	TQ7Vh/eabriR5IpZS7mTcGq0hos//zpBOgsF+YWguDUaG8o+l85VdT5hLg9b2qD6IY0QDmrBPxyF/
	tphXFlJMBz0o6PBvjCDgH4y60SSI9OhPv9A2j18bMrZVn0v7w8yTmM74oGRL1kz3sKRQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvbCR-0007zi-5h;
	Thu, 26 Feb 2026 13:14:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vvbCQ-0007zc-CY
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Feb 2026 13:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HGlBY3HX0Fk8rDjUuw9CIjH8eNDH8K3OHId4Pn3yGbk=; b=co+CvqwTCkU6R8GkwC7eWOA8cE
 uZf1N8njxU/VklNvZBpD2vppCtg+vOq7kFXx7mgSI2C/77Xio3B8IjfqageZEChXF5+trsFGTwFDy
 KQ/YYgKitowmquT6Z4VsHRByLj5p3JHetJuCaR48fvTByd7IRj9Q1yIO1ye4tA9VzqTU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HGlBY3HX0Fk8rDjUuw9CIjH8eNDH8K3OHId4Pn3yGbk=; b=YALBewZ/yYLI4vkphHPu3s7rYz
 bdl0hK9UMLRCoak3tF85j2X7uYxqMFzYStJu4EbTxt7BeTaYMS6BP4+fnfuaBNEsLE51IT8xIqXRz
 /jU+I8vyLCGGI0BqBRvR7p23tLEjL3seUTZHgXpIFr/zVafahlUDsBM01ZNtCq8imRTs=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vvbCO-0001Lz-T1 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Feb 2026 13:14:38 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5B9321FA9C;
 Thu, 26 Feb 2026 13:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772111670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HGlBY3HX0Fk8rDjUuw9CIjH8eNDH8K3OHId4Pn3yGbk=;
 b=j4vB+WEv4y1kWINxinp4K5xHq4qNb6QVbszMDLqe2cOmCXQLmMpXqNvER/OkhmttaJ6mPq
 PO01afqr65QPKR1hJWaE47l5VUFop/tmqYFDkH4sSQUZZZeg7/lDtJZsn2OcgnXG+FYJDS
 3INSe7CY01YA4kqSgq+DkN654M2Qyxw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772111670;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HGlBY3HX0Fk8rDjUuw9CIjH8eNDH8K3OHId4Pn3yGbk=;
 b=kBe6FnbufQIISa9ZmB+PWU8oz7ztKwnEgGv0N1JRe7WMUc2sHPuXsS0oQ8TVFsDL/6jtgY
 2lICg1SqBVAhN4AQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=NCKzskdH;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=f6cNY8PR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772111669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HGlBY3HX0Fk8rDjUuw9CIjH8eNDH8K3OHId4Pn3yGbk=;
 b=NCKzskdH3Dy9QkXFKg6glqlZZJMWI3MXryoRpFrE7Iit1rKhU2WrNQBlfY9I3bU0B487TK
 6aGiULbesLFXLotF7xJ+ZK2Ju/0lIZWQk0HZ965fTf9rNQVLJ/PzIypOaoD4zqVV/0nUke
 /rhJu7zUhkqh0wX6hDqb69mEKV4NGDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772111669;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HGlBY3HX0Fk8rDjUuw9CIjH8eNDH8K3OHId4Pn3yGbk=;
 b=f6cNY8PR5Z08eNP9jW47F6KDNGFWkowV9LekH5eRsIayHKjssiYBUujUagUXY+lgyn3b9l
 0ggVAJZEZsV4TbCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 491E33EA69;
 Thu, 26 Feb 2026 13:14:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id rlXWETVHoGlUSQAAD6G6ig
 (envelope-from <jack@suse.cz>); Thu, 26 Feb 2026 13:14:29 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 07D78A0A27; Thu, 26 Feb 2026 14:14:25 +0100 (CET)
Date: Thu, 26 Feb 2026 14:14:24 +0100
From: Jan Kara <jack@suse.cz>
To: Tal Zussman <tz2294@columbia.edu>
Message-ID: <zggxppyvd5ik5grjxcrhw6yc4q3w4ktiipv7qbxwlskv3l4uf2@wbrqoqvpzcul>
References: <20260225-pagevec_cleanup-v2-0-716868cc2d11@columbia.edu>
 <20260225-pagevec_cleanup-v2-3-716868cc2d11@columbia.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260225-pagevec_cleanup-v2-3-716868cc2d11@columbia.edu>
X-Spam-Flag: NO
X-Spam-Score: -2.51
X-Spam-Level: 
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 25-02-26 18:44:27, Tal Zussman wrote: > struct pagevec
 was removed in commit 1e0877d58b1e ("mm: remove struct > pagevec"). Rename
 include/linux/pagevec.h to reflect reality and update > include [...] 
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
X-Headers-End: 1vvbCO-0001Lz-T1
Subject: Re: [f2fs-dev] [PATCH v2 3/4] folio_batch: Rename pagevec.h to
 folio_batch.h
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[columbia.edu:email,suse.com:email,linux-mm.org:url,kvack.org:email,suse.cz:email];
	RCPT_COUNT_GT_50(0.00)[96];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[lists.linux.dev,manguebit.org,kernel.org,lists.freedesktop.org,vger.kernel.org,oracle.com,google.com,ursulin.net,nvidia.com,microsoft.com,zeniv.linux.org.uk,gmail.com,linux-foundation.org,lists.samba.org,ffwll.ch,redhat.com,linux.intel.com,tencent.com,mit.edu,linux.dev,lists.sourceforge.net,huaweicloud.com,fb.com,suse.de,auristor.com,lists.infradead.org,infradead.org,dubeyko.com,brown.name,linux.alibaba.com,intel.com,kvack.org,samba.org,suse.com,suse.cz,bytedance.com,dilger.ca,fasheh.com,ziepe.ca,talpey.com,cmpxchg.org,evilplan.org];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C30F51A6356
X-Rspamd-Action: no action

On Wed 25-02-26 18:44:27, Tal Zussman wrote:
> struct pagevec was removed in commit 1e0877d58b1e ("mm: remove struct
> pagevec"). Rename include/linux/pagevec.h to reflect reality and update
> includes tree-wide. Add the new filename to MAINTAINERS explicitly, as
> it no longer matches the "include/linux/page[-_]*" pattern in MEMORY
> MANAGEMENT - CORE.
> =

> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  MAINTAINERS                                | 1 +
>  drivers/gpu/drm/drm_gem.c                  | 2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c  | 2 +-
>  drivers/gpu/drm/i915/gt/intel_gtt.h        | 2 +-
>  drivers/gpu/drm/i915/i915_gpu_error.c      | 2 +-
>  fs/btrfs/compression.c                     | 2 +-
>  fs/btrfs/extent_io.c                       | 2 +-
>  fs/btrfs/tests/extent-io-tests.c           | 2 +-
>  fs/buffer.c                                | 2 +-
>  fs/ceph/addr.c                             | 2 +-
>  fs/ext4/inode.c                            | 2 +-
>  fs/f2fs/checkpoint.c                       | 2 +-
>  fs/f2fs/compress.c                         | 2 +-
>  fs/f2fs/data.c                             | 2 +-
>  fs/f2fs/node.c                             | 2 +-
>  fs/gfs2/aops.c                             | 2 +-
>  fs/hugetlbfs/inode.c                       | 2 +-
>  fs/nilfs2/btree.c                          | 2 +-
>  fs/nilfs2/page.c                           | 2 +-
>  fs/nilfs2/segment.c                        | 2 +-
>  fs/ramfs/file-nommu.c                      | 2 +-
>  include/linux/{pagevec.h =3D> folio_batch.h} | 8 ++++----
>  include/linux/folio_queue.h                | 2 +-
>  include/linux/iomap.h                      | 2 +-
>  include/linux/sunrpc/svc.h                 | 2 +-
>  include/linux/writeback.h                  | 2 +-
>  mm/filemap.c                               | 2 +-
>  mm/gup.c                                   | 2 +-
>  mm/memcontrol.c                            | 2 +-
>  mm/mlock.c                                 | 2 +-
>  mm/page-writeback.c                        | 2 +-
>  mm/page_alloc.c                            | 2 +-
>  mm/shmem.c                                 | 2 +-
>  mm/swap.c                                  | 2 +-
>  mm/swap_state.c                            | 2 +-
>  mm/truncate.c                              | 2 +-
>  mm/vmscan.c                                | 2 +-
>  37 files changed, 40 insertions(+), 39 deletions(-)
> =

> diff --git a/MAINTAINERS b/MAINTAINERS
> index e4572a36afd2..f50421e65cb1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16664,6 +16664,7 @@ L:	linux-mm@kvack.org
>  S:	Maintained
>  W:	http://www.linux-mm.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	include/linux/folio_batch.h
>  F:	include/linux/gfp.h
>  F:	include/linux/gfp_types.h
>  F:	include/linux/highmem.h
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 891c3bff5ae0..dc4534fb175c 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -38,7 +38,7 @@
>  #include <linux/mman.h>
>  #include <linux/module.h>
>  #include <linux/pagemap.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/sched/mm.h>
>  #include <linux/shmem_fs.h>
>  #include <linux/slab.h>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/=
i915/gem/i915_gem_shmem.c
> index c6c64ba29bc4..07025b547c94 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -3,7 +3,7 @@
>   * Copyright =A9 2014-2016 Intel Corporation
>   */
>  =

> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/shmem_fs.h>
>  #include <linux/swap.h>
>  #include <linux/uio.h>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/g=
t/intel_gtt.h
> index 9d3a3ad567a0..b54ee4f25af1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -19,7 +19,7 @@
>  #include <linux/io-mapping.h>
>  #include <linux/kref.h>
>  #include <linux/mm.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/scatterlist.h>
>  #include <linux/workqueue.h>
>  =

> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915=
/i915_gpu_error.c
> index a99b4e45d26c..ffe5f24594c9 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -31,7 +31,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/highmem.h>
>  #include <linux/nmi.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/scatterlist.h>
>  #include <linux/string_helpers.h>
>  #include <linux/utsname.h>
> diff --git a/fs/btrfs/compression.c b/fs/btrfs/compression.c
> index 790518a8c803..dbc634d10ad3 100644
> --- a/fs/btrfs/compression.c
> +++ b/fs/btrfs/compression.c
> @@ -8,7 +8,7 @@
>  #include <linux/file.h>
>  #include <linux/fs.h>
>  #include <linux/pagemap.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/highmem.h>
>  #include <linux/kthread.h>
>  #include <linux/time.h>
> diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
> index 744a1fff6eef..c373d113f1e7 100644
> --- a/fs/btrfs/extent_io.c
> +++ b/fs/btrfs/extent_io.c
> @@ -11,7 +11,7 @@
>  #include <linux/blkdev.h>
>  #include <linux/swap.h>
>  #include <linux/writeback.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/prefetch.h>
>  #include <linux/fsverity.h>
>  #include "extent_io.h"
> diff --git a/fs/btrfs/tests/extent-io-tests.c b/fs/btrfs/tests/extent-io-=
tests.c
> index a0187d6163df..b2aacf846c8b 100644
> --- a/fs/btrfs/tests/extent-io-tests.c
> +++ b/fs/btrfs/tests/extent-io-tests.c
> @@ -4,7 +4,7 @@
>   */
>  =

>  #include <linux/pagemap.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/sched.h>
>  #include <linux/slab.h>
>  #include <linux/sizes.h>
> diff --git a/fs/buffer.c b/fs/buffer.c
> index 22b43642ba57..f3122160ee2d 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -45,7 +45,7 @@
>  #include <linux/bitops.h>
>  #include <linux/mpage.h>
>  #include <linux/bit_spinlock.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/sched/mm.h>
>  #include <trace/events/block.h>
>  #include <linux/fscrypt.h>
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index e87b3bb94ee8..2803511d86ef 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -7,7 +7,7 @@
>  #include <linux/swap.h>
>  #include <linux/pagemap.h>
>  #include <linux/slab.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/task_io_accounting_ops.h>
>  #include <linux/signal.h>
>  #include <linux/iversion.h>
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index 396dc3a5d16b..58f982885187 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -29,7 +29,7 @@
>  #include <linux/string.h>
>  #include <linux/buffer_head.h>
>  #include <linux/writeback.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/mpage.h>
>  #include <linux/rmap.h>
>  #include <linux/namei.h>
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 6dd39b7de11a..0143365c07dc 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -11,7 +11,7 @@
>  #include <linux/writeback.h>
>  #include <linux/blkdev.h>
>  #include <linux/f2fs_fs.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/swap.h>
>  #include <linux/kthread.h>
>  #include <linux/delayacct.h>
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 8c76400ba631..614e00b8ffdc 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -13,7 +13,7 @@
>  #include <linux/lzo.h>
>  #include <linux/lz4.h>
>  #include <linux/zstd.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  =

>  #include "f2fs.h"
>  #include "node.h"
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 338df7a2aea6..90e8ef625d82 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -10,7 +10,7 @@
>  #include <linux/sched/mm.h>
>  #include <linux/mpage.h>
>  #include <linux/writeback.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/blkdev.h>
>  #include <linux/bio.h>
>  #include <linux/blk-crypto.h>
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 74992fd9c9b6..ba0272314528 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -10,7 +10,7 @@
>  #include <linux/mpage.h>
>  #include <linux/sched/mm.h>
>  #include <linux/blkdev.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/swap.h>
>  =

>  #include "f2fs.h"
> diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
> index e79ad087512a..dae3dc4ee6f7 100644
> --- a/fs/gfs2/aops.c
> +++ b/fs/gfs2/aops.c
> @@ -10,7 +10,7 @@
>  #include <linux/completion.h>
>  #include <linux/buffer_head.h>
>  #include <linux/pagemap.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/mpage.h>
>  #include <linux/fs.h>
>  #include <linux/writeback.h>
> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
> index 22c799000edb..2ec3e4231252 100644
> --- a/fs/hugetlbfs/inode.c
> +++ b/fs/hugetlbfs/inode.c
> @@ -25,7 +25,7 @@
>  #include <linux/ctype.h>
>  #include <linux/backing-dev.h>
>  #include <linux/hugetlb.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/fs_parser.h>
>  #include <linux/mman.h>
>  #include <linux/slab.h>
> diff --git a/fs/nilfs2/btree.c b/fs/nilfs2/btree.c
> index dd0c8e560ef6..b400cfcdc803 100644
> --- a/fs/nilfs2/btree.c
> +++ b/fs/nilfs2/btree.c
> @@ -10,7 +10,7 @@
>  #include <linux/slab.h>
>  #include <linux/string.h>
>  #include <linux/errno.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include "nilfs.h"
>  #include "page.h"
>  #include "btnode.h"
> diff --git a/fs/nilfs2/page.c b/fs/nilfs2/page.c
> index 56c4da417b6a..a9d8aa65416f 100644
> --- a/fs/nilfs2/page.c
> +++ b/fs/nilfs2/page.c
> @@ -14,7 +14,7 @@
>  #include <linux/page-flags.h>
>  #include <linux/list.h>
>  #include <linux/highmem.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/gfp.h>
>  #include "nilfs.h"
>  #include "page.h"
> diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
> index 098a3bd103e0..6d62de64a309 100644
> --- a/fs/nilfs2/segment.c
> +++ b/fs/nilfs2/segment.c
> @@ -19,7 +19,7 @@
>  #include <linux/freezer.h>
>  #include <linux/kthread.h>
>  #include <linux/crc32.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/slab.h>
>  #include <linux/sched/signal.h>
>  =

> diff --git a/fs/ramfs/file-nommu.c b/fs/ramfs/file-nommu.c
> index 0f8e838ece07..2f79bcb89d2e 100644
> --- a/fs/ramfs/file-nommu.c
> +++ b/fs/ramfs/file-nommu.c
> @@ -14,7 +14,7 @@
>  #include <linux/string.h>
>  #include <linux/backing-dev.h>
>  #include <linux/ramfs.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/mman.h>
>  #include <linux/sched.h>
>  #include <linux/slab.h>
> diff --git a/include/linux/pagevec.h b/include/linux/folio_batch.h
> similarity index 95%
> rename from include/linux/pagevec.h
> rename to include/linux/folio_batch.h
> index 007affabf335..a2f3d3043f7e 100644
> --- a/include/linux/pagevec.h
> +++ b/include/linux/folio_batch.h
> @@ -1,13 +1,13 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  /*
> - * include/linux/pagevec.h
> + * include/linux/folio_batch.h
>   *
>   * In many places it is efficient to batch an operation up against multi=
ple
>   * folios.  A folio_batch is a container which is used for that.
>   */
>  =

> -#ifndef _LINUX_PAGEVEC_H
> -#define _LINUX_PAGEVEC_H
> +#ifndef _LINUX_FOLIO_BATCH_H
> +#define _LINUX_FOLIO_BATCH_H
>  =

>  #include <linux/types.h>
>  =

> @@ -102,4 +102,4 @@ static inline void folio_batch_release(struct folio_b=
atch *fbatch)
>  }
>  =

>  void folio_batch_remove_exceptionals(struct folio_batch *fbatch);
> -#endif /* _LINUX_PAGEVEC_H */
> +#endif /* _LINUX_FOLIO_BATCH_H */
> diff --git a/include/linux/folio_queue.h b/include/linux/folio_queue.h
> index adab609c972e..0d3765fa9d1d 100644
> --- a/include/linux/folio_queue.h
> +++ b/include/linux/folio_queue.h
> @@ -14,7 +14,7 @@
>  #ifndef _LINUX_FOLIO_QUEUE_H
>  #define _LINUX_FOLIO_QUEUE_H
>  =

> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/mm.h>
>  =

>  /*
> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> index 99b7209dabd7..4551613cea2f 100644
> --- a/include/linux/iomap.h
> +++ b/include/linux/iomap.h
> @@ -9,7 +9,7 @@
>  #include <linux/types.h>
>  #include <linux/mm_types.h>
>  #include <linux/blkdev.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  =

>  struct address_space;
>  struct fiemap_extent_info;
> diff --git a/include/linux/sunrpc/svc.h b/include/linux/sunrpc/svc.h
> index 4dc14c7a711b..a11acf5cd63b 100644
> --- a/include/linux/sunrpc/svc.h
> +++ b/include/linux/sunrpc/svc.h
> @@ -20,7 +20,7 @@
>  #include <linux/lwq.h>
>  #include <linux/wait.h>
>  #include <linux/mm.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/kthread.h>
>  =

>  /*
> diff --git a/include/linux/writeback.h b/include/linux/writeback.h
> index e530112c4b3a..62552a2ce5b9 100644
> --- a/include/linux/writeback.h
> +++ b/include/linux/writeback.h
> @@ -11,7 +11,7 @@
>  #include <linux/flex_proportions.h>
>  #include <linux/backing-dev-defs.h>
>  #include <linux/blk_types.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  =

>  struct bio;
>  =

> diff --git a/mm/filemap.c b/mm/filemap.c
> index 6cd7974d4ada..63f256307fdd 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -31,7 +31,7 @@
>  #include <linux/hash.h>
>  #include <linux/writeback.h>
>  #include <linux/backing-dev.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/security.h>
>  #include <linux/cpuset.h>
>  #include <linux/hugetlb.h>
> diff --git a/mm/gup.c b/mm/gup.c
> index 8e7dc2c6ee73..ad9ded39609c 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -18,7 +18,7 @@
>  #include <linux/hugetlb.h>
>  #include <linux/migrate.h>
>  #include <linux/mm_inline.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/sched/mm.h>
>  #include <linux/shmem_fs.h>
>  =

> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index db59fad3503f..51508573963d 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -34,7 +34,7 @@
>  #include <linux/shmem_fs.h>
>  #include <linux/hugetlb.h>
>  #include <linux/pagemap.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/vm_event_item.h>
>  #include <linux/smp.h>
>  #include <linux/page-flags.h>
> diff --git a/mm/mlock.c b/mm/mlock.c
> index 2f699c3497a5..1a92d16f3684 100644
> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -13,7 +13,7 @@
>  #include <linux/swap.h>
>  #include <linux/swapops.h>
>  #include <linux/pagemap.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/pagewalk.h>
>  #include <linux/mempolicy.h>
>  #include <linux/syscalls.h>
> diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> index 601a5e048d12..1009bb042ba4 100644
> --- a/mm/page-writeback.c
> +++ b/mm/page-writeback.c
> @@ -33,7 +33,7 @@
>  #include <linux/sysctl.h>
>  #include <linux/cpu.h>
>  #include <linux/syscalls.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/timer.h>
>  #include <linux/sched/rt.h>
>  #include <linux/sched/signal.h>
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index d88c8c67ac0b..74b603872f34 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -31,7 +31,7 @@
>  #include <linux/sysctl.h>
>  #include <linux/cpu.h>
>  #include <linux/cpuset.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/memory_hotplug.h>
>  #include <linux/nodemask.h>
>  #include <linux/vmstat.h>
> diff --git a/mm/shmem.c b/mm/shmem.c
> index cfed6c3ff853..149fdb051170 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -61,7 +61,7 @@ static struct vfsmount *shm_mnt __ro_after_init;
>  #include <linux/slab.h>
>  #include <linux/backing-dev.h>
>  #include <linux/writeback.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/percpu_counter.h>
>  #include <linux/falloc.h>
>  #include <linux/splice.h>
> diff --git a/mm/swap.c b/mm/swap.c
> index bb19ccbece46..2e517ede6561 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -20,7 +20,7 @@
>  #include <linux/swap.h>
>  #include <linux/mman.h>
>  #include <linux/pagemap.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/init.h>
>  #include <linux/export.h>
>  #include <linux/mm_inline.h>
> diff --git a/mm/swap_state.c b/mm/swap_state.c
> index 32d9d877bda8..a0c64db2b275 100644
> --- a/mm/swap_state.c
> +++ b/mm/swap_state.c
> @@ -15,7 +15,7 @@
>  #include <linux/leafops.h>
>  #include <linux/init.h>
>  #include <linux/pagemap.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/backing-dev.h>
>  #include <linux/blkdev.h>
>  #include <linux/migrate.h>
> diff --git a/mm/truncate.c b/mm/truncate.c
> index 12467c1bd711..df0b7a7e6aff 100644
> --- a/mm/truncate.c
> +++ b/mm/truncate.c
> @@ -17,7 +17,7 @@
>  #include <linux/export.h>
>  #include <linux/pagemap.h>
>  #include <linux/highmem.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/task_io_accounting_ops.h>
>  #include <linux/shmem_fs.h>
>  #include <linux/rmap.h>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 7effd01a7828..7e921dbe2373 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -44,7 +44,7 @@
>  #include <linux/sysctl.h>
>  #include <linux/memory-tiers.h>
>  #include <linux/oom.h>
> -#include <linux/pagevec.h>
> +#include <linux/folio_batch.h>
>  #include <linux/prefetch.h>
>  #include <linux/printk.h>
>  #include <linux/dax.h>
> =

> -- =

> 2.39.5
> =

-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
