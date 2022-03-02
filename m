Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DD74C9EF3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Mar 2022 09:14:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nPK8L-0002MM-Bs; Wed, 02 Mar 2022 08:14:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nPK8K-0002Lq-5L
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Mar 2022 08:14:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rCCkMgZ8N/Fb14MYFylHYvHegavBpKPuHaZwR9Vn3EY=; b=HkYNzta/s1R13lbTW2A6GaU7Xa
 P5B7g/58vZQxGrGCKeIn+Juw4wce7Os7ef6T+T0cX/1EYc+qpGa87yflFvo3AWziBOjYo+rRgwBKg
 dvCwCrzJABcy1NjMfYOhWYMn0uoS/Eh5YQP1oS9bqef1B+gZNrtbMvi9/8XgYt0AcF4E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rCCkMgZ8N/Fb14MYFylHYvHegavBpKPuHaZwR9Vn3EY=; b=hdMtm/8MNKMSULLZoGA6CVVHDR
 cblCRrNiK27Y2FrGzPeXgmoOx0yGDz0KQlw0FF1Hyplce3nC65GQ/AXIuySLvDTk9Sxbx3K/1n1j9
 1Btf+ze23UJXXN3ZpDq3RrJzMlLSIC1TYs14qI2HwewYI/+BZNzokOtGzbWhGJK09+B0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nPK8H-0007X2-Nl
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Mar 2022 08:14:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D36460A27;
 Wed,  2 Mar 2022 08:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 515E5C004E1;
 Wed,  2 Mar 2022 08:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646208883;
 bh=MqRNdHomIgm21tXs9Zdh3C6Qu9NH1LhEwJvQeL86Vco=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=o5YNs/bG5nMi1TpiX4+v8rrAUlmOI8JS5jrzCJXVne1onSvcucIjI852ynu+0EBVJ
 6GFET+vjkTMvd1PH7mbmkvBdh1bTcEBpB+m7iuHV8FYJWhj/zPCUO+UHQYO6vZaH0R
 gwBax88QNv9ti5UPllTWMI9tVvRSCsIUHCHdL4eP/25FltL8VgP8BvwjHW7IUelePV
 VwjJwsd29tS2xXlqm6A7ThQKg5v4w/XNj0he6ilCh8cOKFDksdYmhdBfvkPXsV01dg
 XKK1o+aLviFOw3m3v8PMBIfDSrJxIq7iDPmfLgaWUF48ka2Mo13kZhsvHYqjfUxrXq
 S5Slwd6LJRxsw==
Message-ID: <c0d3528b-e6b4-8557-4c2b-e26a972d8aaa@kernel.org>
Date: Wed, 2 Mar 2022 16:14:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220127054449.24711-1-chao@kernel.org>
 <YfMVxzdhat01ca7m@google.com>
 <e434b0a4-a66a-eebc-cafc-f0bad03c3fa5@kernel.org>
 <YfSMMpj2GrYXAJK2@google.com>
 <51be77f1-6e85-d46d-d0d3-c06d2055a190@kernel.org>
 <Yfs1KRgwgzSOvocR@google.com>
 <86a175d3-c438-505b-1dbc-4ef6e8b5adcb@kernel.org>
 <5b5e20d1-877f-b321-b341-c0f233ee976c@kernel.org>
 <51826b5f-e480-994a-4a72-39ff4572bb3f@kernel.org>
 <Yh8AAOjxTItKTwPQ@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Yh8AAOjxTItKTwPQ@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/2 13:26, Jaegeuk Kim wrote: > On 03/02, Chao Yu
 wrote: >> ping, >> >> On 2022/2/25 11:02, Chao Yu wrote: >>> On 2022/2/3 22:57,
 Chao Yu wrote: >>>> On 2022/2/3 9:51, Jaegeuk Kim wrote: >>>>> [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nPK8H-0007X2-Nl
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

T24gMjAyMi8zLzIgMTM6MjYsIEphZWdldWsgS2ltIHdyb3RlOgo+IE9uIDAzLzAyLCBDaGFvIFl1
IHdyb3RlOgo+PiBwaW5nLAo+Pgo+PiBPbiAyMDIyLzIvMjUgMTE6MDIsIENoYW8gWXUgd3JvdGU6
Cj4+PiBPbiAyMDIyLzIvMyAyMjo1NywgQ2hhbyBZdSB3cm90ZToKPj4+PiBPbiAyMDIyLzIvMyA5
OjUxLCBKYWVnZXVrIEtpbSB3cm90ZToKPj4+Pj4gT24gMDEvMjksIENoYW8gWXUgd3JvdGU6Cj4+
Pj4+PiBPbiAyMDIyLzEvMjkgODozNywgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4+Pj4+Pj4gT24gMDEv
MjgsIENoYW8gWXUgd3JvdGU6Cj4+Pj4+Pj4+IE9uIDIwMjIvMS8yOCA1OjU5LCBKYWVnZXVrIEtp
bSB3cm90ZToKPj4+Pj4+Pj4+IE9uIDAxLzI3LCBDaGFvIFl1IHdyb3RlOgo+Pj4+Pj4+Pj4+IFF1
b3RlZCBmcm9tIEppbmcgWGlhJ3MgcmVwb3J0LCB0aGVyZSBpcyBhIHBvdGVudGlhbCBkZWFkbG9j
ayBtYXkgaGFwcGVuCj4+Pj4+Pj4+Pj4gYmV0d2VlbiBrd29ya2VyIGFuZCBjaGVja3BvaW50IGFz
IGJlbG93Ogo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gW1Q6d3JpdGViYWNrXcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBbVDpjaGVja3BvaW50XQo+Pj4+Pj4+Pj4+IC0gd2Jfd3JpdGViYWNr
Cj4+Pj4+Pj4+Pj4gIMKgwqDCoCAtIGJsa19zdGFydF9wbHVnCj4+Pj4+Pj4+Pj4gYmlvIGNvbnRh
aW5zIE5vZGVBIHdhcyBwbHVnZ2VkIGluIHdyaXRlYmFjayB0aHJlYWRzCj4+Pj4+Pj4+Pgo+Pj4+
Pj4+Pj4gSSdtIHN0aWxsIHRyeWluZyB0byB1bmRlcnN0YW5kIG1vcmUgcHJlY2lzZWx5LiBTbywg
aG93IGlzIGl0IHBvc3NpYmxlIHRvCj4+Pj4+Pj4+PiBoYXZlIGJpbyBoYXZpbmcgbm9kZSB3cml0
ZSBpbiB0aGlzIGN1cnJlbnQgY29udGV4dD8KPj4+Pj4+Pj4KPj4+Pj4+Pj4gSU1PLCBhZnRlciBh
Ym92ZSBibGtfc3RhcnRfcGx1ZygpLCBpdCBtYXkgcGx1ZyBzb21lIGlub2RlJ3Mgbm9kZSBwYWdl
IGluIGt3b3JrZXIKPj4+Pj4+Pj4gZHVyaW5nIHdyaXRlYmFja2luZyBub2RlX2lub2RlJ3MgZGF0
YSBwYWdlICh3aGljaCBzaG91bGQgYmUgbm9kZSBwYWdlKT8KPj4+Pj4+Pgo+Pj4+Pj4+IFdhc24n
dCB0aGF0IGFkZGVkIGludG8gYSBkaWZmZXJlbnQgdGFzay0+cGx1Zz8KPj4+Pj4+Cj4+Pj4+PiBJ
J20gbm90IHN1cmUgSSd2ZSBnb3QgeW91ciBjb25jZXJuIGNvcnJlY3RseS4uLgo+Pj4+Pj4KPj4+
Pj4+IERvIHlvdSBtZWFuIE5vZGVBIGFuZCBvdGhlciBJT3MgZnJvbSBkb193cml0ZXBhZ2VzKCkg
d2VyZSBwbHVnZ2VkIGluCj4+Pj4+PiBkaWZmZXJlbnQgbG9jYWwgcGx1ZyB2YXJpYWJsZXM/Cj4+
Pj4+Cj4+Pj4+IEkgdGhpbmsgc28uCj4+Pj4KPj4+PiBJIGd1ZXNzIGJsb2NrIHBsdWcgaGVscGVy
IHNheXMgaXQgZG9lc24ndCBhbGxvdyB0byB1c2UgbmVzdGVkIHBsdWcsIHNvIHRoZXJlCj4+Pj4g
aXMgb25seSBvbmUgcGx1ZyBpbiBrd29ya2VyIHRocmVhZD8KPiAKPiBJcyB0aGVyZSBvbmx5IG9u
ZSBrd29ya2VyIHRocmVhZCB0aGF0IGZsdXNoZXMgbm9kZSBhbmQgaW5vZGUgcGFnZXM/CgpJSVJD
LCA9b25lIGt3b3JrZXIgcGVyIGJsb2NrIGRldmljZT8KClRoYW5rcywKCj4gCj4+Pj4KPj4+PiB2
b2lkIGJsa19zdGFydF9wbHVnX25yX2lvcyhzdHJ1Y3QgYmxrX3BsdWcgKnBsdWcsIHVuc2lnbmVk
IHNob3J0IG5yX2lvcykKPj4+PiB7Cj4+Pj4gIMKgwqDCoMKgwqBzdHJ1Y3QgdGFza19zdHJ1Y3Qg
KnRzayA9IGN1cnJlbnQ7Cj4+Pj4KPj4+PiAgwqDCoMKgwqDCoC8qCj4+Pj4gIMKgwqDCoMKgwqAg
KiBJZiB0aGlzIGlzIGEgbmVzdGVkIHBsdWcsIGRvbid0IGFjdHVhbGx5IGFzc2lnbiBpdC4KPj4+
PiAgwqDCoMKgwqDCoCAqLwo+Pj4+ICDCoMKgwqDCoMKgaWYgKHRzay0+cGx1ZykKPj4+PiAgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+Pj4gLi4uCj4+Pj4gfQo+Pj4KPj4+IEFueSBmdXJ0aGVy
IGNvbW1lbnRzPwo+Pj4KPj4+IFRoYW5rcywKPj4+Cj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4KPj4+
Pj4KPj4+Pj4+Cj4+Pj4+PiBUaGFua3MsCj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+
IFRoYW5rcywKPj4+Pj4+Pj4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZG9fd3JpdGVwYWdlc8KgIC0tIHN5bmMgd3JpdGUgaW5v
ZGVCLCBpbmMgd2Jfc3luY19yZXFbREFUQV0KPj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGYyZnNfd3JpdGVfZGF0YV9wYWdlcwo+Pj4+Pj4+Pj4+
ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBmMmZzX3dyaXRl
X3NpbmdsZV9kYXRhX3BhZ2UgLS0gd3JpdGUgbGFzdCBkaXJ0eSBwYWdlCj4+Pj4+Pj4+Pj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZjJmc19kb193cml0
ZV9kYXRhX3BhZ2UKPj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAtIHNldF9wYWdlX3dyaXRlYmFja8KgIC0tIGNsZWFyIHBhZ2UgZGlydHkg
ZmxhZyBhbmQKPj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBQQUdFQ0FDSEVfVEFHX0RJUlRZIHRhZyBpbiByYWRpeCB0cmVlCj4+Pj4+Pj4+
Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBmMmZz
X291dHBsYWNlX3dyaXRlX2RhdGEKPj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZjJmc191cGRhdGVfZGF0YV9ibGthZGRyCj4+Pj4+
Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC0gZjJmc193YWl0X29uX3BhZ2Vfd3JpdGViYWNrIC0tIHdhaXQgTm9kZUEgdG8gd3JpdGViYWNr
IGhlcmUKPj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLSBpbm9kZV9kZWNfZGlydHlfcGFnZXMKPj4+Pj4+Pj4+PiAgwqDCoMKgIC0gd3JpdGVi
YWNrX3NiX2lub2Rlcwo+Pj4+Pj4+Pj4+ICDCoMKgwqDCoCAtIHdyaXRlYmFja19zaW5nbGVfaW5v
ZGUKPj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoCAtIGRvX3dyaXRlcGFnZXMKPj4+Pj4+Pj4+PiAgwqDC
oMKgwqDCoMKgIC0gZjJmc193cml0ZV9kYXRhX3BhZ2VzIC0tIHNraXAgd3JpdGVwYWdlcyBkdWUg
dG8gd2Jfc3luY19yZXFbREFUQV0KPj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqAgLSB3YmMtPnBh
Z2VzX3NraXBwZWQgKz0gZ2V0X2RpcnR5X3BhZ2VzKCkgLS0gUEFHRUNBQ0hFX1RBR19ESVJUWSBp
cyBub3Qgc2V0IGJ1dCBnZXRfZGlydHlfcGFnZXMoKSByZXR1cm5zIG9uZQo+Pj4+Pj4+Pj4+ICDC
oMKgwqDCoCAtIHJlcXVldWVfaW5vZGUgLS0gcmVxdWV1ZSBpbm9kZSB0byB3Yi0+Yl9kaXJ0eSBx
dWV1ZSBkdWUgdG8gbm9uLXplcm8ucGFnZXNfc2tpcHBlZAo+Pj4+Pj4+Pj4+ICDCoMKgwqAgLSBi
bGtfZmluaXNoX3BsdWcKPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IExldCdzIHRyeSB0byBhdm9pZCBk
ZWFkbG9jayBjb25kaXRpb24gYnkgZm9yY2luZyB1bnBsdWdnaW5nIHByZXZpb3VzIGJpbyB2aWEK
Pj4+Pj4+Pj4+PiBibGtfZmluaXNoX3BsdWcoY3VycmVudC0+cGx1Zykgb25jZSB3ZSd2IHNraXBw
ZWQgd3JpdGViYWNrIGluIHdyaXRlcGFnZXMoKQo+Pj4+Pj4+Pj4+IGR1ZSB0byB2YWxpZCBzYmkt
PndiX3N5bmNfcmVxW0RBVEEvTk9ERV0uCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBGaXhlczogNjg3
ZGU3ZjEwMTBjICgiZjJmczogYXZvaWQgSU8gc3BsaXQgZHVlIHRvIG1peGVkIFdCX1NZTkNfQUxM
IGFuZCBXQl9TWU5DX05PTkUiKQo+Pj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFpoaWd1byBOaXUg
PHpoaWd1by5uaXVAdW5pc29jLmNvbT4KPj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKaW5nIFhp
YSA8amluZy54aWFAdW5pc29jLmNvbT4KPj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1
IDxjaGFvQGtlcm5lbC5vcmc+Cj4+Pj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+Pj4gIMKgwqDCoCBmcy9m
MmZzL2RhdGEuYyB8IDYgKysrKystCj4+Pj4+Pj4+Pj4gIMKgwqDCoCBmcy9mMmZzL25vZGUuYyB8
IDYgKysrKystCj4+Pj4+Pj4+Pj4gIMKgwqDCoCAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+Pj4+Pj4+Pj4+IGluZGV4IDc2ZDZmZTdi
MGM4Zi4uOTMyYTRjODFhY2FmIDEwMDY0NAo+Pj4+Pj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5j
Cj4+Pj4+Pj4+Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPj4+Pj4+Pj4+PiBAQCAtMzE3NCw4ICsz
MTc0LDEyIEBAIHN0YXRpYyBpbnQgX19mMmZzX3dyaXRlX2RhdGFfcGFnZXMoc3RydWN0IGFkZHJl
c3Nfc3BhY2UgKm1hcHBpbmcsCj4+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgIC8qIHRvIGF2b2lk
IHNwbGl0aW5nIElPcyBkdWUgdG8gbWl4ZWQgV0JfU1lOQ19BTEwgYW5kIFdCX1NZTkNfTk9ORSAq
Lwo+Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoCBpZiAod2JjLT5zeW5jX21vZGUgPT0gV0JfU1lO
Q19BTEwpCj4+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXRvbWljX2luYygmc2Jp
LT53Yl9zeW5jX3JlcVtEQVRBXSk7Cj4+Pj4+Pj4+Pj4gLcKgwqDCoCBlbHNlIGlmIChhdG9taWNf
cmVhZCgmc2JpLT53Yl9zeW5jX3JlcVtEQVRBXSkpCj4+Pj4+Pj4+Pj4gK8KgwqDCoCBlbHNlIGlm
IChhdG9taWNfcmVhZCgmc2JpLT53Yl9zeW5jX3JlcVtEQVRBXSkpIHsKPj4+Pj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgLyogdG8gYXZvaWQgcG90ZW50aWFsIGRlYWRsb2NrICovCj4+Pj4+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIGlmIChjdXJyZW50LT5wbHVnKQo+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGJsa19maW5pc2hfcGx1ZyhjdXJyZW50LT5wbHVnKTsKPj4+Pj4+Pj4+PiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHNraXBfd3JpdGU7Cj4+Pj4+Pj4+Pj4gK8KgwqDC
oCB9Cj4+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgIGlmIChfX3Nob3VsZF9zZXJpYWxpemVfaW8o
aW5vZGUsIHdiYykpIHsKPj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtdXRleF9s
b2NrKCZzYmktPndyaXRlcGFnZXMpOwo+Pj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL25v
ZGUuYyBiL2ZzL2YyZnMvbm9kZS5jCj4+Pj4+Pj4+Pj4gaW5kZXggNTU2ZmNkODQ1N2YzLi42OWM2
YmNhZjVhYWUgMTAwNjQ0Cj4+Pj4+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9ub2RlLmMKPj4+Pj4+Pj4+
PiArKysgYi9mcy9mMmZzL25vZGUuYwo+Pj4+Pj4+Pj4+IEBAIC0yMTA2LDggKzIxMDYsMTIgQEAg
c3RhdGljIGludCBmMmZzX3dyaXRlX25vZGVfcGFnZXMoc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1h
cHBpbmcsCj4+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgIGlmICh3YmMtPnN5bmNfbW9kZSA9PSBX
Ql9TWU5DX0FMTCkKPj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhdG9taWNfaW5j
KCZzYmktPndiX3N5bmNfcmVxW05PREVdKTsKPj4+Pj4+Pj4+PiAtwqDCoMKgIGVsc2UgaWYgKGF0
b21pY19yZWFkKCZzYmktPndiX3N5bmNfcmVxW05PREVdKSkKPj4+Pj4+Pj4+PiArwqDCoMKgIGVs
c2UgaWYgKGF0b21pY19yZWFkKCZzYmktPndiX3N5bmNfcmVxW05PREVdKSkgewo+Pj4+Pj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCAvKiB0byBhdm9pZCBwb3RlbnRpYWwgZGVhZGxvY2sgKi8KPj4+Pj4+
Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGN1cnJlbnQtPnBsdWcpCj4+Pj4+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYmxrX2ZpbmlzaF9wbHVnKGN1cnJlbnQtPnBsdWcpOwo+Pj4+Pj4+
Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gc2tpcF93cml0ZTsKPj4+Pj4+Pj4+PiAr
wqDCoMKgIH0KPj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqAgdHJhY2VfZjJmc193cml0ZXBhZ2Vz
KG1hcHBpbmctPmhvc3QsIHdiYywgTk9ERSk7Cj4+Pj4+Pj4+Pj4gLS0gCj4+Pj4+Pj4+Pj4gMi4z
Mi4wCj4+Pj4KPj4+Pgo+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4+Pj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+PiBMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4+IGh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPj4+Cj4+Pgo+Pj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IExpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldAo+Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
