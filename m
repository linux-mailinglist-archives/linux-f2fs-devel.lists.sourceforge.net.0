Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A116CAD4C00
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Jun 2025 08:47:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4j7H6gHfPC/4iBTLOcSddm6Qrth2Q1dLDvN5R04w/G4=; b=Qcdjuov32oHYxGrTfLY0RDqBLr
	RLqgJVfpY3AdQvDSTK+l+82DN1oyfG3r0ZRMfHsRQ3RfWbJHfKjUPKeR1D7hAF6ihLfAGK9pYjtcR
	ktgHm8x6sZMwUSu8h8jB8PWFNfH6K3IvV9WTS1Mf+BKZyAu7RhQdHMkkLMLmhoUMLE8k=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPFFJ-0000ZM-El;
	Wed, 11 Jun 2025 06:47:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uPFFE-0000ZC-7V
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jun 2025 06:47:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WpzG2xrpgT101EgheOwN6fHK81mGVUo8Wi0rsnHsPrg=; b=FXFyRNhSZN3bPhodgznOW9ys+1
 S4vtdecAMUVQcjDDXhA+TDtEtpsDH8FozrjPQKDS/hydUZsMZn+bl3Rc4o5hC70DmzYbLkGNxJzDd
 ydjYfBHE+GL3dX2NxturtLMK1c3MyokfaGRaNN7hbOTrtWcCrq2gBBf8tC9ORUytWQPM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WpzG2xrpgT101EgheOwN6fHK81mGVUo8Wi0rsnHsPrg=; b=E6J3BOyJ2Nm8J1gCYhzkYdF3PQ
 oWygL01AEKao2gyjLQAu/YGdX6Tb9IVZiylUT4bg6u2ab5lET+Ze2QQArqRUA6tKKnqvH6G7QYxYC
 3FCx9K5D3kgODDpy+2tP2luM07K4yuYFC8VOaeJi4+tSnekE77bmMAX2Gcp1W8JoOo7Q=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPFFD-0000pB-Lj for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jun 2025 06:47:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0643C61F1D;
 Wed, 11 Jun 2025 06:47:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1645C4CEEE;
 Wed, 11 Jun 2025 06:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749624440;
 bh=Y7drl0N8DpxbEGHn/GNhO4IXTOkaEABM7Sc5vcplQJc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Mmpf0N/jNItTtSVV77cphUJ/VJl9iiHKOY9t1mlUoEpfBGhZ6qc2f1NcxprXCXQWH
 Uxitl070VC7uObSKvmZD/AEOEHLnpJVjplpq1CqzRlf0/chl9ubs0lWxp47D1Cyzss
 ly/OcVZJOM8yLN8Y15Aqxx0qNCNxFRgp+4jXSghZybMS1JaT8F7cFTbEaOtrPAXuUT
 eBZsA7/MdZop6TmaK9MlMik7tWMVU1l3u2hYdc4Eyp6yGowi2dCv6dunvNKm3CvNF+
 xVqfhi4CZqqc3zPM96F7u4uxc2ExkGc6KNkiixQH5hnyAeQ5RztRYEn35r+WVRT4S1
 Fja9ZOqLe1IBw==
Message-ID: <c36ab955-c8db-4a8b-a9d0-f07b5f426c3f@kernel.org>
Date: Wed, 11 Jun 2025 14:47:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1749107920-17958-1-git-send-email-zhiguo.niu@unisoc.com>
 <aEhYfYrknbNzT8Or@google.com>
 <5c1da066-0c76-42f4-8c46-a99f60a900bf@kernel.org>
 <CAHJ8P3LNrSRT8hfbr=x5HvkQRGBSTpftPbd7NrfUdO-2LgSLfg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3LNrSRT8hfbr=x5HvkQRGBSTpftPbd7NrfUdO-2LgSLfg@mail.gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 6/11/25 14:41, Zhiguo Niu wrote: > Chao Yu <chao@kernel.org>
    于2025年6月11日周三 14:07写道： >> >> On 6/11/25 00:08, Jaegeuk
   Kim wrote: >>> Hi Zhiguo, >>> >>> This patch causes CPU hang wh [...] 
 
 Content analysis details:   (-0.3 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uPFFD-0000pB-Lj
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: compress: fix UAF of
 f2fs_inode_info in f2fs_free_dic
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
 linux-f2fs-devel@lists.sourceforge.net, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, baocong.liu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNi8xMS8yNSAxNDo0MSwgWmhpZ3VvIE5pdSB3cm90ZToKPiBDaGFvIFl1IDxjaGFvQGtlcm5l
bC5vcmc+IOS6jjIwMjXlubQ25pyIMTHml6XlkajkuIkgMTQ6MDflhpnpgZPvvJoKPj4KPj4gT24g
Ni8xMS8yNSAwMDowOCwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4+PiBIaSBaaGlndW8sCj4+Pgo+Pj4g
VGhpcyBwYXRjaCBjYXVzZXMgQ1BVIGhhbmcgd2hlbiBydW5uaW5nIGZzc3RyZXNzIG9uIGNvbXBy
ZXNzZWQvbm9uLWNvbXByZXNzZWQKPj4+IGZpbGVzLiBQbGVhc2UgY2hlY2suCj4+Cj4+IE9oLCBz
ZWVtcyBpdCBtYXkgY2F1c2UgYmVsb3cgZGVhZGxvY2s6Cj4+Cj4+IENQVTAKPj4gcHJvY2VzcyBB
Cj4+IC0gc3Bpbl9sb2NrKGlfbG9jaykKPj4gc29mdHdhcmUgSVJRCj4+IC0gZW5kX2lvCj4+ICAt
IGlncmFiCj4+ICAgLSBzcGluX2xvY2soaV9sb2NrKQo+Pgo+PiBUaGFua3MsCj4gSGkgQ2hhbywK
PiBUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0Lgo+IEkgaGF2ZSB0ZXN0ZWQgdGhpcyBwYXRj
aCBsb2NhbGx5IGFib3V0IHNvbWUgYmFzaWMgY2FzZXMgYmVmb3JlIHN1Ym1pc3Npb24uCj4gU28g
aXQgc2VlbXMgdGhhdCBzaG91bGQgdXNlIHRoZSBmb2xsb3dpbmcgbWV0aG9kICB0byBzb2x2ZSB0
aGlzIHByb2JsZW0/Cj4gIiBzdG9yZSBpX2NvbXByZXNzX2FsZ29yaXRobS9zYmkgaW4gZGljIHRv
IGF2b2lkIGlub2RlIGFjY2Vzcz8iCgpaaGlndW8sCgpZZWFoLCBJIGd1ZXNzIHNvLgoKVGhhbmtz
LAoKPiB0aGFua3PvvIEKPiAKPiAKPj4KPj4+Cj4+PiBPbiAwNi8wNSwgWmhpZ3VvIE5pdSB3cm90
ZToKPj4+PiBUaGUgZGVjb21wcmVzc19pb19jdHggbWF5IGJlIHJlbGVhc2VkIGFzeW5jaHJvbm91
c2x5IGFmdGVyCj4+Pj4gSS9PIGNvbXBsZXRpb24uIElmIHRoaXMgZmlsZSBpcyBkZWxldGVkIGlt
bWVkaWF0ZWx5IGFmdGVyIHJlYWQsCj4+Pj4gYW5kIHRoZSBrd29ya2VyIG9mIHByb2Nlc3Npbmcg
cG9zdF9yZWFkX3dxIGhhcyBub3QgYmVlbiBleGVjdXRlZCB5ZXQKPj4+PiBkdWUgdG8gaGlnaCB3
b3JrbG9hZHMsIEl0IGlzIHBvc3NpYmxlIHRoYXQgdGhlIGlub2RlKGYyZnNfaW5vZGVfaW5mbykK
Pj4+PiBpcyBldmljdGVkIGFuZCBmcmVlZCBiZWZvcmUgaXQgaXMgdXNlZCBmMmZzX2ZyZWVfZGlj
Lgo+Pj4+Cj4+Pj4gICAgIFRoZSBVQUYgY2FzZSBhcyBiZWxvdzoKPj4+PiAgICAgVGhyZWFkIEEg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRocmVhZCBCCj4+Pj4gICAgIC0g
ZjJmc19kZWNvbXByZXNzX2VuZF9pbwo+Pj4+ICAgICAgLSBmMmZzX3B1dF9kaWMKPj4+PiAgICAg
ICAtIHF1ZXVlX3dvcmsKPj4+PiAgICAgICAgIGFkZCBmcmVlX2RpYyB3b3JrIHRvIHBvc3RfcmVh
ZF93cQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0gZG9fdW5saW5rCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0gaXB1dAo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLSBldmljdAo+Pj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gY2FsbF9yY3UKPj4+PiAgICAgVGhp
cyBmaWxlIGlzIGRlbGV0ZWQgYWZ0ZXIgcmVhZC4KPj4+Pgo+Pj4+ICAgICBUaHJlYWQgQyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGt3b3JrZXIgdG8gcHJvY2VzcyBwb3N0X3JlYWRf
d3EKPj4+PiAgICAgLSByY3VfZG9fYmF0Y2gKPj4+PiAgICAgIC0gZjJmc19mcmVlX2lub2RlCj4+
Pj4gICAgICAgLSBrbWVtX2NhY2hlX2ZyZWUKPj4+PiAgICAgIGlub2RlIGlzIGZyZWVkIGJ5IHJj
dQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gcHJv
Y2Vzc19zY2hlZHVsZWRfd29ya3MKPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLSBmMmZzX2xhdGVfZnJlZV9kaWMKPj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gZjJmc19mcmVlX2RpYwo+Pj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gZjJmc19yZWxlYXNl
X2RlY29tcF9tZW0KPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJl
YWQgKGRpYy0+aW5vZGUpLT5pX2NvbXByZXNzX2FsZ29yaXRobQo+Pj4+Cj4+Pj4gVGhpcyBwYXRj
aCB1c2UgaWdyYWIgYmVmb3JlIGYyZnNfZnJlZV9kaWMgYW5kIGlwdXQgYWZ0ZXIgZnJlZSB0aGUg
ZGljIHdoZW4gZGljIGZyZWUKPj4+PiBhY3Rpb24gaXMgZG9uZSBieSBrd29ya2VyLgo+Pj4+Cj4+
Pj4gQ2M6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4+Pj4gRml4ZXM6IGJm
ZjEzOWI0OWQ5ZiAoImYyZnM6IGhhbmRsZSBkZWNvbXByZXNzIG9ubHkgcG9zdCBwcm9jZXNzaW5n
IGluIHNvZnRpcnEiKQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFpoaWd1byBOaXUgPHpoaWd1by5uaXVA
dW5pc29jLmNvbT4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBCYW9jb25nIExpdSA8YmFvY29uZy5saXVA
dW5pc29jLmNvbT4KPj4+PiAtLS0KPj4+PiB2MzogdXNlIGlncmFiIHRvIHJlcGxhY2UgX19pZ2V0
Cj4+Pj4gdjI6IHVzZSBfX2lnZXQvaXB1dCBmdW5jdGlvbgo+Pj4+IC0tLQo+Pj4+ICBmcy9mMmZz
L2NvbXByZXNzLmMgfCAxNCArKysrKysrKystLS0tLQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2Yy
ZnMvY29tcHJlc3MuYyBiL2ZzL2YyZnMvY29tcHJlc3MuYwo+Pj4+IGluZGV4IGIzYzFkZjkuLjcy
OWFkMTYgMTAwNjQ0Cj4+Pj4gLS0tIGEvZnMvZjJmcy9jb21wcmVzcy5jCj4+Pj4gKysrIGIvZnMv
ZjJmcy9jb21wcmVzcy5jCj4+Pj4gQEAgLTE2ODcsNyArMTY4Nyw3IEBAIHN0YXRpYyB2b2lkIGYy
ZnNfcmVsZWFzZV9kZWNvbXBfbWVtKHN0cnVjdCBkZWNvbXByZXNzX2lvX2N0eCAqZGljLAo+Pj4+
ICB9Cj4+Pj4KPj4+PiAgc3RhdGljIHZvaWQgZjJmc19mcmVlX2RpYyhzdHJ1Y3QgZGVjb21wcmVz
c19pb19jdHggKmRpYywKPj4+PiAtICAgICAgICAgICAgYm9vbCBieXBhc3NfZGVzdHJveV9jYWxs
YmFjayk7Cj4+Pj4gKyAgICAgICAgICAgIGJvb2wgYnlwYXNzX2Rlc3Ryb3lfY2FsbGJhY2ssIGJv
b2wgbGF0ZV9mcmVlKTsKPj4+Pgo+Pj4+ICBzdHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmYyZnNf
YWxsb2NfZGljKHN0cnVjdCBjb21wcmVzc19jdHggKmNjKQo+Pj4+ICB7Cj4+Pj4gQEAgLTE3NDMs
MTIgKzE3NDMsMTIgQEAgc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4ICpmMmZzX2FsbG9jX2RpYyhz
dHJ1Y3QgY29tcHJlc3NfY3R4ICpjYykKPj4+PiAgICAgIHJldHVybiBkaWM7Cj4+Pj4KPj4+PiAg
b3V0X2ZyZWU6Cj4+Pj4gLSAgICBmMmZzX2ZyZWVfZGljKGRpYywgdHJ1ZSk7Cj4+Pj4gKyAgICBm
MmZzX2ZyZWVfZGljKGRpYywgdHJ1ZSwgZmFsc2UpOwo+Pj4+ICAgICAgcmV0dXJuIEVSUl9QVFIo
cmV0KTsKPj4+PiAgfQo+Pj4+Cj4+Pj4gIHN0YXRpYyB2b2lkIGYyZnNfZnJlZV9kaWMoc3RydWN0
IGRlY29tcHJlc3NfaW9fY3R4ICpkaWMsCj4+Pj4gLSAgICAgICAgICAgIGJvb2wgYnlwYXNzX2Rl
c3Ryb3lfY2FsbGJhY2spCj4+Pj4gKyAgICAgICAgICAgIGJvb2wgYnlwYXNzX2Rlc3Ryb3lfY2Fs
bGJhY2ssIGJvb2wgbGF0ZV9mcmVlKQo+Pj4+ICB7Cj4+Pj4gICAgICBpbnQgaTsKPj4+Pgo+Pj4+
IEBAIC0xNzc1LDYgKzE3NzUsOCBAQCBzdGF0aWMgdm9pZCBmMmZzX2ZyZWVfZGljKHN0cnVjdCBk
ZWNvbXByZXNzX2lvX2N0eCAqZGljLAo+Pj4+ICAgICAgfQo+Pj4+Cj4+Pj4gICAgICBwYWdlX2Fy
cmF5X2ZyZWUoZGljLT5pbm9kZSwgZGljLT5ycGFnZXMsIGRpYy0+bnJfcnBhZ2VzKTsKPj4+PiAr
ICAgIGlmIChsYXRlX2ZyZWUpCj4+Pj4gKyAgICAgICAgICAgIGlwdXQoZGljLT5pbm9kZSk7Cj4+
Pj4gICAgICBrbWVtX2NhY2hlX2ZyZWUoZGljX2VudHJ5X3NsYWIsIGRpYyk7Cj4+Pj4gIH0KPj4+
Pgo+Pj4+IEBAIC0xNzgzLDE2ICsxNzg1LDE4IEBAIHN0YXRpYyB2b2lkIGYyZnNfbGF0ZV9mcmVl
X2RpYyhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4+Pj4gICAgICBzdHJ1Y3QgZGVjb21wcmVz
c19pb19jdHggKmRpYyA9Cj4+Pj4gICAgICAgICAgICAgIGNvbnRhaW5lcl9vZih3b3JrLCBzdHJ1
Y3QgZGVjb21wcmVzc19pb19jdHgsIGZyZWVfd29yayk7Cj4+Pj4KPj4+PiAtICAgIGYyZnNfZnJl
ZV9kaWMoZGljLCBmYWxzZSk7Cj4+Pj4gKyAgICBmMmZzX2ZyZWVfZGljKGRpYywgZmFsc2UsIHRy
dWUpOwo+Pj4+ICB9Cj4+Pj4KPj4+PiAgc3RhdGljIHZvaWQgZjJmc19wdXRfZGljKHN0cnVjdCBk
ZWNvbXByZXNzX2lvX2N0eCAqZGljLCBib29sIGluX3Rhc2spCj4+Pj4gIHsKPj4+PiAgICAgIGlm
IChyZWZjb3VudF9kZWNfYW5kX3Rlc3QoJmRpYy0+cmVmY250KSkgewo+Pj4+ICAgICAgICAgICAg
ICBpZiAoaW5fdGFzaykgewo+Pj4+IC0gICAgICAgICAgICAgICAgICAgIGYyZnNfZnJlZV9kaWMo
ZGljLCBmYWxzZSk7Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgZjJmc19mcmVlX2RpYyhkaWMs
IGZhbHNlLCBmYWxzZSk7Cj4+Pj4gICAgICAgICAgICAgIH0gZWxzZSB7Cj4+Pj4gICAgICAgICAg
ICAgICAgICAgICAgSU5JVF9XT1JLKCZkaWMtPmZyZWVfd29yaywgZjJmc19sYXRlX2ZyZWVfZGlj
KTsKPj4+PiArICAgICAgICAgICAgICAgICAgICAvKiB1c2UgaWdyYWIgdG8gYXZvaWQgaW5vZGUg
aXMgZXZpY3RlZCBzaW11bHRhbmVvdXNseSAqLwo+Pj4+ICsgICAgICAgICAgICAgICAgICAgIGYy
ZnNfYnVnX29uKEYyRlNfSV9TQihkaWMtPmlub2RlKSwgIWlncmFiKGRpYy0+aW5vZGUpKTsKPj4+
PiAgICAgICAgICAgICAgICAgICAgICBxdWV1ZV93b3JrKEYyRlNfSV9TQihkaWMtPmlub2RlKS0+
cG9zdF9yZWFkX3dxLAo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAm
ZGljLT5mcmVlX3dvcmspOwo+Pj4+ICAgICAgICAgICAgICB9Cj4+Pj4gLS0KPj4+PiAxLjkuMQo+
PgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCg==
