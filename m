Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3269B4FD6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 17:54:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5pTn-00024r-RO;
	Tue, 29 Oct 2024 16:54:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1t5pTm-00024i-5W
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 16:54:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ir049WLIZ+CFdRAvVePLkMs6z/UO0y4AKRZXzYgeCX0=; b=TAwBo+0gDhZea/I758x1ANNQAg
 dTlsIvhBk7Qmnj/Jybgm7mrB+5bovt9U1Ek8Tzj3qlyDBZLzTalxgeuDUd0zo1fAeVF5v7NUcAWwp
 OUQWHVsGlxNWN0kDRjVHYsgFaEcOkUEFBXaOp3Wie0MHLkDJGyKpAtK9j/Y0wsaL44VQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ir049WLIZ+CFdRAvVePLkMs6z/UO0y4AKRZXzYgeCX0=; b=G+VqS8xmyEi3logzcIJ1FDMa9g
 hG6LvoEsdbZH8a+TM2HbbSnjilM2tdS0u8wV3ACFKX6wZlIsM8HRTmq3j1hIU9igXnhslAay6pm4R
 SFMMhnPzRxN7WQBMEkUykFZyZxQ6v1WotJIjHWw9ZTnnTK2VgE+42283GUlCApUwH73U=;
Received: from mail-ua1-f41.google.com ([209.85.222.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t5pTk-0007Pz-FS for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 16:54:02 +0000
Received: by mail-ua1-f41.google.com with SMTP id
 a1e0cc1a2514c-84fed1ff217so9061241.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 29 Oct 2024 09:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730220834; x=1730825634; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ir049WLIZ+CFdRAvVePLkMs6z/UO0y4AKRZXzYgeCX0=;
 b=jqLds3wBY038+lhvDUHDgAPbZiL/721fa7zaoM/ciwwIe8tsc0QXy6IltKyYeh0s9r
 dRXEtCP506YXXKLi3vaYWWRiMzPLFbma7YScy48CW6PgdYePxoO2XQmtg+5F6q57EjHr
 EYXyxHQusCWU6NokfHX93Kj45xcWmYnDyNr/CVF6CwBAAmvUIL5G8CUahZ71beDcpYNC
 JbtJ7pevTcy5QETSuQj6R/tOHWpApVAoIEnsp+v4hq7dfUSTiG8gOTFnkPTrvCtq6+hg
 JNsl4G4zHUrSu4LJ+s1bbd+oRtRC4yrDy1zoTQe7Ph2RJ9Oc7LJOXSBmSqkQhauEotpZ
 vGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730220834; x=1730825634;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ir049WLIZ+CFdRAvVePLkMs6z/UO0y4AKRZXzYgeCX0=;
 b=sGfB4SJUryQlTp7tjU+uOnfH9lUpDh4nBH9Y93/jEMpQI5rmw4OnAYS7638CUY5hsd
 Fm7YDS7K7dUpTHeB3vG7PtQtLIMSSPntdjmYoqh/HcS3GuGsxko1+hF0X8JCoZd81RHr
 s3ks+5XSqLwqd5cl556dPy6z/riw5BksWMc59d9MA77VP3LHb03ZC0geXyJ05B0F8N99
 GYHabXS0XSsQwtOFgAqVFflPDKdQaXJh4dTdWaaivjnlJ+D7p3e0H4pqE95KJitL1M6y
 XVBrCuRPgK1VBmRMnF1B4f0PleGx/emNEuAFznI1LP7hOSiyr/9b5+N3m9WjLQVjC9Cl
 nYmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+W90I8b6+ojJin36W5FQJS/8m9bcDzVbstPRJaNYab4/I/Xj/VbfDls1IolAoSke8QA3wJE88YuvhIo1x1eD2@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxil8hCfu/OwZrGuKWlURXqS+fttQXRYvr2C6IGiUYoFUAFAOL9
 8MFgOUFUzoVIQqxRTrxr8yBHuE4YNR4/wSYRY/7us+Tm0RhZfxPSk2EbXDL7oXBWU3aYYEUUkjH
 v6WF8mMvaiF8ODOq+1xAPgFjvm+o=
X-Google-Smtp-Source: AGHT+IEanAXzQz2JfFkPumCoGo/D3vUbINKmkGH6+oIAboE2p+v9BV/4GYXavt/meX6T5yihQ7MV4oDeZJcukioNzn8=
X-Received: by 2002:a05:6122:16a0:b0:50d:5095:f01c with SMTP id
 71dfb90a1353d-51050d69921mr2185145e0c.7.1730220834352; Tue, 29 Oct 2024
 09:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <20241029134551.252-1-yohan.joung@sk.com>
In-Reply-To: <20241029134551.252-1-yohan.joung@sk.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 29 Oct 2024 09:53:43 -0700
Message-ID: <CACOAw_wGAeMiw=UZ7dL6DC8bq7vxKqB0uKOm6o0wp5B_L7BwDQ@mail.gmail.com>
To: Yohan Joung <jyh429@gmail.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Reviewed-by: Daeho Jeong Thanks, On Tue, Oct 29, 2024 at 6:45 AM
    Yohan Joung wrote: > > When formatting conventional partition with zoned
   one, we are already > aligning the starting block address of the next device
    to the zone si [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.41 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.41 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1t5pTk-0007Pz-FS
Subject: Re: [f2fs-dev] [PATCH v2] mkfs.f2fs: adjust zone alignment when
 using convention partition with zoned one
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

UmV2aWV3ZWQtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+CgpUaGFua3Ms
CgpPbiBUdWUsIE9jdCAyOSwgMjAyNCBhdCA2OjQ14oCvQU0gWW9oYW4gSm91bmcgPGp5aDQyOUBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gV2hlbiBmb3JtYXR0aW5nIGNvbnZlbnRpb25hbCBwYXJ0aXRp
b24gd2l0aCB6b25lZCBvbmUsIHdlIGFyZSBhbHJlYWR5Cj4gYWxpZ25pbmcgdGhlIHN0YXJ0aW5n
IGJsb2NrIGFkZHJlc3Mgb2YgdGhlIG5leHQgZGV2aWNlIHRvIHRoZSB6b25lIHNpemUuCj4gVGhl
cmVmb3JlLCB3ZSBkbyBub3QgYWxpZ24gdGhlIHNlZ21lbnQwIGFkZHJlc3MgdG8gdGhlIHpvbmUg
YWxpZ25tZW50Lgo+IFRoaXMgcmVkdWNlcyB0aGUgd2FzdGVkIHpvbmVfYWxpZ25fc3RhcnRfb2Zm
c2V0Lgo+Cj4gVGVzdCByZXN1bHQKPiBzZWdtZW50MCBibGthZGRyIDM4OTU4MyAtPiAxMTkyNTEK
PiBBZGQgb25lIGFkZGl0aW9uYWwgc2VjdGlvbiB0byBtYWluCj4KPiBTaWduZWQtb2ZmLWJ5OiBZ
b2hhbiBKb3VuZyA8eW9oYW4uam91bmdAc2suY29tPgo+IC0tLQo+ICBta2ZzL2YyZnNfZm9ybWF0
LmMgfCAxMCArKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbWtmcy9mMmZzX2Zvcm1hdC5jIGIvbWtmcy9m
MmZzX2Zvcm1hdC5jCj4gaW5kZXggYTAxYjE5ZS4uNTJhMWUxOCAxMDA2NDQKPiAtLS0gYS9ta2Zz
L2YyZnNfZm9ybWF0LmMKPiArKysgYi9ta2ZzL2YyZnNfZm9ybWF0LmMKPiBAQCAtMjY2LDYgKzI2
Niw3IEBAIHN0YXRpYyBpbnQgZjJmc19wcmVwYXJlX3N1cGVyX2Jsb2NrKHZvaWQpCj4gICAgICAg
ICB1aW50MzJfdCBsb2dfc2VjdG9yc2l6ZSwgbG9nX3NlY3RvcnNfcGVyX2Jsb2NrOwo+ICAgICAg
ICAgdWludDMyX3QgbG9nX2Jsb2Nrc2l6ZSwgbG9nX2Jsa3NfcGVyX3NlZzsKPiAgICAgICAgIHVp
bnQzMl90IHNlZ21lbnRfc2l6ZV9ieXRlcywgem9uZV9zaXplX2J5dGVzOwo+ICsgICAgICAgdWlu
dDMyX3QgYWxpZ25tZW50X2J5dGVzOwo+ICAgICAgICAgdWludDMyX3Qgc2l0X3NlZ21lbnRzLCBu
YXRfc2VnbWVudHM7Cj4gICAgICAgICB1aW50MzJfdCBibG9ja3NfZm9yX3NpdCwgYmxvY2tzX2Zv
cl9uYXQsIGJsb2Nrc19mb3Jfc3NhOwo+ICAgICAgICAgdWludDMyX3QgdG90YWxfdmFsaWRfYmxr
c19hdmFpbGFibGU7Cj4gQEAgLTMwNSwxMCArMzA2LDEyIEBAIHN0YXRpYyBpbnQgZjJmc19wcmVw
YXJlX3N1cGVyX2Jsb2NrKHZvaWQpCj4KPiAgICAgICAgIHNldF9zYihibG9ja19jb3VudCwgYy50
b3RhbF9zZWN0b3JzID4+IGxvZ19zZWN0b3JzX3Blcl9ibG9jayk7Cj4KPiArICAgICAgIGFsaWdu
bWVudF9ieXRlcyA9IGMuem9uZWRfbW9kZSAmJiBjLm5kZXZzID4gMSA/IHNlZ21lbnRfc2l6ZV9i
eXRlcyA6IHpvbmVfc2l6ZV9ieXRlczsKPiArCj4gICAgICAgICB6b25lX2FsaWduX3N0YXJ0X29m
ZnNldCA9Cj4gICAgICAgICAgICAgICAgICgodWludDY0X3QpIGMuc3RhcnRfc2VjdG9yICogREVG
QVVMVF9TRUNUT1JfU0laRSArCj4gLSAgICAgICAgICAgICAgIDIgKiBGMkZTX0JMS1NJWkUgKyB6
b25lX3NpemVfYnl0ZXMgLSAxKSAvCj4gLSAgICAgICAgICAgICAgIHpvbmVfc2l6ZV9ieXRlcyAq
IHpvbmVfc2l6ZV9ieXRlcyAtCj4gKyAgICAgICAgICAgICAgIDIgKiBGMkZTX0JMS1NJWkUgKyBh
bGlnbm1lbnRfYnl0ZXMgIC0gMSkgLwo+ICsgICAgICAgICAgICAgICBhbGlnbm1lbnRfYnl0ZXMg
ICogYWxpZ25tZW50X2J5dGVzICAtCj4gICAgICAgICAgICAgICAgICh1aW50NjRfdCkgYy5zdGFy
dF9zZWN0b3IgKiBERUZBVUxUX1NFQ1RPUl9TSVpFOwo+Cj4gICAgICAgICBpZiAoYy5mZWF0dXJl
ICYgRjJGU19GRUFUVVJFX1JPKQo+IEBAIC0zMjcsNyArMzMwLDggQEAgc3RhdGljIGludCBmMmZz
X3ByZXBhcmVfc3VwZXJfYmxvY2sodm9pZCkKPgo+ICAgICAgICAgaWYgKGMuem9uZWRfbW9kZSAm
JiBjLm5kZXZzID4gMSkKPiAgICAgICAgICAgICAgICAgem9uZV9hbGlnbl9zdGFydF9vZmZzZXQg
Kz0KPiAtICAgICAgICAgICAgICAgICAgICAgICAoYy5kZXZpY2VzWzBdLnRvdGFsX3NlY3RvcnMg
KiBjLnNlY3Rvcl9zaXplKSAlIHpvbmVfc2l6ZV9ieXRlczsKPiArICAgICAgICAgICAgICAgICAg
ICAgICAoYy5kZXZpY2VzWzBdLnRvdGFsX3NlY3RvcnMgKiBjLnNlY3Rvcl9zaXplIC0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgem9uZV9hbGlnbl9zdGFydF9vZmZzZXQpICUgem9uZV9zaXpl
X2J5dGVzOwo+Cj4gICAgICAgICBzZXRfc2Ioc2VnbWVudDBfYmxrYWRkciwgem9uZV9hbGlnbl9z
dGFydF9vZmZzZXQgLyBibGtfc2l6ZV9ieXRlcyk7Cj4gICAgICAgICBzYi0+Y3BfYmxrYWRkciA9
IHNiLT5zZWdtZW50MF9ibGthZGRyOwo+IC0tCj4gMi4yNS4xCj4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
