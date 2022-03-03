Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B12C4CB4F6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Mar 2022 03:33:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nPbH4-0007GM-Ux; Thu, 03 Mar 2022 02:33:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nPbH2-0007GF-Gc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Mar 2022 02:32:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/a69l5I2Ls9eBeHj6uFFad5+AKmafLffA9tQn0Pb6Hw=; b=ZoUUsT023hAU7bvzHgj92kL5la
 sSF1eQhrlMvSjZGk4x7qg8m9wowJqqz7CmhnOR+sqbOO65Q5mn8qZg8wY39LikTdGju4lxDAsbuY7
 ykV6fLdEJnrGq0R2nXrh+xBr2yX4+xg6ygf0SpVLjfQkv94maVpYoWKMWAB1ObAzDdMw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/a69l5I2Ls9eBeHj6uFFad5+AKmafLffA9tQn0Pb6Hw=; b=bU+xdrfYsjHW/fJNDdFAPKLa1I
 CjsBbLulavgGWhsz7FqRgTArpR97ZDeSTUboNUipU48yrszE3zJSZCr7dQpc93VhZnkoxY//2EtEk
 p9011LSCvNMGuiZ5uI7K0DlWz+LFb6VH9Nf5JhHzaPG0073EJOddzI2PIDIB2nx5jGFE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nPbGx-0005lp-VF
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Mar 2022 02:32:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 12FDBB8228C;
 Thu,  3 Mar 2022 02:32:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B118C004E1;
 Thu,  3 Mar 2022 02:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646274759;
 bh=5XSp38aU3KA0DzW361Z0nmko3KMEF0z6VS+NuXyW3jk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=f7BvzjnyLcHFwCoIEdS7oU2KSZNJCS794vBPgHCRMwYx01ONB5bfZAbrlMr4AnYMP
 RmZrkn77KGiknktRBMqdvGQHE6WZVtRLaNtQZZnQbxoK8A3wWLPc2ke2fmVcIin6yI
 jYdhIbybqVG68eSfixoJGG8k0+Lvz0VVpSsoDBQCHF0Bt/C/qJSo4JdS9lKQnEZzWc
 8pZVqjIIvHMFer1m1mSwKZEnsQ6ra6yzozFV3FDe+Ct8yokni32VRU/jaF1ubO2NIY
 9zS3L4MTB+r7nTr+2zEWMaHJG0iue1DKTM8n6lyZSkj3YUwQ1wDAeY7yMitb1zgjwy
 fWeswTDxnOs/g==
Message-ID: <f1aa6b0d-bb48-f0e3-f9e2-5b1199a9635d@kernel.org>
Date: Thu, 3 Mar 2022 10:32:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <YfMVxzdhat01ca7m@google.com>
 <e434b0a4-a66a-eebc-cafc-f0bad03c3fa5@kernel.org>
 <YfSMMpj2GrYXAJK2@google.com>
 <51be77f1-6e85-d46d-d0d3-c06d2055a190@kernel.org>
 <Yfs1KRgwgzSOvocR@google.com>
 <86a175d3-c438-505b-1dbc-4ef6e8b5adcb@kernel.org>
 <5b5e20d1-877f-b321-b341-c0f233ee976c@kernel.org>
 <51826b5f-e480-994a-4a72-39ff4572bb3f@kernel.org>
 <Yh8AAOjxTItKTwPQ@google.com>
 <c0d3528b-e6b4-8557-4c2b-e26a972d8aaa@kernel.org>
 <Yh/JSlaIw49gV+15@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Yh/JSlaIw49gV+15@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/3 3:45, Jaegeuk Kim wrote: > On 03/02,
 Chao Yu wrote:
 >> On 2022/3/2 13:26, Jaegeuk Kim wrote: >>> On 03/02, Chao Yu wrote: >>>>
 ping, >>>> >>>> On 2022/2/25 11:02, Chao Yu wrote: >>>>> On 2 [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nPbGx-0005lp-VF
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid potential deadlock
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
Cc: linux-kernel@vger.kernel.org, Jing Xia <jing.xia@unisoc.com>,
 Zhiguo Niu <zhiguo.niu@unisoc.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMi8zLzMgMzo0NSwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4gT24gMDMvMDIsIENoYW8gWXUg
d3JvdGU6Cj4+IE9uIDIwMjIvMy8yIDEzOjI2LCBKYWVnZXVrIEtpbSB3cm90ZToKPj4+IE9uIDAz
LzAyLCBDaGFvIFl1IHdyb3RlOgo+Pj4+IHBpbmcsCj4+Pj4KPj4+PiBPbiAyMDIyLzIvMjUgMTE6
MDIsIENoYW8gWXUgd3JvdGU6Cj4+Pj4+IE9uIDIwMjIvMi8zIDIyOjU3LCBDaGFvIFl1IHdyb3Rl
Ogo+Pj4+Pj4gT24gMjAyMi8yLzMgOTo1MSwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4+Pj4+Pj4gT24g
MDEvMjksIENoYW8gWXUgd3JvdGU6Cj4+Pj4+Pj4+IE9uIDIwMjIvMS8yOSA4OjM3LCBKYWVnZXVr
IEtpbSB3cm90ZToKPj4+Pj4+Pj4+IE9uIDAxLzI4LCBDaGFvIFl1IHdyb3RlOgo+Pj4+Pj4+Pj4+
IE9uIDIwMjIvMS8yOCA1OjU5LCBKYWVnZXVrIEtpbSB3cm90ZToKPj4+Pj4+Pj4+Pj4gT24gMDEv
MjcsIENoYW8gWXUgd3JvdGU6Cj4+Pj4+Pj4+Pj4+PiBRdW90ZWQgZnJvbSBKaW5nIFhpYSdzIHJl
cG9ydCwgdGhlcmUgaXMgYSBwb3RlbnRpYWwgZGVhZGxvY2sgbWF5IGhhcHBlbgo+Pj4+Pj4+Pj4+
Pj4gYmV0d2VlbiBrd29ya2VyIGFuZCBjaGVja3BvaW50IGFzIGJlbG93Ogo+Pj4+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+Pj4+IFtUOndyaXRlYmFja13CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
W1Q6Y2hlY2twb2ludF0KPj4+Pj4+Pj4+Pj4+IC0gd2Jfd3JpdGViYWNrCj4+Pj4+Pj4+Pj4+PiAg
IMKgwqDCoCAtIGJsa19zdGFydF9wbHVnCj4+Pj4+Pj4+Pj4+PiBiaW8gY29udGFpbnMgTm9kZUEg
d2FzIHBsdWdnZWQgaW4gd3JpdGViYWNrIHRocmVhZHMKPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4g
SSdtIHN0aWxsIHRyeWluZyB0byB1bmRlcnN0YW5kIG1vcmUgcHJlY2lzZWx5LiBTbywgaG93IGlz
IGl0IHBvc3NpYmxlIHRvCj4+Pj4+Pj4+Pj4+IGhhdmUgYmlvIGhhdmluZyBub2RlIHdyaXRlIGlu
IHRoaXMgY3VycmVudCBjb250ZXh0Pwo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gSU1PLCBhZnRlciBh
Ym92ZSBibGtfc3RhcnRfcGx1ZygpLCBpdCBtYXkgcGx1ZyBzb21lIGlub2RlJ3Mgbm9kZSBwYWdl
IGluIGt3b3JrZXIKPj4+Pj4+Pj4+PiBkdXJpbmcgd3JpdGViYWNraW5nIG5vZGVfaW5vZGUncyBk
YXRhIHBhZ2UgKHdoaWNoIHNob3VsZCBiZSBub2RlIHBhZ2UpPwo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
IFdhc24ndCB0aGF0IGFkZGVkIGludG8gYSBkaWZmZXJlbnQgdGFzay0+cGx1Zz8KPj4+Pj4+Pj4K
Pj4+Pj4+Pj4gSSdtIG5vdCBzdXJlIEkndmUgZ290IHlvdXIgY29uY2VybiBjb3JyZWN0bHkuLi4K
Pj4+Pj4+Pj4KPj4+Pj4+Pj4gRG8geW91IG1lYW4gTm9kZUEgYW5kIG90aGVyIElPcyBmcm9tIGRv
X3dyaXRlcGFnZXMoKSB3ZXJlIHBsdWdnZWQgaW4KPj4+Pj4+Pj4gZGlmZmVyZW50IGxvY2FsIHBs
dWcgdmFyaWFibGVzPwo+Pj4+Pj4+Cj4+Pj4+Pj4gSSB0aGluayBzby4KPj4+Pj4+Cj4+Pj4+PiBJ
IGd1ZXNzIGJsb2NrIHBsdWcgaGVscGVyIHNheXMgaXQgZG9lc24ndCBhbGxvdyB0byB1c2UgbmVz
dGVkIHBsdWcsIHNvIHRoZXJlCj4+Pj4+PiBpcyBvbmx5IG9uZSBwbHVnIGluIGt3b3JrZXIgdGhy
ZWFkPwo+Pj4KPj4+IElzIHRoZXJlIG9ubHkgb25lIGt3b3JrZXIgdGhyZWFkIHRoYXQgZmx1c2hl
cyBub2RlIGFuZCBpbm9kZSBwYWdlcz8KPj4KPj4gSUlSQywgPW9uZSBrd29ya2VyIHBlciBibG9j
ayBkZXZpY2U/Cj4gCj4gSWYgdGhlcmUncyBvbmUga3dvcmtlciBvbmx5LCBmMmZzX3dyaXRlX25v
ZGVfcGFnZXMoKSBzaG91bGQgaGF2ZSBmbHVzaGVkIGl0cwo+IHBsdWc/CgpObywgZjJmc193cml0
ZV9ub2RlX3BhZ2VzKCkgZmFpbGVkIHRvIGF0dGFjaCBsb2NhbCBwbHVnIGludG8gY3VycmVudC0+
cGx1ZyBkdWUgdG8KY3VycmVudCBoYXMgYXR0YWNoZWQgcGx1ZyBmcm9tIHdiX3dyaXRlYmFjaygp
LCBhbmQgYWxzbywgZjJmc193cml0ZV9ub2RlX3BhZ2VzKCkKd2lsbCBmYWlsIHRvIGZsdXNoIGN1
cnJlbnQtPnBsdWcgZHVlIHRvIGl0cyBsb2NhbCBwbHVnIGRvZXNuJ3QgbWF0Y2ggY3VycmVudC0+
cGx1Zy4KCnZvaWQgYmxrX3N0YXJ0X3BsdWdfbnJfaW9zKCkKewoJaWYgKHRzay0+cGx1ZykKCQly
ZXR1cm47Ci4uLgp9Cgp2b2lkIGJsa19maW5pc2hfcGx1ZyhzdHJ1Y3QgYmxrX3BsdWcgKnBsdWcp
CnsKCWlmIChwbHVnID09IGN1cnJlbnQtPnBsdWcpIHsKCQlfX2Jsa19mbHVzaF9wbHVnKHBsdWcs
IGZhbHNlKTsKCQljdXJyZW50LT5wbHVnID0gTlVMTDsKCX0KfQoKVGhhbmtzLAoKPiAKPj4KPj4g
VGhhbmtzLAo+Pgo+Pj4KPj4+Pj4+Cj4+Pj4+PiB2b2lkIGJsa19zdGFydF9wbHVnX25yX2lvcyhz
dHJ1Y3QgYmxrX3BsdWcgKnBsdWcsIHVuc2lnbmVkIHNob3J0IG5yX2lvcykKPj4+Pj4+IHsKPj4+
Pj4+ICAgwqDCoMKgwqDCoHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrID0gY3VycmVudDsKPj4+Pj4+
Cj4+Pj4+PiAgIMKgwqDCoMKgwqAvKgo+Pj4+Pj4gICDCoMKgwqDCoMKgICogSWYgdGhpcyBpcyBh
IG5lc3RlZCBwbHVnLCBkb24ndCBhY3R1YWxseSBhc3NpZ24gaXQuCj4+Pj4+PiAgIMKgwqDCoMKg
wqAgKi8KPj4+Pj4+ICAgwqDCoMKgwqDCoGlmICh0c2stPnBsdWcpCj4+Pj4+PiAgIMKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuOwo+Pj4+Pj4gLi4uCj4+Pj4+PiB9Cj4+Pj4+Cj4+Pj4+IEFueSBmdXJ0
aGVyIGNvbW1lbnRzPwo+Pj4+Pgo+Pj4+PiBUaGFua3MsCj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gVGhh
bmtzLAo+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGFua3MsCj4+Pj4+Pj4+Cj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gVGhhbmtzLAo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+
Pj4+Cj4+Pj4+Pj4+Pj4+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC0gZG9fd3JpdGVwYWdlc8KgIC0tIHN5bmMgd3JpdGUgaW5vZGVCLCBpbmMgd2Jfc3luY19yZXFb
REFUQV0KPj4+Pj4+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAtIGYyZnNfd3JpdGVfZGF0YV9wYWdlcwo+Pj4+Pj4+Pj4+Pj4gICDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBmMmZzX3dyaXRlX3NpbmdsZV9kYXRhX3Bh
Z2UgLS0gd3JpdGUgbGFzdCBkaXJ0eSBwYWdlCj4+Pj4+Pj4+Pj4+PiAgIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZjJmc19kb193cml0ZV9kYXRhX3BhZ2UK
Pj4+Pj4+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAtIHNldF9wYWdlX3dyaXRlYmFja8KgIC0tIGNsZWFyIHBhZ2UgZGlydHkgZmxhZyBhbmQK
Pj4+Pj4+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBQQUdFQ0FDSEVfVEFHX0RJUlRZIHRhZyBpbiByYWRpeCB0cmVlCj4+Pj4+Pj4+Pj4+PiAg
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBmMmZzX291
dHBsYWNlX3dyaXRlX2RhdGEKPj4+Pj4+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZjJmc191cGRhdGVfZGF0YV9ibGthZGRyCj4+Pj4+
Pj4+Pj4+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC0gZjJmc193YWl0X29uX3BhZ2Vfd3JpdGViYWNrIC0tIHdhaXQgTm9kZUEgdG8gd3JpdGVi
YWNrIGhlcmUKPj4+Pj4+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLSBpbm9kZV9kZWNfZGlydHlfcGFnZXMKPj4+Pj4+Pj4+Pj4+ICAgwqDCoMKg
IC0gd3JpdGViYWNrX3NiX2lub2Rlcwo+Pj4+Pj4+Pj4+Pj4gICDCoMKgwqDCoCAtIHdyaXRlYmFj
a19zaW5nbGVfaW5vZGUKPj4+Pj4+Pj4+Pj4+ICAgwqDCoMKgwqDCoCAtIGRvX3dyaXRlcGFnZXMK
Pj4+Pj4+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgIC0gZjJmc193cml0ZV9kYXRhX3BhZ2VzIC0tIHNr
aXAgd3JpdGVwYWdlcyBkdWUgdG8gd2Jfc3luY19yZXFbREFUQV0KPj4+Pj4+Pj4+Pj4+ICAgwqDC
oMKgwqDCoMKgwqAgLSB3YmMtPnBhZ2VzX3NraXBwZWQgKz0gZ2V0X2RpcnR5X3BhZ2VzKCkgLS0g
UEFHRUNBQ0hFX1RBR19ESVJUWSBpcyBub3Qgc2V0IGJ1dCBnZXRfZGlydHlfcGFnZXMoKSByZXR1
cm5zIG9uZQo+Pj4+Pj4+Pj4+Pj4gICDCoMKgwqDCoCAtIHJlcXVldWVfaW5vZGUgLS0gcmVxdWV1
ZSBpbm9kZSB0byB3Yi0+Yl9kaXJ0eSBxdWV1ZSBkdWUgdG8gbm9uLXplcm8ucGFnZXNfc2tpcHBl
ZAo+Pj4+Pj4+Pj4+Pj4gICDCoMKgwqAgLSBibGtfZmluaXNoX3BsdWcKPj4+Pj4+Pj4+Pj4+Cj4+
Pj4+Pj4+Pj4+PiBMZXQncyB0cnkgdG8gYXZvaWQgZGVhZGxvY2sgY29uZGl0aW9uIGJ5IGZvcmNp
bmcgdW5wbHVnZ2luZyBwcmV2aW91cyBiaW8gdmlhCj4+Pj4+Pj4+Pj4+PiBibGtfZmluaXNoX3Bs
dWcoY3VycmVudC0+cGx1Zykgb25jZSB3ZSd2IHNraXBwZWQgd3JpdGViYWNrIGluIHdyaXRlcGFn
ZXMoKQo+Pj4+Pj4+Pj4+Pj4gZHVlIHRvIHZhbGlkIHNiaS0+d2Jfc3luY19yZXFbREFUQS9OT0RF
XS4KPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBGaXhlczogNjg3ZGU3ZjEwMTBjICgiZjJmczog
YXZvaWQgSU8gc3BsaXQgZHVlIHRvIG1peGVkIFdCX1NZTkNfQUxMIGFuZCBXQl9TWU5DX05PTkUi
KQo+Pj4+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlz
b2MuY29tPgo+Pj4+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSmluZyBYaWEgPGppbmcueGlhQHVu
aXNvYy5jb20+Cj4+Pj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5l
bC5vcmc+Cj4+Pj4+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4+Pj4+ICAgwqDCoMKgIGZzL2YyZnMvZGF0
YS5jIHwgNiArKysrKy0KPj4+Pj4+Pj4+Pj4+ICAgwqDCoMKgIGZzL2YyZnMvbm9kZS5jIHwgNiAr
KysrKy0KPj4+Pj4+Pj4+Pj4+ICAgwqDCoMKgIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0
IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+Pj4+Pj4+Pj4+Pj4gaW5kZXggNzZk
NmZlN2IwYzhmLi45MzJhNGM4MWFjYWYgMTAwNjQ0Cj4+Pj4+Pj4+Pj4+PiAtLS0gYS9mcy9mMmZz
L2RhdGEuYwo+Pj4+Pj4+Pj4+Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPj4+Pj4+Pj4+Pj4+IEBA
IC0zMTc0LDggKzMxNzQsMTIgQEAgc3RhdGljIGludCBfX2YyZnNfd3JpdGVfZGF0YV9wYWdlcyhz
dHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPj4+Pj4+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKg
wqAgLyogdG8gYXZvaWQgc3BsaXRpbmcgSU9zIGR1ZSB0byBtaXhlZCBXQl9TWU5DX0FMTCBhbmQg
V0JfU1lOQ19OT05FICovCj4+Pj4+Pj4+Pj4+PiAgIMKgwqDCoMKgwqDCoMKgIGlmICh3YmMtPnN5
bmNfbW9kZSA9PSBXQl9TWU5DX0FMTCkKPj4+Pj4+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBhdG9taWNfaW5jKCZzYmktPndiX3N5bmNfcmVxW0RBVEFdKTsKPj4+Pj4+Pj4+Pj4+IC3C
oMKgwqAgZWxzZSBpZiAoYXRvbWljX3JlYWQoJnNiaS0+d2Jfc3luY19yZXFbREFUQV0pKQo+Pj4+
Pj4+Pj4+Pj4gK8KgwqDCoCBlbHNlIGlmIChhdG9taWNfcmVhZCgmc2JpLT53Yl9zeW5jX3JlcVtE
QVRBXSkpIHsKPj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAvKiB0byBhdm9pZCBwb3RlbnRp
YWwgZGVhZGxvY2sgKi8KPj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoY3VycmVudC0+
cGx1ZykKPj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJsa19maW5pc2hfcGx1
ZyhjdXJyZW50LT5wbHVnKTsKPj4+Pj4+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBn
b3RvIHNraXBfd3JpdGU7Cj4+Pj4+Pj4+Pj4+PiArwqDCoMKgIH0KPj4+Pj4+Pj4+Pj4+ICAgwqDC
oMKgwqDCoMKgwqAgaWYgKF9fc2hvdWxkX3NlcmlhbGl6ZV9pbyhpbm9kZSwgd2JjKSkgewo+Pj4+
Pj4+Pj4+Pj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG11dGV4X2xvY2soJnNiaS0+d3JpdGVw
YWdlcyk7Cj4+Pj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9ub2RlLmMgYi9mcy9mMmZz
L25vZGUuYwo+Pj4+Pj4+Pj4+Pj4gaW5kZXggNTU2ZmNkODQ1N2YzLi42OWM2YmNhZjVhYWUgMTAw
NjQ0Cj4+Pj4+Pj4+Pj4+PiAtLS0gYS9mcy9mMmZzL25vZGUuYwo+Pj4+Pj4+Pj4+Pj4gKysrIGIv
ZnMvZjJmcy9ub2RlLmMKPj4+Pj4+Pj4+Pj4+IEBAIC0yMTA2LDggKzIxMDYsMTIgQEAgc3RhdGlj
IGludCBmMmZzX3dyaXRlX25vZGVfcGFnZXMoc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcs
Cj4+Pj4+Pj4+Pj4+PiAgIMKgwqDCoMKgwqDCoMKgIGlmICh3YmMtPnN5bmNfbW9kZSA9PSBXQl9T
WU5DX0FMTCkKPj4+Pj4+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhdG9taWNfaW5j
KCZzYmktPndiX3N5bmNfcmVxW05PREVdKTsKPj4+Pj4+Pj4+Pj4+IC3CoMKgwqAgZWxzZSBpZiAo
YXRvbWljX3JlYWQoJnNiaS0+d2Jfc3luY19yZXFbTk9ERV0pKQo+Pj4+Pj4+Pj4+Pj4gK8KgwqDC
oCBlbHNlIGlmIChhdG9taWNfcmVhZCgmc2JpLT53Yl9zeW5jX3JlcVtOT0RFXSkpIHsKPj4+Pj4+
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAvKiB0byBhdm9pZCBwb3RlbnRpYWwgZGVhZGxvY2sgKi8K
Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoY3VycmVudC0+cGx1ZykKPj4+Pj4+Pj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJsa19maW5pc2hfcGx1ZyhjdXJyZW50LT5wbHVn
KTsKPj4+Pj4+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHNraXBfd3JpdGU7
Cj4+Pj4+Pj4+Pj4+PiArwqDCoMKgIH0KPj4+Pj4+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqAgdHJh
Y2VfZjJmc193cml0ZXBhZ2VzKG1hcHBpbmctPmhvc3QsIHdiYywgTk9ERSk7Cj4+Pj4+Pj4+Pj4+
PiAtLSAKPj4+Pj4+Pj4+Pj4+IDIuMzIuMAo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+Pj4gTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKPj4+Pj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cj4+Pj4+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCj4+Pj4+Cj4+Pj4+Cj4+Pj4+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4+Pj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+Pj4+
IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
