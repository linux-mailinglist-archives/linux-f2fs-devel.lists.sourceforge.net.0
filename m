Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3389A61F694
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Nov 2022 15:51:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1os3TX-0003kr-1y;
	Mon, 07 Nov 2022 14:51:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1os3TV-0003kl-Cy
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Nov 2022 14:51:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AvMcf6Tt4tOq61MHHT/Fd1P11DUrKXBUQuVxha5nlmw=; b=a/CAEW8sfheo9NqstfOhmgyjNj
 m1ICkekOgdZDLwdipaNVxZ1e1XYNqM8yWXkJa5PMLJSvmezwB/xNfTRd8jgu5IJXgSe3pQ/phKtuM
 3Np7L9eHMl/eAgCf6c0gBiImKCoXeDm0p+5ZbaQ1Z370sEY/C+wWEFAQUYz0NmZlLGss=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AvMcf6Tt4tOq61MHHT/Fd1P11DUrKXBUQuVxha5nlmw=; b=h9gvYw6zRxkBtSt7muU0xNLBR2
 fgU7sCYvAcB1zC1+Nh7M2pdMis8y33Uxwx230RCb9Ufm2PXmhbfFfcMGEJ/PUxj0tMWs83C87yKL9
 zvjwq0hOdHQ3gWS2sOg+8TuvtLkKbzD8P8ZiETxbho3EyWlb5mJWSrQ+R3a6VfiPLBkw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1os3TQ-00F8Lr-25 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Nov 2022 14:51:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AE937B81215;
 Mon,  7 Nov 2022 14:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B22CC433C1;
 Mon,  7 Nov 2022 14:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667832692;
 bh=FkN6S5b4LUuRdRi3lyMah/SfaGO7kTVajUyQza/pc8I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rpDPq3JIJCrAO+SoKiIixRKufJ/gDJ/BfaEYaECxpcNsLVY8SEHgxbO2cOb1pIR+k
 degcjVUP2oDTKKNv1sb8qW2gZ6ebMNsb3OkaSpje6OBchvRLELT26GIp8YXxaaJi7B
 Xjc1U5suralpSoh/aOLdzw/vpksdt/kSxzcYOd8ImG3RuXoKYfTnxn1dgOHmKvztIG
 vKmN4XwScwmZwB85NT5mSn6vdXXBnTFxjBAjfJUyrrRbrYNeI85IlChfe736xnIYeP
 9mc1r3PmbRmBWbCxs38RSb9sXeSNwZantKWcTJJ0L9L5TlDiU4vCZ9V0rqRN9Yvfqw
 YjgVhpbyDMseQ==
Message-ID: <33a06664-cfad-f8dc-e11e-58106bfa1890@kernel.org>
Date: Mon, 7 Nov 2022 22:51:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1667547621-26175-1-git-send-email-zhiguo.niu@unisoc.com>
 <9e22b747-5e59-9a1c-5ff1-fd4f2d6e43fc@kernel.org>
 <CAHJ8P3KGTJgvde2V-75XNcZHzbQrkFzDN5sY9r75rp8JBGC_PA@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3KGTJgvde2V-75XNcZHzbQrkFzDN5sY9r75rp8JBGC_PA@mail.gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2022/11/7 13:04, Zhiguo Niu wrote: > Dear Chao > > Chao
    Yu <chao@kernel.org <mailto:chao@kernel.org>> 于2022年11月7日周一 09:25写道：
    > > On 2022/11/4 15:40, zhiguo.niu wrote: > > From: Zh [...] 
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1os3TQ-00F8Lr-25
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix atgc bug on issue in 32bits
 platform
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
Cc: jaegeuk@kernel.org, "zhiguo.niu" <zhiguo.niu@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMi8xMS83IDEzOjA0LCBaaGlndW8gTml1IHdyb3RlOgo+IERlYXIgQ2hhbwo+IAo+IENo
YW8gWXUgPGNoYW9Aa2VybmVsLm9yZyA8bWFpbHRvOmNoYW9Aa2VybmVsLm9yZz4+IOS6jjIwMjLl
ubQxMeaciDfml6XlkajkuIAgMDk6MjXlhpnpgZPvvJoKPiAKPiAgICAgT24gMjAyMi8xMS80IDE1
OjQwLCB6aGlndW8ubml1IHdyb3RlOgo+ICAgICAgPiBGcm9tOiBaaGlndW8gTml1IDx6aGlndW8u
bml1QHVuaXNvYy5jb20gPG1haWx0bzp6aGlndW8ubml1QHVuaXNvYy5jb20+Pgo+ICAgICAgPgo+
ICAgICAgPiBUaGVyZSBpcyBidWcgb24gaXNzdWUgYWZ0ZXIgYXRnYyBmZWF0dXJlIGlzIGVuYWJs
ZWQgaW4KPiAgICAgID4gMzJiaXRzIHBsYXRmb3JtIGFzIHRoZSBmb2xsb3dpbmcgbG9nOgo+ICAg
ICAgPgo+ICAgICAgPiBGMkZTLWZzIChkbS14KTogaW5jb25zaXN0ZW50IHJidHJlZSwgY3VyKDM0
NzAzMzM1NzUxNjgpIG5leHQoMzMyMDAwOTcxOTgwOCkKPiAgICAgID4gLS0tLS0tLS0tLS0tWyBj
dXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4gICAgICA+IGtlcm5lbCBCVUcgYXQgZnMvZjJmcy9nYy5j
OjYwMiEKPiAgICAgID4gSW50ZXJuYWwgZXJyb3I6IE9vcHMgLSBCVUc6IDAgWyMxXSBQUkVFTVBU
IFNNUCBBUk0KPiAgICAgID4gUEMgaXMgYXQgZ2V0X3ZpY3RpbV9ieV9kZWZhdWx0KzB4MTNjMC8w
eDE0OTgKPiAgICAgID4gTFIgaXMgYXQgZjJmc19jaGVja19yYl90cmVlX2NvbnNpc3RlbmNlKzB4
YzQvMHhkNAo+ICAgICAgPiAuLi4uCj4gICAgICA+IFs8YzA0ZDk4YjA+XSAoZ2V0X3ZpY3RpbV9i
eV9kZWZhdWx0KSBmcm9tIFs8YzA0ZDRmNDQ+XSAoZjJmc19nYysweDIyMC8weDZjYykKPiAgICAg
ID4gWzxjMDRkNGY0ND5dIChmMmZzX2djKSBmcm9tIFs8YzA0ZDQ3ODA+XSAoZ2NfdGhyZWFkX2Z1
bmMrMHgyYWMvMHg3MDgpCj4gICAgICA+IFs8YzA0ZDQ3ODA+XSAoZ2NfdGhyZWFkX2Z1bmMpIGZy
b20gWzxjMDE1Yzc3ND5dIChrdGhyZWFkKzB4MWE4LzB4MWI0KQo+ICAgICAgPiBbPGMwMTVjNzc0
Pl0gKGt0aHJlYWQpIGZyb20gWzxjMDEwMTBiND5dIChyZXRfZnJvbV9mb3JrKzB4MTQvMHgyMCkK
PiAgICAgID4KPiAgICAgID4gVGhlIHJlYXNvbiBpcyB0aGUgNjRiaXRzIGtleSBpbiBzdHJ1Y3Qg
cmJfZW50cnkgaGFzIF9fcGFja2VkIGF0dGlidXRlCj4gICAgICA+IGJ1dCBoYXMgbm90IGluIHN0
cnVjdCB2aWN0aW1fZW50cnksIHNvIHRoZSB3cm9uZyBrZXkgdmFsdWUgZ290IGJ5Cj4gICAgICA+
IGluIGYyZnNfY2hlY2tfcmJfdHJlZV9jb25zaXN0ZW5jZSwgdGhlIGZvbGxvd2luZyBhcmUgdGhl
IG1lbW9yeSBsYXlvdXRzCj4gICAgICA+IG9mIHN0cnVjdCByYl9lbnRyeSBhbmQgc3RydWN0IHZp
Y3RpbV9lbnRyeSBpbiAzMmJpdHMgcGxhdGZvcm06Cj4gICAgICA+Cj4gICAgICA+IHN0cnVjdCBy
Yl9lbnRyeSB7Cj4gICAgICA+wqAgwqAgwqBbMF0gc3RydWN0IHJiX25vZGUgcmJfbm9kZTsKPiAg
ICAgID7CoCDCoCDCoCDCoCDCoHVuaW9uIHsKPiAgICAgID7CoCDCoCDCoCDCoCDCoCDCoCDCoHN0
cnVjdCB7Li4ufTsKPiAgICAgID7CoCDCoCBbMTJdwqAgwqAgwqB1bnNpZ25lZCBsb25nIGxvbmcg
a2V5Owo+ICAgICAgPsKgIMKgIMKgIMKgIMKgfTsKPiAgICAgID4gfQo+ICAgICAgPiBzdHJ1Y3Qg
dmljdGltX2VudHJ5IHsKPiAgICAgID7CoCDCoCDCoFswXSBzdHJ1Y3QgcmJfbm9kZSByYl9ub2Rl
Owo+ICAgICAgPsKgIMKgIMKgIMKgIMKgdW5pb24gewo+ICAgICAgPsKgIMKgIMKgIMKgIMKgIMKg
IMKgc3RydWN0IHsuLi59Owo+ICAgICAgPsKgIMKgIFsxNl3CoCDCoCDCoHN0cnVjdCB2aWN0aW1f
aW5mbyB2aTsKPiAgICAgID7CoCDCoCDCoCDCoCDCoH07Cj4gICAgICA+wqAgwqAgWzMyXSBzdHJ1
Y3QgbGlzdF9oZWFkIGxpc3Q7Cj4gICAgICA+IH0KPiAKPiAgICAgU2hvdWxkbid0IHdlIGFkZCBf
X3BhY2tlZCBmb3Igc3RydWN0IHZpY3RpbV9lbnRyeT8KPiAKPiAgwqBJIHRyeSB0byBrZWVwIGl0
IGNvbnNpc3RlbnQgd2l0aCBzdHJ1Y3QgcmJfZW50cnkgKF9fcGFja2VkIGlzIG9ubHkgYWRkZWQg
dG8gdW5pb24gZm9yIDY0Yml0cyBrZXkpLAo+IHZpY3RpbV9lbnRyeS52aS5tdGltZSBpcyB1c2Vk
IHRvIHN0b3JlIHRoZSBrZXksIGFuZCByYl9lbnRyeS5rZXkgaXMgdXNlZCB0byB2ZXJpZnkgdGhl
IGtleSwKPiBzbyBtYWtlIHN1cmUgdGhhdCB0aGUgbWVtb3J5IG9mZnNldHMgb2YgdGhlIDY0IGJp
dHMga2V5IGluIHRoZXNlIHR3byBzdHJ1Y3R1cmVzIGFyZSB0aGUgc2FtZS4KPiBPdGhlciBtZW1i
ZXJzIG9mIHZpY3RpbV9lbnRyeSwgc3VjaCBhcyBsaXN0LCBpIHRoaW5rIHRoZXJlIGlzIG5vIHBy
b2JsZW0gYmVjYXVzZSBvZiBpdCBzdG9yYWdlZCBhbmQgbG9hZGVkCj4gYXJlIGJvdGggYmFzZWQg
b24gc3RydWN0IHZpY3RpbV9lbnRyeQoKSSdtIG5vdCBzdXJlLCB0aGVyZSB3aWxsIGJlIGFueSBm
dXJ0aGVyIHVwZGF0ZSBpbiBzdHJ1Y3QgcmJfbm9kZSBhbmQKc3RydWN0IGxpc3RfaGVhZCBsYXRl
ciwgc28sIElNTywgaXQgd2lsbCBiZSBtb3JlIHNhZmUgdG8gYWRkIF9fcGFja2VkIHRvCmFsaWdu
IGFsbCBmaWVsZHMgaW4gc3RydWN0dXJlIHRvIGJ5dGUuCgpUaGFua3MsCgo+IAo+ICAgICAgPgo+
ICAgICAgPiBUaGlzIHBhdGNoIGZpeCB0aGlzIGluY29uc2lzdGVuY2UgbGF5b3V0IG9mIDY0Yml0
cyBrZXkgYmV0d2Vlbgo+ICAgICAgPiBzdHJ1Y3QgcmJfZW50cnkgYW5kIHN0cnVjdCB2aWN0aW1f
ZW50cnkuCj4gICAgICA+Cj4gCj4gICAgIEZpeGVzOiAwOTM3NDllMjk2ZTIgKCJmMmZzOiBzdXBw
b3J0IGFnZSB0aHJlc2hvbGQgYmFzZWQgZ2FyYmFnZSBjb2xsZWN0aW9uIikKPiAKPiAgICAgID4g
U2lnbmVkLW9mZi1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlzb2MuY29tIDxtYWlsdG86
emhpZ3VvLm5pdUB1bmlzb2MuY29tPj4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
