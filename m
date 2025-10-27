Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E080EC0DAFB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Oct 2025 13:52:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:References:To:From:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6J3mio3NMPB/aMJRdbEqZ3zm/g4gMKSU8FqCHdcJMc=; b=IJQ8pHszuQVFMAG36rcefkwDBF
	qTSbB3tW9IqqEC/vPRZTNewlK2VLpk0fzeCEzkd9DgOsbIbvxuv3r/u2DgxJ8CapuEkYi+3+AK/oP
	ePqti8RUh9hdoc8N1Dy7O9LDg/JgMHPYXljqIL84wpjO+nqIqDICeGonKEnekdxzsD9s=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDMhr-00034m-95;
	Mon, 27 Oct 2025 12:52:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vDMhn-00034b-0o
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 12:52:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DJwlFrODoECc+NAAvVFI8v2xqy7eJLoaD/4CwmXPAOQ=; b=N92bVD/1m3PIiLg/GdVmV3gS1b
 W6iW+sF6I7SjtgwD+p9mDtObeg32dQ1qcnicteCwYs0kP+PqQC5rliindnTpKV2ziL0+/bm58fnJO
 tmQ1rvNS91s9ne6Q/C6h3PFMV1YGxQdh8UEpQuInR9Kd+6XMNq6UlKzQAwGo5NbEAZO4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:
 Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DJwlFrODoECc+NAAvVFI8v2xqy7eJLoaD/4CwmXPAOQ=; b=cNLYocOrD3RKWuQszOHKZ3xo/3
 8+8ctxebQN4ODeyPmvBV4fnd5oX+f0Vo4G69n/Ouqv0Z2AxBHFLeW/0sxsr62J5lHQ2Bvjn1p3CAc
 LU6eVMmaFYFBOEb5B5oIiFnlkjV53HOkeEJLL76/QqBtNOFUr1tLay40ZZO9O9HEcu3w=;
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vDMhm-0001K8-2y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 12:52:10 +0000
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-330b4739538so4651754a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 27 Oct 2025 05:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761569524; x=1762174324; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DJwlFrODoECc+NAAvVFI8v2xqy7eJLoaD/4CwmXPAOQ=;
 b=Wth4P1nmLDOfYZJ919swi64JUqy6Xrtafn4I5Ce2M5Sh+vWduLTT+YSeiyO2AkZBSe
 lT5G5RWxxT509YN8Xlb1CCQYcye+tXZ8tAsy8otnUE4TYEwq1VRXzLdpP3EC21rjuUUy
 5PtMUzQWJxEh1APbRCuMwN9pzjLW2bRGmfHuAcSzf1/6VSp3tFhV16L5BHhhYcuqX4XO
 vhfSPrkIFaRDagRScPXIYRSRoPZb4PeNtmg4CAHLf1aOw3nsb6soFc/AjGzKqKAJ2zP0
 Qxczsg7zcVOXSeocS0mg9tvV2OR1j0Z7ECgrbSfsB+MQT/h+I+hcvq1wsNo+OT8e4Hqk
 OSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761569524; x=1762174324;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DJwlFrODoECc+NAAvVFI8v2xqy7eJLoaD/4CwmXPAOQ=;
 b=KXD3gVae1QKfbMOLKfY4v9CPJupxODVATn35JqOr61oxuiIpqy1mcdLfzN1+KGlPOt
 OMNzYSSo8RVqdDL/qGKc00OPWOK5hDioJf7xx0vy3tL36ueLE2IOvmA6HKJR8GtQJ5H5
 4sOQCSKe4viipT51ZmI8zYMdjTytbMqUlbwV4L47WwHJn1JC50osso4Z8fo6ObcRTVjr
 6H+y2VwXVFo4y+QgJWminbsR5frHujDS0yl/qlxdjgsTjvAb8FMbBKcanGZe/TOg/EV9
 zq4cZgP8z9CG+t45a8/f5/tRdTxKqkffVx3TCvy/PyOMBPkvARNCC66x9aGjVtBbw2C6
 BYrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwDE6xS2YDXw30fDFOM0V2PlgaaTy+l4zn8Hsi7o/HGO9MuHPHiR8W8uvH0juqZAD78m0kC2SpKNbSEe1Q4S9a@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxAwxvevITP72u7S/WVJz3BJsRMeMP3M2Ok1g0FYAqhRKrTTy1F
 12HMdxqWTH9J2nhXqwI2xBsprl8f7l6jBRX5/CzqPh6rkqJGkjfI9O9IgXJDVJ0cx0o=
X-Gm-Gg: ASbGncvLs2wXQmjcikDkc54HJHPmjeUqZ5JpN4KaA6ruPFrYEBc9nR+52n4aFZ3IAam
 Ov3Y1lBLuphGmuTz7jz3AI8TdY6m7288y0ph3i6ico1dRlqJAq1GJzBmOmdVsNGxeE4QK4mz3Lq
 jDiPR1Iy6eOT08YsKeMM05fqOt2nF9wuwZjO42+OU3UKnCuURHe2AriozUvcr9CiN8w+knRDAR0
 D5Lr3S0TWxlpPZyShDcaPp/avxEGqY/UDYAclU2HyNbPLeYE5W9LoTgwQDId08BdtY6rMEUOV2G
 Wx4slft5XoO3mjn7aX2w076EB8/KftQ/dKhvnx8JpNTPpGp6K+Z5DsXFp5OWeye3gnJjqdOJs3e
 AZQqleTN9Yp/BPI2UdxVDBW0mK8SPVVzxshQ4KTrTd9fJo7mqxXO9TzYLkUfeoZuMfmKAgTPcjJ
 6S8Ln5rShN04NLCBfZqfDWdP9mx3TIrQ==
X-Google-Smtp-Source: AGHT+IEyzxM4Dz6Nb/ImxRbWoEr5jDZMtXVpxNwHxD60TC/GussFfIeLaYkZY/AyvPsAB8P6zAnWzQ==
X-Received: by 2002:a17:90b:268e:b0:32e:a54a:be4a with SMTP id
 98e67ed59e1d1-33fd64bb5c1mr11902705a91.2.1761569524165; 
 Mon, 27 Oct 2025 05:52:04 -0700 (PDT)
Received: from [10.189.138.37] ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33fed81c9e5sm8510657a91.17.2025.10.27.05.52.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 05:52:03 -0700 (PDT)
Message-ID: <5dd3e347-00e9-4353-a62b-d851d84231be@gmail.com>
Date: Mon, 27 Oct 2025 20:52:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>, Yongpeng Yang
 <yangyongpeng.storage@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251024131344.144972-1-yangyongpeng.storage@gmail.com>
 <2170f364-b48a-47ef-a8b8-f6e72027999a@kernel.org>
Content-Language: en-US
In-Reply-To: <2170f364-b48a-47ef-a8b8-f6e72027999a@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/27/25 16:20, Chao Yu via Linux-f2fs-devel wrote: > On
 10/24/25 21:13, Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> Change
 the type of the unlock parameter of f2fs_put_page to bool. >> All [...] 
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
 [209.85.216.51 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vDMhm-0001K8-2y
Subject: Re: [f2fs-dev] [PATCH] f2fs: change the unlock parameter of
 f2fs_put_page to bool
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

T24gMTAvMjcvMjUgMTY6MjAsIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4g
T24gMTAvMjQvMjUgMjE6MTMsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+IEZyb206IFlvbmdwZW5n
IFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pgo+PiBDaGFuZ2UgdGhlIHR5cGUgb2Yg
dGhlIHVubG9jayBwYXJhbWV0ZXIgb2YgZjJmc19wdXRfcGFnZSB0byBib29sLgo+PiBBbGwgY2Fs
bGVycyBzaG91bGQgY29uc2lzdGVudGx5IHBhc3MgdHJ1ZSBvciBmYWxzZS4gTm8gbG9naWNhbCBj
aGFuZ2UuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25ncGVuZ0B4
aWFvbWkuY29tPgo+PiAtLS0KPj4gICBmcy9mMmZzL2NvbXByZXNzLmMgfCAgOCArKysrLS0tLQo+
PiAgIGZzL2YyZnMvZGF0YS5jICAgICB8IDEyICsrKystLS0tLS0tLQo+PiAgIGZzL2YyZnMvZjJm
cy5oICAgICB8ICAyICstCj4+ICAgZnMvZjJmcy9nYy5jICAgICAgIHwgIDYgKysrLS0tCj4+ICAg
ZnMvZjJmcy9pbmxpbmUuYyAgIHwgIDQgKystLQo+PiAgIGZzL2YyZnMvbmFtZWkuYyAgICB8ICA0
ICsrLS0KPj4gICA2IGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9u
cygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9jb21wcmVzcy5jIGIvZnMvZjJmcy9jb21w
cmVzcy5jCj4+IGluZGV4IDgxMWJmZTM4ZTVjMC4uNzE2MDA0YmE0NGRjIDEwMDY0NAo+PiAtLS0g
YS9mcy9mMmZzL2NvbXByZXNzLmMKPj4gKysrIGIvZnMvZjJmcy9jb21wcmVzcy5jCj4+IEBAIC0x
MjAsNyArMTIwLDcgQEAgc3RhdGljIHZvaWQgZjJmc191bmxvY2tfcnBhZ2VzKHN0cnVjdCBjb21w
cmVzc19jdHggKmNjLCBpbnQgbGVuKQo+PiAgIH0KPj4gICAKPj4gICBzdGF0aWMgdm9pZCBmMmZz
X3B1dF9ycGFnZXNfd2JjKHN0cnVjdCBjb21wcmVzc19jdHggKmNjLAo+PiAtCQlzdHJ1Y3Qgd3Jp
dGViYWNrX2NvbnRyb2wgKndiYywgYm9vbCByZWRpcnR5LCBpbnQgdW5sb2NrKQo+PiArCQlzdHJ1
Y3Qgd3JpdGViYWNrX2NvbnRyb2wgKndiYywgYm9vbCByZWRpcnR5LCBib29sIHVubG9jaykKPj4g
ICB7Cj4+ICAgCXVuc2lnbmVkIGludCBpOwo+PiAgIAo+PiBAQCAtMTIwMiw3ICsxMjAyLDcgQEAg
Ym9vbCBmMmZzX2NvbXByZXNzX3dyaXRlX2VuZChzdHJ1Y3QgaW5vZGUgKmlub2RlLCB2b2lkICpm
c2RhdGEsCj4+ICAgCWlmIChjb3BpZWQpCj4+ICAgCQlzZXRfY2x1c3Rlcl9kaXJ0eSgmY2MpOwo+
PiAgIAo+PiAtCWYyZnNfcHV0X3JwYWdlc193YmMoJmNjLCBOVUxMLCBmYWxzZSwgMSk7Cj4+ICsJ
ZjJmc19wdXRfcnBhZ2VzX3diYygmY2MsIE5VTEwsIGZhbHNlLCB0cnVlKTsKPj4gICAJZjJmc19k
ZXN0cm95X2NvbXByZXNzX2N0eCgmY2MsIGZhbHNlKTsKPj4gICAKPj4gICAJcmV0dXJuIGZpcnN0
X2luZGV4Owo+PiBAQCAtMTYwNSw3ICsxNjA1LDcgQEAgaW50IGYyZnNfd3JpdGVfbXVsdGlfcGFn
ZXMoc3RydWN0IGNvbXByZXNzX2N0eCAqY2MsCj4+ICAgCQkJYWRkX2NvbXByX2Jsb2NrX3N0YXQo
Y2MtPmlub2RlLCBjYy0+Y2x1c3Rlcl9zaXplKTsKPj4gICAJCQlnb3RvIHdyaXRlOwo+PiAgIAkJ
fSBlbHNlIGlmIChlcnIpIHsKPj4gLQkJCWYyZnNfcHV0X3JwYWdlc193YmMoY2MsIHdiYywgdHJ1
ZSwgMSk7Cj4+ICsJCQlmMmZzX3B1dF9ycGFnZXNfd2JjKGNjLCB3YmMsIHRydWUsIHRydWUpOwo+
PiAgIAkJCWdvdG8gZGVzdHJveV9vdXQ7Cj4+ICAgCQl9Cj4+ICAgCj4+IEBAIC0xNjE5LDcgKzE2
MTksNyBAQCBpbnQgZjJmc193cml0ZV9tdWx0aV9wYWdlcyhzdHJ1Y3QgY29tcHJlc3NfY3R4ICpj
YywKPj4gICAJZjJmc19idWdfb24oRjJGU19JX1NCKGNjLT5pbm9kZSksICpzdWJtaXR0ZWQpOwo+
PiAgIAo+PiAgIAllcnIgPSBmMmZzX3dyaXRlX3Jhd19wYWdlcyhjYywgc3VibWl0dGVkLCB3YmMs
IGlvX3R5cGUpOwo+PiAtCWYyZnNfcHV0X3JwYWdlc193YmMoY2MsIHdiYywgZmFsc2UsIDApOwo+
PiArCWYyZnNfcHV0X3JwYWdlc193YmMoY2MsIHdiYywgZmFsc2UsIGZhbHNlKTsKPj4gICBkZXN0
cm95X291dDoKPj4gICAJZjJmc19kZXN0cm95X2NvbXByZXNzX2N0eChjYywgZmFsc2UpOwo+PiAg
IAlyZXR1cm4gZXJyOwo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2Rh
dGEuYwo+PiBpbmRleCAxZjA5MGMwMThmMWIuLmRhY2EyYTQyYjIwYyAxMDA2NDQKPj4gLS0tIGEv
ZnMvZjJmcy9kYXRhLmMKPj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPj4gQEAgLTM2MjEsOCArMzYy
MSw3IEBAIHN0YXRpYyBpbnQgZjJmc193cml0ZV9iZWdpbihjb25zdCBzdHJ1Y3Qga2lvY2IgKmlv
Y2IsCj4+ICAgCQlmb2xpb19sb2NrKGZvbGlvKTsKPj4gICAJCWlmIChmb2xpby0+bWFwcGluZyAh
PSBtYXBwaW5nKSB7Cj4+ICAgCQkJLyogVGhlIGZvbGlvIGdvdCB0cnVuY2F0ZWQgZnJvbSB1bmRl
ciB1cyAqLwo+PiAtCQkJZm9saW9fdW5sb2NrKGZvbGlvKTsKPj4gLQkJCWZvbGlvX3B1dChmb2xp
byk7Cj4+ICsJCQlmMmZzX2ZvbGlvX3B1dChmb2xpbywgdHJ1ZSk7Cj4gCj4gWW9uZ3BlbmcsCj4g
Cj4gSSBwcmVmZXIgdG8gbm90IHVzZSBmMmZzX2ZvbGlvX3B1dCgpIGhlcmUsIHRvIGF2b2lkIHBv
dGVudGlhbCBudWxsLXB0ciBkZXJlZmVyZW5jZQo+IG9uIGZvbGlvLT5tYXBwaW5nIHZpYSBmMmZz
X2ZvbGlvX3B1dCgpIC0+IEYyRlNfRl9TQigpLCBhcyBmb2xpby0+bWFwcGluZyBjb3VsZCBiZQo+
IE5VTEwgZHVlIHRvIHJhY2Ugdy8gdHJ1bmNhdGlvbi4KPgpUaGFua3MgZm9yIHBvaW50aW5nIGl0
IG91dC4gSeKAmWxsIGZpeCB0aGlzIGluIHYyLiBeX14KWW9uZ3BlbmcKPj4gICAJCQlnb3RvIHJl
cGVhdDsKPj4gICAJCX0KPj4gICAJfQo+PiBAQCAtMzY1Myw4ICszNjUyLDcgQEAgc3RhdGljIGlu
dCBmMmZzX3dyaXRlX2JlZ2luKGNvbnN0IHN0cnVjdCBraW9jYiAqaW9jYiwKPj4gICAKPj4gICAJ
CWZvbGlvX2xvY2soZm9saW8pOwo+PiAgIAkJaWYgKHVubGlrZWx5KGZvbGlvLT5tYXBwaW5nICE9
IG1hcHBpbmcpKSB7Cj4+IC0JCQlmb2xpb191bmxvY2soZm9saW8pOwo+PiAtCQkJZm9saW9fcHV0
KGZvbGlvKTsKPj4gKwkJCWYyZnNfZm9saW9fcHV0KGZvbGlvLCB0cnVlKTsKPiAKPiBEaXR0bywK
PiAKPiBUaGFua3MsCj4gCj4+ICAgCQkJZ290byByZXBlYXQ7Cj4+ICAgCQl9Cj4+ICAgCQlpZiAo
dW5saWtlbHkoIWZvbGlvX3Rlc3RfdXB0b2RhdGUoZm9saW8pKSkgewo+PiBAQCAtMzY2NSw4ICsz
NjYzLDcgQEAgc3RhdGljIGludCBmMmZzX3dyaXRlX2JlZ2luKGNvbnN0IHN0cnVjdCBraW9jYiAq
aW9jYiwKPj4gICAJcmV0dXJuIDA7Cj4+ICAgCj4+ICAgcHV0X2ZvbGlvOgo+PiAtCWZvbGlvX3Vu
bG9jayhmb2xpbyk7Cj4+IC0JZm9saW9fcHV0KGZvbGlvKTsKPj4gKwlmMmZzX2ZvbGlvX3B1dChm
b2xpbywgdHJ1ZSk7Cj4+ICAgZmFpbDoKPj4gICAJZjJmc193cml0ZV9mYWlsZWQoaW5vZGUsIHBv
cyArIGxlbik7Cj4+ICAgCXJldHVybiBlcnI7Cj4+IEBAIC0zNzIyLDggKzM3MTksNyBAQCBzdGF0
aWMgaW50IGYyZnNfd3JpdGVfZW5kKGNvbnN0IHN0cnVjdCBraW9jYiAqaW9jYiwKPj4gICAJCQkJ
CXBvcyArIGNvcGllZCk7Cj4+ICAgCX0KPj4gICB1bmxvY2tfb3V0Ogo+PiAtCWZvbGlvX3VubG9j
ayhmb2xpbyk7Cj4+IC0JZm9saW9fcHV0KGZvbGlvKTsKPj4gKwlmMmZzX2ZvbGlvX3B1dChmb2xp
bywgdHJ1ZSk7Cj4+ICAgCWYyZnNfdXBkYXRlX3RpbWUoRjJGU19JX1NCKGlub2RlKSwgUkVRX1RJ
TUUpOwo+PiAgIAlyZXR1cm4gY29waWVkOwo+PiAgIH0KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
ZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPj4gaW5kZXggOTRlYjlhMmQzYTczLi4zMmZiMmU3MzM4
YjcgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5o
Cj4+IEBAIC0yOTc5LDcgKzI5NzksNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZjJmc19mb2xpb19w
dXQoc3RydWN0IGZvbGlvICpmb2xpbywgYm9vbCB1bmxvY2spCj4+ICAgCWZvbGlvX3B1dChmb2xp
byk7Cj4+ICAgfQo+PiAgIAo+PiAtc3RhdGljIGlubGluZSB2b2lkIGYyZnNfcHV0X3BhZ2Uoc3Ry
dWN0IHBhZ2UgKnBhZ2UsIGludCB1bmxvY2spCj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgZjJmc19w
dXRfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSwgYm9vbCB1bmxvY2spCj4+ICAgewo+PiAgIAlpZiAo
IXBhZ2UpCj4+ICAgCQlyZXR1cm47Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2djLmMgYi9mcy9m
MmZzL2djLmMKPj4gaW5kZXggMjJmZTZlMmM2ZDVjLi5mZDhiYjA0MjRiZjMgMTAwNjQ0Cj4+IC0t
LSBhL2ZzL2YyZnMvZ2MuYwo+PiArKysgYi9mcy9mMmZzL2djLmMKPj4gQEAgLTEyNzgsNyArMTI3
OCw3IEBAIHN0YXRpYyBpbnQgcmFfZGF0YV9ibG9jayhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBwZ29m
Zl90IGluZGV4KQo+PiAgIAllcnIgPSBmMmZzX3N1Ym1pdF9wYWdlX2JpbygmZmlvKTsKPj4gICAJ
aWYgKGVycikKPj4gICAJCWdvdG8gcHV0X2VuY3J5cHRlZF9wYWdlOwo+PiAtCWYyZnNfcHV0X3Bh
Z2UoZmlvLmVuY3J5cHRlZF9wYWdlLCAwKTsKPj4gKwlmMmZzX3B1dF9wYWdlKGZpby5lbmNyeXB0
ZWRfcGFnZSwgZmFsc2UpOwo+PiAgIAlmMmZzX2ZvbGlvX3B1dChmb2xpbywgdHJ1ZSk7Cj4+ICAg
Cj4+ICAgCWYyZnNfdXBkYXRlX2lvc3RhdChzYmksIGlub2RlLCBGU19EQVRBX1JFQURfSU8sIEYy
RlNfQkxLU0laRSk7Cj4+IEBAIC0xMjg2LDcgKzEyODYsNyBAQCBzdGF0aWMgaW50IHJhX2RhdGFf
YmxvY2soc3RydWN0IGlub2RlICppbm9kZSwgcGdvZmZfdCBpbmRleCkKPj4gICAKPj4gICAJcmV0
dXJuIDA7Cj4+ICAgcHV0X2VuY3J5cHRlZF9wYWdlOgo+PiAtCWYyZnNfcHV0X3BhZ2UoZmlvLmVu
Y3J5cHRlZF9wYWdlLCAxKTsKPj4gKwlmMmZzX3B1dF9wYWdlKGZpby5lbmNyeXB0ZWRfcGFnZSwg
dHJ1ZSk7Cj4+ICAgcHV0X2ZvbGlvOgo+PiAgIAlmMmZzX2ZvbGlvX3B1dChmb2xpbywgdHJ1ZSk7
Cj4+ICAgCXJldHVybiBlcnI7Cj4+IEBAIC0xNDQyLDcgKzE0NDIsNyBAQCBzdGF0aWMgaW50IG1v
dmVfZGF0YV9ibG9jayhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBibG9ja190IGJpZHgsCj4+ICAgCWYy
ZnNfdXBkYXRlX2RhdGFfYmxrYWRkcigmZG4sIG5ld2FkZHIpOwo+PiAgIAlzZXRfaW5vZGVfZmxh
Zyhpbm9kZSwgRklfQVBQRU5EX1dSSVRFKTsKPj4gICAKPj4gLQlmMmZzX3B1dF9wYWdlKGZpby5l
bmNyeXB0ZWRfcGFnZSwgMSk7Cj4+ICsJZjJmc19wdXRfcGFnZShmaW8uZW5jcnlwdGVkX3BhZ2Us
IHRydWUpOwo+PiAgIHJlY292ZXJfYmxvY2s6Cj4+ICAgCWlmIChlcnIpCj4+ICAgCQlmMmZzX2Rv
X3JlcGxhY2VfYmxvY2soZmlvLnNiaSwgJnN1bSwgbmV3YWRkciwgZmlvLm9sZF9ibGthZGRyLAo+
PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9pbmxpbmUuYyBiL2ZzL2YyZnMvaW5saW5lLmMKPj4gaW5k
ZXggNThhYzgzMWVmNzA0Li5lNWM2YTA4YjdlNGYgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvaW5s
aW5lLmMKPj4gKysrIGIvZnMvZjJmcy9pbmxpbmUuYwo+PiBAQCAtMjg3LDcgKzI4Nyw3IEBAIGlu
dCBmMmZzX3dyaXRlX2lubGluZV9kYXRhKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmb2xp
byAqZm9saW8pCj4+ICAgCXNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9EQVRBX0VYSVNUKTsKPj4g
ICAKPj4gICAJZm9saW9fY2xlYXJfZjJmc19pbmxpbmUoaWZvbGlvKTsKPj4gLQlmMmZzX2ZvbGlv
X3B1dChpZm9saW8sIDEpOwo+PiArCWYyZnNfZm9saW9fcHV0KGlmb2xpbywgdHJ1ZSk7Cj4+ICAg
CXJldHVybiAwOwo+PiAgIH0KPj4gICAKPj4gQEAgLTU3Nyw3ICs1NzcsNyBAQCBzdGF0aWMgaW50
IGYyZnNfbW92ZV9yZWhhc2hlZF9kaXJlbnRzKHN0cnVjdCBpbm9kZSAqZGlyLCBzdHJ1Y3QgZm9s
aW8gKmlmb2xpbywKPj4gICAJZjJmc19pX2RlcHRoX3dyaXRlKGRpciwgMCk7Cj4+ICAgCWYyZnNf
aV9zaXplX3dyaXRlKGRpciwgTUFYX0lOTElORV9EQVRBKGRpcikpOwo+PiAgIAlmb2xpb19tYXJr
X2RpcnR5KGlmb2xpbyk7Cj4+IC0JZjJmc19mb2xpb19wdXQoaWZvbGlvLCAxKTsKPj4gKwlmMmZz
X2ZvbGlvX3B1dChpZm9saW8sIHRydWUpOwo+PiAgIAo+PiAgIAlrZnJlZShiYWNrdXBfZGVudHJ5
KTsKPj4gICAJcmV0dXJuIGVycjsKPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvbmFtZWkuYyBiL2Zz
L2YyZnMvbmFtZWkuYwo+PiBpbmRleCA2OGIzM2U4MDg5YjAuLjA3Y2VlZDE3M2ZmZSAxMDA2NDQK
Pj4gLS0tIGEvZnMvZjJmcy9uYW1laS5jCj4+ICsrKyBiL2ZzL2YyZnMvbmFtZWkuYwo+PiBAQCAt
MTI1OSwxMSArMTI1OSwxMSBAQCBzdGF0aWMgaW50IGYyZnNfY3Jvc3NfcmVuYW1lKHN0cnVjdCBp
bm9kZSAqb2xkX2Rpciwgc3RydWN0IGRlbnRyeSAqb2xkX2RlbnRyeSwKPj4gICAJcmV0dXJuIDA7
Cj4+ICAgb3V0X25ld19kaXI6Cj4+ICAgCWlmIChuZXdfZGlyX2VudHJ5KSB7Cj4+IC0JCWYyZnNf
Zm9saW9fcHV0KG5ld19kaXJfZm9saW8sIDApOwo+PiArCQlmMmZzX2ZvbGlvX3B1dChuZXdfZGly
X2ZvbGlvLCBmYWxzZSk7Cj4+ICAgCX0KPj4gICBvdXRfb2xkX2RpcjoKPj4gICAJaWYgKG9sZF9k
aXJfZW50cnkpIHsKPj4gLQkJZjJmc19mb2xpb19wdXQob2xkX2Rpcl9mb2xpbywgMCk7Cj4+ICsJ
CWYyZnNfZm9saW9fcHV0KG9sZF9kaXJfZm9saW8sIGZhbHNlKTsKPj4gICAJfQo+PiAgIG91dF9u
ZXc6Cj4+ICAgCWYyZnNfZm9saW9fcHV0KG5ld19mb2xpbywgZmFsc2UpOwo+IAo+IAo+IAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
