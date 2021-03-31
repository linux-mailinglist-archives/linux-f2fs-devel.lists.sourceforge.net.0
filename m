Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC6A34FC97
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Mar 2021 11:23:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lRX4A-00028A-GL; Wed, 31 Mar 2021 09:23:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <zhuangyi1@huawei.com>) id 1lRX48-000282-An
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Mar 2021 09:23:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FtDgiyryJ+7n2V+ufE3P2Dswvrr2No3lgUPBBtDkVJc=; b=L7Va3XKrmm2yYXiXMsvPwMvPN9
 319kOB2zKsC/YuAv30rkK9nWtv9LNZTxINvearX+41969yP/P5QYSclgSuvIYnGQ17Wh8qalVqM27
 xERaC9wrvgmNEzohM+F74iLJsJwlUXrEkiMDb088IBMdfklmXp/UsDxWnaJZGRFeFtnM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FtDgiyryJ+7n2V+ufE3P2Dswvrr2No3lgUPBBtDkVJc=; b=L
 RFfLaKvOMlPuzrsxqRTMWnEwOlp8pWHuFmOpAEgKvcvHJVUF7aN2H68wfPqm4x8xEgtQMRhwhjy0E
 JXG+exB3gurFXqibfyzCKiybH++CFVx5G08SsnZvakRRdKL09Gm56v6m7qtDN5yobA6jYNfILA9op
 VI/JIOpEWmRklN0Y=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lRX42-0005dG-Ix
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Mar 2021 09:23:08 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F9LPq3NcxznWdW;
 Wed, 31 Mar 2021 17:20:15 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.498.0; Wed, 31 Mar 2021
 17:22:45 +0800
From: Yi Zhuang <zhuangyi1@huawei.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
Date: Wed, 31 Mar 2021 17:34:14 +0800
Message-ID: <20210331093414.52308-1-zhuangyi1@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lRX42-0005dG-Ix
Subject: [f2fs-dev] [PATCH] f2fs: Fix a hungtask problem in atomic write
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
Cc: weiyongjun1@huawei.com, yuehaibing@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SW4gdGhlIGNhY2hlIHdyaXRpbmcgcHJvY2VzcywgaWYgaXQgaXMgYW4gYXRvbWljIGZpbGUsIGlu
Y3JlYXNlIHRoZSBwYWdlCmNvdW50IG9mIEYyRlNfV0JfQ1BfREFUQSwgb3RoZXJ3aXNlIGluY3Jl
YXNlIHRoZSBwYWdlIGNvdW50IG9mCkYyRlNfV0JfREFUQS4KCldoZW4geW91IHN0ZXAgaW50byB0
aGUgaG9vayBicmFuY2ggZHVlIHRvIGluc3VmZmljaWVudCBtZW1vcnkgaW4KZjJmc193cml0ZV9i
ZWdpbiwgZjJmc19kcm9wX2lubWVtX3BhZ2VzX2FsbCB3aWxsIGJlIGNhbGxlZCB0byB0cmF2ZXJz
ZQphbGwgYXRvbWljIGlub2RlcyBhbmQgY2xlYXIgdGhlIEZJX0FUT01JQ19GSUxFIG1hcmsgb2Yg
YWxsIGF0b21pYyBmaWxlcy4KCkluIGYyZnNfZHJvcF9pbm1lbV9wYWdlc++8jGZpcnN0IGFjcXVp
cmUgdGhlIGlubWVtX2xvY2sgLCByZXZva2UgYWxsIHRoZQppbm1lbV9wYWdlcywgYW5kIHRoZW4g
Y2xlYXIgdGhlIEZJX0FUT01JQ19GSUxFIG1hcmsuIEJlZm9yZSB0aGlzIG1hcmsgaXMKY2xlYXJl
ZCwgb3RoZXIgdGhyZWFkcyBtYXkgaG9sZCBpbm1lbV9sb2NrIHRvIGFkZCBpbm1lbV9wYWdlcyB0
byB0aGUgaW5vZGUKdGhhdCBoYXMganVzdCBiZWVuIGVtcHRpZWQgaW5tZW1fcGFnZXMsIGFuZCBp
bmNyZWFzZSB0aGUgcGFnZSBjb3VudCBvZgpGMkZTX1dCX0NQX0RBVEEuCgpXaGVuIHRoZSBJTyBy
ZXR1cm5zLCBpdCBpcyBmb3VuZCB0aGF0IHRoZSBGSV9BVE9NSUNfRklMRSBmbGFnIGlzIGNsZWFy
ZWQKYnkgZjJmc19kcm9wX2lubWVtX3BhZ2VzX2FsbCwgYW5kIGYyZnNfaXNfYXRvbWljX2ZpbGUg
cmV0dXJucyBmYWxzZSx3aGljaApjYXVzZXMgdGhlIHBhZ2UgY291bnQgb2YgRjJGU19XQl9EQVRB
IHRvIGJlIGRlY3JlbWVudGVkLiBUaGUgcGFnZSBjb3VudCBvZgpGMkZTX1dCX0NQX0RBVEEgY2Fu
bm90IGJlIGNsZWFyZWQuIEZpbmFsbHksIGh1bmd0YXNrIGlzIHRyaWdnZXJlZCBpbgpmMmZzX3dh
aXRfb25fYWxsX3BhZ2VzIGJlY2F1c2UgZ2V0X3BhZ2VzIHdpbGwgbmV2ZXIgcmV0dXJuIHplcm8u
Cgpwcm9jZXNzIEE6CQkJCXByb2Nlc3MgQjoKZjJmc19kcm9wX2lubWVtX3BhZ2VzX2FsbAotPmYy
ZnNfZHJvcF9pbm1lbV9wYWdlcyBvZiBpbm9kZSMxCiAgICAtPm11dGV4X2xvY2soJmZpLT5pbm1l
bV9sb2NrKQogICAgLT5fX3Jldm9rZV9pbm1lbV9wYWdlcyBvZiBpbm9kZSMxCWYyZnNfaW9jX2Nv
bW1pdF9hdG9taWNfd3JpdGUKICAgIC0+bXV0ZXhfdW5sb2NrKCZmaS0+aW5tZW1fbG9jaykJLT5m
MmZzX2NvbW1pdF9pbm1lbV9wYWdlcyBvZiBpbm9kZSMxCgkJCQkJLT5tdXRleF9sb2NrKCZmaS0+
aW5tZW1fbG9jaykKCQkJCQktPl9fZjJmc19jb21taXRfaW5tZW1fcGFnZXMKCQkJCQkgICAgLT5m
MmZzX2RvX3dyaXRlX2RhdGFfcGFnZQoJCQkJCSAgICAgICAgLT5mMmZzX291dHBsYWNlX3dyaXRl
X2RhdGEKCQkJCQkgICAgICAgICAgICAtPmRvX3dyaXRlX3BhZ2UKCQkJCQkgICAgICAgICAgICAg
ICAgLT5mMmZzX3N1Ym1pdF9wYWdlX3dyaXRlCgkJCQkJICAgICAgICAgICAgICAgICAgICAtPmlu
Y19wYWdlX2NvdW50KHNiaSwgRjJGU19XQl9DUF9EQVRBICkKCQkJCQktPm11dGV4X3VubG9jaygm
ZmktPmlubWVtX2xvY2spCiAgICAtPnNwaW5fbG9jaygmc2JpLT5pbm9kZV9sb2NrW0FUT01JQ19G
SUxFXSk7CiAgICAtPmNsZWFyX2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19GSUxFKQogICAg
LT5zcGluX3VubG9jaygmc2JpLT5pbm9kZV9sb2NrW0FUT01JQ19GSUxFXSkKCQkJCQlmMmZzX3dy
aXRlX2VuZF9pbwoJCQkJCS0+ZGVjX3BhZ2VfY291bnQoc2JpLCBGMkZTX1dCX0RBVEEgKTsKCldl
IGNhbiBmaXggdGhlIHByb2JsZW0gYnkgcHV0dGluZyB0aGUgYWN0aW9uIG9mIGNsZWFyaW5nIHRo
ZSBGSV9BVE9NSUNfRklMRQptYXJrIGludG8gdGhlIGlubWVtX2xvY2sgbG9jay4gVGhpcyBvcGVy
YXRpb24gY2FuIGVuc3VyZSB0aGF0IG5vIG9uZSB3aWxsCnN1Ym1pdCB0aGUgaW5tZW0gcGFnZXMg
YmVmb3JlIHRoZSBGSV9BVE9NSUNfRklMRSBtYXJrIGlzIGNsZWFyZWQsIHNvIHRoYXQKdGhlcmUg
d2lsbCBiZSBubyBhdG9taWMgd3JpdGVzIHdhaXRpbmcgZm9yIHdyaXRlYmFjay4KCkZpeGVzOiA1
Nzg2NGFlNWNlM2EgKCJmMmZzOiBsaW1pdCAjIG9mIGlubWVtb3J5IHBhZ2VzIikKU2lnbmVkLW9m
Zi1ieTogWWkgWmh1YW5nIDx6aHVhbmd5aTFAaHVhd2VpLmNvbT4KLS0tCiBmcy9mMmZzL3NlZ21l
bnQuYyB8IDMwICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDE3IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
c2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKaW5kZXggYzI4NjY1NjEyNjNlLi5lNDYyN2Zl
OTMzOTAgMTAwNjQ0Ci0tLSBhL2ZzL2YyZnMvc2VnbWVudC5jCisrKyBiL2ZzL2YyZnMvc2VnbWVu
dC5jCkBAIC0zMjQsMjMgKzMyNCwyNyBAQCB2b2lkIGYyZnNfZHJvcF9pbm1lbV9wYWdlcyhzdHJ1
Y3QgaW5vZGUgKmlub2RlKQogCXN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSA9IEYyRlNfSV9TQihp
bm9kZSk7CiAJc3RydWN0IGYyZnNfaW5vZGVfaW5mbyAqZmkgPSBGMkZTX0koaW5vZGUpOwogCi0J
d2hpbGUgKCFsaXN0X2VtcHR5KCZmaS0+aW5tZW1fcGFnZXMpKSB7CisJZG8gewogCQltdXRleF9s
b2NrKCZmaS0+aW5tZW1fbG9jayk7CisJCWlmIChsaXN0X2VtcHR5KCZmaS0+aW5tZW1fcGFnZXMp
KSB7CisJCQlmaS0+aV9nY19mYWlsdXJlc1tHQ19GQUlMVVJFX0FUT01JQ10gPSAwOworCisJCQlz
cGluX2xvY2soJnNiaS0+aW5vZGVfbG9ja1tBVE9NSUNfRklMRV0pOworCQkJaWYgKCFsaXN0X2Vt
cHR5KCZmaS0+aW5tZW1faWxpc3QpKQorCQkJCWxpc3RfZGVsX2luaXQoJmZpLT5pbm1lbV9pbGlz
dCk7CisJCQlpZiAoZjJmc19pc19hdG9taWNfZmlsZShpbm9kZSkpIHsKKwkJCQljbGVhcl9pbm9k
ZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfRklMRSk7CisJCQkJc2JpLT5hdG9taWNfZmlsZXMtLTsK
KwkJCX0KKwkJCXNwaW5fdW5sb2NrKCZzYmktPmlub2RlX2xvY2tbQVRPTUlDX0ZJTEVdKTsKKwor
CQkJbXV0ZXhfdW5sb2NrKCZmaS0+aW5tZW1fbG9jayk7CisJCQlicmVhazsKKwkJfQogCQlfX3Jl
dm9rZV9pbm1lbV9wYWdlcyhpbm9kZSwgJmZpLT5pbm1lbV9wYWdlcywKIAkJCQkJCXRydWUsIGZh
bHNlLCB0cnVlKTsKIAkJbXV0ZXhfdW5sb2NrKCZmaS0+aW5tZW1fbG9jayk7Ci0JfQotCi0JZmkt
PmlfZ2NfZmFpbHVyZXNbR0NfRkFJTFVSRV9BVE9NSUNdID0gMDsKLQotCXNwaW5fbG9jaygmc2Jp
LT5pbm9kZV9sb2NrW0FUT01JQ19GSUxFXSk7Ci0JaWYgKCFsaXN0X2VtcHR5KCZmaS0+aW5tZW1f
aWxpc3QpKQotCQlsaXN0X2RlbF9pbml0KCZmaS0+aW5tZW1faWxpc3QpOwotCWlmIChmMmZzX2lz
X2F0b21pY19maWxlKGlub2RlKSkgewotCQljbGVhcl9pbm9kZV9mbGFnKGlub2RlLCBGSV9BVE9N
SUNfRklMRSk7Ci0JCXNiaS0+YXRvbWljX2ZpbGVzLS07Ci0JfQotCXNwaW5fdW5sb2NrKCZzYmkt
Pmlub2RlX2xvY2tbQVRPTUlDX0ZJTEVdKTsKKwl9IHdoaWxlICgxKTsKIH0KIAogdm9pZCBmMmZz
X2Ryb3BfaW5tZW1fcGFnZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgcGFnZSAqcGFnZSkK
LS0gCjIuMjYuMC4xMDYuZzlmYWRlZGQKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
