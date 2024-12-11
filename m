Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E839EC2E1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Dec 2024 04:09:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tLD6R-0006Sz-Va;
	Wed, 11 Dec 2024 03:09:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sunyibuaa@gmail.com>) id 1tLD67-0006Ra-HV
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Dec 2024 03:09:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tJYiplpN21nOYm4w/gDDPNv7XNfDm2uH3FMwqWHdt5k=; b=fEZYiS+sITzyNvhjZvTwyPPYQ9
 Aoxu9w62gvg/g3Quv7A2vEC3pckdnfO0aPlXQsd7dz+H11LwTMeMLEs/P6iXp60k7ouh37IMeK8f2
 k6f0e11Wee+nlwgMRzcEVZ+vLCWLOBHX936mGQ+M6tvnD9jZig0CB9sD8jGK+K9DP6GE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tJYiplpN21nOYm4w/gDDPNv7XNfDm2uH3FMwqWHdt5k=; b=YYFZIRaTD/igK5M6UEcWPoe441
 Ac/5LNiQrn0JPZN26sjyD0CxrPLSpg8cVRYX/+g8X1KdxvcQx+LSB/ChWqx+Jtqwgf8bMkw65fD9K
 VP1pgzq+NTxW+Dyqd1d6DjaKRdAACDgGdQbL9t4oHNSEGvEN74ltDNlkn7VyjG8kadro=;
Received: from mail-lj1-f174.google.com ([209.85.208.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tLD66-0007Vb-Rh for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Dec 2024 03:09:11 +0000
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-3022c61557cso21398731fa.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Dec 2024 19:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733886539; x=1734491339; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tJYiplpN21nOYm4w/gDDPNv7XNfDm2uH3FMwqWHdt5k=;
 b=DfRko1367PzWOfP0e+OabH/99Gerne0c806p9lf6GJWGieJSLfGsXCv4r58RBMBXgt
 8pWPpJfXhHGnmFWirijKqgtevPE9cOzJ/Tz7EH/hxQ/+AJUNxCQfwZ68pjFsSOAcLNhD
 Ea4Rk+CPzJ/SFF+Dn9FEYvrIUBFFZcPzaGIEO/DIHdsGNqan2j2zPEzLurSAkBIYiOtJ
 jij1zu0HurQHqMT/umTw5aW40jJb+qN+z+CiMywoEiayjx/ddQDQByG1tzGppELdc5A/
 UY9g7DlrpR6V52yzbHhH5exoSP/4swL7JmbohzOe2m1DmPTDxW8miHBDMoX4bSMFxB36
 fPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733886539; x=1734491339;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tJYiplpN21nOYm4w/gDDPNv7XNfDm2uH3FMwqWHdt5k=;
 b=O7Hnx/CTDEnm+t+zzCIEM3DWViMKFVeUQN0RAu8BxPVDU2S4+GDrYc2pu3TkgRjIwA
 zH6FCQ3Z22EhOVZkrm1iWVVT0G1tkASQIC5DWYu0KJ6NopVgBNAvFvEVpiyw3jAtLUnm
 yN5ITCaeCQe8vnjyzG++IXufnuESKvU4sWUtvFKugf2LCAVuIOXoXWdGAaOGav9vVUwb
 5HJMAMrMrusSUpTjCOtYcd459NK6nHnUAQzBFeCbECmzF8jPsBDtU9MlE8ipp0P9e+/i
 iCCHCSqy+q+YGKaDvKjQYNySb5J8RjSM7FbybyVfsPESVN5L5dhmxcEqnZVdv5wNYWuH
 SYsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsQwDtjNeRp5jtGbmllwfz+OaA6gnO5qJBZWRxnDXRL6O+4GNk/ekkNCK6JuhTmDe/3LBRCsaL3dvBl2h1whAZ@lists.sourceforge.net
X-Gm-Message-State: AOJu0YySSoSQThHD5smTEH6o1sPtwPiOmAk4gjuRfF5KBQVR+ypH+GJy
 afcsHD9EglcznrJcz0O7gHFSjVJU/wAkEdz+WeIZzFWN/TJqlDC8IN+JODDpd+iDObPpRn/lIMq
 WBA1Kw/R4JGmAN/3r4a3XyCbf+0ktEOA4
X-Gm-Gg: ASbGncuVyA/rvDdYxNHIHJWK8TRuuvBBBHFcCck9KZqYUOBFu6Hzoyj0KrjYshZtvdS
 JQzboxEk8a2mve+d9QDqXB2R3cJ1IqymhjeXl
X-Google-Smtp-Source: AGHT+IHdI5rHVz7RsYzjySox+XBa4vG7b27828fJowbfJJbRZGGzIM87e/rIEnj07lRvF5hLfpOjv9WTw67kIAFQ32c=
X-Received: by 2002:a2e:a541:0:b0:300:5c57:526b with SMTP id
 38308e7fff4ca-30240d4fbe0mr4077391fa.11.1733886538822; Tue, 10 Dec 2024
 19:08:58 -0800 (PST)
MIME-Version: 1.0
References: <20241104034545.497907-1-yi.sun@unisoc.com>
 <20241104034545.497907-6-yi.sun@unisoc.com>
In-Reply-To: <20241104034545.497907-6-yi.sun@unisoc.com>
From: yi sun <sunyibuaa@gmail.com>
Date: Wed, 11 Dec 2024 11:08:22 +0800
Message-ID: <CALpufv34r8cMv0BtGXWLd_LEBjtMGM+CZ=XpnsL8Qr8WOsOk6Q@mail.gmail.com>
To: Yi Sun <yi.sun@unisoc.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Kindly ping. I think there are no problems with the first
   few patches, but the current patch may still have room for improvement. Do
    you have any good suggestions? On Mon, Nov 4, 2024 at 11:46 AM Yi Sun wrote:
    > > Function f2fs_invalidate_blocks() can process continuous > blocks at
   a time, so f2fs_truncate_data_blocks_range() is > optimized to use the new
    fu [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [sunyibuaa[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [209.85.208.174 listed in sa-trusted.bondedsender.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.174 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [209.85.208.174 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.174 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1tLD66-0007Vb-Rh
Subject: Re: [f2fs-dev] [PATCH v3 5/5] f2fs: Optimize
 f2fs_truncate_data_blocks_range()
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

S2luZGx5IHBpbmcuCkkgdGhpbmsgdGhlcmUgYXJlIG5vIHByb2JsZW1zIHdpdGggdGhlIGZpcnN0
IGZldyBwYXRjaGVzLCBidXQgdGhlCmN1cnJlbnQgcGF0Y2ggbWF5IHN0aWxsIGhhdmUgcm9vbSBm
b3IgaW1wcm92ZW1lbnQuIERvIHlvdSBoYXZlIGFueQpnb29kIHN1Z2dlc3Rpb25zPwoKT24gTW9u
LCBOb3YgNCwgMjAyNCBhdCAxMTo0NuKAr0FNIFlpIFN1biA8eWkuc3VuQHVuaXNvYy5jb20+IHdy
b3RlOgo+Cj4gRnVuY3Rpb24gZjJmc19pbnZhbGlkYXRlX2Jsb2NrcygpIGNhbiBwcm9jZXNzIGNv
bnRpbnVvdXMKPiBibG9ja3MgYXQgYSB0aW1lLCBzbyBmMmZzX3RydW5jYXRlX2RhdGFfYmxvY2tz
X3JhbmdlKCkgaXMKPiBvcHRpbWl6ZWQgdG8gdXNlIHRoZSBuZXcgZnVuY3Rpb25hbGl0eSBvZgo+
IGYyZnNfaW52YWxpZGF0ZV9ibG9ja3MoKS4KPgo+IFNpZ25lZC1vZmYtYnk6IFlpIFN1biA8eWku
c3VuQHVuaXNvYy5jb20+Cj4gLS0tCj4gIGZzL2YyZnMvZmlsZS5jIHwgNzIgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDY4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+IGluZGV4IDkzNjZlN2ZjN2MzOS4uZDIwY2M1ZjM2
ZDRjIDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4gKysrIGIvZnMvZjJmcy9maWxlLmMK
PiBAQCAtNjEyLDYgKzYxMiwxNSBAQCBzdGF0aWMgaW50IGYyZnNfZmlsZV9vcGVuKHN0cnVjdCBp
bm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxwKQo+ICAgICAgICAgcmV0dXJuIGZpbmlzaF9w
cmVhbGxvY2F0ZV9ibG9ja3MoaW5vZGUpOwo+ICB9Cj4KPiArc3RhdGljIGJvb2wgY2hlY2tfY3Vy
cl9ibG9ja19pc19jb25zZWN1dGl2ZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrX3QgY3VyciwgYmxvY2tfdCBl
bmQpCj4gK3sKPiArICAgICAgIGlmIChjdXJyIC0gZW5kID09IDEgfHwgY3VyciA9PSBlbmQpCj4g
KyAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ICsgICAgICAgZWxzZQo+ICsgICAgICAgICAg
ICAgICByZXR1cm4gZmFsc2U7Cj4gK30KPiArCj4gIHZvaWQgZjJmc190cnVuY2F0ZV9kYXRhX2Js
b2Nrc19yYW5nZShzdHJ1Y3QgZG5vZGVfb2ZfZGF0YSAqZG4sIGludCBjb3VudCkKPiAgewo+ICAg
ICAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpID0gRjJGU19JX1NCKGRuLT5pbm9kZSk7Cj4g
QEAgLTYyMSw4ICs2MzAsMjcgQEAgdm9pZCBmMmZzX3RydW5jYXRlX2RhdGFfYmxvY2tzX3Jhbmdl
KHN0cnVjdCBkbm9kZV9vZl9kYXRhICpkbiwgaW50IGNvdW50KQo+ICAgICAgICAgaW50IGNsdXN0
ZXJfaW5kZXggPSAwLCB2YWxpZF9ibG9ja3MgPSAwOwo+ICAgICAgICAgaW50IGNsdXN0ZXJfc2l6
ZSA9IEYyRlNfSShkbi0+aW5vZGUpLT5pX2NsdXN0ZXJfc2l6ZTsKPiAgICAgICAgIGJvb2wgcmVs
ZWFzZWQgPSAhYXRvbWljX3JlYWQoJkYyRlNfSShkbi0+aW5vZGUpLT5pX2NvbXByX2Jsb2Nrcyk7
Cj4gKyAgICAgICAvKgo+ICsgICAgICAgICogVGVtcG9yYXJ5IHJlY29yZCBsb2NhdGlvbi4KPiAr
ICAgICAgICAqIFdoZW4gdGhlIGN1cnJlbnQgIEBibGthZGRyIGFuZCBAYmxrYWRkcl9lbmQgY2Fu
IGJlIHByb2Nlc3NlZAo+ICsgICAgICAgICogdG9nZXRoZXIsIHVwZGF0ZSB0aGUgdmFsdWUgb2Yg
QGJsa2FkZHJfZW5kLgo+ICsgICAgICAgICogV2hlbiBpdCBpcyBkZXRlY3RlZCB0aGF0IGN1cnJl
bnQgQGJsa2FkZHIgaXMgbm90IGNvbnRpbnVlcyB3aXRoCj4gKyAgICAgICAgKiBAYmxrYWRkcl9l
bmQsIGl0IGlzIG5lY2Vzc2FyeSB0byBwcm9jZXNzIGNvbnRpbnVlcyBibG9ja3MKPiArICAgICAg
ICAqIHJhbmdlIFtibGthZGRyX3N0YXJ0LCBibGthZGRyX2VuZF0uCj4gKyAgICAgICAgKi8KPiAr
ICAgICAgIGJsb2NrX3QgYmxrYWRkcl9zdGFydCwgYmxrYWRkcl9lbmQ7Cj4gKyAgICAgICAvKi4K
PiArICAgICAgICAqIFRvIGF2b2lkIHByb2Nlc3NpbmcgdmFyaW91cyBpbnZhbGlkIGRhdGEgYmxv
Y2tzLgo+ICsgICAgICAgICogQmVjYXVzZSBAYmxrYWRkcl9zdGFydCBhbmQgQGJsa2FkZHJfZW5k
IG1heSBiZSBhc3NpZ25lZAo+ICsgICAgICAgICogTlVMTF9BRERSIG9yIGludmFsaWQgZGF0YSBi
bG9ja3MsIEBsYXN0X3ZhbGlkIGlzIHVzZWQgdG8KPiArICAgICAgICAqIHJlY29yZCB0aGlzIHNp
dHVhdGlvbi4KPiArICAgICAgICAqLwo+ICsgICAgICAgYm9vbCBsYXN0X3ZhbGlkID0gZmFsc2U7
Cj4gKyAgICAgICAvKiBQcm9jZXNzIHRoZSBsYXN0IEBibGthZGRyIHNlcGFyYXRlbHk/ICovCj4g
KyAgICAgICBib29sIGxhc3Rfb25lID0gdHJ1ZTsKPgo+ICAgICAgICAgYWRkciA9IGdldF9kbm9k
ZV9hZGRyKGRuLT5pbm9kZSwgZG4tPm5vZGVfcGFnZSkgKyBvZnM7Cj4gKyAgICAgICBibGthZGRy
X3N0YXJ0ID0gYmxrYWRkcl9lbmQgPSBsZTMyX3RvX2NwdSgqYWRkcik7Cj4KPiAgICAgICAgIC8q
IEFzc3VtcHRpb246IHRydW5jYXRpb24gc3RhcnRzIHdpdGggY2x1c3RlciAqLwo+ICAgICAgICAg
Zm9yICg7IGNvdW50ID4gMDsgY291bnQtLSwgYWRkcisrLCBkbi0+b2ZzX2luX25vZGUrKywgY2x1
c3Rlcl9pbmRleCsrKSB7Cj4gQEAgLTYzOCwyNCArNjY2LDYwIEBAIHZvaWQgZjJmc190cnVuY2F0
ZV9kYXRhX2Jsb2Nrc19yYW5nZShzdHJ1Y3QgZG5vZGVfb2ZfZGF0YSAqZG4sIGludCBjb3VudCkK
PiAgICAgICAgICAgICAgICAgfQo+Cj4gICAgICAgICAgICAgICAgIGlmIChibGthZGRyID09IE5V
TExfQUREUikKPiAtICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiArICAgICAgICAg
ICAgICAgICAgICAgICBnb3RvIG5leHQ7Cj4KPiAgICAgICAgICAgICAgICAgZjJmc19zZXRfZGF0
YV9ibGthZGRyKGRuLCBOVUxMX0FERFIpOwo+Cj4gICAgICAgICAgICAgICAgIGlmIChfX2lzX3Zh
bGlkX2RhdGFfYmxrYWRkcihibGthZGRyKSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlm
ICh0aW1lX3RvX2luamVjdChzYmksIEZBVUxUX0JMS0FERFJfQ09OU0lTVEVOQ0UpKQo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBnb3RvIG5leHQ7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFm
MmZzX2lzX3ZhbGlkX2Jsa2FkZHJfcmF3KHNiaSwgYmxrYWRkciwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEQVRBX0dFTkVSSUNfRU5IQU5DRSkpCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGdvdG8gbmV4dDsKPiAgICAgICAgICAgICAgICAgICAgICAgICBp
ZiAoY29tcHJlc3NlZF9jbHVzdGVyKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dmFsaWRfYmxvY2tzKys7Cj4gICAgICAgICAgICAgICAgIH0KPgo+IC0gICAgICAgICAgICAgICBm
MmZzX2ludmFsaWRhdGVfYmxvY2tzKHNiaSwgYmxrYWRkciwgMSk7Cj4gKwo+ICsgICAgICAgICAg
ICAgICBpZiAoY2hlY2tfY3Vycl9ibG9ja19pc19jb25zZWN1dGl2ZShzYmksIGJsa2FkZHIsIGJs
a2FkZHJfZW5kKSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIC8qCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICogVGhlIGN1cnJlbnQgYmxvY2sgQGJsa2FkZHIgaXMgY29udGludW91cyB3
aXRoCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICogQGJsa2FkZHJfZW5kLCBzbyBAYmxrYWRk
cl9lbmQgaXMgdXBkYXRlZC4KPiArICAgICAgICAgICAgICAgICAgICAgICAgKiBBbmQgdGhlIGYy
ZnNfaW52YWxpZGF0ZV9ibG9ja3MoKSBpcyBza2lwcGVkCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICogdW50aWwgQGJsa2FkZHIgdGhhdCBjYW5ub3QgYmUgcHJvY2Vzc2VkCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICogdG9nZXRoZXIgaXMgZW5jb3VudGVyZWQuCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgICAgICAgICAgYmxrYWRkcl9lbmQgPSBi
bGthZGRyOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChjb3VudCA9PSAxKQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgbGFzdF9vbmUgPSBmYWxzZTsKPiArICAgICAgICAg
ICAgICAgICAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3Rv
IHNraXBfaW52YWxpZDsKPiArICAgICAgICAgICAgICAgfQo+ICsKPiArICAgICAgICAgICAgICAg
ZjJmc19pbnZhbGlkYXRlX2Jsb2NrcyhzYmksIGJsa2FkZHJfc3RhcnQsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsa2FkZHJfZW5kIC0gYmxrYWRkcl9zdGFydCAr
IDEpOwo+ICsgICAgICAgICAgICAgICBibGthZGRyX3N0YXJ0ID0gYmxrYWRkcl9lbmQgPSBibGth
ZGRyOwo+ICsKPiArICAgICAgICAgICAgICAgaWYgKGNvdW50ID09IDEgJiYgbGFzdF9vbmUpCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgZjJmc19pbnZhbGlkYXRlX2Jsb2NrcyhzYmksIGJsa2Fk
ZHIsIDEpOwo+ICsKPiArc2tpcF9pbnZhbGlkOgo+ICsgICAgICAgICAgICAgICBsYXN0X3ZhbGlk
ID0gdHJ1ZTsKPgo+ICAgICAgICAgICAgICAgICBpZiAoIXJlbGVhc2VkIHx8IGJsa2FkZHIgIT0g
Q09NUFJFU1NfQUREUikKPiAgICAgICAgICAgICAgICAgICAgICAgICBucl9mcmVlKys7Cj4gKwo+
ICsgICAgICAgICAgICAgICBjb250aW51ZTsKPiArCj4gK25leHQ6Cj4gKyAgICAgICAgICAgICAg
IC8qIElmIGNvbnNlY3V0aXZlIGJsb2NrcyBoYXZlIGJlZW4gcmVjb3JkZWQsIHdlIG5lZWQgdG8g
cHJvY2VzcyB0aGVtLiAqLwo+ICsgICAgICAgICAgICAgICBpZiAobGFzdF92YWxpZCA9PSB0cnVl
KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfaW52YWxpZGF0ZV9ibG9ja3Moc2JpLCBi
bGthZGRyX3N0YXJ0LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBi
bGthZGRyX2VuZCAtIGJsa2FkZHJfc3RhcnQgKyAxKTsKPiArCj4gKyAgICAgICAgICAgICAgIGJs
a2FkZHJfc3RhcnQgPSBibGthZGRyX2VuZCA9IGxlMzJfdG9fY3B1KCooYWRkciArIDEpKTsKPiAr
ICAgICAgICAgICAgICAgbGFzdF92YWxpZCA9IGZhbHNlOwo+ICsKPiAgICAgICAgIH0KPgo+ICAg
ICAgICAgaWYgKGNvbXByZXNzZWRfY2x1c3RlcikKPiAtLQo+IDIuMjUuMQo+CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
