Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBGNM5icqmnPUQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 06 Mar 2026 10:21:28 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC68B21DCF9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 06 Mar 2026 10:21:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ObwyLV5tUX5xvepoaqVhJHmhhI4jraaC5TS/TK4fcE=; b=AZUzhEPDppRJ/rguCN04oQvsAH
	y0Oc7LraD9OLWtbQ4CX+j5PAX+DH3BSb7cBUx6OQotVHurmAFPoKYLXYLDM56A60AF2wRafZUYLRG
	zCz9RnPe8RyVGCsmun8PFbegwNPTBV8TalXUO8ILCOV/o6dBefhha1mSlI8uQF8s8s1g=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vyRMu-0002Jn-5B;
	Fri, 06 Mar 2026 09:21:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vyRMs-0002JZ-Hv
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Mar 2026 09:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4dAFX0ra+7G5rZ0u8wElvIsaRH35+WAg3oxzAtHlSIw=; b=KdoLjdqISzFIgegegP8qQewRNu
 byx8B3KZGBmDJ4YY3WST0XkUOLSfcoAkd1nLSkaLy2RKf23bwUbvd7R/HfGRB8kQUsRxPr5HX/EQS
 TWZ6aE2XQh2Wj1Kexdn/Sq4ypcN3OfslThpjwX39I0rp09Gphe6Az2kjnTDDY0cHGkBA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4dAFX0ra+7G5rZ0u8wElvIsaRH35+WAg3oxzAtHlSIw=; b=ZQRJ6OsoNYRLSomhkK0IxMOkf8
 RUEp41o18pIML4cgb1c/xGHJlGMkHLKWzfcwZmTG/24tR6aB/UQsPBZriu7KyfZLQuQzjy/T3YzGz
 g7d7aFsDgReVT99R3iZ3rsu1g5T5a86KYeaXIXCvN57mEXiUh68WVCe9dbmyIgrg7B3E=;
Received: from mail115-171.sinamail.sina.com.cn ([218.30.115.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vyRMr-0004Cl-4y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Mar 2026 09:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1772788869; bh=4dAFX0ra+7G5rZ0u8wElvIsaRH35+WAg3oxzAtHlSIw=;
 h=Message-ID:Date:Subject:From;
 b=M92Fb8i5G4dSbokwoDHuGntuwchhE6fdrQP3xaS2CMtUVez6rlUJFb+n/Z5Khy7Y3
 l6FQm8naKxac9lmaf6dnG7/SVDz+Frxq9/ux9ytQACf660oKZcqukcqCVfZ0PecNPj
 A4N6i6h6lPbOShnsehrZ0d9RNrnjgIWGiunKlz4M=
X-SMAIL-HELO: [10.220.28.86]
Received: from unknown (HELO [10.220.28.86])([1.202.162.55])
 by sina.com (10.185.250.24) with ESMTP
 id 69AA9BE600001F6F; Fri, 6 Mar 2026 17:18:32 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 56681510748079
X-SMAIL-UIID: 82E0A109A2584254A9FE0F9F71FC0CD7-20260306-171832-1
Message-ID: <b8421f4e-ffd4-40a7-9ce9-4a496db08825@sina.com>
Date: Fri, 6 Mar 2026 17:18:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Yongpeng Yang <monty_pavel@sina.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260203133635.3942502-2-monty_pavel@sina.com>
 <df7554b5-b69d-42d7-aabc-148c882de82d@kernel.org>
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <df7554b5-b69d-42d7-aabc-148c882de82d@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/4/2026 5:13 PM, Chao Yu via Linux-f2fs-devel wrote: >
 FYI, there is a similar proposal previously: > >
 https://lore.kernel.org/linux-f2fs-devel/20230410020724.1817150-1-
 > chao@kernel.org Looks better than my patch, and the commit message is more
 detailed. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1vyRMr-0004Cl-4y
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: fix incorrect extent flag when
 physical addr is NEW_ADDR in f2fs_fiemap
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
X-Rspamd-Queue-Id: DC68B21DCF9
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,sina.com:mid,xiaomi.com:email]
X-Rspamd-Action: no action

T24gMy80LzIwMjYgNToxMyBQTSwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToK
PiBGWUksIHRoZXJlIGlzIGEgc2ltaWxhciBwcm9wb3NhbCBwcmV2aW91c2x5Ogo+IAo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWYyZnMtZGV2ZWwvMjAyMzA0MTAwMjA3MjQuMTgxNzE1
MC0xLSAKPiBjaGFvQGtlcm5lbC5vcmcKCkxvb2tzIGJldHRlciB0aGFuIG15IHBhdGNoLCBhbmQg
dGhlIGNvbW1pdCBtZXNzYWdlIGlzIG1vcmUgZGV0YWlsZWQuCgpUaGFua3MKWW9uZ3BlbmcsCgo+
IAo+IE9uIDIwMjYvMi8zIDIxOjM2LCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+PiBGcm9tOiBZb25n
cGVuZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4KPj4gV2hlbiB0aGUgZmlsZSBi
bG9jaydzIGFkZHJlc3MgaXMgbWFwcGVkIHRvIE5FV19BRERSLCB0aGUgZXh0ZW50IGlzCj4+IGN1
cnJlbnRseSBtYXJrZWQgd2l0aCB0aGUgRklFTUFQX0VYVEVOVF9VTldSSVRURU4gZmxhZyBpbiBm
MmZzX2ZpZW1hcCgpLgo+PiBUaGlzIGZsYWcgaW5kaWNhdGVzIHRoYXQgdGhlIGJsb2NrIGhhcyBi
ZWVuIGFsbG9jYXRlZCBidXQgbm90IHlldAo+PiB3cml0dGVuIHRvLiBIb3dldmVyLCBORVdfQURE
UiBpbmRpY2F0ZXMgZGVsYXllZCB3cml0aW5nLCBtZWFuaW5nIHRoZQo+PiBibG9jayBoYXMgbm90
IGJlZW4gYWxsb2NhdGVkIHlldC4gVGhlcmVmb3JlLCB0aGlzIHNob3VsZCBiZSBtb2RpZmllZAo+
PiBzdWNoIHRoYXQgd2hlbiBhIGZpbGUgYmxvY2sncyBhZGRyZXNzIGlzIG1hcHBlZCB0byBORVdf
QUREUiwgdGhlIGV4dGVudAo+PiBpcyBtYXJrZWQgd2l0aCB0aGUgRklFTUFQX0VYVEVOVF9ERUxB
TExPQyBmbGFncyBpbnN0ZWFkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBZb25ncGVuZyBZYW5nIDx5
YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4gLS0tCj4+IMKgIGZzL2YyZnMvZGF0YS5jIHwgMiAr
LQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPj4gaW5kZXgg
ODQ3NDZhMDZjZDU4Li40MmYxNWZkOWM2OGUgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5j
Cj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+IEBAIC0yMTAyLDcgKzIxMDIsNyBAQCBpbnQgZjJm
c19maWVtYXAoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IAo+PiBmaWVtYXBfZXh0ZW50X2lu
Zm8gKmZpZWluZm8sCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZSAr
PSBGMkZTX0JMS1NJWkU7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIH0gZWxzZSBpZiAobWFwLm1fZmxhZ3MgJiBGMkZTX01BUF9ERUxBTExPQykg
ewo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmbGFncyA9IEZJRU1BUF9FWFRFTlRfVU5XUklU
VEVOOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmbGFncyA9IEZJRU1BUF9FWFRFTlRfREVM
QUxMT0M7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzdGFy
dF9ibGsgKz0gRjJGU19CWVRFU19UT19CTEsoc2l6ZSk7Cj4gCj4gCj4gCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCg==
