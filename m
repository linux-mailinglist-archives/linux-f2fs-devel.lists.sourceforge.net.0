Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gComFsircGkgZAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jan 2026 11:34:48 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CECA5546F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jan 2026 11:34:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:Message-id:Date:References:In-reply-to:To:From:MIME-Version:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yEPwwSmfPiCDnSet+nLug7dKzqSyvcXofQ2OuxvEQLc=; b=aCUfe0mk6QKFHjv3TND5tlJLMe
	Z88d75AJbXXTx0Og+AxDlusGk7YkaimwJ8eAxLvjL1d+LBg8w/jKrRRdGRwjslgal9ypZa2aufi5G
	LqJ7onN0CC82ekcxCbUoczKmBwwpgBDOY/DKO2vwwl+7MtqFwPKkOqcKz90ByA9MB0uQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1viVXs-0008AZ-Nz;
	Wed, 21 Jan 2026 10:34:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <neilb@ownmail.net>) id 1viVXq-0008AI-HJ;
 Wed, 21 Jan 2026 10:34:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Message-id:Date:References:In-reply-to:
 Subject:Cc:To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:Sender
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K9j3jhKpFIpiUQJzHWR2x3eEHOIQSB6ye1vrprKdmzg=; b=mnNTcIF5c5Y5um0IwEiGaOqe7u
 J42Ujl3Ez6jZ6Y2H+2TeRZcAp7x+0uj1bChG9NiKbeHIDH0bdknPWgSJhh48l6tLRj69ujNqdcsfT
 prG6k8nLe2+jnXvwVTsMbL7WSod4gaRqAiElfLZ+E7ogoXCWdOvalrhAAfOC7/AQrJ7c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Reply-To:Message-id:Date:References:In-reply-to:Subject:Cc:To:From:
 MIME-Version:Content-Transfer-Encoding:Content-Type:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K9j3jhKpFIpiUQJzHWR2x3eEHOIQSB6ye1vrprKdmzg=; b=SiIvbOjOmF/c+WZgzL+MtIV/ol
 hkg3CwsVc/tMEOnDjU4ZfmBlgr6FE6ZMdEN67Jvl69ISW88o2194V8qWmJx91cGS1j3sP+KEt/MyX
 1WCrvrR92OIPqd7g+d2EFW8OJGKkhDCKFBN6F+hXAhURp1STQFAflCNegd5SpB0o4XdM=;
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1viVXp-0004P2-Lk; Wed, 21 Jan 2026 10:34:38 +0000
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailflow.stl.internal (Postfix) with ESMTP id 14B671300419;
 Wed, 21 Jan 2026 05:34:30 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-09.internal (MEProxy); Wed, 21 Jan 2026 05:34:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm2; t=
 1768991669; x=1768998869; bh=K9j3jhKpFIpiUQJzHWR2x3eEHOIQSB6ye1v
 rprKdmzg=; b=kv5lmdgwptpNtolMex40wHyYDtu1zR3kROgUgHa9dV4DF424TII
 xz8dxcyqZv5vn+C5E7je63p/kUX6FA6DJv49ZG4TEvmE9CmQROcNdltD80UCq70F
 67OKAnNM8oyAk8/zKVARKWIUXc/0rwj0A3HsU66MhxNwBVK6BifqALpBS3KNgyjp
 P0XbAYs6phH+mnFqRoXC1mh9pnuNQ+fFEwhXXc1sSnndee26t3rwwjTbJtTESJ9H
 fxgBNTVTQMWx/Tnp/sidQDM5zxfwLw4V6i5O5idHrafun9SF76YRjqhEkQ+5kNcK
 HcmbYYUHLFntzBcrv0lywLVtTimlIcl+nQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768991669; x=
 1768998869; bh=K9j3jhKpFIpiUQJzHWR2x3eEHOIQSB6ye1vrprKdmzg=; b=o
 4LwLi0FQ1jEf8fskqm7+L10I5i+E4UcJvDl06S22E2N6MVzowyCMRqm/bH1M2J1a
 JDwioi/R98Kd4aywyn9uZLSOM7z8MArbO4E7czObG95qdFlOtvQuQeCk3G1ZaKic
 Tehtuqj1UGP3Eb7Ucl15f9362hASG+CEClGzitcQtKQLQ9R6sDLQi76cFZsvhiXR
 ga+keMqdKP1sZXq4AW8N7RVWcf1Wq1jiHpO0YXPueFkCr92lRvi0sx0LsAgnwX8p
 AKZCnY9vD6dcgSVBcblBk6RRY3JRRT1CNgtvJrCkNeFsfbLaIXO8m2mpKZ7xfZXV
 VHjPUcyIoRUMrrAPKWG+w==
X-ME-Sender: <xms:sqtwaejzMMYRFV89Y0xjhbUY2Ux7NPR7lm9XvAv8w1i7kASo3nK0Zw>
 <xme:sqtwacbJbsKb0ZWVMi2Ld61rpE_gwOTUmZUOuIFkObP6qtSchisKdfJNZxw0XqFd2
 dpJMMfqKKl9ncf8qF50uKZThAPLp5_pMzEv9z25paWGdt3g-rQ>
X-ME-Received: <xmr:sqtwabSH-RRobwNx5gak-6jfqjdFsk_YBqmqf4AohoRb2sCX2uoyp4QOYu7NMlajZX_Q1etTmNQaSqmVM8w660ms4W7YiwL8iGuB03vkYszh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeftdehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurheptgfgggfhvfevufgjfhffkfhrsehtjeertddttdejnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epudetfefhudevhedvfeeufedvffekveekgfdtfefggfekheejgefhteeihffggfelnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
 esohifnhhmrghilhdrnhgvthdpnhgspghrtghpthhtohepjedvpdhmohguvgepshhmthhp
 ohhuthdprhgtphhtthhopehvihhrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhkpd
 hrtghpthhtohepghhuohgthhhunhhhrghisehvihhvohdrtghomhdprhgtphhtthhopehl
 ihhnuhigqdigfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
 hugidquhhnihhonhhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
 ihhnuhigqdhnihhlfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
 hinhhugidqnhhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
 uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
 hnuhigqdhfshguvghvvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
 lhhinhhugidqvgigthegsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:sqtwaUqa76K57jmkll9tnYEPNFtkwAFRAIOxkmOCTcJg3wPstOKebw>
 <xmx:sqtwafqX8Nkd7EHiHXFk0lbznDX828ETkTyNFowHaBS8I4Kgjb_iRQ>
 <xmx:sqtwaRGfSRcbTn7ju_6NXus6mwh9CX54E07yQqtkZf6nvJqjRrtQ3A>
 <xmx:sqtwaZtU8f1xqg3JxB6L05BW89l7H_7-dfzynjFDw6dcCKuLsBgwHQ>
 <xmx:tatwaYpYIXr04Y4VvYfBrbHTBHEkDGuPdYscX8VKwQ1WEKpEcFWHhm0u>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jan 2026 05:34:08 -0500 (EST)
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Christoph Hellwig" <hch@infradead.org>
In-reply-to: <aXCg-MqXH0E6IuwS@infradead.org>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>,
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>,
 <9c99197dde2eafa55a1b55dce2f0d4d02c77340a.camel@kernel.org>,
 <176877859306.16766.15009835437490907207@noble.neil.brown.name>,
 <aW3SAKIr_QsnEE5Q@infradead.org>,
 <176880736225.16766.4203157325432990313@noble.neil.brown.name>,
 <20260119-kanufahren-meerjungfrau-775048806544@brauner>,
 <176885553525.16766.291581709413217562@noble.neil.brown.name>,
 <aW8w2SRyFnmA2uqk@infradead.org>,
 <176890126683.16766.5241619788613840985@noble.neil.brown.name>,
 <aXCg-MqXH0E6IuwS@infradead.org>
Date: Wed, 21 Jan 2026 21:34:04 +1100
Message-id: <176899164457.16766.16099772451425825775@noble.neil.brown.name>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 21 Jan 2026, Christoph Hellwig wrote: > On Tue, Jan
 20, 2026 at 08:27:46PM +1100, NeilBrown wrote: > > > If you think NFS actually
 explains the semantics pretty well, please > > > explain that [...] 
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
X-Headers-End: 1viVXp-0004P2-Lk
Subject: Re: [f2fs-dev] [PATCH 00/29] fs: require filesystems to explicitly
 opt-in to nfsd export support
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
 linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Yue Hu <zbestahu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
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
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 Chuck Lever <chuck.lever@oracle.com>, Hongbo Li <lihongbo22@huawei.com>,
 Anna Schumaker <anna@kernel.org>, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 David Woodhouse <dwmw2@infradead.org>, Trond Myklebust <trondmy@kernel.org>,
 Joel Becker <jlbec@evilplan.org>
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
	RCPT_COUNT_GT_50(0.00)[72];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neilb@ownmail.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[omnibond.com,lists.sourceforge.net,suse.cz,manguebit.org,redhat.com,google.com,vger.kernel.org,kernel.org,gmail.com,paragon-software.com,fb.com,dilger.ca,vivo.com,lists.infradead.org,szeredi.hu,nod.at,fasheh.com,oracle.com,infradead.org,dubeyko.com,kvack.org,lists.orangefs.org,microsoft.com,talpey.com,lists.linux.dev,suse.com,zeniv.linux.org.uk,linux.alibaba.com,mail.parknet.co.jp,mit.edu,lists.ozlabs.org,samba.org,huawei.com,squashfs.org.uk,linux-foundation.org,evilplan.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,ownmail.net:-,messagingengine.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[brown.name:replyto,noble.neil.brown.name:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 7CECA5546F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 21 Jan 2026, Christoph Hellwig wrote:
> On Tue, Jan 20, 2026 at 08:27:46PM +1100, NeilBrown wrote:
> > > If you think NFS actually explains the semantics pretty well, please
> > > explain that too, especially in forms that can be put into
> > > documentation, including for the user ABI.
> > 
> > There are multiple issues here:
> > 
> >  - filehandle stability.  As far as I know all filesystems provide
> >    stable filehandles when the "subtree_check" export option is not used.
> 
> That is news to me, but certainly interesting.  Does this include not
> reusing the file handle for a new incarnation of the same thing?

"stable" and "reuse" are quite distinct concepts in my mind.
"a new incarnation of the same thing" is in my experience a new thing.
  rmdir foo: mkdir foo
on an empty directory will create a new incarnation of the same thing.
But it will appear to be different in various ways.

Names, not file handles, are generally used for new incarnations of the
same thing (again - in my experience).

I cannot 100% guarantee that all fs's provide filehandle stability, but
I am not aware of any, and none have been presented in this discussion.

It is true that the NFSv4 spec claims to allow them but I find the
details provided insufficient.
They might be able to work reliably if the server provided a delegation, but
without it I don't think they can be used reliably.  I'm certainly not
aware of any attempt to support them in Linux client or server.
(I know Trond doesn't like "connectable" file handles).

> 
> >    Certainly cgroupfs does.  So having an EXPORT_OP_STABLE_HANDLES
> >    flag would mean it was set for every filesystem - unless there is
> >    something else I'm not aware of.  That is certainly possible and I
> >    hope someone will let me know if I'm missing something.
> 
> Well, if does not provide stable file handles with the subtree_check
> export option, or more importantly with the CONNECTABLE flag passed
> to encode_fh, which is the level we're operating on, it can't set the
> flag.
> 

Hmmm...  I didn't know that open_by_handle_at() supported CONNECTABLE
requests. That seems relatively recent.

If CONNECTABLE is requested, then only directories get stable
filehandles.
If CONNECTABLE is not requested, then all filehandles should be stable.



> >  - filehandle uniqueness.  This is somewhat important and if a
> >    filesystem doesn't provide it, that should be considered a bug.  In a
> >    different thread Christian has observed that there would be benefit
> >    if pidfs and nsfs provided uniqueness across reboots.  It is quite
> >    easy for a virtual filesystem to generate a 64 bit random number when
> >    the fs is initialised, and include that in file handles.  Having a
> >    EXPORT_OP_REUSES_HANDLES flag could mark filesystems that are still
> >    buggy if that is thought to be useful.
> 
> Yes.
> 
> >  - GETATTR always reporting file size of 0.  This is the only concrete
> >    symptom that Jeff has reported (that I have seen).  This  makes it
> >    impossible to read files over NFS even if they have content.
> >    Would EXPORT_OP_INACCURATE_SIZE be useful?
> 
> i_size = 0 for a regular file sounds like a genuine bug to me.  I'm
> actually surprised anything works with that.

Files in /proc are all size zero.
Files in /sys seem to be all 4096 (or maybe PAGE_SIZE).
Files in /sys/kernel/security are all size zero
Files in /sys/fs/cgroup are all zero

I agree it is weird, but it seems to work ...  though I do have a vague
memory of something not working because it used a library function to
read a file, and it needed to be fixed.  No details come to mind except
that it was probably md related.

As some of these virtual files can be different every time they are
read, there is TOCTOU issue with trying to make the i_size accurately
reflect the result of a subsequent read.  I think the cost of setting an
accurate i_size even when it is possible is not seen as worth while.

> 
> >  - maintainer feature choice.  A maintainer may choose not to support
> >    export over NFS because they feel that there is no value and the
> >    possible support burden would not be worth it.
> 
> The maintainer has no way to disallow exporting through nfs.  They can
> at best disallow exporting using the kernel nfs daemon if we provide
> that facility.  But as I've argued multiple times, making arbitrary,
> selective and very narrow choices about use cases without technical
> backing for them (which then would be expressable as a flag like those
> listed by you above) is really bad software development practice, and
> not something that we usually do in the Linux kernel.

True: once you make files available to people you cannot control what
people will do with them.
So maybe you are saying "what is so special about knfsd that it gets
information that no-one else can get".  I cannot argue against that.

> 
> >    There may be locking
> >    / lease / etc issues that further complicate things.  So it might be
> >    reasonable for a maintainer to choose to forbid NFS export while
> >    allowing local fhandle access. EXPORT_OP_NO_NFS_EXPORT.
> 
> We already have a EXPORT_OP_NOLOCKS flag to deal with this.
> 
> > 
> > It took me a while to sift through the code/patches/comments and come to
> > this understanding and I apologise if I wasn't as clear earlier.  But
> > my intuition was always that file handle stability was never the real
> > issue, and maintainer choice was.  Hence my rejection of the
> > "STABLE_HANDLES" name.
> 
> Why do you keep ignoring the fat that the stable handles are really
> important for anyone wanting to actually use them for their original
> storage purpose, be that for knfsd, a userland nfs damon, or other
> storage applications in userspace despite explaining this countless
> times?
> 

It isn't that I don't think they are important.  It is that I think they
are universally provided (when not connectable).
If we add an EXPORT_OP_STABLE_FILEHANDLES flag, I believe we would need to
set it on every export_operations structure.  So what would be the
point?

Thanks,
NeilBrown


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
