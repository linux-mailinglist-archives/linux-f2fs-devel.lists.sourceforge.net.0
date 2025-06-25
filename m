Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF732AE8E5C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Jun 2025 21:17:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dhP6pt3AwfpHIM4eUENYBjjPMeZO3fhfr6Rivk3Gbs=; b=CP3oodzr9S99YAz2RexR7FeLah
	SzE+YviLa8qUimHCOCCppQdrW2mkGh4zmFlNaqNmGYlybt46g81R1e7M6AwydWrskeX7ULXWvOxOk
	Ln7TtsAec/cH0IQrlXCG8+vG5EmVbmzdDcmKFfA8iQlHTUq1JPUpAhJ6/BPttkgFrQY4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uUVd2-0000EE-El;
	Wed, 25 Jun 2025 19:17:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1uUVcy-0000E4-Bt
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 19:17:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9PI0KKg74O+4zsu/4s1m5YgT0t5a5sGGRqXsex8KV+4=; b=f9OocZnddMEcd/7rouHMiwmLr9
 H/TybKgbNFE8GO18VP1VumUoagQuz76KnD1RyrVXzkgtPupx8attqw+moeHNs0egPDlkgH5BpHUYR
 qR5A2hEmAMBbe+oKncbqgoHTHxb1dj9WttKDv0xuUQiq8lJdYSlx8Bf0PcEC0KEllpxw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9PI0KKg74O+4zsu/4s1m5YgT0t5a5sGGRqXsex8KV+4=; b=Kg7/QwjzBr1Rt0IgmGAd4qzLiI
 x6jti0ZXsFjF3WoFlRFwKwMQ9n9Jm+eJA995wCokGZ1us56WsXi78W0DM/mmnSz6yz156m5UeHQA/
 +npswmnT05AZycI9+PsozRLcCCgiedWRQcG/yxVIhVaBIOHLVfWuWLXX0xLikqfRFKPI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uUVcx-0005ID-SI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 19:17:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2EC7C60010;
 Wed, 25 Jun 2025 19:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9715BC4CEEA;
 Wed, 25 Jun 2025 19:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750879056;
 bh=e6mdajjaaY5koL3e5Crmq60SgZT4vYU/Wk5mcE5cq1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zj7hSevzFjb9nv0J7kpQsGJy2uqoqv/HX/Syg50/I+VKdIlWz5Ct06R68BfydP4ak
 OWofz6fZdZ8o7zke1xi9L5JvMnkTnsC3vwwqSBEfYLWUou+uyuewdc5mMWeu6svGz3
 aPPPpk9Vk1YTFlDIfry6lPaJoEa2oA7lMLFXRvq3CNoK1o6DEC/PoVOeU2/8Ucha9F
 ZTIrHr0nU/srtYm5KMh+ysaprYtF48Rf6HpnyQ3kYKeGGFldsA1l3p2OuUU1qcYalT
 +8pfDNBZGj2cUuvB7BLrG1tPmX5idHxcgBGuqvy2SVh9zltJRM+3Y0M8tGAgF0uasH
 4GSjy+3D9tS6g==
Date: Wed, 25 Jun 2025 12:17:01 -0700
To: Maxime MERE <maxime.mere@foss.st.com>
Message-ID: <20250625191701.GC1703@sol>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <7f63be76-289b-4a99-b802-afd72e0512b8@hogyros.de>
 <20250612005914.GA546455@google.com> <20250612062521.GA1838@sol>
 <20250625063252.GD8962@sol>
 <f174540e-4b9a-4dc1-9ab8-f4f36fe1f837@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f174540e-4b9a-4dc1-9ab8-f4f36fe1f837@foss.st.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 25, 2025 at 06:29:26PM +0200, Maxime MERE wrote:
 > Hi, > > On 6/25/25 08:32, Eric Biggers wrote: > > That was the synchronous
 throughput. However, submitting multiple requests > > asynchro [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uUVcx-0005ID-SI
Subject: Re: [f2fs-dev] [PATCH] fscrypt: don't use hardware offload Crypto
 API drivers
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, Simon Richter <Simon.Richter@hogyros.de>,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBKdW4gMjUsIDIwMjUgYXQgMDY6Mjk6MjZQTSArMDIwMCwgTWF4aW1lIE1FUkUgd3Jv
dGU6Cj4gSGksCj4gCj4gT24gNi8yNS8yNSAwODozMiwgRXJpYyBCaWdnZXJzIHdyb3RlOgo+ID4g
VGhhdCB3YXMgdGhlIHN5bmNocm9ub3VzIHRocm91Z2hwdXQuICBIb3dldmVyLCBzdWJtaXR0aW5n
IG11bHRpcGxlIHJlcXVlc3RzCj4gPiBhc3luY2hyb25vdXNseSAod2hpY2ggYWdhaW4sIGZzY3J5
cHQgZG9lc24ndCBhY3R1YWxseSBkbykgYmFyZWx5IGhlbHBzLgo+ID4gQXBwYXJlbnRseSB0aGUg
U1RNMzIgY3J5cHRvIGVuZ2luZSBoYXMgb25seSBvbmUgaGFyZHdhcmUgcXVldWUuCj4gPiAKPiA+
IEkgYWxyZWFkeSBzdHJvbmdseSBzdXNwZWN0ZWQgdGhhdCB0aGVzZSBub24taW5saW5lIGNyeXB0
byBlbmdpbmVzIGFyZW4ndCB3b3J0aAo+ID4gdXNpbmcuICBCdXQgSSBkaWRuJ3QgcmVhbGl6ZSB0
aGV5IGFyZSBxdWl0ZSB0aGlzIGJhZC4gIEV2ZW4gd2l0aCBBRVMgb24gYQo+ID4gQ29ydGV4LUE3
IENQVSB0aGF0IGxhY2tzIEFFUyBpbnN0cnVjdGlvbnMsIHRoZSBDUFUgaXMgbXVjaCBmYXN0ZXIh
Cj4gCj4gRnJvbSBhIHBlcmZvcm1hbmNlIHBlcnNwZWN0aXZlLCB1c2luZyBoYXJkd2FyZSBjcnlw
dG8gb2ZmbG9hZHMgdGhlIENQVSwKPiB3aGljaCBpcyBpbXBvcnRhbnQgaW4gcmVhbC13b3JsZCBh
cHBsaWNhdGlvbnMgd2hlcmUgdGhlIENQVSBtdXN0IGhhbmRsZQo+IG11bHRpcGxlIHRhc2tzLiBP
dXIgcHJvY2Vzc29ycyBhcmUgb2Z0ZW4gc2luZ2xlLWNvcmUgYW5kIG5vdCB0aGUgaGlnaGVzdAo+
IHBlcmZvcm1pbmcsIHNvIGhhcmR3YXJlIGFjY2VsZXJhdGlvbiBpcyB2YWx1YWJsZS4KPiAKPiBJ
IGNhbiBzaG93IHlvdSBwZXJmb3JtYW5jZSB0ZXN0IHJlYWxpemVkIHdpdGggb3BlblNTTCAoMy4y
LjQpIHdobyBzaG93cywKPiBsZXNzIENQVSB1c2FnZSBhbmQgYmV0dGVyIHBlcmZvcm1hbmNlIGZv
ciBsYXJnZSBibG9jayBvZiBkYXRhIHdoZW4gb3VyCj4gZHJpdmVyIGlzIHVzZWQgKHZpYSBhZmFs
Zyk6Cj4gCj4gY29tbWFuZCB1c2VkOiBgYGBvcGVuc3NsIHNwZWVkIC1ldnAgYWVzLTI1Ni1jYmMg
LWVuZ2luZSBhZmFsZyAtZWxhcHNlZGBgYAo+IAo+ICstLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsKPiB8IEJsb2NrIFNpemUgKGJ5dGVzKSB8IEFG
QUxHIChNQi9zKSB8IFNXIEJBU0VEIChNQi9zKSB8Cj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tKy0t
LS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tKwo+IHwgMTYgICAgICAgICAgICAgICAgIHwg
MC4wOSAgICAgICAgIHwgOS40NCAgICAgICAgICAgIHwKPiB8IDY0ICAgICAgICAgICAgICAgICB8
IDAuMzQgICAgICAgICB8IDExLjQzICAgICAgICAgICB8Cj4gfCAyNTYgICAgICAgICAgICAgICAg
fCAxLjMxICAgICAgICAgfCAxMi4wOCAgICAgICAgICAgfAo+IHwgMTAyNCAgICAgICAgICAgICAg
IHwgNC45NiAgICAgICAgIHwgMTIuMjcgICAgICAgICAgIHwKPiB8IDgxOTIgICAgICAgICAgICAg
ICB8IDE4LjE4ICAgICAgICB8IDEyLjMzICAgICAgICAgICB8Cj4gfCAxNjM4NCAgICAgICAgICAg
ICAgfCAyMi40OCAgICAgICAgfCAxMi4zMyAgICAgICAgICAgfAo+ICstLS0tLS0tLS0tLS0tLS0t
LS0tLSstLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsKPiAKPiB0byB0ZXN0IENQVSB1
c2FnZSBJJ3ZlIHVzZWQgYSBtb25vY29yZSBzdG0zMm1wMTU3Zi4KPiBoZXJlIHdpdGggYWZhbGcs
IHdlIGhhdmUgYW4gYXZlcmFnZSBDUFUgdXNhZ2Ugb2Ygfjc1JSwgd2l0aCB0aGUgc3cgYmFzZWQK
PiBhcHByb2FjaCBDUFUgaXMgdXNlZCBhdCB+MTAwJQo+IAo+IE1heGltZQoKZnNjcnlwdCBpcyBh
bG1vc3QgYWx3YXlzIHVzZWQgd2l0aCA0MDk2LWJ5dGUgYmxvY2tzLCB3aGljaCBpbiBteSBiZW5j
aG1hcmsgdG9vawphYm91dCAxMzAwIM68cyBlYWNoIHdpdGggQUVTLTEyOC1DQkMtRVNTSVYgdy8g
U1RNMzIgZW5naW5lLCAyNjQgzrxzIGVhY2ggd2l0aApBRVMtMTI4LUNCQy1FU1NJViB3LyBDUFUs
IG9yIDc3IM68cyBlYWNoIHdpdGggQWRpYW50dW0gdy8gQ1BVLiAgVGhlIENQVS1iYXNlZAp0aW1l
cyBzZWVtIHNob3J0IGVub3VnaCB0aGF0IHRoZXJlIGlzbid0IG11Y2ggdGltZSBmb3IgYW5vdGhl
ciB0YXNrIHRvIGJlCnVzZWZ1bGx5IHNjaGVkdWxlZCB3aGlsZSB3YWl0aW5nIGZvciBlYWNoIGJs
b2NrLiAgSXQncyBpbXBvcnRhbnQgdG8gY29uc2lkZXIgKGEpCmRyaXZlciBvdmVyaGVhZCwgKGIp
IHNjaGVkdWxpbmcgb3ZlcmhlYWQsIGFuZCAoYykgdGhlIGxvdyBpbnN0cnVjdGlvbnMgcGVyCnNl
Y29uZCBvZiB0aGlzIHByb2Nlc3NvciBpbiB0aGUgZmlyc3QgcGxhY2UuCgpCeSB0aGUgd2F5LCB0
aGUgYm9hcmQgSSBoYXZlIChTVE0zMk1QMTU3Ri1ESzIpIGlzIGFjdHVhbGx5IG11bHRpLWNvcmUu
ICBJdCBzZWVtcwp0aGlzIGlzIGNvbW1vbiBhbW9uZyBTVCdzIG9mZmVyaW5ncyB0aGF0IGFyZSBp
bnRlbmRlZCB0byBydW4gTGludXg/ICAoT2YgY291cnNlLAp0aGUgbWljcm9jb250cm9sbGVycyB0
aGF0IGRvbid0IHJ1biBMaW51eCBhcmUgYW5vdGhlciBzdG9yeS4pCgotIEVyaWMKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
