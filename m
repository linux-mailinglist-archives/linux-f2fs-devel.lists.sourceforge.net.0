Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 857E9ADA626
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Jun 2025 04:01:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60PnR3t8rlj+oFHOgua6Op7FmFameSmjAfkNiIq1KJM=; b=Z3/IYmU4dlGQMOKBsG0N06VOQc
	xZzgTjfruHfUeN508mpm30VF9DPRA+LMVDhC++PdSXwhU2lpY0fkM0tzn5EhTVHCfgsk2WnFkBXEM
	sI3XrgkEw0Bo5skvK5DpQzfSIZStrpp6X5u9zyh2+ElfNsLzzr/veq6g7/FymlTul/yU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uQzAJ-0000et-38;
	Mon, 16 Jun 2025 02:01:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uQzAH-0000en-Uz
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jun 2025 02:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UWK1c7zKkAftC9FAY4L8PbybgJr8F1jsumsSqOKWXYE=; b=MxJkFf1atk3GNG6VxLE+asOTua
 LefQDgfAj8r+CwA64rnN0cl1xdVAiBnmk12ql55SOvArGZKXiQQmHB7yGnZWgm2NDk/ZR9mYocu7c
 FXlaDxOoWGsW2nJSQDBP5RH3HihvTRhU7PBwtZziUXQVHF+noskFaYe2TPZPT/DOhI6k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UWK1c7zKkAftC9FAY4L8PbybgJr8F1jsumsSqOKWXYE=; b=bLUVZx0g8abhFKPkK/EOw9Qhvc
 ZYr0l+hZokwhRboTGBtriQVY4Fk6mSWeKkLgio79UpE8A8wdPEuVF6SSiwgUrxROVZjpzVSMKjUnH
 morCKvUUYXlWlfG04I918wqiOmWd1XEGKLsg+AL0lDQLxvDh38Gqmv46I0HbcxF2pE9w=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uQzAH-0004Fh-Fm for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jun 2025 02:01:37 +0000
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-23636167afeso37279505ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 15 Jun 2025 19:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750039292; x=1750644092; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:cc:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UWK1c7zKkAftC9FAY4L8PbybgJr8F1jsumsSqOKWXYE=;
 b=CiTle/WJI5WfbgTROzNeRI0lXL6OI8HT29FNdkqqsCLygWfYKPX0vhP/QvOHysMzcf
 cItw1swDcEsnHNSTBqpK0l5uzNmQQdUzeeFI1XNUg9uQPVGHY9duEn6qIVaTM1S6Z9vF
 /H4CMWv/LBNz0oJlxpVyBNyzrkRFGis5r3su2z3QEYw1PWaSLO5W0F/e0PEJD3cqU73w
 2O2AStFz3bBE825hTAw7cfNxYVgK0S1pMp4WPHZiEvK/PR9S3GOf4QIh3zlxQePFNC/4
 OtmhWuw3LUmRhN8YD+/Es0BLXa6L72/TJob13m3NIBheLyMjABWFjvXokQ4kyccra9vU
 hnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750039292; x=1750644092;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:cc:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UWK1c7zKkAftC9FAY4L8PbybgJr8F1jsumsSqOKWXYE=;
 b=FCkuqLti6LePaEgOZKLucuVQ+GAQ8KC3ZIZhumIIc4FrpnP3ZhXqboZW2zFizJa5yJ
 EQqOdQXtoFoKqU/omJZ+FvuiGcefbtE+VpuuJ4t2z9rnXfVnvzvrMSRSE8jpZ18qwKbb
 3vC42+9g6FQdKCEzgnRS+2H5PLa23N4Enm7P6nP+gjK/txvm5jRwukRIKfEnN4pa49Al
 S44xWtUe4UuzafVwqCU63OKHO7ThsuB1qoW7k59ihrXElv2Mt1HZ/h4Wxt5cL+1Ml0Ky
 hrLhDtdS+jGqRmiYcSfo0xhMbZkKcsO33tygn+/M3Fs1m7LgJkuWqV0YcfvPN2QCbya3
 Ugtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfDjAq4ANBSfBoanHx8N9RkywQrh+4XD1rD+n+3HOY/eGV5z/5fML7m3zClgdVJbsZcQLxM3mtsMeeJrN4H91M@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyh6ikX1FBS4yqngYzJwA3qZILyYkqcgpMzO3cmY7HTRSXt14Xn
 eoZf3itgRoSAU60pS5IGvaRHVUveT+lDWg32c0nBn4S4v8a4C4vgMtRW
X-Gm-Gg: ASbGncvYKDfz/+wx/McUMzO2ERAJAJWozMzqzapQhSoeKCRwV4KSR9LEXD/dQ58i1S1
 lK/B+WYqdvfZgIDD5++khtfGiqv5X8RqOoS3Kxj/nbOdG/sFT1HsIJPdCJv8CE3ceB4ukjAKXqg
 DthCJ1oyfbi+MkeD50JHjiotDDHngPOm+NQbozKShEqJIPz6v1Tn3X7/SWJgYmcx+TVl5nG9YfB
 ggmne2p7gkHCs7R/u+/1KI04JP6b2gwoL152LxgorY6C8WSoWyOJvCbw9y3DFU9V3LvNrAsINeK
 ukmnp+XXjkGeOpQTLWN2YRU8UlE91DcB24MIvOm73EvH9kVrh3CO43cYiCw6J7QwI37IjBiEgw=
 =
X-Google-Smtp-Source: AGHT+IFAeEfUVlOywy7ZFgevA03FbiHNqClYKYBCi8OnvFDbD0Ny1/JzNNmISVgDakWLCQ4fQZmfUQ==
X-Received: by 2002:a17:903:3c66:b0:235:f45f:ed41 with SMTP id
 d9443c01a7336-2366b32ce9dmr112818215ad.19.1750039291599; 
 Sun, 15 Jun 2025 19:01:31 -0700 (PDT)
Received: from [10.189.144.225] ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2fe1639f97sm4737469a12.6.2025.06.15.19.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jun 2025 19:01:31 -0700 (PDT)
Message-ID: <7b8ee3f3-b572-4f91-8954-adde5b874089@gmail.com>
Date: Mon, 16 Jun 2025 10:01:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20250610123743.667183-1-shengyong1@xiaomi.com>
 <20250610123743.667183-14-shengyong1@xiaomi.com>
 <92fa6c87-4780-47eb-986c-1bc19db085f1@kernel.org>
Content-Language: en-US, fr-CH
From: Sheng Yong <shengyong2021@gmail.com>
In-Reply-To: <92fa6c87-4780-47eb-986c-1bc19db085f1@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/13/25 15:55, Chao Yu wrote: > On 2025/6/10 20:37, Sheng
 Yong wrote: >> From: Sheng Yong >> >> This patch adds a new member `filename'
 in inject_dentry to inject >> dentry filename. The dentry i [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uQzAH-0004Fh-Fm
Subject: Re: [f2fs-dev] [RFC PATCH v2 13/32] inject.f2fs: add member
 `filename' in inject_dentry
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
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNi8xMy8yNSAxNTo1NSwgQ2hhbyBZdSB3cm90ZToKPiBPbiAyMDI1LzYvMTAgMjA6MzcsIFNo
ZW5nIFlvbmcgd3JvdGU6Cj4+IEZyb206IFNoZW5nIFlvbmcgPHNoZW5neW9uZzFAeGlhb21pLmNv
bT4KPj4KPj4gVGhpcyBwYXRjaCBhZGRzIGEgbmV3IG1lbWJlciBgZmlsZW5hbWUnIGluIGluamVj
dF9kZW50cnkgdG8gaW5qZWN0Cj4+IGRlbnRyeSBmaWxlbmFtZS4gVGhlIGRlbnRyeSBpcyBzcGVj
aWZpZWQgYnkgbmlkIG9wdGlvbi4KPj4KPj4gTm90ZSB0aGF0ICcuJyBhbmQgJy4uJyBkZW50cmll
cyBhcmUgc3BlY2lhbCwgYmVjYXVzZSB0aGV5IGFyZSBub3QgaW4gdGhlCj4+IHBhcmVudCBkaXJl
Y3Rvcnkgb2YgbmlkLiBTbyB0aGlzIHBhdGNoIGFsc28gYWRkcyBhIG5ldyBvcHRpb24gYC0tZG90
cycKPj4gdG8gaW5qZWN0IHRoZXNlIHR3byBkZW50cmllcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
U2hlbmcgWW9uZyA8c2hlbmd5b25nMUB4aWFvbWkuY29tPgo+PiAtLS0KPj4gwqAgZnNjay9pbmpl
Y3QuY8KgwqDCoMKgIHwgOTQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0KPj4gwqAgZnNjay9pbmplY3QuaMKgwqDCoMKgIHzCoCAxICsKPj4gwqAgbWFuL2lu
amVjdC5mMmZzLjggfCAxMiArKysrKy0KPj4gwqAgMyBmaWxlcyBjaGFuZ2VkLCA5MiBpbnNlcnRp
b25zKCspLCAxNSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzY2svaW5qZWN0LmMg
Yi9mc2NrL2luamVjdC5jCj4+IGluZGV4IDhjMmY4YzVkYzMzMi4uNWViOTEzZmVmYWQ3IDEwMDY0
NAo+PiAtLS0gYS9mc2NrL2luamVjdC5jCj4+ICsrKyBiL2ZzY2svaW5qZWN0LmMKWy4uLl0KPj4g
QEAgLTEyNjUsNiArMTMwMSwzNiBAQCBzdGF0aWMgaW50IGluamVjdF9kZW50cnkoc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgaW5qZWN0X29wdGlvbiAqb3B0KQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAiJWQgLT4gJWRcbiIsIG9wdC0+bmlkLCBkZW50LT5maWxlX3R5cGUs
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICh1OClvcHQtPnZhbCk7Cj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBkZW50LT5maWxlX3R5cGUgPSAodTgpb3B0LT52YWw7Cj4+ICvCoMKgwqAgfSBl
bHNlIGlmICghc3RyY21wKG9wdC0+bWIsICJmaWxlbmFtZSIpKSB7Cj4+ICvCoMKgwqDCoMKgwqDC
oCBpZiAoIW9wdC0+c3RyKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEVSUl9NU0coIm9w
dGlvbiBzdHIgaXMgbmVlZGVkXG4iKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0g
LUVJTlZBTDsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7Cj4+ICvCoMKgwqDC
oMKgwqDCoCB9Cj4+ICvCoMKgwqDCoMKgwqDCoCBuYW1lY2FwID0gQUxJR05fVVAobGUxNl90b19j
cHUoZGVudC0+bmFtZV9sZW4pLCBGMkZTX1NMT1RfTEVOKTsKPj4gK8KgwqDCoMKgwqDCoMKgIG5h
bWVsZW4gPSBzdHJsZW4ob3B0LT5zdHIpOwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKG5hbWVsZW4g
PiBuYW1lY2FwIHx8IG5hbWVsZW4gPiBGMkZTX05BTUVfTEVOKSB7Cj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIEVSUl9NU0coIm9wdGlvbiBzdHIgdG9vIGxvbmdcbiIpOwo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXQgPSAtRUlOVkFMOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBn
b3RvIG91dDsKPj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4gK8KgwqDCoMKgwqDCoMKgIG5hbWUgPSAo
Y2hhciAqKWQuZmlsZW5hbWVbc2xvdF07Cj4+ICvCoMKgwqDCoMKgwqDCoCBNU0coMCwgIkluZm86
IGluamVjdCBkZW50cnkgZmlsZW5hbWUgb2YgbmlkICV1OiAiCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICIlLipzIC0+ICVzXG4iLCBvcHQtPm5pZCwgbGUxNl90b19jcHUoZGVudC0+bmFtZV9s
ZW4pLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuYW1lLCBvcHQtPnN0cik7Cj4+ICvCoMKg
wqDCoMKgwqDCoCBtZW1jcHkobmFtZSwgb3B0LT5zdHIsIG5hbWVsZW4pOwo+PiArwqDCoMKgwqDC
oMKgwqAgTVNHKDAsICJJbmZvOiBpbmplY3QgZGVudHJ5IG5hbWVsZW4gb2YgbmlkICV1OiAiCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIlZCAtPiAlZFxuIiwgb3B0LT5uaWQsIGxlMTZfdG9f
Y3B1KGRlbnQtPm5hbWVfbGVuKSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmFtZWxlbik7
Cj4+ICvCoMKgwqDCoMKgwqDCoCBkZW50LT5uYW1lX2xlbiA9IGNwdV90b19sZTE2KG5hbWVsZW4p
Owo+PiArwqDCoMKgwqDCoMKgwqAgZGVudHJ5X2hhc2ggPSBmMmZzX2RlbnRyeV9oYXNoKGdldF9l
bmNvZGluZyhzYmkpLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBJU19DQVNFRk9MREVEKGlub2RlKSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHVuc2lnbmVkIGNoYXIgKiluYW1lLAo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuYW1lbGVuKTsKPj4gK8Kg
wqDCoMKgwqDCoMKgIE1TRygwLCAiSW5mbzogaW5qZWN0IGRlbnRyeSBkX2hhc2ggb2YgbmlkICV1
OiAiCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIweCV4IC0+IDB4JXhcbiIsIG9wdC0+bmlk
LCBsZTMyX3RvX2NwdShkZW50LT5oYXNoX2NvZGUpLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBkZW50cnlfaGFzaCk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBkZW50LT5oYXNoX2NvZGUgPSBjcHVf
dG9fbGUzMihkZW50cnlfaGFzaCk7Cj4gCj4gWW9uZywKPiAKPiBPdXQgb2YgY3VyaW9zaXR5LCBp
ZiB3ZSBpbmplY3QgZmlsZW5hbWUgaW4gdGFyZ2V0IGRpcmVudCwgYWNjb3JkaW5nIG5ldwo+IGZp
bGVuYW1lJ3MgaGFzaCwgaXQgbWF5IGJlIGxvY2F0ZWQgaW4gZGVudHJ5IGJsb2NrIHdoaWNoIGJl
bG9uZ3MgdG8gYW5vdGhlcgo+IGJ1Y2tldCwgY2FuIGZzY2sgcmVwYWlyIGl0PwoKSGksIENoYW8s
CgpZZXMsIEkgdGhpbmsgZnNjayBjYW4gcmVwYWlyIGl0LCBidXQgaXQgcmVtb3ZlcyB0aGUgZW50
cnkgZGlyZWN0bHkgaW5zdGVhZCBvZgoicmVvcmRlcmluZyIgaXQgKGBmMmZzX2NoZWNrX2RpcmVu
dF9wb3NpdGlvbmApLiBJIGNhbiBhZGQgYSB0ZXN0IGZvciB0aGlzIGNhc2UuCgpUaGFua3MsCnNo
ZW5neW9uZwo+IAo+IFRoYW5rcywKPiAKPj4gwqDCoMKgwqDCoCB9IGVsc2Ugewo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgRVJSX01TRygidW5rbm93biBvciB1bnN1cHBvcnRlZCBtZW1iZXIgXCIlc1wi
XG4iLCBvcHQtPm1iKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IC1FSU5WQUw7Cj4+IGRp
ZmYgLS1naXQgYS9mc2NrL2luamVjdC5oIGIvZnNjay9pbmplY3QuaAo+PiBpbmRleCA0M2MyMWI1
NmE3ZWIuLjcwNmEyMTFiYzY0NSAxMDA2NDQKPj4gLS0tIGEvZnNjay9pbmplY3QuaAo+PiArKysg
Yi9mc2NrL2luamVjdC5oCj4+IEBAIC0zMCw2ICszMCw3IEBAIHN0cnVjdCBpbmplY3Rfb3B0aW9u
IHsKPj4gwqDCoMKgwqDCoCBpbnQgY3A7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiB3aGljaCBj
cCAqLwo+PiDCoMKgwqDCoMKgIGludCBuYXQ7wqDCoMKgwqDCoMKgwqAgLyogd2hpY2ggbmF0IHBh
Y2sgKi8KPj4gwqDCoMKgwqDCoCBpbnQgc2l0O8KgwqDCoMKgwqDCoMKgIC8qIHdoaWNoIHNpdCBw
YWNrICovCj4+ICvCoMKgwqAgaW50IGRvdHM7wqDCoMKgwqDCoMKgwqAgLyogLiBvciAuLiBkZW50
cnkgKi8KPj4gwqDCoMKgwqDCoCBib29sIHNzYTsKPj4gwqDCoMKgwqDCoCBib29sIG5vZGU7Cj4+
IMKgwqDCoMKgwqAgYm9vbCBkZW50Owo+PiBkaWZmIC0tZ2l0IGEvbWFuL2luamVjdC5mMmZzLjgg
Yi9tYW4vaW5qZWN0LmYyZnMuOAo+PiBpbmRleCA3MmQxYzkwZjdjZTQuLjI3YjY2ZjU5Yjc3ZCAx
MDA2NDQKPj4gLS0tIGEvbWFuL2luamVjdC5mMmZzLjgKPj4gKysrIGIvbWFuL2luamVjdC5mMmZz
LjgKPj4gQEAgLTIxNCw3ICsyMTQsMTQgQEAgaW5vZGUgaV9uaWQgYXJyYXkgc3BlY2lmaWVkIGJ5
IFxmSWlkeFxmUC4KPj4gwqAgLlJFCj4+IMKgIC5UUAo+PiDCoCAuQkkgXC1cLWRlbnQKPj4gLUlu
amVjdCBkZW50cnkgYmxvY2sgb3IgZGlyIGVudHJ5IHNwZWNpZmllZCBcZkluaWRcZlAuCj4+ICtJ
bmplY3QgZGVudHJ5IGJsb2NrIG9yIGRpciBlbnRyeSBzcGVjaWZpZWQgYnkgXGZJbmlkXGZQLgo+
PiArLlJTIDEuMmkKPj4gKy5UUAo+PiArLkJJIFwtXC1kb3RzICIgMSBvciAyIgo+PiArVGhlIG9w
dGlvbiBtZWFucyB0aGUgIi4iIG9yICIuLiIgZGlyZWN0b3J5IGVudHJ5IG9mIFxmSW5pZFxmUCBp
cyBnb2luZyB0byBiZSBpbmplY3RlZC4KPj4gKy5SRQo+PiArLlRQCj4+ICsuQkkgIiIKPj4gwqAg
VGhlIGF2YWlsYWJsZSBcZkltYlxmUCBvZiBcZklkZW50XGZQIGFyZToKPj4gwqAgLlJTIDEuMmkK
Pj4gwqAgLlRQCj4+IEBAIC0yMjksNiArMjM2LDkgQEAgZGVudHJ5IGluby4KPj4gwqAgLlRQCj4+
IMKgIC5CSSBkX2Z0eXBlCj4+IMKgIGRlbnRyeSBmdHlwZS4KPj4gKy5UUAo+PiArLkJJIGZpbGVu
YW1lCj4+ICtkZW50cnkgZmlsZW5hbWUsIGFuZCBjb3JyZXNwb25kaW5nIGRfaGFzaCBhbmQgbmFt
ZWxlbiBhcmUgdXBkYXRlZCBpbXBsaWNpdGx5Lgo+PiDCoCAuUkUKPj4gwqAgLlRQCj4+IMKgIC5C
SSBcLVwtZHJ5XC1ydW4KPiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
