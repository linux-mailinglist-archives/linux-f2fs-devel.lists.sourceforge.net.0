Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CED9BFFD8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Nov 2024 09:22:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t8xmo-0008Qo-GM;
	Thu, 07 Nov 2024 08:22:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t8xme-0008QQ-OD
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Nov 2024 08:22:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cLxL0p+RQu8UXdK45urRnLsaEiZ6SIiW/+BwrcG4HG0=; b=SLCb6nGHY4VQfpNUrhU2EqoXoM
 XxZZSIWyG1H5YGmcfvXbFOPfNt7SSb0VLlJTrs92VLc7v+58SeWBY54M1RPrFFPPNeP4TYCoKuLQJ
 4rw5xjEpfybI3qhsLxBJJPBpdeXZ3w1ExjvhwA45WSCbQcj5D1uTfojualR/i9QjIcLE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cLxL0p+RQu8UXdK45urRnLsaEiZ6SIiW/+BwrcG4HG0=; b=B8XZ5F5/iW9vssgdXZgQao9OtK
 9ChafEq0VRTYMCk+HbFAL9w/kFK0zMxeh5jC+AZ9ky1U9XeEx4vYhOb4xeXJazUJrWIwAbQGDz9j8
 3QFIFzg+GptwGSwsY2uGM7/zZdM6Z3X8xoy9H923egQIQyN1bbbrDybVxqqpZ6HbhibM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t8xme-0006U0-EB for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Nov 2024 08:22:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 519D55C54BB;
 Thu,  7 Nov 2024 08:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423E7C4CECC;
 Thu,  7 Nov 2024 08:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730967737;
 bh=Yn538S3pFBGMZoyjFkAqcB6Oj05/WmRjrE/cShIc47M=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=J+fK3VTqcyO60+pNASjgJl19pNigwru7qHxlHlUFowOiT0dszLL7B/4X0+DEuuTNA
 TlJ0RAl5tjKZHLj95Ih1K1qj60jrB6oqzrQ1EHz2z2ube1uEsyAwRCPGo00Wp9JhJc
 QX7FeVC+MuMwedoM2waTzVRf1RnFiBjDJMj8WLR0xSvZgv9ClLqlYRLEiCh8MQXO3O
 izl3ENzrKX0IiURJY6QiH+2SNfwYqS880pw7mFf3dF1T0atrK+J1HG8Rx1E/fnzWot
 6pA90oFgshROfkWBgpkZxUXIkIuLbJ15y6qw1uyGP0gtLP6+i21pLtJv1honqAwXZ+
 fHibQBkDSna+g==
Message-ID: <45cec698-2679-435b-b62a-ebe22d361955@kernel.org>
Date: Thu, 7 Nov 2024 16:22:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1730685372-2995-1-git-send-email-zhiguo.niu@unisoc.com>
 <ab9f63b2-8d02-411b-8d2f-bc1b5b748ffe@kernel.org>
 <CAHJ8P3L9o2RJgV=TtUf_MPj36wasgPn7bn9FnGPXu=TgpE7ATQ@mail.gmail.com>
 <22873055-370b-4240-83ff-96bcfa91413a@kernel.org>
 <CAHJ8P3LddwapGLV5nKmw1ULTm7qp5OMk-kFBK3s_UptPPeph7w@mail.gmail.com>
 <9199e9fc-7b5b-4069-b79b-65ba5ae1b0f6@kernel.org>
 <CAHJ8P3L68mKAcSdrgk-5VZQh4cW+BBroh+50ymvuzO0f5x5kMw@mail.gmail.com>
 <c070fd2d-6480-4833-b03c-ec032ee37a28@kernel.org>
 <CAHJ8P3L4Q4Pia66o1RQGw5NnUOVxzNgFXUPO33jtqfQ-Oc=G_g@mail.gmail.com>
 <0a8f96da-302d-4d6c-9ab6-0b66a05cbcfd@kernel.org>
 <CAHJ8P3JTY=DFQRMd0zNGy6a3Hdq1y045ri9QKM8NGn8bNhHJfA@mail.gmail.com>
 <d5ef36a3-1bcb-40a0-a963-c6d1887c4e4e@kernel.org>
 <CAHJ8P3JARkFxkyz-FLWN2PSZb2AL3=dSqF1v-SR-oU9z6tm+Rg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3JARkFxkyz-FLWN2PSZb2AL3=dSqF1v-SR-oU9z6tm+Rg@mail.gmail.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/11/7 14:54, Zhiguo Niu wrote: > Chao Yu <chao@kernel.org>
    于2024年11月7日周四 14:18写道： >> >> On 2024/11/6 16:41, Zhiguo
    Niu wrote: >>> Chao Yu <chao@kernel.org> 于2024年11月6日 [...] 
 
 Content analysis details:   (-5.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t8xme-0006U0-EB
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: fix to adjust appropriate length
 for fiemap
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 jaegeuk@kernel.org, Hao_hao.Wang@unisoc.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8xMS83IDE0OjU0LCBaaGlndW8gTml1IHdyb3RlOgo+IENoYW8gWXUgPGNoYW9Aa2Vy
bmVsLm9yZz4g5LqOMjAyNOW5tDEx5pyIN+aXpeWRqOWbmyAxNDoxOOWGmemBk++8mgo+Pgo+PiBP
biAyMDI0LzExLzYgMTY6NDEsIFpoaWd1byBOaXUgd3JvdGU6Cj4+PiBDaGFvIFl1IDxjaGFvQGtl
cm5lbC5vcmc+IOS6jjIwMjTlubQxMeaciDbml6XlkajkuIkgMTU6NDDlhpnpgZPvvJoKPj4+Pgo+
Pj4+IE9uIDIwMjQvMTEvNiAxNDowOCwgWmhpZ3VvIE5pdSB3cm90ZToKPj4+Pj4gQ2hhbyBZdSA8
Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg25pel5ZGo5LiJIDEwOjQw5YaZ6YGT77ya
Cj4+Pj4+Pgo+Pj4+Pj4gT24gMjAyNC8xMS82IDEwOjI2LCBaaGlndW8gTml1IHdyb3RlOgo+Pj4+
Pj4+IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4g5LqOMjAyNOW5tDEx5pyINuaXpeWRqOS4iSAx
MDoxNuWGmemBk++8mgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBPbiAyMDI0LzExLzUgMTk6MDIsIFpoaWd1
byBOaXUgd3JvdGU6Cj4+Pj4+Pj4+PiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IOS6jjIwMjTl
ubQxMeaciDXml6XlkajkuowgMTg6MznlhpnpgZPvvJoKPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IE9u
IDIwMjQvMTEvNSAxNToyOCwgWmhpZ3VvIE5pdSB3cm90ZToKPj4+Pj4+Pj4+Pj4gQ2hhbyBZdSA8
Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg15pel5ZGo5LqMIDE1OjA05YaZ6YGT77ya
Cj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4gT24gMjAyNC8xMS80IDk6NTYsIFpoaWd1byBOaXUg
d3JvdGU6Cj4+Pj4+Pj4+Pj4+Pj4gSWYgdXNlciBnaXZlIGEgZmlsZSBzaXplIGFzICJsZW5ndGgi
IHBhcmFtZXRlciBmb3IgZmllbWFwCj4+Pj4+Pj4+Pj4+Pj4gb3BlcmF0aW9ucywgYnV0IGlmIHRo
aXMgc2l6ZSBpcyBub24tYmxvY2sgc2l6ZSBhbGlnbmVkLAo+Pj4+Pj4+Pj4+Pj4+IGl0IHdpbGwg
c2hvdyAyIHNlZ21lbnRzIGZpZW1hcCByZXN1bHRzIGV2ZW4gdGhpcyB3aG9sZSBmaWxlCj4+Pj4+
Pj4+Pj4+Pj4gaXMgY29udGlndW91cyBvbiBkaXNrLCBzdWNoIGFzIHRoZSBmb2xsb3dpbmcgcmVz
dWx0czoKPj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+ICAgICAgICAgLi9mMmZzX2lvIGZpZW1h
cCAwIDE5MDM0IHlsb2cvYW5hbHl6ZXIucHkKPj4+Pj4+Pj4+Pj4+PiBGaWVtYXA6IG9mZnNldCA9
IDAgbGVuID0gMTkwMzQKPj4+Pj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICBsb2dpY2FsIGFkZHIu
ICAgIHBoeXNpY2FsIGFkZHIuICAgbGVuZ3RoICAgICAgICAgICBmbGFncwo+Pj4+Pj4+Pj4+Pj4+
IDAgICAgICAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDIwYmFhMDAwIDAwMDAwMDAwMDAwMDQw
MDAgMDAwMDEwMDAKPj4+Pj4+Pj4+Pj4+PiAxICAgICAgIDAwMDAwMDAwMDAwMDQwMDAgMDAwMDAw
MDAyMGJhZTAwMCAwMDAwMDAwMDAwMDAxMDAwIDAwMDAxMDAxCj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+Pj4+PiBhZnRlciB0aGlzIHBhdGNoOgo+Pj4+Pj4+Pj4+Pj4+IC4vZjJmc19pbyBmaWVtYXAg
MCAxOTAzNCB5bG9nL2FuYWx5emVyLnB5Cj4+Pj4+Pj4+Pj4+Pj4gRmllbWFwOiBvZmZzZXQgPSAw
IGxlbiA9IDE5MDM0Cj4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAgICBsb2dpY2FsIGFkZHIuICAgIHBo
eXNpY2FsIGFkZHIuICAgbGVuZ3RoICAgICAgICAgICBmbGFncwo+Pj4+Pj4+Pj4+Pj4+IDAgICAg
MDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDMxNWYzMDAwIDAwMDAwMDAwMDAwMDUwMDAgMDAwMDEw
MDEKPj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFpoaWd1byBOaXUg
PHpoaWd1by5uaXVAdW5pc29jLmNvbT4KPj4+Pj4+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4+Pj4+PiBW
MjogY29ycmVjdCBjb21taXQgbXNnIGFjY29yZGluZyB0byBDaGFvJ3MgcXVlc3Rpb25zCj4+Pj4+
Pj4+Pj4+Pj4gZjJmc19pbyBoYXMgYmVlbiBtb2RpZmllZCBmb3IgdGVzdGluZywgdGhlIGxlbmd0
aCBmb3IgZmllbWFwIGlzCj4+Pj4+Pj4+Pj4+Pj4gcmVhbCBmaWxlIHNpemUsIG5vdCBibG9jayBu
dW1iZXIKPj4+Pj4+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4+Pj4+PiAgICAgICAgIGZzL2YyZnMvZGF0
YS5jIHwgNCArKy0tCj4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4gZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPj4+Pj4+Pj4+Pj4+PiBp
bmRleCAzMDZiODZiMC4uOWZjMjI5ZCAxMDA2NDQKPj4+Pj4+Pj4+Pj4+PiAtLS0gYS9mcy9mMmZz
L2RhdGEuYwo+Pj4+Pj4+Pj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+Pj4+Pj4+Pj4+Pj4g
QEAgLTE5NjYsOCArMTk2Niw4IEBAIGludCBmMmZzX2ZpZW1hcChzdHJ1Y3QgaW5vZGUgKmlub2Rl
LCBzdHJ1Y3QgZmllbWFwX2V4dGVudF9pbmZvICpmaWVpbmZvLAo+Pj4+Pj4+Pj4+Pj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPj4+Pj4+Pj4+Pj4+PiAgICAgICAgICAg
ICB9Cj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiAtICAgICBpZiAoYnl0ZXNfdG9fYmxrcyhp
bm9kZSwgbGVuKSA9PSAwKQo+Pj4+Pj4+Pj4+Pj4+IC0gICAgICAgICAgICAgbGVuID0gYmxrc190
b19ieXRlcyhpbm9kZSwgMSk7Cj4+Pj4+Pj4+Pj4+Pj4gKyAgICAgaWYgKGxlbiAmIChibGtzX3Rv
X2J5dGVzKGlub2RlLCAxKSAtIDEpKQo+Pj4+Pj4+Pj4+Pj4+ICsgICAgICAgICAgICAgbGVuID0g
cm91bmRfdXAobGVuLCBibGtzX3RvX2J5dGVzKGlub2RlLCAxKSk7Cj4+Pj4+Pj4+Pj4+Pgo+Pj4+
Pj4+Pj4+Pj4gSG93IGRvIHlvdSB0aGluayBvZiBnZXR0aW5nIHJpZCBvZiBhYm92ZSBhbGlnbm1l
bnQgZm9yIGxlbj8KPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiAgICAg
ICAgICAgICBzdGFydF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCk7Cj4+Pj4+Pj4+
Pj4+Pj4gICAgICAgICAgICAgbGFzdF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCAr
IGxlbiAtIDEpOwo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IEFuZCByb3VuZCB1cCBlbmQgcG9z
aXRpb24gdy86Cj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4gbGFzdF9ibGsgPSBieXRlc190b19i
bGtzKGlub2RlLCByb3VuZF91cChzdGFydCArIGxlbiAtIDEsIEYyRlNfQkxLU0laRSkpOwo+Pj4+
Pj4+Pj4+PiBIaSBDaGFvLAo+Pj4+Pj4+Pj4+PiBJIHRoaW5rIHRoaXMgd2lsbCBjaGFuZ2UgdGhl
IGN1cnJlbnQgY29kZSBsb2dpYwo+Pj4+Pj4+Pj4+PiAtLS0tLS0tLS0tLS0tCj4+Pj4+Pj4+Pj4+
IGlmIChzdGFydF9ibGsgPiBsYXN0X2JsaykKPj4+Pj4+Pj4+Pj4gICAgICAgICAgIGdvdG8gb3V0
Owo+Pj4+Pj4+Pj4+PiAtLS0tLS0tLS0tLS0tCj4+Pj4+Pj4+Pj4+IGZvciBleGFtcGxlLCBhIGZp
bGUgd2l0aCBzaXplIDE5MDA2LCBidXQgdGhlIGxlbmd0aCBmcm9tIHRoZSB1c2VyIGlzIDE2Mzg0
Lgo+Pj4+Pj4+Pj4+PiBiZWZvcmUgdGhpcyBtb2RpZmljYXRpb24sICBsYXN0X2JsayA9ICBieXRl
c190b19ibGtzKGlub2RlLCBzdGFydCArCj4+Pj4+Pj4+Pj4+IGxlbiAtIDEpID0gKGlub2RlLCAx
NjM4MykgPSAzCj4+Pj4+Pj4+Pj4+IGFmdGVyIHRoZSBmaXJzdCBmMmZzX21hcF9ibG9ja3MoKS4g
c3RhcnRfYmxrIGNoYW5nZSB0byBiZSA0LAo+Pj4+Pj4+Pj4+PiBhZnRlciB0aGUgc2Vjb25kIGYy
ZnNfbWFwX2Jsb2NrcygpLCBmaWVtYXBfZmlsbF9uZXhfZXh0ZW4gd2lsbCBiZQo+Pj4+Pj4+Pj4+
PiBjYWxsZWQgdG8gZmlsbCB1c2VyIHBhcmFtZXRlciBhbmQgdGhlbgo+Pj4+Pj4+Pj4+PiB3aWxs
IGdvdG8gb3V0IGJlY2F1c2Ugc3RhcnRfYmxrID4gbGFzdF9ibGssIHRoZW4gZmllbWFwIGZsb3cg
ZmluaXNoZXMuCj4+Pj4+Pj4+Pj4+IGJ1dCBhZnRlciB0aGlzIG1vZGlmaWNhdGlvbiwgbGFzdF9i
bGsgd2lsbCBiZSA0Cj4+Pj4+Pj4+Pj4+IHdpbGwgZG8gZjJmc19tYXBfYmxvY2tzKCkgdW50aWwg
cmVhY2ggdGhlIG1heF9maWxlX2Jsb2Nrcyhpbm9kZSkKPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IFll
cywgeW91J3JlIHJpZ2h0LCBob3dldmVyLCB3LyB0aGlzIHBhdGNoLCBpdCBtYXkgY2hhbmdlIGxh
c3RfYmxrLCBlLmcuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiB4ZnNfaW8gZmlsZSAtYyAiZmllbWFw
IC12IDAgMTkwMDYiIHZzIHhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMiAxOTAwNiIKPj4+Pj4+
Pj4+PiBzdGFydF9ibGsgYW5kIGxhc3RfYmxrIHdpbGwgYmU6IDAsIDQgYW5kIDAsIDUuCj4+Pj4+
Pj4+PiBIaSBDaGFvLAo+Pj4+Pj4+Pj4geWVzLCBidXQgdy9vIHRoaXMgcGF0Y2ggLCB0aGUgb3Jp
Z2luYWwgY29kZSBzdGlsbCBoYXMgdGhlIHNhbWUgc2l0dWF0aW9uPz8KPj4+Pj4+Pj4+IGZvciBl
eGFtcGxlCj4+Pj4+Pj4+PiB4ZnNfaW8gZmlsZSAtYyAiZmllbWFwIC12IDAgMTYzODQiIHZzIHhm
c19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMiAxNjM4NCIKPj4+Pj4+Pj4+IHN0YXJ0X2JsayBhbmQg
bGFzdF9ibGsgd2lsbCBiZTogMCwgMyBhbmQgMCwgNC4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gRm9yIHRo
ZSBjYXNlICJmaWVtYXAgLXYgMiAxOTAwNiIsIG9mZnNldCBpcyAyLCBhbmQgbGVuZ3RoIGlzIDE5
MDA2LCBzbyBsYXN0X29mZnNldAo+Pj4+Pj4+PiBpcyAxOTAwOCwgYW5kIGxhc3RfYmxrIHNob3Vs
ZCBiZSA0IHJhdGhlciB0aGFuIDUsIHJpZ2h0Pwo+Pj4+Pj4+IGhpIENoYW8sCj4+Pj4+Pj4gaXQg
aXMgcmlnaHQgdy9vIG15IHBhdGNoLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBBbmQgZm9yIHlvdSBjYXNl
LCBpdCBjYWxjdWxhdGVzIGxhc3RfYmxrIGNvcnJlY3RseS4KPj4+Pj4+PiBTbyB5b3Ugc3VnZ2Vz
dCB0aGF0ICJTaG91bGQgd2Ugcm91bmRfdXAgbGVuIGFmdGVyIHN0YXJ0X2JsayAmIGxhc3RfYmxr
Cj4+Pj4+Pj4gY2FsY3VsYXRpb24/Igo+Pj4+Pj4KPj4+Pj4+IFpoaWd1bywKPj4+Pj4+Cj4+Pj4+
PiBZZXMsIEkgdGhpbmsgYWxpZ25tZW50IG9mIGxlbiBzaG91bGQgbm90IGFmZmVjdCBjYWxjdWxh
dGlvbiBvZiBsYXN0X2Jsay4KPj4+Pj4+Cj4+Pj4+PiBJIG1lYW4gdGhpcywKPj4+Pj4+Cj4+Pj4+
PiAtLS0KPj4+Pj4+ICAgICAgZnMvZjJmcy9kYXRhLmMgICAgICAgICAgfCA2ICsrKy0tLQo+Pj4+
Pj4gICAgICBpbmNsdWRlL2xpbnV4L2YyZnNfZnMuaCB8IDMgKystCj4+Pj4+PiAgICAgIDIgZmls
ZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pj4+Pj4KPj4+Pj4+
IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4+Pj4+PiBpbmRl
eCA3ZDFiYjk1MThhNDAuLmNiYmI5NTZmNDIwZCAxMDA2NDQKPj4+Pj4+IC0tLSBhL2ZzL2YyZnMv
ZGF0YS5jCj4+Pj4+PiArKysgYi9mcy9mMmZzL2RhdGEuYwo+Pj4+Pj4gQEAgLTE5NjcsMTIgKzE5
NjcsMTIgQEAgaW50IGYyZnNfZmllbWFwKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWVt
YXBfZXh0ZW50X2luZm8gKmZpZWluZm8sCj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBnb3RvIG91dDsKPj4+Pj4+ICAgICAgICAgICAgfQo+Pj4+Pj4KPj4+Pj4+IC0gICAgICAgaWYg
KGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIGxlbikgPT0gMCkKPj4+Pj4+IC0gICAgICAgICAgICAgICBs
ZW4gPSBibGtzX3RvX2J5dGVzKGlub2RlLCAxKTsKPj4+Pj4+IC0KPj4+Pj4+ICAgICAgICAgICAg
c3RhcnRfYmxrID0gYnl0ZXNfdG9fYmxrcyhpbm9kZSwgc3RhcnQpOwo+Pj4+Pj4gICAgICAgICAg
ICBsYXN0X2JsayA9IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIHN0YXJ0ICsgbGVuIC0gMSk7Cj4+Pj4+
Pgo+Pj4+Pj4gKyAgICAgICBpZiAobGVuICYgRjJGU19CTEtTSVpFX01BU0spCj4+Pj4+PiArICAg
ICAgICAgICAgICAgbGVuID0gcm91bmRfdXAobGVuLCBGMkZTX0JMS1NJWkUpOwo+Pj4+Pj4gKwo+
Pj4+PiBIaSBDaGFvLAo+Pj4+PiB0aGlzIHZlcmlvbiB2ZXJpZnkgcGFzcyB3aXRoIG15IHRlc3Qg
Y2FzZS4KPj4+Pj4KPj4+Pj4gYnV0IHRoZXJlIGlzIHN0aWxsIGFub3RoZXIgaXNzdWUgaW4gb3Jn
aW5hbCBjb2RlOgo+Pj4+PiB5bG9nL2FuYWx5emVyLnB5ICBzaXplID0gMTkwMzQKPj4+Pj4gaWYg
SSBpbnB1dCB0aGUgZm9sbG93aW5nIGNtZChzdGFydC9sZW5ndGggYXJlIGJvdGggcmVhbCBzaXpl
LCBub3QgYmxvY2sgbnVtYmVyKQo+Pj4+PiAvZjJmc19pbyBmaWVtYXAgMiAxNjM4NCB5bG9nL2Fu
YWx5emVyLnB5Cj4+Pj4+IGFuZCB0aGUgcmVzdWx0cyBzaG93czoKPj4+Pj4gRmllbWFwOiBvZmZz
ZXQgPSAyIGxlbiA9IDE2Mzg0Cj4+Pj4+ICAgICAgICBsb2dpY2FsIGFkZHIuICAgIHBoeXNpY2Fs
IGFkZHIuICAgbGVuZ3RoICAgICAgICAgICBmbGFncwo+Pj4+PiAwICAgIDAwMDAwMDAwMDAwMDAw
MDAgMDAwMDAwMGUyZWJjYTAwMCAwMDAwMDAwMDAwMDA0MDAwIDAwMDAxMDAwCj4+Pj4+IDEgICAg
MDAwMDAwMDAwMDAwNDAwMCAwMDAwMDAwZTJlYmNlMDAwIDAwMDAwMDAwMDAwMDEwMDAgMDAwMDEw
MDEKPj4+Pj4gc28gc3RhcnRfYmxrL2xhc3RfYmxrIHNob3VsZCBiZSBjYWxjdWxhdGUgaXQgaW4g
dGhlIGZvbGxvd2luZyB3YXk/Cj4+Pj4KPj4+PiBJSVVDLCB0aGUgcm9vdCBjYXVzZSBpcyBmMmZz
X21hcF9ibG9ja3MoKSB3aWxsIHRydW5jYXRlIHNpemUgb2YKPj4+PiByZXR1cm5lZCBleHRlbnQg
dG8gRjJGU19CWVRFU19UT19CTEsobGVuKSwgc28gd2hlbmV2ZXIgcGFyYW1ldGVyCj4+Pj4gQGxl
biBkb2Vzbid0IGNvdmVyIGxhc3QgZXh0ZW50LCBpdCB0cmlnZ2VycyB0aGlzIGJ1Zy4KPj4+Pgo+
Pj4+IG5leHQ6Cj4+Pj4gICAgICAgICAgIG1lbXNldCgmbWFwLCAwLCBzaXplb2YobWFwKSk7Cj4+
Pj4gICAgICAgICAgIG1hcC5tX2xibGsgPSBzdGFydF9ibGs7Cj4+Pj4gICAgICAgICAgIG1hcC5t
X2xlbiA9IEYyRlNfQllURVNfVE9fQkxLKGxlbik7ICAtLS0gbGltaXQgbWF4IHNpemUgb2YgZXh0
ZW50IGl0IGZvdW5kcwo+Pj4geWVzLCBJIHRoaW5rIHNvIHRvby4KPj4+PiAgICAgICAgICAgbWFw
Lm1fbmV4dF9wZ29mcyA9ICZuZXh0X3Bnb2ZzOwo+Pj4+ICAgICAgICAgICBtYXAubV9zZWdfdHlw
ZSA9IE5PX0NIRUNLX1RZUEU7Cj4+Pj4gLi4uCj4+Pj4gICAgICAgICAgIHJldCA9IGYyZnNfbWFw
X2Jsb2Nrcyhpbm9kZSwgJm1hcCwgRjJGU19HRVRfQkxPQ0tfRklFTUFQKTsKPj4+Pgo+Pj4+IHhm
c19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMiAxNjM4NCIKPj4+PiBmaWxlOgo+Pj4+ICAgICBFWFQ6
IEZJTEUtT0ZGU0VUICAgICAgQkxPQ0stUkFOR0UgICAgICBUT1RBTCBGTEFHUwo+Pj4+ICAgICAg
IDA6IFswLi4zMV06ICAgICAgICAgMTM5MjcyLi4xMzkzMDMgICAgICAzMiAweDEwMDAKPj4+PiAg
ICAgICAxOiBbMzIuLjM5XTogICAgICAgIDEzOTMwNC4uMTM5MzExICAgICAgIDggMHgxMDAxCj4+
Pj4geGZzX2lvIGZpbGUgLWMgImZpZW1hcCAtdiAwIDE2Mzg0Igo+Pj4+IGZpbGU6Cj4+Pj4gICAg
IEVYVDogRklMRS1PRkZTRVQgICAgICBCTE9DSy1SQU5HRSAgICAgIFRPVEFMIEZMQUdTCj4+Pj4g
ICAgICAgMDogWzAuLjMxXTogICAgICAgICAxMzkyNzIuLjEzOTMwMyAgICAgIDMyIDB4MTAwMAo+
Pj4+IHhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMCAxNjM4NSIKPj4+PiBmaWxlOgo+Pj4+ICAg
ICBFWFQ6IEZJTEUtT0ZGU0VUICAgICAgQkxPQ0stUkFOR0UgICAgICBUT1RBTCBGTEFHUwo+Pj4+
ICAgICAgIDA6IFswLi4zOV06ICAgICAgICAgMTM5MjcyLi4xMzkzMTEgICAgICA0MCAweDEwMDEK
Pj4+Cj4+PiBCdXQgIElmIHRoZSBjb3JyZWN0IGxhc3RfYmxrIGlzIGNhbGN1bGF0ZWQgY29ycmVj
dGx5LCBmaWVtYXAgY2FuIGJlCj4+PiBlbmRlZCBhcyBzb29uIGFzIHBvc3NpYmxlPyAgc28gdGhl
IHJlc3VsdHMgc2hvd24gaXMgYWxzbyByaWdodD8KPj4KPj4gWmhpZ3VvLAo+Pgo+PiBJTU8sIGl0
J3Mgbm90LCBkdWUgdG8gMSkgaWYgdGhlIGV4dGVudCBpcyBsYXN0IG9uZSwgRklFTUFQX0VYVEVO
VF9MQVNUCj4+IG11c3QgYmUgdGFnZ2VkIHRvIG5vdGljZSB1c2VyIHRoYXQgaXQgZG9lc24ndCBu
ZWVkIGZ1cnRoZXIgZmllbWFwIG9uCj4+IGxhdHRlciBMQkEsIDIpIG9uZSBjb250aW51b3VzIGV4
dGVudCBzaG91bGQgbm90IGJlIHNwbGl0IHRvIHR3by4KPj4KPj4gTGV0IG1lIGZpZ3VyZSBvdXQg
YSBmaXggZm9yIHRoYXQuCj4gSGkgQ2hhbywKPiBPSywgdGhhbmtzIGZvciB5b3VyIGV4cGxhaW5h
dGlvbi4KPiBidHcsIERvIEkgbmVlZCB0byB1cGRhdGUgYSBwYXRjaCBhYm91dCB0aGUgb3JpZ2lu
YWwgaXNzdWUgd2UgZGlzc2N1c3NlZD8KPiBvciB5b3Ugd2lsbCBtb2RpZnkgaXQgdG9nZXRoZXI/
CgpaaGlndW8sIGxldCBtZSBzZW5kIGEgcGF0Y2hzZXQgaW5jbHVkaW5nIHlvdXIgcGF0Y2gsIG5v
dywgSSdtIHRlc3RpbmcgdGhpczoKCiBGcm9tIGM2N2NiNDc4MmEzZjE4NzU4NjVmOWFlMjRjY2U4
MGE1OTc1MmQ2MDAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206IENoYW8gWXUgPGNoYW9A
a2VybmVsLm9yZz4KRGF0ZTogVGh1LCA3IE5vdiAyMDI0IDE0OjUyOjE3ICswODAwClN1YmplY3Q6
IFtQQVRDSF0gZjJmczogZml4IHRvIHJlcXVlcnkgZXh0ZW50IHdoaWNoIGNyb3NzIGJvdW5kYXJ5
IG9mIGlucXVpcnkKCmRkIGlmPS9kZXYvemVybyBvZj1maWxlIGJzPTRrIGNvdW50PTUKeGZzX2lv
IGZpbGUgLWMgImZpZW1hcCAtdiAyIDE2Mzg0IgpmaWxlOgogICAgRVhUOiBGSUxFLU9GRlNFVCAg
ICAgIEJMT0NLLVJBTkdFICAgICAgVE9UQUwgRkxBR1MKICAgICAgMDogWzAuLjMxXTogICAgICAg
ICAxMzkyNzIuLjEzOTMwMyAgICAgIDMyIDB4MTAwMAogICAgICAxOiBbMzIuLjM5XTogICAgICAg
IDEzOTMwNC4uMTM5MzExICAgICAgIDggMHgxMDAxCnhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYg
MCAxNjM4NCIKZmlsZToKICAgIEVYVDogRklMRS1PRkZTRVQgICAgICBCTE9DSy1SQU5HRSAgICAg
IFRPVEFMIEZMQUdTCiAgICAgIDA6IFswLi4zMV06ICAgICAgICAgMTM5MjcyLi4xMzkzMDMgICAg
ICAzMiAweDEwMDAKeGZzX2lvIGZpbGUgLWMgImZpZW1hcCAtdiAwIDE2Mzg1IgpmaWxlOgogICAg
RVhUOiBGSUxFLU9GRlNFVCAgICAgIEJMT0NLLVJBTkdFICAgICAgVE9UQUwgRkxBR1MKICAgICAg
MDogWzAuLjM5XTogICAgICAgICAxMzkyNzIuLjEzOTMxMSAgICAgIDQwIDB4MTAwMQoKVGhlcmUg
YXJlIHR3byBwcm9ibGVtczoKLSBjb250aW51b3VzIGV4dGVudCBpcyBzcGxpdCB0byB0d28KLSBG
SUVNQVBfRVhURU5UX0xBU1QgaXMgbWlzc2luZyBpbiBsYXN0IGV4dGVudAoKVGhlIHJvb3QgY2F1
c2UgaXM6IGlmIHVwcGVyIGJvdW5kYXJ5IG9mIGlucXVpcnkgY3Jvc3NlcyBleHRlbnQsCmYyZnNf
bWFwX2Jsb2NrcygpIHdpbGwgdHJ1bmNhdGUgbGVuZ3RoIG9mIHJldHVybmVkIGV4dGVudCB0bwpG
MkZTX0JZVEVTX1RPX0JMSyhsZW4pLCBhbmQgYWxzbywgaXQgd2lsbCBzdG9wIHRvIHF1ZXJ5IGxh
dHRlcgpleHRlbnQgb3IgaG9sZSB0byBtYWtlIHN1cmUgY3VycmVudCBleHRlbnQgaXMgbGFzdCBv
ciBub3QuCgpJbiBvcmRlciB0byBmaXggdGhpcyBpc3N1ZSwgb25jZSB3ZSBmb3VuZCBhbiBleHRl
bnQgbG9jYXRlcwppbiB0aGUgZW5kIG9mIGlucXVpcnkgcmFuZ2UgYnkgZjJmc19tYXBfYmxvY2tz
KCksIHdlIG5lZWQgdG8KZXhwYW5kIGlucXVpcnkgcmFuZ2UgdG8gcmVxdWlyeS4KClJlcG9ydGVk
LWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVuaXNvYy5jb20+ClNpZ25lZC1vZmYtYnk6IENo
YW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KLS0tCiAgZnMvZjJmcy9kYXRhLmMgfCAyMCArKysrKysr
KysrKysrKystLS0tLQogIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKaW5k
ZXggNjlmMWNiMDQ5MGVlLi5lZTU2MTQzMjRkZjAgMTAwNjQ0Ci0tLSBhL2ZzL2YyZnMvZGF0YS5j
CisrKyBiL2ZzL2YyZnMvZGF0YS5jCkBAIC0xODk2LDcgKzE4OTYsNyBAQCBpbnQgZjJmc19maWVt
YXAoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpZW1hcF9leHRlbnRfaW5mbyAqZmllaW5m
bywKICAJCXU2NCBzdGFydCwgdTY0IGxlbikKICB7CiAgCXN0cnVjdCBmMmZzX21hcF9ibG9ja3Mg
bWFwOwotCXNlY3Rvcl90IHN0YXJ0X2JsaywgbGFzdF9ibGs7CisJc2VjdG9yX3Qgc3RhcnRfYmxr
LCBsYXN0X2JsaywgYmxrX2xlbiwgbWF4X2xlbjsKICAJcGdvZmZfdCBuZXh0X3Bnb2ZzOwogIAl1
NjQgbG9naWNhbCA9IDAsIHBoeXMgPSAwLCBzaXplID0gMDsKICAJdTMyIGZsYWdzID0gMDsKQEAg
LTE5NDAsMTQgKzE5NDAsMTMgQEAgaW50IGYyZnNfZmllbWFwKHN0cnVjdCBpbm9kZSAqaW5vZGUs
IHN0cnVjdCBmaWVtYXBfZXh0ZW50X2luZm8gKmZpZWluZm8sCgogIAlzdGFydF9ibGsgPSBGMkZT
X0JZVEVTX1RPX0JMSyhzdGFydCk7CiAgCWxhc3RfYmxrID0gRjJGU19CWVRFU19UT19CTEsoc3Rh
cnQgKyBsZW4gLSAxKTsKLQotCWlmIChsZW4gJiBGMkZTX0JMS1NJWkVfTUFTSykKLQkJbGVuID0g
cm91bmRfdXAobGVuLCBGMkZTX0JMS1NJWkUpOworCWJsa19sZW4gPSBsYXN0X2JsayAtIHN0YXJ0
X2JsayArIDE7CisJbWF4X2xlbiA9IEYyRlNfQllURVNfVE9fQkxLKG1heGJ5dGVzKSAtIHN0YXJ0
X2JsazsKCiAgbmV4dDoKICAJbWVtc2V0KCZtYXAsIDAsIHNpemVvZihtYXApKTsKICAJbWFwLm1f
bGJsayA9IHN0YXJ0X2JsazsKLQltYXAubV9sZW4gPSBGMkZTX0JZVEVTX1RPX0JMSyhsZW4pOwor
CW1hcC5tX2xlbiA9IGJsa19sZW47CiAgCW1hcC5tX25leHRfcGdvZnMgPSAmbmV4dF9wZ29mczsK
ICAJbWFwLm1fc2VnX3R5cGUgPSBOT19DSEVDS19UWVBFOwoKQEAgLTE5NzAsNiArMTk2OSwxNyBA
QCBpbnQgZjJmc19maWVtYXAoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpZW1hcF9leHRl
bnRfaW5mbyAqZmllaW5mbywKICAJCWZsYWdzIHw9IEZJRU1BUF9FWFRFTlRfTEFTVDsKICAJfQoK
KwkvKgorCSAqIGN1cnJlbnQgZXh0ZW50IG1heSBjcm9zcyBib3VuZGFyeSBvZiBpbnF1aXJ5LCBp
bmNyZWFzZSBsZW4gdG8KKwkgKiByZXF1ZXJ5LgorCSAqLworCWlmICghY29tcHJfY2x1c3RlciAm
JiAobWFwLm1fZmxhZ3MgJiBGMkZTX01BUF9NQVBQRUQpICYmCisJCQkJbWFwLm1fbGJsayArIG1h
cC5tX2xlbiAtIDEgPT0gbGFzdF9ibGsgJiYKKwkJCQlibGtfbGVuICE9IG1heF9sZW4pIHsKKwkJ
YmxrX2xlbiA9IG1heF9sZW47CisJCWdvdG8gbmV4dDsKKwl9CisKICAJY29tcHJfYXBwZW5kZWQg
PSBmYWxzZTsKICAJLyogSW4gYSBjYXNlIG9mIGNvbXByZXNzZWQgY2x1c3RlciwgYXBwZW5kIHRo
aXMgdG8gdGhlIGxhc3QgZXh0ZW50ICovCiAgCWlmIChjb21wcl9jbHVzdGVyICYmICgobWFwLm1f
ZmxhZ3MgJiBGMkZTX01BUF9ERUxBTExPQykgfHwKLS0gCjIuNDAuMQoKPiB0aGFua3MhCj4+Cj4+
IFRoYW5rcywKPj4KPj4+IHN1Y2ggYXMgdGhpcyBzcGVjaWFsIGNhc2UgInhmc19pbyBmaWxlIC1j
ICJmaWVtYXAgLXYgMiAxNjM4NCIgd2UgZGlzY3Vzc2VkLgo+Pj4gYnV0IGl0IGlzIGZpbmUgZm9y
IG1lIHRvIGtlZXAgdGhlIGN1cnJlbnQgY29kZXMuCj4+PiB0aGFua3MhCj4+Pj4KPj4+PiBUaG91
Z2h0cz8KPj4+Pgo+Pj4+IFRoYW5rcywKPj4+Pgo+Pj4+PiBiZWZvcmU6Cj4+Pj4+IHN0YXJ0X2Js
ayA9IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIHN0YXJ0KTsKPj4+Pj4gbGFzdF9ibGsgPSBieXRlc190
b19ibGtzKGlub2RlLCBzdGFydCArIGxlbiAtIDEpOwo+Pj4+PiBhZnRlcjoKPj4+Pj4KPj4+Pj4g
c3RhcnRfYmxrID0gYnl0ZXNfdG9fYmxrcyhpbm9kZSwgc3RhcnQpOwo+Pj4+PiBsYXN0X2JsayA9
IHN0YXJ0X2JsayArIGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIGxlbiAtIDEpOwo+Pj4+PiB0aGFua3Mh
Cj4+Pj4+PiAgICAgIG5leHQ6Cj4+Pj4+PiAgICAgICAgICAgIG1lbXNldCgmbWFwLCAwLCBzaXpl
b2YobWFwKSk7Cj4+Pj4+PiAgICAgICAgICAgIG1hcC5tX2xibGsgPSBzdGFydF9ibGs7Cj4+Pj4+
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9mMmZzX2ZzLmggYi9pbmNsdWRlL2xpbnV4L2Yy
ZnNfZnMuaAo+Pj4+Pj4gaW5kZXggYjBiODIxZWRmZDk3Li45NTRlOGU4MzQ0YjcgMTAwNjQ0Cj4+
Pj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L2YyZnNfZnMuaAo+Pj4+Pj4gKysrIGIvaW5jbHVkZS9s
aW51eC9mMmZzX2ZzLmgKPj4+Pj4+IEBAIC0yNCwxMCArMjQsMTEgQEAKPj4+Pj4+ICAgICAgI2Rl
ZmluZSBORVdfQUREUiAgICAgICAgICAgICAgKChibG9ja190KS0xKSAgIC8qIHVzZWQgYXMgYmxv
Y2tfdCBhZGRyZXNzZXMgKi8KPj4+Pj4+ICAgICAgI2RlZmluZSBDT01QUkVTU19BRERSICAgICAg
ICAgKChibG9ja190KS0yKSAgIC8qIHVzZWQgYXMgY29tcHJlc3NlZCBkYXRhIGZsYWcgKi8KPj4+
Pj4+Cj4+Pj4+PiArI2RlZmluZSBGMkZTX0JMS1NJWkVfTUFTSyAgICAgICAgICAgICAgKEYyRlNf
QkxLU0laRSAtIDEpCj4+Pj4+PiAgICAgICNkZWZpbmUgRjJGU19CWVRFU19UT19CTEsoYnl0ZXMp
ICAgICAgKChieXRlcykgPj4gRjJGU19CTEtTSVpFX0JJVFMpCj4+Pj4+PiAgICAgICNkZWZpbmUg
RjJGU19CTEtfVE9fQllURVMoYmxrKSAgICAgICAgICAgICAgICAoKGJsaykgPDwgRjJGU19CTEtT
SVpFX0JJVFMpCj4+Pj4+PiAgICAgICNkZWZpbmUgRjJGU19CTEtfRU5EX0JZVEVTKGJsaykgICAg
ICAgICAgICAgICAoRjJGU19CTEtfVE9fQllURVMoYmxrICsgMSkgLSAxKQo+Pj4+Pj4gLSNkZWZp
bmUgRjJGU19CTEtfQUxJR04oeCkgICAgICAgICAgICAgICAgICAgICAgKEYyRlNfQllURVNfVE9f
QkxLKCh4KSArIEYyRlNfQkxLU0laRSAtIDEpKQo+Pj4+Pj4gKyNkZWZpbmUgRjJGU19CTEtfQUxJ
R04oeCkgICAgICAgICAgICAgIChGMkZTX0JZVEVTX1RPX0JMSygoeCkgKyBGMkZTX0JMS1NJWkUg
LSAxKSkKPj4+Pj4+Cj4+Pj4+PiAgICAgIC8qIDAsIDEobm9kZSBuaWQpLCAyKG1ldGEgbmlkKSBh
cmUgcmVzZXJ2ZWQgbm9kZSBpZCAqLwo+Pj4+Pj4gICAgICAjZGVmaW5lIEYyRlNfUkVTRVJWRURf
Tk9ERV9OVU0gICAgICAgICAgICAgICAgMwo+Pj4+Pj4gLS0KPj4+Pj4+IDIuNDAuMQo+Pj4+Pj4K
Pj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4+IFRoYW5rcwo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGFua3MsCj4+
Pj4+Pj4+Cj4+Pj4+Pj4+PiBidXQgb3ZlcmFsbCBsYXN0X2JsayB3aWxsIGNoYW5nZSBsb29wIGNv
dW50cyBidXQgaGFzIG5vdCBhZmZlY3Qgb24gdGhlIHJlc3VsdHMuCj4+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+PiBTaG91bGQgd2Ugcm91bmRfdXAgbGVuIGFmdGVyIHN0YXJ0X2JsayAmIGxhc3RfYmxrIGNh
bGN1bGF0aW9uPwo+Pj4+Pj4+Pj4gSSB0aGlua3MgaXQgaXMgb2sgLGJ1dCBqdXN0IGEgbGl0dGxl
IGJpdCByZWR1bmRhbnQgd2l0aCB0aGUgZm9sbG93aW5nCj4+Pj4+Pj4+PiBoYW5kbGluZyBhYm91
dCBsZW4uCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gaWYgKGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIGxlbikg
PT0gMCkKPj4+Pj4+Pj4+ICAgICAgICAgbGVuID0gYmxrc190b19ieXRlcyhpbm9kZSwgMSk7Cj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gQmFzZWQgb24gdGhlIGFib3ZlIHNpdHVhdGlvbiwKPj4+Pj4+Pj4+
IGRvIHlvdSBoYXZlIGFueSBvdGhlciBnb29kIHN1Z2dlc3Rpb25zPyBeXgo+Pj4+Pj4+Pj4gdGhh
bmtzIQo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IFRoYW5rcywKPj4+Pj4+Pj4+Pgo+
Pj4+Pj4+Pj4+PiB0aGFua3PvvIEKPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBUaGFua3MsCj4+
Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Cj4+Pj4+Pgo+Pj4+Cj4+CgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
