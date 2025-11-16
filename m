Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93457C61A23
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 16 Nov 2025 19:10:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:References:To:From:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ght2E/Fr3YGJYXv52VLnmXncbqHypcJozGiLIbXEfs8=; b=GpwI15JeihsJBb5mlSJOy04hHQ
	EE4arUCGDKY0T7WABlyWi1WLydvp2ESaX0GsjXEjSNpR1emTnfAJ8ZFRf96nq2oeMmSP65V/Dk0Pm
	vqFLBQMeMWXlSuMxnfHMlW0JKFzzk6GFebYdloXFqOYE4O/U67KkWXjbTzkX/21PQr50=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vKhCd-0002Sd-NX;
	Sun, 16 Nov 2025 18:10:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vKhCb-0002ST-Vj
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 16 Nov 2025 18:10:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y3ILy6pDXZGHJ7c23r4Lecf4tYYHm4eBZDJxSDZwTTg=; b=FDP1jJRtbccg2jPyAE+r5Wnk1y
 nZLUmpTz04DklFaTZWh5sMikSHPgHolon+F5RFcu7cBWUih3eC3haXoc67GfaMRmajW8sTyTQ9mEL
 3VMaxdh3+5YX0Yo5OjOUfGhgGxxA+tMDyVtiWMYqaQXnH1DHOpyt/+EiBU7daqGSamdg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y3ILy6pDXZGHJ7c23r4Lecf4tYYHm4eBZDJxSDZwTTg=; b=HG5KTepmQh+b7qzPbQ2BftNDin
 4woHIeIxKxAGAG3twVc6LKs998JTu+HPRuF36Ra38tgDYvKdPyCUZAUNNPSfUE0DGLwyD2YDxETs9
 BFGqAaSqapNs4fnYLyvlqMAUyRhzPzSdED62XsznAeOPs2MPEso+RsfUCP3tVuXrv7uQ=;
Received: from mail-pj1-f54.google.com ([209.85.216.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vKhCc-0004qO-42 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 16 Nov 2025 18:10:18 +0000
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-3418ad69672so2513139a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 16 Nov 2025 10:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763316607; x=1763921407; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=y3ILy6pDXZGHJ7c23r4Lecf4tYYHm4eBZDJxSDZwTTg=;
 b=FX9gCVisBkiZ2FUrGEkGbW2uUIPSOJeYTPHqXbbO6fyYLIWYRqrii1btliEo+bSCbi
 WOSbUzhRUBRyFDJvSzFzbZOXl211Uk8e9naH1Az7AFPQanb9LYezk/h7bVQ+nI4li7UM
 aT+6Qiw1vLviIVKsIiPFYjrTTgLz9P+RRxkBTsuAAPbb7vDP1QpSVd22KN4rJEBLUxMo
 /j6GUp16ENpDy8zr1bOXaNnWRkAum4jDOeoFexy3Boa0obNEqvf2sot/0W2cUZXuaHoC
 ROR1pJgAzvGpGKsEp+eMyJLV3u8olbaluihiftvGNBWULOf9DDcaHh5ahJC550BFyRq0
 Q0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763316607; x=1763921407;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y3ILy6pDXZGHJ7c23r4Lecf4tYYHm4eBZDJxSDZwTTg=;
 b=OBPC9APnqTKG7UMSFKFD5HWiM/rLnMmLYJqYkiUHlY/nzpsqqaDkQBKt5Ic10y1njj
 kal5FEqeHPMRuUHNRkGYck8vF1HHgMTdsnEZMcu3XS/vglZ1yn/E+OVR/CDkqnoBc/oB
 +5t0Rh3tQHcc2q2EgUqFlCDKUmA2wmOPfYswlNlnPjovtS5oN14HyuhTQkvji2SX9Jad
 bsvsh3iFXC8jwShkmZkZ4fxpoynSsX1qqTUBBF1lw2qYsBa3SGPfOLlQ0ASNPgUAUbvq
 qyWIcf4hAz8UnEczCbbViQLskRme/lBqLAAOIHS09BlwVop5/SZPeqHyMN+Lfm7olGUD
 G1Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCWo1+CBbEr18E2gDIwXJrOGlKfGi8zDFhpV6VFTEzw+AfvNeriOhCWqSAWoqHpwNPrElRmh3+QOChIk2E01vz@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxwQNgrexcxik7p0zh3Txj/IQBCHSlIhAL1/S0SlPrX/sGVrJz1
 v5XRvs9f1uGYaJ9zjONZMXMTxsXd6QbkY2PliCoNOYO7mmAcYQbWl5op
X-Gm-Gg: ASbGncsTRgJPJpdTFMBwuDkpG/w31Vf+7944T5Sc4/hOuPwImL3v3YtBuaBEkjoA6U2
 e/5080XiES/5saUqBXZThGX+E6f1xH/9inctmS4GRzrQ/W27IaglP4TCQ6pUahUvaFYDjGczHeT
 IP4Fk0ASQ+c76oZ9w4WtsoqjFgbRfAiMmWtfBPpkYcV31F4FQZYVCAxUlPGca6MDqt+NQvZPOe5
 dQsPzl4O4S0C0ZoqxK8pRcQP7FBUOS5G0jPG/5aLT8Hsk5b0qKfjhjNLlMSELl7EXayL1i1UPvE
 QGVzLB0hhevWYZmeJ9L2L5OK3nNZcoie4CqREpqy4c4tWBc3x64XyrF5SstwcvJSRear7tusqKg
 7GxltvlGgOGsT0m8PFkuFWzZWWnSv+k23HBpzGl47WMen70qgAKeoeX7AKYqztykz6wLDEf0Ztk
 wXtS32F18g/vkXNzHDLqztojqupBwjNX7WxAdReS7owh+r/cvfEWG7eDJJ2DH/S0ksZcfJtSjpG
 g==
X-Google-Smtp-Source: AGHT+IHJVvgqtFZyLRx3ED+UMe+HvUVBmTxn0DVMzprbOV0Vk1EJAKfX02d2XlELIS2FMT7M3ppvJg==
X-Received: by 2002:a17:90b:2dc6:b0:343:eb40:8e01 with SMTP id
 98e67ed59e1d1-343fa63dc9cmr10806061a91.27.1763316607195; 
 Sun, 16 Nov 2025 10:10:07 -0800 (PST)
Received: from ?IPV6:2409:8a00:79b1:1770:192e:95ab:3bf6:97e?
 ([2409:8a00:79b1:1770:192e:95ab:3bf6:97e])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-343ea5fbb4csm6122617a91.0.2025.11.16.10.10.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Nov 2025 10:10:06 -0800 (PST)
Message-ID: <d90c234d-93e1-4041-b1e2-d3092ec8dcad@gmail.com>
Date: Mon, 17 Nov 2025 02:10:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>, Yongpeng Yang <yangyongpeng@xiaomi.com>
References: <20251110082223.902207-1-yangyongpeng.storage@gmail.com>
 <20251110082223.902207-3-yangyongpeng.storage@gmail.com>
 <aRT_KGOSGOGw3S4W@google.com>
 <4c31e634-f88e-4cec-8d1e-b8434a11ebee@kernel.org>
 <9df8fb59-8afb-4b20-b4fa-14bd873c9502@gmail.com>
 <1d03119c-bec1-4269-b385-34ce422125d3@kernel.org>
 <3b488053-b07b-428f-9415-741119af3d35@gmail.com>
Content-Language: en-US
In-Reply-To: <3b488053-b07b-428f-9415-741119af3d35@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/17/2025 12:31 AM,
 Yongpeng Yang wrote: > > On 11/15/2025
 7:36 PM, Chao Yu via Linux-f2fs-devel wrote: >> On 11/14/2025 3:37 PM, Yongpeng
 Yang wrote: >>> On 11/14/25 08:51, Chao Yu via Linux-f2fs [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.54 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vKhCc-0004qO-42
Subject: Re: [f2fs-dev] [PATCH v2 3/3] f2fs: fix handling of zoned block
 devices with max_open_zones == 0
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgpPbiAxMS8xNy8yMDI1IDEyOjMxIEFNLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+IAo+IE9uIDEx
LzE1LzIwMjUgNzozNiBQTSwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4g
T24gMTEvMTQvMjAyNSAzOjM3IFBNLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4gT24gMTEvMTQv
MjUgMDg6NTEsIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+Pj4gT24gMTEv
MTMvMjAyNSA1OjQyIEFNLCBKYWVnZXVrIEtpbSB3cm90ZToKPj4+Pj4gVGhpcyBicmVha3MgdGhl
IGRldmljZSBnaXZpbmcgMCBvcGVuIHpvbmUgd2hpY2ggd2FzIHdvcmtpbmcuIEhlbmNlLCBJCj4+
Pj4+IGRyb3BwZWQKPj4+Pj4gdGhlIGNoYW5nZS4KPj4+Pj4KPj4+Pj4gT24gMTEvMTAsIFlvbmdw
ZW5nIFlhbmcgd3JvdGU6Cj4+Pj4+PiBGcm9tOiBZb25ncGVuZyBZYW5nIDx5YW5neW9uZ3BlbmdA
eGlhb21pLmNvbT4KPj4+Pj4+Cj4+Pj4+PiBXaGVuIGVtdWxhdGluZyBhIFpOUyBTU0Qgb24gcWVt
dSB3aXRoIHpvbmVkLm1heF9vcGVuIHNldCB0byAwLCB0aGUKPj4+Pj4+IEYyRlMgY2FuIHN0aWxs
IGJlIG1vdW50ZWQgc3VjY2Vzc2Z1bGx5LiBUaGUgc3lzZnMgZW50cnkgc2hvd3MKPj4+Pj4+IHNi
aS0+bWF4X29wZW5fem9uZXMgYXMgVUlOVF9NQVguCj4+Pj4+Pgo+Pj4+Pj4gcm9vdEBmZWRvcmEt
dm06fiMgY2F0IC9zeXMvYmxvY2svbnZtZTBuMS9xdWV1ZS96b25lZAo+Pj4+Pj4gaG9zdC1tYW5h
Z2VkCj4+Pj4+PiByb290QGZlZG9yYS12bTp+IyBjYXQgL3N5cy9ibG9jay9udm1lMG4xL3F1ZXVl
L21heF9vcGVuX3pvbmVzCj4+Pj4+PiAwCj4+Pj4+PiByb290QGZlZG9yYS12bTp+IyBta2ZzLmYy
ZnMgLW0gLWMgL2Rldi9udm1lMG4xIC9kZXYvdmRhCj4+Pj4+PiByb290QGZlZG9yYS12bTp+IyBt
b3VudCAvZGV2L3ZkYSAvbW50L2YyZnMvCj4+Pj4+PiByb290QGZlZG9yYS12bTp+IyBjYXQgL3N5
cy9mcy9mMmZzL3ZkYS9tYXhfb3Blbl96b25lcwo+Pj4+Pj4gNDI5NDk2NzI5NQo+Pj4+Pj4KPj4+
Pj4+IFRoZSByb290IGNhdXNlIGlzIHRoYXQgc2JpLT5tYXhfb3Blbl96b25lcyBpcyBpbml0aWFs
aXplZCB0byBVSU5UX01BWAo+Pj4+Pj4gYW5kIG9ubHkgdXBkYXRlZCB3aGVuIHRoZSBkZXZpY2Xi
gJlzIG1heF9vcGVuX3pvbmVzIGlzIGdyZWF0ZXIgdGhhbiAwLgo+Pj4+Pj4gSG93ZXZlciwgYm90
aCB0aGUgc2NzaSBkcml2ZXIgKHNkX3piY19yZWFkX3pvbmVzIG1heSBhc3NpZ25zIDAgdG8KPj4+
Pj4+IGRldmljZSdzIG1heF9vcGVuX3pvbmVzKSBhbmQgdGhlIG52bWUgZHJpdmVyIChudm1lX3F1
ZXJ5X3pvbmVfaW5mbyAKPj4+Pj4+IGRvbid0Cj4+Pj4+PiBjaGVjayBtYXhfb3Blbl96b25lcykg
YWxsb3cgbWF4X29wZW5fem9uZXMgdG8gYmUgMC4KPj4+Pj4+Cj4+Pj4+PiBUaGlzIHBhdGNoIGZp
eGVzIHRoZSBpc3N1ZSBieSBwcmV2ZW50aW5nIG1vdW50aW5nIG9uIHpvbmVkIFNTRHMgd2hlbgo+
Pj4+Pj4gbWF4X29wZW5fem9uZXMgaXMgMCwgd2hpbGUgc3RpbGwgYWxsb3dpbmcgU01SIEhERHMg
dG8gYmUgbW91bnRlZC4KPj4+Pj4+IGluaXRfYmxrel9pbmZvKCkgaXMgb25seSBjYWxsZWQgYnkg
ZjJmc19zY2FuX2RldmljZXMoKSwgYW5kIHRoZQo+Pj4+Pj4gYmxrem9uZWQgZmVhdHVyZSBoYXMg
YWxyZWFkeSBiZWVuIGNoZWNrZWQgdGhlcmUuIFNvLCB0aGlzIHBhdGNoIGFsc28KPj4+Pj4+IHJl
bW92ZSByZWR1bmRhbnQgem9uZWQgZGV2aWNlIGNoZWNrcy4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBZb25ncGVuZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4+Pj4+IC0t
LQo+Pj4+Pj4gwqDCoCBmcy9mMmZzL3N1cGVyLmMgfCAzNiArKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0KPj4+Pj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMo
KyksIDE1IGRlbGV0aW9ucygtKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1
cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPj4+Pj4+IGluZGV4IGRiN2FmYjgwNjQxMS4uNmRjODk0
NWUyNGFmIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9zdXBlci5jCj4+Pj4+PiArKysgYi9m
cy9mMmZzL3N1cGVyLmMKPj4+Pj4+IEBAIC00MzUzLDIxICs0MzUzLDYgQEAgc3RhdGljIGludCBp
bml0X2Jsa3pfaW5mbyhzdHJ1Y3QgZjJmc19zYl9pbmZvCj4+Pj4+PiAqc2JpLCBpbnQgZGV2aSkK
Pj4+Pj4+IMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgbWF4X29wZW5fem9uZXM7Cj4+Pj4+PiDC
oMKgwqDCoMKgwqAgaW50IHJldDsKPj4+Pj4+IC3CoMKgwqAgaWYgKCFmMmZzX3NiX2hhc19ibGt6
b25lZChzYmkpKQo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pj4+Pj4gLQo+Pj4+
Pj4gLcKgwqDCoCBpZiAoYmRldl9pc196b25lZChGREVWKGRldmkpLmJkZXYpKSB7Cj4+Pj4+PiAt
wqDCoMKgwqDCoMKgwqAgbWF4X29wZW5fem9uZXMgPSBiZGV2X21heF9vcGVuX3pvbmVzKGJkZXYp
Owo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGlmIChtYXhfb3Blbl96b25lcyAmJiAobWF4X29wZW5f
em9uZXMgPCBzYmktIAo+Pj4+Pj4gPm1heF9vcGVuX3pvbmVzKSkKPj4+Pj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHNiaS0+bWF4X29wZW5fem9uZXMgPSBtYXhfb3Blbl96b25lczsKPj4+Pj4+
IC3CoMKgwqDCoMKgwqDCoCBpZiAoc2JpLT5tYXhfb3Blbl96b25lcyA8IEYyRlNfT1BUSU9OKHNi
aSkuYWN0aXZlX2xvZ3MpIHsKPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfZXJy
KHNiaSwKPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgInpvbmVkOiBtYXgg
b3BlbiB6b25lcyAldSBpcyB0b28gc21hbGwsIG5lZWQgYXQKPj4+Pj4+IGxlYXN0ICV1IG9wZW4g
em9uZXMiLAo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzYmktPm1heF9v
cGVuX3pvbmVzLCBGMkZTX09QVElPTihzYmkpLmFjdGl2ZV9sb2dzKTsKPj4+Pj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIH0K
Pj4+Pj4+IC3CoMKgwqAgfQo+Pj4+Pj4gLQo+Pj4+Pj4gwqDCoMKgwqDCoMKgIHpvbmVfc2VjdG9y
cyA9IGJkZXZfem9uZV9zZWN0b3JzKGJkZXYpOwo+Pj4+Pj4gwqDCoMKgwqDCoMKgIGlmIChzYmkt
PmJsb2Nrc19wZXJfYmxreiAmJiBzYmktPmJsb2Nrc19wZXJfYmxreiAhPQo+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNFQ1RPUl9UT19CTE9DSyh6b25lX3NlY3Rv
cnMpKQo+Pj4+Pj4gQEAgLTQzNzgsNiArNDM2MywyNyBAQCBzdGF0aWMgaW50IGluaXRfYmxrel9p
bmZvKHN0cnVjdCBmMmZzX3NiX2luZm8KPj4+Pj4+ICpzYmksIGludCBkZXZpKQo+Pj4+Pj4gwqDC
oMKgwqDCoMKgIGlmIChucl9zZWN0b3JzICYgKHpvbmVfc2VjdG9ycyAtIDEpKQo+Pj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqAgRkRFVihkZXZpKS5ucl9ibGt6Kys7Cj4+Pj4+PiArwqDCoMKgIG1h
eF9vcGVuX3pvbmVzID0gYmRldl9tYXhfb3Blbl96b25lcyhiZGV2KTsKPj4+Pj4+ICvCoMKgwqAg
aWYgKCFtYXhfb3Blbl96b25lcykgewo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC8qCj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqDCoCAqIFNTRHMgcmVxdWlyZSBtYXhfb3Blbl96b25lcyA+IDAgdG8gYmUg
bW91bnRhYmxlLgo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBGb3IgSEREcywgaWYgbWF4X29w
ZW5fem9uZXMgaXMgcmVwb3J0ZWQgYXMgMCwgaXQgZG9lc24ndAo+Pj4+Pj4gbWF0dGVyLAo+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBzZXQgaXQgdG8gRkRFVihkZXZpKS5ucl9ibGt6Lgo+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoYmRldl9u
b25yb3QoYmRldikpIHsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfZXJyKHNi
aSwgInpvbmVkOiBTU0QgZGV2aWNlICVzIHdpdGhvdXQgb3BlbiB6b25lcyIsCj4+Pj4+PiBGREVW
KGRldmkpLnBhdGgpOwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5W
QUw7Cj4+Pj4KPj4+PiBPaCwgc28sIGZvciBjb252ZW50aW9uYWwgVUZTLCBpdCB3aWxsIGdvIGlu
dG8gdGhpcyBwYXRoIGFzIFNTRCB3LyB6ZXJvCj4+Pj4gb3BlbiB6b25lPwo+Pj4+Cj4+Pj4gQW55
IHdheSB0byBkaXN0aW5ndWlzaCB0aGF0Pwo+Pj4+Cj4+Pj4gVGhhbmtzLAo+Pj4+Cj4+Pgo+Pj4g
c2JpLT5tYXhfb3Blbl96b25lcyBtaWdodCBiZSBjbGFzc2lmaWVkIGludG8gNCBjYXNlczoKPj4+
Cj4+PiAxLiBGb3Igbm9uIHJvdGF0aW9uYWwgZGV2aWNlcyB0aGF0IGhhdmUgYm90aCBjb252ZW50
aW9uYWwgem9uZXMgYW5kCj4+PiBzZXF1ZW50aWFsIHpvbmVzLCB3ZSBzaG91bGQgc3RpbGwgZW5z
dXJlIHRoYXQgbWF4X29wZW5fem9uZXMgPiAwLiBJZiB0aGUKPj4+ICMgb2Ygc2VxdWVudGlhbCB6
b25lcyBleGNlZWRzIG1heF9vcGVuX3pvbmVzLCB3ZSBzdGlsbCBuZWVkIHRvIGd1YXJhbnRlZQo+
Pj4gdGhhdCBtYXhfb3Blbl96b25lcyA+PSBGMkZTX09QVElPTihzYmkpLmFjdGl2ZV9sb2dzLgo+
Pj4KPj4+IEkgdGVzdGVkIHRoaXMgd2l0aCBudWxsX2JsayBieSBlbXVsYXRpbmcgYSBkZXZpY2Ug
dGhhdCBoYXMgMTAKPj4+IGNvbnZlbnRpb25hbCB6b25lcyBhbmQgNCBzZXF1ZW50aWFsIHpvbmVz
LCBhbmQgdGhlIGZpbGVzeXN0ZW0gY2FuIGJlCj4+PiBmb3JtYXR0ZWQgc3VjY2Vzc2Z1bGx5LiBJ
biB0aGlzIGNhc2UsIHRoZSBmaWxlc3lzdGVtIHNob3VsZCBhbHNvIGJlCj4+PiBtb3VudGFibGUs
IGFuZCBzYmktPm1heF9vcGVuX3pvbmVzIHNob3VsZCBiZSAxNC4gSG93ZXZlciwgaWYKPj4+IHpv
bmVfbWF4X29wZW4gaXMgc2V0IHRvIDMsIHRoZSBmaWxlc3lzdGVtIGNhbm5vdCBiZSBtb3VudGVk
Lgo+Pj4KPj4+ICNtb2Rwcm9iZSBudWxsX2JsayBucl9kZXZpY2VzPTEgem9uZWQ9McKgIHpvbmVf
bnJfY29udj0xMMKgIHpvbmVfc2l6ZT0xMDI0Cj4+PiBnYj0xNCBicz00MDk2IHJvdGF0aW9uYWw9
MCB6b25lX21heF9vcGVuPTQKPj4+ICNta2ZzLmYyZnMgLW0gLWMgL2Rldi9udWxsYjAgL2Rldi92
ZGEgLWYKPj4+Cj4+PiBTbywgc2JpLT5tYXhfb3Blbl96b25lcyBtaWdodCBiZSAjIG9mIG1heF9v
cGVuX3pvbmVzIG9yICcjIG9mIHNlcXVlbnRpYWwKPj4+IHpvbmVzJyArICcjIG9mIGNvbnZlbnRp
b25hbCB6b25lcycuCj4+PgoKVGhpcyBzY2VuYXJpbyBoYXMgYWxyZWFkeSBhY2NvdW50ZWQgZm9y
IGluIGRpc2tfdXBkYXRlX3pvbmVfcmVzb3VyY2VzKCkuCk15IGVhcmxpZXIgdW5kZXJzdGFuZGlu
ZyB3YXMgaW5jb3JyZWN0LiBsaW0ubWF4X29wZW5fem9uZXMgPT0gMAppbmRpY2F0ZXMgbm8gb3Bl
biB6b25lcyBsaW1pdHRlZC4gU29ycnkgZm9yIGJvdGhlcmluZy4KCi8qCiAgKiBTb21lIGRldmlj
ZXMgY2FuIGFkdmVydGlzZSB6b25lIHJlc291cmNlIGxpbWl0cyB0aGF0IGFyZSBsYXJnZXIgdGhh
biAKCiAgKiB0aGUgbnVtYmVyIG9mIHNlcXVlbnRpYWwgem9uZXMgb2YgdGhlIHpvbmVkIGJsb2Nr
IGRldmljZSwgZS5nLiBhIAoKICAqIHNtYWxsIFpOUyBuYW1lc3BhY2UuIEZvciBzdWNoIGNhc2Us
IGFzc3VtZSB0aGF0IHRoZSB6b25lZCBkZXZpY2UgaGFzIAoKICAqIG5vIHpvbmUgcmVzb3VyY2Ug
bGltaXRzLgogICovCm5yX3NlcV96b25lcyA9IGRpc2stPm5yX3pvbmVzIC0gYXJncy0+bnJfY29u
dl96b25lczsgCgppZiAobGltLm1heF9vcGVuX3pvbmVzID49IG5yX3NlcV96b25lcykKCWxpbS5t
YXhfb3Blbl96b25lcyA9IDA7CgpZb25ncGVuZywKCj4+PiAyLiBGb3Igbm9uIHJvdGF0aW9uYWwg
ZGV2aWNlcyB3aGljaCBvbmx5IGhhdmUgY29udmVudGlvbmFsIHpvbmVzLCBJJ20KPj4+IG5vdCBz
dXJlIHdoZXRoZXIgdGhlcmUgYXJlIHpvbmVkIGZsYXNoIGRldmljZXMgdGhhdCBwcm92aWRlIG9u
bHkKPj4KPj4gSSBndWVzcyB0aGlzIGlzIGEgc2ltaWxhciBjYXNlLCB3ZSBzaG91bGQgbm90IGxl
dCBtb3VudCgpIGZhaWwgZm9yIAo+PiBzdWNoIGNhc2UsCj4+IHJpZ2h0Pwo+IAo+IFllcywgaXQg
c2hvdWxkIGJlIG1vdXRhYmxlLiBJJ2xsIHRha2UgYWxsIHRoZXNlIGNhc2VzIGludG8gYWNjb3Vu
dCBpbgo+IHRoZSB2MyBwYXRjaC4KPiAKCk5vIGNoYW5nZXMgcmVxdWlyZWQuCgo+Pgo+PiAtIG1v
ZHByb2JlIG51bGxfYmxrIG5yX2RldmljZXM9MSB6b25lZD0xIHpvbmVfbnJfY29udj01MTIgem9u
ZV9zaXplPTIgXAo+PiBnYj0xIGJzPTQwOTYgcm90YXRpb25hbD0wIHpvbmVfbWF4X29wZW49Ngo+
IAo+IFRoaXMgc2NlbmFyaW8gY2Fubm90IGJlIGVtdWxhdGVkIHdpdGggbnVsbF9ibGsuIFRoZXJl
IG11c3QgYmUgYXQgbGVhc3QgMQo+IHNlcXVlbnRpYWwgem9uZSwgYW5kIHpvbmVfbWF4X29wZW4g
aXMgZ3JlYXRlciB0aGFuICMgb2Ygc2VxdWVudGlhbAo+IHpvbmVzLCB3aGVyZWFzIGluIHJlYWxp
dHkgbWF4X29wZW5fem9uZXMgaXMgMC4KPiAKPiBZb25ncGVuZywKPiAKPj4gLSBta2ZzLmYyZnMg
LW0gL2Rldi9udWxsYjAKPj4gLSBtb3VudCAvZGV2L251bGxiMCAvbW50L2YyZnMKPj4KPj4gVGhh
bmtzLAo+Pgo+Pj4gY29udmVudGlvbmFsIHpvbmVzLiBJZiBzdWNoIGRldmljZXMgZG8gZXhpc3Qs
IHRoZW4gcmV0dXJuaW5nIC1FSU5WQUwgaXMKPj4+IGluZGVlZCBub3QgYXBwcm9wcmlhdGUuIHNi
aS0+bWF4X29wZW5fem9uZXMgc2hvdWxkIGJlICMgb2YgY29udmVudGlvbmFsCj4+PiB6b25lcy4K
Pj4+Cj4+PiAzLiBGb3Igbm9uIHJvdGF0aW9uYWwgZGV2aWNlcyB3aGljaCBvbmx5IGhhdmUgc2Vx
dWVudGlhbCB6b25lcywgc2JpLQo+Pj4+IG1heF9vcGVuX3pvbmVzIHNob3VsZCBiZSAjIG1heF9v
cGVuX3pvbmVzLgo+Pj4KPj4+IDQuIEZvciByb3RhdGlvbmFsIGRldmljZXMsIHNiaS0+bWF4X29w
ZW5fem9uZXMgc2hvdWxkIGJlICMgem9uZXMgb3IKPj4+IG1heF9vcGVuX3pvbmVzLgo+Pj4KPj4+
IEFtIEkgbWlzc2luZyBhbnkgb3RoZXIgY2FzZXM/Cj4+Pgo+Pj4gWW9uZ3BlbmcsCj4+Pgo+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBtYXhfb3Blbl96b25l
cyA9IEZERVYoZGV2aSkubnJfYmxrejsKPj4+Pj4+ICvCoMKgwqAgfQo+Pj4+Pj4gK8KgwqDCoCBz
YmktPm1heF9vcGVuX3pvbmVzID0gbWluX3QodW5zaWduZWQgaW50LCBtYXhfb3Blbl96b25lcywg
c2JpLQo+Pj4+Pj4+IG1heF9vcGVuX3pvbmVzKTsKPj4+Pj4+ICvCoMKgwqAgaWYgKHNiaS0+bWF4
X29wZW5fem9uZXMgPCBGMkZTX09QVElPTihzYmkpLmFjdGl2ZV9sb2dzKSB7Cj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgZjJmc19lcnIoc2JpLAo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
InpvbmVkOiBtYXggb3BlbiB6b25lcyAldSBpcyB0b28gc21hbGwsIG5lZWQgYXQgbGVhc3QgJXUK
Pj4+Pj4+IG9wZW4gem9uZXMiLAo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2JpLT5t
YXhfb3Blbl96b25lcywgRjJGU19PUFRJT04oc2JpKS5hY3RpdmVfbG9ncyk7Cj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+PiArwqDCoMKgIH0KPj4+Pj4+ICsKPj4+
Pj4+IMKgwqDCoMKgwqDCoCBGREVWKGRldmkpLmJsa3pfc2VxID0gZjJmc19rdnphbGxvYyhzYmks
Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCSVRT
X1RPX0xPTkdTKEZERVYoZGV2aSkubnJfYmxreikKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogc2l6ZW9mKHVuc2lnbmVkIGxvbmcpLAo+Pj4+Pj4g
LS0gCj4+Pj4+PiAyLjQzLjAKPj4+Cj4+Pgo+Pgo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdAo+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+PiBodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4g
Cj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
