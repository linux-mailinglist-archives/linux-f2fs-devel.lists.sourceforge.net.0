Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 363E7CD9299
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Dec 2025 13:02:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4FoMMjmHWK06LnCCirYa1MdVPxmtVPFtik78YcxOMMU=; b=Ev+Cjx6RbmRi/vm+DQY7PWhiD1
	hWOEtZTbAGP6KIc0yfzD5X2fMmR/fwJalGUfnynLEmWgZHHCtCP6UBMMUMrPHaf3B4f6psXlTSK+q
	0ssXd74jrvyzraXnXmumUVtwASXeuBOms+hOCGn8CXj5jCDr8DYe4qR7VP1TlEzI6mFQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vY15u-0001WX-8Y;
	Tue, 23 Dec 2025 12:02:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vY15s-0001WR-H0
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Dec 2025 12:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=maG3nfG4Pp06Y58MmlzUbp4PZ6hKzU9AauI2f8Y9vok=; b=Ffk5XHQ0h8LtE6QUWRhI8qsUZp
 udOPAeNvX7jZjGJd8gEUZ/nfQg7S9UsvdMn+LrDDdLqMzWUK5JL0/irMwr2N2GCSQ5veIdEcWnH4j
 jjV6g8UP4qeyupeEpGRe7MM1sR4q0Y+zfcTLuP0NxoxMAcZvJUNvDXTDnoEHxMtVJSNQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=maG3nfG4Pp06Y58MmlzUbp4PZ6hKzU9AauI2f8Y9vok=; b=BzyjAccxmjtOEx2+VO+USaELPa
 xqqf1SuukvWRJ3z4O9f5Ax82QpWqFJ8xS2ftmPLMq0v1y4RTCTNt/WeZA26qjC7KDYkia05lkPcnV
 IY0MnPgWjzM6K+TBhI6/SpcsryLqRmsh7xrZZpR0fmO6zz6WcvBfitR3gB9o0y7qGiLM=;
Received: from mail-pf1-f170.google.com ([209.85.210.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vY15p-0000Ao-Pl for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Dec 2025 12:02:24 +0000
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7e1651ae0d5so3915192b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Dec 2025 04:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766491329; x=1767096129; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=maG3nfG4Pp06Y58MmlzUbp4PZ6hKzU9AauI2f8Y9vok=;
 b=bVt9nll5aVdXc3R0BQrdEVCoOC/URI4npA7DsHjO4JTt6MqPivms6yXaDpPrOHBtF8
 eYmA6SPKOlOYDUo9suGfNM17et6A0mlo5cni1xt3h+Ban0kFZMdkUbidDW53hBQHe+jS
 02qm88Y1K7WC0vUpKFzP5U68XHva4JuMmrSVs2U27gCUNYGyi/m3OdAPZeLLiSW6/21I
 ZE3wBh0vaV2LfaBHPuc+iLvfL6yg+PVUpkYV4667/pFyArqKsuI7DIjK8VE+XViYWPKd
 a8fkrmZN1/AUqgMpjcPhLo6CgBkeurgl7t9Sddv0LHWehmSnVWvuw4QgPrn62/Ni1Vp2
 Qsag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766491329; x=1767096129;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=maG3nfG4Pp06Y58MmlzUbp4PZ6hKzU9AauI2f8Y9vok=;
 b=P7r1YC2F1jkXZ29DHdkIMXhn+Ak5m1Hm0ssx/IKhR2wZ5JnNO69F7b8fJE3IggkMnw
 kEMSQmE+Pumc81rTQwBfbED3JHRrZ7bdD6YnlrcKaxOcYU02bNFGPK5PVj+JTwOOoSNa
 k030xGkDRizWE061OgB/g5ow0GZjpnFzoPyLKoxBBFYbE9XWG88TNeOQRAhyBRXLSptG
 7ffGmjndM0Oz2+uA0/gnBw9qKm2WSxyEEC0TMVjBxozUnqYfUUN2V69nzKAnTscNnf+G
 AGc8Saa902NSVC4lq/PQUhLsKiZt+phujAP8gnPxBeWGf8LnXV7Ct06+81Cf15XidSwQ
 s7JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOqObqjrQfL2BFSm60CAMoyj9fsb/ZgBaSRqjNIzn0+/k3Lhulm4BNEGXcUtVjkGc4CGWKwzAwmEv35g0E6Q0y@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzqdoAKnb1jqxlNvLD5JTs9OXYlW0gXBspemdgRAiEIm4+OLtx8
 6RfmziBlmqcx+KNRANwew2zM0BuEOln98pY17Tnk7diyrRue0JU1QrUi
X-Gm-Gg: AY/fxX43t8AdZHXSw7JseWwo8LQi3uqvjJ//ne+mfrq1+USEn4MZp+5M8tuPKPczcsk
 aPvq+IqyFOwLCwg4tpAAFXu12iiN09UIHjYMRWeL/VQfZQlT2jQlCqXiEHGH1a2ssOCvwUFCBuM
 vyQDBVT0fPJXLdLw8H/qZf0rXwKmridlVlmGdO5ZWqqdXk1b7g898X+eBglTVnXn3v7O0KVvuax
 qn0MGf6DvqTm5DpxdrHGeo5ndUWU9B3Y0uexbrRxJB0F79SFKFcO4jV03zYxafq8Etq7SV0nMuJ
 J7udL3Wj6Gg26c4vYngR0l+ME2kQwx2/ThdD0xCqTFEh+Dldn5IaTmfIbyLCZJHfhcBnbtVnqLp
 UBe7eslk4HOnHGTpPP79A5cm57gt+cWEwHKYo4cSpskq0iY6HhZIxWq4p6zwyYlCMVjz67vubPT
 zf5G5+93EVcVIN8XaYlGdPcFdR4uGpxg==
X-Google-Smtp-Source: AGHT+IEuGE46bUChq7xtV4b/btwQuaR1JpPaiteJYQ7d/X/kdARhMAS0z8b7O9yoC3FEWnW0hTuyXQ==
X-Received: by 2002:a05:6a00:414f:b0:7e8:4587:e8d1 with SMTP id
 d2e1a72fcca58-7ff66a6ec03mr12148759b3a.68.1766491328579; 
 Tue, 23 Dec 2025 04:02:08 -0800 (PST)
Received: from [10.189.138.37] ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e48f3d7sm13668790b3a.51.2025.12.23.04.02.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Dec 2025 04:02:08 -0800 (PST)
Message-ID: <d6557e0a-a433-4dd1-bf02-d74cc6998592@gmail.com>
Date: Tue, 23 Dec 2025 20:02:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Yongpeng Yang
 <yangyongpeng.storage@gmail.com>, Yunlei He <heyunlei1988@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251107062907.384287-1-heyunlei1988@gmail.com>
 <268cf104-6f77-419c-931e-c5cd82c3a921@kernel.org>
 <047b0d23-102e-41ce-b8b8-c7cb8ac31b21@gmail.com>
 <128fd300-d2d1-4169-a86f-a0babb47101b@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
In-Reply-To: <128fd300-d2d1-4169-a86f-a0babb47101b@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/10/25 17:32, Chao Yu via Linux-f2fs-devel wrote: >
 On 11/10/25 17:20, Yongpeng Yang wrote: >> On 11/8/25 11:11,
 Chao Yu via Linux-f2fs-devel
 wrote: >>> Yunlei, >>> >>> On 2025/11/7 14:29, Yunle [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.170 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vY15p-0000Ao-Pl
Subject: Re: [f2fs-dev] [PATCH] f2fs: drop non uptodata page during GC
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ck9uIDExLzEwLzI1IDE3OjMyLCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+
IE9uIDExLzEwLzI1IDE3OjIwLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+PiBPbiAxMS84LzI1IDEx
OjExLCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+Pj4gWXVubGVpLAo+Pj4K
Pj4+IE9uIDIwMjUvMTEvNyAxNDoyOSwgWXVubGVpIEhlIHdyb3RlOgo+Pj4+IEZyb206IFl1bmxl
aSBIZSA8aGV5dW5sZWlAeGlhb21pLmNvbT4KPj4+Pgo+Pj4+IEdDIG1vdmUgZmJlIGRhdGEgYmxv
Y2sgd2lsbCBhZGQgc29tZSBub24gdXB0b2RhdGUgcGFnZSwgd2UnZAo+Pj4+IGJldHRlciByZWxl
YXNlIGl0IGF0IHRoZSBlbmQuCj4+Pgo+Pj4gVGhpcyBpcyBqdXN0IGZvciBzYXZpbmcgbWVtb3J5
LCByaWdodD8KPj4+Cj4+Cj4+IFllcywgbW92ZV9kYXRhX2Jsb2NrKCkgZG9lc27igJl0IHJlYWQg
YW55IGRhdGEgdG8gZm9saW8sIGFuZCB0aGUgR0MKPj4gdXN1YWxseSBzZWxlY3RzIGNvbGQgZGF0
YS4gVGhlcmVmb3JlLCB0aGlzIGZvbGlvIGlzIHR5cGljYWxseSBub3QKPj4gdXB0b2RhdGUsIGFu
ZCB0aGVyZeKAmXMgbm8gbmVlZCBmb3IgaXQgdG8gb2NjdXB5IHRoZSBwYWdlIGNhY2hlLgo+Pgo+
Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogWXVubGVpIEhlIDxoZXl1bmxlaUB4aWFvbWkuY29tPgo+
Pj4+IFNpZ25lZC1vZmYtYnk6IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29t
Pgo+Pj4+IC0tLQo+Pj4+IMKgIGZzL2YyZnMvZ2MuYyB8IDUgKysrKysKPj4+PiDCoCAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9n
Yy5jIGIvZnMvZjJmcy9nYy5jCj4+Pj4gaW5kZXggOGFiZjUyMTUzMGZmLi4wOWI2NWU2ZWE4NTMg
MTAwNjQ0Cj4+Pj4gLS0tIGEvZnMvZjJmcy9nYy5jCj4+Pj4gKysrIGIvZnMvZjJmcy9nYy5jCj4+
Pj4gQEAgLTEzMTUsNiArMTMxNSw3IEBAIHN0YXRpYyBpbnQgbW92ZV9kYXRhX2Jsb2NrKHN0cnVj
dCBpbm9kZSAqaW5vZGUsIGJsb2NrX3QgYmlkeCwKPj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBub2Rl
X2luZm8gbmk7Cj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZm9saW8gKmZvbGlvLCAqbWZvbGlvOwo+
Pj4+IMKgwqDCoMKgwqAgYmxvY2tfdCBuZXdhZGRyOwo+Pj4+ICvCoMKgwqAgYm9vbCBuZWVkX2lu
dmFsaWRhdGUgPSB0cnVlOwo+Pj4+IMKgwqDCoMKgwqAgaW50IGVyciA9IDA7Cj4+Pj4gwqDCoMKg
wqDCoCBib29sIGxmc19tb2RlID0gZjJmc19sZnNfbW9kZShmaW8uc2JpKTsKPj4+PiDCoMKgwqDC
oMKgIGludCB0eXBlID0gZmlvLnNiaS0+YW0uYXRnY19lbmFibGVkICYmIChnY190eXBlID09IEJH
X0dDKSAmJgo+Pj4+IEBAIC0xNDUwLDcgKzE0NTEsMTEgQEAgc3RhdGljIGludCBtb3ZlX2RhdGFf
YmxvY2soc3RydWN0IGlub2RlICppbm9kZSwgYmxvY2tfdCBiaWR4LAo+Pj4+IMKgIHB1dF9vdXQ6
Cj4+Pj4gwqDCoMKgwqDCoCBmMmZzX3B1dF9kbm9kZSgmZG4pOwo+Pj4+IMKgIG91dDoKPj4+PiAr
wqDCoMKgIGlmIChmb2xpb190ZXN0X3VwdG9kYXRlKGZvbGlvKSkKPj4+PiArwqDCoMKgwqDCoMKg
wqAgbmVlZF9pbnZhbGlkYXRlID0gZmFsc2U7Cj4+Pgo+Pj4gSG93IGFib3V0IGRyb3BwaW5nIHN1
Y2ggZm9saW8gdW5kZXIgaXRzIGxvY2s/Cj4+Pgo+Pj4gaWYgKCFmb2xpb190ZXN0X3VwdG9kYXRl
KCkpCj4+PiDCoMKgwqDCoMKgdHJ1bmNhdGVfaW5vZGVfcGFydGlhbF9mb2xpbygpCj4+Pgo+Pgo+
PiB0cnVuY2F0ZV9pbm9kZV9wYXJ0aWFsX2ZvbGlvKCkgaXMgbW9yZSBlZmZpY2llbnQgc2luY2Ug
aXQgYXZvaWRzIGxvb2tpbmcKPj4gdXAgdGhlIGZvbGlvIGFnYWluLCBidXQgaXTigJlzIGRlY2xh
cmVkIGluIG1tL2ludGVybmFsLmgsIHNvIGl0IGNhbm5vdCBiZQo+PiBjYWxsZWQgZGlyZWN0bHku
Cj4gCj4gWWVhaCwgb3IgZ2VuZXJpY19lcnJvcl9yZW1vdmVfZm9saW8oKSwgbm90IHN1cmUuCj4g
Cj4gSSBqdXN0IHRha2UgYSBsb29rIHRvIGNoZWNrIHdoZXRoZXIgdGhlcmUgaXMgYSBiZXR0ZXIg
YWx0ZXJuYXRpdmUgc2NoZW1lLgoKSG93IGFib3V0IHRoZSBmb2xsb3dpbmcgbW9kaWZpY2F0aW9u
PyBUaGUgZm9saW8gaXMgbWFya2VkIHdpdGgKUEdfZHJvcGJlaGluZCB1c2luZyBfX2ZvbGlvX3Nl
dF9kcm9wYmVoaW5kKCksIGFuZCBpcyBzdWJzZXF1ZW50bHkKcmVtb3ZlZCBmcm9tIHRoZSBwYWdl
IGNhY2hlIHRocm91Z2ggZm9saW9fZW5kX2Ryb3BiZWhpbmQoKS4KClRoYW5rcywKWW9uZ3BlbmcK
Ci0tLSBhL2ZzL2YyZnMvZ2MuYworKysgYi9mcy9mMmZzL2djLmMKQEAgLTEzMjYsNiArMTMyNiw3
IEBAIHN0YXRpYyBpbnQgbW92ZV9kYXRhX2Jsb2NrKHN0cnVjdCBpbm9kZSAqaW5vZGUsCmJsb2Nr
X3QgYmlkeCwKICAgICAgICBmb2xpbyA9IGYyZnNfZ3JhYl9jYWNoZV9mb2xpbyhtYXBwaW5nLCBi
aWR4LCBmYWxzZSk7CiAgICAgICAgaWYgKElTX0VSUihmb2xpbykpCiAgICAgICAgICAgICAgICBy
ZXR1cm4gUFRSX0VSUihmb2xpbyk7CisgICAgICAgX19mb2xpb19zZXRfZHJvcGJlaGluZChmb2xp
byk7CgogICAgICAgIGlmICghY2hlY2tfdmFsaWRfbWFwKEYyRlNfSV9TQihpbm9kZSksIHNlZ25v
LCBvZmYpKSB7CiAgICAgICAgICAgICAgICBlcnIgPSAtRU5PRU5UOwpAQCAtMTQ1Myw3ICsxNDU0
LDEwIEBAIHN0YXRpYyBpbnQgbW92ZV9kYXRhX2Jsb2NrKHN0cnVjdCBpbm9kZSAqaW5vZGUsCmJs
b2NrX3QgYmlkeCwKIHB1dF9vdXQ6CiAgICAgICAgZjJmc19wdXRfZG5vZGUoJmRuKTsKIG91dDoK
LSAgICAgICBmMmZzX2ZvbGlvX3B1dChmb2xpbywgdHJ1ZSk7CisgICAgICAgZm9saW9fdW5sb2Nr
KGZvbGlvKTsKKyAgICAgICBmb2xpb19lbmRfZHJvcGJlaGluZChmb2xpbyk7CisgICAgICAgZm9s
aW9fcHV0KGZvbGlvKTsKICAgICAgICByZXR1cm4gZXJyOwogfQoKPiAKPiBUaGFua3MsCj4gCj4+
Cj4+IFlvbmdwZW5nLAo+Pgo+Pj4+IMKgwqDCoMKgwqAgZjJmc19mb2xpb19wdXQoZm9saW8sIHRy
dWUpOwo+Pj4+ICvCoMKgwqAgaWYgKG5lZWRfaW52YWxpZGF0ZSkKPj4+PiArwqDCoMKgwqDCoMKg
wqAgaW52YWxpZGF0ZV9tYXBwaW5nX3BhZ2VzKG1hcHBpbmcsIGJpZHgsIGJpZHgpOwo+Pj4+IMKg
wqDCoMKgwqAgcmV0dXJuIGVycjsKPj4+PiDCoCB9Cj4+Pgo+Pj4KPj4+Cj4+PiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4gTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKPj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cj4+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCj4+Cj4gCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
