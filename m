Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDjuF5E5smmOJwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 04:57:05 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1954226CE7D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 04:57:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxtxJXXCoNxtGL3AHgKhxVMET7VrGXsCLsMHqhgPArM=; b=PCOwX9w0HsTY/Sedsekinoyr2h
	z5H763s32omzH/Kd7TA83nldXiZYrCvKdE8tp0AO0Kz3BcqE/Z+Y3th8cFdSz2fH7LW7LIlZKpHwC
	VYTOuEW2X48HqbA/D8O7kdj7YQ2xeFQbY8sDMauZe4JFemkngM/08lqlApaGaOqMlgIc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0XAL-0002PV-7x;
	Thu, 12 Mar 2026 03:56:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1w0XAJ-0002PN-FU
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 03:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fJYhJype+zoc1Cg4v/mN1u4O1TGNETK/ZGeLtIXGOgo=; b=KV6A5CUrDBNUR7Qm7U2buN35IK
 /j2FpFn7WxRaImQcpOHnmflNji/M7lOlY3NLeuRi3/29Rsa2UY2eSSblwnn77Gs1MlnAnYud7WICW
 x9kZF2/Q7mo+kE4EGJ35kXGrL+n6AWFqNmVUcJOgNOjdF6MQ07N2r1OtEIhUG0F8W5Q8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fJYhJype+zoc1Cg4v/mN1u4O1TGNETK/ZGeLtIXGOgo=; b=PXthkhGMisuPeZ5ZlUq3RyUSlO
 fzaERypD5sPKbJ8+fw1rjnDQpPQUQnOaJdPEq+Z+Ki9ZZ+DJb6w01dvwvp60iRcosE+D2wL3vW/2C
 5io4b6HtSWUiiMcLkccRCMozLiPXN7AGHTwUCwkoFOUqYSXO2RprLuGPpyr8xZXk8xQM=;
Received: from smtp153-171.sina.com.cn ([61.135.153.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0XAI-0001fI-92 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 03:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1773287810; bh=fJYhJype+zoc1Cg4v/mN1u4O1TGNETK/ZGeLtIXGOgo=;
 h=Message-ID:Date:Subject:From;
 b=LQcKrN/rYKhzaBDWZ7HCZG/xJA81u3XV06puoe6JlUsf8VkSBAjiP2Wj9CvkBtrfi
 ETJWiQu0AlgA56tIumINzUu3MDIDq8G27Rlw0L0OWVRbo8xqJN01Le6xQQjdbYrNA+
 Uuf0/vmo7vE8ehbXUNnoerHzo4q0hWonqKN1Kr0k=
X-SMAIL-HELO: [10.189.138.37]
Received: from unknown (HELO [10.189.138.37])([114.247.175.249])
 by sina.com (10.54.253.34) with ESMTP
 id 69B2397600002F35; Thu, 12 Mar 2026 11:56:40 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 4708616292110
X-SMAIL-UIID: AA9EC96E02A24534A0FE56D8F18B89A0-20260312-115640-1
Message-ID: <c7bdf38f-4cf5-490b-8e0f-35f4574f4b81@sina.com>
Date: Thu, 12 Mar 2026 11:56:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260216112737.67408-1-monty_pavel@sina.com>
 <f331751b-08ad-42d2-ad23-37d21e1364f8@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <f331751b-08ad-42d2-ad23-37d21e1364f8@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/12/26 08:49, Chao Yu via Linux-f2fs-devel wrote: > On
 2026/2/16 19:27, Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> Neither
 F2FS nor VFS invalidates the block device page cache, which >> [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [61.135.153.171 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1w0XAI-0001fI-92
Subject: Re: [f2fs-dev] [PATCH] f2fs: invalidate block device page cache on
 umount
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 1954226CE7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ck9uIDMvMTIvMjYgMDg6NDksIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4g
T24gMjAyNi8yLzE2IDE5OjI3LCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+PiBGcm9tOiBZb25ncGVu
ZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4KPj4gTmVpdGhlciBGMkZTIG5vciBW
RlMgaW52YWxpZGF0ZXMgdGhlIGJsb2NrIGRldmljZSBwYWdlIGNhY2hlLCB3aGljaAo+PiByZXN1
bHRzIGluIHJlYWRpbmcgc3RhbGUgbWV0YWRhdGEuIEFuIGV4YW1wbGUgc2NlbmFyaW8gaXMgc2hv
d24gYmVsb3c6Cj4+Cj4+IFRlcm1pbmFsIEHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFRlcm1pbmFsIEIKPj4gbW91bnQgL2Rldi92ZGIgL21udC9mMmZzCj4+IHRvdWNoIG14IC8v
IGlubyA9IDQKPj4gc3luYwo+PiBkdW1wLmYyZnMgLWkgNCAvZGV2L3ZkYi8vIGJsb2NrIG9uICJb
WS9OXSIKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdG91Y2ggbXgyIC8vIGlubyA9IDUKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3luYwo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bW91bnQgL21udC9mMmZz
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGR1bXAuZjJmcyAtaSA1IC9kZXYvdmRiIC8vIGJsb2NrIGFkZHIgaXMgMAo+Pgo+PiBBZnRl
ciB1bW91bnQsIHRoZSBibG9jayBkZXZpY2UgcGFnZSBjYWNoZSBpcyBub3QgcHVyZ2VkLCBjYXVz
aW5nCj4+IGBkdW1wLmYyZnMgLWkgNSAvZGV2L3ZkYmAgdG8gcmVhZCBzdGFsZSBtZXRhZGF0YSBh
bmQgc2VlIGlub2RlIDUgd2l0aAo+PiBibG9jayBhZGRyZXNzIDAuCj4+Cj4+IFRoaXMgcGF0Y2gg
Y2FsbHMgaW52YWxpZGF0ZV9iZGV2IGR1cmluZyB1bW91bnQgdG8gaW52YWxpZGF0ZSB0aGUgYmxv
Y2sKPj4gZGV2aWNlIHBhZ2UgY2FjaGUsIHByZXZlbnRpbmcgc3RhbGUgbWV0YWRhdGEgZnJvbSBi
ZWluZyByZWFkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBZb25ncGVuZyBZYW5nIDx5YW5neW9uZ3Bl
bmdAeGlhb21pLmNvbT4KPj4gLS0tCj4+IMKgIGZzL2YyZnMvc3VwZXIuYyB8IDYgKysrKysrCj4+
IMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIuYwo+PiBpbmRleCAxYTc1NTk5N2FmZjUuLjM5
ZDNiNTJjZWFjMSAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9zdXBlci5jCj4+ICsrKyBiL2ZzL2Yy
ZnMvc3VwZXIuYwo+PiBAQCAtMjA5MSw2ICsyMDkxLDEyIEBAIHN0YXRpYyB2b2lkIGYyZnNfcHV0
X3N1cGVyKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IpCj4+IMKgICNpZiBJU19FTkFCTEVEKENPTkZJ
R19VTklDT0RFKQo+PiDCoMKgwqDCoMKgIHV0ZjhfdW5sb2FkKHNiLT5zX2VuY29kaW5nKTsKPj4g
wqAgI2VuZGlmCj4+ICvCoMKgwqAgc3luY19ibG9ja2RldihzYi0+c19iZGV2KTsKPiAKPiBXZSB3
aWxsIGNhbGwgc3luY19ibG9ja2RldiBpbiBiZWxvdyBwYXRoPwo+IAo+IC0ga2lsbF9mMmZzX3N1
cGVyCj4gwqAtIGtpbGxfYmxvY2tfc3VwZXIKPiDCoCAtIGdlbmVyaWNfc2h1dGRvd25fc3VwZXIK
PiDCoMKgIC0gcHV0X3N1cGVyCj4gwqAgLSBzeW5jX2Jsb2NrZGV2Cj4gCj4gMTcyMSB2b2lkIGtp
bGxfYmxvY2tfc3VwZXIoc3RydWN0IHN1cGVyX2Jsb2NrICpzYikKPiAxNzIyIHsKPiAxNzIzwqDC
oMKgwqDCoMKgwqDCoCBzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2ID0gc2ItPnNfYmRldjsKPiAx
NzI0Cj4gMTcyNcKgwqDCoMKgwqDCoMKgwqAgZ2VuZXJpY19zaHV0ZG93bl9zdXBlcihzYik7Cj4g
MTcyNsKgwqDCoMKgwqDCoMKgwqAgaWYgKGJkZXYpIHsKPiAxNzI3wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3luY19ibG9ja2RldihiZGV2KTsKPiAxNzI4wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYmRldl9mcHV0KHNiLT5zX2JkZXZfZmlsZSk7Cj4gMTcyOcKgwqDC
oMKgwqDCoMKgwqAgfQo+IDE3MzAgfQo+IAo+PiArwqDCoMKgIGludmFsaWRhdGVfYmRldihzYi0+
c19iZGV2KTsKClRoaXMgd29ya3MgZm9yIGFuIGYyZnMgaW5zdGFuY2UgbW91bnRlZCBvbiBhIHNp
bmdsZSBkZXZpY2UsIGJ1dCBpdCBkb2VzCm5vdCB3b3JrIGZvciBtdWx0aS1kZXZpY2UgY29uZmln
dXJhdGlvbnMsIGJlY2F1c2UgdGhlIHZmcyBjYW5ub3QgYmUKYXdhcmUgb2YgRkRFVigxKS4KCj4g
Cj4gSSBndWVzcyB3ZSBjYW4gbGVhdmUgdGhlIGRldmljZSB3LyB1cHRvZGF0ZSBjYWNoZSwgaW4g
Y2FzZSBpZiB0aGVyZSBhcmUKPiBtdWx0aXBsZSB1c2VyIG9uIHRoZSBkZXZpY2U/CgpUaGUgcGFn
ZSBjYWNoZSBvZiB0aGUgYmxvY2sgZGV2aWNlIGZpbGUgbWF5IGNvbnRhaW4gZGF0YSB0aGF0IGlz
IG5vdAp1cHRvZGF0ZS4gRm9yIGV4YW1wbGUsIGRhdGEgbWF5IGZpcnN0IGJlIHJlYWQgZGlyZWN0
bHkgdGhyb3VnaCB0aGUgYmxvY2sKZGV2aWNlIGZpbGUsIGFuZCB0aGVuIHRoZSBzYW1lIGJsb2Nr
cyBtYXkgYmUgd3JpdHRlbiB0aHJvdWdoIGYyZnMuIFNpbmNlCmYyZnMgd3JpdGVzIHRvIHRoZSBi
bG9jayBkZXZpY2UgdmlhIHRoZSBzdWJtaXRfYmlvIHBhdGgsIGl0IGRvZXMgbm90CnVwZGF0ZSB0
aGUgcGFnZSBjYWNoZSBvZiB0aGUgYmxvY2sgZGV2aWNlIGZpbGUuIEFzIGEgcmVzdWx0LCB0aGUg
ZGF0YSBpbgp0aGUgYmxvY2sgZGV2aWNlIGZpbGXigJlzIHBhZ2UgY2FjaGUgbWF5IGJlY29tZSBz
dGFsZS4gVGhlcmVmb3JlLCB0aGUgcGFnZQpjYWNoZSBtdXN0IGJlIGludmFsaWRhdGVkIGR1cmlu
ZyB1bm1vdW50LgoKVGhhbmtzCllvbmdwZW5nLAoKPiAKPiBUaGFua3MsCj4gCj4+ICvCoMKgwqAg
Zm9yIChpID0gMTsgaSA8IHNiaS0+c19uZGV2czsgaSsrKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBz
eW5jX2Jsb2NrZGV2KEZERVYoaSkuYmRldik7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpbnZhbGlkYXRl
X2JkZXYoRkRFVihpKS5iZGV2KTsKPj4gK8KgwqDCoCB9Cj4+IMKgIH0KPj4gwqAgwqAgaW50IGYy
ZnNfc3luY19mcyhzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBpbnQgc3luYykKPiAKPiAKPiAKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
