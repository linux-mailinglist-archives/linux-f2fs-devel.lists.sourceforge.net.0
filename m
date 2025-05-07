Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AB0AAD3F5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 05:18:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RbKptUbX3MIQva3v9SEK5rICq1adUOrbvaUMFUPs5c8=; b=Z8LYMwAvAcqXdN6HLT/hJVsl+i
	c3oJoSgyciTLjemuP1bgLCwVoGgeNTtUUGTcRbU/Nj9QZBwAcQ1yw+Xu2MuOejvni3cm1xbpMqfLx
	ySP9KimhIFPmqNix19MCXHrWazriz7COuF0W2LZxGa7mA5Xi0zttd2vzAyfMqRw0qbsc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCVIM-0000Ky-Jz;
	Wed, 07 May 2025 03:18:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCVIL-0000Kr-2j
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 03:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FCUhho2yIDQs0xvESm8q0aXS0UaVgWunCNRsdZ+GyFg=; b=KX1U6LI37FAAigbO3CmOePkq9v
 Xq+0cpwiI7eds0Lr9uVrkEkQuIu7fCnjdIoyqspj7Pr5IzOoNZn0fuOhQnTNfirTNuHtwtFwehif5
 YwhWrD/b7cJ2aFbITOVVQedGxNA2oIhGDH60K0eP9e0iJBrmEuq8Mh6vmbs56HseSZoU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FCUhho2yIDQs0xvESm8q0aXS0UaVgWunCNRsdZ+GyFg=; b=kwzc2g8tgTfJeEYpyTbxGymKh4
 hmDleEdsQa81DnKnBqAHWPYZ/rcNViZpaIZ14Rmk4T+ihYvyRcxrP4kyvFT5megAFw2uKnLe5rzX6
 kMJgEbeKJG39AnGclZcMBGTuiIMxqO4FDFIoClEvHZnxYxLIaa45XAt5VTMWWfaFhk2o=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCVI5-0000JQ-6r for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 03:18:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7B0045C5BB4;
 Wed,  7 May 2025 03:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FFAC4CEE4;
 Wed,  7 May 2025 03:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746587858;
 bh=PCpx3cYzYX0hsD6EmUQWh2G/WPYfCQ+gGZYu0je5w1E=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=DeI0mpU5IZWvK/F/ZoyRo22qIWMjNjeIHWIX21ua0uMWJ0v/TJOoZtPWHrBpup29e
 Xo44VrfGm4xk2af55K3Ju2hPiq29eB5uGOG86m61+hrtTFJPlkURybmM6ZnpqoZXpA
 MFEgBEJTQRpFqO8xjHvRzDrmXDWhxUHC/QuwBjd7PyvFYWmFqSjARAm4Dmj5bs0kw3
 79vs7DV/hvs6eI9xhMFBb/M8DzkHjqiMwgvthgySf4emmMUrM4FfEsFjKRDpSWJUQz
 ehCs2ICdI8VOt0Ft7SNr363FE1QWl9mR9fkkmfkpekfV7DbzumObw4s4dioAVW5NS4
 v5ULAMti3Ta4A==
Message-ID: <041198dd-c6b5-4c7e-baa2-89a9f1297317@kernel.org>
Date: Wed, 7 May 2025 11:17:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>
References: <20250506070210.539539-1-chao@kernel.org>
 <CACOAw_xzP+dfhhFsOLTOagU-QPeUUOzSpyZLO7dArvAe4F8H8g@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CACOAw_xzP+dfhhFsOLTOagU-QPeUUOzSpyZLO7dArvAe4F8H8g@mail.gmail.com>
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 5/7/25 04:25, Daeho Jeong wrote: > On Tue, May 6, 2025
   at 12:05 AM Chao Yu via Linux-f2fs-devel > <linux-f2fs-devel@lists.sourceforge.net>
    wrote: >> >> This is a regression testcase to check whet [...] 
 
 Content analysis details:   (-6.6 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [139.178.84.217 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [139.178.84.217 listed in sa-trusted.bondedsender.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCVI5-0000JQ-6r
Subject: Re: [f2fs-dev] [PATCH v2] f2fs/013: test to check potential
 corruption on atomic_write file
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
Cc: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNS83LzI1IDA0OjI1LCBEYWVobyBKZW9uZyB3cm90ZToKPiBPbiBUdWUsIE1heSA2LCAyMDI1
IGF0IDEyOjA14oCvQU0gQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbAo+IDxsaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldD4gd3JvdGU6Cj4+Cj4+IFRoaXMgaXMgYSByZWdy
ZXNzaW9uIHRlc3RjYXNlIHRvIGNoZWNrIHdoZXRoZXIgd2Ugd2lsbCBoYW5kbGUgZGF0YWJhc2UK
Pj4gaW5vZGUgZGlydHkgc3RhdHVzIGNvcnJlY3RseToKPj4gMS4gbW91bnQgZjJmcyBpbWFnZSB3
LyB0aW1lb3V0IGZhdWx0IGluamVjdGlvbiBvcHRpb24KPj4gMi4gY3JlYXRlIGEgcmVndWxhciBm
aWxlLCBhbmQgd3JpdGUgZGF0YSBpbnRvIHRoZSBmaWxlCj4+IDMuIHN0YXJ0IHRyYW5zYWN0aW9u
IG9uIHRoZSBmaWxlICh2aWEgRjJGU19JT0NfU1RBUlRfQVRPTUlDX1dSSVRFKQo+PiA0LiB3cml0
ZSB0cmFuc2FjdGlvbiBkYXRhIHRvIHRoZSBmaWxlCj4+IDUuIGNvbW1pdCBhbmQgZW5kIHRoZSB0
cmFuc2FjdGlvbiAodmlhIEYyRlNfSU9DX0NPTU1JVF9BVE9NSUNfV1JJVEUpCj4+IDYuIG1lYW53
aGlsZSBsb29wIGNhbGwgZnN5bmMgaW4gcGFyYWxsZWwKPj4gQmVmb3JlIGYwOThhZWJhMDRjOSAo
ImYyZnM6IGZpeCB0byBhdm9pZCBhdG9taWNpdHkgY29ycnVwdGlvbiBvZiBhdG9taWMKPj4gZmls
ZSIpLCBkYXRhYmFzZSBmaWxlIG1heSBiZWNvbWUgY29ycnVwdGVkIGFmdGVyIGF0b21pYyB3cml0
ZSB3aGlsZQo+PiB0aGVyZSBpcyBjb25jdXJyZW50IGRpcnR5IGlub2RlIGZsdXNoIGluIGJhY2tn
cm91bmQuCj4+Cj4+IENjOiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgo+PiBDYzog
RGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogQ2hh
byBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+PiAtLS0KPj4gdjI6Cj4+IC0gZml4IGRlc2NyaXB0aW9u
IG9mIHRlc3Qgc3RlcHMKPj4gLSBhZGQgbWlzc2luZyAiX3JlcXVpcmVfa2VybmVsX2NvbmZpZyBD
T05GSUdfRjJGU19GQVVMVF9JTkpFQ1RJT04iCj4+IC0gYWRkIG1pc3NpbmcgIl9yZXF1aXJlX2Nv
bW1hbmQgIiRGMkZTX0lPX1BST0ciIGYyZnNfaW8iCj4+IC0gcHV0IGNvcnJlY3QgZmlsZXNpemUg
aW4gdGhlIGdvbGRlbiBvdXRwdXQKPj4gIHRlc3RzL2YyZnMvMDEzICAgICB8IDcxICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gIHRlc3RzL2YyZnMvMDEz
Lm91dCB8ICAyICsrCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDczIGluc2VydGlvbnMoKykKPj4gIGNy
ZWF0ZSBtb2RlIDEwMDc1NSB0ZXN0cy9mMmZzLzAxMwo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRl
c3RzL2YyZnMvMDEzLm91dAo+Pgo+PiBkaWZmIC0tZ2l0IGEvdGVzdHMvZjJmcy8wMTMgYi90ZXN0
cy9mMmZzLzAxMwo+PiBuZXcgZmlsZSBtb2RlIDEwMDc1NQo+PiBpbmRleCAwMDAwMDAwMC4uNGNm
NTY4NDAKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi90ZXN0cy9mMmZzLzAxMwo+PiBAQCAtMCww
ICsxLDcxIEBACj4+ICsjISAvYmluL2Jhc2gKPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAKPj4gKyMgQ29weXJpZ2h0IChjKSAyMDI1IENoYW8gWXUuICBBbGwgUmlnaHRzIFJl
c2VydmVkLgo+PiArIwo+PiArIyBGUyBRQSBUZXN0IE5vLiBmMmZzLzAxMwo+PiArIwo+PiArIyBU
aGlzIGlzIGEgcmVncmVzc2lvbiB0ZXN0Y2FzZSB0byBjaGVjayB3aGV0aGVyIHdlIHdpbGwgaGFu
ZGxlIGRhdGFiYXNlCj4+ICsjIGlub2RlIGRpcnR5IHN0YXR1cyBjb3JyZWN0bHk6Cj4+ICsjIDEu
IG1vdW50IGYyZnMgaW1hZ2Ugdy8gdGltZW91dCBmYXVsdCBpbmplY3Rpb24gb3B0aW9uCj4+ICsj
IDIuIGNyZWF0ZSBhIHJlZ3VsYXIgZmlsZSwgYW5kIHdyaXRlIGRhdGEgaW50byB0aGUgZmlsZQo+
PiArIyAzLiBzdGFydCB0cmFuc2FjdGlvbiBvbiB0aGUgZmlsZSAodmlhIEYyRlNfSU9DX1NUQVJU
X0FUT01JQ19XUklURSkKPj4gKyMgNC4gd3JpdGUgdHJhbnNhY3Rpb24gZGF0YSB0byB0aGUgZmls
ZQo+PiArIyA1LiBjb21taXQgYW5kIGVuZCB0aGUgdHJhbnNhY3Rpb24gKHZpYSBGMkZTX0lPQ19D
T01NSVRfQVRPTUlDX1dSSVRFKQo+PiArIyA2LiBtZWFud2hpbGUgbG9vcCBjYWxsIGZzeW5jIGlu
IHBhcmFsbGVsCj4+ICsjIEJlZm9yZSBmMDk4YWViYTA0YzkgKCJmMmZzOiBmaXggdG8gYXZvaWQg
YXRvbWljaXR5IGNvcnJ1cHRpb24gb2YgYXRvbWljCj4+ICsjIGZpbGUiKSwgZGF0YWJhc2UgZmls
ZSBtYXkgYmVjb21lIGNvcnJ1cHRlZCBhZnRlciBhdG9taWMgd3JpdGUgd2hpbGUKPj4gKyMgdGhl
cmUgaXMgY29uY3VycmVudCBkaXJ0eSBpbm9kZSBmbHVzaCBpbiBiYWNrZ3JvdW5kLgo+PiArIwo+
PiArLiAuL2NvbW1vbi9wcmVhbWJsZQo+PiArX2JlZ2luX2ZzdGVzdCBhdXRvIHF1aWNrCj4+ICtf
cmVxdWlyZV9rZXJuZWxfY29uZmlnIENPTkZJR19GMkZTX0ZBVUxUX0lOSkVDVElPTgo+PiArX3Jl
cXVpcmVfY29tbWFuZCAiJEYyRlNfSU9fUFJPRyIgZjJmc19pbwo+PiArCj4+ICtfY2xlYW51cCgp
Cj4+ICt7Cj4+ICsgICAgICAgWyAtbiAiJGF0b21pY193cml0ZV9waWQiIF0gJiYga2lsbCAtOSAk
YXRvbWljX3dyaXRlX3BpZAo+PiArICAgICAgIHdhaXQKPj4gKyAgICAgICBjZCAvCj4+ICsgICAg
ICAgcm0gLXIgLWYgJHRtcC4qCj4+ICt9Cj4+ICsKPj4gK19maXhlZF9ieV9rZXJuZWxfY29tbWl0
IGYwOThhZWJhMDRjOSBcCj4+ICsgICAgICAgImYyZnM6IGZpeCB0byBhdm9pZCBhdG9taWNpdHkg
Y29ycnVwdGlvbiBvZiBhdG9taWMgZmlsZSIKPj4gKwo+PiArX3JlcXVpcmVfc2NyYXRjaAo+PiAr
Cj4+ICtfc2NyYXRjaF9ta2ZzID4+ICRzZXFyZXMuZnVsbAo+PiArIyBub3RlIHRoYXQgaXQgcmVs
aXMgb24gRkFVTFRfVElNRU9VVCBmYXVsdCBpbmplY3Rpb24gc3VwcG9ydCBpbiBmMmZzCj4gCj4g
cmVsaXMgLT4gcmVsaWVzCgpXaWxsIGZpeC4KCj4gCj4+ICtfc2NyYXRjaF9tb3VudCAiLW8gZmF1
bHRfaW5qZWN0aW9uPTEsZmF1bHRfdHlwZT00MTk0MzA0IiA+PiAkc2VxcmVzLmZ1bGwKPj4gKwo+
PiArZGJmaWxlPSRTQ1JBVENIX01OVC9maWxlLmRiCj4+ICsKPj4gKyMgaW5pdGlhbGl6ZSBkYXRh
YmFzZSBmaWxlCj4+ICskWEZTX0lPX1BST0cgLWMgInB3cml0ZSAwIDRrIiAtYyAiZnN5bmMiIC1m
ICRkYmZpbGUgPj4gJHNlcXJlcy5mdWxsCj4+ICsKPj4gKyMgc3luYyBmaWxlc3lzdGVtIHRvIGNs
ZWFyIGRpcnR5IGlub2RlCj4+ICtzeW5jCj4+ICsKPj4gKyMgc3RhcnQgYXRvbWljX3dyaXRlIG9u
IHNyYy5kYiBkYXRhYmFzZSBmaWxlIGFuZCBjb21taXQgdHJhbnNhY3Rpb24KPj4gKyRGMkZTX0lP
X1BST0cgd3JpdGUgMSAwIDIgemVybyBhdG9taWNfY29tbWl0ICRkYmZpbGUgPj4gJHNlcXJlcy5m
dWxsICYKPiAKPiBJIHRoaW5rIHdlIG1pZ2h0IGhhdmUgc29tZSB0aW1pbmcgaXNzdWVzIGhlcmUg
bGlrZSBiYWNrZ3JvdW5kIGYyZnNfaW8KPiBlbmRzIGVhcmxpZXIgdGhhbiBmb3JlZ3JvdW5kIGZz
eW5jKCkgbG9vcC4KCldoYXQgYWJvdXQgYWRkaW5nIGEgc3lzZnMgZW50cnkgdG8gY29udHJvbCB0
aW1lb3V0LCBieSBkZWZhdWx0IGl0J3MKMSBzZWNvbmQsIHdlIGNhbiB0dW5lIGl0IHRvIDUgc2Vj
b25kIGZvciB0aGlzIGNhc2U/CgpUaGFua3MsCgo+IAo+PiArYXRvbWljX3dyaXRlX3BpZD0kIQo+
PiArCj4+ICsjIGNhbGwgZnN5bmMgdG8gZmx1c2ggZGlydHkgaW5vZGUgb2YgZGF0YWJhc2UgZmls
ZSBpbiBwYXJhbGxlbAo+PiArZm9yICgoaj0wO2o8MTAwMDtqKyspKSBkbwo+PiArICAgICAgICRG
MkZTX0lPX1BST0cgZnN5bmMgJGRiZmlsZSA+PiAkc2VxcmVzLmZ1bGwKPj4gK2RvbmUKPj4gKwo+
PiArd2FpdCAkYXRvbWljX3dyaXRlX3BpZAo+PiArdW5zZXQgYXRvbWljX3dyaXRlX3BpZAo+PiAr
Cj4+ICsjIGZsdXNoIGRpcnR5IGRhdGEgYW5kIGRyb3AgY2FjaGUKPj4gK3N5bmMKPj4gK2VjaG8g
MyA+IC9wcm9jL3N5cy92bS9kcm9wX2NhY2hlcwo+PiArCj4+ICtzdGF0ICRkYmZpbGUgLWMgJXMK
Pj4gKwo+PiArcm0gJGRiZmlsZQo+PiArc3luYwo+PiArCj4+ICtzdGF0dXM9MAo+PiArZXhpdAo+
PiBkaWZmIC0tZ2l0IGEvdGVzdHMvZjJmcy8wMTMub3V0IGIvdGVzdHMvZjJmcy8wMTMub3V0Cj4+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwLi5kOTI3MWY3NQo+PiAtLS0g
L2Rldi9udWxsCj4+ICsrKyBiL3Rlc3RzL2YyZnMvMDEzLm91dAo+PiBAQCAtMCwwICsxLDIgQEAK
Pj4gK1FBIG91dHB1dCBjcmVhdGVkIGJ5IDAxMwo+PiArODE5Mgo+PiAtLQo+PiAyLjQ5LjAKPj4K
Pj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Pj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKPj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
