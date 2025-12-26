Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1646CDE4C3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Dec 2025 04:39:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGDNyIEhHAfNbCGpZIN8ttdiJLQ4gZ84W8gEmUXNoCA=; b=l0icZo21CASoDfqBRt6T9+S77Q
	eaeJgZBz7BjmFQlvl2NhbV+P0O1kDVMVVVBT0xGGkQuWlKRS/ZX2DlOmQJ5uHtWsVYfKEjGSBCnsf
	1ZpM21aHTDh3tjaY4SP4we2gHcvBkBV0vSYHGqvyhZlCuYIrkdyXTgk6Mp5DIZfsQ3dM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vYyfm-0007FJ-Ab;
	Fri, 26 Dec 2025 03:39:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vYyfl-0007FD-K7
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 03:39:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8O9hTWYqZQdHOo2J0ENaeddvlgCWCBTSdumyaAmIAKc=; b=FWRclZXEDvtD/RJS+dRNLFOagd
 HBgYUvEDZ97q3EY/btjUS5x3xid7OZRq9+Qq4KgYKY11daC+8UadhSBaaZYxuce4qlQ9LVMorv2x8
 G8bd9Wdokd9vOb2Rj5AePqP4x83MU6UMHN6Nq9+BDAObuVUVCB2WLyhwwBhFJR1U12ts=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8O9hTWYqZQdHOo2J0ENaeddvlgCWCBTSdumyaAmIAKc=; b=M+7NtHqEl4KPSUBIki+Fl7cGud
 w4Xbv0HLBeeevckytIIuLZGbvv9MzlgJPHfm08dZpl1QFHMePnEMUvqkBWecCpVK49HyFHuO3kuYT
 DlWIm41aM8LCmrBTPVfyDxBGGmKQUdd5XEYrCZcXw81XId+wkTBhxmCQnuZO5Tu1oK3k=;
Received: from mail-pf1-f172.google.com ([209.85.210.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vYyfl-0005s1-3r for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 03:39:25 +0000
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-7b22ffa2a88so6538799b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Dec 2025 19:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766720354; x=1767325154; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8O9hTWYqZQdHOo2J0ENaeddvlgCWCBTSdumyaAmIAKc=;
 b=TosBYJP9Fa8HoQ9k/I6D/Yz2imVtUimbYN/7pw7xgPl78qM24eY8BHgmObDZaD87Pb
 /4ThGOPlN5/SYuWXObZ7oHRr5H7oC0Mi/JVDo5b5l8DI6wwUe+u/zPvQnYr9ZDKdCfgz
 VQhDzjqQIpzq87AQ0fE2og3PtXP6Rt2I/WXaRTPEF/atGhiGhckwEZslMQCpBVOgJjob
 62FxAjZ7oO81OTbLGtUvkHIMOeDdMWUdGwujCSnknLgVGSjMSHx1EcR0bm+NcIeewd59
 rizRgyfpOjfVDWWp01FcS9IKidSdLEd8EUB4q6uFYdYDuRd8LqeyvVm+im5xRh4aCMAl
 Avjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766720354; x=1767325154;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8O9hTWYqZQdHOo2J0ENaeddvlgCWCBTSdumyaAmIAKc=;
 b=etui6fp2gBI67nusWZqvCcZdWeKLPgSU8d/gd5fR+YDB1HpgzJ2ARIEzclJF6sSgT4
 950SwtaXFBrrU08gOlTxWD7X84Zis3YKv7jdRmkXNt/asJhrEBD+5pNTin28FualTnZq
 A9pbhqt5GRGAfzhUx+FSjp/bQjKj471Hj5pSQuZ1g6xMF55Ib2sIHtQVA+yZFWmk3rV9
 czZfsBQ0Hykpf/Y+2B73nW4upL/cw/cZJohRGk/BV0cM8HhysqKaZvm2ORuQ2JM3UfSG
 lB2nt7u/dhXaN67adDA84C6N5vCIke9hf1zWYXQ34ZgElL+3/nh7ibZUI717tXSdJwzA
 Yiuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrW2Fl1j913yS8RhcklgOXUYEb5TmuzF/A62MzbZyH2OAOtermygWxPtck/AiJqrkeXK3+UyY2C/4xmZ6BsLql@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwJ/jgdxfW4c5vT2bVojvupBIuy/63VREJGcWWWdoeBhXXO1691
 npfOF/yoF9RMpcAHwck9Y+IyPN2vlpaQJdZGWrROEeT+88x4n+bweV+7
X-Gm-Gg: AY/fxX6u+fCMyv111cia43Jtil1njFr0lNa70kVN4FUt+/0K0FmPUfNq0l3d04nb85H
 +qwbIjPbJa1RP/Cyx1994b51x/+2vOkKq/BOldLvUKV/NPyA7aIkg/tldRfMYjgg5WBdHt/QskU
 MeHJCCfpyH1Si7i4Snl5lxOIOA7toGQpCubOxXV7tFXpM8QaIu/peUJsW6mfcHROBlLsR/mwLRy
 ojK/hWPhmdxe3D0c/jm7JpOBYt6q2QYBfIi7tlZFMG9m6g88RtyJQzrHzK2ZZXOGTf9Gp2F7bxg
 nXQHNsb54727GHjeiu2t0iNY9cQky5PKgpmjwQdGJd3Jegym1ekgJ4adxWnB4qKi6JY6HSJNxsi
 vj33/GHNE4m59gLyVG4ousI4SPWDjDC8qysDJth+RYuA6zqTMATlmCqyDucoIl6Ff9vAjTHAo2l
 AU7KY9B5P44QD1aXz93JQMkw002uCC3Ay4Wk31yaZJ
X-Google-Smtp-Source: AGHT+IHbNXW13PAey7qzqFHewihChx62MCp8nHidS3FP5UlB1d75EHmGSD6SsN6qIiLBHJ+IQCJkZw==
X-Received: by 2002:a05:6a00:a115:b0:7f1:55f9:f57 with SMTP id
 d2e1a72fcca58-7ff6804b24cmr21066812b3a.63.1766720354291; 
 Thu, 25 Dec 2025 19:39:14 -0800 (PST)
Received: from [10.189.138.37] ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7a84368dsm20831873b3a.2.2025.12.25.19.39.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Dec 2025 19:39:13 -0800 (PST)
Message-ID: <fe7c94da-d16f-4de7-9d03-377e0085d060@gmail.com>
Date: Fri, 26 Dec 2025 11:39:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Yongpeng Yang
 <yangyongpeng.storage@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251225125954.4055570-2-yangyongpeng.storage@gmail.com>
 <622035a5-b579-4575-b76c-f7a7b764f0e0@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
In-Reply-To: <622035a5-b579-4575-b76c-f7a7b764f0e0@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/26/25 09:52, Chao Yu via Linux-f2fs-devel wrote: > On
 12/25/2025 8:59 PM,
 Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> f2fs_folio_wait_writeback
 ensures the folio write is submitted to th [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.210.172 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.172 listed in wl.mailspike.net]
X-Headers-End: 1vYyfl-0005s1-3r
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: return immediately after
 submitting the specified folio in __submit_merged_write_cond
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
Cc: Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTIvMjYvMjUgMDk6NTIsIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4g
T24gMTIvMjUvMjAyNSA4OjU5IFBNLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+PiBGcm9tOiBZb25n
cGVuZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4KPj4gZjJmc19mb2xpb193YWl0
X3dyaXRlYmFjayBlbnN1cmVzIHRoZSBmb2xpbyB3cml0ZSBpcyBzdWJtaXR0ZWQgdG8gdGhlCj4g
Cj4gQWN0dWFsbHksIF9fc3VibWl0X21lcmdlZF93cml0ZV9jb25kKCkgd2FzIGNhbGxlZCBmcm9t
IG1hbnkgb3RoZXIgcGxhY2VzLAo+IGZvciB0aG9zZSBzY2VuYXJpbywgd2UgY2FuIG5vdCBlbnN1
cmUgd2hldGhlciB0aGUgREFUQSBvciBOT0RFIHR5cGUgcGFnZXMKPiB3ZXJlIGNhY2hlZCBpbiBv
bmUgYmlvIGNhY2hlIG9yIG5vdCwgc28gd2UgZGVjaWRlIHRvIHN1Ym1pdCBhbGwgY2FjaGVkIGJp
b3MKPiB3LyBEQVRBIG9yIE5PREUgdHlwZS4KPiAKPj4gYmxvY2sgbGF5ZXIgdmlhIF9fc3VibWl0
X21lcmdlZF93cml0ZV9jb25kLCB0aGVuIHdhaXRzIGZvciB0aGUgZm9saW8gdG8KPj4gY29tcGxl
dGUuIE90aGVyIEkvTyBzdWJtaXNzaW9ucyBhcmUgaXJyZWxldmFudCB0bwo+PiBmMmZzX2ZvbGlv
X3dhaXRfd3JpdGViYWNrLiBUaHVzLCBpZiB0aGUgZm9saW8gd3JpdGUgYmlvIGlzIGFscmVhZHkK
PiAKPiBGb3IgZjJmc19mb2xpb193YWl0X3dyaXRlYmFjaygpIGNhc2UsIEkgZ3Vlc3MgeW91IGNh
biBvcHRpbWl6ZSBpdAo+IHNlcGFyYXRlbHksCj4gbWF5YmUgcGFzc2luZyBhIHBhcmFtZXRlciB0
byBfX3N1Ym1pdF9tZXJnZWRfd3JpdGVfY29uZCgpIGFzIGEgaGludD8KCkN1cnJlbnRseSwgb25s
eSB0aGUgY2FsbCBjaGFpbiBmMmZzX2ZvbGlvX3dhaXRfd3JpdGViYWNrCi0+IGYyZnNfc3VibWl0
X21lcmdlZF93cml0ZV9jb25kLT5fX3N1Ym1pdF9tZXJnZWRfd3JpdGVfY29uZCBwYXNzZXMgYQpu
b24tTlVMTCBmb2xpbyB3aXRoIGEgTlVMTCBpbm9kZS4gV2hlbiB0aGUgcmV0dXJuIHZhbHVlIG9m
Cl9faGFzX21lcmdlZF9wYWdlIGlzIHRydWUgYW5kIHRoZSBmb2xpbyBpcyBub24tTlVMTCwgaXQg
aW5kaWNhdGVzIHRoZQpjYWxsIGlzIGZyb20gZjJmc19mb2xpb193YWl0X3dyaXRlYmFjay4gSW5k
ZWVkLCB0aGlzIGlzIHVuY2xlYXIuCgpUaGUgZm9yY2UgcGFyYW1ldGVyIHNlZW1zIHJlZHVuZGFu
dCwgd2hlcmUgZm9yY2UgPSB0cnVlIGltcGxpZXMgYGlub2RlCj09IE5VTEwgJiYgZm9saW8gPT0g
TlVMTCAmJiBpbm8gPT0gMGAgaXMgdHJ1ZSwgYW5kIGZvcmNlID0gZmFsc2UgaW1wbGllcwpgaW5v
ZGUgIT0gTlVMTCB8fCBmb2xpbyAhPSBOVUxMIHx8IGlubyAhPSAwYCBpcyB0cnVlLgoKSG93IGFi
b3V0IHJlbW92aW5nIHRoZSBmb3JjZSBwYXJhbWV0ZXIgYW5kIGFkZGluZyBhIGBib29sIHdyaXRl
YmFja2AKcGFyYW1ldGVyIHRvIGluZGljYXRlIGNhbGxzIGZyb20gZjJmc19mb2xpb193YWl0X3dy
aXRlYmFjaz8KClRoYW5rcwpZb25ncGVuZywKCj4gCj4gVGhhbmtzLAo+IAo+PiBzdWJtaXR0ZWQs
IHRoZSBmdW5jdGlvbiBjYW4gcmV0dXJuIGltbWVkaWF0ZWx5Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBZb25ncGVuZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4gLS0tCj4+IMKgIGZz
L2YyZnMvZGF0YS5jIHwgNiArKysrKy0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9m
cy9mMmZzL2RhdGEuYwo+PiBpbmRleCAxMmJmNGI2ZTAwNzUuLmM3NDMzNTJiNjg2ZCAxMDA2NDQK
Pj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPj4gQEAgLTY3
OCw4ICs2NzgsMTIgQEAgc3RhdGljIHZvaWQgX19zdWJtaXRfbWVyZ2VkX3dyaXRlX2NvbmQoc3Ry
dWN0Cj4+IGYyZnNfc2JfaW5mbyAqc2JpLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXQgPSBfX2hhc19tZXJnZWRfcGFnZShpby0+YmlvLCBpbm9kZSwgZm9saW8sIGlubyk7Cj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfdXBfcmVhZCgmaW8tPmlvX3J3c2VtKTsKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gLcKgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+ICvCoMKg
wqDCoMKgwqDCoCBpZiAocmV0KSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZjJm
c19zdWJtaXRfbWVyZ2VkX3dyaXRlKHNiaSwgdHlwZSwgdGVtcCk7Cj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC8qIGRvbid0IG5lZWQgdG8gc3VibWl0IG90aGVyIHR5cGVzIG9mIGJpby4gKi8K
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGZvbGlvKQo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiArwqDCoMKgwqDCoMKgwqAgfQo+PiDCoCDCoMKgwqDC
oMKgwqDCoMKgwqAgLyogVE9ETzogdXNlIEhPVCB0ZW1wIG9ubHkgZm9yIG1ldGEgcGFnZXMgbm93
LiAqLwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHR5cGUgPj0gTUVUQSkKPiAKPiAKPiAKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
