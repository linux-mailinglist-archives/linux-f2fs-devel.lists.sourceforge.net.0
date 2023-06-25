Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5946573D018
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Jun 2023 12:27:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qDMyH-0007JV-RI;
	Sun, 25 Jun 2023 10:27:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qDMyF-0007JK-Tu
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Jun 2023 10:27:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QlFDcrwRepIDIdc6o0WEYJZNJMR6D2SMQGrs1b1XhqY=; b=GjaG/Uy8grqkO6OGwAqCzGafOH
 dxyWsVWvQRH8Xkt+YJ/chXUt5OniqAUpcT4jOP9dEkVM9lwskQ51wYTfLuPm/VWzd5uPLTEl9K+yq
 vsBMjAhTjOOC/k2CSgY8BjlNVvszdQTq1JhPHragi8WqjqawziFzTzu+CiMYKi9iudI8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QlFDcrwRepIDIdc6o0WEYJZNJMR6D2SMQGrs1b1XhqY=; b=P9SsnFvH9VJ/9zJvV/K6KI4HmL
 cYeDt1MabjvNODbdhtGNucVBMTbvFyG/fAR4mlZ9c2hCtOVctdP356rbbX76gFEow9IS4r0LK634z
 KxfFfRTilSkvGCMTgrFIVSr+mjXhLpEGMqzssO8VEofE7VGYGCjP48TndNVlBGBY6K3o=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qDMyD-0002LR-MW for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Jun 2023 10:27:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2972A60B6A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 25 Jun 2023 10:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 864A2C433C0;
 Sun, 25 Jun 2023 10:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687688863;
 bh=zNDv0rJ1JFrpa40hA5kU8PjgiXyqQg1Bdpc7cE33+ac=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=doyFu9VMBsbOGEH7Fb1qBuAtd0cB/uvUYFk3t/YR2/CfMA74Cbx6/kJVbnJvo4i5c
 +SfTGigasBvSHbiR8jOfxKcc6UqzpOuuVTxB8qcx7acUqbmDkVSbQWwTnlQUoXtO6/
 VMgT7aiK6sKBevHZWT7g3eAgLa8iOwR1aXN1eV1MpxIVv10VtJiw1rZnaRu1Xmug2m
 WP6HQZU59MNf0feR96Pe3gE6BzTFap1NjkG+Wh/nPOvrkJy5Jk1qenE6F4sA0851d7
 3+L9qaCV65ILKrhWRvliAPmzqFgsdaigcTHitlgvjlBEmo5aXGSU76jnQEYfCm0cyi
 MzkF0r4OMXvAQ==
Message-ID: <d0ec4a04-ab81-7e71-ad56-5b22e1815919@kernel.org>
Date: Sun, 25 Jun 2023 18:27:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20230613233940.3643362-1-jaegeuk@kernel.org>
 <e5788348-b547-8e10-21af-90544f3aa75c@kernel.org>
In-Reply-To: <e5788348-b547-8e10-21af-90544f3aa75c@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2023/6/25 15:26, Chao Yu wrote: > One concern below: >
   > Thread A:                    Thread B: > - f2fs_getxattr
    >  - lookup_all_xattrs >   - read_inline_xattr >    - f2fs_g [...] 
 
 Content analysis details:   (-7.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qDMyD-0002LR-MW
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
Cc: stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy82LzI1IDE1OjI2LCBDaGFvIFl1IHdyb3RlOgo+IE9uZSBjb25jZXJuIGJlbG93Ogo+
IAo+IFRocmVhZCBBOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRocmVh
ZCBCOgo+IC0gZjJmc19nZXR4YXR0cgo+ICDCoC0gbG9va3VwX2FsbF94YXR0cnMKPiAgwqAgLSBy
ZWFkX2lubGluZV94YXR0cgo+ICDCoMKgIC0gZjJmc19nZXRfbm9kZV9wYWdlKGlubykKPiAgwqDC
oCAtIG1lbWNweSBpbmxpbmUgeGF0dHIKPiAgwqDCoCAtIGYyZnNfcHV0X3BhZ2UKPiAgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGYyZnNfc2V0eGF0dHIK
PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gX19m
MmZzX3NldHhhdHRyCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC0gX19mMmZzX3NldHhhdHRyCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSB3cml0ZV9hbGxfeGF0dHJzCj4gIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIHdyaXRlIHhu
b2RlIGFuZCBpbm9kZQo+ICDCoCAtLS0+IGlubGluZSB4YXR0ciBtYXkgb3V0IG9mIHVwZGF0ZSBo
ZXJlLgo+ICDCoCAtIHJlYWRfeGF0dHJfYmxvY2sKPiAgwqDCoCAtIGYyZnNfZ2V0X25vZGVfcGFn
ZSh4bmlkKQo+ICDCoMKgIC0gbWVtY3B5IHhub2RlIHhhdHRyCj4gIMKgwqAgLSBmMmZzX3B1dF9w
YWdlCj4gCj4gRG8gd2UgbmVlZCB0byBrZWVwIHhhdHRyX3tnZXQsc2V0fSBiZWluZyBhdG9taWNh
bCBvcGVyYXRpb24/CgpJdCBzZWVtcyB4ZnN0ZXN0IHN0YXJ0cyB0byBjb21wbGFpbiB3LyBiZWxv
dyBtZXNzYWdlLi4uCgpbIDM0MDAuODU2NDQzXSBGMkZTLWZzICh2ZGMpOiBpbm9kZSAoMjE4Nykg
aGFzIGludmFsaWQgbGFzdCB4YXR0ciBlbnRyeSwgZW50cnlfc2l6ZTogMjE0NjgKWyAzNDAwLjg2
NDA0Ml0gRjJGUy1mcyAodmRjKTogaW5vZGUgKDE1OTUpIGhhcyBpbnZhbGlkIGxhc3QgeGF0dHIg
ZW50cnksIGVudHJ5X3NpemU6IDI2NTgwClsgMzQwMC44NjU3NjRdIEYyRlMtZnMgKHZkYyk6IGlu
b2RlICgyMTg3KSBoYXMgaW52YWxpZCBsYXN0IHhhdHRyIGVudHJ5LCBlbnRyeV9zaXplOiAyMTQ2
OApbIDM0MDAuODgwMDY3XSBGMkZTLWZzICh2ZGMpOiBpbm9kZSAoOTgzOSkgaGFzIGNvcnJ1cHRl
ZCB4YXR0cgpbIDM0MDAuODgwNzE0XSBGMkZTLWZzICh2ZGMpOiBpbm9kZSAoMTA4NTUpIGhhcyBj
b3JydXB0ZWQgeGF0dHIKClRoYW5rcywKCj4gCj4gVGhhbmtzLAo+IAo+Pgo+PiBJIHRoaW5rIHdl
IGRvbid0IG5lZWQgdG8gdHJ1bmNhdGUgeGF0dHIgcGFnZXMgZWFnZXJseSB3aGljaCBpbnRyb2R1
Y2VzIGxvdHMgb2YKPj4gZGF0YSByYWNlcyB3aXRob3V0IGJpZyBiZW5lZml0cy4KPj4KPj4gQ2M6
IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+PiBTaWduZWQtb2ZmLWJ5OiBKYWVnZXVrIEtpbSA8
amFlZ2V1a0BrZXJuZWwub3JnPgo+PiAtLS0KPj4gwqAgZnMvZjJmcy9mMmZzLmjCoCB8wqAgMSAt
Cj4+IMKgIGZzL2YyZnMvc3VwZXIuYyB8wqAgMSAtCj4+IMKgIGZzL2YyZnMveGF0dHIuYyB8IDMx
ICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gwqAgMyBmaWxlcyBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+PiBpbmRleCAzZjViMTYxZGQ3NDMuLjdiOWFmMmQ1
MTY1NiAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPj4gKysrIGIvZnMvZjJmcy9mMmZz
LmgKPj4gQEAgLTgzOCw3ICs4MzgsNiBAQCBzdHJ1Y3QgZjJmc19pbm9kZV9pbmZvIHsKPj4gwqDC
oMKgwqDCoCAvKiBhdm9pZCByYWNpbmcgYmV0d2VlbiBmb3JlZ3JvdW5kIG9wIGFuZCBnYyAqLwo+
PiDCoMKgwqDCoMKgIHN0cnVjdCBmMmZzX3J3c2VtIGlfZ2NfcndzZW1bMl07Cj4+IC3CoMKgwqAg
c3RydWN0IGYyZnNfcndzZW0gaV94YXR0cl9zZW07IC8qIGF2b2lkIHJhY2luZyBiZXR3ZWVuIHJl
YWRpbmcgYW5kIGNoYW5naW5nIEVBcyAqLwo+PiDCoMKgwqDCoMKgIGludCBpX2V4dHJhX2lzaXpl
O8KgwqDCoMKgwqDCoMKgIC8qIHNpemUgb2YgZXh0cmEgc3BhY2UgbG9jYXRlZCBpbiBpX2FkZHIg
Ki8KPj4gwqDCoMKgwqDCoCBrcHJvamlkX3QgaV9wcm9qaWQ7wqDCoMKgwqDCoMKgwqAgLyogaWQg
Zm9yIHByb2plY3QgcXVvdGEgKi8KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3VwZXIuYyBiL2Zz
L2YyZnMvc3VwZXIuYwo+PiBpbmRleCAxYjJjNzg4ZWQ4MGQuLmM5MTdmYTc3MWYwZSAxMDA2NDQK
Pj4gLS0tIGEvZnMvZjJmcy9zdXBlci5jCj4+ICsrKyBiL2ZzL2YyZnMvc3VwZXIuYwo+PiBAQCAt
MTQxOCw3ICsxNDE4LDYgQEAgc3RhdGljIHN0cnVjdCBpbm9kZSAqZjJmc19hbGxvY19pbm9kZShz
dHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiKQo+PiDCoMKgwqDCoMKgIElOSVRfTElTVF9IRUFEKCZmaS0+
Z2RpcnR5X2xpc3QpOwo+PiDCoMKgwqDCoMKgIGluaXRfZjJmc19yd3NlbSgmZmktPmlfZ2Nfcndz
ZW1bUkVBRF0pOwo+PiDCoMKgwqDCoMKgIGluaXRfZjJmc19yd3NlbSgmZmktPmlfZ2NfcndzZW1b
V1JJVEVdKTsKPj4gLcKgwqDCoCBpbml0X2YyZnNfcndzZW0oJmZpLT5pX3hhdHRyX3NlbSk7Cj4+
IMKgwqDCoMKgwqAgLyogV2lsbCBiZSB1c2VkIGJ5IGRpcmVjdG9yeSBvbmx5ICovCj4+IMKgwqDC
oMKgwqAgZmktPmlfZGlyX2xldmVsID0gRjJGU19TQihzYiktPmRpcl9sZXZlbDsKPj4gZGlmZiAt
LWdpdCBhL2ZzL2YyZnMveGF0dHIuYyBiL2ZzL2YyZnMveGF0dHIuYwo+PiBpbmRleCAyMTM4MDVk
MzU5MmMuLmJkYzhhNTUwODVhMiAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy94YXR0ci5jCj4+ICsr
KyBiL2ZzL2YyZnMveGF0dHIuYwo+PiBAQCAtNDMzLDcgKzQzMyw3IEBAIHN0YXRpYyBpbmxpbmUg
aW50IHdyaXRlX2FsbF94YXR0cnMoc3RydWN0IGlub2RlICppbm9kZSwgX191MzIgaHNpemUsCj4+
IMKgIHsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkgPSBGMkZTX0lfU0Io
aW5vZGUpOwo+PiDCoMKgwqDCoMKgIHNpemVfdCBpbmxpbmVfc2l6ZSA9IGlubGluZV94YXR0cl9z
aXplKGlub2RlKTsKPj4gLcKgwqDCoCBzdHJ1Y3QgcGFnZSAqaW5fcGFnZSA9IE5VTEw7Cj4+ICvC
oMKgwqAgc3RydWN0IHBhZ2UgKmluX3BhZ2UgPSBpcGFnZTsKPj4gwqDCoMKgwqDCoCB2b2lkICp4
YXR0cl9hZGRyOwo+PiDCoMKgwqDCoMKgIHZvaWQgKmlubGluZV9hZGRyID0gTlVMTDsKPj4gwqDC
oMKgwqDCoCBzdHJ1Y3QgcGFnZSAqeHBhZ2U7Cj4+IEBAIC00NDYsMjkgKzQ0NiwxOSBAQCBzdGF0
aWMgaW5saW5lIGludCB3cml0ZV9hbGxfeGF0dHJzKHN0cnVjdCBpbm9kZSAqaW5vZGUsIF9fdTMy
IGhzaXplLAo+PiDCoMKgwqDCoMKgIC8qIHdyaXRlIHRvIGlubGluZSB4YXR0ciAqLwo+PiDCoMKg
wqDCoMKgIGlmIChpbmxpbmVfc2l6ZSkgewo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKGlwYWdlKSB7
Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlubGluZV9hZGRyID0gaW5saW5lX3hhdHRyX2Fk
ZHIoaW5vZGUsIGlwYWdlKTsKPj4gLcKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4+ICvCoMKgwqDC
oMKgwqDCoCBpZiAoIWluX3BhZ2UpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW5f
cGFnZSA9IGYyZnNfZ2V0X25vZGVfcGFnZShzYmksIGlub2RlLT5pX2lubyk7Cj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmIChJU19FUlIoaW5fcGFnZSkpIHsKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX2FsbG9jX25pZF9mYWlsZWQoc2JpLCBuZXdfbmlk
KTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihp
bl9wYWdlKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpbmxpbmVfYWRkciA9IGlubGluZV94YXR0cl9hZGRyKGlub2RlLCBpbl9wYWdl
KTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gK8KgwqDCoMKgwqDCoMKgIGlubGluZV9hZGRy
ID0gaW5saW5lX3hhdHRyX2FkZHIoaW5vZGUsIGluX3BhZ2UpOwo+PiAtwqDCoMKgwqDCoMKgwqAg
ZjJmc193YWl0X29uX3BhZ2Vfd3JpdGViYWNrKGlwYWdlID8gaXBhZ2UgOiBpbl9wYWdlLAo+PiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5P
REUsIHRydWUsIHRydWUpOwo+PiAtwqDCoMKgwqDCoMKgwqAgLyogbm8gbmVlZCB0byB1c2UgeGF0
dHIgbm9kZSBibG9jayAqLwo+PiArwqDCoMKgwqDCoMKgwqAgZjJmc193YWl0X29uX3BhZ2Vfd3Jp
dGViYWNrKGluX3BhZ2UsIE5PREUsIHRydWUsIHRydWUpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
aWYgKGhzaXplIDw9IGlubGluZV9zaXplKSB7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVy
ciA9IGYyZnNfdHJ1bmNhdGVfeGF0dHJfbm9kZShpbm9kZSk7Cj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGYyZnNfYWxsb2NfbmlkX2ZhaWxlZChzYmksIG5ld19uaWQpOwo+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBpZiAoZXJyKSB7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZjJmc19wdXRfcGFnZShpbl9wYWdlLCAxKTsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gZXJyOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1lbWNweShpbmxpbmVfYWRkciwgdHhhdHRyX2FkZHIsIGlu
bGluZV9zaXplKTsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2V0X3BhZ2VfZGlydHkoaXBh
Z2UgPyBpcGFnZSA6IGluX3BhZ2UpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZXRfcGFn
ZV9kaXJ0eShpbl9wYWdlKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBpbl9w
YWdlX291dDsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDCoCB9Cj4+IEBAIC01
MDIsMTIgKzQ5MiwxMyBAQCBzdGF0aWMgaW5saW5lIGludCB3cml0ZV9hbGxfeGF0dHJzKHN0cnVj
dCBpbm9kZSAqaW5vZGUsIF9fdTMyIGhzaXplLAo+PiDCoMKgwqDCoMKgIG1lbWNweSh4YXR0cl9h
ZGRyLCB0eGF0dHJfYWRkciArIGlubGluZV9zaXplLCBWQUxJRF9YQVRUUl9CTE9DS19TSVpFKTsK
Pj4gwqDCoMKgwqDCoCBpZiAoaW5saW5lX3NpemUpCj4+IC3CoMKgwqDCoMKgwqDCoCBzZXRfcGFn
ZV9kaXJ0eShpcGFnZSA/IGlwYWdlIDogaW5fcGFnZSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBzZXRf
cGFnZV9kaXJ0eShpbl9wYWdlKTsKPj4gwqDCoMKgwqDCoCBzZXRfcGFnZV9kaXJ0eSh4cGFnZSk7
Cj4+IMKgwqDCoMKgwqAgZjJmc19wdXRfcGFnZSh4cGFnZSwgMSk7Cj4+IMKgIGluX3BhZ2Vfb3V0
Ogo+PiAtwqDCoMKgIGYyZnNfcHV0X3BhZ2UoaW5fcGFnZSwgMSk7Cj4+ICvCoMKgwqAgaWYgKGlu
X3BhZ2UgIT0gaXBhZ2UpCj4+ICvCoMKgwqDCoMKgwqDCoCBmMmZzX3B1dF9wYWdlKGluX3BhZ2Us
IDEpOwo+PiDCoMKgwqDCoMKgIHJldHVybiBlcnI7Cj4+IMKgIH0KPj4gQEAgLTUyOCwxMCArNTE5
LDggQEAgaW50IGYyZnNfZ2V0eGF0dHIoc3RydWN0IGlub2RlICppbm9kZSwgaW50IGluZGV4LCBj
b25zdCBjaGFyICpuYW1lLAo+PiDCoMKgwqDCoMKgIGlmIChsZW4gPiBGMkZTX05BTUVfTEVOKQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FUkFOR0U7Cj4+IC3CoMKgwqAgZjJmc19kb3du
X3JlYWQoJkYyRlNfSShpbm9kZSktPmlfeGF0dHJfc2VtKTsKPj4gwqDCoMKgwqDCoCBlcnJvciA9
IGxvb2t1cF9hbGxfeGF0dHJzKGlub2RlLCBpcGFnZSwgaW5kZXgsIGxlbiwgbmFtZSwKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmZW50cnksICZiYXNlX2FkZHIsICZiYXNl
X3NpemUsICZpc19pbmxpbmUpOwo+PiAtwqDCoMKgIGYyZnNfdXBfcmVhZCgmRjJGU19JKGlub2Rl
KS0+aV94YXR0cl9zZW0pOwo+PiDCoMKgwqDCoMKgIGlmIChlcnJvcikKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiBlcnJvcjsKPj4gQEAgLTU2NSw5ICs1NTQsNyBAQCBzc2l6ZV90IGYyZnNf
bGlzdHhhdHRyKHN0cnVjdCBkZW50cnkgKmRlbnRyeSwgY2hhciAqYnVmZmVyLCBzaXplX3QgYnVm
ZmVyX3NpemUpCj4+IMKgwqDCoMKgwqAgaW50IGVycm9yOwo+PiDCoMKgwqDCoMKgIHNpemVfdCBy
ZXN0ID0gYnVmZmVyX3NpemU7Cj4+IC3CoMKgwqAgZjJmc19kb3duX3JlYWQoJkYyRlNfSShpbm9k
ZSktPmlfeGF0dHJfc2VtKTsKPj4gwqDCoMKgwqDCoCBlcnJvciA9IHJlYWRfYWxsX3hhdHRycyhp
bm9kZSwgTlVMTCwgJmJhc2VfYWRkcik7Cj4+IC3CoMKgwqAgZjJmc191cF9yZWFkKCZGMkZTX0ko
aW5vZGUpLT5pX3hhdHRyX3NlbSk7Cj4+IMKgwqDCoMKgwqAgaWYgKGVycm9yKQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIGVycm9yOwo+PiBAQCAtNzk0LDkgKzc4MSw3IEBAIGludCBmMmZz
X3NldHhhdHRyKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGludCBpbmRleCwgY29uc3QgY2hhciAqbmFt
ZSwKPj4gwqDCoMKgwqDCoCBmMmZzX2JhbGFuY2VfZnMoc2JpLCB0cnVlKTsKPj4gwqDCoMKgwqDC
oCBmMmZzX2xvY2tfb3Aoc2JpKTsKPj4gLcKgwqDCoCBmMmZzX2Rvd25fd3JpdGUoJkYyRlNfSShp
bm9kZSktPmlfeGF0dHJfc2VtKTsKPj4gwqDCoMKgwqDCoCBlcnIgPSBfX2YyZnNfc2V0eGF0dHIo
aW5vZGUsIGluZGV4LCBuYW1lLCB2YWx1ZSwgc2l6ZSwgaXBhZ2UsIGZsYWdzKTsKPj4gLcKgwqDC
oCBmMmZzX3VwX3dyaXRlKCZGMkZTX0koaW5vZGUpLT5pX3hhdHRyX3NlbSk7Cj4+IMKgwqDCoMKg
wqAgZjJmc191bmxvY2tfb3Aoc2JpKTsKPj4gwqDCoMKgwqDCoCBmMmZzX3VwZGF0ZV90aW1lKHNi
aSwgUkVRX1RJTUUpOwo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
