Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D151FD1F186
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jan 2026 14:40:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nswz/r98bhe7rtCNDUZWC3jKSFnzIy01ByrliIT/eF8=; b=VteUOk3/YwLgKkc1sRKkgrUg+U
	ATD23gmJphKGLFv5otb6K8m8xDaSTXikyiP6WdkR5Ure0xxg2KpLAdVo2O32RCP8GF08EiqPcMjpE
	a6fohNbLtPHYvYrP0ibeaWQEVGNsrKPguo3b5LKR1HEaonrjXbIXj3i7dcMDI2rQXDd4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vg16h-0007iG-OP;
	Wed, 14 Jan 2026 13:40:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david.laight.linux@gmail.com>) id 1vg16a-0007hY-Jj
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 13:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5wmwTmp5IFzHOcZYUSrwZ2WCFgEOIoQQbhD/zBC9MXc=; b=cEQ0nHQmPYDIqjct2BEmpyzEsH
 eEs0KcE377pnwsZs7nh76fIZs7iRHUNlvGTIW4El57wAMoywKa0fVK/acfrHHdJEL7mEkNijrEJIK
 N6SXkSskpk5qvN1BHWo/Ixi1BikDH+hpvzXMAdFrrqNf4V/P27PcWck6QCBw63NLuqpA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5wmwTmp5IFzHOcZYUSrwZ2WCFgEOIoQQbhD/zBC9MXc=; b=AlbASagCfuk2On2i6A9gXkGJY1
 HyrgaJGqSzmF0YIO7S6tVeQ/P+9m2/ZaoOrDAeVSQS6QSscucSbwbQWwsEuDC644TduGvnNScQqpB
 rqSa6/pkEfIo5SmUUkmajlIHL6zXGRGh/ajTNZpDyn1nEejmr7T81liW4B41gqF5eEJY=;
Received: from mail-wr1-f52.google.com ([209.85.221.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vg16a-0007XI-VR for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 13:40:13 +0000
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-4327555464cso5205692f8f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Jan 2026 05:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768398001; x=1769002801; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5wmwTmp5IFzHOcZYUSrwZ2WCFgEOIoQQbhD/zBC9MXc=;
 b=eG//6mW17QblSHenuEumSShFTvEl8X06d2loJZ/8VkY12GaUd3XhbabGhAEjVes1qb
 PAt1qNht1/FIEJt7MtIXT3ZIBULjDPdrOHjS/eWeXetZ3qLh7j31qUVOC67A67afbfc2
 FJptFZwjmYcY6DyS1XaW8sxQUxIm1IYUhYUgI6yhh2pIS5GPesX0ipLBDp6h9E2X0AbZ
 9LO+vebRaCsFwI9HJ+fqebR+HF4XC+2KGLUVEJ+DgZp5mepbm9dLxw7Caa1jyGjKUZH5
 5Fev2QggHjuIgELxRLKDwG9ZB200lWvyDspQNIgoKAeo3kWX2cZhERJUCPo4DVSMOz0M
 L7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768398001; x=1769002801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5wmwTmp5IFzHOcZYUSrwZ2WCFgEOIoQQbhD/zBC9MXc=;
 b=JZxkYfDotCv8LXH4Qijexu/OeKr/4RZqcRtUorJTqqsZCr04QfPGlq/DkI+5LuxCg0
 hUw9hHelW+vBgzcP40VJiiNloLZ4fmhOIMNv3bpiFsd2ZTNvngfEys3eeGnyYZS4qi6D
 1nBgR7ey1vY4+3/ji7a+sjqhmTr6mNd6kJMQX1l4Qe6WPu70+9kxK3EaWniS1a9ckX5C
 wWU1siBmtj7/rl9YHuBB9bvi3twKqyYmMhBy0B7BOwswFe41LGMRW9haW3hidY8uGRpJ
 Lyns59jLrMMVLEqXTh3U+U3+9kn/t+YPX70VR2om1JTnvGZ9V3TCUpzKaNKGanMuV+69
 dObw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxKM5zvFOrZbsc3VmqpaPuXrKe1BFOP/wvsCd0xQCrht1IzTpg+poo1KI1g2J3JAA7lPIIz4vgVsjtFTjXdDmj@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxQ1JZVZ4JL00CFoPveLlinuBLyMwbgufTnuszdccC2BVj1O2e7
 GktcLLeNqoHUBAlvoEvI5Idf1SJSuHJhNoTOI4MplArmWhVW6xDtUWQV
X-Gm-Gg: AY/fxX7c6jWK2wxpGnIhZ3Ef6F/QIHBaUtCyKnDrt1iL+AxCizdGjp27ec+i0+v7u9s
 4ScPr7UuVp/mghp5lILFsbVCUzpAM2xdjf+mYkLNc93/v2rZ7OLooBALQchj6p2ms90JFv5TM70
 7SBbAe2vCEalsgbtt4GC/E99map50e+eI79UpgPhU25EXMQEDbOhE+kHUlM+7SA0W9LXGvpFLPk
 Nf1tuMj86fbBPkJQY1NUd7UB9xZNgkuu9NNT7fDSqy89EODkh8QQJcTmX9P1nZdjF7f9yqBIl57
 GktOUazDR/8kBPIArHGw+osnPUvEXS2GfSHx76iqczPqcqr0Oniin18OmfMdNLhCBzrUeDtRRmr
 UNeSqDU8L499Y9n6Zpw6OSKFCJat0+2ZdAHyEtc+vez7OddEhu64GJRWPMYZc4H1U7tD/LZbfwy
 zBtU+OO2csYO8c4TiSbjvUOPdn8CschLa5xZAbWJPCSw7bPNQ8fX8V
X-Received: by 2002:a5d:53c9:0:b0:432:5bf9:cf2e with SMTP id
 ffacd0b85a97d-4342c3ef274mr2643750f8f.13.1768398001040; 
 Wed, 14 Jan 2026 05:40:01 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5edd51sm50238105f8f.29.2026.01.14.05.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 05:40:00 -0800 (PST)
Date: Wed, 14 Jan 2026 13:39:55 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20260114133955.0a9f5cd3@pumpkin>
In-Reply-To: <CAOQ4uxhMjitW_DC9WK9eku51gE1Ft+ENhD=qq3uehwrHO=RByA@mail.gmail.com>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <m3mywef74xhcakianlrovrnaadnhzhfqjfusulkcnyioforfml@j2xnk7dzkmv4>
 <8af369636c32b868f83669c49aea708ca3b894ac.camel@kernel.org>
 <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
 <ec78bf021fa1f6243798945943541ba171e337e7.camel@kernel.org>
 <cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com>
 <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
 <20260113-mondlicht-raven-82fc4eb70e9d@brauner>
 <aWZcoyQLvbJKUxDU@infradead.org>
 <ce418800f06aa61a7f47f0d19394988f87a3da07.camel@kernel.org>
 <aWc3mwBNs8LNFN4W@infradead.org>
 <CAOQ4uxhMjitW_DC9WK9eku51gE1Ft+ENhD=qq3uehwrHO=RByA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 14 Jan 2026 10:34:04 +0100 Amir Goldstein wrote: >
 On Wed, Jan 14, 2026 at 7:28 AM Christoph Hellwig wrote: > > > > On Tue,
 Jan 13, 2026 at 12:06:42PM -0500, Jeff Layton wrote: > > > Fair point, but
 it's not that hard to conceive of a situation wh [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [david.laight.linux(at)gmail.com]
 1.0 FORGED_GMAIL_RCVD 'From' gmail.com does not match 'Received' headers
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.52 listed in wl.mailspike.net]
X-Headers-End: 1vg16a-0007XI-VR
Subject: Re: [f2fs-dev] [PATCH 00/24] vfs: require filesystems to explicitly
 opt-in to lease support
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
 Alexander Aring <alex.aring@gmail.com>, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Sandeep Dhavale <dhavale@google.com>,
 Martin Brandenburg <martin@omnibond.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Anders Larsen <al@alarsen.net>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 jfs-discussion@lists.sourceforge.net, linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ilya Dryomov <idryomov@gmail.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Yue Hu <zbestahu@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, devel@lists.orangefs.org,
 Hugh Dickins <hughd@google.com>, "Matthew Wilcox
 \(Oracle\)" <willy@infradead.org>, ntfs3@lists.linux.dev,
 Christoph Hellwig <hch@infradead.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 linux-mm@kvack.org, Viacheslav Dubeyko <slava@dubeyko.com>,
 linux-btrfs@vger.kernel.org, Gao Xiang <xiang@kernel.org>,
 linux-ext4@vger.kernel.org, Salah Triki <salah.triki@gmail.com>,
 Carlos Maiolino <cem@kernel.org>, Dominique Martinet <asmadeus@codewreck.org>,
 Shyam Prasad N <sprasad@microsoft.com>, samba-technical@lists.samba.org,
 linux-doc@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, Tom Talpey <tom@talpey.com>,
 ocfs2-devel@lists.linux.dev, Bharath SM <bharathsm@microsoft.com>,
 linux-nilfs@vger.kernel.org, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, Hans de Goede <hansg@kernel.org>,
 gfs2@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 linux-erofs@lists.ozlabs.org, v9fs@lists.linux.dev,
 Jonathan Corbet <corbet@lwn.net>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 Trond Myklebust <trondmy@kernel.org>, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCAxNCBKYW4gMjAyNiAxMDozNDowNCArMDEwMApBbWlyIEdvbGRzdGVpbiA8YW1pcjcz
aWxAZ21haWwuY29tPiB3cm90ZToKCj4gT24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgNzoyOOKAr0FN
IENocmlzdG9waCBIZWxsd2lnIDxoY2hAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24g
VHVlLCBKYW4gMTMsIDIwMjYgYXQgMTI6MDY6NDJQTSAtMDUwMCwgSmVmZiBMYXl0b24gd3JvdGU6
ICAKPiA+ID4gRmFpciBwb2ludCwgYnV0IGl0J3Mgbm90IHRoYXQgaGFyZCB0byBjb25jZWl2ZSBv
ZiBhIHNpdHVhdGlvbiB3aGVyZQo+ID4gPiBzb21lb25lIGluYWR2ZXJ0YW50bHkgZXhwb3J0cyBj
Z3JvdXBmcyBvciBzb21lIHNpbWlsYXIgZmlsZXN5c3RlbTogIAo+ID4KPiA+IFN1cmUuICBCdXQg
aG93IGlzIHRoaXMgd29yc2UgdGhhbiBhY2NpZGVudGFsbHkgZXhwb3J0aW5nIHByaXZhdGUgZGF0
YQo+ID4gb3IgYW55IG90aGVyIG1pc2NvbmZpZ3VyYXRpb24/Cj4gPiAgCj4gCj4gTXkgUE9WIGlz
IHRoYXQgaXQgaXMgbGVzcyBhYm91dCBzZWN1cml0eSAoYXMgeW91ciBxdWVzdGlvbiBpbXBsaWVz
KSwgYW5kCj4gbW9yZSBhYm91dCBjb3JyZWN0bmVzcy4KPiAKPiBUaGUgc3BlY2lhbCB0aGluZyBh
Ym91dCBORlMgZXhwb3J0LCBhcyBvcHBvc2VkIHRvLCBzYXksIGtzbWJkLCBpcwo+IG9wZW4gYnkg
ZmlsZSBoYW5kbGUsIElPVywgdGhlIGV4cG9ydF9vcGVyYXRpb25zLgo+IAo+IEkgcGVyY2VpdmUg
dGhpcyBhcyBhIHZlcnkgc3RyYW5nZSBhbmQgdW5kZXNpcmVkIHNpdHVhdGlvbiB3aGVuIE5GUwo+
IGZpbGUgaGFuZGxlcyBkbyBub3QgYmVoYXZlIGFzIHBlcnNpc3RlbnQgZmlsZSBoYW5kbGVzLgo+
IAo+IEZVU0Ugd2lsbCBnbGFkbHkgb3BlbiBhIGNvbXBsZXRlbHkgZGlmZmVyZW50IG9iamVjdCwg
c29tZXRpbWVzCj4gYSBkaWZmZXJlbnQgb2JqZWN0IHR5cGUgZnJvbSBhbiBORlMgY2xpZW50IHJl
cXVlc3QgYWZ0ZXIgc2VydmVyIHJlc3RhcnQuCj4gCj4gSSBzdXBwb3NlIHRoYXQgdGhlIHNhbWUg
Y291bGQgaGFwcGVuIHdpdGggdG1wZnMgYW5kIHByb2JhYmx5IHNvbWUKPiBvdGhlciBmcy4KLi4u
CgpZb3UgcmVhbGx5IHNob3VsZG4ndCBiZSBhbGxvd2VkIHRvIG5mcyBleHBvcnQgYSBmcyB0aGF0
IGRvZXNuJ3QgaGF2ZQpwZXJzaXN0ZW50IGZpbGUgaGFuZGxlcy4KCkV2ZW4gZmlsZSBoYW5kbGVz
IGNvbnRhaW5pbmcgJ3JhbmRvbScgbnVtYmVycyBjYW4gYmUgcHJvYmxlbWF0aWMuClRoZSBkZWZh
dWx0IHVzZWQgdG8gYmUgJ2hhcmQgbW91bnRzJyAobm90IHN1cmUgaXQgaXMgYW55IG1vcmUpIHdo
aWNoCmNhdXNlZCB0aGUgY2xpZW50IChub3QgTGludXggLSB0b28gbG9uZyBhZ28pIHRvIGxvb3Ag
aW4ga2VybmVsCmZvcmV2ZXIgd2FpdGluZyBmb3IgdGhlIHNlcnZlciB0byByZWNvdmVyIHRoZSBm
aWxlc3lzdGVtIGV4cG9ydC4KVGhlIG9ubHkgcmVzb2x1dGlvbiBvbiB0aGF0IHN5c3RlbSB3YXMg
dG8gcmVib290IHRoZSBjbGllbnQuCgpBdCBsZWFzdCBuZnMgY2FuIG5vdyB1c2UgdmFyaWFibGUg
c2l6ZSBmaWxlLWlkcy4KV2hlbiBJIHdhcyBmaXhpbmcgc29tZSBjb2RlIHRoYXQgZXhwb3J0ZWQg
YSBsYXllcmVkIGZzIChJIHByZXR0eQptdWNoIHJld3JvdGUgdGhlIGZzIGF0IHRoZSBzYW1lIHRp
bWUpIEkgZGlkIHJhbmRvbWlzZSB0aGUgZmlsZS1pZHMKc28gdGhleSAoaG9wZWZ1bGx5KSBiZWNh
bWUgaW52YWxpZCBhZnRlciBhIHJlYm9vdCAob25seSBhZnRlciBzdWZmZXJpbmcKc29tZSB2ZXJ5
IGNvcnJ1cHQgZmlsZXN5c3RlbXMhKQpJIGZvdW5kIG5mcyAob3ZlciB1ZHApIGhhZCBzb21lIGlu
dGVyZXN0aW5nICdmZWF0dXJlcyc6Ci0gSWYgeW91IGV4cG9ydCBwYXJ0IG9mIGEgZnMgeW91IGV4
cG9ydCBhbGwgb2YgaXQuCiAgKEVzcGVjaWFsbHkgc2luY2UgdGhpcyBwcmVkYXRlZCB0aGUgcmFu
ZG9taXNhdGlvbiBvZiB0aGUgaW5vZGUKICBnZW5lcmF0aW9uIG51bWJlci4pCi0gSWYgeW91IGdp
dmUgYW55b25lIGFjY2VzcyB5b3UgZ2l2ZSBldmVyeW9uZSBhY2Nlc3MuCi0gSWYgeW91IGdpdmUg
YW55b25lIHdyaXRlIGFjY2VzcyB5b3UgZ2l2ZSBldmVyeW9uZSB3cml0ZSBhY2Nlc3MuClRoZSBs
YXR0ZXIgdHdvIGJlY2F1c2UgdGhlICdtb3VudCcgcHJvdG9jb2wgd2Fzbid0IHJlYWxseSBuZWVk
ZWQKYW5kIHRoZSBzZXJ2ZXIgZGlkbid0IGNhcmUgd2hlcmUgcmVxdWVzdHMgY2FtZSBmcm9tLgoK
CURhdmlkCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
