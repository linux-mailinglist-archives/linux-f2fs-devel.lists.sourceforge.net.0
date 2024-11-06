Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1328C9BDEFA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Nov 2024 07:45:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t8ZnV-0007Hk-0k;
	Wed, 06 Nov 2024 06:45:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t8ZnT-0007Hd-Es
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Nov 2024 06:45:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RLHTqs//0lXJg/ZXKzeFflmvZ1S+42pUYKLxuRucfdk=; b=akWLsMngkJsd6+EaeI08hFDdQG
 rxrqYBgVj0Z1qxbJbw8XWnla32ftyxTSo9GTV0Uocm92tOp7plSMaMHzQ2F3+nWAodNxX8YyOyu/Q
 m7JtcORiu86GVjmTu4gLK1UVJiw4GM+g5OvnREK4/IEmqHvZSeAxmFKwsEYZDr2tBvag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RLHTqs//0lXJg/ZXKzeFflmvZ1S+42pUYKLxuRucfdk=; b=P1Z7EeWoSZTTpLu/nXJ2oW6PUK
 onnxWjPjOACa8MzLYm007uoH9aoRrmOEGUXcT96CTK3tCqUVtu5V/r20ofCnAico6Egi+rTJrL5um
 SS/sHFqRTVmLmqu81t4BBq3bc0qWjV7jIaTPPIpN81GwkpwGvXy64GbUzUBwOfjxysu8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t8ZnR-00051y-Sw for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Nov 2024 06:45:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C7E045C57AA;
 Wed,  6 Nov 2024 06:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D26C4CECD;
 Wed,  6 Nov 2024 06:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730875531;
 bh=GlLf6Hkk7e1AVLiSHShAMeoAmXTmcLqtDSDRg8afEZ4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=DN34RfFzkmOt3xEZ0RGYpp4SlZ9/eE9g5MVaFilQz+pJQ83Wm6tdqoYqoCquBO2xa
 L+vbCow54WXNEYq7UO2FjMndkD8K1EJmSLidh/nXNR79Ab7Kcw7T4f79ezCVF4HnVl
 31aos3EGA5mwRz29wyQMfEd7QNzQoCXzpgyfVR/sAQO/YFOFqrRVgQrUU1T6f2HoDC
 7u6hvE1WZVvzid1JGjns6TTXKhnu2KDTU/J5Xs7+xnMOxScR4oVY/GTt/Q0KRvgSAV
 BPWeoxA5+GefMbt0DGBiCGJQsaevjOhVEjnI0DYg12k7dpSIpPGAdxkS+tms1C57G4
 1E9JYf0NfLz0Q==
Message-ID: <c2aa0e38-84ff-4fd6-97ca-cba966eba768@kernel.org>
Date: Wed, 6 Nov 2024 14:45:27 +0800
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
 <CAHJ8P3Jm1+BdGsHNB03tDug8JgEtxkM9A3BE9wectE_khGgDhQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3Jm1+BdGsHNB03tDug8JgEtxkM9A3BE9wectE_khGgDhQ@mail.gmail.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/11/6 10:54, Zhiguo Niu wrote: > Chao Yu <chao@kernel.org>
    于2024年11月6日周三 10:40写道： >> >> On 2024/11/6 10:26, Zhiguo
    Niu wrote: >>> Chao Yu <chao@kernel.org> 于2024年11月6日 [...] 
 
 Content analysis details:   (-5.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t8ZnR-00051y-Sw
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

T24gMjAyNC8xMS82IDEwOjU0LCBaaGlndW8gTml1IHdyb3RlOgo+IENoYW8gWXUgPGNoYW9Aa2Vy
bmVsLm9yZz4g5LqOMjAyNOW5tDEx5pyINuaXpeWRqOS4iSAxMDo0MOWGmemBk++8mgo+Pgo+PiBP
biAyMDI0LzExLzYgMTA6MjYsIFpoaWd1byBOaXUgd3JvdGU6Cj4+PiBDaGFvIFl1IDxjaGFvQGtl
cm5lbC5vcmc+IOS6jjIwMjTlubQxMeaciDbml6XlkajkuIkgMTA6MTblhpnpgZPvvJoKPj4+Pgo+
Pj4+IE9uIDIwMjQvMTEvNSAxOTowMiwgWmhpZ3VvIE5pdSB3cm90ZToKPj4+Pj4gQ2hhbyBZdSA8
Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg15pel5ZGo5LqMIDE4OjM55YaZ6YGT77ya
Cj4+Pj4+Pgo+Pj4+Pj4gT24gMjAyNC8xMS81IDE1OjI4LCBaaGlndW8gTml1IHdyb3RlOgo+Pj4+
Pj4+IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4g5LqOMjAyNOW5tDEx5pyINeaXpeWRqOS6jCAx
NTowNOWGmemBk++8mgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBPbiAyMDI0LzExLzQgOTo1NiwgWmhpZ3Vv
IE5pdSB3cm90ZToKPj4+Pj4+Pj4+IElmIHVzZXIgZ2l2ZSBhIGZpbGUgc2l6ZSBhcyAibGVuZ3Ro
IiBwYXJhbWV0ZXIgZm9yIGZpZW1hcAo+Pj4+Pj4+Pj4gb3BlcmF0aW9ucywgYnV0IGlmIHRoaXMg
c2l6ZSBpcyBub24tYmxvY2sgc2l6ZSBhbGlnbmVkLAo+Pj4+Pj4+Pj4gaXQgd2lsbCBzaG93IDIg
c2VnbWVudHMgZmllbWFwIHJlc3VsdHMgZXZlbiB0aGlzIHdob2xlIGZpbGUKPj4+Pj4+Pj4+IGlz
IGNvbnRpZ3VvdXMgb24gZGlzaywgc3VjaCBhcyB0aGUgZm9sbG93aW5nIHJlc3VsdHM6Cj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4gICAgICAgLi9mMmZzX2lvIGZpZW1hcCAwIDE5MDM0IHlsb2cvYW5hbHl6
ZXIucHkKPj4+Pj4+Pj4+IEZpZW1hcDogb2Zmc2V0ID0gMCBsZW4gPSAxOTAzNAo+Pj4+Pj4+Pj4g
ICAgICAgICAgICAgIGxvZ2ljYWwgYWRkci4gICAgcGh5c2ljYWwgYWRkci4gICBsZW5ndGggICAg
ICAgICAgIGZsYWdzCj4+Pj4+Pj4+PiAwICAgICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAy
MGJhYTAwMCAwMDAwMDAwMDAwMDA0MDAwIDAwMDAxMDAwCj4+Pj4+Pj4+PiAxICAgICAgIDAwMDAw
MDAwMDAwMDQwMDAgMDAwMDAwMDAyMGJhZTAwMCAwMDAwMDAwMDAwMDAxMDAwIDAwMDAxMDAxCj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gYWZ0ZXIgdGhpcyBwYXRjaDoKPj4+Pj4+Pj4+IC4vZjJmc19pbyBm
aWVtYXAgMCAxOTAzNCB5bG9nL2FuYWx5emVyLnB5Cj4+Pj4+Pj4+PiBGaWVtYXA6IG9mZnNldCA9
IDAgbGVuID0gMTkwMzQKPj4+Pj4+Pj4+ICAgICAgICAgIGxvZ2ljYWwgYWRkci4gICAgcGh5c2lj
YWwgYWRkci4gICBsZW5ndGggICAgICAgICAgIGZsYWdzCj4+Pj4+Pj4+PiAwICAgIDAwMDAwMDAw
MDAwMDAwMDAgMDAwMDAwMDAzMTVmMzAwMCAwMDAwMDAwMDAwMDA1MDAwIDAwMDAxMDAxCj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlz
b2MuY29tPgo+Pj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+PiBWMjogY29ycmVjdCBjb21taXQgbXNnIGFj
Y29yZGluZyB0byBDaGFvJ3MgcXVlc3Rpb25zCj4+Pj4+Pj4+PiBmMmZzX2lvIGhhcyBiZWVuIG1v
ZGlmaWVkIGZvciB0ZXN0aW5nLCB0aGUgbGVuZ3RoIGZvciBmaWVtYXAgaXMKPj4+Pj4+Pj4+IHJl
YWwgZmlsZSBzaXplLCBub3QgYmxvY2sgbnVtYmVyCj4+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4+ICAg
ICAgIGZzL2YyZnMvZGF0YS5jIHwgNCArKy0tCj4+Pj4+Pj4+PiAgICAgICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IGRp
ZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4+Pj4+Pj4+PiBpbmRl
eCAzMDZiODZiMC4uOWZjMjI5ZCAxMDA2NDQKPj4+Pj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5j
Cj4+Pj4+Pj4+PiArKysgYi9mcy9mMmZzL2RhdGEuYwo+Pj4+Pj4+Pj4gQEAgLTE5NjYsOCArMTk2
Niw4IEBAIGludCBmMmZzX2ZpZW1hcChzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmllbWFw
X2V4dGVudF9pbmZvICpmaWVpbmZvLAo+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICBnb3RvIG91dDsKPj4+Pj4+Pj4+ICAgICAgICAgICB9Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gLSAg
ICAgaWYgKGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIGxlbikgPT0gMCkKPj4+Pj4+Pj4+IC0gICAgICAg
ICAgICAgbGVuID0gYmxrc190b19ieXRlcyhpbm9kZSwgMSk7Cj4+Pj4+Pj4+PiArICAgICBpZiAo
bGVuICYgKGJsa3NfdG9fYnl0ZXMoaW5vZGUsIDEpIC0gMSkpCj4+Pj4+Pj4+PiArICAgICAgICAg
ICAgIGxlbiA9IHJvdW5kX3VwKGxlbiwgYmxrc190b19ieXRlcyhpbm9kZSwgMSkpOwo+Pj4+Pj4+
Pgo+Pj4+Pj4+PiBIb3cgZG8geW91IHRoaW5rIG9mIGdldHRpbmcgcmlkIG9mIGFib3ZlIGFsaWdu
bWVudCBmb3IgbGVuPwo+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+ICAgICAgICAgICBzdGFy
dF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCk7Cj4+Pj4+Pj4+PiAgICAgICAgICAg
bGFzdF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCArIGxlbiAtIDEpOwo+Pj4+Pj4+
Pgo+Pj4+Pj4+PiBBbmQgcm91bmQgdXAgZW5kIHBvc2l0aW9uIHcvOgo+Pj4+Pj4+Pgo+Pj4+Pj4+
PiBsYXN0X2JsayA9IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIHJvdW5kX3VwKHN0YXJ0ICsgbGVuIC0g
MSwgRjJGU19CTEtTSVpFKSk7Cj4+Pj4+Pj4gSGkgQ2hhbywKPj4+Pj4+PiBJIHRoaW5rIHRoaXMg
d2lsbCBjaGFuZ2UgdGhlIGN1cnJlbnQgY29kZSBsb2dpYwo+Pj4+Pj4+IC0tLS0tLS0tLS0tLS0K
Pj4+Pj4+PiBpZiAoc3RhcnRfYmxrID4gbGFzdF9ibGspCj4+Pj4+Pj4gICAgICAgICBnb3RvIG91
dDsKPj4+Pj4+PiAtLS0tLS0tLS0tLS0tCj4+Pj4+Pj4gZm9yIGV4YW1wbGUsIGEgZmlsZSB3aXRo
IHNpemUgMTkwMDYsIGJ1dCB0aGUgbGVuZ3RoIGZyb20gdGhlIHVzZXIgaXMgMTYzODQuCj4+Pj4+
Pj4gYmVmb3JlIHRoaXMgbW9kaWZpY2F0aW9uLCAgbGFzdF9ibGsgPSAgYnl0ZXNfdG9fYmxrcyhp
bm9kZSwgc3RhcnQgKwo+Pj4+Pj4+IGxlbiAtIDEpID0gKGlub2RlLCAxNjM4MykgPSAzCj4+Pj4+
Pj4gYWZ0ZXIgdGhlIGZpcnN0IGYyZnNfbWFwX2Jsb2NrcygpLiBzdGFydF9ibGsgY2hhbmdlIHRv
IGJlIDQsCj4+Pj4+Pj4gYWZ0ZXIgdGhlIHNlY29uZCBmMmZzX21hcF9ibG9ja3MoKSwgZmllbWFw
X2ZpbGxfbmV4X2V4dGVuIHdpbGwgYmUKPj4+Pj4+PiBjYWxsZWQgdG8gZmlsbCB1c2VyIHBhcmFt
ZXRlciBhbmQgdGhlbgo+Pj4+Pj4+IHdpbGwgZ290byBvdXQgYmVjYXVzZSBzdGFydF9ibGsgPiBs
YXN0X2JsaywgdGhlbiBmaWVtYXAgZmxvdyBmaW5pc2hlcy4KPj4+Pj4+PiBidXQgYWZ0ZXIgdGhp
cyBtb2RpZmljYXRpb24sIGxhc3RfYmxrIHdpbGwgYmUgNAo+Pj4+Pj4+IHdpbGwgZG8gZjJmc19t
YXBfYmxvY2tzKCkgdW50aWwgcmVhY2ggdGhlIG1heF9maWxlX2Jsb2Nrcyhpbm9kZSkKPj4+Pj4+
Cj4+Pj4+PiBZZXMsIHlvdSdyZSByaWdodCwgaG93ZXZlciwgdy8gdGhpcyBwYXRjaCwgaXQgbWF5
IGNoYW5nZSBsYXN0X2JsaywgZS5nLgo+Pj4+Pj4KPj4+Pj4+IHhmc19pbyBmaWxlIC1jICJmaWVt
YXAgLXYgMCAxOTAwNiIgdnMgeGZzX2lvIGZpbGUgLWMgImZpZW1hcCAtdiAyIDE5MDA2Igo+Pj4+
Pj4gc3RhcnRfYmxrIGFuZCBsYXN0X2JsayB3aWxsIGJlOiAwLCA0IGFuZCAwLCA1Lgo+Pj4+PiBI
aSBDaGFvLAo+Pj4+PiB5ZXMsIGJ1dCB3L28gdGhpcyBwYXRjaCAsIHRoZSBvcmlnaW5hbCBjb2Rl
IHN0aWxsIGhhcyB0aGUgc2FtZSBzaXR1YXRpb24/Pwo+Pj4+PiBmb3IgZXhhbXBsZQo+Pj4+PiB4
ZnNfaW8gZmlsZSAtYyAiZmllbWFwIC12IDAgMTYzODQiIHZzIHhmc19pbyBmaWxlIC1jICJmaWVt
YXAgLXYgMiAxNjM4NCIKPj4+Pj4gc3RhcnRfYmxrIGFuZCBsYXN0X2JsayB3aWxsIGJlOiAwLCAz
IGFuZCAwLCA0Lgo+Pj4+Cj4+Pj4gRm9yIHRoZSBjYXNlICJmaWVtYXAgLXYgMiAxOTAwNiIsIG9m
ZnNldCBpcyAyLCBhbmQgbGVuZ3RoIGlzIDE5MDA2LCBzbyBsYXN0X29mZnNldAo+Pj4+IGlzIDE5
MDA4LCBhbmQgbGFzdF9ibGsgc2hvdWxkIGJlIDQgcmF0aGVyIHRoYW4gNSwgcmlnaHQ/Cj4+PiBo
aSBDaGFvLAo+Pj4gaXQgaXMgcmlnaHQgdy9vIG15IHBhdGNoLgo+Pj4+Cj4+Pj4gQW5kIGZvciB5
b3UgY2FzZSwgaXQgY2FsY3VsYXRlcyBsYXN0X2JsayBjb3JyZWN0bHkuCj4+PiBTbyB5b3Ugc3Vn
Z2VzdCB0aGF0ICJTaG91bGQgd2Ugcm91bmRfdXAgbGVuIGFmdGVyIHN0YXJ0X2JsayAmIGxhc3Rf
YmxrCj4+PiBjYWxjdWxhdGlvbj8iCj4+Cj4+IFpoaWd1bywKPj4KPj4gWWVzLCBJIHRoaW5rIGFs
aWdubWVudCBvZiBsZW4gc2hvdWxkIG5vdCBhZmZlY3QgY2FsY3VsYXRpb24gb2YgbGFzdF9ibGsu
Cj4+Cj4+IEkgbWVhbiB0aGlzLAo+Pgo+PiAtLS0KPj4gICAgZnMvZjJmcy9kYXRhLmMgICAgICAg
ICAgfCA2ICsrKy0tLQo+PiAgICBpbmNsdWRlL2xpbnV4L2YyZnNfZnMuaCB8IDMgKystCj4+ICAg
IDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+PiBpbmRleCA3ZDFi
Yjk1MThhNDAuLmNiYmI5NTZmNDIwZCAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPj4g
KysrIGIvZnMvZjJmcy9kYXRhLmMKPj4gQEAgLTE5NjcsMTIgKzE5NjcsMTIgQEAgaW50IGYyZnNf
ZmllbWFwKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWVtYXBfZXh0ZW50X2luZm8gKmZp
ZWluZm8sCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPj4gICAgICAgICAg
fQo+Pgo+PiAtICAgICAgIGlmIChieXRlc190b19ibGtzKGlub2RlLCBsZW4pID09IDApCj4+IC0g
ICAgICAgICAgICAgICBsZW4gPSBibGtzX3RvX2J5dGVzKGlub2RlLCAxKTsKPj4gLQo+PiAgICAg
ICAgICBzdGFydF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCk7Cj4+ICAgICAgICAg
IGxhc3RfYmxrID0gYnl0ZXNfdG9fYmxrcyhpbm9kZSwgc3RhcnQgKyBsZW4gLSAxKTsKPj4KPj4g
KyAgICAgICBpZiAobGVuICYgRjJGU19CTEtTSVpFX01BU0spCj4+ICsgICAgICAgICAgICAgICBs
ZW4gPSByb3VuZF91cChsZW4sIEYyRlNfQkxLU0laRSk7Cj4+ICsKPiBIaSBDaGFvLAo+IEl0IGxv
b2tzIHdlbGwgYW5kIGNsZWFyLCBMZXQgbWUgdmVyaWZ5IHRoaXMuCj4gYW5vdGhlciB1bmltcG9y
dGFudCBxdWVzdGlvbnMsIGRvIHdlIG5lZWQgdG8gdXNlIG1hY29yCj4gRjJGU19CTEtTSVpFX3h4
eCBmb3Igcm91bmRfdXA/CgpaaGlndW8sCgpXZWxsLCBmMmZzIGRvZXNuJ3Qgc3VwcG9ydCBkaWZm
ZXJlbnQgYmxrc2l6ZSBpbiBvbmUgaW5zdGFuY2UsIHNvCmJ5dGVzX3RvX2Jsa3MoKSBpcyBlcXVh
bCB0byBGMkZTX0JZVEVTX1RPX0JMSygpLCBJIGd1ZXNzIHdlIGNhbgp1c2UgRjJGU19CWVRFU19U
T19CTEsoKSBpbnN0ZWFkIG9mIGJ5dGVzX3RvX2Jsa3MoKSBmb3IgY2xlYW51cCwKbGV0IG1lIGZp
Z3VyZSBvdXQgYSBwYXRjaCBmb3IgdGhhdC4KClRoYW5rcywKCj4gYmVjYXVzZSBpbiBmaWVtYXAs
IGl0IGFsbCB1c2UgYnl0ZXNfdG9fYmxrcyhpbm9kZSwgeHh4KSAvCj4gYmxrc190b19ieXRlcyhp
bm9kZSwgeHh4KQo+IHRoYW5rcyEKPj4gICAgbmV4dDoKPj4gICAgICAgICAgbWVtc2V0KCZtYXAs
IDAsIHNpemVvZihtYXApKTsKPj4gICAgICAgICAgbWFwLm1fbGJsayA9IHN0YXJ0X2JsazsKPj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZjJmc19mcy5oIGIvaW5jbHVkZS9saW51eC9mMmZz
X2ZzLmgKPj4gaW5kZXggYjBiODIxZWRmZDk3Li45NTRlOGU4MzQ0YjcgMTAwNjQ0Cj4+IC0tLSBh
L2luY2x1ZGUvbGludXgvZjJmc19mcy5oCj4+ICsrKyBiL2luY2x1ZGUvbGludXgvZjJmc19mcy5o
Cj4+IEBAIC0yNCwxMCArMjQsMTEgQEAKPj4gICAgI2RlZmluZSBORVdfQUREUiAgICAgICAgICAg
ICAgKChibG9ja190KS0xKSAgIC8qIHVzZWQgYXMgYmxvY2tfdCBhZGRyZXNzZXMgKi8KPj4gICAg
I2RlZmluZSBDT01QUkVTU19BRERSICAgICAgICAgKChibG9ja190KS0yKSAgIC8qIHVzZWQgYXMg
Y29tcHJlc3NlZCBkYXRhIGZsYWcgKi8KPj4KPj4gKyNkZWZpbmUgRjJGU19CTEtTSVpFX01BU0sg
ICAgICAgICAgICAgIChGMkZTX0JMS1NJWkUgLSAxKQo+PiAgICAjZGVmaW5lIEYyRlNfQllURVNf
VE9fQkxLKGJ5dGVzKSAgICAgICgoYnl0ZXMpID4+IEYyRlNfQkxLU0laRV9CSVRTKQo+PiAgICAj
ZGVmaW5lIEYyRlNfQkxLX1RPX0JZVEVTKGJsaykgICAgICAgICAgICAgICAgKChibGspIDw8IEYy
RlNfQkxLU0laRV9CSVRTKQo+PiAgICAjZGVmaW5lIEYyRlNfQkxLX0VORF9CWVRFUyhibGspICAg
ICAgICAgICAgICAgKEYyRlNfQkxLX1RPX0JZVEVTKGJsayArIDEpIC0gMSkKPj4gLSNkZWZpbmUg
RjJGU19CTEtfQUxJR04oeCkgICAgICAgICAgICAgICAgICAgICAgKEYyRlNfQllURVNfVE9fQkxL
KCh4KSArIEYyRlNfQkxLU0laRSAtIDEpKQo+PiArI2RlZmluZSBGMkZTX0JMS19BTElHTih4KSAg
ICAgICAgICAgICAgKEYyRlNfQllURVNfVE9fQkxLKCh4KSArIEYyRlNfQkxLU0laRSAtIDEpKQo+
Pgo+PiAgICAvKiAwLCAxKG5vZGUgbmlkKSwgMihtZXRhIG5pZCkgYXJlIHJlc2VydmVkIG5vZGUg
aWQgKi8KPj4gICAgI2RlZmluZSBGMkZTX1JFU0VSVkVEX05PREVfTlVNICAgICAgICAgICAgICAg
IDMKPj4gLS0KPj4gMi40MC4xCj4+Cj4+Cj4+Cj4+PiBUaGFua3MKPj4+Pgo+Pj4+IFRoYW5rcywK
Pj4+Pgo+Pj4+PiBidXQgb3ZlcmFsbCBsYXN0X2JsayB3aWxsIGNoYW5nZSBsb29wIGNvdW50cyBi
dXQgaGFzIG5vdCBhZmZlY3Qgb24gdGhlIHJlc3VsdHMuCj4+Pj4+Pgo+Pj4+Pj4gU2hvdWxkIHdl
IHJvdW5kX3VwIGxlbiBhZnRlciBzdGFydF9ibGsgJiBsYXN0X2JsayBjYWxjdWxhdGlvbj8KPj4+
Pj4gSSB0aGlua3MgaXQgaXMgb2sgLGJ1dCBqdXN0IGEgbGl0dGxlIGJpdCByZWR1bmRhbnQgd2l0
aCB0aGUgZm9sbG93aW5nCj4+Pj4+IGhhbmRsaW5nIGFib3V0IGxlbi4KPj4+Pj4KPj4+Pj4gaWYg
KGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIGxlbikgPT0gMCkKPj4+Pj4gICAgICAgbGVuID0gYmxrc190
b19ieXRlcyhpbm9kZSwgMSk7Cj4+Pj4+Cj4+Pj4+IEJhc2VkIG9uIHRoZSBhYm92ZSBzaXR1YXRp
b24sCj4+Pj4+IGRvIHlvdSBoYXZlIGFueSBvdGhlciBnb29kIHN1Z2dlc3Rpb25zPyBeXgo+Pj4+
PiB0aGFua3MhCj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gVGhhbmtzLAo+Pj4+Pj4KPj4+Pj4+PiB0aGFu
a3PvvIEKPj4+Pj4+Pj4KPj4+Pj4+Pj4gVGhhbmtzLAo+Pj4+Pj4+Pgo+Pj4+Pj4KPj4+Pgo+PgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
