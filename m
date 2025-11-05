Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5031CC38107
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 05 Nov 2025 22:41:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:Message-id:Date:References:In-reply-to:To:From:MIME-Version:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csiZZep+VA2Y3D40oEdlVf0JqB+NiiyNQGlzJJnsGZ4=; b=A7VjgYSXPwp2eYRii+k9Wi9BGg
	GDY7/wTEeXk+HI3PxEZv7RrSLoWcslLOjdNhg7M+7vztj1/UT6Ty6YAkZPFCoE+b8M9QWiXYhgFAE
	hNoJRebKKJxlt3+VeCYpxy2jLBCWLOnTaYz/UOXZciotpSTKNN4aZ5/DL+VLjsuQscuk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vGlFn-0007Yb-3S;
	Wed, 05 Nov 2025 21:41:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <neilb@ownmail.net>) id 1vGlFk-0007Y8-Cd;
 Wed, 05 Nov 2025 21:41:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Message-id:Date:References:In-reply-to:
 Subject:Cc:To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:Sender
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EVCZm+k0TFnzyISAYv/ad61W8yGyS+GgtniecPh35bI=; b=eA73GMg6ElSN8YjMpiIU/gMT05
 QGQLS5X0RvoOXJIhV7mdslc2j8WlqALL2fQ4nK2iQyqb0V9a7Iwmg3mj/sFtP8qyw3lGNXsuy+evQ
 Yt0iBw9MR7vSA86pwKqX8xsoolBqn+zGq9cv3SU1/hxThNq5TOCvWT+1cBUlYg/ZQtUM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Reply-To:Message-id:Date:References:In-reply-to:Subject:Cc:To:From:
 MIME-Version:Content-Transfer-Encoding:Content-Type:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EVCZm+k0TFnzyISAYv/ad61W8yGyS+GgtniecPh35bI=; b=QPWELDNJRVZMVGuig8tOv1vkfm
 ih1L1XV1kCdR+HGn0wVTS/0RV8aedTjudIwnAt0/NqtBB1kcC6OfWVAv9nYzlalsZ6BefSOGq5QbF
 RQHtX2z+wE/HEr78h4VI+zpgtYqByBJTHENVcE6D6x1FDd82rgi5LZZNZaTiJYDCeqCA=;
Received: from flow-b5-smtp.messagingengine.com ([202.12.124.140])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vGlFk-0002BE-Ft; Wed, 05 Nov 2025 21:41:17 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailflow.stl.internal (Postfix) with ESMTP id 1739B1300C2C;
 Wed,  5 Nov 2025 16:24:03 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Wed, 05 Nov 2025 16:24:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm3; t=
 1762377842; x=1762385042; bh=EVCZm+k0TFnzyISAYv/ad61W8yGyS+Ggtni
 ecPh35bI=; b=HmU5hGoPqokqzJCeAqGf4BLGNy0MGNPv7gplJ67n7ajHRRuR5XU
 QACgC7SBMngKWRr4nVPjJJgBKA3Q8lvkyUIGSJ1J47cOcYiClbPU1pS4MppGb5wh
 2U2/xgadcENW/jgHJsJTyYYdk+1XjojR7/TQqmLQq3cUPGl27XnIya4CBHC1wN5U
 B+nehvMy/L9Mb2tEVTuU62Q/a0ARwc5MO2szCGIyxpVtm6vXzecjyFmyuGF+NoPC
 aDoFRHfQnTUA0wUc9ga83EokX5Vq/Y4zVF59Z0IqpO5AZkbSr//2iHDO/uH6Mdle
 v+KzAJeRAhAF2PY5f//xFYICp+6h/EtUY0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762377842; x=
 1762385042; bh=EVCZm+k0TFnzyISAYv/ad61W8yGyS+GgtniecPh35bI=; b=q
 SmEJgx4M8dlmgTjoUZkSr8FLucgLUEVlbd9odWDFkQcMJ+PFRsH9Y//0VRWWOa2P
 Ww7Nr0XlQSokRvZEPNvVMlDa6wHjsBAaK17Tal0oudel/kBoVldVw56udPXn9uh7
 Mczp91CekHgkQQrSfj7GW2ikHW7rCR3uH+ZZqm5byT0S1cyww1zJkHKJ+SuERDBe
 UBNUFH0g9LBeW66OTxBJSBU1+z1R+WJlAHRefWLPYecfVMfJsDxhw/7LXOajVkRK
 EY0gezm21MwMMJYPZofen2+s3eL3i0IyTk0/RNQdye2aRU/x2B6K2Dlf35uwcujj
 UVMV0x49c00E0JFs7mDIA==
X-ME-Sender: <xms:asALaQBQoSVaUuTXtcG_GYkEHX7ZGK1IdW3-DpTTeAob7NvcdQnESw>
 <xme:asALaZvvSYTRURk71wOmt1sLYQpre30qKc9hcTtEoays4h59X1vNTOzcXv4ewIAT7
 PBP05Cv2IT0eKS3Y5hzt-pSpQXWpNcWFPc3z3tPuShZJnbiAw>
X-ME-Received: <xmr:asALaV1K1vj_trpV4WX4Ug9tckywabHWFw4izsBwBHNEfUZdhT2LhWV0hKbStCEFmuTyATTpSjnEcu5m6FzT9u-CFv5Y_mYw-vIlsrnNGGDt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeegleejucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurheptgfgggfhvfevufgjfhffkfhrsehtqhertddttdejnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epleejtdefgeeukeeiteduveehudevfeffvedutefgteduhfegvdfgtdeigeeuudejnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
 esohifnhhmrghilhdrnhgvthdpnhgspghrtghpthhtohepleegpdhmohguvgepshhmthhp
 ohhuthdprhgtphhtthhopehvihhrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhkpd
 hrtghpthhtohepfhhrrghnkhdrlhhisehvihhvohdrtghomhdprhgtphhtthhopehlihhn
 uhigqdigfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
 dquhhnihhonhhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
 uhigqdhnihhlfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
 hugidqnhhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhig
 qdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
 igqdhhrghruggvnhhinhhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
 lhhinhhugidqfhhsuggvvhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:asALafmPr_ZX1OBseZ_yN5P8ha0kcdOo70DqfQ-d7eox1J3FRhMuTg>
 <xmx:asALaYv6caGo7YOyqxlwHt-aa7xcS6ubR74B6joQPFkP4nVa857B-Q>
 <xmx:asALaQazXCEbXKvEWtOde9MGMuFd4iSpENdxHY6Br8A6SQLP9UCqOg>
 <xmx:asALaUc6XxQI42baNH5r4oVKLbArJeUxiTNL9duhGxUFeugLz9diCA>
 <xmx:csALaZ2nr3Xo9lu7ZwRVoMnu5vfNzgtS4RKi9tfb5i1b6hqQye68vliH>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Nov 2025 16:23:32 -0500 (EST)
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Jeff Layton" <jlayton@kernel.org>
In-reply-to: <20251105-create-excl-v1-1-a4cce035cc55@kernel.org>
References: <20251105-create-excl-v1-1-a4cce035cc55@kernel.org>
Date: Thu, 06 Nov 2025 08:23:24 +1100
Message-id: <176237780417.634289.15818324160940255011@noble.neil.brown.name>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 06 Nov 2025, Jeff Layton wrote: > Since ce8644fcadc5
 ("lookup_open(): expand the call of vfs_create()"), > the "excl" argument
 to the ->create() inode_operation is always set to > true. Remove [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [neilb(at)ownmail.net]
X-Headers-End: 1vGlFk-0002BE-Ft
Subject: Re: [f2fs-dev] [PATCH] vfs: remove the excl argument from the
 ->create() inode_operation
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Paulo Alcantara <pc@manguebit.org>,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 Tyler Hicks <code@tyhicks.com>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, Jan Harkes <jaharkes@cs.cmu.edu>,
 linux-um@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
 David Hildenbrand <david@redhat.com>, Jeff Layton <jlayton@kernel.org>,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, codalist@coda.cs.cmu.edu,
 Namjae Jeon <linkinjeon@kernel.org>, Yangtao Li <frank.li@vivo.com>,
 ocfs2-devel@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Theodore Ts'o <tytso@mit.edu>,
 Muchun Song <muchun.song@linux.dev>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, gfs2@lists.linux.dev,
 Anna Schumaker <anna@kernel.org>, linux-efi@vger.kernel.org,
 Martin Brandenburg <martin@omnibond.com>, Kees Cook <kees@kernel.org>,
 Yuezhang Mo <yuezhang.mo@sony.com>, Carlos Maiolino <cem@kernel.org>,
 Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org,
 linux-hardening@vger.kernel.org, Marc Dionne <marc.dionne@auristor.com>,
 linux-afs@lists.infradead.org, Miklos Szeredi <miklos@szeredi.hu>,
 coda@cs.cmu.edu, Viacheslav Dubeyko <slava@dubeyko.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, ceph-devel@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, David Howells <dhowells@redhat.com>,
 linux-nfs@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 samba-technical@lists.samba.org, Steve French <sfrench@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, ntfs3@lists.linux.dev,
 Hans de Goede <hansg@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Bob Copeland <me@bobcopeland.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-mm@kvack.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Ard Biesheuvel <ardb@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, ecryptfs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, v9fs@lists.linux.dev,
 linux-unionfs@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>,
 Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 06 Nov 2025, Jeff Layton wrote:
> Since ce8644fcadc5 ("lookup_open(): expand the call of vfs_create()"),
> the "excl" argument to the ->create() inode_operation is always set to
> true. Remove it, and fix up all of the create implementations.

nonono


> @@ -3802,7 +3802,7 @@ static struct dentry *lookup_open(struct nameidata *nd, struct file *file,
>  		}
>  
>  		error = dir_inode->i_op->create(idmap, dir_inode, dentry,
> -						mode, open_flag & O_EXCL);
> +						mode);

"open_flag & O_EXCL" is not the same as "true".

It is true that "all calls to vfs_create() pass true for 'excl'"
The same is NOT true for inode_operations.create.

NeilBrown



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
