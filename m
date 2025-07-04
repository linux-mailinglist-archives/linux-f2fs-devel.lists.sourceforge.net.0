Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC9FAF8867
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jul 2025 09:03:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fgybc0gEUcuj7c1bf5KIaV8hYXwdGREUCt3wCgAmDds=; b=FnYcHBdOcC167doXeBQiyENvqB
	nbu0K5RJa+zioJ/znVQd9g68oA2SuDWPxU2qxU1w7lvPP1TXjqs/l017C88a6NWKKisaGdDZXLmj6
	y4feUGhi8jgQdixbxFCNQqVZqewLaiFZfUJCIns0qsDM/40DrvOIFgTL5Ktl+fuhF+YE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uXaS1-0002Yo-St;
	Fri, 04 Jul 2025 07:03:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundanthebest@gmail.com>) id 1uXaRz-0002Yi-If
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 07:03:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NaqZISU/6/J0dA6aXHHwQAgG0zenTBPemNnfGP8tRRw=; b=eSoddiL6n5Auwy7gDx1K5zcNgK
 r2mPmoIxDDInKJ5PvHYb3+zzg2RjsOCZJLvRh263jzzlEDEDOuxSBfAai4HcCK7NmM4KBo/B5E28u
 7rslg+/LiDduOHtnCYLr1wFSh4AU1jI0gETFg7vk9Zknp+F0kVaygaOem1qVOTHDtImQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NaqZISU/6/J0dA6aXHHwQAgG0zenTBPemNnfGP8tRRw=; b=ciQFLiJCIttOxDWZc+xp+a5BXs
 5Ttk1srXci0ceaicJqjZaL+4heZbKwwsXxf4IcQwd2xTj28/NC8UlBqrSOgmVkcKJHI6+yOtiVvl7
 O9ZezGzvC9KwW76pwtdaU47uGYEH3+3qcTRE3wJKI2o0Y4fR07Y3HwZ0pN1NTQWR4Pu8=;
Received: from mail-ej1-f47.google.com ([209.85.218.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uXaRz-0005Tq-6T for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 07:03:11 +0000
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-ae3cd8fdd77so128107266b.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 04 Jul 2025 00:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751612585; x=1752217385; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NaqZISU/6/J0dA6aXHHwQAgG0zenTBPemNnfGP8tRRw=;
 b=GnTDyY4oyvtJQMQRVkHUVZzIdQSjOwabqPI5+tEAlUP3gpzGDoSpvRruX8PrUEXFcO
 9yVGBzYHzCkY7jx8UuRBpGxzvr5X+MNPBqkNpiA4JFBjJjOXQG82J8s61VZWh0RpZ0E9
 v4WB/SX6GFCDtyakMYhGLfnLrEoZUM88jKrZYzdhJ3QD7CdXWrAAd/NtZlFoBfez9iyJ
 /JhwIGkJs3ilfJugK1iMA5ekXXJFNe3uxryKh7qjxqzN5GZ1XPkGl6w0Kv7BQrzIWQha
 bFpwjOIDev8CKYEVFk+wPdAgEfqxJue9yW1g8jNeTcH3Dxq2mOI01rSrSUoWWNsYR7L5
 A0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751612585; x=1752217385;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NaqZISU/6/J0dA6aXHHwQAgG0zenTBPemNnfGP8tRRw=;
 b=wYv/9FW4yPJ5UpcvEQSZxPLIlx00E8S/lKJEjrp3uVKCnmMwuRO1eAyyA9skx6cCWX
 HwBqiuhlS3CgPG9LSFvO81FSVv2MKaU10L59nU7TX9+r62LX1pJrvA517aXMWx3NGAhp
 MgcopA3VZEkzEST5QNt8EbgBRL9Vfi3WvOmgx6FnHGc79ryscca6GF7vtLQCJb8UQYBn
 aJs1sWAqGhlSfwbbZS0Gr3tZGOwzu8G/OxrnRK82mCf+Du3qNpP3Wxfq9MMTm3cNDqG+
 Fr8SeYJVvZxg7bI1shKDZw3bu1tsSHzmM+HvwiCqD5pbfKz5XJHOCd0+IcrMq8SQx8qm
 NZhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPs/DSxH4xXrGnGmGykAEelinaFCRmkbBn6NKF7m9JYmbjSgVqE92OADr3m+KiO5ZWVDPdK1ObRyKvh7wi9CyJ@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw42HljYEeIAjq1WtiP9mSnjRguuSgLYTnZk4y578FF20Rtj8BH
 VA1rG7x8lYBUpHaw/+forFBynDTP/STqLbVcI6ebI5WqK61o11aFUzVa8zKemAgivAaLZbbVYug
 N7n0e9PVINqt7Ighncx04EABd74gDtuE=
X-Gm-Gg: ASbGncvgZI6azX/pNoVJa2a/IUhlO2QD4DiljNdf61qDab5ceS+8uj3jMDq6poZBzEM
 ugDD/ji+jC2cc2LCxFJFMwW5eO592bbP/7/N6gjODBdR0mdB408OIPuHguCJlMIuPbCPu6zyOLD
 NQKlHHJMrOh/VNzJ/8K/0SxbnG5FysPFnn9nIxrZaHh0QHd5LIcrJaJr/mqWUM8B9jHI8BT5tY0
 7Y+EVwaubfjYjUL
X-Google-Smtp-Source: AGHT+IFH2+aa5C0AYTaAo7ldMEn47RrhFOI48HXYOTWtH8oGOiUW5l/So1Lz10mwcD0zFkQkk89KO90EiAPC2WiMYa4=
X-Received: by 2002:a17:907:728e:b0:ae0:a813:1bc0 with SMTP id
 a640c23a62f3a-ae3fe78f7aemr85654066b.53.1751612584190; Fri, 04 Jul 2025
 00:03:04 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250529113215epcas5p2edd67e7b129621f386be005fdba53378@epcas5p2.samsung.com>
 <20250529111504.89912-1-kundan.kumar@samsung.com>
 <20250529203708.9afe27783b218ad2d2babb0c@linux-foundation.org>
 <CALYkqXqs+mw3sqJg5X2K4wn8uo8dnr4uU0jcnnSTbKK9F4AiBA@mail.gmail.com>
 <20250702184312.GC9991@frogsfrogsfrogs> <20250703130500.GA23864@lst.de>
In-Reply-To: <20250703130500.GA23864@lst.de>
From: Kundan Kumar <kundanthebest@gmail.com>
Date: Fri, 4 Jul 2025 12:32:51 +0530
X-Gm-Features: Ac12FXwZOjAgWNZaCPF5YBUk5PhxDjzykQsiKelmwtL0Fjc6XgS6xeUIPE87xdw
Message-ID: <CALYkqXqE1dJj7Arqu_Zi4J5mTVhzJQt=kzwjS9QaY5VaFcV3Lg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 3, 2025 at 6:35 PM Christoph Hellwig wrote: >
 > On Wed, Jul 02, 2025 at 11:43:12AM -0700, Darrick J. Wong wrote: > > > On
 a spinning disk, random IO bandwidth remains unchanged, while se [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [kundanthebest(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.47 listed in wl.mailspike.net]
X-Headers-End: 1uXaRz-0005Tq-6T
Subject: Re: [f2fs-dev] [PATCH 00/13] Parallelizing filesystem writeback
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
Cc: ritesh.list@gmail.com, jack@suse.cz, "Darrick J. Wong" <djwong@kernel.org>,
 amir73il@gmail.com, david@fromorbit.com, gfs2@lists.linux.dev,
 linux-mm@kvack.org, clm@meta.com, dave@stgolabs.net, agruenba@redhat.com,
 miklos@szeredi.hu, Kundan Kumar <kundan.kumar@samsung.com>,
 Matthew Wilcox <willy@infradead.org>, p.raghav@samsung.com,
 linux-nfs@vger.kernel.org, da.gomez@samsung.com, viro@zeniv.linux.org.uk,
 jaegeuk@kernel.org, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 mcgrof@kernel.org, anna@kernel.org, gost.dev@samsung.com,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBKdWwgMywgMjAyNSBhdCA2OjM14oCvUE0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMDIsIDIwMjUgYXQgMTE6NDM6MTJBTSAtMDcw
MCwgRGFycmljayBKLiBXb25nIHdyb3RlOgo+ID4gPiBPbiBhIHNwaW5uaW5nIGRpc2ssIHJhbmRv
bSBJTyBiYW5kd2lkdGggcmVtYWlucyB1bmNoYW5nZWQsIHdoaWxlIHNlcXVlbnRpYWwKPiA+ID4g
SU8gcGVyZm9ybWFuY2UgZGVjbGluZXMuIEhvd2V2ZXIsIHNldHRpbmcgbnJfd2JfY3R4ID0gMSB2
aWEgY29uZmlndXJhYmxlCj4gPiA+IHdyaXRlYmFjayhwbGFubmVkIGluIG5leHQgdmVyc2lvbikg
ZWxpbWluYXRlcyB0aGUgZGVjbGluZS4KPiA+ID4KPiA+ID4gZWNobyAxID4gL3N5cy9jbGFzcy9i
ZGkvODoxNi9ud3JpdGViYWNrcwo+ID4gPgo+ID4gPiBXZSBjYW4gZmV0Y2ggdGhlIGRldmljZSBx
dWV1ZSdzIHJvdGF0aW9uYWwgcHJvcGVydHkgYW5kIGFsbG9jYXRlIEJESSB3aXRoCj4gPiA+IG5y
X3diX2N0eCA9IDEgZm9yIHJvdGF0aW9uYWwgZGlza3MuIEhvcGUgdGhpcyBpcyBhIHZpYWJsZSBz
b2x1dGlvbiBmb3IKPiA+ID4gc3Bpbm5pbmcgZGlza3M/Cj4gPgo+ID4gU291bmRzIGdvb2QgdG8g
bWUsIHNwaW5uaW5nIHJ1c3QgaXNuJ3Qga25vd24gZm9yIGlvcHMuCj4gPgo+ID4gVGhvdWdoOiBX
aGF0IGFib3V0IGEgcmFpZDAgb2Ygc3Bpbm5pbmcgcnVzdD8gIERvIHlvdSBzZWUgdGhlIHNhbWUK
PiA+IGRlY2xpbmVzIGZvciBzZXF1ZW50aWFsIElPPwo+Cj4gV2VsbCwgZXZlbiBmb3IgYSByYWlk
MCBtdWx0aXBsZSBJL08gc3RyZWFtcyB3aWxsIGRlZ3JhZGUgcGVyZm9ybWFuY2UKPiBvbiBhIGRp
c2suICBPZiBjb3Vyc2UgbWFueSByZWFsIGxpZmUgd29ya2xvYWRzIHdpbGwgaGF2ZSBtdWx0aXBs
ZQo+IEkvTyBzdHJlYW1zIGFueXdheS4KPgo+IEkgdGhpbmsgdGhlIGltcG9ydGFudCBwYXJ0IGlz
IHRvIGhhdmU6Cj4KPiAgYSkgc2FuZSBkZWZhdWx0cwo+ICBiKSBhbiBlYXN5IHdheSBmb3IgdGhl
IGZpbGUgc3lzdGVtIGFuZC9vciB1c2VyIHRvIG92ZXJyaWRlIHRoZSBkZWZhdWx0Cj4KPiBGb3Ig
YSkgYSBzaW5nbGUgdGhyZWFkIGZvciByb3RhdGlvbmFsIGlzIGEgZ29vZCBkZWZhdWx0LiAgRm9y
IGZpbGUgc3lzdGVtCj4gdGhhdCBkcml2ZXIgbXVsdGlwbGUgc3BpbmRsZXMgaW5kZXBlbmRlbnRs
eSBvciBkbyBjb21wcmVzc2lvbiBtdWx0aXBsZQo+IHRocmVhZHMgbWlnaHQgc3RpbGwgbWFrZSBz
ZW5zZS4KPgo+IEZvciBiKSBvbmUgYmlnIGlzc3VlIGlzIHRoYXQgcmlnaHQgbm93IHRoZSB3aG9s
ZSB3cml0ZWJhY2sgaGFuZGxpbmcgaXMKPiBwZXItYmRpIGFuZCBub3QgcGVyIHN1cGVyYmxvY2su
ICBTbyBtYXliZSB0aGUgZmlyc3Qgc3RlcCBuZWVkcyB0byBiZQo+IHRvIG1vdmUgdGhlIHdyaXRl
YmFjayB0byB0aGUgc3VwZXJibG9jayBpbnN0ZWFkIG9mIGJkaT8KCmJkaSBpcyB0aWVkIHRvIHRo
ZSB1bmRlcmx5aW5nIGJsb2NrIGRldmljZSwgYW5kIGhlbHBzIGZvciBkZXZpY2UKYmFuZHdpZHRo
IHNwZWNpZmljIHRocm90dGxpbmcsIGRpcnR5IHJhdGVsaW1pdGluZyBldGMuIE1ha2luZyBpdCBw
ZXIKc3VwZXJibG9jayB3aWxsIG5lZWQgZHVwbGljYXRpbmcgdGhlIGRldmljZSBzcGVjaWZpYyB0
aHJvdHRsaW5nLCByYXRlbGltaXRpbmcKdG8gc3VwZXJibG9jaywgd2hpY2ggd2lsbCBiZSBkaWZm
aWN1bHQuCgo+IElmIHNvbWVvbmUKPiB1c2VzIHBhcnRpdGlvbnMgYW5kIG11bHRpcGxlIGZpbGUg
c3lzdGVtcyBvbiBzcGlubmluZyBydXN0cyB0aGVzZQo+IGRheXMgcmVkdWNpbmcgdGhlIG51bWJl
ciBvZiB3cml0ZWJhY2sgdGhyZWFkcyBpc24ndCByZWFsbHkgZ29pbmcgdG8KPiBzYXZlIHRoZWly
IGRheSBlaXRoZXIuCj4KCmluIHRoaXMgY2FzZSB3aXRoIHNpbmdsZSB3YiB0aHJlYWQgbXVsdGlw
bGUgcGFydGl0aW9ucy9maWxlc3lzdGVtcyB1c2UgdGhlCnNhbWUgYmRpLCB3ZSBmYWxsIGJhY2sg
dG8gYmFzZSBjYXNlLCB3aWxsIHRoYXQgbm90IGhlbHAgPwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
