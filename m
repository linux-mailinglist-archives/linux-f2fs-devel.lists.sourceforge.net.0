Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F466D280A0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 20:23:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+by0RutPHdsZ9Z3Sv8yhmwMmvA0kptE/qPmJC/ii7LA=; b=ii2DT7/czFv0CaVOrDog4SSw/q
	aHaec8MDVVC3c5qP8HuiGxLKTDmkqU4YOGnw9TyVF9pbQb8xxG3B3D5nBWQkU1fkQmwpWhnDlrGFG
	cfILhVyUzZWRCSma1Qepdc5d4GlNml2j3SQyu8aCQtjQQKCgDXXFSVjVVlhFTfhh6L7g=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgSwY-000385-9P;
	Thu, 15 Jan 2026 19:23:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <amir73il@gmail.com>) id 1vgSwX-00037z-8P
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jan 2026 19:23:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1HpNW/ml4xLa7Q+ZYoOd6NCigBelaQL2RtJ0aaDh9mI=; b=YnLog1DSnq6/uYdMh5yA3A9arb
 6tlNFaWohMZgye7I9yUlWhRp9kPb+badPGXbqfuQvBXpS6dnCXX88h1v/haBu/Oh32pZyQlYKbpp+
 Ny77TUvfp7xl9xvh6HtouZBp3CC22/rwIckOutqeGGPYa1Wu1s9h5MsEC3A3bWDfu11w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1HpNW/ml4xLa7Q+ZYoOd6NCigBelaQL2RtJ0aaDh9mI=; b=fYeYeNUBZRwWnKYAH0/jH+ZOpO
 pD23TB5pKGsWtikO83JHa9fmpfnswjgeun6uD1zUeEXxAFT+vlyhw8Sq/az/9UFfj2qYr0wykzfMX
 6NBF/jJ0OGHUWKCWJOdRaWd2gITfwcBAnAs6cenYgdJ51oYXASLME9UZvpfWXmg7zez0=;
Received: from mail-ed1-f52.google.com ([209.85.208.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vgSwW-00040q-Tz for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jan 2026 19:23:41 +0000
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-64daeb28c56so2277885a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 15 Jan 2026 11:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768505009; x=1769109809; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1HpNW/ml4xLa7Q+ZYoOd6NCigBelaQL2RtJ0aaDh9mI=;
 b=Yg1PsqlNwQy0hDk6lH31J8GbueJ+pTuOSETBTv0SaLd+XLw+SyUvpzsloEx6+4Aaon
 8vaCJgbquW41LlYh55D8h/5mcYDR+aYuLfzoe1oUqKbfsOX6Ylmaz8x9m3HaumTJcT5C
 hx7D+kgz0Zs2v8LJV86xAYKBsVDj5P72+N6pI6jh3Jsm/tRvsxoWAuHer62B/pCmfr+B
 6ukBuE2ktZi5XC/Y2TtR66HUxQ7YCsSWhAQPw3ZOkDmXCHfi84DF+e+6EB0HTGJ17tZ5
 PcjBW9ouWXJZtHtrPWbK2QjQx4wfAlM3OdFSQAT9T8mBo1CEwxOdstTVRv8dsMzI7MPv
 B98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768505009; x=1769109809;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1HpNW/ml4xLa7Q+ZYoOd6NCigBelaQL2RtJ0aaDh9mI=;
 b=XpCHyKFCTIiVEuhzgEKVChM/hpXcEj5PMycKmvObd3mYICmW5QrUVEEga2q30T8Kia
 BrQaMGwYomrTyU5C9HoXwMFAQy1itL56qzXPAZ/TImck2pQJ3V9MefX/q3YXyvL3/utI
 Wlf/7ra5ML+W3dA89w6o2+oPbEjQY47PGlPihbMmCY3TmMnwwgEYPCvbebOit51Afev5
 VfeLQvH4ZNBkpGVwSBUaRyMgluEAnLsBIc1MapdAC5l6CdeRbB57lU4A2yEyOcfLQ3uZ
 qgmwLCC6VzIIFprCou12n3bQwy6NnoNNTfWCwrtq7bN7hpjB+dhLmt/1mq8XU0g1brKZ
 60EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOSfAb+fDIm0up7axk6rPWkTNBlZ+rMMC3gAMD9ttzIa4/pyJ6vUpZ7dGEERdsIvHsKCK1MoRwA3qGeYyyMCzV@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxH4Vigvr66liLdojwt4AmFwB85hFON4n69ncKWyPEJkqB8p2vh
 v7eDIF9FrvL9GyKz6i136qrnRQJ3Z6PqfCBdlSSXPjzl5o8sMup7pRmPm8qWasQaRoWDvkzf0r8
 dfWHkY8vi4X5RYM9peA+826BmNhUFcas=
X-Gm-Gg: AY/fxX5O4zJirL+KyCsxbEuLVg5IeyJZ+qvTyO+OLBtmRE1mRwMgpwnLZxoS8B0UZQe
 kXtgPR5f+u3zz9KYTj4vcISAPtHyrTGzP0gb3lMSj3JF7ykVU/8Opk6b1UXH0laKSEogrb52eeK
 ccgdoPEM2mwer9mduXqWzzHexZOHO5AaPVW25U3mkVXna/4fhTjdpKZ5PuG6Ew/6ZF7Tnnhm3SC
 XmGEOa9oN/hBthxRpeQF7aUME6ffVZ4dzEJFVsVq2vgIihR1+yZJ2JKpLLq8KsnPq8eBThNEgKg
 Y5m08d1dxqhqC0w0lKZoOqHNrKMr0g==
X-Received: by 2002:a17:907:3e97:b0:b73:7c3e:e17c with SMTP id
 a640c23a62f3a-b879327e30bmr63085666b.44.1768505008810; Thu, 15 Jan 2026
 11:23:28 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <20260115-exportfs-nfsd-v1-29-8e80160e3c0c@kernel.org>
In-Reply-To: <20260115-exportfs-nfsd-v1-29-8e80160e3c0c@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 15 Jan 2026 20:23:17 +0100
X-Gm-Features: AZwV_Qj21qC7f0_83CWGwxMbCuhLisWPoHuSIOsZGqfnrVByhBJVGvUqJqXdQ-8
Message-ID: <CAOQ4uxg304=s1Uoeayy3rm1e154Nf7ScOgseJHThw4uQjKwk0A@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 15, 2026 at 6:51 PM Jeff Layton wrote: > > Some
 filesystems have grown export operations in order to provide > filehandles
 for local usage. Some of these filesystems are unsuitable > for [...] 
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
 [amir73il(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.52 listed in wl.mailspike.net]
X-Headers-End: 1vgSwW-00040q-Tz
Subject: Re: [f2fs-dev] [PATCH 29/29] nfsd: only allow filesystems that set
 EXPORT_OP_STABLE_HANDLES
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
Cc: Martin Brandenburg <martin@omnibond.com>,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Alex Markuze <amarkuze@redhat.com>,
 Sandeep Dhavale <dhavale@google.com>, linux-btrfs@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, linux-unionfs@vger.kernel.org,
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
 NeilBrown <neil@brown.name>, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, Salah Triki <salah.triki@gmail.com>,
 linux-mm@kvack.org, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>,
 Olga Kornievskaia <okorniev@redhat.com>, linux-cifs@vger.kernel.org,
 Dave Kleikamp <shaggy@kernel.org>, linux-nfs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, ocfs2-devel@lists.linux.dev,
 Bharath SM <bharathsm@microsoft.com>, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Gao Xiang <xiang@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-erofs@lists.ozlabs.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 Chuck Lever <chuck.lever@oracle.com>, Hongbo Li <lihongbo22@huawei.com>,
 Anna Schumaker <anna@kernel.org>, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 David Woodhouse <dwmw2@infradead.org>, Trond Myklebust <trondmy@kernel.org>,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgNjo1MeKAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gU29tZSBmaWxlc3lzdGVtcyBoYXZlIGdyb3duIGV4cG9ydCBv
cGVyYXRpb25zIGluIG9yZGVyIHRvIHByb3ZpZGUKPiBmaWxlaGFuZGxlcyBmb3IgbG9jYWwgdXNh
Z2UuIFNvbWUgb2YgdGhlc2UgZmlsZXN5c3RlbXMgYXJlIHVuc3VpdGFibGUKPiBmb3IgdXNlIHdp
dGggbmZzZCwgc2luY2UgdGhlaXIgZmlsZWhhbmRsZXMgYXJlIG5vdCBwZXJzaXN0ZW50IGFjcm9z
cwo+IHJlYm9vdHMuCj4KPiBJbiBfX2ZoX3ZlcmlmeSwgY2hlY2sgd2hldGhlciBFWFBPUlRfT1Bf
U1RBQkxFX0hBTkRMRVMgaXMgc2V0Cj4gYW5kIHJldHVybiBuZnNlcnJfc3RhbGUgaWYgaXQgaXNu
J3QuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwub3JnPgo+
IC0tLQo+ICBmcy9uZnNkL25mc2ZoLmMgfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2ZzL25mc2QvbmZzZmguYyBiL2ZzL25mc2QvbmZz
ZmguYwo+IGluZGV4IGVkODVkZDQzZGExOGU2ZDRjNDY2N2ZmMTRkYzAzNWYyZWFjZmYxZDYuLmRh
OWQ1ZmIyZTY2MTNjMjcwNzE5NWRhMmU4Njc4YjNmY2IzZDQ0NGQgMTAwNjQ0Cj4gLS0tIGEvZnMv
bmZzZC9uZnNmaC5jCj4gKysrIGIvZnMvbmZzZC9uZnNmaC5jCj4gQEAgLTMzNCw2ICszMzQsMTAg
QEAgX19maF92ZXJpZnkoc3RydWN0IHN2Y19ycXN0ICpycXN0cCwKPiAgICAgICAgIGRlbnRyeSA9
IGZocC0+ZmhfZGVudHJ5Owo+ICAgICAgICAgZXhwID0gZmhwLT5maF9leHBvcnQ7Cj4KPiArICAg
ICAgIGVycm9yID0gbmZzZXJyX3N0YWxlOwo+ICsgICAgICAgaWYgKCEoZGVudHJ5LT5kX3NiLT5z
X2V4cG9ydF9vcC0+ZmxhZ3MgJiBFWFBPUlRfT1BfU1RBQkxFX0hBTkRMRVMpKQo+ICsgICAgICAg
ICAgICAgICBnb3RvIG91dDsKPiArCj4gICAgICAgICB0cmFjZV9uZnNkX2ZoX3ZlcmlmeShycXN0
cCwgZmhwLCB0eXBlLCBhY2Nlc3MpOwo+CgpJREdJLiBEb24ndCB5b3Ugd2FudCAgdG8gZGVueSB0
aGUgZXhwb3J0IG9mIHRob3NlIGZzIGluIGNoZWNrX2V4cG9ydCgpPwpCeSB0aGUgc2FtZSBsb2dp
YyB0aGF0IGNoZWNrX2V4cG9ydCgpIGNoZWNrcyBmb3IgY2FuX2RlY29kZV9maCgpCm5vdCBmb3Ig
Y2FuX2VuY29kZV9maCgpLgoKVGhhbmtzLApBbWlyLgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
