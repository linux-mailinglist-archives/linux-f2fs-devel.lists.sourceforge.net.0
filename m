Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B7B6CFCE4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Mar 2023 09:36:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1phmpJ-0006Eg-Q6;
	Thu, 30 Mar 2023 07:36:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <michalechner92@googlemail.com>) id 1phmpH-0006EZ-KM
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 07:36:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AQDjprRf5g78LwKDtImryQdlovBrXrR4Ogl7JWXw5ZQ=; b=PTxKpz12KLz3FHTNXOF0A1bhI2
 +pZH0WMqMCSr1+/eIcRcbQOzu+XnatIjMQQn1gLAZFQbPGDAV3Xnh0j2sO+Zt1NUy/Of2g5Yd+JKD
 huLp78E/C8NqJM2r9sNhdQeI70VXMgUWhQZLLXMtjdFtTSt2xCPD9jsOoGnnkpJ+m3zo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AQDjprRf5g78LwKDtImryQdlovBrXrR4Ogl7JWXw5ZQ=; b=XF6vfuvYTbRHM0/RCjv0iKMAg7
 VVZpeAgsNqMQyKC8uKZFQEgQ9po6auqehVXZPRDCax1Sy3ixAdMLGN2upCGdmWQwYQwXLPWH89AJd
 6bMPNCgYtOstv0zkAHnkFLGWXfdrJexZMQHYZ4DhOLOML01CcQXD8PKF1Md44S+Ar7v4=;
Received: from mail-ed1-f45.google.com ([209.85.208.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1phmpG-0002vT-2m for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 07:36:03 +0000
Received: by mail-ed1-f45.google.com with SMTP id b20so72925139edd.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Mar 2023 00:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112; t=1680161755;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AQDjprRf5g78LwKDtImryQdlovBrXrR4Ogl7JWXw5ZQ=;
 b=nmsjjE3jpaTDfzaYNpszo48XkjvnRcf5TZ4VXDKu6FlRVM5QX2iTY7+qDeyg7+uPpO
 P0YCtImPkuR2Q0MxTrkviAvvfO87NI+NsB28YXsfwEcwjotOnZbHDbJRdTXZt5o+BGKo
 +X+c4leQRXF+Kgc8E5q26gWxI8P05BquCBw1PrlKbt1sDogKpSw/UjyW/g9XQtrZZ0Vg
 bnat6h1cLEyshdGMlV4VMz8k0d7wUD098NQA2j9Jipk5WNy7cIJlAqgZYY/jf+SzR4UI
 Vhsi/5zG7ULYgujz4t5tTQAE8KvM8cclYNwldqOAmjCbVN5FfhajadmYtLDCxb7fgdkE
 j3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680161755;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AQDjprRf5g78LwKDtImryQdlovBrXrR4Ogl7JWXw5ZQ=;
 b=vNBiezf8LVe+b73mstzzm+QdJHYbtLToHkiArCE0b1AtEC79630qBwfEIFTcGQWuDY
 6ipRtGpYUxAxjgYpxaJ25XZWhke0Y0/Flr+jBbEHlfAc0NsJ/obIS/qWre9Lt3S9hAvG
 pnk2JO5OyHF2BKpBYABMS1u6o514qkdYTswFZAbuNfKBL6WxXVs9SCKs9UBT2Sk0c9tQ
 U4AP7IZeYumGr1hgC5Tuzan3vdyagFqIjsDZjq6BDAdI6q3L6q8jpDMNj5eryADlzmJp
 VYuKTF206BgPnrBlZbz8rmMBqNf/EfmjXaDJBKBAjX64tKIjSiINxm8vN44TpdEKlnzW
 VS0g==
X-Gm-Message-State: AAQBX9dFus107j2t/sYvvlCV8S9JHBDbcLfqlt3XqOJY8z0fgFWbA2mS
 7a2Gj4T2Ej9OxUaY9wbFS4rkMzosCoT9EwFxzWkGe31wQQcSpg==
X-Google-Smtp-Source: AKy350bPVlDsDftWx6ehc4N6ACbHiDiZ72z4uYOHF94duKmsZLwTa3j8vAaLN5OO3xkoAw9Paw7F7VcFGiIY0MXwCXQ=
X-Received: by 2002:a17:907:d412:b0:930:310:abbf with SMTP id
 vi18-20020a170907d41200b009300310abbfmr11035637ejc.11.1680161755454; Thu, 30
 Mar 2023 00:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <bug-217266-202145@https.bugzilla.kernel.org/>
 <bug-217266-202145-lBYEimIUNZ@https.bugzilla.kernel.org/>
 <3afe98f8-49df-55c8-db37-74d11cb39a7b@kernel.org>
In-Reply-To: <3afe98f8-49df-55c8-db37-74d11cb39a7b@kernel.org>
Date: Thu, 30 Mar 2023 09:35:44 +0200
Message-ID: <CAJ5GUvks2m9jB5-m+nOmbDaYonq1ZJHaf4cm90RMt61hBF40tA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Am Do., 30. März 2023 um 05:31 Uhr schrieb Chao Yu : > >
   On 2023/3/30 10:48, > > https://bugzilla.kernel.org/show_bug.cgi?id=217266
    > > > > --- Comment #2 from shilka (shilkazx@gmail.com) --- > > [...] 
 
 Content analysis details:   (1.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [michalechner92[at]googlemail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [michalechner92[at]googlemail.com]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.45 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.45 listed in list.dnswl.org]
  1.0 FREEMAIL_REPLY         From and body contain different freemails
X-Headers-End: 1phmpG-0002vT-2m
Subject: Re: [f2fs-dev] [Bug 217266] kernel panic on f2fs filesystem when
 f2fs_commit_atomic_write
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
From: Micha L via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Micha L <michalechner92@googlemail.com>
Cc: bugzilla-daemon@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

QW0gRG8uLCAzMC4gTcOkcnogMjAyMyB1bSAwNTozMSBVaHIgc2NocmllYiBDaGFvIFl1IDxjaGFv
QGtlcm5lbC5vcmc+Ogo+Cj4gT24gMjAyMy8zLzMwIDEwOjQ4LCBidWd6aWxsYS1kYWVtb25Aa2Vy
bmVsLm9yZyB3cm90ZToKPiA+IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5j
Z2k/aWQ9MjE3MjY2Cj4gPgo+ID4gLS0tIENvbW1lbnQgIzIgZnJvbSBzaGlsa2EgKHNoaWxrYXp4
QGdtYWlsLmNvbSkgLS0tCj4gPiAoSW4gcmVwbHkgdG8gbWljaGFsZWNobmVyOTIgZnJvbSBjb21t
ZW50ICMxKQo+ID4+IFRoYXQgbG9va3MgaWRlbnRpY2FsIHRvIHdoYXQgSSByZXBvcnRlZCBsYXN0
IHdlZWsgaGVyZToKPiA+Pgo+ID4+IGh0dHBzOi8vc291cmNlZm9yZ2UubmV0L3AvbGludXgtZjJm
cy9tYWlsbWFuL21lc3NhZ2UvMzc3OTQyNTcvCj4KPiBDb3VsZCB5b3UgcGxlYXNlIGhhdmUgYSB0
cnkgdy8gYmVsb3cgcGF0Y2g/Cj4KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9pZD1hNDZiZWJkNTAyZmUx
YTNiZDFkMjJmNjRjZWRkOTNlN2U3NzAyNjkzCj4KCkhlbGxvIENoYW8sCgpUaGFua3MgZm9yIHRo
ZSBhbnN3ZXIuCgpUaGUgY3Jhc2hlcyB3ZXJlIHJlcG9ydGVkIHRvIG1lIGFmdGVyIEkgbWVyZ2Vk
IHRoZSBsYXRlc3QgZjJmcy1zdGFibGUKcGF0Y2hlcyBmb3IgNS4xMCBmcm9tCmh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2phZWdldWsvZjJmcy1zdGFibGUu
Z2l0L2xvZy8/aD1saW51eC01LjEwLnkKCldoaWNoIGluY2x1ZGVzIHRoZSBjb21taXQgeW91IGp1
c3QgbWVudGlvbmVkCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2phZWdldWsvZjJmcy1zdGFibGUuZ2l0L2NvbW1pdC8/aD1saW51eC01LjEwLnkmaWQ9NzIw
NzA5YzMyNzYyMjBmZGI3MGU5Mzg1ZDg3YzYxNjk0NzZmMDRlNwoKCk15IHNvdXJjZSBpcyBoZXJl
OgpodHRwczovL2dpdGh1Yi5jb20vZnJlYWswNy9LaXJpc2FrdXJhX1BhbnRhaC9jb21taXRzL3Bh
bnRhaC10cTJhLjIzMDMwNS9mcy9mMmZzCgpUaGUgY3Jhc2hlcyB3ZXJlIHJlcG9ydGVkIHRvIG1l
IGFmdGVyIEkgbWVyZ2VkIHRoZSBsYXRlc3QgdGFnIG9mCmYyZnMtc3RhYmxlLCBpZiB5b3UgbG9v
ayBiYWNrIHRocm91Z2ggbXkgaGlzdG9yeSBvbiBNYXJjaCA0dGggYW5kCk1hcmNoIDExdGguCgpJ
IHJldmVydGVkIHRoZSBsYXRlc3QgZjJmcy1zdGFibGUgcGF0Y2hlcyBvbiBtYXJjaCAyM3JkIGFu
ZCBkaWRuwrR0CnJlY2VpdmUgYSBmdXJ0aGVyIHJlcG9ydCBvZiB0aGUgY3Jhc2ggc28gZmFyLgoK
Cj4gPj4KPiA+Pgo+ID4KPiA+IFllcCwgaXQgc2VlbXMgdmVyeSBzaW1pbGFyLCBidXQgSSBkbyBu
b3QgZW5jb3VudGVyIHRoaXMgcHJvYmxlbSB1bnRpbCB1cGRhdGUgdG8KPiA+IGtlcm5lbCA2LjIu
OC4KPiA+IEJlZm9yZSBJIHNhdyB5b3VyIHJlcGx5LCBJIGd1ZXNzIHRoZXJlIG1pZ2h0IGV4aXN0
IHNvbWUgc3VidGxlIGNvbmZsaWN0cwo+ID4gYmV0d2VlbiBuZXcgZmVhdHVyZSBpbiA2LjIuOCBr
ZXJuZWwgYW5kIHRoZSBmMmZzIG1vZHVsZS4gV2l0aCB5b3VyIGluZm8sIGl0IGlzCj4gPiBoaWdo
bHkgcG9zc2libGUgdGhhdCB0aGUgaW1wbGVtZW50YXRpb24gb2YgZjJmcyBleGlzdHMgc29tZSBi
dWcsIGFuZCBuZXcga2VybmVsCj4gPiBmZWF0dXJlIG1pZ2h0IGZyZXF1ZW50bHkgdHJpZ2dlciBp
dC4KPiA+Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
