Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E182572A1E1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Jun 2023 20:13:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q7gcQ-0003vZ-GA;
	Fri, 09 Jun 2023 18:13:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rjwysocki@gmail.com>) id 1q7gcO-0003vS-VF
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jun 2023 18:13:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f2Xux0G0tFdJlDzvQzZhcAqUXfykTqTn9g16hyE21ys=; b=ebdYpKebG6U4xnL9HolbxUjZBd
 GD8Emya7/cSXWtqRevHvGHJY2cKNHv6mB05tWxec1er8bVXeaTv4MaJ+L0CdaK+LQG19CPBMv/bmM
 THd2LYbWA1RD30IIMvQQ67/kqgRtfEfIlPeUNefqd4e2lXOD09aNyhLhvMYYPELYz1M4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f2Xux0G0tFdJlDzvQzZhcAqUXfykTqTn9g16hyE21ys=; b=fsDPKRid0VzhCjC3pmwFWQo8Ea
 uBxyL32bZXpzcVWLTiSwPhqHj2UZMnZ8+NMhijPqwGlTvlIP1I/I6LoLGQ0QqulSin8Di0iqNoGPw
 pmVPlGQ92HNVzWrcyj+xjvwUuo16Pjl/hVZuyjuTbOKo7X9sFJjp+jPWAJoZR+BZdsUg=;
Received: from mail-ej1-f54.google.com ([209.85.218.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q7gcK-0007GK-Bv for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jun 2023 18:13:47 +0000
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-977d3292be0so55136466b.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 09 Jun 2023 11:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686334418; x=1688926418;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f2Xux0G0tFdJlDzvQzZhcAqUXfykTqTn9g16hyE21ys=;
 b=XTU3Ab1dD+2qzg28uPP+/ABt5euMN0xjstmai2ddmBKPEvDc3tkAnstT26Z+K2eJ4Q
 ot/2A6vr09C5l/pCned58kXTW++yr9rzz0ToICsN0NRqI3LlQBtXKTgeMwPycrYkQtAc
 PfB33ETpSY2I1vtp0yu094zGlgG0ErKvWGWrSWKs/ltox87LkhGYujBxAuD5caFzA7K2
 Q4+S8RW/aedPibt9NKShwyf3rB2J5jMw/cdaWWk/+pBYQCRGYLXH76/CvhW+4wN1GUG+
 mkTEeYkqAongZT2DY0FI9CuUTCNikRkzd33Lh0vR7yMRVD+fyxGbUg9P/qBpcZbWto+4
 HgUg==
X-Gm-Message-State: AC+VfDwSfZH5/SeRsrh3BSolAERwOQXfN9JeW4P/WX0aJsSAI6hNwmEh
 Xyg07nohwoYReFK2WCdNygTLTIu0n+IFialxfPc=
X-Google-Smtp-Source: ACHHUZ7r7lbBrTdxRkyp2bTqJCFBDA6+Ddf+RviatN0r97z5LUsaxAu6Q2CxPlvVkZ/6P5sUxBvleBvx6ETeZa4XK48=
X-Received: by 2002:a17:906:1049:b0:974:56cb:9dfc with SMTP id
 j9-20020a170906104900b0097456cb9dfcmr1993996ejj.1.1686334417837; Fri, 09 Jun
 2023 11:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230608110258.189493-1-hch@lst.de>
 <20230608110258.189493-12-hch@lst.de>
In-Reply-To: <20230608110258.189493-12-hch@lst.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 9 Jun 2023 20:13:23 +0200
Message-ID: <CAJZ5v0h61q6=JxjeUjjMz5k05HuRGWVKp_rK+9N8rug58kU_VQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Jun 8, 2023 at 1:03 PM Christoph Hellwig <hch@lst.de>
    wrote: > > holder is just an on-stack pointer that can easily be reused by
    other calls, > replace it with a static variable that doesn't [...] 
 
 Content analysis details:   (0.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.218.54 listed in list.dnswl.org]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [rjwysocki[at]gmail.com]
  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
                             mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.218.54 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
  0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
                             EnvelopeFrom freemail headers are
                             different
X-Headers-End: 1q7gcK-0007GK-Bv
Subject: Re: [f2fs-dev] [PATCH 11/30] swsusp: don't pass a stack address to
 blkdev_get_by_path
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-nvme@lists.infradead.org,
 Phillip Potter <phil@philpotter.co.uk>, Chris Mason <clm@fb.com>,
 dm-devel@redhat.com, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Jack Wang <jinpu.wang@ionos.com>, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org,
 Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBKdW4gOCwgMjAyMyBhdCAxOjAz4oCvUE0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gaG9sZGVyIGlzIGp1c3QgYW4gb24tc3RhY2sgcG9pbnRlciB0aGF0
IGNhbiBlYXNpbHkgYmUgcmV1c2VkIGJ5IG90aGVyIGNhbGxzLAo+IHJlcGxhY2UgaXQgd2l0aCBh
IHN0YXRpYyB2YXJpYWJsZSB0aGF0IGRvZXNuJ3QgY2hhbmdlLgo+Cj4gU2lnbmVkLW9mZi1ieTog
Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gUmV2aWV3ZWQtYnk6IEhhbm5lcyBSZWlu
ZWNrZSA8aGFyZUBzdXNlLmRlPgoKQWNrZWQtYnk6IFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWxA
a2VybmVsLm9yZz4KCj4gLS0tCj4gIGtlcm5lbC9wb3dlci9zd2FwLmMgfCA1ICsrKy0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEva2VybmVsL3Bvd2VyL3N3YXAuYyBiL2tlcm5lbC9wb3dlci9zd2FwLmMKPiBpbmRleCA4
MWFlYzNiMmM2MDUxMC4uYjAzZmYxYTMzYzdmNjggMTAwNjQ0Cj4gLS0tIGEva2VybmVsL3Bvd2Vy
L3N3YXAuYwo+ICsrKyBiL2tlcm5lbC9wb3dlci9zd2FwLmMKPiBAQCAtMTUxMCw2ICsxNTEwLDgg
QEAgaW50IHN3c3VzcF9yZWFkKHVuc2lnbmVkIGludCAqZmxhZ3NfcCkKPiAgICAgICAgIHJldHVy
biBlcnJvcjsKPiAgfQo+Cj4gK3N0YXRpYyB2b2lkICpzd3N1c3BfaG9sZGVyOwo+ICsKPiAgLyoq
Cj4gICAqICAgICAgc3dzdXNwX2NoZWNrIC0gQ2hlY2sgZm9yIHN3c3VzcCBzaWduYXR1cmUgaW4g
dGhlIHJlc3VtZSBkZXZpY2UKPiAgICovCj4gQEAgLTE1MTcsMTQgKzE1MTksMTMgQEAgaW50IHN3
c3VzcF9yZWFkKHVuc2lnbmVkIGludCAqZmxhZ3NfcCkKPiAgaW50IHN3c3VzcF9jaGVjayhib29s
IHNuYXBzaG90X3Rlc3QpCj4gIHsKPiAgICAgICAgIGludCBlcnJvcjsKPiAtICAgICAgIHZvaWQg
KmhvbGRlcjsKPiAgICAgICAgIGZtb2RlX3QgbW9kZSA9IEZNT0RFX1JFQUQ7Cj4KPiAgICAgICAg
IGlmIChzbmFwc2hvdF90ZXN0KQo+ICAgICAgICAgICAgICAgICBtb2RlIHw9IEZNT0RFX0VYQ0w7
Cj4KPiAgICAgICAgIGhpYl9yZXN1bWVfYmRldiA9IGJsa2Rldl9nZXRfYnlfZGV2KHN3c3VzcF9y
ZXN1bWVfZGV2aWNlLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbW9kZSwgJmhvbGRlciwgTlVMTCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBtb2RlLCAmc3dzdXNwX2hvbGRlciwgTlVMTCk7Cj4gICAgICAgICBpZiAo
IUlTX0VSUihoaWJfcmVzdW1lX2JkZXYpKSB7Cj4gICAgICAgICAgICAgICAgIHNldF9ibG9ja3Np
emUoaGliX3Jlc3VtZV9iZGV2LCBQQUdFX1NJWkUpOwo+ICAgICAgICAgICAgICAgICBjbGVhcl9w
YWdlKHN3c3VzcF9oZWFkZXIpOwo+IC0tCj4gMi4zOS4yCj4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
