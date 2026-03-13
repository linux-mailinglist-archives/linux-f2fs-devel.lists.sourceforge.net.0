Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPo+H3uzs2lYZwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 07:49:31 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7DD27E53C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 07:49:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tg1VUdln1SvSnArMvys+SsmEqCtzKnrCztavN2iesb0=; b=FXqkZqNT6egeHDjcD+MjpMSdjY
	j4bSth2WQz/Y45DFBSoglditq4ugJ2KCJxckytIVqjoBlONzKZVWBV8gC/7jC0rg8kNGBCVYZJlTz
	J9CsbnRv7/sm/a3bsTMHqH3pOjBA5aFc/GqzBY3QL4HDalVnQkQsRZllv3jPkX/0LQvI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0wKj-0006eI-3c;
	Fri, 13 Mar 2026 06:49:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w0wKh-0006e8-Ab
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 06:49:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Exv2RH1xdhJL9qiCtBoLJqh02HmUG7vt8qk5siLcyYo=; b=hBSdFdixdR2MaPUSMPR3kpjKZ4
 XZWfAmvUZwPjsrnT1WI/M2j3w73/a9etD/lQhTpinvV/lajaduOWJ1GFUGgZ4blfPga0qvjSDgmg1
 rvKsWGE43Jikx7AiVL0ChFn7aKck5t+CTgG96UlnUrq7El5t9lOqxkT7Hy4fJg3PUryc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Exv2RH1xdhJL9qiCtBoLJqh02HmUG7vt8qk5siLcyYo=; b=Ib3Aae3Y6r8KpLjJMXtmeYti1i
 QiozhA0JuORW8h3ciLgma4d79eCW067XB8juCquq7FHhFlNiKxr9+0NT/PFHLaJDEmUo5cqLN0u3I
 cu1dh+3zRIajW89IZ0wS93fnYmQ5xaNJ28FSezTHhl8kzx94QG3GnsrLr/2aK2WfC8gY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0wKg-0005Uk-Nq for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 06:49:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4C09641A1F;
 Fri, 13 Mar 2026 06:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01614C19421;
 Fri, 13 Mar 2026 06:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773384544;
 bh=ern4CUk8uyBHb+LhhpcdpQtOYG1GRZivwnevMo0iwtU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=tmduMPgq5jCRIzwLUv1A8IAg7q6GBQcPWq57Gsoz2AYFSWxak9QmncOnmLWLfcgI5
 wwggMaYoRVUFkR4wB8bNdYyDZammGRINzPhFl2jjV0ovZ6ekniBluW33v0BYEsPi1A
 Nyfc6Hi2/m2rsibV8P/vlTNBPZegxjdsdS+HIr9ebETMgg1KnX7p03o48jnFa8P4G7
 dI0wM0C9ud5WejZvgT8z6odqJiM9bWpKnkTQxH3MUtt6EO8Woks0dGlW6XpNM4kSiS
 Fd1BSKAoYQc2ITq9sDt14+yNzgZAP4ciIy5JOqP7GDaMgAuVcQfPDmEPndVNeoHt7q
 0BFif87y75j0w==
Message-ID: <2625a3fc-7dc6-4764-877c-ffeeeb42276c@kernel.org>
Date: Fri, 13 Mar 2026 14:48:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>
References: <20260310175428.1156719-1-daeho43@gmail.com>
 <fbaaef01-5a66-407e-b447-b5741b42d309@kernel.org>
 <CACOAw_yXPoSBox4o5pMv_0Jv0B8yHA6TFakcKNOpGZWKBSZYKw@mail.gmail.com>
 <615947f2-fe08-4875-87d9-baef36897e81@kernel.org>
 <CACOAw_wUpR=8qXi06VLCk_oH5qL+_RVqzMAP8x4JaTE9Te3WQw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CACOAw_wUpR=8qXi06VLCk_oH5qL+_RVqzMAP8x4JaTE9Te3WQw@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/12/2026 11:28 PM, Daeho Jeong wrote: > On Thu, Mar 12, 
 2026 at 2:07 AM Chao Yu <chao@kernel.org> wrote: >> >> On 2026/3/12 00:05,
 Daeho Jeong wrote: >>> On Wed, Mar 11, 2026 at 6:44 AM Chao Yu <c [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w0wKg-0005Uk-Nq
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to skip empty sections in
 f2fs_get_victim
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
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
	FORGED_RECIPIENTS(0.00)[m:daeho43@gmail.com,m:daehojeong@google.com,m:kernel-team@android.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
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
X-Rspamd-Queue-Id: AE7DD27E53C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMy8xMi8yMDI2IDExOjI4IFBNLCBEYWVobyBKZW9uZyB3cm90ZToKPiBPbiBUaHUsIE1hciAx
MiwgMjAyNiBhdCAyOjA34oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4K
Pj4gT24gMjAyNi8zLzEyIDAwOjA1LCBEYWVobyBKZW9uZyB3cm90ZToKPj4+IE9uIFdlZCwgTWFy
IDExLCAyMDI2IGF0IDY6NDTigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+
Pj4+Cj4+Pj4gT24gMjAyNi8zLzExIDAxOjU0LCBEYWVobyBKZW9uZyB3cm90ZToKPj4+Pj4gRnJv
bTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+Pj4KPj4+Pj4gSW4gYWdl
LWJhc2VkIHZpY3RpbSBzZWxlY3Rpb24gKEFUR0MsIEFUX1NTUiwgb3IgR0NfQ0IpLCBmMmZzX2dl
dF92aWN0aW0KPj4+Pj4gY2FuIGVuY291bnRlciBzZWN0aW9ucyB3aXRoIHplcm8gdmFsaWQgYmxv
Y2tzLiBUaGlzIHNpdHVhdGlvbiBvZnRlbgo+Pj4+PiBhcmlzZXMgd2hlbiBjaGVja3BvaW50IGlz
IGRpc2FibGVkIG9yIGR1ZSB0byByYWNlIGNvbmRpdGlvbnMgYmV0d2Vlbgo+Pj4+PiBTSVQgdXBk
YXRlcyBhbmQgZGlydHkgbGlzdCBtYW5hZ2VtZW50Lgo+Pj4+Pgo+Pj4+PiBJbiBzdWNoIGNhc2Vz
LCBmMmZzX2dldF9zZWN0aW9uX210aW1lKCkgcmV0dXJucyBJTlZBTElEX01USU1FLCB3aGljaAo+
Pj4+PiBzdWJzZXF1ZW50bHkgdHJpZ2dlcnMgYSBmYXRhbCBmMmZzX2J1Z19vbihzYmksIG10aW1l
ID09IElOVkFMSURfTVRJTUUpCj4+Pj4+IGluIGFkZF92aWN0aW1fZW50cnkoKSBvciBnZXRfY2Jf
Y29zdCgpLgo+Pj4+Pgo+Pj4+PiBUaGlzIHBhdGNoIGFkZHMgYSBjaGVjayBpbiBmMmZzX2dldF92
aWN0aW0ncyBzZWxlY3Rpb24gbG9vcCB0byBza2lwCj4+Pj4+IHNlY3Rpb25zIHdpdGggbm8gdmFs
aWQgYmxvY2tzLiBUaGlzIHByZXZlbnRzIHVubmVjZXNzYXJ5IGFnZQo+Pj4+PiBjYWxjdWxhdGlv
bnMgZm9yIGVtcHR5IHNlY3Rpb25zIGFuZCBhdm9pZHMgdGhlIGFzc29jaWF0ZWQga2VybmVsIHBh
bmljLgo+Pj4+PiBUaGlzIGNoYW5nZSBhbHNvIGFsbG93cyByZW1vdmluZyByZWR1bmRhbnQgY2hl
Y2tzIGluIGFkZF92aWN0aW1fZW50cnkoKS4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogRGFl
aG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICAgICBmcy9m
MmZzL2djLmMgfCA5ICsrKy0tLS0tLQo+Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
Z2MuYyBiL2ZzL2YyZnMvZ2MuYwo+Pj4+PiBpbmRleCAyZTBmNjc5NDY5MTQuLjk4MWVhYzYyOWZl
OSAxMDA2NDQKPj4+Pj4gLS0tIGEvZnMvZjJmcy9nYy5jCj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZ2Mu
Ywo+Pj4+PiBAQCAtNTIxLDEyICs1MjEsNiBAQCBzdGF0aWMgdm9pZCBhZGRfdmljdGltX2VudHJ5
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+Pj4gICAgICAgICBzdHJ1Y3Qgc2l0X2luZm8g
KnNpdF9pID0gU0lUX0koc2JpKTsKPj4+Pj4gICAgICAgICB1bnNpZ25lZCBsb25nIGxvbmcgbXRp
bWUgPSAwOwo+Pj4+Pgo+Pj4+PiAtICAgICBpZiAodW5saWtlbHkoaXNfc2JpX2ZsYWdfc2V0KHNi
aSwgU0JJX0NQX0RJU0FCTEVEKSkpIHsKPj4+Pj4gLSAgICAgICAgICAgICBpZiAocC0+Z2NfbW9k
ZSA9PSBHQ19BVCAmJgo+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgZ2V0X3ZhbGlkX2Jsb2Nr
cyhzYmksIHNlZ25vLCB0cnVlKSA9PSAwKQo+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuOwo+Pj4+PiAtICAgICB9Cj4+Pj4+IC0KPj4+Pj4gICAgICAgICBtdGltZSA9IGYyZnNfZ2V0
X3NlY3Rpb25fbXRpbWUoc2JpLCBzZWdubyk7Cj4+Pj4+ICAgICAgICAgZjJmc19idWdfb24oc2Jp
LCBtdGltZSA9PSBJTlZBTElEX01USU1FKTsKPj4+Pj4KPj4+Pj4gQEAgLTg4OSw2ICs4ODMsOSBA
QCBpbnQgZjJmc19nZXRfdmljdGltKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgdW5zaWduZWQg
aW50ICpyZXN1bHQsCj4+Pj4+ICAgICAgICAgICAgICAgICBpZiAoc2VjX3VzYWdlX2NoZWNrKHNi
aSwgc2Vjbm8pKQo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG5leHQ7Cj4+Pj4+
Cj4+Pj4+ICsgICAgICAgICAgICAgaWYgKCFnZXRfdmFsaWRfYmxvY2tzKHNiaSwgc2Vnbm8sIHRy
dWUpKQo+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgZ290byBuZXh0Owo+Pj4+Cj4+Pj4gV2Vs
bCwgZm9yIGYyZnNfZ2V0X3ZpY3RpbSgsIEFUX1NTUiksIG9uY2UgdGhlcmUgYXJlIG5vIGRpcnR5
IHNlZ21lbnQsIGlmIHdlCj4+Pj4gZG9uJ3QgY291bnQgZnJlZSBzZWdtZW50IGFzIGNhbmRpZGF0
ZXMsIHRoZW4sIHdlIGNhbiBub3QgZmluZCBhbnkgdmFsaWQgdmljdGltPwo+Pj4KPj4+IE9oLCBB
VF9TU1IgbmVlZHMgdG8gc2VsZWN0IHRoZSBmcmVlIHNlY3Rpb24gaW4gdGhpcyBjYXNlPwo+Pgo+
PiBJIHRoaW5rIHNvLCBmb3IgZXh0cmVtZSBjYXNlLgoKT2gsIGNoZWNrIHRoZSBjb2RlIGFnYWlu
LCBpdCBzZWVtcyB3ZSBzZWxlY3QgdmljdGltIGZyb20gZGlydHkgYml0bWFwLAp0aGUgdmljdGlt
IHNob3VsZCBub3QgYmUgYSBmcmVlIG9uZS4uLgoKQnV0IHRoZXJlIGlzIHNvbWUgZXhjZXB0aW9u
czoKCmxvY2F0ZV9kaXJ0eV9zZWdtZW50KCkKCglpZiAodmFsaWRfYmxvY2tzID09IDAgJiYgKCFp
c19zYmlfZmxhZ19zZXQoc2JpLCBTQklfQ1BfRElTQUJMRUQpIHx8CgkJY2twdF92YWxpZF9ibG9j
a3MgPT0gdXNhYmxlX2Jsb2NrcykpIHsKCQlfX2xvY2F0ZV9kaXJ0eV9zZWdtZW50KHNiaSwgc2Vn
bm8sIFBSRSk7CgkJX19yZW1vdmVfZGlydHlfc2VnbWVudChzYmksIHNlZ25vLCBESVJUWSk7CgpJ
ZiB2YWxpZF9ibG9ja3MgZXF1YWxzIHRvIHplcm8sIGJ1dCBpZiB0aGUgY2hlY2twb2ludCBpcyBk
aXNhYmxlZCBhbmQgYWxzbwpja3B0X3ZhbGlkX2Jsb2NrcyBkb2Vzbid0IGVxdWFscyB0byB1c2Fi
bGVfYmxvY2tzLiBUaGUgc2VnbWVudCAob3Igc2VjdGlvbikKd2lsbCBzdGlsbCBiZSBkaXJ0eSBz
dGF0ZSBpbiBkaXJ0eSBiaXRtYXAuCgpXZSBuZWVkIHRvIGhhbmRsZSB0aGlzIGNvcnJlY3RseSBp
biBmMmZzX2dldF92aWN0aW0oKSBjb3JyZWN0bHkgYmVmb3JlIGNhbGxpbmcKaW50byBhZGRfdmlj
dGltX2VudHJ5KCkgb3IgZ2V0X2djX2Nvc3QoKT8KCgoJCS8qIERvbid0IHRvdWNoIGNoZWNrcG9p
bnRlZCBkYXRhICovCgkJaWYgKHVubGlrZWx5KGlzX3NiaV9mbGFnX3NldChzYmksIFNCSV9DUF9E
SVNBQkxFRCkpKSB7CgkJCWlmIChwLmFsbG9jX21vZGUgPT0gTEZTKSB7CgkJCQkvKgoJCQkJICog
TEZTIGlzIHNldCB0byBmaW5kIHNvdXJjZSBzZWN0aW9uIGR1cmluZyBHQy4KCQkJCSAqIFRoZSB2
aWN0aW0gc2hvdWxkIGhhdmUgbm8gY2hlY2twb2ludGVkIGRhdGEuCgkJCQkgKi8KCQkJCWlmIChn
ZXRfY2twdF92YWxpZF9ibG9ja3Moc2JpLCBzZWdubywgdHJ1ZSkpCgkJCQkJZ290byBuZXh0OwoJ
CQl9IGVsc2UgewoJCQkJLyoKCQkJCSAqIFNTUiB8IEFUX1NTUiBhcmUgc2V0IHRvIGZpbmQgdGFy
Z2V0IHNlZ21lbnQKCQkJCSAqIGZvciB3cml0ZXMgd2hpY2ggY2FuIGJlIGZ1bGwgYnkgY2hlY2tw
b2ludGVkCgkJCQkgKiBhbmQgbmV3bHkgd3JpdHRlbiBibG9ja3MuCgkJCQkgKi8KCQkJCWlmICgh
ZjJmc19zZWdtZW50X2hhc19mcmVlX3Nsb3Qoc2JpLCBzZWdubykpCgkJCQkJZ290byBuZXh0OwoJ
CQl9CgoJCQlpZiAoIWdldF92YWxpZF9ibG9ja3Moc2JpLCBzZWdubywgdHJ1ZSkpCgkJCQlnb3Rv
IG5leHQ7CgkJCV5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl4KQ2FuIHRo
aXMgYmUgdGhlIGZpeD8KCj4+Cj4+PiBJIGFtIGNvbmZ1c2VkLiBXaHkgZG8gd2UgbmVlZCB0aGUg
YmVsb3cgbG9naWM/Cj4+PiBMb29rcyBsaWtlIFdBIGZvciB0aGUgQVRfU1NSIGNhc2U/Cj4+Pgo+
Pj4gSW4gZjJmc19nZXRfc2VjdGlvbl9tdGltZSgpCj4+PiBvdXQ6Cj4+PiAgICAgICAgICAgaWYg
KHVubGlrZWx5KG10aW1lID09IElOVkFMSURfTVRJTUUpKQo+Pj4gICAgICAgICAgICAgICAgICAg
bXRpbWUgLT0gMTsKPj4+ICAgICAgICAgICByZXR1cm4gbXRpbWU7Cj4+Cj4+IFRoZXJlIGFyZSB0
d28gY29uZGl0aW9ucywgaW4gYSBzZWN0aW9uOgo+Pgo+PiBhKSBpZiB0aGVyZSBhcmUgbm8gdmFs
aWQgYmxvY2tzLCBpdCB3aWxsIHJldHVybiBJTlZBTElEX01USU1FLgo+PiBiKSBpZiB0aGVyZSBh
cmUgdmFpbGQgYmxvY2tzLCBpdCB0cmllcyB0byByZXR1cm4gbXRpbWUgd2hpY2ggaXMgY2FsY3Vs
YXRlZCwgYnV0Cj4+IGlmIHVubHVja3kgdGhlIGNhbGN1bGF0ZWQgbXRpbWUgaXMgZXF1YWwgdG8g
SU5WQUxJRF9NVElNRSwgaW4gb3JkZXIgdG8gZGlzdGluZ3Vpc2gKPj4gZnJvbSBjYXNlIGEpLCB3
ZSB3aWxsIHJldHVybiBJTlZBTElEX01USU1FIC0gMSBpbnN0ZWFkLgo+IAo+IElmIHdlIGZpbmQg
YSBmcmVlIHNlZ21lbnQgYW5kIHBhc3MgaXQgdG8gZjJmc19nZXRfc2VjdGlvbl9tdGltZSgpIGZv
cgo+ICghX19pc19sYXJnZV9zZWN0aW9uKHNiaSkpIGNhc2UuCj4gV2hhdCBpcyB0aGUgZXhwZWN0
ZWQgb3V0cHV0IG9mIGl0PyAoSU5WQUxJRF9NVElNRSAtIDEpPwoKSXQgZGVwZW5kcyBvbiB0aGUg
c3RhdHVzIG9mIHNlY3Rpb24gdGhhdCBmcmVlIHNlZ21lbnQgYmVsb25nIHRvOgpJZiB0aGVyZSBp
cyBubyB2YWxpZCBibG9jayBpbiB0aGUgc2VjdGlvbiwgaXQgd2lsbCByZXR1cm4gSU5WQUxJRF9N
VElNRSwKb3RoZXJ3aXNlIGl0IHdpbGwgcmV0dXJuIGNhbGN1YXRlZCBtdGltZSwgb3IgSU5WQUxJ
RF9NVElNRSAtIDEgZm9yCmV4dHJlbWUgY2FzZSB0aGF0IG10aW1lIGlzIGp1c3QgdW5sdWNraWx5
IGVxdWFscyB0byBJTlZBTElEX01USU1FLgoKVGhhbmtzLAoKPiBJIGRvbid0IHRoaW5rIHRoaXMg
aXMganVzdCBhbiB1bmx1Y2t5IGNhc2UuIElzIHRoaXMgZXhwZWN0ZWQgcmVzdWx0Pwo+IAo+Pgo+
PiBUaGFua3MsCj4+Cj4+Pgo+Pj4KPj4+Pgo+Pj4+IFRoYW5rcywKPj4+Pgo+Pj4+PiArCj4+Pj4+
ICAgICAgICAgICAgICAgICAvKiBEb24ndCB0b3VjaCBjaGVja3BvaW50ZWQgZGF0YSAqLwo+Pj4+
PiAgICAgICAgICAgICAgICAgaWYgKHVubGlrZWx5KGlzX3NiaV9mbGFnX3NldChzYmksIFNCSV9D
UF9ESVNBQkxFRCkpKSB7Cj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChwLmFsbG9j
X21vZGUgPT0gTEZTKSB7Cj4+Pj4KPj4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
