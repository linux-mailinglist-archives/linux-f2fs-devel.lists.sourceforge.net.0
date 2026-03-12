Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAZBGmiCsmm6NAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 10:07:52 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B3226F5E5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 10:07:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qf0bjJdhn5jDA6qaKKY9sX76VRG8cZ5sopCTbIPlwic=; b=Dmg9COJwg6rZx8XaGz2Rm38gHv
	3mv3IokWcKBA0kcxvYPC7+M0VjWKm7GtTgZpQxs33SKqG6jbzTUelO7Ma1R2ecnq+fZbmhKD9FM/n
	0AgYw5lC06rxfizKGB2RaAwu5PcEHb9T7WeM6TbmIATURSYVEaphz9B3uzrCH6tmJYlQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0c16-0006ya-8S;
	Thu, 12 Mar 2026 09:07:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w0c15-0006yU-2x
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 09:07:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vLztMI0UBSCiClUTIXOjwV2AgkelfLHaPH8S1t3OWO4=; b=jHTHu8tVRCZI40gTdvxKaQkny6
 B6EMOV7CzZMCgJi+WAKS0yjlpdOT/4BhWlqdqu9/zMuhTMj1kArQMM8KKNPR/VdY6GLgH8vEhXlQa
 fGRtvdhizDA8ORJAIlo9OE4lTeFPP8ffxsI/+ONoGwyvnoUrguKSH62W+2p2zQu8h//E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vLztMI0UBSCiClUTIXOjwV2AgkelfLHaPH8S1t3OWO4=; b=Brt95n+ny2oClgZTilq+X+i2lP
 2G1prfgaHUuqlD3s0n9Q/htKi63YLPg8jPXkWCUf33MU9HN34UynSBf5qmHSEtekbcKhZ+wYXlN6N
 YVUHbnmOPVKbiIIW+RyzkD0auJCaX3ZEio3nKbypV/Ly9AbigRrE2SxDogR0p1DY+Gzg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0c14-00019G-Iz for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 09:07:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 449AA43D9F;
 Thu, 12 Mar 2026 09:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ACC9C4CEF7;
 Thu, 12 Mar 2026 09:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773306448;
 bh=7sKKM7B1l0YE6cKv+8Rpmlenk89m5zJGk1VYqlRhXbw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=JljbLDgC33B7+ouHCEnYtNkS/GTNX8Msg5J8XTiKTG/NPDhGRQXUE0ITrZPjuA2pY
 AFaNXxrjgJxVAPuYOAHN4J6+FQoMJgFJ80W0xqvtNkr5ImFwT4DIagOQ8DxGQdCM1C
 MM5iG33chfJxqGrDgS13hV8ZIOTkLDGghpAut3G2JQOjHwwhGnKY2ifvLQU+D0h2iO
 Rekr2r4gQL7hODO93VhhzdFpbteLLQ59Fl+mXAxXDYt0N6Jry5aI4zuWX+bLC+ONPe
 Dlz//fdMXtedQ2zN6nFJHQeFB1jKjDqdH950DI7PCsY8mzksMF1jZNJV9UpVbAoCuE
 wDnSOY7Yagq+Q==
Message-ID: <615947f2-fe08-4875-87d9-baef36897e81@kernel.org>
Date: Thu, 12 Mar 2026 17:07:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>
References: <20260310175428.1156719-1-daeho43@gmail.com>
 <fbaaef01-5a66-407e-b447-b5741b42d309@kernel.org>
 <CACOAw_yXPoSBox4o5pMv_0Jv0B8yHA6TFakcKNOpGZWKBSZYKw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CACOAw_yXPoSBox4o5pMv_0Jv0B8yHA6TFakcKNOpGZWKBSZYKw@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/12 00:05, Daeho Jeong wrote: > On Wed, Mar 11, 2026
 at 6:44 AM Chao Yu <chao@kernel.org> wrote: >> >> On 2026/3/11 01:54, Daeho
 Jeong wrote: >>> From: Daeho Jeong <daehojeong@google.com> >>> [...] 
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
X-Headers-End: 1w0c14-00019G-Iz
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
X-Rspamd-Queue-Id: 85B3226F5E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMjAyNi8zLzEyIDAwOjA1LCBEYWVobyBKZW9uZyB3cm90ZToKPiBPbiBXZWQsIE1hciAxMSwg
MjAyNiBhdCA2OjQ04oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4g
T24gMjAyNi8zLzExIDAxOjU0LCBEYWVobyBKZW9uZyB3cm90ZToKPj4+IEZyb206IERhZWhvIEpl
b25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4+Pgo+Pj4gSW4gYWdlLWJhc2VkIHZpY3RpbSBz
ZWxlY3Rpb24gKEFUR0MsIEFUX1NTUiwgb3IgR0NfQ0IpLCBmMmZzX2dldF92aWN0aW0KPj4+IGNh
biBlbmNvdW50ZXIgc2VjdGlvbnMgd2l0aCB6ZXJvIHZhbGlkIGJsb2Nrcy4gVGhpcyBzaXR1YXRp
b24gb2Z0ZW4KPj4+IGFyaXNlcyB3aGVuIGNoZWNrcG9pbnQgaXMgZGlzYWJsZWQgb3IgZHVlIHRv
IHJhY2UgY29uZGl0aW9ucyBiZXR3ZWVuCj4+PiBTSVQgdXBkYXRlcyBhbmQgZGlydHkgbGlzdCBt
YW5hZ2VtZW50Lgo+Pj4KPj4+IEluIHN1Y2ggY2FzZXMsIGYyZnNfZ2V0X3NlY3Rpb25fbXRpbWUo
KSByZXR1cm5zIElOVkFMSURfTVRJTUUsIHdoaWNoCj4+PiBzdWJzZXF1ZW50bHkgdHJpZ2dlcnMg
YSBmYXRhbCBmMmZzX2J1Z19vbihzYmksIG10aW1lID09IElOVkFMSURfTVRJTUUpCj4+PiBpbiBh
ZGRfdmljdGltX2VudHJ5KCkgb3IgZ2V0X2NiX2Nvc3QoKS4KPj4+Cj4+PiBUaGlzIHBhdGNoIGFk
ZHMgYSBjaGVjayBpbiBmMmZzX2dldF92aWN0aW0ncyBzZWxlY3Rpb24gbG9vcCB0byBza2lwCj4+
PiBzZWN0aW9ucyB3aXRoIG5vIHZhbGlkIGJsb2Nrcy4gVGhpcyBwcmV2ZW50cyB1bm5lY2Vzc2Fy
eSBhZ2UKPj4+IGNhbGN1bGF0aW9ucyBmb3IgZW1wdHkgc2VjdGlvbnMgYW5kIGF2b2lkcyB0aGUg
YXNzb2NpYXRlZCBrZXJuZWwgcGFuaWMuCj4+PiBUaGlzIGNoYW5nZSBhbHNvIGFsbG93cyByZW1v
dmluZyByZWR1bmRhbnQgY2hlY2tzIGluIGFkZF92aWN0aW1fZW50cnkoKS4KPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+Pj4gLS0tCj4+
PiAgICBmcy9mMmZzL2djLmMgfCA5ICsrKy0tLS0tLQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9nYy5jIGIvZnMvZjJmcy9nYy5jCj4+PiBpbmRleCAyZTBmNjc5NDY5MTQuLjk4MWVhYzYyOWZl
OSAxMDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMvZ2MuYwo+Pj4gKysrIGIvZnMvZjJmcy9nYy5jCj4+
PiBAQCAtNTIxLDEyICs1MjEsNiBAQCBzdGF0aWMgdm9pZCBhZGRfdmljdGltX2VudHJ5KHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+ICAgICAgICBzdHJ1Y3Qgc2l0X2luZm8gKnNpdF9pID0g
U0lUX0koc2JpKTsKPj4+ICAgICAgICB1bnNpZ25lZCBsb25nIGxvbmcgbXRpbWUgPSAwOwo+Pj4K
Pj4+IC0gICAgIGlmICh1bmxpa2VseShpc19zYmlfZmxhZ19zZXQoc2JpLCBTQklfQ1BfRElTQUJM
RUQpKSkgewo+Pj4gLSAgICAgICAgICAgICBpZiAocC0+Z2NfbW9kZSA9PSBHQ19BVCAmJgo+Pj4g
LSAgICAgICAgICAgICAgICAgICAgIGdldF92YWxpZF9ibG9ja3Moc2JpLCBzZWdubywgdHJ1ZSkg
PT0gMCkKPj4+IC0gICAgICAgICAgICAgICAgICAgICByZXR1cm47Cj4+PiAtICAgICB9Cj4+PiAt
Cj4+PiAgICAgICAgbXRpbWUgPSBmMmZzX2dldF9zZWN0aW9uX210aW1lKHNiaSwgc2Vnbm8pOwo+
Pj4gICAgICAgIGYyZnNfYnVnX29uKHNiaSwgbXRpbWUgPT0gSU5WQUxJRF9NVElNRSk7Cj4+Pgo+
Pj4gQEAgLTg4OSw2ICs4ODMsOSBAQCBpbnQgZjJmc19nZXRfdmljdGltKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSwgdW5zaWduZWQgaW50ICpyZXN1bHQsCj4+PiAgICAgICAgICAgICAgICBpZiAo
c2VjX3VzYWdlX2NoZWNrKHNiaSwgc2Vjbm8pKQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICBn
b3RvIG5leHQ7Cj4+Pgo+Pj4gKyAgICAgICAgICAgICBpZiAoIWdldF92YWxpZF9ibG9ja3Moc2Jp
LCBzZWdubywgdHJ1ZSkpCj4+PiArICAgICAgICAgICAgICAgICAgICAgZ290byBuZXh0Owo+Pgo+
PiBXZWxsLCBmb3IgZjJmc19nZXRfdmljdGltKCwgQVRfU1NSKSwgb25jZSB0aGVyZSBhcmUgbm8g
ZGlydHkgc2VnbWVudCwgaWYgd2UKPj4gZG9uJ3QgY291bnQgZnJlZSBzZWdtZW50IGFzIGNhbmRp
ZGF0ZXMsIHRoZW4sIHdlIGNhbiBub3QgZmluZCBhbnkgdmFsaWQgdmljdGltPwo+IAo+IE9oLCBB
VF9TU1IgbmVlZHMgdG8gc2VsZWN0IHRoZSBmcmVlIHNlY3Rpb24gaW4gdGhpcyBjYXNlPwoKSSB0
aGluayBzbywgZm9yIGV4dHJlbWUgY2FzZS4KCj4gSSBhbSBjb25mdXNlZC4gV2h5IGRvIHdlIG5l
ZWQgdGhlIGJlbG93IGxvZ2ljPwo+IExvb2tzIGxpa2UgV0EgZm9yIHRoZSBBVF9TU1IgY2FzZT8K
PiAKPiBJbiBmMmZzX2dldF9zZWN0aW9uX210aW1lKCkKPiBvdXQ6Cj4gICAgICAgICAgaWYgKHVu
bGlrZWx5KG10aW1lID09IElOVkFMSURfTVRJTUUpKQo+ICAgICAgICAgICAgICAgICAgbXRpbWUg
LT0gMTsKPiAgICAgICAgICByZXR1cm4gbXRpbWU7CgpUaGVyZSBhcmUgdHdvIGNvbmRpdGlvbnMs
IGluIGEgc2VjdGlvbjoKCmEpIGlmIHRoZXJlIGFyZSBubyB2YWxpZCBibG9ja3MsIGl0IHdpbGwg
cmV0dXJuIElOVkFMSURfTVRJTUUuCmIpIGlmIHRoZXJlIGFyZSB2YWlsZCBibG9ja3MsIGl0IHRy
aWVzIHRvIHJldHVybiBtdGltZSB3aGljaCBpcyBjYWxjdWxhdGVkLCBidXQKaWYgdW5sdWNreSB0
aGUgY2FsY3VsYXRlZCBtdGltZSBpcyBlcXVhbCB0byBJTlZBTElEX01USU1FLCBpbiBvcmRlciB0
byBkaXN0aW5ndWlzaApmcm9tIGNhc2UgYSksIHdlIHdpbGwgcmV0dXJuIElOVkFMSURfTVRJTUUg
LSAxIGluc3RlYWQuCgpUaGFua3MsCgo+IAo+IAo+Pgo+PiBUaGFua3MsCj4+Cj4+PiArCj4+PiAg
ICAgICAgICAgICAgICAvKiBEb24ndCB0b3VjaCBjaGVja3BvaW50ZWQgZGF0YSAqLwo+Pj4gICAg
ICAgICAgICAgICAgaWYgKHVubGlrZWx5KGlzX3NiaV9mbGFnX3NldChzYmksIFNCSV9DUF9ESVNB
QkxFRCkpKSB7Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgIGlmIChwLmFsbG9jX21vZGUgPT0g
TEZTKSB7Cj4+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
