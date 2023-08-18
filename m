Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE8A7811F5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Aug 2023 19:28:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qX3Gt-0005IW-AU;
	Fri, 18 Aug 2023 17:28:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk.kim@gmail.com>) id 1qX3Gs-0005IM-5i
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Aug 2023 17:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=em5ke42B2nqzkvlBfMQ6jCm7pslLIQDgY3OFG/z+1Gg=; b=KqsdidTPApMAF8AcRa7wziagse
 7o1KTVVL45ymnDinC/lhHqvRmPtHnnt4/Bw+qaSeTwSVZvsY7TU0DZ6eDTJVuWJpJW0D8pi4URU+E
 mT2CsQfbVnSQ66guBOlDcOC5vYOYb3MTrrEF3FAbhgRbnhphU05D10rYwhFieGCzvO4Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=em5ke42B2nqzkvlBfMQ6jCm7pslLIQDgY3OFG/z+1Gg=; b=KmV8z0B0WQM3Om562IJvG3g8f2
 fFaldzFXF+gHGI1fdOjD1lc+q67JXcLxWbVrzdo2mq+cvkmY+utxQTD5X0PpjpMeUWpREAjOSMsbM
 AV+KJ+uyaqtHaU0eYtqXPNOy9Rh3hiaDtpFxUWYRWgq3oZ51e/9xAL4ylDz92Xpdls2I=;
Received: from mail-wm1-f49.google.com ([209.85.128.49])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qX3Gp-008sMj-AL for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Aug 2023 17:28:24 +0000
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-3fe8a1591c8so10896185e9.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 18 Aug 2023 10:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692379697; x=1692984497;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=em5ke42B2nqzkvlBfMQ6jCm7pslLIQDgY3OFG/z+1Gg=;
 b=sRvYB/LIzN/6FYNAWV/uLH4h4YSgGFmKtnhcoyIqpzxOx9jgd0f/ZBEOEPqCQ7LQ6H
 W+AzN3gCiNu/iztYnxGYocVpLsOiUnam2ejNSTKc7MD/Zir24z/8r1Z9Re6gyWgaWqVG
 VMA4YoloUsBJ4nJsMAn9PGmEZk6i0kXyyxCm3UoBKeRpFSGmkMqqQZ4BcfQfev7LwZML
 jrw/0BuF/U9Yy1ER+8Kspcgg6fSFpzlKgmiMdXdBfi8RYPFcHhkENt/iYedAFKDvEFV3
 bi0AbPWNhesKET0B+sEX1LYWOppz5KqhuTB5NMs7c9LxwlYlYIKBtTOsaHZ397/mV7+C
 lWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692379697; x=1692984497;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=em5ke42B2nqzkvlBfMQ6jCm7pslLIQDgY3OFG/z+1Gg=;
 b=L8TiFYZ2IF4tL4XtkkrU9HjS9KkqDpwjwIMNqBZMfHF9o/ugB/1nVfsnqXuWqE9ku7
 d5kNPGnE6dAD+kJOjg0wZSiIbwjabtyJ7JF4kpbCINVc8L+mhdZTR/LGywx5iRARsnep
 4hJsJcexO6shcHodgk+K9RWMtLUqBmgWeUojym+5eeOvrMfqRWmFmPpgAtGHHePUB3R1
 hRBbV03eHmBy9RFK9rNcTA1LDMg8f7q4tIR1yZZ2b1ndQPS+QEYs9Ig4/pRNll3vDyq7
 sgF9Y/EoTcdNYl22C6dPx8eAdXwHqsARsJZmpPL4CBfYcEXpcCCVg1ez3PuC4I/p/3KP
 bI2g==
X-Gm-Message-State: AOJu0Yxgqor9TIjXWUyKLOfSV0QLde4Gds19LmTM42lkZT7mRrE5E1Ot
 KLwZs607177b+qP7s/hwQMz0S83M0FURQv/cq5I=
X-Google-Smtp-Source: AGHT+IEgnc+vHvSyhjXj8bQHlt5qOXseQFbQYgVYlRhu+nRb31XSVo1gfzUHIXPzAFYa5aCgXUfxoJ0UrFsADv678KQ=
X-Received: by 2002:a1c:7210:0:b0:3fb:b280:f548 with SMTP id
 n16-20020a1c7210000000b003fbb280f548mr2553745wmc.0.1692379696398; Fri, 18 Aug
 2023 10:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <ae78956b-0c55-4980-8ec4-5cccf7e69c16@roeck-us.net>
 <CAOtxgyeE+PLWVCTMHbr6OgwXY5MB1vPmauY2wcvEZdW8OhM-YQ@mail.gmail.com>
 <93fee6c4-fb2b-49eb-ab54-e77603289f6a@roeck-us.net>
 <CAOtxgychpamcvMDtOcX=ZGsL8WPfYfLAjCRg-YAnEHYDBva+7g@mail.gmail.com>
 <63722b9f-b510-50a7-8839-6ada783d2164@kernel.org>
 <20230817155319.GA1483@sol.localdomain>
 <700c2e58-d2fe-47c6-85a8-aa7f7b1613cf@roeck-us.net>
In-Reply-To: <700c2e58-d2fe-47c6-85a8-aa7f7b1613cf@roeck-us.net>
From: Jaegeuk Kim <jaegeuk.kim@gmail.com>
Date: Fri, 18 Aug 2023 10:28:04 -0700
Message-ID: <CAOtxgyedoExF5yfJO6BkU6fYjJMpfJBDuEuG_2rjyT7o9qcX4Q@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Chao, Do you have some bandwidth to address this? Otherwise, 
 I'll do some. Thanks, 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jaegeuk.kim[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.49 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.49 listed in list.dnswl.org]
X-Headers-End: 1qX3Gp-008sMj-AL
Subject: Re: [f2fs-dev] circular locking dependency warning in f2fs
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
Cc: Eric Biggers <ebiggers@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbywKCkRvIHlvdSBoYXZlIHNvbWUgYmFuZHdpZHRoIHRvIGFkZHJlc3MgdGhpcz8gT3RoZXJ3
aXNlLCBJJ2xsIGRvIHNvbWUuCgpUaGFua3MsCgpPbiBGcmksIEF1ZyAxOCwgMjAyMyBhdCA2OjE1
4oCvQU0gR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PiB3cm90ZToKPgo+IE9uIFRo
dSwgQXVnIDE3LCAyMDIzIGF0IDA4OjUzOjE5QU0gLTA3MDAsIEVyaWMgQmlnZ2VycyB3cm90ZToK
PiA+IE9uIFRodSwgQXVnIDE3LCAyMDIzIGF0IDEwOjI2OjEyUE0gKzA4MDAsIENoYW8gWXUgd3Jv
dGU6Cj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBsb2NrKG5ld19pbm9kZSMyLT5pX3NlbSkKPiA+ID4gPiA+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxvY2soZGlyLT5pX3hh
dHRyX3NlbSkKPiA+ID4gPiA+ID4gbG9jayhuZXdfaW5vZGUjMS0+aV9zZW0pCj4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+IFRoaXMgbG9va3MgZmluZSB0byBtZS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+
Cj4gPiA+ID4gPiBCYXNlZCBvbiB5b3VyIGZlZWRiYWNrLCBhbSBJIGNvcnJlY3QgYXNzdW1pbmcg
dGhhdCB5b3UgZG9uJ3QgcGxhbgo+ID4gPiA+ID4gdG8gZml4IHRoaXMgPwo+ID4gPiA+Cj4gPiA+
ID4gSSdtIHF1aXRlIG9wZW4gdG8gc29tZXRoaW5nIHRoYXQgSSBtYXkgbWlzcy4gQ2hhbywgd2hh
dCBkbyB5b3UgdGhpbms/Cj4gPiA+Cj4gPiA+IEphZWdldWssIEkgYWdyZWUgd2l0aCB5b3UsIGl0
IGxvb2tzIGxpa2UgYSBmYWxzZSBhbGFybS4KPiA+ID4KPiA+Cj4gPiBGYWxzZSBwb3NpdGl2ZSBs
b2NrZGVwIHJlcG9ydHMgc3RpbGwgbmVlZCB0byBiZSBlbGltaW5hdGVkLCBmb3IgZXhhbXBsZSBi
eQo+ID4gZml4aW5nIHRoZSBsb2NrZGVwIGFubm90YXRpb25zLiAgT3RoZXJ3aXNlIGl0J3MgaW1w
b3NzaWJsZSB0byBkaXN0aW5ndWlzaCB0aGVtCj4gPiBmcm9tIHRydWUgcG9zaXRpdmVzLgo+ID4K
Pgo+IEV4YWN0bHksIGFuZCB0aGF0IGlzIHdoeSBJIGRvbid0IHRlc3QgZmVhdHVyZXMgd2l0aCBr
bm93biBsb2NrZGVwIGFubm90YXRpb24KPiBpc3N1ZXMuIEknbGwgZHJvcCBmMmZzIGZyb20gbXkg
bGlzdCBvZiBmZWF0dXJlcyB0byB0ZXN0IGZvciB0aGUgdGltZSBiZWluZy4KPgo+IEd1ZW50ZXIK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
