Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF2CB1D14C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Aug 2025 05:48:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/KdZHrc/eCcfxu/O5bYdTGxP9XF81OEViVlR8YeANl0=; b=g5D+RLuC5t8TFObsGB2i0owO5b
	T6qZ3IByptbGAmLkDvNpgmaGXx8geR/dK+k82f3eSpA++JdtHTtdrohB3A0JNHms8Jvk0g1RViOVW
	pMsC83ztaeQzlOUlhJ6yHrkI21NM7Kv8c5v7LNrKslJwUK0+uWA4inhs2yjyNvS9WIYw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujrbq-0006Yw-I0;
	Thu, 07 Aug 2025 03:48:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1ujrbo-0006Yq-Rv
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 03:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AccB817uW9Z1ldXTkpaOZgtO+G8kpHCoO5sj1SyUU4Y=; b=KUk3O3EZHAbC8PN/pA7bbdw4OQ
 qGipwwkinHpE0m1CNiS4aTB7v+CoJ0ca7nzljfzukG9jY2uKSFlXFyrEZMmFWaOpkuq8+OT/c85jE
 pbLRGETJEYnU9O8x3AaG4Acc0PhmL/yRtNwHur+9jy6ARsQXWgQ7e7Aj9mBHdGtImYD8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AccB817uW9Z1ldXTkpaOZgtO+G8kpHCoO5sj1SyUU4Y=; b=b1AEUTT/8bp8020qxLPJvdUAmT
 QAXD8UU/3gK/Tvb6a7/irnnek6/YGu8c6C8qnwYehy7C6EzrCS7dIvA4C2/JoONZrTYtTWujjLX7B
 hwSNK+SenmaW9+lSwzfVZYEYso7qoNGxU4OlJyp817YiE4lck9DjcaIUNlK5U1ZQlvKM=;
Received: from mail-wm1-f46.google.com ([209.85.128.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ujrbo-00004y-Aq for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 03:48:04 +0000
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-456127b9958so696445e9.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 06 Aug 2025 20:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754538478; x=1755143278; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AccB817uW9Z1ldXTkpaOZgtO+G8kpHCoO5sj1SyUU4Y=;
 b=aeHlQYoUjDVIMpni1Zx5L98JhRkbqIRJpRbXTpLs9Ycvb7m8A9mfj1QD1AnEi9ahDR
 Ow8h4CrOyWLdo+E/jUF3vryv/v2n35HfZl2S44ZLBFIJYJmEWgBhL+VVGfl73/NvqeA/
 s4PeK/1mbQUuiEED5QWJji68dqJF54Un8ra3Bx4//wmY4etDYaq5bCfX3uUYjPQw4aRZ
 gUlYdU3MM0sAiYF50TTkvHep+9zjSPUiSqOU5fnaN2CLPRSBy+STLoh9JComzBlbBmTj
 MxZWLwQ46tsqK2Z/Utg4ptg0sGD8W7v+ZFQugJE2PpbvXPFstdlds23q6EWGUo7z5Ncl
 RqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754538478; x=1755143278;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AccB817uW9Z1ldXTkpaOZgtO+G8kpHCoO5sj1SyUU4Y=;
 b=jFZ59cz+aE7iqGjRh69bTlH/raTdkfzArlS0bDyh/YdsCmbdNdJkCPGjRy0ncgonR1
 4ej617HOMOJNEbscO4iK6xqJ1u9eyTCS7Z6LW90WULgRo/EIdP24BJ9j7TyKwPW/TfSn
 6B7zvAeSIqPg+N7/hdIsfptByXX9SoA7ZMlkxYK40JwPg4VPbSgFOZlOOiQ8wmw5djj2
 pLhffgne4hVNczSnoarRErfp8N0d41m2UgQBh5ZAuQyxsWzXcsr9LnxpYTj3+4VKcPHu
 aLXupgY0V2/EXs3WZ7/PM1M9wijbAPT9Jfc9+CAXB+g7UjzYr9qo11iefOZy0z5pI30w
 P+NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF6/t+zjAmRNPJAVTpY7NmUEYKpW+SBT0ExsLZJ6YYTNoYQfacCDPjFkPz6eRAkk1Ao9fbQ38DbTHImyggTnN2@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yym1eIVBI9HLFAaSOXCQpb8g0c05rtF6oe+UwJbtS+shJ422ikg
 wLubPd190XgjngPKbKh5c116kDj/fLhiSk54yQYkStmDafV+OXzHIcMmsaSk54zDATe0VnJEoFO
 gFBZjv8SctaZugSiUFH2NEVqoK2QE6G0=
X-Gm-Gg: ASbGnctuWuYSDyJwa+EP539+Q1msqc0EJpXgpd/M374/qw3IXdyrxZLwaW5FQy2RRgw
 u2nna483JOGOQx473JQ+58LPNmx5mDC/MIurXVtlRMokPW8PQDZrTBLChUOJz3Yd1mWbErCZp1F
 TJAnNRs4ts5J7mYGP9cTlpgInqp5JYfd4DOYDp5LJ/NNO/lmwMuVrznC39q264ZqBwsOGFqVj5n
 Ws18NkI
X-Google-Smtp-Source: AGHT+IG5NhqzP9cPRq4GUvf4m+7Dubrfw/7RdQzbNISOzR+ffeKHG5cpCPqlTCi3wTjh/z+MUT6Vf67hQt3sQsbiawU=
X-Received: by 2002:a05:600c:348b:b0:43b:c844:a4ba with SMTP id
 5b1f17b1804b1-459e7105b64mr19849455e9.3.1754538477436; Wed, 06 Aug 2025
 20:47:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250807032406.3817056-1-chao@kernel.org>
In-Reply-To: <20250807032406.3817056-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 7 Aug 2025 11:47:46 +0800
X-Gm-Features: Ac12FXxBYIv3So14Gs9o02UWkKJ243W16c2f6tIN2hppfxW8_1vL7AyDGn_iLb8
Message-ID: <CAHJ8P3L9VRghpbpn=ndQQfDXKjit=5PY28yR_19mnbgvda1LxQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2025年8月7日周四 11:27写道：
    > > This patch introduces a new sysfs entry /sys/fs/f2fs/<disk>/flush_policy
    > in order to tune performance of f2fs data flush fl [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.46 listed in wl.mailspike.net]
X-Headers-End: 1ujrbo-00004y-Aq
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce flush_policy sysfs entry
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

Q2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjXlubQ45pyIN+aXpeWRqOWbmyAxMToyN+WGmemBk++8mgo+Cj4g
VGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgbmV3IHN5c2ZzIGVudHJ5IC9zeXMvZnMvZjJmcy88ZGlz
az4vZmx1c2hfcG9saWN5Cj4gaW4gb3JkZXIgdG8gdHVuZSBwZXJmb3JtYW5jZSBvZiBmMmZzIGRh
dGEgZmx1c2ggZmxvdy4KPgo+IEZvciBleGFtcGxlLCBjaGVja3BvaW50IHdpbGwgdXNlIFJFUV9G
VUEgdG8gcGVyc2lzdCBDUCBtZXRhZGF0YSwgaG93ZXZlciwKPiBzb21lIGtpbmQgZGV2aWNlIGhh
cyBiYWQgcGVyZm9ybWFuY2Ugb24gUkVRX0ZVQSBjb21tYW5kLCByZXN1bHQgaW4gdGhhdAo+IGNo
ZWNrcG9pbnQgYmVpbmcgYmxvY2tlZCBmb3IgbG9uZyB0aW1lLCB3LyB0aGlzIHN5c2ZzIGVudHJ5
LCB3ZSBjYW4gZ2l2ZQo+IGFuIG9wdGlvbiB0byB1c2UgUkVRX1BSRUZMVVNIIGNvbW1hbmQgaW5z
dGVhZCBvZiBSRVFfRlVBIGR1cmluZyBjaGVja3BvaW50LAo+IGl0IGNhbiBoZWxwIHRvIG1pdGln
YXRlIGxvbmcgbGF0ZW5jeSBvZiBjaGVja3BvaW50Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZ
dSA8Y2hhb0BrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6IFpoaWd1byBOaXUgPHpoaWd1by5uaXVA
dW5pc29jLmNvbT4KPiAtLS0KPiB2MjoKPiAtIHVzZSBfX3N1Ym1pdF9mbHVzaF93YWl0KCkgaW5z
dGVhZCBvZiBmMmZzX2ZsdXNoX2RldmljZV9jYWNoZSgpIHRvCj4ganVzdCBmbHVzaCBwcmltYXJ5
IGRldmljZSBjYWNoZQo+ICBEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMg
fCAgOSArKysrKysrKysKPiAgZnMvZjJmcy9jaGVja3BvaW50LmMgICAgICAgICAgICAgICAgICAg
IHwgMTEgKysrKysrKysrKy0KPiAgZnMvZjJmcy9mMmZzLmggICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDcgKysrKysrKwo+ICBmcy9mMmZzL3N5c2ZzLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgOSArKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9z
eXNmcy1mcy1mMmZzIGIvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzCj4g
aW5kZXggYmMwZTdmZWZjMzlkLi4yZmVkYjQ0YjcxM2IgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9BQkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9BQkkv
dGVzdGluZy9zeXNmcy1mcy1mMmZzCj4gQEAgLTg4MywzICs4ODMsMTIgQEAgRGF0ZTogICAgICAg
ICAgICAgIEp1bmUgMjAyNQo+ICBDb250YWN0OiAgICAgICAiRGFlaG8gSmVvbmciIDxkYWVob2pl
b25nQGdvb2dsZS5jb20+Cj4gIERlc2NyaXB0aW9uOiAgIENvbnRyb2wgR0MgYWxnb3JpdGhtIGZv
ciBib29zdCBHQy4gMDogY29zdCBiZW5lZml0LCAxOiBncmVlZHkKPiAgICAgICAgICAgICAgICAg
RGVmYXVsdDogMQo+ICsKPiArV2hhdDogICAgICAgICAgL3N5cy9mcy9mMmZzLzxkaXNrPi9mbHVz
aF9wb2xpY3kKPiArRGF0ZTogICAgICAgICAgSnVseSAyMDI1Cj4gK0NvbnRhY3Q6ICAgICAgICJD
aGFvIFl1IiA8Y2hhb0BrZXJuZWwub3JnPgo+ICtEZXNjcmlwdGlvbjogICBEZXZpY2UgaGFzIGRp
ZmZlcmVudCBwZXJmb3JtYW5jZSBmb3IgdGhlIHNhbWUgZmx1c2ggbWV0aG9kcywgdGhpcyBub2Rl
Cj4gKyAgICAgICAgICAgICAgIGNhbiBiZSB1c2VkIHRvIHR1bmUgcGVyZm9ybWFuY2UgYnkgc2V0
dGluZyBkaWZmZXJlbnQgZmx1c2ggbWV0aG9kcy4KPiArCj4gKyAgICAgICAgICAgICAgIHBvbGlj
eSB2YWx1ZSAgICAgICAgICAgIGRlc2NyaXB0aW9uCj4gKyAgICAgICAgICAgICAgIDB4MDAwMDAw
MDEgICAgICAgICAgICAgIFVzZSBwcmVmbHVzaCBpbnN0ZWFkIG9mIGZ1YSBkdXJpbmcgY2hlY2tw
b2ludAo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2NoZWNrcG9pbnQuYyBiL2ZzL2YyZnMvY2hlY2tw
b2ludC5jCj4gaW5kZXggZGIzODMxZjdmMmY1Li5mYWZhMjE1NjczMmQgMTAwNjQ0Cj4gLS0tIGEv
ZnMvZjJmcy9jaGVja3BvaW50LmMKPiArKysgYi9mcy9mMmZzL2NoZWNrcG9pbnQuYwo+IEBAIC0x
NDE5LDcgKzE0MTksOSBAQCBzdGF0aWMgdm9pZCBjb21taXRfY2hlY2twb2ludChzdHJ1Y3QgZjJm
c19zYl9pbmZvICpzYmksCj4gICAgICAgICBmMmZzX2ZvbGlvX3B1dChmb2xpbywgZmFsc2UpOwo+
Cj4gICAgICAgICAvKiBzdWJtaXQgY2hlY2twb2ludCAod2l0aCBiYXJyaWVyIGlmIE5PQkFSUklF
UiBpcyBub3Qgc2V0KSAqLwo+IC0gICAgICAgZjJmc19zdWJtaXRfbWVyZ2VkX3dyaXRlKHNiaSwg
TUVUQV9GTFVTSCk7Cj4gKyAgICAgICBmMmZzX3N1Ym1pdF9tZXJnZWRfd3JpdGUoc2JpLAo+ICsg
ICAgICAgICAgICAgICBzYmktPmZsdXNoX3BvbGljeSAmIEJJVChGTFVTSF9QT0xJQ1lfQ1BfTk9f
RlVBKSA/Cj4gKyAgICAgICAgICAgICAgIE1FVEEgOiBNRVRBX0ZMVVNIKTsKPiAgfQo+Cj4gIHN0
YXRpYyBpbmxpbmUgdTY0IGdldF9zZWN0b3JzX3dyaXR0ZW4oc3RydWN0IGJsb2NrX2RldmljZSAq
YmRldikKPiBAQCAtMTU5NCw2ICsxNTk2LDEzIEBAIHN0YXRpYyBpbnQgZG9fY2hlY2twb2ludChz
dHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBjcF9jb250cm9sICpjcGMpCj4KPiAgICAg
ICAgIF9fc2V0X2NwX25leHRfcGFjayhzYmkpOwo+Cj4gKyAgICAgICAvKiBmbHVzaCBkZXZpY2Ug
Y2FjaGUgdG8gbWFrZSBzdXJlIGxhc3QgY3AgcGFjayBjYW4gYmUgcGVyc2lzdGVkICovCj4gKyAg
ICAgICBpZiAoc2JpLT5mbHVzaF9wb2xpY3kgJiBCSVQoRkxVU0hfUE9MSUNZX0NQX05PX0ZVQSkp
IHsKPiArICAgICAgICAgICAgICAgZXJyID0gX19zdWJtaXRfZmx1c2hfd2FpdChzYmksIHNiaS0+
c2ItPnNfYmRldik7Cj4gKyAgICAgICAgICAgICAgIGlmIChlcnIpCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIGVycjsKPiArICAgICAgIH0KPiArCj4gICAgICAgICAvKgo+ICAgICAg
ICAgICogcmVkaXJ0eSBzdXBlcmJsb2NrIGlmIG1ldGFkYXRhIGxpa2Ugbm9kZSBwYWdlIG9yIGlu
b2RlIGNhY2hlIGlzCj4gICAgICAgICAgKiB1cGRhdGVkIGR1cmluZyB3cml0aW5nIGNoZWNrcG9p
bnQuCj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPiBpbmRl
eCA0NmJlNzU2MDU0OGMuLjVkYjVlYmE0Y2JkNyAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL2YyZnMu
aAo+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4gQEAgLTE1OTQsNiArMTU5NCwxMSBAQCBzdHJ1Y3Qg
ZGVjb21wcmVzc19pb19jdHggewo+ICAjZGVmaW5lIE1BWF9DT01QUkVTU19MT0dfU0laRSAgICAg
ICAgICA4Cj4gICNkZWZpbmUgTUFYX0NPTVBSRVNTX1dJTkRPV19TSVpFKGxvZ19zaXplKSAgICAg
KChQQUdFX1NJWkUpIDw8IChsb2dfc2l6ZSkpCj4KPiArZW51bSBmbHVzaF9wb2xpY3kgewo+ICsg
ICAgICAgRkxVU0hfUE9MSUNZX0NQX05PX0ZVQSwKPiArICAgICAgIEZMVVNIX1BPTElDWV9NQVgs
Cj4gK307Cj4gKwo+ICBzdHJ1Y3QgZjJmc19zYl9pbmZvIHsKPiAgICAgICAgIHN0cnVjdCBzdXBl
cl9ibG9jayAqc2I7ICAgICAgICAgICAgICAgICAvKiBwb2ludGVyIHRvIFZGUyBzdXBlciBibG9j
ayAqLwo+ICAgICAgICAgc3RydWN0IHByb2NfZGlyX2VudHJ5ICpzX3Byb2M7ICAgICAgICAgIC8q
IHByb2MgZW50cnkgKi8KPiBAQCAtMTg0NSw2ICsxODUwLDggQEAgc3RydWN0IGYyZnNfc2JfaW5m
byB7Cj4gICAgICAgICAvKiBjYXJ2ZSBvdXQgcmVzZXJ2ZWRfYmxvY2tzIGZyb20gdG90YWwgYmxv
Y2tzICovCj4gICAgICAgICBib29sIGNhcnZlX291dDsKPgo+ICsgICAgICAgdW5zaWduZWQgaW50
IGZsdXNoX3BvbGljeTsgICAgICAgICAgICAgIC8qIGZsdXNoIHBvbGljeSAqLwo+ICsKPiAgI2lm
ZGVmIENPTkZJR19GMkZTX0ZTX0NPTVBSRVNTSU9OCj4gICAgICAgICBzdHJ1Y3Qga21lbV9jYWNo
ZSAqcGFnZV9hcnJheV9zbGFiOyAgICAgLyogcGFnZSBhcnJheSBlbnRyeSAqLwo+ICAgICAgICAg
dW5zaWduZWQgaW50IHBhZ2VfYXJyYXlfc2xhYl9zaXplOyAgICAgIC8qIGRlZmF1bHQgcGFnZSBh
cnJheSBzbGFiIHNpemUgKi8KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zeXNmcy5jIGIvZnMvZjJm
cy9zeXNmcy5jCj4gaW5kZXggZjczNjA1MmRlYTUwLi5iNjkwMTVmMWRjNjcgMTAwNjQ0Cj4gLS0t
IGEvZnMvZjJmcy9zeXNmcy5jCj4gKysrIGIvZnMvZjJmcy9zeXNmcy5jCj4gQEAgLTg1Miw2ICs4
NTIsMTMgQEAgc3RhdGljIHNzaXplX3QgX19zYmlfc3RvcmUoc3RydWN0IGYyZnNfYXR0ciAqYSwK
PiAgICAgICAgICAgICAgICAgcmV0dXJuIGNvdW50Owo+ICAgICAgICAgfQo+Cj4gKyAgICAgICBp
ZiAoIXN0cmNtcChhLT5hdHRyLm5hbWUsICJmbHVzaF9wb2xpY3kiKSkgewo+ICsgICAgICAgICAg
ICAgICBpZiAodCA+PSBCSVQoRkxVU0hfUE9MSUNZX01BWCkpCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKyAgICAgICAgICAgICAgICp1aSA9ICh1bnNpZ25lZCBp
bnQpdDsKPiArICAgICAgICAgICAgICAgcmV0dXJuIGNvdW50Owo+ICsgICAgICAgfQo+ICsKPiAg
ICAgICAgIGlmICghc3RyY21wKGEtPmF0dHIubmFtZSwgImdjX2Jvb3N0X2djX211bHRpcGxlIikp
IHsKPiAgICAgICAgICAgICAgICAgaWYgKHQgPCAxIHx8IHQgPiBTRUdTX1BFUl9TRUMoc2JpKSkK
PiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiBAQCAtMTE3NSw2ICsx
MTgyLDcgQEAgRjJGU19TQklfR0VORVJBTF9SV19BVFRSKGJsa3pvbmVfYWxsb2NfcG9saWN5KTsK
PiAgI2VuZGlmCj4gIEYyRlNfU0JJX0dFTkVSQUxfUldfQVRUUihjYXJ2ZV9vdXQpOwo+ICBGMkZT
X1NCSV9HRU5FUkFMX1JXX0FUVFIocmVzZXJ2ZWRfcGluX3NlY3Rpb24pOwo+ICtGMkZTX1NCSV9H
RU5FUkFMX1JXX0FUVFIoZmx1c2hfcG9saWN5KTsKPgo+ICAvKiBTVEFUX0lORk8gQVRUUiAqLwo+
ICAjaWZkZWYgQ09ORklHX0YyRlNfU1RBVF9GUwo+IEBAIC0xMzcxLDYgKzEzNzksNyBAQCBzdGF0
aWMgc3RydWN0IGF0dHJpYnV0ZSAqZjJmc19hdHRyc1tdID0gewo+ICAgICAgICAgQVRUUl9MSVNU
KG1heF9yZWFkX2V4dGVudF9jb3VudCksCj4gICAgICAgICBBVFRSX0xJU1QoY2FydmVfb3V0KSwK
PiAgICAgICAgIEFUVFJfTElTVChyZXNlcnZlZF9waW5fc2VjdGlvbiksCj4gKyAgICAgICBBVFRS
X0xJU1QoZmx1c2hfcG9saWN5KSwKPiAgICAgICAgIE5VTEwsCj4gIH07Cj4gIEFUVFJJQlVURV9H
Uk9VUFMoZjJmcyk7Cj4gLS0KPiAyLjQ5LjAKPgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAo=
