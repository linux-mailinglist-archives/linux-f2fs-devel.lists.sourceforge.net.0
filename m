Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93929C44D74
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Nov 2025 04:34:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kY6d9NIWaPqOUEaXUdLhoq7vrDGhsUQ6XVu/YxAOKd0=; b=L9RGlQYaHBFIJXSZv7CupVPAia
	17YFo7NJcdUpXA6WdfvtmwEKSHFf0/Xxm/CgeTkkh3KQwKD9/12zRAM7dvgR4EtP3ZnGc+ypmLtNo
	9TBBtuzMKtbWJGYZt27qDTLK35D5r1hTqaym+IBw6b1jipSAq4JAx7wUJFIem3x/pRYs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIIfZ-0004Eq-68;
	Mon, 10 Nov 2025 03:34:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vIIfC-0004Ci-Ry
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 03:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1uv/eG/riHfn2pJuFd2Lmq74ujbSL86nmeL8TTEjQmc=; b=ieOpSVP3zvW8mKcTyHZVevfl9v
 6pDJ2Gc3un6z+dLvEI43vXy71QKdZPXF3gqdEzrnde2/rCqsD8o+Cpo+8np+JIj1cLuRBMxqgm2NC
 koxK4gHgjzwynqxTqrrQEZITxdB6C5tCbQrjjocySkiZWAhPkOGQAADPOE3EcsqeWr6c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1uv/eG/riHfn2pJuFd2Lmq74ujbSL86nmeL8TTEjQmc=; b=T/1okF3TqCDqPUhnJTkxIC6n8Y
 e//Fmy9/4BCIUD9ctxyFSESjRfuhqqFMcSlVO8p5vRjh/gOM9x6JMDNVVdejh+20rUenzloOmGt7T
 6saqkmXuDmijWIwwRlRN5bSuQRyQAjcpzQ1v/MdOt2KaBJnesEZT8Br9NStWPe3xQQTs=;
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vIIfD-0000Ac-3N for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 03:33:55 +0000
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-7af603c06easo2244403b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 09 Nov 2025 19:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762745624; x=1763350424; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1uv/eG/riHfn2pJuFd2Lmq74ujbSL86nmeL8TTEjQmc=;
 b=Y7q5dMJr0WmH/+eqqP9osWNVbXiKjTCC5Eq22YAXJvlmMCk9gQE4syfuuUYT8nR7d4
 hK28RNeLu/u62cNok1007W04O1tA4AqMto3NSqBwbB/Bi5JTWnhIVtaaSToGdSp3YGk/
 aEmMLQlL8tFUa8PsJVLqG0eXzgmRTxkExU8JnxE/g7KSMj0wslvQMBGJ3Mu18cTKV7Sj
 Kj8J+ZL4F1iYgdQeXQ7zcINtAj1dDnG0z/qg2ghctf+f44raNGKVIhmLp8sx0EMigz4m
 p52+MtP4FX1F/3xlsXX+XRnzzBgSMBc7NOZTF2vv67gG9hIgHYwgr/r2XsPqd92p5oj0
 U6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762745624; x=1763350424;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1uv/eG/riHfn2pJuFd2Lmq74ujbSL86nmeL8TTEjQmc=;
 b=A6/XQH81rXYxlnvz3/yrfkEbeEL1H5jOvP3Y18EskvX7GHG2dA9Z2Gn8KDcGo2aloo
 BmY6m9Yh5WUOtpS2riRZPIXzOplyIhE82tLLqzZehAX7x/WIHxTPM5+2rW2Tm/sk8yfJ
 atKP7fxAc2EDqZCXcNBHefeY80aFEIKeZW6f7ehLHe9eV62YGVPE2sjuMBTcgJj3RB+p
 v+Ly5hFh5cUjKt6KMlb9lZN4iH4e9lPEiZo0Nn8B3UuTE0hSELamnPEZ20+uVS63A1/f
 hyhuGCyBZ3WMHDqBww1JrdISAzYfW1m1wvf9PBdvt34idq6ZF78hRCNcj1vluDmk7cLB
 ktBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtAMqbTZ/vw+YBQild2PC5bIEWN1A0OfEVY8F61taqIQl47IIcz++b2FWVAcQ3LejIxUEM6Sx3fsIZW+OblJJ6@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyJJkcA9iDJwfJ5v/gCklVx9SbgGsLFM3vFH/+NT15enYeuiK2P
 iEKxqYkv7ahFXhSNiF3UWnc7wzwKoCZgUI+0pm6PXXWJ5ZF399qz4Jdo
X-Gm-Gg: ASbGnctkyc5zFEiJB5YI2RQHKnRNsGqN5p4T99aR/GD10AesP0+pXfF+whKIm2n1b6O
 FtvHiREwlXzv507s1FWLY+xr9aINQ+1ey3/BZ1CwKzNvwvIU+XkHALKZEld/hC/5FIIc2w4COow
 IeJyoEmYaICWpq4NY1AsreZJACG41ySzo2Z2K0VII4OQXBR3OBJc1KydG4Gd+sJvcSUkHn6qH0a
 EHFXD4ZyvFlDGiW347Cb4GkKnPV0n4lIS5o9LmWlKYuFylgbHpG74QmwIOUxhnBStl+GhfUVbE2
 unAWksjbhsRrgSzgfyUOjbsL9/RKHwnvU8YinK7QIHqeNov1dInFJkKJZFHgtS3iQuaRDOhzPbf
 egC4huU+EjYIdV2Cv1FSnLmalE7T2agXkS8dbCKhUwnudRvxkEsEhLJx5GC3T9Tgg8BtWfhPVzN
 kUh3/VUcEpM+BXvWu3U1KSQ4pUduBMvxv9ZRVZGGEgUlpV
X-Google-Smtp-Source: AGHT+IFUssgVXA+MV3m6N7sZ1rITVAJSj9tFgP4QCyrTa6GWZnutCKVCVkuxV8ikvbUEHiyjce9wbA==
X-Received: by 2002:a05:6a00:1a8e:b0:78a:f6be:74f2 with SMTP id
 d2e1a72fcca58-7b218103464mr8815363b3a.5.1762745624247; 
 Sun, 09 Nov 2025 19:33:44 -0800 (PST)
Received: from [10.189.138.37] ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b0ca1e7595sm9835077b3a.33.2025.11.09.19.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Nov 2025 19:33:43 -0800 (PST)
Message-ID: <148fec72-47c1-4943-a60e-ceec6375488e@gmail.com>
Date: Mon, 10 Nov 2025 11:33:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Yongpeng Yang
 <yangyongpeng.storage@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251106091537.3063566-1-yangyongpeng.storage@gmail.com>
 <2d7f92f9-41ba-499a-85c5-ed5b24a08866@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
In-Reply-To: <2d7f92f9-41ba-499a-85c5-ed5b24a08866@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/8/25 10:41, Chao Yu via Linux-f2fs-devel wrote: > On
 2025/11/6 17:15,
 Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> sbi->unusable_blocks_per_sec
 is used only within CONFIG_BLK_DEV_ZONED > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vIIfD-0000Ac-3N
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: rename and refactor
 sbi->unusable_blocks_per_sec
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ck9uIDExLzgvMjUgMTA6NDEsIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4g
T24gMjAyNS8xMS82IDE3OjE1LCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+PiBGcm9tOiBZb25ncGVu
ZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4KPj4gc2JpLT51bnVzYWJsZV9ibG9j
a3NfcGVyX3NlYyBpcyB1c2VkIG9ubHkgd2l0aGluIENPTkZJR19CTEtfREVWX1pPTkVECj4+IHNl
Y3Rpb25zLCBleGNlcHQgZm9yIENBUF9CTEtTX1BFUl9TRUMgYW5kIENBUF9TRUdTX1BFUl9TRUMu
IFRoaXMgcGF0Y2gKPj4gcmVuYW1lcyB1bnVzYWJsZV9ibG9ja3NfcGVyX3NlYyB0byB1bnVzYWJs
ZV9ibG9ja3NfcGVyX2Jsa3ogYW5kIGVuc3VyZXMKPj4gdGhhdCB1bnVzYWJsZV9ibG9ja3NfcGVy
X2Jsa3ogaXMgcHJvcGVybHkgZW5jbG9zZWQgd2l0aGluIHRoZQo+PiBDT05GSUdfQkxLX0RFVl9a
T05FRC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhp
YW9taS5jb20+Cj4+IC0tLQo+PiDCoCBmcy9mMmZzL2YyZnMuaMKgwqDCoCB8IDIgKy0KPj4gwqAg
ZnMvZjJmcy9zZWdtZW50LmMgfCAzICstLQo+PiDCoCBmcy9mMmZzL3NlZ21lbnQuaCB8IDkgKysr
KysrKy0tCj4+IMKgIGZzL2YyZnMvc3VwZXIuY8KgwqAgfCA2ICsrKy0tLQo+PiDCoCBmcy9mMmZz
L3N5c2ZzLmPCoMKgIHwgNCArKy0tCj4+IMKgIDUgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9u
cygrKSwgMTAgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBi
L2ZzL2YyZnMvZjJmcy5oCj4+IGluZGV4IDViNGU5NTQ4YTIzMS4uYzQ3YTA5YzdmN2U3IDEwMDY0
NAo+PiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+PiArKysgYi9mcy9mMmZzL2YyZnMuaAo+PiBAQCAt
MTY2MSw2ICsxNjYxLDcgQEAgc3RydWN0IGYyZnNfc2JfaW5mbyB7Cj4+IMKgICNpZmRlZiBDT05G
SUdfQkxLX0RFVl9aT05FRAo+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBibG9ja3NfcGVyX2Js
a3o7wqDCoMKgwqDCoMKgwqAgLyogRjJGUyBibG9ja3MgcGVyIHpvbmUgKi8KPj4gK8KgwqDCoCB1
bnNpZ25lZCBpbnQgdW51c2FibGVfYmxvY2tzX3Blcl9ibGt6O8KgwqDCoCAvKiBGMkZTIHVudXNh
YmxlIGJsb2NrcyAKPj4gcGVyIHpvbmUgKi8KPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgbWF4
X29wZW5fem9uZXM7wqDCoMKgwqDCoMKgwqAgLyogbWF4IG9wZW4gem9uZSByZXNvdXJjZXMgCj4+
IG9mIHRoZSB6b25lZCBkZXZpY2UgKi8KPj4gwqDCoMKgwqDCoCAvKiBGb3IgYWRqdXN0IHRoZSBw
cmlvcml0eSB3cml0aW5nIHBvc2l0aW9uIG9mIGRhdGEgaW4gem9uZSBVRlMgKi8KPj4gwqDCoMKg
wqDCoCB1bnNpZ25lZCBpbnQgYmxrem9uZV9hbGxvY19wb2xpY3k7Cj4+IEBAIC0xNzMyLDcgKzE3
MzMsNiBAQCBzdHJ1Y3QgZjJmc19zYl9pbmZvIHsKPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQg
bWV0YV9pbm9fbnVtO8KgwqDCoMKgwqDCoMKgIC8qIG1ldGEgaW5vZGUgbnVtYmVyKi8KPj4gwqDC
oMKgwqDCoCB1bnNpZ25lZCBpbnQgbG9nX2Jsb2Nrc19wZXJfc2VnO8KgwqDCoCAvKiBsb2cyIGJs
b2NrcyBwZXIgc2VnbWVudCAqLwo+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBibG9ja3NfcGVy
X3NlZzvCoMKgwqDCoMKgwqDCoCAvKiBibG9ja3MgcGVyIHNlZ21lbnQgKi8KPj4gLcKgwqDCoCB1
bnNpZ25lZCBpbnQgdW51c2FibGVfYmxvY2tzX3Blcl9zZWM7wqDCoMKgIC8qIHVudXNhYmxlIGJs
b2NrcyBwZXIgCj4+IHNlY3Rpb24gKi8KPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgc2Vnc19w
ZXJfc2VjO8KgwqDCoMKgwqDCoMKgIC8qIHNlZ21lbnRzIHBlciBzZWN0aW9uICovCj4+IMKgwqDC
oMKgwqAgdW5zaWduZWQgaW50IHNlY3NfcGVyX3pvbmU7wqDCoMKgwqDCoMKgwqAgLyogc2VjdGlv
bnMgcGVyIHpvbmUgKi8KPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgdG90YWxfc2VjdGlvbnM7
wqDCoMKgwqDCoMKgwqAgLyogdG90YWwgc2VjdGlvbiBjb3VudCAqLwo+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+PiBpbmRleCBiNDVlYWNlODc5
ZDcuLjU0YWQ3NzRlZTMzOCAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMKPj4gKysr
IGIvZnMvZjJmcy9zZWdtZW50LmMKPj4gQEAgLTU1NjcsNyArNTU2Nyw3IEBAIHN0YXRpYyBpbmxp
bmUgdW5zaWduZWQgaW50IAo+PiBmMmZzX3VzYWJsZV96b25lX2Jsa3NfaW5fc2VnKAo+PiDCoMKg
wqDCoMKgIGJsb2NrX3Qgc2VnX3N0YXJ0LCBzZWNfc3RhcnRfYmxrYWRkciwgc2VjX2NhcF9ibGth
ZGRyOwo+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBzZWNubzsKPj4gLcKgwqDCoCBpZiAoIXNi
aS0+dW51c2FibGVfYmxvY2tzX3Blcl9zZWMpCj4+ICvCoMKgwqAgaWYgKCFzYmktPnVudXNhYmxl
X2Jsb2Nrc19wZXJfYmxreikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBCTEtTX1BFUl9T
RUcoc2JpKTsKPj4gwqDCoMKgwqDCoCBzZWNubyA9IEdFVF9TRUNfRlJPTV9TRUcoc2JpLCBzZWdu
byk7Cj4+IEBAIC01NTk5LDcgKzU1OTksNiBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCAK
Pj4gZjJmc191c2FibGVfem9uZV9ibGtzX2luX3NlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkK
Pj4gwqAgewo+PiDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiDCoCB9Cj4+IC0KPj4gwqAgI2VuZGlm
Cj4+IMKgIHVuc2lnbmVkIGludCBmMmZzX3VzYWJsZV9ibGtzX2luX3NlZyhzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmksCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB1bnNpZ25lZCBpbnQgc2Vnbm8pCj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuaCBi
L2ZzL2YyZnMvc2VnbWVudC5oCj4+IGluZGV4IDFjZTJjOGFiYWY0OC4uMGExY2E5MjljZTFhIDEw
MDY0NAo+PiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuaAo+PiArKysgYi9mcy9mMmZzL3NlZ21lbnQu
aAo+PiBAQCAtNjksMTEgKzY5LDE2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzYW5pdHlfY2hlY2tf
c2VnX3R5cGUoc3RydWN0IAo+PiBmMmZzX3NiX2luZm8gKnNiaSwKPj4gwqDCoMKgwqDCoCAoKCFf
X2lzX3ZhbGlkX2RhdGFfYmxrYWRkcihibGtfYWRkcikpID/CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFwKPj4gwqDCoMKgwqDCoCBOVUxMX1NFR05PIDogR0VUX0wyUl9TRUdOTyhGUkVFX0koc2JpKSzC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIEdFVF9TRUdOT19G
Uk9NX1NFRzAoc2JpLCBibGtfYWRkcikpKQo+PiArI2lmZGVmIENPTkZJR19CTEtfREVWX1pPTkVE
Cj4+IMKgICNkZWZpbmUgQ0FQX0JMS1NfUEVSX1NFQyhzYmkpwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgXAo+PiAtwqDCoMKgIChCTEtTX1BFUl9TRUMoc2JpKSAtIChzYmkp
LT51bnVzYWJsZV9ibG9ja3NfcGVyX3NlYykKPj4gK8KgwqDCoCAoQkxLU19QRVJfU0VDKHNiaSkg
LSAoc2JpKS0+dW51c2FibGVfYmxvY2tzX3Blcl9ibGt6KQo+PiDCoCAjZGVmaW5lIENBUF9TRUdT
X1BFUl9TRUMoc2JpKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4g
wqDCoMKgwqDCoCAoU0VHU19QRVJfU0VDKHNiaSkgLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFwKPj4gLcKgwqDCoCBCTEtTX1RPX1NFR1Moc2JpLCAoc2JpKS0+dW51c2Fi
bGVfYmxvY2tzX3Blcl9zZWMpKQo+PiArwqDCoMKgIEJMS1NfVE9fU0VHUyhzYmksIChzYmkpLT51
bnVzYWJsZV9ibG9ja3NfcGVyX2Jsa3opKQo+PiArI2Vsc2UKPj4gKyNkZWZpbmUgQ0FQX0JMS1Nf
UEVSX1NFQyhzYmkpIEJMS1NfUEVSX1NFQyhzYmkpCj4+ICsjZGVmaW5lIENBUF9TRUdTX1BFUl9T
RUMoc2JpKSBTRUdTX1BFUl9TRUMoc2JpKQo+PiArI2VuZGlmCj4+IMKgICNkZWZpbmUgR0VUX1NU
QVJUX1NFR19GUk9NX1NFQyhzYmksIHNlZ25vKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiDC
oMKgwqDCoMKgIChyb3VuZGRvd24oc2Vnbm8sIFNFR1NfUEVSX1NFQyhzYmkpKSkKPj4gwqAgI2Rl
ZmluZSBHRVRfU0VDX0ZST01fU0VHKHNiaSwgc2Vnbm8pwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFwKPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIu
Ywo+PiBpbmRleCBkYjdhZmI4MDY0MTEuLmMwNTUwMzI1OTNiNyAxMDA2NDQKPj4gLS0tIGEvZnMv
ZjJmcy9zdXBlci5jCj4+ICsrKyBiL2ZzL2YyZnMvc3VwZXIuYwo+PiBAQCAtNDMzMywxMSArNDMz
MywxMSBAQCBzdGF0aWMgaW50IGYyZnNfcmVwb3J0X3pvbmVfY2Ioc3RydWN0IGJsa196b25lIAo+
PiAqem9uZSwgdW5zaWduZWQgaW50IGlkeCwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAw
Owo+PiDCoMKgwqDCoMKgIHNldF9iaXQoaWR4LCByel9hcmdzLT5kZXYtPmJsa3pfc2VxKTsKPj4g
LcKgwqDCoCBpZiAoIXJ6X2FyZ3MtPnNiaS0+dW51c2FibGVfYmxvY2tzX3Blcl9zZWMpIHsKPj4g
LcKgwqDCoMKgwqDCoMKgIHJ6X2FyZ3MtPnNiaS0+dW51c2FibGVfYmxvY2tzX3Blcl9zZWMgPSB1
bnVzYWJsZV9ibG9ja3M7Cj4+ICvCoMKgwqAgaWYgKCFyel9hcmdzLT5zYmktPnVudXNhYmxlX2Js
b2Nrc19wZXJfYmxreikgewo+PiArwqDCoMKgwqDCoMKgwqAgcnpfYXJncy0+c2JpLT51bnVzYWJs
ZV9ibG9ja3NfcGVyX2Jsa3ogPSB1bnVzYWJsZV9ibG9ja3M7Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gMDsKPj4gwqDCoMKgwqDCoCB9Cj4+IC3CoMKgwqAgaWYgKHJ6X2FyZ3MtPnNiaS0+
dW51c2FibGVfYmxvY2tzX3Blcl9zZWMgIT0gdW51c2FibGVfYmxvY2tzKSB7Cj4+ICvCoMKgwqAg
aWYgKHJ6X2FyZ3MtPnNiaS0+dW51c2FibGVfYmxvY2tzX3Blcl9ibGt6ICE9IHVudXNhYmxlX2Js
b2Nrcykgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZjJmc19lcnIocnpfYXJncy0+c2JpLCAiRjJG
UyBzdXBwb3J0cyBzaW5nbGUgem9uZSBjYXBhY2l0eVxuIik7Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gLUVJTlZBTDsKPj4gwqDCoMKgwqDCoCB9Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZz
L3N5c2ZzLmMgYi9mcy9mMmZzL3N5c2ZzLmMKPj4gaW5kZXggNmQyYTRmYmE2OGEyLi45OGQyY2I2
MGU4MDYgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvc3lzZnMuYwo+PiArKysgYi9mcy9mMmZzL3N5
c2ZzLmMKPj4gQEAgLTEyMDksNyArMTIwOSw3IEBAIEYyRlNfU0JJX0dFTkVSQUxfUldfQVRUUihs
YXN0X2FnZV93ZWlnaHQpOwo+PiDCoCAvKiByZWFkIGV4dGVudCBjYWNoZSAqLwo+PiDCoCBGMkZT
X1NCSV9HRU5FUkFMX1JXX0FUVFIobWF4X3JlYWRfZXh0ZW50X2NvdW50KTsKPj4gwqAgI2lmZGVm
IENPTkZJR19CTEtfREVWX1pPTkVECj4+IC1GMkZTX1NCSV9HRU5FUkFMX1JPX0FUVFIodW51c2Fi
bGVfYmxvY2tzX3Blcl9zZWMpOwo+PiArRjJGU19TQklfR0VORVJBTF9ST19BVFRSKHVudXNhYmxl
X2Jsb2Nrc19wZXJfYmxreik7Cj4gCj4gWW9uZ3BlbmcsCj4gCj4gV2UgbmVlZCB0byBrZWVwIHVz
ZXJzcGFjZSBzeXNmcyBBUEkgc3RhYmxlLCBjYW4gd2Uga2VlcCB0aGUgb3JpZ2luYWwgbmFtZT8K
PiAKPiBUaGFua3MsCgpJIGFncmVlLCBJIGRpZG7igJl0IGNvbnNpZGVyIHRoZSB1c2Vyc3BhY2Ug
c3lzZnMgQVBJIHByZXZpb3VzbHkuIEnigJlsbApyZXZlcnQgdGhlIHJlbmFtaW5nIG9mIHRoZSB1
bnVzYWJsZV9ibG9ja3NfcGVyX3NlYyBpbiB0aGUgdjIgcGF0Y2gKCllvbmdwZW5nLAoKPiAKPj4g
wqAgRjJGU19TQklfR0VORVJBTF9SV19BVFRSKGJsa3pvbmVfYWxsb2NfcG9saWN5KTsKPj4gwqAg
I2VuZGlmCj4+IMKgIEYyRlNfU0JJX0dFTkVSQUxfUldfQVRUUihjYXJ2ZV9vdXQpOwo+PiBAQCAt
MTM4Myw3ICsxMzgzLDcgQEAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmYyZnNfYXR0cnNbXSA9
IHsKPj4gwqDCoMKgwqDCoCBBVFRSX0xJU1QoYXZnX3ZibG9ja3MpLAo+PiDCoCAjZW5kaWYKPj4g
wqAgI2lmZGVmIENPTkZJR19CTEtfREVWX1pPTkVECj4+IC3CoMKgwqAgQVRUUl9MSVNUKHVudXNh
YmxlX2Jsb2Nrc19wZXJfc2VjKSwKPj4gK8KgwqDCoCBBVFRSX0xJU1QodW51c2FibGVfYmxvY2tz
X3Blcl9ibGt6KSwKPj4gwqDCoMKgwqDCoCBBVFRSX0xJU1QoYmxrem9uZV9hbGxvY19wb2xpY3kp
LAo+PiDCoCAjZW5kaWYKPj4gwqAgI2lmZGVmIENPTkZJR19GMkZTX0ZTX0NPTVBSRVNTSU9OCj4g
Cj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
