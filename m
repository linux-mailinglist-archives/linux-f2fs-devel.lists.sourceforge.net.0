Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIfLI3EjqGl3ogAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 13:20:01 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0D31FF9A9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 13:20:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqNmxVRplTTIoUsq6vHMDeCfyogZabBLgeJz1w2ZqY8=; b=mZvLbrv+M3Ze2GEqGUz5ifzR/Q
	v9RY7pUocBYFID4nQTtcNVFunrY6sQwPOd3jN77EypTSn6GWIO3L6bDtjcLJfb5BISTpcwHLzTnDx
	rOdicJVjgOc/dw5Xh08Xk5OfYon+4kI/oM0mb75VNndPVJYbMbnDhun5+GfEaGqc8FrI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxlCj-0004tp-3W;
	Wed, 04 Mar 2026 12:19:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vxlCi-0004tj-CS
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 12:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9+ftQpr3vRQTrveG7sm82VIVUMYAqGSuuwnKL1+sPFU=; b=Bu3/dXfpOa8smpKTuuWa8BNGHx
 Sfd6zFqGlQs+8ZtptZWZUzuyFucY7uT96qq0fRH1Fk3v+SqQx2vdBgrhxvhQMlIMs7vhqkHpODE47
 H6m6zSHGJ7EHv9YGsUMw9a35YBh7yD8EaDO3M0ya5jYYIz30TRo+Rj4XBXmkQbdFScCc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9+ftQpr3vRQTrveG7sm82VIVUMYAqGSuuwnKL1+sPFU=; b=MsUdA4/Spq04JFl3gvE3593v/z
 5iQQFSwdjk7LZbMJ9WpTJBYILDsA/H+6bUOsoLOJ7db1Idra5mpa2/WuRw7W89mF3498kngpLTozZ
 NCGtQ0E3AjnOZlAYUcm9PKyt+dU+mWoqwYa50aQImd0Hvbr40+xcQaKC4CT+FnmOORGs=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxlCh-0008AT-Mp for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 12:19:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DCE6A43FE2;
 Wed,  4 Mar 2026 12:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A1EC19423;
 Wed,  4 Mar 2026 12:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772626779;
 bh=7+rim9mXL8Dyk9+Cr3jOOIcSMpiBYJMWXStbt+SptaA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=lyhIHuOTxeuRCEjA1fwwXAuYg2RRD7LvDpn9zeKFGGkFhIu0+gQ5VlK2UiGuduh/6
 IAwaZScDG+at3irnzQyRRiDuzApnxMKFpoZqoKlMzSGKuoYwjAt9GzoVkSxuiCQX1F
 z7jtb8QHyQdjddWfIKNlUdouuhmIhsU+9g8BMzUBTUXlZyDLxQQ7VujEJv6pL9SWCk
 VRLv8cpuWJq11BO1K3mam761NNiQxh7LOe2q4VWitaLpAbbDejMgRocwkJVWnX9Hu2
 fWD5VJJ/HN4Bcn153z0xWeOWa5pNNscpWD8lSvicso/fhhA90QLewFCtaVGIOu+528
 v465cJEbAxE6w==
Message-ID: <7e585f95-2a62-4154-9973-f88dae10e25f@kernel.org>
Date: Wed, 4 Mar 2026 20:19:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1772613316-19952-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
In-Reply-To: <1772613316-19952-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Zhiguo, On 2026/3/4 16:35, Zhiguo Niu wrote: > The following
 steps will change previous value of reserve_{blocks,node}, > this dones not
 match the original intention. > > 1.mount -t f2fs -o reserve_root=8192 [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vxlCh-0008AT-Mp
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to preserve previous
 reserve_{blocks, node} value when remount
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Hao_hao.Wang@unisoc.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: DB0D31FF9A9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhiguo.niu@unisoc.com,m:jaegeuk@kernel.org,m:ke.wang@unisoc.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:Hao_hao.Wang@unisoc.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[unisoc.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Action: no action

WmhpZ3VvLAoKT24gMjAyNi8zLzQgMTY6MzUsIFpoaWd1byBOaXUgd3JvdGU6Cj4gVGhlIGZvbGxv
d2luZyBzdGVwcyB3aWxsIGNoYW5nZSBwcmV2aW91cyB2YWx1ZSBvZiByZXNlcnZlX3tibG9ja3Ms
bm9kZX0sCj4gdGhpcyBkb25lcyBub3QgbWF0Y2ggdGhlIG9yaWdpbmFsIGludGVudGlvbi4KPiAK
PiAxLm1vdW50IC10IGYyZnMgLW8gcmVzZXJ2ZV9yb290PTgxOTIgaW1nZmlsZSB0ZXN0X21vdW50
Lwo+IEYyRlMtZnMgKGxvb3A1Nik6IE1vdW50ZWQgd2l0aCBjaGVja3BvaW50IHZlcnNpb24gPSAx
YjY5ZjhjNwo+IG1vdW50IGluZm86Cj4gL2Rldi9ibG9jay9sb29wNTYgb24gL2RhdGEvdGVzdF9t
b3VudCB0eXBlIGYyZnMgKHh4eCxyZXNlcnZlX3Jvb3Q9ODE5MixyZXNlcnZlX25vZGU9MCxyZXN1
aWQ9MCxyZXNnaWQ9MCx4eHgpCj4gCj4gMi5tb3VudCAtdCBmMmZzIC1vIHJlbW91bnQscmVzZXJ2
ZV9yb290PTQwOTYgL2RhdGEvdGVzdF9tb3VudAo+IEYyRlMtZnMgKGxvb3A1Nik6IFByZXNlcnZl
IHByZXZpb3VzIHJlc2VydmVfcm9vdD04MTkyCj4gY2hlY2sgbW91bnQgaW5mbzogcmVzZXJ2ZV9y
b290IGNoYW5nZSB0byA0MDk2Cj4gL2Rldi9ibG9jay9sb29wNTYgb24gL2RhdGEvdGVzdF9tb3Vu
dCB0eXBlIGYyZnMgKHh4eCxyZXNlcnZlX3Jvb3Q9NDA5NixyZXNlcnZlX25vZGU9MCxyZXN1aWQ9
MCxyZXNnaWQ9MCx4eHgpCgpDYW4geW91IHBsZWFzZSBleHBsYWluIG1vcmUgZGV0YWlscyBhYm91
dCB3aGF0J3MgdGhlIGJlaGF2aW9yIGJlZm9yZSBjb21taXQKZDE4NTM1MTMyNTIzICgiZjJmczog
c2VwYXJhdGUgdGhlIG9wdGlvbnMgcGFyc2luZyBhbmQgb3B0aW9ucyBjaGVja2luZyIpLAphbmQg
YWZ0ZXIgdGhlIGNvbW1pdCwgd2hhdCBjaGFuZ2VzPwoKVGhhbmtzLAoKPiAKPiBGaXhlczogZDE4
NTM1MTMyNTIzICgiZjJmczogc2VwYXJhdGUgdGhlIG9wdGlvbnMgcGFyc2luZyBhbmQgb3B0aW9u
cyBjaGVja2luZyIpCj4gU2lnbmVkLW9mZi1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlz
b2MuY29tPgo+IC0tLQo+ICAgZnMvZjJmcy9zdXBlci5jIHwgMiArKwo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9m
cy9mMmZzL3N1cGVyLmMKPiBpbmRleCA4Nzc0YzYwLi4zOWY4ZTg4IDEwMDY0NAo+IC0tLSBhL2Zz
L2YyZnMvc3VwZXIuYwo+ICsrKyBiL2ZzL2YyZnMvc3VwZXIuYwo+IEBAIC0xNTE1LDYgKzE1MTUs
NyBAQCBzdGF0aWMgaW50IGYyZnNfY2hlY2tfb3B0X2NvbnNpc3RlbmN5KHN0cnVjdCBmc19jb250
ZXh0ICpmYywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgRjJGU19PUFRJT04oc2JpKS5yb290
X3Jlc2VydmVkX2Jsb2Nrcyk7Cj4gICAgICAgICAgICAgICAgICBjdHhfY2xlYXJfb3B0KGN0eCwg
RjJGU19NT1VOVF9SRVNFUlZFX1JPT1QpOwo+ICAgICAgICAgICAgICAgICAgY3R4LT5vcHRfbWFz
ayAmPSB+QklUKEYyRlNfTU9VTlRfUkVTRVJWRV9ST09UKTsKPiArICAgICAgICAgICAgICAgY3R4
LT5zcGVjX21hc2sgJj0gfkYyRlNfU1BFQ19yZXNlcnZlX3Jvb3Q7Cj4gICAgICAgICAgfQo+ICAg
ICAgICAgIGlmICh0ZXN0X29wdChzYmksIFJFU0VSVkVfTk9ERSkgJiYKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgKGN0eC0+b3B0X21hc2sgJiBCSVQoRjJGU19NT1VOVF9SRVNFUlZFX05PREUp
KSAmJgo+IEBAIC0xNTIzLDYgKzE1MjQsNyBAQCBzdGF0aWMgaW50IGYyZnNfY2hlY2tfb3B0X2Nv
bnNpc3RlbmN5KHN0cnVjdCBmc19jb250ZXh0ICpmYywKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgRjJGU19PUFRJT04oc2JpKS5yb290X3Jlc2VydmVkX25vZGVzKTsKPiAgICAgICAgICAgICAg
ICAgIGN0eF9jbGVhcl9vcHQoY3R4LCBGMkZTX01PVU5UX1JFU0VSVkVfTk9ERSk7Cj4gICAgICAg
ICAgICAgICAgICBjdHgtPm9wdF9tYXNrICY9IH5CSVQoRjJGU19NT1VOVF9SRVNFUlZFX05PREUp
Owo+ICsgICAgICAgICAgICAgICBjdHgtPnNwZWNfbWFzayAmPSB+RjJGU19TUEVDX3Jlc2VydmVf
bm9kZTsKPiAgICAgICAgICB9Cj4gCj4gICAgICAgICAgZXJyID0gZjJmc19jaGVja190ZXN0X2R1
bW15X2VuY3J5cHRpb24oZmMsIHNiKTsKPiAtLQo+IDEuOS4xCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiAgIFRoaXMgZW1haWwgKGluY2x1ZGluZyBpdHMgYXR0YWNobWVu
dHMpIGlzIGludGVuZGVkIG9ubHkgZm9yIHRoZSBwZXJzb24gb3IgZW50aXR5IHRvIHdoaWNoIGl0
IGlzIGFkZHJlc3NlZCBhbmQgbWF5IGNvbnRhaW4gaW5mb3JtYXRpb24gdGhhdCBpcyBwcml2aWxl
Z2VkLCBjb25maWRlbnRpYWwgb3Igb3RoZXJ3aXNlIHByb3RlY3RlZCBmcm9tIGRpc2Nsb3N1cmUu
IFVuYXV0aG9yaXplZCB1c2UsIGRpc3NlbWluYXRpb24sIGRpc3RyaWJ1dGlvbiBvciBjb3B5aW5n
IG9mIHRoaXMgZW1haWwgb3IgdGhlIGluZm9ybWF0aW9uIGhlcmVpbiBvciB0YWtpbmcgYW55IGFj
dGlvbiBpbiByZWxpYW5jZSBvbiB0aGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBvciB0aGUgaW5m
b3JtYXRpb24gaGVyZWluLCBieSBhbnlvbmUgb3RoZXIgdGhhbiB0aGUgaW50ZW5kZWQgcmVjaXBp
ZW50LCBvciBhbiBlbXBsb3llZSBvciBhZ2VudCByZXNwb25zaWJsZSBmb3IgZGVsaXZlcmluZyB0
aGUgbWVzc2FnZSB0byB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBpcyBzdHJpY3RseSBwcm9oaWJp
dGVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2UgZG8gbm90
IHJlYWQsIGNvcHksIHVzZSBvciBkaXNjbG9zZSBhbnkgcGFydCBvZiB0aGlzIGUtbWFpbCB0byBv
dGhlcnMuIFBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgcGVybWFuZW50
bHkgZGVsZXRlIHRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgaWYgeW91IHJlY2VpdmVk
IGl0IGluIGVycm9yLiBJbnRlcm5ldCBjb21tdW5pY2F0aW9ucyBjYW5ub3QgYmUgZ3VhcmFudGVl
ZCB0byBiZSB0aW1lbHksIHNlY3VyZSwgZXJyb3ItZnJlZSBvciB2aXJ1cy1mcmVlLiBUaGUgc2Vu
ZGVyIGRvZXMgbm90IGFjY2VwdCBsaWFiaWxpdHkgZm9yIGFueSBlcnJvcnMgb3Igb21pc3Npb25z
Lgo+IOacrOmCruS7tuWPiuWFtumZhOS7tuWFt+acieS/neWvhuaAp+i0qO+8jOWPl+azleW+i+S/
neaKpOS4jeW+l+azhOmcsu+8jOS7heWPkemAgee7meacrOmCruS7tuaJgOaMh+eJueWumuaUtuS7
tuS6uuOAguS4peemgemdnue7j+aOiOadg+S9v+eUqOOAgeWuo+S8oOOAgeWPkeW4g+aIluWkjeWI
tuacrOmCruS7tuaIluWFtuWGheWuueOAguiLpemdnuivpeeJueWumuaUtuS7tuS6uu+8jOivt+WL
v+mYheivu+OAgeWkjeWItuOAgSDkvb/nlKjmiJbmiqvpnLLmnKzpgq7ku7bnmoTku7vkvZXlhoXl
rrnjgILoi6Xor6/mlLbmnKzpgq7ku7bvvIzor7fku47ns7vnu5/kuK3msLjkuYXmgKfliKDpmaTm
nKzpgq7ku7blj4rmiYDmnInpmYTku7bvvIzlubbku6Xlm57lpI3pgq7ku7bnmoTmlrnlvI/ljbPl
iLvlkYrnn6Xlj5Hku7bkurrjgILml6Dms5Xkv53or4HkupLogZTnvZHpgJrkv6Hlj4rml7bjgIHl
ronlhajjgIHml6Dor6/miJbpmLLmr5LjgILlj5Hku7bkurrlr7nku7vkvZXplJnmvI/lnYfkuI3m
ib/mi4XotKPku7vjgIIKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
