Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGVRKJW3tmn6GAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 Mar 2026 14:43:49 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F8B290C74
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 Mar 2026 14:43:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hfqyWA/7dSzgXu6Co4qtOUy7UHbaApE49L3rYYwBr0=; b=fckBalivcVw2dbfysOMcZdpmP9
	EphM1Sywp5bBEhF6nvk/FpvkQGFvVXNRMNSyQ/Vy28BhOMzBAOVYgrEqBHpPRbVyDgJqYy2y0FK5W
	252X5iGpD3qUy6c1OqSqccDcW4/d+eHog6IeWNt/MiqUFdDXibmvJWz/AOKoWQDlhblo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w1lkf-0003d7-M2;
	Sun, 15 Mar 2026 13:43:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1w1lkb-0003cd-Go
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 15 Mar 2026 13:43:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WiqQHtTetqwGh00StjP4lAmsB9Rd7umgKfwXSjzo3+Q=; b=Y45vTkxpIitQtgjAARX1fwVGwr
 h5DIOcPPQMstDMSGEbVl/wlcTcSsUzA56yZvKx4VMury7GIjwEEAJDgT05HQS4PxeCU/+1MJXX3+f
 iIcU+AAVu+HrSyzuwP3gh3xYo01fI02quTUMohSOy4tPSJG8AI2qiTNAPLrAF7znm+mI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WiqQHtTetqwGh00StjP4lAmsB9Rd7umgKfwXSjzo3+Q=; b=Qw3+0vUurDnZmEVg0qRQGCy8y7
 NMKZGcS70cMqZN7W3dl337yOAAQsCkBmjVlBxrues9oSejj7lZamdpAdycJ6/YPLyZf32/sw77+TA
 sWx5m+WobyyXxVrc/tagStOU3lcNgIex0e8AAuULsYtziCFETFrwQqJXUfia0hDwKz2c=;
Received: from mail3-163.sinamail.sina.com.cn ([202.108.3.163])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w1lkb-0005CL-1E for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 15 Mar 2026 13:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1773582205; bh=WiqQHtTetqwGh00StjP4lAmsB9Rd7umgKfwXSjzo3+Q=;
 h=Message-ID:Date:Subject:From;
 b=dYNQ4eA7zqSH/mbizBQe0HRSvB3jACD6aM52cEDxywQDv58+7OC2L8HzcZVl//PNf
 sKMveC+EHqRrSeaXRdlKOFsL/glb+2iHMed3lOQl1/KMKMM6KNCf4xopsqlSoHrt90
 lh7xx9qGc6ax0uHI8xejRxtXlaa2IHJ2HkUJ4D4k=
X-SMAIL-HELO: [192.168.1.3]
Received: from unknown (HELO [192.168.1.3])([120.245.114.55])
 by sina.com (10.54.253.34) with ESMTP
 id 69B6B76F0000751F; Sun, 15 Mar 2026 21:43:15 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 5090266291790
X-SMAIL-UIID: 7D95C51E25B2416B94DD2E84DB7A198B-20260315-214315-1
Message-ID: <f80a6ae1-9b93-4eab-b7a0-142fc82d3163@sina.com>
Date: Sun, 15 Mar 2026 21:43:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Chao Yu <chao@kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260308144013.2340225-3-monty_pavel@sina.com>
 <889e7f95-09b8-47f9-af05-48b7ccc05386@sina.com>
 <f7ad8b72-d12f-4b0a-9c6c-9d28b14b04c7@kernel.org>
 <5826fc47-be75-419c-8eab-c5014ec02c56@sina.com>
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <5826fc47-be75-419c-8eab-c5014ec02c56@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/15/2026 8:08 PM, Yongpeng Yang wrote: > > On 3/14/2026
 9:17 AM, Chao Yu via Linux-f2fs-devel wrote: >> On 2026/3/13 19:19, Yongpeng
 Yang wrote: >>> On 3/8/26 22:40, Yongpeng Yang wrote: >>>> Fro [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1w1lkb-0005CL-1E
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix inline data not being written
 to disk in writeback path
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
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
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
	RCPT_COUNT_FIVE(0.00)[5];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 10F8B290C74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ck9uIDMvMTUvMjAyNiA4OjA4IFBNLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+IAo+IE9uIDMvMTQv
MjAyNiA5OjE3IEFNLCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+PiBPbiAy
MDI2LzMvMTMgMTk6MTksIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+PiBPbiAzLzgvMjYgMjI6NDAs
IFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+Pj4gRnJvbTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdw
ZW5nQHhpYW9taS5jb20+Cj4+Pj4KPj4+PiBXaGVuIGYyZnNfZmllbWFwKCkgaXMgY2FsbGVkIHdp
dGggYGZpbGVpbmZvLT5maV9mbGFnc2AgY29udGFpbmluZyB0aGUKPj4+PiBGSUVNQVBfRkxBR19T
WU5DIGZsYWcsIGl0IGF0dGVtcHRzIHRvIHdyaXRlIGRhdGEgdG8gZGlzayBiZWZvcmUKPj4+PiBy
ZXRyaWV2aW5nIGZpbGUgbWFwcGluZ3MgdmlhIGZpbGVtYXBfd3JpdGVfYW5kX3dhaXQoKS4gSG93
ZXZlciwgCj4+Pj4gdGhlcmUgaXMKPj4+PiBhbiBpc3N1ZSB3aGVyZSB0aGUgZmlsZSBkb2VzIG5v
dCBnZXQgbWFwcGVkIGFzIGV4cGVjdGVkLiBUaGUgZm9sbG93aW5nCj4+Pj4gc2NlbmFyaW8gY2Fu
IG9jY3VyOgo+Pj4+Cj4+Pj4gcm9vdEB2bTovbW50L2YyZnMjIGRkIGlmPS9kZXYvemVybyBvZj1k
YXRhLjNrIGJzPTNrIGNvdW50PTEKPj4+PiByb290QHZtOi9tbnQvZjJmcyMgeGZzX2lvIGRhdGEu
M2sgLWMgImZpZW1hcCAtdiAwIDQwOTYiCj4+Pj4gZGF0YS4zazoKPj4+PiDCoCBFWFQ6IEZJTEUt
T0ZGU0VUwqDCoMKgwqDCoCBCTE9DSy1SQU5HRcKgwqDCoMKgwqAgVE9UQUwgRkxBR1MKPj4+PiDC
oMKgwqAgMDogWzAuLjVdOsKgwqDCoMKgwqDCoMKgwqDCoCAwLi41wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgNiAweDMwNwo+Pj4+Cj4+Pj4gVGhlIHJvb3QgY2F1c2Ugb2YgdGhpcyBp
c3N1ZSBpcyB0aGF0IGYyZnNfd3JpdGVfc2luZ2xlX2RhdGFfcGFnZSgpIG9ubHkKPj4+PiBjYWxs
cyBmMmZzX3dyaXRlX2lubGluZV9kYXRhKCkgdG8gY29weSBkYXRhIGZyb20gdGhlIGRhdGEgZm9s
aW8gdG8gdGhlCj4+Pj4gaW5vZGUgZm9saW8sIGFuZCBpdCBjbGVhcnMgdGhlIGRpcnR5IGZsYWcg
b24gdGhlIGRhdGEgZm9saW8uIAo+Pj4+IEhvd2V2ZXIsIGl0Cj4+Pj4gZG9lcyBub3QgbWFyayB0
aGUgZGF0YSBmb2xpbyBhcyB3cml0ZWJhY2suIFdoZW4KPj4+PiBfX2ZpbGVtYXBfZmRhdGF3YWl0
X3JhbmdlKCkgY2hlY2tzIGZvciBmb2xpb3Mgd2l0aCB0aGUgd3JpdGViYWNrIGZsYWcsCj4+Pj4g
aXQgcmV0dXJucyBlYXJseSwgY2F1c2luZyBmMmZzX2ZpZW1hcCgpIHRvIHJlcG9ydCB0aGF0IHRo
ZSBmaWxlIGhhcyBubwo+Pj4+IG1hcHBpbmcuCj4+Pj4KPj4+PiBUbyBmaXggdGhpcyBpc3N1ZSwg
dGhlIHNvbHV0aW9uIGlzIHRvIGNhbGwgZjJmc19zeW5jX25vZGVfcGFnZXMoKSBpbgo+Pj4+IGYy
ZnNfaW5saW5lX2RhdGFfZmllbWFwKCkgd2hlbiBnZXR0aW5nIGZpZW1hcCB3aXRoIEZJRU1BUF9G
TEFHX1NZTkMKPj4+PiBmbGFncy4gVGhpcyBwYXRjaCBlbnN1cmVzIHRoYXQgdGhlIGlub2RlIGZv
bGlvIGlzIHdyaXR0ZW4gYmFjayBhbmQgdGhlCj4+Pj4gd3JpdGViYWNrIHByb2Nlc3MgY29tcGxl
dGVzIGJlZm9yZSBwcm9jZWVkaW5nLgo+Pj4+Cj4+Pj4gRml4ZXM6IDlmZmUwZmI1ZjNiYiAoImYy
ZnM6IGhhbmRsZSBpbmxpbmUgZGF0YSBvcGVyYXRpb25zIikKPj4+PiBTaWduZWQtb2ZmLWJ5OiBZ
b25ncGVuZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4+PiAtLS0KPj4+PiAtIENh
bGwgZjJmc19zeW5jX25vZGVfcGFnZXMoKSBpbiBnZXR0aW5nIGZpZW1hcCBwYXRoIHJhdGhlciB0
aGFuCj4+Pj4gd3JpdGViYWNrIHBhdGguCj4+Pj4gLS0tCj4+Pj4gwqAgZnMvZjJmcy9jaGVja3Bv
aW50LmMgfMKgIDEgKwo+Pj4+IMKgIGZzL2YyZnMvaW5saW5lLmPCoMKgwqDCoCB8IDI1ICsrKysr
KysrKysrKysrKysrKysrKysrKysKPj4+PiDCoCBmcy9mMmZzL25vZGUuY8KgwqDCoMKgwqDCoCB8
IDIxICsrKysrKysrKysrKysrKystLS0tLQo+Pj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgNDIgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZz
L2NoZWNrcG9pbnQuYyBiL2ZzL2YyZnMvY2hlY2twb2ludC5jCj4+Pj4gaW5kZXggNmRkMzliN2Rl
MTFhLi5jODUyNzY5MzFjNDUgMTAwNjQ0Cj4+Pj4gLS0tIGEvZnMvZjJmcy9jaGVja3BvaW50LmMK
Pj4+PiArKysgYi9mcy9mMmZzL2NoZWNrcG9pbnQuYwo+Pj4+IEBAIC0xNDE2LDYgKzE0MTYsNyBA
QCBzdGF0aWMgaW50IGJsb2NrX29wZXJhdGlvbnMoc3RydWN0IAo+Pj4+IGYyZnNfc2JfaW5mbyAq
c2JpKQo+Pj4+IMKgwqDCoMKgwqAgc3RydWN0IHdyaXRlYmFja19jb250cm9sIHdiYyA9IHsKPj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgLnN5bmNfbW9kZSA9IFdCX1NZTkNfQUxMLAo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCAubnJfdG9fd3JpdGUgPSBMT05HX01BWCwKPj4+PiArwqDCoMKgwqDCoMKg
wqAgLnJhbmdlX2N5Y2xpYyA9IDEsCj4+Pj4gwqDCoMKgwqDCoCB9Owo+Pj4+IMKgwqDCoMKgwqAg
aW50IGVyciA9IDAsIGNudCA9IDA7Cj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvaW5saW5lLmMg
Yi9mcy9mMmZzL2lubGluZS5jCj4+Pj4gaW5kZXggODZkMmFiYmI0MGZmLi5hYjFlMTBiMGY2YTYg
MTAwNjQ0Cj4+Pj4gLS0tIGEvZnMvZjJmcy9pbmxpbmUuYwo+Pj4+ICsrKyBiL2ZzL2YyZnMvaW5s
aW5lLmMKPj4+PiBAQCAtOSw2ICs5LDcgQEAKPj4+PiDCoCAjaW5jbHVkZSA8bGludXgvZnMuaD4K
Pj4+PiDCoCAjaW5jbHVkZSA8bGludXgvZjJmc19mcy5oPgo+Pj4+IMKgICNpbmNsdWRlIDxsaW51
eC9maWVtYXAuaD4KPj4+PiArI2luY2x1ZGUgPGxpbnV4L3dyaXRlYmFjay5oPgo+Pj4+IMKgICNp
bmNsdWRlICJmMmZzLmgiCj4+Pj4gwqAgI2luY2x1ZGUgIm5vZGUuaCIKPj4+PiBAQCAtODE0LDYg
KzgxNSwzMCBAQCBpbnQgZjJmc19pbmxpbmVfZGF0YV9maWVtYXAoc3RydWN0IGlub2RlICppbm9k
ZSwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7Cj4+Pj4gwqDCoMKgwqDCoCB9Cj4+
Pj4gK8KgwqDCoCBpZiAoZmllaW5mby0+ZmlfZmxhZ3MgJiBGSUVNQVBfRkxBR19TWU5DKSB7Cj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCB3cml0ZWJhY2tfY29udHJvbCBpd2JjID0gewo+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5zeW5jX21vZGUgPSBXQl9TWU5DX0FMTCwKPj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucmFuZ2Vfc3RhcnQgPSBpbm9kZS0+aV9pbm8gPDwgUEFH
RV9TSElGVCwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucmFuZ2VfZW5kID0gaW5vZGUt
PmlfaW5vIDw8IFBBR0VfU0hJRlQsCj4+Cj4+IMKgwqDCoMKgwqDCoMKgwqAgLnJhbmdlX3N0YXJ0
ID0gKGxvZmZfdClpbm9kZS0+aV9pbm8gPDwgUEFHRV9TSElGVCwKPj4gwqDCoMKgwqDCoMKgwqDC
oCAucmFuZ2VfZW5kID0gKGxvZmZfdClpbm9kZS0+aV9pbm8gPDwgUEFHRV9TSElGVCwKPj4KPj4g
VG8gYXZvaWQgb3ZlcmZsb3cgaW4gMzItYml0IGFyY2guCj4gCj4gT2gsIEkgb3Zlcmxvb2tlZCB0
aGlzLCBJJ2xsIGZpeCB0aGlzIGluIHYzIHBhdGNoLgo+IAo+Pgo+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC5ucl90b193cml0ZSA9IDEsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LnJhbmdlX2N5Y2xpYyA9IDAsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH07Cj4+Pj4gKwo+Pj4+ICty
ZXRyeToKPj4+PiArwqDCoMKgwqDCoMKgwqAgZjJmc19mb2xpb193YWl0X3dyaXRlYmFjayhpZm9s
aW8sIE5PREUsIHRydWUsIHRydWUpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoZm9saW9fdGVz
dF9kaXJ0eShpZm9saW8pKSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZjJmc19mb2xp
b19wdXQoaWZvbGlvLCB0cnVlKTsKPj4KPj4gT2gsIGl0IG5lZWRzIHRvIHVubG9jay9sb2NrIGlu
b2RlIGZvbGlvLCB3aHkgbm90IGNhbGxpbmcgCj4+IF9fd3JpdGVfbm9kZV9mb2xpbygpIGRpcmVj
dGx5Pwo+PiBtYXliZSBhIHdyYXBwZWQgZnVuY3Rpb24gZnJvbSBmMmZzX21vdmVfbm9kZV9mb2xp
bygpLgo+Pgo+IAo+IEluIHRoZSBmaWVtYXAgcGF0aCwgbm9kZSBmb2xpbyB3cml0ZXMgYWxzbyBy
ZXF1aXJlIGNsZWFyaW5nIHRoZSBmc3luYwo+IG1hcmsgYW5kIGRlbnRyeSBtYXJrLiBEaXJlY3Rs
eSBjYWxsaW5nIF9fd3JpdGVfbm9kZV9wYWdlKCkgYXBwZWFycwoKVGhlIG5vZGUgYmxvY2sgZ2Mg
cGF0aCBzdGlsbCBoYXMgaXNzdWVzIHdpdGggaW5jb3JyZWN0IGRlbnRyeSBtYXJrCmhhbmRsaW5n
LiBCb3RoIGZzeW5jIG1hcmtzIGFuZCBkZW50cnkgbWFya3MgbXVzdCBiZSBjbGVhcmVkIGR1cmlu
ZyBub2RlCmdjLCBvdGhlcndpc2UgJ2ZzY2suZjJmcyAtLWRyeS1ydW4nIHdpbGwgcmVwb3J0IGVy
cm9yLiBJJ2xsIGZpeCB0aGlzCnRvZ2V0aGVyIHdpdGggdGhlIGN1cnJlbnQgY2hhbmdlcy4KClRo
YW5rcwpZb25ncGVuZywKCgo+IHJlcGV0aXRpdmUgaGVyZSwgaGVuY2UgdXNpbmcgZjJmc19zeW5j
X25vZGVfcGFnZXMoKSBpbnN0ZWFkLCBzbyBkb2VzCj4gZjJmc19tb3ZlX25vZGVfZm9saW8oKS4g
SG93IGFib3V0IHdyYXBwaW5nIHRoZSBpbm9kZSBmb2xpbyB3cml0ZSBsb2dpYwo+IGluIGYyZnNf
d3JpdGVfc2luZ2xlX2lub2RlX2ZvbGlvKCk/Cj4gCj4gVGhhbmtzCj4gWW9uZ3BlbmcsCj4gCj4+
IFRoYW5rcywKPj4KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcnIgPSBmMmZzX3N5bmNf
bm9kZV9wYWdlcyhGMkZTX0lfU0IoaW5vZGUpLCAmaXdiYywgCj4+Pj4gdHJ1ZSwgRlNfTk9ERV9J
Tyk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFlcnIpIHsKPj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmb2xpbyA9IGYyZnNfZ2V0X2lub2RlX2ZvbGlvKEYy
RlNfSV9TQihpbm9kZSksIAo+Pj4+IGlub2RlLT5pX2lubyk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiAoSVNfRVJSKGlmb2xpbykpCj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBQVFJfRVJSKGlmb2xpbyk7Cj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHJldHJ5Owo+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIH0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZXJyOwo+
Pj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4gK8KgwqDCoCB9Cj4+Pj4gKwo+Pj4+IMKgwqDCoMKg
wqAgaWxlbiA9IG1pbl90KHNpemVfdCwgTUFYX0lOTElORV9EQVRBKGlub2RlKSwgaV9zaXplX3Jl
YWQoaW5vZGUpKTsKPj4+PiDCoMKgwqDCoMKgIGlmIChzdGFydCA+PSBpbGVuKQo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBnb3RvIG91dDsKPj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9ub2RlLmMg
Yi9mcy9mMmZzL25vZGUuYwo+Pj4+IGluZGV4IGJiZmE2NzdlZjQ2Zi4uMmZiZmVjYWYzZjdiIDEw
MDY0NAo+Pj4+IC0tLSBhL2ZzL2YyZnMvbm9kZS5jCj4+Pj4gKysrIGIvZnMvZjJmcy9ub2RlLmMK
Pj4+PiBAQCAtMjA4Myw3ICsyMDgzLDggQEAgaW50IGYyZnNfc3luY19ub2RlX3BhZ2VzKHN0cnVj
dCBmMmZzX3NiX2luZm8gCj4+Pj4gKnNiaSwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCB3cml0ZWJhY2tfY29udHJvbCAqd2JjLAo+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm9vbCBkb19iYWxhbmNlLCBlbnVtIGlvc3RhdF90eXBl
IGlvX3R5cGUpCj4+Pj4gwqAgewo+Pj4+IC3CoMKgwqAgcGdvZmZfdCBpbmRleDsKPj4+PiArwqDC
oMKgIHBnb2ZmX3QgaW5kZXgsIHdiY19pbmRleDsKPj4+PiArwqDCoMKgIHBnb2ZmX3QgZW5kLCB3
YmNfZW5kOwo+Pj4+IMKgwqDCoMKgwqAgc3RydWN0IGZvbGlvX2JhdGNoIGZiYXRjaDsKPj4+PiDC
oMKgwqDCoMKgIGludCBzdGVwID0gMDsKPj4+PiDCoMKgwqDCoMKgIGludCBud3JpdHRlbiA9IDA7
Cj4+Pj4gQEAgLTIwOTIsMTQgKzIwOTMsMjQgQEAgaW50IGYyZnNfc3luY19ub2RlX3BhZ2VzKHN0
cnVjdCBmMmZzX3NiX2luZm8gCj4+Pj4gKnNiaSwKPj4+PiDCoMKgwqDCoMKgIGZvbGlvX2JhdGNo
X2luaXQoJmZiYXRjaCk7Cj4+Pj4gK8KgwqDCoCB3YmNfaW5kZXggPSAwOwo+Pj4+ICvCoMKgwqAg
d2JjX2VuZCA9IExPTkdfTUFYOwo+Pj4+ICvCoMKgwqAgaWYgKCF3YmMtPnJhbmdlX2N5Y2xpYykg
ewo+Pj4+ICvCoMKgwqDCoMKgwqDCoCB3YmNfaW5kZXggPSB3YmMtPnJhbmdlX3N0YXJ0ID4+IFBB
R0VfU0hJRlQ7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHdiY19lbmQgPSB3YmMtPnJhbmdlX2VuZCA+
PiBQQUdFX1NISUZUOwo+Pj4+ICvCoMKgwqAgfQo+Pj4+IMKgIG5leHRfc3RlcDoKPj4+PiAtwqDC
oMKgIGluZGV4ID0gMDsKPj4+PiArwqDCoMKgIGluZGV4ID0gd2JjX2luZGV4Owo+Pj4+ICvCoMKg
wqAgZW5kID0gd2JjX2VuZDsKPj4+PiAtwqDCoMKgIHdoaWxlICghZG9uZSAmJiAobnJfZm9saW9z
ID0gCj4+Pj4gZmlsZW1hcF9nZXRfZm9saW9zX3RhZyhOT0RFX01BUFBJTkcoc2JpKSwKPj4+PiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZpbmRleCwgKHBnb2ZmX3QpLTEsIFBBR0VD
QUNIRV9UQUdfRElSVFksCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmZmJh
dGNoKSkpIHsKPj4+PiArwqDCoMKgIHdoaWxlICghZG9uZSAmJiAoaW5kZXggPD0gZW5kKSkgewo+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQgaTsKPj4+PiArwqDCoMKgwqDCoMKgwqAgbnJfZm9s
aW9zID0gZmlsZW1hcF9nZXRfZm9saW9zX3RhZyhOT0RFX01BUFBJTkcoc2JpKSwKPj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZpbmRleCwgZW5kLCBQQUdFQ0FDSEVfVEFHX0RJ
UlRZLAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmZiYXRjaCk7Cj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIGlmIChucl9mb2xpb3MgPT0gMCkKPj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBicmVhazsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IG5y
X2ZvbGlvczsgaSsrKSB7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGZv
bGlvICpmb2xpbyA9IGZiYXRjaC5mb2xpb3NbaV07Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgYm9vbCBzdWJtaXR0ZWQgPSBmYWxzZTsKPj4+Cj4+PiBwaW5nCj4+Pgo+Pj4gVGhhbmtz
Cj4+PiBZb25ncGVuZywKPj4KPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+IAo+IAo+IAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
