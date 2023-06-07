Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB71A725B52
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 12:10:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6q7R-0005aB-Iy;
	Wed, 07 Jun 2023 10:10:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinpu.wang@ionos.com>) id 1q6q7P-0005a1-Kt
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 10:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iTSJC08M16dk7ac+qC1NLiFtaB9M/5yyS+Z15P92ssA=; b=ZFaDEfojDH910qi/D2MkLUZ9WF
 e9pi8XflYYMGu5maS8KjR/ARrkq539TMWXEJ5wKnmdGZBwB81hk2gMg0UjSCh8/mD/MgqT4ezdyFM
 7yUQrNh9B94gfe0jrcQFOZgkrwxo8LmZYLForq3rrovolOvMI+3ZHKvK5GZMssmkzjmE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iTSJC08M16dk7ac+qC1NLiFtaB9M/5yyS+Z15P92ssA=; b=GgPudsh9awDmDsbPP8P/dic1hj
 e6cP/pNYh6N671qq+x+shsr99L9UshirVl+8iZo/NTOC9gt96q1isDTwSqCuFnRD6EjFlkPUBr8Zc
 j5AFIwc6G/3xozLWlVdHKyYwmBQfVj15Ddn0E9xpSEEfRe2/vhkOF3UsBEGrWRdjn7sU=;
Received: from mail-lf1-f54.google.com ([209.85.167.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q6q7I-0007Qj-G6 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 10:10:16 +0000
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso8827337e87.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 07 Jun 2023 03:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ionos.com; s=google; t=1686132605; x=1688724605;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iTSJC08M16dk7ac+qC1NLiFtaB9M/5yyS+Z15P92ssA=;
 b=fjdzQKrvEdZLD3FUynwQ0WzIfC29bQoNpYGk1wJxHm9YpVCSHILCD4dhaJUPCQXrSQ
 SESaLDIcF/cv+/Pj78THOD17ixlTIyOty+eYG6ga03fEpcbfxJ1JfJs8pbZvqjmFCE0P
 vw9b+n9VbjLP8xXHMXxbThEkffG8BZr+u8Q8QgUdFG5DJ63M8t+avieGv8y0GJ0Paexp
 WBMAuE/uXIIhx5/CVAXkBDpINR67TvuSV52A33+vOQilQh8fnlSh1itNBt7sEyL2TgqB
 gGE374W9mdwb/bSIKQf2GER5MEU9L+8QQ1R8IUeIMy8shKLDurEFWp+q3zr4ezkhYFf3
 wMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686132605; x=1688724605;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iTSJC08M16dk7ac+qC1NLiFtaB9M/5yyS+Z15P92ssA=;
 b=hoDFMJ6Eu75OKRV06lmrLeK+Q+AuM3NqFpRVNmS30jft/BnAeoPeBkQIouOGD5W0vi
 4Hh91cgbj9uZ5hmFPXxitm1HIxfIp2M7IoXp7BEanMHxmBVoiBojkx6YYSBH8XEwaYmg
 6cRgozkBn3Aezx3dCeYhIR4A0knCSE7KXiY49wNX19qH7z+9oa0Xf5b9ZS8lEKR2YQQw
 XVepHkAS2xGrcOFqxz18xIfof4Mpjm7X3aqU3sOuiGhqVlrqMbKnFBaTdI246Ft3DvHD
 cTV9+9qXC6Q3rxLN2DNCU5JDXMLZVU2C7+NDP323JbZXAv3mV09k8LC6La4jo85lx7C8
 reVA==
X-Gm-Message-State: AC+VfDzzluJN7BtGPxCWDvskuuTGz8QwvOCprWkZ7Bcg8MrxogzBzhT7
 u7jnFn5fKJuGEq2VwBLdm852vaVOIiOGW95dH8MMbLTPjEwXeNfHfeEG1w==
X-Google-Smtp-Source: ACHHUZ5i8f5AUVXLioiA4Msh4foVuVuox1MKnFKi4fucw3rKEDDzkk1m6bVkvWRpki6Lz1RgGXGnv70bM2LGvyL4BxY=
X-Received: by 2002:aa7:cd55:0:b0:514:8e6f:7113 with SMTP id
 v21-20020aa7cd55000000b005148e6f7113mr3506396edw.22.1686130971195; Wed, 07
 Jun 2023 02:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-10-hch@lst.de>
In-Reply-To: <20230606073950.225178-10-hch@lst.de>
Date: Wed, 7 Jun 2023 11:42:40 +0200
Message-ID: <CAMGffEkKpHzatfeJhKtJQMTNckJGc7sJQ_LWFg-KvazvOD4DWw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Jun 6, 2023 at 9:40 AM Christoph Hellwig <hch@lst.de>
    wrote: > > ->open is only called on the whole device. Make that explicit
   by > passing a gendisk instead of the block_device. > > Signed- [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.54 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.54 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q6q7I-0007Qj-G6
Subject: Re: [f2fs-dev] [PATCH 09/31] block: pass a gendisk to ->open
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
c3QuZGU+IHdyb3RlOgo+Cj4gLT5vcGVuIGlzIG9ubHkgY2FsbGVkIG9uIHRoZSB3aG9sZSBkZXZp
Y2UuICBNYWtlIHRoYXQgZXhwbGljaXQgYnkKPiBwYXNzaW5nIGEgZ2VuZGlzayBpbnN0ZWFkIG9m
IHRoZSBibG9ja19kZXZpY2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8
aGNoQGxzdC5kZT4KPiAtLS0KPiAgYXJjaC91bS9kcml2ZXJzL3ViZF9rZXJuLmMgICAgICAgICAg
fCAgNSArKy0tLQo+ICBhcmNoL3h0ZW5zYS9wbGF0Zm9ybXMvaXNzL3NpbWRpc2suYyB8ICA0ICsr
LS0KPiAgYmxvY2svYmRldi5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2
ZXJzL2Jsb2NrL2FtaWZsb3AuYyAgICAgICAgICAgICB8ICA4ICsrKystLS0tCj4gIGRyaXZlcnMv
YmxvY2svYW9lL2FvZWJsay5jICAgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL2Jsb2NrL2F0
YWZsb3AuYyAgICAgICAgICAgICB8IDE2ICsrKysrKystLS0tLS0tLQo+ICBkcml2ZXJzL2Jsb2Nr
L2RyYmQvZHJiZF9tYWluLmMgICAgICB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL2Jsb2NrL2Zsb3Bw
eS5jICAgICAgICAgICAgICB8IDMwICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gIGRy
aXZlcnMvYmxvY2svbmJkLmMgICAgICAgICAgICAgICAgIHwgIDggKysrKy0tLS0KPiAgZHJpdmVy
cy9ibG9jay9wa3RjZHZkLmMgICAgICAgICAgICAgfCAgNiArKystLS0KPiAgZHJpdmVycy9ibG9j
ay9yYmQuYyAgICAgICAgICAgICAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvYmxvY2svcm5iZC9y
bmJkLWNsdC5jICAgICAgIHwgIDQgKystLQpBY2tlZC1ieTogSmFjayBXYW5nIDxqaW5wdS53YW5n
QGlvbm9zLmNvbT4gIyBmb3Igcm5iZAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
