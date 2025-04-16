Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2F6A8AE78
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Apr 2025 05:40:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u4tdo-0005x2-Jt;
	Wed, 16 Apr 2025 03:40:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1u4tdn-0005wu-Aj
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Apr 2025 03:40:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LwcbPVxhWoFcasrsMZkp9j/YNWCdb3JyL0NhioBICXg=; b=O/TVTXIf0QOdFA5IAP7bO/R06t
 WdFaGJ5mUPj/N2FgcbPXYAxeAOUENp5KsZi0HqyrDjKpsTBvn1fkDwrGtX2UIJf5A5/C0UsHYnNH1
 graaiEvc2VPLtPkUG7Ry0M0nTlgXKdj9x7T533rIACNNBPDCDJO2KYsX3oiy4fG/Fu3g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LwcbPVxhWoFcasrsMZkp9j/YNWCdb3JyL0NhioBICXg=; b=P7YxNhkIuk1atXj8As3u4oNBCE
 puX6hglakT9LIwLkxwkKMhdlXiwMWnbVgf5v8l2gIFt+2Vz8aJwtbOnCSggPMKYjYWqTrqq9UYlS6
 i63h05oio4AXxPMQEgG2DCDGTZo0gOUR4i2Iy3NBklSKYN7ckqQbcCrv6U75kIjVyH3Q=;
Received: from mail-ej1-f49.google.com ([209.85.218.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u4tdX-0008He-Hz for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Apr 2025 03:40:47 +0000
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso1087094666b.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Apr 2025 20:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744774820; x=1745379620; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LwcbPVxhWoFcasrsMZkp9j/YNWCdb3JyL0NhioBICXg=;
 b=W5BvFrL0KZXEyIC3qcrQc6uYNU34jvaiP3s32hgwXV5lspwuQlBUX/COslYW6dxQwW
 ZCafOd2TLmbAuRXcPoAAX7RNQoWjzFAGbZMf6JmtYhCbgs051afkPy6Q8AhasPDjWTdJ
 m6Z4qanKhl3rFbxwR5HzNQD5OvrPCODdzgNXZKSGIizW5CPlRNysFORHqu3qJ4bYlzAZ
 Is5434bqRipeBFizsQ5i6sE3QAIl/yFvd78GIXZD5+Tig7Y1/LwAME3cL56keMK3dq/S
 gi3rwr2kUHF35QFlyKwVZSCHabu/li9gYgdbI2EoBayJwb9HMaUhOnX6fBGyHVWE1QW0
 MRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744774820; x=1745379620;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LwcbPVxhWoFcasrsMZkp9j/YNWCdb3JyL0NhioBICXg=;
 b=NbA6qBFJVWEj8eQ5m0YuOWuzK8Og968wWbR2TDetXtWtUdNOdsWDpP+4j/Lf3/HMY7
 02xgovSElptB7z9ukgJggCAR5IpIk45QNjRoDUYKmqF0IKo3RsUa8jHXyS/XinGSVsIY
 vkgpyHmQhIPTc8eK5ef6a3nZpHUPBth78de30afyDM/3Jm9AFxKUarukR0wEA409sMTo
 yU3QtKSB8yCvz0yWCnY/JIUYu99HRcPlPIvv9tks2CUezAs9AvSNc8GZpFZADzWzS9n0
 BzfUUWiP0siSULY/dZEsTOf1sdjwaWvIkgntOECPbpnGJcX9xPFOuyRg2Xm3L31s2z72
 TwZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv64PqIS1hYAdZEhvsxfev3zKCDBdMPLr+LTw8tbjLoFYDJutG51knMFTaNKzpuC13MloyybHtzXcnSPK+pTNe@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyL38gaWmxHhOgg9S+gVpm721thTgNG0ETEiTxvESD1A7RNwyti
 EnFTdQuJaDnafSC/qO+Z9xDyjlKUdt7sfNzOjXelekr8fkwvmb7ikDAOeiKdG7AiJrashaXdo9H
 MOySInfSYCyv0mDV8DmZ8ks49nV6vxgSygZo=
X-Gm-Gg: ASbGncugGJEC1lmnMZiLmpNfpsKaPv4f86MjnuP6sazOda9LsMx48A1JmXpTcc/xdMQ
 Kd/VE8Vt/sM2SXCR3GzulpcD6opJ8IYY3S271k7h7s0X3LRlkXzRe9CxJA6fwHcvHxbr5ttUwA0
 crJxX09WNGcuS+U5aEOTaoK/w=
X-Google-Smtp-Source: AGHT+IGEy+NIzij8re36im5hw8tlkI3BKw/oeCdFmMyMgSs19fLAIDkMTjHPkS6rqybtBYC8MvQmnS2W3Hzuncs+FA8=
X-Received: by 2002:a17:906:8f8a:b0:aca:d4af:39ed with SMTP id
 a640c23a62f3a-acb42888783mr9840366b.4.1744774819569; Tue, 15 Apr 2025
 20:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250414111141.735081-1-chao@kernel.org>
 <CAD14+f0fFTOqjNL3pwi+Ucx2dR2UDhrF15-HgwbaM=Zid5Ge=Q@mail.gmail.com>
 <a51be7d3-ba69-4361-9d01-ea58df86b89c@kernel.org>
In-Reply-To: <a51be7d3-ba69-4361-9d01-ea58df86b89c@kernel.org>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Tue, 15 Apr 2025 20:40:08 -0700
X-Gm-Features: ATxdqUEvKYWxy8u4Pkggqw3hvjKIBCL-_ufy4JcifMuAqSThA0L3Q5TXvVGZsr4
Message-ID: <CAD14+f38jfkMUsoAdVU45fmvbAqdBD4tveXx0ireSX7nr3ZD1Q@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Just checked gparted's source code: https://github.com/GNOME/gparted/blob/GPARTED_1_7_0/src/f2fs.cc#L135
    Seems unlikely. :/ On Tue, Apr 15, 2025 at 8:34 PM Chao Yu wrote: > > On
    4/16/25 03:28, Juhyung Park wrote: > > Hm. > > > > Would this be what @uplinkr
    might have encountered? > > Maybe, :) > > @uplinkr, previously, [...] 
 
 Content analysis details:   (1.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  1.0 HK_RANDOM_FROM         From username looks random
  0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [qkrwngud825[at]gmail.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.218.49 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.218.49 listed in sa-trusted.bondedsender.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [qkrwngud825[at]gmail.com]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.218.49 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.218.49 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1u4tdX-0008He-Hz
Subject: Re: [f2fs-dev] [PATCH] resize.f2fs: fix to always change metadata
 for expand resize
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
Cc: uplinkr@airmail.cc, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SnVzdCBjaGVja2VkIGdwYXJ0ZWQncyBzb3VyY2UgY29kZToKaHR0cHM6Ly9naXRodWIuY29tL0dO
T01FL2dwYXJ0ZWQvYmxvYi9HUEFSVEVEXzFfN18wL3NyYy9mMmZzLmNjI0wxMzUKClNlZW1zIHVu
bGlrZWx5LiA6LwoKT24gVHVlLCBBcHIgMTUsIDIwMjUgYXQgODozNOKAr1BNIENoYW8gWXUgPGNo
YW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiA0LzE2LzI1IDAzOjI4LCBKdWh5dW5nIFBhcmsg
d3JvdGU6Cj4gPiBIbS4KPiA+Cj4gPiBXb3VsZCB0aGlzIGJlIHdoYXQgQHVwbGlua3IgbWlnaHQg
aGF2ZSBlbmNvdW50ZXJlZD8KPgo+IE1heWJlLCA6KQo+Cj4gQHVwbGlua3IsIHByZXZpb3VzbHks
IGlmIHlvdSB1c2VkICctcycgcGFyYW1ldGVyIHdoaWxlIGV4cGFuZC1yZXNpemluZywKPiB0aGF0
IGNvdWxkIGJlIHRoZSByZWFzb24gaXQgY29ycnVwdGVkIHlvdXIgcGFydGl0aW9uLgo+Cj4gVGhh
bmtzLAo+Cj4gPgo+ID4gT24gTW9uLCBBcHIgMTQsIDIwMjUgYXQgNDoxM+KAr0FNIENoYW8gWXUg
dmlhIExpbnV4LWYyZnMtZGV2ZWwKPiA+IDxsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldD4gd3JvdGU6Cj4gPj4KPiA+PiB3LyBiZWxvdyB0ZXN0Y2FzZSwgcmVzaXplIHdpbGwg
Z2VuZXJhdGUgYSBjb3JydXB0ZWQgaW1hZ2Ugd2hpY2gKPiA+PiBjb250YWlucyBpbmNvbnNpc3Rl
bnQgbWV0YWRhdGE6Cj4gPj4KPiA+PiB0b3VjaCBpbWcKPiA+PiB0cnVuY2F0ZSAtcyAkKCg1MTIq
MTAyNCoxMDI0KjEwMjQpKSBpbWcKPiA+PiBta2ZzLmYyZnMgLWYgaW1nICQoKDI1NioxMDI0KjEw
MjQpKQo+ID4+IHJlc2l6ZS5mMmZzIC1zIGltZyAtdCAkKCgxMDI0KjEwMjQqMTAyNCkpCj4gPj4g
bW91bnQgaW1nIC9tbnQvZjJmcwo+ID4+Cj4gPj4gWyAgIDMxLjcyNTIwMF0gRjJGUy1mcyAobG9v
cDApOiBXcm9uZyBiaXRtYXAgc2l6ZTogc2l0OiAxOTIsIHNpdF9ibGtfY250OjQ3NjIKPiA+PiBb
ICAgMzEuNzI4NDQxXSBGMkZTLWZzIChsb29wMCk6IEZhaWxlZCB0byBnZXQgdmFsaWQgRjJGUyBj
aGVja3BvaW50Cj4gPj4KPiA+PiBUaGUgcm9vdCBjYXVzZSBpcyBzYWZlIG1vZGUgKHZpYSAtcyBv
cHRpb24pIGlzIG5vdCBjb21wYXRpYmxlCj4gPj4gdy8gZXhwYW5kIHJlc2l6ZSwgZHVlIHRvIGlu
IHNhZmUgbW9kZSwgd2Ugd2lsbCBrZWVwIGFsbCBwYXJhbWV0ZXJzCj4gPj4gcmVsYXRlZCB0byBO
QVQsIFNJVCwgU1NBIGFyZWEsIGUuZy4gc2l0X2JpdG1hcF9zaXplLCBob3dldmVyLCB3ZQo+ID4+
IHdpbGwgdXBkYXRlIHNlZ21lbnRfY291bnRfbWFpbiBhY2NvcmRpbmcgbmV3IHBhcnRpdGlvbiBz
aXplLCByZXN1bHQKPiA+PiBpbiB0aGVyZSBpcyBubyBlbm91Z2ggc2l0X2JpdG1hcCBhbmQgU0lU
IGJsb2NrcyB0byBhZGRyZXNzIHRoZQo+ID4+IGVudGlyZSBibG9jayBhZGRyZXNzIG9mIG5ldyBw
YXJ0aXRpb24uCj4gPj4KPiA+PiBBZGRpbmcgYSBjaGVjayBjb25kaXRpb24gdG8gYXZvaWQgZXhw
YW5kaW5nIHBhcnRpdGlvbiBpbiBzYWZlCj4gPj4gbW9kZSwgYW5kIGNoYW5nZSBtYW51YWwgYWNj
b3JkaW5nbHkuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5v
cmc+Cj4gPj4gLS0tCj4gPj4gIGZzY2svcmVzaXplLmMgICAgIHwgMTIgKysrKysrKystLS0tCj4g
Pj4gIG1hbi9yZXNpemUuZjJmcy44IHwgIDIgKy0KPiA+PiAgMiBmaWxlcyBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZnNjay9y
ZXNpemUuYyBiL2ZzY2svcmVzaXplLmMKPiA+PiBpbmRleCAxYWI3ZDc1Li41ODkxNGVjIDEwMDY0
NAo+ID4+IC0tLSBhL2ZzY2svcmVzaXplLmMKPiA+PiArKysgYi9mc2NrL3Jlc2l6ZS5jCj4gPj4g
QEAgLTc1NiwxOCArNzU2LDIyIEBAIGludCBmMmZzX3Jlc2l6ZShzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmkpCj4gPj4KPiA+PiAgICAgICAgIC8qIG1heSBkaWZmZXJlbnQgc2VjdG9yIHNpemUgKi8K
PiA+PiAgICAgICAgIGlmICgoYy50YXJnZXRfc2VjdG9ycyAqIGMuc2VjdG9yX3NpemUgPj4KPiA+
PiAtICAgICAgICAgICAgICAgICAgICAgICBnZXRfc2IobG9nX2Jsb2Nrc2l6ZSkpIDwgZ2V0X3Ni
KGJsb2NrX2NvdW50KSkKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICBnZXRfc2IobG9nX2Js
b2Nrc2l6ZSkpIDwgZ2V0X3NiKGJsb2NrX2NvdW50KSkgewo+ID4+ICAgICAgICAgICAgICAgICBp
ZiAoIWMuc2FmZV9yZXNpemUpIHsKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICBBU1NFUlRf
TVNHKCJOb3RoaW5nIHRvIHJlc2l6ZSwgbm93IG9ubHkgc3VwcG9ydHMgcmVzaXppbmcgd2l0aCBz
YWZlIHJlc2l6ZSBmbGFnXG4iKTsKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
LTE7Cj4gPj4gICAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIGYyZnNfcmVzaXplX3NocmluayhzYmkpOwo+ID4+ICAgICAgICAgICAgICAg
ICB9Cj4gPj4gLSAgICAgICBlbHNlIGlmICgoKGMudGFyZ2V0X3NlY3RvcnMgKiBjLnNlY3Rvcl9z
aXplID4+Cj4gPj4gKyAgICAgICB9IGVsc2UgaWYgKCgoYy50YXJnZXRfc2VjdG9ycyAqIGMuc2Vj
dG9yX3NpemUgPj4KPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICBnZXRfc2IobG9nX2Jsb2Nr
c2l6ZSkpID4gZ2V0X3NiKGJsb2NrX2NvdW50KSkgfHwKPiA+PiAtICAgICAgICAgICAgICAgICAg
ICAgICBjLmlnbm9yZV9lcnJvcikKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICBjLmlnbm9y
ZV9lcnJvcikgewo+ID4+ICsgICAgICAgICAgICAgICBpZiAoYy5zYWZlX3Jlc2l6ZSkgewo+ID4+
ICsgICAgICAgICAgICAgICAgICAgICAgIEFTU0VSVF9NU0coIkV4cGFuZGluZyByZXNpemUgZG9l
c24ndCBzdXBwb3J0IHNhZmUgcmVzaXplIGZsYWciKTsKPiA+PiArICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gLTE7Cj4gPj4gKyAgICAgICAgICAgICAgIH0KPiA+PiAgICAgICAgICAgICAg
ICAgcmV0dXJuIGYyZnNfcmVzaXplX2dyb3coc2JpKTsKPiA+PiAtICAgICAgIGVsc2Ugewo+ID4+
ICsgICAgICAgfSBlbHNlIHsKPiA+PiAgICAgICAgICAgICAgICAgTVNHKDAsICJOb3RoaW5nIHRv
IHJlc2l6ZS5cbiIpOwo+ID4+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+PiAgICAgICAg
IH0KPiA+PiBkaWZmIC0tZ2l0IGEvbWFuL3Jlc2l6ZS5mMmZzLjggYi9tYW4vcmVzaXplLmYyZnMu
OAo+ID4+IGluZGV4IGJkZGE0ZmQuLjViNmRhZjUgMTAwNjQ0Cj4gPj4gLS0tIGEvbWFuL3Jlc2l6
ZS5mMmZzLjgKPiA+PiArKysgYi9tYW4vcmVzaXplLmYyZnMuOAo+ID4+IEBAIC02OSw3ICs2OSw3
IEBAIFNraXAgY2F1dGlvbiBkaWFsb2d1ZSBhbmQgcmVzaXplIHBhcnRpdGlvbiBkaXJlY3RseS4K
PiA+PiAgU3BlY2lmeSBzdXBwb3J0IHdyaXRlIGhpbnQuCj4gPj4gIC5UUAo+ID4+ICAuQkkgXC1z
Cj4gPj4gLUVuYWJsZSBzYWZlIHJlc2l6ZS4KPiA+PiArRW5hYmxlIHNhZmUgcmVzaXplLCBpdCBj
YW4gb25seSBiZSB1c2VkIHcvIHNocmluayByZXNpemUuCj4gPj4gIC5UUAo+ID4+ICAuQkkgXC1W
Cj4gPj4gIFByaW50IHRoZSB2ZXJzaW9uIG51bWJlciBhbmQgZXhpdC4KPiA+PiAtLQo+ID4+IDIu
NDkuMAo+ID4+Cj4gPj4KPiA+Pgo+ID4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+PiBM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+ID4+IGh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK
