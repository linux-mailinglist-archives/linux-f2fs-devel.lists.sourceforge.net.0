Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8BCC97C54
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Dec 2025 15:08:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FODm7hwZyj0hk9HSQCjejh4Rgm79QP7hCPyAiYKYZJE=; b=QXK6Gv6CJUkpdKEUYesO8743z0
	3beCsAkUSQfyQLZZQFpfOwYodN5PHI6bWaIOKqD730vqH/XaPNJjoXbbuM7rJNmoh1F3ezApxUQ20
	JTkrDBWkwXbjYuN+6zW2S0Rk3XixHllG3s8VxzHNGxiLQQKuA46DmvB44/pZlmS59NaI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQ4ZM-0000ND-D8;
	Mon, 01 Dec 2025 14:08:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1vQ4ZL-0000N4-3T
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 14:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D+Y3migp1s7eFKIiH9UWaVTWKGHK8gQ4bGwvKaSqmXk=; b=gqJ/Hh+nrt705ykRcxfl0+dimD
 meEOdp0qpTRO+N6s+yw1L+ejZE5yUDn6oG96w2Da5cKO3yzkn7a2MFHM9S7+skHAt2j1HhKIvH1Xq
 sn6zIUkSaAB79qQaZ+1x7AI5TlhUkTHtsllU/LnzjFVFfBZKwazUM74Tk8bkdmnwCB64=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D+Y3migp1s7eFKIiH9UWaVTWKGHK8gQ4bGwvKaSqmXk=; b=FkcEnQy3EG/NsYdJAw/lY1VESJ
 ViSd5iSesBcapbPRvH754eQJ0zgEnkTxVJOpdu/5ClLu9p3pEWlMrm7iiL9MmK+W2/MpoDzmKkSaU
 3/xxWw60LFicvPoPWhmaNhQ1j3Gb/Boa34L4e9llehZM0pOLHl3wCo8dGSXmnuSOHknI=;
Received: from mail-pf1-f170.google.com ([209.85.210.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vQ4ZK-0006oq-Ez for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 14:07:59 +0000
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7a9c64dfa8aso3349320b3a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 01 Dec 2025 06:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764598073; x=1765202873; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:cc:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D+Y3migp1s7eFKIiH9UWaVTWKGHK8gQ4bGwvKaSqmXk=;
 b=ZPySiW01k2ossENfXfojMDq4r14FTXjyCeJU1frFViaxS2U05ZlZx63FFqVkrSotzL
 FanzgULXLZ/NOiLdl1zpaIsB3LbtMh5lwYgTij14+VScvhBUnvi4pPpks7cAX73Mhy12
 Hg/csQRJWZbZdx0HraskpMPmsJAwTHg0cT9lOu7cIiaRpS5NQDYBeD3IQwPZZRO6vaWq
 DVJFhr74a8OsFC44ix9vY5x0QTySkX9t4EpH6hjlJW6F+4XO5g9bqSC+s878nXPjieA0
 ILn8g1Mm32HvHqxm5KYac/4+t/DDOqO3AyIDvffjBRz3OlvZFtOhVHbtLFqTGTkaO693
 SwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764598073; x=1765202873;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:cc:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D+Y3migp1s7eFKIiH9UWaVTWKGHK8gQ4bGwvKaSqmXk=;
 b=ZDaykMpDZ85MPoUaW72B73eL8eWVsJvDCOJoLwGtk9UK6EtKqsfORVKVEycGvGTw+p
 8ykeRF7zLkrTnvN3aCbDV2MgLUI1vBLVTt2NST3vAYl4sxSjKz2FrZ6x9H2LdsqJaz88
 KasW76aHNsQO9+dZ3qE+pc4UC1RGXGwjtbYEAHS6WBPfEcLQI/2+S7GqnsLLLHkE+7Zh
 nETsaI4/pSGDyyYQNk7uAcLgn4SbOUTYCUf0PLBh7nVJJ6lbZa1YZFp+eFX3P9O99unw
 /eTCVbWp+Y7mqKher+4JKIJFQk5geKZxb6Bm3On/naiF2cP/wFF1NOATLNmBJzCA8PZq
 d7ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsem+j6Xop/70vvfe+hamv0cI1qofEZ4a12YOPmoqe/T4APiseuYfasurVrmdQgkJtplMcmnQcoMg5LPJ5ZfW+@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw2s2BOK6cq1rqt1yqck2i6/4zlKuHeItyvgcoZFv/VQWOzP05P
 SV7B8V5ThUEYBgx+G/tI/K3/JCVklFaMLzj2h4rdlySH+2SefWVKnF38
X-Gm-Gg: ASbGncuG5OnOS7yiPwAtCVe0Thqvmo44NWXHon/Nb/+D+/OEiHU9kH4fnSpOaTi5Bej
 TIEgtc4eA+TS1Pqf+wwklouXX8X/Z2Wzvw6KlJnnUq/H9IFABoNMmAAFWfIN69N9LBUvWR5wFlJ
 DtoUKBAWzLnn81tx/I1fJrg9OhR3C4uu2CHG5y4z8hH9l+Qqaoxon6ExC3ohOSSoqwNnEzRnp4m
 cBJdBSFaYezT5SDnqDJT+Ef0WDzF8z0Iw9MtAcqqTtQa4csFWRRTbXY/EzFkk3zujBcqOAuagNe
 gLAYpZaf1nHq2s5cIBvBLCGLGfIdME1z2swB8pJm3wW1slR8O7HPYSKiWiizPAfczR9PbDRZTg4
 AEYH4bjDFbokc88usviafJdoJDiLKbOcJJQnZSDCVXESvqgoJy33QKOwEp0hmA6srCg7mMm83W6
 FA64+9TvB9w3N4WmGchALT+cJsHtq+sKBM
X-Google-Smtp-Source: AGHT+IGRH+M7IbSUFDBHJPj0KfJf0JULchTxEQuPDUQrJv49NS4SiS4DIp3mD3N+NWHOD8dzCsWXMQ==
X-Received: by 2002:a05:6a00:ccb:b0:7a2:7bdd:cbe8 with SMTP id
 d2e1a72fcca58-7ca8aaf1a65mr32597024b3a.18.1764598071949; 
 Mon, 01 Dec 2025 06:07:51 -0800 (PST)
Received: from [10.189.144.225] ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7d15fcfd0cfsm13687485b3a.65.2025.12.01.06.07.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 06:07:51 -0800 (PST)
Message-ID: <6caf5ba3-188d-4ac7-a999-9502728a2340@gmail.com>
Date: Mon, 1 Dec 2025 22:07:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xiaole He <hexiaole1994@126.com>, linux-f2fs-devel@lists.sourceforge.net
References: <4078376a-606e-463d-a44d-62ed6c92254c@gmail.com>
 <20251201112458.2875-1-hexiaole1994@126.com>
Content-Language: en-US, fr-CH
From: Sheng Yong <shengyong2021@gmail.com>
In-Reply-To: <20251201112458.2875-1-hexiaole1994@126.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/1/25 19:24, Xiaole He wrote: > Hi Shengyong, Hi Jinbao,
 > > Thank you for providing the patch. I have tested the patch and found
 a critical regression that can lead to data loss or unexpected fa [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.170 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vQ4ZK-0006oq-Ez
Subject: Re: [f2fs-dev] [RFT PATCH] resize.f2fs: fix start_sector not
 starting from 0
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
Cc: liujinbao1@xiaomi.com, shengyong1@xiaomi.com, jaegeuk@kernel.org,
 daehojeong@google.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTIvMS8yNSAxOToyNCwgWGlhb2xlIEhlIHdyb3RlOgo+IEhpIFNoZW5neW9uZywgSGkgSmlu
YmFvLAo+IAo+IFRoYW5rIHlvdSBmb3IgcHJvdmlkaW5nIHRoZSBwYXRjaC4gSSBoYXZlIHRlc3Rl
ZCB0aGUgcGF0Y2ggYW5kIGZvdW5kIGEgY3JpdGljYWwgcmVncmVzc2lvbiB0aGF0IGNhbiBsZWFk
IHRvIGRhdGEgbG9zcyBvciB1bmV4cGVjdGVkIGZhaWx1cmUgZHVyaW5nIGEgbm8tb3AgcmVzaXpl
Lgo+IAo+IFRoZSBpc3N1ZSBhcmlzZXMgYmVjYXVzZSB0aGUgZml4ZWQgSERJT19HRVRHRU8gY2Fs
Y3VsYXRpb24sIHdoZW4gYXBwbGllZCB0byBhIGxlZ2FjeSBpbWFnZSBjcmVhdGVkIHdpdGggc3Rh
cnRfc2VjdG9yPTQwOTdzLCBjYXVzZXMgdGhlIHNlZ21lbnRfY291bnQgdG8gdW5leHBlY3RlZGx5
IHNocmluayBkdWUgdG8gdGhlIG5ldyBhbGlnbm1lbnQgY2FsY3VsYXRpb24uCj4gCltzbmlwXQoK
CkhpLCBYaWFvbGUsCgpUaGFua3MgZm9yIHlvdXIgdmVyeSBkZXRhaWxlZCB0ZXN0aW5nIGFuZCBh
bmFseXNpcyEKCj4gCj4gMi4gQW5hbHlzaXMgYW5kIFByb3Bvc2VkIFNvbHV0aW9uCj4gVGhpcyBp
c3N1ZSBjb25maXJtcyB0aGF0IHRoZSBjb3JyZWN0ZWQgZ2VvbWV0cnkgY2FsY3VsYXRpb24gY2Fu
IGxlYWQgdG8gdW5kZXNpcmFibGUgb3V0Y29tZXMgZm9yIGxlZ2FjeSBpbWFnZXMuIFdoZW4gdGhl
IG5ldyBjb3JyZWN0IGFsaWdubWVudCByZXF1aXJlcyBhIGxhcmdlciBvZmZzZXQgKHpvbmVfYWxp
Z25fc3RhcnRfb2Zmc2V0KSwgaXQgY2F1c2VzIGEgcmVkdWN0aW9uIGluIHRoZSBzcGFjZSBhbGxv
Y2F0ZWQgZm9yIHRoZSBtYWluX2FyZWEuCj4gCj4gSSBvYnNlcnZlIHRoYXQgdGhpcyB2b2x1bWUg
c2hyaW5rIGFuZCBzdWJzZXF1ZW50IGZhaWx1cmUgcHJpbWFyaWx5IG9jY3VyIGR1cmluZyBhIG5v
LW9wIHJlc2l6ZSAocmVzaXplLmYyZnMgYXR0ZW1wdGluZyB0byByZXNpemUgdG8gdGhlIHNhbWUg
c2l6ZSkgd2hlbiB0aGUgZmlsZXN5c3RlbSBpcyBuZWFyIGZ1bGwgY2FwYWNpdHkuIFdoZW4gbm9y
bWFsbHkgZ3Jvd2luZyB0aGUgcGFydGl0aW9uIHNpemUsIHRoaXMgaXNzdWUgY2FuIHR5cGljYWxs
eSBiZSBhdm9pZGVkLgo+IAo+IENvdWxkIHlvdSBwbGVhc2UgY29uZmlybSBpZiB0aGlzIGZhaWx1
cmUgZHVyaW5nIGEgbm8tb3AgcmVzaXplIHNjZW5hcmlvIGlzIGNvbnNpZGVyZWQgYWNjZXB0YWJs
ZSBiZWhhdmlvciBmb3IgcmVzaXplLmYyZnM/CgpSaWdodCwgZm9yIGEgbm8tb3AgcmVzaXplLCBp
dCBzaG91bGQgaW5kZWVkIGRvIG5vdGhpbmcuIFNvIGlmIHNlZ21lbnRfY291bnQgY2hhbmdlcywg
d2UKc2hvdWxkIGFkanVzdCB0aGUgInRhcmdldCBkZXZpY2Ugc2l6ZSIgKHJhdGhlciB0aGFuIHRo
ZSByZWFsIGRldmljZSBzaXplKSB0byBkZXRlY3QKd2hldGhlciBhIHJlc2l6ZSBpcyBhY3R1YWxs
eSBuZWVkZWQuIEkgaGF2ZW4ndCB0ZXN0ZWQgdGhlIGZvbGxvd2luZyBjaGFuZ2UgeWV0LCBidXQg
SSdsbApkbyBpdCBhcyBzb29uIGFzIEkgY2FuIDotKAoKZGlmZiAtLWdpdCBhL2ZzY2svcmVzaXpl
LmMgYi9mc2NrL3Jlc2l6ZS5jCmluZGV4IDc4MDgyZTkwZTlkMi4uYzdhNjQ0NDk4NjU1IDEwMDY0
NAotLS0gYS9mc2NrL3Jlc2l6ZS5jCisrKyBiL2ZzY2svcmVzaXplLmMKQEAgLTgxNCw2ICs4MTQs
MzIgQEAgaW50IGYyZnNfcmVzaXplKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKICB7CiAgICAg
ICAgIHN0cnVjdCBmMmZzX3N1cGVyX2Jsb2NrICpzYiA9IEYyRlNfUkFXX1NVUEVSKHNiaSk7CiAg
ICAgICAgIHVpbnQ2NF90IHRhcmdldF9ibG9ja3MgPSBjLnRhcmdldF9zZWN0b3JzICogYy5zZWN0
b3Jfc2l6ZSA+PiBnZXRfc2IobG9nX2Jsb2Nrc2l6ZSk7CisgICAgICAgdWludDMyX3QgYmxrX3Np
emVfYnl0ZXMgPSAxIDw8IGdldF9zYihsb2dfYmxvY2tzaXplKTsKKyAgICAgICB1aW50MzJfdCBz
ZWdtZW50X3NpemVfYnl0ZXMgPSAxIDw8IChnZXRfc2IobG9nX2Jsb2Nrc2l6ZSkgKworICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2V0X3NiKGxvZ19ibG9j
a3NfcGVyX3NlZykpOworICAgICAgIHVpbnQzMl90IHNlZ3NfcGVyX3pvbmUgPSBnZXRfc2Ioc2Vn
c19wZXJfc2VjKSAqIGdldF9zYihzZWNzX3Blcl96b25lKTsKKyAgICAgICB1aW50MzJfdCB6b25l
X3NpemVfYnl0ZXMgPSBzZWdtZW50X3NpemVfYnl0ZXMgKiBzZWdzX3Blcl96b25lOworICAgICAg
IHVpbnQzMl90IGRpZmYgPSAwOworCisgICAgICAgLyogYWRqdXN0IHRhcmdldCBzaXplIGlmIHNl
Z21lbnQgY291bnQgd2lsbCBiZSBjaGFuZ2VkCisgICAgICAgICogRklYTUU6IGl0J3MgYmV0dGVy
IHRvIGNoZWNrIG9sZC9uZXcgc2VnMF9ibGthZGRyPworICAgICAgICAqLworICAgICAgIGlmICgo
dGFyZ2V0X2Jsb2NrcyAqIGJsa19zaXplX2J5dGVzKSAlIHpvbmVfc2l6ZV9ieXRlcykgeworICAg
ICAgICAgICAgICAgZGVsdGFfYmxrcyA9ICgodGFyZ2V0X2Jsb2NrcyAqIGJsa19zaXplX2J5dGVz
KSAlb25lX3NpemVfYnl0ZXMpIC8gYmxrX3NpemVfYnl0ZXM7CisgICAgICAgICAgICAgICB0YXJn
ZXRfYmxvY2tzIC09IGRlbHRhX2Jsa3M7CisKKyAgICAgICAgICAgICAgIC8qIGJlY2F1c2Ugb2Yg
dGhlIG5ldyBhbGlnbm1lbnQsIHRoZXJlIHdpbGwgaGF2ZSBhdCBtb3N0IDMgc2VnbWVudHMoMyBv
ciAyPykKKyAgICAgICAgICAgICAgICAqIHRoYXQgYXJlIHJlZ2FyZGVkIGFzIHBhZGRpbmcgYXJl
YXM6CisgICAgICAgICAgICAgICAgKiAgLSBsZXNzIHRoYW4gMiBzZWdzIGJldHdlZW4gc2IgYW5k
IGNwCisgICAgICAgICAgICAgICAgKiAgLSB0YWlsIGJsb2NrcyB3aGljaCBhcmUgbGVzcyB0aGFu
IGEgc2VnCisgICAgICAgICAgICAgICAgKi8KKyAgICAgICAgICAgICAgIGRpZmYgPSAzIDw8IGdl
dF9zYihsb2dfYmxvY2tzX3Blcl9zZWcpOworICAgICAgIH0KKyAgICAgICBpZiAodGFyZ2V0X2Js
b2NrcyA8IGRpZmYpIHsKKyAgICAgICAgICAgICAgIEFTU0VSVF9NU0coMCwgIk5vdGhpbmcgdG8g
cmVzaXplLCBub3QgYWxsb3dlZD9cbiIpOworICAgICAgICAgICAgICAgcmV0dXJuIC0xOworICAg
ICAgIH0KKyAgICAgICB0YXJnZXRfYmxvY2tzIC09IGRpZmY7CiAgCiAgICAgICAgIE1TRygwLCAi
SW5mbzogcmVzemllIHdhbnRlZCB0YXJnZXQgRlMgc2VjdG9ycyA9ICUiUFJJdTY0IiAoJSJQUkl1
NjQiIE1CKVxuIiAsCiAgICAgICAgICAgICAgICAgICAgICAgICB0YXJnZXRfYmxvY2tzIDw8IHNi
aS0+bG9nX3NlY3RvcnNfcGVyX2Jsb2NrLAoKPiAKPiBJZiB0aGlzIGJlaGF2aW9yIGlzIGNvbnNp
ZGVyZWQgYW4gaXNzdWUgdGhhdCBuZWVkcyB0byBiZSBhZGRyZXNzZWQsIEkgaGF2ZSB0d28gcHJv
cG9zYWxzIHJlZ2FyZGluZyB0aGUgZ2VvbWV0cmljIGNhbGN1bGF0aW9uIGZvciBsZWdhY3kgaW1h
Z2VzOgo+IAo+IEEuIFByb2FjdGl2ZSBHZW9tZXRyeSBPdmVycmlkZSAoUHJlZmVycmVkIEFwcHJv
YWNoKToKPiBXZSBzaG91bGQgYXR0ZW1wdCB0byBkZWR1Y2UgdGhlIG9yaWdpbmFsIHN0YXJ0X3Nl
Y3RvciBmcm9tIHRoZSBleGlzdGluZyBTdXBlcmJsb2NrIChzcGVjaWZpY2FsbHkgYnkgcmVmZXJl
bmNpbmcgb2xkX3NiLT5zZWdtZW50MF9ibGthZGRyKS4gSWYgdGhlIGRlZHVjZWQgbGVnYWN5IHN0
YXJ0X3NlY3RvciBpcyBpbmNvbnNpc3RlbnQgd2l0aCB0aGUgc2VjdG9yIHJlcG9ydGVkIGJ5IEhE
SU9fR0VUR0VPIChlLmcuLCBpZiB0aGUgaW1hZ2Ugd2FzIGNyZWF0ZWQgdXNpbmcgdGhlIG9sZCBi
dWdneSBsb2dpYyksIHdlIHNob3VsZCB1c2UgdGhlIGRlZHVjZWQvbGVnYWN5IHN0YXJ0X3NlY3Rv
ciB0byBvdmVycmlkZSB0aGUgSERJT19HRVRHRU8gcmVzdWx0IGZvciB0aGUgZHVyYXRpb24gb2Yg
dGhlIHJlc2l6ZSBjYWxjdWxhdGlvbi4gVGhpcyBlbnN1cmVzIHRoZSBnZW9tZXRyaWMgY2FsY3Vs
YXRpb24gbWF0Y2hlcyB0aGUgZXhpc3Rpbmcgb24tZGlzayBsYXlvdXQsIHByZXZlbnRpbmcgdGhl
IHVuZXhwZWN0ZWQgc2hyaW5rIGFuZCBmYWlsdXJlLgoKVGhpcyBzZWVtcyB0byBiZSB0aGUgc2lt
cGxlc3Qgd29ya2Fyb3VuZCBmb3IgcmVzaXplLCB3aGlsZSB3ZSdyZSB0cnlpbmcgdG8gZml4IHRo
ZQpIRElPX0dFVEdFTyB0eXBvIGZvciBub3cuCgo+IAo+IEIuIE1haW50YWluIExlZ2FjeSBCdWcg
KElmIGRlZHVjdGlvbiBpcyB0b28gY29tcGxleCk6Cj4gSWYgaW1wbGVtZW50aW5nIHRoZSByZWxp
YWJsZSBkZWR1Y3Rpb24gbG9naWMgKFByb3Bvc2FsIEEpIHByb3ZlcyB0byBiZSBvdmVybHkgY29t
cGxleCBvciByaXNreSwgd291bGQgaXQgYmUgYmV0dGVyIHRvIG1haW50YWluIHRoZSBvcmlnaW5h
bCwgaW5jb3JyZWN0IEhESU9fR0VUR0VPIGJlaGF2aW9yIGZvciByZXNpemUuZjJmcyB0byBwcmlv
cml0aXplIGNvbXBhdGliaWxpdHkgd2l0aCBleGlzdGluZyBpbWFnZXMgb3ZlciBnZW9tZXRyaWMg
Y29ycmVjdG5lc3M/CgpJIHRoaW5rIHByb3Bvc2FsIEEgd29uJ3QgYmUgdG9vIGNvbXBsZXgsIGlm
IEkgbWlzcyBhbnl0aGluZyBwbGVhc2UgY29ycmVjdCBtZS4Kc2VnMF9ibGthZGQgY2FuIGhlbHAg
dXMgdG8gY2FsY3VsYXRlIHRoZSAic3RhcnRfc2VjdG9yIi4KWWVhaCwga2VlcCB0aGUgaW5jb3Jy
ZWN0IEhESU9fR0VUR0VPIGJlaGF2aW9yIG1heSBiZSB0aGUgc2FmZXN0IHdheSBmb3Igbm93IDot
KAoKPiAKPiAzLiBSZXNvdXJjZSBDb25zdHJhaW50cyAmIFRlc3QgQ292ZXJhZ2UKPiBUaGUgcm9v
dCBjYXVzZSBvZiB0aGlzIGlzc3VlIGlzIHRoYXQgYWZ0ZXIgdGhlIGJ1ZyBpbiBIRElPX0dFVEdF
TyB3YXMgZml4ZWQsIHRoZSBvYnRhaW5lZCB2YWx1ZSBmb3Igc3RhcnRfc2VjdG9yIGRpZmZlcnMg
ZnJvbSBpdHMgcHJldmlvdXMgdmFsdWUgKHdoaWNoIHdhcyBpbXBsaWNpdGx5IDApLiBDb25zZXF1
ZW50bHksIHRoZSB6b25lX2FsaWduX3N0YXJ0X29mZnNldCBjYWxjdWxhdGlvbiwgd2hpY2ggZGVw
ZW5kcyBvbiBzdGFydF9zZWN0b3IsIGNoYW5nZWQuIE1hbnkgY3J1Y2lhbCBmaWVsZHMgd2l0aGlu
IHRoZSBzdXBlcmJsb2NrLCBpbiB0dXJuLCBkZXBlbmQgb24gem9uZV9hbGlnbl9zdGFydF9vZmZz
ZXQuCj4gCj4gRnVydGhlciBhbmFseXNpcyByZXZlYWxzIHRoYXQgdGhlIHpvbmVfYWxpZ25fc3Rh
cnRfb2Zmc2V0IGV4aGliaXRzIGEgcGVyaW9kaWMgY2hhbmdlIHJlbGF0aXZlIHRvIHN0YXJ0X3Nl
Y3Rvci4gRm9yIGluc3RhbmNlLCB0aGUgem9uZV9hbGlnbl9zdGFydF9vZmZzZXQgZ2VuZXJhdGVk
IHdoZW4gc3RhcnRfc2VjdG9yIGlzIGluIHRoZSByYW5nZSBvZiAwIHRvIDQwOTUgaXMgaWRlbnRp
Y2FsIHRvIHRoZSBvbmUgZ2VuZXJhdGVkIHdoZW4gc3RhcnRfc2VjdG9yIGlzIGluIHRoZSByYW5n
ZSBvZiA0MDk2IHRvIDgxOTEuCj4gCj4gQmFzZWQgb24gdGhpcyBhbmFseXNpcywgSSBoYXZlIGRl
dmVsb3BlZCBhIHRlc3Qgc2NyaXB0IHRoYXQgaXRlcmF0ZXMgdGhyb3VnaCBzdGFydF9zZWN0b3Ig
dmFsdWVzIGZyb20gNDA5NiB0byA4MTkxIHRvIG9ic2VydmUgdGhlIGJlaGF2aW9yIHByb2R1Y2Vk
IGJ5IHJlc2l6ZS5mMmZzLiBUaGUgc2NyaXB0IGlzIGFzIGZvbGxvd3M6Cj4gCgpUaGFua3MgYWdh
aW4gZm9yIHRoZSB0ZXN0IHNjcmlwdC4gSeKAmWxsIHJ1biBpdCB3aGVuIEkgaGF2ZSBhIGZyZWUg
c2xvdC4KCnRoYW5rcywKc2hlbmd5b25nCgpbc25pcF0KPiAKPiBCdXQgYXMgYW4gaW5kaXZpZHVh
bCByZXNlYXJjaGVyIHdpdGggbGltaXRlZCBoYXJkd2FyZSwgbXkgdGVzdGluZyBlbnZpcm9ubWVu
dCBpcyBjdXJyZW50bHkgY29uc3RyYWluZWQgYnkgbXkgYWNhZGVtaWMgd29yay4KPiAKPiBQbGVh
c2Ugbm90ZSB0aGF0IEkgb25seSBoYXZlIGFjY2VzcyB0byBhIHNpbmdsZSBTU0QgYXJvdW5kIDEw
MEdCIGZvciBteSB0ZXN0aW5nLCB3aGljaCBsaW1pdHMgdGhlIHNjb3BlIG9mIG15IHJlZ3Jlc3Np
b24gdmFsaWRhdGlvbiAoZXNwZWNpYWxseSBmb3IgbGFyZ2Utc2NhbGUgcGVyZm9ybWFuY2Ugb3Ig
Y2FwYWNpdHkgY2hlY2tzKS4gR2l2ZW4geW91ciBjb3Jwb3JhdGUgZW52aXJvbm1lbnQsIHlvdXIg
dGVhbSB3b3VsZCBiZSBtdWNoIGJldHRlciBwb3NpdGlvbmVkIHRvIHJ1biBleHRlbnNpdmUsIGxh
cmdlLXNjYWxlIHJlZ3Jlc3Npb24gdGVzdHMgb24gdGhlIGZpbmFsIGZpeC4gT2YgY291cnNlLCB3
aGVuZXZlciBJIGhhdmUgc3BhcmUgdGltZSwgSSB3aWxsIGFsc28gY29udGludWUgcnVubmluZyB0
aGlzIHNjcmlwdCBmb3IgZnVydGhlciB0ZXN0aW5nLgo+IAo+IEkga2luZGx5IHJlcXVlc3QgdGhh
dCB5b3UgdXNlIHRoZXNlIHJlcHJvZHVjZXJzIGFuZCB0aGUgdGVzdCBzY3JpcHQgdG8gdmFsaWRh
dGUgdGhlIGZpeCBvbiB5b3VyIGVuZCBvbmNlIGltcGxlbWVudGVkLiBJZiB0aGVyZSBpcyBhbnl0
aGluZyBmdXJ0aGVyIEkgY2FuIGRvIHRvIGFzc2lzdCB3aXRoIHRoZSBhbmFseXNpcyBvciBpbXBs
ZW1lbnRhdGlvbiwgcGxlYXNlIGRvIG5vdCBoZXNpdGF0ZSB0byByZWFjaCBvdXQuCj4gCj4gTm90
ZSBvbiBTY3JpcHQgVmFsaWRhdGlvbiBMb2dpYzoKPiAKPiBUaGUgdmFsaWRhdGlvbiBsb2dpYyB3
aXRoaW4gdGhpcyBzY3JpcHQgZm9yIGNoZWNraW5nIG5ldyB2cy4gb2xkIHN1cGVyYmxvY2sgZmll
bGRzIChzcGVjaWZpY2FsbHkgdGhlIGRpZmZlcmVuY2UgaW4gZmllbGQgdmFsdWVzKSBtYXkgbm90
IGJlIHBlcmZlY3RseSBhY2N1cmF0ZSBvciBjb21wcmVoZW5zaXZlLiBIb3dldmVyLCB0aGlzIGlz
IGFjY2VwdGFibGUsIGFzIHRoZXNlIGNoZWNrcyBhcmUgcHJpbWFyaWx5IGZvciBpbmZvcm1hdGlv
bmFsIHB1cnBvc2VzIGFuZCB3aWxsIG5vdCBiZSB1c2VkIGFzIHRoZSBkZWZpbml0aXZlIGNyaXRl
cmlhIGZvciBqdWRnaW5nIHRoZSBidWcuCj4gCj4gVGhlIHRydWUgY3JpdGVyaWEgZm9yIGJ1ZyBq
dWRnbWVudCByZW1haW46Cj4gMS4gIFdoZXRoZXIgcmVzaXplLmYyZnMgZXhlY3V0ZXMgc3VjY2Vz
c2Z1bGx5IHdpdGhvdXQgZmFpbHVyZS4KPiAyLiAgTW9yZSBpbXBvcnRhbnRseSwgd2hldGhlciB0
aGUgb3JpZ2luYWwgY3JlYXRlZCBmaWxlcyByZW1haW5zIGZ1bGx5IGNvbnNpc3RlbnQgYWZ0ZXIg
dGhlIGV4ZWN1dGlvbiBvZiByZXNpemUuZjJmcy4KPiAKPiBQbGVhc2UgZmVlbCBmcmVlIHRvIHJl
YWNoIG91dCB0byBtZSBpZiB5b3UgaGF2ZSBhbnkgcXVlc3Rpb25zIG9yIHJlcXVpcmUgY2xhcmlm
aWNhdGlvbiByZWdhcmRpbmcgdGhlIHNjcmlwdCBvciB0aGUgZXhwZWN0ZWQgb3V0Y29tZXMuCj4g
Cj4gVGhhbmtzLAo+IFhpYW9sZSBIZQo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
