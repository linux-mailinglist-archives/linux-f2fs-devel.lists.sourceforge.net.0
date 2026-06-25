Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J/dkIyXYPGrctAgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jun 2026 09:26:29 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBEF6C358E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jun 2026 09:26:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=Y9FvtDyA;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Xi1szhjv;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="V/SaKl8o";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=T75FwUed;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPp5qDTcH8EEwrJncxVsFDqI0IBQCbRjgIdDlI864+s=; b=Y9FvtDyAuVr05k4J5PyWzwwnWE
	sMM5dXba9p9JZLH++qcRCQ/mkiGY0b9md6ng6Q64hU/yPPiRUi1fkcMLKWcfDa0/cJg048aIeUbj/
	1lb8TYyVjZpolWpQM+wj3CGYKJ0Lgiyg6aknFMuC6uKuigMBlEx3eaRDQYsxoKOmREkw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wceTb-000590-Ck;
	Thu, 25 Jun 2026 07:26:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wceTI-00058j-NM
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jun 2026 07:26:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mAbkPxzwW01l9RyDkFc31J9ru2avbWmYZFSniIobtVM=; b=Xi1szhjve1U9vHPo/ppc3jXda+
 gRBxgdCeuVJzu9SCMnMrr07obdNxGZ4MSiD6qVVfhk08+/XkYSmH9HCf0pgAH7N6199CrGjOa6WI7
 MrsYsOzZL0d/O71+OnokPwyIPi8I4hKUpdc6zspnCkOn5FpAvI52Iiz1C9JKsGFfXo8E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mAbkPxzwW01l9RyDkFc31J9ru2avbWmYZFSniIobtVM=; b=V/SaKl8oRN3M6I0ewwmdwb7MDA
 axWJtBVdxfkF+aWZGZbJIL2TiVoidHsPtXVGGp1TlJy8vWHbcoSBgO9TWH0T6OlxgvctrloFSvkZJ
 4s/mm4KvLS8AasMJpcOV666KgMzYlLEk0puEI+GTE6IL7gmdWVomUr5x6zk2QPfKCd/0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wceTH-0004iP-DI for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jun 2026 07:26:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1277060219;
 Thu, 25 Jun 2026 07:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11101F000E9;
 Thu, 25 Jun 2026 07:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782372353;
 bh=mAbkPxzwW01l9RyDkFc31J9ru2avbWmYZFSniIobtVM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=T75FwUedxi6UVLVezvA0uubdT76T7/nkqywbRwfsUTGEcXaQVdO76ZsgFqj3Rnoqk
 o5OS2wsLx8oQa411hMESc8ePcuIFH/96q7GSVz5C3FRaPdx55FOX6NGrYdKpuGQF9e
 WSfjZ777LYuVTz+5roJ/K0macuhjsQH2wsGOMoBPLHcwHXvfmYtpYUpK7ak5cbha+2
 8OV3AU2/d70ENbPfQ7tmCszpUY6sTqB5GQBRfjAicpQ7bdBTLG4HtFp2JxXBxvaRN0
 frm1/3GZXJ1cGqqUdQGc1iuclze3jfcVNFkGNFj93bJHdxREda3fFLYVZ3NPx/44fk
 DVJooOtKCyd/g==
Message-ID: <cfcc27d8-8071-412b-abf9-0c804305a195@kernel.org>
Date: Thu, 25 Jun 2026 15:25:50 +0800
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
 <d74fd6f1-9c92-4810-9549-e8066ec9d807@kernel.org>
 <SEZPR02MB5662929A720F09F0ABFD3DD499EE2@SEZPR02MB5662.apcprd02.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <SEZPR02MB5662929A720F09F0ABFD3DD499EE2@SEZPR02MB5662.apcprd02.prod.outlook.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/23/26 17:29, Yongpeng Yang wrote: > > On 6/22/26 08:42, 
 Chao Yu via Linux-f2fs-devel wrote: >> On 6/21/26 23:48, Yongpeng Yang wrote:
 >>> On 6/20/26 11:31 AM, Chao Yu via Linux-f2fs-devel wrote: [...] 
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
X-Headers-End: 1wceTH-0004iP-DI
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
X-Rspamd-Queue-Id: BBBEF6C358E

T24gNi8yMy8yNiAxNzoyOSwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPiAKPiBPbiA2LzIyLzI2IDA4
OjQyLCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+PiBPbiA2LzIxLzI2IDIz
OjQ4LCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4gT24gNi8yMC8yNiAxMTozMSBBTSwgQ2hhbyBZ
dSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4+PiBPbiA2LzE5LzI2IDIyOjM0LCBZb25n
cGVuZyBZYW5nIHdyb3RlOgo+Pj4+Pgo+Pj4+PiBPbiA2LzE1LzI2IDc6NTUgUE0sIENoYW8gWXUg
dmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+Pj4+PiBPbiA2LzEyLzI2IDE5OjU4LCBZb25n
cGVuZyBZYW5nIHdyb3RlOgo+Pj4+Pj4+IEZyb206IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25ncGVu
Z0B4aWFvbWkuY29tPgo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhlIGxhcmdlc3QgZXh0ZW50IHRha2VzIGVm
ZmVjdCBkdXJpbmcgYm90aCByZWFkIG1hcHBpbmcgYW5kIHdyaXRlCj4+Pj4+Pj4gbWFwcGluZyBs
b29rdXBzLCB3aGlsZSByZWFkIG1hcHBpbmcgZG9lcyBub3QgbmVlZCB0byBhY2Nlc3MgdGhlCj4+
Pj4+Pj4gZXh0ZW50X25vZGUuIEZvciB3cml0ZSBtYXBwaW5nLCB0aGUgY2FzZSB3aGVyZSB0aGUg
bGFyZ2VzdCBleHRlbnQgaXMKPj4+Pj4+PiBub3QgaW4gdGhlIGV4dGVudCB0cmVlIGNhbiBhbHJl
YWR5IGJlIGhhbmRsZWQgYnkgdGhlIG1lcmdlIGxvZ2ljLCBhbmQKPj4+Pj4+PiBjYXNlcyB0aGF0
IGNhbm5vdCBiZSBtZXJnZWQgZG8gbm90IHJlcXVpcmUgdGhlIGxhcmdlc3QgZXh0ZW50IHRvCj4+
Pj4+Pj4gcGFydGljaXBhdGUgZWl0aGVyLgo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhlcmVmb3JlLCB0aGUg
bGFyZ2VzdCBleHRlbnQgZG9lcyBub3QgbmVlZCB0byBpbml0aWFsaXplIGEKPj4+Pj4+PiBjb3Jy
ZXNwb25kaW5nIGV4dGVudF9ub2RlLCByZWR1Y2luZyBtZW1vcnkgZm9vdHByaW50Lgo+Pj4+Pj4+
Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9t
aS5jb20+Cj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4gwqAgZnMvZjJmcy9leHRlbnRfY2FjaGUuYyB8IDE4
ICstLS0tLS0tLS0tLS0tLS0tLQo+Pj4+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMTcgZGVsZXRpb25zKC0pCj4+Pj4+Pj4KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9leHRlbnRfY2FjaGUuYyBiL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPj4+Pj4+PiBpbmRleCBh
YTM2OGEwMWIwMzUuLmY4ZDk0ZGI2MGRjNiAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9mcy9mMmZzL2V4
dGVudF9jYWNoZS5jCj4+Pj4+Pj4gKysrIGIvZnMvZjJmcy9leHRlbnRfY2FjaGUuYwo+Pj4+Pj4+
IEBAIC00MTAsMTAgKzQxMCw4IEBAIHN0YXRpYyB2b2lkIF9fZHJvcF9sYXJnZXN0X2V4dGVudChz
dHJ1Y3QKPj4+Pj4+PiBleHRlbnRfdHJlZSAqZXQsCj4+Pj4+Pj4gwqAgdm9pZCBmMmZzX2luaXRf
cmVhZF9leHRlbnRfdHJlZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QKPj4+Pj4+PiBmb2xp
byAqaWZvbGlvKQo+Pj4+Pj4+IMKgIHsKPj4+Pj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSA9IEYyRlNfSV9TQihpbm9kZSk7Cj4+Pj4+Pj4gLcKgwqDCoCBzdHJ1Y3QgZXh0
ZW50X3RyZWVfaW5mbyAqZXRpID0gJnNiaS0+ZXh0ZW50X3RyZWVbRVhfUkVBRF07Cj4+Pj4+Pj4g
wqDCoMKgwqDCoCBzdHJ1Y3QgZjJmc19leHRlbnQgKmlfZXh0ID0gJkYyRlNfSU5PREUoaWZvbGlv
KS0+aV9leHQ7Cj4+Pj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZXh0ZW50X3RyZWUgKmV0Owo+Pj4+
Pj4+IC3CoMKgwqAgc3RydWN0IGV4dGVudF9ub2RlICplbjsKPj4+Pj4+PiDCoMKgwqDCoMKgIHN0
cnVjdCBleHRlbnRfaW5mbyBlaSA9IHswfTsKPj4+Pj4+PiDCoMKgwqDCoMKgIGlmICghX19tYXlf
ZXh0ZW50X3RyZWUoaW5vZGUsIEVYX1JFQUQpKSB7Cj4+Pj4+Pj4gQEAgLTQzNSwyMSArNDMzLDcg
QEAgdm9pZCBmMmZzX2luaXRfcmVhZF9leHRlbnRfdHJlZShzdHJ1Y3QgaW5vZGUKPj4+Pj4+PiAq
aW5vZGUsIHN0cnVjdCBmb2xpbyAqaWZvbGlvKQo+Pj4+Pj4+IMKgwqDCoMKgwqAgaWYgKGF0b21p
Y19yZWFkKCZldC0+bm9kZV9jbnQpIHx8ICFlaS5sZW4pCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgIGdvdG8gc2tpcDsKPj4+Pj4+PiAtwqDCoMKgIGlmIChJU19ERVZJQ0VfQUxJQVNJTkcoaW5v
ZGUpKSB7Cj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGV0LT5sYXJnZXN0ID0gZWk7Cj4+Pj4+Pj4g
LcKgwqDCoMKgwqDCoMKgIGdvdG8gc2tpcDsKPj4+Pj4+PiAtwqDCoMKgIH0KPj4+Pj4+PiAtCj4+
Pj4+Pj4gLcKgwqDCoCBlbiA9IF9fYXR0YWNoX2V4dGVudF9ub2RlKHNiaSwgZXQsICZlaSwgTlVM
TCwKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZldC0+cm9vdC5yYl9y
b290LnJiX25vZGUsIHRydWUpOwo+Pj4+Pj4+IC3CoMKgwqAgaWYgKGVuKSB7Cj4+Pj4+Pj4gLcKg
wqDCoMKgwqDCoMKgIGV0LT5sYXJnZXN0ID0gZW4tPmVpOwo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDC
oCBldC0+Y2FjaGVkX2VuID0gZW47Cj4+Pj4+Pj4gLQo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBz
cGluX2xvY2soJmV0aS0+ZXh0ZW50X2xvY2spOwo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBsaXN0
X2FkZF90YWlsKCZlbi0+bGlzdCwgJmV0aS0+ZXh0ZW50X2xpc3QpOwo+Pj4+Pj4+IC3CoMKgwqDC
oMKgwqDCoCBzcGluX3VubG9jaygmZXRpLT5leHRlbnRfbG9jayk7Cj4+Pj4+Pj4gLcKgwqDCoCB9
Cj4+Pj4+Pj4gK8KgwqDCoCBldC0+bGFyZ2VzdCA9IGVpOwo+Pj4+Pj4KPj4+Pj4+IFByZXZpb3Vz
bHksIHdlIGNhbiBzcGxpdCBsYXJnZXN0IGV4dGVudCBub2RlIHRvIHR3byBpZiB3ZSBwdW5jaGVk
Cj4+Pj4+PiBpdCwgbm93Cj4+Pj4+PiB3ZSBjYW4gbm90PyBJSVVDLgo+Pj4+Pgo+Pj4+PiBQcmlv
ciB0byB0aGlzIGNoYW5nZSwgdGhlIGxhcmdlc3QgZXh0ZW50IGNvdWxkIGFsc28gYmUgc2hydW5r
LCBzbyB0aGUKPj4+Pj4gc2V0IG9mIHNjZW5hcmlvcyB0aGF0IG5lZWQgaGFuZGxpbmcgZHVyaW5n
IHB1bmNoIHJlbWFpbnMgaWRlbnRpY2FsCj4+Pj4+IGJlZm9yZSBhbmQgYWZ0ZXIgdGhlIG1vZGlm
aWNhdGlvbi4KPj4+Pj4KPj4+Pj4gRm9yIHRoZSBsYXJnZXN0IGV4dGVudCwgaXQgb25seSBuZWVk
cyB0byBndWFyYW50ZWUgdGhhdCB0aGUgbWFwcGluZwo+Pj4+PiBpbmZvcm1hdGlvbiBpdCByZWNv
cmRzIHN0YXlzIGNvbnNpc3RlbnQgd2l0aCB0aGUgbWFwcGluZ3MgdHJhY2tlZCBpbgo+Pj4+PiB0
aGUKPj4+Pj4gZXh0ZW50IHRyZWUgYW5kIG11bHRpLWxldmVsIGluZGlyZWN0IGluZGljZXMuIFRo
ZSBwdW5jaCBvcGVyYXRpb24gZG9lcwo+Pj4+PiBub3QgYnJlYWsgdGhpcyBjb25zaXN0ZW5jeS4g
TW9yZW92ZXIsIHRoZSBsYXJnZXN0IGV4dGVudCBpcyBub3QKPj4+Pj4gcmVxdWlyZWQKPj4+Pj4g
dG8gYmUgdGhlIGxvbmdlc3QgZXh0ZW50IGFtb25nIGFsbCBlbnRyaWVzIGluIHRoZSBleHRlbnQg
dHJlZS4gSXQKPj4+Pj4gbWVyZWx5Cj4+Pj4+IG5lZWRzIHRvIG1hdGNoIHRoZSBtYXBwaW5ncyBz
dG9yZWQgaW4gbXVsdGktbGV2ZWwgaW5kaXJlY3QgaW5kaWNlcyBhbmQKPj4+Pj4gYmUgbm8gc21h
bGxlciB0aGFuIHRoZSBtYXhpbXVtIGV4dGVudCBwcmVzZW50IGluIHRoZSBleHRlbnQgdHJlZS4K
Pj4+Pgo+Pj4+IFdoYXQgSSBtZWFudCBpczogZS5nLiBwcmV2aW91c2x5LCBpZiBsYXJnZXN0IGV4
dGVudCBpcyAxMDI0LCBwdW5jaGluZwo+Pj4+IGluIHRoZQo+Pj4+IG1pZGRsZSBvZiB0aGUgZXh0
ZW50IHdpbGwgbWFrZSBpdCBiZWluZyBzcGxpdCB0byB0d28gZXh0ZW50cyAoNTEyLAo+Pj4+IDUx
MSkgaW4KPj4+PiBfX3VwZGF0ZV9leHRlbnRfdHJlZV9yYW5nZSgpLgo+Pj4+Cj4+Pj4gSWYgd2Ug
ZG8gbm90IGFkZCBsYXJnZXN0IGV4dGVudCBub2RlIGludG8gcmIgdHJlZSBpbgo+Pj4+IGYyZnNf
aW5pdF9yZWFkX2V4dGVudF90cmVlKCksCj4+Pj4gdGhlbiB3ZSBtYXkgaGFzIG5vIGNoYW5jZSB0
byBrZWVwIHNtYWxsLXNpemVkKDUxMSkgZXh0ZW50IGluIGFib3ZlCj4+Pj4gcHVuY2ggc2NlbmFy
aW8sCj4+Pj4gY2FuIHlvdSB2ZXJpZnkgdGhhdD8KPj4+Cj4+PiBZZXMsIHRoZSA1MTEtYmxvY2sg
bWFwcGluZyB3aWxsIGJlIGRyb3BwZWQuIEkgY29uc2lkZXJlZCB0aGlzIGNhc2UKPj4+IGVhcmxp
ZXI6IHdoZW4gdGhlIG5ld2x5IGluc2VydGVkIG1hcHBpbmcgb3ZlcmxhcHMgd2l0aCBvciBhZGph
Y2VudAo+Pj4gd2l0aCB0aGUgbGFyZ2VzdCBleHRlbnQsIHdlIHJlaW5zZXJ0IHRoZSBsYXJnZXN0
IGV4dGVudCBiYWNrIGludG8gdGhlCj4+PiBleHRlbnQgdHJlZS4gV2l0aCB0aGlzIGxvZ2ljLCB0
aGUgNTExLWJsb2NrIHNwbGl0IGV4dGVudCB3aWxsIHJlbWFpbgo+Pj4gcHJlc2VudCBpbiB0aGUg
ZXh0ZW50IHRyZWUuIEluc3RlYWQgb2YgcGVyZm9ybWluZyBwdW5jaCBoYW5kbGluZyBvbgo+Pj4g
dGhlIGxhcmdlc3QgZXh0ZW50LCB3ZSBjYW4gc2ltcGx5IGRyb3AgaXQgZGlyZWN0bHkuCj4+PiBI
b3dldmVyLCB0aGlzIGFwcHJvYWNoIGRvZXMgbm90IHdvcmsgd2VsbCBmb3IgdXBkYXRlcyB0YXJn
ZXRpbmcgdGhlCj4+PiB0YWlsIG9mIHRoZSBvcmlnaW5hbCBleHRlbnQuIEZvciBpbnN0YW5jZSwg
cHVuY2ggMTAyNCBpbnRvIDEwMjIgYW5kIDEKPj4+IGZvciBvdmVyd3JpdGUgY2FzZSwgd2hpY2gg
d2lsbCBhbHNvIGFsbG9jIG9uZSBtb3JlIGV4dGVudF9ub2RlLgo+Pgo+PiBXZSB3aWxsIG9ubHkg
YWRkIGV4dGVudCB3aGljaCBoYXMgc2l6ZSA+PSBGMkZTX01JTl9FWFRFTlRfTEVOLCBzbyAxMDIy
Cj4+IHdpbGwgYmUgYWRkZWQsIGFuZCAxIHdpbGwgYmUgZHJvcHBlZC4KPiAKPiBPaCwgeWVzLCB0
aGlzIGV4YW1wbGUgaXMgbm90IGFwcHJvcHJpYXRlLiBEbyB5b3UgdGhpbmsgdGhpcyBhcHByb2Fj
aAoKU2luY2UgdGhlcmUgd2lsbCBiZSBwb3RlbnRpYWwgc2lkZS1lZmZlY3Qgdy8gY3VycmVudCBw
YXRjaCwgc28gSSBwcmVmZXIKdG8ga2VlcCBpdCBhcyBpdCBpcy4KClRoYW5rcywKCj4gd291bGQg
YmUgYmV0dGVyLCBvciBpcyBbUEFUQ0ggMS81XSBhbmQgW1BBVENIIDMvNV0gcHJlZmVyYWJsZT8K
PiAKPiBUaGFua3MKPiBZb25ncGVuZywKPiAKPj4KPj4gVGhhbmtzLAo+Pgo+Pj4KPj4+IFRoYW5r
cwo+Pj4gWW9uZ3BlbmcsCj4+Pgo+Pj4+Cj4+Pj4gVGhhbmtzLAo+Pj4+Cj4+Pj4+Cj4+Pj4+IFRo
YW5rcwo+Pj4+PiBZb25ncGVuZywKPj4+Pj4KPj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBUaGFua3MsCj4+
Pj4+Pgo+Pj4+Pj4+IMKgIHNraXA6Cj4+Pj4+Pj4gwqDCoMKgwqDCoCAvKiBMZXQncyBkcm9wLCBp
ZiBjaGVja3BvaW50IGdvdCBjb3JydXB0ZWQuICovCj4+Pj4+Pj4gwqDCoMKgwqDCoCBpZiAoZjJm
c19jcF9lcnJvcihzYmkpKSB7Cj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+Pj4gTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKPj4+Pj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cj4+Pj4+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCj4+Pj4+Cj4+Pj4KPj4+Pgo+Pj4+Cj4+Pj4gX19fX19fX19fX19f
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
