Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F3D97050F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  8 Sep 2024 06:28:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sn9Xd-0005Aq-FJ;
	Sun, 08 Sep 2024 04:28:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1sn9Xc-0005Ac-39
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 08 Sep 2024 04:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TictCdzm7LdKz5TaaPRfLIhffrfTLS9eZk5cNj6QGgg=; b=P2T4S3N76uvPfDcQyHEsCfxcCM
 VcqUHAH8ZUp0ycikbV5e15rimuUeNkzPejB3CUQgIzy4gjUCN+aOqs9Ua/O0z8qtxOmDsnlZyVLJ0
 CIhuNyJopocjHRT4GhbmEcvW2ehTnTfT9BSEgRYas6vQ5Osie0LVmW6num4Nabsnhxp4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TictCdzm7LdKz5TaaPRfLIhffrfTLS9eZk5cNj6QGgg=; b=QSuloMEll4lQMYzeq6HTYF0EXq
 aZ0ePgOFGDEjgtAQKfjJqTvOKqhIMH9ryuh5jDw0dRCOB2AC6HpXF08qv4AAZwEFQgenSWmJRUgBM
 iIdNuhiMq541jn0Ina9hAdyftTfmiJXJjy4EkYJvKhHsEYwiaCKAV890bgwebjYvK+lc=;
Received: from mta20.hihonor.com ([81.70.206.69])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sn9Xa-0001JC-Tx for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 08 Sep 2024 04:28:48 +0000
Received: from w001.hihonor.com (unknown [10.68.25.235])
 by mta20.hihonor.com (SkyGuard) with ESMTPS id 4X1c1j0mCKzYkyX1;
 Sun,  8 Sep 2024 12:10:01 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w001.hihonor.com
 (10.68.25.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sun, 8 Sep
 2024 12:12:03 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sun, 8 Sep
 2024 12:12:03 +0800
From: wangzijie <wangzijie1@honor.com>
To: <chao@kernel.org>
Date: Sun, 8 Sep 2024 12:12:02 +0800
Message-ID: <20240908041202.2272053-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <973e075b-7044-4448-9cd0-45b5a1ad1382@kernel.org>
References: <973e075b-7044-4448-9cd0-45b5a1ad1382@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w011.hihonor.com (10.68.20.122) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  >> From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
    >> >>> On 2024/8/27 14:22, wangzijie wrote: >>>> Thread A >>>> -dquot_initialize
    >>>>   -dqget >>>>    -f2fs_dquot_acq [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1sn9Xa-0001JC-Tx
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
Cc: jaegeuk@kernel.org, wangzijie1@honor.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Pj4gRnJvbTogQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQ+Cj4+IAo+Pj4gT24gMjAyNC84LzI3IDE0OjIyLCB3YW5nemlq
aWUgd3JvdGU6Cj4+Pj4gVGhyZWFkIEEKPj4+PiAtZHF1b3RfaW5pdGlhbGl6ZQo+Pj4+IMKgIC1k
cWdldAo+Pj4+IMKgwqAgLWYyZnNfZHF1b3RfYWNxdWlyZQo+Pj4+IMKgwqDCoCAtdjJfcmVhZF9k
cXVvdAo+Pj4+IMKgwqDCoMKgIC1xdHJlZV9yZWFkX2RxdW90Cj4+Pj4gwqDCoMKgwqDCoCAtZmlu
ZF90cmVlX2RxZW50cnkKPj4+PiDCoMKgwqDCoMKgwqAgLWYyZnNfcXVvdGFfcmVhZAo+Pj4+IMKg
wqDCoMKgwqDCoMKgIC1yZWFkX2NhY2hlX3BhZ2VfZ2ZwCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCAt
ZG9fcmVhZF9jYWNoZV9mb2xpbwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAtZmllbWFwX3JlYWRf
Zm9saW8KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtZm9saW9fd2FpdF9sb2NrZWRfa2lsbGFi
bGUKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC1yZWNlaXZlIFNJR0tJTEwgOiByZXR1cm4g
LUVJTlRSCj4+Pj4gwqDCoMKgwqDCoMKgwqAgLXNldCBTQklfUVVPVEFfTkVFRF9SRVBBSVIKPj4+
PiDCoMKgwqAgLXNldCBTQklfUVVPVEFfTkVFRF9SRVBBSVIKPj4+Pgo+Pj4+IFdoZW4gY2FsbGlu
ZyByZWFkX2NhY2hlX3BhZ2VfZ2ZwIGluIHF1b3RhIHJlYWQsIHRocmVhZCBtYXkgcmVjZWl2ZSBT
SUdLSUxMIGFuZAo+Pj4+IHNldCBTQklfUVVPVEFfTkVFRF9SRVBBSVIsIHNob3VsZCB3ZSBzZXQg
U0JJX1FVT1RBX05FRURfUkVQQUlSIGluIHRoaXMgZXJyb3IgcGF0aD8KPj4+Cj4+PiBmMmZzX3F1
b3RhX3JlYWQoKSBjYW4gYmUgY2FsbGVkIGluIGEgbG90IG9mIGNvbnRleHRzLCBjYW4gd2UganVz
dCBpZ25vcmUgLUVJTlRSCj4+PiBmb3IgZjJmc19kcXVvdF9pbml0aWFsaXplKCkgY2FzZT8KPj4+
Cj4+PiBUaGFua3MsCj4+IAo+PiBZZXMsIGluIG1hbnkgY29udGV4dHMgZjJmc19xdW90YV9yZWFk
KCkgY2FuIGJlIGNhbGxlZCBhbmQgbWF5IHJldHVybiAtRUlOVFIsIHdlIG5lZWQgdG8gaWdub3Jl
IHRoaXMgZXJybm8gZm9yIG1vcmUgY2FzZXMuIElmIHdlIG5lZWQgdG8gZG8gc28sIEkgd2lsbCBj
aGVjayBpdCBhbmQgcmVzZW5kIHBhdGNoLgo+PiBPciBkbyB5b3UgaGF2ZSBvdGhlciBzdWdnZXN0
aW9ucyB0byBhdm9pZCB1bm5lY2Vzc2FyeSBTQklfUVVPVEFfTkVFRF9SRVBBSVIgZmxhZyBzZXQ/
Cj4KPkhvdyBhYm91dCB0aGlzPwo+Cj4tLS0KPiAgZnMvZjJmcy9mMmZzLmggIHwgIDEgKwo+ICBm
cy9mMmZzL2lub2RlLmMgfCAgMyArLS0KPiAgZnMvZjJmcy9zdXBlci5jIHwgMTcgKysrKysrKysr
KysrKy0tLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQo+Cj5kaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+aW5k
ZXggZGZlZDE5NzRlZGE1Li5hMTcwNGExOWRmZTkgMTAwNjQ0Cj4tLS0gYS9mcy9mMmZzL2YyZnMu
aAo+KysrIGIvZnMvZjJmcy9mMmZzLmgKPkBAIC04MTAsNiArODEwLDcgQEAgZW51bSB7Cj4gIAlG
SV9BVE9NSUNfRElSVElFRCwJLyogaW5kaWNhdGUgYXRvbWljIGZpbGUgaXMgZGlydGllZCAqLwo+
ICAJRklfQVRPTUlDX1JFUExBQ0UsCS8qIGluZGljYXRlIGF0b21pYyByZXBsYWNlICovCj4gIAlG
SV9PUEVORURfRklMRSwJCS8qIGluZGljYXRlIGZpbGUgaGFzIGJlZW4gb3BlbmVkICovCj4rCUZJ
X0lOSVRfRFFVT1QsCQkvKiBpbmRpY2F0ZSBpdCdzIGluaXRpYWxpemluZyBkcXVvdCAqLwo+ICAJ
RklfTUFYLAkJCS8qIG1heCBmbGFnLCBuZXZlciBiZSB1c2VkICovCj4gIH07Cj4KPmRpZmYgLS1n
aXQgYS9mcy9mMmZzL2lub2RlLmMgYi9mcy9mMmZzL2lub2RlLmMKPmluZGV4IDAwOGYwMTM0OGFm
YS4uYjFkYmFlZGEzMDZmIDEwMDY0NAo+LS0tIGEvZnMvZjJmcy9pbm9kZS5jCj4rKysgYi9mcy9m
MmZzL2lub2RlLmMKPkBAIC04MjcsOCArODI3LDcgQEAgdm9pZCBmMmZzX2V2aWN0X2lub2RlKHN0
cnVjdCBpbm9kZSAqaW5vZGUpCj4KPiAgCWVyciA9IGYyZnNfZHF1b3RfaW5pdGlhbGl6ZShpbm9k
ZSk7Cj4gIAlpZiAoZXJyKSB7Cj4tCQlpZiAoZXJyICE9IC1FSU5UUikKPi0JCQlzZXRfc2JpX2Zs
YWcoc2JpLCBTQklfUVVPVEFfTkVFRF9SRVBBSVIpOwo+KwkJc2V0X3NiaV9mbGFnKHNiaSwgU0JJ
X1FVT1RBX05FRURfUkVQQUlSKTsKPiAgCQllcnIgPSAwOwo+ICAJfQo+Cj5kaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCj5pbmRleCA4ZTI5YWJhNGI3YTQuLmU3
NzRiZGY4NzViMiAxMDA2NDQKPi0tLSBhL2ZzL2YyZnMvc3VwZXIuYwo+KysrIGIvZnMvZjJmcy9z
dXBlci5jCj5AQCAtMjY0NCw4ICsyNjQ0LDExIEBAIHN0YXRpYyBzc2l6ZV90IGYyZnNfcXVvdGFf
cmVhZChzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBpbnQgdHlwZSwgY2hhciAqZGF0YSwKPiAgCQkJ
aWYgKFBUUl9FUlIocGFnZSkgPT0gLUVOT01FTSkgewo+ICAJCQkJbWVtYWxsb2NfcmV0cnlfd2Fp
dChHRlBfTk9GUyk7Cj4gIAkJCQlnb3RvIHJlcGVhdDsKPi0JCQl9IGVsc2UgaWYgKFBUUl9FUlIo
cGFnZSkgIT0gLUVJTlRSKQo+LQkJCQlzZXRfc2JpX2ZsYWcoRjJGU19TQihzYiksIFNCSV9RVU9U
QV9ORUVEX1JFUEFJUik7Cj4rCQkJfSBlbHNlIGlmIChQVFJfRVJSKHBhZ2UpID09IC1FSU5UUiAm
Jgo+KwkJCQlpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfSU5JVF9EUVVPVCkpIHsKPisJCQkJ
cmV0dXJuIFBUUl9FUlIocGFnZSk7Cj4rCQkJfQo+KwkJCXNldF9zYmlfZmxhZyhGMkZTX1NCKHNi
KSwgU0JJX1FVT1RBX05FRURfUkVQQUlSKTsKPiAgCQkJcmV0dXJuIFBUUl9FUlIocGFnZSk7Cj4g
IAkJfQo+Cj5AQCAtMjcyMSwxMCArMjcyNCwxNiBAQCBzdGF0aWMgc3NpemVfdCBmMmZzX3F1b3Rh
X3dyaXRlKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIGludCB0eXBlLAo+Cj4gIGludCBmMmZzX2Rx
dW90X2luaXRpYWxpemUoc3RydWN0IGlub2RlICppbm9kZSkKPiAgewo+KwlpbnQgcmV0Owo+Kwo+
ICAJaWYgKHRpbWVfdG9faW5qZWN0KEYyRlNfSV9TQihpbm9kZSksIEZBVUxUX0RRVU9UX0lOSVQp
KQo+ICAJCXJldHVybiAtRVNSQ0g7Cj4KPi0JcmV0dXJuIGRxdW90X2luaXRpYWxpemUoaW5vZGUp
Owo+KwlzZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklfSU5JVF9EUVVPVCk7Cj4rCXJldCA9IGRxdW90
X2luaXRpYWxpemUoaW5vZGUpOwo+KwljbGVhcl9pbm9kZV9mbGFnKGlub2RlLCBGSV9JTklUX0RR
VU9UKTsKPisKPisJcmV0dXJuIHJldDsKPiAgfQo+Cj4gIHN0YXRpYyBzdHJ1Y3QgZHF1b3QgX19y
Y3UgKipmMmZzX2dldF9kcXVvdHMoc3RydWN0IGlub2RlICppbm9kZSkKPkBAIC0zMDY0LDcgKzMw
NzMsNyBAQCBzdGF0aWMgaW50IGYyZnNfZHF1b3RfYWNxdWlyZShzdHJ1Y3QgZHF1b3QgKmRxdW90
KQo+Cj4gIAlmMmZzX2Rvd25fcmVhZCgmc2JpLT5xdW90YV9zZW0pOwo+ICAJcmV0ID0gZHF1b3Rf
YWNxdWlyZShkcXVvdCk7Cj4tCWlmIChyZXQgPCAwICYmIHJldCAhPSAtRUlOVFIpCj4rCWlmIChy
ZXQgPCAwKQo+ICAJCXNldF9zYmlfZmxhZyhzYmksIFNCSV9RVU9UQV9ORUVEX1JFUEFJUik7Cj4g
IAlmMmZzX3VwX3JlYWQoJnNiaS0+cXVvdGFfc2VtKTsKPiAgCXJldHVybiByZXQ7Cj4tLSAKPjIu
NDAuMQoKSGksIENoYW8KSWYgd2UgZG9udCd0IGlnbm9yZSAtRUlOVFIgaW4gZjJmc19kcXVvdF9h
Y3F1aXJlKCksIHdlIHdpbGwgc3RpbGwgc2V0IFNCSV9RVU9UQV9ORUVEX1JFUEFJUiBmbGFnCmlu
IGYyZnNfZHF1b3RfYWNxdWlyZSgpIGlmIGYyZnNfcXVvdGFfcmVhZCByZXR1cm4gLUVJTlRSLiBJ
IHRoaW5rIHdlIG5lZWQgbW9yZSBjYXNlcyBpbiBhZGRpdGlvbiB0byAKZHF1b3QgaW5pdGlhbGl6
aW5nIGFuZCBJIHdpbGwgY2hlY2sgaXQgYWdhaW4uClRoYW5rIHlvdSBmb3IgeW91ciBzdWdnZXN0
aW9uIQoKPj4gCj4+IFRoYW5rIHlvdSBmb3IgcmV2aWV3Lgo+PiAKPj4+Pgo+Pj4+IFNpZ25lZC1v
ZmYtYnk6IHdhbmd6aWppZSA8d2FuZ3ppamllMUBob25vci5jb20+Cj4+Pj4gLS0tCj4+Pj4gwqAg
ZnMvZjJmcy9pbm9kZS5jIHwgMyArKy0KPj4+PiDCoCBmcy9mMmZzL3N1cGVyLmMgfCA2ICsrKy0t
LQo+Pj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvaW5vZGUuYyBiL2ZzL2YyZnMvaW5vZGUu
Ywo+Pj4+IGluZGV4IGVkNjI5ZGFiYi4uMmFmOThlMmI3IDEwMDY0NAo+Pj4+IC0tLSBhL2ZzL2Yy
ZnMvaW5vZGUuYwo+Pj4+ICsrKyBiL2ZzL2YyZnMvaW5vZGUuYwo+Pj4+IEBAIC04MzcsOCArODM3
LDkgQEAgdm9pZCBmMmZzX2V2aWN0X2lub2RlKHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4+Pj4gwqDC
oMKgwqDCoCBlcnIgPSBmMmZzX2RxdW90X2luaXRpYWxpemUoaW5vZGUpOwo+Pj4+IMKgwqDCoMKg
wqAgaWYgKGVycikgewo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoZXJyICE9IC1FSU5UUikKPj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZXRfc2JpX2ZsYWcoc2JpLCBTQklfUVVPVEFfTkVF
RF9SRVBBSVIpOwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBlcnIgPSAwOwo+Pj4+IC3CoMKgwqDC
oMKgwqDCoCBzZXRfc2JpX2ZsYWcoc2JpLCBTQklfUVVPVEFfTkVFRF9SRVBBSVIpOwo+Pj4+IMKg
wqDCoMKgwqAgfQo+Pj4+IMKgwqDCoMKgwqAgZjJmc19yZW1vdmVfaW5vX2VudHJ5KHNiaSwgaW5v
ZGUtPmlfaW5vLCBBUFBFTkRfSU5PKTsKPj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zdXBlci5j
IGIvZnMvZjJmcy9zdXBlci5jCj4+Pj4gaW5kZXggMWYxYjM2NDdhLi5mOTlhMzZmZjMgMTAwNjQ0
Cj4+Pj4gLS0tIGEvZnMvZjJmcy9zdXBlci5jCj4+Pj4gKysrIGIvZnMvZjJmcy9zdXBlci5jCj4+
Pj4gQEAgLTI2NTAsOCArMjY1MCw4IEBAIHN0YXRpYyBzc2l6ZV90IGYyZnNfcXVvdGFfcmVhZChz
dHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBpbnQgdHlwZSwgY2hhciAqZGF0YSwKPj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoUFRSX0VSUihwYWdlKSA9PSAtRU5PTUVNKSB7Cj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZW1hbGxvY19yZXRyeV93YWl0KEdG
UF9OT0ZTKTsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gcmVw
ZWF0Owo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzZXRfc2JpX2ZsYWcoRjJGU19TQihzYiksIFNCSV9RVU9UQV9ORUVEX1JFUEFJUik7
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfSBlbHNlIGlmIChQVFJfRVJSKHBhZ2UpICE9
IC1FSU5UUikKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNldF9zYmlfZmxh
ZyhGMkZTX1NCKHNiKSwgU0JJX1FVT1RBX05FRURfUkVQQUlSKTsKPj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihwYWdlKTsKPj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgfQo+Pj4+IEBAIC0zMDcwLDcgKzMwNzAsNyBAQCBzdGF0aWMgaW50IGYyZnNfZHF1b3RfYWNx
dWlyZShzdHJ1Y3QgZHF1b3QgKmRxdW90KQo+Pj4+IMKgwqDCoMKgwqAgZjJmc19kb3duX3JlYWQo
JnNiaS0+cXVvdGFfc2VtKTsKPj4+PiDCoMKgwqDCoMKgIHJldCA9IGRxdW90X2FjcXVpcmUoZHF1
b3QpOwo+Pj4+IC3CoMKgwqAgaWYgKHJldCA8IDApCj4+Pj4gK8KgwqDCoCBpZiAocmV0IDwgMCAm
JiByZXQgIT0gLUVJTlRSKQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzZXRfc2JpX2ZsYWcoc2Jp
LCBTQklfUVVPVEFfTkVFRF9SRVBBSVIpOwo+Pj4+IMKgwqDCoMKgwqAgZjJmc191cF9yZWFkKCZz
YmktPnF1b3RhX3NlbSk7Cj4+Pj4gwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+PiAKPj4gCgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==
