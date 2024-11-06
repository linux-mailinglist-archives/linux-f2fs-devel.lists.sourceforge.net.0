Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C25649BDC33
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Nov 2024 03:16:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t8Vb5-0004xT-Q2;
	Wed, 06 Nov 2024 02:16:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t8Vb3-0004xH-Ix
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Nov 2024 02:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jd6QbodmNyjEqp11lbBe/WW2fNJcqxSf6+CMYluVZ6c=; b=PjsMWVmBJTcgeYIZ1sUOrYik0p
 bVRzUis1gzh6RLb2Z4QCMYDjMMnPAk9aCOH7n9QI+pl9k9VOwYobgqfqmL1J114yAl/fe4Q7OcBuo
 BQHQPC9ah4CaRX2MOey+z8YIwz23CerSiHq0agadCEs1vAUACXdzE4lYNPfiRNzikeLY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jd6QbodmNyjEqp11lbBe/WW2fNJcqxSf6+CMYluVZ6c=; b=VfE48REuXzv9eEQP6Dnq5Fii9F
 CMJxeC/OyDu3sWgMVncfDVwwUje8Y3Ovt+w9TDgVwGBxvHsAAxgXr/LnWdrtlRsnATFBCP28ryPdF
 FszjumZRtHOaQzP+8AGYS4I9rGfgOANyzfhIPfqkdW/OTiYNp0auO3CEn1oDadWHzXwc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t8Vb1-0001Je-2y for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Nov 2024 02:16:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EEC725C4BB4;
 Wed,  6 Nov 2024 02:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C423C4CED1;
 Wed,  6 Nov 2024 02:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730859384;
 bh=06l34PWhvl4tdNiJSYbSZO4mr1xYv8cmwY77xvFqw2Q=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=dSi0Z35MYmjitvBnV1jBnhBWpPchp+wG3KFIZXuY8ya7S6M9P+DXegErXesVIvIBn
 TgKj/SVY0vHbOh7TF1lgZnWeffWqby6TLMK1YsVwTojrMA8XFO1g+R7aCJTr5/ta9R
 WIAoj4ekSnvQjVLmZ5gcrdFCqjeiw67/COz2TBUo+Cwu2EzD3AqfsPg28UbQ9b/ys4
 TsYQd7p5i1/Hp6vnyIE4+P7azDxOcnov69XbBzS4U1YOtIgWRP1NVh46mH/LDnuW0X
 Xn65pf2fCjxq5IYe81/c8azbLHykJSgSg5t9+o5HmWFI8HNOHqeS4xZruqZIMcTh2q
 xq0/ic6Ai9GSg==
Message-ID: <9199e9fc-7b5b-4069-b79b-65ba5ae1b0f6@kernel.org>
Date: Wed, 6 Nov 2024 10:16:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1730685372-2995-1-git-send-email-zhiguo.niu@unisoc.com>
 <ab9f63b2-8d02-411b-8d2f-bc1b5b748ffe@kernel.org>
 <CAHJ8P3L9o2RJgV=TtUf_MPj36wasgPn7bn9FnGPXu=TgpE7ATQ@mail.gmail.com>
 <22873055-370b-4240-83ff-96bcfa91413a@kernel.org>
 <CAHJ8P3LddwapGLV5nKmw1ULTm7qp5OMk-kFBK3s_UptPPeph7w@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3LddwapGLV5nKmw1ULTm7qp5OMk-kFBK3s_UptPPeph7w@mail.gmail.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/11/5 19:02, Zhiguo Niu wrote: > Chao Yu <chao@kernel.org>
    于2024年11月5日周二 18:39写道： >> >> On 2024/11/5 15:28, Zhiguo
    Niu wrote: >>> Chao Yu <chao@kernel.org> 于2024年11月5日 [...] 
 
 Content analysis details:   (-5.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t8Vb1-0001Je-2y
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

T24gMjAyNC8xMS81IDE5OjAyLCBaaGlndW8gTml1IHdyb3RlOgo+IENoYW8gWXUgPGNoYW9Aa2Vy
bmVsLm9yZz4g5LqOMjAyNOW5tDEx5pyINeaXpeWRqOS6jCAxODozOeWGmemBk++8mgo+Pgo+PiBP
biAyMDI0LzExLzUgMTU6MjgsIFpoaWd1byBOaXUgd3JvdGU6Cj4+PiBDaGFvIFl1IDxjaGFvQGtl
cm5lbC5vcmc+IOS6jjIwMjTlubQxMeaciDXml6XlkajkuowgMTU6MDTlhpnpgZPvvJoKPj4+Pgo+
Pj4+IE9uIDIwMjQvMTEvNCA5OjU2LCBaaGlndW8gTml1IHdyb3RlOgo+Pj4+PiBJZiB1c2VyIGdp
dmUgYSBmaWxlIHNpemUgYXMgImxlbmd0aCIgcGFyYW1ldGVyIGZvciBmaWVtYXAKPj4+Pj4gb3Bl
cmF0aW9ucywgYnV0IGlmIHRoaXMgc2l6ZSBpcyBub24tYmxvY2sgc2l6ZSBhbGlnbmVkLAo+Pj4+
PiBpdCB3aWxsIHNob3cgMiBzZWdtZW50cyBmaWVtYXAgcmVzdWx0cyBldmVuIHRoaXMgd2hvbGUg
ZmlsZQo+Pj4+PiBpcyBjb250aWd1b3VzIG9uIGRpc2ssIHN1Y2ggYXMgdGhlIGZvbGxvd2luZyBy
ZXN1bHRzOgo+Pj4+Pgo+Pj4+PiAgICAgLi9mMmZzX2lvIGZpZW1hcCAwIDE5MDM0IHlsb2cvYW5h
bHl6ZXIucHkKPj4+Pj4gRmllbWFwOiBvZmZzZXQgPSAwIGxlbiA9IDE5MDM0Cj4+Pj4+ICAgICAg
ICAgICAgbG9naWNhbCBhZGRyLiAgICBwaHlzaWNhbCBhZGRyLiAgIGxlbmd0aCAgICAgICAgICAg
ZmxhZ3MKPj4+Pj4gMCAgICAgICAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMjBiYWEwMDAgMDAw
MDAwMDAwMDAwNDAwMCAwMDAwMTAwMAo+Pj4+PiAxICAgICAgIDAwMDAwMDAwMDAwMDQwMDAgMDAw
MDAwMDAyMGJhZTAwMCAwMDAwMDAwMDAwMDAxMDAwIDAwMDAxMDAxCj4+Pj4+Cj4+Pj4+IGFmdGVy
IHRoaXMgcGF0Y2g6Cj4+Pj4+IC4vZjJmc19pbyBmaWVtYXAgMCAxOTAzNCB5bG9nL2FuYWx5emVy
LnB5Cj4+Pj4+IEZpZW1hcDogb2Zmc2V0ID0gMCBsZW4gPSAxOTAzNAo+Pj4+PiAgICAgICAgbG9n
aWNhbCBhZGRyLiAgICBwaHlzaWNhbCBhZGRyLiAgIGxlbmd0aCAgICAgICAgICAgZmxhZ3MKPj4+
Pj4gMCAgICAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMzE1ZjMwMDAgMDAwMDAwMDAwMDAwNTAw
MCAwMDAwMTAwMQo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBaaGlndW8gTml1IDx6aGlndW8u
bml1QHVuaXNvYy5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiBWMjogY29ycmVjdCBjb21taXQgbXNnIGFj
Y29yZGluZyB0byBDaGFvJ3MgcXVlc3Rpb25zCj4+Pj4+IGYyZnNfaW8gaGFzIGJlZW4gbW9kaWZp
ZWQgZm9yIHRlc3RpbmcsIHRoZSBsZW5ndGggZm9yIGZpZW1hcCBpcwo+Pj4+PiByZWFsIGZpbGUg
c2l6ZSwgbm90IGJsb2NrIG51bWJlcgo+Pj4+PiAtLS0KPj4+Pj4gICAgIGZzL2YyZnMvZGF0YS5j
IHwgNCArKy0tCj4+Pj4+ICAgICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9m
MmZzL2RhdGEuYwo+Pj4+PiBpbmRleCAzMDZiODZiMC4uOWZjMjI5ZCAxMDA2NDQKPj4+Pj4gLS0t
IGEvZnMvZjJmcy9kYXRhLmMKPj4+Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPj4+Pj4gQEAgLTE5
NjYsOCArMTk2Niw4IEBAIGludCBmMmZzX2ZpZW1hcChzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1
Y3QgZmllbWFwX2V4dGVudF9pbmZvICpmaWVpbmZvLAo+Pj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICBnb3RvIG91dDsKPj4+Pj4gICAgICAgICB9Cj4+Pj4+Cj4+Pj4+IC0gICAgIGlmIChieXRl
c190b19ibGtzKGlub2RlLCBsZW4pID09IDApCj4+Pj4+IC0gICAgICAgICAgICAgbGVuID0gYmxr
c190b19ieXRlcyhpbm9kZSwgMSk7Cj4+Pj4+ICsgICAgIGlmIChsZW4gJiAoYmxrc190b19ieXRl
cyhpbm9kZSwgMSkgLSAxKSkKPj4+Pj4gKyAgICAgICAgICAgICBsZW4gPSByb3VuZF91cChsZW4s
IGJsa3NfdG9fYnl0ZXMoaW5vZGUsIDEpKTsKPj4+Pgo+Pj4+IEhvdyBkbyB5b3UgdGhpbmsgb2Yg
Z2V0dGluZyByaWQgb2YgYWJvdmUgYWxpZ25tZW50IGZvciBsZW4/Cj4+Pj4KPj4+Pj4KPj4+Pj4g
ICAgICAgICBzdGFydF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCk7Cj4+Pj4+ICAg
ICAgICAgbGFzdF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCArIGxlbiAtIDEpOwo+
Pj4+Cj4+Pj4gQW5kIHJvdW5kIHVwIGVuZCBwb3NpdGlvbiB3LzoKPj4+Pgo+Pj4+IGxhc3RfYmxr
ID0gYnl0ZXNfdG9fYmxrcyhpbm9kZSwgcm91bmRfdXAoc3RhcnQgKyBsZW4gLSAxLCBGMkZTX0JM
S1NJWkUpKTsKPj4+IEhpIENoYW8sCj4+PiBJIHRoaW5rIHRoaXMgd2lsbCBjaGFuZ2UgdGhlIGN1
cnJlbnQgY29kZSBsb2dpYwo+Pj4gLS0tLS0tLS0tLS0tLQo+Pj4gaWYgKHN0YXJ0X2JsayA+IGxh
c3RfYmxrKQo+Pj4gICAgICAgZ290byBvdXQ7Cj4+PiAtLS0tLS0tLS0tLS0tCj4+PiBmb3IgZXhh
bXBsZSwgYSBmaWxlIHdpdGggc2l6ZSAxOTAwNiwgYnV0IHRoZSBsZW5ndGggZnJvbSB0aGUgdXNl
ciBpcyAxNjM4NC4KPj4+IGJlZm9yZSB0aGlzIG1vZGlmaWNhdGlvbiwgIGxhc3RfYmxrID0gIGJ5
dGVzX3RvX2Jsa3MoaW5vZGUsIHN0YXJ0ICsKPj4+IGxlbiAtIDEpID0gKGlub2RlLCAxNjM4Mykg
PSAzCj4+PiBhZnRlciB0aGUgZmlyc3QgZjJmc19tYXBfYmxvY2tzKCkuIHN0YXJ0X2JsayBjaGFu
Z2UgdG8gYmUgNCwKPj4+IGFmdGVyIHRoZSBzZWNvbmQgZjJmc19tYXBfYmxvY2tzKCksIGZpZW1h
cF9maWxsX25leF9leHRlbiB3aWxsIGJlCj4+PiBjYWxsZWQgdG8gZmlsbCB1c2VyIHBhcmFtZXRl
ciBhbmQgdGhlbgo+Pj4gd2lsbCBnb3RvIG91dCBiZWNhdXNlIHN0YXJ0X2JsayA+IGxhc3RfYmxr
LCB0aGVuIGZpZW1hcCBmbG93IGZpbmlzaGVzLgo+Pj4gYnV0IGFmdGVyIHRoaXMgbW9kaWZpY2F0
aW9uLCBsYXN0X2JsayB3aWxsIGJlIDQKPj4+IHdpbGwgZG8gZjJmc19tYXBfYmxvY2tzKCkgdW50
aWwgcmVhY2ggdGhlIG1heF9maWxlX2Jsb2Nrcyhpbm9kZSkKPj4KPj4gWWVzLCB5b3UncmUgcmln
aHQsIGhvd2V2ZXIsIHcvIHRoaXMgcGF0Y2gsIGl0IG1heSBjaGFuZ2UgbGFzdF9ibGssIGUuZy4K
Pj4KPj4geGZzX2lvIGZpbGUgLWMgImZpZW1hcCAtdiAwIDE5MDA2IiB2cyB4ZnNfaW8gZmlsZSAt
YyAiZmllbWFwIC12IDIgMTkwMDYiCj4+IHN0YXJ0X2JsayBhbmQgbGFzdF9ibGsgd2lsbCBiZTog
MCwgNCBhbmQgMCwgNS4KPiBIaSBDaGFvLAo+IHllcywgYnV0IHcvbyB0aGlzIHBhdGNoICwgdGhl
IG9yaWdpbmFsIGNvZGUgc3RpbGwgaGFzIHRoZSBzYW1lIHNpdHVhdGlvbj8/Cj4gZm9yIGV4YW1w
bGUKPiB4ZnNfaW8gZmlsZSAtYyAiZmllbWFwIC12IDAgMTYzODQiIHZzIHhmc19pbyBmaWxlIC1j
ICJmaWVtYXAgLXYgMiAxNjM4NCIKPiBzdGFydF9ibGsgYW5kIGxhc3RfYmxrIHdpbGwgYmU6IDAs
IDMgYW5kIDAsIDQuCgpGb3IgdGhlIGNhc2UgImZpZW1hcCAtdiAyIDE5MDA2Iiwgb2Zmc2V0IGlz
IDIsIGFuZCBsZW5ndGggaXMgMTkwMDYsIHNvIGxhc3Rfb2Zmc2V0CmlzIDE5MDA4LCBhbmQgbGFz
dF9ibGsgc2hvdWxkIGJlIDQgcmF0aGVyIHRoYW4gNSwgcmlnaHQ/CgpBbmQgZm9yIHlvdSBjYXNl
LCBpdCBjYWxjdWxhdGVzIGxhc3RfYmxrIGNvcnJlY3RseS4KClRoYW5rcywKCj4gYnV0IG92ZXJh
bGwgbGFzdF9ibGsgd2lsbCBjaGFuZ2UgbG9vcCBjb3VudHMgYnV0IGhhcyBub3QgYWZmZWN0IG9u
IHRoZSByZXN1bHRzLgo+Pgo+PiBTaG91bGQgd2Ugcm91bmRfdXAgbGVuIGFmdGVyIHN0YXJ0X2Js
ayAmIGxhc3RfYmxrIGNhbGN1bGF0aW9uPwo+IEkgdGhpbmtzIGl0IGlzIG9rICxidXQganVzdCBh
IGxpdHRsZSBiaXQgcmVkdW5kYW50IHdpdGggdGhlIGZvbGxvd2luZwo+IGhhbmRsaW5nIGFib3V0
IGxlbi4KPiAKPiBpZiAoYnl0ZXNfdG9fYmxrcyhpbm9kZSwgbGVuKSA9PSAwKQo+ICAgICBsZW4g
PSBibGtzX3RvX2J5dGVzKGlub2RlLCAxKTsKPiAKPiBCYXNlZCBvbiB0aGUgYWJvdmUgc2l0dWF0
aW9uLAo+IGRvIHlvdSBoYXZlIGFueSBvdGhlciBnb29kIHN1Z2dlc3Rpb25zPyBeXgo+IHRoYW5r
cyEKPiAKPj4KPj4gVGhhbmtzLAo+Pgo+Pj4gdGhhbmtz77yBCj4+Pj4KPj4+PiBUaGFua3MsCj4+
Pj4KPj4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=
