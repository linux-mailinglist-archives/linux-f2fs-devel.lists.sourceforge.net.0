Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z1s2MB2JOGqRdQcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 03:00:13 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F39636ABE39
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 03:00:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=B7Cim3zl;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Cp59okNa;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=frYngiH5;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=BaBvLTAd;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zaFKFtFRhIfVQN5HEsXjydcD1i98i/pAsYmo+T5jOQ=; b=B7Cim3zlR4ZtPeCzmT+wRyyGPx
	UKq8TZ1AiOn7X52vRM5bgRRpReSUuTTVkbyWBdwJmcwZ2sfuAmGif5r0LOu10+EpfHidGVmSjbjzm
	CyKUndoAHSF+PUOSE8gK6IGxOEWWEP2f3S3cHe6WsTKq0FvTts5766atjKl34an6HY/g=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbT18-0007V0-Hj;
	Mon, 22 Jun 2026 01:00:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wbT17-0007UH-6W
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 01:00:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aLD9lNOZFWsM9PtE4UBaXnrH9y0CjExM9Xpo3tNlLiw=; b=Cp59okNakqW+lclstEoyZAQCAS
 Ui3hTMfRZ/xactyH+IwGENvztV+Nap1FFTcj7qwi/WrVD8t2v5M0Y5/e7tqaWJa83AK2FsnHA9NMZ
 L8jbn/oUtYd7tCCCXZQCo3+sD+t7z91+4/1SpXxwgfWr5amZp8wEQdjtsvx8XzPvfqFU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aLD9lNOZFWsM9PtE4UBaXnrH9y0CjExM9Xpo3tNlLiw=; b=frYngiH56vTmoV5GQcRTTCRPdE
 w+VMJ3ahQ0wcVYBO1zCudIfzl+GQaYZNs3tLcA2xM6d1a/wrTm9phryrPiNNlRwtfH5zFACm3xOfE
 kVDeHchnanuCfXmGczmr7h3WE0r0GBbWWOIQO6MKCnIQTGXoHDmtsCox7xNf7h/0h20I=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wbT16-00019A-HL for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 01:00:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A81C340049;
 Mon, 22 Jun 2026 00:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD7891F000E9;
 Mon, 22 Jun 2026 00:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782089995;
 bh=aLD9lNOZFWsM9PtE4UBaXnrH9y0CjExM9Xpo3tNlLiw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=BaBvLTAdy0+9JQsqNh6KfPVosiCdccWLeSroO4C8T40UGcZ8flFkhoshGaq8lc6Yl
 EsZ0vUM4tYH6JdzDGBjlQsrFuAJPt4U3gslvulbIxFGnqgaW9GRhpz4Z4qCLZ6rhfV
 bxkizgbW6Av0PCm6zSi/W+aWjBCklrCIcXXVlrtYaxBvwgM5+NodC7NHEUvQiPN2Lo
 j/NeubuUpOQGzK0CjXMjRWnJs+x+27JInx66EX9YkBfhdzAzkzBdq6I0IuTZiANbTO
 t2Ecw55T7tv+0cHHQY5aEuNzEt26tcKB1JHmt599M9gqBp7K5LoVMKX/Dn1Z6femDC
 ehJc+xgVIVcgw==
Message-ID: <f8f1d255-3f45-43c8-bf7d-e9b12401e8b3@kernel.org>
Date: Mon, 22 Jun 2026 08:59:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Deepanshu Kartikey <kartikey406@gmail.com>, jaegeuk@kernel.org
References: <20260510042336.94751-1-kartikey406@gmail.com>
 <CADhLXY57Oi+5+1PNb3ywnfVFV3iCHd-OFmpBS0=ooq0nFuKxiA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CADhLXY57Oi+5+1PNb3ywnfVFV3iCHd-OFmpBS0=ooq0nFuKxiA@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/21/26 16:18, Deepanshu Kartikey wrote: > On Sun, May
 10, 2026 at 9:53 AM Deepanshu Kartikey > <kartikey406@gmail.com> wrote: >>
 >> When f2fs_get_valid_checkpoint() fails during mount (e.g. due to [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wbT16-00019A-HL
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: initialize ino_entry_info before
 checkpoint load
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
Cc: stable@kernel.org, syzbot+eec8f2693d71386bd600@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.01 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kartikey406@gmail.com,m:jaegeuk@kernel.org,m:stable@kernel.org,m:syzbot+eec8f2693d71386bd600@syzkaller.appspotmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,eec8f2693d71386bd600];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F39636ABE39

T24gNi8yMS8yNiAxNjoxOCwgRGVlcGFuc2h1IEthcnRpa2V5IHdyb3RlOgo+IE9uIFN1biwgTWF5
IDEwLCAyMDI2IGF0IDk6NTPigK9BTSBEZWVwYW5zaHUgS2FydGlrZXkKPiA8a2FydGlrZXk0MDZA
Z21haWwuY29tPiB3cm90ZToKPj4KPj4gV2hlbiBmMmZzX2dldF92YWxpZF9jaGVja3BvaW50KCkg
ZmFpbHMgZHVyaW5nIG1vdW50IChlLmcuIGR1ZSB0byBhbgo+PiBpbnZhbGlkIGNoZWNrcG9pbnQg
Q1JDIG9uIGEgbWFsZm9ybWVkIGltYWdlKSwgZjJmc19maWxsX3N1cGVyKCkgdGFrZXMKPj4gYW4g
ZXJyb3IgcGF0aCB0aGF0IGV2ZW50dWFsbHkgY2FsbHMgaXB1dCgpIG9uIHRoZSByb290IGlub2Rl
LiBUaGlzCj4+IGludm9rZXMgZjJmc19kcm9wX2lub2RlKCkgLT4gZjJmc19leGlzdF93cml0dGVu
X2RhdGEoKSwgd2hpY2ggYWNxdWlyZXMKPj4gc2JpLT5pbVtdLT5pbm9fbG9jay4gSG93ZXZlciwg
ZjJmc19pbml0X2lub19lbnRyeV9pbmZvKCkgaGFzIG5vdCBydW4KPj4geWV0IGF0IHRoaXMgcG9p
bnQsIHNvIHRoZSBzcGlubG9jayBpcyB1bmluaXRpYWxpemVkIGFuZCBsb2NrZGVwCj4+IGNvbXBs
YWluczoKPj4KPj4gICAgRjJGUy1mcyAobG9vcDApOiBpbnZhbGlkIGNyYyB2YWx1ZQo+PiAgICBG
MkZTLWZzIChsb29wMCk6IEZhaWxlZCB0byBnZXQgdmFsaWQgRjJGUyBjaGVja3BvaW50Cj4+ICAg
IElORk86IHRyeWluZyB0byByZWdpc3RlciBub24tc3RhdGljIGtleS4KPj4gICAgVGhlIGNvZGUg
aXMgZmluZSBidXQgbmVlZHMgbG9ja2RlcCBhbm5vdGF0aW9uLCBvciBtYXliZQo+PiAgICB5b3Ug
ZGlkbid0IGluaXRpYWxpemUgdGhpcyBvYmplY3QgYmVmb3JlIHVzZT8KPj4gICAgLi4uCj4+ICAg
ICBmMmZzX2V4aXN0X3dyaXR0ZW5fZGF0YSsweDUzLzB4OTAgZnMvZjJmcy9jaGVja3BvaW50LmM6
Nzg3Cj4+ICAgICBmMmZzX2Ryb3BfaW5vZGUrMHhkYS8weGJmMCBmcy9mMmZzL3N1cGVyLmM6MTg1
Mgo+PiAgICAgaXB1dCsweDY1MS8weGU4MCBmcy9pbm9kZS5jOjIwMDkKPj4gICAgIGYyZnNfZmls
bF9zdXBlcisweDYwNDcvMHg3ODUwIGZzL2YyZnMvc3VwZXIuYzo1NDYxCj4+Cj4+IE1vdmUgZjJm
c19pbml0X2lub19lbnRyeV9pbmZvKCkgdG8gYmVmb3JlIGYyZnNfZ2V0X3ZhbGlkX2NoZWNrcG9p
bnQoKQo+PiBzbyB0aGF0IHNiaS0+aW1bXSBpcyBhbHdheXMgZnVsbHkgaW5pdGlhbGl6ZWQgYmVm
b3JlIGFueSBlcnJvciBwYXRoCj4+IGNhbiB0cmlnZ2VyIGlwdXQoKSAtPiBmMmZzX2Ryb3BfaW5v
ZGUoKS4gVGhlIGluaXQgZnVuY3Rpb24gb25seQo+PiBkZXBlbmRzIG9uIHJhdyBzdXBlcmJsb2Nr
IGZpZWxkcyAoQkxLU19QRVJfU0VHLCBGMkZTX0NQX1BBQ0tTLAo+PiBOUl9DVVJTRUdfUEVSU0lT
VF9UWVBFLCBfX2NwX3BheWxvYWQpLCB3aGljaCBhcmUgcG9wdWxhdGVkIHdlbGwKPj4gYmVmb3Jl
IGNoZWNrcG9pbnQgbG9hZCwgc28gdGhlIG1vdmUgaXMgc2FmZS4KPj4KPj4gRml4ZXM6IDMwNjNj
ODA3NzZlMyAoImYyZnM6IGFub3RoZXIgd2F5IHRvIHNldCBsYXJnZSBmb2xpbyBieSByZW1lbWJl
cmluZyBpbm9kZSBudW1iZXIiKQo+PiBDYzogc3RhYmxlQGtlcm5lbC5vcmcKPj4gUmVwb3J0ZWQt
Ynk6IHN5emJvdCtlZWM4ZjI2OTNkNzEzODZiZDYwMEBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29t
Cj4+IENsb3NlczogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlkPWVlYzhm
MjY5M2Q3MTM4NmJkNjAwCj4+IFRlc3RlZC1ieTogc3l6Ym90K2VlYzhmMjY5M2Q3MTM4NmJkNjAw
QHN5emthbGxlci5hcHBzcG90bWFpbC5jb20KPj4gU2lnbmVkLW9mZi1ieTogRGVlcGFuc2h1IEth
cnRpa2V5IDxrYXJ0aWtleTQwNkBnbWFpbC5jb20+Cj4+IC0tLQo+PiBDaGFuZ2VzIGluIHYyOgo+
PiAgIC0gQWRkIEZpeGVzOiB0YWcgKHN1Z2dlc3RlZCBieSBDaGFvIFl1KQo+PiAgIC0gQWRkIENj
OiBzdGFibGVAa2VybmVsLm9yZwo+PiAtLS0KPj4gICBmcy9mMmZzL3N1cGVyLmMgfCA5ICsrKysr
KystLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPj4g
aW5kZXggYzZhZmRiZDZlMWNkLi42YTIzMWE1YjBkNjIgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMv
c3VwZXIuYwo+PiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPj4gQEAgLTUxNDAsNiArNTE0MCwxMyBA
QCBzdGF0aWMgaW50IGYyZnNfZmlsbF9zdXBlcihzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBzdHJ1
Y3QgZnNfY29udGV4dCAqZmMpCj4+ICAgICAgICAgICAgICAgICAgZ290byBmcmVlX3BhZ2VfYXJy
YXlfY2FjaGU7Cj4+ICAgICAgICAgIH0KPj4KPj4gKyAgICAgICAvKgo+PiArICAgICAgICAqIElu
aXRpYWxpemUgaW5vIGVudHJ5IGluZm8gZWFybHkgc28gZjJmc19kcm9wX2lub2RlIC0+Cj4+ICsg
ICAgICAgICogZjJmc19leGlzdF93cml0dGVuX2RhdGEgY2FuIHNhZmVseSB0YWtlIGltLT5pbm9f
bG9jayBpZiBtb3VudAo+PiArICAgICAgICAqIGZhaWxzIGFmdGVyIHRoaXMgcG9pbnQgYW5kIHRy
aWdnZXJzIGlwdXQgb24gY2xlYW51cC4KPj4gKyAgICAgICAgKi8KPj4gKyAgICAgICBmMmZzX2lu
aXRfaW5vX2VudHJ5X2luZm8oc2JpKTsKPj4gKwo+PiAgICAgICAgICBlcnIgPSBmMmZzX2dldF92
YWxpZF9jaGVja3BvaW50KHNiaSk7Cj4+ICAgICAgICAgIGlmIChlcnIpIHsKPj4gICAgICAgICAg
ICAgICAgICBmMmZzX2VycihzYmksICJGYWlsZWQgdG8gZ2V0IHZhbGlkIEYyRlMgY2hlY2twb2lu
dCIpOwo+PiBAQCAtNTE4NCw4ICs1MTkxLDYgQEAgc3RhdGljIGludCBmMmZzX2ZpbGxfc3VwZXIo
c3RydWN0IHN1cGVyX2Jsb2NrICpzYiwgc3RydWN0IGZzX2NvbnRleHQgKmZjKQo+Pgo+PiAgICAg
ICAgICBmMmZzX2luaXRfZXh0ZW50X2NhY2hlX2luZm8oc2JpKTsKPj4KPj4gLSAgICAgICBmMmZz
X2luaXRfaW5vX2VudHJ5X2luZm8oc2JpKTsKPj4gLQo+PiAgICAgICAgICBmMmZzX2luaXRfZnN5
bmNfbm9kZV9pbmZvKHNiaSk7Cj4+Cj4+ICAgICAgICAgIC8qIHNldHVwIGNoZWNrcG9pbnQgcmVx
dWVzdCBjb250cm9sIGFuZCBzdGFydCBjaGVja3BvaW50IGlzc3VlIHRocmVhZCAqLwo+PiAtLQo+
PiAyLjQzLjAKPj4KPiAKPiBIaSBDaGFvLAo+IAo+IFBsZWFzZSBsZXQgbWUga25vdyB0aGUgc3Rh
dHVzIG9mIHRoaXMgcGF0Y2guIFRoaXMgaXMgYWxyZWFkeSAiUmV2aWV3ZWQtYnk6IiB5b3UuCgpo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9qYWVnZXVrL2Yy
ZnMuZ2l0L2NvbW1pdC8/aD1kZXYtdGVzdCZpZD0wNjVhNmY4Y2QyM2E5Mjk3YjU0M2RjZWM5MTNm
ZWIzY2I3ODdhMjVlCgpJdCB3YXMgbWVyZ2VkLCBob3dldmVyLCBJIHRoaW5rIGl0IHNob3VsZCBi
ZSByZXZlcnRlZCBiZWNhdXNlIGNvbW1pdCAzMDYzYzgwNzc2ZTMKKCJmMmZzOiBhbm90aGVyIHdh
eSB0byBzZXQgbGFyZ2UgZm9saW8gYnkgcmVtZW1iZXJpbmcgaW5vZGUgbnVtYmVyIikgd2FzIHJl
bW92ZWQKZnJvbSBkZXYgYnJhbmNoLCB3ZSB3b24ndCBjYWxsIGYyZnNfZXhpc3Rfd3JpdHRlbl9k
YXRhKCkgZnJvbSBmMmZzX2Ryb3BfaW5vZGUoKS4KClRoYW5rcywKCj4gCj4gUGxlYXNlIGxldCBt
ZSBrbm93IGlmIGFueXRoaW5nIG5lZWRlZCBmcm9tIG15IHNpZGUuCj4gCj4gVGhhbmtzCj4gCj4g
RGVlcGFuc2h1IEthcnRpa2V5CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
