Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGNTDlyDBGrVKwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2026 15:57:48 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67792534838
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2026 15:57:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHGe9wYSfw4r1x1HtjFNp99gyyG/1svl5wc8QwzGDwU=; b=GZNJRzf2qoG2HOGKoJJI1RFKH3
	NNy5KoEC7HaLwUmd1zrTqxVGKk9j8nzQrNJGplLs2MNDby19Ic9p2ctTFf6IU5gTVDpa8gJWfrmSe
	JrMpXjJ8MnTXGOZMiomMqCoe2zHGRVgG8RZcDI3rL6mD0kPnm8jeH/TLEFXJc8HSbxGo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wNA5f-0006tV-Ny;
	Wed, 13 May 2026 13:57:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinbaoliu365@gmail.com>) id 1wNA5d-0006tP-LZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 May 2026 13:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MyqAFA0kL2pFmwTiULxiWJDTzpwGhW3oCAhIGSJMSg8=; b=WY2as6dwFEyWKQztQppwXGrus/
 zmIDyXgDvvu7/sG/myrwtCor4/CUS6UzjCSVDNFfb5jaK83xMj77a1OvJKucN8SFsr6fyXEy004m+
 i7xoinHM9OTZEej6/0m27PUTZRCDXj/b5LlR8Sw4UsDhURv2O0ZrFHLyTKjQynr99FlQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MyqAFA0kL2pFmwTiULxiWJDTzpwGhW3oCAhIGSJMSg8=; b=EN8OaJ2y50/PK/otgBXjeJzMXH
 2AIzO5mjrBz4nQnrYrExrTHnK3v4hD7ydn4l/pbu8aN3NQDz+iKWYl+0b3Owh8Q2n7/jtZxhxW4cy
 QGYaOC9Dze3LoJCaABi1PS44yp9pks5ngD+m3Noip0//GOpTymCpXKxuZvJ9Om07z1C0=;
Received: from mail-pf1-f181.google.com ([209.85.210.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wNA5Y-0001gM-4J for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 May 2026 13:57:31 +0000
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-836ed29d1e5so3034638b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 May 2026 06:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778680638; x=1779285438; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MyqAFA0kL2pFmwTiULxiWJDTzpwGhW3oCAhIGSJMSg8=;
 b=K23htUikr4Z4YQxzS86inp5LET1Ypv1jRBDR67QnJyLHJZuBGdPIOEQEsnZnuXe/Ef
 6rIbfVbdhvBFZKt9Kj380weO/X1r82jnOZhtQVQlfNbQXcTnue1WoX4eDifAluyCDWcC
 Do/iDMjSO4t7ZLtIU8XEB8jZdL9Zh37PPXmX2wAlOfJlZGvCMrvrfQZJ/5wJYSEVMLpk
 jik4n6iJ3y25RzOQ8qniAMLkC6lOB8t3edi9bPmRGa9qDpehriQfl5i+L+Uzy0Q6Vpmz
 cvkr3+08YxVZ3sDuA7iqK3anZjVZD2HNW+p5x/cWl1KxeMKOddI3Ay+BL9iuFisEnKtx
 mgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778680638; x=1779285438;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MyqAFA0kL2pFmwTiULxiWJDTzpwGhW3oCAhIGSJMSg8=;
 b=DELC/N+Fds9Uq5srvbOATzLdSRsHIj+h13vsqhMxsmoK5mN2q2e+irOX3/pfWB81WA
 SmgscbMw6C4RUzxNguq99wLlDFrnRpYzGBhNqmkr9Ki0GssKGAOmXhYrJJEOM82MHKrf
 +tlzS1dcjSjHS6MtVYQBW8VCQE9fMEwa1GvtGUpQDGi40DmqXl4WKHmGbsrrYQP7oR72
 IyOSx5oztsA5p9eZLpNrmg/d6FBmDq5MPQDCPXaaeLHjmH6TK7iKVw30vAKkbFTGG3P9
 PS3r4slrb+waUywZBORJkuGfc5yL707SV/9EhFnB/KNUNugDhiwmEF0rmWNcqTO3w7Mw
 Wuwg==
X-Gm-Message-State: AOJu0YyeUCyBZtnSxCDwtbnZ6TSiTOAnHWwlr/ZpyBDErA0AAZA/6YOc
 T4qnfLGSr5ctfryuzpK+wmbT3jP/wnzDEJDZYVmw+AiVZDnjJ3DxHwDY
X-Gm-Gg: Acq92OGovjqcxAkr5KtPHMlAtOBuaHs0qKpWQzJ4HxqOs49AVswmnvUtbcJOrGobef1
 eUbFge1ts1+K0y1YUbncSH6EfmiLjEver/mGcG/g7E0XAcr3EC83a+dMMno8jvGiI7OEpUPO5EZ
 2FIkq7Q1M4p6tCXaQthXhIj+w4mJe4nQYecD9hIuqpgEuZ6/E0iZd9unygLw1uyxUPgt0dLwbo4
 BsqH+dCr81cTdadNwl8ocEAxEYdJJQbJ6CoLomITN9kTzCcHBPxL49eDsNwWx5xYIWjegXyz5Er
 buz73skAcx7ajub/QdMMDhERxYtfEMboDQYZKFXcPepWhwL59jdiXTBHLLqrTFxzGqoCpH1ztd0
 lI5qcdNuG7Mg4+xzBhtgsae3+DnqckK63VUZN5RVfCFiPsM98J9zGAIkjqkqEwgtVbrASzgt+jF
 /izZgZpV1jHGqTki7dOPT8CK2rYSElhp/y/4Y22ahhcRzqsG6k2lZT/BJWk9dguUiYyITr
X-Received: by 2002:a05:6a00:39a8:b0:837:a211:4ee2 with SMTP id
 d2e1a72fcca58-83f042c17damr3564393b3a.38.1778680637668; 
 Wed, 13 May 2026 06:57:17 -0700 (PDT)
Received: from ?IPV6:2408:8607:1b00:8:1053:8f4f:7961:1c05?
 ([2408:8607:1b00:8:1053:8f4f:7961:1c05])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83967dbf7d2sm36037124b3a.49.2026.05.13.06.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 06:57:17 -0700 (PDT)
Message-ID: <bbc0de21-4d5b-4eeb-baa3-79418c53bd2c@gmail.com>
Date: Wed, 13 May 2026 21:57:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20260508135955.2391208-1-jinbaoliu365@gmail.com>
 <3f01a4cb-349a-47b0-8282-48dbc36c1797@kernel.org>
Content-Language: en-US
From: liujinbao1 <jinbaoliu365@gmail.com>
In-Reply-To: <3f01a4cb-349a-47b0-8282-48dbc36c1797@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2026/5/9 17:20, Chao Yu 写道: > On 5/8/26 21:59, liujinbao1
    wrote: >> From: liujinbao1 >> >> F2FS did not collect iostat latency for
   direct IO reads and writes, >> hook iomap_dio_ops.submit_i [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [jinbaoliu365(at)gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [jinbaoliu365(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.210.181 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wNA5Y-0001gM-4J
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add iostat latency tracking for
 direct IO
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
Cc: shengyong1 <shengyong1@xiaomi.com>, liujinbao1 <liujinbao1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 67792534838
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.91 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:shengyong1@xiaomi.com,m:liujinbao1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jinbaoliu365@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jinbaoliu365@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Action: no action

CuWcqCAyMDI2LzUvOSAxNzoyMCwgQ2hhbyBZdSDlhpnpgZM6Cj4gT24gNS84LzI2IDIxOjU5LCBs
aXVqaW5iYW8xIHdyb3RlOgo+PiBGcm9tOiBsaXVqaW5iYW8xIDxsaXVqaW5iYW8xQHhpYW9taS5j
b20+Cj4+Cj4+IEYyRlMgZGlkIG5vdCBjb2xsZWN0IGlvc3RhdCBsYXRlbmN5IGZvciBkaXJlY3Qg
SU8gcmVhZHMgYW5kIHdyaXRlcywKPj4gaG9vayBpb21hcF9kaW9fb3BzLnN1Ym1pdF9pbyB0byBi
aW5kIGFuIGlvc3RhdCBjb250ZXh0IGFuZCByZWNvcmQgdGhlCj4+IHN1Ym1pc3Npb24gdGltZXN0
YW1wLiBSZXBsYWNlIGJpX2VuZF9pbyB3aXRoIGYyZnNfZGlvX2VuZF9iaW8oKSB0bwo+PiBjb2xs
ZWN0IElPIGxhdGVuY3kgb24gY29tcGxldGlvbiBiZWZvcmUgY2FsbGluZyBiYWNrIHRvIHRoZSBv
cmlnaW5hbAo+PiBpb21hcF9kaW9fYmlvX2VuZF9pbygpLCB0byBhZGQgaW9zdGF0IGxhdGVuY3kg
dHJhY2tpbmcgc3VwcG9ydCBmb3IKPj4gRjJGUyBESU8uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IHNo
ZW5neW9uZzEgPHNoZW5neW9uZzFAeGlhb21pLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogbGl1amlu
YmFvMSA8bGl1amluYmFvMUB4aWFvbWkuY29tPgo+PiAtLS0KPj4gdjI6Cj4+IC0gYWRkIGYyZnNf
ZGlvX2lvc3RhdF9zdGFydCgpIHRvIGF2b2lkIGR1cGxpY2F0ZWQgY29kZQo+PiBhbmQgQ09ORklH
X0YyRlNfSU9TVEFUIGd1YXJkCj4+IC0tLQo+PiDCoCBmcy9mMmZzL2ZpbGUuY8KgwqAgfCAzNSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiDCoCBmcy9mMmZzL2lvc3RhdC5j
IHzCoCAyICstCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUu
Ywo+PiBpbmRleCAwOTFhOWRiMjkyMjguLmQzNWUzY2YxNThiZiAxMDA2NDQKPj4gLS0tIGEvZnMv
ZjJmcy9maWxlLmMKPj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPj4gQEAgLTQ3OTAsNiArNDc5MCwz
MCBAQCBzdGF0aWMgYm9vbCBmMmZzX3Nob3VsZF91c2VfZGlvKHN0cnVjdCBpbm9kZSAKPj4gKmlu
b2RlLCBzdHJ1Y3Qga2lvY2IgKmlvY2IsCj4+IMKgwqDCoMKgwqAgcmV0dXJuIHRydWU7Cj4+IMKg
IH0KPj4gwqAgKyNpZmRlZiBDT05GSUdfRjJGU19JT1NUQVQKPj4gK3N0YXRpYyB2b2lkIGYyZnNf
ZGlvX2VuZF9iaW8oc3RydWN0IGJpbyAqYmlvKQo+PiArewo+PiArwqDCoMKgIHN0cnVjdCBiaW9f
aW9zdGF0X2N0eCAqaW9zdGF0X2N0eCA9IGJpby0+YmlfcHJpdmF0ZTsKPj4gK8KgwqDCoCB2b2lk
ICpvcmlnX2JpX3ByaXZhdGUgPSBpb3N0YXRfY3R4LT5wb3N0X3JlYWRfY3R4Owo+PiArCj4+ICvC
oMKgwqAgaW9zdGF0X3VwZGF0ZV9hbmRfdW5iaW5kX2N0eChiaW8pOwo+PiArwqDCoMKgIGJpby0+
YmlfcHJpdmF0ZSA9IG9yaWdfYmlfcHJpdmF0ZTsKPj4gK8KgwqDCoCBpb21hcF9kaW9fYmlvX2Vu
ZF9pbyhiaW8pOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgdm9pZCBmMmZzX2Rpb19pb3N0YXRfc3Rh
cnQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgCj4+IGJpbyAqYmlvKQo+PiArewo+
PiArwqDCoMKgIHZvaWQgKmJpX3ByaXZhdGUgPSBiaW8tPmJpX3ByaXZhdGU7Cj4+ICsKPj4gK8Kg
wqDCoCBpb3N0YXRfYWxsb2NfYW5kX2JpbmRfY3R4KHNiaSwgYmlvLCBiaV9wcml2YXRlKTsKPj4g
K8KgwqDCoCBpb3N0YXRfdXBkYXRlX3N1Ym1pdF9jdHgoYmlvLCBEQVRBKTsKPj4gK8KgwqDCoCBi
aW8tPmJpX2VuZF9pbyA9IGYyZnNfZGlvX2VuZF9iaW87Cj4+ICt9Cj4+ICsjZWxzZQo+PiArc3Rh
dGljIGlubGluZSB2b2lkIGYyZnNfZGlvX2lvc3RhdF9zdGFydChzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmksCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVj
dCBiaW8gKmJpbykge30KPj4gKyNlbmRpZgo+PiArCj4+IMKgIHN0YXRpYyBpbnQgZjJmc19kaW9f
cmVhZF9lbmRfaW8oc3RydWN0IGtpb2NiICppb2NiLCBzc2l6ZV90IHNpemUsIAo+PiBpbnQgZXJy
b3IsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGZs
YWdzKQo+PiDCoCB7Cj4+IEBAIC00ODAyLDggKzQ4MjYsMTggQEAgc3RhdGljIGludCBmMmZzX2Rp
b19yZWFkX2VuZF9pbyhzdHJ1Y3Qga2lvY2IgCj4+ICppb2NiLCBzc2l6ZV90IHNpemUsIGludCBl
cnJvciwKPj4gwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4gwqAgfQo+PiDCoCArc3RhdGljIHZvaWQg
ZjJmc19kaW9fcmVhZF9zdWJtaXRfaW8oY29uc3Qgc3RydWN0IGlvbWFwX2l0ZXIgKml0ZXIsCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgYmlvICpiaW8s
IGxvZmZfdCBmaWxlX29mZnNldCkKPj4gK3sKPj4gK8KgwqDCoCBzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmkgPSBGMkZTX0lfU0IoaXRlci0+aW5vZGUpOwo+PiArCj4+ICvCoMKgwqAgZjJmc19kaW9f
aW9zdGF0X3N0YXJ0KHNiaSwgYmlvKTsKPj4gK8KgwqDCoCBibGtfY3J5cHRvX3N1Ym1pdF9iaW8o
YmlvKTsKPj4gK30KPj4gKwo+PiDCoCBzdGF0aWMgY29uc3Qgc3RydWN0IGlvbWFwX2Rpb19vcHMg
ZjJmc19pb21hcF9kaW9fcmVhZF9vcHMgPSB7Cj4+IMKgwqDCoMKgwqAgLmVuZF9pbyA9IGYyZnNf
ZGlvX3JlYWRfZW5kX2lvLAo+PiArwqDCoMKgIC5zdWJtaXRfaW8gPSBmMmZzX2Rpb19yZWFkX3N1
Ym1pdF9pbywKPj4gwqAgfTsKPj4gwqAgwqAgc3RhdGljIHNzaXplX3QgZjJmc19kaW9fcmVhZF9p
dGVyKHN0cnVjdCBraW9jYiAqaW9jYiwgc3RydWN0IAo+PiBpb3ZfaXRlciAqdG8pCj4+IEBAIC01
MDgyLDYgKzUxMTYsNyBAQCBzdGF0aWMgdm9pZCBmMmZzX2Rpb193cml0ZV9zdWJtaXRfaW8oY29u
c3QgCj4+IHN0cnVjdCBpb21hcF9pdGVyICppdGVyLAo+PiDCoMKgwqDCoMKgIGVudW0gdGVtcF90
eXBlIHRlbXAgPSBmMmZzX2dldF9zZWdtZW50X3RlbXAoc2JpLCB0eXBlKTsKPj4gwqAgwqDCoMKg
wqDCoCBiaW8tPmJpX3dyaXRlX2hpbnQgPSBmMmZzX2lvX3R5cGVfdG9fcndfaGludChzYmksIERB
VEEsIHRlbXApOwo+PiArwqDCoMKgIGYyZnNfZGlvX2lvc3RhdF9zdGFydChzYmksIGJpbyk7Cj4+
IMKgwqDCoMKgwqAgYmxrX2NyeXB0b19zdWJtaXRfYmlvKGJpbyk7Cj4+IMKgIH0KPj4gwqAgZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvaW9zdGF0LmMgYi9mcy9mMmZzL2lvc3RhdC5jCj4+IGluZGV4IGFl
MjY1ZTNlOWIyYy4uMjMyZmRlYzAzNmMxIDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2lvc3RhdC5j
Cj4+ICsrKyBiL2ZzL2YyZnMvaW9zdGF0LmMKPj4gQEAgLTI1NCw3ICsyNTQsNyBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgX191cGRhdGVfaW9zdGF0X2xhdGVuY3koc3RydWN0IAo+PiBiaW9faW9zdGF0
X2N0eCAqaW9zdGF0X2N0eCwKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgaW9zdGF0X2xhdF9pbmZvICpp
b19sYXQgPSBzYmktPmlvc3RhdF9pb19sYXQ7Cj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBm
bGFnczsKPj4gwqAgLcKgwqDCoCBpZiAoIXNiaS0+aW9zdGF0X2VuYWJsZSkKPj4gK8KgwqDCoCBp
ZiAoIXNiaS0+aW9zdGF0X2VuYWJsZSB8fCBpb3N0YXRfY3R4LT5zdWJtaXRfdHMgPT0gMCkKPgo+
IFdoaWNoIHBhdGggd2Ugd2lsbCBzZWUgemVyb2VkIC5zdWJtaXRfdHM/Cj4KPiBUaGFua3MsCj4K
QWZ0ZXIgY2FyZWZ1bCBpbnZlc3RpZ2F0aW9uLCB0aGlzIHNjZW5hcmlvIHNob3VsZCBub3QgZXhp
c3QuIEkgd2lsbCAKbW9kaWZ5IHRoZSBjb2RlLgoKdGhhbmtzCgo+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuOwo+PiDCoCDCoMKgwqDCoMKgIHRzX2RpZmYgPSBqaWZmaWVzIC0gaW9zdGF0X2N0
eC0+c3VibWl0X3RzOwo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
