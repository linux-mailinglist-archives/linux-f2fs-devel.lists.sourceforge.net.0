Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF888C804A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 May 2024 05:50:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s7obW-0002v6-D0;
	Fri, 17 May 2024 03:49:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s7obP-0002ut-QX
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 May 2024 03:49:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rWt8ni5EktbhtniaVz2ZvZsVGYPisdQW9UUGTr7rQiw=; b=PM29EvqbolYw8EfqzgkU4CCOCB
 HaydB4JUfg8EnvJAQRQy4yD2riuAJrG5ZFf9Nd8E9yUmiwQLK0Ugs81bGV6o9abeW1lexQ6EjyD46
 aJOj0wekFJx1KOLI6VM9GPu6Bs8zhv+eUXct/pDK7hZIAh9eURGymHFIwZWbw+Du/n3M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rWt8ni5EktbhtniaVz2ZvZsVGYPisdQW9UUGTr7rQiw=; b=LqciBLDVEtRYcIyrAJJOnBJJlb
 CHHBmjHSJmLWu6DV/6aAplEUqmDmi+MqDRrNggXhUOn5wVxlq5Q0mPMOpMxsp46ZpMx6+PzKdrBLN
 wPtka41e+7XL8Om77Hy9SegXSfSFdP5Ne1k9p+qyV5NY4I23Q/K+tfFCkTfh1EybfBqQ=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s7obQ-0004Ws-K8 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 May 2024 03:49:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B37BDCE19AD;
 Fri, 17 May 2024 03:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8376EC2BD10;
 Fri, 17 May 2024 03:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715917779;
 bh=rWt8ni5EktbhtniaVz2ZvZsVGYPisdQW9UUGTr7rQiw=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=NKjGDWBNA6OODIGPyPOU6pLPYA0sT/KEHw8EdeHA+i2u82RIUoGvIu22mLzDfeFZJ
 0IPlIwDuuB4UyHuTFiZAu7oqB3T10ePvlcBGT8BEsLhRTb8FsGi4B/xp9N2wMb7Nnt
 c+fZF6ySyo6SdG23CeD2bgS1DZWy7uy60XdCLjAuAc8aHKQCeEXvLvFUJPYKMTj5EG
 ink4LqUZUSRjuTeY0l6BIrwgXU+rRzSETn5TMqzJ0NtTq6uUav2eU2F7O8RJlv4RbH
 bKoXXBAgvyqdgEjSMMTT+NhpsFOYUZcdtKvdLUvkfPXZZoMPNBQB9+yWmf102QaASe
 5w9HAdnKB2DuQ==
Message-ID: <63255554-cc9c-44f4-9977-76d5d3a3f677@kernel.org>
Date: Fri, 17 May 2024 11:49:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?5a2Z5aOr5p2w?= <sunshijie@xiaomi.com>,
 sunshijie <sunshijie@xiaomi.corp-partner.google.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240516101338.1089140-1-sunshijie@xiaomi.com>
 <d985672be29a4e49ad560cd49aa202e2@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <d985672be29a4e49ad560cd49aa202e2@xiaomi.com>
X-Spam-Score: -6.2 (------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/5/16 18:15, 孙士杰 wrote: > I didn't get it, if
    there is no cp_err, f2fs_write_checkpoint() in > f2fs_put_super() will flush
    all dirty pages of node_inode, if there is > cp_err, below flow [...] 
 
 Content analysis details:   (-6.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s7obQ-0004Ws-K8
Subject: Re: [f2fs-dev] =?utf-8?b?562U5aSNOiBbRXh0ZXJuYWwgTWFpbF1bUEFUQ0hd?=
 =?utf-8?q?_f2fs=3A_fix_panic_in_f2fs=5Fput=5Fsuper?=
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC81LzE2IDE4OjE1LCDlrZnlo6vmnbAgd3JvdGU6DQo+IEkgZGlkbid0IGdldCBpdCwg
aWYgdGhlcmUgaXMgbm8gY3BfZXJyLCBmMmZzX3dyaXRlX2NoZWNrcG9pbnQoKSBpbg0KPiBmMmZz
X3B1dF9zdXBlcigpIHdpbGwgZmx1c2ggYWxsIGRpcnR5IHBhZ2VzIG9mIG5vZGVfaW5vZGUsIGlm
IHRoZXJlIGlzDQo+IGNwX2VyciwgYmVsb3cgZmxvdyB3aWxsIGtlZXAgYWxsIGRpcnR5IHBhZ2Vz
IGJlaW5nIHRydW5jYXRlZCwgYW5kDQo+IHRoZXJlIGlzIHNhbml0eSBjaGVjayBvbiBhbGwgdHlw
ZXMgb2YgZGlydHkgcGFnZXMuDQo+IA0KPiA9PT3jgIsNCj4gSSB1bmRlcnN0YW5kIHdoYXQgeW91
IG1lYW4sIHNvIGlzIGl0IGJldHRlciB0byBtb2RpZnkgaW4gdGhpcyB3YXk/IFBsZWFzZSBoZWxw
IHRvIGNoZWNrLCB0aGFuayB5b3UNCg0KSGksIGxldCdzIGZpZ3VyZSBvdXQgdGhlIHJvb3QgY2F1
c2UgZmlyc3Q/DQoNClRoYW5rcywNCg0KPiANCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICrl
j5Hku7bkuro6KiBzdW5zaGlqaWUgPHN1bnNoaWppZUB4aWFvbWkuY29ycC1wYXJ0bmVyLmdvb2ds
ZS5jb20+DQo+ICrlj5HpgIHml7bpl7Q6KiAyMDI05bm0NeaciDE25pelIDE4OjEzOjM4DQo+ICrm
lLbku7bkuro6KiBqYWVnZXVrQGtlcm5lbC5vcmc7IGNoYW9Aa2VybmVsLm9yZzsgbGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcNCj4gKuaKhOmAgToqIOWtmeWjq+adsA0KPiAq5Li76aKYOiogW0V4dGVybmFsIE1haWxdW1BB
VENIXSBmMmZzOiBmaXggcGFuaWMgaW4gZjJmc19wdXRfc3VwZXINCj4gW+WklumDqOmCruS7tl0g
5q2k6YKu5Lu25p2l5rqQ5LqO5bCP57Gz5YWs5Y+45aSW6YOo77yM6K+36LCo5oWO5aSE55CG44CC
6Iul5a+56YKu5Lu25a6J5YWo5oCn5a2Y55aR77yM6K+35bCG6YKu5Lu26L2s5Y+R57uZbWlzZWNA
eGlhb21pLmNvbei/m+ihjOWPjemmiA0KPiANCj4gV2hlbiB0aHJlYWQgQSBjYWxscyBraWxsX2Yy
ZnNfc3VwZXIsIFRocmVhZCBBIGZpcnN0IGV4ZWN1dGVzIHRoZSBjb2RlIHNiaS0+bm9kZV9pbm9k
ZSA9IE5VTEw7DQo+IFRoZW4gdGhyZWFkIEEgbWF5IHN1Ym1pdCBhIGJpbyB0byB0aGUgZnVuY3Rp
b24gaXB1dChzYmktPm1ldGFfaW5vZGUpOw0KPiBUaGVuIHRocmVhZCBBIGVudGVycyB0aGUgcHJv
Y2VzcyBEIHN0YXRlLA0KPiBOb3cgdGhhdCB0aGUgYmlvIHN1Ym1pdHRlZCBieSB0aHJlYWQgQSBp
cyBjb21wbGV0ZSwgaXQgY2FsbHMgZjJmc193cml0ZV9lbmRfaW8gYW5kIG1heSB0cmlnZ2VyIG51
bGwtcHRyLWRlcmVmIGluIE5PREVfTUFQUElORy4NCj4gDQo+IFRocmVhZCBBwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBJUlEgY29udGV4dA0KPiAtIGYyZnNfcHV0X3N1cGVyDQo+ICDCoC0gc2Jp
LT5ub2RlX2lub2RlID0gTlVMTDsNCj4gIMKgLSBpcHV0KHNiaS0+bWV0YV9pbm9kZSk7DQo+ICDC
oCAtIGlwdXRfZmluYWwNCj4gIMKgwqAgLSB3cml0ZV9pbm9kZV9ub3cNCj4gIMKgwqDCoCAtIHdy
aXRlYmFja19zaW5nbGVfaW5vZGUNCj4gIMKgwqDCoMKgIC0gX193cml0ZWJhY2tfc2luZ2xlX2lu
b2RlDQo+ICDCoMKgwqDCoMKgIC0gZmlsZW1hcF9mZGF0YXdhaXQNCj4gIMKgwqDCoMKgwqDCoCAt
IGZpbGVtYXBfZmRhdGF3YWl0X3JhbmdlDQo+ICDCoMKgwqDCoMKgwqDCoCAtIF9fa2NmaV90eXBl
aWRfZnJlZV90cmFuc2h1Z2VfcGFnZQ0KPiAgwqDCoMKgwqDCoMKgwqDCoCAtIF9fZmlsZW1hcF9m
ZGF0YXdhaXRfcmFuZ2UNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoCAtIHdhaXRfb25fcGFnZV93cml0
ZWJhY2sNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZm9saW9fd2FpdF93cml0ZWJhY2sNCj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBmb2xpb193YWl0X2JpdA0KPiAgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC0gZm9saW9fd2FpdF9iaXRfY29tbW9uDQo+ICDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAtIGlvX3NjaGVkdWxlDQo+IA0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLSBfX2hhbmRsZV9pcnFfZXZlbnRfcGVyY3B1DQo+ICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gdWZzX3Fjb21fbWNxX2VzaV9o
YW5kbGVyDQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LSB1ZnNoY2RfbWNxX3BvbGxfY3FlX25vbG9jaw0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSB1ZnNoY2RfY29tcGxfb25lX2NxZQ0KPiAgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIHNjc2lfZG9uZQ0K
PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0g
c2NzaV9kb25lX2ludGVybmFsDQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAtIGJsa19tcV9jb21wbGV0ZV9yZXF1ZXN0DQo+ICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gc2NzaV9j
b21wbGV0ZQ0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC0gc2NzaV9maW5pc2hfY29tbWFuZA0KPiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBzY3NpX2lvX2NvbXBs
ZXRpb24NCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLSBzY3NpX2VuZF9yZXF1ZXN0DQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBibGtfdXBkYXRl
X3JlcXVlc3QNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gYmlvX2VuZGlvDQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZjJmc193
cml0ZV9lbmRfaW8NCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIE5PREVfTUFQUElORyhzYmkpDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBzdW5zaGlqaWUgPHN1bnNoaWppZUB4aWFvbWkuY29tPg0KPiAtLS0NCj4g
IMKgZnMvZjJmcy9zdXBlci5jIHwgNCArKy0tDQo+ICDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zdXBl
ci5jIGIvZnMvZjJmcy9zdXBlci5jDQo+IGluZGV4IGFkZmZjOWI4MGE5Yy4uNjJkNGYyMjlmNjAx
IDEwMDY0NA0KPiAtLS0gYS9mcy9mMmZzL3N1cGVyLmMNCj4gKysrIGIvZnMvZjJmcy9zdXBlci5j
DQo+IEBAIC0xNjQyLDkgKzE2NDIsOSBAQCBzdGF0aWMgdm9pZCBmMmZzX3B1dF9zdXBlcihzdHJ1
Y3Qgc3VwZXJfYmxvY2sgKnNiKQ0KPiAgwqDCoMKgwqDCoMKgwqAgZjJmc19kZXN0cm95X2NvbXBy
ZXNzX2lub2RlKHNiaSk7DQo+IA0KPiAgwqDCoMKgwqDCoMKgwqAgaXB1dChzYmktPm5vZGVfaW5v
ZGUpOw0KPiAtwqDCoMKgwqDCoMKgIHNiaS0+bm9kZV9pbm9kZSA9IE5VTEw7DQo+IC0NCj4gIMKg
wqDCoMKgwqDCoMKgIGlwdXQoc2JpLT5tZXRhX2lub2RlKTsNCj4gKw0KPiArwqDCoMKgwqDCoMKg
IHNiaS0+bm9kZV9pbm9kZSA9IE5VTEw7DQo+ICDCoMKgwqDCoMKgwqDCoCBzYmktPm1ldGFfaW5v
ZGUgPSBOVUxMOw0KPiANCj4gIMKgwqDCoMKgwqDCoMKgIG11dGV4X3VubG9jaygmc2JpLT51bW91
bnRfbXV0ZXgpOw0KPiAtLQ0KPiAyLjM0LjENCj4gDQo+ICMvKioqKioq5pys6YKu5Lu25Y+K5YW2
6ZmE5Lu25ZCr5pyJ5bCP57Gz5YWs5Y+455qE5L+d5a+G5L+h5oGv77yM5LuF6ZmQ5LqO5Y+R6YCB
57uZ5LiK6Z2i5Zyw5Z2A5Lit5YiX5Ye655qE5Liq5Lq65oiW576k57uE44CC56aB5q2i5Lu75L2V
5YW25LuW5Lq65Lul5Lu75L2V5b2i5byP5L2/55So77yI5YyF5ous5L2G5LiN6ZmQ5LqO5YWo6YOo
5oiW6YOo5YiG5Zyw5rOE6Zyy44CB5aSN5Yi244CB5oiW5pWj5Y+R77yJ5pys6YKu5Lu25Lit55qE
5L+h5oGv44CC5aaC5p6c5oKo6ZSZ5pS25LqG5pys6YKu5Lu277yM6K+35oKo56uL5Y2z55S16K+d
5oiW6YKu5Lu26YCa55+l5Y+R5Lu25Lq65bm25Yig6Zmk5pys6YKu5Lu277yBIFRoaXMgZS1tYWls
IGFuZCBpdHMgYXR0YWNobWVudHMgY29udGFpbiBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gZnJv
bSBYSUFPTUksIHdoaWNoIGlzIGludGVuZGVkIG9ubHkgZm9yIHRoZSBwZXJzb24gb3IgZW50aXR5
IHdob3NlIGFkZHJlc3MgaXMgbGlzdGVkIGFib3ZlLiBBbnkgdXNlIG9mIHRoZSBpbmZvcm1hdGlv
biBjb250YWluZWQgaGVyZWluIGluIGFueSB3YXkgKGluY2x1ZGluZywgYnV0IG5vdCBsaW1pdGVk
IHRvLCB0b3RhbCBvciBwYXJ0aWFsIGRpc2Nsb3N1cmUsIHJlcHJvZHVjdGlvbiwgb3IgZGlzc2Vt
aW5hdGlvbikgYnkgcGVyc29ucyBvdGhlciB0aGFuIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykg
aXMgcHJvaGliaXRlZC4gSWYgeW91IHJlY2VpdmUgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFz
ZSBub3RpZnkgdGhlIHNlbmRlciBieSBwaG9uZSBvciBlbWFpbCBpbW1lZGlhdGVseSBhbmQgZGVs
ZXRlIGl0ISoqKioqKi8jDQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
