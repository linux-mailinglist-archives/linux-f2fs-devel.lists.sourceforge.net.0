Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02727D296CF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jan 2026 01:37:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkdFJko82WpUDiGX+PcaNC7UmsCa/Z5o9pr+ZNKoquw=; b=i9mwFchUAoiG1Zy21/YWiV6cp3
	f0Qoe3Rq0kCo7dMFaIS5hTtw6OquDGzftcS/e0lWjARN9fZu4B6B6BjYWTSXQrugrUQLlgTsYw0g7
	/xP/uHBnaK35tkL8BnC5NOue6wV9AtseEalpWIIBud/c6JvWfYEENPgCEzydFMWiaEqQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgXpv-0001d7-1H;
	Fri, 16 Jan 2026 00:37:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david.laight.linux@gmail.com>) id 1vgXpt-0001d1-LP
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 00:37:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LuYXJTx9p8g5I9PbL+x4hBzLoIE63ueUkinqkyb6yNs=; b=dqxQ6o8ys5vKKTPnfN4c0PdvLC
 23+ik7z5yYJ4MEg4NCRothFFRmc3HbFOxY3PFzSJ9L5brsjJfKt4MNAC0MjlR6bNUAbcFIfF1mN/k
 tpS5o2uSSR9OY58EoUg6LEp8i8MYygG3Kx3mqFIvG1GZeByw5sDh/uUmXX+rGSVHq6n8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LuYXJTx9p8g5I9PbL+x4hBzLoIE63ueUkinqkyb6yNs=; b=TWDvOzE1vCi1lvvEsJAIv3Ar87
 7D0BkdWxaPf0IsHQQIqZ+uOyeKjLC5rLmRBfq3iP2Y5l6HgZ5G2SrixEOiIM0IDiaQwIqggMlhtPH
 px4yZIAOjXlvZOYDUxWX1aAaGLL/khhwWRqFNG2Cw8LCZUOhmu/y6v1ogH8IcSC7T7PA=;
Received: from mail-ej1-f52.google.com ([209.85.218.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vgXpt-0001pF-3k for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 00:37:09 +0000
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b79f8f7ea43so360929266b.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 15 Jan 2026 16:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768523817; x=1769128617; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LuYXJTx9p8g5I9PbL+x4hBzLoIE63ueUkinqkyb6yNs=;
 b=GLcaR08ksl39Ugqs55r4Br83EO3eMgz2auDqt6ow0uiQCXvVuqQlJwomOBiV7xTw9o
 +iXqfXrXbmpPreN//t4lPmDj/7pMdil/4dywlh0kwgr9c4yqbD7T5yGbVw68IsNHshVA
 MLBde5G9mri6Q4GlUj8rlytoCL5vggZ7DhYCsZ8wweBZvtQ7iBTKVyDzbLsFN4FoP92r
 54pWXqlR74baSvBL/+zJBORMJ5irOyuGJWryfgFllUSYVct5fAD2IczoR175wekD4Ow5
 QWNATQtYBlZBUktIrWSXNLKffWdn0kFPXJWAENusgH9+V/ftO82d4/GQMIkxDMkiiNXd
 L9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768523817; x=1769128617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LuYXJTx9p8g5I9PbL+x4hBzLoIE63ueUkinqkyb6yNs=;
 b=Kit48NwN89LWC/A+boanJ1905sgRQSh+fiQxUr+DmzysGhBpD0R24hbbOqTj86Tm3Y
 pxtni78U4lTNeHvS77zA1hzxWPn8Yi/RcVqHuDP52B/N+mz87YthYOBIlQvWelfEXQZl
 rC8cmodCrMzMeRjqVv3y40eqd//QrffFfRrlZi7yUAeWc3BcTIWE6zD5YjYuq+sHAfo5
 /yshGzPgbatXtDpwHOjNBnO5pa7hkaWvT4UEJYOOzhOHFFDEvW2oq0ygFmTANRYHamKk
 BoeF69N0alvcuwFMlGS1G1zjzBpIu0ZBfLSio2UiKw4BwVlL+6IMxLREJHV7lNClLSde
 2SPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpZIY/21AM1m6jpuGFdOG+Gjo6V88wESA5teML/Z73GHXAKy7gNuiCOVkOG7nSl/R4fY3SJLzNC9jW8Z0BoedR@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzTQHcKezkPWzVNIAHD3uiBxfm5wymx0u2vxzuIQTnue/lwaOwg
 ad1PA0DUeKyG5NXk66iTCARNPDH7jFz4/VGTzowSPUpj5U/5Vtl+hVlR3yVuMg==
X-Gm-Gg: AY/fxX6LNJfchrGHHvKuBEFkR5WxdLGIQKaSkxUlYq0AhmBV/gmC424wxsLTTnwgdk+
 3JypjH9I+2W74Sj+Gn9hl4+ClFJMWLNT8gkppHMq5hoTcfbH9QdOCTKU0X9hrTKgTCVmWVl05So
 jaJLh42o8brkT3Q2Fk/MKYV5otrsIvq3Z4fHseipC7qShgVNN7enuwtJwjqiOSfzaogR1vxOns5
 5HIBOfJ+gQ0qaVbcfL6362uZUtrjJ4DHUBLamYNHEXYuxJNjarwAM1+jZ2GmJxaCr5F1XG3CGEr
 tYWsXWecdhRyP1qtdy8pIIk1XkckvrAv6S21RVFYfO1Tc9f8F3KSB1yGIsQhUidBa/b5ktTYQNH
 uOIMJXzIT/2VKH0XF+QhEBrOchSNRp2CMbKub8joSPb9VoMEM9GtKuA+pFMUp053Kb2xzKdicv7
 BxszqQsMQy5nJ49HelLHGdHTtWRSdXMomCj+eUfYz3q7efWn324c8J
X-Received: by 2002:a05:600d:8445:10b0:480:1a22:fce8 with SMTP id
 5b1f17b1804b1-4801e3494acmr11682565e9.26.1768516821247; 
 Thu, 15 Jan 2026 14:40:21 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356996dad0sm1443737f8f.27.2026.01.15.14.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 14:40:20 -0800 (PST)
Date: Thu, 15 Jan 2026 22:40:18 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Chuck Lever" <cel@kernel.org>
Message-ID: <20260115224018.2988ca25@pumpkin>
In-Reply-To: <06dcc4b6-7457-4094-a1c6-586ce518020f@app.fastmail.com>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 <d486fdb8-686c-4426-9fac-49b7dbc28765@app.fastmail.com>
 <CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
 <4d9967cc-a454-46cf-909b-b8ab2d18358d@kernel.org>
 <aWlXfBImnC_jhTw4@dread.disaster.area>
 <06dcc4b6-7457-4094-a1c6-586ce518020f@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 15 Jan 2026 16:37:27 -0500 "Chuck Lever" wrote: >
 On Thu, Jan 15, 2026, at 4:09 PM, Dave Chinner wrote: > > On Thu, Jan 15,
 2026 at 02:37:09PM -0500, Chuck Lever wrote: > >> On 1/15/26 2:14 PM, Amir
 Goldstein wrote: > >> > On Thu, Jan 15, 2026 at 7 [...] 
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
 [david.laight.linux(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.52 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vgXpt-0001pF-3k
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
Cc: Martin
 Brandenburg <martin@omnibond.com>, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, Paulo Alcantara <pc@manguebit.org>,
 Alex Markuze <amarkuze@redhat.com>, Sandeep
 Dhavale <dhavale@google.com>, linux-btrfs@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 Dave Chinner <david@fromorbit.com>, linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas
 Dilger <adilger.kernel@dilger.ca>, Chunhai Guo <guochunhai@vivo.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Yue Hu <zbestahu@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, samba-technical@lists.samba.org, Richard
 Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Dai Ngo <Dai.Ngo@oracle.com>, Ryusuke
 Konishi <konishi.ryusuke@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Viacheslav Dubeyko <slava@dubeyko.com>, NeilBrown <neil@brown.name>,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, linux-mm@kvack.org,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>, Olga
 Kornievskaia <okorniev@redhat.com>, linux-cifs@vger.kernel.org,
 Dave Kleikamp <shaggy@kernel.org>, linux-nfs@vger.kernel.org, Tom
 Talpey <tom@talpey.com>, ocfs2-devel@lists.linux.dev,
 Bharath SM <bharathsm@microsoft.com>, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Andreas
 Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev, Christian
 Brauner <brauner@kernel.org>, Theodore Tso <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-erofs@lists.ozlabs.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 Chuck Lever <chuck.lever@oracle.com>, Hongbo Li <lihongbo22@huawei.com>,
 Anna Schumaker <anna@kernel.org>, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Phillip
 Lougher <phillip@squashfs.org.uk>, Andrew Morton <akpm@linux-foundation.org>,
 ntfs3@lists.linux.dev, David Woodhouse <dwmw2@infradead.org>,
 Trond Myklebust <trondmy@kernel.org>, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCAxNSBKYW4gMjAyNiAxNjozNzoyNyAtMDUwMAoiQ2h1Y2sgTGV2ZXIiIDxjZWxAa2Vy
bmVsLm9yZz4gd3JvdGU6Cgo+IE9uIFRodSwgSmFuIDE1LCAyMDI2LCBhdCA0OjA5IFBNLCBEYXZl
IENoaW5uZXIgd3JvdGU6Cj4gPiBPbiBUaHUsIEphbiAxNSwgMjAyNiBhdCAwMjozNzowOVBNIC0w
NTAwLCBDaHVjayBMZXZlciB3cm90ZTogIAo+ID4+IE9uIDEvMTUvMjYgMjoxNCBQTSwgQW1pciBH
b2xkc3RlaW4gd3JvdGU6ICAKPiA+PiA+IE9uIFRodSwgSmFuIDE1LCAyMDI2IGF0IDc6MzLigK9Q
TSBDaHVjayBMZXZlciA8Y2VsQGtlcm5lbC5vcmc+IHdyb3RlOiAgCj4gPj4gPj4KPiA+PiA+Pgo+
ID4+ID4+Cj4gPj4gPj4gT24gVGh1LCBKYW4gMTUsIDIwMjYsIGF0IDE6MTcgUE0sIEFtaXIgR29s
ZHN0ZWluIHdyb3RlOiAgCj4gPj4gPj4+IE9uIFRodSwgSmFuIDE1LCAyMDI2IGF0IDY6NDjigK9Q
TSBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwub3JnPiB3cm90ZTogIAo+ID4+ID4+Pj4KPiA+
PiA+Pj4+IEluIHJlY2VudCB5ZWFycywgYSBudW1iZXIgb2YgZmlsZXN5c3RlbXMgdGhhdCBjYW4n
dCBwcmVzZW50IHN0YWJsZQo+ID4+ID4+Pj4gZmlsZWhhbmRsZXMgaGF2ZSBncm93biBzdHJ1Y3Qg
ZXhwb3J0X29wZXJhdGlvbnMuIFRoZXkndmUgbW9zdGx5IGRvbmUKPiA+PiA+Pj4+IHRoaXMgZm9y
IGxvY2FsIHVzZS1jYXNlcyAoZW5hYmxpbmcgb3Blbl9ieV9oYW5kbGVfYXQoKSBhbmQgdGhlIGxp
a2UpLgo+ID4+ID4+Pj4gVW5mb3J0dW5hdGVseSwgaGF2aW5nIGV4cG9ydF9vcGVyYXRpb25zIGlz
IGdlbmVyYWxseSBzdWZmaWNpZW50IHRvIG1ha2UKPiA+PiA+Pj4+IGEgZmlsZXN5c3RlbSBiZSBj
b25zaWRlcmVkIGV4cG9ydGFibGUgdmlhIG5mc2QsIGJ1dCB0aGF0IHJlcXVpcmVzIHRoYXQKPiA+
PiA+Pj4+IHRoZSBzZXJ2ZXIgcHJlc2VudCBzdGFibGUgZmlsZWhhbmRsZXMuICAKPiA+PiA+Pj4K
PiA+PiA+Pj4gV2hlcmUgZG9lcyB0aGUgdGVybSAic3RhYmxlIGZpbGUgaGFuZGxlcyIgY29tZSBm
cm9tPyBhbmQgd2hhdCBkb2VzIGl0IG1lYW4/Cj4gPj4gPj4+IFdoeSBub3QgInBlcnNpc3RlbnQg
aGFuZGxlcyIsIHdoaWNoIGlzIGRlc2NyaWJlZCBpbiBORlMgYW5kIFNNQiBzcGVjcz8KPiA+PiA+
Pj4KPiA+PiA+Pj4gTm90IHRvIG1lbnRpb24gdGhhdCBFWFBPUlRfT1BfUEVSU0lTVEVOVF9IQU5E
TEVTIHdhcyBBY2tlZAo+ID4+ID4+PiBieSBib3RoIENocmlzdG9waCBhbmQgQ2hyaXN0aWFuOgo+
ID4+ID4+Pgo+ID4+ID4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mc2RldmVsLzIw
MjYwMTE1LXJ1bmRnYW5nLWxlaWhnYWJlLTEyMDE4ZTkzYzAwY0BicmF1bmVyLwo+ID4+ID4+Pgo+
ID4+ID4+PiBBbSBJIG1pc3NpbmcgYW55dGhpbmc/ICAKPiA+PiA+Pgo+ID4+ID4+IFBFUlNJU1RF
TlQgZ2VuZXJhbGx5IGltcGxpZXMgdGhhdCB0aGUgZmlsZSBoYW5kbGUgaXMgc2F2ZWQgb24KPiA+
PiA+PiBwZXJzaXN0ZW50IHN0b3JhZ2UuIFRoaXMgaXMgbm90IHRydWUgb2YgdG1wZnMuICAKPiA+
PiA+IAo+ID4+ID4gVGhhdCdzIG9uZSB3YXkgb2YgaW50ZXJwcmV0aW5nICJwZXJzaXN0ZW50Ii4K
PiA+PiA+IEFub3RoZXIgd2F5IGlzICJjb250aW51aW5nIHRvIGV4aXN0IG9yIG9jY3VyIG92ZXIg
YSBwcm9sb25nZWQgcGVyaW9kLiIKPiA+PiA+IHdoaWNoIHdvcmtzIHdlbGwgZm9yIHRtcGZzIHRo
YXQgaXMgbW91bnRlZCBmb3IgYSBsb25nIHRpbWUuICAKPiA+PiAKPiA+PiBJIHRoaW5rIHdlIGNh
biBiZSBhIGxvdCBtb3JlIHByZWNpc2UgYWJvdXQgdGhlIGd1YXJhbnRlZTogVGhlIGZpbGUKPiA+
PiBoYW5kbGUgZG9lcyBub3QgY2hhbmdlIGZvciB0aGUgbGlmZSBvZiB0aGUgaW5vZGUgaXQgcmVw
cmVzZW50cy4gSXQgIAo+ID4KPiA+IDxwZWRhbnRpYyBtb2RlIGVuZ2FnZWQ+Cj4gPgo+ID4gRmls
ZSBoYW5kbGVzIG1vc3QgZGVmaW5pdGVseSBjaGFuZ2Ugb3ZlciB0aGUgbGlmZSBvZiBhIC9waHlz
aWNhbC8KPiA+IGlub2RlLiBVbmxpbmtpbmcgYSBmaWxlIGRvZXMgbm90IHJlcXVpcmUgZW5kaW5n
IHRoZSBsaWZlIG9mIHRoZQo+ID4gcGh5c2ljYWwgb2JqZWN0IHRoYXQgcHJvdmlkZXMgdGhlIHBl
cnNpc3RlbnQgZGF0YSBzdG9yZSBmb3IgdGhlCj4gPiBmaWxlLgo+ID4KPiA+IGUuZy4gWEZTIGR5
bmFtaWNhbGx5IGFsbG9jYXRlcyBwaHlzaWNhbCBpbm9kZXMgbWlnaHQgaW4gYSBsaWZlIGN5Y2xl
Cj4gPiB0aGF0IGxvb2tzIHNvbWV3aGF0IGxpZmUgdGhpczoKPiA+Cj4gPiAJYWxsb2NhdGUgcGh5
c2ljYWwgaW5vZGUKPiA+IAlpbnNlcnQgcmVjb3JkIGludG8gYWxsb2NhdGVkIGlub2RlIGluZGV4
Cj4gPiAJbWFyayBpbm9kZSBhcyBmcmVlCj4gPgo+ID4gCXdoaWxlIChkb24ndCBuZWVkIHRvIGZy
ZWUgcGh5c2ljYWwgaW5vZGUpIHsKPiA+IAkJLi4uCj4gPiAJCWFsbG9jYXRlIGlub2RlIGZvciBh
IG5ldyBmaWxlCj4gPiAJCXVwZGF0ZSBwZXJzaXN0ZW50IGlub2RlIG1ldGFkYXRhIHRvIGdlbmVy
YXRlIG5ldyBmaWxlaGFuZGxlCj4gPiAJCW1hcmsgaW5vZGUgaW4gdXNlCj4gPiAJCS4uLgo+ID4g
CQl1bmxpbmsgZmlsZQo+ID4gCQltYXJrIGlub2RlIGZyZWUKPiA+IAl9Cj4gPgo+ID4gCXJlbW92
ZSBpbm9kZSBmcm9tIGFsbG9jYXRlZCBpbm9kZSBpbmRleAo+ID4gCWZyZWUgcGh5c2ljYWwgaW5v
ZGUKPiA+Cj4gPiBpLmUuIGEgZnJlZSBpbm9kZSBpcyBzdGlsbCBhbiAtYWxsb2NhdGVkLCBpbmRl
eGVkIGlub2RlLSBpbiB0aGUKPiA+IGZpbGVzeXN0ZW0sIGFuZCB1bnRpbCB3ZSBwaHlzaWNhbGx5
IHJlbW92ZSBpdCBmcm9tIHRoZSBmaWxlc3lzdGVtCj4gPiB0aGUgaW5vZGUgbGlmZSBjeWNsZSBo
YXMgbm90IGVuZGVkLgo+ID4KPiA+IElPV3MsIHRoZSBwaHlzaWNhbCAocGVyc2lzdGVudCkgaW5v
ZGUgbGlmZXRpbWUgY2FuIHNwYW4gdGhlIGxpZmV0aW1lCj4gPiBvZiAtbWFueS0gZmlsZXMuIEhv
d2V2ZXIsIHRoZSBmaWxlc3lzdGVtIGd1YXJhbnRlZXMgdGhhdCB0aGUgaGFuZGxlCj4gPiBnZW5l
cmF0ZWQgZm9yIHRoYXQgaW5vZGUgaXMgZGlmZmVyZW50IGZvciBlYWNoIGZpbGUgaXQgcmVwcmVz
ZW50cwo+ID4gb3ZlciB0aGUgd2hvbGUgaW5vZGUgbGlmZSB0aW1lLgo+ID4KPiA+IEhlbmNlIEkg
dGhpbmsgdGhhdCBmaWxlIGhhbmRsZSBzdGFiaWxpdHkvcGVyc2lzdGVuY2UgbmVlZHMgdG8gYmUK
PiA+IGRlZmluZWQgaW4gdGVybXMgb2YgLWZpbGUgbGlmZXRpbWVzLSwgbm90IHRoZSBsaWZldGlt
ZXMgb2YgdGhlCj4gPiBmaWxlc3lzdGVtIG9iamVjdHMgaW1wbGVtZW50IHRoZSBmaWxlJ3MgcGVy
c2lzdGVudCBkYXRhIHN0b3JlLiAgCj4gCj4gRmFpciBlbm91Z2gsICJpbm9kZSIgaXMgdGhlIHdy
b25nIHRlcm0gdG8gdXNlIGhlcmUuCgpVc3VhbGx5IHRoZXJlIGlzICdnZW5lcmF0aW9uIG51bWJl
cicgY2hhbmdlcyB3aGVuIHRoZSBpbm9kZSBpcyB1c2VkIGZvcgphIG5ldyBmaWxlLgpJSVJDIHRo
ZSBvcmlnaW5hbCBuZnMgZmlsZSBoYW5kbGUgd2FzIHRoZSBtYWpvci9taW5vciBmb3IgdGhlIGRp
c2sgcGFydGl0aW9uLAp0aGUgaW5kZXggaW50byB0aGUgJ29uLWRpc2sgaW5vZGUgdGFibGUnICh0
aGUgaW5vZGUgbnVtYmVyKSBhbmQgdGhlCidnZW5lcmF0aW9uIG51bWJlcicgKGJ1dCBJJ20gc3Vy
ZSB0aGUgbGVuZ3RoIHdhcyBhIHBvd2VyIG9mIDIuLi4pLgoKSXQncyBub3Qgc3VycHJpc2luZyBV
bml4IHVzZXMgaW5vZGUgbnVtYmVyIGFuZCBmaWxlIGhhbmRsZXMuCksmUiB3b3VsZCBoYXZlIHVz
ZWQgUlNNLTExL00gd2hlcmUgJ2ZpbGUgZGlyZWN0b3J5IGxvb2t1cCcgd2FzIGEgdXNlcnNwYWNl
Cm9wZXJhdGlvbiBhbmQgdGhlIGtlcm5lbCBvbmx5IHN1cHBvcnRlZCAnb3BlbiBieSBmaWxlIGhh
bmRsZScuCkFsdGhvdWdoIHRoYXQgZ290IGxvc3QgYmV0d2VlbiB0aGVyZSBhbmQgbnRmcy4KKFdp
bmRvd3MgSU8gaXMgZGVmaW5pdGVseSBiYXNlZCBvbiBSU00tMTEvTSB0aG91Z2guKQoKCURhdmlk
CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCg==
