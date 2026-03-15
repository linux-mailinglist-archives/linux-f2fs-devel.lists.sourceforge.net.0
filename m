Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id roH/F2ChtmnnEgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 Mar 2026 13:09:04 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2823C29097B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 Mar 2026 13:09:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gT3F9JvnFHfCma7z30NY0OaebiTrUdRSaXdfu8rqlz4=; b=btXF0i23JquzBf0yyX7WTj6Wac
	EUAW9k2dAqRBawzGu/4rNyemGLTIMtA4s8VM0BHpZK3toAzOy9JLUmukIxbQsBwk/URrfq+oTKByL
	YlfjIRlnr74fR9xh06e/xHA8LrP+3vIljCPRtVMbHM8U6b6404qbLQo7V9NRhA2rAL3I=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w1kH2-00051a-KB;
	Sun, 15 Mar 2026 12:08:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1w1kH0-00051I-Qk
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 15 Mar 2026 12:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TCRjgin6xC/RgFpH2Eh/jsaiiSjkzRksfNABw/1+iaE=; b=JnNGWX7n92zXC9ObKhPkMLkJFE
 0z5uief5elr52EVzwhKoBtPe1Jk24MGqZzjbXGH3HmJcDPpEbR4VJHXmCel8ijdJFhakb8GTioQl2
 7W7zmUpvhNIVhVTjfIi4PhewWMYbEbu7mReOrDYxVKcml3G7sQiL30681VtGXe6b6vzQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TCRjgin6xC/RgFpH2Eh/jsaiiSjkzRksfNABw/1+iaE=; b=liTkRK7rnyhy04gANdlFDA/rTq
 H2gn4EEBKo8go2/vK7JrJAug7yANo4d8AID/SigKkznDN94vLY+1JeiUMXnkxwgmSAOmpXu9aR2qa
 Mqp5R5QbX1nsHIJlaYIeAmWjNYUZ9blvm/c2RqmCXIWAPhg0pkEZcdEeNd4pwUlpNWbo=;
Received: from mail3-164.sinamail.sina.com.cn ([202.108.3.164])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w1kGz-00021E-Iq for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 15 Mar 2026 12:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1773576525; bh=TCRjgin6xC/RgFpH2Eh/jsaiiSjkzRksfNABw/1+iaE=;
 h=Message-ID:Date:Subject:From;
 b=M52ipw6AXOUqwxdbsqQsdPjjZGOnRJw7u+FwL+NPJusbicWen+PxpiqZj+3GCEOfP
 pRX37NYEIL3N9zlB+AsPHg1sIpgs1We3U1bkdw6Nr5rt9ssqvvZKMDursFw6WPrCW4
 CSs1WX6uhKfFj9jkIWYU2DwmtrEUM9hFhpxYwfXA=
X-SMAIL-HELO: [192.168.1.3]
Received: from unknown (HELO [192.168.1.3])([120.245.114.55])
 by sina.com (10.54.253.32) with ESMTP
 id 69B6A13E00000640; Sun, 15 Mar 2026 20:08:31 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 4315284456618
X-SMAIL-UIID: E95D9F7C9F0446E69D0F5FA495B29E1A-20260315-200831-1
Message-ID: <5826fc47-be75-419c-8eab-c5014ec02c56@sina.com>
Date: Sun, 15 Mar 2026 20:08:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Yongpeng Yang <monty_pavel@sina.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260308144013.2340225-3-monty_pavel@sina.com>
 <889e7f95-09b8-47f9-af05-48b7ccc05386@sina.com>
 <f7ad8b72-d12f-4b0a-9c6c-9d28b14b04c7@kernel.org>
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <f7ad8b72-d12f-4b0a-9c6c-9d28b14b04c7@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/14/2026 9:17 AM, Chao Yu via Linux-f2fs-devel wrote:
 > On 2026/3/13 19:19, Yongpeng Yang wrote: >> On 3/8/26 22:40, Yongpeng Yang
 wrote: >>> From: Yongpeng Yang >>> >>> When f2fs_fiemap() is c [...] 
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
X-Headers-End: 1w1kGz-00021E-Iq
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 2823C29097B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ck9uIDMvMTQvMjAyNiA5OjE3IEFNLCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3Rl
Ogo+IE9uIDIwMjYvMy8xMyAxOToxOSwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPj4gT24gMy84LzI2
IDIyOjQwLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4gRnJvbTogWW9uZ3BlbmcgWWFuZyA8eWFu
Z3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+Pgo+Pj4gV2hlbiBmMmZzX2ZpZW1hcCgpIGlzIGNhbGxl
ZCB3aXRoIGBmaWxlaW5mby0+ZmlfZmxhZ3NgIGNvbnRhaW5pbmcgdGhlCj4+PiBGSUVNQVBfRkxB
R19TWU5DIGZsYWcsIGl0IGF0dGVtcHRzIHRvIHdyaXRlIGRhdGEgdG8gZGlzayBiZWZvcmUKPj4+
IHJldHJpZXZpbmcgZmlsZSBtYXBwaW5ncyB2aWEgZmlsZW1hcF93cml0ZV9hbmRfd2FpdCgpLiBI
b3dldmVyLCB0aGVyZSBpcwo+Pj4gYW4gaXNzdWUgd2hlcmUgdGhlIGZpbGUgZG9lcyBub3QgZ2V0
IG1hcHBlZCBhcyBleHBlY3RlZC4gVGhlIGZvbGxvd2luZwo+Pj4gc2NlbmFyaW8gY2FuIG9jY3Vy
Ogo+Pj4KPj4+IHJvb3RAdm06L21udC9mMmZzIyBkZCBpZj0vZGV2L3plcm8gb2Y9ZGF0YS4zayBi
cz0zayBjb3VudD0xCj4+PiByb290QHZtOi9tbnQvZjJmcyMgeGZzX2lvIGRhdGEuM2sgLWMgImZp
ZW1hcCAtdiAwIDQwOTYiCj4+PiBkYXRhLjNrOgo+Pj4gwqAgRVhUOiBGSUxFLU9GRlNFVMKgwqDC
oMKgwqAgQkxPQ0stUkFOR0XCoMKgwqDCoMKgIFRPVEFMIEZMQUdTCj4+PiDCoMKgwqAgMDogWzAu
LjVdOsKgwqDCoMKgwqDCoMKgwqDCoCAwLi41wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgNiAweDMwNwo+Pj4KPj4+IFRoZSByb290IGNhdXNlIG9mIHRoaXMgaXNzdWUgaXMgdGhhdCBm
MmZzX3dyaXRlX3NpbmdsZV9kYXRhX3BhZ2UoKSBvbmx5Cj4+PiBjYWxscyBmMmZzX3dyaXRlX2lu
bGluZV9kYXRhKCkgdG8gY29weSBkYXRhIGZyb20gdGhlIGRhdGEgZm9saW8gdG8gdGhlCj4+PiBp
bm9kZSBmb2xpbywgYW5kIGl0IGNsZWFycyB0aGUgZGlydHkgZmxhZyBvbiB0aGUgZGF0YSBmb2xp
by4gSG93ZXZlciwgaXQKPj4+IGRvZXMgbm90IG1hcmsgdGhlIGRhdGEgZm9saW8gYXMgd3JpdGVi
YWNrLiBXaGVuCj4+PiBfX2ZpbGVtYXBfZmRhdGF3YWl0X3JhbmdlKCkgY2hlY2tzIGZvciBmb2xp
b3Mgd2l0aCB0aGUgd3JpdGViYWNrIGZsYWcsCj4+PiBpdCByZXR1cm5zIGVhcmx5LCBjYXVzaW5n
IGYyZnNfZmllbWFwKCkgdG8gcmVwb3J0IHRoYXQgdGhlIGZpbGUgaGFzIG5vCj4+PiBtYXBwaW5n
Lgo+Pj4KPj4+IFRvIGZpeCB0aGlzIGlzc3VlLCB0aGUgc29sdXRpb24gaXMgdG8gY2FsbCBmMmZz
X3N5bmNfbm9kZV9wYWdlcygpIGluCj4+PiBmMmZzX2lubGluZV9kYXRhX2ZpZW1hcCgpIHdoZW4g
Z2V0dGluZyBmaWVtYXAgd2l0aCBGSUVNQVBfRkxBR19TWU5DCj4+PiBmbGFncy4gVGhpcyBwYXRj
aCBlbnN1cmVzIHRoYXQgdGhlIGlub2RlIGZvbGlvIGlzIHdyaXR0ZW4gYmFjayBhbmQgdGhlCj4+
PiB3cml0ZWJhY2sgcHJvY2VzcyBjb21wbGV0ZXMgYmVmb3JlIHByb2NlZWRpbmcuCj4+Pgo+Pj4g
Rml4ZXM6IDlmZmUwZmI1ZjNiYiAoImYyZnM6IGhhbmRsZSBpbmxpbmUgZGF0YSBvcGVyYXRpb25z
IikKPj4+IFNpZ25lZC1vZmYtYnk6IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWku
Y29tPgo+Pj4gLS0tCj4+PiAtIENhbGwgZjJmc19zeW5jX25vZGVfcGFnZXMoKSBpbiBnZXR0aW5n
IGZpZW1hcCBwYXRoIHJhdGhlciB0aGFuCj4+PiB3cml0ZWJhY2sgcGF0aC4KPj4+IC0tLQo+Pj4g
wqAgZnMvZjJmcy9jaGVja3BvaW50LmMgfMKgIDEgKwo+Pj4gwqAgZnMvZjJmcy9pbmxpbmUuY8Kg
wqDCoMKgIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4gwqAgZnMvZjJmcy9ub2Rl
LmPCoMKgwqDCoMKgwqAgfCAyMSArKysrKysrKysrKysrKysrLS0tLS0KPj4+IMKgIDMgZmlsZXMg
Y2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9jaGVja3BvaW50LmMgYi9mcy9mMmZzL2NoZWNrcG9pbnQuYwo+Pj4gaW5k
ZXggNmRkMzliN2RlMTFhLi5jODUyNzY5MzFjNDUgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL2No
ZWNrcG9pbnQuYwo+Pj4gKysrIGIvZnMvZjJmcy9jaGVja3BvaW50LmMKPj4+IEBAIC0xNDE2LDYg
KzE0MTYsNyBAQCBzdGF0aWMgaW50IGJsb2NrX29wZXJhdGlvbnMoc3RydWN0IGYyZnNfc2JfaW5m
byAKPj4+ICpzYmkpCj4+PiDCoMKgwqDCoMKgIHN0cnVjdCB3cml0ZWJhY2tfY29udHJvbCB3YmMg
PSB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLnN5bmNfbW9kZSA9IFdCX1NZTkNfQUxMLAo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgIC5ucl90b193cml0ZSA9IExPTkdfTUFYLAo+Pj4gK8KgwqDCoMKg
wqDCoMKgIC5yYW5nZV9jeWNsaWMgPSAxLAo+Pj4gwqDCoMKgwqDCoCB9Owo+Pj4gwqDCoMKgwqDC
oCBpbnQgZXJyID0gMCwgY250ID0gMDsKPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2lubGluZS5j
IGIvZnMvZjJmcy9pbmxpbmUuYwo+Pj4gaW5kZXggODZkMmFiYmI0MGZmLi5hYjFlMTBiMGY2YTYg
MTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL2lubGluZS5jCj4+PiArKysgYi9mcy9mMmZzL2lubGlu
ZS5jCj4+PiBAQCAtOSw2ICs5LDcgQEAKPj4+IMKgICNpbmNsdWRlIDxsaW51eC9mcy5oPgo+Pj4g
wqAgI2luY2x1ZGUgPGxpbnV4L2YyZnNfZnMuaD4KPj4+IMKgICNpbmNsdWRlIDxsaW51eC9maWVt
YXAuaD4KPj4+ICsjaW5jbHVkZSA8bGludXgvd3JpdGViYWNrLmg+Cj4+PiDCoCAjaW5jbHVkZSAi
ZjJmcy5oIgo+Pj4gwqAgI2luY2x1ZGUgIm5vZGUuaCIKPj4+IEBAIC04MTQsNiArODE1LDMwIEBA
IGludCBmMmZzX2lubGluZV9kYXRhX2ZpZW1hcChzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0Owo+Pj4gwqDCoMKgwqDCoCB9Cj4+PiArwqDCoMKgIGlm
IChmaWVpbmZvLT5maV9mbGFncyAmIEZJRU1BUF9GTEFHX1NZTkMpIHsKPj4+ICvCoMKgwqDCoMKg
wqDCoCBzdHJ1Y3Qgd3JpdGViYWNrX2NvbnRyb2wgaXdiYyA9IHsKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC5zeW5jX21vZGUgPSBXQl9TWU5DX0FMTCwKPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC5yYW5nZV9zdGFydCA9IGlub2RlLT5pX2lubyA8PCBQQUdFX1NISUZULAo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLnJhbmdlX2VuZCA9IGlub2RlLT5pX2lubyA8PCBQQUdFX1NI
SUZULAo+IAo+ICDCoMKgwqDCoMKgwqDCoCAucmFuZ2Vfc3RhcnQgPSAobG9mZl90KWlub2RlLT5p
X2lubyA8PCBQQUdFX1NISUZULAo+ICDCoMKgwqDCoMKgwqDCoCAucmFuZ2VfZW5kID0gKGxvZmZf
dClpbm9kZS0+aV9pbm8gPDwgUEFHRV9TSElGVCwKPiAKPiBUbyBhdm9pZCBvdmVyZmxvdyBpbiAz
Mi1iaXQgYXJjaC4KCk9oLCBJIG92ZXJsb29rZWQgdGhpcywgSSdsbCBmaXggdGhpcyBpbiB2MyBw
YXRjaC4KCj4gCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAubnJfdG9fd3JpdGUgPSAxLAo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnJhbmdlX2N5Y2xpYyA9IDAsCj4+PiArwqDCoMKg
wqDCoMKgwqAgfTsKPj4+ICsKPj4+ICtyZXRyeToKPj4+ICvCoMKgwqDCoMKgwqDCoCBmMmZzX2Zv
bGlvX3dhaXRfd3JpdGViYWNrKGlmb2xpbywgTk9ERSwgdHJ1ZSwgdHJ1ZSk7Cj4+PiArwqDCoMKg
wqDCoMKgwqAgaWYgKGZvbGlvX3Rlc3RfZGlydHkoaWZvbGlvKSkgewo+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZjJmc19mb2xpb19wdXQoaWZvbGlvLCB0cnVlKTsKPiAKPiBPaCwgaXQgbmVl
ZHMgdG8gdW5sb2NrL2xvY2sgaW5vZGUgZm9saW8sIHdoeSBub3QgY2FsbGluZyAKPiBfX3dyaXRl
X25vZGVfZm9saW8oKSBkaXJlY3RseT8KPiBtYXliZSBhIHdyYXBwZWQgZnVuY3Rpb24gZnJvbSBm
MmZzX21vdmVfbm9kZV9mb2xpbygpLgo+IAoKSW4gdGhlIGZpZW1hcCBwYXRoLCBub2RlIGZvbGlv
IHdyaXRlcyBhbHNvIHJlcXVpcmUgY2xlYXJpbmcgdGhlIGZzeW5jCm1hcmsgYW5kIGRlbnRyeSBt
YXJrLiBEaXJlY3RseSBjYWxsaW5nIF9fd3JpdGVfbm9kZV9wYWdlKCkgYXBwZWFycwpyZXBldGl0
aXZlIGhlcmUsIGhlbmNlIHVzaW5nIGYyZnNfc3luY19ub2RlX3BhZ2VzKCkgaW5zdGVhZCwgc28g
ZG9lcwpmMmZzX21vdmVfbm9kZV9mb2xpbygpLiBIb3cgYWJvdXQgd3JhcHBpbmcgdGhlIGlub2Rl
IGZvbGlvIHdyaXRlIGxvZ2ljCmluIGYyZnNfd3JpdGVfc2luZ2xlX2lub2RlX2ZvbGlvKCk/CgpU
aGFua3MKWW9uZ3BlbmcsCgo+IFRoYW5rcywKPiAKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGVyciA9IGYyZnNfc3luY19ub2RlX3BhZ2VzKEYyRlNfSV9TQihpbm9kZSksICZpd2JjLCAKPj4+
IHRydWUsIEZTX05PREVfSU8pOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFlcnIp
IHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWZvbGlvID0gZjJmc19nZXRf
aW5vZGVfZm9saW8oRjJGU19JX1NCKGlub2RlKSwgCj4+PiBpbm9kZS0+aV9pbm8pOwo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoSVNfRVJSKGlmb2xpbykpCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIoaWZvbGlv
KTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byByZXRyeTsKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biBlcnI7Cj4+PiArwqDCoMKgwqDCoMKgwqAgfQo+Pj4gK8KgwqDCoCB9Cj4+PiArCj4+PiDCoMKg
wqDCoMKgIGlsZW4gPSBtaW5fdChzaXplX3QsIE1BWF9JTkxJTkVfREFUQShpbm9kZSksIGlfc2l6
ZV9yZWFkKGlub2RlKSk7Cj4+PiDCoMKgwqDCoMKgIGlmIChzdGFydCA+PSBpbGVuKQo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0Owo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvbm9kZS5j
IGIvZnMvZjJmcy9ub2RlLmMKPj4+IGluZGV4IGJiZmE2NzdlZjQ2Zi4uMmZiZmVjYWYzZjdiIDEw
MDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9ub2RlLmMKPj4+ICsrKyBiL2ZzL2YyZnMvbm9kZS5jCj4+
PiBAQCAtMjA4Myw3ICsyMDgzLDggQEAgaW50IGYyZnNfc3luY19ub2RlX3BhZ2VzKHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c3RydWN0IHdyaXRlYmFja19jb250cm9sICp3YmMsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGJvb2wgZG9fYmFsYW5jZSwgZW51bSBpb3N0YXRfdHlwZSBpb190eXBlKQo+
Pj4gwqAgewo+Pj4gLcKgwqDCoCBwZ29mZl90IGluZGV4Owo+Pj4gK8KgwqDCoCBwZ29mZl90IGlu
ZGV4LCB3YmNfaW5kZXg7Cj4+PiArwqDCoMKgIHBnb2ZmX3QgZW5kLCB3YmNfZW5kOwo+Pj4gwqDC
oMKgwqDCoCBzdHJ1Y3QgZm9saW9fYmF0Y2ggZmJhdGNoOwo+Pj4gwqDCoMKgwqDCoCBpbnQgc3Rl
cCA9IDA7Cj4+PiDCoMKgwqDCoMKgIGludCBud3JpdHRlbiA9IDA7Cj4+PiBAQCAtMjA5MiwxNCAr
MjA5MywyNCBAQCBpbnQgZjJmc19zeW5jX25vZGVfcGFnZXMoc3RydWN0IGYyZnNfc2JfaW5mbyAK
Pj4+ICpzYmksCj4+PiDCoMKgwqDCoMKgIGZvbGlvX2JhdGNoX2luaXQoJmZiYXRjaCk7Cj4+PiAr
wqDCoMKgIHdiY19pbmRleCA9IDA7Cj4+PiArwqDCoMKgIHdiY19lbmQgPSBMT05HX01BWDsKPj4+
ICvCoMKgwqAgaWYgKCF3YmMtPnJhbmdlX2N5Y2xpYykgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIHdi
Y19pbmRleCA9IHdiYy0+cmFuZ2Vfc3RhcnQgPj4gUEFHRV9TSElGVDsKPj4+ICvCoMKgwqDCoMKg
wqDCoCB3YmNfZW5kID0gd2JjLT5yYW5nZV9lbmQgPj4gUEFHRV9TSElGVDsKPj4+ICvCoMKgwqAg
fQo+Pj4gwqAgbmV4dF9zdGVwOgo+Pj4gLcKgwqDCoCBpbmRleCA9IDA7Cj4+PiArwqDCoMKgIGlu
ZGV4ID0gd2JjX2luZGV4Owo+Pj4gK8KgwqDCoCBlbmQgPSB3YmNfZW5kOwo+Pj4gLcKgwqDCoCB3
aGlsZSAoIWRvbmUgJiYgKG5yX2ZvbGlvcyA9IAo+Pj4gZmlsZW1hcF9nZXRfZm9saW9zX3RhZyhO
T0RFX01BUFBJTkcoc2JpKSwKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmlu
ZGV4LCAocGdvZmZfdCktMSwgUEFHRUNBQ0hFX1RBR19ESVJUWSwKPj4+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgJmZiYXRjaCkpKSB7Cj4+PiArwqDCoMKgIHdoaWxlICghZG9uZSAm
JiAoaW5kZXggPD0gZW5kKSkgewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGludCBpOwo+Pj4gK8Kg
wqDCoMKgwqDCoMKgIG5yX2ZvbGlvcyA9IGZpbGVtYXBfZ2V0X2ZvbGlvc190YWcoTk9ERV9NQVBQ
SU5HKHNiaSksCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZpbmRleCwgZW5k
LCBQQUdFQ0FDSEVfVEFHX0RJUlRZLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAmZmJhdGNoKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAobnJfZm9saW9zID09IDApCj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBmb3Ig
KGkgPSAwOyBpIDwgbnJfZm9saW9zOyBpKyspIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHN0cnVjdCBmb2xpbyAqZm9saW8gPSBmYmF0Y2guZm9saW9zW2ldOwo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYm9vbCBzdWJtaXR0ZWQgPSBmYWxzZTsKPj4KPj4gcGluZwo+Pgo+
PiBUaGFua3MKPj4gWW9uZ3BlbmcsCj4gCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+
IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
