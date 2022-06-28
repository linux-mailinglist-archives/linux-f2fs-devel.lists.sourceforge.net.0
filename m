Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4359155BF3E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Jun 2022 09:50:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o65zK-0002Vd-Qv; Tue, 28 Jun 2022 07:50:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1o65zJ-0002VX-81
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jun 2022 07:50:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i1ctiOj9P++Pc99uPevo65dP/067UGm2oI+CUyVIsq8=; b=WM86ytFVD1ZcMOjv+3sg1m2mW6
 pf8qAwQoogemGjiPl9cYGCy4Mh10A4cu4afLNx6NNWS2fM0pKLY9gKh+3sUB3AEBTVtSUd/8JNBvJ
 way6cQn+3ybXW/hLK9ZK8IdiZJ3kOwJaYvcewzLVmzdm1RESowAtd4f4K34Bpoe2zSqA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i1ctiOj9P++Pc99uPevo65dP/067UGm2oI+CUyVIsq8=; b=EeI2nNH0iq/d1G3AfmqKI7GjA4
 UXNcwpUoAhp8cbV7mEYonbg+psPca6TGc5t6namV6Rv2KH5yGGhFh4s11J4+QxPqggs8rvzR6YNdC
 a+OhU/+cZ1Scep8ZfXhIhU74XNwsUFrRumpPYO1Ak7RJUlNXEY67dUg8/+jON0Mri0rQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o65zB-00GcXl-OD
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jun 2022 07:50:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 61BE860E9D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 28 Jun 2022 07:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B077C3411D;
 Tue, 28 Jun 2022 07:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656402607;
 bh=B5QIhlbtzECgsRE8EI6Zyf1MuzRiNeg87KIBkcQ7vvU=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=uBEY+beYn2AWAxOKCmPu7Pw+1xiYKV0VUre/0qN+Me1NzxYbEo4V+U01T42wdCMI2
 WivFZE+tGZfl6IKsIFAq+uYSROpIolPF3O3nTjazZoFrk4OwzcxhNWb6hNNvkPCxS2
 J5T6rJacKk8KDTCbtObsfVOJvPOWH1mt46cTO8gwDSmFfsSkp17r+UA3T8w6tKJqrh
 qwOPiU13V6z4mQ0/nVbvioRI97P3N8PkTwC6Qqc9JRKDG31aAChLd6BB/ZoSxr7vFM
 qRWlRyJj9U2irA7pLgXYlRkgzTGt2lgM88LF87u6XLMU8cXD2torMVXCgR0JOkagI1
 vo0IK3sEeZTsA==
Message-ID: <ea40fecd-a16f-4ded-a062-21b097d67230@kernel.org>
Date: Tue, 28 Jun 2022 15:50:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220617223106.3517374-1-jaegeuk@kernel.org>
 <YrNJBMGpjPdtwVY+@google.com>
 <f3484c66-bb5e-b4d6-fc43-95a73c280f1d@kernel.org>
In-Reply-To: <f3484c66-bb5e-b4d6-fc43-95a73c280f1d@kernel.org>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/28 15:46, Chao Yu wrote: > On 2022/6/23 0:53,
 Jaegeuk
 Kim wrote: >> This fixes the below corruption. >> >> [345393.335389] F2FS-fs
 (vdb): sanity_check_inode: inode (ino=6d0, mode=33206) shou [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o65zB-00GcXl-OD
Subject: Re: [f2fs-dev] [PATCH 1/3 v2] f2fs: attach inline_data after
 setting compression
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
Cc: stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMi82LzI4IDE1OjQ2LCBDaGFvIFl1IHdyb3RlOgo+IE9uIDIwMjIvNi8yMyAwOjUzLCBK
YWVnZXVrIEtpbSB3cm90ZToKPj4gVGhpcyBmaXhlcyB0aGUgYmVsb3cgY29ycnVwdGlvbi4KPj4K
Pj4gWzM0NTM5My4zMzUzODldIEYyRlMtZnMgKHZkYik6IHNhbml0eV9jaGVja19pbm9kZTogaW5v
ZGUgKGlubz02ZDAsIG1vZGU9MzMyMDYpIHNob3VsZCBub3QgaGF2ZSBpbmxpbmVfZGF0YSwgcnVu
IGZzY2sgdG8gZml4Cj4+Cj4+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KPj4gRml4ZXM6
IDY3N2E4MmI0NGViZiAoImYyZnM6IGZpeCB0byBkbyBzYW5pdHkgY2hlY2sgZm9yIGlubGluZSBp
bm9kZSIpCj4+IFNpZ25lZC1vZmYtYnk6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+
Cj4+IC0tLQo+PiDCoCBmcy9mMmZzL25hbWVpLmMgfCAxNyArKysrKysrKysrKy0tLS0tLQo+PiDC
oCAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4KPj4g
ZGlmZiAtLWdpdCBhL2ZzL2YyZnMvbmFtZWkuYyBiL2ZzL2YyZnMvbmFtZWkuYwo+PiBpbmRleCBj
NTQ5YWNiNTJhYzQuLmJmMDBkNTA1N2FiYiAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9uYW1laS5j
Cj4+ICsrKyBiL2ZzL2YyZnMvbmFtZWkuYwo+PiBAQCAtODksOCArODksNiBAQCBzdGF0aWMgc3Ry
dWN0IGlub2RlICpmMmZzX25ld19pbm9kZShzdHJ1Y3QgdXNlcl9uYW1lc3BhY2UgKm1udF91c2Vy
bnMsCj4+IMKgwqDCoMKgwqAgaWYgKHRlc3Rfb3B0KHNiaSwgSU5MSU5FX1hBVFRSKSkKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9JTkxJTkVfWEFUVFIpOwo+
PiAtwqDCoMKgIGlmICh0ZXN0X29wdChzYmksIElOTElORV9EQVRBKSAmJiBmMmZzX21heV9pbmxp
bmVfZGF0YShpbm9kZSkpCj4+IC3CoMKgwqDCoMKgwqDCoCBzZXRfaW5vZGVfZmxhZyhpbm9kZSwg
RklfSU5MSU5FX0RBVEEpOwo+PiDCoMKgwqDCoMKgIGlmIChmMmZzX21heV9pbmxpbmVfZGVudHJ5
KGlub2RlKSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9J
TkxJTkVfREVOVFJZKTsKPj4gQEAgLTEwNywxMCArMTA1LDYgQEAgc3RhdGljIHN0cnVjdCBpbm9k
ZSAqZjJmc19uZXdfaW5vZGUoc3RydWN0IHVzZXJfbmFtZXNwYWNlICptbnRfdXNlcm5zLAo+PiDC
oMKgwqDCoMKgIGYyZnNfaW5pdF9leHRlbnRfdHJlZShpbm9kZSwgTlVMTCk7Cj4+IC3CoMKgwqAg
c3RhdF9pbmNfaW5saW5lX3hhdHRyKGlub2RlKTsKPj4gLcKgwqDCoCBzdGF0X2luY19pbmxpbmVf
aW5vZGUoaW5vZGUpOwo+PiAtwqDCoMKgIHN0YXRfaW5jX2lubGluZV9kaXIoaW5vZGUpOwo+PiAt
Cj4+IMKgwqDCoMKgwqAgRjJGU19JKGlub2RlKS0+aV9mbGFncyA9Cj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBmMmZzX21hc2tfZmxhZ3MobW9kZSwgRjJGU19JKGRpciktPmlfZmxhZ3MgJiBGMkZTX0ZM
X0lOSEVSSVRFRCk7Cj4+IEBAIC0xMjcsNiArMTIxLDE0IEBAIHN0YXRpYyBzdHJ1Y3QgaW5vZGUg
KmYyZnNfbmV3X2lub2RlKHN0cnVjdCB1c2VyX25hbWVzcGFjZSAqbW50X3VzZXJucywKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2V0X2NvbXByZXNzX2NvbnRleHQoaW5vZGUpOwo+PiDC
oMKgwqDCoMKgIH0KPj4gK8KgwqDCoCAvKiBTaG91bGQgZW5hYmxlIGlubGluZV9kYXRhIGFmdGVy
IGNvbXByZXNzaW9uIHNldCAqLwo+PiArwqDCoMKgIGlmICh0ZXN0X29wdChzYmksIElOTElORV9E
QVRBKSAmJiBmMmZzX21heV9pbmxpbmVfZGF0YShpbm9kZSkpCj4+ICvCoMKgwqDCoMKgwqDCoCBz
ZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklfSU5MSU5FX0RBVEEpOwo+PiArCj4+ICvCoMKgwqAgc3Rh
dF9pbmNfaW5saW5lX3hhdHRyKGlub2RlKTsKPj4gK8KgwqDCoCBzdGF0X2luY19pbmxpbmVfaW5v
ZGUoaW5vZGUpOwo+PiArwqDCoMKgIHN0YXRfaW5jX2lubGluZV9kaXIoaW5vZGUpOwo+PiArCj4+
IMKgwqDCoMKgwqAgZjJmc19zZXRfaW5vZGVfZmxhZ3MoaW5vZGUpOwo+PiDCoMKgwqDCoMKgIHRy
YWNlX2YyZnNfbmV3X2lub2RlKGlub2RlLCAwKTsKPj4gQEAgLTMyNSw2ICszMjcsOSBAQCBzdGF0
aWMgdm9pZCBzZXRfY29tcHJlc3NfaW5vZGUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1
Y3QgaW5vZGUgKmlub2RlLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFpc19leHRlbnNpb25f
ZXhpc3QobmFtZSwgZXh0W2ldLCBmYWxzZSkpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNvbnRpbnVlOwo+PiArwqDCoMKgwqDCoMKgwqAgLyogRG8gbm90IHVzZSBpbmxpbmVfZGF0YSB3
aXRoIGNvbXByZXNzaW9uICovCj4+ICvCoMKgwqDCoMKgwqDCoCBzdGF0X2RlY19pbmxpbmVfaW5v
ZGUoaW5vZGUpOwo+PiArwqDCoMKgwqDCoMKgwqAgY2xlYXJfaW5vZGVfZmxhZyhpbm9kZSwgRklf
SU5MSU5FX0RBVEEpOwo+IAo+IEl0IGxvb2tzIHdlIGRvbid0IG5lZWQgdG8gZGlydHkgaW5vZGUg
aWYgdGhlcmUgaXMgbm8gaW5saW5lX2RhdGEgZmxhZy4KCk9oLCBpdCBsb29rcyBzZXRfY29tcHJl
c3NfY29udGV4dCgpIHdpbGwgZGlydHkgaW5vZGUgYW55d2F5Li4uLiA6UAoKVGhhbmtzLAoKPiAK
PiBUaGFua3MsCj4gCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzZXRfY29tcHJlc3NfY29udGV4dChp
bm9kZSk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+IMKgwqDCoMKgwqAgfQo+IAo+
IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
