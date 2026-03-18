Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHOMAt9cumnFUgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 09:05:51 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA682B771C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 09:05:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shGX3r72XDN45LVjUk2DseDD97MW6+eWWgN/xftr+6Q=; b=XrTamLIqEJR9cTm9GknIUnmwcK
	rI+orfKycL/Ks/96iTARVLHSiZuQhIaDzbDF8l7uALhGSO7aXQTjOYTLpv7DIC14VRlDFZu4nksg5
	Rwj4jRupVWZp2sr4S/Deab752lHsyBhYSCTmA07NijoPte9Pib8WBXFyWicwQwyd8UIo=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w2luN-0002Z5-RV;
	Wed, 18 Mar 2026 08:05:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1w2luL-0002Yw-M3
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 08:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kld3wPDfw+kY+7sWUCfsc//BaQh1JkWK7dBOR/chHWw=; b=jkjVd877e9Xu2+04G/+8FMiIDF
 tHVjsrpO6LhEjWZLQQSfrxestqV9g837jl5eaJ//m3fIiV3r4rQaICjNZQUtgpt4twtgr33Gke7P8
 lyvKjis6r0zjnxCY9yoGxakmQsogisKF+Y2pSZ1JAm9frAeW3Bpjctg0DGHmBV0ORtiI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Kld3wPDfw+kY+7sWUCfsc//BaQh1JkWK7dBOR/chHWw=; b=GrbSgzFxEn7iwQfZClLrXOfFpS
 KsxVWif87bC4mb6vtK2XqOlcWOUMJYTellHaCpc0j8ymGBgRNsvMCWBo7WwNbCj+7cokbSulEvbf1
 e8fj3565L/C35rpa1HZCURgFnMJ3VmCMjtl+IDAfXemMn9+R+LtmdHsufxHZsmvw5XfI=;
Received: from smtp134-31.sina.com.cn ([180.149.134.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w2luJ-00074O-F5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 08:05:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1773821135; bh=Kld3wPDfw+kY+7sWUCfsc//BaQh1JkWK7dBOR/chHWw=;
 h=Message-ID:Date:Subject:From;
 b=mH8l+Er/mKV9dpn8pkkwq0hlEg6OLAVCyMf3y/uS3y9T8E9A7Sqn13obxWxLkAlsk
 O9Dv69JYpFxGg7aj6y3fyXC3nbsxtJt+cUyDFgSqaiJHLmcTZjyxkjlwzKteiKxDmF
 cC2BBh+Apvls3kCEB4+IU/Rstg5f2JgQZ3WOX8t0=
X-SMAIL-HELO: [10.220.25.2]
Received: from unknown (HELO [10.220.25.2])([1.202.162.3])
 by sina.com (10.185.250.21) with ESMTP
 id 69BA5CBE00005338; Wed, 18 Mar 2026 16:05:20 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 8071523408286
X-SMAIL-UIID: 06A82A863099483591DA589EF2C6A266-20260318-160520-1
Message-ID: <32f4d5fa-467a-4c2f-8885-0c0fc4eacb77@sina.com>
Date: Wed, 18 Mar 2026 16:05:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Yongpeng Yang <monty_pavel@sina.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260317115459.208306-2-monty_pavel@sina.com>
 <20260317115459.208306-8-monty_pavel@sina.com>
 <21fe73ba-2476-443a-862d-6c415205932b@kernel.org>
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <21fe73ba-2476-443a-862d-6c415205932b@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/18/2026 12:35 PM, Chao Yu via Linux-f2fs-devel wrote:
 > On 2026/3/17 19:56, Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> When
 f2fs_fiemap() is called with `fileinfo->fi_flags` containing t [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1w2luJ-00074O-F5
Subject: Re: [f2fs-dev] [PATCH v4 4/4] f2fs: fix inline data not being
 written to disk in writeback path
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 3CA682B771C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMy8xOC8yMDI2IDEyOjM1IFBNLCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3Rl
Ogo+IE9uIDIwMjYvMy8xNyAxOTo1NiwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPj4gRnJvbTogWW9u
Z3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+Cj4+IFdoZW4gZjJmc19maWVt
YXAoKSBpcyBjYWxsZWQgd2l0aCBgZmlsZWluZm8tPmZpX2ZsYWdzYCBjb250YWluaW5nIHRoZQo+
PiBGSUVNQVBfRkxBR19TWU5DIGZsYWcsIGl0IGF0dGVtcHRzIHRvIHdyaXRlIGRhdGEgdG8gZGlz
ayBiZWZvcmUKPj4gcmV0cmlldmluZyBmaWxlIG1hcHBpbmdzIHZpYSBmaWxlbWFwX3dyaXRlX2Fu
ZF93YWl0KCkuIEhvd2V2ZXIsIHRoZXJlIGlzCj4+IGFuIGlzc3VlIHdoZXJlIHRoZSBmaWxlIGRv
ZXMgbm90IGdldCBtYXBwZWQgYXMgZXhwZWN0ZWQuIFRoZSBmb2xsb3dpbmcKPj4gc2NlbmFyaW8g
Y2FuIG9jY3VyOgo+Pgo+PiByb290QHZtOi9tbnQvZjJmcyMgZGQgaWY9L2Rldi96ZXJvIG9mPWRh
dGEuM2sgYnM9M2sgY291bnQ9MQo+PiByb290QHZtOi9tbnQvZjJmcyMgeGZzX2lvIGRhdGEuM2sg
LWMgImZpZW1hcCAtdiAwIDQwOTYiCj4+IGRhdGEuM2s6Cj4+IMKgIEVYVDogRklMRS1PRkZTRVTC
oMKgwqDCoMKgIEJMT0NLLVJBTkdFwqDCoMKgwqDCoCBUT1RBTCBGTEFHUwo+PiDCoMKgwqAgMDog
WzAuLjVdOsKgwqDCoMKgwqDCoMKgwqDCoCAwLi41wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgNiAweDMwNwo+Pgo+PiBUaGUgcm9vdCBjYXVzZSBvZiB0aGlzIGlzc3VlIGlzIHRoYXQg
ZjJmc193cml0ZV9zaW5nbGVfZGF0YV9wYWdlKCkgb25seQo+PiBjYWxscyBmMmZzX3dyaXRlX2lu
bGluZV9kYXRhKCkgdG8gY29weSBkYXRhIGZyb20gdGhlIGRhdGEgZm9saW8gdG8gdGhlCj4+IGlu
b2RlIGZvbGlvLCBhbmQgaXQgY2xlYXJzIHRoZSBkaXJ0eSBmbGFnIG9uIHRoZSBkYXRhIGZvbGlv
LiBIb3dldmVyLCBpdAo+PiBkb2VzIG5vdCBtYXJrIHRoZSBkYXRhIGZvbGlvIGFzIHdyaXRlYmFj
ay4gV2hlbgo+PiBfX2ZpbGVtYXBfZmRhdGF3YWl0X3JhbmdlKCkgY2hlY2tzIGZvciBmb2xpb3Mg
d2l0aCB0aGUgd3JpdGViYWNrIGZsYWcsCj4+IGl0IHJldHVybnMgZWFybHksIGNhdXNpbmcgZjJm
c19maWVtYXAoKSB0byByZXBvcnQgdGhhdCB0aGUgZmlsZSBoYXMgbm8KPj4gbWFwcGluZy4KPj4K
Pj4gVG8gZml4IHRoaXMgaXNzdWUsIHRoZSBzb2x1dGlvbiBpcyB0byBjYWxsCj4+IGYyZnNfd3Jp
dGVfc2luZ2xlX25vZGVfZm9saW8oKSBpbiBmMmZzX2lubGluZV9kYXRhX2ZpZW1hcCgpIHdoZW4K
Pj4gZ2V0dGluZyBmaWVtYXAgd2l0aCBGSUVNQVBfRkxBR19TWU5DIGZsYWdzLiBUaGlzIHBhdGNo
IGVuc3VyZXMgdGhhdCB0aGUKPj4gaW5vZGUgZm9saW8gaXMgd3JpdHRlbiBiYWNrIGFuZCB0aGUg
d3JpdGViYWNrIHByb2Nlc3MgY29tcGxldGVzIGJlZm9yZQo+PiBwcm9jZWVkaW5nLgo+Pgo+PiBG
aXhlczogOWZmZTBmYjVmM2JiICgiZjJmczogaGFuZGxlIGlubGluZSBkYXRhIG9wZXJhdGlvbnMi
KQo+PiBTaWduZWQtb2ZmLWJ5OiBZb25ncGVuZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNv
bT4KPj4gLS0tCj4+IHY0Ogo+PiAtIEZpeCB0aGUgbWlzc2luZyByZXR1cm4gdmFsdWUgY2hlY2sg
Zm9yIGYyZnNfZ2V0X2lub2RlX2ZvbGlvKCkuCj4+IHYzOgo+PiAtIENhbGwgZjJmc193cml0ZV9z
aW5nbGVfbm9kZV9mb2xpbygpIGluc3RlYWQgb2YgZjJmc19zeW5jX25vZGVfcGFnZXMoKQo+PiB2
MjoKPj4gLSBDYWxsIGYyZnNfc3luY19ub2RlX3BhZ2VzKCkgaW4gZ2V0dGluZyBmaWVtYXAgcGF0
aCByYXRoZXIgdGhhbgo+PiB3cml0ZWJhY2sgcGF0aC4KPj4gLS0tCj4+IMKgIGZzL2YyZnMvaW5s
aW5lLmMgfCA5ICsrKysrKysrKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
Cj4+Cj4gCj4gRGVjbGFyYXRpb24gc2hvdWxkIGJlIHJlbG9jYXRlZCBpbnRvIHRoaXMgcGF0Y2gu
Cj4gCj4gK2ludCBmMmZzX3dyaXRlX3NpbmdsZV9ub2RlX2ZvbGlvKHN0cnVjdCBmb2xpbyAqbm9k
ZV9mb2xpbywgaW50IHN5bmNfbW9kZSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib29sIG1h
cmtfZGlydHksIGVudW0gaW9zdGF0X3R5cGUgaW9fdHlwZSk7Cj4gCgpPSywgSSdsbCByZWxvY2F0
ZSBpdCBpbiB2NSBwYXRjaC4KClRoYW5rcwpZb25ncGVuZywKCj4gVGhhbmtzLAo+IAo+PiBkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9pbmxpbmUuYyBiL2ZzL2YyZnMvaW5saW5lLmMKPj4gaW5kZXggODZk
MmFiYmI0MGZmLi42MmE4YTExOTJhNDEgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvaW5saW5lLmMK
Pj4gKysrIGIvZnMvZjJmcy9pbmxpbmUuYwo+PiBAQCAtODE0LDYgKzgxNCwxNSBAQCBpbnQgZjJm
c19pbmxpbmVfZGF0YV9maWVtYXAoc3RydWN0IGlub2RlICppbm9kZSwKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIGdvdG8gb3V0Owo+PiDCoMKgwqDCoMKgIH0KPj4gK8KgwqDCoCBpZiAoZmllaW5mby0+
ZmlfZmxhZ3MgJiBGSUVNQVBfRkxBR19TWU5DKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBlcnIgPSBm
MmZzX3dyaXRlX3NpbmdsZV9ub2RlX2ZvbGlvKGlmb2xpbywgdHJ1ZSwgZmFsc2UsIAo+PiBGU19O
T0RFX0lPKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChlcnIpCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiBlcnI7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZm9saW8gPSBmMmZzX2dldF9p
bm9kZV9mb2xpbyhGMkZTX0lfU0IoaW5vZGUpLCBpbm9kZS0+aV9pbm8pOwo+PiArwqDCoMKgwqDC
oMKgwqAgaWYgKElTX0VSUihpZm9saW8pKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gUFRSX0VSUihpZm9saW8pOwo+PiArwqDCoMKgwqDCoMKgwqAgZjJmc19mb2xpb193YWl0X3dy
aXRlYmFjayhpZm9saW8sIE5PREUsIHRydWUsIHRydWUpOwo+PiArwqDCoMKgIH0KPj4gwqDCoMKg
wqDCoCBpbGVuID0gbWluX3Qoc2l6ZV90LCBNQVhfSU5MSU5FX0RBVEEoaW5vZGUpLCBpX3NpemVf
cmVhZChpbm9kZSkpOwo+PiDCoMKgwqDCoMKgIGlmIChzdGFydCA+PSBpbGVuKQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgZ290byBvdXQ7Cj4gCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+
IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
