Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 181A51CA4D1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 May 2020 09:09:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWx8V-0002PY-DH; Fri, 08 May 2020 07:09:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jWx8T-0002PG-E6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 07:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RI0iMG93snjuwPqNGFCsa6QH1CXf/vdrL6kx128HalU=; b=RaWnhoAqmoW1ldNHPoJ8m3fL69
 EOBpb0z3oKCuUh0dGB9rE6z1jqFOKPV+PtM+745Ptox2V4XZ7RfS9SpWiwRdbaBQ1Tpz1j8Zw/JNx
 HbyqCS4tt9a+l9C6qN2bTc3C3tw0Ekd+Jn727ABh4mwx6P2JuhEb3+s8MZz81CRvqwsE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RI0iMG93snjuwPqNGFCsa6QH1CXf/vdrL6kx128HalU=; b=Z4ZXVd1klaYIJzie3wmItS2mP7
 QWYJ9OqTxBNgiV6NzIhJyISpa8HijtLLwmtW9RMzgPnlR6F1m3oF3rBcJifX5a6BA8zafjcmsQksn
 gBX7i/Szo8Ktjs5+v/Q41v4/KQ3XT8iDEa/emXDNUlpSqSlJCJmRQWS/O2qbCC4eIhkM=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWx8Q-001OHN-OA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 07:09:28 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 5FCB6F3B03B25BE65E27;
 Fri,  8 May 2020 15:09:10 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 8 May 2020
 15:09:07 +0800
To: Daeho Jeong <daeho43@gmail.com>
References: <20200508042506.143395-1-daeho43@gmail.com>
 <4dfb73d9-03a0-bb2f-a112-1dd42db4d7bb@huawei.com>
 <CACOAw_z0BU3t7V+BN7TvaO96GckwNh2SRLreGxO60EDbMb_epw@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <cd08c824-c5d3-9603-7a81-a48cb191ac99@huawei.com>
Date: Fri, 8 May 2020 15:09:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACOAw_z0BU3t7V+BN7TvaO96GckwNh2SRLreGxO60EDbMb_epw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWx8Q-001OHN-OA
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove race condition in releasing
 cblocks
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC81LzggMTQ6NTgsIERhZWhvIEplb25nIHdyb3RlOgo+IEkgbW92ZWQgY2hlY2tpbmcg
aV9jb21wcl9ibG9ja3MgcGhyYXNlIGFmdGVyIGNhbGxpbmcgaW5vZGVfbG9jaygpCj4gYWxyZWFk
eSwgYmVjYXVzZSB3ZSBzaG91bGQgY2hlY2sgdGhpcyBhZnRlciB3cml0aW5nIHBhZ2VzLgo+IAo+
IFNvLCBpZiBpdCBmYWlscyB0byBjaGVjayBpX2NvbXByX2Jsb2Nrcywgd2UgbmVlZCB0byBjYWxs
IGlub2RlX3VubG9jaygpLgo+IAo+IEFtIEkgbWlzc2luZyBzb21ldGhpbmc/CgpBZnRlciBhcHBs
eWluZyB0aGlzIHBhdGNoLCBJIGdldCB0aGlzOgoKCXJldCA9IG1udF93YW50X3dyaXRlX2ZpbGUo
ZmlscCk7CglpZiAocmV0KQoJCXJldHVybiByZXQ7CgoJaWYgKCFGMkZTX0koaW5vZGUpLT5pX2Nv
bXByX2Jsb2NrcykKCQlnb3RvIG91dDsKCglmMmZzX2JhbGFuY2VfZnMoRjJGU19JX1NCKGlub2Rl
KSwgdHJ1ZSk7CgoJaW5vZGVfbG9jayhpbm9kZSk7Cgo+IAo+IDIwMjDrhYQgNeyblCA47J28ICjq
uIgpIOyYpO2bhCAzOjUwLCBDaGFvIFl1IDx5dWNoYW8wQGh1YXdlaS5jb20+64uY7J20IOyekeyE
sToKPj4KPj4gT24gMjAyMC81LzggMTI6MjUsIERhZWhvIEplb25nIHdyb3RlOgo+Pj4gRnJvbTog
RGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+Cj4+PiBOb3csIGlmIHdyaXRp
bmcgcGFnZXMgYW5kIHJlbGVhc2luZyBjb21wcmVzcyBibG9ja3Mgb2NjdXIKPj4+IHNpbXVsdGFu
ZW91c2x5LCBhbmQgcmVsZWFzaW5nIGNibG9ja3MgaXMgZXhlY3V0ZWQgbW9yZSB0aGFuIG9uZSB0
aW1lCj4+PiB0byBhIGZpbGUsIHRoZW4gdG90YWwgYmxvY2sgY291bnQgb2YgZmlsZXN5c3RlbSBh
bmQgYmxvY2sgY291bnQgb2YgdGhlCj4+PiBmaWxlIGNvdWxkIGJlIGluY29ycmVjdCBhbmQgZGFt
YWdlZC4KPj4+Cj4+PiBXZSBoYXZlIHRvIGV4ZWN1dGUgcmVsZWFzaW5nIGNvbXByZXNzIGJsb2Nr
cyBvbmx5IG9uZSB0aW1lIGZvciBhIGZpbGUKPj4+IHdpdGhvdXQgYmVpbmcgaW50ZXJmZXJlZCBi
eSB3cml0ZXBhZ2VzIHBhdGguCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRGFlaG8gSmVvbmcgPGRh
ZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+IC0tLQo+Pj4gIGZzL2YyZnMvZmlsZS5jIHwgMzEgKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNl
cnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2Zp
bGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4+PiBpbmRleCA0YWFiNGI0MmQ4YmEuLmE5MmJjNTFiOWIy
OCAxMDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4+PiArKysgYi9mcy9mMmZzL2ZpbGUu
Ywo+Pj4gQEAgLTM0ODgsNiArMzQ4OCw3IEBAIHN0YXRpYyBpbnQgZjJmc19yZWxlYXNlX2NvbXBy
ZXNzX2Jsb2NrcyhzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhcmcpCj4+PiAgICAg
ICBwZ29mZl90IHBhZ2VfaWR4ID0gMCwgbGFzdF9pZHg7Cj4+PiAgICAgICB1bnNpZ25lZCBpbnQg
cmVsZWFzZWRfYmxvY2tzID0gMDsKPj4+ICAgICAgIGludCByZXQ7Cj4+PiArICAgICBpbnQgd3Jp
dGVjb3VudDsKPj4+Cj4+PiAgICAgICBpZiAoIWYyZnNfc2JfaGFzX2NvbXByZXNzaW9uKEYyRlNf
SV9TQihpbm9kZSkpKQo+Pj4gICAgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4+Cj4+
IEJlZm9yZSBpbm9kZV9sb2NrKCksIHRoZXJlIGlzIG9uZSBjYXNlIHdlIG1heSBqdW1wIHRvIG91
dCBsYWJlbCwgaW4KPj4gdGhpcyBjYXNlLCB3ZSBtYXkgdW5sb2NrIGlub2RlIGluY29ycmVjdGx5
Lgo+Pgo+PiAgICAgICAgIGlmICghRjJGU19JKGlub2RlKS0+aV9jb21wcl9ibG9ja3MpCj4+ICAg
ICAgICAgICAgICAgICBnb3RvIG91dDsKPj4KPj4+IC0KPj4+IC0gICAgIGlub2RlX3VubG9jayhp
bm9kZSk7Cj4+PiAgb3V0Ogo+Pj4gKyAgICAgaW5vZGVfdW5sb2NrKGlub2RlKTsKPj4+ICsKPj4+
ICAgICAgIG1udF9kcm9wX3dyaXRlX2ZpbGUoZmlscCk7Cj4+Cj4+IFRoYW5rcywKPiAuCj4gCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=
