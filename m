Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DC0ADA61D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Jun 2025 03:50:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWfK0d5isNankhUOMKv/LVSoiMmWwt7fpnaNHEMqczg=; b=nEH/5SwTud54nj7AXWSukVTD0h
	0JpvodA1h4epQhRXKm9N65HJXgSw8iU8Sg/NnSS7/W+PAqKUBF8JPasi+pVIKZX2zjX2SeIjODOGE
	JuPct2TNQovnSUzIDPgywljUv6HI0RE/NoDmLnQ+0J45Vx6//3uHCrygyOAVtlDstBVA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uQyzD-0005Ak-Ll;
	Mon, 16 Jun 2025 01:50:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uQyzB-0005Ae-S6
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jun 2025 01:50:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lOcvdtQMBQKCcod6HUejXujMP96B8aIr/r+HeSCvHg4=; b=Divm9fbpxaBS3ZKCcmdrgobx3G
 AOnsY8Y5ZHi3qHvaH+XZLe1TZU0JQNQCruWc6sCt7cDCIecnn392nfgQl0AaeqwAXgo0P3cZHIQ0R
 om0u30KzqPlBWepK+xXH9nMoXhPGN3moOjLj95kPH8kf1TLefcZ11RSL8RIJuiPKZ36s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lOcvdtQMBQKCcod6HUejXujMP96B8aIr/r+HeSCvHg4=; b=gVLC+TWYvLkHceTlJ6PLYqkzdq
 zpXmjN5yFvppt2AqtBHLZ5IhpiDJDlzQhkKgQTvdhSV3MSeVQi7D9g0YhxRsKeSalM0Ot7v+rzRii
 Em89iMJ222JU9y25o9mNKRApK80XNZB/G5FyuBuPFv4EYcXAZvnWuN+XmiJ/Wkc9C8aM=;
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uQyzB-0003bv-Dd for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jun 2025 01:50:09 +0000
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7482377b086so2252678b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 15 Jun 2025 18:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750038604; x=1750643404; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:cc:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lOcvdtQMBQKCcod6HUejXujMP96B8aIr/r+HeSCvHg4=;
 b=R2L7JrnQ/5yCqXh18mHi6HXsUsp4t5f/7Oz/vk8ci2kpySteiuhaGb6zKSUcyShBuT
 XKo+q2OHWcxI9aX5s75/1cKnZCwFkBVxO32ylTyJhST+JTVjqlfIhKT9fKaG3XuxAErD
 T3OYdqldJasa3eZMiTGNeugjtY4NvUT5/5Upn5LHlmT5ZfChqO5VBoPg1eCt30/S/WO5
 tK8eFYZ1qVu7wZv48afWJXMzQ51MQYH2ikHdofQ2tHKzQ7BlSV+Sh41sFgPlt+6QZRG4
 V86OBXULAaCotLv4IL617fvubZK5rtRIdH5ahXerVUrCn0imqeC0Ou/XUQs/iHTse14P
 F/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750038604; x=1750643404;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:cc:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lOcvdtQMBQKCcod6HUejXujMP96B8aIr/r+HeSCvHg4=;
 b=YMwW9hPl5RwbfhbUTHsnu131RiWTFWJ2D/Im39ruehaJt1ZJ0Fgp5RWhmY38LPGbxA
 3FeFiu90XHYXH10n7DOUgadRnJtn6RcVpI9Ls6OKswNd5eyaN5E+Yz1chUgc4HUw4X+q
 VwItVrfuMmVPHIqstftoL5VXfzIdfK1gpk44PLRCLrBCQWSJ6X16zV3c6f27Z9T7knx4
 icCNTrcIavnobKQWEz/cpURv2USj1UQOwyRB7mdBYiNxjSV27bgkey+GtZDbk3P4tLvu
 rwWSAd4HZ92lSdSJiwW3W60kHGGYXXTwmKZMRD+qag85HsYgK+C7CXzI0V+Pm6oly2PP
 3WOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSXkSmvaQfQ6fhPmTdBrLNwnbqDknz/zFFFfF3zF2KFVBsLxrAVlEdkMnh3qPFdN/hm4AjFywnXUdPmjOhjodh@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwXKNmr7SM/DgmCD9TGIrbxgl0z4kwJfwIyxL+CyQvovFcpRJP7
 zWuJPYM1ejc3DXqjR75i/vTI33V2TEpsTJoR4qwqK8XtLwIwTIPcc1KE
X-Gm-Gg: ASbGnctT40/BGpz/adK1TBqFIpHu8QPR5iBATZYAXcUZ0gUTsd6XbABqo84Q1WBoVrc
 u12P+LFtybmgf7BUByPsi8haso2eEWNKS5xVgXkaLaGn8pSDPb4RQUV8uEBCDZfuOeNCDd83iBx
 HV62Hm3nyY9hwXo3ZSguW7tBGoWLhCOy0fyi2w6zyqSP3w5E9K4+IKvtI7zD4ax4Ym4Bn3apXUV
 udZJyw2JdHiqFTl3NkOI094eQSwha8F+6GqSctLt+eSWwAebe+i7ypPMYqNqk+g9/89+f8AuYXR
 gMeLqFFZ0+HDeEaatiOwT0iKC6YQrY2wBW+I6KCdc1yB6Z50v+QLK1l/GU2lYYcfhobznaU4TP7
 GKkGoA/HI
X-Google-Smtp-Source: AGHT+IHWNXpURFh27WHv4xZLORcArctQo6AtPve52l91+iTPHtK41A3PT70BTTi3wVJINMmLokQwaA==
X-Received: by 2002:a05:6a00:2185:b0:739:50c0:b3fe with SMTP id
 d2e1a72fcca58-7489cf8a0demr12069950b3a.8.1750038603556; 
 Sun, 15 Jun 2025 18:50:03 -0700 (PDT)
Received: from [10.189.144.225] ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748900d247dsm5554652b3a.166.2025.06.15.18.50.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jun 2025 18:50:03 -0700 (PDT)
Message-ID: <0a5327b6-a74e-4862-8a4c-715e87be64d3@gmail.com>
Date: Mon, 16 Jun 2025 09:49:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20250610123743.667183-1-shengyong1@xiaomi.com>
 <20250610123743.667183-10-shengyong1@xiaomi.com>
 <de9e00c2-c9c2-4284-af57-ed7e21b07622@kernel.org>
Content-Language: en-US, fr-CH
From: Sheng Yong <shengyong2021@gmail.com>
In-Reply-To: <de9e00c2-c9c2-4284-af57-ed7e21b07622@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/13/25 14:08, Chao Yu wrote: > On 2025/6/10 20:37, Sheng
 Yong wrote: >> From: Sheng Yong >> >> This patch fixes: >> * parsing hex
 optarg of --idx option >> * converting -1 to 0xff...ff of --val [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.210.175 listed in list.dnswl.org]
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
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.175 listed in wl.mailspike.net]
X-Headers-End: 1uQyzB-0003bv-Dd
Subject: Re: [f2fs-dev] [RFC PATCH v2 09/32] inject.f2fs: fix and cleanup
 parsing numeric options
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

T24gNi8xMy8yNSAxNDowOCwgQ2hhbyBZdSB3cm90ZToKPiBPbiAyMDI1LzYvMTAgMjA6MzcsIFNo
ZW5nIFlvbmcgd3JvdGU6Cj4+IEZyb206IFNoZW5nIFlvbmcgPHNoZW5neW9uZzFAeGlhb21pLmNv
bT4KPj4KPj4gVGhpcyBwYXRjaCBmaXhlczoKPj4gwqDCoCAqIHBhcnNpbmcgaGV4IG9wdGFyZyBv
ZiAtLWlkeCBvcHRpb24KPj4gwqDCoCAqIGNvbnZlcnRpbmcgLTEgdG8gMHhmZi4uLmZmIG9mIC0t
dmFsIG9wdGlvbgo+PiBhbmQgZG8gYSBsaXR0bGUgY2xlYW51cCBvZiBjb252ZXJ0aW5nIHN0cmlu
ZyB0byBhIGxvbmcgaW50ZWdlci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogU2hlbmcgWW9uZyA8c2hl
bmd5b25nMUB4aWFvbWkuY29tPgo+PiAtLS0KPj4gwqAgZnNjay9pbmplY3QuYyB8IDMyICsrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNl
cnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzY2svaW5qZWN0
LmMgYi9mc2NrL2luamVjdC5jCj4+IGluZGV4IDk2ODE3YTgwNmY4Zi4uYzg3OWNhOTljMGQ4IDEw
MDY0NAo+PiAtLS0gYS9mc2NrL2luamVjdC5jCj4+ICsrKyBiL2ZzY2svaW5qZWN0LmMKPj4gQEAg
LTIzNiw4ICsyMzYsOSBAQCBpbnQgaW5qZWN0X3BhcnNlX29wdGlvbnMoaW50IGFyZ2MsIGNoYXIg
KmFyZ3ZbXSwgc3RydWN0IGluamVjdF9vcHRpb24gKm9wdCkKPj4gwqDCoMKgwqDCoCB3aGlsZSAo
KG8gPSBnZXRvcHRfbG9uZyhhcmdjLCBhcmd2LCBvcHRpb25fc3RyaW5nLAo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxvbmdfb3B0LCBOVUxMKSkgIT0gRU9GKSB7Cj4+IC3C
oMKgwqDCoMKgwqDCoCBsb25nIG5pZCwgYmxrOwo+PiArwqDCoMKgwqDCoMKgwqAgbG9uZyBsb25n
IHZhbDsKPj4gK8KgwqDCoMKgwqDCoMKgIGVycm5vID0gMDsKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IHN3aXRjaCAobykgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY2FzZSAxOgo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjLmRyeV9ydW4gPSAxOwo+PiBAQCAtMjQ4LDE4ICsyNDksMTkgQEAg
aW50IGluamVjdF9wYXJzZV9vcHRpb25zKGludCBhcmdjLCBjaGFyICphcmd2W10sIHN0cnVjdCBp
bmplY3Rfb3B0aW9uICpvcHQpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE1TRygwLCAi
SW5mbzogaW5qZWN0IG1lbWJlciAlc1xuIiwgb3B0YXJnKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgYnJlYWs7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIDM6Cj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmICghaXNfZGlnaXRzKG9wdGFyZykpCj4+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIEVXUk9OR19PUFQ7Cj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIG9wdC0+aWR4ID0gYXRvaShvcHRhcmcpOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBNU0coMCwgIkluZm86IGluamVjdCBzbG90IGluZGV4ICVkXG4iLCBvcHQtPmlkeCk7Cj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZhbCA9IHN0cnRvbGwob3B0YXJnLCAmZW5kcHRyLCAwKTsK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGVycm5vICE9IDAgfHwgdmFsID49IFVJTlRf
TUFYIHx8IHZhbCA8IDAgfHwKPiAKPiBVSU5UX01BWCBpcyBhIHBvc3NpYmxlIGluamVjdGFibGUg
dmFsdWU/IGlmIHNvLCBpdCBuZWVkIHRvIHVzZSAidmFsID4gVUlOVF9NQVgiPwo+IApIaSwgQ2hh
bywKCkZvciBgaWR4JyBhbmQgc2l0L25hdCBwYWNrLCBJIHRoaW5rIFVJTlRfTUFYIG9yIC0xIHdp
bGwgbm90IGJlIHVzZWQsIGJlY2F1c2UgdGhlc2UKdHdvIHZhbHVlcyBhcmUgdXNlZCB0byBpbmRp
Y2F0ZSB3aGVyZSB3ZSBkbyB0aGUgaW5qZWN0aW9uLCBhbmQgVUlOVF9NQVggaXMgYWx3YXlzCm91
dCBvZiBib3VuZGFyeSBvZiB0aGUgYXJyYXkuCgpUaGFua3MsCnNoZW5neW9uZwoKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqZW5kcHRyICE9ICdcMCcpCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FUkFOR0U7Cj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIG9wdC0+aWR4ID0gKHVuc2lnbmVkIGludCl2YWw7Cj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIE1TRygwLCAiSW5mbzogaW5qZWN0IHNsb3QgaW5kZXggJXVcbiIsIG9wdC0+aWR4KTsK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBjYXNlIDQ6Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9wdC0+dmFsID0gc3RydG9sbChv
cHRhcmcsICZlbmRwdHIsIDApOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAob3B0LT52
YWwgPT0gTExPTkdfTUFYIHx8IG9wdC0+dmFsID09IExMT05HX01JTiB8fAo+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICplbmRwdHIgIT0gJ1wwJykKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgb3B0LT52YWwgPSBzdHJ0b3VsbChvcHRhcmcsICZlbmRwdHIsIDApOwo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZXJybm8gIT0gMCB8fCAqZW5kcHRyICE9ICdcMCcpCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FUkFOR0U7Cj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE1TRygwLCAiSW5mbzogaW5qZWN0IHZhbHVlICVsbGQg
OiAweCVsbHhcbiIsIG9wdC0+dmFsLAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICh1bnNpZ25lZCBsb25nIGxvbmcpb3B0LT52YWwpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIG9wdC0+dmFsKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIDU6Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIG9wdC0+c3RyID0gc3RyZHVwKG9wdGFyZyk7Cj4+IEBAIC0yOTIsMTEgKzI5NCwxMSBAQCBp
bnQgaW5qZWN0X3BhcnNlX29wdGlvbnMoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSwgc3RydWN0IGlu
amVjdF9vcHRpb24gKm9wdCkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTVNHKDAsICJJ
bmZvOiBpbmplY3QgbmF0IHBhY2sgJXNcbiIsIHBhY2tbb3B0LT5uYXRdKTsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIDk6Cj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5pZCA9IHN0cnRvbChvcHRhcmcsICZlbmRwdHIsIDAp
Owo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAobmlkID49IFVJTlRfTUFYIHx8IG5pZCA8
IDAgfHwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmFsID0gc3RydG9sbChvcHRhcmcsICZl
bmRwdHIsIDApOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZXJybm8gIT0gMCB8fCB2
YWwgPj0gVUlOVF9NQVggfHwgdmFsIDwgMCB8fAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICplbmRwdHIgIT0gJ1wwJykKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gLUVSQU5HRTsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb3B0LT5u
aWQgPSBuaWQ7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9wdC0+bmlkID0gKG5pZF90KXZh
bDsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTVNHKDAsICJJbmZvOiBpbmplY3Qgbmlk
ICV1IDogMHgleFxuIiwgb3B0LT5uaWQsIG9wdC0+bmlkKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgYnJlYWs7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIDEwOgo+PiBAQCAtMzA4
LDExICszMTAsMTEgQEAgaW50IGluamVjdF9wYXJzZV9vcHRpb25zKGludCBhcmdjLCBjaGFyICph
cmd2W10sIHN0cnVjdCBpbmplY3Rfb3B0aW9uICpvcHQpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIE1TRygwLCAiSW5mbzogaW5qZWN0IHNpdCBwYWNrICVzXG4iLCBwYWNrW29wdC0+c2l0
XSk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgY2FzZSAxMToKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmxrID0gc3RydG9sKG9w
dGFyZywgJmVuZHB0ciwgMCk7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChibGsgPj0g
VUlOVF9NQVggfHwgYmxrIDwgMCB8fAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2YWwgPSBz
dHJ0b2xsKG9wdGFyZywgJmVuZHB0ciwgMCk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlm
IChlcnJubyAhPSAwIHx8IHZhbCA+PSBVSU5UX01BWCB8fCB2YWwgPCAwIHx8Cj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKmVuZHB0ciAhPSAnXDAnKQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRVJBTkdFOwo+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBvcHQtPmJsayA9IGJsazsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb3B0
LT5ibGsgPSAoYmxvY2tfdCl2YWw7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE1TRygw
LCAiSW5mbzogaW5qZWN0IGJsa2FkZHIgJXUgOiAweCV4XG4iLCBvcHQtPmJsaywgb3B0LT5ibGsp
Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIGNhc2UgMTI6Cj4gCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
