Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N367G94JNmo+7AYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Jun 2026 05:32:46 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A36D16A8458
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Jun 2026 05:32:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="BF/ikOcu";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=PyZ5yNSa;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="O7mWB/E2";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=jiRkqCzz;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZlYqHXqAwCmtNgUSsvJ3U12+0e/P9CfKD5KXv5WGe58=; b=BF/ikOcuBVhd/QNrOBZOtWHlsG
	t6vzwD4Pf83q4pIoCN64gDtEEX1ihtUERUcjWGghj546zRG4bFwRED+PHagdBvW2JVziu48XaykGj
	/UZzCnkKVjW4rwsLEkPrdnvzhTFHO7MtqF6H6T4xs2cPJmXirAybjMKa8njmrI2fxMes=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wamRg-0002LP-2C;
	Sat, 20 Jun 2026 03:32:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wamQw-0002IR-UH
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Jun 2026 03:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=490I7T/pIBDS/RZ4WT4pqXhDmmFPEzvKTu6LJ1rEHcs=; b=PyZ5yNSab9Tfr5F1rGh4K2lbDr
 Xz/dGVsQy5911J8ZqPlRQDAgD/f/B1qADYYUU5a9bPFzGZ36kLlrWi5dR0YXsnuXdwvvbcUg0wQfi
 RpqWNX28DuINmfJz0AWh5vV+x78ki8VuA3EKUQwGiF1GxcRcau2yEDPkvkYC0tMS/FLU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=490I7T/pIBDS/RZ4WT4pqXhDmmFPEzvKTu6LJ1rEHcs=; b=O7mWB/E2OmUhTJPEKlJvzaj8xQ
 9TfWx5eMyWH9x1kuaouYMgMtqOMZRkjnEkWRYHChCx/UW7k9S1kG0Kdtfs/6mNQwmc0ZWeAwHhE2C
 EmtcGUAUWQrK6bNRkKnk4Ryr1VaKTFADDdak3IC525bbsclY7xHwZn68zgMy/DNkbtvc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wamQw-0001wJ-I3 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Jun 2026 03:31:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id AA37B43CF6;
 Sat, 20 Jun 2026 03:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6141F000E9;
 Sat, 20 Jun 2026 03:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781926300;
 bh=490I7T/pIBDS/RZ4WT4pqXhDmmFPEzvKTu6LJ1rEHcs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=jiRkqCzzrDK1Cbt1nwdelCu9i8AhuabiaPkKp6Qb9LROUxCDhfretOHxapq2UBvXh
 DVXq9eXBiTkusIViSCPOCX9K82I8KdaghhpajzSHhYkXgezxhbbWLZr19xQcj1T2vl
 CV+y7llnW+Jgh/3xgE0hZ+12ucXjFqvhqwMLMDKofcjlG0Q/QMCb1YdON+UqQu6soI
 0XUWN7u0cTxpuXrqPMx2OR/+axeZqWTXc1znX/zro2qh9/47uDxUrZgtTGzLztakfw
 x5drvt8vxT9wIN3e8MALks2f8pd7+7kHibzvaCCpEkT3GWQfRnAIL0W+hNlgLn3Qzu
 cWbLtffD+4mYw==
Message-ID: <e876caa4-37bb-409c-98e5-2d051178d6db@kernel.org>
Date: Sat, 20 Jun 2026 11:31:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
 <20260612115839.2065903-3-yangyongpeng.storage@gmail.com>
 <7ffe0789-1024-4dc7-9089-2dcf856a1bd1@kernel.org>
 <SEZPR02MB5662A85B218D3EF7B2FA8C6599E22@SEZPR02MB5662.apcprd02.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <SEZPR02MB5662A85B218D3EF7B2FA8C6599E22@SEZPR02MB5662.apcprd02.prod.outlook.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/19/26 22:34, Yongpeng Yang wrote: > > On 6/15/26 7:55
 PM, Chao Yu via Linux-f2fs-devel wrote: >> On 6/12/26 19:58, Yongpeng Yang
 wrote: >>> From: Yongpeng Yang <yangyongpeng@xiaomi.com> >>> >>> T [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wamQw-0001wJ-I3
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
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
X-Rspamd-Queue-Id: A36D16A8458

T24gNi8xOS8yNiAyMjozNCwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPiAKPiBPbiA2LzE1LzI2IDc6
NTUgUE0sIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+IE9uIDYvMTIvMjYg
MTk6NTgsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+PiBGcm9tOiBZb25ncGVuZyBZYW5nIDx5YW5n
eW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4+Cj4+PiBUaGUgbGFyZ2VzdCBleHRlbnQgdGFrZXMgZWZm
ZWN0IGR1cmluZyBib3RoIHJlYWQgbWFwcGluZyBhbmQgd3JpdGUKPj4+IG1hcHBpbmcgbG9va3Vw
cywgd2hpbGUgcmVhZCBtYXBwaW5nIGRvZXMgbm90IG5lZWQgdG8gYWNjZXNzIHRoZQo+Pj4gZXh0
ZW50X25vZGUuIEZvciB3cml0ZSBtYXBwaW5nLCB0aGUgY2FzZSB3aGVyZSB0aGUgbGFyZ2VzdCBl
eHRlbnQgaXMKPj4+IG5vdCBpbiB0aGUgZXh0ZW50IHRyZWUgY2FuIGFscmVhZHkgYmUgaGFuZGxl
ZCBieSB0aGUgbWVyZ2UgbG9naWMsIGFuZAo+Pj4gY2FzZXMgdGhhdCBjYW5ub3QgYmUgbWVyZ2Vk
IGRvIG5vdCByZXF1aXJlIHRoZSBsYXJnZXN0IGV4dGVudCB0bwo+Pj4gcGFydGljaXBhdGUgZWl0
aGVyLgo+Pj4KPj4+IFRoZXJlZm9yZSwgdGhlIGxhcmdlc3QgZXh0ZW50IGRvZXMgbm90IG5lZWQg
dG8gaW5pdGlhbGl6ZSBhCj4+PiBjb3JyZXNwb25kaW5nIGV4dGVudF9ub2RlLCByZWR1Y2luZyBt
ZW1vcnkgZm9vdHByaW50Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFlvbmdwZW5nIFlhbmcgPHlh
bmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pj4gLS0tCj4+PiDCoCBmcy9mMmZzL2V4dGVudF9jYWNo
ZS5jIHwgMTggKy0tLS0tLS0tLS0tLS0tLS0tCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDE3IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2V4
dGVudF9jYWNoZS5jIGIvZnMvZjJmcy9leHRlbnRfY2FjaGUuYwo+Pj4gaW5kZXggYWEzNjhhMDFi
MDM1Li5mOGQ5NGRiNjBkYzYgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL2V4dGVudF9jYWNoZS5j
Cj4+PiArKysgYi9mcy9mMmZzL2V4dGVudF9jYWNoZS5jCj4+PiBAQCAtNDEwLDEwICs0MTAsOCBA
QCBzdGF0aWMgdm9pZCBfX2Ryb3BfbGFyZ2VzdF9leHRlbnQoc3RydWN0IGV4dGVudF90cmVlICpl
dCwKPj4+IMKgIHZvaWQgZjJmc19pbml0X3JlYWRfZXh0ZW50X3RyZWUoc3RydWN0IGlub2RlICpp
bm9kZSwgc3RydWN0IGZvbGlvICppZm9saW8pCj4+PiDCoCB7Cj4+PiDCoMKgwqDCoMKgIHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSA9IEYyRlNfSV9TQihpbm9kZSk7Cj4+PiAtwqDCoMKgIHN0cnVj
dCBleHRlbnRfdHJlZV9pbmZvICpldGkgPSAmc2JpLT5leHRlbnRfdHJlZVtFWF9SRUFEXTsKPj4+
IMKgwqDCoMKgwqAgc3RydWN0IGYyZnNfZXh0ZW50ICppX2V4dCA9ICZGMkZTX0lOT0RFKGlmb2xp
byktPmlfZXh0Owo+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZXh0ZW50X3RyZWUgKmV0Owo+Pj4gLcKg
wqDCoCBzdHJ1Y3QgZXh0ZW50X25vZGUgKmVuOwo+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZXh0ZW50
X2luZm8gZWkgPSB7MH07Cj4+PiDCoMKgwqDCoMKgIGlmICghX19tYXlfZXh0ZW50X3RyZWUoaW5v
ZGUsIEVYX1JFQUQpKSB7Cj4+PiBAQCAtNDM1LDIxICs0MzMsNyBAQCB2b2lkIGYyZnNfaW5pdF9y
ZWFkX2V4dGVudF90cmVlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmb2xpbyAqaWZvbGlv
KQo+Pj4gwqDCoMKgwqDCoCBpZiAoYXRvbWljX3JlYWQoJmV0LT5ub2RlX2NudCkgfHwgIWVpLmxl
bikKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHNraXA7Cj4+PiAtwqDCoMKgIGlmIChJU19E
RVZJQ0VfQUxJQVNJTkcoaW5vZGUpKSB7Cj4+PiAtwqDCoMKgwqDCoMKgwqAgZXQtPmxhcmdlc3Qg
PSBlaTsKPj4+IC3CoMKgwqDCoMKgwqDCoCBnb3RvIHNraXA7Cj4+PiAtwqDCoMKgIH0KPj4+IC0K
Pj4+IC3CoMKgwqAgZW4gPSBfX2F0dGFjaF9leHRlbnRfbm9kZShzYmksIGV0LCAmZWksIE5VTEws
Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZldC0+cm9vdC5yYl9yb290LnJi
X25vZGUsIHRydWUpOwo+Pj4gLcKgwqDCoCBpZiAoZW4pIHsKPj4+IC3CoMKgwqDCoMKgwqDCoCBl
dC0+bGFyZ2VzdCA9IGVuLT5laTsKPj4+IC3CoMKgwqDCoMKgwqDCoCBldC0+Y2FjaGVkX2VuID0g
ZW47Cj4+PiAtCj4+PiAtwqDCoMKgwqDCoMKgwqAgc3Bpbl9sb2NrKCZldGktPmV4dGVudF9sb2Nr
KTsKPj4+IC3CoMKgwqDCoMKgwqDCoCBsaXN0X2FkZF90YWlsKCZlbi0+bGlzdCwgJmV0aS0+ZXh0
ZW50X2xpc3QpOwo+Pj4gLcKgwqDCoMKgwqDCoMKgIHNwaW5fdW5sb2NrKCZldGktPmV4dGVudF9s
b2NrKTsKPj4+IC3CoMKgwqAgfQo+Pj4gK8KgwqDCoCBldC0+bGFyZ2VzdCA9IGVpOwo+Pgo+PiBQ
cmV2aW91c2x5LCB3ZSBjYW4gc3BsaXQgbGFyZ2VzdCBleHRlbnQgbm9kZSB0byB0d28gaWYgd2Ug
cHVuY2hlZCBpdCwgbm93Cj4+IHdlIGNhbiBub3Q/IElJVUMuCj4gCj4gUHJpb3IgdG8gdGhpcyBj
aGFuZ2UsIHRoZSBsYXJnZXN0IGV4dGVudCBjb3VsZCBhbHNvIGJlIHNocnVuaywgc28gdGhlCj4g
c2V0IG9mIHNjZW5hcmlvcyB0aGF0IG5lZWQgaGFuZGxpbmcgZHVyaW5nIHB1bmNoIHJlbWFpbnMg
aWRlbnRpY2FsCj4gYmVmb3JlIGFuZCBhZnRlciB0aGUgbW9kaWZpY2F0aW9uLgo+IAo+IEZvciB0
aGUgbGFyZ2VzdCBleHRlbnQsIGl0IG9ubHkgbmVlZHMgdG8gZ3VhcmFudGVlIHRoYXQgdGhlIG1h
cHBpbmcKPiBpbmZvcm1hdGlvbiBpdCByZWNvcmRzIHN0YXlzIGNvbnNpc3RlbnQgd2l0aCB0aGUg
bWFwcGluZ3MgdHJhY2tlZCBpbiB0aGUKPiBleHRlbnQgdHJlZSBhbmQgbXVsdGktbGV2ZWwgaW5k
aXJlY3QgaW5kaWNlcy4gVGhlIHB1bmNoIG9wZXJhdGlvbiBkb2VzCj4gbm90IGJyZWFrIHRoaXMg
Y29uc2lzdGVuY3kuIE1vcmVvdmVyLCB0aGUgbGFyZ2VzdCBleHRlbnQgaXMgbm90IHJlcXVpcmVk
Cj4gdG8gYmUgdGhlIGxvbmdlc3QgZXh0ZW50IGFtb25nIGFsbCBlbnRyaWVzIGluIHRoZSBleHRl
bnQgdHJlZS4gSXQgbWVyZWx5Cj4gbmVlZHMgdG8gbWF0Y2ggdGhlIG1hcHBpbmdzIHN0b3JlZCBp
biBtdWx0aS1sZXZlbCBpbmRpcmVjdCBpbmRpY2VzIGFuZAo+IGJlIG5vIHNtYWxsZXIgdGhhbiB0
aGUgbWF4aW11bSBleHRlbnQgcHJlc2VudCBpbiB0aGUgZXh0ZW50IHRyZWUuCgpXaGF0IEkgbWVh
bnQgaXM6IGUuZy4gcHJldmlvdXNseSwgaWYgbGFyZ2VzdCBleHRlbnQgaXMgMTAyNCwgcHVuY2hp
bmcgaW4gdGhlCm1pZGRsZSBvZiB0aGUgZXh0ZW50IHdpbGwgbWFrZSBpdCBiZWluZyBzcGxpdCB0
byB0d28gZXh0ZW50cyAoNTEyLCA1MTEpIGluCl9fdXBkYXRlX2V4dGVudF90cmVlX3JhbmdlKCku
CgpJZiB3ZSBkbyBub3QgYWRkIGxhcmdlc3QgZXh0ZW50IG5vZGUgaW50byByYiB0cmVlIGluIGYy
ZnNfaW5pdF9yZWFkX2V4dGVudF90cmVlKCksCnRoZW4gd2UgbWF5IGhhcyBubyBjaGFuY2UgdG8g
a2VlcCBzbWFsbC1zaXplZCg1MTEpIGV4dGVudCBpbiBhYm92ZSBwdW5jaCBzY2VuYXJpbywKY2Fu
IHlvdSB2ZXJpZnkgdGhhdD8KClRoYW5rcywKCj4gCj4gVGhhbmtzCj4gWW9uZ3BlbmcsCj4gCj4g
Cj4+Cj4+IFRoYW5rcywKPj4KPj4+IMKgIHNraXA6Cj4+PiDCoMKgwqDCoMKgIC8qIExldCdzIGRy
b3AsIGlmIGNoZWNrcG9pbnQgZ290IGNvcnJ1cHRlZC4gKi8KPj4+IMKgwqDCoMKgwqAgaWYgKGYy
ZnNfY3BfZXJyb3Ioc2JpKSkgewo+Pgo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+
PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+PiBodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4gCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
