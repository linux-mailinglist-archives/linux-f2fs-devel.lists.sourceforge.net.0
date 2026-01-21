Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKGLBcRXcWkNEwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jan 2026 23:48:36 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 597AD5F071
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jan 2026 23:48:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:Message-id:Date:References:In-reply-to:To:From:MIME-Version:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fe4KUjspppri6TceSL4Cwfpgsh17h1xJ/cNzPimwaIU=; b=b5q+V06Kw/TCC59fxokS/SzFlf
	2BNyveG7YqgEqCPQcifXqZGm7MkSo0mEGfr29a3hcG1tV0/P+aGuNhVdKpWooFNJ5HjrIQWAYcVPE
	0zxwERPpg2M4eEcrQYjQSDlBOo1YgI+04mYyoauk81DtqH90dOKQ8vEH/wMpzDy8Wvo0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vigzv-0001EK-Qh;
	Wed, 21 Jan 2026 22:48:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <neilb@ownmail.net>) id 1vigzt-0001E2-Fu;
 Wed, 21 Jan 2026 22:48:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Message-id:Date:References:In-reply-to:
 Subject:Cc:To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:Sender
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5coOyJl4iosEMxvKLf9pz/D+NbUu48dkiDD9Y2kxJME=; b=iicwrgTGIK+Nmg+YaUaHPR5QLq
 b5hyAmeXwJAAP1U/jJNIZ3AozsJMem5VKqz7gLAk6tqfpGonsUQbLIZf8znhbocuR3BIxGnrc0YdG
 zM+/xIZ9Es1dhHGbkwuVFJnnKpxufi+c5/RUOjAa1H0CJ1Otvy2cCZDXs3TaETT57Ta0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Reply-To:Message-id:Date:References:In-reply-to:Subject:Cc:To:From:
 MIME-Version:Content-Transfer-Encoding:Content-Type:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5coOyJl4iosEMxvKLf9pz/D+NbUu48dkiDD9Y2kxJME=; b=Sgc/FkM0tb//9I1g3asPm0s0Rc
 qym5ZE9lPm/0iO1wVzjq+P9VrHlJHlcn3U0GoYU4yB6TjTc2uDMRB1sKNrH+JdD6OS+NHmjp4hYDV
 Y6YVGlV/CiBHRNOMrS55aGGDi+Y069aAPcckAwZqrZFXZOKgg9BsHUkA/BZIQEWwd8/Y=;
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vigzt-0003Na-Ec; Wed, 21 Jan 2026 22:48:22 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailflow.stl.internal (Postfix) with ESMTP id 8D6A31300F24;
 Wed, 21 Jan 2026 17:48:08 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Wed, 21 Jan 2026 17:48:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm2; t=
 1769035688; x=1769042888; bh=5coOyJl4iosEMxvKLf9pz/D+NbUu48dkiDD
 9Y2kxJME=; b=GuovOWXRBLUE5OJcSyLnE/2eveX/36uTx36j9P93zjQcQRBZQL2
 hrnzBjQOgzs/f0q+zVSV1tWHCGJeldpGO5tNxzbNYGAmGERTI/74rC4AhDEcwnbN
 3EK+IxK9Da7qBxTZ0cL7/5RdElCmK5xx1WEmeVCQTAdbEDCJzhvLIyYH/VUBXRn2
 h49SQEqoXX9n4peKNOiWNTGeGPiK9qsGhIMzVRsfQ8nV0r0CSHnLs3nYhgIfpNL3
 aRQdXpKb6VS0ww0j3QddijYoBo1Kwrkcj+Ox1b+DG22Mrte7SY069e+GdbfIhnlj
 3VqqpOkLrd4aGQop2LrD926E4486pl+anPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769035688; x=
 1769042888; bh=5coOyJl4iosEMxvKLf9pz/D+NbUu48dkiDD9Y2kxJME=; b=G
 Qln8ftBpavKFAA+sJNEPaaNr8oKurXmo3q4BaVp9GwaWB1fm8C563yxGcgYW93DS
 2xtNzCjbtolaXD67qz6Qutqe5geB5bsD8Ugeg6j/LWjxuo9XwZj1mmfo4drLgUP2
 yKqhpGLcalZ4u5NUgfoc97greSYLp54DwzSB4S6wHw4u2msQsbGk5ZA8IJMGNIbQ
 ngZ+8m6ZYaIowc/dHLMNgP5a1uqvjsJX/qkbUxNoCKOD6a2oW1oaQNc62xAi1nw9
 1ilzAzJcDO41rfb5T7w8GgYR5Vyc6IoiPl6WjnE4pmvyLFxhbYKi59Pm07XkqffD
 MH3MYMODbYPIXIIlLoSWg==
X-ME-Sender: <xms:o1dxaZ-cMFc_o0d43ug7z0kzLEBmcLr7-qnETyPvdBZuqqtXE2bH3w>
 <xme:o1dxaWu_cgJpAPDvXRifHWGeBvpSKMc12f7rFBgOoG_tMemlpn3xQTXYgCwgfa7tz
 OXDCzuK93xla979oqbjqOFhStCl3Vabm505SJATmkmL4XzdyA>
X-ME-Received: <xmr:o1dxaTxZPCOrm1mlblqPiWzOX285XPSCGpXm-fKvOvS9y7eJCkfR7O9aWP_lCWxHfYgXgfjqf3Vws4y9gRuwORW00qGz0381O1TtjVlRJXe1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeghedvucetufdoteggodetrf
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
X-ME-Proxy: <xmx:o1dxabxtlAdkhpwCkINTEBpxmOYNyzwJPUiM41SluU32_hzzNA9XZQ>
 <xmx:o1dxafCKgd9STI3lGSZvVjQToHTy1h7liCKSrmU9waffzwMuC1NFUA>
 <xmx:o1dxaY793FR_a6LdPfr_ZHshxnAh_1jwBDA6jddarcyZMxIXycacjw>
 <xmx:o1dxaRMf9cXehnUejISjAclfFWLd7Zsy6-U0xLPbufXx8cPynQ1yZw>
 <xmx:qFdxaSd_vulaCSCn1gwPqzAJtzBUIYK-Pjhk-xVuA_6gzPYpL8lA2saQ>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jan 2026 17:47:43 -0500 (EST)
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Jeff Layton" <jlayton@kernel.org>
In-reply-to: <d8d68d1df6838c382799ce58345cfb5366585a8f.camel@kernel.org>
References: <>, <d8d68d1df6838c382799ce58345cfb5366585a8f.camel@kernel.org>
Date: Thu, 22 Jan 2026 09:47:41 +1100
Message-id: <176903566115.16766.12892778448343562390@noble.neil.brown.name>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 21 Jan 2026, Jeff Layton wrote: > On Wed, 2026-01-21
 at 20:58 +1100, NeilBrown wrote: > > On Wed, 21 Jan 2026, Jeff Layton wrote:
 > > > On Tue, 2026-01-20 at 09:12 -0500, Jeff Layton wrote: > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [neilb(at)ownmail.net]
X-Headers-End: 1vigzt-0003Na-Ec
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
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[noble.neil.brown.name:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,brown.name:replyto]
X-Rspamd-Queue-Id: 597AD5F071
X-Rspamd-Action: no action

On Wed, 21 Jan 2026, Jeff Layton wrote:
> On Wed, 2026-01-21 at 20:58 +1100, NeilBrown wrote:
> > On Wed, 21 Jan 2026, Jeff Layton wrote:
> > > On Tue, 2026-01-20 at 09:12 -0500, Jeff Layton wrote:
> > > > On Tue, 2026-01-20 at 08:20 -0500, Jeff Layton wrote:
> > > > > On Mon, 2026-01-19 at 23:44 -0800, Christoph Hellwig wrote:
> > > > > > On Mon, Jan 19, 2026 at 11:26:18AM -0500, Jeff Layton wrote:
> > > > > > > +  EXPORT_OP_NOLOCKS - Disable file locking on this filesystem. Some
> > > > > > > +    filesystems cannot properly support file locking as implemented by
> > > > > > > +    nfsd. A case in point is reexport of NFS itself, which can't be done
> > > > > > > +    safely without coordinating the grace period handling. Other clustered
> > > > > > > +    and networked filesystems can be problematic here as well.
> > > > > > 
> > > > > > I'm not sure this is very useful.  It really needs to document what
> > > > > > locking semantics nfs expects, because otherwise no reader will know
> > > > > > if they set this or not.
> > > > > 
> > > > > Fair point. I'll see if I can draft something better. Suggestions
> > > > > welcome.
> > > > 
> > > > How about this?
> > > > 
> > > > +  EXPORT_OP_NOLOCKS - Disable file locking on this filesystem. Filesystems
> > > > +    that want to support locking over NFS must support POSIX file locking
> > > > +    semantics and must handle lock recovery requests from clients after a
> > > > +    reboot. Most local disk, RAM, or pseudo-filesystems use the generic POSIX
> > > > +    locking support in the kernel and naturally provide this capability. Network
> > > > +    or clustered filesystems usually need special handling to do this properly.
> > > 
> > > Even better, I think?
> > > 
> > > +
> > > +  EXPORT_OP_NOLOCKS - Disable file locking on this filesystem. Filesystems
> > > +    that want to support locking over NFS must support POSIX file locking
> > > +    semantics. When the server reboots, the clients will issue requests to
> > > +    recover their locks, which nfsd will issue to the filesystem as new lock
> > > +    requests. Those must succeed in order for lock recovery to work. Most
> > > +    local disk, RAM, or pseudo-filesystems use the generic POSIX locking
> > > +    support in the kernel and naturally provide this capability. Network or
> > > +    clustered filesystems usually need special handling to do this properly.
> > > +    Set this flag on filesystems that can't guarantee the proper semantics
> > > +    (e.g. reexported NFS).
> > 
> > I think this is quite thorough, which it good ...  maybe too good :-) It
> > reminds me that for true NFS compatibility the fs shouldn't allow local
> > locks (or file opens!) until the grace period has passed.  I don't think
> > any local filesystems enforce that - it would have to be locks.c that
> > does I expect.  I doubt there would be much appetite for doing that
> > though.
> > 
> 
> Yeah, I don't see us ever doing that. It'd be a tricky chicken-and-egg
> problem, given the demand-driven way that the mountd upcalls work
> today. We don't even know that anything is exported until something
> asks for it.

statd keeps state in /var/lib/nfs/sm, and nfsd keeps v4 state elsewhere
in /var/lib/nfs.  This state effectively records if any NFS client might
try to recover a lock.
I think the v4 state is granular enough to identify the filesystem.
lockd could be enhanced to use the same state I suspect.

We would need to generalise that state and load it at mount time and
block new state creation accordingly.

i.e. this would have to be a vfs-level thing which nfsd makes use of.

Possibly, but there are other things better worth our time.

NeilBrown



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
