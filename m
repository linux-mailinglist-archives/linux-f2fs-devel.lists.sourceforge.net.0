Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /IOtKgSFOGq3dAcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 02:42:44 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6006ABDE3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 02:42:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=kzyR2IjY;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=i6B9YsPB;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=NAkJ6kk7;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=iZ1FcdRN;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTu5+hF07qwtRiqUEFFrKWy1TvzNGqrB2cZayiPDM8g=; b=kzyR2IjY9kdLRbyrQC+gM7ucKa
	Tv+hezFtsrnyFnOUtgFDnkr32X0vOF1ensbc0nPGAcFtHPF8v72dhgxwuONaqMZVEqvexygtSpjfI
	UI/aR0cUkJ2GmDIGOace3P89rDaSdo99MzHaevB/Y6KRlYS/EDZQir2xfBiqI/WMVTsw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbSkB-0005hV-OX;
	Mon, 22 Jun 2026 00:42:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wbSkB-0005hP-2X
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 00:42:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/TAiZCXN45uGDh8BhN+OwGb9TLkeez8vS0iFkkQs85M=; b=i6B9YsPBLmtPmkhJwUePCtsa35
 1UM5ScJKdjb2HbvGaRFUkqfdCNW+IvED8UIkNkKVigIqy+b/IDW6Qra520ztjJ/XU7w+o/pSIH5Ik
 AfdEwa6qErooucFiw6Bki+N9NfD57G9z2hcg7sesEqabkJgUefiSpCAbberT4mFoT/eo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/TAiZCXN45uGDh8BhN+OwGb9TLkeez8vS0iFkkQs85M=; b=NAkJ6kk7hSwzER5kPW6emQ8BOM
 3h4hN0Xvy75JmC+BAnjBYFPHQ0+Yj9sBIJ2fXNQdES55fD8yNyZCWVgCrbF7rOgZKKh68faz6SSzO
 xeGCKhfNjmWHKgWFqkhZKaDEn+9fdt/93JTLsGqIm/R8yAeBaWomItp1xveUEH7kANRg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wbSk9-0000eK-UL for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 00:42:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B59C94037E;
 Mon, 22 Jun 2026 00:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C041F000E9;
 Mon, 22 Jun 2026 00:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782088944;
 bh=/TAiZCXN45uGDh8BhN+OwGb9TLkeez8vS0iFkkQs85M=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=iZ1FcdRNR4RF+gPi/6gzbCdfrLCRHURT+v/QvdcPIX4RY5vQzks+Y5vhyfSrau30o
 FxjxtygYmhytKvQN4Bp+iMNLAo7FtFvf9utNkfhiy60ulW/jdcaTyWlzH8VDLglG8i
 Fd3ZAf8XtEhtFWesWbkBA+i/Z9uFgERHsXFY+wvCRFD87G8hUFnaiGevDHGUPMZEK0
 tHUX5IdehV/ogwKjw7FeI2ym5E9G07OD23NBk7jJKCA6T7DLMCVmtgd1cgu5plQ6uO
 Nw44BAOJjblCvftgosTNDaVG0mlO6GY4xyJWzcX57P2E/ZOdlrTSTA36TXaih09zYG
 X49FcW+X9FKow==
Message-ID: <d74fd6f1-9c92-4810-9549-e8066ec9d807@kernel.org>
Date: Mon, 22 Jun 2026 08:42:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
 <20260612115839.2065903-3-yangyongpeng.storage@gmail.com>
 <7ffe0789-1024-4dc7-9089-2dcf856a1bd1@kernel.org>
 <SEZPR02MB5662A85B218D3EF7B2FA8C6599E22@SEZPR02MB5662.apcprd02.prod.outlook.com>
 <e876caa4-37bb-409c-98e5-2d051178d6db@kernel.org>
 <SEZPR02MB5662F1A9AFD88BEA4624BC9699E02@SEZPR02MB5662.apcprd02.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <SEZPR02MB5662F1A9AFD88BEA4624BC9699E02@SEZPR02MB5662.apcprd02.prod.outlook.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/21/26 23:48, Yongpeng Yang wrote: > On 6/20/26 11:31
 AM, Chao Yu via Linux-f2fs-devel wrote: >> On 6/19/26 22:34, Yongpeng Yang
 wrote: >>> >>> On 6/15/26 7:55 PM, Chao Yu via Linux-f2fs-devel wro [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wbSk9-0000eK-UL
Subject: Re: [f2fs-dev] [PATCH RESEND 2/5] f2fs: only initialize largest
 extent without extent_node at inode init
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yangyongpeng.storage@outlook.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[outlook.com,kernel.org];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB6006ABDE3

T24gNi8yMS8yNiAyMzo0OCwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPiBPbiA2LzIwLzI2IDExOjMx
IEFNLCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+PiBPbiA2LzE5LzI2IDIy
OjM0LCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4KPj4+IE9uIDYvMTUvMjYgNzo1NSBQTSwgQ2hh
byBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4+PiBPbiA2LzEyLzI2IDE5OjU4LCBZ
b25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4+PiBGcm9tOiBZb25ncGVuZyBZYW5nIDx5YW5neW9uZ3Bl
bmdAeGlhb21pLmNvbT4KPj4+Pj4KPj4+Pj4gVGhlIGxhcmdlc3QgZXh0ZW50IHRha2VzIGVmZmVj
dCBkdXJpbmcgYm90aCByZWFkIG1hcHBpbmcgYW5kIHdyaXRlCj4+Pj4+IG1hcHBpbmcgbG9va3Vw
cywgd2hpbGUgcmVhZCBtYXBwaW5nIGRvZXMgbm90IG5lZWQgdG8gYWNjZXNzIHRoZQo+Pj4+PiBl
eHRlbnRfbm9kZS4gRm9yIHdyaXRlIG1hcHBpbmcsIHRoZSBjYXNlIHdoZXJlIHRoZSBsYXJnZXN0
IGV4dGVudCBpcwo+Pj4+PiBub3QgaW4gdGhlIGV4dGVudCB0cmVlIGNhbiBhbHJlYWR5IGJlIGhh
bmRsZWQgYnkgdGhlIG1lcmdlIGxvZ2ljLCBhbmQKPj4+Pj4gY2FzZXMgdGhhdCBjYW5ub3QgYmUg
bWVyZ2VkIGRvIG5vdCByZXF1aXJlIHRoZSBsYXJnZXN0IGV4dGVudCB0bwo+Pj4+PiBwYXJ0aWNp
cGF0ZSBlaXRoZXIuCj4+Pj4+Cj4+Pj4+IFRoZXJlZm9yZSwgdGhlIGxhcmdlc3QgZXh0ZW50IGRv
ZXMgbm90IG5lZWQgdG8gaW5pdGlhbGl6ZSBhCj4+Pj4+IGNvcnJlc3BvbmRpbmcgZXh0ZW50X25v
ZGUsIHJlZHVjaW5nIG1lbW9yeSBmb290cHJpbnQuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pj4+PiAtLS0KPj4+Pj4g
wqAgZnMvZjJmcy9leHRlbnRfY2FjaGUuYyB8IDE4ICstLS0tLS0tLS0tLS0tLS0tLQo+Pj4+PiDC
oCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDE3IGRlbGV0aW9ucygtKQo+Pj4+Pgo+
Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9leHRlbnRfY2FjaGUuYyBiL2ZzL2YyZnMvZXh0ZW50
X2NhY2hlLmMKPj4+Pj4gaW5kZXggYWEzNjhhMDFiMDM1Li5mOGQ5NGRiNjBkYzYgMTAwNjQ0Cj4+
Pj4+IC0tLSBhL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPj4+Pj4gKysrIGIvZnMvZjJmcy9leHRl
bnRfY2FjaGUuYwo+Pj4+PiBAQCAtNDEwLDEwICs0MTAsOCBAQCBzdGF0aWMgdm9pZCBfX2Ryb3Bf
bGFyZ2VzdF9leHRlbnQoc3RydWN0IGV4dGVudF90cmVlICpldCwKPj4+Pj4gwqAgdm9pZCBmMmZz
X2luaXRfcmVhZF9leHRlbnRfdHJlZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZm9saW8g
Kmlmb2xpbykKPj4+Pj4gwqAgewo+Pj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBmMmZzX3NiX2luZm8g
KnNiaSA9IEYyRlNfSV9TQihpbm9kZSk7Cj4+Pj4+IC3CoMKgwqAgc3RydWN0IGV4dGVudF90cmVl
X2luZm8gKmV0aSA9ICZzYmktPmV4dGVudF90cmVlW0VYX1JFQURdOwo+Pj4+PiDCoMKgwqDCoMKg
IHN0cnVjdCBmMmZzX2V4dGVudCAqaV9leHQgPSAmRjJGU19JTk9ERShpZm9saW8pLT5pX2V4dDsK
Pj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZXh0ZW50X3RyZWUgKmV0Owo+Pj4+PiAtwqDCoMKgIHN0
cnVjdCBleHRlbnRfbm9kZSAqZW47Cj4+Pj4+IMKgwqDCoMKgwqAgc3RydWN0IGV4dGVudF9pbmZv
IGVpID0gezB9Owo+Pj4+PiDCoMKgwqDCoMKgIGlmICghX19tYXlfZXh0ZW50X3RyZWUoaW5vZGUs
IEVYX1JFQUQpKSB7Cj4+Pj4+IEBAIC00MzUsMjEgKzQzMyw3IEBAIHZvaWQgZjJmc19pbml0X3Jl
YWRfZXh0ZW50X3RyZWUoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZvbGlvICppZm9saW8p
Cj4+Pj4+IMKgwqDCoMKgwqAgaWYgKGF0b21pY19yZWFkKCZldC0+bm9kZV9jbnQpIHx8ICFlaS5s
ZW4pCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHNraXA7Cj4+Pj4+IC3CoMKgwqAgaWYg
KElTX0RFVklDRV9BTElBU0lORyhpbm9kZSkpIHsKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGV0LT5s
YXJnZXN0ID0gZWk7Cj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBnb3RvIHNraXA7Cj4+Pj4+IC3CoMKg
wqAgfQo+Pj4+PiAtCj4+Pj4+IC3CoMKgwqAgZW4gPSBfX2F0dGFjaF9leHRlbnRfbm9kZShzYmks
IGV0LCAmZWksIE5VTEwsCj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmV0
LT5yb290LnJiX3Jvb3QucmJfbm9kZSwgdHJ1ZSk7Cj4+Pj4+IC3CoMKgwqAgaWYgKGVuKSB7Cj4+
Pj4+IC3CoMKgwqDCoMKgwqDCoCBldC0+bGFyZ2VzdCA9IGVuLT5laTsKPj4+Pj4gLcKgwqDCoMKg
wqDCoMKgIGV0LT5jYWNoZWRfZW4gPSBlbjsKPj4+Pj4gLQo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAg
c3Bpbl9sb2NrKCZldGktPmV4dGVudF9sb2NrKTsKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGxpc3Rf
YWRkX3RhaWwoJmVuLT5saXN0LCAmZXRpLT5leHRlbnRfbGlzdCk7Cj4+Pj4+IC3CoMKgwqDCoMKg
wqDCoCBzcGluX3VubG9jaygmZXRpLT5leHRlbnRfbG9jayk7Cj4+Pj4+IC3CoMKgwqAgfQo+Pj4+
PiArwqDCoMKgIGV0LT5sYXJnZXN0ID0gZWk7Cj4+Pj4KPj4+PiBQcmV2aW91c2x5LCB3ZSBjYW4g
c3BsaXQgbGFyZ2VzdCBleHRlbnQgbm9kZSB0byB0d28gaWYgd2UgcHVuY2hlZCBpdCwgbm93Cj4+
Pj4gd2UgY2FuIG5vdD8gSUlVQy4KPj4+Cj4+PiBQcmlvciB0byB0aGlzIGNoYW5nZSwgdGhlIGxh
cmdlc3QgZXh0ZW50IGNvdWxkIGFsc28gYmUgc2hydW5rLCBzbyB0aGUKPj4+IHNldCBvZiBzY2Vu
YXJpb3MgdGhhdCBuZWVkIGhhbmRsaW5nIGR1cmluZyBwdW5jaCByZW1haW5zIGlkZW50aWNhbAo+
Pj4gYmVmb3JlIGFuZCBhZnRlciB0aGUgbW9kaWZpY2F0aW9uLgo+Pj4KPj4+IEZvciB0aGUgbGFy
Z2VzdCBleHRlbnQsIGl0IG9ubHkgbmVlZHMgdG8gZ3VhcmFudGVlIHRoYXQgdGhlIG1hcHBpbmcK
Pj4+IGluZm9ybWF0aW9uIGl0IHJlY29yZHMgc3RheXMgY29uc2lzdGVudCB3aXRoIHRoZSBtYXBw
aW5ncyB0cmFja2VkIGluIHRoZQo+Pj4gZXh0ZW50IHRyZWUgYW5kIG11bHRpLWxldmVsIGluZGly
ZWN0IGluZGljZXMuIFRoZSBwdW5jaCBvcGVyYXRpb24gZG9lcwo+Pj4gbm90IGJyZWFrIHRoaXMg
Y29uc2lzdGVuY3kuIE1vcmVvdmVyLCB0aGUgbGFyZ2VzdCBleHRlbnQgaXMgbm90IHJlcXVpcmVk
Cj4+PiB0byBiZSB0aGUgbG9uZ2VzdCBleHRlbnQgYW1vbmcgYWxsIGVudHJpZXMgaW4gdGhlIGV4
dGVudCB0cmVlLiBJdCBtZXJlbHkKPj4+IG5lZWRzIHRvIG1hdGNoIHRoZSBtYXBwaW5ncyBzdG9y
ZWQgaW4gbXVsdGktbGV2ZWwgaW5kaXJlY3QgaW5kaWNlcyBhbmQKPj4+IGJlIG5vIHNtYWxsZXIg
dGhhbiB0aGUgbWF4aW11bSBleHRlbnQgcHJlc2VudCBpbiB0aGUgZXh0ZW50IHRyZWUuCj4+Cj4+
IFdoYXQgSSBtZWFudCBpczogZS5nLiBwcmV2aW91c2x5LCBpZiBsYXJnZXN0IGV4dGVudCBpcyAx
MDI0LCBwdW5jaGluZyBpbiB0aGUKPj4gbWlkZGxlIG9mIHRoZSBleHRlbnQgd2lsbCBtYWtlIGl0
IGJlaW5nIHNwbGl0IHRvIHR3byBleHRlbnRzICg1MTIsIDUxMSkgaW4KPj4gX191cGRhdGVfZXh0
ZW50X3RyZWVfcmFuZ2UoKS4KPj4KPj4gSWYgd2UgZG8gbm90IGFkZCBsYXJnZXN0IGV4dGVudCBu
b2RlIGludG8gcmIgdHJlZSBpbiBmMmZzX2luaXRfcmVhZF9leHRlbnRfdHJlZSgpLAo+PiB0aGVu
IHdlIG1heSBoYXMgbm8gY2hhbmNlIHRvIGtlZXAgc21hbGwtc2l6ZWQoNTExKSBleHRlbnQgaW4g
YWJvdmUgcHVuY2ggc2NlbmFyaW8sCj4+IGNhbiB5b3UgdmVyaWZ5IHRoYXQ/Cj4gCj4gWWVzLCB0
aGUgNTExLWJsb2NrIG1hcHBpbmcgd2lsbCBiZSBkcm9wcGVkLiBJIGNvbnNpZGVyZWQgdGhpcyBj
YXNlIGVhcmxpZXI6IHdoZW4gdGhlIG5ld2x5IGluc2VydGVkIG1hcHBpbmcgb3ZlcmxhcHMgd2l0
aCBvciBhZGphY2VudCB3aXRoIHRoZSBsYXJnZXN0IGV4dGVudCwgd2UgcmVpbnNlcnQgdGhlIGxh
cmdlc3QgZXh0ZW50IGJhY2sgaW50byB0aGUgZXh0ZW50IHRyZWUuIFdpdGggdGhpcyBsb2dpYywg
dGhlIDUxMS1ibG9jayBzcGxpdCBleHRlbnQgd2lsbCByZW1haW4gcHJlc2VudCBpbiB0aGUgZXh0
ZW50IHRyZWUuIEluc3RlYWQgb2YgcGVyZm9ybWluZyBwdW5jaCBoYW5kbGluZyBvbiB0aGUgbGFy
Z2VzdCBleHRlbnQsIHdlIGNhbiBzaW1wbHkgZHJvcCBpdCBkaXJlY3RseS4KPiBIb3dldmVyLCB0
aGlzIGFwcHJvYWNoIGRvZXMgbm90IHdvcmsgd2VsbCBmb3IgdXBkYXRlcyB0YXJnZXRpbmcgdGhl
IHRhaWwgb2YgdGhlIG9yaWdpbmFsIGV4dGVudC4gRm9yIGluc3RhbmNlLCBwdW5jaCAxMDI0IGlu
dG8gMTAyMiBhbmQgMSBmb3Igb3ZlcndyaXRlIGNhc2UsIHdoaWNoIHdpbGwgYWxzbyBhbGxvYyBv
bmUgbW9yZSBleHRlbnRfbm9kZS4KCldlIHdpbGwgb25seSBhZGQgZXh0ZW50IHdoaWNoIGhhcyBz
aXplID49IEYyRlNfTUlOX0VYVEVOVF9MRU4sIHNvIDEwMjIKd2lsbCBiZSBhZGRlZCwgYW5kIDEg
d2lsbCBiZSBkcm9wcGVkLgoKVGhhbmtzLAoKPiAKPiBUaGFua3MKPiBZb25ncGVuZywKPiAKPj4K
Pj4gVGhhbmtzLAo+Pgo+Pj4KPj4+IFRoYW5rcwo+Pj4gWW9uZ3BlbmcsCj4+Pgo+Pj4KPj4+Pgo+
Pj4+IFRoYW5rcywKPj4+Pgo+Pj4+PiDCoCBza2lwOgo+Pj4+PiDCoMKgwqDCoMKgIC8qIExldCdz
IGRyb3AsIGlmIGNoZWNrcG9pbnQgZ290IGNvcnJ1cHRlZC4gKi8KPj4+Pj4gwqDCoMKgwqDCoCBp
ZiAoZjJmc19jcF9lcnJvcihzYmkpKSB7Cj4+Pj4KPj4+Pgo+Pj4+Cj4+Pj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+PiBMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdAo+Pj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cj4+Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo+Pj4KPj4KPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+IAoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
