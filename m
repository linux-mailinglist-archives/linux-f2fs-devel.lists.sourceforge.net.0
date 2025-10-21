Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 60247BF4DD3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Oct 2025 09:12:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26EOvlgIYp64WFHDijNt+gHbw+TAxknBZVvcGj2+pcA=; b=SWNCnaXf9faiTHm29pzMSyuEvg
	0sXh48qTXO6+E+xjeIMvSV65B7aPkPwQ4VLOZpKUOv6df2mB/gQcuvZj+8jRza0GvCUz5U3k6zfaT
	Csf0OMx3My4NCJYzDWEYQZcx7HCDVVw7kXA8IXOB2Y/lABjwqNkvTJMMa7HN87xSRQUU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vB6Xs-00020V-4q;
	Tue, 21 Oct 2025 07:12:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jeuk20.kim@gmail.com>) id 1vB6Xq-00020N-HR
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 07:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2Qt+4cDvPgX3lF8PjgvxPyZSbtTp9ulbbmZUT2eBPHA=; b=g4sP0xYdf1z8Iu/1f0tTTgCG+V
 YPCHnY5Vhq0+5hkEyry8mYFVxI3xbGTj7xLDKlCXXidSI6wQ2QMWouvibdweaQ6V+w35MuF+dAeK9
 eVv0qY0SDiPKpFU7gr1PgTGNa2sZCD/uGvB1xYBZgOTrreC4o3HSfTP7SQd3wF7/HbcU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2Qt+4cDvPgX3lF8PjgvxPyZSbtTp9ulbbmZUT2eBPHA=; b=Z9lUgv8IF2IQRwuMwT/wzBl96c
 7ueQD2z5fTS/6toicnFPJS+O+n8Hkwh+d6ycrnyKxOrfOVZSfVs5mbEzmet0M9Huiysygm+lUQDJR
 ZZXZfOvCeo1yae/GDxhjrvcodicla77/d7HfnxInTMpnraQno3j6ZR/xjzUJ5+UxtrCA=;
Received: from mail-pj1-f53.google.com ([209.85.216.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vB6Xq-0006r8-2k for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 07:12:34 +0000
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-33bb090aa78so4523757a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Oct 2025 00:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761030743; x=1761635543; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2Qt+4cDvPgX3lF8PjgvxPyZSbtTp9ulbbmZUT2eBPHA=;
 b=V61rafmIyUT6bTGtoQ/C6RPRfwFWqAwNmGQXJm2/JanqYVGIabZnXFXX+b8JtVbHzy
 z59RCZQcViQNGapdZhLk/bHPzPU7GwtURvEpv6GuRurHHB24RorH1lNo5iRmlgs0QV7d
 1b3FQDu9d2gYmBh6NvrLRsVS1BeaUbMQTLo5Eg7Mzl7FYBw0AY8W/yD5eZsiQgdjeF2b
 Pjow6UXyL0X3GJeUhbOUX/Ryi8j/t+z4M6N1cvwrWh8fnPiX6kjuzqu/IZtycfvL3j2F
 cGWPw3G7yv/0bp1KX/TN2cL/YKhlYyaHI10vLhZnzDUqHdqhHz4IbW//xTuD5oI7+XXy
 bnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761030743; x=1761635543;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Qt+4cDvPgX3lF8PjgvxPyZSbtTp9ulbbmZUT2eBPHA=;
 b=fLuxYWQOKqzlFaxk2IxpT0HDCtjAWVvs3DGISq51BdHM8k7ffjFoBoGpRvlUe2darD
 2ZBw3sMhkTvciEvBBGvT3tF3cGvH7aZqrVix6ApxTRekJ2W0cYulobAOrH28CQtaCrxD
 2YJ3lwC58gnUWAiNQvpp5eKE1nDuuLu39VcgELRDKuLltN8kD3/ZKjf3gxlb2xxGg17L
 XQ0HHaS9h6yVtvDJIoFPkfthVpX8bgza0jBimMFXzN2ZOd93K4RLCJ5faWk21h4PidFl
 NjToAP6jmWImM8QOGkpRQu0V4O/K7p27WJgIMUS2IgzIvVbiWyca1lpQU58PCoz+cxZF
 GvUg==
X-Gm-Message-State: AOJu0YxmKYugJFah0wX+un3ZNaJ0kQsEZJH7FK9oS9wTl8t7W9H6ACAx
 /qnNtRe/4OtqZdBbEF74TQYwuo9htJkoQFZkERNSBBW6lZzIIUb0Ad28qK0ykN/Z
X-Gm-Gg: ASbGncu7NE4Eg+vqck6xmLSnkG4FZXp72yLRfYTbHu/lLdl78mibtbTE/pZmjjrVvIT
 3D333N9gWjCUQTogvzi4m0WYBBGOAlTs7FhWku4obgAsR0EAvEH/htjGgJPB593AGCFxmp7wfDt
 IFXxYyr/cK2yamxBL5Zo0scrz0ofYiQGj1L8zexxrL1P8o9c+k1JGF7wyFoqM/CKYlKQF/bvHsC
 rlGLDsfp1vx+BHfOeEwkGtqctKjNcKigdsCAiYJ4/VUjtReO0eoc+swt3vewmXp5DQPAFG3nO9S
 NrVuxUyTheoIDrSczUXHTEjJKLrIb/9lx0r9baSwuQfRWaLMprTQqoVmZ/LpTr3Xx45GIBlEs09
 03VkhoePTc866QEwNdPTr5YTzOBBhyS0iXlHQWJjid+B30Z3Mkfs8FHaLO40rogg+cLmL2Mci/J
 NAW+0lDUyxt1+3IUjYLQ==
X-Google-Smtp-Source: AGHT+IHYtQqcmKB7yaQZvSOyk8N0Ik66n2fKAvbJQ2zFuAsou1ZH5dPCdBb1dBwC5saJJbcxPhd05g==
X-Received: by 2002:a17:90b:2fcc:b0:32d:d5f1:fe7f with SMTP id
 98e67ed59e1d1-33bcf89380bmr19665205a91.15.1761030743304; 
 Tue, 21 Oct 2025 00:12:23 -0700 (PDT)
Received: from [192.168.0.22] ([175.119.5.143])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33d5ddeaea7sm10174272a91.3.2025.10.21.00.12.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 00:12:22 -0700 (PDT)
Message-ID: <a4bcf251-e1cf-47ef-84df-5c43b2b288c0@gmail.com>
Date: Tue, 21 Oct 2025 16:12:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: ko
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20251016051621.7425-1-jeuk20.kim@gmail.com>
 <5257fece-d947-4a33-8f66-4db5e8b73a28@kernel.org>
 <e26ec66d-36db-429f-befb-8baad14779d9@gmail.com>
 <75d0a52d-1662-45f9-ab67-909b906004b3@kernel.org>
From: Jeuk Kim <jeuk20.kim@gmail.com>
In-Reply-To: <75d0a52d-1662-45f9-ab67-909b906004b3@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/21/2025 3:51 PM, Chao Yu wrote: > On 10/21/25 11:33,
 Jeuk Kim wrote: >> On 10/16/2025 7:12 PM, Chao Yu wrote: >>> On 10/16/2025
 1:16 PM, Jeuk Kim wrote: >>>> From: Jeuk Kim >>>> >>>> Inline e [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [jeuk20.kim(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.53 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vB6Xq-0006r8-2k
Subject: Re: [f2fs-dev] [PATCH] f2fs: serialize writeback for inline-crypto
 inodes
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
Cc: hyenc.jeong@samsung.com, jieon.seol@samsung.com, gyusun.lee@samsung.com,
 wone.jung@samsung.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, d_hyun.kwon@samsung.com,
 jeuk20.kim@samsung.com, jaemyung.lee@samsung.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ck9uIDEwLzIxLzIwMjUgMzo1MSBQTSwgQ2hhbyBZdSB3cm90ZToKPiBPbiAxMC8yMS8yNSAxMToz
MywgSmV1ayBLaW0gd3JvdGU6Cj4+IE9uIDEwLzE2LzIwMjUgNzoxMiBQTSwgQ2hhbyBZdSB3cm90
ZToKPj4+IE9uIDEwLzE2LzIwMjUgMToxNiBQTSwgSmV1ayBLaW0gd3JvdGU6Cj4+Pj4gRnJvbTog
SmV1ayBLaW0gPGpldWsyMC5raW1Ac2Ftc3VuZy5jb20+Cj4+Pj4KPj4+PiBJbmxpbmUgZW5jcnlw
dGlvbiBkZXJpdmVzIERVTiBmcm9tIDxpbm9kZSwgZmlsZSBvZmZzZXQ+LAo+Pj4+IHNvIGJpb3Mg
ZnJvbSBkaWZmZXJlbnQgaW5vZGVzIGNhbid0IG1lcmdlLiBXaXRoIG11bHRpLXRocmVhZGVkCj4+
Pj4gYnVmZmVyZWQgT19TWU5DIHdyaXRlcyB3aGVyZSBlYWNoIHRocmVhZCB3cml0ZXMgdG8gaXRz
IG93biBmaWxlLAo+Pj4+IDRLaUItcGVyLXBhZ2UgTEJBIGFsbG9jYXRpb24gaW50ZXJsZWF2ZXMg
YWNyb3NzIGlub2RlcyBhbmQKPj4+PiBjYXVzZXMgYmlvIHNwbGl0LiBTZXJpYWxpemUgd3JpdGVi
YWNrIGZvciBmc2NyeXB0IGlubGluZS1jcnlwdG8KPj4+PiBpbm9kZXMgdmlhIF9fc2hvdWxkX3Nl
cmlhbGl6ZV9pbygpIHRvIGtlZXAgZm9yZWdyb3VuZCB3cml0ZWJhY2sKPj4+PiBmb2N1c2VkIG9u
IG9uZSBpbm9kZSBhbmQgYXZvaWQgc3BsaXQuCj4+Pj4KPj4+PiBUZXN0OiBmaW8gLS1uYW1lPXdi
X29zeW5jIC0tcnc9d3JpdGUgLS1icz0xTSBcCj4+Pj4gIMKgwqDCoMKgwqDCoCAtLXRpbWVfYmFz
ZWQ9MSAtLXJ1bnRpbWU9NjBzIC0tc2l6ZT0yRyBcCj4+Pj4gIMKgwqDCoMKgwqDCoCAtLWlvZW5n
aW5lPXBzeW5jIC0tZGlyZWN0PTAgLS1zeW5jPTEgXAo+Pj4+ICDCoMKgwqDCoMKgwqAgLS1udW1q
b2JzPTggLS10aHJlYWQ9MSAtLW5yZmlsZXM9MSBcCj4+Pj4gIMKgwqDCoMKgwqDCoCAtLWZpbGVu
YW1lX2Zvcm1hdD0nd2Jfb3N5bmMuJGpvYm51bScKPj4+Pgo+Pj4+IGRldmljZTogVUZTCj4+Pj4K
Pj4+PiBCZWZvcmUgLQo+Pj4+ICDCoMKgIHdyaXRlIHRocm91Z2hwdXQ6IDY3NU1pQi9zCj4+Pj4g
IMKgwqAgZGV2aWNlIEkvTyBzaXplIGRpc3RyaWJ1dGlvbiAoYnkgY291bnQsIHRvdGFsIDEwMjc0
MTQpOgo+Pj4+ICDCoMKgwqDCoCA0IEtpQjrCoCA5MjMxMzkgKDg5LjklKQo+Pj4+ICDCoMKgwqDC
oCA4IEtpQjrCoCA4NDc5OCAoOC4zJSkKPj4+PiAgwqDCoMKgwqAg4omlNTEyIEtpQjogNDUzICgw
LjAlKQo+Pj4+Cj4+Pj4gQWZ0ZXIgLQo+Pj4+ICDCoMKgIHdyaXRlIHRocm91Z2hwdXQ6IDE3NjBN
aUIvcwo+Pj4+ICDCoMKgIGRldmljZSBJL08gc2l6ZSBkaXN0cmlidXRpb24gKGJ5IGNvdW50LCB0
b3RhbCAyMzE3NTApOgo+Pj4+ICDCoMKgwqDCoCA0IEtpQjrCoCAxNjkwNCAoNy4zJSkKPj4+PiAg
wqDCoMKgwqAgOCBLaUI6wqAgNzIxMjggKDMxLjElKQo+Pj4+ICDCoMKgwqDCoCDiiaU1MTIgS2lC
OiAxMTg5MDAgKDUxLjMlKQo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSmV1ayBLaW0gPGpldWsy
MC5raW1Ac2Ftc3VuZy5jb20+Cj4+Pj4gLS0tCj4+Pj4gIMKgIGZzL2YyZnMvZGF0YS5jIHwgMiAr
Kwo+Pj4+ICDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+Pj4+IGluZGV4IGVmMzhl
NjJjZGE4Zi4uYWU2ZmI0MzVkNTc2IDEwMDY0NAo+Pj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4+
Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPj4+PiBAQCAtMzIxNyw2ICszMjE3LDggQEAgc3RhdGlj
IGlubGluZSBib29sIF9fc2hvdWxkX3NlcmlhbGl6ZV9pbyhzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+
Pj4+ICDCoCDCoMKgwqDCoMKgIGlmIChmMmZzX25lZWRfY29tcHJlc3NfZGF0YShpbm9kZSkpCj4+
Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsKPj4+PiArwqDCoMKgIGlmIChmc2Ny
eXB0X2lub2RlX3VzZXNfaW5saW5lX2NyeXB0byhpbm9kZSkpCj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IHJldHVybiB0cnVlOwo+Pj4+ICDCoMKgwqDCoMKgIGlmICh3YmMtPnN5bmNfbW9kZSAhPSBXQl9T
WU5DX0FMTCkKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiB0cnVlOwo+Pj4+ICDCoMKg
wqDCoMKgIGlmIChnZXRfZGlydHlfcGFnZXMoaW5vZGUpID49IFNNX0koRjJGU19JX1NCKGlub2Rl
KSktPm1pbl9zZXFfYmxvY2tzKQo+Pj4gSmV1aywKPj4+Cj4+PiBDYW4geW91IHBsZWFzZSB0cnkg
dHVuaW5nIC9zeXMvZnMvZjJmcy88ZGV2Pi9taW5fc2VxX2Jsb2NrcyB0byBzZWUgd2hldGhlciBp
dAo+Pj4gY2FuIGFjaGl2ZSB0aGUgZ29hbD8KPj4+Cj4+PiBUaGFua3MsCj4+Pgo+PiBIaSBDaGFv
LAo+Pgo+PiBUaGFua3MgYSBsb3QgZm9yIHRoZSBzdWdnZXN0aW9uLgo+PiBJIHRyaWVkIHR1bmlu
ZyBgL3N5cy9mcy9mMmZzLzxkZXY+L21pbl9zZXFfYmxvY2tzYCBhcyB5b3UgbWVudGlvbmVkLCBh
bmQgaXQgYWxzbyBhY2hpZXZlZCBzaW1pbGFyIHBlcmZvcm1hbmNlIGltcHJvdmVtZW50IG9uIG15
IHNldHVwLgo+Pgo+PiBZb3VyIGFwcHJvYWNoIGxvb2tzIGNsZWFuZXIgYW5kIGJldHRlciB0aGFu
IHRoZSBvbmUgSSBwcm9wb3NlZC4KPj4KPj4gIEZyb20gd2hhdCBJIHNlZSwgZXZlbiBhZnRlciBy
ZWR1Y2luZyB0aGlzIHZhbHVlIGZyb20gdGhlIGRlZmF1bHQgKDJNQikgdG8gNTEyIEtCIG9uIG15
IGxvY2FsIHN5c3RlbSwgdGhlcmUgZG9lc27igJl0IHNlZW0gdG8gYmUgYW55IG5vdGljZWFibGUg
cGVyZm9ybWFuY2UgZHJvcCBvciBvdGhlciBzaWRlIGVmZmVjdHMuCj4+IERvIHlvdSBzZWUgYW55
IHBvc3NpYmxlIGRvd25zaWRlcyB3aXRoIGxvd2VyaW5nIHRoaXMgdmFsdWUgdGhhdCBJIG1pZ2h0
IGhhdmUgbWlzc2VkPwo+IEhpIEpldWssCj4KPiBXZSdyZSB1c2luZyBzYmktPndyaXRlcGFnZXMg
dG8gc2VyaWFsaXplIGxhcmdlIElPcywgb25jZSB5b3UgdHVuZWQgZGVmYXVsdAo+IHZhbHVlIGZy
b20gMk1CIHRvIDUxMktCLCBpbiBBbmRyb2lkLCB0aGVyZSBhcmUgdGhyZWFkcyBpc3N1ZSBbNTEy
SywgMk0pCj4gc2l6ZWQgSU9zLCB0aGV5IHdpbGwgam9pbiBpbnRvIHJhY2luZyBvbiBncmFiYmlu
ZyB0aGUgLndyaXRlcGFnZXMgbG9jaywKPiBJIGd1ZXNzIHRoYXQgd2lsbCBjYXVzZSBwb3RlbnRp
YWwgcGVyZm9ybWFuY2UgcmVncmVzc2lvbiwgcmlnaHQ/CgpUaGF0J3MgcmlnaHQsIHRoYXQgY291
bGQgaGFwcGVuLgoKSeKAmWxsIHJ1biBzb21lIHRlc3RzIHRvIGNoZWNrIHRoYXQsIGluY2x1ZGlu
ZyBhIGZldyBvdGhlciBjYXNlcyB0aGF0IAptaWdodCBiZSBhZmZlY3RlZC4KSeKAmWxsIHNoYXJl
IHRoZSByZXN1bHRzIGhlcmUgaWYgSSBmaW5kIGFueXRoaW5nIG5vdGljZWFibGUuCgpUaGFua3Mg
Zm9yIHlvdXIgaGVscCEKCj4gVGhhbmtzLAo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
