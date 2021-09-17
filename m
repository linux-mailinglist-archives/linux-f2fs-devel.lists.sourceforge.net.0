Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE0E40F89D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Sep 2021 14:59:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mRDT1-0002aj-L2; Fri, 17 Sep 2021 12:59:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mRDSz-0002aZ-St
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Sep 2021 12:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eJBtgTqfALRWUhloMkMv12M1vxJPHjKE2FTJK7WfyGY=; b=DGHseoJzsFOLgGfE2uz0V82f7M
 G8eyGD5TAngldthrV+3MXjuC5GYsja5/bFtTSbL/OST90S9seJSzuXaLWDrUhbWRFBwX7g4O5F7DT
 +kzWAaYJ7LnmNQ4b1K1jCrAoiWOU3yb6PLnT5g3RvyCPL7kxNBB5Xmzk6NtjO12NtzQA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eJBtgTqfALRWUhloMkMv12M1vxJPHjKE2FTJK7WfyGY=; b=HSnqUmwpeY5KfgpVEjScoZfjD/
 orjpVpziKtsDPhdhWey2dQrt5zqcJWlvDeIYOKxzBK/66n43vpvtw4zlGzOLh4yu/cJl+9p3yBKQZ
 C9UERoboLGWRyOybiGbK/cdVMhYX4FtpLMFqaIKPeIdv02dHfq1/FaRmuLIE3BGM9tlI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mRDSz-00DnmJ-7P
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Sep 2021 12:59:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 319B9610C7;
 Fri, 17 Sep 2021 12:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631883574;
 bh=susjoBcYClWiOo5O9rQnkfYXsZhJWRwQzy/TTMrcVrI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=PmwlLz2JeRpmEkU+a5I3nPORR1LjrWE24qdzJGPxzVinHT3BzsJq3SY4JkoprOQb0
 J+02jng1bH5FapkJb6zUxVXkCx1uXozjDqaQNzjHGuH5ZWhnHWHvX8SXMkLx30Zzgy
 aWrSlz/pM4SwMpVEybVXCsP623zRNSkfYAXWTPyUeJXZ08M1+MeH/Luzw4wM/2fvxm
 IK2RxrdPvlKa0YYFZhVCLoQnX1ayMbN2q3wrBmv17AWdVJmCUey5T91CPfbHmNR8lR
 dCt2JfTMszre39bYws5bc2C04MzvnnSLL2WHlVJ94aoxb+jx2NJOoPBBn/PW85wzMT
 4CYn19TIBpfqg==
To: =?UTF-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20210916113026.378385-1-changfengnan@vivo.com>
 <20210916113026.378385-2-changfengnan@vivo.com>
 <AFQA*QDoEjqpHYJlWwMYT4qj.9.1631794201010.Hmail.changfengnan@vivo.com>
 <KL1PR0601MB400388BC823D5FD0558D43D2BBDC9@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <KL1PR0601MB40030D121F65550D690A776DBBDD9@KL1PR0601MB4003.apcprd06.prod.outlook.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <2acea857-c3e7-902a-a016-bcd5aeedc407@kernel.org>
Date: Fri, 17 Sep 2021 20:59:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <KL1PR0601MB40030D121F65550D690A776DBBDD9@KL1PR0601MB4003.apcprd06.prod.outlook.com>
Content-Language: en-US
X-Spam-Score: -7.1 (-------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2021/9/17 18:19, 常凤楠 wrote: > > >> 
 
 Content analysis details:   (-7.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -1.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mRDSz-00DnmJ-7P
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: fix missing inplace count in
 overwrite with direct io
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS85LzE3IDE4OjE5LCDluLjlh6TmpaAgd3JvdGU6Cj4gCj4gCj4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IOW4uOWHpOaloAo+PiBTZW50OiBUaHVyc2RheSwgU2Vw
dGVtYmVyIDE2LCAyMDIxIDg6NDYgUE0KPj4gVG86IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz47
IGphZWdldWtAa2VybmVsLm9yZwo+PiBDYzogbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKPj4gU3ViamVjdDogUkU6IFtQQVRDSCB2MiAyLzJdIGYyZnM6IGZpeCBtaXNzaW5n
IGlucGxhY2UgY291bnQgaW4gb3ZlcndyaXRlIHdpdGgKPj4gZGlyZWN0IGlvCj4+Cj4+Cj4+Cj4+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+Pj4gRnJvbTogY2hhbmdmZW5nbmFuQHZpdm8u
Y29tIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+IE9uIEJlaGFsZiBPZgo+PiBDaGFvCj4+PiBZdQo+
Pj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAxNiwgMjAyMSA4OjEwIFBNCj4+PiBUbzog5bi4
5Yek5qWgIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+OyBqYWVnZXVrQGtlcm5lbC5vcmcKPj4+IENj
OiBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2MiAyLzJdIGYyZnM6IGZpeCBtaXNzaW5nIGlucGxhY2UgY291bnQgaW4KPj4+IG92
ZXJ3cml0ZSB3aXRoIGRpcmVjdCBpbwo+Pj4KPj4+IE9uIDIwMjEvOS8xNiAxOTozMCwgRmVuZ25h
biBDaGFuZyB3cm90ZToKPj4+PiBGb3Igbm93LCBvdmVyd3JpdGUgZmlsZSB3aXRoIGRpcmVjdCBp
byB1c2UgaW5wbGFjZSBwb2xpY3ksIGJ1dCBub3QKPj4+PiBjb3VudGVkLCBmaXggaXQuIEFuZCB1
c2Ugc3RhdF9hZGRfaW5wbGFjZV9ibG9ja3Moc2JpLCAxLCApIGluc3RlYWQKPj4+PiBvZiBzdGF0
X2luY19pbnBsYWNlX2Jsb2NrcyhzYiwgKS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEZlbmdu
YW4gQ2hhbmcgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT4KPj4+PiAtLS0KPj4+PiAgICBmcy9mMmZz
L2RhdGEuYyAgICB8IDcgKysrKysrLQo+Pj4+ICAgIGZzL2YyZnMvZjJmcy5oICAgIHwgOCArKysr
LS0tLQo+Pj4+ICAgIGZzL2YyZnMvc2VnbWVudC5jIHwgMiArLQo+Pj4+ICAgIDMgZmlsZXMgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1n
aXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jIGluZGV4Cj4+Pj4gYzE0OTBiOWEx
MzQ1Li4wYzU3MjhkNjNjMzMgMTAwNjQ0Cj4+Pj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPj4+PiAr
KysgYi9mcy9mMmZzL2RhdGEuYwo+Pj4+IEBAIC0xNDkxLDYgKzE0OTEsOSBAQCBpbnQgZjJmc19t
YXBfYmxvY2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4+Pj4gc3RydWN0Cj4+PiBmMmZzX21hcF9i
bG9ja3MgKm1hcCwKPj4+PiAgICAJCWlmIChmbGFnID09IEYyRlNfR0VUX0JMT0NLX0RJTykKPj4+
PiAgICAJCQlmMmZzX3dhaXRfb25fYmxvY2tfd3JpdGViYWNrX3JhbmdlKGlub2RlLAo+Pj4+ICAg
IAkJCQkJCW1hcC0+bV9wYmxrLCBtYXAtPm1fbGVuKTsKPj4+PiArCQlpZiAoIWYyZnNfbGZzX21v
ZGUoc2JpKSAmJiBmbGFnID09IEYyRlNfR0VUX0JMT0NLX0RJTyAmJgo+Pj4+ICsJCQkJbWFwLT5t
X21heV9jcmVhdGUpCj4+Pj4gKwkJCXN0YXRfYWRkX2lucGxhY2VfYmxvY2tzKHNiaSwgbWFwLT5t
X2xlbiwgdHJ1ZSk7Cj4+Pj4gICAgCQlnb3RvIG91dDsKPj4+PiAgICAJfQo+Pj4+Cj4+Pj4gQEAg
LTE1NTMsNyArMTU1Niw5IEBAIGludCBmMmZzX21hcF9ibG9ja3Moc3RydWN0IGlub2RlICppbm9k
ZSwKPj4+PiBzdHJ1Y3QKPj4+IGYyZnNfbWFwX2Jsb2NrcyAqbWFwLAo+Pj4+ICAgIAkJCQlnb3Rv
IHN5bmNfb3V0Owo+Pj4+ICAgIAkJCWJsa2FkZHIgPSBkbi5kYXRhX2Jsa2FkZHI7Cj4+Pj4gICAg
CQkJc2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FQUEVORF9XUklURSk7Cj4+Pj4gLQkJfQo+Pj4+
ICsJCX0gZWxzZSBpZiAoIWNyZWF0ZSAmJiAhZjJmc19sZnNfbW9kZShzYmkpICYmIGZsYWcgPT0K
Pj4+IEYyRlNfR0VUX0JMT0NLX0RJTyAmJgo+Pj4+ICsJCQkJbWFwLT5tX21heV9jcmVhdGUpCj4+
Pgo+Pj4gV2h5IG5vdAo+Pj4KPj4+IH0gZWxzZSBpZiB7IWYyZnNfbGZzX21vZGUoc2JpKSAmJiBm
bGFnID09IEYyRlNfR0VUX0JMT0NLX0RJTyAmJgo+Pj4gCQkJCQltYXAtPm1fbWF5X2NyZWF0ZSkK
Pj4+Cj4+Cj4+IFlvdSBhcmUgcmlnaHQsIG5vIG5lZWQgdG8gY2hlY2sgY3JlYXRlIC4KPj4KPiBU
aGVyZSBpcyBhIHByb2JsZW0gaGVyZSwgaWYgcmVtb3ZlIGNyZWF0ZSBjaGVjaywgd2hlbiBjcmVh
dGUgZmlsZSBhbmQgd3JpdGUgd2l0aCBkaXJlY3QgaW8sCj4gSXQgd2lsbCBjb3VudCBpbiBMRlMg
YW5kIElQVSBib3RoLCBiZWNhdXNlIHByZWFsbG9jYXRlIGJsb2NrIGFkZHIgZmlyc3QuIFNvLCBX
ZSBzdGlsbCBuZWVkIGNoZWNrCj4gY3JlYXRlLgo+IEFtIEkgcmlnaHQ/CgpDb3VsZCB5b3UgcGxl
YXNlIGNoZWNrIGJlbG93IGNhc2Ugdy8geW91ciBvcmlnaW5hbCBwYXRjaDoKCnhmc19pbyAtZiBm
aWxlIC1jICJwd3JpdGUgMCA4ayIgLWMgImZzeW5jIgp4ZnNfaW8gZmlsZSAtYyAiZnB1bmNoIDAg
NGsiCnhmc19pbyAgLWMgIm9wZW4gLWQgZmlsZSIgLWMgInB3cml0ZSAtYiA0ayAwIDhrIgoKSXQg
YWNjb3VudHMgb24gYm90aCBJUFUgYW5kIExGUyBzdGF0cy4KClRoYW5rcywKCj4gCj4gVGhhbmtz
Lgo+IAo+PiBUaGFua3MuCj4+PiBUaGFua3MsCj4+Pgo+Pj4+ICsJCQlzdGF0X2FkZF9pbnBsYWNl
X2Jsb2NrcyhzYmksIDEsIHRydWUpOwo+Pj4+ICAgIAl9IGVsc2Ugewo+Pj4+ICAgIAkJaWYgKGNy
ZWF0ZSkgewo+Pj4+ICAgIAkJCWlmICh1bmxpa2VseShmMmZzX2NwX2Vycm9yKHNiaSkpKSB7IGRp
ZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaAo+Pj4+IGIvZnMvZjJmcy9mMmZzLmggaW5kZXggM2Q0
ZWU0NDRkYjI3Li4yZDgxZTlmMGEwZWUgMTAwNjQ0Cj4+Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgK
Pj4+PiArKysgYi9mcy9mMmZzL2YyZnMuaAo+Pj4+IEBAIC0zNzg1LDEyICszNzg1LDEyIEBAIHN0
YXRpYyBpbmxpbmUgc3RydWN0IGYyZnNfc3RhdF9pbmZvCj4+PiAqRjJGU19TVEFUKHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSkKPj4+PiAgICAJCWVsc2UJCQkJCQkJCVwKPj4+PiAgICAJCQkoKHNi
aSktPmJsb2NrX2NvdW50WzFdWyhjdXJzZWcpLT5hbGxvY190eXBlXSsrKTsJXAo+Pj4+ICAgIAl9
IHdoaWxlICgwKQo+Pj4+IC0jZGVmaW5lIHN0YXRfaW5jX2lucGxhY2VfYmxvY2tzKHNiaSwgZGly
ZWN0X2lvKQkJCQkJXAo+Pj4+ICsjZGVmaW5lIHN0YXRfYWRkX2lucGxhY2VfYmxvY2tzKHNiaSwg
Y291bnQsIGRpcmVjdF9pbykJCQlcCj4+Pj4gICAgCWRvIHsJCQkJCQkJCVwKPj4+PiAgICAJCWlm
IChkaXJlY3RfaW8pCQkJCQkJXAo+Pj4+IC0JCQkoYXRvbWljX2luYygmKHNiaSktPmlucGxhY2Vf
Y291bnRbMF0pKTsJCVwKPj4+PiArCQkJKGF0b21pY19hZGQoY291bnQsICYoc2JpKS0+aW5wbGFj
ZV9jb3VudFswXSkpOyAgXAo+Pj4+ICAgIAkJZWxzZQkJCQkJCQkJXAo+Pj4+IC0JCQkoYXRvbWlj
X2luYygmKHNiaSktPmlucGxhY2VfY291bnRbMV0pKTsJCVwKPj4+PiArCQkJKGF0b21pY19hZGQo
Y291bnQsICYoc2JpKS0+aW5wbGFjZV9jb3VudFsxXSkpOwlcCj4+Pj4gICAgCX0gd2hpbGUgKDAp
Cj4+Pj4gICAgI2RlZmluZSBzdGF0X3VwZGF0ZV9tYXhfYXRvbWljX3dyaXRlKGlub2RlKQkJCQlc
Cj4+Pj4gICAgCWRvIHsJCQkJCQkJCVwKPj4+PiBAQCAtMzg3Nyw3ICszODc3LDcgQEAgdm9pZCBm
MmZzX3VwZGF0ZV9zaXRfaW5mbyhzdHJ1Y3QgZjJmc19zYl9pbmZvCj4+PiAqc2JpKTsKPj4+PiAg
ICAjZGVmaW5lIHN0YXRfaW5jX21ldGFfY291bnQoc2JpLCBibGthZGRyKQkJZG8geyB9IHdoaWxl
ICgwKQo+Pj4+ICAgICNkZWZpbmUgc3RhdF9pbmNfc2VnX3R5cGUoc2JpLCBjdXJzZWcpCQkJZG8g
eyB9IHdoaWxlICgwKQo+Pj4+ICAgICNkZWZpbmUgc3RhdF9pbmNfYmxvY2tfY291bnQoc2JpLCBj
dXJzZWcpCQlkbyB7IH0gd2hpbGUgKDApCj4+Pj4gLSNkZWZpbmUgc3RhdF9pbmNfaW5wbGFjZV9i
bG9ja3Moc2JpKQkJCWRvIHsgfSB3aGlsZSAoMCkKPj4+PiArI2RlZmluZSBzdGF0X2FkZF9pbnBs
YWNlX2Jsb2NrcyhzYmksIGNvdW50LCBkaXJlY3RfaW8pCQlkbyB7IH0gd2hpbGUKPj4+ICgwKQo+
Pj4+ICAgICNkZWZpbmUgc3RhdF9pbmNfc2VnX2NvdW50KHNiaSwgdHlwZSwgZ2NfdHlwZSkJCWRv
IHsgfSB3aGlsZSAoMCkKPj4+PiAgICAjZGVmaW5lIHN0YXRfaW5jX3RvdF9ibGtfY291bnQoc2ks
IGJsa3MpCQlkbyB7IH0gd2hpbGUgKDApCj4+Pj4gICAgI2RlZmluZSBzdGF0X2luY19kYXRhX2Js
a19jb3VudChzYmksIGJsa3MsIGdjX3R5cGUpCWRvIHsgfSB3aGlsZSAoMCkKPj4+PiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYyBpbmRleAo+Pj4+IGRl
ZDc0NGU4ODBkMC4uYzU0MmM0YjY4N2NhIDEwMDY0NAo+Pj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVu
dC5jCj4+Pj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4+PiBAQCAtMzYxMSw3ICszNjExLDcg
QEAgaW50IGYyZnNfaW5wbGFjZV93cml0ZV9kYXRhKHN0cnVjdAo+Pj4+IGYyZnNfaW9faW5mbwo+
Pj4gKmZpbykKPj4+PiAgICAJCWdvdG8gZHJvcF9iaW87Cj4+Pj4gICAgCX0KPj4+Pgo+Pj4+IC0J
c3RhdF9pbmNfaW5wbGFjZV9ibG9ja3MoZmlvLT5zYmksIGZhbHNlKTsKPj4+PiArCXN0YXRfYWRk
X2lucGxhY2VfYmxvY2tzKHNiaSwgMSwgZmFsc2UpOwo+Pj4+Cj4+Pj4gICAgCWlmIChmaW8tPmJp
byAmJiAhKFNNX0koc2JpKS0+aXB1X3BvbGljeSAmICgxIDw8Cj4+IEYyRlNfSVBVX05PQ0FDSEUp
KSkKPj4+PiAgICAJCWVyciA9IGYyZnNfbWVyZ2VfcGFnZV9iaW8oZmlvKTsKPj4+PgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK
