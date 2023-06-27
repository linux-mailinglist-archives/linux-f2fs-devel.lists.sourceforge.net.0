Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E00E73FCF5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Jun 2023 15:37:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qE8t2-0002xs-N8;
	Tue, 27 Jun 2023 13:37:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qE8t1-0002xl-D6
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Jun 2023 13:37:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xbWJVVxU1C+B0x6dGzElTn+wrjepJA+rxCamsy8KcrE=; b=WUcik/yAA3JIn50MRuXSlXKjJu
 6yHpqanmxyUk7jiVoHjLrWXcapbCd9mMWWxVYmMS68+i7O16GYlg6toJuwzctAxTiIvPYy9vFa4Y4
 qUQnnrflh5Ujhf6PiHyo05Z25Ce9j7hEyv+BfA6VYHKzvecafU18FMCITUKpKD+RBqYA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xbWJVVxU1C+B0x6dGzElTn+wrjepJA+rxCamsy8KcrE=; b=ODQAojli1+dAJ3P+rRDw+EK+cW
 TQ5RQGVsomt7LEvh+IaiR8LWf7fp4MEYMY3PpHTRZ35THVo3dTBObeiLI7iPP7jw1ZKfk/dfqJH4K
 Ssf6eqx6rZkPYiEoP22xY7w12o6XgM2VUwQ8JOU816B2fiHEgDS/xT0H/VgmFRzz0xgc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qE8t1-0006k0-Fr for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Jun 2023 13:37:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B03A6118D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 27 Jun 2023 13:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A774C433C8;
 Tue, 27 Jun 2023 13:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687873053;
 bh=YXh8A1CkJqeG0sibvoMoNKNWAgq0ZOjOuS6ByR4600Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SmSRKVmMI0QBWiTIxQymkWzE+Pi4yK3o+Vv3zZFYOJp1Rc0r/Bf4iSO7T315mEhFQ
 6Hcs3phCIYgFFoAQ8fiwl7RYBto2/S1aiIAC7Lmp3H3VggJ9t8JXJwy39Wqllt7uaP
 bPvwMUciy/dBl7LNcnLvZWC22ShEZbnXN4qI3mlkZA42ddyssucfgZJT7E8L5N5KZm
 wWEHnq3pqflZtF+PTVKh3I0sMW1NnQcJAl0wGQZGtyx9qPDLMUen3yVRCbLrM5MvIW
 YIcy8EgKQDti3ccBv5pRb1nzPJKT0+I2SqXqHTu7ByqBli9GDlOwDWDtyDPO0ZBAt/
 3416jhIYmdkMg==
Message-ID: <8a370c8e-3b5f-5ea7-5839-76896d1ec69e@kernel.org>
Date: Tue, 27 Jun 2023 21:37:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230613233940.3643362-1-jaegeuk@kernel.org>
 <e5788348-b547-8e10-21af-90544f3aa75c@kernel.org>
 <d0ec4a04-ab81-7e71-ad56-5b22e1815919@kernel.org>
 <ZJmOgRADvLP/4rMJ@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZJmOgRADvLP/4rMJ@google.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2023/6/26 21:11, Jaegeuk Kim wrote: > On 06/25, Chao Yu
    wrote: >> On 2023/6/25 15:26, Chao Yu wrote: >>> One concern below: >>> >>>
    Thread A:                    Thread B: >>> - f [...] 
 
 Content analysis details:   (-5.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qE8t1-0006k0-Fr
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove i_xattr_sem to avoid deadlock
 and fix the original issue
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy82LzI2IDIxOjExLCBKYWVnZXVrIEtpbSB3cm90ZToKPiBPbiAwNi8yNSwgQ2hhbyBZ
dSB3cm90ZToKPj4gT24gMjAyMy82LzI1IDE1OjI2LCBDaGFvIFl1IHdyb3RlOgo+Pj4gT25lIGNv
bmNlcm4gYmVsb3c6Cj4+Pgo+Pj4gVGhyZWFkIEE6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgVGhyZWFkIEI6Cj4+PiAtIGYyZnNfZ2V0eGF0dHIKPj4+ICAgwqAtIGxvb2t1
cF9hbGxfeGF0dHJzCj4+PiAgIMKgIC0gcmVhZF9pbmxpbmVfeGF0dHIKPj4+ICAgwqDCoCAtIGYy
ZnNfZ2V0X25vZGVfcGFnZShpbm8pCj4+PiAgIMKgwqAgLSBtZW1jcHkgaW5saW5lIHhhdHRyCj4+
PiAgIMKgwqAgLSBmMmZzX3B1dF9wYWdlCj4+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBmMmZzX3NldHhhdHRyCj4+PiAgIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIF9fZjJmc19zZXR4YXR0cgo+Pj4g
ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIF9f
ZjJmc19zZXR4YXR0cgo+Pj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC0gd3JpdGVfYWxsX3hhdHRycwo+Pj4gICDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSB3cml0ZSB4bm9kZSBhbmQg
aW5vZGUKPj4+ICAgwqAgLS0tPiBpbmxpbmUgeGF0dHIgbWF5IG91dCBvZiB1cGRhdGUgaGVyZS4K
Pj4+ICAgwqAgLSByZWFkX3hhdHRyX2Jsb2NrCj4+PiAgIMKgwqAgLSBmMmZzX2dldF9ub2RlX3Bh
Z2UoeG5pZCkKPj4+ICAgwqDCoCAtIG1lbWNweSB4bm9kZSB4YXR0cgo+Pj4gICDCoMKgIC0gZjJm
c19wdXRfcGFnZQo+Pj4KPj4+IERvIHdlIG5lZWQgdG8ga2VlcCB4YXR0cl97Z2V0LHNldH0gYmVp
bmcgYXRvbWljYWwgb3BlcmF0aW9uPwo+Pgo+PiBJdCBzZWVtcyB4ZnN0ZXN0IHN0YXJ0cyB0byBj
b21wbGFpbiB3LyBiZWxvdyBtZXNzYWdlLi4uCj4gCj4gSSBkb24ndCBzZWUgYW55IGZhaWx1cmUu
IFdoaWNoIHRlc3QgZG8geW91IHNlZT8KCjA1MSwgMDgzLCAuLi4gNDY3LCA2NDIKClRlc3RjYXNl
IGRvZXNuJ3QgZmFpbCwgYnV0IGtlcm5lbCBsb2cgc2hvd3MgaW5vZGUgaGFzIGNvcnJ1cHRlZCB4
YXR0ci4KCj4gCj4+Cj4+IFsgMzQwMC44NTY0NDNdIEYyRlMtZnMgKHZkYyk6IGlub2RlICgyMTg3
KSBoYXMgaW52YWxpZCBsYXN0IHhhdHRyIGVudHJ5LCBlbnRyeV9zaXplOiAyMTQ2OAo+PiBbIDM0
MDAuODY0MDQyXSBGMkZTLWZzICh2ZGMpOiBpbm9kZSAoMTU5NSkgaGFzIGludmFsaWQgbGFzdCB4
YXR0ciBlbnRyeSwgZW50cnlfc2l6ZTogMjY1ODAKPj4gWyAzNDAwLjg2NTc2NF0gRjJGUy1mcyAo
dmRjKTogaW5vZGUgKDIxODcpIGhhcyBpbnZhbGlkIGxhc3QgeGF0dHIgZW50cnksIGVudHJ5X3Np
emU6IDIxNDY4Cj4+IFsgMzQwMC44ODAwNjddIEYyRlMtZnMgKHZkYyk6IGlub2RlICg5ODM5KSBo
YXMgY29ycnVwdGVkIHhhdHRyCj4+IFsgMzQwMC44ODA3MTRdIEYyRlMtZnMgKHZkYyk6IGlub2Rl
ICgxMDg1NSkgaGFzIGNvcnJ1cHRlZCB4YXR0cgo+Pgo+PiBUaGFua3MsCj4+Cj4+Pgo+Pj4gVGhh
bmtzLAo+Pj4KPj4+Pgo+Pj4+IEkgdGhpbmsgd2UgZG9uJ3QgbmVlZCB0byB0cnVuY2F0ZSB4YXR0
ciBwYWdlcyBlYWdlcmx5IHdoaWNoIGludHJvZHVjZXMgbG90cyBvZgo+Pj4+IGRhdGEgcmFjZXMg
d2l0aG91dCBiaWcgYmVuZWZpdHMuCj4+Pj4KPj4+PiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmc+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4K
Pj4+PiAtLS0KPj4+PiAgwqAgZnMvZjJmcy9mMmZzLmjCoCB8wqAgMSAtCj4+Pj4gIMKgIGZzL2Yy
ZnMvc3VwZXIuYyB8wqAgMSAtCj4+Pj4gIMKgIGZzL2YyZnMveGF0dHIuYyB8IDMxICsrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+PiAgwqAgMyBmaWxlcyBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
ZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPj4+PiBpbmRleCAzZjViMTYxZGQ3NDMuLjdiOWFmMmQ1
MTY1NiAxMDA2NDQKPj4+PiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+Pj4+ICsrKyBiL2ZzL2YyZnMv
ZjJmcy5oCj4+Pj4gQEAgLTgzOCw3ICs4MzgsNiBAQCBzdHJ1Y3QgZjJmc19pbm9kZV9pbmZvIHsK
Pj4+PiAgwqDCoMKgwqDCoCAvKiBhdm9pZCByYWNpbmcgYmV0d2VlbiBmb3JlZ3JvdW5kIG9wIGFu
ZCBnYyAqLwo+Pj4+ICDCoMKgwqDCoMKgIHN0cnVjdCBmMmZzX3J3c2VtIGlfZ2NfcndzZW1bMl07
Cj4+Pj4gLcKgwqDCoCBzdHJ1Y3QgZjJmc19yd3NlbSBpX3hhdHRyX3NlbTsgLyogYXZvaWQgcmFj
aW5nIGJldHdlZW4gcmVhZGluZyBhbmQgY2hhbmdpbmcgRUFzICovCj4+Pj4gIMKgwqDCoMKgwqAg
aW50IGlfZXh0cmFfaXNpemU7wqDCoMKgwqDCoMKgwqAgLyogc2l6ZSBvZiBleHRyYSBzcGFjZSBs
b2NhdGVkIGluIGlfYWRkciAqLwo+Pj4+ICDCoMKgwqDCoMKgIGtwcm9qaWRfdCBpX3Byb2ppZDvC
oMKgwqDCoMKgwqDCoCAvKiBpZCBmb3IgcHJvamVjdCBxdW90YSAqLwo+Pj4+IGRpZmYgLS1naXQg
YS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPj4+PiBpbmRleCAxYjJjNzg4ZWQ4
MGQuLmM5MTdmYTc3MWYwZSAxMDA2NDQKPj4+PiAtLS0gYS9mcy9mMmZzL3N1cGVyLmMKPj4+PiAr
KysgYi9mcy9mMmZzL3N1cGVyLmMKPj4+PiBAQCAtMTQxOCw3ICsxNDE4LDYgQEAgc3RhdGljIHN0
cnVjdCBpbm9kZSAqZjJmc19hbGxvY19pbm9kZShzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiKQo+Pj4+
ICDCoMKgwqDCoMKgIElOSVRfTElTVF9IRUFEKCZmaS0+Z2RpcnR5X2xpc3QpOwo+Pj4+ICDCoMKg
wqDCoMKgIGluaXRfZjJmc19yd3NlbSgmZmktPmlfZ2NfcndzZW1bUkVBRF0pOwo+Pj4+ICDCoMKg
wqDCoMKgIGluaXRfZjJmc19yd3NlbSgmZmktPmlfZ2NfcndzZW1bV1JJVEVdKTsKPj4+PiAtwqDC
oMKgIGluaXRfZjJmc19yd3NlbSgmZmktPmlfeGF0dHJfc2VtKTsKPj4+PiAgwqDCoMKgwqDCoCAv
KiBXaWxsIGJlIHVzZWQgYnkgZGlyZWN0b3J5IG9ubHkgKi8KPj4+PiAgwqDCoMKgwqDCoCBmaS0+
aV9kaXJfbGV2ZWwgPSBGMkZTX1NCKHNiKS0+ZGlyX2xldmVsOwo+Pj4+IGRpZmYgLS1naXQgYS9m
cy9mMmZzL3hhdHRyLmMgYi9mcy9mMmZzL3hhdHRyLmMKPj4+PiBpbmRleCAyMTM4MDVkMzU5MmMu
LmJkYzhhNTUwODVhMiAxMDA2NDQKPj4+PiAtLS0gYS9mcy9mMmZzL3hhdHRyLmMKPj4+PiArKysg
Yi9mcy9mMmZzL3hhdHRyLmMKPj4+PiBAQCAtNDMzLDcgKzQzMyw3IEBAIHN0YXRpYyBpbmxpbmUg
aW50IHdyaXRlX2FsbF94YXR0cnMoc3RydWN0IGlub2RlICppbm9kZSwgX191MzIgaHNpemUsCj4+
Pj4gIMKgIHsKPj4+PiAgwqDCoMKgwqDCoCBzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkgPSBGMkZT
X0lfU0IoaW5vZGUpOwo+Pj4+ICDCoMKgwqDCoMKgIHNpemVfdCBpbmxpbmVfc2l6ZSA9IGlubGlu
ZV94YXR0cl9zaXplKGlub2RlKTsKPj4+PiAtwqDCoMKgIHN0cnVjdCBwYWdlICppbl9wYWdlID0g
TlVMTDsKPj4+PiArwqDCoMKgIHN0cnVjdCBwYWdlICppbl9wYWdlID0gaXBhZ2U7Cj4+Pj4gIMKg
wqDCoMKgwqAgdm9pZCAqeGF0dHJfYWRkcjsKPj4+PiAgwqDCoMKgwqDCoCB2b2lkICppbmxpbmVf
YWRkciA9IE5VTEw7Cj4+Pj4gIMKgwqDCoMKgwqAgc3RydWN0IHBhZ2UgKnhwYWdlOwo+Pj4+IEBA
IC00NDYsMjkgKzQ0NiwxOSBAQCBzdGF0aWMgaW5saW5lIGludCB3cml0ZV9hbGxfeGF0dHJzKHN0
cnVjdCBpbm9kZSAqaW5vZGUsIF9fdTMyIGhzaXplLAo+Pj4+ICDCoMKgwqDCoMKgIC8qIHdyaXRl
IHRvIGlubGluZSB4YXR0ciAqLwo+Pj4+ICDCoMKgwqDCoMKgIGlmIChpbmxpbmVfc2l6ZSkgewo+
Pj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoaXBhZ2UpIHsKPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpbmxpbmVfYWRkciA9IGlubGluZV94YXR0cl9hZGRyKGlub2RlLCBpcGFnZSk7Cj4+Pj4g
LcKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICghaW5fcGFn
ZSkgewo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbl9wYWdlID0gZjJmc19nZXRf
bm9kZV9wYWdlKHNiaSwgaW5vZGUtPmlfaW5vKTsKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKElTX0VSUihpbl9wYWdlKSkgewo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGYyZnNfYWxsb2NfbmlkX2ZhaWxlZChzYmksIG5ld19uaWQpOwo+Pj4+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBQVFJfRVJSKGluX3BhZ2Up
Owo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaW5saW5lX2FkZHIgPSBpbmxpbmVfeGF0dHJfYWRkcihpbm9kZSwgaW5fcGFnZSk7
Cj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlubGluZV9h
ZGRyID0gaW5saW5lX3hhdHRyX2FkZHIoaW5vZGUsIGluX3BhZ2UpOwo+Pj4+IC3CoMKgwqDCoMKg
wqDCoCBmMmZzX3dhaXRfb25fcGFnZV93cml0ZWJhY2soaXBhZ2UgPyBpcGFnZSA6IGluX3BhZ2Us
Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBOT0RFLCB0cnVlLCB0cnVlKTsKPj4+PiAtwqDCoMKgwqDCoMKgwqAgLyogbm8gbmVlZCB0
byB1c2UgeGF0dHIgbm9kZSBibG9jayAqLwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBmMmZzX3dhaXRf
b25fcGFnZV93cml0ZWJhY2soaW5fcGFnZSwgTk9ERSwgdHJ1ZSwgdHJ1ZSk7Cj4+Pj4gIMKgwqDC
oMKgwqDCoMKgwqDCoCBpZiAoaHNpemUgPD0gaW5saW5lX3NpemUpIHsKPj4+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBlcnIgPSBmMmZzX3RydW5jYXRlX3hhdHRyX25vZGUoaW5vZGUpOwo+Pj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfYWxsb2NfbmlkX2ZhaWxlZChzYmksIG5ld19u
aWQpOwo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChlcnIpIHsKPj4+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfcHV0X3BhZ2UoaW5fcGFnZSwgMSk7Cj4+Pj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZXJyOwo+Pj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIH0KPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWVtY3B5
KGlubGluZV9hZGRyLCB0eGF0dHJfYWRkciwgaW5saW5lX3NpemUpOwo+Pj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHNldF9wYWdlX2RpcnR5KGlwYWdlID8gaXBhZ2UgOiBpbl9wYWdlKTsKPj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZXRfcGFnZV9kaXJ0eShpbl9wYWdlKTsKPj4+PiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBpbl9wYWdlX291dDsKPj4+PiAgwqDCoMKg
wqDCoMKgwqDCoMKgIH0KPj4+PiAgwqDCoMKgwqDCoCB9Cj4+Pj4gQEAgLTUwMiwxMiArNDkyLDEz
IEBAIHN0YXRpYyBpbmxpbmUgaW50IHdyaXRlX2FsbF94YXR0cnMoc3RydWN0IGlub2RlICppbm9k
ZSwgX191MzIgaHNpemUsCj4+Pj4gIMKgwqDCoMKgwqAgbWVtY3B5KHhhdHRyX2FkZHIsIHR4YXR0
cl9hZGRyICsgaW5saW5lX3NpemUsIFZBTElEX1hBVFRSX0JMT0NLX1NJWkUpOwo+Pj4+ICDCoMKg
wqDCoMKgIGlmIChpbmxpbmVfc2l6ZSkKPj4+PiAtwqDCoMKgwqDCoMKgwqAgc2V0X3BhZ2VfZGly
dHkoaXBhZ2UgPyBpcGFnZSA6IGluX3BhZ2UpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzZXRfcGFn
ZV9kaXJ0eShpbl9wYWdlKTsKPj4+PiAgwqDCoMKgwqDCoCBzZXRfcGFnZV9kaXJ0eSh4cGFnZSk7
Cj4+Pj4gIMKgwqDCoMKgwqAgZjJmc19wdXRfcGFnZSh4cGFnZSwgMSk7Cj4+Pj4gIMKgIGluX3Bh
Z2Vfb3V0Ogo+Pj4+IC3CoMKgwqAgZjJmc19wdXRfcGFnZShpbl9wYWdlLCAxKTsKPj4+PiArwqDC
oMKgIGlmIChpbl9wYWdlICE9IGlwYWdlKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBmMmZzX3B1dF9w
YWdlKGluX3BhZ2UsIDEpOwo+Pj4+ICDCoMKgwqDCoMKgIHJldHVybiBlcnI7Cj4+Pj4gIMKgIH0K
Pj4+PiBAQCAtNTI4LDEwICs1MTksOCBAQCBpbnQgZjJmc19nZXR4YXR0cihzdHJ1Y3QgaW5vZGUg
Kmlub2RlLCBpbnQgaW5kZXgsIGNvbnN0IGNoYXIgKm5hbWUsCj4+Pj4gIMKgwqDCoMKgwqAgaWYg
KGxlbiA+IEYyRlNfTkFNRV9MRU4pCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVS
QU5HRTsKPj4+PiAtwqDCoMKgIGYyZnNfZG93bl9yZWFkKCZGMkZTX0koaW5vZGUpLT5pX3hhdHRy
X3NlbSk7Cj4+Pj4gIMKgwqDCoMKgwqAgZXJyb3IgPSBsb29rdXBfYWxsX3hhdHRycyhpbm9kZSwg
aXBhZ2UsIGluZGV4LCBsZW4sIG5hbWUsCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgJmVudHJ5LCAmYmFzZV9hZGRyLCAmYmFzZV9zaXplLCAmaXNfaW5saW5lKTsKPj4+
PiAtwqDCoMKgIGYyZnNfdXBfcmVhZCgmRjJGU19JKGlub2RlKS0+aV94YXR0cl9zZW0pOwo+Pj4+
ICDCoMKgwqDCoMKgIGlmIChlcnJvcikKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBl
cnJvcjsKPj4+PiBAQCAtNTY1LDkgKzU1NCw3IEBAIHNzaXplX3QgZjJmc19saXN0eGF0dHIoc3Ry
dWN0IGRlbnRyeSAqZGVudHJ5LCBjaGFyICpidWZmZXIsIHNpemVfdCBidWZmZXJfc2l6ZSkKPj4+
PiAgwqDCoMKgwqDCoCBpbnQgZXJyb3I7Cj4+Pj4gIMKgwqDCoMKgwqAgc2l6ZV90IHJlc3QgPSBi
dWZmZXJfc2l6ZTsKPj4+PiAtwqDCoMKgIGYyZnNfZG93bl9yZWFkKCZGMkZTX0koaW5vZGUpLT5p
X3hhdHRyX3NlbSk7Cj4+Pj4gIMKgwqDCoMKgwqAgZXJyb3IgPSByZWFkX2FsbF94YXR0cnMoaW5v
ZGUsIE5VTEwsICZiYXNlX2FkZHIpOwo+Pj4+IC3CoMKgwqAgZjJmc191cF9yZWFkKCZGMkZTX0ko
aW5vZGUpLT5pX3hhdHRyX3NlbSk7Cj4+Pj4gIMKgwqDCoMKgwqAgaWYgKGVycm9yKQo+Pj4+ICDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGVycm9yOwo+Pj4+IEBAIC03OTQsOSArNzgxLDcgQEAg
aW50IGYyZnNfc2V0eGF0dHIoc3RydWN0IGlub2RlICppbm9kZSwgaW50IGluZGV4LCBjb25zdCBj
aGFyICpuYW1lLAo+Pj4+ICDCoMKgwqDCoMKgIGYyZnNfYmFsYW5jZV9mcyhzYmksIHRydWUpOwo+
Pj4+ICDCoMKgwqDCoMKgIGYyZnNfbG9ja19vcChzYmkpOwo+Pj4+IC3CoMKgwqAgZjJmc19kb3du
X3dyaXRlKCZGMkZTX0koaW5vZGUpLT5pX3hhdHRyX3NlbSk7Cj4+Pj4gIMKgwqDCoMKgwqAgZXJy
ID0gX19mMmZzX3NldHhhdHRyKGlub2RlLCBpbmRleCwgbmFtZSwgdmFsdWUsIHNpemUsIGlwYWdl
LCBmbGFncyk7Cj4+Pj4gLcKgwqDCoCBmMmZzX3VwX3dyaXRlKCZGMkZTX0koaW5vZGUpLT5pX3hh
dHRyX3NlbSk7Cj4+Pj4gIMKgwqDCoMKgwqAgZjJmc191bmxvY2tfb3Aoc2JpKTsKPj4+PiAgwqDC
oMKgwqDCoCBmMmZzX3VwZGF0ZV90aW1lKHNiaSwgUkVRX1RJTUUpOwo+Pj4KPj4+Cj4+PiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4gTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cj4+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
