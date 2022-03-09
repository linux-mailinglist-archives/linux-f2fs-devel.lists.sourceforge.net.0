Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EED4D2639
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Mar 2022 04:33:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nRn4h-0004NA-HM; Wed, 09 Mar 2022 03:33:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nRn4g-0004N4-H2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Mar 2022 03:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nNTfH5lIhovKqSuzk0oAbbib6do2sv6awVAMPYCJQk4=; b=iaAwuFUYdSC7G0z9oJcYzsyrjs
 kODZWJlERxOemeTpALwy7wtUneAwHD3DXxrBH1JNAx5pBv28jWKNZqYzL9UnQGjjHTJ496A+WX3ja
 bPzzliPjJniq0b0B4P9oB/2jRmGb2fcxibxL3tcPbvwRnfySYtxlTXoRoEZ7wn822i/M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nNTfH5lIhovKqSuzk0oAbbib6do2sv6awVAMPYCJQk4=; b=BOfnu341pwCNPJ+/zIrbGQkMhV
 me6Zgt8Y8s+YiDOIga6XCrsJLGT0dvNleCMg7X2Tb7uo/6DX7qe7NOIIpwcQr8s3darBM/7gFviXW
 93LNp62ewYOEAQwU7rqwfWV9015ZETVp4YxTZVPTZMY4sHbw/cLwNqoId/AAuKh8kLR0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nRn4Y-00086Z-8t
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Mar 2022 03:33:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EE9EB617E4;
 Wed,  9 Mar 2022 03:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E496C340EB;
 Wed,  9 Mar 2022 03:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646796779;
 bh=ZDspUUhW760B4crluRIFcJIV6QNdcpAKS8VKTu2xcbY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=N7WYp/xut3AfU2ZU/gOysSduayvRJz1i086Vb53QESobcHJ2y/8773mgrQP8nSKZE
 LE09xPOCkJ1+rQa1LrZyEkQ8/YoXkvt+khynntMe67PoQlYr5civb5HNe6zSlHPG89
 ej7GbvvjWOa9563VB6y/mzrr/uIaS+VGEtjUc6l/vTOum9PVrK1MFJZR3Bp0B7QFqp
 EhvXWNKiBoLUtelNQQFNhqJA48T+LIPTsw4S0PXdkOtLQsYKU5Z0mVOqL8uMGIjJCm
 +OTUIZ/ImWsISh9nuAY2t6j8hGX3Sias9T8bL4LB3C26sAiIMPEVh+CvjJuWoyCFLM
 BZBLO1jutbJiA==
Message-ID: <16f9b36b-5dda-0540-1f7f-2fa0b5081a21@kernel.org>
Date: Wed, 9 Mar 2022 11:32:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: =?UTF-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>,
 Fengnan Chang <fengnanchang@gmail.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20220305040019.225150-1-fengnanchang@gmail.com>
 <bc67518a-37c9-724d-9a27-d8e9354c5404@kernel.org>
 <KL1PR0601MB40038428764F5731EEEF7AABBB089@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <a9cbd24b-9da8-9f92-dd20-39f3a4fa5732@kernel.org>
 <KL1PR0601MB4003900FB74F94306BA32EA6BB089@KL1PR0601MB4003.apcprd06.prod.outlook.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <KL1PR0601MB4003900FB74F94306BA32EA6BB089@KL1PR0601MB4003.apcprd06.prod.outlook.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2022/3/7 19:07, 常凤楠 wrote: >> 
 
 Content analysis details:   (-7.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nRn4Y-00086Z-8t
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: fix compress file start atomic
 write may cause data corruption
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMi8zLzcgMTk6MDcsIOW4uOWHpOaloCB3cm90ZToKPj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0KPj4gRnJvbTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+PiBTZW50OiBNb25k
YXksIE1hcmNoIDcsIDIwMjIgNjozMCBQTQo+PiBUbzog5bi45Yek5qWgIDxjaGFuZ2ZlbmduYW5A
dml2by5jb20+OyBGZW5nbmFuIENoYW5nCj4+IDxmZW5nbmFuY2hhbmdAZ21haWwuY29tPjsgamFl
Z2V1a0BrZXJuZWwub3JnCj4+IENjOiBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldAo+PiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSF0gZjJmczogZml4IGNvbXByZXNzIGZpbGUg
c3RhcnQgYXRvbWljIHdyaXRlIG1heSBjYXVzZQo+PiBkYXRhIGNvcnJ1cHRpb24KPj4KPj4gT24g
MjAyMi8zLzcgMTU6NTQsIOW4uOWHpOaloCB3cm90ZToKPj4+Cj4+Pj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0KPj4+PiBGcm9tOiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4+Pj4gU2Vu
dDogTW9uZGF5LCBNYXJjaCA3LCAyMDIyIDk6NDMgQU0KPj4+PiBUbzogRmVuZ25hbiBDaGFuZyA8
ZmVuZ25hbmNoYW5nQGdtYWlsLmNvbT47IGphZWdldWtAa2VybmVsLm9yZwo+Pj4+IENjOiBsaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldDsg5bi45Yek5qWgCj4+Pj4gPGNoYW5n
ZmVuZ25hbkB2aXZvLmNvbT4KPj4+PiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSF0gZjJmczogZml4
IGNvbXByZXNzIGZpbGUgc3RhcnQgYXRvbWljIHdyaXRlCj4+Pj4gbWF5IGNhdXNlIGRhdGEgY29y
cnVwdGlvbgo+Pj4+Cj4+Pj4gT24gMjAyMi8zLzUgMTI6MDAsIEZlbmduYW4gQ2hhbmcgd3JvdGU6
Cj4+Pj4+IFdoZW4gY29tcHJlc3NlZCBmaWxlIGhhcyBibG9ja3MsIHN0YXJ0IGF0b21pYyB3cml0
ZSB3aWxsIGJlIGZhaWxlZCwKPj4+Pj4gYnV0Cj4+Pj4KPj4+PiBZb3UgbWVhbiBmMmZzX2lvY19z
dGFydF9hdG9taWNfd3JpdGUgd2lsbCBzdWNjZWVkLCBidXQgY29tcHJlc3NlZAo+Pj4+IGZsYWcg
d2lsbCBiZSByZW1haW5lZCBpbiBpbm9kZT8KPj4+Cj4+PiBZZXMuCj4+Pgo+Pj4+Cj4+Pj4+IHN0
aWxsIHNldCBGSV9BVE9NSUNfRklMRSBmbGFnLCBpZiB3cml0ZSBwYXJ0aWFsIGNsdXN0ZXIgYW5k
IGNvbW1pdAo+Pj4+PiBhdG9taWMgd3JpdGUgd2lsbCBjYXVzZSBkYXRhIGNvcnJ1cHRpb24uCj4+
Pj4KPj4+PiBDb3VsZCB5b3UgcGxlYXNlIGV4cGxhaW4gbW9yZSBhYm91dCB3aHkgZGF0YSB3aWxs
IGJlIGNvcnJ1cHRlZD8KPj4+Cj4+PiBTdGVwIDE6Cj4+PiBDcmVhdGUgYSBjb21wcmVzc2VkIGZp
bGUgLHdyaXRlIDY0SyBkYXRhICwgY2FsbCBmc3luYygpLCB0aGVuIHRoZSBibG9ja3MgYXJlCj4+
IHdyaXRlIGFzIGNvbXByZXNzZWQgY2x1c3Rlci4KPj4+IFN0ZXAyOgo+Pj4gaW90Y2woRjJGU19J
T0NfU1RBUlRfQVRPTUlDX1dSSVRFKSAgLS0tIHRoaXMgc2hvdWxkIGJlIGZhaWwsIGJ1dCBub3Qu
Cj4+PiB3cml0ZSBwYWdlIDAgYW5kIHBhZ2UgMy4KPj4+IGlvdGNsKEYyRlNfSU9DX0NPTU1JVF9B
VE9NSUNfV1JJVEUpICAtLSBwYWdlIDAgYW5kIDMgd3JpdGUgYXMgbm9ybWFsCj4+PiBmaWxlLAo+
Pj4gU3RlcDM6Cj4+PiBkcm9wIGNhY2hlLgo+Pj4gUmVhZCBwYWdlIDAtNCAgIC0tIFNpbmNlIHBh
Z2UgMCBoYXMgYSB2YWxpZCBibG9jayBhZGRyZXNzLCByZWFkIGFzCj4+IG5vLWNvbXByZXNzZWQs
IHBhZ2UgMSBhbmQgMiB3aWxsIGJlIGNvbXByZXNzZWQgZGF0YSBvciB6ZXJvLgo+Pj4KPj4+IEFu
ZCBiZWZvcmUgZjJmczogY29tcHJlc3M6IHJlbW92ZSB1bm5lZWRlZCByZWFkIHdoZW4gcmV3cml0
ZSB3aG9sZQo+Pj4gY2x1c3RlciksIGV2ZW4gU3RlcCAyIGlzIG5vdCByaWdodCwgYnV0IHdob2xl
IGNsdXN0ZXIgd2lsbCBtYXJrIGRpcnR5IGluCj4+IHdyaXRlX2JlZ2luLCBhbmQgd2hvbGUgY2x1
c3RlciB3aWxsIGJlIHJlLXdyaXRlIGFzIG5vLWNvbXByZXNzZWQgY2x1c3Rlciwgc28KPj4gaXQn
cyBvay4KPj4KPj4gQWgsIGFmdGVyIDdlYWI3YTY5NjgyNyAoZjJmczogY29tcHJlc3M6IHJlbW92
ZSB1bm5lZWRlZCByZWFkIHdoZW4gcmV3cml0ZQo+PiB3aG9sZSBjbHVzdGVyKSwgd2UgZXhwZWN0
IHRoYXQgZjJmc193cml0ZV9jYWNoZV9wYWdlcygpIHdpbGwgYmUgY2FsbGVkLCBhbmQKPj4gZjJm
c19wcmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZSgpIGNhbiByZWFkIGFuZCBzZXQgZGlydHkgbGVm
dCBwYWdlcyBvZgo+PiBjb21wcmVzc2VkIGNsdXN0ZXIuCj4+Cj4+IEhvd2V2ZXIgYXRvbWljIGNv
bW1pdCBmbG93IHdvbid0IGNhbGwgZjJmc193cml0ZV9jYWNoZV9wYWdlcygpLi4uCj4+Cj4+IEFu
eXdheSwgdGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24sIGFuZCwgY291bGQgeW91IHBsZWFzZSBh
ZGQgYWJvdmUKPj4gY29tbWVudHMgaW50byBjb21taXQgZGVzY3JpcHRpb24gb2YgdGhpcyBwYXRj
aD8KPiAKPiBZZXMsIEknbGwgYWRkIG1vcmUgY29tbWVudHMgaW4gbmV4dCB2ZXJzaW9uLgo+IEFu
ZCBJIHdhbnQgdG8ga25vdyB3aHkgYXRvbWljIHdyaXRlIG5lZWQgZGlzYWJsZSBjb21wcmVzc2Vk
IGZpbGUsIEkgZGlkbid0IHNlZSBhbnkgc3BlY2lhbCBpcyBpbmNvbXBhdGlibGUgd2l0aCBjb21w
cmVzc2lvbi4KCkkgZ3Vlc3MgdGhlcmUgaXMgbm8gaW5jb21wYXRpYmlsaXR5IGlzc3VlLCBob3dl
dmVyLCBhcyBtb3N0IGRhdGFiYXNlIGZpbGUgd2lsbApiZSB1cGRhdGVkIGZyZXF1ZW50bHksIHdy
aXRlIGFtcGxpZmljYXRpb24gZHVlIHRvIGNvbXByZXNzaW9uIGNsdXN0ZXIgZGVzaWduCm1heSBo
dXJ0IGRhdGFiYXNlIHVwZGF0ZSBwZXJmb3JtYW5jZSwgYW55IHBhcnRpY3VsYXIgc2NlbmFyaW8g
b2YgdXNpbmcgY29tcHJlc3NlZApkYiBmaWxlPwoKVGhhbmtzLAoKPiAKPiBUaGFua3MuCj4+Cj4+
IFRoYW5rcywKPj4KPj4+Cj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4KPj4+Pj4gRml4ZXM6IDRjOGZm
NzA5NWJlZiAoZjJmczogc3VwcG9ydCBkYXRhIGNvbXByZXNzaW9uKQo+Pj4+PiBGaXhlczogN2Vh
YjdhNjk2ODI3IChmMmZzOiBjb21wcmVzczogcmVtb3ZlIHVubmVlZGVkIHJlYWQgd2hlbgo+Pj4+
PiByZXdyaXRlIHdob2xlIGNsdXN0ZXIpCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEZlbmdu
YW4gQ2hhbmcgPGZlbmduYW5jaGFuZ0BnbWFpbC5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiAgICAgZnMv
ZjJmcy9kYXRhLmMgfCA0ICstLS0KPj4+Pj4gICAgIGZzL2YyZnMvZmlsZS5jIHwgMyArKy0KPj4+
Pj4gICAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+
Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYyBp
bmRleAo+Pj4+PiA2YjVmMzg5YmE5OTguLjVjYmVlNGVkMDk4MiAxMDA2NDQKPj4+Pj4gLS0tIGEv
ZnMvZjJmcy9kYXRhLmMKPj4+Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPj4+Pj4gQEAgLTMzNTgs
OCArMzM1OCw3IEBAIHN0YXRpYyBpbnQgZjJmc193cml0ZV9iZWdpbihzdHJ1Y3QgZmlsZSAqZmls
ZSwKPj4+Pj4gc3RydWN0Cj4+Pj4gYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPj4+Pj4gICAgIAkJ
aW50IHJldDsKPj4+Pj4KPj4+Pj4gICAgIAkJKmZzZGF0YSA9IE5VTEw7Cj4+Pj4+IC0KPj4+Pj4g
LQkJaWYgKGxlbiA9PSBQQUdFX1NJWkUpCj4+Pj4+ICsJCWlmIChsZW4gPT0gUEFHRV9TSVpFICYm
ICEoZjJmc19pc19hdG9taWNfZmlsZShpbm9kZSkpKQo+Pj4+PiAgICAgCQkJZ290byByZXBlYXQ7
Cj4+Pj4+Cj4+Pj4+ICAgICAJCXJldCA9IGYyZnNfcHJlcGFyZV9jb21wcmVzc19vdmVyd3JpdGUo
aW5vZGUsIHBhZ2VwLCBkaWZmIC0tZ2l0Cj4+Pj4+IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZz
L2ZpbGUuYyBpbmRleCBjZmRjNDFmODdmNWQuLjI2YTY0OGVmOWUxZgo+Pj4+PiAxMDA2NDQKPj4+
Pj4gLS0tIGEvZnMvZjJmcy9maWxlLmMKPj4+Pj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPj4+Pj4g
QEAgLTIwMDksNyArMjAwOSw4IEBAIHN0YXRpYyBpbnQgZjJmc19pb2Nfc3RhcnRfYXRvbWljX3dy
aXRlKHN0cnVjdAo+Pj4+PiBmaWxlICpmaWxwKQo+Pj4+Pgo+Pj4+PiAgICAgCWlub2RlX2xvY2so
aW5vZGUpOwo+Pj4+Pgo+Pj4+PiAtCWYyZnNfZGlzYWJsZV9jb21wcmVzc2VkX2ZpbGUoaW5vZGUp
Owo+Pj4+PiArCWlmICghZjJmc19kaXNhYmxlX2NvbXByZXNzZWRfZmlsZShpbm9kZSkpCj4+Pj4+
ICsJCXJldHVybiAtRUlOVkFMOwo+Pj4+Pgo+Pj4+PiAgICAgCWlmIChmMmZzX2lzX2F0b21pY19m
aWxlKGlub2RlKSkgewo+Pj4+PiAgICAgCQlpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJ
X0FUT01JQ19SRVZPS0VfUkVRVUVTVCkpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
