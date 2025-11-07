Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2ADC41D40
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 07 Nov 2025 23:30:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:Message-id:Date:References:In-reply-to:To:From:MIME-Version:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p9Sw/OcURdDzRSu2ubnCnZqm89Xrx4+p34heBGAt7A0=; b=bEWPJyQCvvTlqmOu8SDM28Bu2J
	D92HHpO0Om8w2mm7lRAvi7G2oJ9QVOAo/dC/mVahI/W4t2N/yc3JueYcgckzKwwOHk0c87wCEqAtT
	/GgZrJwUxJBg+iBC+FfzvNCsgrWPlpL/CP7VlHaNQt4Tv+LB5Z7AU1pzO1egY/j0swfs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vHUyW-0002Ps-KO;
	Fri, 07 Nov 2025 22:30:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <neilb@ownmail.net>) id 1vHUyT-0002PW-KV;
 Fri, 07 Nov 2025 22:30:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Message-id:Date:References:In-reply-to:
 Subject:Cc:To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:Sender
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZwkPbF9nsnt/dQhVAIT39vJvv4cO/9hCxNuUVfACV+4=; b=WcYoNJEbeL+C36uNwXz2Ql6qmA
 HaCaJpJLW2CMNLXaViYELkQCoGwNF9aITuff78lK/aUk8+hDlHrwssHCx0GRSLDiLuhR31PXyBav0
 IGtSE8aZhquGxk0U6W7XsFXeP5dbFYzuwM76E2AtUIelOqQIM87XGvtxkQDUZ2Ws3RwA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Reply-To:Message-id:Date:References:In-reply-to:Subject:Cc:To:From:
 MIME-Version:Content-Transfer-Encoding:Content-Type:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZwkPbF9nsnt/dQhVAIT39vJvv4cO/9hCxNuUVfACV+4=; b=cmQDfrAzSXV6WSvE0RGKH5Q2Pb
 KYdPbhYWnS7BQSeFQbW5pfnP2ipsTy03dPvUGyJtKZa9/zpVQOqekYOMfOA4fyxgpB2/1fyojpzSC
 mfuQ+ZsfyCl8azvoRcoeHXq/C8xWaw3J3V0oIuuSY1H+bUWjiKhX6nEfYjqA0yHXd1jU=;
Received: from flow-b3-smtp.messagingengine.com ([202.12.124.138])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vHUyS-0006Q5-PJ; Fri, 07 Nov 2025 22:30:29 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailflow.stl.internal (Postfix) with ESMTP id 793A513004D8;
 Fri,  7 Nov 2025 17:30:15 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Fri, 07 Nov 2025 17:30:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm3; t=
 1762554615; x=1762561815; bh=ZwkPbF9nsnt/dQhVAIT39vJvv4cO/9hCxNu
 UVfACV+4=; b=RSl+2OvmuLLOe4+H9eKpqC9RuowrdRH1jGe8qwVoOfdZ4I27ekS
 h347QoJGR7MbFLykEaO1W0OFpHRCXityFGk6z/rxp66MZo+KGt12LqqTInEw2CYx
 3UVsJ0CnGd7WLdxCGmc3/jPkOyINCLxKnxNZklsUc3J3YikUBo2z3iRjiXQtMcY8
 yq2lYeSEAVc2EWLQj1vGWye7x7mEIpjRksMMLReKQwYai89hN6GT0qLs9w2fXT/S
 aMCWnv9MVDkZT/W5daTSkcLSwc8NcaRJOdNaOs10bJXlSp1ckOlZsLuPaoex29HZ
 f8A5rEk01MsQM2q7vJ8gaDY5oWS9+X43upg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762554615; x=
 1762561815; bh=ZwkPbF9nsnt/dQhVAIT39vJvv4cO/9hCxNuUVfACV+4=; b=U
 uwaUA5HM3Mo8/6XH0sr3iEvIm8qkyq18WHGz5dmT4o3VuNPYFK0sT5/XwMakgpxt
 Ddom64XoCKrACYy2h4ZcgV+Tb8PW+9ZOvOvsw3PhcaXohwqssibqLdWfGuvkRTof
 t0u6Tm24jIfdJQPXMml4ZsBV3LhgKvo8idsWtpOv2NMgA6+6q/kF7vulaDiw1Wu8
 QXM1pWPcrGZS5Ickwb89bPU2A6H7dDCOZcL68OGNiBqQPLXtlFiE4VEh4FSXHbCH
 jVfBahE281hNyxR2h1puiT9DkuKNVkHHM+JFBCiTT4EucRcOcOrhAYY2UT2c/Eoo
 JZasuDe2hIsiAlgrLmPZw==
X-ME-Sender: <xms:8HIOaWcJ3fvBIlxYhSXg2q9kliHbCJheSrwA-afUtv0OZvqwXLDyaQ>
 <xme:8HIOaUV0elXG3FvBZLynkKLK1KgrkL5csSh7j4QStWTKC78ohwNtKKCTXTTHgS-gp
 tx6yHyJkUTuEkTZ5fK6ZZAuUD2GiIcU7CC_2eZ5UrNZYjQDQA>
X-ME-Received: <xmr:8HIOaZisnAl3bLTOnvZKYyms_eoqV6GZneXYuZmTxpw76w3Ai29fkPeeLdpc1Or3ahBpEelhGgOyPonxIcN_mwWmfK2BHg0p1qv3ZiVRU6Jc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduledtkeejucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurheptgfgggfhvfevufgjfhffkfhrsehtjeertddttdejnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epudetfefhudevhedvfeeufedvffekveekgfdtfefggfekheejgefhteeihffggfelnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
 esohifnhhmrghilhdrnhgvthdpnhgspghrtghpthhtohepleejpdhmohguvgepshhmthhp
 ohhuthdprhgtphhtthhopehvihhrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhkpd
 hrtghpthhtohepfhhrrghnkhdrlhhisehvihhvohdrtghomhdprhgtphhtthhopehlihhn
 uhigqdigfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
 dquhhnihhonhhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
 uhigqdhnihhlfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
 hugidqnhhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhig
 qdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
 igqdhhrghruggvnhhinhhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
 lhhinhhugidqfhhsuggvvhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:8HIOaQRYcr2XZwYm0IZqPOguq_RH9vLLuCtHHjKz_7fIxkwW75Seeg>
 <xmx:8HIOaYxjBK0ZJhgdNXL6-GZM5wqctaqKx4DPCA07b6HaSPRwb68vzg>
 <xmx:8HIOaa-QnxtUrxuCdvh7t737bdTRYVtIsmaz5JhvP3JtprsULcfyDA>
 <xmx:8HIOacn1Ltrl3NwobU3IDf3ppIfGvZcjgmhPN9__dNGKj77ZkqtQiQ>
 <xmx:93IOadG3kN8Y0sl9-bllfvn04bE55YSNPrlPh3KgJLC15UMHH_zqyJDP>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Nov 2025 17:29:44 -0500 (EST)
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Jeff Layton" <jlayton@kernel.org>
In-reply-to: <20251107-create-excl-v2-1-f678165d7f3f@kernel.org>
References: <20251107-create-excl-v2-1-f678165d7f3f@kernel.org>
Date: Sat, 08 Nov 2025 09:29:43 +1100
Message-id: <176255458305.634289.5577159882824096330@noble.neil.brown.name>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, 08 Nov 2025, Jeff Layton wrote: > With two exceptions,
 ->create() methods provided by filesystems ignore > the "excl" flag. Those
 exception are NFS and GFS2 which both also > provide ->atomic_ [...] 
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
X-Headers-End: 1vHUyS-0006Q5-PJ
Subject: Re: [f2fs-dev] [PATCH v2] vfs: remove the excl argument from the
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
 Miklos Szeredi <miklos@szeredi.hu>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, gfs2@lists.linux.dev,
 Anna Schumaker <anna@kernel.org>, linux-efi@vger.kernel.org,
 Martin Brandenburg <martin@omnibond.com>, Kees Cook <kees@kernel.org>,
 Yuezhang Mo <yuezhang.mo@sony.com>, Carlos Maiolino <cem@kernel.org>,
 Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org,
 linux-hardening@vger.kernel.org, Marc Dionne <marc.dionne@auristor.com>,
 linux-afs@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 coda@cs.cmu.edu, Viacheslav Dubeyko <slava@dubeyko.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, ceph-devel@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, David Howells <dhowells@redhat.com>,
 linux-nfs@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 samba-technical@lists.samba.org, Steve French <sfrench@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, ntfs3@lists.linux.dev,
 Hans de Goede <hansg@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Muchun Song <muchun.song@linux.dev>, Jan Kara <jack@suse.cz>,
 Dominique Martinet <asmadeus@codewreck.org>,
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

On Sat, 08 Nov 2025, Jeff Layton wrote:
> With two exceptions, ->create() methods provided by filesystems ignore
> the "excl" flag.  Those exception are NFS and GFS2 which both also
> provide ->atomic_open.
> 
> Since ce8644fcadc5 ("lookup_open(): expand the call of vfs_create()"),
> the "excl" argument to the ->create() inode_operation is always set to
> true in vfs_create(). The ->create() call in lookup_open() sets it
> according to the O_EXCL open flag, but is never called if the filesystem
> provides ->atomic_open().
> 
> The excl flag is therefore always either ignored or true.  Remove it,
> and change NFS and GFS2 to act as if it were always true.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
> Note that this is based on top of the dir delegation series [1]. LMK
> if the Documentation/ updates are too wordy.

Patch is very nice.  I don't think the documentation is too wordy.
I think it is good that the two changes to the different files say
essentially the same thing but use different words.  That helps.

Reviewed-by: NeilBrown <neil@brown.name>

> 
> Full disclosure: I did use Claude code to generate the first
> approximation of this patch, but I had to fix a number of things that it
> missed.  I probably could have given it better prompts. In any case, I'm
> not sure how to properly attribute this (or if I even need to).

My understanding is that if you fully understand (and can defend) the
code change with all its motivations and implications as well as if you
had written it yourself, then you don't need to attribute whatever fancy
text editor or IDE (e.g.  Claude) that you used to help produce the
patch.

Thanks,
NeilBrown


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
