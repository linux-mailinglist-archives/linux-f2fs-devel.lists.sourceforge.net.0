Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB6CD1D90E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jan 2026 10:34:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6JcO18tpFzNJ0+wdq5tjkAgNsKqqXXUlKxBhC6H4/g=; b=dd2/8VVjXag616TxRissBtZvM2
	gOCFB5rv/6t7Oeb6lDVOc9+0c3zTAFY1HTIDvPp1Iddj1JTqoGQpIZ9LxXzVzSGLcZWcHU74ZvIIC
	N6KLSppxgtBLQJGs9VlruAHqSZvX/ad72IPdfzJc6G3N+CFeqDXV42eY0Q6qKOAam560=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfxGo-0001nW-Kp;
	Wed, 14 Jan 2026 09:34:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <amir73il@gmail.com>) id 1vfxGm-0001nQ-Vs
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 09:34:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cV5qgJhr5qbvOPleJHxrmxwzjsLTEkwpqcVKyAw90ng=; b=T5JWGn86Xyer5J6faG3M1RTDFR
 AKb0ub7v74cnnpiTlDZoCETmjgfmJBFMcG5Yl9s7v8AFKjBIC5kiZ3weanqEj5Fc41FJYEp8qBPTB
 JRqMbNjZCGpH/ayC6L8IOtRJjqmhTz4o4bLvIPuPCHUYXBFWzot5p6ULI6RyWTT+hZsg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cV5qgJhr5qbvOPleJHxrmxwzjsLTEkwpqcVKyAw90ng=; b=fOKWazNgoeM7RZWVqdhu2I6CVj
 V6kHcvwyp69vomuQGrDDGUtn2U/tBJRk3Cb/tXQmu0na0aUyAqtIy7C3mMpSK3uLdZrKc0Y7uVxy/
 YhcWkzREqo3rdnwNJlKD/LDMzGyuUZ+HAep1MGf7mQRiVduT7e9ahEvkJNVj0Mszjv3o=;
Received: from mail-ej1-f49.google.com ([209.85.218.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vfxGm-0002Sr-IO for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 09:34:28 +0000
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b8765b80a52so72418766b.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Jan 2026 01:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768383257; x=1768988057; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cV5qgJhr5qbvOPleJHxrmxwzjsLTEkwpqcVKyAw90ng=;
 b=bZgNleF9RgyTkHlZL2DzZz4c3kuATVCfVXm+2OaAdHuIXEXKmYmmVM6QYiotnohgWc
 MshDcrpDSQAVmXPZBfAIkI2oqdMtJIAT2ROXg4P0y+BWplVp49eNXBdRUkQfhvpEmnF4
 pZd9vcw90Z8FWWJUXCtPuPWoeKWtybjm0Msge2CcnznidJlFbtfhFVZ3Fy/SUQ+MvkBP
 O2H5gGp7WytZ1pNANtOqSa9bbAwyuRvp6Dz/HP5Kg5b6+OK/FZeA+0Qs8MEp5qo+LSMH
 Nwdl61PPuY1H5t6FNtJmXHxS9O7C/AhU3USkQ6HUbNkwZ7TNwicIQi4dE4iBEG5A2WmC
 MokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768383257; x=1768988057;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cV5qgJhr5qbvOPleJHxrmxwzjsLTEkwpqcVKyAw90ng=;
 b=HFMHDB26K5EelX0KgRdEXTb6KpBmqcXdpkZN+k+B4jZMn/00ZWR/eAhp0IEOaJh7s7
 m0tINaRNaDIKXTfOo446cWXA3vXraNlTrJo/gW68CZkhYYpY5JNa8EnkFygMoW+8gH55
 2KLyCo0Bz+9BhB02izdwavhT052wkOiIwg+O/hR0e7rGDGrFVpZpz6kMVyabm87QmXR4
 BGh2uja3tNiPOsOyt+hbL0nDZtDcMjUGSeJxA5OGqG3X9nac4g8CI5XuNBAp5hne8/2d
 +e1QCacJA++kJOwUOhRq+GNoYrkEqv8xXnEiy6eUUxB2Sum3x+nhH3PV7kfpLVI2Nm8g
 Fohg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmEPJL1Uv1M08ZKbSzhBkdlFQhIVkIvyPbg0xKMHBmU3lr34+tNHkmPCnUaeKG3QKY6NtVbgvafDyPoM6bhzwX@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzQHA2Xa7THOK+Rg3WA0psbAFJHMpI/kvfaBWp4ZH7BmUbPE/UL
 zV6Io/qKJG9rk64gvKurFDD+3snJB6cL1FbfyaWOWey2TCaMCK5/JBP9Dvx42pkuBA9dL06L0C4
 QYcFpzRRGq+5k5I1Wavn0bn/GuvwflxQ=
X-Gm-Gg: AY/fxX5qkIyQ/A6soWcvdLDP1agBOsbC9fGDakMXxQQn5euTdMUkiYpGudr02hGEmL+
 8+HvUT4ngLKcHAAtb0e0PiaTtfOptYqEpgJyJWMPcOAd6J2H6pknK/nPApVHqntIicF/nDErvwd
 X5dHGsdLUe2h+Iw/m1NN4sc9nzWsV2mqfhliqswT9m8C8/JqhJClOPQ7W1CQow+Mgm1HtLr2Zoc
 ZOP1Voz0aybkZLHtv+KCLP3koXlepFKIhRT4qZqmAZOhLknqQ4w/UDeoSPCoCUoPFkbVS94zYvy
 DQx7lirMBuEnubH0IY49QfBjq5LOS4uGiitnSNek
X-Received: by 2002:a17:906:6a02:b0:b87:25a6:a906 with SMTP id
 a640c23a62f3a-b87677e0680mr108491266b.46.1768383255915; Wed, 14 Jan 2026
 01:34:15 -0800 (PST)
MIME-Version: 1.0
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
In-Reply-To: <aWc3mwBNs8LNFN4W@infradead.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 14 Jan 2026 10:34:04 +0100
X-Gm-Features: AZwV_QjTKvsgUAM6BTw2rpBHAs0ymZXhE-dNbh6dt2ll27JlZs1InITXkkYC5Xs
Message-ID: <CAOQ4uxhMjitW_DC9WK9eku51gE1Ft+ENhD=qq3uehwrHO=RByA@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 14, 2026 at 7:28 AM Christoph Hellwig wrote: >
 > On Tue, Jan 13, 2026 at 12:06:42PM -0500, Jeff Layton wrote: > > Fair point, 
 but it's not that hard to conceive of a situation where > > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.49 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [amir73il(at)gmail.com]
X-Headers-End: 1vfxGm-0002Sr-IO
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
 Hugh Dickins <hughd@google.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, ntfs3@lists.linux.dev,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-mm@kvack.org,
 Viacheslav Dubeyko <slava@dubeyko.com>, linux-btrfs@vger.kernel.org,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, Carlos Maiolino <cem@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
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

T24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgNzoyOOKAr0FNIENocmlzdG9waCBIZWxsd2lnIDxoY2hA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEphbiAxMywgMjAyNiBhdCAxMjowNjo0
MlBNIC0wNTAwLCBKZWZmIExheXRvbiB3cm90ZToKPiA+IEZhaXIgcG9pbnQsIGJ1dCBpdCdzIG5v
dCB0aGF0IGhhcmQgdG8gY29uY2VpdmUgb2YgYSBzaXR1YXRpb24gd2hlcmUKPiA+IHNvbWVvbmUg
aW5hZHZlcnRhbnRseSBleHBvcnRzIGNncm91cGZzIG9yIHNvbWUgc2ltaWxhciBmaWxlc3lzdGVt
Ogo+Cj4gU3VyZS4gIEJ1dCBob3cgaXMgdGhpcyB3b3JzZSB0aGFuIGFjY2lkZW50YWxseSBleHBv
cnRpbmcgcHJpdmF0ZSBkYXRhCj4gb3IgYW55IG90aGVyIG1pc2NvbmZpZ3VyYXRpb24/Cj4KCk15
IFBPViBpcyB0aGF0IGl0IGlzIGxlc3MgYWJvdXQgc2VjdXJpdHkgKGFzIHlvdXIgcXVlc3Rpb24g
aW1wbGllcyksIGFuZAptb3JlIGFib3V0IGNvcnJlY3RuZXNzLgoKVGhlIHNwZWNpYWwgdGhpbmcg
YWJvdXQgTkZTIGV4cG9ydCwgYXMgb3Bwb3NlZCB0bywgc2F5LCBrc21iZCwgaXMKb3BlbiBieSBm
aWxlIGhhbmRsZSwgSU9XLCB0aGUgZXhwb3J0X29wZXJhdGlvbnMuCgpJIHBlcmNlaXZlIHRoaXMg
YXMgYSB2ZXJ5IHN0cmFuZ2UgYW5kIHVuZGVzaXJlZCBzaXR1YXRpb24gd2hlbiBORlMKZmlsZSBo
YW5kbGVzIGRvIG5vdCBiZWhhdmUgYXMgcGVyc2lzdGVudCBmaWxlIGhhbmRsZXMuCgpGVVNFIHdp
bGwgZ2xhZGx5IG9wZW4gYSBjb21wbGV0ZWx5IGRpZmZlcmVudCBvYmplY3QsIHNvbWV0aW1lcwph
IGRpZmZlcmVudCBvYmplY3QgdHlwZSBmcm9tIGFuIE5GUyBjbGllbnQgcmVxdWVzdCBhZnRlciBz
ZXJ2ZXIgcmVzdGFydC4KCkkgc3VwcG9zZSB0aGF0IHRoZSBzYW1lIGNvdWxkIGhhcHBlbiB3aXRo
IHRtcGZzIGFuZCBwcm9iYWJseSBzb21lCm90aGVyIGZzLgoKVGhpcyBwcm9ibGVtIGlzIG9sZCBh
bmQgd2VsZGVkIGludG8gdGhlIHN5c3RlbSwgYnV0IElNTyBhZGRpbmcgbW9yZQprZXJuZWwgZmls
ZXN5c3RlbXMsIHdoaWNoIGNvbnNjaW91c2x5IGV4cG9ydCBmaWxlIGhhbmRsZXMgdGhhdCBkbyBu
b3QKc3Vydml2ZSBzZXJ2ZXIgcmVib290IGRvZXMgbm90IHNlcnZlIHVzZXJzIGludGVyZXN0cyB3
ZWxsLgoKT25lIGNvdWxkIGNsYWltIHRoYXQgdGhpcyBpcyBhIGJ1ZyB0aGF0IGNhbiBiZSBmaXhl
ZCBieSBhZGRpbmcgYm9vdF9pZAp0byBzYWlkIGZpbGUgaGFuZGxlcywgYnV0IHdoeSBmaXggc29t
ZXRoaW5nIHRoYXQgbm9ib2R5IGFza2VkIGZvcj8KCmNncm91cGZzLCBwaWRmcywgbnNmcywgYWxs
IGdhaW5lZCBvcGVuX2J5X2hhbmRsZV9hdCgpIGNhcGFiaWxpdHkgZm9yCmEga25vd24gcmVhc29u
LCB3aGljaCB3YXMgTk9UIE5GUyBleHBvcnQuCgpJZiB0aGUgYXV0aG9yIG9mIG9wZW5fYnlfaGFu
ZGxlX2F0KCkgc3VwcG9ydCAoaS5lLiBicmF1bmVyKSBkb2VzIG5vdAp3aXNoIHRvIGltcGx5IHRo
YXQgdGhvc2UgZnMgc2hvdWxkIGJlIGV4cG9ydGVkIHRvIE5GUywgd2h5IG9iamVjdD8KCldlIGNv
dWxkIGhhdmUgdGhlIG9wdC1pbi9vdXQgb2YgTkZTIGV4cG9ydCBmaXhlcyBwZXIgRVhQT1JUX09Q
XwpmbGFncyBhbmQgd2UgY291bGQgZXZlbiB0aGluayBvZiBhbGxvd2luZyBhZG1pbiB0byBtYWtl
IHRoaXMgZGVjaXNpb24KcGVyIHZmc21vdW50IChlLmcuIGZvciBjZ3JvdXBmcykuCgpJbiBhbnkg
Y2FzZSwgSSBmYWlsIHRvIHNlZSBob3cgb2JqZWN0aW5nIHRvIHRoZSBwb3NzaWJpbGl0eSBvZiBO
RlMgZXhwb3J0Cm9wdC1vdXQgc2VydmVzIGFueW9uZS4KClRoYW5rcywKQW1pci4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
