Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D985AA5D199
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Mar 2025 22:14:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ts6w2-0002OM-QX;
	Tue, 11 Mar 2025 21:14:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1ts6vx-0002O0-AA
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 21:14:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KqG9kUgxbEXYOd4Ek5PA84ITaxaQkSg317PvkX7yUco=; b=hgfveyCd5SLoO5ICYGdw7txtqm
 yHsjtbQAym/L1AJqOk0YWyQR195Cbq4GeeXOl9obcClSB7lYYYt7MLMDLDvcAVjSW9PJu2dGuO+ro
 SMtmiCFK07mqdhqugk23FnBdO65p+E9CkVaGsrB6RK6Ip9/h176RkdkddQDKzngmrBJo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KqG9kUgxbEXYOd4Ek5PA84ITaxaQkSg317PvkX7yUco=; b=mKKYtgtjBCzKpuT9nZipOZ4G3U
 WbpQ91fpag8Q+qcnzTojDdPX3OskYxG7iShSxytoqCW4RKPuJq1wUeoRWKyxQxQD2hGiT13XewCSE
 FWCQgBALf1vPzYX0pqm+sjljNGUHy+CEcsTVgFbGUuVVKuq3FREFF2jYEV11k8XT6PEs=;
Received: from mail-vk1-f180.google.com ([209.85.221.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ts6vs-0008H5-AY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 21:14:42 +0000
Received: by mail-vk1-f180.google.com with SMTP id
 71dfb90a1353d-524038ba657so248753e0c.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Mar 2025 14:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741727665; x=1742332465; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KqG9kUgxbEXYOd4Ek5PA84ITaxaQkSg317PvkX7yUco=;
 b=eJcQsLFak1LOM2LIQ/RX9GV3/z8qvkQO7C8lhqFglJZwIhHWkCaG4XBYS3nGY1S79u
 dzEamfwGYi11C4BBRW/zi3EKi6uC9nsKNKH7OMnXpsY4G0CgzbgroioiME9CweHfp77B
 SqddO+YjueLgiSbvhkXS87FUO9OYIbO84mWTbQyrTsLmd2fxTi9svYaRDPuutPIosc3u
 9sdDpDCbcWT6almFn4ldZJmeReX80JOCVG+YelSTizabLTiqRteowCoHRfYE1oqz6aqv
 yXKC8KbT+RKExjRFyvnJI3t/FhSyTJe0qctOVFh6H/RBHmg02leyuEngZ7c2jZgUj7d/
 DzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741727665; x=1742332465;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KqG9kUgxbEXYOd4Ek5PA84ITaxaQkSg317PvkX7yUco=;
 b=MxsAOFZnVOonZ3R6EySq0HWsHizjSdM/gv8Y28Zn8shHqGXpHp9jCGsy/2yq0p0+MT
 zTvsRf3X3Fw4R7JBLQCMzzRSH/c6b4TrxbdNBRCdqHcsTeCgz44cOmHoxjORiOAjfLxE
 nqNqXeT993F0Os5MxIXMzW3uPELHTT1/ejr456bsRFdT/sD+Irfr0Oi6Ju6vwvy28l1R
 Kyz1mrqCC8UgjdiQqOuf9+K2+mz/wBx1tFoGnfC9EYDwOvBfAGUhkN0aaF3arpMjJQMg
 GPnIM/7+UaTLtmRo1wzKHy9gYwf/KaHwPIZp7n6DKrRSC/ibXWXsCYFm9DzzLCoqy8KT
 GjAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlA4B85ryS3HLjSsaZdWJhWCsBp+L6B2BSjRdHZ68lCIL6ihHex+FTOEgYzZxU3UKIufQANpBb66Fqwq1zKle6@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwRZt7igXYs7X2GsEuKZeqyW6Z2PiAQMiMQeEYBWePs8H219J8Y
 RZHqAsMOIkd5MKxRXNSsyCZyok+B/SGxQ4kDA6XJGTqe+18Nrim5/uqzXNvaxCL/1lJec38HwuG
 wsmjGV8QUofqj4CLC31TRBD2/c4E=
X-Gm-Gg: ASbGncs0BBdy1iuj20HdiIlRpDhug/HpcrcFOhGpx0dP7pKw07vhrkyaUBLT/PogNQ5
 J4VzpntrztriyDBs3/6lH+uHbf39TeRfmMMUpZyXZ90h6cfctJxyciR5rWybGxRLu2kkfK/pZyO
 l7MNSytx3KHHyLRJl9enRBvlr4Gmujb6Fx6bxPpJEygwCl0eIzzkCFpW0/XlIHRbAnaB8=
X-Google-Smtp-Source: AGHT+IFMsde9kvz9H2hxN5DQBfoQp771NI4YPU2fCSbpSU7y5AZg+O2+KCDLzGQgK8dbzCFlcN7nDu/O4TTQBw25VCQ=
X-Received: by 2002:a05:6122:1e0e:b0:51f:a02b:45d4 with SMTP id
 71dfb90a1353d-5241964dce9mr3552653e0c.1.1741727665352; Tue, 11 Mar 2025
 14:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250307145650.568-1-yohan.joung@sk.com>
 <936351d5-e99c-4c5b-bd8b-8d541122f709@kernel.org>
In-Reply-To: <936351d5-e99c-4c5b-bd8b-8d541122f709@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 11 Mar 2025 14:14:14 -0700
X-Gm-Features: AQ5f1JpHNXduvvfjOezKagK1wrXMn2WxKuf9wrSzfMefo1jaJhijXiqOWL2NafM
Message-ID: <CACOAw_xpcjaSPXTrPaZZzed6UbfLpdBEww8HDmUHU3yacaq7sg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Mar 11, 2025 at 5:00 AM Chao Yu wrote: > > On 3/7/25
    22:56, Yohan Joung wrote: > > this is unnecessary when we know we are overwriting
    already allocated > > blocks and the overhead of star [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [209.85.221.180 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [209.85.221.180 listed in sa-trusted.bondedsender.org]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.180 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.180 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1ts6vs-0008H5-AY
Subject: Re: [f2fs-dev] [PATCH] f2fs: optimize f2fs DIO overwrites
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Yohan Joung <jyh429@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBNYXIgMTEsIDIwMjUgYXQgNTowMOKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAzLzcvMjUgMjI6NTYsIFlvaGFuIEpvdW5nIHdyb3RlOgo+ID4gdGhp
cyBpcyB1bm5lY2Vzc2FyeSB3aGVuIHdlIGtub3cgd2UgYXJlIG92ZXJ3cml0aW5nIGFscmVhZHkg
YWxsb2NhdGVkCj4gPiBibG9ja3MgYW5kIHRoZSBvdmVyaGVhZCBvZiBzdGFydGluZyBhIHRyYW5z
YWN0aW9uIGNhbiBiZSBzaWduaWZpY2FudAo+ID4gZXNwZWNpYWxseSBmb3IgbXVsdGl0aHJlYWRl
ZCB3b3JrbG9hZHMgZG9pbmcgc21hbGwgd3JpdGVzLgo+Cj4gSGkgWW9oYW4sCj4KPiBTbyB5b3Un
cmUgdHJ5aW5nIHRvIGF2b2lkIGYyZnNfbWFwX2xvY2soKSBpbiBkaW8gd3JpdGUgcGF0aCwgcmln
aHQ/Cj4KPiBUaGFua3MsCj4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZb2hhbiBKb3VuZyA8eW9o
YW4uam91bmdAc2suY29tPgo+ID4gLS0tCj4gPiAgZnMvZjJmcy9kYXRhLmMgfCAyMCArKysrKysr
KysrKysrKysrKysrKwo+ID4gIGZzL2YyZnMvZjJmcy5oIHwgIDEgKwo+ID4gIGZzL2YyZnMvZmls
ZS5jIHwgIDUgKysrKy0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZz
L2RhdGEuYwo+ID4gaW5kZXggMDk0MzdkYmQxYjQyLi43Mjg2MzAwMzdiNzQgMTAwNjQ0Cj4gPiAt
LS0gYS9mcy9mMmZzL2RhdGEuYwo+ID4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPiA+IEBAIC00MjY3
LDYgKzQyNjcsMjYgQEAgc3RhdGljIGludCBmMmZzX2lvbWFwX2JlZ2luKHN0cnVjdCBpbm9kZSAq
aW5vZGUsIGxvZmZfdCBvZmZzZXQsIGxvZmZfdCBsZW5ndGgsCj4gPiAgICAgICByZXR1cm4gMDsK
PiA+ICB9Cj4gPgo+ID4gK3N0YXRpYyBpbnQgZjJmc19pb21hcF9vdmVyd3JpdGVfYmVnaW4oc3Ry
dWN0IGlub2RlICppbm9kZSwgbG9mZl90IG9mZnNldCwKPiA+ICsgICAgICAgICAgICAgbG9mZl90
IGxlbmd0aCwgdW5zaWduZWQgZmxhZ3MsIHN0cnVjdCBpb21hcCAqaW9tYXAsCj4gPiArICAgICAg
ICAgICAgIHN0cnVjdCBpb21hcCAqc3JjbWFwKQo+ID4gK3sKPiA+ICsgICAgIGludCByZXQ7Cj4g
PiArCj4gPiArICAgICAvKgo+ID4gKyAgICAgICogRXZlbiBmb3Igd3JpdGVzIHdlIGRvbid0IG5l
ZWQgdG8gYWxsb2NhdGUgYmxvY2tzLCBzbyBqdXN0IHByZXRlbmQKPiA+ICsgICAgICAqIHdlIGFy
ZSByZWFkaW5nIHRvIHNhdmUgb3ZlcmhlYWQgb2Ygc3RhcnRpbmcgYSB0cmFuc2FjdGlvbi4KPiA+
ICsgICAgICAqLwo+ID4gKyAgICAgZmxhZ3MgJj0gfklPTUFQX1dSSVRFOwo+ID4gKyAgICAgcmV0
ID0gZjJmc19pb21hcF9iZWdpbihpbm9kZSwgb2Zmc2V0LCBsZW5ndGgsIGZsYWdzLCBpb21hcCwg
c3JjbWFwKTsKPiA+ICsgICAgIFdBUk5fT05fT05DRSghcmV0ICYmIGlvbWFwLT50eXBlICE9IElP
TUFQX01BUFBFRCk7Cj4gPiArICAgICByZXR1cm4gcmV0Owo+ID4gK30KPiA+ICsKPiA+ICBjb25z
dCBzdHJ1Y3QgaW9tYXBfb3BzIGYyZnNfaW9tYXBfb3BzID0gewo+ID4gICAgICAgLmlvbWFwX2Jl
Z2luICAgID0gZjJmc19pb21hcF9iZWdpbiwKPiA+ICB9Owo+ID4gKwo+ID4gK2NvbnN0IHN0cnVj
dCBpb21hcF9vcHMgZjJmc19pb21hcF9vdmVyd3JpdGVfb3BzID0gewo+ID4gKyAgICAgLmlvbWFw
X2JlZ2luICAgID0gZjJmc19pb21hcF9vdmVyd3JpdGVfYmVnaW4sCj4gPiArfTsKPiA+IGRpZmYg
LS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4gPiBpbmRleCBjNmNjMjY5
NGY5YWMuLjA1MTFhYjVlZDQyYSAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4gPiAr
KysgYi9mcy9mMmZzL2YyZnMuaAo+ID4gQEAgLTM5MzYsNiArMzkzNiw3IEBAIHZvaWQgZjJmc19k
ZXN0cm95X3Bvc3RfcmVhZF9wcm9jZXNzaW5nKHZvaWQpOwo+ID4gIGludCBmMmZzX2luaXRfcG9z
dF9yZWFkX3dxKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4gPiAgdm9pZCBmMmZzX2Rlc3Ry
b3lfcG9zdF9yZWFkX3dxKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4gPiAgZXh0ZXJuIGNv
bnN0IHN0cnVjdCBpb21hcF9vcHMgZjJmc19pb21hcF9vcHM7Cj4gPiArZXh0ZXJuIGNvbnN0IHN0
cnVjdCBpb21hcF9vcHMgZjJmc19pb21hcF9vdmVyd3JpdGVfb3BzOwo+ID4KPiA+ICBzdGF0aWMg
aW5saW5lIHN0cnVjdCBwYWdlICpmMmZzX2ZpbmRfZGF0YV9wYWdlKHN0cnVjdCBpbm9kZSAqaW5v
ZGUsCj4gPiAgICAgICAgICAgICAgIHBnb2ZmX3QgaW5kZXgsIHBnb2ZmX3QgKm5leHRfcGdvZnMp
Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+ID4gaW5k
ZXggODJiMjFiYWY1NjI4Li5iYjJmZTZkYWM5YjYgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL2Zp
bGUuYwo+ID4gKysrIGIvZnMvZjJmcy9maWxlLmMKPiA+IEBAIC00OTg1LDYgKzQ5ODUsNyBAQCBz
dGF0aWMgc3NpemVfdCBmMmZzX2Rpb193cml0ZV9pdGVyKHN0cnVjdCBraW9jYiAqaW9jYiwgc3Ry
dWN0IGlvdl9pdGVyICpmcm9tLAo+ID4gICAgICAgY29uc3Qgc3NpemVfdCBjb3VudCA9IGlvdl9p
dGVyX2NvdW50KGZyb20pOwo+ID4gICAgICAgdW5zaWduZWQgaW50IGRpb19mbGFnczsKPiA+ICAg
ICAgIHN0cnVjdCBpb21hcF9kaW8gKmRpbzsKPiA+ICsgICAgIGNvbnN0IHN0cnVjdCBpb21hcF9v
cHMgKmlvbWFwX29wcyA9ICZmMmZzX2lvbWFwX29wczsKPiA+ICAgICAgIHNzaXplX3QgcmV0Owo+
ID4KPiA+ICAgICAgIHRyYWNlX2YyZnNfZGlyZWN0X0lPX2VudGVyKGlub2RlLCBpb2NiLCBjb3Vu
dCwgV1JJVEUpOwo+ID4gQEAgLTUwMjUsNyArNTAyNiw5IEBAIHN0YXRpYyBzc2l6ZV90IGYyZnNf
ZGlvX3dyaXRlX2l0ZXIoc3RydWN0IGtpb2NiICppb2NiLCBzdHJ1Y3QgaW92X2l0ZXIgKmZyb20s
Cj4gPiAgICAgICBkaW9fZmxhZ3MgPSAwOwo+ID4gICAgICAgaWYgKHBvcyArIGNvdW50ID4gaW5v
ZGUtPmlfc2l6ZSkKPiA+ICAgICAgICAgICAgICAgZGlvX2ZsYWdzIHw9IElPTUFQX0RJT19GT1JD
RV9XQUlUOwo+ID4gLSAgICAgZGlvID0gX19pb21hcF9kaW9fcncoaW9jYiwgZnJvbSwgJmYyZnNf
aW9tYXBfb3BzLAo+ID4gKyAgICAgZWxzZSBpZiAoZjJmc19vdmVyd3JpdGVfaW8oaW5vZGUsIHBv
cywgY291bnQpKQo+ID4gKyAgICAgICAgICAgICBpb21hcF9vcHMgPSAmZjJmc19pb21hcF9vdmVy
d3JpdGVfb3BzOwo+ID4gKyAgICAgZGlvID0gX19pb21hcF9kaW9fcncoaW9jYiwgZnJvbSwgaW9t
YXBfb3BzLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgJmYyZnNfaW9tYXBfZGlvX3dy
aXRlX29wcywgZGlvX2ZsYWdzLCBOVUxMLCAwKTsKPiA+ICAgICAgIGlmIChJU19FUlJfT1JfTlVM
TChkaW8pKSB7Cj4gPiAgICAgICAgICAgICAgIHJldCA9IFBUUl9FUlJfT1JfWkVSTyhkaW8pOwoK
SSB0aGluayB3ZSBjYW4gYWRkIHRoZSBvdmVyd3JpdGUgY2hlY2sgaW4gZjJmc19pb21hcF9iZWdp
bigpIGJlZm9yZQpzZXR0aW5nIHRoZSBtYXAubV9tYXlfY3JlYXRlLCBpbnN0ZWFkIG9mIGFkZGlu
ZyBhIG5ldyBmdW5jdGlvbgpmMmZzX2lvbWFwX292ZXJ3cml0ZV9iZWdpbigpLgpXaGF0IGRvIHlv
dSB0aGluaz8KCj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
