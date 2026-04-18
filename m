Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCONEJrV4mkT/AAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 18 Apr 2026 02:51:38 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A8641F829
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 18 Apr 2026 02:51:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sq1vD9XZ9T8GrRFCCyyaMV7qt4WzqBnmI4BnPDRZa34=; b=Pba/ATSay9tL1bqUtZschD0moY
	jvTgx88Ca6a5xrz25HaeSttQ277z5uDtzycUqJur96AILJHEAQSwF3aOhWdohFmM/Jh0PhQfJciDA
	ySpQ35DafGRynMb7ytmX29KhDv/5kHrl2aEIbLuIPCQHIpoTpvhrlwj0NozH5ZOO1R0k=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wDtuA-0003fH-Ie;
	Sat, 18 Apr 2026 00:51:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wDtu8-0003fB-NS
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 18 Apr 2026 00:51:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7SGhFBInVzVXZqIlVjp3O6cuBRg5rGGSTShB1eQpxdc=; b=FUlNre69teiDz6Hipqeki3vsL6
 8CtcB13fBz5hdkh1Gv4fBIFEybn0YT2wK0wnw0ozktviYfRrBq7JQD0STFsHpgSXLInr6PcWXJld4
 WezqG36AQvac4GoHhugoe1lAUMX79oxVtQfUltpVIfwhuwOLnXSpr0U+sVP8UI79MOHg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7SGhFBInVzVXZqIlVjp3O6cuBRg5rGGSTShB1eQpxdc=; b=K0bEPgnzYevKuPYXXT638MP1Yh
 UwcmXO0FxuWb8xcjAqMEkJ8sfbZBJx1nHxrpFY/fMI6v8hsqg3FBvFiKzX6XbN1/VmbN4AWIyqLsK
 xeJNWmNwYtJaEYuEnk3PEodJcDnoUrkzEd4jaAq4xrhctG4Gn5HCULIHdptJpDWwsaMI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wDtu8-00045z-OK for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 18 Apr 2026 00:51:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B69AC60052;
 Sat, 18 Apr 2026 00:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3573C19425;
 Sat, 18 Apr 2026 00:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776473478;
 bh=DBDZWUEMLzf8IOAj2T6bVQUu+oEnsiGaIL67dCYyAAw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=SKo3YNy2omrp1P/by9xrVCGfnWN8b9cr4Aen1K0Ze8JVDbIn5HKntgvkK3jv5dFC/
 ZB+OXka4cbwO3T1H6wrMY8YRQd1UyGmuFglspNzNJtnk/zZjjGgyk8kvwheIlCqH2J
 onCuxR3UExSAf9YyOCbl3W4IzxKsQ9vx4/9sSEJnGf8TIaZCVwc7RyFPgVM0HdEk1W
 uDi+UVgxx3bIUGC9qybOq19L1R1AxjmKddwijsPCa0S3zF4YjFKh6uY2lwDCeHq95N
 yUSd5P0fybrglXNf5UpVpxf8GWyT69SgglAsUOJy+7tpmkLom8cENNVrADllGgaReD
 WSdZDE4xhLIkg==
Message-ID: <ac9d0f35-52dc-4371-a692-39c1d4ae5555@kernel.org>
Date: Sat, 18 Apr 2026 08:51:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260403144015.221811-3-monty_pavel@sina.com>
 <f997ceb6-85d1-4872-be06-2a50469b3b18@kernel.org>
 <5c222edf-6888-4007-9240-9e7988b2dc71@sina.com>
Content-Language: en-US
In-Reply-To: <5c222edf-6888-4007-9240-9e7988b2dc71@sina.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/17/26 21:26, Yongpeng Yang wrote: > > On 4/17/26 17:00, 
 Chao Yu via Linux-f2fs-devel wrote: >> On 4/3/26 22:40, Yongpeng Yang wrote:
 >>> From: Yongpeng Yang <yangyongpeng@xiaomi.com> >>> >>> f2fs [...] 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wDtu8-00045z-OK
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: 79A8641F829
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gNC8xNy8yNiAyMToyNiwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPiAKPiBPbiA0LzE3LzI2IDE3
OjAwLCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+PiBPbiA0LzMvMjYgMjI6
NDAsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+PiBGcm9tOiBZb25ncGVuZyBZYW5nIDx5YW5neW9u
Z3BlbmdAeGlhb21pLmNvbT4KPj4+Cj4+PiBmMmZzX2Rlc3Ryb3lfZXh0ZW50X25vZGUoKSBkb2Vz
IG5vdCBzZXQgRklfTk9fRVhURU5UIGJlZm9yZSBjbGVhcmluZwo+Pj4gZXh0ZW50IG5vZGVzLiBX
aGVuIGNhbGxlZCBmcm9tIGYyZnNfZHJvcF9pbm9kZSgpIHdpdGggSV9TWU5DIHNldCwKPj4+IGNv
bmN1cnJlbnQga3dvcmtlciB3cml0ZWJhY2sgY2FuIGluc2VydCBuZXcgZXh0ZW50IG5vZGVzIGlu
dG8gdGhlIHNhbWUKPj4+IGV4dGVudCB0cmVlLCByYWNpbmcgd2l0aCB0aGUgZGVzdHJveSBhbmQg
dHJpZ2dlcmluZyBmMmZzX2J1Z19vbigpIGluCj4+PiBfX2Rlc3Ryb3lfZXh0ZW50X25vZGUoKS4g
VGhlIHNjZW5hcmlvIGlzIGFzIGZvbGxvd3M6Cj4+Pgo+Pj4gZHJvcCBpbm9kZcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3cml0ZWJhY2sKPj4+
ICDCoCAtIGlwdXQKPj4+ICDCoMKgIC0gZjJmc19kcm9wX2lub2RlwqAgLy8gSV9TWU5DIHNldAo+
Pj4gIMKgwqDCoCAtIGYyZnNfZGVzdHJveV9leHRlbnRfbm9kZQo+Pj4gIMKgwqDCoMKgIC0gX19k
ZXN0cm95X2V4dGVudF9ub2RlCj4+PiAgwqDCoMKgwqDCoCAtIHdoaWxlIChub2RlX2NudCkgewo+
Pj4gIMKgwqDCoMKgwqDCoMKgwqAgd3JpdGVfbG9jaygmZXQtPmxvY2spCj4+PiAgwqDCoMKgwqDC
oMKgwqDCoCBfX2ZyZWVfZXh0ZW50X3RyZWUKPj4+ICDCoMKgwqDCoMKgwqDCoMKgIHdyaXRlX3Vu
bG9jaygmZXQtPmxvY2spCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gX193cml0ZWJhY2tf
c2luZ2xlX2lub2RlCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBmMmZzX291dHBsYWNl
X3dyaXRlX2RhdGEKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZjJmc191cGRhdGVf
cmVhZF9leHRlbnRfY2FjaGUKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBfX3Vw
ZGF0ZV9leHRlbnRfdHJlZV9yYW5nZQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC8vIEZJX05PX0VYVEVOVCBub3Qgc2V0LAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC8vIGluc2VydCBuZXcgZXh0ZW50IG5vZGUKPj4+ICDCoMKgwqDCoMKgwqDCoCB9IC8vIG5v
ZGVfY250ID09IDAsIGV4aXQgd2hpbGUKPj4+ICDCoMKgwqDCoMKgIC0gZjJmc19idWdfb24obm9k
ZV9jbnQpwqAgLy8gbm9kZV9jbnQgPiAwCj4+Pgo+Pj4gQWRkaXRpb25hbGx5LCBfX3VwZGF0ZV9l
eHRlbnRfdHJlZV9yYW5nZSgpIG9ubHkgY2hlY2tzIEZJX05PX0VYVEVOVCBmb3IKPj4+IEVYX1JF
QUQgdHlwZSwgbGVhdmluZyBFWF9CTE9DS19BR0UgdXBkYXRlcyBjb21wbGV0ZWx5IHVucHJvdGVj
dGVkLgo+Pj4KPj4+IFRoaXMgcGF0Y2ggc2V0IEZJX05PX0VYVEVOVCB1bmRlciBldC0+bG9jayBp
biBfX2Rlc3Ryb3lfZXh0ZW50X25vZGUoKSwKPj4+IGNvbnNpc3RlbnQgd2l0aCBvdGhlciBjYWxs
ZXJzIChfX3VwZGF0ZV9leHRlbnRfdHJlZV9yYW5nZSBhbmQKPj4+IF9fZHJvcF9leHRlbnRfdHJl
ZSkgYW5kIGNoZWNrIEZJX05PX0VYVEVOVCBmb3IgYm90aCBFWF9SRUFEIGFuZAo+Pj4gRVhfQkxP
Q0tfQUdFIHRyZWUuCj4+Cj4+IEkgc3VmZmVyZWQgYmVsb3cgdGVzdCBmYWlsdXJlLCB0aGVuIEkg
YmlzZWN0IHRvIHRoaXMgY2hhbmdlLgo+Pgo+PiAgwqDCoMKgIGdlbmVyaWMvNDc1wqAgODRzIC4u
LiBbZmFpbGVkLCBleGl0IHN0YXR1cyAxXS0gb3V0cHV0IG1pc21hdGNoIChzZWUgLwo+PiBzaGFy
ZS9naXQvZnN0ZXN0cy9yZXN1bHRzLy9nZW5lcmljLzQ3NS5vdXQuYmFkKQo+PiAgwqDCoMKgIC0t
LSB0ZXN0cy9nZW5lcmljLzQ3NS5vdXTCoMKgIDIwMjUtMDEtMTIgMjE6NTc6NDAuMjc5NDQwNjY0
ICswODAwCj4+ICDCoMKgwqAgKysrIC9zaGFyZS9naXQvZnN0ZXN0cy9yZXN1bHRzLy9nZW5lcmlj
LzQ3NS5vdXQuYmFkIDIwMjYtMDQtMTcKPj4gMTI6MDg6MjguMDAwMDAwMDAwICswODAwCj4+ICDC
oMKgwqAgQEAgLTEsMiArMSw2IEBACj4+ICDCoMKgwqDCoCBRQSBvdXRwdXQgY3JlYXRlZCBieSA0
NzUKPj4gIMKgwqDCoMKgIFNpbGVuY2UgaXMgZ29sZGVuLgo+PiAgwqDCoMKgICttb3VudDogL21u
dC9zY3JhdGNoX2YyZnM6IG1vdW50IHN5c3RlbSBjYWxsIGZhaWxlZDogU3RydWN0dXJlIG5lZWRz
Cj4+IGNsZWFuaW5nLgo+PiAgwqDCoMKgICvCoMKgwqDCoMKgwqAgZG1lc2coMSkgbWF5IGhhdmUg
bW9yZSBpbmZvcm1hdGlvbiBhZnRlciBmYWlsZWQgbW91bnQgc3lzdGVtCj4+IGNhbGwuCj4+ICDC
oMKgwqAgK21vdW50IGZhaWxlZAo+PiAgwqDCoMKgICsoc2VlIC9zaGFyZS9naXQvZnN0ZXN0cy9y
ZXN1bHRzLy9nZW5lcmljLzQ3NS5mdWxsIGZvciBkZXRhaWxzKQo+PiAgwqDCoMKgIC4uLgo+PiAg
wqDCoMKgIChSdW4gJ2RpZmYgLXUgL3NoYXJlL2dpdC9mc3Rlc3RzL3Rlc3RzL2dlbmVyaWMvNDc1
Lm91dCAvc2hhcmUvZ2l0Lwo+PiBmc3Rlc3RzL3Jlc3VsdHMvL2dlbmVyaWMvNDc1Lm91dC5iYWQn
wqAgdG8gc2VlIHRoZSBlbnRpcmUgZGlmZikKPj4KPj4KPj4gIMKgwqDCoCBnZW5lcmljLzM4OMKg
IDczcyAuLi4gW2ZhaWxlZCwgZXhpdCBzdGF0dXMgMV0tIG91dHB1dCBtaXNtYXRjaCAoc2VlIC8K
Pj4gc2hhcmUvZ2l0L2ZzdGVzdHMvcmVzdWx0cy8vZ2VuZXJpYy8zODgub3V0LmJhZCkKPj4gIMKg
wqDCoCAtLS0gdGVzdHMvZ2VuZXJpYy8zODgub3V0wqDCoCAyMDI1LTAxLTEyIDIxOjU3OjQwLjI3
NTQ0MDYwMiArMDgwMAo+PiAgwqDCoMKgICsrKyAvc2hhcmUvZ2l0L2ZzdGVzdHMvcmVzdWx0cy8v
Z2VuZXJpYy8zODgub3V0LmJhZCAyMDI2LTA0LTE3Cj4+IDExOjU4OjA1LjAwMDAwMDAwMCArMDgw
MAo+PiAgwqDCoMKgIEBAIC0xLDIgKzEsNiBAQAo+PiAgwqDCoMKgwqAgUUEgb3V0cHV0IGNyZWF0
ZWQgYnkgMzg4Cj4+ICDCoMKgwqDCoCBTaWxlbmNlIGlzIGdvbGRlbi4KPj4gIMKgwqDCoCArbW91
bnQ6IC9tbnQvc2NyYXRjaF9mMmZzOiBtb3VudCBzeXN0ZW0gY2FsbCBmYWlsZWQ6IFN0cnVjdHVy
ZSBuZWVkcwo+PiBjbGVhbmluZy4KPj4gIMKgwqDCoCArwqDCoMKgwqDCoMKgIGRtZXNnKDEpIG1h
eSBoYXZlIG1vcmUgaW5mb3JtYXRpb24gYWZ0ZXIgZmFpbGVkIG1vdW50IHN5c3RlbQo+PiBjYWxs
Lgo+PiAgwqDCoMKgICtjeWNsZSBtb3VudCBmYWlsZWQKPj4gIMKgwqDCoCArKHNlZSAvc2hhcmUv
Z2l0L2ZzdGVzdHMvcmVzdWx0cy8vZ2VuZXJpYy8zODguZnVsbCBmb3IgZGV0YWlscykKPj4gIMKg
wqDCoCAuLi4KPj4gIMKgwqDCoCAoUnVuICdkaWZmIC11IC9zaGFyZS9naXQvZnN0ZXN0cy90ZXN0
cy9nZW5lcmljLzM4OC5vdXQgL3NoYXJlL2dpdC8KPj4gZnN0ZXN0cy9yZXN1bHRzLy9nZW5lcmlj
LzM4OC5vdXQuYmFkJ8KgIHRvIHNlZSB0aGUgZW50aXJlIGRpZmYpCj4+Cj4+Cj4+ICDCoMKgwqAg
RjJGUy1mcyAoZG0tMCk6IHNhbml0eV9jaGVja19leHRlbnRfY2FjaGU6IGlub2RlIChpbm89MTc2
MSkgZXh0ZW50Cj4+IGluZm8gWzIyMDA1NywgNTcsIDZdIGlzIGluY29ycmVjdCwgcnVuIGZzY2sg
dG8gZml4Cj4+Cj4+IEkgc3VzcGVjdCB3ZSBtYXkgbWlzcyBhbnkgZXh0ZW50IHVwZGF0ZXMgYWZ0
ZXIgd2Ugc2V0IEZJX05PX0VYVEVOVCBpbgo+PiBfX2Rlc3Ryb3lfZXh0ZW50X25vZGUoKSwgcmVz
dWx0IGluIGZhaWxpbmcgaW4gc2FuaXR5X2NoZWNrX2V4dGVudF9jYWNoZSgpLgo+Pgo+PiBDYW4g
d2UganVzdCByZWxvY2F0ZSBmMmZzX2J1Z19vbihub2RlX2NudCkgcmF0aGVyIHRoYW4gY29tcGxp
Y2F0ZWQgY2hhbmdlPwo+PiBUaG91Z2h0cz8KPiAKPiBPaCwgSSBvdmVybG9va2VkIGxhcmdlc3Qg
ZXh0ZW50LiBIb3cgYWJvdXQgcmVsb2NhdGUKPiBmMmZzX2J1Z19vbihub2RlX2NudCkgdG8gX19k
ZXN0cm95X2V4dGVudF90cmVlPwo+IAo+IHN0YXRpYyB2b2lkIF9fZGVzdHJveV9leHRlbnRfdHJl
ZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBlbnVtIGV4dGVudF90eXBlCj4gdHlwZSkKPiAKPiAgICAg
ICAgICAvKiBmcmVlIGFsbCBleHRlbnQgaW5mbyBiZWxvbmcgdG8gdGhpcyBleHRlbnQgdHJlZSAq
Lwo+ICAgICAgICAgIG5vZGVfY250ID0gX19kZXN0cm95X2V4dGVudF9ub2RlKGlub2RlLCB0eXBl
KTsKPiArICAgICAgIGYyZnNfYnVnX29uKHNiaSwgYXRvbWljX3JlYWQoJmV0LT5ub2RlX2NudCkp
OwoKCS8qIGZyZWUgYWxsIGV4dGVudCBpbmZvIGJlbG9uZyB0byB0aGlzIGV4dGVudCB0cmVlICov
Cglub2RlX2NudCA9IF9fZGVzdHJveV9leHRlbnRfbm9kZShpbm9kZSwgdHlwZSk7CgoJLyogZGVs
ZXRlIGV4dGVudCB0cmVlIGVudHJ5IGluIHJhZGl4IHRyZWUgKi8KCW11dGV4X2xvY2soJmV0aS0+
ZXh0ZW50X3RyZWVfbG9jayk7CglmMmZzX2J1Z19vbihzYmksIGF0b21pY19yZWFkKCZldC0+bm9k
ZV9jbnQpKTsgIDwtLS0KCk9oLCBpdCBoYXMgYWxyZWFkeSBjaGVja2VkIG5vZGVfY250LCBzbywg
bWF5YmUgd2UgY2FuIGp1c3QgcmVtb3ZlIHRoZSBjaGVjayBpbgpfX2Rlc3Ryb3lfZXh0ZW50X25v
ZGUoKT8KClRoYW5rcywKCgo+IAo+IFRoYW5rcwo+IFlvbmdwZW5nLAo+IAo+Pgo+PiBUaGFua3Ms
Cj4+Cj4+Pgo+Pj4gRml4ZXM6IDNmYzVkNWExODJmNiAoImYyZnM6IGZpeCB0byBzaHJpbmsgcmVh
ZCBleHRlbnQgbm9kZSBpbiBiYXRjaGVzIikKPj4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3Jn
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBZb25ncGVuZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNv
bT4KPj4+IC0tLQo+Pj4gIMKgIGZzL2YyZnMvZXh0ZW50X2NhY2hlLmMgfCAxNyArKysrKysrKysr
LS0tLS0tLQo+Pj4gIMKgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2V4dGVudF9jYWNoZS5jIGIvZnMv
ZjJmcy9leHRlbnRfY2FjaGUuYwo+Pj4gaW5kZXggMGVkODRjYzA2NWE3Li44NzE2OWZkMjlkODkg
MTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL2V4dGVudF9jYWNoZS5jCj4+PiArKysgYi9mcy9mMmZz
L2V4dGVudF9jYWNoZS5jCj4+PiBAQCAtMTE5LDkgKzExOSwxMCBAQCBzdGF0aWMgYm9vbCBfX21h
eV9leHRlbnRfdHJlZShzdHJ1Y3QgaW5vZGUKPj4+ICppbm9kZSwgZW51bSBleHRlbnRfdHlwZSB0
eXBlKQo+Pj4gIMKgwqDCoMKgwqAgaWYgKCFfX2luaXRfbWF5X2V4dGVudF90cmVlKGlub2RlLCB0
eXBlKSkKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGZhbHNlOwo+Pj4gIMKgICvCoMKg
wqAgaWYgKGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9OT19FWFRFTlQpKQo+Pj4gK8KgwqDC
oMKgwqDCoMKgIHJldHVybiBmYWxzZTsKPj4+ICsKPj4+ICDCoMKgwqDCoMKgIGlmICh0eXBlID09
IEVYX1JFQUQpIHsKPj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5v
ZGUsIEZJX05PX0VYVEVOVCkpCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZmFs
c2U7Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChpc19pbm9kZV9mbGFnX3NldChpbm9kZSwg
RklfQ09NUFJFU1NFRF9GSUxFKSAmJgo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAhZjJmc19zYl9oYXNfcmVhZG9ubHkoRjJGU19JX1NCKGlub2RlKSkpCj4+PiAgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGZhbHNlOwo+Pj4gQEAgLTY0NCw2ICs2NDUs
OCBAQCBzdGF0aWMgdW5zaWduZWQgaW50IF9fZGVzdHJveV9leHRlbnRfbm9kZShzdHJ1Y3QKPj4+
IGlub2RlICppbm9kZSwKPj4+ICDCoCDCoMKgwqDCoMKgIHdoaWxlIChhdG9taWNfcmVhZCgmZXQt
Pm5vZGVfY250KSkgewo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCB3cml0ZV9sb2NrKCZldC0+bG9j
ayk7Cj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklf
Tk9fRVhURU5UKSkKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNldF9pbm9kZV9mbGFnKGlu
b2RlLCBGSV9OT19FWFRFTlQpOwo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBub2RlX2NudCArPSBf
X2ZyZWVfZXh0ZW50X3RyZWUoc2JpLCBldCwgbnJfc2hyaW5rKTsKPj4+ICDCoMKgwqDCoMKgwqDC
oMKgwqAgd3JpdGVfdW5sb2NrKCZldC0+bG9jayk7Cj4+PiAgwqDCoMKgwqDCoCB9Cj4+PiBAQCAt
Njg4LDEyICs2OTEsMTIgQEAgc3RhdGljIHZvaWQgX191cGRhdGVfZXh0ZW50X3RyZWVfcmFuZ2Uo
c3RydWN0Cj4+PiBpbm9kZSAqaW5vZGUsCj4+PiAgwqAgwqDCoMKgwqDCoCB3cml0ZV9sb2NrKCZl
dC0+bG9jayk7Cj4+PiAgwqAgLcKgwqDCoCBpZiAodHlwZSA9PSBFWF9SRUFEKSB7Cj4+PiAtwqDC
oMKgwqDCoMKgwqAgaWYgKGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9OT19FWFRFTlQpKSB7
Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3cml0ZV91bmxvY2soJmV0LT5sb2NrKTsKPj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4+IC3CoMKgwqDCoMKgwqDCoCB9Cj4+
PiArwqDCoMKgIGlmIChpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfTk9fRVhURU5UKSkgewo+
Pj4gK8KgwqDCoMKgwqDCoMKgIHdyaXRlX3VubG9jaygmZXQtPmxvY2spOwo+Pj4gK8KgwqDCoMKg
wqDCoMKgIHJldHVybjsKPj4+ICvCoMKgwqAgfQo+Pj4gIMKgICvCoMKgwqAgaWYgKHR5cGUgPT0g
RVhfUkVBRCkgewo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBwcmV2ID0gZXQtPmxhcmdlc3Q7Cj4+
PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGRlaS5sZW4gPSAwOwo+Pj4gICAgCj4+Cj4+Cj4+Cj4+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IExpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwKPiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
