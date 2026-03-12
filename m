Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMoDB4cWsmkiIgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 02:27:35 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 334CF26BF04
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 02:27:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=na05uh8g6LnBA6v7JHoSPK8vrQDUq/DRKEWLGDaqrdg=; b=dy68Nvl6DGKXlKePSM04M3HeHV
	YlCLB8D/G5QdZxIODxAV6A6td6wnA+w7JljaYNco09NXHmzKiea5NUPvYe36Bj9gCxQ9QNQb2Sr54
	zRSQgoqeLxl4Cl1QlWGAk3ZmxlZ+vbJYJ6FXqM8WGbkjecv1THDYIO21/L3TNmGcONMo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0Upi-0007lI-Pj;
	Thu, 12 Mar 2026 01:27:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w0Uph-0007l9-3G
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 01:27:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F62dLgt54wK66KA6eprqu72xHHNlYPsVBbheISbAlto=; b=Gx8WjuDNnF+AM4W2n0WPs7eNNi
 e/6uYvdxc+ZF2viXH+5vN8woxvdY86oRBYQw/WXcWC2zwBzD1+E+vk+KekpB4xozKrYy6oAC23gPM
 Y7qDrokvsBPSUBNx7BDSOZcV7fVWaN59TCCbAsl21GJdTKNPhZE+R4Ri8Tp8ncHNd9PY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F62dLgt54wK66KA6eprqu72xHHNlYPsVBbheISbAlto=; b=cQDw9Yku7bWjKEADScKrEsADAm
 6EBpYah730CwAJp2Ctrdt3fTCLY6GNU4SmbMwTd31FV7n+QuxfHdE2cR/aXgOccFK92KoEHf1j4BS
 rXXR4HqC8gknVxwpyGTsKAJaQl8hPQjJcMxd+H8YQQBgdKku8IbsKOfDdOAAS+rPVO0M=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0Upg-0003fg-J8 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 01:27:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 007D9404E1;
 Thu, 12 Mar 2026 01:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF91C4CEF7;
 Thu, 12 Mar 2026 01:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773278833;
 bh=ZpLJ1m4d1eOZgxraCRSxLeTyI9+/BQSTxualWHc+TuY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=L2O7DZdGLMsirBa+nrPfOcfEdmd3dfAog2vjsQr8uVgI8x4lLcDO9NTg4kY3E/twZ
 V8FZqmyw5xJAoL3xjFKzZQQOVWjZ4V1P8EbCUiMG5CiUNSRbLkIfbjxZHT9cgkwcrg
 D4GzspdkfvGTSz3aalD65VghK8tBjF/WlFEfLeWrEqkk8wFdu/3H2qucAScK2FJQyQ
 2RYloOqt00cOkvI/Ku0RNi5P54D2yLdQcJh8zOzX+Wu2T+9eKf/Qp3iEhNkFL9pxzl
 VQBhY3txHoxHQHkFelmJFQU7Kqnw/AKFcpULbDvP3sSf2KMp/KmMmK4omfTDhFQnQy
 e6FOlnuBhLvag==
Message-ID: <d5a7a17b-bddf-4615-bae3-347a048d186c@kernel.org>
Date: Thu, 12 Mar 2026 09:27:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>
References: <20260310204916.1265736-1-daeho43@gmail.com>
 <2ab52a8d-a21b-4b74-a2a1-d7b51fb60ca6@kernel.org>
 <CACOAw_z-vDFjp8mkBPaBvibDMbAmLBcisjUxu=8A5pqaKGEfEQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CACOAw_z-vDFjp8mkBPaBvibDMbAmLBcisjUxu=8A5pqaKGEfEQ@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/12 00:00, Daeho Jeong wrote: > On Wed, Mar 11, 2026
 at 7:59 AM Chao Yu <chao@kernel.org> wrote: >> >> On 2026/3/11 04:49, Daeho
 Jeong wrote: >>> From: Daeho Jeong <daehojeong@google.com> >>> [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w0Upg-0003fg-J8
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to freeze GC and discard threads
 quickly
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
X-Rspamd-Queue-Id: 334CF26BF04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMjAyNi8zLzEyIDAwOjAwLCBEYWVobyBKZW9uZyB3cm90ZToKPiBPbiBXZWQsIE1hciAxMSwg
MjAyNiBhdCA3OjU54oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4g
T24gMjAyNi8zLzExIDA0OjQ5LCBEYWVobyBKZW9uZyB3cm90ZToKPj4+IEZyb206IERhZWhvIEpl
b25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4+Pgo+Pj4gU3VzcGVuZCBjYW4gZmFpbCBpZiBr
ZXJuZWwgdGhyZWFkcyBkbyBub3QgZnJlZXplIGZvciBhIHdoaWxlLgo+Pj4gZjJmc19nYyBhbmQg
ZjJmc19kaXNjYXJkIHRocmVhZHMgY2FuIHBlcmZvcm0gbG9uZy1ydW5uaW5nIG9wZXJhdGlvbnMK
Pj4+IHRoYXQgcHJldmVudCB0aGVtIGZyb20gcmVhY2hpbmcgYSBmcmVlemUgcG9pbnQgaW4gYSB0
aW1lbHkgbWFubmVyLgo+Pj4KPj4+IFRoaXMgcGF0Y2ggYWRkcyBleHBsaWNpdCBmcmVlemluZyBj
aGVja3MgaW4gdGhlIGZvbGxvd2luZyBsb2NhdGlvbnM6Cj4+PiAxLiBmMmZzX2djOiBBZGRlZCBh
IGNoZWNrIGF0IHRoZSAncmV0cnknIGxhYmVsIHRvIGV4aXQgdGhlIGxvb3AgcXVpY2tseQo+Pj4g
ICAgICBpZiBmcmVlemluZyBpcyByZXF1ZXN0ZWQsIGVzcGVjaWFsbHkgZHVyaW5nIGhlYXZ5IEdD
IHJvdW5kcy4KPj4+IDIuIF9faXNzdWVfZGlzY2FyZF9jbWQ6IEFkZGVkIGEgJ3N1c3BlbmRlZCcg
ZmxhZyB0byBicmVhayBib3RoIGlubmVyIGFuZAo+Pj4gICAgICBvdXRlciBsb29wcyBkdXJpbmcg
ZGlzY2FyZCBjb21tYW5kIGlzc3VhbmNlIGlmIGZyZWV6aW5nIGlzIGRldGVjdGVkCj4+PiAgICAg
IGFmdGVyIGF0IGxlYXN0IG9uZSBjb21tYW5kIGhhcyBiZWVuIGlzc3VlZC4KPj4+IDMuIF9faXNz
dWVfZGlzY2FyZF9jbWRfb3JkZXJseTogQWRkZWQgYSBzaW1pbGFyIGNoZWNrIGZvciBvcmRlcmx5
IGRpc2NhcmQKPj4+ICAgICAgdG8gZW5zdXJlIHJlc3BvbnNpdmVuZXNzLgo+Pj4KPj4+IFRoZXNl
IGNoZWNrcyBlbnN1cmUgdGhhdCB0aGUgdGhyZWFkcyByZWxlYXNlIGxvY2tzIHNhZmVseSBhbmQg
ZW50ZXIgdGhlCj4+PiBmcm96ZW4gc3RhdGUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRGFlaG8g
SmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+IC0tLQo+Pj4gICAgZnMvZjJmcy9nYy5j
ICAgICAgfCAgNCArKysrCj4+PiAgICBmcy9mMmZzL3NlZ21lbnQuYyB8IDE0ICsrKysrKysrKysr
Ky0tCj4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZ2MuYyBiL2ZzL2YyZnMvZ2MuYwo+Pj4g
aW5kZXggOTgxZWFjNjI5ZmU5Li5mZGMzMzY2YzRkYjMgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZz
L2djLmMKPj4+ICsrKyBiL2ZzL2YyZnMvZ2MuYwo+Pj4gQEAgLTE5NjIsNiArMTk2MiwxMCBAQCBp
bnQgZjJmc19nYyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBmMmZzX2djX2NvbnRy
b2wgKmdjX2NvbnRyb2wpCj4+PiAgICAgICAgICAgICAgICBnb3RvIHN0b3A7Cj4+PiAgICAgICAg
fQo+Pj4gICAgcmV0cnk6Cj4+PiArICAgICBpZiAodW5saWtlbHkoZnJlZXppbmcoY3VycmVudCkp
KSB7Cj4+PiArICAgICAgICAgICAgIHJldCA9IDA7Cj4+PiArICAgICAgICAgICAgIGdvdG8gc3Rv
cDsKPj4+ICsgICAgIH0KPj4KPj4gRG8gd2UgbmVlZCB0byBjaGVjayBmcmVlemluZygpIGR1cmlu
ZyBtdWx0aXBsZSBzZWdtZW50cyBtaWdyYXRpb24/Cj4+IGVzcGVjaWFsbHkgaW4gbGFyZ2Ugc2Vj
dGlvbiwgZS5nLiB6dWZzIGNhc2UuCj4gCj4gT3RoZXJ3aXNlLCB3ZSBjYW4ndCBtZWV0IHRoZSAx
IHNlY29uZCBzdXNwZW5kIHJlcXVpcmVtZW50IGZvciBBbmRyb2lkLgo+IFRoaXMgbG9naWMgbWFp
bmx5IHRhcmdldHMgenVmcyBwcm9hY3RpdmUgR0MgY2FzZXMuCj4gUGx1cywgYXJlbid0IHRoZSBy
ZW1haW5pbmcgc2VnbWVudHMgaW4gdGhlIHNlY3Rpb24gdGhlIG5leHQgdmljdGltcyBvZgo+IEdD
IGZvciB0aGUgbmV4dCByb3VuZD8KClNvcnJ5LCBJIGRpZG4ndCBnZXQgdGhlIHBvaW50LCBjb3Vs
ZCB5b3UgcGxlYXNlIGV4cGxhaW4gbW9yZSBhYm91dCB5b3VyIGNvbmNlcm4/CgpBY3R1YWxseSwg
d2hhdCBJIG1lYW4gaXMgaWYgd2UgbWlzc2VkIGZyZWV6ZWluZygpIGNoZWNrIGNvbmRpdGlvbiBp
biBmMmZzX2djKCksCmluIGRvX2dhcmJhZ2VfY29sbGVjdGlvbigpLCBhZnRlciB3ZSBtaWdyYXRl
ZCBvbmUgc2VnbWVudCBvZiBzZWN0aW9uLCBhbmQgYmVmb3JlCm1pZ3JhdGUgbmV4dCBzZWdtZW50
IGluIHNlY3Rpb24sIHdlIGNhbiBjaGVjayBmcmVlemluZygpIGNvbmRpdGlvbiBhdCB0aGlzIHRp
bWU/CgpJIG1lYW50IG1heWJlIHdlIGNhbiBhZGQgbW9yZSBjaGVjayBzcG90cyBpbiBkb19nYXJi
YWdlX2NvbGxlY3Rpb24oKS4KClRoYW5rcywKCj4gCj4+Cj4+PiAgICAgICAgcmV0ID0gX19nZXRf
dmljdGltKHNiaSwgJnNlZ25vLCBnY190eXBlLCBnY19jb250cm9sLT5vbmVfdGltZSk7Cj4+PiAg
ICAgICAgaWYgKHJldCkgewo+Pj4gICAgICAgICAgICAgICAgLyogYWxsb3cgdG8gc2VhcmNoIHZp
Y3RpbSBmcm9tIHNlY3Rpb25zIGhhcyBwaW5uZWQgZGF0YSAqLwo+Pj4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4+IGluZGV4IGU5YjZkNzc0Yjk4
NS4uYTZjODJhYjI4Mjg4IDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMKPj4+ICsr
KyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4+PiBAQCAtMTYwNiw2ICsxNjA2LDkgQEAgc3RhdGljIHZv
aWQgX19pc3N1ZV9kaXNjYXJkX2NtZF9vcmRlcmx5KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwK
Pj4+ICAgICAgICAgICAgICAgIGlmIChkYy0+c3RhdGUgIT0gRF9QUkVQKQo+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICBnb3RvIG5leHQ7Cj4+Pgo+Pj4gKyAgICAgICAgICAgICBpZiAoKmlzc3Vl
ZCA+IDAgJiYgdW5saWtlbHkoZnJlZXppbmcoY3VycmVudCkpKQo+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgIGJyZWFrOwo+Pj4gKwo+Pj4gICAgICAgICAgICAgICAgaWYgKGRwb2xpY3ktPmlvX2F3
YXJlICYmICFpc19pZGxlKHNiaSwgRElTQ0FSRF9USU1FKSkgewo+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICBpb19pbnRlcnJ1cHRlZCA9IHRydWU7Cj4+PiAgICAgICAgICAgICAgICAgICAgICAg
IGJyZWFrOwo+Pj4gQEAgLTE2NDUsNiArMTY0OCw3IEBAIHN0YXRpYyBpbnQgX19pc3N1ZV9kaXNj
YXJkX2NtZChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4+PiAgICAgICAgc3RydWN0IGJsa19w
bHVnIHBsdWc7Cj4+PiAgICAgICAgaW50IGksIGlzc3VlZDsKPj4+ICAgICAgICBib29sIGlvX2lu
dGVycnVwdGVkID0gZmFsc2U7Cj4+PiArICAgICBib29sIHN1c3BlbmRlZCA9IGZhbHNlOwo+Pj4K
Pj4+ICAgICAgICBpZiAoZHBvbGljeS0+dGltZW91dCkKPj4+ICAgICAgICAgICAgICAgIGYyZnNf
dXBkYXRlX3RpbWUoc2JpLCBVTU9VTlRfRElTQ0FSRF9USU1FT1VUKTsKPj4+IEBAIC0xNjc1LDYg
KzE2NzksMTEgQEAgc3RhdGljIGludCBfX2lzc3VlX2Rpc2NhcmRfY21kKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSwKPj4+ICAgICAgICAgICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShk
YywgdG1wLCBwZW5kX2xpc3QsIGxpc3QpIHsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgZjJm
c19idWdfb24oc2JpLCBkYy0+c3RhdGUgIT0gRF9QUkVQKTsKPj4+Cj4+PiArICAgICAgICAgICAg
ICAgICAgICAgaWYgKGlzc3VlZCA+IDAgJiYgdW5saWtlbHkoZnJlZXppbmcoY3VycmVudCkpKSB7
Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdXNwZW5kZWQgPSB0cnVlOwo+Pj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4+PiArICAgICAgICAgICAgICAg
ICAgICAgfQo+Pj4gKwo+Pj4gICAgICAgICAgICAgICAgICAgICAgICBpZiAoZHBvbGljeS0+dGlt
ZW91dCAmJgo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfdGltZV9vdmVy
KHNiaSwgVU1PVU5UX0RJU0NBUkRfVElNRU9VVCkpCj4+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYnJlYWs7Cj4+PiBAQCAtMTY5NCwxMSArMTcwMywxMiBAQCBzdGF0aWMgaW50IF9f
aXNzdWVfZGlzY2FyZF9jbWQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+Pj4gICAgbmV4dDoK
Pj4+ICAgICAgICAgICAgICAgIG11dGV4X3VubG9jaygmZGNjLT5jbWRfbG9jayk7Cj4+Pgo+Pj4g
LSAgICAgICAgICAgICBpZiAoaXNzdWVkID49IGRwb2xpY3ktPm1heF9yZXF1ZXN0cyB8fCBpb19p
bnRlcnJ1cHRlZCkKPj4+ICsgICAgICAgICAgICAgaWYgKGlzc3VlZCA+PSBkcG9saWN5LT5tYXhf
cmVxdWVzdHMgfHwgaW9faW50ZXJydXB0ZWQgfHwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3VzcGVuZGVkKQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICBicmVh
azsKPj4+ICAgICAgICB9Cj4+Pgo+Pj4gLSAgICAgaWYgKGRwb2xpY3ktPnR5cGUgPT0gRFBPTElD
WV9VTU9VTlQgJiYgaXNzdWVkKSB7Cj4+PiArICAgICBpZiAoZHBvbGljeS0+dHlwZSA9PSBEUE9M
SUNZX1VNT1VOVCAmJiBpc3N1ZWQgJiYgIXN1c3BlbmRlZCkgewo+Pgo+PiBJZiB3ZSdyZSB1bW91
bnRpbmcgZGF0YSBwYXJ0aXRpb24sIGl0IGRvZXNuJ3QgbmVlZCB0byBjb25zaWRlciBzdXNwZW5k
Pwo+IAo+IE1ha2VzIHNlbnNlLgo+IAo+Pgo+PiBUaGFua3MsCj4+Cj4+PiAgICAgICAgICAgICAg
ICBfX3dhaXRfYWxsX2Rpc2NhcmRfY21kKHNiaSwgZHBvbGljeSk7Cj4+PiAgICAgICAgICAgICAg
ICBnb3RvIHJldHJ5Owo+Pj4gICAgICAgIH0KPj4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
