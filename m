Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WXKHCQETMmqruQUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2026 05:22:41 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 695CE696491
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2026 05:22:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="OD9F/EP6";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=YPPkDIrj;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=F+YaeSh6;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=asfp+Bjp;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZ1OCkCHtc9Yi4yKbIaLE4owWO9ldbogg7DVIGtAlRQ=; b=OD9F/EP65t1D39cYDLKaSxnCqw
	Wg49gaj1KlpYAvDkBzDdtIB2TD0BCDGvwoSzSZZ4dOqPdVk0Z6Y+OOvvEnHVjSTEaqC3PtAyrYVRe
	CjDvm9Xd86c9Z1saXSBV0jXZLKpw1ZyfbUhl8di2yr6Fvlw809ry+ygSAlU7kMurInpw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZgrF-0007Nv-5L;
	Wed, 17 Jun 2026 03:22:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZgrD-0007No-Ll
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jun 2026 03:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JpRXXFWr+OUkXVLiDRgd6O5mu6GiCtn/fAK63lo6dug=; b=YPPkDIrjWJk+vm+wNRhz0S8StU
 cGYTGgHofc0pUJnhfLctvRfTunhdnzSlwdKVbQ6F6YEBtCEb9auumCTlO5V9ZIcLJff8mn7n94ZY7
 8Xj0bmG1S9mdcCaVqEZDVo1GxByfSos43eCitqP3ksEpzItzxUISs2S0pxH0AdGGGXxM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JpRXXFWr+OUkXVLiDRgd6O5mu6GiCtn/fAK63lo6dug=; b=F+YaeSh68WGctZ9aLujAM6VuHk
 /X36QxH0aMhL96tJvW3l9D56yH0R/ySCBzTUXA6i+qEV/6Fzi6TETKPg6nDlgUxso4G+FLWgn3YjJ
 d5nUlCqjsMNPMSkarqXZOa+91CEsjRCFudSwqE2h+zzu3T2CsMToSNt0Ds2nGpbv2PP4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZgrC-0007Bj-HT for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jun 2026 03:22:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A46B64179B;
 Wed, 17 Jun 2026 03:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE341F000E9;
 Wed, 17 Jun 2026 03:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781666536;
 bh=JpRXXFWr+OUkXVLiDRgd6O5mu6GiCtn/fAK63lo6dug=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=asfp+Bjp7bHtFmI9k2Qx3VjRR/D9DnTV0MMx+UczlDi2ijeERKsRyMVlpYtvimpNn
 IIIH/aunphG8/IOk+PRrcZUEwjwzV+9hxU+h3AnM2zz/bETY1saire7xr1I3B+OGJv
 g8F34updbZIhT8fsMccPL8AxomgMdNUJriaWbc7+urt0OB91qowHtfnBgaWWj3Boh1
 tzdjVPNyyg1QDJOFqYaXA0DC4NF+NTgVCc9V0ro9S4kxFt53Z577dpD4KxLgf3rALQ
 cXAsN/sRQET5MzeQEG/D2Uf8l97kyAY4qebiVQ7uco687U+We/z838Y3CWyRGItprV
 QFCANFEDq4YeQ==
Message-ID: <2d5fa8e8-a1f5-4213-b3d3-fc3526057dfd@kernel.org>
Date: Wed, 17 Jun 2026 11:22:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20260616123625.3300340-1-chao@kernel.org>
 <CAHJ8P3JYKnQfd7PwQ0DQShy2UnsNfNZKeyDn7dyyyVkB3rKSww@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3JYKnQfd7PwQ0DQShy2UnsNfNZKeyDn7dyyyVkB3rKSww@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 6/17/26 10:53, Zhiguo Niu wrote: > Chao Yu via Linux-f2fs-devel
    <linux-f2fs-devel@lists.sourceforge.net> > 于2026年6月16日周二 20:39写道：
    >> >> When allocating memory in aligned_xalloc(), [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
X-Headers-End: 1wZgrC-0007Bj-HT
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: adapt w/ page_size in
 aligned_xalloc()
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
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
	FORGED_RECIPIENTS(0.00)[m:niuzhiguo84@gmail.com,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
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
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 695CE696491

T24gNi8xNy8yNiAxMDo1MywgWmhpZ3VvIE5pdSB3cm90ZToKPiBDaGFvIFl1IHZpYSBMaW51eC1m
MmZzLWRldmVsIDxsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldD4KPiDkuo4y
MDI25bm0NuaciDE25pel5ZGo5LqMIDIwOjM55YaZ6YGT77yaCj4+Cj4+IFdoZW4gYWxsb2NhdGlu
ZyBtZW1vcnkgaW4gYWxpZ25lZF94YWxsb2MoKSwgaWYgdGhlIHJlcXVlc3RlZCBhbGlnbm1lbnQK
Pj4gKGUuZy4sIEYyRlNfREVGQVVMVF9CTEtTSVpFKSBpcyBzbWFsbGVyIHRoYW4gdGhlIHN5c3Rl
bSdzIHBhZ2Ugc2l6ZSwKPj4gYWxpZ25lZF9hbGxvYygpIHdpbGwgYWxsb2NhdGUgbWVtb3J5IHRo
YXQgaXMgbm90IHBhZ2UtYWxpZ25lZCBvbiBzeXN0ZW1zCj4+IHdpdGggMTZLQiBvciA2NEtCIHBh
Z2Ugc2l6ZXMuCj4+Cj4+IEFzIGEgcmVzdWx0LCBzdWJzZXF1ZW50IGNhbGxzIHRvIG1hZHZpc2Uo
Li4uLCBNQURWX0hVR0VQQUdFKSB3aWxsIGZhaWwKPj4gYmVjYXVzZSBtYWR2aXNlKCkgcmVxdWly
ZXMgdGhlIG1lbW9yeSBhZGRyZXNzIGFuZCBsZW5ndGggdG8gYmUgcGFnZS1hbGlnbmVkLgo+Pgo+
PiBGaXggdGhpcyBieSBkeW5hbWljYWxseSBhZGp1c3RpbmcgdGhlIGFsaWdubWVudCBhbmQgcm91
bmRpbmcgdXAgdGhlIHJlcXVlc3RlZAo+PiBhbGxvY2F0aW9uIHNpemUgKHZpYSByb3VuZHVwKCkp
IHRvIHRoZSBzeXN0ZW0ncyBwYWdlIHNpemUsIGVuc3VyaW5nIHRoYXQKPj4gbWVtb3J5IGlzIGNv
cnJlY3RseSBwYWdlLWFsaWduZWQgZm9yIG1hZHZpc2UoKS4gQWxzbyB1cGRhdGUgbWFkdmlzZSgp
IGZhaWx1cmUKPj4gdG8gY2FsbCBkaWUoKSBmb3IgYmV0dGVyIGVycm9yIHJlcG9ydGluZy4KPiBI
aSBDaGFvLAo+IGRvbid0IHNlZSB0aGlzIHBhcnQgaW4gY3VycmVudCBwYXRjaD8gInVwZGF0ZSBt
YWR2aXNlKCkgZmFpbHVyZQo+IHRvIGNhbGwgZGllKCkgZm9yIGJldHRlciBlcnJvciByZXBvcnRp
bmciCgpPaCwgSSBtaXNzZWQgdG8gdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZSB3aGVuIHNxdWFz
aGluZyB0d28gc2VwYXJhdGVkIHBhdGNoZXMuLi4KcGxlYXNlIGlnbm9yZSB0aGlzIGNvbW1lbnQs
IHNvcnJ5LgoKVGhhbmtzLAoKPiB0aGFua3MhCj4gCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENoYW8g
WXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4gLS0tCj4+ICB0b29scy9mMmZzX2lvL2YyZnNfaW8uYyB8
IDE3ICsrKysrKysrKysrKysrKysrCj4+ICB0b29scy9mMmZzX2lvL2YyZnNfaW8uaCB8ICAzICsr
Kwo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQg
YS90b29scy9mMmZzX2lvL2YyZnNfaW8uYyBiL3Rvb2xzL2YyZnNfaW8vZjJmc19pby5jCj4+IGlu
ZGV4IDk0ZTYxYjguLjlhODY2Y2MgMTAwNjQ0Cj4+IC0tLSBhL3Rvb2xzL2YyZnNfaW8vZjJmc19p
by5jCj4+ICsrKyBiL3Rvb2xzL2YyZnNfaW8vZjJmc19pby5jCj4+IEBAIC05Nyw2ICs5NywyMyBA
QCBzdGF0aWMgdm9pZCAqeG1hbGxvYyhzaXplX3Qgc2l6ZSkKPj4KPj4gIHN0YXRpYyB2b2lkICph
bGlnbmVkX3hhbGxvYyhzaXplX3QgYWxpZ25tZW50LCBzaXplX3Qgc2l6ZSkKPj4gIHsKPj4gKyAg
ICAgICBsb25nIHBhZ2Vfc2l6ZSA9IEYyRlNfREVGQVVMVF9CTEtTSVpFOwo+PiArCj4+ICsjaWZk
ZWYgX1NDX1BBR0VTSVpFCj4+ICsgICAgICAgcGFnZV9zaXplID0gc3lzY29uZihfU0NfUEFHRVNJ
WkUpOwo+PiArICAgICAgIGlmIChwYWdlX3NpemUgPCAwKQo+PiArICAgICAgICAgICAgICAgcGFn
ZV9zaXplID0gRjJGU19ERUZBVUxUX0JMS1NJWkU7Cj4+ICsjZW5kaWYKPj4gKwo+PiArICAgICAg
IC8qCj4+ICsgICAgICAgICogT24gc3lzdGVtcyB3aXRoIGxhcmdlIHBhZ2Ugc2l6ZXMgKGUuZy4s
IDE2S0IvNjRLQiksIGFsaWdubWVudCBhbmQKPj4gKyAgICAgICAgKiBhbGxvY2F0aW9uIHNpemUg
bXVzdCBiZSBwYWdlLWFsaWduZWQgdG8gc2F0aXNmeSBtYWR2aXNlKCkuCj4+ICsgICAgICAgICov
Cj4+ICsgICAgICAgaWYgKGFsaWdubWVudCA8IChzaXplX3QpcGFnZV9zaXplKQo+PiArICAgICAg
ICAgICAgICAgYWxpZ25tZW50ID0gcGFnZV9zaXplOwo+PiArCj4+ICsgICAgICAgc2l6ZSA9IHJv
dW5kdXAoc2l6ZSwgYWxpZ25tZW50KTsKPj4gKwo+PiAgICAgICAgIHZvaWQgKnAgPSBhbGlnbmVk
X2FsbG9jKGFsaWdubWVudCwgc2l6ZSk7Cj4+Cj4+ICAgICAgICAgaWYgKCFwKQo+PiBkaWZmIC0t
Z2l0IGEvdG9vbHMvZjJmc19pby9mMmZzX2lvLmggYi90b29scy9mMmZzX2lvL2YyZnNfaW8uaAo+
PiBpbmRleCA1Mzk5NjRmLi5jZjFjMzM0IDEwMDY0NAo+PiAtLS0gYS90b29scy9mMmZzX2lvL2Yy
ZnNfaW8uaAo+PiArKysgYi90b29scy9mMmZzX2lvL2YyZnNfaW8uaAo+PiBAQCAtNDksNiArNDks
OSBAQCB0eXBlZGVmIHUzMiAgIF9fYmUzMjsKPj4gICNlbmRpZgo+Pgo+PiAgI2RlZmluZSBGMkZT
X0RFRkFVTFRfQkxLU0laRSAgIDQwOTYKPj4gKyNpZm5kZWYgcm91bmR1cAo+PiArI2RlZmluZSBy
b3VuZHVwKHgsIHkpICAgICAgICAgICgoKCh4KSArICgoeSkgLSAxKSkgLyAoeSkpICogKHkpKQo+
PiArI2VuZGlmCj4+ICAjZGVmaW5lIE5FV19BRERSICAgICAgIDB4RkZGRkZGRkYKPj4KPj4gICNp
Zm5kZWYgRlNfSU9DX0dFVEZMQUdTCj4+IC0tCj4+IDIuNDkuMAo+Pgo+Pgo+Pgo+PiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdAo+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dAo+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
