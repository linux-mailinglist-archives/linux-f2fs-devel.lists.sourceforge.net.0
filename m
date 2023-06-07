Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F02F0725B4F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 12:09:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6q6X-0006MO-Eh;
	Wed, 07 Jun 2023 10:09:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinpu.wang@ionos.com>) id 1q6q6U-0006MI-HY
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 10:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/hFPeu/3BJQ1XAEBfX/WbvMEVzeUhOBPi58IZ/Esj6w=; b=l4IYevxmRptdlxgC/CvboAq+bY
 PzLUpv/u/nk96LZDutzaV6K9UVZfdgaJRQ7/ejiAqwiZPzIt3B6yamrhs248h0GwgzNAP53pvRMiw
 I2Ei/Bsj0GiyNE0QlYRGH3H6cNUasTB2eJfOl2Qdo5bgwntwWFQABgWCiGv3IcFKZEro=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/hFPeu/3BJQ1XAEBfX/WbvMEVzeUhOBPi58IZ/Esj6w=; b=WuDylFcJgPmAQuPRnWsdLpkwI+
 JmOJq77/tim0inD1lSM2S5VCKk414sm2XkhMqI0LAkygoC01r3y1Sy3oonrhDD9zoQlFrwYBlIY4Q
 nBusL9xlix4692UtiJAIjtHCspHJ6bj52X97+RnZuLGPSA4lkKv7AwWDkIeq05sqOjpk=;
Received: from mail-ed1-f54.google.com ([209.85.208.54])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q6q6U-00DaU6-7n for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 10:09:22 +0000
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-51458187be1so1167619a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 07 Jun 2023 03:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ionos.com; s=google; t=1686132556; x=1688724556;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/hFPeu/3BJQ1XAEBfX/WbvMEVzeUhOBPi58IZ/Esj6w=;
 b=FdbJ0SgCHsroxpucg/5m9pPBnJswpbJNk78ifH+HB8BRy0G9i3YFx6H5YjeB3wukhy
 c1Rgu3JfHeBKwb7BGIvO/uRavazlmkA7Bwv5leImNwHeGKRdelvYAyfBOVo48yYMbQzx
 Op5ujeWifEvC1NOICz03Bn2Aijm6qu6t4CJqTJVx/D6p7/2eRkjfvcbIS60gT/4nC3+3
 iqJOu3IpeHRmQHsRITm6IhzmeAAls5pmk31Gar/BMO7vX6Sv/n4Hs/sKCFYvLz7oQs61
 Yz5m47OTVzCozZWJl0L+cCGE0rHujui8SZkGjFIx4EaFChU+KLS65iEL12Y4bm+UNj+e
 l2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686132556; x=1688724556;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/hFPeu/3BJQ1XAEBfX/WbvMEVzeUhOBPi58IZ/Esj6w=;
 b=Rsjd9KiYl/lNkwu3zCN6RGImzFXwW1MJ/jGfILHbdGwyT8QRkFDCIs/hnJ8h3xTxbg
 T1crd5v7TQA3wTw4538/o76i170EqTE8fJH/H51PGZNpgIiK/0QJXbtkh0NBUKNJqq1t
 2jz4o2bzLCgo3ir4jRfs+Xt8OAPvcTInjUJeMZ7/FJv8yeHQaLhHe3cv+XcHrRf83WHO
 6+MsKAbFDBXj0XqQvIT6LHgVzGEXXZ2R33XVyeGNnHnn3ofqT89uenlwSooJNn9dhEmV
 suCdIXMdWNDz9O1YwCLTjaN8L6VlANrgxWNPOEoPSyCpcK91EuJ7U3nwulvTxFfkUz8C
 05BQ==
X-Gm-Message-State: AC+VfDw+EeLhJ5YmC1xX+V4/H94NVTz4XiJprbMK5Qw/snBiQUFtq4y7
 OGalVvkd0MwSWlE4LAFIDGDGfLeRZSS5PoSQwFc1qAO/ODFqPJFjyDTmpw==
X-Google-Smtp-Source: ACHHUZ78LLb5/9Eve9DZQqNC/TRa3vxkXV4pVMAtKfHjnQnscHPEcmWv/7uCCN4Q8kcsT8KuG+XDWcwCZO/ggZjCnJk=
X-Received: by 2002:a17:907:2d8c:b0:94e:e97b:c65 with SMTP id
 gt12-20020a1709072d8c00b0094ee97b0c65mr5404803ejc.60.1686130883637; Wed, 07
 Jun 2023 02:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-11-hch@lst.de>
In-Reply-To: <20230606073950.225178-11-hch@lst.de>
Date: Wed, 7 Jun 2023 11:41:12 +0200
Message-ID: <CAMGffEkqXCkxpA+qqDVfx0echCPvNpWgK3hZWbb11F6cv2EQ-A@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Jun 6, 2023 at 9:40 AM Christoph Hellwig <hch@lst.de>
    wrote: > > The mode argument to the ->release block_device_operation is never
    used, > so remove it. > > Signed-off-by: Christoph Hellwig [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.54 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.54 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q6q6U-00DaU6-7n
Subject: Re: [f2fs-dev] [PATCH 10/31] block: remove the unused mode argument
 to ->release
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

T24gVHVlLCBKdW4gNiwgMjAyMyBhdCA5OjQw4oCvQU0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gVGhlIG1vZGUgYXJndW1lbnQgdG8gdGhlIC0+cmVsZWFzZSBibG9j
a19kZXZpY2Vfb3BlcmF0aW9uIGlzIG5ldmVyIHVzZWQsCj4gc28gcmVtb3ZlIGl0Lgo+Cj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gIGFyY2gv
dW0vZHJpdmVycy91YmRfa2Vybi5jICAgICAgICAgIHwgIDQgKystLQo+ICBhcmNoL3h0ZW5zYS9w
bGF0Zm9ybXMvaXNzL3NpbWRpc2suYyB8ICAyICstCj4gIGJsb2NrL2JkZXYuYyAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMTQgKysrKysrKy0tLS0tLS0KPiAgZHJpdmVycy9ibG9jay9hbWlmbG9w
LmMgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL2Jsb2NrL2FvZS9hb2VibGsuYyAgICAg
ICAgICB8ICAyICstCj4gIGRyaXZlcnMvYmxvY2svYXRhZmxvcC5jICAgICAgICAgICAgIHwgIDQg
KystLQo+ICBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMgICAgICB8ICA0ICsrLS0KPiAg
ZHJpdmVycy9ibG9jay9mbG9wcHkuYyAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL2Js
b2NrL2xvb3AuYyAgICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvYmxvY2svbmJkLmMg
ICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9ibG9jay9wa3RjZHZkLmMgICAgICAg
ICAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvYmxvY2svcmJkLmMgICAgICAgICAgICAgICAgIHwg
IDIgKy0KPiAgZHJpdmVycy9ibG9jay9ybmJkL3JuYmQtY2x0LmMgICAgICAgfCAgMiArLQpBY2tl
ZC1ieTogSmFjayBXYW5nIDxqaW5wdS53YW5nQGlvbm9zLmNvbT4gIyBmb3Igcm5iZAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK
