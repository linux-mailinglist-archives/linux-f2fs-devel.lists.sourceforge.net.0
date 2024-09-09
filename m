Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABD9970CA1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Sep 2024 06:06:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1snVfI-0005Ht-Q5;
	Mon, 09 Sep 2024 04:06:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1snVfG-0005Hb-Oi
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 04:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+HfTzqB1sJp41De69fIVEsFATov1AgNAVQz6jgK3b8c=; b=EMoXL+4Ui+HO0vyHQ3aEDxu686
 T7R0bmYzdFzSc9442c/z00E2+cqzr1a6ggL+DIht1BwLm6/JTXT7tcZxtppp0Pa19+Z6RrSnNU5G2
 YiB66VxgcqHZkt5b+icpmF/G7ViszWoFna7MaBSjw7g3Kz46McIw9r4byk/agXHlm0zk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+HfTzqB1sJp41De69fIVEsFATov1AgNAVQz6jgK3b8c=; b=nNlzLxHsQZXMsDJMmzY+k64zB5
 GjOqqILfJnZ0kJ5Mbe/cdKbJwR2s72IILW5boOekVS6ChwPtzD2In2un5J2zflD612xKlTa+62HuU
 zZDZot4Ymhhbi20s0PzYCNcuxowbOHEgvtPvKT/RalnbrPJAeZykIdpD+AnNRszrXmcw=;
Received: from mta22.honor.com ([81.70.192.198] helo=mta22.hihonor.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1snVfE-0004vA-HA for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 04:06:10 +0000
Received: from w001.hihonor.com (unknown [10.68.25.235])
 by mta22.hihonor.com (SkyGuard) with ESMTPS id 4X2CrC45zMzYl1Gx;
 Mon,  9 Sep 2024 12:03:55 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w001.hihonor.com
 (10.68.25.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Sep
 2024 12:06:00 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Sep
 2024 12:06:00 +0800
From: wangzijie <wangzijie1@honor.com>
To: <chao@kernel.org>
Date: Mon, 9 Sep 2024 12:06:00 +0800
Message-ID: <20240909040600.2371098-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <55f6fdba-f505-4557-8074-6bfa942c275d@kernel.org>
References: <55f6fdba-f505-4557-8074-6bfa942c275d@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w002.hihonor.com (10.68.28.120) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On 2024/9/8 12:12, wangzijie wrote: >>>> From: Chao Yu via
 Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net> >>>> >>>>> On
 2024/8/27
 14:22, wangzijie wrote: >>>>>> Thread A >>>>>> -dquot_init [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [81.70.192.198 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1snVfE-0004vA-HA
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

Pk9uIDIwMjQvOS84IDEyOjEyLCB3YW5nemlqaWUgd3JvdGU6Cj4+Pj4gRnJvbTogQ2hhbyBZdSB2
aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQ+Cj4+Pj4KPj4+Pj4gT24gMjAyNC84LzI3IDE0OjIyLCB3YW5nemlqaWUgd3JvdGU6Cj4+Pj4+
PiBUaHJlYWQgQQo+Pj4+Pj4gLWRxdW90X2luaXRpYWxpemUKPj4+Pj4+ICDCoCAtZHFnZXQKPj4+
Pj4+ICDCoMKgIC1mMmZzX2RxdW90X2FjcXVpcmUKPj4+Pj4+ICDCoMKgwqAgLXYyX3JlYWRfZHF1
b3QKPj4+Pj4+ICDCoMKgwqDCoCAtcXRyZWVfcmVhZF9kcXVvdAo+Pj4+Pj4gIMKgwqDCoMKgwqAg
LWZpbmRfdHJlZV9kcWVudHJ5Cj4+Pj4+PiAgwqDCoMKgwqDCoMKgIC1mMmZzX3F1b3RhX3JlYWQK
Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoCAtcmVhZF9jYWNoZV9wYWdlX2dmcAo+Pj4+Pj4gIMKgwqDC
oMKgwqDCoMKgwqAgLWRvX3JlYWRfY2FjaGVfZm9saW8KPj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKg
wqAgLWZpZW1hcF9yZWFkX2ZvbGlvCj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLWZvbGlv
X3dhaXRfbG9ja2VkX2tpbGxhYmxlCj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtcmVj
ZWl2ZSBTSUdLSUxMIDogcmV0dXJuIC1FSU5UUgo+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgIC1zZXQg
U0JJX1FVT1RBX05FRURfUkVQQUlSCj4+Pj4+PiAgwqDCoMKgIC1zZXQgU0JJX1FVT1RBX05FRURf
UkVQQUlSCj4+Pj4+Pgo+Pj4+Pj4gV2hlbiBjYWxsaW5nIHJlYWRfY2FjaGVfcGFnZV9nZnAgaW4g
cXVvdGEgcmVhZCwgdGhyZWFkIG1heSByZWNlaXZlIFNJR0tJTEwgYW5kCj4+Pj4+PiBzZXQgU0JJ
X1FVT1RBX05FRURfUkVQQUlSLCBzaG91bGQgd2Ugc2V0IFNCSV9RVU9UQV9ORUVEX1JFUEFJUiBp
biB0aGlzIGVycm9yIHBhdGg/Cj4+Pj4+Cj4+Pj4+IGYyZnNfcXVvdGFfcmVhZCgpIGNhbiBiZSBj
YWxsZWQgaW4gYSBsb3Qgb2YgY29udGV4dHMsIGNhbiB3ZSBqdXN0IGlnbm9yZSAtRUlOVFIKPj4+
Pj4gZm9yIGYyZnNfZHF1b3RfaW5pdGlhbGl6ZSgpIGNhc2U/Cj4+Pj4+Cj4+Pj4+IFRoYW5rcywK
Pj4+Pgo+Pj4+IFllcywgaW4gbWFueSBjb250ZXh0cyBmMmZzX3F1b3RhX3JlYWQoKSBjYW4gYmUg
Y2FsbGVkIGFuZCBtYXkgcmV0dXJuIC1FSU5UUiwgd2UgbmVlZCB0byBpZ25vcmUgdGhpcyBlcnJu
byBmb3IgbW9yZSBjYXNlcy4gSWYgd2UgbmVlZCB0byBkbyBzbywgSSB3aWxsIGNoZWNrIGl0IGFu
ZCByZXNlbmQgcGF0Y2guCj4+Pj4gT3IgZG8geW91IGhhdmUgb3RoZXIgc3VnZ2VzdGlvbnMgdG8g
YXZvaWQgdW5uZWNlc3NhcnkgU0JJX1FVT1RBX05FRURfUkVQQUlSIGZsYWcgc2V0Pwo+Pj4KPj4+
IEhvdyBhYm91dCB0aGlzPwo+Pj4KPj4+IC0tLQo+Pj4gICBmcy9mMmZzL2YyZnMuaCAgfCAgMSAr
Cj4+PiAgIGZzL2YyZnMvaW5vZGUuYyB8ICAzICstLQo+Pj4gICBmcy9mMmZzL3N1cGVyLmMgfCAx
NyArKysrKysrKysrKysrLS0tLQo+Pj4gICAzIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIv
ZnMvZjJmcy9mMmZzLmgKPj4+IGluZGV4IGRmZWQxOTc0ZWRhNS4uYTE3MDRhMTlkZmU5IDEwMDY0
NAo+Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPj4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4+PiBA
QCAtODEwLDYgKzgxMCw3IEBAIGVudW0gewo+Pj4gICAJRklfQVRPTUlDX0RJUlRJRUQsCS8qIGlu
ZGljYXRlIGF0b21pYyBmaWxlIGlzIGRpcnRpZWQgKi8KPj4+ICAgCUZJX0FUT01JQ19SRVBMQUNF
LAkvKiBpbmRpY2F0ZSBhdG9taWMgcmVwbGFjZSAqLwo+Pj4gICAJRklfT1BFTkVEX0ZJTEUsCQkv
KiBpbmRpY2F0ZSBmaWxlIGhhcyBiZWVuIG9wZW5lZCAqLwo+Pj4gKwlGSV9JTklUX0RRVU9ULAkJ
LyogaW5kaWNhdGUgaXQncyBpbml0aWFsaXppbmcgZHF1b3QgKi8KPj4+ICAgCUZJX01BWCwJCQkv
KiBtYXggZmxhZywgbmV2ZXIgYmUgdXNlZCAqLwo+Pj4gICB9Owo+Pj4KPj4+IGRpZmYgLS1naXQg
YS9mcy9mMmZzL2lub2RlLmMgYi9mcy9mMmZzL2lub2RlLmMKPj4+IGluZGV4IDAwOGYwMTM0OGFm
YS4uYjFkYmFlZGEzMDZmIDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9pbm9kZS5jCj4+PiArKysg
Yi9mcy9mMmZzL2lub2RlLmMKPj4+IEBAIC04MjcsOCArODI3LDcgQEAgdm9pZCBmMmZzX2V2aWN0
X2lub2RlKHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4+Pgo+Pj4gICAJZXJyID0gZjJmc19kcXVvdF9p
bml0aWFsaXplKGlub2RlKTsKPj4+ICAgCWlmIChlcnIpIHsKPj4+IC0JCWlmIChlcnIgIT0gLUVJ
TlRSKQo+Pj4gLQkJCXNldF9zYmlfZmxhZyhzYmksIFNCSV9RVU9UQV9ORUVEX1JFUEFJUik7Cj4+
PiArCQlzZXRfc2JpX2ZsYWcoc2JpLCBTQklfUVVPVEFfTkVFRF9SRVBBSVIpOwo+Pj4gICAJCWVy
ciA9IDA7Cj4+PiAgIAl9Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3VwZXIuYyBiL2Zz
L2YyZnMvc3VwZXIuYwo+Pj4gaW5kZXggOGUyOWFiYTRiN2E0Li5lNzc0YmRmODc1YjIgMTAwNjQ0
Cj4+PiAtLS0gYS9mcy9mMmZzL3N1cGVyLmMKPj4+ICsrKyBiL2ZzL2YyZnMvc3VwZXIuYwo+Pj4g
QEAgLTI2NDQsOCArMjY0NCwxMSBAQCBzdGF0aWMgc3NpemVfdCBmMmZzX3F1b3RhX3JlYWQoc3Ry
dWN0IHN1cGVyX2Jsb2NrICpzYiwgaW50IHR5cGUsIGNoYXIgKmRhdGEsCj4+PiAgIAkJCWlmIChQ
VFJfRVJSKHBhZ2UpID09IC1FTk9NRU0pIHsKPj4+ICAgCQkJCW1lbWFsbG9jX3JldHJ5X3dhaXQo
R0ZQX05PRlMpOwo+Pj4gICAJCQkJZ290byByZXBlYXQ7Cj4+PiAtCQkJfSBlbHNlIGlmIChQVFJf
RVJSKHBhZ2UpICE9IC1FSU5UUikKPj4+IC0JCQkJc2V0X3NiaV9mbGFnKEYyRlNfU0Ioc2IpLCBT
QklfUVVPVEFfTkVFRF9SRVBBSVIpOwo+Pj4gKwkJCX0gZWxzZSBpZiAoUFRSX0VSUihwYWdlKSA9
PSAtRUlOVFIgJiYKPj4+ICsJCQkJaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0lOSVRfRFFV
T1QpKSB7Cj4+PiArCQkJCXJldHVybiBQVFJfRVJSKHBhZ2UpOwo+Pj4gKwkJCX0KPj4+ICsJCQlz
ZXRfc2JpX2ZsYWcoRjJGU19TQihzYiksIFNCSV9RVU9UQV9ORUVEX1JFUEFJUik7Cj4+PiAgIAkJ
CXJldHVybiBQVFJfRVJSKHBhZ2UpOwo+Pj4gICAJCX0KPj4+Cj4+PiBAQCAtMjcyMSwxMCArMjcy
NCwxNiBAQCBzdGF0aWMgc3NpemVfdCBmMmZzX3F1b3RhX3dyaXRlKHN0cnVjdCBzdXBlcl9ibG9j
ayAqc2IsIGludCB0eXBlLAo+Pj4KPj4+ICAgaW50IGYyZnNfZHF1b3RfaW5pdGlhbGl6ZShzdHJ1
Y3QgaW5vZGUgKmlub2RlKQo+Pj4gICB7Cj4+PiArCWludCByZXQ7Cj4+PiArCj4+PiAgIAlpZiAo
dGltZV90b19pbmplY3QoRjJGU19JX1NCKGlub2RlKSwgRkFVTFRfRFFVT1RfSU5JVCkpCj4+PiAg
IAkJcmV0dXJuIC1FU1JDSDsKPj4+Cj4+PiAtCXJldHVybiBkcXVvdF9pbml0aWFsaXplKGlub2Rl
KTsKPj4+ICsJc2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX0lOSVRfRFFVT1QpOwo+Pj4gKwlyZXQg
PSBkcXVvdF9pbml0aWFsaXplKGlub2RlKTsKPj4+ICsJY2xlYXJfaW5vZGVfZmxhZyhpbm9kZSwg
RklfSU5JVF9EUVVPVCk7Cj4+PiArCj4+PiArCXJldHVybiByZXQ7Cj4+PiAgIH0KPj4+Cj4+PiAg
IHN0YXRpYyBzdHJ1Y3QgZHF1b3QgX19yY3UgKipmMmZzX2dldF9kcXVvdHMoc3RydWN0IGlub2Rl
ICppbm9kZSkKPj4+IEBAIC0zMDY0LDcgKzMwNzMsNyBAQCBzdGF0aWMgaW50IGYyZnNfZHF1b3Rf
YWNxdWlyZShzdHJ1Y3QgZHF1b3QgKmRxdW90KQo+Pj4KPj4+ICAgCWYyZnNfZG93bl9yZWFkKCZz
YmktPnF1b3RhX3NlbSk7Cj4+PiAgIAlyZXQgPSBkcXVvdF9hY3F1aXJlKGRxdW90KTsKPj4+IC0J
aWYgKHJldCA8IDAgJiYgcmV0ICE9IC1FSU5UUikKPj4+ICsJaWYgKHJldCA8IDApCj4+PiAgIAkJ
c2V0X3NiaV9mbGFnKHNiaSwgU0JJX1FVT1RBX05FRURfUkVQQUlSKTsKPj4+ICAgCWYyZnNfdXBf
cmVhZCgmc2JpLT5xdW90YV9zZW0pOwo+Pj4gICAJcmV0dXJuIHJldDsKPj4+IC0tIAo+Pj4gMi40
MC4xCj4+IAo+PiBIaSwgQ2hhbwo+PiBJZiB3ZSBkb250J3QgaWdub3JlIC1FSU5UUiBpbiBmMmZz
X2RxdW90X2FjcXVpcmUoKSwgd2Ugd2lsbCBzdGlsbCBzZXQgU0JJX1FVT1RBX05FRURfUkVQQUlS
IGZsYWcKPj4gaW4gZjJmc19kcXVvdF9hY3F1aXJlKCkgaWYgZjJmc19xdW90YV9yZWFkIHJldHVy
biAtRUlOVFIuIEkgdGhpbmsgd2UgbmVlZCBtb3JlIGNhc2VzIGluIGFkZGl0aW9uIHRvCj4+IGRx
dW90IGluaXRpYWxpemluZyBhbmQgSSB3aWxsIGNoZWNrIGl0IGFnYWluLgo+Cj5NYXliZSB3ZSBj
YW4gY292ZXIgdGhpcyBjYXNlIHcvIGJlbG93IGRpZmY/Cj4KPi0tLQo+ICBmcy9mMmZzL3N1cGVy
LmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4KPmRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPmlu
ZGV4IGU3NzRiZGY4NzViMi4uN2ZjOTcwMTIxYTNmIDEwMDY0NAo+LS0tIGEvZnMvZjJmcy9zdXBl
ci5jCj4rKysgYi9mcy9mMmZzL3N1cGVyLmMKPkBAIC0zMDczLDcgKzMwNzMsOCBAQCBzdGF0aWMg
aW50IGYyZnNfZHF1b3RfYWNxdWlyZShzdHJ1Y3QgZHF1b3QgKmRxdW90KQo+Cj4gIAlmMmZzX2Rv
d25fcmVhZCgmc2JpLT5xdW90YV9zZW0pOwo+ICAJcmV0ID0gZHF1b3RfYWNxdWlyZShkcXVvdCk7
Cj4tCWlmIChyZXQgPCAwKQo+KwlpZiAocmV0IDwgMCAmJgo+KwkJKHJldCAhPSAtRUlOVFIgfHwg
IWlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9JTklUX0RRVU9UKSkpCj4gIAkJc2V0X3NiaV9m
bGFnKHNiaSwgU0JJX1FVT1RBX05FRURfUkVQQUlSKTsKPiAgCWYyZnNfdXBfcmVhZCgmc2JpLT5x
dW90YV9zZW0pOwo+ICAJcmV0dXJuIHJldDsKPi0tIAo+Mi40MC4xCj4KPlRoYW5rcywKClllcywg
SSB0aGluayBpdCBjYW4gY292ZXIgaW5pdGlhbGl6aW5nIGRxdW90IGNhc2UuCgo+Cj4+IFRoYW5r
IHlvdSBmb3IgeW91ciBzdWdnZXN0aW9uIQo+PiAKPj4+Pgo+Pj4+IFRoYW5rIHlvdSBmb3IgcmV2
aWV3Lgo+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogd2FuZ3ppamllIDx3YW5nemlq
aWUxQGhvbm9yLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gIMKgIGZzL2YyZnMvaW5vZGUuYyB8IDMg
KystCj4+Pj4+PiAgwqAgZnMvZjJmcy9zdXBlci5jIHwgNiArKystLS0KPj4+Pj4+ICDCoCAyIGZp
bGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4+Pj4+Cj4+Pj4+
PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9pbm9kZS5jIGIvZnMvZjJmcy9pbm9kZS5jCj4+Pj4+PiBp
bmRleCBlZDYyOWRhYmIuLjJhZjk4ZTJiNyAxMDA2NDQKPj4+Pj4+IC0tLSBhL2ZzL2YyZnMvaW5v
ZGUuYwo+Pj4+Pj4gKysrIGIvZnMvZjJmcy9pbm9kZS5jCj4+Pj4+PiBAQCAtODM3LDggKzgzNyw5
IEBAIHZvaWQgZjJmc19ldmljdF9pbm9kZShzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+Pj4+Pj4gIMKg
wqDCoMKgwqAgZXJyID0gZjJmc19kcXVvdF9pbml0aWFsaXplKGlub2RlKTsKPj4+Pj4+ICDCoMKg
wqDCoMKgIGlmIChlcnIpIHsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoZXJyICE9IC1FSU5U
UikKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNldF9zYmlfZmxhZyhzYmksIFNCSV9R
VU9UQV9ORUVEX1JFUEFJUik7Cj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGVyciA9IDA7Cj4+
Pj4+PiAtwqDCoMKgwqDCoMKgwqAgc2V0X3NiaV9mbGFnKHNiaSwgU0JJX1FVT1RBX05FRURfUkVQ
QUlSKTsKPj4+Pj4+ICDCoMKgwqDCoMKgIH0KPj4+Pj4+ICDCoMKgwqDCoMKgIGYyZnNfcmVtb3Zl
X2lub19lbnRyeShzYmksIGlub2RlLT5pX2lubywgQVBQRU5EX0lOTyk7Cj4+Pj4+PiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCj4+Pj4+PiBpbmRleCAxZjFi
MzY0N2EuLmY5OWEzNmZmMyAxMDA2NDQKPj4+Pj4+IC0tLSBhL2ZzL2YyZnMvc3VwZXIuYwo+Pj4+
Pj4gKysrIGIvZnMvZjJmcy9zdXBlci5jCj4+Pj4+PiBAQCAtMjY1MCw4ICsyNjUwLDggQEAgc3Rh
dGljIHNzaXplX3QgZjJmc19xdW90YV9yZWFkKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIGludCB0
eXBlLCBjaGFyICpkYXRhLAo+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChQ
VFJfRVJSKHBhZ2UpID09IC1FTk9NRU0pIHsKPj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG1lbWFsbG9jX3JldHJ5X3dhaXQoR0ZQX05PRlMpOwo+Pj4+Pj4gIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byByZXBlYXQ7Cj4+Pj4+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZXRfc2Jp
X2ZsYWcoRjJGU19TQihzYiksIFNCSV9RVU9UQV9ORUVEX1JFUEFJUik7Cj4+Pj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB9IGVsc2UgaWYgKFBUUl9FUlIocGFnZSkgIT0gLUVJTlRSKQo+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZXRfc2JpX2ZsYWcoRjJGU19TQihz
YiksIFNCSV9RVU9UQV9ORUVEX1JFUEFJUik7Cj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIFBUUl9FUlIocGFnZSk7Cj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIH0K
Pj4+Pj4+IEBAIC0zMDcwLDcgKzMwNzAsNyBAQCBzdGF0aWMgaW50IGYyZnNfZHF1b3RfYWNxdWly
ZShzdHJ1Y3QgZHF1b3QgKmRxdW90KQo+Pj4+Pj4gIMKgwqDCoMKgwqAgZjJmc19kb3duX3JlYWQo
JnNiaS0+cXVvdGFfc2VtKTsKPj4+Pj4+ICDCoMKgwqDCoMKgIHJldCA9IGRxdW90X2FjcXVpcmUo
ZHF1b3QpOwo+Pj4+Pj4gLcKgwqDCoCBpZiAocmV0IDwgMCkKPj4+Pj4+ICvCoMKgwqAgaWYgKHJl
dCA8IDAgJiYgcmV0ICE9IC1FSU5UUikKPj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgc2V0X3Ni
aV9mbGFnKHNiaSwgU0JJX1FVT1RBX05FRURfUkVQQUlSKTsKPj4+Pj4+ICDCoMKgwqDCoMKgIGYy
ZnNfdXBfcmVhZCgmc2JpLT5xdW90YV9zZW0pOwo+Pj4+Pj4gIMKgwqDCoMKgwqAgcmV0dXJuIHJl
dDsKPj4+Pgo+Pj4+Cj4+IAo+PiAKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
