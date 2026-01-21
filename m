Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULaTFWijcGlyYgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jan 2026 10:59:04 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A34B254CBB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jan 2026 10:59:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:Message-id:Date:References:In-reply-to:To:From:MIME-Version:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggSDh3f/pHevj38E2SUcxr1VXYISYlSPeHWoWR3lGMg=; b=S0x34cxShe27G/VckRUOZ9XJ40
	y8RqmyneWyrKhz1Hh/5+gm1l3pHwXjm8JNmgcBe9/llTnm6y5pX1bj6kF9G6rVslX8gk2y2ytyXjS
	ObyMEgXMjTBBkYc+UN9Ot4O59mEnbwTYdBiIMO6z2faGUbDh55xgiFv7FD1js/OFIPTg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1viUzL-0005Pm-TX;
	Wed, 21 Jan 2026 09:58:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <neilb@ownmail.net>) id 1viUz9-0005PF-7W;
 Wed, 21 Jan 2026 09:58:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Message-id:Date:References:In-reply-to:
 Subject:Cc:To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:Sender
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SJFJMNOM7awUTkwMl4hIh6WDIUWbLKvHg9WhRsfaf2c=; b=YL0ZFo0UI0cYU0NpPK3tSO+vrF
 rsfDmk1i+ue1cB8qiS6++pM0myt8vlSDrVbj+fJfLT2u5gHMe9jBqy5Gy7QQSs9Gm8kmD3YYztQQ5
 7BKhEAaOp4sMFY3L6Ko1OyMi+UkY9Cug/NQnyryL1xgmOLPn75zFXUf9E5o9V+nQs4a0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Reply-To:Message-id:Date:References:In-reply-to:Subject:Cc:To:From:
 MIME-Version:Content-Transfer-Encoding:Content-Type:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SJFJMNOM7awUTkwMl4hIh6WDIUWbLKvHg9WhRsfaf2c=; b=k9Lsi+py0+hGGuSulpbd+b+X7l
 ro+Jo+vXCUxeANJ6YD4aKX6XAMHcuAwo3uIEjv1tnE1aMcNz2EUz2EJcF1ms7V4R5O25w5bdZHaOv
 ZEPq1pKAbULxFnWU+BTxgtOFOZaGKTLFvx0NMY2eNwGinevE2bZdPLjQGYhnJD7n1Qo8=;
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1viUz7-0001dt-5Z; Wed, 21 Jan 2026 09:58:46 +0000
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
 by mailflow.stl.internal (Postfix) with ESMTP id 451251300E5F;
 Wed, 21 Jan 2026 04:58:32 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-07.internal (MEProxy); Wed, 21 Jan 2026 04:58:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm2; t=
 1768989512; x=1768996712; bh=SJFJMNOM7awUTkwMl4hIh6WDIUWbLKvHg9W
 hRsfaf2c=; b=u/+XlkNJ5V8C5rphAsXf4CRGr0/yY85HzlfIyvdWMIOWXjkQsZL
 hepFVBVO1TGy2MoYqvQ7u24GdOhaMOyN4g29b2duuwJtKYPuWULecyd+MTKRrnGd
 bn7kIcDBwiSCpdoLSUnyYvsgKKeCh1a1dboVMEHTkywI3/WnmYN3GCNjLf2VRDaS
 mz10UPqJbOR5v9xAcZGKcH9zcUO4BUeKjYMDUBeMoVj1ZC1ebbxPD9BY7qRT3PmC
 Gwn3pbkB6fVbCnilSsQt/utzs+2skAgouKRc4vJtaZN+evNBodtN4J3cJ2k+j3M7
 oBRpH6fOpkxc7s+UTVvfrzOozmRmPn80CPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768989512; x=
 1768996712; bh=SJFJMNOM7awUTkwMl4hIh6WDIUWbLKvHg9WhRsfaf2c=; b=K
 sgHoYFPnq/EWy/oXN2LK4RtBbAtHJ8+lCm2EZp7IwyvLgqOVBaJq5V/djUpulah9
 UZ0lnTRqDqpfgEWG2bwPTyIhf+OkxtllFSCCXe8SSJx40Mx4bOPORKRjQmxip1hr
 Hb36gWUn1deRpKO7vBAa/3uHu4mrPFLZ6AyHhEPvNlMxLsivck+jYIJfvJxUK3BQ
 GCt+NV5AdMTQ9cbmkjq9uYNtDwzHhARKjkpF8i9scEBGI7u7PYYWuik1qWV+s+zq
 gG23IiKM5UnKmkw6iHYCl3/e/WqQdwf43M3cAuoYqYAcuk/YbwF3Gb61tiHUVMiD
 2n2dL6Sl4cIXHxXek/iYQ==
X-ME-Sender: <xms:Q6NwadpokZr4zUG9s3yceH_yGV-75ZmEqaCw1iMpcdO-7P_bqHmGqA>
 <xme:Q6NwaYq2ihpc8yBbDG1PVuLPaKeWe_7VoQt8GacEUU17dyYTuVoNw4BKpnWFQRT-4
 Xg1led3wwge8NMYQ6_6srDDet02RciO8TD0ld2euMF5b0iDjA>
X-ME-Received: <xmr:Q6NwaW9rCqB8cw6Q2kJ-ijrsI9kO3BQ343rhJ_gbt5YTx-pU0BQLrEVYYLR7F-XOpzmXxNsMMi5DLL_oShZmUtCCtUc08foOiDNqnALDYUDz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugedvleekucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurheptgfgggfhvfevufgjfhffkfhrsehtqhertddttdejnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epleejtdefgeeukeeiteduveehudevfeffvedutefgteduhfegvdfgtdeigeeuudejnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
 esohifnhhmrghilhdrnhgvthdpnhgspghrtghpthhtohepjeejpdhmohguvgepshhmthhp
 ohhuthdprhgtphhtthhopehvihhrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhkpd
 hrtghpthhtohepghhuohgthhhunhhhrghisehvihhvohdrtghomhdprhgtphhtthhopehl
 ihhnuhigqdigfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
 hugidquhhnihhonhhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
 ihhnuhigqdhnihhlfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
 hinhhugidqnhhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
 uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
 hnuhigqdhfshguvghvvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
 lhhinhhugidqvgigthegsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Q6NwaXP_r1AtxnebpNkWh0ccYaXxkWUlkdex3I21_ko1xomksZ4zhQ>
 <xmx:Q6Nwadv_3MuYvlxZn64JB2BnqApISdsMFoP98SEqbGk-2TZ7AkLEZw>
 <xmx:Q6NwaZ3nfLV93Vtn6SIHnsAzPzQFUB9XxFmo0He_Kd-2FrGyOzYc5Q>
 <xmx:Q6NwaXZBKV6NDhrR9j2xzoxiBc-32Bgplw5GGYFI5LL9zipce5X4Yg>
 <xmx:SKNwaTXSyiSStct1wtcBjcLkfs8d66i92fMj1g3ySdmDH9qv7jDxxYWO>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jan 2026 04:58:08 -0500 (EST)
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Jeff Layton" <jlayton@kernel.org>
In-reply-to: <2ed97731c54ef130ea58861a91c80dacd785de9a.camel@kernel.org>
References: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org>,
 <20260119-exportfs-nfsd-v2-1-d93368f903bd@kernel.org>,
 <aW8yV6v8ZDiynOUm@infradead.org>,
 <9b64bed72e43d0bf24e9b1e3bc770c4a87082762.camel@kernel.org>,
 <707f08e114bf603caf7de020bb630d5477e86bca.camel@kernel.org>,
 <2ed97731c54ef130ea58861a91c80dacd785de9a.camel@kernel.org>
Date: Wed, 21 Jan 2026 20:58:06 +1100
Message-id: <176898948697.16766.1729756714812778707@noble.neil.brown.name>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 21 Jan 2026, Jeff Layton wrote: > On Tue, 2026-01-20
 at 09:12 -0500, Jeff Layton wrote: > > On Tue, 2026-01-20 at 08:20 -0500,
 Jeff Layton wrote: > > > On Mon, 2026-01-19 at 23:44 -0800, Chris [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [neilb(at)ownmail.net]
X-Headers-End: 1viUz7-0001dt-5Z
Subject: Re: [f2fs-dev] [PATCH v2 01/31] Documentation: document
 EXPORT_OP_NOLOCKS
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
Reply-To: NeilBrown <neil@brown.name>
Cc: Martin Brandenburg <martin@omnibond.com>,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Alex Markuze <amarkuze@redhat.com>,
 Sandeep Dhavale <dhavale@google.com>, linux-btrfs@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 Dave Chinner <david@fromorbit.com>, linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Yue Hu <zbestahu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 linux-doc@vger.kernel.org, Hugh Dickins <hughd@google.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Viacheslav Dubeyko <slava@dubeyko.com>,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, linux-mm@kvack.org,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
 Olga Kornievskaia <okorniev@redhat.com>, linux-cifs@vger.kernel.org,
 Dave Kleikamp <shaggy@kernel.org>, linux-nfs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, ocfs2-devel@lists.linux.dev,
 Bharath SM <bharathsm@microsoft.com>, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-erofs@lists.ozlabs.org,
 Jonathan Corbet <corbet@lwn.net>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 David Woodhouse <dwmw2@infradead.org>,
 David Laight <david.laight.linux@gmail.com>,
 Trond Myklebust <trondmy@kernel.org>, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[ownmail.net : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[ownmail.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,ownmail.net:s=fm2,messagingengine.com:s=fm2];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[neil@brown.name];
	RCPT_COUNT_GT_50(0.00)[76];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neilb@ownmail.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[omnibond.com,lists.sourceforge.net,suse.cz,manguebit.org,redhat.com,google.com,vger.kernel.org,kernel.org,gmail.com,fromorbit.com,paragon-software.com,fb.com,dilger.ca,vivo.com,lists.infradead.org,szeredi.hu,nod.at,fasheh.com,oracle.com,infradead.org,dubeyko.com,kvack.org,lists.orangefs.org,microsoft.com,talpey.com,lists.linux.dev,suse.com,zeniv.linux.org.uk,linux.alibaba.com,mail.parknet.co.jp,mit.edu,lists.ozlabs.org,lwn.net,lists.samba.org,samba.org,huawei.com,squashfs.org.uk,linux-foundation.org,evilplan.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,ownmail.net:-,messagingengine.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: A34B254CBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 21 Jan 2026, Jeff Layton wrote:
> On Tue, 2026-01-20 at 09:12 -0500, Jeff Layton wrote:
> > On Tue, 2026-01-20 at 08:20 -0500, Jeff Layton wrote:
> > > On Mon, 2026-01-19 at 23:44 -0800, Christoph Hellwig wrote:
> > > > On Mon, Jan 19, 2026 at 11:26:18AM -0500, Jeff Layton wrote:
> > > > > +  EXPORT_OP_NOLOCKS - Disable file locking on this filesystem. Some
> > > > > +    filesystems cannot properly support file locking as implemented by
> > > > > +    nfsd. A case in point is reexport of NFS itself, which can't be done
> > > > > +    safely without coordinating the grace period handling. Other clustered
> > > > > +    and networked filesystems can be problematic here as well.
> > > > 
> > > > I'm not sure this is very useful.  It really needs to document what
> > > > locking semantics nfs expects, because otherwise no reader will know
> > > > if they set this or not.
> > > 
> > > Fair point. I'll see if I can draft something better. Suggestions
> > > welcome.
> > 
> > How about this?
> > 
> > +  EXPORT_OP_NOLOCKS - Disable file locking on this filesystem. Filesystems
> > +    that want to support locking over NFS must support POSIX file locking
> > +    semantics and must handle lock recovery requests from clients after a
> > +    reboot. Most local disk, RAM, or pseudo-filesystems use the generic POSIX
> > +    locking support in the kernel and naturally provide this capability. Network
> > +    or clustered filesystems usually need special handling to do this properly.
> 
> Even better, I think?
> 
> +
> +  EXPORT_OP_NOLOCKS - Disable file locking on this filesystem. Filesystems
> +    that want to support locking over NFS must support POSIX file locking
> +    semantics. When the server reboots, the clients will issue requests to
> +    recover their locks, which nfsd will issue to the filesystem as new lock
> +    requests. Those must succeed in order for lock recovery to work. Most
> +    local disk, RAM, or pseudo-filesystems use the generic POSIX locking
> +    support in the kernel and naturally provide this capability. Network or
> +    clustered filesystems usually need special handling to do this properly.
> +    Set this flag on filesystems that can't guarantee the proper semantics
> +    (e.g. reexported NFS).

I think this is quite thorough, which it good ...  maybe too good :-) It
reminds me that for true NFS compatibility the fs shouldn't allow local
locks (or file opens!) until the grace period has passed.  I don't think
any local filesystems enforce that - it would have to be locks.c that
does I expect.  I doubt there would be much appetite for doing that
though.

Reviewed-by: NeilBrown <neil@brown.name>

Thanks,
NeilBrown


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
