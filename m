Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qD+UC99RcGlvXQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jan 2026 05:11:11 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7236F50D90
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jan 2026 05:11:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:Message-id:Date:References:In-reply-to:To:From:MIME-Version:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdMetRvSvyLPEb9NnPKeGgqjIYeXd6lgabQZ3wK1/JM=; b=XMgG1HUV0cZ/6C1CfwaOQu6P01
	h+d/fLWkjFtoB+xsuWZbnjO/lb6Y2u7Ak0FYY2S0XDN6cBUrKdM5A/OKZvlW/MB1s3ZZzKTZp6IaI
	sVzVixxxBQvQogxNkr/b+2AcGpsWJAXxjSMtzojrAgieDElTllfxM/cBMRnh+BKI46yc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1viPYc-0000Gh-Rt;
	Wed, 21 Jan 2026 04:11:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <neilb@ownmail.net>) id 1viPYa-0000G2-6N;
 Wed, 21 Jan 2026 04:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Message-id:Date:References:In-reply-to:
 Subject:Cc:To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:Sender
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VHtydnr8fLS7IJeEIN+Bebc9EhZyuKs8Mrygf/E6Mwk=; b=W+gE+g46h5rgyNsrye+/E65ZmQ
 ULiw6U/pzhe4+xnsQDPbX+2eBW9W8r1l+TAmGwNEWPJsBmtnqo6k53mmzLBfVtm+YDxVsA9A0eG/x
 Vhy6P26ptVExJ45a2QpifDmbGvssOKYaKQWW/SbJjDFI2ha+coPgM62Re09ey3DlUuWA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Reply-To:Message-id:Date:References:In-reply-to:Subject:Cc:To:From:
 MIME-Version:Content-Transfer-Encoding:Content-Type:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VHtydnr8fLS7IJeEIN+Bebc9EhZyuKs8Mrygf/E6Mwk=; b=Y4ZTcPLIil85jeCTX/ppp8fOs3
 bug9X4Nsd5ao4gKAPT1JvW9WRqms+rPFXj7TlZpezmZn1iNplDKImRSKODy0kfQHNrVbpvXHhEX03
 ooK6wK8gNGRik42w9n6BDv5NBBh7QVhFam03dFkWxCiVkb1D9XL9TQfir+er2GdnBXeM=;
Received: from flow-a3-smtp.messagingengine.com ([103.168.172.138])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1viPYa-0006yO-Gc; Wed, 21 Jan 2026 04:11:00 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailflow.phl.internal (Postfix) with ESMTP id CDA9513807C6;
 Tue, 20 Jan 2026 23:10:49 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Tue, 20 Jan 2026 23:10:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm2; t=
 1768968649; x=1768975849; bh=VHtydnr8fLS7IJeEIN+Bebc9EhZyuKs8Mry
 gf/E6Mwk=; b=k3Rxmu5uR9LzcxYLB3t0g9OZO0rJkXHWHzZwWU2baOA0T+BauMb
 JVwdNn8FXLcfJjWpT/PesgXD8rWNCNVfalot0ujFj+m9iIfbTfXgug2Q3yJqrVyB
 8eJIYj37xg9eo1bP9zpmammhxmuGoBzvKOGPf5Qihx0i4Xtur2zoOlGt4VqfI2Aq
 VcQiUYFS9VLDwzq7PFAV47UiRi8Z6ewfEdkzCtfuUcbBtYGQ4REwO/NQfx0wGxZa
 zaqsbkKg/7unaAaTepYNC7FeekN9e3dyldZZ6WnZ81ri0JmX1JvDTDOyA9r/um3Q
 0UTk91MwX8RKLgf76R+Fpg0kqrT6VIZzfKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768968649; x=
 1768975849; bh=VHtydnr8fLS7IJeEIN+Bebc9EhZyuKs8Mrygf/E6Mwk=; b=g
 AJ0npOh094R5rlQ+lB6V86VTqskShc/USfs9jmX1TOsWUZfsPdWnx0W03o0QsD0J
 ole/Eq8d6vjOz/TwgxXAi4GUViQNE7aP9SFrw1QS88PkqsRNgUMpp2Dsk75jigEL
 Tq3UezOIFJ8hQFHcKj89Ey79saQSKP0MwkW63MgMtbV/mnNXN/xKVwew/W1KuJOB
 UtSIMWwNUT/KJ08KW4iRnFlHq35eiupz+giAs+7ptzAfWnDBN/iL/8qtRpNmSEaA
 7+qwUSVwzkTj44zrlBWH3L4VcAF8ddte590kdslQTISEXKuf5ZNRlxQrYy4fTjd4
 +bXU8lH/3WUCP5TODW9mQ==
X-ME-Sender: <xms:x1FwaXcQqjPpSgnEH0JKgQq9qBmBgEL4xriEE0RJAFk0DGbOHo3GJQ>
 <xme:x1FwaRGn5TWEli8N0_6q7i-Js7HZaHfbVLccEQrr6Mlj8opNJxVvGV2IOF4DACpZJ
 67k8djIbKVq6CJIz8sMWvyebtGqxQwHb9fq0iYg9h6RLbhG>
X-ME-Received: <xmr:x1FwaeOCYluQbHVqHC0b8yb2QyAzu4oYGvwgfL3Rv1YcRePq4NfK1L8su9uzG-K39Rf20ZSVJLGZZZsgDaJ4alcLa9ozRYjqUp45LbFlfXWe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugedvvdejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:x1FwaR8X47pB82llCoOnx-_tqfG4Wgl__nF7iR7DTsvnBKEgoxWWLA>
 <xmx:x1FwadL_4AgUdEoAdrrjBUzKm_QwvAZ5_vABwDi-yZXKOEZQmRVN-g>
 <xmx:x1FwacjsPmz0p5xJHKbK1Llgy6XHSkD5sIUV00neAVndqU1R0osl9Q>
 <xmx:x1FwaQ-U7Yh5HcQNL5v5YvAtJgbgLMSzKZeFpndI7b9KPjw4FZERdA>
 <xmx:yVFwafa--UBBDa_lEtTQJ8XgCJ_3LeDDEGWDRnQKAI7NA5gXIajXqhW->
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jan 2026 23:10:25 -0500 (EST)
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Jeff Layton" <jlayton@kernel.org>
In-reply-to: <9fdf7a8c04861306b453a78233f4bd6004c465f4.camel@kernel.org>
References: <>, <9fdf7a8c04861306b453a78233f4bd6004c465f4.camel@kernel.org>
Date: Wed, 21 Jan 2026 15:10:22 +1100
Message-id: <176896862299.16766.6206046829320088529@noble.neil.brown.name>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 19 Jan 2026, Jeff Layton wrote: > > There is another
 approach we could consider: We could move the > export_operations that are
 needed for local filehandle access into a > new struct filehandl [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [neilb(at)ownmail.net]
X-Headers-End: 1viPYa-0006yO-Gc
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
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
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
	RCPT_COUNT_GT_50(0.00)[71];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,brown.name:replyto,noble.neil.brown.name:mid]
X-Rspamd-Queue-Id: 7236F50D90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 19 Jan 2026, Jeff Layton wrote:
> 
> There is another approach we could consider: We could move the
> export_operations that are needed for local filehandle access into a
> new struct filehandle_operations or something. It does mean adding an
> extra pointer to the super_block for the new operations vector, but it
> might be more intuitive.

If that sort of change were seen to be valuable, I would rather not
create a filehandle_operations but merge some (or all) of
export_operations into super_operations.
Maybe then the existence of s_export_op would return to mean "NFS export
supported" even if it is empty.

Thanks,
NeilBrown


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
