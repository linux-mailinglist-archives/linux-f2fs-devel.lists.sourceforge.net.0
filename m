Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBsTFvlfumnFUgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 09:19:05 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2669E2B7C29
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 09:19:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1emg2E0l3K8CO4h9b34C2eA4g7dlXvuF5qkFPeeaqlA=; b=ZfquakArE6FRq2RwO9dDJrZ6Z5
	CZCla4fZO4KGE2ECgz4lmTRThKUekTvB0WVun1mSY5tNLpJOi5h3VU0mkzDmOw5KTLHOFsf6DjcDS
	cE/IIrY2KL9A9aAKPKZU7atkr3WLZqAlq6WLv7uw3zDXIoYv5ff3DQPNdCW8cAMAVZhM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w2m7H-0002sN-3Q;
	Wed, 18 Mar 2026 08:18:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1w2m7E-0002sF-Qp
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 08:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wA0MrQMmCKZY85hmlXh57xD9+LQi1OBZX3kSi4qX3Uk=; b=cx9WQzTuRQojU8LM/TRFwHGhlH
 176W5U6ctt9MtOiyken1hk3wlpYa9z2f36+Hv9WK8Qd/kNo52el1AXhWV74mMod+vOt3fF0p0dZzU
 a71odWtDTU7Kf04e0Xltpe40/jrgTjPCFGzkjSDJl1SQEuwhT60qXZ67acPUkTTREJQ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wA0MrQMmCKZY85hmlXh57xD9+LQi1OBZX3kSi4qX3Uk=; b=ANgdgPJV8Bwl7u20ejJs2KWBSp
 k31wW4KsQZIRxTvsxGzLNwW9dhKOvqX0GFMZmgcc8ExmPMqbhcXb14nzpgNIonskWdRAD77ybvD9j
 kDQWYEct0N9PvDRGJCuE0v1UqDkSvd3bFMX+p3W5tPFyGx9dJrMllqURewn3+MBJx5qM=;
Received: from mail115-171.sinamail.sina.com.cn ([218.30.115.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w2m7C-0008Sm-Ph for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 08:18:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1773821935; bh=wA0MrQMmCKZY85hmlXh57xD9+LQi1OBZX3kSi4qX3Uk=;
 h=Message-ID:Date:Subject:From;
 b=TDInL54Poe3DjoJ1rcQ4ZFvY+BhVzW6gPaBz/H14uGQa/H6zM/gSOzt2PmEpaR4te
 Dyegn6Pf+qyPSYsKeQz/989Rd/9ZPk69cUn/SAlAmdsQLjZY1ICFSq492HkBDB8qi5
 2UjLVziPMtUr/9dSv5E8+cDmyd+2b4chSPkMyb/Y=
X-SMAIL-HELO: [10.220.25.2]
Received: from unknown (HELO [10.220.25.2])([1.202.162.3])
 by sina.com (10.185.250.24) with ESMTP
 id 69BA5C4E00000F14; Wed, 18 Mar 2026 16:03:34 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 20619010747994
X-SMAIL-UIID: 99BBF06F48B649FB9E2B189A0D1D4567-20260318-160334-1
Message-ID: <2eb8f8f4-2b1a-4ada-ba82-63fdf8b3cb1a@sina.com>
Date: Wed, 18 Mar 2026 16:03:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Yongpeng Yang <monty_pavel@sina.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260317115459.208306-2-monty_pavel@sina.com>
 <b8bef1a9-b930-4a73-ae71-73323137c50e@kernel.org>
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <b8bef1a9-b930-4a73-ae71-73323137c50e@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/18/2026 12:15 PM, Chao Yu via Linux-f2fs-devel wrote:
 > On 2026/3/17 19:54, Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> This
 patch refactor the f2fs_move_node_folio() function. No logical [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: sina.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1w2m7C-0008Sm-Ph
Subject: Re: [f2fs-dev] [PATCH v4 1/4] f2fs: refactor f2fs_move_node_folio
 function
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,xiaomi.com:email,sina.com:mid]
X-Rspamd-Queue-Id: 2669E2B7C29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMy8xOC8yMDI2IDEyOjE1IFBNLCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3Rl
Ogo+IE9uIDIwMjYvMy8xNyAxOTo1NCwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPj4gRnJvbTogWW9u
Z3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+Cj4+IFRoaXMgcGF0Y2ggcmVm
YWN0b3IgdGhlIGYyZnNfbW92ZV9ub2RlX2ZvbGlvKCkgZnVuY3Rpb24uIE5vIGxvZ2ljYWwKPj4g
Y2hhbmdlcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5n
QHhpYW9taS5jb20+Cj4+IC0tLQo+PiDCoCBmcy9mMmZzL2YyZnMuaCB8wqAgMiArKwo+PiDCoCBm
cy9mMmZzL25vZGUuYyB8IDU0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMjIg
ZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMv
ZjJmcy5oCj4+IGluZGV4IDY2MGJmODhhMzc2Zi4uYWZiNGQxMDE0MmRkIDEwMDY0NAo+PiAtLS0g
YS9mcy9mMmZzL2YyZnMuaAo+PiArKysgYi9mcy9mMmZzL2YyZnMuaAo+PiBAQCAtMzk1MCw2ICsz
OTUwLDggQEAgaW50IGYyZnNfc2FuaXR5X2NoZWNrX25vZGVfZm9vdGVyKHN0cnVjdCAKPj4gZjJm
c19zYl9pbmZvICpzYmksCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBlbnVtIG5vZGVfdHlwZSBudHlwZSwgYm9vbCBpbl9pcnEpOwo+PiDCoCBzdHJ1Y3QgZm9s
aW8gKmYyZnNfZ2V0X2lub2RlX2ZvbGlvKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgcGdvZmZf
dCAKPj4gaW5vKTsKPj4gwqAgc3RydWN0IGZvbGlvICpmMmZzX2dldF94bm9kZV9mb2xpbyhzdHJ1
Y3QgZjJmc19zYl9pbmZvICpzYmksIHBnb2ZmX3QgCj4+IHhuaWQpOwo+PiAraW50IGYyZnNfd3Jp
dGVfc2luZ2xlX25vZGVfZm9saW8oc3RydWN0IGZvbGlvICpub2RlX2ZvbGlvLCBpbnQgCj4+IHN5
bmNfbW9kZSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm9vbCBtYXJrX2RpcnR5LCBlbnVt
IGlvc3RhdF90eXBlIGlvX3R5cGUpOwo+PiDCoCBpbnQgZjJmc19tb3ZlX25vZGVfZm9saW8oc3Ry
dWN0IGZvbGlvICpub2RlX2ZvbGlvLCBpbnQgZ2NfdHlwZSk7Cj4+IMKgIHZvaWQgZjJmc19mbHVz
aF9pbmxpbmVfZGF0YShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpOwo+PiDCoCBpbnQgZjJmc19m
c3luY19ub2RlX3BhZ2VzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGlub2RlIAo+
PiAqaW5vZGUsCj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL25vZGUuYyBiL2ZzL2YyZnMvbm9kZS5j
Cj4+IGluZGV4IDE3ZWFiMDFhZThmOS4uMmU3NGQyODgyYjZmIDEwMDY0NAo+PiAtLS0gYS9mcy9m
MmZzL25vZGUuYwo+PiArKysgYi9mcy9mMmZzL25vZGUuYwo+PiBAQCAtMTg0NSw0MSArMTg0NSw1
MSBAQCBzdGF0aWMgYm9vbCBfX3dyaXRlX25vZGVfZm9saW8oc3RydWN0IGZvbGlvIAo+PiAqZm9s
aW8sIGJvb2wgYXRvbWljLCBib29sICpzdWJtaXR0ZWQKPj4gwqDCoMKgwqDCoCByZXR1cm4gZmFs
c2U7Cj4+IMKgIH0KPj4gLWludCBmMmZzX21vdmVfbm9kZV9mb2xpbyhzdHJ1Y3QgZm9saW8gKm5v
ZGVfZm9saW8sIGludCBnY190eXBlKQo+PiAraW50IGYyZnNfd3JpdGVfc2luZ2xlX25vZGVfZm9s
aW8oc3RydWN0IGZvbGlvICpub2RlX2ZvbGlvLCBpbnQgCj4+IHN5bmNfbW9kZSwKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYm9vbCBtYXJrX2RpcnR5LCBlbnVtIGlvc3RhdF90eXBlIGlvX3R5
cGUpCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCBpbnQgZXJyID0gMDsKPj4gK8KgwqDCoCBzdHJ1Y3Qg
d3JpdGViYWNrX2NvbnRyb2wgd2JjID0gewo+PiArwqDCoMKgwqDCoMKgwqAgLnN5bmNfbW9kZSA9
IFdCX1NZTkNfQUxMLAo+PiArwqDCoMKgwqDCoMKgwqAgLm5yX3RvX3dyaXRlID0gMSwKPj4gK8Kg
wqDCoCB9Owo+PiAtwqDCoMKgIGlmIChnY190eXBlID09IEZHX0dDKSB7Cj4+IC3CoMKgwqDCoMKg
wqDCoCBzdHJ1Y3Qgd3JpdGViYWNrX2NvbnRyb2wgd2JjID0gewo+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAuc3luY19tb2RlID0gV0JfU1lOQ19BTEwsCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC5ucl90b193cml0ZSA9IDEsCj4+IC3CoMKgwqDCoMKgwqDCoCB9Owo+PiArwqDCoMKgIGlm
ICghc3luY19tb2RlKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCAvKiBzZXQgcGFnZSBkaXJ0eSBhbmQg
d3JpdGUgaXQgKi8KPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChtYXJrX2RpcnR5ICYmICFmb2xpb190
ZXN0X3dyaXRlYmFjayhub2RlX2ZvbGlvKSkKPiAKPiBJZiBtYXJrX2RpcnR5IGluIHRoaXMgY2hl
Y2sgY29uZGl0aW9uIGlzIGFsd2F5cyB0cnVlLCB3ZSBjYW4gcmVtb3ZlZCBpdD8KCk9LLCBJJ2xs
IHJlbW92ZSBpdCBpbiB2NSBwYXRjaC4KClRoYW5rcwpZb25ncGVuZywKCj4gCj4gVGhhbmtzLAo+
IAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb2xpb19tYXJrX2RpcnR5KG5vZGVfZm9saW8p
Owo+PiArwqDCoMKgwqDCoMKgwqAgZ290byBvdXRfZm9saW87Cj4+ICvCoMKgwqAgfQo+PiAtwqDC
oMKgwqDCoMKgwqAgZjJmc19mb2xpb193YWl0X3dyaXRlYmFjayhub2RlX2ZvbGlvLCBOT0RFLCB0
cnVlLCB0cnVlKTsKPj4gK8KgwqDCoCBmMmZzX2ZvbGlvX3dhaXRfd3JpdGViYWNrKG5vZGVfZm9s
aW8sIE5PREUsIHRydWUsIHRydWUpOwo+PiArwqDCoMKgIGlmIChtYXJrX2RpcnR5KQo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgZm9saW9fbWFya19kaXJ0eShub2RlX2ZvbGlvKTsKPj4gK8KgwqDCoCBl
bHNlIGlmICghZm9saW9fdGVzdF9kaXJ0eShub2RlX2ZvbGlvKSkKPj4gK8KgwqDCoMKgwqDCoMKg
IGdvdG8gb3V0X2ZvbGlvOwo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKCFmb2xpb19jbGVhcl9kaXJ0
eV9mb3JfaW8obm9kZV9mb2xpbykpIHsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXJyID0g
LUVBR0FJTjsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXRfcGFnZTsKPj4gLcKg
wqDCoMKgwqDCoMKgIH0KPj4gLQo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKCFfX3dyaXRlX25vZGVf
Zm9saW8obm9kZV9mb2xpbywgZmFsc2UsIE5VTEwsCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAmd2JjLCBmYWxzZSwgRlNfR0NfTk9ERV9JTywgTlVMTCkpCj4+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVyciA9IC1FQUdBSU47Cj4+IC3CoMKgwqDCoMKgwqDCoCBn
b3RvIHJlbGVhc2VfcGFnZTsKPj4gLcKgwqDCoCB9IGVsc2Ugewo+PiAtwqDCoMKgwqDCoMKgwqAg
Lyogc2V0IHBhZ2UgZGlydHkgYW5kIHdyaXRlIGl0ICovCj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAo
IWZvbGlvX3Rlc3Rfd3JpdGViYWNrKG5vZGVfZm9saW8pKQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBmb2xpb19tYXJrX2RpcnR5KG5vZGVfZm9saW8pOwo+PiArwqDCoMKgIGlmICghZm9saW9f
Y2xlYXJfZGlydHlfZm9yX2lvKG5vZGVfZm9saW8pKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBlcnIg
PSAtRUFHQUlOOwo+PiArwqDCoMKgwqDCoMKgwqAgZ290byBvdXRfZm9saW87Cj4+IMKgwqDCoMKg
wqAgfQo+PiAtb3V0X3BhZ2U6Cj4+ICsKPj4gK8KgwqDCoCBpZiAoIV9fd3JpdGVfbm9kZV9mb2xp
byhub2RlX2ZvbGlvLCBmYWxzZSwgTlVMTCwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAmd2JjLCBmYWxzZSwgRlNfR0NfTk9ERV9JTywgTlVMTCkpCj4+ICvCoMKgwqDCoMKgwqDC
oCBlcnIgPSAtRUFHQUlOOwo+PiArwqDCoMKgIGdvdG8gcmVsZWFzZV9mb2xpbzsKPj4gK291dF9m
b2xpbzoKPj4gwqDCoMKgwqDCoCBmb2xpb191bmxvY2sobm9kZV9mb2xpbyk7Cj4+IC1yZWxlYXNl
X3BhZ2U6Cj4+ICtyZWxlYXNlX2ZvbGlvOgo+PiDCoMKgwqDCoMKgIGYyZnNfZm9saW9fcHV0KG5v
ZGVfZm9saW8sIGZhbHNlKTsKPj4gwqDCoMKgwqDCoCByZXR1cm4gZXJyOwo+PiDCoCB9Cj4+ICtp
bnQgZjJmc19tb3ZlX25vZGVfZm9saW8oc3RydWN0IGZvbGlvICpub2RlX2ZvbGlvLCBpbnQgZ2Nf
dHlwZSkKPj4gK3sKPj4gK8KgwqDCoCByZXR1cm4gZjJmc193cml0ZV9zaW5nbGVfbm9kZV9mb2xp
byhub2RlX2ZvbGlvLCBnY190eXBlID09IEZHX0dDLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB0cnVlLCBGU19HQ19OT0RFX0lPKTsKPj4gK30KPj4gKwo+PiDCoCBpbnQgZjJmc19mc3luY19u
b2RlX3BhZ2VzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGlub2RlIAo+PiAqaW5v
ZGUsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB3cml0ZWJhY2tfY29udHJv
bCAqd2JjLCBib29sIGF0b21pYywKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWdu
ZWQgaW50ICpzZXFfaWQpCj4gCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
