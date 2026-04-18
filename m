Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NFY9H3ix42kQKAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 18 Apr 2026 18:29:44 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA1842199B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 18 Apr 2026 18:29:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1bhlM0cXXrjej6BtUoxNkqQWYpW0Esu3SIz6s7Wmx4=; b=HtgsFH1/5Cr4hrccfZKBtiejTS
	PE/v+AGqmhDFOmugPxRHKJdc2oiCXc7O045hY54ARY8JKJZAqh/ugqqUSC+LTh6lkkamTJIP3Y/i5
	pEmwyvyBeGFpOEfcyrArzCRoa2ydTclrz0KPMxVqdaes+0UHHNYZc9Zq84n8XVE8uXBU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wE8Xr-00045z-VO;
	Sat, 18 Apr 2026 16:29:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1wE8Xo-00045q-2M
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 18 Apr 2026 16:29:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bdqGqqCAJmHGQGzW7BeEzNGVDwr4jPvwzn2JaQaVIrU=; b=Wgw6no5Moevd7OXWljEUbYNW6A
 W/ruY3HROGsdJw8m1XCL2tDfrRQ147hQGf1vhNNKYxUwB488K/XZBHTgnOOcrGpn2QIDckPPRR7mR
 uy6b9mGu+Zc6Pt9vAxpkxYYK1OWqx10a1rAnbwZNYhzBnMGpJO0QmHoBMCLAzL6XLWdw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bdqGqqCAJmHGQGzW7BeEzNGVDwr4jPvwzn2JaQaVIrU=; b=TrVNzHeEUWeL4z+O4RR8yAjgU8
 F9zOndAoMFuFdDjpUPDdXTMERoHkN0hTW7lX+YhGyDksidugl2YM7vP/Gy0B3RZ9aOFERRjiiL1Ng
 rwpCoDj3AdOVUoCpoBwPqwZ1mJNWxP6M/FUwphtit7Dz2ap7FQU/rdy6MZNBlQuh9Ufk=;
Received: from smtp153-170.sina.com.cn ([61.135.153.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wE8Xm-0001Ep-Sh for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 18 Apr 2026 16:29:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1776529759; bh=bdqGqqCAJmHGQGzW7BeEzNGVDwr4jPvwzn2JaQaVIrU=;
 h=Message-ID:Date:Subject:From;
 b=Fr6m+irdJ0cZVMgnrZSpJR5DSeSAQh3Bo3Jx52KEu9+zpiH/ijSdVte4TVmZk73XE
 dM+RPoc10SHgKSEqnDuuZ6L5d2TPQfvZH2T1GpqMgl4rIh8HkXnpVjxSxNe7niY2ig
 A3RPkXsmx7m9OBQAgr/MX5KkIqz980+GP4g6BL0Y=
X-SMAIL-HELO: [192.168.1.3]
Received: from unknown (HELO [192.168.1.3])([120.245.114.208])
 by sina.com (10.54.253.34) with ESMTP
 id 69E3B14D000068E6; Sat, 19 Apr 2026 00:29:03 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 9903586292086
X-SMAIL-UIID: 44A2D17AEB8B4A1F93CDAA811B1527DD-20260419-002903-1
Message-ID: <a643b967-cb05-4de5-96f2-f1b783c9758d@sina.com>
Date: Sun, 19 Apr 2026 00:29:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Yongpeng Yang <monty_pavel@sina.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260403144015.221811-3-monty_pavel@sina.com>
 <f997ceb6-85d1-4872-be06-2a50469b3b18@kernel.org>
 <5c222edf-6888-4007-9240-9e7988b2dc71@sina.com>
 <ac9d0f35-52dc-4371-a692-39c1d4ae5555@kernel.org>
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <ac9d0f35-52dc-4371-a692-39c1d4ae5555@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/18/26 8:51 AM, Chao Yu via Linux-f2fs-devel wrote: >
 On 4/17/26 21:26, Yongpeng Yang wrote: >> >> On 4/17/26 17:00, Chao Yu via
 Linux-f2fs-devel wrote: >>> On 4/3/26 22:40, Yongpeng Yang wrote: [...] 
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
 [monty_pavel(at)sina.com]
X-Headers-End: 1wE8Xm-0001Ep-Sh
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix node_cnt race between extent node
 destroy and writeback
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.91 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,sina.com];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[sina.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_MIXED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sina.com:mid]
X-Rspamd-Queue-Id: 9AA1842199B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ck9uIDQvMTgvMjYgODo1MSBBTSwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToK
PiBPbiA0LzE3LzI2IDIxOjI2LCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pgo+PiBPbiA0LzE3LzI2
IDE3OjAwLCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+Pj4gT24gNC8zLzI2
IDIyOjQwLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4+IEZyb206IFlvbmdwZW5nIFlhbmcgPHlh
bmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pj4+Cj4+Pj4gZjJmc19kZXN0cm95X2V4dGVudF9ub2Rl
KCkgZG9lcyBub3Qgc2V0IEZJX05PX0VYVEVOVCBiZWZvcmUgY2xlYXJpbmcKPj4+PiBleHRlbnQg
bm9kZXMuIFdoZW4gY2FsbGVkIGZyb20gZjJmc19kcm9wX2lub2RlKCkgd2l0aCBJX1NZTkMgc2V0
LAo+Pj4+IGNvbmN1cnJlbnQga3dvcmtlciB3cml0ZWJhY2sgY2FuIGluc2VydCBuZXcgZXh0ZW50
IG5vZGVzIGludG8gdGhlIHNhbWUKPj4+PiBleHRlbnQgdHJlZSwgcmFjaW5nIHdpdGggdGhlIGRl
c3Ryb3kgYW5kIHRyaWdnZXJpbmcgZjJmc19idWdfb24oKSBpbgo+Pj4+IF9fZGVzdHJveV9leHRl
bnRfbm9kZSgpLiBUaGUgc2NlbmFyaW8gaXMgYXMgZm9sbG93czoKPj4+Pgo+Pj4+IGRyb3AgaW5v
ZGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
d3JpdGViYWNrCj4+Pj4gwqDCoCAtIGlwdXQKPj4+PiDCoMKgwqAgLSBmMmZzX2Ryb3BfaW5vZGXC
oCAvLyBJX1NZTkMgc2V0Cj4+Pj4gwqDCoMKgwqAgLSBmMmZzX2Rlc3Ryb3lfZXh0ZW50X25vZGUK
Pj4+PiDCoMKgwqDCoMKgIC0gX19kZXN0cm95X2V4dGVudF9ub2RlCj4+Pj4gwqDCoMKgwqDCoMKg
IC0gd2hpbGUgKG5vZGVfY250KSB7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHdyaXRlX2xvY2so
JmV0LT5sb2NrKQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBfX2ZyZWVfZXh0ZW50X3RyZWUKPj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgd3JpdGVfdW5sb2NrKCZldC0+bG9jaykKPj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAtIF9fd3JpdGViYWNrX3NpbmdsZV9pbm9kZQo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLSBmMmZzX291dHBsYWNlX3dyaXRlX2RhdGEKPj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLSAKPj4+PiBmMmZzX3VwZGF0ZV9yZWFkX2V4dGVudF9jYWNo
ZQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gCj4+Pj4gX191cGRhdGVfZXh0
ZW50X3RyZWVfcmFuZ2UKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIEZJ
X05PX0VYVEVOVCBub3Qgc2V0LAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Ly8gaW5zZXJ0IG5ldyBleHRlbnQgbm9kZQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgfSAvLyBub2Rl
X2NudCA9PSAwLCBleGl0IHdoaWxlCj4+Pj4gwqDCoMKgwqDCoMKgIC0gZjJmc19idWdfb24obm9k
ZV9jbnQpwqAgLy8gbm9kZV9jbnQgPiAwCj4+Pj4KPj4+PiBBZGRpdGlvbmFsbHksIF9fdXBkYXRl
X2V4dGVudF90cmVlX3JhbmdlKCkgb25seSBjaGVja3MgRklfTk9fRVhURU5UIGZvcgo+Pj4+IEVY
X1JFQUQgdHlwZSwgbGVhdmluZyBFWF9CTE9DS19BR0UgdXBkYXRlcyBjb21wbGV0ZWx5IHVucHJv
dGVjdGVkLgo+Pj4+Cj4+Pj4gVGhpcyBwYXRjaCBzZXQgRklfTk9fRVhURU5UIHVuZGVyIGV0LT5s
b2NrIGluIF9fZGVzdHJveV9leHRlbnRfbm9kZSgpLAo+Pj4+IGNvbnNpc3RlbnQgd2l0aCBvdGhl
ciBjYWxsZXJzIChfX3VwZGF0ZV9leHRlbnRfdHJlZV9yYW5nZSBhbmQKPj4+PiBfX2Ryb3BfZXh0
ZW50X3RyZWUpIGFuZCBjaGVjayBGSV9OT19FWFRFTlQgZm9yIGJvdGggRVhfUkVBRCBhbmQKPj4+
PiBFWF9CTE9DS19BR0UgdHJlZS4KPj4+Cj4+PiBJIHN1ZmZlcmVkIGJlbG93IHRlc3QgZmFpbHVy
ZSwgdGhlbiBJIGJpc2VjdCB0byB0aGlzIGNoYW5nZS4KPj4+Cj4+PiDCoMKgwqDCoCBnZW5lcmlj
LzQ3NcKgIDg0cyAuLi4gW2ZhaWxlZCwgZXhpdCBzdGF0dXMgMV0tIG91dHB1dCBtaXNtYXRjaCAK
Pj4+IChzZWUgLwo+Pj4gc2hhcmUvZ2l0L2ZzdGVzdHMvcmVzdWx0cy8vZ2VuZXJpYy80NzUub3V0
LmJhZCkKPj4+IMKgwqDCoMKgIC0tLSB0ZXN0cy9nZW5lcmljLzQ3NS5vdXTCoMKgIDIwMjUtMDEt
MTIgMjE6NTc6NDAuMjc5NDQwNjY0ICswODAwCj4+PiDCoMKgwqDCoCArKysgL3NoYXJlL2dpdC9m
c3Rlc3RzL3Jlc3VsdHMvL2dlbmVyaWMvNDc1Lm91dC5iYWQgMjAyNi0wNC0xNwo+Pj4gMTI6MDg6
MjguMDAwMDAwMDAwICswODAwCj4+PiDCoMKgwqDCoCBAQCAtMSwyICsxLDYgQEAKPj4+IMKgwqDC
oMKgwqAgUUEgb3V0cHV0IGNyZWF0ZWQgYnkgNDc1Cj4+PiDCoMKgwqDCoMKgIFNpbGVuY2UgaXMg
Z29sZGVuLgo+Pj4gwqDCoMKgwqAgK21vdW50OiAvbW50L3NjcmF0Y2hfZjJmczogbW91bnQgc3lz
dGVtIGNhbGwgZmFpbGVkOiBTdHJ1Y3R1cmUgCj4+PiBuZWVkcwo+Pj4gY2xlYW5pbmcuCj4+PiDC
oMKgwqDCoCArwqDCoMKgwqDCoMKgIGRtZXNnKDEpIG1heSBoYXZlIG1vcmUgaW5mb3JtYXRpb24g
YWZ0ZXIgZmFpbGVkIG1vdW50IAo+Pj4gc3lzdGVtCj4+PiBjYWxsLgo+Pj4gwqDCoMKgwqAgK21v
dW50IGZhaWxlZAo+Pj4gwqDCoMKgwqAgKyhzZWUgL3NoYXJlL2dpdC9mc3Rlc3RzL3Jlc3VsdHMv
L2dlbmVyaWMvNDc1LmZ1bGwgZm9yIGRldGFpbHMpCj4+PiDCoMKgwqDCoCAuLi4KPj4+IMKgwqDC
oMKgIChSdW4gJ2RpZmYgLXUgL3NoYXJlL2dpdC9mc3Rlc3RzL3Rlc3RzL2dlbmVyaWMvNDc1Lm91
dCAvc2hhcmUvZ2l0Lwo+Pj4gZnN0ZXN0cy9yZXN1bHRzLy9nZW5lcmljLzQ3NS5vdXQuYmFkJ8Kg
IHRvIHNlZSB0aGUgZW50aXJlIGRpZmYpCj4+Pgo+Pj4KPj4+IMKgwqDCoMKgIGdlbmVyaWMvMzg4
wqAgNzNzIC4uLiBbZmFpbGVkLCBleGl0IHN0YXR1cyAxXS0gb3V0cHV0IG1pc21hdGNoIAo+Pj4g
KHNlZSAvCj4+PiBzaGFyZS9naXQvZnN0ZXN0cy9yZXN1bHRzLy9nZW5lcmljLzM4OC5vdXQuYmFk
KQo+Pj4gwqDCoMKgwqAgLS0tIHRlc3RzL2dlbmVyaWMvMzg4Lm91dMKgwqAgMjAyNS0wMS0xMiAy
MTo1Nzo0MC4yNzU0NDA2MDIgKzA4MDAKPj4+IMKgwqDCoMKgICsrKyAvc2hhcmUvZ2l0L2ZzdGVz
dHMvcmVzdWx0cy8vZ2VuZXJpYy8zODgub3V0LmJhZCAyMDI2LTA0LTE3Cj4+PiAxMTo1ODowNS4w
MDAwMDAwMDAgKzA4MDAKPj4+IMKgwqDCoMKgIEBAIC0xLDIgKzEsNiBAQAo+Pj4gwqDCoMKgwqDC
oCBRQSBvdXRwdXQgY3JlYXRlZCBieSAzODgKPj4+IMKgwqDCoMKgwqAgU2lsZW5jZSBpcyBnb2xk
ZW4uCj4+PiDCoMKgwqDCoCArbW91bnQ6IC9tbnQvc2NyYXRjaF9mMmZzOiBtb3VudCBzeXN0ZW0g
Y2FsbCBmYWlsZWQ6IFN0cnVjdHVyZSAKPj4+IG5lZWRzCj4+PiBjbGVhbmluZy4KPj4+IMKgwqDC
oMKgICvCoMKgwqDCoMKgwqAgZG1lc2coMSkgbWF5IGhhdmUgbW9yZSBpbmZvcm1hdGlvbiBhZnRl
ciBmYWlsZWQgbW91bnQgCj4+PiBzeXN0ZW0KPj4+IGNhbGwuCj4+PiDCoMKgwqDCoCArY3ljbGUg
bW91bnQgZmFpbGVkCj4+PiDCoMKgwqDCoCArKHNlZSAvc2hhcmUvZ2l0L2ZzdGVzdHMvcmVzdWx0
cy8vZ2VuZXJpYy8zODguZnVsbCBmb3IgZGV0YWlscykKPj4+IMKgwqDCoMKgIC4uLgo+Pj4gwqDC
oMKgwqAgKFJ1biAnZGlmZiAtdSAvc2hhcmUvZ2l0L2ZzdGVzdHMvdGVzdHMvZ2VuZXJpYy8zODgu
b3V0IC9zaGFyZS9naXQvCj4+PiBmc3Rlc3RzL3Jlc3VsdHMvL2dlbmVyaWMvMzg4Lm91dC5iYWQn
wqAgdG8gc2VlIHRoZSBlbnRpcmUgZGlmZikKPj4+Cj4+Pgo+Pj4gwqDCoMKgwqAgRjJGUy1mcyAo
ZG0tMCk6IHNhbml0eV9jaGVja19leHRlbnRfY2FjaGU6IGlub2RlIChpbm89MTc2MSkgZXh0ZW50
Cj4+PiBpbmZvIFsyMjAwNTcsIDU3LCA2XSBpcyBpbmNvcnJlY3QsIHJ1biBmc2NrIHRvIGZpeAo+
Pj4KPj4+IEkgc3VzcGVjdCB3ZSBtYXkgbWlzcyBhbnkgZXh0ZW50IHVwZGF0ZXMgYWZ0ZXIgd2Ug
c2V0IEZJX05PX0VYVEVOVCBpbgo+Pj4gX19kZXN0cm95X2V4dGVudF9ub2RlKCksIHJlc3VsdCBp
biBmYWlsaW5nIGluIAo+Pj4gc2FuaXR5X2NoZWNrX2V4dGVudF9jYWNoZSgpLgo+Pj4KPj4+IENh
biB3ZSBqdXN0IHJlbG9jYXRlIGYyZnNfYnVnX29uKG5vZGVfY250KSByYXRoZXIgdGhhbiBjb21w
bGljYXRlZCAKPj4+IGNoYW5nZT8KPj4+IFRob3VnaHRzPwo+Pgo+PiBPaCwgSSBvdmVybG9va2Vk
IGxhcmdlc3QgZXh0ZW50LiBIb3cgYWJvdXQgcmVsb2NhdGUKPj4gZjJmc19idWdfb24obm9kZV9j
bnQpIHRvIF9fZGVzdHJveV9leHRlbnRfdHJlZT8KPj4KPj4gc3RhdGljIHZvaWQgX19kZXN0cm95
X2V4dGVudF90cmVlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGVudW0gZXh0ZW50X3R5cGUKPj4gdHlw
ZSkKPj4KPj4gwqDCoMKgwqDCoMKgwqDCoCAvKiBmcmVlIGFsbCBleHRlbnQgaW5mbyBiZWxvbmcg
dG8gdGhpcyBleHRlbnQgdHJlZSAqLwo+PiDCoMKgwqDCoMKgwqDCoMKgIG5vZGVfY250ID0gX19k
ZXN0cm95X2V4dGVudF9ub2RlKGlub2RlLCB0eXBlKTsKPj4gK8KgwqDCoMKgwqDCoCBmMmZzX2J1
Z19vbihzYmksIGF0b21pY19yZWFkKCZldC0+bm9kZV9jbnQpKTsKPiAKPiAgwqDCoMKgwqAvKiBm
cmVlIGFsbCBleHRlbnQgaW5mbyBiZWxvbmcgdG8gdGhpcyBleHRlbnQgdHJlZSAqLwo+ICDCoMKg
wqDCoG5vZGVfY250ID0gX19kZXN0cm95X2V4dGVudF9ub2RlKGlub2RlLCB0eXBlKTsKPiAKPiAg
wqDCoMKgwqAvKiBkZWxldGUgZXh0ZW50IHRyZWUgZW50cnkgaW4gcmFkaXggdHJlZSAqLwo+ICDC
oMKgwqDCoG11dGV4X2xvY2soJmV0aS0+ZXh0ZW50X3RyZWVfbG9jayk7Cj4gIMKgwqDCoMKgZjJm
c19idWdfb24oc2JpLCBhdG9taWNfcmVhZCgmZXQtPm5vZGVfY250KSk7wqAgPC0tLQo+IAo+IE9o
LCBpdCBoYXMgYWxyZWFkeSBjaGVja2VkIG5vZGVfY250LCBzbywgbWF5YmUgd2UgY2FuIGp1c3Qg
cmVtb3ZlIHRoZSAKPiBjaGVjayBpbgo+IF9fZGVzdHJveV9leHRlbnRfbm9kZSgpPwoKWWVzLiBC
VFcsIGlzIGl0IGNvcnJlY3QgdG8gcmVtb3ZlIHRoZSBjYWxsIHRvIGYyZnNfZGVzdHJveV9leHRl
bnRfbm9kZSgpCmluIGYyZnNfZHJvcF9pbm9kZSgpPyBJdCBzZWVtcyB0aGlzIGNhbGwgaXMgdW5u
ZWNlc3NhcnksIHNpbmNlCmYyZnNfZXZpY3RfaW5vZGUoKSB3aWxsIGV2ZW50dWFsbHkgZGVsZXRl
IGFsbCBleHRlbnQgbm9kZXMgcHJvcGVybHkuCgpUaGFua3MKWW9uZ3BlbmcsCgo+IAo+IFRoYW5r
cywKPiAKPiAKPj4KPj4gVGhhbmtzCj4+IFlvbmdwZW5nLAo+Pgo+Pj4KPj4+IFRoYW5rcywKPj4+
Cj4+Pj4KPj4+PiBGaXhlczogM2ZjNWQ1YTE4MmY2ICgiZjJmczogZml4IHRvIHNocmluayByZWFk
IGV4dGVudCBub2RlIGluIGJhdGNoZXMiKQo+Pj4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3Jn
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5j
b20+Cj4+Pj4gLS0tCj4+Pj4gwqDCoCBmcy9mMmZzL2V4dGVudF9jYWNoZS5jIHwgMTcgKysrKysr
KysrKy0tLS0tLS0KPj4+PiDCoMKgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZXh0ZW50X2NhY2hl
LmMgYi9mcy9mMmZzL2V4dGVudF9jYWNoZS5jCj4+Pj4gaW5kZXggMGVkODRjYzA2NWE3Li44NzE2
OWZkMjlkODkgMTAwNjQ0Cj4+Pj4gLS0tIGEvZnMvZjJmcy9leHRlbnRfY2FjaGUuYwo+Pj4+ICsr
KyBiL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPj4+PiBAQCAtMTE5LDkgKzExOSwxMCBAQCBzdGF0
aWMgYm9vbCBfX21heV9leHRlbnRfdHJlZShzdHJ1Y3QgaW5vZGUKPj4+PiAqaW5vZGUsIGVudW0g
ZXh0ZW50X3R5cGUgdHlwZSkKPj4+PiDCoMKgwqDCoMKgwqAgaWYgKCFfX2luaXRfbWF5X2V4dGVu
dF90cmVlKGlub2RlLCB0eXBlKSkKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZmFs
c2U7Cj4+Pj4gwqDCoCArwqDCoMKgIGlmIChpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfTk9f
RVhURU5UKSkKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGZhbHNlOwo+Pj4+ICsKPj4+PiDC
oMKgwqDCoMKgwqAgaWYgKHR5cGUgPT0gRVhfUkVBRCkgewo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBp
ZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX05PX0VYVEVOVCkpCj4+Pj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIGZhbHNlOwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlm
IChpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfQ09NUFJFU1NFRF9GSUxFKSAmJgo+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICFmMmZzX3NiX2hhc19yZWFkb25s
eShGMkZTX0lfU0IoaW5vZGUpKSkKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiBmYWxzZTsKPj4+PiBAQCAtNjQ0LDYgKzY0NSw4IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQg
X19kZXN0cm95X2V4dGVudF9ub2RlKHN0cnVjdAo+Pj4+IGlub2RlICppbm9kZSwKPj4+PiDCoMKg
IMKgwqDCoMKgwqAgd2hpbGUgKGF0b21pY19yZWFkKCZldC0+bm9kZV9jbnQpKSB7Cj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqAgd3JpdGVfbG9jaygmZXQtPmxvY2spOwo+Pj4+ICvCoMKgwqDCoMKg
wqDCoCBpZiAoIWlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9OT19FWFRFTlQpKQo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9OT19FWFRFTlQp
Owo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5vZGVfY250ICs9IF9fZnJlZV9leHRlbnRfdHJl
ZShzYmksIGV0LCBucl9zaHJpbmspOwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdyaXRlX3Vu
bG9jaygmZXQtPmxvY2spOwo+Pj4+IMKgwqDCoMKgwqDCoCB9Cj4+Pj4gQEAgLTY4OCwxMiArNjkx
LDEyIEBAIHN0YXRpYyB2b2lkIF9fdXBkYXRlX2V4dGVudF90cmVlX3JhbmdlKHN0cnVjdAo+Pj4+
IGlub2RlICppbm9kZSwKPj4+PiDCoMKgIMKgwqDCoMKgwqAgd3JpdGVfbG9jaygmZXQtPmxvY2sp
Owo+Pj4+IMKgwqAgLcKgwqDCoCBpZiAodHlwZSA9PSBFWF9SRUFEKSB7Cj4+Pj4gLcKgwqDCoMKg
wqDCoMKgIGlmIChpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfTk9fRVhURU5UKSkgewo+Pj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdyaXRlX3VubG9jaygmZXQtPmxvY2spOwo+Pj4+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4+PiAtwqDCoMKgwqDCoMKgwqAgfQo+Pj4+
ICvCoMKgwqAgaWYgKGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9OT19FWFRFTlQpKSB7Cj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIHdyaXRlX3VubG9jaygmZXQtPmxvY2spOwo+Pj4+ICvCoMKgwqDC
oMKgwqDCoCByZXR1cm47Cj4+Pj4gK8KgwqDCoCB9Cj4+Pj4gwqDCoCArwqDCoMKgIGlmICh0eXBl
ID09IEVYX1JFQUQpIHsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcmV2ID0gZXQtPmxhcmdl
c3Q7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVpLmxlbiA9IDA7Cj4+Pgo+Pj4KPj4+Cj4+
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4gTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cj4+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCj4+Cj4gCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
