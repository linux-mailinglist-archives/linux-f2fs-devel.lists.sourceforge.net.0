Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB733725B53
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 12:10:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6q7t-000540-14;
	Wed, 07 Jun 2023 10:10:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinpu.wang@ionos.com>) id 1q6q7p-00053u-Kc
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 10:10:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=79vzDiF+tHrnH1dRnmQpod9DfGlW5ryqo0lz5n79FPI=; b=ZxQjgSQuaOpfaxDc2rdFQ6lXbA
 iCG3RyAAyA3l2m74fzKezJ08vswlylnZY1aT9rwTr9yTbtbZdVBVuetetpDkAUHv8pBncDYKapnpn
 0VciShzonCZN1UFbiPHCMxYrSUJyPnuPcAyaJTHYPXmhOxJSLGnRX1/YAqfW2cIYEvm8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=79vzDiF+tHrnH1dRnmQpod9DfGlW5ryqo0lz5n79FPI=; b=V16CpfTEErJW93b/0m6K4TV1B2
 G9Y6DgSTCD44fYRq/mEf66JtUYHxoaDFNxc0gawCxS6KjHmMkQTZiA2cJbGxCl7zqjAyiwbp2vXZq
 8oh/tZE8M52tyEZfBj5KygUGuN+BbjpKsjMO+gEqKw77AMduXBzwb1WhPJNPQP35wbD8=;
Received: from mail-lj1-f171.google.com ([209.85.208.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q6q7p-00DaYQ-Em for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 10:10:46 +0000
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2b1c5a6129eso43601281fa.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 07 Jun 2023 03:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ionos.com; s=google; t=1686132639; x=1688724639;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=79vzDiF+tHrnH1dRnmQpod9DfGlW5ryqo0lz5n79FPI=;
 b=RkKW3DNvcdrhnt4bzzVG5jzG0w1RxhKoOuLVmeuMNxAsa/cg1k418M6+b/EcSVa3La
 mANmyDMbSFeH7dVjtj/AFdmluIA8Darz3HbU4mzHFCJPbeUKNdTNWg+MyNvbFCKUjsSJ
 ENcP55EmYvnaYNhkipKGoKTtzRIWrYfIG7frHh05lejV0CRcSjLj8bHm5ao0Kqe0IYP1
 KnotUN+KMOf8FNR9ayyjbKnjMec5eTZjSL93NJAKF971XZhmnHgQkM96F6V3MkSQWZPm
 Dyp/473zBGVIKoep2lRvKy0FAGxn/s6JjK9QbbF94B/x0LCu8fmc4/5hUScwasRPJZ8B
 Wl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686132639; x=1688724639;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=79vzDiF+tHrnH1dRnmQpod9DfGlW5ryqo0lz5n79FPI=;
 b=Mhc1vA1xkNSP+q4L0zIKHeAxiIw+hmfy7yDbdjnPnZwFagH1oDxJpt1MQWccqFqDgr
 mz7r4QD0ou8+r/BjpuGFGIiC3R7EYyz5y/k4B656/YJGR4REQQ11lLq1TZmGmWt1gjJu
 isENjEgKkL/6V56JfH0e5iehC4+371U1+Pkt96gRRN5FpI3GuqI9g4JVs55F5DHCYI5T
 +K3sSnpdPI45VXn45m2FkNKyUtEqtEArDqZKc7nq+PiT9NZ3Gz09W9ecXOHTXugD2GQg
 C3ysO8tGNmOxlxWwCjIE+2FDPm17lP0UjZyKpM7E8fSgrzCqqTl09yvdhmk1918T4/0O
 dedQ==
X-Gm-Message-State: AC+VfDx56wXz2ZDp9+qgjt/6VVaheTe1cZ5kCKXM51a66xvT6fxysIv5
 02LbQ1W4zXZ2xT0h0dp1Uu1rt95E8AMUXLSfns6us/TvJRyoi38W8hQ3Xg==
X-Google-Smtp-Source: ACHHUZ6S5zCcoB3bV8vZmXpO8sNjvRC4rvkXRPMqlcDG+MUEcxQoM5+7tlD1+Znnck9OUJnJex1d7ZYhdubt6xLn55E=
X-Received: by 2002:aa7:c3c3:0:b0:516:3261:17d with SMTP id
 l3-20020aa7c3c3000000b005163261017dmr3783303edr.20.1686131149770; Wed, 07 Jun
 2023 02:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-29-hch@lst.de>
In-Reply-To: <20230606073950.225178-29-hch@lst.de>
Date: Wed, 7 Jun 2023 11:45:39 +0200
Message-ID: <CAMGffEk2LB0CDqR6DJczhejkkyK1Q5Ybu-wJ_fr99O0fXa-pew@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Jun 6, 2023 at 9:41 AM Christoph Hellwig <hch@lst.de>
    wrote: > > The only overlap between the block open flags mapped into the
   fmode_t and > other uses of fmode_t are FMODE_READ and FMODE_WR [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.171 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.171 listed in list.dnswl.org]
X-Headers-End: 1q6q7p-00DaYQ-Em
Subject: Re: [f2fs-dev] [PATCH 28/31] block: replace fmode_t with a
 block-specific type for block open flags
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
From: Jinpu Wang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jinpu Wang <jinpu.wang@ionos.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-nvme@lists.infradead.org,
 Phillip Potter <phil@philpotter.co.uk>, Chris Mason <clm@fb.com>,
 dm-devel@redhat.com, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-pm@vger.kernel.org,
 linux-um@lists.infradead.org, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKdW4gNiwgMjAyMyBhdCA5OjQx4oCvQU0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gVGhlIG9ubHkgb3ZlcmxhcCBiZXR3ZWVuIHRoZSBibG9jayBvcGVu
IGZsYWdzIG1hcHBlZCBpbnRvIHRoZSBmbW9kZV90IGFuZAo+IG90aGVyIHVzZXMgb2YgZm1vZGVf
dCBhcmUgRk1PREVfUkVBRCBhbmQgRk1PREVfV1JJVEUuICBEZWZpbmUgYSBuZXcKPiBibGtfbW9k
ZV90IGluc3RlYWQgZm9yIHVzZSBpbiBibGtkZXZfZ2V0X2J5XyosIC0+b3BlbiBhbmQgLT5pb2N0
bCBhbmQKPiBzdG9wIGFidXNpbmcgZm1vZGVfdC4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9w
aCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+ICBhcmNoL3VtL2RyaXZlcnMvdWJkX2tlcm4u
YyAgICAgICAgICB8ICA4ICsrKy0tLQo+ICBhcmNoL3h0ZW5zYS9wbGF0Zm9ybXMvaXNzL3NpbWRp
c2suYyB8ICAyICstCj4gIGJsb2NrL2JkZXYuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgMzIg
KysrKysrKysrKystLS0tLS0tLS0tLQo+ICBibG9jay9ibGstem9uZWQuYyAgICAgICAgICAgICAg
ICAgICB8ICA4ICsrKy0tLQo+ICBibG9jay9ibGsuaCAgICAgICAgICAgICAgICAgICAgICAgICB8
IDExICsrKystLS0tCj4gIGJsb2NrL2ZvcHMuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgMjYg
KysrKysrKysrKysrKy0tLS0tCj4gIGJsb2NrL2dlbmhkLmMgICAgICAgICAgICAgICAgICAgICAg
IHwgIDggKysrLS0tCj4gIGJsb2NrL2lvY3RsLmMgICAgICAgICAgICAgICAgICAgICAgIHwgNDIg
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9ibG9jay9hbWlmbG9wLmMg
ICAgICAgICAgICAgfCAxMiArKysrLS0tLS0KPiAgZHJpdmVycy9ibG9jay9hb2UvYW9lYmxrLmMg
ICAgICAgICAgfCAgNCArLS0KPiAgZHJpdmVycy9ibG9jay9hdGFmbG9wLmMgICAgICAgICAgICAg
fCAyNSArKysrKysrKystLS0tLS0tLQo+ICBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMg
ICAgICB8ICA3ICsrLS0tCj4gIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmMgICAgICAgIHwg
IDIgKy0KPiAgZHJpdmVycy9ibG9jay9mbG9wcHkuYyAgICAgICAgICAgICAgfCAyOCArKysrKysr
KystLS0tLS0tLS0tCj4gIGRyaXZlcnMvYmxvY2svbG9vcC5jICAgICAgICAgICAgICAgIHwgMjIg
KysrKysrKy0tLS0tLS0tCj4gIGRyaXZlcnMvYmxvY2svbXRpcDMyeHgvbXRpcDMyeHguYyAgIHwg
IDQgKy0tCj4gIGRyaXZlcnMvYmxvY2svbmJkLmMgICAgICAgICAgICAgICAgIHwgIDQgKy0tCj4g
IGRyaXZlcnMvYmxvY2svcGt0Y2R2ZC5jICAgICAgICAgICAgIHwgMTcgKysrKysrLS0tLS0tCj4g
IGRyaXZlcnMvYmxvY2svcmJkLmMgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9i
bG9jay9ybmJkL3JuYmQtY2x0LmMgICAgICAgfCAgNCArLS0KPiAgZHJpdmVycy9ibG9jay9ybmJk
L3JuYmQtc3J2LmMgICAgICAgfCAgNCArLS0KQWNrZWQtYnk6IEphY2sgV2FuZyA8amlucHUud2Fu
Z0Bpb25vcy5jb20+ICMgZm9yIHJuYmQuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
