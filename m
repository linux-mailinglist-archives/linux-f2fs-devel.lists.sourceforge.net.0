Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMYkG22dqmnPUQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 06 Mar 2026 10:25:01 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F26FA21DDB6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 06 Mar 2026 10:24:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZgO/2QOhBwQae9y0SflCQsp4FCrn+/bUqkqog1+Hlk=; b=DOz5vmMy6sRsDM4GC9+yh+A5bT
	hhJ+SfxIH0uSEXgSR/RR+CGBUAouOo8Y2X4HQZNRK2/1/lqo1+y2TCGFb9RxbPZcd8+ZpLWOUvE6q
	2V/DcYddC6WX7a108bf4xjboFda6n7N0ElRt+RDntUGneeH9n9zJ7/MGnD6idWqZq2Ms=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vyRQV-0001hr-J6;
	Fri, 06 Mar 2026 09:24:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vyRQT-0001hj-Kw
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Mar 2026 09:24:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5K3LBNSBDauQuC9Wc58Z0kEUhSRvJefjOxAqQ1Wq4G8=; b=iCmjMN6+/WqBxpZXdDsmr5Wb1L
 9pM/oypKhUnHQ/dbr4/7HnWIsmInzVGyAvE9JQu2dbYf5OUf7QFkTnul454r4UxQPXjJ+r0apFRPL
 rIYiwh1vCwLfkboDXDSBS8TXAx4sJygewHV36D8u+XPaqVhrvf8HdAlZqg9V40Nrsb/0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5K3LBNSBDauQuC9Wc58Z0kEUhSRvJefjOxAqQ1Wq4G8=; b=XhVua6kKq48XF0AF+hXNvFLrnB
 EtsVxSwLACXK9RB3FDxFJxJNQdGs1I2xHMNKfo/PSFCnr/tRogGD5iYb1vjAQt/LoFp9YOIk3PsD4
 EH90XkSrOTivknbBm7vk30MpfiQgw+FgRE8dCm1C8uDv9Ek0xgxliH3qRw/oAV/l5MR8=;
Received: from mail115-80.sinamail.sina.com.cn ([218.30.115.80])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vyRQS-0004SW-Dh for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Mar 2026 09:24:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1772789092; bh=5K3LBNSBDauQuC9Wc58Z0kEUhSRvJefjOxAqQ1Wq4G8=;
 h=Message-ID:Date:Subject:From;
 b=t0q+yeAmxn236AAVMCp11uwWtl4mqN3gnbjtu2n2hcdEs15AZYsV95atC5+BylZQK
 GYNSY1ix2KaqPWmuo6p6RMlsv/8ViDgg5Va/wSwzXsVIE+bWdITdH8e0+AO4dJiMZN
 tCDpXILkph8vmjB9E1d2Mt04uNQ18sSqckRglbtw=
X-SMAIL-HELO: [10.220.28.86]
Received: from unknown (HELO [10.220.28.86])([1.202.162.55])
 by sina.com (10.185.250.23) with ESMTP
 id 69AA967600002738; Fri, 6 Mar 2026 16:55:20 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 6301668912951
X-SMAIL-UIID: 13EA606DF43E48C5BF234B9297B52594-20260306-165520-1
Message-ID: <f1892ee1-5c84-4829-b2ec-dd93430c6846@sina.com>
Date: Fri, 6 Mar 2026 16:55:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Yongpeng Yang <monty_pavel@sina.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260203133635.3942502-2-monty_pavel@sina.com>
 <20260203133635.3942502-6-monty_pavel@sina.com>
 <de786f84-ff11-428b-b9e2-7063c95e9cc8@kernel.org>
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <de786f84-ff11-428b-b9e2-7063c95e9cc8@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/4/2026 5:30 PM, Chao Yu via Linux-f2fs-devel wrote:
 > On 2026/2/3 21:37, Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> When
 f2fs_fiemap() is called with `fileinfo->fi_flags` containing the [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1vyRQS-0004SW-Dh
Subject: Re: [f2fs-dev] [PATCH 4/4] f2fs: fix inline data not being written
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
X-Rspamd-Queue-Id: F26FA21DDB6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.91 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,xiaomi.com:email]
X-Rspamd-Action: no action

Ck9uIDMvNC8yMDI2IDU6MzAgUE0sIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6
Cj4gT24gMjAyNi8yLzMgMjE6MzcsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+IEZyb206IFlvbmdw
ZW5nIFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pgo+PiBXaGVuIGYyZnNfZmllbWFw
KCkgaXMgY2FsbGVkIHdpdGggYGZpbGVpbmZvLT5maV9mbGFnc2AgY29udGFpbmluZyB0aGUKPj4g
RklFTUFQX0ZMQUdfU1lOQyBmbGFnLCBpdCBhdHRlbXB0cyB0byB3cml0ZSBkYXRhIHRvIGRpc2sg
YmVmb3JlCj4gCj4gQ2FuIHdlIGZpeCB0aGlzIGluIGYyZnNfZmllbWFwKCk/IHJhdGhlciB0aGFu
IGluIAo+IGYyZnNfd3JpdGVfc2luZ2xlX2RhdGFfcGFnZSgpLAo+IHNpbmNlIGl0IGFmZmVjdHMg
bW9yZS4KPiAKPiBmMmZzX2lubGluZV9kYXRhX2ZpZW1hcCgpCj4gLi4uCj4gCj4gaWYgKGZpZWlu
Zm8tPmZpX2ZsYWdzICYgRklFTUFQX0ZMQUdfU1lOQykKPiAgwqDCoMKgwqB3cml0ZSBzaW5nbGUg
bm9kZSBwYWdlIGlmIGl0IGlzIGRpcnR5Pwo+IAoKVGhpcyBtYWtlcyBtb3JlIHNlbnNlLiBJJ2xs
IGZpeCB0aGlzIGluIHYyIHBhdGNoLiBJbgpmMmZzX3dyaXRlX3NpbmdsZV9kYXRhX3BhZ2UoKSwg
d3JpdGluZyBhIG5vZGUgZm9saW8gbWF5IGNhdXNlCmYyZnNfZG9fc3luY19maWxlKCkgdG8gd3Jp
dGUgdGhlIGlub2RlIGZvbGlvIG9uY2UgdGhyb3VnaCB0aGUKZmlsZV93cml0ZV9hbmRfd2FpdF9y
YW5nZSgpIHBhdGguIEFmdGVyd2FyZHMsIGYyZnNfd3JpdGVfaW5vZGUoKSBtYXJrcwp0aGUgaW5v
ZGUgZm9saW8gZGlydHkgYWdhaW4sIHdoaWNoIGNhbiBsZWFkIHRvIHJlZHVuZGFudCB3cml0ZWJh
Y2sgb2YKdGhlIGlub2RlIGZvbGlvLgoKZjJmc19kb19zeW5jX2ZpbGUKICAtIGZpbGVfd3JpdGVf
YW5kX3dhaXRfcmFuZ2UKICAtIGYyZnNfd3JpdGVfaW5vZGUKClRoYW5rcwpZb25ncGVuZywKCj4g
VGhhbmtzLAo+IAo+PiByZXRyaWV2aW5nIGZpbGUgbWFwcGluZ3MgdmlhIGZpbGVtYXBfd3JpdGVf
YW5kX3dhaXQoKS4gSG93ZXZlciwgdGhlcmUgaXMKPj4gYW4gaXNzdWUgd2hlcmUgdGhlIGZpbGUg
ZG9lcyBub3QgZ2V0IG1hcHBlZCBhcyBleHBlY3RlZC4gVGhlIGZvbGxvd2luZwo+PiBzY2VuYXJp
byBjYW4gb2NjdXI6Cj4+Cj4+IHJvb3RAdm06L21udC9mMmZzIyBkZCBpZj0vZGV2L3plcm8gb2Y9
ZGF0YS4zayBicz0zayBjb3VudD0xCj4+IHJvb3RAdm06L21udC9mMmZzIyB4ZnNfaW8gZGF0YS4z
ayAtYyAiZmllbWFwIC12IDAgNDA5NiIKPj4gZGF0YS4zazoKPj4gwqAgRVhUOiBGSUxFLU9GRlNF
VMKgwqDCoMKgwqAgQkxPQ0stUkFOR0XCoMKgwqDCoMKgIFRPVEFMIEZMQUdTCj4+IMKgwqDCoCAw
OiBbMC4uNV06wqDCoMKgwqDCoMKgwqDCoMKgIDAuLjXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCA2IDB4MzA3Cj4+Cj4+IFRoZSByb290IGNhdXNlIG9mIHRoaXMgaXNzdWUgaXMgdGhh
dCBmMmZzX3dyaXRlX3NpbmdsZV9kYXRhX3BhZ2UoKSBvbmx5Cj4+IGNhbGxzIGYyZnNfd3JpdGVf
aW5saW5lX2RhdGEoKSB0byBjb3B5IGRhdGEgZnJvbSB0aGUgZGF0YSBmb2xpbyB0byB0aGUKPj4g
aW5vZGUgZm9saW8sIGFuZCBpdCBjbGVhcnMgdGhlIGRpcnR5IGZsYWcgb24gdGhlIGRhdGEgZm9s
aW8uIEhvd2V2ZXIsIGl0Cj4+IGRvZXMgbm90IG1hcmsgdGhlIGRhdGEgZm9saW8gYXMgd3JpdGVi
YWNrLiBXaGVuCj4+IF9fZmlsZW1hcF9mZGF0YXdhaXRfcmFuZ2UoKSBjaGVja3MgZm9yIGZvbGlv
cyB3aXRoIHRoZSB3cml0ZWJhY2sgZmxhZywKPj4gaXQgcmV0dXJucyBlYXJseSwgY2F1c2luZyBm
MmZzX2ZpZW1hcCgpIHRvIHJlcG9ydCB0aGF0IHRoZSBmaWxlIGhhcyBubwo+PiBtYXBwaW5nLgo+
Pgo+PiBUbyBmaXggdGhpcyBpc3N1ZSwgdGhlIHNvbHV0aW9uIGlzIHRvIGNhbGwgZjJmc19zeW5j
X25vZGVfcGFnZXMoKSBhZnRlcgo+PiBmMmZzX3dyaXRlX2lubGluZV9kYXRhKCkgc3VjY2Vzc2Z1
bGx5IHJldHVybnMsIHdoaWNoIHdpbGwgd3JpdGUgYmFjayB0aGUKPj4gaW5vZGUgZm9saW8gYW5k
IHdhaXQgZm9yIHRoZSB3cml0ZWJhY2sgdG8gY29tcGxldGUuCj4+Cj4+IEZpeGVzOiA5ZmZlMGZi
NWYzYmIgKCJmMmZzOiBoYW5kbGUgaW5saW5lIGRhdGEgb3BlcmF0aW9ucyIpCj4+IFNpZ25lZC1v
ZmYtYnk6IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+PiAtLS0KPj4g
wqAgZnMvZjJmcy9jaGVja3BvaW50LmMgfMKgIDEgKwo+PiDCoCBmcy9mMmZzL2RhdGEuY8KgwqDC
oMKgwqDCoCB8IDE5ICsrKysrKysrKysrKysrKysrKy0KPj4gwqAgZnMvZjJmcy9ub2RlLmPCoMKg
wqDCoMKgwqAgfCAyMSArKysrKysrKysrKysrKysrLS0tLS0KPj4gwqAgMyBmaWxlcyBjaGFuZ2Vk
LCAzNSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMv
ZjJmcy9jaGVja3BvaW50LmMgYi9mcy9mMmZzL2NoZWNrcG9pbnQuYwo+PiBpbmRleCA1MTcyMzk2
YzBiMDEuLmQwYmNhNTc4NTRkYSAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9jaGVja3BvaW50LmMK
Pj4gKysrIGIvZnMvZjJmcy9jaGVja3BvaW50LmMKPj4gQEAgLTEzNDcsNiArMTM0Nyw3IEBAIHN0
YXRpYyBpbnQgYmxvY2tfb3BlcmF0aW9ucyhzdHJ1Y3QgZjJmc19zYl9pbmZvIAo+PiAqc2JpKQo+
PiDCoMKgwqDCoMKgIHN0cnVjdCB3cml0ZWJhY2tfY29udHJvbCB3YmMgPSB7Cj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCAuc3luY19tb2RlID0gV0JfU1lOQ19BTEwsCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCAubnJfdG9fd3JpdGUgPSBMT05HX01BWCwKPj4gK8KgwqDCoMKgwqDCoMKgIC5yYW5nZV9jeWNs
aWMgPSAxLAo+PiDCoMKgwqDCoMKgIH07Cj4+IMKgwqDCoMKgwqAgaW50IGVyciA9IDAsIGNudCA9
IDA7Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4+IGlu
ZGV4IGVlZGFkY2NmODZiYi4uY2NjNWU0ZGRmNTQ3IDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2Rh
dGEuYwo+PiArKysgYi9mcy9mMmZzL2RhdGEuYwo+PiBAQCAtMzEyNiw4ICszMTI2LDI1IEBAIGlu
dCBmMmZzX3dyaXRlX3NpbmdsZV9kYXRhX3BhZ2Uoc3RydWN0IGZvbGlvIAo+PiAqZm9saW8sIGlu
dCAqc3VibWl0dGVkLAo+PiDCoMKgwqDCoMKgIGVyciA9IC1FQUdBSU47Cj4+IMKgwqDCoMKgwqAg
aWYgKGYyZnNfaGFzX2lubGluZV9kYXRhKGlub2RlKSkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
ZXJyID0gZjJmc193cml0ZV9pbmxpbmVfZGF0YShpbm9kZSwgZm9saW8pOwo+PiAtwqDCoMKgwqDC
oMKgwqAgaWYgKCFlcnIpCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIWVycikgewo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZm9saW8gKmlmb2xpbzsKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc3RydWN0IHdyaXRlYmFja19jb250cm9sIGl3YmMgPSB7Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLnN5bmNfbW9kZSA9IFdCX1NZTkNfQUxMLAo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5yYW5nZV9zdGFydCA9IGlub2RlLT5pX2lubyA8PCBQ
QUdFX1NISUZULAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5yYW5nZV9lbmQg
PSBpbm9kZS0+aV9pbm8gPDwgUEFHRV9TSElGVCwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAubnJfdG9fd3JpdGUgPSAxLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC5yYW5nZV9jeWNsaWMgPSAwLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+PiAr
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghZjJmc19zeW5jX25vZGVfcGFnZXMoc2Jp
LCAmaXdiYywgdHJ1ZSwgRlNfTk9ERV9JTykpIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpZm9saW8gPSBmMmZzX2dldF9pbm9kZV9mb2xpbyhzYmksIGlub2RlLT5pX2lubyk7
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFJU19FUlIoaWZvbGlvKSkg
ewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZjJmc19mb2xpb193
YWl0X3dyaXRlYmFjayhpZm9saW8sIE5PREUsIHRydWUsIHRydWUpOwo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZjJmc19mb2xpb19wdXQoaWZvbGlvLCB0cnVlKTsK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIH0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7Cj4+ICvCoMKg
wqDCoMKgwqDCoCB9Cj4+IMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDCoMKgIGlmIChlcnIgPT0gLUVB
R0FJTikgewo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9ub2RlLmMgYi9mcy9mMmZzL25vZGUuYwo+
PiBpbmRleCA3NDk5MmZkOWM5YjYuLjQ3YmZmODliYWZlNiAxMDA2NDQKPj4gLS0tIGEvZnMvZjJm
cy9ub2RlLmMKPj4gKysrIGIvZnMvZjJmcy9ub2RlLmMKPj4gQEAgLTIwODMsNyArMjA4Myw4IEBA
IGludCBmMmZzX3N5bmNfbm9kZV9wYWdlcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHdyaXRlYmFja19jb250cm9s
ICp3YmMsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm9vbCBkb19iYWxh
bmNlLCBlbnVtIGlvc3RhdF90eXBlIGlvX3R5cGUpCj4+IMKgIHsKPj4gLcKgwqDCoCBwZ29mZl90
IGluZGV4Owo+PiArwqDCoMKgIHBnb2ZmX3QgaW5kZXgsIHdiY19pbmRleDsKPj4gK8KgwqDCoCBw
Z29mZl90IGVuZCwgd2JjX2VuZDsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZm9saW9fYmF0Y2ggZmJh
dGNoOwo+PiDCoMKgwqDCoMKgIGludCBzdGVwID0gMDsKPj4gwqDCoMKgwqDCoCBpbnQgbndyaXR0
ZW4gPSAwOwo+PiBAQCAtMjA5MiwxNCArMjA5MywyNCBAQCBpbnQgZjJmc19zeW5jX25vZGVfcGFn
ZXMoc3RydWN0IGYyZnNfc2JfaW5mbyAKPj4gKnNiaSwKPj4gwqDCoMKgwqDCoCBmb2xpb19iYXRj
aF9pbml0KCZmYmF0Y2gpOwo+PiArwqDCoMKgIHdiY19pbmRleCA9IDA7Cj4+ICvCoMKgwqAgd2Jj
X2VuZCA9IExPTkdfTUFYOwo+PiArwqDCoMKgIGlmICghd2JjLT5yYW5nZV9jeWNsaWMpIHsKPj4g
K8KgwqDCoMKgwqDCoMKgIHdiY19pbmRleCA9IHdiYy0+cmFuZ2Vfc3RhcnQgPj4gUEFHRV9TSElG
VDsKPj4gK8KgwqDCoMKgwqDCoMKgIHdiY19lbmQgPSB3YmMtPnJhbmdlX2VuZCA+PiBQQUdFX1NI
SUZUOwo+PiArwqDCoMKgIH0KPj4gwqAgbmV4dF9zdGVwOgo+PiAtwqDCoMKgIGluZGV4ID0gMDsK
Pj4gK8KgwqDCoCBpbmRleCA9IHdiY19pbmRleDsKPj4gK8KgwqDCoCBlbmQgPSB3YmNfZW5kOwo+
PiAtwqDCoMKgIHdoaWxlICghZG9uZSAmJiAobnJfZm9saW9zID0gCj4+IGZpbGVtYXBfZ2V0X2Zv
bGlvc190YWcoTk9ERV9NQVBQSU5HKHNiaSksCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgJmluZGV4LCAocGdvZmZfdCktMSwgUEFHRUNBQ0hFX1RBR19ESVJUWSwKPj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmZmJhdGNoKSkpIHsKPj4gK8KgwqDCoCB3aGlsZSAo
IWRvbmUgJiYgKGluZGV4IDw9IGVuZCkpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGludCBpOwo+
PiArwqDCoMKgwqDCoMKgwqAgbnJfZm9saW9zID0gZmlsZW1hcF9nZXRfZm9saW9zX3RhZyhOT0RF
X01BUFBJTkcoc2JpKSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmaW5kZXgs
IGVuZCwgUEFHRUNBQ0hFX1RBR19ESVJUWSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAmZmJhdGNoKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChucl9mb2xpb3MgPT0gMCkKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBmb3Ig
KGkgPSAwOyBpIDwgbnJfZm9saW9zOyBpKyspIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc3RydWN0IGZvbGlvICpmb2xpbyA9IGZiYXRjaC5mb2xpb3NbaV07Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGJvb2wgc3VibWl0dGVkID0gZmFsc2U7Cj4gCj4gCj4gCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
