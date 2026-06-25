Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hnkHJJTdPGovtggAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jun 2026 09:49:40 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3F96C37CA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jun 2026 09:49:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=KsZQ7gnX;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=KMcp5WH9;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=jtv0R1IL;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=i4aeAftC;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJe+C6+LHPMXxRh3xaxOd80BVlEubS98YqjtdOYfbDo=; b=KsZQ7gnXZIubl1rpobXTwb/O0g
	9zX57PANyXe62D88hWvwlz7s+NluqXTxz5XccOTF4dlb5Dj/lvYfRnTvwnNTz5FX8HHscGvvObSQt
	zXIHTDoIJu46PJkNCSRXf1nwcMIHizVpQvM8bLWDKkAWMTKPBsac4P2Q2x+Uas8Q8+6Y=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wceq3-0008RJ-QZ;
	Thu, 25 Jun 2026 07:49:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wceq2-0008R5-7L
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jun 2026 07:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=amjm5Do96pSNw1MDmWEntVDDTklzcylHOIy7B5j5y7w=; b=KMcp5WH9mt83ky9aMC2h8X/ziz
 +eaHyTnaFLK2kz56I0TCcLpKhMPf9uN5zM2yL7oY6RLDZGT8njSMNWJyfAulTTf9GCTgdEsawYwGh
 vPGa5YCh7tWz9khhuGF1cbgEYkQ3K/WQeOR022X+yBK1xZVcn2ZcO1yjf1aSAP/FgB8E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=amjm5Do96pSNw1MDmWEntVDDTklzcylHOIy7B5j5y7w=; b=jtv0R1ILLHXsMl95V94QwOeC6h
 juIa1PN8s1JM1zhq/YF2ZqXV6DhfU/uh1imZ7DEAo2kzObgB3t2fZe6xHCvoyqdvG0VXv0x2T/lNp
 2cOXLntqLxcr9jiKRGrjZSwKMk9daJaa4E9Mq0rmveFTBb4W6PUjiITQI3pN6V9B3Exo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wcepz-0005fZ-TC for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jun 2026 07:49:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E8E5242A28;
 Thu, 25 Jun 2026 07:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC4911F000E9;
 Thu, 25 Jun 2026 07:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782373757;
 bh=amjm5Do96pSNw1MDmWEntVDDTklzcylHOIy7B5j5y7w=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=i4aeAftCBhnGRwEyMOHIi37bu2ytxeT65FoliFbyZcLI+74kqOq5QiTmqh/1cQTPa
 Upv9yi70HbflGz9iV5g/SoG6+pzWqNRHKpANDwUVx0pbcyR5xJ7zlViZXf7xrf33S2
 8TNp0PNekubNTCSxgW8DI/Q2HQs/m2/nm9F1QZtukV9tb3a1ZlbywibeB6RQakSZWo
 s88wfq4Kb4RwGYLMqKehLrU9K+RabXQ4Mfh3pVV2bITDL+P2lsSukE/Z410VomiWY3
 xUFInncaytbigxfAz9Rm47E4XvJxhgR1IbQnSd6V0U3g/afbH6qWp0L51L59i5SVSq
 qGJR/LeBXaouw==
Message-ID: <51d8c58c-07b8-438a-8b42-89b05a8d7472@kernel.org>
Date: Thu, 25 Jun 2026 15:49:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
 <20260612115839.2065903-4-yangyongpeng.storage@gmail.com>
 <b380cd69-66db-4ef1-8d33-92ed6c34d263@kernel.org>
 <SEZPR02MB566231EECF99FCD70B8E410F99E22@SEZPR02MB5662.apcprd02.prod.outlook.com>
 <462ef62b-d83c-463f-8f44-4843ac179c2f@kernel.org>
 <SEZPR02MB56622CEC6B0C1B8E320262DE99E02@SEZPR02MB5662.apcprd02.prod.outlook.com>
 <7cad39b2-b822-4c0a-81c0-03e37b8334ef@kernel.org>
 <SEZPR02MB566274C1A81B5BCA484B0DE999EE2@SEZPR02MB5662.apcprd02.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <SEZPR02MB566274C1A81B5BCA484B0DE999EE2@SEZPR02MB5662.apcprd02.prod.outlook.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/23/26 17:31, Yongpeng Yang wrote: > > On 6/22/26 08:45, 
 Chao Yu via Linux-f2fs-devel wrote: >> On 6/22/26 00:07, Yongpeng Yang wrote:
 >>> >>> On 6/20/26 2:15 PM, Chao Yu via Linux-f2fs-devel wrot [...] 
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
X-Headers-End: 1wcepz-0005fZ-TC
Subject: Re: [f2fs-dev] [PATCH RESEND 3/5] f2fs: punch largest extent
 instead of dropping it entirely on overlap
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
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:yangyongpeng.storage@outlook.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[outlook.com,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE3F96C37CA

T24gNi8yMy8yNiAxNzozMSwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPiAKPiBPbiA2LzIyLzI2IDA4
OjQ1LCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+PiBPbiA2LzIyLzI2IDAw
OjA3LCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4KPj4+IE9uIDYvMjAvMjYgMjoxNSBQTSwgQ2hh
byBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4+PiBPbiA2LzE5LzI2IDIyOjM4LCBZ
b25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4+Pgo+Pj4+PiBPbiA2LzE1LzI2IDg6MDUgUE0sIENoYW8g
WXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+Pj4+PiBPbiA2LzEyLzI2IDE5OjU4LCBZ
b25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4+Pj4+IEZyb206IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25n
cGVuZ0B4aWFvbWkuY29tPgo+Pj4+Pj4+Cj4+Pj4+Pj4gUHJldmlvdXNseSwgd2hlbiBhbiBleHRl
bnQgYmVpbmcgaW5zZXJ0ZWQgb3ZlcmxhcHMgd2l0aCB0aGUgbGFyZ2VzdAo+Pj4+Pj4+IGV4dGVu
dCwgdGhlIGxhcmdlc3QgZXh0ZW50IGlzIGRyb3BwZWQgZW50aXJlbHkuIFRoaXMgd2FzIGRvbmUg
dG8KPj4+Pj4+PiBoYW5kbGUKPj4+Pj4+Cj4+Pj4+PiBQbGVhc2UgY29ycmVjdCBtZSBpZiBJIG1p
c3NlZCBhbnl0aGluZywgSSByZW1lbWJlciB0aGF0IHdlIHdpbGwgYWRkCj4+Pj4+PiBsYXJnZXN0
Cj4+Pj4+PiBleHRlbnQgaW4gYmVsb3cgcGF0aD8KPj4+Pj4+Cj4+Pj4+PiAtIF9fdXBkYXRlX2V4
dGVudF90cmVlX3JhbmdlCj4+Pj4+PiDCoCAtIF9faW5zZXJ0X2V4dGVudF90cmVlCj4+Pj4+PiDC
oMKgIC0gX190cnlfdXBkYXRlX2xhcmdlc3RfZXh0ZW50IDogdXBkYXRlIGxhcmdlc3Qgdy8gcmln
aHQgZXh0ZW50Cj4+Pj4+PiDCoCAtIF9fdHJ5X3VwZGF0ZV9sYXJnZXN0X2V4dGVudCA6IHVwZGF0
ZSBsYXJnZXN0IHcvIGxlZnQgZXh0ZW50Cj4+Pj4+Cj4+Pj4+IFRoZSBsYXJnZXN0IGV4dGVudCBt
aWdodCBub3QgcmVzaWRlIGluIHRoZSBleHRlbnQgdHJlZS4gSWYKPj4+Pj4gX191cGRhdGVfZXh0
ZW50X3RyZWVfcmFuZ2UgaW52b2tlcyBfX2Ryb3BfbGFyZ2VzdF9leHRlbnQsIHRoZSBsZW5ndGgg
b2YKPj4+Pgo+Pj4+IEkgbWVhbnQgX191cGRhdGVfZXh0ZW50X3RyZWVfcmFuZ2UgaW52b2tlcyBf
X2Ryb3BfbGFyZ2VzdF9leHRlbnQgdG8gZHJvcAo+Pj4+IGxhcmdlc3QgZmlyc3QsIGFuZCB0aGVu
LCBpdCB0cmllcyB0byB1cGRhdGUgbGFyZ2VzdCBleHRlbnQgdy8gbGFyZ2VyLQo+Pj4+IHNpemUK
Pj4+PiBvbmUgb2Ygc2VwYXJhdGVkIHR3byBleHRlbnRzLgo+Pj4+Cj4+Pj4+IHRoZSBsYXJnZXN0
IGV4dGVudCB3aWxsIGhhdmUgYmVlbiBzZXQgdG8gemVyby4gQXMgYSByZXN1bHQsIHRoZSBsYXJn
ZXN0Cj4+Pj4+IGV4dGVudCB1cGRhdGVkIGluc2lkZSBfX3RyeV91cGRhdGVfbGFyZ2VzdF9leHRl
bnQgY2FuIGVuZCB1cCBzbWFsbGVyCj4+Pj4+IHRoYW4gdGhlIGxhcmdlc3QgZXh0ZW50IG9idGFp
bmVkIGFmdGVyIF9fcHVuY2hfbGFyZ2VzdF9leHRlbnQgY29tcGxldGVzCj4+Pj4+IGl0cyBwdW5j
aCBvcGVyYXRpb24uCj4+Pj4KPj4+PiBJIGRpZG4ndCBnZXQgaXQsIGNhbiB5b3UgZ2l2ZSBhbiBl
eGFtcGxlIGZvciB0aGlzPwo+Pj4KPj4+IFRoZSBvbmx5IGRpc3RpbmN0aW9uIGJldHdlZW4gcHVu
Y2ggYW5kIGRyb3AgYXJpc2VzIHdoZW4gdGhlIGxhcmdlc3QKPj4+IGV4dGVudCBpcyBub3QgcHJl
c2VudCBpbiB0aGUgZXh0ZW50IHRyZWUuCj4+Pgo+Pj4gQmVmb3JlIHRoaXMgcGF0Y2goZXh0ZW50
IGZvcm1hdCBbZm9mcywgbGVuLCBibGtdKQo+Pj4gMS4gaW5pdGFsIHN0YXRlCj4+PiDCoMKgwqDC
oCBsYXJnZXN0IGV4dGVudDogWzAsIDEwMjQsIDEwXSwgZXh0ZW50IHRyZWU6IGVtcHR5Cj4+Cj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXl5eXl4KPj4KPj4g
SXQncyBub3QgZW1wdHkgdy9vIHBhdGNoIDIvNS4KPiAKPiBTb3JyeSBmb3IgdGhlIGNvbmZ1c2lv
bi4gImVtcHR5IiBtZWFucyB0aGF0IHRoZSBsYXJnZXN0IGV4dGVudCBoYXMgYmVlbgo+IHNocnVu
ay4KCk9rYXksCgpIbW0uLi5JIGZvdW5kIGl0J3MgaGFyZCB0byByZXByb2R1Y2Ugc3VjaCBjb25k
aXRpb24gIm9ubHkgc2hyaW5rIGV4dGVudCBzbGFiCmNhY2hlIGFuZCBrZWVwIGlub2RlIHNsYWIg
Y2FjaGUiLCBzbyBJIHdvbmRlciBob3cgY29tbW9uIHRoaXMgaXNzdWUgd2lsbCBiZQppbiBwcm9k
dWN0LgoKSGF2ZSB5b3Ugc3VmZmVyZWQgcmVhbCBpc3N1ZXMgaW4gcHJvZHVjdD8gb3IganVzdCBp
bnNpZ2h0IGZyb20gTExNIG9yIGNvZGUKcmV2aWV3PwoKVGhhbmtzLAoKPiAKPiBUaGFua3MKPiBZ
b25ncGVuZywKPiAKPj4KPj4gVGhhbmtzLAo+Pgo+Pj4gMi4gaW5zZXJ0IFs1MTEsIDEsIDEwMDAw
XQo+Pj4gwqDCoMKgwqAgbGFyZ2VzdCBleHRlbnQ6IFs1MTEsIDEsIDEwMDAwXSwgZXh0ZW50IHRy
ZWU6IFs1MTEsIDEsIDEwMDAwXQo+Pj4KPj4+IEFmdGVyIHRoaXMgcGF0Y2g6Cj4+PiAxLiBpbml0
YWwgc3RhdGUKPj4+IMKgwqDCoMKgIGxhcmdlc3QgZXh0ZW50OiBbMCwgMTAyNCwgMTBdLCBleHRl
bnQgdHJlZTogZW1wdHkKPj4+IDIuIGluc2VydCBbNTExLCAxLCAxMDAwMF0KPj4+IMKgwqDCoMKg
IGxhcmdlc3QgZXh0ZW50OiBbNTEyLCA1MTIsIDUyMl0sIGV4dGVudCB0cmVlOiBbNTExLCAxLCAx
MDAwMF0KPj4+Cj4+PiBUaGFua3MKPj4+IFlvbmdwZW5nLAo+Pj4KPj4+Pgo+Pj4+IFRoYW5rcywK
Pj4+Pgo+Pj4+Pgo+Pj4+PiBUaGFua3MKPj4+Pj4gWW9uZ3BlbmcsCj4+Pj4+Cj4+Pj4+Pgo+Pj4+
Pj4gVGhhbmtzLAo+Pj4+Pj4KPj4+Pj4+PiB0aGUgY2FzZSB3aGVyZSB0aGUgbGFyZ2VzdCBleHRl
bnQgaXMgbm90IGluIG1lbW9yeSwgYXZvaWRpbmcKPj4+Pj4+PiBpbmNvbnNpc3RlbmN5IGJldHdl
ZW4gdGhlIGxhcmdlc3QgZXh0ZW50IGFuZCB0aGUgZXh0ZW50IHRyZWUuCj4+Pj4+Pj4KPj4+Pj4+
PiBUaGlzIHBhdGNoIGNoYW5nZXMgdGhlIHNlbWFudGljcyBvZiBfX2Ryb3BfbGFyZ2VzdF9leHRl
bnQgKHJlbmFtZWQgdG8KPj4+Pj4+PiBfX3B1bmNoX2xhcmdlc3RfZXh0ZW50KTogaW5zdGVhZCBv
ZiBkaXNjYXJkaW5nIHRoZSBlbnRpcmUgbGFyZ2VzdAo+Pj4+Pj4+IGV4dGVudCB3aGVuIGFueSBv
dmVybGFwIGlzIGRldGVjdGVkLCBrZWVwIHRoZSBsYXJnZXIgcmVtYWluaW5nCj4+Pj4+Pj4gcG9y
dGlvbgo+Pj4+Pj4+IChsZWZ0IG9yIHJpZ2h0KSBhZnRlciB0aGUgcHVuY2guIFRoaXMgcHJlc2Vy
dmVzIGV4dGVudCBjYWNoZSBjb3ZlcmFnZQo+Pj4+Pj4+IGZvciB0cnVuY2F0ZSBhbmQgb3Zlcndy
aXRlIG9wZXJhdGlvbnMgdGhhdCBvbmx5IHBhcnRpYWxseSBvdmVybGFwIHRoZQo+Pj4+Pj4+IGxh
cmdlc3QgZXh0ZW50Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogWW9uZ3BlbmcgWWFu
ZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4gwqAgZnMvZjJm
cy9leHRlbnRfY2FjaGUuYyB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KPj4+
Pj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkK
Pj4+Pj4+Pgo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2V4dGVudF9jYWNoZS5jIGIvZnMv
ZjJmcy9leHRlbnRfY2FjaGUuYwo+Pj4+Pj4+IGluZGV4IGY4ZDk0ZGI2MGRjNi4uODJkODRjNGU5
OGIyIDEwMDY0NAo+Pj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPj4+Pj4+PiAr
KysgYi9mcy9mMmZzL2V4dGVudF9jYWNoZS5jCj4+Pj4+Pj4gQEAgLTM5NywxNCArMzk3LDMxIEBA
IHN0YXRpYyB1bnNpZ25lZCBpbnQKPj4+Pj4+PiBfX2ZyZWVfZXh0ZW50X3RyZWUoc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpLAo+Pj4+Pj4+IMKgwqDCoMKgwqAgcmV0dXJuIGNvdW50Owo+Pj4+Pj4+
IMKgIH0KPj4+Pj4+PiAtc3RhdGljIHZvaWQgX19kcm9wX2xhcmdlc3RfZXh0ZW50KHN0cnVjdCBl
eHRlbnRfdHJlZSAqZXQsCj4+Pj4+Pj4gK3N0YXRpYyB2b2lkIF9fcHVuY2hfbGFyZ2VzdF9leHRl
bnQoc3RydWN0IGV4dGVudF90cmVlICpldCwKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcGdvZmZfdCBmb2ZzLCB1bnNpZ25lZCBpbnQgbGVuKQo+Pj4+
Pj4+IMKgIHsKPj4+Pj4+PiAtwqDCoMKgIGlmIChmb2ZzIDwgKHBnb2ZmX3QpZXQtPmxhcmdlc3Qu
Zm9mcyArIGV0LT5sYXJnZXN0LmxlbiAmJgo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGZvZnMgKyBsZW4gPiBldC0+bGFyZ2VzdC5mb2ZzKSB7Cj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKg
IGV0LT5sYXJnZXN0LmxlbiA9IDA7Cj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGV0LT5sYXJnZXN0
X3VwZGF0ZWQgPSB0cnVlOwo+Pj4+Pj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IGxhcmdlc3RfZW5k
LCBwdW5jaF9lbmQ7Cj4+Pj4+Pj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQgbGVmdF9sZW4sIHJpZ2h0
X2xlbjsKPj4+Pj4+PiArCj4+Pj4+Pj4gK8KgwqDCoCBpZiAoZm9mcyA+PSAocGdvZmZfdClldC0+
bGFyZ2VzdC5mb2ZzICsgZXQtPmxhcmdlc3QubGVuIHx8Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZm9mcyArIGxlbiA8PSBldC0+bGFyZ2VzdC5mb2ZzKQo+Pj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoCByZXR1cm47Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICvCoMKgwqAgLyogUHVuY2ggW2ZvZnMs
IGZvZnMgKyBsZW4pIGZyb20gbGFyZ2VzdCBleHRlbnQuICovCj4+Pj4+Pj4gK8KgwqDCoCBsYXJn
ZXN0X2VuZCA9IGV0LT5sYXJnZXN0LmZvZnMgKyBldC0+bGFyZ2VzdC5sZW47Cj4+Pj4+Pj4gK8Kg
wqDCoCBwdW5jaF9lbmQgPSBmb2ZzICsgbGVuOwo+Pj4+Pj4+ICsKPj4+Pj4+PiArwqDCoMKgIGxl
ZnRfbGVuID0gZm9mcyA+IGV0LT5sYXJnZXN0LmZvZnMgPyBmb2ZzIC0gZXQtCj4+Pj4+Pj4+IGxh
cmdlc3QuZm9mcyA6IDA7Cj4+Pj4+Pj4gK8KgwqDCoCByaWdodF9sZW4gPSBsYXJnZXN0X2VuZCA+
IHB1bmNoX2VuZCA/IGxhcmdlc3RfZW5kIC0KPj4+Pj4+PiBwdW5jaF9lbmQgOiAwOwo+Pj4+Pj4+
ICsKPj4+Pj4+PiArwqDCoMKgIGlmIChsZWZ0X2xlbiA+PSByaWdodF9sZW4pIHsKPj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqAgZXQtPmxhcmdlc3QubGVuID0gbGVmdF9sZW47Cj4+Pj4+Pj4gK8KgwqDC
oCB9IGVsc2Ugewo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBldC0+bGFyZ2VzdC5ibGsgKz0gcHVu
Y2hfZW5kIC0gZXQtPmxhcmdlc3QuZm9mczsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZXQtPmxh
cmdlc3QuZm9mcyA9IHB1bmNoX2VuZDsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZXQtPmxhcmdl
c3QubGVuID0gcmlnaHRfbGVuOwo+Pj4+Pj4+IMKgwqDCoMKgwqAgfQo+Pj4+Pj4+ICvCoMKgwqAg
ZXQtPmxhcmdlc3RfdXBkYXRlZCA9IHRydWU7Cj4+Pj4+Pj4gwqAgfQo+Pj4+Pj4+IMKgIHZvaWQg
ZjJmc19pbml0X3JlYWRfZXh0ZW50X3RyZWUoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0Cj4+
Pj4+Pj4gZm9saW8gKmlmb2xpbykKPj4+Pj4+PiBAQCAtNjgwLDEwICs2OTcsMTAgQEAgc3RhdGlj
IHZvaWQKPj4+Pj4+PiBfX3VwZGF0ZV9leHRlbnRfdHJlZV9yYW5nZShzdHJ1Y3QgaW5vZGUgKmlu
b2RlLAo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkZWkubGVuID0gMDsKPj4+Pj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgLyoKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoCAqIGRyb3AgbGFyZ2Vz
dCBleHRlbnQgYmVmb3JlIGxvb2t1cCwgaW4gY2FzZSBpdCdzIGFscmVhZHkKPj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqDCoCAqIHB1bmNoIGxhcmdlc3QgZXh0ZW50IGJlZm9yZSBsb29rdXAsIGluIGNh
c2UgaXQncyBhbHJlYWR5Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBiZWVuIHNocnVu
ayBmcm9tIGV4dGVudCB0cmVlCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPj4+Pj4+
PiAtwqDCoMKgwqDCoMKgwqAgX19kcm9wX2xhcmdlc3RfZXh0ZW50KGV0LCBmb2ZzLCBsZW4pOwo+
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBfX3B1bmNoX2xhcmdlc3RfZXh0ZW50KGV0LCBmb2ZzLCBs
ZW4pOwo+Pj4+Pj4+IMKgwqDCoMKgwqAgfQo+Pj4+Pj4+IMKgwqDCoMKgwqAgaWYgKGV0LT5sYXJn
ZXN0LmxlbiAhPSAwICYmCj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+Pj4gTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKPj4+Pj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cj4+Pj4+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCj4+Pj4+Cj4+Pj4KPj4+Pgo+Pj4+Cj4+Pj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+PiBMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdAo+Pj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+
Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo+Pj4KPj4KPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+IAoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
