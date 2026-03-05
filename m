Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHmFNpHeqGmjyAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 02:38:25 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32082209ED6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 02:38:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9zA9Lc0KjKRb9kT2f1ofqpzE8G92vaLO+hi/w2KCjI=; b=fwLVmubdxUSy2gEDKEow1RPTXf
	No8hMQW2dDoc90QgCb1Bspvsj42bLhp5m94oGmFugGYnIa+SdYTpAjZSgZJgQteBM3v0aoxeTU3SG
	zV14cYbeocykIcxuwr5YN85JTR5AdGr6W7JDezWFTdlC3b071dGowntelIprZO608UAs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxxfR-0002ih-5i;
	Thu, 05 Mar 2026 01:38:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vxxfQ-0002iV-28
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 01:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2PKxFF4VUywVnEW/Vyb/wmTswSeQRvb1TJjqLjAdvWM=; b=IJl9xNAmoD6UXrNHjdp0hXjlLF
 EKiKMgWOvc4gLjbwKehQOQ1delGUkZN/1QePqOi1Jt28L0P+IWSeduazcq3lA4zHBgQYfX3611LkC
 QKqFFHwI3hPMbNV0hhJzQV1oXKK8zguNXsfPgA/qwiXI7SWP+9dTWyJ0U4kNVUd7+U84=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2PKxFF4VUywVnEW/Vyb/wmTswSeQRvb1TJjqLjAdvWM=; b=ji3dJRpNLm2e+D9J0HBWEtVHNQ
 Y1Ot8BFz2s2uJFGHEO4A6GGxRMB58ydRceXayRkBKp6OxDhMagZwQBbViTIVC5joO3yT+39uSWuwu
 3Sz0IqDlw2i0HbplWvVUwo66bmScXrnqqZkPw2mzT7TMb3ZZef3E4tnR15xEjmMymoiM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxxfQ-0002fi-48 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 01:38:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5B44B6133A;
 Thu,  5 Mar 2026 01:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D34AAC4CEF7;
 Thu,  5 Mar 2026 01:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772674689;
 bh=4RGG/OPQBolxdCzUHEu17SC5tqF7bZTc6ddN6iEiJyc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Y+bqSDKC5qiJt3MAjJi8dczf0dZDPoQZAvPwSmo6z2tuBfEW4eAfvlq/4kcxBiX9N
 oH2JSbNDBUir3uPcG07v6FwlAq2Htmv8F3RMhHc1RAOPyAnMt+IwWPf/nxPeILE/lu
 jtUio+w94CvuurGInvsoUcH4m02ba+hwYA1yhGr/vZL40vMDxpMpWenDsRfUzLwYz0
 e5Gom0mUGywUyy9ktRg4MdZrae9AfEEnAvYUw/T+uyrK6gH1ptAGROj35DA9tQNEv1
 M08PcWrHZEyr4GA7nBx8iPNbLKREnkfgBP/leeq3p45pdPtnyliy4r6yxK917NochW
 MNx8a8g5G785Q==
Message-ID: <cb8b545f-0bbc-4747-a2ce-7432fa1e6ef2@kernel.org>
Date: Thu, 5 Mar 2026 09:38:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260218125237.3340441-1-shinichiro.kawasaki@wdc.com>
 <20260218125237.3340441-2-shinichiro.kawasaki@wdc.com>
 <aZ0aVDSWpRRqFwl9@google.com> <aZ1C-Cdrwoxp0VCJ@shinmob>
 <aaH_XCGbYOt6dpba@google.com> <aae5x_9gpi7utuf0@shinmob>
 <da969409-ce10-46fe-8620-b0dfb0cea201@kernel.org>
Content-Language: en-US
In-Reply-To: <da969409-ce10-46fe-8620-b0dfb0cea201@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/4 16:55, Chao Yu wrote: > On 2026/3/4 12:57,
 Shinichiro
 Kawasaki wrote: >> On Feb 27, 2026 / 20:32, Jaegeuk Kim wrote: >>> On 02/24,
 Shinichiro Kawasaki wrote: >>>> On Feb 24, 2026 / 03:26, [...] 
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
X-Headers-End: 1vxxfQ-0002fi-48
Subject: Re: [f2fs-dev] [PATCH v2 1/1] f2fs: fix lockdep WARN of
 sbi->cp_global_sem and q->q_usage_counter
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
Cc: Damien Le Moal <dlemoal@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 32082209ED6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shinichiro.kawasaki@wdc.com,m:jaegeuk@kernel.org,m:dlemoal@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

T24gMjAyNi8zLzQgMTY6NTUsIENoYW8gWXUgd3JvdGU6Cj4gT24gMjAyNi8zLzQgMTI6NTcsIFNo
aW5pY2hpcm8gS2F3YXNha2kgd3JvdGU6Cj4+IE9uIEZlYiAyNywgMjAyNiAvIDIwOjMyLCBKYWVn
ZXVrIEtpbSB3cm90ZToKPj4+IE9uIDAyLzI0LCBTaGluaWNoaXJvIEthd2FzYWtpIHdyb3RlOgo+
Pj4+IE9uIEZlYiAyNCwgMjAyNiAvIDAzOjI2LCBKYWVnZXVrIEtpbSB3cm90ZToKPj4+Pj4gT24g
MDIvMTgsIFNoaW4naWNoaXJvIEthd2FzYWtpIHdyb3RlOgo+Pj4+Pj4gRnJvbTogU2hpbidpY2hp
cm8gS2F3YXNha2kgdmlhIExpbnV4LWYyZnMtZGV2ZWwgPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Pgo+Pj4+Pj4KPj4+Pj4+IEEgbG9ja2RlcCBXQVJOIGlzIG9ic2VydmVk
IHJlY2VudGx5IHVuZGVyIHRoZSBmb2xsb3dpbmcgc3RlcHM6Cj4+Pj4+Pgo+Pj4+Pj4gMSkgQ3Jl
YXRlIGEgem9uZWQgVENNVSBkZXZpY2UKPj4+Pj4+IDIpIENyZWF0ZSBhIGYyZnMgZmlsZXN5c3Rl
bSBvbiB0aGUgem9uZWQgVENNVSBkZXZpY2UgYW5kIG1vdW50IGl0Cj4+Pj4+PiAzKSBGaWxsIHRo
ZSBmaWxlc3lzdGVtIHdpdGggZmlsZXMgYW5kIHRyaWdnZXIgR0MKPj4+Pj4+IDQpIFVubW91dCB0
aGUgZmlsZXN5c3RlbQo+Pj4+Pj4gNSkgUmVtb3ZlIHRoZSB6b25lZCBUQ01VIGRldmljZQo+Pj4+
Pj4KPj4+Pj4+IFRoZSBsb2NrZGVwIFdBUk4gaW5kaWNhdGVzIHRoYXQgYSBjaXJjdWxhciBsb2Nr
IGRlcGVkZW5jeSBmb3JtZWQgYnkgZm91cgo+Pj4+Pj4gY29udGV4dHMsIGFzIGRlc2NyaWJlZCBi
ZWxvdy4KPj4+Pj4+Cj4+Pj4+PiBhKSBUQ01VIGRldmljZSByZW1vdmFsIGNvbnRleHQ6Cj4+Pj4+
PiDCoCAtIGNhbGwgZGVsX2dlbmRpc2soKSB0byBnZXQgcS0+cV91c2FnZV9jb3VudGVyCj4+Pj4+
PiDCoCAtIGNhbGwgc3RhcnRfZmx1c2hfd29yaygpIHRvIGdldCB3b3JrX2NvbXBsZXRpb24gb2Yg
d2ItPmR3b3JrCj4+Pj4+PiBiKSBmMmZzIHdyaXRlYmFjayBjb250ZXh0Ogo+Pj4+Pj4gwqAgLSBp
biB3Yl93b3JrZm4oKSwgd2hpY2ggaG9sZHMgd29ya19jb21wbGV0aW9uIG9mIHdiLT5kd29yawo+
Pj4+Pj4gwqAgLSBjYWxsIGYyZnNfYmFsYW5jZV9mcygpIHRvIGdldCBzYmktPmdjX2xvY2sKPj4+
Pj4+IGMpIGYyZnMgdmZzX3dyaXRlIGNvbnRleHQ6Cj4+Pj4+PiDCoCAtIGNhbGwgZjJmc19nYygp
IHRvIGdldCBzYmktPmdjX2xvY2sKPj4+Pj4+IMKgIC0gY2FsbCBmMmZzX3dyaXRlX2NoZWNrcG9p
bnQoKSB0byBnZXQgc2JpLT5jcF9nbG9iYWxfc2VtCj4+Pj4+PiBkKSBmMmZzIG1vdW50IGNvbnRl
eHQ6Cj4+Pj4+PiDCoCAtIGNhbGwgcmVjb3Zlcl9mc3luY19kYXRhKCkgdG8gZ2V0IHNiaS0+Y3Bf
Z2xvYmFsX3NlbQo+Pj4+Pj4gwqAgLSBjYWxsIGYyZnNfY2hlY2tfYW5kX2ZpeF93cml0ZV9wb2lu
dGVyKCkgdG8gY2FsbCBibGtkZXZfcmVwb3J0X3pvbmVzKCkKPj4+Pj4+IMKgwqDCoCB0aGF0IGdv
ZXMgZG93biB0byBibGtfbXFfYWxsb2NfcmVxdWVzdCBhbmQgZ2V0IHEtPnFfdXNhZ2VfY291bnRl
cgo+Pj4+Pj4KPj4+Pj4+IFRvIHN1cHByZXNzIHRoZSBXQVJOLCBjdXQgdGhlIGRlcGVuZGVuY3kg
ZCkgYmV0d2VlbiBzYmktPmNwX2dsb2JhbF9zZW0KPj4+Pj4+IGFuZCBxLT5xX3VzYWdlX2NvdW50
ZXIuIEZvciB0aGF0IHB1cnBvc2UsIG1vdmUgdGhlCj4+Pj4+PiBmMmZzX2NoZWNrX2FuZF9maXhf
d3JpdGVfcG9pbnRlcigpIGNhbGwgb3V0c2lkZSBvZiB0aGUgY3JpdGljYWwgc2VjdGlvbgo+Pj4+
Pj4gb2Ygc2JpLT5jcF9nbG9iYWxfc2VtIGluIGYyZnNfcmVjb3ZlcnlfZnN5bmNfZGF0YSgpLiBU
aGlzIGNoYW5nZSBpcyBmaW5lCj4+Pj4+PiBiZWNhdXNlIHRoZSB3cml0ZSBwb2ludGVyIGZpeCBv
cGVyYXRpb24gb25seSBhZmZlY3RzIHRoZSBtYWluIHNlZ21lbnRzCj4+Pj4+PiBhbmQgZG9lcyBu
b3QgaW50ZXJhY3Qgd2l0aCB0aGUgY2hlY2sgcG9pbnQgbWV0YWRhdGEuIEZ1cnRoZXJtb3JlLAo+
Pj4+Pj4gY29uZmxpY3RzIGJldHdlZW4gdGhlIHdyaXRlIHBvaW50ZXIgZml4IG9wZXJhdGlvbiBh
bmQgZGF0YS9ub2RlIGZsdXNoCj4+Pj4+PiBvcGVyYXRpb25zIHJlbWFpbiBwcm90ZWN0ZWQgYnkg
U0JJX1BPUl9ET0lORy4KPj4+Pj4+Cj4+Pj4+PiBGaXhlczogYzQyNmQ5OTEyN2IxICgiZjJmczog
Q2hlY2sgd3JpdGUgcG9pbnRlciBjb25zaXN0ZW5jeSBvZiBvcGVuIHpvbmVzIikKPj4+Pj4+IFJl
dmlld2VkLWJ5OiBEYW1pZW4gTGUgTW9hbCA8ZGxlbW9hbEBrZXJuZWwub3JnPgo+Pj4+Pj4gU2ln
bmVkLW9mZi1ieTogU2hpbidpY2hpcm8gS2F3YXNha2kgPHNoaW5pY2hpcm8ua2F3YXNha2lAd2Rj
LmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gwqAgZnMvZjJmcy9yZWNvdmVyeS5jIHwgNCArKy0tCj4+
Pj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3JlY292ZXJ5LmMgYi9mcy9mMmZzL3Jl
Y292ZXJ5LmMKPj4+Pj4+IGluZGV4IGEyNjA3MWYyYjBiYy4uODdmZDZjZDQzNmZlIDEwMDY0NAo+
Pj4+Pj4gLS0tIGEvZnMvZjJmcy9yZWNvdmVyeS5jCj4+Pj4+PiArKysgYi9mcy9mMmZzL3JlY292
ZXJ5LmMKPj4+Pj4+IEBAIC05MjIsNiArOTIyLDggQEAgaW50IGYyZnNfcmVjb3Zlcl9mc3luY19k
YXRhKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYm9vbCBjaGVja19vbmx5KQo+Pj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgIHRydW5jYXRlX2lub2RlX3BhZ2VzX2ZpbmFsKE1FVEFfTUFQUElORyhz
YmkpKTsKPj4+Pj4+IMKgwqDCoMKgwqAgfQo+Pj4+Pj4gK8KgwqDCoCBmMmZzX3VwX3dyaXRlX3Ry
YWNlKCZzYmktPmNwX2dsb2JhbF9zZW0sICZsYyk7Cj4+Pj4+PiArCj4+Pj4+PiDCoMKgwqDCoMKg
IC8qCj4+Pj4+PiDCoMKgwqDCoMKgwqAgKiBJZiBmc3luYyBkYXRhIHN1Y2NlZWRzIG9yIHRoZXJl
IGlzIG5vIGZzeW5jIGRhdGEgdG8gcmVjb3ZlciwKPj4+Pj4+IMKgwqDCoMKgwqDCoCAqIGFuZCB0
aGUgZjJmcyBpcyBub3QgcmVhZCBvbmx5LCBjaGVjayBhbmQgZml4IHpvbmVkIGJsb2NrIGRldmlj
ZXMnCj4+Pj4+PiBAQCAtOTMzLDggKzkzNSw2IEBAIGludCBmMmZzX3JlY292ZXJfZnN5bmNfZGF0
YShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGJvb2wgY2hlY2tfb25seSkKPj4+Pj4+IMKgwqDC
oMKgwqAgaWYgKCFlcnIpCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY2xlYXJfc2JpX2ZsYWco
c2JpLCBTQklfUE9SX0RPSU5HKTsKPj4+Pj4+IC3CoMKgwqAgZjJmc191cF93cml0ZV90cmFjZSgm
c2JpLT5jcF9nbG9iYWxfc2VtLCAmbGMpOwo+Pj4+Pj4gLQo+Pj4+Pgo+Pj4+PiBUaGlzIHdhcyBh
IGd1YXJkIHRvIHByZXZlbnQgY2hlY2twb2ludCBkdXJpbmcgZjJmc19jaGVja19hbmRfZml4X3dy
aXRlX3BvaW50ZXIoKQo+Pj4+PiB3aGVyZSBpdCBjaGFuZ2VzIHRoZSBjaGVja3BvaW50IGFzIHdl
bGw/Cj4+Pj4KPj4+PiBJIGNoZWNrZWQgZjJmc19jaGVja19hbmRfZml4X3dyaXRlX3BvaW50ZXIo
KSBhZ2FpbiwgYW5kIGl0IGRvZXMgbm90IGxvb2sKPj4+PiBjaGFuZ2luZyB0aGUgY2hlY2twb2lu
dCB0byBtZS4gRllJLCBoZXJlIEkgc2hvdyB0aGUgcm91Z2ggZnVuY3Rpb24gY2FsbCBjaGFpbgo+
Pj4+IGZyb20gZjJmc19jaGVja19hbmRfZml4X3dyaXRlX3BvaW50ZXIoKSBhcyBiZWxvdy4gSSBn
dWVzcyB0aGlzIGNhbGwgY2hhaW4gZG9lcwo+Pj4+IG5vdCBjaGFuZ2UgdGhlIGNoZWNrcG9pbnQs
IGJ1dCBpZiBJIG1pc3VuZGVyc3RhbmQgYW55dGhpbmcsIHBsZWFzZSBsZXQgbWUga25vdy4KPj4+
Pgo+Pj4+IMKgIGYyZnNfY2hlY2tfYW5kX2ZpeF93cml0ZV9wb2ludGVyKCkKPj4+PiDCoMKgIGZp
eF9jdXJzZWdfd3JpdGVfcG9pbnRlcigpCj4+Pj4gwqDCoMKgIGRvX2ZpeF9jdXJzZWdfd3JpdGVf
cG9pbnRlcigpCj4+Pj4gwqDCoMKgwqAgYmxrZGV2X3JlcG9ydF96b25lcygpCj4+Pj4gwqDCoMKg
wqDCoCByZXBvcnRfb25lX3pvbmVfY2IoKQo+Pj4+IMKgwqDCoMKgIGYyZnNfYWxsb2NhdGVfbmV3
X3NlY3Rpb24oKQo+Pj4+IMKgwqDCoMKgwqAgX19hbGxvY2F0ZV9uZXdfc2VnbWVudCgpCj4+Pj4g
wqDCoMKgwqDCoMKgIG5ld19jdXJzZWcoKQo+Pj4KPj4+IEUuZy4sIGN1cnNlZy4KPj4+Cj4+Cj4+
IFRoYW5rcywgSSBsb29rZWQgaW4gZG9fY2hlY2twb2ludCgpIGluIGZzL2YyZnMvY2hlY2twb2lu
Zy5jLCBhbmQgZm91bmQgaXQgcmVmZXJzCj4+IHRvIGN1cnNlZ3MuIFRoZW4sIHRoaXMgcGF0Y2gg
d2lsbCBhbGxvdyByZWNvcmRpbmcgdGhlIGN1cnNlZ3MgaW4gcGFyYWxsZWwgb2YKPj4gZjJmc19j
aGVja19hbmRfZml4X3dyaXRlX3BvaW50ZXIoKSwgYW5kIGl0IHdpbGwgcmVzdWx0cyBpbiBpbmNv
bnNpc3RlbnQgY3Vyc2VnCj4+IHZhbHVlcyBpbiBjaGVja3BvaW50cy4gTm90IGdvb2QuIExldCBt
ZSBkcm9wIHRoaXMgcGF0Y2guCj4+Cj4+IEkgd2lsbCBzZWVrIG91dCBvdGhlciB3YXlzIHRvIGF2
b2lkIHRoZSBsb2NrZGVwLiBJIGhhdmUgbm8gaWRlYSBob3cgdG8gZG8gdGhhdAo+PiBhdCB0aGlz
IG1vbWVudCwgdGhvdWdoLgo+IAo+IFNoaW5pY2hpcm8sCj4gCj4gSU1PLCB0aGlzIGxvb2tzIGxp
a2UgYSBmYWxzZSBhbGFybSBvZiBsb2NrZGVwLCB3aGF0IGRvIHlvdSB0aGluayBvZiB0aGlzIGZp
eD8KPiAKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9j
aGFvL2xpbnV4LmdpdC9jb21taXQvP2g9YnVnZml4L3N5emJvdCZpZD0zYjE5NTY0Yjk1ZTliYTk4
MDNlZjMwZTkwZWFjZTA5NzdiOWQxNDBkCj4gCj4gLS0tCj4gIMKgZnMvZjJmcy9mMmZzLmjCoCB8
IDMgKysrCj4gIMKgZnMvZjJmcy9zdXBlci5jIHwgMyArKysKPiAgwqAyIGZpbGVzIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2Yy
ZnMvZjJmcy5oCj4gaW5kZXggYmIzNGU4NjRkMGVmLi41YjQwMGU5OWYzMzIgMTAwNjQ0Cj4gLS0t
IGEvZnMvZjJmcy9mMmZzLmgKPiArKysgYi9mcy9mMmZzL2YyZnMuaAo+IEBAIC0yMDQyLDYgKzIw
NDIsOSBAQCBzdHJ1Y3QgZjJmc19zYl9pbmZvIHsKPiAgwqDCoMKgwqDCoMKgwqAgc3BpbmxvY2tf
dCBpb3N0YXRfbGF0X2xvY2s7Cj4gIMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBpb3N0YXRfbGF0X2lu
Zm8gKmlvc3RhdF9pb19sYXQ7Cj4gIMKgI2VuZGlmCj4gKyNpZmRlZiBDT05GSUdfREVCVUdfTE9D
S19BTExPQwo+ICvCoMKgwqDCoMKgwqAgc3RydWN0IGxvY2tfY2xhc3Nfa2V5IGNwX2dsb2JhbF9z
ZW1fa2V5Owo+ICsjZW5kaWYKPiAgwqB9Owo+IAo+ICDCoC8qIERlZmluaXRpb25zIHRvIGFjY2Vz
cyBmMmZzX3NiX2luZm8gKi8KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zdXBlci5jIGIvZnMvZjJm
cy9zdXBlci5jCj4gaW5kZXggODc3NGM2MGI0YmU0Li45ZTg1ZjMxZmE4MjggMTAwNjQ0Cj4gLS0t
IGEvZnMvZjJmcy9zdXBlci5jCj4gKysrIGIvZnMvZjJmcy9zdXBlci5jCj4gQEAgLTQ5NDgsNiAr
NDk0OCw5IEBAIHN0YXRpYyBpbnQgZjJmc19maWxsX3N1cGVyKHN0cnVjdCBzdXBlcl9ibG9jayAq
c2IsIHN0cnVjdCBmc19jb250ZXh0ICpmYykKPiAgwqDCoMKgwqDCoMKgwqAgaW5pdF9mMmZzX3J3
c2VtX3RyYWNlKCZzYmktPmdjX2xvY2ssIHNiaSwgTE9DS19OQU1FX0dDX0xPQ0spOwo+ICDCoMKg
wqDCoMKgwqDCoCBtdXRleF9pbml0KCZzYmktPndyaXRlcGFnZXMpOwo+ICDCoMKgwqDCoMKgwqDC
oCBpbml0X2YyZnNfcndzZW1fdHJhY2UoJnNiaS0+Y3BfZ2xvYmFsX3NlbSwgc2JpLCBMT0NLX05B
TUVfQ1BfR0xPQkFMKTsKPiArI2lmZGVmIENPTkZJR19ERUJVR19MT0NLX0FMTE9DCj4gK8KgwqDC
oMKgwqDCoCBsb2NrZGVwX3NldF9jbGFzcygmc2JpLT5jcF9nbG9iYWxfc2VtLCAmc2JpLT5jcF9n
bG9iYWxfc2VtX2tleSk7CgpTb3JyeSwgc2hvdWxkIGJlOgoKKwlsb2NrZGVwX3NldF9jbGFzcygm
c2JpLT5jcF9nbG9iYWxfc2VtLmludGVybmFsX3J3c2VtLAorCQkJCQkmc2JpLT5jcF9nbG9iYWxf
c2VtX2tleSk7CgpUaGFua3MsCgo+ICsjZW5kaWYKPiAgwqDCoMKgwqDCoMKgwqAgaW5pdF9mMmZz
X3J3c2VtX3RyYWNlKCZzYmktPm5vZGVfd3JpdGUsIHNiaSwgTE9DS19OQU1FX05PREVfV1JJVEUp
Owo+ICDCoMKgwqDCoMKgwqDCoCBpbml0X2YyZnNfcndzZW1fdHJhY2UoJnNiaS0+bm9kZV9jaGFu
Z2UsIHNiaSwgTE9DS19OQU1FX05PREVfQ0hBTkdFKTsKPiAgwqDCoMKgwqDCoMKgwqAgc3Bpbl9s
b2NrX2luaXQoJnNiaS0+c3RhdF9sb2NrKTsKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
