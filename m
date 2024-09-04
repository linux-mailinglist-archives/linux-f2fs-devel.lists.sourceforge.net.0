Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC4696AF8A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Sep 2024 05:49:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slh1F-0003NQ-2L;
	Wed, 04 Sep 2024 03:49:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1slh1D-0003NJ-GQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 03:49:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZTR2cK3xHD/QdHc5oGWfs7RxSJoaxo8+/WMNd+9t8KQ=; b=jqts7SJyESyzVOgoCqAwxWLhVc
 xEb7sxdhz5NhV3TuksTAYvyc+WWt7dNKLunzOmvNz4rdjTv7W9obIWDH15BbyGVnW9AZfuNDaFsor
 08HpsjWnXyYGBuk/0pO3CcTiPWrqL70CikSzNpFFsNFxFNNNx9VU2cu0OZiOc2oTFoQY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZTR2cK3xHD/QdHc5oGWfs7RxSJoaxo8+/WMNd+9t8KQ=; b=krJmNPMTPbJthK8lw8HdJ9/4+n
 9w+9eu83w9IzqeRodX5ImEter9Oi/sHj5MSAnoqBFi6AWrXcrT3FW38TfRCisKfLp0DTERDu34X6q
 +rjRVQuJ8hWoUoYze5UTsA+Vy/AXWtpj5Pmc7gncEc+D87FSVJIGGeptpVYk3COB9tQc=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slh1C-0006og-Lr for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 03:49:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9EED2A406A1;
 Wed,  4 Sep 2024 03:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA27C4CEC2;
 Wed,  4 Sep 2024 03:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725421747;
 bh=f09ujSt9BLT4EcodnGu8Hfc/mEU6rIu+1i6Nq7K/Ung=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Et/ee1450O6uT/OPAjjbA9tQ95qw9/UnKQvCKpjGNYKoeArGDXsUeZ20/vN0L8Qrh
 zcWcxirw3uJeyEFBsK4fDb3HJx87A5NOs97Z3b4AJEr/VqLXQjRv6ilR1U0ECrAc/b
 SdrxXeI0rtTTcaoXdZtoSMjapguB3PPzWSDvQz2trjL85C2nc6PtEaKItU8xlyTtbf
 9YdtP11xRaOX/CCWGa1OW/uVQhmfHF6A8jXqDD4R7kffdwK3UFFvwBuUdGePb6Sb1M
 /Y+j6ZAyxZ+2NWh8QL+rZRY4YoUdiPTxTtWyybxtsI+hHArNUfKpTI5hCl6ueNsgnA
 97CDnYrra8JVw==
Message-ID: <973e075b-7044-4448-9cd0-45b5a1ad1382@kernel.org>
Date: Wed, 4 Sep 2024 11:49:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-f2fs-devel@lists.sourceforge.net
References: <52ced02d-728b-4e3b-9079-73efd91c90e3@kernel.org>
 <20240903060658.1780002-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20240903060658.1780002-1-wangzijie1@honor.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/9/3 14:06, wangzijie wrote: > From: Chao Yu via Linux-f2fs-devel
    <linux-f2fs-devel@lists.sourceforge.net> > >> On 2024/8/27 14:22, wangzijie
    wrote: >>> Thread A >>> -dquot_initialize >>>   -d [...] 
 
 Content analysis details:   (-0.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1slh1C-0006og-Lr
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: don't set SBI_QUOTA_NEED_REPAIR
 flag if receive SIGKILL
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
Cc: jaegeuk@kernel.org, wangzijie1@honor.com, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC85LzMgMTQ6MDYsIHdhbmd6aWppZSB3cm90ZToKPiBGcm9tOiBDaGFvIFl1IHZpYSBM
aW51eC1mMmZzLWRldmVsIDxsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldD4K
PiAKPj4gT24gMjAyNC84LzI3IDE0OjIyLCB3YW5nemlqaWUgd3JvdGU6Cj4+PiBUaHJlYWQgQQo+
Pj4gLWRxdW90X2luaXRpYWxpemUKPj4+IMKgIC1kcWdldAo+Pj4gwqDCoCAtZjJmc19kcXVvdF9h
Y3F1aXJlCj4+PiDCoMKgwqAgLXYyX3JlYWRfZHF1b3QKPj4+IMKgwqDCoMKgIC1xdHJlZV9yZWFk
X2RxdW90Cj4+PiDCoMKgwqDCoMKgIC1maW5kX3RyZWVfZHFlbnRyeQo+Pj4gwqDCoMKgwqDCoMKg
IC1mMmZzX3F1b3RhX3JlYWQKPj4+IMKgwqDCoMKgwqDCoMKgIC1yZWFkX2NhY2hlX3BhZ2VfZ2Zw
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIC1kb19yZWFkX2NhY2hlX2ZvbGlvCj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgLWZpZW1hcF9yZWFkX2ZvbGlvCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtZm9s
aW9fd2FpdF9sb2NrZWRfa2lsbGFibGUKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLXJlY2Vp
dmUgU0lHS0lMTCA6IHJldHVybiAtRUlOVFIKPj4+IMKgwqDCoMKgwqDCoMKgIC1zZXQgU0JJX1FV
T1RBX05FRURfUkVQQUlSCj4+PiDCoMKgwqAgLXNldCBTQklfUVVPVEFfTkVFRF9SRVBBSVIKPj4+
Cj4+PiBXaGVuIGNhbGxpbmcgcmVhZF9jYWNoZV9wYWdlX2dmcCBpbiBxdW90YSByZWFkLCB0aHJl
YWQgbWF5IHJlY2VpdmUgU0lHS0lMTCBhbmQKPj4+IHNldCBTQklfUVVPVEFfTkVFRF9SRVBBSVIs
IHNob3VsZCB3ZSBzZXQgU0JJX1FVT1RBX05FRURfUkVQQUlSIGluIHRoaXMgZXJyb3IgcGF0aD8K
Pj4KPj4gZjJmc19xdW90YV9yZWFkKCkgY2FuIGJlIGNhbGxlZCBpbiBhIGxvdCBvZiBjb250ZXh0
cywgY2FuIHdlIGp1c3QgaWdub3JlIC1FSU5UUgo+PiBmb3IgZjJmc19kcXVvdF9pbml0aWFsaXpl
KCkgY2FzZT8KPj4KPj4gVGhhbmtzLAo+IAo+IFllcywgaW4gbWFueSBjb250ZXh0cyBmMmZzX3F1
b3RhX3JlYWQoKSBjYW4gYmUgY2FsbGVkIGFuZCBtYXkgcmV0dXJuIC1FSU5UUiwgd2UgbmVlZCB0
byBpZ25vcmUgdGhpcyBlcnJubyBmb3IgbW9yZSBjYXNlcy4gSWYgd2UgbmVlZCB0byBkbyBzbywg
SSB3aWxsIGNoZWNrIGl0IGFuZCByZXNlbmQgcGF0Y2guCj4gT3IgZG8geW91IGhhdmUgb3RoZXIg
c3VnZ2VzdGlvbnMgdG8gYXZvaWQgdW5uZWNlc3NhcnkgU0JJX1FVT1RBX05FRURfUkVQQUlSIGZs
YWcgc2V0PwoKSG93IGFib3V0IHRoaXM/CgotLS0KICBmcy9mMmZzL2YyZnMuaCAgfCAgMSArCiAg
ZnMvZjJmcy9pbm9kZS5jIHwgIDMgKy0tCiAgZnMvZjJmcy9zdXBlci5jIHwgMTcgKysrKysrKysr
KysrKy0tLS0KICAzIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAppbmRleCBk
ZmVkMTk3NGVkYTUuLmExNzA0YTE5ZGZlOSAxMDA2NDQKLS0tIGEvZnMvZjJmcy9mMmZzLmgKKysr
IGIvZnMvZjJmcy9mMmZzLmgKQEAgLTgxMCw2ICs4MTAsNyBAQCBlbnVtIHsKICAJRklfQVRPTUlD
X0RJUlRJRUQsCS8qIGluZGljYXRlIGF0b21pYyBmaWxlIGlzIGRpcnRpZWQgKi8KICAJRklfQVRP
TUlDX1JFUExBQ0UsCS8qIGluZGljYXRlIGF0b21pYyByZXBsYWNlICovCiAgCUZJX09QRU5FRF9G
SUxFLAkJLyogaW5kaWNhdGUgZmlsZSBoYXMgYmVlbiBvcGVuZWQgKi8KKwlGSV9JTklUX0RRVU9U
LAkJLyogaW5kaWNhdGUgaXQncyBpbml0aWFsaXppbmcgZHF1b3QgKi8KICAJRklfTUFYLAkJCS8q
IG1heCBmbGFnLCBuZXZlciBiZSB1c2VkICovCiAgfTsKCmRpZmYgLS1naXQgYS9mcy9mMmZzL2lu
b2RlLmMgYi9mcy9mMmZzL2lub2RlLmMKaW5kZXggMDA4ZjAxMzQ4YWZhLi5iMWRiYWVkYTMwNmYg
MTAwNjQ0Ci0tLSBhL2ZzL2YyZnMvaW5vZGUuYworKysgYi9mcy9mMmZzL2lub2RlLmMKQEAgLTgy
Nyw4ICs4MjcsNyBAQCB2b2lkIGYyZnNfZXZpY3RfaW5vZGUoc3RydWN0IGlub2RlICppbm9kZSkK
CiAgCWVyciA9IGYyZnNfZHF1b3RfaW5pdGlhbGl6ZShpbm9kZSk7CiAgCWlmIChlcnIpIHsKLQkJ
aWYgKGVyciAhPSAtRUlOVFIpCi0JCQlzZXRfc2JpX2ZsYWcoc2JpLCBTQklfUVVPVEFfTkVFRF9S
RVBBSVIpOworCQlzZXRfc2JpX2ZsYWcoc2JpLCBTQklfUVVPVEFfTkVFRF9SRVBBSVIpOwogIAkJ
ZXJyID0gMDsKICAJfQoKZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3Vw
ZXIuYwppbmRleCA4ZTI5YWJhNGI3YTQuLmU3NzRiZGY4NzViMiAxMDA2NDQKLS0tIGEvZnMvZjJm
cy9zdXBlci5jCisrKyBiL2ZzL2YyZnMvc3VwZXIuYwpAQCAtMjY0NCw4ICsyNjQ0LDExIEBAIHN0
YXRpYyBzc2l6ZV90IGYyZnNfcXVvdGFfcmVhZChzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBpbnQg
dHlwZSwgY2hhciAqZGF0YSwKICAJCQlpZiAoUFRSX0VSUihwYWdlKSA9PSAtRU5PTUVNKSB7CiAg
CQkJCW1lbWFsbG9jX3JldHJ5X3dhaXQoR0ZQX05PRlMpOwogIAkJCQlnb3RvIHJlcGVhdDsKLQkJ
CX0gZWxzZSBpZiAoUFRSX0VSUihwYWdlKSAhPSAtRUlOVFIpCi0JCQkJc2V0X3NiaV9mbGFnKEYy
RlNfU0Ioc2IpLCBTQklfUVVPVEFfTkVFRF9SRVBBSVIpOworCQkJfSBlbHNlIGlmIChQVFJfRVJS
KHBhZ2UpID09IC1FSU5UUiAmJgorCQkJCWlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9JTklU
X0RRVU9UKSkgeworCQkJCXJldHVybiBQVFJfRVJSKHBhZ2UpOworCQkJfQorCQkJc2V0X3NiaV9m
bGFnKEYyRlNfU0Ioc2IpLCBTQklfUVVPVEFfTkVFRF9SRVBBSVIpOwogIAkJCXJldHVybiBQVFJf
RVJSKHBhZ2UpOwogIAkJfQoKQEAgLTI3MjEsMTAgKzI3MjQsMTYgQEAgc3RhdGljIHNzaXplX3Qg
ZjJmc19xdW90YV93cml0ZShzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBpbnQgdHlwZSwKCiAgaW50
IGYyZnNfZHF1b3RfaW5pdGlhbGl6ZShzdHJ1Y3QgaW5vZGUgKmlub2RlKQogIHsKKwlpbnQgcmV0
OworCiAgCWlmICh0aW1lX3RvX2luamVjdChGMkZTX0lfU0IoaW5vZGUpLCBGQVVMVF9EUVVPVF9J
TklUKSkKICAJCXJldHVybiAtRVNSQ0g7CgotCXJldHVybiBkcXVvdF9pbml0aWFsaXplKGlub2Rl
KTsKKwlzZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklfSU5JVF9EUVVPVCk7CisJcmV0ID0gZHF1b3Rf
aW5pdGlhbGl6ZShpbm9kZSk7CisJY2xlYXJfaW5vZGVfZmxhZyhpbm9kZSwgRklfSU5JVF9EUVVP
VCk7CisKKwlyZXR1cm4gcmV0OwogIH0KCiAgc3RhdGljIHN0cnVjdCBkcXVvdCBfX3JjdSAqKmYy
ZnNfZ2V0X2RxdW90cyhzdHJ1Y3QgaW5vZGUgKmlub2RlKQpAQCAtMzA2NCw3ICszMDczLDcgQEAg
c3RhdGljIGludCBmMmZzX2RxdW90X2FjcXVpcmUoc3RydWN0IGRxdW90ICpkcXVvdCkKCiAgCWYy
ZnNfZG93bl9yZWFkKCZzYmktPnF1b3RhX3NlbSk7CiAgCXJldCA9IGRxdW90X2FjcXVpcmUoZHF1
b3QpOwotCWlmIChyZXQgPCAwICYmIHJldCAhPSAtRUlOVFIpCisJaWYgKHJldCA8IDApCiAgCQlz
ZXRfc2JpX2ZsYWcoc2JpLCBTQklfUVVPVEFfTkVFRF9SRVBBSVIpOwogIAlmMmZzX3VwX3JlYWQo
JnNiaS0+cXVvdGFfc2VtKTsKICAJcmV0dXJuIHJldDsKLS0gCjIuNDAuMQoKPiAKPiBUaGFuayB5
b3UgZm9yIHJldmlldy4KPiAKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiB3YW5nemlqaWUgPHdhbmd6
aWppZTFAaG9ub3IuY29tPgo+Pj4gLS0tCj4+PiDCoCBmcy9mMmZzL2lub2RlLmMgfCAzICsrLQo+
Pj4gwqAgZnMvZjJmcy9zdXBlci5jIHwgNiArKystLS0KPj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9m
MmZzL2lub2RlLmMgYi9mcy9mMmZzL2lub2RlLmMKPj4+IGluZGV4IGVkNjI5ZGFiYi4uMmFmOThl
MmI3IDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9pbm9kZS5jCj4+PiArKysgYi9mcy9mMmZzL2lu
b2RlLmMKPj4+IEBAIC04MzcsOCArODM3LDkgQEAgdm9pZCBmMmZzX2V2aWN0X2lub2RlKHN0cnVj
dCBpbm9kZSAqaW5vZGUpCj4+PiDCoMKgwqDCoMKgIGVyciA9IGYyZnNfZHF1b3RfaW5pdGlhbGl6
ZShpbm9kZSk7Cj4+PiDCoMKgwqDCoMKgIGlmIChlcnIpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoCBp
ZiAoZXJyICE9IC1FSU5UUikKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNldF9zYmlfZmxh
ZyhzYmksIFNCSV9RVU9UQV9ORUVEX1JFUEFJUik7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZXJy
ID0gMDsKPj4+IC3CoMKgwqDCoMKgwqDCoCBzZXRfc2JpX2ZsYWcoc2JpLCBTQklfUVVPVEFfTkVF
RF9SRVBBSVIpOwo+Pj4gwqDCoMKgwqDCoCB9Cj4+PiDCoMKgwqDCoMKgIGYyZnNfcmVtb3ZlX2lu
b19lbnRyeShzYmksIGlub2RlLT5pX2lubywgQVBQRU5EX0lOTyk7Cj4+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCj4+PiBpbmRleCAxZjFiMzY0N2EuLmY5
OWEzNmZmMyAxMDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMvc3VwZXIuYwo+Pj4gKysrIGIvZnMvZjJm
cy9zdXBlci5jCj4+PiBAQCAtMjY1MCw4ICsyNjUwLDggQEAgc3RhdGljIHNzaXplX3QgZjJmc19x
dW90YV9yZWFkKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIGludCB0eXBlLCBjaGFyICpkYXRhLAo+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKFBUUl9FUlIocGFnZSkgPT0gLUVOT01F
TSkgewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZW1hbGxvY19yZXRy
eV93YWl0KEdGUF9OT0ZTKTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Z290byByZXBlYXQ7Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzZXRfc2JpX2ZsYWcoRjJGU19TQihzYiksIFNCSV9RVU9UQV9ORUVEX1JF
UEFJUik7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9IGVsc2UgaWYgKFBUUl9FUlIocGFn
ZSkgIT0gLUVJTlRSKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZXRfc2Jp
X2ZsYWcoRjJGU19TQihzYiksIFNCSV9RVU9UQV9ORUVEX1JFUEFJUik7Cj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihwYWdlKTsKPj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCB9Cj4+PiBAQCAtMzA3MCw3ICszMDcwLDcgQEAgc3RhdGljIGludCBmMmZzX2RxdW90X2Fj
cXVpcmUoc3RydWN0IGRxdW90ICpkcXVvdCkKPj4+IMKgwqDCoMKgwqAgZjJmc19kb3duX3JlYWQo
JnNiaS0+cXVvdGFfc2VtKTsKPj4+IMKgwqDCoMKgwqAgcmV0ID0gZHF1b3RfYWNxdWlyZShkcXVv
dCk7Cj4+PiAtwqDCoMKgIGlmIChyZXQgPCAwKQo+Pj4gK8KgwqDCoCBpZiAocmV0IDwgMCAmJiBy
ZXQgIT0gLUVJTlRSKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHNldF9zYmlfZmxhZyhzYmksIFNC
SV9RVU9UQV9ORUVEX1JFUEFJUik7Cj4+PiDCoMKgwqDCoMKgIGYyZnNfdXBfcmVhZCgmc2JpLT5x
dW90YV9zZW0pOwo+Pj4gwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+IAo+IAoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
