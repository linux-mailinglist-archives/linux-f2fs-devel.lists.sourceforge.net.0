Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C60E8194F1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Dec 2023 01:07:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFk7L-00063L-VS;
	Wed, 20 Dec 2023 00:07:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1rFk7D-00063D-LJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Dec 2023 00:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eOR+RPgbaBE5VnzmKzfwV+b/Yqnim5AGeLaNFxas2yY=; b=dZVx+MN/AcvxnZWDlrCNekeIph
 UXNBBFw7kMchOmE8zpq2aeTsfr9CZiTTQq+JOa/NVakHnu3vCrSbaUEjUkBYydU4AABw9n7pTAujZ
 P8GPyBlpMo/rJGrXc/YPFsqacyw4yzGg3cplqQtW+LwIiyq8YEadS5yDQ2/yePkuSDeE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eOR+RPgbaBE5VnzmKzfwV+b/Yqnim5AGeLaNFxas2yY=; b=As54D7D9qtteznGnmVVnhEu0t4
 4o5CxnY49wYsmr679WOurr7++4opxh/rygO8nhg0a1tjk/BClLI0WEIX9OV+7WRVJtub8W70nthO6
 6YEgNR2nzhweF3oBwO1n6AyUgfZDpzXDshGqxDoWg30+8slpSyumjBsyBDudV0rxvvzs=;
Received: from mail-lj1-f174.google.com ([209.85.208.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rFk7C-0005Ol-SW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Dec 2023 00:07:11 +0000
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2cc7087c6c4so36148591fa.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Dec 2023 16:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703030819; x=1703635619; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eOR+RPgbaBE5VnzmKzfwV+b/Yqnim5AGeLaNFxas2yY=;
 b=BK4yngpFYNGhsLno+IgBHnnL3QkTTeILJXceC9m46kLH/IttFKjWhld8gLJEV+B4xi
 Ddbxu22QOG+Eh2bt1vuygM5OOM4OvhucmB/YvALdZ9d02QVljzKlQi584gwi726mg1y4
 soniaBuZl1wCjZ2ybHurmtsYxS2m8NgDtB0h4zF2tJUeyf8dTYT0PFdt6gdYxCVXq5Wp
 wW3cmNlH3SxWgQjAOyRgOxaW1ntV8jgZ8Q7oZa2vBw+ZOVAQHfFinbNSa4fMAYHXZIeU
 +eYegWfXlzIDicI7npVT2hXFD4U7Tkb+3okwjacawqAoaxcVIMvSBudp/9PSxtB/lwtL
 I+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703030819; x=1703635619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eOR+RPgbaBE5VnzmKzfwV+b/Yqnim5AGeLaNFxas2yY=;
 b=a/v2z0vc3I6L+higHjnws1vNWOH9im18NMJuwxhC6vJDvE9syW6el1A7MI93QExO1+
 ifMjvCRlHpM8hFiXp+ds59zt+r+ZZLhKszsjy+gzpxQ4oUKMOz4ZUjjpSsKPMK+QO62l
 gdgODS9BBDVKE/i/yaSmid0QjOsmmO7PewAMuHXuiYasLDgiMccoj4/X90gLEjte/umd
 d4CF/X10ZqYTVL+ygYB5IEy7RafZprDk1nfRc5zmBMUWgzTRADTO8ecnqxjzzkgGAYwE
 IT+WjJmhG2DBPJeio8j8bFaixUD3tTbZ4X6QKXbd1rzNi7Z4ZuHBManXy6lLSU7hBR8r
 WOwA==
X-Gm-Message-State: AOJu0Yyh0oiw5dr+2j/MSPpVKGNTGhyPcA+79A1djIj2wCinVzmfYJgH
 irzKby9trPoUqxF6ibMeu8+8CZ/eLUtxU6RvnhA=
X-Google-Smtp-Source: AGHT+IE/0GFbN1G49K+i8mz1KyhrAnocdbXAqapZQOqL0QubEj0Dk2SePK/BbZCznIJtOyyua976XOBgNX4wMuz24gU=
X-Received: by 2002:a05:651c:1993:b0:2cb:ebc9:45d2 with SMTP id
 bx19-20020a05651c199300b002cbebc945d2mr8997806ljb.23.1703030818884; Tue, 19
 Dec 2023 16:06:58 -0800 (PST)
MIME-Version: 1.0
References: <1702952464-22050-1-git-send-email-zhiguo.niu@unisoc.com>
 <6c553a75-4842-4b28-9725-ba5e297ff793@kernel.org>
 <CAHJ8P3LgQB9Q_TQj0nmjKXLsk95uVA2xvPXdvpK8Gjsonz-fHg@mail.gmail.com>
 <cac5bf07-9091-40b7-8fb2-01f7a032d2ef@kernel.org>
In-Reply-To: <cac5bf07-9091-40b7-8fb2-01f7a032d2ef@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 20 Dec 2023 08:06:46 +0800
Message-ID: <CAHJ8P3LnsFkFR3+74=vYj+_s3f0LafqMrpnO9zpo=E0V4QA54g@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Dec 19, 2023 at 11:24 PM Chao Yu wrote: > > On 2023/12/19
    12:09, Zhiguo Niu wrote: > > On Tue, Dec 19, 2023 at 12:00 PM Chao Yu wrote:
    > >> > >> On 2023/12/19 10:21, Zhiguo Niu wrote: [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.174 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.174 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rFk7C-0005Ol-SW
Subject: Re: [f2fs-dev] [PATCH V4] f2fs: show more discard status by sysfs
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
Cc: jaegeuk@kernel.org, ke.wang@unisoc.com, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBEZWMgMTksIDIwMjMgYXQgMTE6MjTigK9QTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gT24gMjAyMy8xMi8xOSAxMjowOSwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+
IE9uIFR1ZSwgRGVjIDE5LCAyMDIzIGF0IDEyOjAw4oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwu
b3JnPiB3cm90ZToKPiA+Pgo+ID4+IE9uIDIwMjMvMTIvMTkgMTA6MjEsIFpoaWd1byBOaXUgd3Jv
dGU6Cj4gPj4+IFRoZSBjdXJyZW50IHBlbmRpbmdfZGlzY2FyZCBhdHRyIGp1c3Qgb25seSBzaG93
cyB0aGUgZGlzY2FyZF9jbWRfY250Cj4gPj4+IGluZm9ybWF0aW9uLiBNb3JlIGRpc2NhcmQgc3Rh
dHVzIGNhbiBiZSBzaG93biBzbyB0aGF0IHdlIGNhbiBjaGVjawo+ID4+PiB0aGVtIHRocm91Z2gg
c3lzZnMgd2hlbiBuZWVkZWQuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IFpoaWd1byBOaXUg
PHpoaWd1by5uaXVAdW5pc29jLmNvbT4KPiA+Pj4gLS0tCj4gPj4+IGNoYW5nZXMgb2YgdjI6IElt
cHJvdmUgdGhlIHBhdGNoIGFjY29yZGluZyB0byBDaGFvJ3Mgc3VnZ2VzdGlvbnMuCj4gPj4+IGNo
YW5nZXMgb2YgdjM6IEFkZCBhIGJsYW5rIGxpbmUgZm9yIGVhc3kgcmVhZGluZy4KPiA+Pj4gY2hh
bmdlcyBvZiB2NDogU3BsaXQgdG8gdGhyZWUgZW50cmllcwo+ID4+PiAtLS0KPiA+Pj4gLS0tCj4g
Pj4+ICAgIERvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcyB8IDE1ICsrKysr
KysrKysrKysrKwo+ID4+PiAgICBmcy9mMmZzL3N5c2ZzLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+Pj4gICAgMiBmaWxl
cyBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspCj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMgYi9Eb2N1bWVudGF0aW9uL0FCSS90
ZXN0aW5nL3N5c2ZzLWZzLWYyZnMKPiA+Pj4gaW5kZXggNGYxZDRlNi4uNjA2YTI5OCAxMDA2NDQK
PiA+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzCj4gPj4+
ICsrKyBiL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcwo+ID4+PiBAQCAt
MTU5LDYgKzE1OSwyMSBAQCBEYXRlOiAgICAgICAgICAgIE5vdmVtYmVyIDIwMjEKPiA+Pj4gICAg
Q29udGFjdDogICAgIkphZWdldWsgS2ltIiA8amFlZ2V1a0BrZXJuZWwub3JnPgo+ID4+PiAgICBE
ZXNjcmlwdGlvbjogICAgICAgIFNob3dzIHRoZSBudW1iZXIgb2YgcGVuZGluZyBkaXNjYXJkIGNv
bW1hbmRzIGluIHRoZSBxdWV1ZS4KPiA+Pj4KPiA+Pj4gK1doYXQ6ICAgICAgICAgICAvc3lzL2Zz
L2YyZnMvPGRpc2s+L2lzc3VlZF9kaXNjYXJkCj4gPj4KPiA+PiBBZGQgdGhlbSB0byAvc3lzL2Zz
L2YyZnMvPGRpc2s+L3N0YXQvPwo+ID4gSSBqdXN0IHdhbnQgdG8ga2VlcCB0aGVtIGNvbnNpc3Rl
bnQgd2l0aCB0aGUgZW50cnkgInBlbmRpbmdfZGlzY2FyZCIKPgo+IFRoZXJlIGFyZSB0b28gbWFu
eSBlbnRyaWVzIGluIHJvb3QgZGlyZWN0b3J5IG9mIGYyZnMgc3lzZnMgZW50cnksIHNvIEkKPiBj
cmVhdGVkIHRoZSAnc3RhdCcgc3ViLWRpcmVjdG9yeSBmb3IgbGF0ZXIgYWxsIHJlYWQtb25seSBz
dGF0LXJlbGF0ZWQKPiBlbnRyeS4gSSB0aGluayBpdCdzIGZpbmUgdG8gY3JlYXRlIG5ldyBkaXNj
YXJkIHN0YXQgZW50cmllcyB0aGVyZS4KSSBnb3QgaXQgIGFuZCB3aWxsIHVwZGF0ZSB0aGUgcGF0
Y2guIHRoYW5rcy4KPgo+IFRoYW5rcywKPgo+ID4gaWYgdGhleSBhcmUgc3BsaXQgdG8gMyBlbnRy
aWVzLgo+ID4gdGhleSBhcmUgYWxsIGRpc2NhcmQgcmVsYXRlZCBpbmZvcy4KPiA+IFRoYW5rcwo+
ID4+Cj4gPj4gVGhhbmtzLAo+ID4+Cj4gPj4+ICtEYXRlOiAgICAgICAgICAgRGVjZW1iZXIgMjAy
Mwo+ID4+PiArQ29udGFjdDogICAgICAgICJaaGlndW8gTml1IiA8emhpZ3VvLm5pdUB1bmlzb2Mu
Y29tPgo+ID4+PiArRGVzY3JpcHRpb246ICAgIFNob3dzIHRoZSBudW1iZXIgb2YgaXNzdWVkIGRp
c2NhcmQuCj4gPj4+ICsKPiA+Pj4gK1doYXQ6ICAgICAgICAgICAvc3lzL2ZzL2YyZnMvPGRpc2s+
L3F1ZXVlZF9kaXNjYXJkCj4gPj4+ICtEYXRlOiAgICAgICAgICAgRGVjZW1iZXIgMjAyMwo+ID4+
PiArQ29udGFjdDogICAgICAgICJaaGlndW8gTml1IiA8emhpZ3VvLm5pdUB1bmlzb2MuY29tPgo+
ID4+PiArRGVzY3JpcHRpb246ICAgIFNob3dzIHRoZSBudW1iZXIgb2YgcXVldWVkIGRpc2NhcmQu
Cj4gPj4+ICsKPiA+Pj4gK1doYXQ6ICAgICAgICAgICAvc3lzL2ZzL2YyZnMvPGRpc2s+L3VuZGlz
Y2FyZF9ibGtzCj4gPj4+ICtEYXRlOiAgICAgICAgICAgRGVjZW1iZXIgMjAyMwo+ID4+PiArQ29u
dGFjdDogICAgICAgICJaaGlndW8gTml1IiA8emhpZ3VvLm5pdUB1bmlzb2MuY29tPgo+ID4+PiAr
RGVzY3JpcHRpb246ICAgIFNob3dzIHRoZSB0b3RhbCBudW1iZXIgb2YgdW5kaXNjYXJkIGJsb2Nr
cy4KPiA+Pj4gKwo+ID4+PiAgICBXaGF0OiAgICAgICAgICAgICAgIC9zeXMvZnMvZjJmcy88ZGlz
az4vbWF4X3ZpY3RpbV9zZWFyY2gKPiA+Pj4gICAgRGF0ZTogICAgICAgICAgICAgICBKYW51YXJ5
IDIwMTQKPiA+Pj4gICAgQ29udGFjdDogICAgIkphZWdldWsgS2ltIiA8amFlZ2V1ay5raW1Ac2Ft
c3VuZy5jb20+Cj4gPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N5c2ZzLmMgYi9mcy9mMmZzL3N5
c2ZzLmMKPiA+Pj4gaW5kZXggNzA5OWZmYS4uNjY2ZWZkZCAxMDA2NDQKPiA+Pj4gLS0tIGEvZnMv
ZjJmcy9zeXNmcy5jCj4gPj4+ICsrKyBiL2ZzL2YyZnMvc3lzZnMuYwo+ID4+PiBAQCAtMTQzLDYg
KzE0MywzMyBAQCBzdGF0aWMgc3NpemVfdCBwZW5kaW5nX2Rpc2NhcmRfc2hvdyhzdHJ1Y3QgZjJm
c19hdHRyICphLAo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJlNNX0koc2Jp
KS0+ZGNjX2luZm8tPmRpc2NhcmRfY21kX2NudCkpOwo+ID4+PiAgICB9Cj4gPj4+Cj4gPj4+ICtz
dGF0aWMgc3NpemVfdCBpc3N1ZWRfZGlzY2FyZF9zaG93KHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4g
Pj4+ICsgICAgICAgICAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBjaGFyICpidWYpCj4g
Pj4+ICt7Cj4gPj4+ICsgICAgIGlmICghU01fSShzYmkpLT5kY2NfaW5mbykKPiA+Pj4gKyAgICAg
ICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+Pj4gKyAgICAgcmV0dXJuIHN5c2ZzX2VtaXQoYnVm
LCAiJWxsdVxuIiwgKHVuc2lnbmVkIGxvbmcgbG9uZylhdG9taWNfcmVhZCgKPiA+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgJlNNX0koc2JpKS0+ZGNjX2luZm8tPmlzc3VlZF9kaXNj
YXJkKSk7Cj4gPj4+ICt9Cj4gPj4+ICsKPiA+Pj4gK3N0YXRpYyBzc2l6ZV90IHF1ZXVlZF9kaXNj
YXJkX3Nob3coc3RydWN0IGYyZnNfYXR0ciAqYSwKPiA+Pj4gKyAgICAgICAgICAgICBzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmksIGNoYXIgKmJ1ZikKPiA+Pj4gK3sKPiA+Pj4gKyAgICAgaWYgKCFT
TV9JKHNiaSktPmRjY19pbmZvKQo+ID4+PiArICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
ID4+PiArICAgICByZXR1cm4gc3lzZnNfZW1pdChidWYsICIlbGx1XG4iLCAodW5zaWduZWQgbG9u
ZyBsb25nKWF0b21pY19yZWFkKAo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAm
U01fSShzYmkpLT5kY2NfaW5mby0+cXVldWVkX2Rpc2NhcmQpKTsKPiA+Pj4gK30KPiA+Pj4gKwo+
ID4+PiArc3RhdGljIHNzaXplX3QgdW5kaXNjYXJkX2Jsa3Nfc2hvdyhzdHJ1Y3QgZjJmc19hdHRy
ICphLAo+ID4+PiArICAgICAgICAgICAgIHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgY2hhciAq
YnVmKQo+ID4+PiArewo+ID4+PiArICAgICBpZiAoIVNNX0koc2JpKS0+ZGNjX2luZm8pCj4gPj4+
ICsgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPj4+ICsgICAgIHJldHVybiBzeXNmc19l
bWl0KGJ1ZiwgIiV1XG4iLAo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTTV9J
KHNiaSktPmRjY19pbmZvLT51bmRpc2NhcmRfYmxrcyk7Cj4gPj4+ICt9Cj4gPj4+ICsKPiA+Pj4g
ICAgc3RhdGljIHNzaXplX3QgZ2NfbW9kZV9zaG93KHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4gPj4+
ICAgICAgICAgICAgICAgIHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgY2hhciAqYnVmKQo+ID4+
PiAgICB7Cj4gPj4+IEBAIC0xMDI1LDYgKzEwNTIsOSBAQCBzdGF0aWMgc3NpemVfdCBmMmZzX3Ni
X2ZlYXR1cmVfc2hvdyhzdHJ1Y3QgZjJmc19hdHRyICphLAo+ID4+PiAgICBGMkZTX0dFTkVSQUxf
Uk9fQVRUUihtb3VudGVkX3RpbWVfc2VjKTsKPiA+Pj4gICAgRjJGU19HRU5FUkFMX1JPX0FUVFIo
bWFpbl9ibGthZGRyKTsKPiA+Pj4gICAgRjJGU19HRU5FUkFMX1JPX0FUVFIocGVuZGluZ19kaXNj
YXJkKTsKPiA+Pj4gK0YyRlNfR0VORVJBTF9ST19BVFRSKGlzc3VlZF9kaXNjYXJkKTsKPiA+Pj4g
K0YyRlNfR0VORVJBTF9ST19BVFRSKHF1ZXVlZF9kaXNjYXJkKTsKPiA+Pj4gK0YyRlNfR0VORVJB
TF9ST19BVFRSKHVuZGlzY2FyZF9ibGtzKTsKPiA+Pj4gICAgRjJGU19HRU5FUkFMX1JPX0FUVFIo
Z2NfbW9kZSk7Cj4gPj4+ICAgICNpZmRlZiBDT05GSUdfRjJGU19TVEFUX0ZTCj4gPj4+ICAgIEYy
RlNfR0VORVJBTF9ST19BVFRSKG1vdmVkX2Jsb2Nrc19iYWNrZ3JvdW5kKTsKPiA+Pj4gQEAgLTEw
ODQsNiArMTExNCw5IEBAIHN0YXRpYyBzc2l6ZV90IGYyZnNfc2JfZmVhdHVyZV9zaG93KHN0cnVj
dCBmMmZzX2F0dHIgKmEsCj4gPj4+ICAgICAgICBBVFRSX0xJU1QobWF4X29yZGVyZWRfZGlzY2Fy
ZCksCj4gPj4+ICAgICAgICBBVFRSX0xJU1QoZGlzY2FyZF9pb19hd2FyZSksCj4gPj4+ICAgICAg
ICBBVFRSX0xJU1QocGVuZGluZ19kaXNjYXJkKSwKPiA+Pj4gKyAgICAgQVRUUl9MSVNUKGlzc3Vl
ZF9kaXNjYXJkKSwKPiA+Pj4gKyAgICAgQVRUUl9MSVNUKHF1ZXVlZF9kaXNjYXJkKSwKPiA+Pj4g
KyAgICAgQVRUUl9MSVNUKHVuZGlzY2FyZF9ibGtzKSwKPiA+Pj4gICAgICAgIEFUVFJfTElTVChn
Y19tb2RlKSwKPiA+Pj4gICAgICAgIEFUVFJfTElTVChpcHVfcG9saWN5KSwKPiA+Pj4gICAgICAg
IEFUVFJfTElTVChtaW5faXB1X3V0aWwpLAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
