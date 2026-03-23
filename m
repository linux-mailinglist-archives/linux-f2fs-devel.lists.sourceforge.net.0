Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HjtM1gnwWmbRAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 12:43:20 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA422F15EE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 12:43:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDZuyyS2neqs4iis2rtHdgZ91+mw4iNjPRT15NRQH0Y=; b=aaC48/7w3kH41RPv9cqXMGPgUZ
	DA7vFrsbudS3Lmb4WjtQ74mgGljfpkuoVTwjnOKslrTSDyHCqjYY2cy5LqrxWCQVu0TKcEp5Qh13D
	eLxMbsJHHSod3ufZqOLXGaTl6aRZppATYMRRmpggMqCUVUdvkEZCQBEsH5tXp3tQF2ek=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4dgV-0006cR-8C;
	Mon, 23 Mar 2026 11:43:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1w4dgT-0006br-No
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 11:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MTuqdtoAMjBE7MOU08qfupCkEQohLjH51fQqcPzYtJg=; b=MvmdxazfaYyNCqRM3OLGdJKLKA
 3WOmhayy3HGx9IUcxDRZj4zYgYnzFZMAq/IF8plKG3do+2ycWDEJELuI6jsckWU03q9XgmhMLTHhO
 yMntVviECwu/CTI3m1Rg5SLOm2oMv8Kx4q+kpvNJLGHq2i6d3oanSZ8fwFpMxhLwwPyU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MTuqdtoAMjBE7MOU08qfupCkEQohLjH51fQqcPzYtJg=; b=kRIvP0avaGEvupoDpH/avFFtLm
 TbyYeoPyK2RS7Kq5QLu6Grz5XgImoA/lclFrZVPskrBVSB7fiOiQ0hDFFvfeVE9dVa/nrGg68ERfX
 OepqnUQGWjE54PbSKEBWRTlas+Hot8Zxt446fjyQ6pqocDeExEpTIBeYrOiLpB3eMVqI=;
Received: from r3-21.sinamail.sina.com.cn ([202.108.3.21])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w4dgR-0002D9-Oc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 11:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1774266179; bh=MTuqdtoAMjBE7MOU08qfupCkEQohLjH51fQqcPzYtJg=;
 h=Message-ID:Date:Subject:From;
 b=p2aVm52hkIWNg11HxKZzCtLjOZmPTLX+/CroBNQPWIFOCcFiYN94wCmkKRyRJrCn1
 vScvqBNmdd+i7CbEHB9W/d9JKnxtC95wq9Mn5+ujEwoma2S1tKeRkOWmH4DWMZPO/a
 CfNW6/cH6IT0Y8n8qIbG6gR1LppwPB5HkFhNsRO4=
X-SMAIL-HELO: [10.189.138.37]
Received: from unknown (HELO [10.189.138.37])([114.247.175.249])
 by sina.com (10.54.253.33) with ESMTP
 id 69C1273600000BD5; Mon, 23 Mar 2026 19:42:48 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 6038616685142
X-SMAIL-UIID: 64D6143C0252449289EC3C146BD7C660-20260323-194248-1
Message-ID: <af08c73c-09f4-4875-9688-062df7c9e74e@sina.com>
Date: Mon, 23 Mar 2026 19:42:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260319132607.686096-2-monty_pavel@sina.com>
 <20260319132607.686096-4-monty_pavel@sina.com>
 <03e452c8-b68e-4132-a5d2-aa1300673231@kernel.org>
 <4fa623df-5ccc-4635-82da-31a9f2a3a1a7@sina.com>
 <b206ebf0-5f63-4766-9e4a-d9e8290ef1d6@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <b206ebf0-5f63-4766-9e4a-d9e8290ef1d6@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/23/26 17:19, Chao Yu via Linux-f2fs-devel wrote: > On
 3/23/26 16:42, Yongpeng Yang wrote: >> >> On 3/23/26 11:28,
 Chao Yu via Linux-f2fs-devel
 wrote: >>> On 3/19/26 21:26, Yongpeng Yang wrote: >> [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.21 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1w4dgR-0002D9-Oc
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs: fix fiemap boundary handling
 when read extent cache is incomplete
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>, stable@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.91 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:stable@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,vm:email]
X-Rspamd-Queue-Id: 5BA422F15EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMy8yMy8yNiAxNzoxOSwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPiBP
biAzLzIzLzI2IDE2OjQyLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pgo+PiBPbiAzLzIzLzI2IDEx
OjI4LCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+Pj4gT24gMy8xOS8yNiAy
MToyNiwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPj4+PiBGcm9tOiBZb25ncGVuZyBZYW5nIDx5YW5n
eW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4+Pgo+Pj4+IGYyZnNfZmllbWFwKCkgY2FsbHMgZjJmc19t
YXBfYmxvY2tzKCkgdG8gb2J0YWluIHRoZSBibG9jayBtYXBwaW5nIGEKPj4+PiBmaWxlLCBhbmQg
dGhlbiBtZXJnZXMgY29udGlndW91cyBtYXBwaW5ncyBpbnRvIGV4dGVudHMuIElmIHRoZSBtYXBw
aW5nCj4+Pj4gaXMgZm91bmQgaW4gdGhlIHJlYWQgZXh0ZW50IGNhY2hlLCBub2RlIGJsb2NrcyBk
byBub3QgbmVlZCB0byBiZSByZWFkLgo+Pj4+IEhvd2V2ZXIsIGluIHRoZSBmb2xsb3dpbmcgc2Nl
bmFyaW8sIGEgY29udGlndW91cyBleHRlbnQgY2FuIGJlIHNwbGl0Cj4+Pj4gaW50byB0d28gZXh0
ZW50czoKPj4+Pgo+Pj4+IHJvb3RAdm06L21udC9mMmZzIyBkZCBpZj0vZGV2L3plcm8gb2Y9ZGF0
YS40TSBicz0xTSBjb3VudD00ICYmIHN5bmMKPj4+PiByb290QHZtOi9tbnQvZjJmcyMgZGQgaWY9
L2Rldi96ZXJvIG9mPWRhdGEuNE0gYnM9MU0gY291bnQ9MiBzZWVrPTIgY29udj1ub3RydW5jICYm
IHN5bmMKPj4+PiByb290QHZtOi9tbnQvZjJmcyMgZWNobyAzID4gL3Byb2Mvc3lzL3ZtL2Ryb3Bf
Y2FjaGVzICMgZHJvcCAyTX40TSBleHRlbnQgY2FjaGUKPj4+PiByb290QHZtOi9tbnQvZjJmcyMg
ZGQgaWY9L2Rldi96ZXJvIG9mPWRhdGEuNE0gYnM9MU0gY291bnQ9MiBzZWVrPTAgY29udj1ub3Ry
dW5jICYmIHN5bmMKPj4+PiByb290QHZtOi9tbnQvZjJmcyMgZjJmc19pbyBmaWVtYXAgMCAxMDI0
IGRhdGEuNE0KPj4+PiBGaWVtYXA6IG9mZnNldCA9IDAgbGVuID0gMTAyNAo+Pj4+IGxvZ2ljYWwg
YWRkci4gICAgcGh5c2ljYWwgYWRkci4gICBsZW5ndGggICAgICAgICAgIGZsYWdzCj4+Pj4gMAkw
MDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDY0MDAwMDAgMDAwMDAwMDAwMDIwMDAwMCAwMDAwMTAw
MAo+Pj4+IDEJMDAwMDAwMDAwMDIwMDAwMCAwMDAwMDAwMDA2NjAwMDAwIDAwMDAwMDAwMDAyMDAw
MDAgMDAwMDEwMDEKPj4+Cj4+PiBXZWxsLCBJIGNhbiBub3QgcmVwcm9kdWNlIHRoaXMgdy8gYWJv
dmUgc2NyaXB0cywgY2FuIHlvdSBwbGVhc2UgY2hlY2sKPj4+IHRoYXQ/IGFueXdheSwgdGhlIGNv
ZGUgcGFydCBsb29rcyBmaW5lIHRvIG1lLgo+Pgo+PiBTb3JyeSBmb3Igb21pdHRpbmcgdG9vIG1h
bnkgZGV0YWlscyBlYXJsaWVyLiBUaGUgZnVsbCBzY3JpcHRzIEkgdXNlZCB0bwo+PiByZXByb2R1
Y2UgdGhlIGlzc3VlIGlzIGFzIGJlbG93LiBUaGUgYmFzaWMgaWRlYSBpcyB0byBtYWtlCj4+IGdl
dF9uZXdfc2VnbWVudCgpIGFsd2F5cyBzdGFydCBzY2FubmluZyBmcm9tIHNlY3Rpb24gIzAgZm9y
IGVhY2gKPj4gYWxsb2NhdGlvbiwgYW5kIHRvIGFsbG9jYXRlIGhpZ2hlciBhZGRyZXNzZXMgZmly
c3QsIGZvbGxvd2VkIGJ5IGxvd2VyCj4+IGFkZHJlc3Nlcy4KPiAKPiBZb3UgbWVhbiBhbGxvY2F0
ZSBsb3dlciBhZGRyZXNzZXMgZmlyc3QsIHRoZW4gaGlnaGVyIGFkZHJlc3NlcyBpbiBMRlMgbW9k
ZT8KCkluIExGUyBtb2RlLCB3aGVuIHRoZSBtYWluIGFyZWEgaXMgc21hbGxlciB0aGFuIDE2R0Is
IGFsbG9jYXRpb25zIGFsd2F5cwpzdGFydCBmcm9tIHNlY3Rpb24gIzAsIHdoaWNoIG1ha2VzIGl0
IGVhc2llciB0byByZWxpYWJseSByZXByb2R1Y2UgdGhpcwpzY2VuYXJpby4KClRoZSBrZXkgaWRl
YSBiZWhpbmQgY29uc3RydWN0aW5nIHRoaXMgc2NlbmFyaW8gaXMgYXMgZm9sbG93czogZmlyc3Qs
IG1hcAphbmQgd3JpdGUgdGhlIDB+Mk1CIHJhbmdlIHRvIGhpZ2hlciBhZGRyZXNzZXMgb24gdGhl
IGRldmljZSwgYW5kIHRoZW4Kd3JpdGUgdGhlIDB+Mk1CIHJhbmdlIHRvIGxvd2VyIGFkZHJlc3Nl
cy4gVGhpcyBjcmVhdGVzIGEgc2l0dWF0aW9uCndoZXJlIDB+Mk1CIGNhbiBiZSBtZXJnZWQgd2l0
aCAyTUJ+NE1CLCBidXQgdGhlIDJNQn40TUIgcmFuZ2UgaXMgbm90CnByZXNlbnQgaW4gdGhlIGV4
dGVudCB0cmVlLgoKMS4gSW5pdGlhbCBzdGF0ZQpmaWxlIG1hcHBpbmcgICAgMH4yTSAgICAgICAg
Mk1+NE0gICAgICAgW2N1cnNlZ10gICAgW2ZyZWVdCnNlZ21lbnQjICAgICAgICAjQSAgICAgICAg
ICAjQSsxICAgICAgICAjQSsyICAgICAgICAjQSszCgoyLiBkZCBpZj0vZGV2L3plcm8gb2Y9ZGF0
YS40TSBicz0xTSBjb3VudD0yIHNlZWs9MiBjb252PW5vdHJ1bmMgJiYgc3luYwpmaWxlIG1hcHBp
bmcgICAgMH4yTSAgICAgICAgW2ZyZWVdICAgICAgMk1+NE0gICAgICAgW2N1cnNlZ10Kc2VnbWVu
dCMgICAgICAgICNBICAgICAgICAgICNBKzEgICAgICAgICNBKzIgICAgICAgICNBKzMKCjMuIGRk
IGlmPS9kZXYvemVybyBvZj1kYXRhLjRNIGJzPTFNIGNvdW50PTIgc2Vlaz0wIGNvbnY9bm90cnVu
YyAmJiBzeW5jCmZpbGUgbWFwcGluZyAgICBbZnJlZV0gICAgICBbY3Vyc2VnXSAgICAyTX40TSAg
ICAgICAwfjJNCnNlZ21lbnQjICAgICAgICAjQSAgICAgICAgICAjQSsxICAgICAgICAjQSsyICAg
ICAgICAjQSszCgo0LiBkZCBpZj0vZGV2L3plcm8gb2Y9ZGF0YS40TSBicz0xTSBjb3VudD0yIHNl
ZWs9MCBjb252PW5vdHJ1bmMgJiYgc3luYwpmaWxlIG1hcHBpbmcgICAgW2N1cnNlZ10gICAgMH4y
TSAgICAgICAgMk1+NE0gICAgICAgW2ZyZWVdCnNlZ21lbnQjICAgICAgICAjQSAgICAgICAgICAj
QSsxICAgICAgICAjQSsyICAgICAgICAjQSszCgo+IAo+Pgo+PiBkZCBpZj0vZGV2L3plcm8gb2Y9
ZGF0YS4xMjhNIGJzPTFNIGNvdW50PTEyOAo+PiBsb3NldHVwIC1mIGRhdGEuMTI4TQo+PiBta2Zz
LmYyZnMgL2Rldi9sb29wMCAtZgo+PiBtb3VudCAtbyBtb2RlPWxmcyAvZGV2L2xvb3AwIC9tbnQv
ZjJmcy8KPj4gY2QgL21udC9mMmZzLwo+PiBkZCBpZj0vZGV2L3plcm8gb2Y9ZGF0YS43Mk0gYnM9
MU0gY291bnQ9NzIgJiYgc3luYwo+PiBkZCBpZj0vZGV2L3plcm8gb2Y9ZGF0YS40TSBicz0xTSBj
b3VudD00ICYmIHN5bmMKPj4gZGQgaWY9L2Rldi96ZXJvIG9mPWRhdGEuNE0gYnM9MU0gY291bnQ9
MiBzZWVrPTIgY29udj1ub3RydW5jICYmIHN5bmMKPj4gZWNobyAzID4gL3Byb2Mvc3lzL3ZtL2Ry
b3BfY2FjaGVzCj4+IGRkIGlmPS9kZXYvemVybyBvZj1kYXRhLjRNIGJzPTFNIGNvdW50PTIgc2Vl
az0wIGNvbnY9bm90cnVuYyAmJiBzeW5jCj4+IGRkIGlmPS9kZXYvemVybyBvZj1kYXRhLjRNIGJz
PTFNIGNvdW50PTIgc2Vlaz0wIGNvbnY9bm90cnVuYyAmJiBzeW5jCj4+IGYyZnNfaW8gZmllbWFw
IDAgMTAyNCBkYXRhLjRNCj4gCj4gQWgsIG5vdyB0aGUgc2NyaXB0cyBhbmQgcmVzdWx0IGFyZSBj
b25zaXN0ZW50LCBjYW4geW91IHBsZWFzZSByZXBsYWNlIHRoZQo+IHNjcmlwdHMgaW4gY29tbWl0
IG1lc3NhZ2U/CgpPSywgSSdsbCByZXBsYWNlIHRoZSBzY3JpcHRzIGluIHY0IHBhdGNoLgoKVGhh
bmtzCllvbmdwZW5nLAoKPiAKPiBUaGFua3MsCj4gCj4+Cj4+IFRoYW5rcwo+PiBZb25ncGVuZywK
Pj4KPj4+Cj4+PiBUaGFua3MsCj4+Pgo+Pj4+Cj4+Pj4gQWx0aG91Z2ggdGhlIHBoeXNpY2FsIGFk
ZHJlc3NlcyBvZiB0aGUgcmFuZ2VzIDDvvZ4yTUIgYW5kIDJN772eNE1CIGFyZQo+Pj4+IGNvbnRp
Z3VvdXMsIHRoZSBtYXBwaW5nIGZvciB0aGUgMk3vvZ40TUIgcmFuZ2UgaXMgbm90IHByZXNlbnQg
aW4gbWVtb3J5Lgo+Pj4+IFdoZW4gdGhlIHBoeXNpY2FsIGFkZHJlc3NlcyBmb3IgdGhlIDDvvZ4y
TUIgcmFuZ2UgYXJlIHVwZGF0ZWQsIG5vIG1lcmdlCj4+Pj4gaGFwcGVucyBiZWNhdXNlIHRoZSBh
ZGphY2VudCBtYXBwaW5nIGlzIG1pc3NpbmcgZnJvbSB0aGUgaW4tbWVtb3J5Cj4+Pj4gY2FjaGUu
IEFzIGEgcmVzdWx0LCBmaWVtYXAgcmVwb3J0cyB0d28gc2VwYXJhdGUgZXh0ZW50cyBpbnN0ZWFk
IG9mIGEKPj4+PiBzaW5nbGUgY29udGlndW91cyBvbmUuCj4+Pj4KPj4+PiBUaGUgcm9vdCBjYXVz
ZSBpcyB0aGF0IHRoZSByZWFkIGV4dGVudCBjYWNoZSBkb2VzIG5vdCBndWFyYW50ZWUgdGhhdCBh
bGwKPj4+PiBibG9ja3Mgb2YgYW4gZXh0ZW50IGFyZSBwcmVzZW50IGluIG1lbW9yeS4gVGhlcmVm
b3JlLCB3aGVuIHRoZSBleHRlbnQKPj4+PiBsZW5ndGggcmV0dXJuZWQgYnkgZjJmc19tYXBfYmxv
Y2tzX2NhY2hlZCgpIGlzIHNtYWxsZXIgdGhhbiBtYXhibG9ja3MsCj4+Pj4gdGhlIHJlbWFpbmlu
ZyBtYXBwaW5ncyBhcmUgcmV0cmlldmVkIHZpYSBmMmZzX2dldF9kbm9kZV9vZl9kYXRhKCkgdG8K
Pj4+PiBlbnN1cmUgY29ycmVjdCBmaWVtYXAgZXh0ZW50IGJvdW5kYXJ5IGhhbmRsaW5nLgo+Pj4+
Cj4+Pj4gQ2M6IHN0YWJsZUBrZXJuZWwub3JnCj4+Pj4gRml4ZXM6IGNkOGZjNTIyNmJlZiAoImYy
ZnM6IHJlbW92ZSB0aGUgY3JlYXRlIGFyZ3VtZW50IHRvIGYyZnNfbWFwX2Jsb2NrcyIpCj4+Pj4g
U2lnbmVkLW9mZi1ieTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+
Pj4gLS0tCj4+Pj4gdjM6Cj4+Pj4gLSBDYyB0byBzdGFibGUga2VybmVsLgo+Pj4+IHYyOgo+Pj4+
IC0gRml4IE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBjYXVzZWQgYnkgbWFwLT5tX211bHRpZGV2
X2Rpby4KPj4+PiAtIFJlZHVjZSBjYWxscyB0byBmMmZzX2dldF9kbm9kZV9vZl9kYXRhKCkuCj4+
Pj4gLS0tCj4+Pj4gIGZzL2YyZnMvZGF0YS5jIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKy0t
LQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
Pj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4+
Pj4gaW5kZXggOWU0ZGI2ZjA1MDhhLi5hMjEwYTdhNjI3YzYgMTAwNjQ0Cj4+Pj4gLS0tIGEvZnMv
ZjJmcy9kYXRhLmMKPj4+PiArKysgYi9mcy9mMmZzL2RhdGEuYwo+Pj4+IEBAIC0xNjM3LDggKzE2
MzcsMjYgQEAgaW50IGYyZnNfbWFwX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3Qg
ZjJmc19tYXBfYmxvY2tzICptYXAsIGludCBmbGFnKQo+Pj4+ICAJbGZzX2Rpb193cml0ZSA9IChm
bGFnID09IEYyRlNfR0VUX0JMT0NLX0RJTyAmJiBmMmZzX2xmc19tb2RlKHNiaSkgJiYKPj4+PiAg
CQkJCW1hcC0+bV9tYXlfY3JlYXRlKTsKPj4+PiAgCj4+Pj4gLQlpZiAoIW1hcC0+bV9tYXlfY3Jl
YXRlICYmIGYyZnNfbWFwX2Jsb2Nrc19jYWNoZWQoaW5vZGUsIG1hcCwgZmxhZykpCj4+Pj4gLQkJ
Z290byBvdXQ7Cj4+Pj4gKwlpZiAoIW1hcC0+bV9tYXlfY3JlYXRlICYmIGYyZnNfbWFwX2Jsb2Nr
c19jYWNoZWQoaW5vZGUsIG1hcCwgZmxhZykpIHsKPj4+PiArCQlzdHJ1Y3QgZXh0ZW50X2luZm8g
ZWk7Cj4+Pj4gKwo+Pj4+ICsJCS8qCj4+Pj4gKwkJICogMS4gSWYgbWFwLT5tX211bHRpZGV2X2Rp
byBpcyB0cnVlLCBtYXAtPm1fcGJsayBjYW5ub3QgYmUKPj4+PiArCQkgKiB3YWl0dGVkIGJ5IGYy
ZnNfd2FpdF9vbl9ibG9ja193cml0ZWJhY2tfcmFuZ2UoKSBhbmQgYXJlIG5vdAo+Pj4+ICsJCSAq
IG1lcmdlYWJsZS4KPj4+PiArCQkgKiAyLiBJZiBwZ29mcyBoaXRzIHRoZSByZWFkIGV4dGVudCBj
YWNoZSwgaXQgbWVhbnMgdGhlIG1hcHBpbmcKPj4+PiArCQkgKiBpcyBhbHJlYWR5IGNhY2hlZCBp
biB0aGUgZXh0ZW50IGNhY2hlLCBidXQgaXQgaXMgbm90Cj4+Pj4gKwkJICogbWVyZ2VhYmxlLCBh
bmQgdGhlcmUgaXMgbm8gbmVlZCB0byBxdWVyeSB0aGUgbWFwcGluZyBhZ2Fpbgo+Pj4+ICsJCSAq
IHZpYSBmMmZzX2dldF9kbm9kZV9vZl9kYXRhKCkuCj4+Pj4gKwkJICovCj4+Pj4gKwkJcGdvZnMg
PQkocGdvZmZfdCltYXAtPm1fbGJsayArIG1hcC0+bV9sZW47Cj4+Pj4gKwkJaWYgKG1hcC0+bV9s
ZW4gPT0gbWF4YmxvY2tzIHx8Cj4+Pj4gKwkJCW1hcC0+bV9tdWx0aWRldl9kaW8gfHwKPj4+PiAr
CQkJZjJmc19sb29rdXBfcmVhZF9leHRlbnRfY2FjaGUoaW5vZGUsIHBnb2ZzLCAmZWkpKQo+Pj4+
ICsJCQlnb3RvIG91dDsKPj4+PiArCQlvZnMgPSBtYXAtPm1fbGVuOwo+Pj4+ICsJCWdvdG8gbWFw
X21vcmU7Cj4+Pj4gKwl9Cj4+Pj4gIAo+Pj4+ICAJbWFwLT5tX2JkZXYgPSBpbm9kZS0+aV9zYi0+
c19iZGV2Owo+Pj4+ICAJbWFwLT5tX211bHRpZGV2X2RpbyA9Cj4+Pj4gQEAgLTE2NDksNyArMTY2
Nyw4IEBAIGludCBmMmZzX21hcF9ibG9ja3Moc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGYy
ZnNfbWFwX2Jsb2NrcyAqbWFwLCBpbnQgZmxhZykKPj4+PiAgCj4+Pj4gIAkvKiBpdCBvbmx5IHN1
cHBvcnRzIGJsb2NrIHNpemUgPT0gcGFnZSBzaXplICovCj4+Pj4gIAlwZ29mcyA9CShwZ29mZl90
KW1hcC0+bV9sYmxrOwo+Pj4+IC0JZW5kID0gcGdvZnMgKyBtYXhibG9ja3M7Cj4+Pj4gK21hcF9t
b3JlOgo+Pj4+ICsJZW5kID0gKHBnb2ZmX3QpbWFwLT5tX2xibGsgKyBtYXhibG9ja3M7Cj4+Pj4g
IAo+Pj4+ICAJaWYgKGZsYWcgPT0gRjJGU19HRVRfQkxPQ0tfUFJFQ0FDSEUpCj4+Pj4gIAkJbW9k
ZSA9IExPT0tVUF9OT0RFX1JBOwo+Pj4KPj4+Cj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0Cj4+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4gaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+
Pgo+IAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
