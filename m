Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40593C41FB6
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 08 Nov 2025 00:38:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:Message-id:Date:References:In-reply-to:To:From:MIME-Version:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHd9onHjMVNmFpGYp49bvqLO991ONBw6jWvSMPtT3jE=; b=g6tZuTSyV4RkpOswxZWYu5CwJ7
	qMPEsrBhcaWpt6zpG7u6JsDockZS3V9ZUNTZ3vibAgOuj9D/lBTPaqX0s3KrATH8EJWH7mzfZmXRk
	JkM4n7WhLy+uhaaRlbzCLp0rVbER4IhR4vvuXndCYcqKbA1GtZjPE5uPMSU8pArjm0X0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vHW22-0001qD-7a;
	Fri, 07 Nov 2025 23:38:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <neilb@ownmail.net>) id 1vHW20-0001ps-Of;
 Fri, 07 Nov 2025 23:38:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Message-id:Date:References:In-reply-to:
 Subject:Cc:To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:Sender
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZcRWR0XGRVohQHNqpTmVOGqvgKfDCmeABc6Q5B6kVA0=; b=KdxrmZeWMyR019nZZRIN8hcuPx
 9eyZgz4rUbSmh2hKtknl4eNBvYSSROPh3r1L56W47UGmREXhIWe5K9AYlS9st2WACyjUDFsSVpsGS
 sxkLh2yGXBManXOjIrh6Hw5Oa6tNEgtfmtNRHYQzasIjt0KpUsruASGJ14clqawpX5TE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Reply-To:Message-id:Date:References:In-reply-to:Subject:Cc:To:From:
 MIME-Version:Content-Transfer-Encoding:Content-Type:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZcRWR0XGRVohQHNqpTmVOGqvgKfDCmeABc6Q5B6kVA0=; b=HqEqFaEESdb8HaT5c+SsQReFx0
 WB9HvXa2t3LzteXGSnK5ge243Df6rplZWBMrX0xdmHSSyKtkz7Fk9f/p30yyRrbp1ZFW0YiCJ22Z0
 U7WSSHmhfJzad5UaToz/tO14ZFOzl/7C1zcCzyf3bEn2UZN7t+Q4dpWKa7WCdSUuxu5A=;
Received: from flow-b3-smtp.messagingengine.com ([202.12.124.138])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vHW1z-0001AU-JX; Fri, 07 Nov 2025 23:38:12 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailflow.stl.internal (Postfix) with ESMTP id 3696013001EB;
 Fri,  7 Nov 2025 18:38:03 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Fri, 07 Nov 2025 18:38:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm3; t=
 1762558683; x=1762565883; bh=ZcRWR0XGRVohQHNqpTmVOGqvgKfDCmeABc6
 Q5B6kVA0=; b=E4OMnSLCME0PmpfRUhAwNxIceLFq3/FAK5GtwevM7iICUCUuV5x
 chVCFB6fdmay7+ooFw0uv6Azy1ChdRqJqvR+mkrCRIpg73LnR+/X59PszjPwZ/rz
 8CPuwHb/xwC5N1QSJvSaLdjI57addGAeTJRkLimMYRo6wgCZPhDhW+hNxZlCxMuJ
 hAPkIxK9zjio+5tvTHBm3a+bqM8CDMop81FHuSYzFd2NCfNmjV5NgDtUDa2Eyf25
 3VuDhIEZvIbIrGiHuAnMLfItwaVgsWO7Q33GX+ggP6/jGDAegWeYBoQRn47aNko2
 PunoNsPduYvN8zewgDdm1dEy75bfZgIQYaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762558683; x=
 1762565883; bh=ZcRWR0XGRVohQHNqpTmVOGqvgKfDCmeABc6Q5B6kVA0=; b=a
 v+lzygtoc1HX4ZadDskwTpZwJtb1oG3peL6O0gr4iO5O5jYd+vaRP7/no7N27oF3
 EzxSXy6KoH6IHmfzzAjLPr0QATO37tQfExkHIQ/kLMEtcMIpZa9opvRREQRlIldG
 Q9D0WkBAPuYtKKTvP1JAxo1/Rx7n6G2bitd51++grbdTyzCWIWx3DW0/Nhivcp1A
 s7ZtqshuHntLjgQgQJ+crHlgWYzKyD5izePEyTID8AqXRiIHiDEt9qwC/wQbmAXC
 g/7fHF+pLwFi9swg49B8mIz8mdbJ+nyJwVG9AYbNRT/JTg129nrTn8NZkPgHxX+2
 7BatW30ZGfoIC5BANZTig==
X-ME-Sender: <xms:04IOaUS1llkqfnpj0hP0k9hck1nUGtgZum40Y0dtCM64yfklBqqJ5g>
 <xme:04IOaV4vrSP4x6QNhepje5WcwIcNTd1apJim4xvCzIrniX8SAiYXqKNGGHIuD1WKQ
 33nU51_RKbR52XMFfrIspvHlzrBn079yJ8CWMmi6dxhoUy63Q>
X-ME-Received: <xmr:04IOaT3MWpLgDLL757W25o-tMfqjGpak2vFwG2uUDPGL2GuLLHFgVWSCwflcxilp3PZXpLTiHfR-SxGJx5w8TjROMf9sHRUcJd4NP_ZWYt62>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduledutddtucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegouf
 hprghmfghrlhculdeftddtmdenucfjughrpegtgfgghffvvefujghffffkrhesthhqredt
 tddtjeenucfhrhhomheppfgvihhluehrohifnhcuoehnvghilhgssehofihnmhgrihhlrd
 hnvghtqeenucggtffrrghtthgvrhhnpedvueetleekjeekveetteevtdekgeeludeifedt
 feetgfdttdeljefglefgveffieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuuf
 hprghmfghrlhephhhtthhpshemsddslhhorhgvrdhkvghrnhgvlhdrohhrghdsrghllhds
 jeeiieeffeeileekvdeltdehuddurdehfedtvdekfeekqdelqdgurghvvgdrhhgrnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsges
 ohifnhhmrghilhdrnhgvthdpnhgspghrtghpthhtohepleejpdhmohguvgepshhmthhpoh
 huthdprhgtphhtthhopehvihhrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhkpdhr
 tghpthhtohepfhhrrghnkhdrlhhisehvihhvohdrtghomhdprhgtphhtthhopehlihhnuh
 igqdigfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidq
 uhhnihhonhhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
 igqdhnihhlfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
 gidqnhhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
 hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhig
 qdhhrghruggvnhhinhhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
 hinhhugidqfhhsuggvvhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:04IOaUUP8Agp5i-ePskgdOIZ3qDw3X8wH2n0PkSgIS-qUH6nBwUnqg>
 <xmx:04IOaTnQGxLDK6TRtOgEGVijEWvd6FvZOuwL0vyqcWwYM4LX-zVZXA>
 <xmx:04IOaVhEuGeVrKovELx7lzKD-9IxEW9YEYZ2LQZX-iUA996QSWwOgg>
 <xmx:04IOab5K6Z-7wWhbIK2-S_EvLNyL4_2HwgPfi2l7GSRp7-b2X_0qug>
 <xmx:24IOabMc8-grgTNo-sBp23kB4IC_01hhvLJuap-Y8_HG_nozNoQTctxM>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Nov 2025 18:37:32 -0500 (EST)
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Jeff Layton" <jlayton@kernel.org>
In-reply-to: <f5a2c41e4f272fef9f1525e17b494dd4b4bcb529.camel@kernel.org>
References: <20251107-create-excl-v2-1-f678165d7f3f@kernel.org>,
 <176255458305.634289.5577159882824096330@noble.neil.brown.name>,
 <87ikfl1nfe.fsf@trenco.lwn.net>,
 <f5a2c41e4f272fef9f1525e17b494dd4b4bcb529.camel@kernel.org>
Date: Sat, 08 Nov 2025 10:37:30 +1100
Message-id: <176255865045.634289.1814933499430115577@noble.neil.brown.name>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, 08 Nov 2025, Jeff Layton wrote: > On Fri, 2025-11-07
 at 15:35 -0700, Jonathan Corbet wrote: > > NeilBrown <neilb@ownmail.net>
 writes: > > > > > On Sat, 08 Nov 2025, Jeff Layton wrote: > > > > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [neilb(at)ownmail.net]
X-Headers-End: 1vHW1z-0001AU-JX
Subject: Re: [f2fs-dev] LLM disclosure (was: [PATCH v2] vfs: remove the excl
 argument from the ->create() inode_operation)
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
 David Hildenbrand <david@redhat.com>, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Hugh Dickins <hughd@google.com>,
 codalist@coda.cs.cmu.edu, Namjae Jeon <linkinjeon@kernel.org>,
 Yangtao Li <frank.li@vivo.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Jaegeuk Kim <jaegeuk@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Theodore Ts'o <tytso@mit.edu>, ocfs2-devel@lists.linux.dev,
 Muchun Song <muchun.song@linux.dev>,
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

On Sat, 08 Nov 2025, Jeff Layton wrote:
> On Fri, 2025-11-07 at 15:35 -0700, Jonathan Corbet wrote:
> > NeilBrown <neilb@ownmail.net> writes:
> > 
> > > On Sat, 08 Nov 2025, Jeff Layton wrote:
> > 
> > > > Full disclosure: I did use Claude code to generate the first
> > > > approximation of this patch, but I had to fix a number of things that it
> > > > missed.  I probably could have given it better prompts. In any case, I'm
> > > > not sure how to properly attribute this (or if I even need to).
> > > 
> > > My understanding is that if you fully understand (and can defend) the
> > > code change with all its motivations and implications as well as if you
> > > had written it yourself, then you don't need to attribute whatever fancy
> > > text editor or IDE (e.g.  Claude) that you used to help produce the
> > > patch.
> > 
> > The proposed policy for such things is here, under review right now:
> > 
> >   https://lore.kernel.org/all/20251105231514.3167738-1-dave.hansen@linux.intel.com/
> > 
> > jon
> 
> Thanks Jon.
> 
> I'm guessing that this would fall under the "menial task"
> classification, and therefore doesn't need attribution. This seems
> applicable:
> 
> + - Purely mechanical transformations like variable renaming
> 
> This is a little different, but it's a similar rote task.
> -- 
> Jeff Layton <jlayton@kernel.org>
> 

The bit I particularly liked was:

+
+Even if your tool use is out of scope you should still always consider
+if it would help reviewing your contribution if the reviewer knows
+about the tool that you used.
+

"would it help the reviewer"?  I agree that is a key question.  In your
case I cannot see how it would help.

Thanks,
NeilBrown


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
