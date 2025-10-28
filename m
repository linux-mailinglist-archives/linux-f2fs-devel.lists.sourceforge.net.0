Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45338C13CB6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Oct 2025 10:27:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ySzznSu8rfdepXSpTxq8t7rG7mHGjdFUEKIKvauzPV4=; b=VadrwR6XbhQItcBQqAzeKQAiHT
	n98cMeeWBtctrNIKotj8w3dc74Q4WkR4houRHbo5JVZZ/WJmiHiDzh5Vy4GOMKLyeOXwswbg7oWLc
	VS/Ro8xixHejiTJ6fX4rVwrtUYahaKDlAyoclM80tXhkmAmV6w+s/6iaK2VLwUovfzC8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDfzN-0001Et-6d;
	Tue, 28 Oct 2025 09:27:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vDfzL-0001En-GX
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Oct 2025 09:27:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yKoxoZ1tYZ9AJ00uaaU2ooI6hXgDg0jHM+k60xDvUXQ=; b=bisKc+zk+xRUKdhAGsV9VSaHp9
 S4gl3hwm9vIzbGwh5irGQzPCjRyZv1oqVqK+Unbw3jaJ/0B4bK12hQsnK9ZuJY3WlR/5X1yGu9Ss7
 CotaDSIiiHJ/I6zFwSIG47bl67m1yXObV+gsnnJxzzwCu5DkV2NQdFuElEcBPdKBwlIk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yKoxoZ1tYZ9AJ00uaaU2ooI6hXgDg0jHM+k60xDvUXQ=; b=egz2X8EtjM7Hu3ETxOuJ+Bs5Lm
 mzDjxiejrqWRz3pe4CBmR4DpjLlZHl4hiu5Tayj75ptL9Db1mEUmqkASIvwShCblrB06CyVPWHDI8
 c6UMgE9jFcKWzhE/24WsV9BQh9vedjYmKSLDjEaZ99pwWDFQ6eCIh9kmp8BbtAnosFbM=;
Received: from mail-pg1-f176.google.com ([209.85.215.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vDfzK-00015r-JC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Oct 2025 09:27:35 +0000
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-b4fb8d3a2dbso3792373a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 28 Oct 2025 02:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761643644; x=1762248444; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yKoxoZ1tYZ9AJ00uaaU2ooI6hXgDg0jHM+k60xDvUXQ=;
 b=GEgmPGnyIoHIg1qPz7zw1v75cvowDoHW4xvHiuADjoBdLNP9ENx1a+Q3hC42EjPv6n
 +SfWqkD77+6oMq9S8zIr6mFcs7Q1CAhl063lGkKRPXUJGgLhpmCJg+YE4GD/0nrtU212
 I441cS+p16L0LRlInmaZENIg+kWZ3vCFbbF4p5cA4gULAPHgWBC/5JkrFhhz0sXfqkaO
 xtPLHLXLbrFjlsw+dvR2ZYelSaCUrok4dC0WBicSjIgGC+GkVHDX/rgKwR9nsfV96nnf
 3x4LM86tIfY49+GNJi76cKqIFrQ9hwXYQQqMj8Zvd5Yu2gBQjVwsNBblpXmmvz9H/2IA
 +6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761643644; x=1762248444;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yKoxoZ1tYZ9AJ00uaaU2ooI6hXgDg0jHM+k60xDvUXQ=;
 b=I74H0YEJhpTyfZtB2FY4i9Q7cq9TA5MPntufZrDoXTidESW1VwSgSDCNx520hDfAqM
 2gjQ28mzj9T6Omu35307iUg87SutuUir2TpYi6oq2ar9LllJJWBYZzA3QArp9Ddh/pVZ
 Asnm1HD4EHGowUwMWXoZDKmLZm065FW1mCeEUrfvqG7h/0X9p63yt/21tFJ/xueX/IzR
 Az9BolB3gJNxEPzMz3Ch9yzj97Zq+1OAMur74gt/57W9F0J+ooejtF09sMo0aA1UvBV+
 j/M7enZN1A0X1kTuEKOEmflb3Qgv6yZ8xpsMIrjPlwNZ/EQ652/b/M67nhYgISgE6TPu
 RgwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQuXzkNbMSPDDmF+s+n1GAGY4SZFanGH5Pv7KbFReHhbvJ603ES8P2Isk65NCWex8n7xzMhNS0nGN1+UIHTxGt@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyAgkN5Wlft7P6EIrCUPhwCFIGLyjKR4prDdzRDn7Ve7j7AoXKH
 hKyQWhz1TO6eFjdKCfqPG6XdZmwNT1Lp0izSPBT0Q5Ce/aeorH73YWQ6
X-Gm-Gg: ASbGncsDJFij0RMSXgOaATH9Iqx8i+TAIz9JyLYaNRYG3iT8tfucJJgzcW+kgd68NnN
 M4PuzkSUgRsBXq9AyhjRIXjhqd9bnciu7fSLu30fcIKywsLgu0hN0iYsiuwM+hAxfK5ywyfgLWy
 Q50nSRJ/rV0uNWtfhk9jXLLrmHRPV2UQA7QeakxALgpkEniqTSvhyT4AxrbuIwlI6UlFMER77G0
 ZXWxX6NaPpZ4K6Mz7ue2ERUJaOQZDcpgASDt0WnHb1R9VOeUfga13LvTXhD+kusNckfCjCQdymB
 gy0DbvFh9UrvCze05fdAe0Xq4PhurM9FgkFQpUzPiIqtd69cjOc6aues/wMZr26x0Y5NtgkI+iJ
 BKkucvwlSNI5TKuig7HvlF0ho2w2/g9+Wri2nDOcdVtqmBfG+fF9nT2ytdX5F4VyUQ91bEcSikB
 YLmS/V0bDgOW3v2VtnOKU=
X-Google-Smtp-Source: AGHT+IFaVKfjX1X/Hxamrs8lvJodeMAPrX/vQ/pDMTdrIReOFSYKGVCvWEnlwMsd3v5vMXYbJ1jqrg==
X-Received: by 2002:a17:903:1c2:b0:28e:7841:d437 with SMTP id
 d9443c01a7336-294cb51090amr31450375ad.38.1761643643650; 
 Tue, 28 Oct 2025 02:27:23 -0700 (PDT)
Received: from [10.189.138.37] ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498d41c4esm111534715ad.81.2025.10.28.02.27.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 02:27:23 -0700 (PDT)
Message-ID: <b603b6bb-e772-469d-b439-f79e83c9964b@gmail.com>
Date: Tue, 28 Oct 2025 17:27:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Yongpeng Yang
 <yangyongpeng.storage@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251024143746.187140-1-yangyongpeng.storage@gmail.com>
 <c0689523-a265-47ce-b443-b4fe4ae7d823@kernel.org>
 <d74c16bc-58c5-470f-acb5-e2dfe6c721d8@gmail.com>
 <207c2ba6-49ef-490b-9896-0458abbf93e7@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
In-Reply-To: <207c2ba6-49ef-490b-9896-0458abbf93e7@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/28/25 10:30, Chao Yu via Linux-f2fs-devel wrote: > On
 10/27/25 21:06, Yongpeng Yang wrote: >> On 10/27/25 16:35,
 Chao Yu via Linux-f2fs-devel
 wrote: >>> On 10/24/25 22:37, Yongpeng Yang wrote: > [...] 
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
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.176 listed in wl.mailspike.net]
X-Headers-End: 1vDfzK-00015r-JC
Subject: Re: [f2fs-dev] [PATCH] f2fs: ensure minimum trim granularity
 accounts for all devices
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

T24gMTAvMjgvMjUgMTA6MzAsIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4g
T24gMTAvMjcvMjUgMjE6MDYsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+IE9uIDEwLzI3LzI1IDE2
OjM1LCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+Pj4gT24gMTAvMjQvMjUg
MjI6MzcsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+Pj4gRnJvbTogWW9uZ3BlbmcgWWFuZyA8eWFu
Z3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+Pj4KPj4+PiBXaGVuIEYyRlMgdXNlcyBtdWx0aXBsZSBi
bG9jayBkZXZpY2VzLCBlYWNoIGRldmljZSBtYXkgaGF2ZSBhCj4+Pj4gZGlmZmVyZW50IGRpc2Nh
cmQgZ3JhbnVsYXJpdHkuIFRoZSBtaW5pbXVtIHRyaW0gZ3JhbnVsYXJpdHkgbXVzdCBiZQo+Pj4+
IGF0IGxlYXN0IHRoZSBtYXhpbXVtIGRpc2NhcmQgZ3JhbnVsYXJpdHkgb2YgYWxsIGRldmljZXMs
IGV4Y2x1ZGluZwo+Pj4+IHpvbmVkIGRldmljZXMuIFVzZSBtYXhfdCBpbnN0ZWFkIG9mIHRoZSBt
YXgoKSBtYWNybyB0byBjb21wdXRlIHRoZQo+Pj4+IG1heGltdW0gdmFsdWUuCj4+Pj4KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBZb25ncGVuZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4+
PiAtLS0KPj4+PiAgwqAgZnMvZjJmcy9mMmZzLmggfCAxMiArKysrKysrKysrKysKPj4+PiAgwqAg
ZnMvZjJmcy9maWxlLmMgfCAxMiArKysrKystLS0tLS0KPj4+PiAgwqAgMiBmaWxlcyBjaGFuZ2Vk
LCAxOCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBh
L2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPj4+PiBpbmRleCAzMmZiMmU3MzM4Yjcu
LjA2NGJkYmY0NjNmNyAxMDA2NDQKPj4+PiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+Pj4+ICsrKyBi
L2ZzL2YyZnMvZjJmcy5oCj4+Pj4gQEAgLTQ3NjIsNiArNDc2MiwxOCBAQCBzdGF0aWMgaW5saW5l
IGJvb2wgZjJmc19od19zdXBwb3J0X2Rpc2NhcmQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+
Pj4+ICDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsKPj4+PiAgwqAgfQo+Pj4+ICDCoCArc3RhdGlj
IGlubGluZSB1bnNpZ25lZCBpbnQgZjJmc19od19kaXNjYXJkX2dyYW51bGFyaXR5KHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSkKPj4+PiArewo+Pj4+ICvCoMKgwqAgaW50IGkgPSAxOwo+Pj4+ICvC
oMKgwqAgdW5zaWduZWQgaW50IGRpc2NhcmRfZ3JhbnVsYXJpdHkgPSBiZGV2X2Rpc2NhcmRfZ3Jh
bnVsYXJpdHkoc2JpLT5zYi0+c19iZGV2KTsKPj4+Cj4+PiBZb25ncGVuZywKPj4+Cj4+PiBUaGUg
cGF0Y2ggbWFrZXMgc2Vuc2UgdG8gbWUuCj4+Pgo+Pj4gT25lIGV4dHJhIHF1ZXN0aW9uLCBpZiBh
IHpvbmVkIGRldmljZSBjb250YWlucyBib3RoIGNvbnZlbnRpb25hbCB6b25lcyBhbmQKPj4+IHNl
cXVlbnRpYWwgem9uZXMsIHdoYXQgZGlzY2FyZCBncmFudWxhcml0eSB3aWxsIGl0IGV4cG9zZXM/
Cj4+Pgo+Pj4gVGhhbmtzLAo+PiBJIGRvbid0IGhhdmUgc3VjaCBhIGRldmljZS4gSSB0aGluayB0
aGUgZXhwb3NlZCBkaXNjYXJkIGdyYW51bGFyaXR5IHNob3VsZCBiZSB0aGF0IG9mIHRoZSBjb252
ZW50aW9uYWwgem9uZXMsIHNpbmNlIHRoZSBzZXF1ZW50aWFsIHpvbmVzIGhhdmUgYSBkZWZhdWx0
IHJlc2V0IGdyYW51bGFyaXR5IG9mIDEgem9uZSwgYW5kIG5vIGFkZGl0aW9uYWwgaW5mb3JtYXRp
b24gaXMgbmVlZGVkIHRvIGluZGljYXRlIHRoYXQuCj4gCj4gSSBndWVzcyB5b3UgY2FuIGhhdmUg
YSB2aXJ0dWFsIG9uZSBzaW11bGF0ZWQgYnkgbnVsbF9ibGsgZHJpdmVyPwo+IAo+IGh0dHBzOi8v
em9uZWRzdG9yYWdlLmlvL2RvY3MvZ2V0dGluZy1zdGFydGVkL3piZC1lbXVsYXRpb24jem9uZWQt
YmxvY2stZGV2aWNlLWVtdWxhdGlvbi13aXRoLW51bGxfYmxrCjEuIFdoZW4gdXNpbmcgcWVtdSB0
byBlbXVsYXRlIGEgem5zIHNzZCwgYSBuYW1lc3BhY2UgY2Fubm90IApzaW11bHRhbmVvdXNseSBj
b250YWluIGJvdGggY29udmVudGlvbmFsIHpvbmVzIGFuZCBzZXF1ZW50aWFsIHpvbmVzLiAKQWRk
aXRpb25hbGx5LCBmb3IgdGhlIGVtdWxhdGVkIHpvbmVkIGRldmljZSwgdGhlIGRpc2NhcmRfZ3Jh
bnVsYXJpdHkgCmNhbm5vdCBiZSBjb25maWd1cmVkIG1hbnVhbGx5LiBJdHMgc2l6ZSBpcyBkZWZh
dWx0ZWQgdG8gdGhlIG1heGltdW0gCnZhbHVlIGJldHdlZW4gdGhlIGxvZ2ljYWxfYmxvY2tfc2l6
ZSBhbmQgNEtpQi4KCnN0YXRpYyBpbnQgbnZtZV9uc19pbml0X2JsayhOdm1lTmFtZXNwYWNlICpu
cywgRXJyb3IgKiplcnJwKQp7Ci4uLgogICAgIGlmIChucy0+YmxrY29uZi5kaXNjYXJkX2dyYW51
bGFyaXR5ID09IC0xKSB7CiAgICAgICAgIG5zLT5ibGtjb25mLmRpc2NhcmRfZ3JhbnVsYXJpdHkg
PQogICAgICAgICAgICAgTUFYKG5zLT5ibGtjb25mLmxvZ2ljYWxfYmxvY2tfc2l6ZSwgTUlOX0RJ
U0NBUkRfR1JBTlVMQVJJVFkpOwogICAgIH0KLi4uCn0KClRoZSBkZWZhdWx0IHZhbHVlIG9mIGRp
c2NhcmRfZ3JhbnVsYXJpdHkgaXMgc2V0IHRvIGxvZ2ljYWxfYmxvY2tfc2l6ZSBpbiAKbnZtZSBk
cml2ZXIuCnN0YXRpYyB2b2lkIG52bWVfY29uZmlnX2Rpc2NhcmQoc3RydWN0IG52bWVfbnMgKm5z
LCBzdHJ1Y3QgcXVldWVfbGltaXRzIAoqbGltKQp7Ci4uLgoJbGltLT5kaXNjYXJkX2dyYW51bGFy
aXR5ID0gbGltLT5sb2dpY2FsX2Jsb2NrX3NpemU7Ci4uLgp9CgoyLiBRRU1VIGNhbm5vdCBlbXVs
YXRlIFNNUiBIRERzLiBGcm9tIHNjc2kgZHJpdmVyIGNvZGUsIEkgZm91bmQgdGhhdCB0aGUgCmRp
c2NhcmRfZ3JhbnVsYXJpdHkgb2YgYSBzY3NpIGRldmljZSBpcyBhcyBmb2xsb3dzLiBUaGUgdmFs
dWUgb2YgCnNka3AtPnVubWFwX2dyYW51bGFyaXR5IGlzIHNoYXJlZCBhY3Jvc3MgbXVsdGlwbGUg
TFVOcywgbWVhbmluZyB0aGF0IApib3RoIGNvbnZlbnRpb25hbCBMVU5zIGFuZCBzZXF1ZW50aWFs
IExVTnMgaGF2ZSB0aGUgc2FtZSAKc2RrcC0+dW5tYXBfZ3JhbnVsYXJpdHkuIEFzIGEgcmVzdWx0
LCB0aGUgZGlzY2FyZF9ncmFudWxhcml0eSBpcyBhbHNvIAp0aGUgc2FtZSBmb3IgYm90aCB0eXBl
cyBvZiB6b25lcy4gVGhlcmVmb3JlLCBmcm9tIHRoZSBkcml2ZXIgCnBlcnNwZWN0aXZlLCBhIHpv
bmVkIGRldmljZSB0aGF0IGNvbnRhaW5zIGJvdGggY29udmVudGlvbmFsIHpvbmVzIGFuZCAKc2Vx
dWVudGlhbCB6b25lcyB3aWxsIGhhdmUgdGhlIHNhbWUgZGlzY2FyZF9ncmFudWxhcml0eSBhcyBv
dGhlciAKY29udmVudGlvbmFsIGRldmljZXMuCgoKc3RhdGljIHZvaWQgc2RfY29uZmlnX2Rpc2Nh
cmQoc3RydWN0IHNjc2lfZGlzayAqc2RrcCwgc3RydWN0IApxdWV1ZV9saW1pdHMgKmxpbSwKICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbW9kZSkKewouLi4KICAgICBsaW0tPmRpc2NhcmRf
Z3JhbnVsYXJpdHkgPSBtYXgoc2RrcC0+cGh5c2ljYWxfYmxvY2tfc2l6ZSwKICAgICAgICAgICAg
ICAgICAgICAgICAgIHNka3AtPnVubWFwX2dyYW51bGFyaXR5ICogbG9naWNhbF9ibG9ja19zaXpl
KTsKLi4uCn0KCnN0YXRpYyB2b2lkIHNkX3JlYWRfYmxvY2tfbGltaXRzKHN0cnVjdCBzY3NpX2Rp
c2sgKnNka3AsCiAgICAgICAgICAgICAgICAgc3RydWN0IHF1ZXVlX2xpbWl0cyAqbGltKQp7Ci4u
LgogICAgIHNka3AtPnVubWFwX2dyYW51bGFyaXR5ID0gZ2V0X3VuYWxpZ25lZF9iZTMyKCZ2cGQt
PmRhdGFbMjhdKTsKLi4uCn0KCjMuIEl0IHNlZW1zIHRoYXQgZGlzY2FyZF9ncmFudWxhcml0eSBp
cyByZWxhdGVkIHRvIGxvZ2ljYWxfYmxvY2tfc2l6ZSAKYW5kIHBoeXNpY2FsX2Jsb2NrX3NpemUs
IGFuZCBpcyBub3QgYXNzb2NpYXRlZCB3aXRoIHRoZSB6b25lIHNpemUuIEZvciAKem9uZWQgZGV2
aWNlLCBkaXNjYXJkX2dyYW51bGFyaXR5IGlzIG1lYW5pbmdsZXNzLgoKPiAKPiAtIG51bGxibGtf
Y3JlYXRlLnNoIDUxMiAyIDEwMjQgMTAyNAo+IC0gY2F0IC9zeXMvYmxvY2svbnVsbGIxL3F1ZXVl
L2Rpc2NhcmRfKgo+IDAKPiAwCj4gMAo+IDAKPiAKPiBJIGRpZG4ndCBkaWcgaW50byBtb3JlIGRl
dGFpbHMsIHRob3VnaC4gOikKPiAKPiBUaGFua3MsCj4gCgpJIGZvdW5kIHRoYXQgbnVsbCBkZXZp
Y2UgZGlkbid0IGNvbmZpZyBkaXNjYXJkXyouCnN0YXRpYyBpbnQgbnVsbF9hZGRfZGV2KHN0cnVj
dCBudWxsYl9kZXZpY2UgKmRldikgCgp7Ci4uLgogICAgICAgICBzdHJ1Y3QgcXVldWVfbGltaXRz
IGxpbSA9IHsKICAgICAgICAgICAgICAgICAubG9naWNhbF9ibG9ja19zaXplICAgICA9IGRldi0+
YmxvY2tzaXplLAogICAgICAgICAgICAgICAgIC5waHlzaWNhbF9ibG9ja19zaXplICAgID0gZGV2
LT5ibG9ja3NpemUsCiAgICAgICAgICAgICAgICAgLm1heF9od19zZWN0b3JzICAgICAgICAgPSBk
ZXYtPm1heF9zZWN0b3JzLAogICAgICAgICB9OwouLi4KfT4+Cj4+IFlvbmdwZW5nPgo+Pj4+ICsK
Pj4+PiArwqDCoMKgIGlmIChmMmZzX2lzX211bHRpX2RldmljZShzYmkpKQo+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBmb3IgKDsgaSA8IHNiaS0+c19uZGV2cyAmJiAhYmRldl9pc196b25lZChGREVWKGkp
LmJkZXYpOyBpKyspCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGlzY2FyZF9ncmFudWxh
cml0eSA9IG1heF90KHVuc2lnbmVkIGludCwgZGlzY2FyZF9ncmFudWxhcml0eSwKPj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiZGV2X2Rpc2NhcmRf
Z3JhbnVsYXJpdHkoRkRFVihpKS5iZGV2KSk7Cj4+Pj4gK8KgwqDCoCByZXR1cm4gZGlzY2FyZF9n
cmFudWxhcml0eTsKPj4+PiArfQo+Pj4+ICsKPj4+PiAgwqAgc3RhdGljIGlubGluZSBib29sIGYy
ZnNfcmVhbHRpbWVfZGlzY2FyZF9lbmFibGUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+Pj4+
ICDCoCB7Cj4+Pj4gIMKgwqDCoMKgwqAgcmV0dXJuICh0ZXN0X29wdChzYmksIERJU0NBUkQpICYm
IGYyZnNfaHdfc3VwcG9ydF9kaXNjYXJkKHNiaSkpIHx8Cj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2Yy
ZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKPj4+PiBpbmRleCA2ZDQyZTJkMjg4NjEuLmNlZDBm
Nzg1MzJjOSAxMDA2NDQKPj4+PiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+Pj4+ICsrKyBiL2ZzL2Yy
ZnMvZmlsZS5jCj4+Pj4gQEAgLTI1ODgsMTQgKzI1ODgsMTQgQEAgc3RhdGljIGludCBmMmZzX2tl
ZXBfbm9yZXVzZV9yYW5nZShzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+Pj4+ICDCoCBzdGF0aWMgaW50
IGYyZnNfaW9jX2ZpdHJpbShzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhcmcpCj4+
Pj4gIMKgIHsKPj4+PiAgwqDCoMKgwqDCoCBzdHJ1Y3QgaW5vZGUgKmlub2RlID0gZmlsZV9pbm9k
ZShmaWxwKTsKPj4+PiAtwqDCoMKgIHN0cnVjdCBzdXBlcl9ibG9jayAqc2IgPSBpbm9kZS0+aV9z
YjsKPj4+PiArwqDCoMKgIHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSA9IEYyRlNfSV9TQihpbm9k
ZSk7Cj4+Pj4gIMKgwqDCoMKgwqAgc3RydWN0IGZzdHJpbV9yYW5nZSByYW5nZTsKPj4+PiAgwqDC
oMKgwqDCoCBpbnQgcmV0Owo+Pj4+ICDCoCDCoMKgwqDCoMKgIGlmICghY2FwYWJsZShDQVBfU1lT
X0FETUlOKSkKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRVBFUk07Cj4+Pj4gIMKg
IC3CoMKgwqAgaWYgKCFmMmZzX2h3X3N1cHBvcnRfZGlzY2FyZChGMkZTX1NCKHNiKSkpCj4+Pj4g
K8KgwqDCoCBpZiAoIWYyZnNfaHdfc3VwcG9ydF9kaXNjYXJkKHNiaSkpCj4+Pj4gIMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gLUVPUE5PVFNVUFA7Cj4+Pj4gIMKgIMKgwqDCoMKgwqAgaWYgKGNv
cHlfZnJvbV91c2VyKCZyYW5nZSwgKHN0cnVjdCBmc3RyaW1fcmFuZ2UgX191c2VyICopYXJnLAo+
Pj4+IEBAIC0yNjA2LDkgKzI2MDYsOSBAQCBzdGF0aWMgaW50IGYyZnNfaW9jX2ZpdHJpbShzdHJ1
Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhcmcpCj4+Pj4gIMKgwqDCoMKgwqAgaWYgKHJl
dCkKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+Pj4gIMKgIC3CoMKgwqAg
cmFuZ2UubWlubGVuID0gbWF4KCh1bnNpZ25lZCBpbnQpcmFuZ2UubWlubGVuLAo+Pj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJkZXZfZGlzY2FyZF9ncmFudWxhcml0eShzYi0+c19i
ZGV2KSk7Cj4+Pj4gLcKgwqDCoCByZXQgPSBmMmZzX3RyaW1fZnMoRjJGU19TQihzYiksICZyYW5n
ZSk7Cj4+Pj4gK8KgwqDCoCByYW5nZS5taW5sZW4gPSBtYXhfdCh1bnNpZ25lZCBpbnQsIHJhbmdl
Lm1pbmxlbiwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX2h3X2Rpc2NhcmRfZ3Jh
bnVsYXJpdHkoc2JpKSk7Cj4+Pj4gK8KgwqDCoCByZXQgPSBmMmZzX3RyaW1fZnMoc2JpLCAmcmFu
Z2UpOwo+Pj4+ICDCoMKgwqDCoMKgIG1udF9kcm9wX3dyaXRlX2ZpbGUoZmlscCk7Cj4+Pj4gIMKg
wqDCoMKgwqAgaWYgKHJldCA8IDApCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0
Owo+Pj4+IEBAIC0yNjE2LDcgKzI2MTYsNyBAQCBzdGF0aWMgaW50IGYyZnNfaW9jX2ZpdHJpbShz
dHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhcmcpCj4+Pj4gIMKgwqDCoMKgwqAgaWYg
KGNvcHlfdG9fdXNlcigoc3RydWN0IGZzdHJpbV9yYW5nZSBfX3VzZXIgKilhcmcsICZyYW5nZSwK
Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplb2YocmFuZ2UpKSkK
Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUZBVUxUOwo+Pj4+IC3CoMKgwqAgZjJm
c191cGRhdGVfdGltZShGMkZTX0lfU0IoaW5vZGUpLCBSRVFfVElNRSk7Cj4+Pj4gK8KgwqDCoCBm
MmZzX3VwZGF0ZV90aW1lKHNiaSwgUkVRX1RJTUUpOwo+Pj4+ICDCoMKgwqDCoMKgIHJldHVybiAw
Owo+Pj4+ICDCoCB9Cj4+Pj4gICAgCj4+Pgo+Pj4KPj4+Cj4+PiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKPj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+PiBodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK
