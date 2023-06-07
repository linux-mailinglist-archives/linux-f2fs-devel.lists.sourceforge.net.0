Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8345725B40
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 12:05:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6q2R-0006HM-0Q;
	Wed, 07 Jun 2023 10:05:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinpu.wang@ionos.com>) id 1q6q2P-0006H6-Gq
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 10:05:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gjKWGYzTLmxl6ndmaqY1vhf0MYCxKeiBaM5D6TZOn9k=; b=GENgU7nGRh/nx7UvdnWGV1U9KL
 RI8+AbZpXZuvcQeP6qZyHhP6wTwvEBN+fikNX8NXd6upM5KgQjmmYnIVRhjR5frRVW8v6HMP7fUnE
 cpuZ+fy1DnDr5dEtPTroZoKm96zPp04enfPs1m5Ca8gKw4g7yXRsEgT7QHOP94xQRHi4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gjKWGYzTLmxl6ndmaqY1vhf0MYCxKeiBaM5D6TZOn9k=; b=dgGCFFwqVcrGq4b8YHdCUmL0ht
 BplTfhV0s+8UryiSnydp7U/Uk3ZxblHD+d/xiNLAU78gXfRYRrxmBq3+CDgMUklk4RRasGq8EMuM0
 dvXT9s2JUOJA4YgPxyA8AnEeNhgvYNDxlQYCrww4Z1/NgcfjujasmQ93Uu2VZeDYwZPQ=;
Received: from mail-lf1-f44.google.com ([209.85.167.44])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q6q2J-00DaDH-78 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 10:05:10 +0000
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-4f640e48bc3so886628e87.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 07 Jun 2023 03:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ionos.com; s=google; t=1686132296; x=1688724296;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gjKWGYzTLmxl6ndmaqY1vhf0MYCxKeiBaM5D6TZOn9k=;
 b=RlS9gj4jVhZRwlhSLs75w3qfxhsesmcUK6wugyexHrG0ksjH4rGcr3ZLdhEOQf+p8V
 /hTkisbcfpcKCBbN4tIArxytK2xn36ie7ed95vN6g0gTEHbmB4dSKuuUOJJXmmLxrLMD
 1Xp9srH7TNLAD8uWhHt3VMDpXudrD2R/QsvuL3TqGpXv1j+AnqivJ30OY+H1jhOkGDVU
 5KJKlmk+bWF1tv+aQmYEN6twnsRGZS3SAtleyEWBHISD2VK+6JIiJNTwxGAEurDHMDCR
 4g3+hty4AQ0UKJ4dQKbNaKU/UOyHOyZwK6XFXvQ7ewB9yj/uwnE3p5eWRmJZH7vX/tRh
 ZkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686132296; x=1688724296;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gjKWGYzTLmxl6ndmaqY1vhf0MYCxKeiBaM5D6TZOn9k=;
 b=jV2dfZsQMbWfxa/0n+E7zRnmT7Qw9Zv2t1NbhUrY6fe/qcY7kjBzECEfkkaENrZwdG
 3y75gv/+FFfNUrDBYrbBY8tZ9CFsuiRX8qNT3qRw1H48rWtDM2bmga6AWFJqS6QOjz2b
 2kfF7D+xQhK0JogMHPgiJqQnGqizk7VwpuWsTVGlDnxf49hzQW1+jMsqzTwO48h21GW7
 LdjOBJBlYZfG2EUogTKBNprwd8sc7zVsb6G3bw2nYPTLClcjwG6NPEjQT/IkLBsSBlDU
 OrkaxMJs2TN/9JWblgKzEctP52/lmXJ/biRtJDCSXp1iHO95I8lo7C90DcHmJMPEO6Ko
 BnSg==
X-Gm-Message-State: AC+VfDxyT9+Gf8lvcx9zVNNxqrmhQ4Rr1hvLeLym3XUpeC5BS1E9//fR
 JlKjR9Wivvcnb/tvqUpQKWQlTK4Oc/JZrfORNVey7Okf6HN8U43B
X-Google-Smtp-Source: ACHHUZ4JO4oLBtR+CLz1tcyt1M0aK5Az38dx3TKZ26TI2779MlmTOIaNGaUTpmyncHvDOVtnmf3szZ6EUx+OtsgHRJ4=
X-Received: by 2002:a17:907:3f22:b0:96b:1608:3563 with SMTP id
 hq34-20020a1709073f2200b0096b16083563mr5475281ejc.58.1686130718689; Wed, 07
 Jun 2023 02:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-15-hch@lst.de>
In-Reply-To: <20230606073950.225178-15-hch@lst.de>
Date: Wed, 7 Jun 2023 11:38:27 +0200
Message-ID: <CAMGffEk8Zex5+u69YW9AXGQh-ch79mw7=Gn3L1M=qwvZCVa5VA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Jun 6, 2023 at 9:40 AM Christoph Hellwig <hch@lst.de>
    wrote: > > Passing a holder to blkdev_get_by_path when FMODE_EXCL isn't set
    doesn't > make sense, so pass NULL instead. > > Signed-off-b [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.44 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.44 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q6q2J-00DaDH-78
Subject: Re: [f2fs-dev] [PATCH 14/31] rnbd-srv: don't pass a holder for
 non-exclusive blkdev_get_by_path
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
c3QuZGU+IHdyb3RlOgo+Cj4gUGFzc2luZyBhIGhvbGRlciB0byBibGtkZXZfZ2V0X2J5X3BhdGgg
d2hlbiBGTU9ERV9FWENMIGlzbid0IHNldCBkb2Vzbid0Cj4gbWFrZSBzZW5zZSwgc28gcGFzcyBO
VUxMIGluc3RlYWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4KQWNrZWQtYnk6IEphY2sgV2FuZyA8amlucHUud2FuZ0Bpb25vcy5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvYmxvY2svcm5iZC9ybmJkLXNydi5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Js
b2NrL3JuYmQvcm5iZC1zcnYuYyBiL2RyaXZlcnMvYmxvY2svcm5iZC9ybmJkLXNydi5jCj4gaW5k
ZXggY2VjMjJiYmFlMmY5YTUuLmNlNTA1ZTU1MmY0ZDUwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
YmxvY2svcm5iZC9ybmJkLXNydi5jCj4gKysrIGIvZHJpdmVycy9ibG9jay9ybmJkL3JuYmQtc3J2
LmMKPiBAQCAtNzE5LDcgKzcxOSw3IEBAIHN0YXRpYyBpbnQgcHJvY2Vzc19tc2dfb3BlbihzdHJ1
Y3Qgcm5iZF9zcnZfc2Vzc2lvbiAqc3J2X3Nlc3MsCj4gICAgICAgICAgICAgICAgIGdvdG8gcmVq
ZWN0Owo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBiZGV2ID0gYmxrZGV2X2dldF9ieV9wYXRoKGZ1
bGxfcGF0aCwgb3Blbl9mbGFncywgVEhJU19NT0RVTEUsIE5VTEwpOwo+ICsgICAgICAgYmRldiA9
IGJsa2Rldl9nZXRfYnlfcGF0aChmdWxsX3BhdGgsIG9wZW5fZmxhZ3MsIE5VTEwsIE5VTEwpOwo+
ICAgICAgICAgaWYgKElTX0VSUihiZGV2KSkgewo+ICAgICAgICAgICAgICAgICByZXQgPSBQVFJf
RVJSKGJkZXYpOwo+ICAgICAgICAgICAgICAgICBwcl9lcnIoIk9wZW5pbmcgZGV2aWNlICclcycg
b24gc2Vzc2lvbiAlcyBmYWlsZWQsIGZhaWxlZCB0byBvcGVuIHRoZSBibG9jayBkZXZpY2UsIGVy
cjogJWRcbiIsCj4gLS0KPiAyLjM5LjIKPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
