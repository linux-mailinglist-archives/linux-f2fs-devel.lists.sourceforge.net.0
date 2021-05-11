Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D81C37A57D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 May 2021 13:11:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgQIF-00086t-RG; Tue, 11 May 2021 11:11:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <changfengnan@vivo.com>) id 1lgQIC-00086h-PM
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 11:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:In-Reply-To:References:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=keGaAvJuGa0chGSkADiADQHRPFFZ8eaTTPZHDLMg69M=; b=YzSbpYvRrYewUTRbmZE9J57kq4
 KEIZ2+Ig+fQO0YPxV6S65CvWNLMilXQD04b0ugHezqopFwDC4NUs95cad8ZeeMn5X9UNxPLjgUWsP
 DKGbZUAwZ/EKM1Rtx+aA73p8FAPxt3RpgJa96GUdwD3+m+MtakC11RKU18kdZEJOnFFU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:In-Reply-To:References:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=keGaAvJuGa0chGSkADiADQHRPFFZ8eaTTPZHDLMg69M=; b=UuVpHSNVGQZY5pusgv0rpJL6Tn
 V4rr430Nvt21Qx79AMaXcoP5VfCdw7gsBPtW6v5/bq7OZ1hielFRPTh5Vj/jpNc9VLzwZsqi5+fWd
 0M/UffhbzWdk0yOLhtaHCkH2oz+tqdxl8PJ1KsGEtcS3YwaP8h0lrvu1V1BjXFSdS70M=;
Received: from mail-m17657.qiye.163.com ([59.111.176.57])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lgQI6-003jGH-5f
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 11:11:13 +0000
Received: from SZ11126892 (unknown [58.251.74.232])
 by mail-m17657.qiye.163.com (Hmail) with ESMTPA id D81702800E3;
 Tue, 11 May 2021 19:10:57 +0800 (CST)
From: <changfengnan@vivo.com>
To: "'Jaegeuk Kim'" <jaegeuk@kernel.org>
References: <20210507094455.1695-1-changfengnan@vivo.com>
 <YJlUpHJLONlORWWl@google.com>
In-Reply-To: <YJlUpHJLONlORWWl@google.com>
Date: Tue, 11 May 2021 19:10:57 +0800
Message-ID: <000b01d74656$518e96f0$f4abc4d0$@vivo.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQHMWO6DzzIYy5cyNAl5YIMHDd6ZwQHXl5KvquU7QLA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQhlCQ1ZKGEpMSEpLS04dQkxVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 9ISFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OSo6HCo6PT8UCTwDLTBJPQoJ
 D04KCypVSlVKTUlLTEhKT05DSUJLVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOSlVMT1VJSElZV1kIAVlBSE1OTzcG
X-HM-Tid: 0a795b1f71c2da03kuwsd81702800e3
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.0 PDS_BAD_THREAD_QP_64   Bad thread header - short QP
X-Headers-End: 1lgQI6-003jGH-5f
Subject: [f2fs-dev] =?gb2312?b?tPC4tDogW1BBVENIIHY0XSBmMmZzOiBjb21wcmVz?=
	=?gb2312?b?czogYXZvaWQgdW5uZWNlc3NhcnkgY2hlY2sgaW4gZjJmc19wcmVw?=
	=?gb2312?b?YXJlX2NvbXByZXNzX292ZXJ3cml0ZQ==?=
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgSmFlZ2V1azoKCklmIHRoZXJlJ3JlIGV4aXN0aW5nIGNsdXN0ZXJzIGJleW9uZCBpX3NpemUs
IG1heSBjYXVzZSBkYXRhIGNvcnJ1cHRpb24sIGJ1dAp3aWxsIHRoaXMgaGFwcGVuIGluIG5vcm1h
bD8gbWF5YmUgc29tZSBlcnJvciBjYW4gY2F1c2UgdGhpcywgaWYgaV9zaXplIGlzCmVycm9yIHRo
ZSBkYXRhIGJleW9uZCBzaXplIHN0aWxsIGNhbid0IGhhbmRsZSBwcm9wZXJseS4gIElzIHRoZXJl
IG5vcm1hbApjYXNlIGNhbiBjYXN1ZSBleGlzdGluZyBjbHVzdGVycyBiZXlvbmQgaV9zaXplPwoK
VGhhbmtzLgoKLS0tLS3Tyrz+1K28/i0tLS0tCreivP7IyzogSmFlZ2V1ayBLaW0gPGphZWdldWtA
a2VybmVsLm9yZz4gCreiy83KsbzkOiAyMDIxxOo11MIxMMjVIDIzOjQ0CsrVvP7IyzogRmVuZ25h
biBDaGFuZyA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPgqzrcvNOiBjaGFvQGtlcm5lbC5vcmc7IGxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Ctb3zOI6IFJlOiBbUEFUQ0ggdjRd
IGYyZnM6IGNvbXByZXNzOiBhdm9pZCB1bm5lY2Vzc2FyeSBjaGVjayBpbgpmMmZzX3ByZXBhcmVf
Y29tcHJlc3Nfb3ZlcndyaXRlCgpPbiAwNS8wNywgRmVuZ25hbiBDaGFuZyB3cm90ZToKPiB3aGVu
IHdyaXRlIGNvbXByZXNzZWQgZmlsZSB3aXRoIE9fVFJVTkMsIHRoZXJlIHdpbGwgYmUgYSBsb3Qg
b2YgCj4gdW5uZWNlc3NhcnkgY2hlY2sgdmFsaWQgYmxvY2tzIGluIGYyZnNfcHJlcGFyZV9jb21w
cmVzc19vdmVyd3JpdGUsIAo+IGVzcGVjaWFsbHkgd2hlbiB3cml0dGVuIGluIHBhZ2Ugc2l6ZSwg
cmVtb3ZlIGl0Lgo+IAo+IFRoaXMgcGF0Y2ggd2lsbCBub3QgYnJpbmcgc2lnbmlmaWNhbnQgcGVy
Zm9ybWFuY2UgaW1wcm92ZW1lbnRzLCBJIHRlc3QgCj4gdGhpcyBvbiBtb2JpbGUgcGhvbmUsIHVz
ZSBhbmRyb2JlbmNoLCB0aGUgc2VxdWVudGlhbCB3cml0ZSB0ZXN0IGNhc2UgCj4gd2FzIG9wZW4g
ZmlsZSB3aXRoIE9fVFJVTkMsIHNldCB3cml0ZSBzaXplIHRvIDRLQiwgIHBlcmZvcm1hbmNlIAo+
IGltcHJvdmVkIGFib3V0IDIlLTMlLiBJZiB3cml0ZSBzaXplIHNldCB0byAzMk1CLCBwZXJmb3Jt
YW5jZSBpbXByb3ZlZAphYm91dCAwLjUlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZlbmduYW4gQ2hh
bmcgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT4KPiAtLS0KPiAgZnMvZjJmcy9kYXRhLmMgfCA4ICsr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYyBpbmRleCAKPiBjZjkzNTQ3NGZmYmEu
LmI5ZWM3YjE4MmY0NSAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+ICsrKyBiL2ZzL2Yy
ZnMvZGF0YS5jCj4gQEAgLTMzMDMsOSArMzMwMywxNyBAQCBzdGF0aWMgaW50IGYyZnNfd3JpdGVf
YmVnaW4oc3RydWN0IGZpbGUgKmZpbGUsIAo+IHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5n
LCAgI2lmZGVmIENPTkZJR19GMkZTX0ZTX0NPTVBSRVNTSU9OCj4gIAlpZiAoZjJmc19jb21wcmVz
c2VkX2ZpbGUoaW5vZGUpKSB7Cj4gIAkJaW50IHJldDsKPiArCQlwZ29mZl90IGVuZCA9IChpX3Np
emVfcmVhZChpbm9kZSkgKyBQQUdFX1NJWkUgLSAxKSA+PgpQQUdFX1NISUZUOwo+IAo+ICAJCSpm
c2RhdGEgPSBOVUxMOwo+IAo+ICsJCS8qCj4gKwkJICogd2hlbiB3cml0ZSBwb3MgaXMgYmlnZ2Vy
IHRoYW4gaW5vZGUgc2l6ZQosZjJmc19wcmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZQo+ICsJCSAq
IGFsd2F5cyByZXR1cm4gMCwgc28gY2hlY2sgcG9zIGZpcnN0IHRvIGF2b2lkIHRoaXMuCj4gKwkJ
ICovCj4gKwkJaWYgKGluZGV4ID49IGVuZCkKPiArCQkJZ290byByZXBlYXQ7CgpXaGF0IGlmIHRo
ZXJlJ3JlIGV4aXN0aW5nIGNsdXN0ZXJzIGJleW9uZCBpX3NpemU/IEdpdmVuIHBlcmZvcm1hbmNl
IGltcGFjdHMsCmRvIHdlIHJlYWxseSBuZWVkIHRoaXM/Cgo+ICsKPiAgCQlyZXQgPSBmMmZzX3By
ZXBhcmVfY29tcHJlc3Nfb3ZlcndyaXRlKGlub2RlLCBwYWdlcCwKPiAgCQkJCQkJCWluZGV4LCBm
c2RhdGEpOwo+ICAJCWlmIChyZXQgPCAwKSB7Cj4gLS0KPiAyLjI5LjAKCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
