Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 789E59C138F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2024 02:22:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t9Dhb-0000Z1-L0;
	Fri, 08 Nov 2024 01:22:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t9DhZ-0000YR-Pc
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Nov 2024 01:22:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M6rcKi8/UbLamAzQabgS/FY5dt3r+ja33a98RmdeI1A=; b=Qw+Sy6/oK4OdiwY8bYjapF8fZ2
 ynJlpquXDVg8UobDZJ640suzKxQUBECiAxaw8PLet53cUzc5HV5pPKbnGYb+mRYkcWKRONuxQoLmE
 F/PrjGjSUPB0VJxd8RzC2cHf1+l+F8E/wSrNgwYk6wTM+1DNzYLuiyXAgsS+y2AQ6U8M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M6rcKi8/UbLamAzQabgS/FY5dt3r+ja33a98RmdeI1A=; b=LDCbCXBaczEFoklFQEq8o2Bq9v
 3pzkJgr2dWJJ5kAbhQL5ztZX03+47+1PgWqVJnJbE+W7Wt1tS2H1I8HPHzWMBjLXzdOtMH7Rb+zeO
 b20mVMW2tM1qU5q03+3WNNRxj9x0C0hHclgQBwSr1/7UpC3N6soXjvzPTK11kvTl19mo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t9DhZ-0005tM-DS for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Nov 2024 01:22:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 502685C1180;
 Fri,  8 Nov 2024 01:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1D6C4CECC;
 Fri,  8 Nov 2024 01:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731028926;
 bh=5QtDR8iJCH9aQQFB2GLpbdMki7rkE3Rcs4N4c/N1okU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ba4wXUQu3ufQ26v9y2UPV91MEtNuM3hgWFuj8FRpiLiqD9g1lqWGPc2ZNnGpctCe/
 9YI12Izop4cf50atUeSnYyZY99kVMHSfkfHvF/6HyQtBk8ljKCOmKo7XnTHxhS7FEE
 pl1wims1f9NR3spG1ReYvsBZNk5qv3bhApxJBAgkMqihvxSl8peU0vbp4GsUDF++Vd
 anXYauTVf9jqluLo89wZP1HHsy/3U2HYZGGgo6m/eSoDL3UP/sopHQSyJixNiV8vNw
 ncfSxz5Phtd7u2wVU8Titmk8iOjU1KRTBk76/P/zYgEby/9oG71fyvzoIlOiYCY2KS
 fkIGaipWuZsdg==
Message-ID: <e2e61445-c1fd-4b88-8402-b9f83111e05e@kernel.org>
Date: Fri, 8 Nov 2024 09:22:00 +0800
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
 <45cec698-2679-435b-b62a-ebe22d361955@kernel.org>
 <CAHJ8P3LWwA=VzKcr3nXO1uZtkc1H9dmO+5dNy247A2fGn6JHDA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3LWwA=VzKcr3nXO1uZtkc1H9dmO+5dNy247A2fGn6JHDA@mail.gmail.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/11/7 18:53, Zhiguo Niu wrote: > Chao Yu <chao@kernel.org>
    于2024年11月7日周四 16:22写道： >> >> On 2024/11/7 14:54, Zhiguo
    Niu wrote: >>> Chao Yu <chao@kernel.org> 于2024年11月7日 [...] 
 
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
X-Headers-End: 1t9DhZ-0005tM-DS
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

T24gMjAyNC8xMS83IDE4OjUzLCBaaGlndW8gTml1IHdyb3RlOgo+IENoYW8gWXUgPGNoYW9Aa2Vy
bmVsLm9yZz4g5LqOMjAyNOW5tDEx5pyIN+aXpeWRqOWbmyAxNjoyMuWGmemBk++8mgo+Pgo+PiBP
biAyMDI0LzExLzcgMTQ6NTQsIFpoaWd1byBOaXUgd3JvdGU6Cj4+PiBDaGFvIFl1IDxjaGFvQGtl
cm5lbC5vcmc+IOS6jjIwMjTlubQxMeaciDfml6Xlkajlm5sgMTQ6MTjlhpnpgZPvvJoKPj4+Pgo+
Pj4+IE9uIDIwMjQvMTEvNiAxNjo0MSwgWmhpZ3VvIE5pdSB3cm90ZToKPj4+Pj4gQ2hhbyBZdSA8
Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg25pel5ZGo5LiJIDE1OjQw5YaZ6YGT77ya
Cj4+Pj4+Pgo+Pj4+Pj4gT24gMjAyNC8xMS82IDE0OjA4LCBaaGlndW8gTml1IHdyb3RlOgo+Pj4+
Pj4+IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4g5LqOMjAyNOW5tDEx5pyINuaXpeWRqOS4iSAx
MDo0MOWGmemBk++8mgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBPbiAyMDI0LzExLzYgMTA6MjYsIFpoaWd1
byBOaXUgd3JvdGU6Cj4+Pj4+Pj4+PiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IOS6jjIwMjTl
ubQxMeaciDbml6XlkajkuIkgMTA6MTblhpnpgZPvvJoKPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IE9u
IDIwMjQvMTEvNSAxOTowMiwgWmhpZ3VvIE5pdSB3cm90ZToKPj4+Pj4+Pj4+Pj4gQ2hhbyBZdSA8
Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg15pel5ZGo5LqMIDE4OjM55YaZ6YGT77ya
Cj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4gT24gMjAyNC8xMS81IDE1OjI4LCBaaGlndW8gTml1
IHdyb3RlOgo+Pj4+Pj4+Pj4+Pj4+IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4g5LqOMjAyNOW5
tDEx5pyINeaXpeWRqOS6jCAxNTowNOWGmemBk++8mgo+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+
Pj4+PiBPbiAyMDI0LzExLzQgOTo1NiwgWmhpZ3VvIE5pdSB3cm90ZToKPj4+Pj4+Pj4+Pj4+Pj4+
IElmIHVzZXIgZ2l2ZSBhIGZpbGUgc2l6ZSBhcyAibGVuZ3RoIiBwYXJhbWV0ZXIgZm9yIGZpZW1h
cAo+Pj4+Pj4+Pj4+Pj4+Pj4gb3BlcmF0aW9ucywgYnV0IGlmIHRoaXMgc2l6ZSBpcyBub24tYmxv
Y2sgc2l6ZSBhbGlnbmVkLAo+Pj4+Pj4+Pj4+Pj4+Pj4gaXQgd2lsbCBzaG93IDIgc2VnbWVudHMg
ZmllbWFwIHJlc3VsdHMgZXZlbiB0aGlzIHdob2xlIGZpbGUKPj4+Pj4+Pj4+Pj4+Pj4+IGlzIGNv
bnRpZ3VvdXMgb24gZGlzaywgc3VjaCBhcyB0aGUgZm9sbG93aW5nIHJlc3VsdHM6Cj4+Pj4+Pj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAgLi9mMmZzX2lvIGZpZW1hcCAwIDE5MDM0
IHlsb2cvYW5hbHl6ZXIucHkKPj4+Pj4+Pj4+Pj4+Pj4+IEZpZW1hcDogb2Zmc2V0ID0gMCBsZW4g
PSAxOTAzNAo+Pj4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgIGxvZ2ljYWwgYWRkci4gICAg
cGh5c2ljYWwgYWRkci4gICBsZW5ndGggICAgICAgICAgIGZsYWdzCj4+Pj4+Pj4+Pj4+Pj4+PiAw
ICAgICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAyMGJhYTAwMCAwMDAwMDAwMDAwMDA0MDAw
IDAwMDAxMDAwCj4+Pj4+Pj4+Pj4+Pj4+PiAxICAgICAgIDAwMDAwMDAwMDAwMDQwMDAgMDAwMDAw
MDAyMGJhZTAwMCAwMDAwMDAwMDAwMDAxMDAwIDAwMDAxMDAxCj4+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+
Pj4+Pj4+Pj4+Pj4gYWZ0ZXIgdGhpcyBwYXRjaDoKPj4+Pj4+Pj4+Pj4+Pj4+IC4vZjJmc19pbyBm
aWVtYXAgMCAxOTAzNCB5bG9nL2FuYWx5emVyLnB5Cj4+Pj4+Pj4+Pj4+Pj4+PiBGaWVtYXA6IG9m
ZnNldCA9IDAgbGVuID0gMTkwMzQKPj4+Pj4+Pj4+Pj4+Pj4+ICAgICAgICAgICAgIGxvZ2ljYWwg
YWRkci4gICAgcGh5c2ljYWwgYWRkci4gICBsZW5ndGggICAgICAgICAgIGZsYWdzCj4+Pj4+Pj4+
Pj4+Pj4+PiAwICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAzMTVmMzAwMCAwMDAwMDAwMDAw
MDA1MDAwIDAwMDAxMDAxCj4+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+Pj4gU2lnbmVkLW9m
Zi1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlzb2MuY29tPgo+Pj4+Pj4+Pj4+Pj4+Pj4g
LS0tCj4+Pj4+Pj4+Pj4+Pj4+PiBWMjogY29ycmVjdCBjb21taXQgbXNnIGFjY29yZGluZyB0byBD
aGFvJ3MgcXVlc3Rpb25zCj4+Pj4+Pj4+Pj4+Pj4+PiBmMmZzX2lvIGhhcyBiZWVuIG1vZGlmaWVk
IGZvciB0ZXN0aW5nLCB0aGUgbGVuZ3RoIGZvciBmaWVtYXAgaXMKPj4+Pj4+Pj4+Pj4+Pj4+IHJl
YWwgZmlsZSBzaXplLCBub3QgYmxvY2sgbnVtYmVyCj4+Pj4+Pj4+Pj4+Pj4+PiAtLS0KPj4+Pj4+
Pj4+Pj4+Pj4+ICAgICAgICAgIGZzL2YyZnMvZGF0YS5jIHwgNCArKy0tCj4+Pj4+Pj4+Pj4+Pj4+
PiAgICAgICAgICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+Pj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2Rh
dGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4+Pj4+Pj4+Pj4+Pj4+PiBpbmRleCAzMDZiODZiMC4uOWZj
MjI5ZCAxMDA2NDQKPj4+Pj4+Pj4+Pj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4+Pj4+Pj4+
Pj4+Pj4+PiArKysgYi9mcy9mMmZzL2RhdGEuYwo+Pj4+Pj4+Pj4+Pj4+Pj4gQEAgLTE5NjYsOCAr
MTk2Niw4IEBAIGludCBmMmZzX2ZpZW1hcChzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmll
bWFwX2V4dGVudF9pbmZvICpmaWVpbmZvLAo+Pj4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBnb3RvIG91dDsKPj4+Pj4+Pj4+Pj4+Pj4+ICAgICAgICAgICAgICB9Cj4+
Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+Pj4gLSAgICAgaWYgKGJ5dGVzX3RvX2Jsa3MoaW5v
ZGUsIGxlbikgPT0gMCkKPj4+Pj4+Pj4+Pj4+Pj4+IC0gICAgICAgICAgICAgbGVuID0gYmxrc190
b19ieXRlcyhpbm9kZSwgMSk7Cj4+Pj4+Pj4+Pj4+Pj4+PiArICAgICBpZiAobGVuICYgKGJsa3Nf
dG9fYnl0ZXMoaW5vZGUsIDEpIC0gMSkpCj4+Pj4+Pj4+Pj4+Pj4+PiArICAgICAgICAgICAgIGxl
biA9IHJvdW5kX3VwKGxlbiwgYmxrc190b19ieXRlcyhpbm9kZSwgMSkpOwo+Pj4+Pj4+Pj4+Pj4+
Pgo+Pj4+Pj4+Pj4+Pj4+PiBIb3cgZG8geW91IHRoaW5rIG9mIGdldHRpbmcgcmlkIG9mIGFib3Zl
IGFsaWdubWVudCBmb3IgbGVuPwo+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+Pj4+Pj4+ICAgICAgICAgICAgICBzdGFydF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBz
dGFydCk7Cj4+Pj4+Pj4+Pj4+Pj4+PiAgICAgICAgICAgICAgbGFzdF9ibGsgPSBieXRlc190b19i
bGtzKGlub2RlLCBzdGFydCArIGxlbiAtIDEpOwo+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+
PiBBbmQgcm91bmQgdXAgZW5kIHBvc2l0aW9uIHcvOgo+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+
Pj4+PiBsYXN0X2JsayA9IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIHJvdW5kX3VwKHN0YXJ0ICsgbGVu
IC0gMSwgRjJGU19CTEtTSVpFKSk7Cj4+Pj4+Pj4+Pj4+Pj4gSGkgQ2hhbywKPj4+Pj4+Pj4+Pj4+
PiBJIHRoaW5rIHRoaXMgd2lsbCBjaGFuZ2UgdGhlIGN1cnJlbnQgY29kZSBsb2dpYwo+Pj4+Pj4+
Pj4+Pj4+IC0tLS0tLS0tLS0tLS0KPj4+Pj4+Pj4+Pj4+PiBpZiAoc3RhcnRfYmxrID4gbGFzdF9i
bGspCj4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAgICBnb3RvIG91dDsKPj4+Pj4+Pj4+Pj4+PiAtLS0t
LS0tLS0tLS0tCj4+Pj4+Pj4+Pj4+Pj4gZm9yIGV4YW1wbGUsIGEgZmlsZSB3aXRoIHNpemUgMTkw
MDYsIGJ1dCB0aGUgbGVuZ3RoIGZyb20gdGhlIHVzZXIgaXMgMTYzODQuCj4+Pj4+Pj4+Pj4+Pj4g
YmVmb3JlIHRoaXMgbW9kaWZpY2F0aW9uLCAgbGFzdF9ibGsgPSAgYnl0ZXNfdG9fYmxrcyhpbm9k
ZSwgc3RhcnQgKwo+Pj4+Pj4+Pj4+Pj4+IGxlbiAtIDEpID0gKGlub2RlLCAxNjM4MykgPSAzCj4+
Pj4+Pj4+Pj4+Pj4gYWZ0ZXIgdGhlIGZpcnN0IGYyZnNfbWFwX2Jsb2NrcygpLiBzdGFydF9ibGsg
Y2hhbmdlIHRvIGJlIDQsCj4+Pj4+Pj4+Pj4+Pj4gYWZ0ZXIgdGhlIHNlY29uZCBmMmZzX21hcF9i
bG9ja3MoKSwgZmllbWFwX2ZpbGxfbmV4X2V4dGVuIHdpbGwgYmUKPj4+Pj4+Pj4+Pj4+PiBjYWxs
ZWQgdG8gZmlsbCB1c2VyIHBhcmFtZXRlciBhbmQgdGhlbgo+Pj4+Pj4+Pj4+Pj4+IHdpbGwgZ290
byBvdXQgYmVjYXVzZSBzdGFydF9ibGsgPiBsYXN0X2JsaywgdGhlbiBmaWVtYXAgZmxvdyBmaW5p
c2hlcy4KPj4+Pj4+Pj4+Pj4+PiBidXQgYWZ0ZXIgdGhpcyBtb2RpZmljYXRpb24sIGxhc3RfYmxr
IHdpbGwgYmUgNAo+Pj4+Pj4+Pj4+Pj4+IHdpbGwgZG8gZjJmc19tYXBfYmxvY2tzKCkgdW50aWwg
cmVhY2ggdGhlIG1heF9maWxlX2Jsb2Nrcyhpbm9kZSkKPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+
PiBZZXMsIHlvdSdyZSByaWdodCwgaG93ZXZlciwgdy8gdGhpcyBwYXRjaCwgaXQgbWF5IGNoYW5n
ZSBsYXN0X2JsaywgZS5nLgo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IHhmc19pbyBmaWxlIC1j
ICJmaWVtYXAgLXYgMCAxOTAwNiIgdnMgeGZzX2lvIGZpbGUgLWMgImZpZW1hcCAtdiAyIDE5MDA2
Igo+Pj4+Pj4+Pj4+Pj4gc3RhcnRfYmxrIGFuZCBsYXN0X2JsayB3aWxsIGJlOiAwLCA0IGFuZCAw
LCA1Lgo+Pj4+Pj4+Pj4+PiBIaSBDaGFvLAo+Pj4+Pj4+Pj4+PiB5ZXMsIGJ1dCB3L28gdGhpcyBw
YXRjaCAsIHRoZSBvcmlnaW5hbCBjb2RlIHN0aWxsIGhhcyB0aGUgc2FtZSBzaXR1YXRpb24/Pwo+
Pj4+Pj4+Pj4+PiBmb3IgZXhhbXBsZQo+Pj4+Pj4+Pj4+PiB4ZnNfaW8gZmlsZSAtYyAiZmllbWFw
IC12IDAgMTYzODQiIHZzIHhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMiAxNjM4NCIKPj4+Pj4+
Pj4+Pj4gc3RhcnRfYmxrIGFuZCBsYXN0X2JsayB3aWxsIGJlOiAwLCAzIGFuZCAwLCA0Lgo+Pj4+
Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gRm9yIHRoZSBjYXNlICJmaWVtYXAgLXYgMiAxOTAwNiIsIG9mZnNl
dCBpcyAyLCBhbmQgbGVuZ3RoIGlzIDE5MDA2LCBzbyBsYXN0X29mZnNldAo+Pj4+Pj4+Pj4+IGlz
IDE5MDA4LCBhbmQgbGFzdF9ibGsgc2hvdWxkIGJlIDQgcmF0aGVyIHRoYW4gNSwgcmlnaHQ/Cj4+
Pj4+Pj4+PiBoaSBDaGFvLAo+Pj4+Pj4+Pj4gaXQgaXMgcmlnaHQgdy9vIG15IHBhdGNoLgo+Pj4+
Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gQW5kIGZvciB5b3UgY2FzZSwgaXQgY2FsY3VsYXRlcyBsYXN0X2Js
ayBjb3JyZWN0bHkuCj4+Pj4+Pj4+PiBTbyB5b3Ugc3VnZ2VzdCB0aGF0ICJTaG91bGQgd2Ugcm91
bmRfdXAgbGVuIGFmdGVyIHN0YXJ0X2JsayAmIGxhc3RfYmxrCj4+Pj4+Pj4+PiBjYWxjdWxhdGlv
bj8iCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFpoaWd1bywKPj4+Pj4+Pj4KPj4+Pj4+Pj4gWWVzLCBJIHRo
aW5rIGFsaWdubWVudCBvZiBsZW4gc2hvdWxkIG5vdCBhZmZlY3QgY2FsY3VsYXRpb24gb2YgbGFz
dF9ibGsuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEkgbWVhbiB0aGlzLAo+Pj4+Pj4+Pgo+Pj4+Pj4+PiAt
LS0KPj4+Pj4+Pj4gICAgICAgZnMvZjJmcy9kYXRhLmMgICAgICAgICAgfCA2ICsrKy0tLQo+Pj4+
Pj4+PiAgICAgICBpbmNsdWRlL2xpbnV4L2YyZnNfZnMuaCB8IDMgKystCj4+Pj4+Pj4+ICAgICAg
IDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pj4+Pj4+
Pgo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+
Pj4+Pj4+PiBpbmRleCA3ZDFiYjk1MThhNDAuLmNiYmI5NTZmNDIwZCAxMDA2NDQKPj4+Pj4+Pj4g
LS0tIGEvZnMvZjJmcy9kYXRhLmMKPj4+Pj4+Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPj4+Pj4+
Pj4gQEAgLTE5NjcsMTIgKzE5NjcsMTIgQEAgaW50IGYyZnNfZmllbWFwKHN0cnVjdCBpbm9kZSAq
aW5vZGUsIHN0cnVjdCBmaWVtYXBfZXh0ZW50X2luZm8gKmZpZWluZm8sCj4+Pj4+Pj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPj4+Pj4+Pj4gICAgICAgICAgICAgfQo+
Pj4+Pj4+Pgo+Pj4+Pj4+PiAtICAgICAgIGlmIChieXRlc190b19ibGtzKGlub2RlLCBsZW4pID09
IDApCj4+Pj4+Pj4+IC0gICAgICAgICAgICAgICBsZW4gPSBibGtzX3RvX2J5dGVzKGlub2RlLCAx
KTsKPj4+Pj4+Pj4gLQo+Pj4+Pj4+PiAgICAgICAgICAgICBzdGFydF9ibGsgPSBieXRlc190b19i
bGtzKGlub2RlLCBzdGFydCk7Cj4+Pj4+Pj4+ICAgICAgICAgICAgIGxhc3RfYmxrID0gYnl0ZXNf
dG9fYmxrcyhpbm9kZSwgc3RhcnQgKyBsZW4gLSAxKTsKPj4+Pj4+Pj4KPj4+Pj4+Pj4gKyAgICAg
ICBpZiAobGVuICYgRjJGU19CTEtTSVpFX01BU0spCj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICBs
ZW4gPSByb3VuZF91cChsZW4sIEYyRlNfQkxLU0laRSk7Cj4+Pj4+Pj4+ICsKPj4+Pj4+PiBIaSBD
aGFvLAo+Pj4+Pj4+IHRoaXMgdmVyaW9uIHZlcmlmeSBwYXNzIHdpdGggbXkgdGVzdCBjYXNlLgo+
Pj4+Pj4+Cj4+Pj4+Pj4gYnV0IHRoZXJlIGlzIHN0aWxsIGFub3RoZXIgaXNzdWUgaW4gb3JnaW5h
bCBjb2RlOgo+Pj4+Pj4+IHlsb2cvYW5hbHl6ZXIucHkgIHNpemUgPSAxOTAzNAo+Pj4+Pj4+IGlm
IEkgaW5wdXQgdGhlIGZvbGxvd2luZyBjbWQoc3RhcnQvbGVuZ3RoIGFyZSBib3RoIHJlYWwgc2l6
ZSwgbm90IGJsb2NrIG51bWJlcikKPj4+Pj4+PiAvZjJmc19pbyBmaWVtYXAgMiAxNjM4NCB5bG9n
L2FuYWx5emVyLnB5Cj4+Pj4+Pj4gYW5kIHRoZSByZXN1bHRzIHNob3dzOgo+Pj4+Pj4+IEZpZW1h
cDogb2Zmc2V0ID0gMiBsZW4gPSAxNjM4NAo+Pj4+Pj4+ICAgICAgICAgbG9naWNhbCBhZGRyLiAg
ICBwaHlzaWNhbCBhZGRyLiAgIGxlbmd0aCAgICAgICAgICAgZmxhZ3MKPj4+Pj4+PiAwICAgIDAw
MDAwMDAwMDAwMDAwMDAgMDAwMDAwMGUyZWJjYTAwMCAwMDAwMDAwMDAwMDA0MDAwIDAwMDAxMDAw
Cj4+Pj4+Pj4gMSAgICAwMDAwMDAwMDAwMDA0MDAwIDAwMDAwMDBlMmViY2UwMDAgMDAwMDAwMDAw
MDAwMTAwMCAwMDAwMTAwMQo+Pj4+Pj4+IHNvIHN0YXJ0X2Jsay9sYXN0X2JsayBzaG91bGQgYmUg
Y2FsY3VsYXRlIGl0IGluIHRoZSBmb2xsb3dpbmcgd2F5Pwo+Pj4+Pj4KPj4+Pj4+IElJVUMsIHRo
ZSByb290IGNhdXNlIGlzIGYyZnNfbWFwX2Jsb2NrcygpIHdpbGwgdHJ1bmNhdGUgc2l6ZSBvZgo+
Pj4+Pj4gcmV0dXJuZWQgZXh0ZW50IHRvIEYyRlNfQllURVNfVE9fQkxLKGxlbiksIHNvIHdoZW5l
dmVyIHBhcmFtZXRlcgo+Pj4+Pj4gQGxlbiBkb2Vzbid0IGNvdmVyIGxhc3QgZXh0ZW50LCBpdCB0
cmlnZ2VycyB0aGlzIGJ1Zy4KPj4+Pj4+Cj4+Pj4+PiBuZXh0Ogo+Pj4+Pj4gICAgICAgICAgICBt
ZW1zZXQoJm1hcCwgMCwgc2l6ZW9mKG1hcCkpOwo+Pj4+Pj4gICAgICAgICAgICBtYXAubV9sYmxr
ID0gc3RhcnRfYmxrOwo+Pj4+Pj4gICAgICAgICAgICBtYXAubV9sZW4gPSBGMkZTX0JZVEVTX1RP
X0JMSyhsZW4pOyAgLS0tIGxpbWl0IG1heCBzaXplIG9mIGV4dGVudCBpdCBmb3VuZHMKPj4+Pj4g
eWVzLCBJIHRoaW5rIHNvIHRvby4KPj4+Pj4+ICAgICAgICAgICAgbWFwLm1fbmV4dF9wZ29mcyA9
ICZuZXh0X3Bnb2ZzOwo+Pj4+Pj4gICAgICAgICAgICBtYXAubV9zZWdfdHlwZSA9IE5PX0NIRUNL
X1RZUEU7Cj4+Pj4+PiAuLi4KPj4+Pj4+ICAgICAgICAgICAgcmV0ID0gZjJmc19tYXBfYmxvY2tz
KGlub2RlLCAmbWFwLCBGMkZTX0dFVF9CTE9DS19GSUVNQVApOwo+Pj4+Pj4KPj4+Pj4+IHhmc19p
byBmaWxlIC1jICJmaWVtYXAgLXYgMiAxNjM4NCIKPj4+Pj4+IGZpbGU6Cj4+Pj4+PiAgICAgIEVY
VDogRklMRS1PRkZTRVQgICAgICBCTE9DSy1SQU5HRSAgICAgIFRPVEFMIEZMQUdTCj4+Pj4+PiAg
ICAgICAgMDogWzAuLjMxXTogICAgICAgICAxMzkyNzIuLjEzOTMwMyAgICAgIDMyIDB4MTAwMAo+
Pj4+Pj4gICAgICAgIDE6IFszMi4uMzldOiAgICAgICAgMTM5MzA0Li4xMzkzMTEgICAgICAgOCAw
eDEwMDEKPj4+Pj4+IHhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMCAxNjM4NCIKPj4+Pj4+IGZp
bGU6Cj4+Pj4+PiAgICAgIEVYVDogRklMRS1PRkZTRVQgICAgICBCTE9DSy1SQU5HRSAgICAgIFRP
VEFMIEZMQUdTCj4+Pj4+PiAgICAgICAgMDogWzAuLjMxXTogICAgICAgICAxMzkyNzIuLjEzOTMw
MyAgICAgIDMyIDB4MTAwMAo+Pj4+Pj4geGZzX2lvIGZpbGUgLWMgImZpZW1hcCAtdiAwIDE2Mzg1
Igo+Pj4+Pj4gZmlsZToKPj4+Pj4+ICAgICAgRVhUOiBGSUxFLU9GRlNFVCAgICAgIEJMT0NLLVJB
TkdFICAgICAgVE9UQUwgRkxBR1MKPj4+Pj4+ICAgICAgICAwOiBbMC4uMzldOiAgICAgICAgIDEz
OTI3Mi4uMTM5MzExICAgICAgNDAgMHgxMDAxCj4+Pj4+Cj4+Pj4+IEJ1dCAgSWYgdGhlIGNvcnJl
Y3QgbGFzdF9ibGsgaXMgY2FsY3VsYXRlZCBjb3JyZWN0bHksIGZpZW1hcCBjYW4gYmUKPj4+Pj4g
ZW5kZWQgYXMgc29vbiBhcyBwb3NzaWJsZT8gIHNvIHRoZSByZXN1bHRzIHNob3duIGlzIGFsc28g
cmlnaHQ/Cj4+Pj4KPj4+PiBaaGlndW8sCj4+Pj4KPj4+PiBJTU8sIGl0J3Mgbm90LCBkdWUgdG8g
MSkgaWYgdGhlIGV4dGVudCBpcyBsYXN0IG9uZSwgRklFTUFQX0VYVEVOVF9MQVNUCj4+Pj4gbXVz
dCBiZSB0YWdnZWQgdG8gbm90aWNlIHVzZXIgdGhhdCBpdCBkb2Vzbid0IG5lZWQgZnVydGhlciBm
aWVtYXAgb24KPj4+PiBsYXR0ZXIgTEJBLCAyKSBvbmUgY29udGludW91cyBleHRlbnQgc2hvdWxk
IG5vdCBiZSBzcGxpdCB0byB0d28uCj4+Pj4KPj4+PiBMZXQgbWUgZmlndXJlIG91dCBhIGZpeCBm
b3IgdGhhdC4KPj4+IEhpIENoYW8sCj4+PiBPSywgdGhhbmtzIGZvciB5b3VyIGV4cGxhaW5hdGlv
bi4KPj4+IGJ0dywgRG8gSSBuZWVkIHRvIHVwZGF0ZSBhIHBhdGNoIGFib3V0IHRoZSBvcmlnaW5h
bCBpc3N1ZSB3ZSBkaXNzY3Vzc2VkPwo+Pj4gb3IgeW91IHdpbGwgbW9kaWZ5IGl0IHRvZ2V0aGVy
Pwo+Pgo+PiBaaGlndW8sIGxldCBtZSBzZW5kIGEgcGF0Y2hzZXQgaW5jbHVkaW5nIHlvdXIgcGF0
Y2gsIG5vdywgSSdtIHRlc3RpbmcgdGhpczoKPiBIaSBDaGFvLAo+IEl0J3Mgb2sgXl4KPj4KPj4g
ICBGcm9tIGM2N2NiNDc4MmEzZjE4NzU4NjVmOWFlMjRjY2U4MGE1OTc1MmQ2MDAgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCj4+IEZyb206IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4gRGF0
ZTogVGh1LCA3IE5vdiAyMDI0IDE0OjUyOjE3ICswODAwCj4+IFN1YmplY3Q6IFtQQVRDSF0gZjJm
czogZml4IHRvIHJlcXVlcnkgZXh0ZW50IHdoaWNoIGNyb3NzIGJvdW5kYXJ5IG9mIGlucXVpcnkK
Pj4KPj4gZGQgaWY9L2Rldi96ZXJvIG9mPWZpbGUgYnM9NGsgY291bnQ9NQo+PiB4ZnNfaW8gZmls
ZSAtYyAiZmllbWFwIC12IDIgMTYzODQiCj4+IGZpbGU6Cj4+ICAgICAgRVhUOiBGSUxFLU9GRlNF
VCAgICAgIEJMT0NLLVJBTkdFICAgICAgVE9UQUwgRkxBR1MKPj4gICAgICAgIDA6IFswLi4zMV06
ICAgICAgICAgMTM5MjcyLi4xMzkzMDMgICAgICAzMiAweDEwMDAKPj4gICAgICAgIDE6IFszMi4u
MzldOiAgICAgICAgMTM5MzA0Li4xMzkzMTEgICAgICAgOCAweDEwMDEKPj4geGZzX2lvIGZpbGUg
LWMgImZpZW1hcCAtdiAwIDE2Mzg0Igo+PiBmaWxlOgo+PiAgICAgIEVYVDogRklMRS1PRkZTRVQg
ICAgICBCTE9DSy1SQU5HRSAgICAgIFRPVEFMIEZMQUdTCj4+ICAgICAgICAwOiBbMC4uMzFdOiAg
ICAgICAgIDEzOTI3Mi4uMTM5MzAzICAgICAgMzIgMHgxMDAwCj4+IHhmc19pbyBmaWxlIC1jICJm
aWVtYXAgLXYgMCAxNjM4NSIKPj4gZmlsZToKPj4gICAgICBFWFQ6IEZJTEUtT0ZGU0VUICAgICAg
QkxPQ0stUkFOR0UgICAgICBUT1RBTCBGTEFHUwo+PiAgICAgICAgMDogWzAuLjM5XTogICAgICAg
ICAxMzkyNzIuLjEzOTMxMSAgICAgIDQwIDB4MTAwMQo+Pgo+PiBUaGVyZSBhcmUgdHdvIHByb2Js
ZW1zOgo+PiAtIGNvbnRpbnVvdXMgZXh0ZW50IGlzIHNwbGl0IHRvIHR3bwo+PiAtIEZJRU1BUF9F
WFRFTlRfTEFTVCBpcyBtaXNzaW5nIGluIGxhc3QgZXh0ZW50Cj4+Cj4+IFRoZSByb290IGNhdXNl
IGlzOiBpZiB1cHBlciBib3VuZGFyeSBvZiBpbnF1aXJ5IGNyb3NzZXMgZXh0ZW50LAo+PiBmMmZz
X21hcF9ibG9ja3MoKSB3aWxsIHRydW5jYXRlIGxlbmd0aCBvZiByZXR1cm5lZCBleHRlbnQgdG8K
Pj4gRjJGU19CWVRFU19UT19CTEsobGVuKSwgYW5kIGFsc28sIGl0IHdpbGwgc3RvcCB0byBxdWVy
eSBsYXR0ZXIKPj4gZXh0ZW50IG9yIGhvbGUgdG8gbWFrZSBzdXJlIGN1cnJlbnQgZXh0ZW50IGlz
IGxhc3Qgb3Igbm90Lgo+Pgo+PiBJbiBvcmRlciB0byBmaXggdGhpcyBpc3N1ZSwgb25jZSB3ZSBm
b3VuZCBhbiBleHRlbnQgbG9jYXRlcwo+PiBpbiB0aGUgZW5kIG9mIGlucXVpcnkgcmFuZ2UgYnkg
ZjJmc19tYXBfYmxvY2tzKCksIHdlIG5lZWQgdG8KPj4gZXhwYW5kIGlucXVpcnkgcmFuZ2UgdG8g
cmVxdWlyeS4KPj4KPj4gUmVwb3J0ZWQtYnk6IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29j
LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+PiAtLS0K
Pj4gICAgZnMvZjJmcy9kYXRhLmMgfCAyMCArKysrKysrKysrKysrKystLS0tLQo+PiAgICAxIGZp
bGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAt
LWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPj4gaW5kZXggNjlmMWNiMDQ5
MGVlLi5lZTU2MTQzMjRkZjAgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4+ICsrKyBi
L2ZzL2YyZnMvZGF0YS5jCj4+IEBAIC0xODk2LDcgKzE4OTYsNyBAQCBpbnQgZjJmc19maWVtYXAo
c3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpZW1hcF9leHRlbnRfaW5mbyAqZmllaW5mbywK
Pj4gICAgICAgICAgICAgICAgICB1NjQgc3RhcnQsIHU2NCBsZW4pCj4+ICAgIHsKPj4gICAgICAg
ICAgc3RydWN0IGYyZnNfbWFwX2Jsb2NrcyBtYXA7Cj4+IC0gICAgICAgc2VjdG9yX3Qgc3RhcnRf
YmxrLCBsYXN0X2JsazsKPj4gKyAgICAgICBzZWN0b3JfdCBzdGFydF9ibGssIGxhc3RfYmxrLCBi
bGtfbGVuLCBtYXhfbGVuOwo+PiAgICAgICAgICBwZ29mZl90IG5leHRfcGdvZnM7Cj4+ICAgICAg
ICAgIHU2NCBsb2dpY2FsID0gMCwgcGh5cyA9IDAsIHNpemUgPSAwOwo+PiAgICAgICAgICB1MzIg
ZmxhZ3MgPSAwOwo+PiBAQCAtMTk0MCwxNCArMTk0MCwxMyBAQCBpbnQgZjJmc19maWVtYXAoc3Ry
dWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpZW1hcF9leHRlbnRfaW5mbyAqZmllaW5mbywKPj4K
Pj4gICAgICAgICAgc3RhcnRfYmxrID0gRjJGU19CWVRFU19UT19CTEsoc3RhcnQpOwo+PiAgICAg
ICAgICBsYXN0X2JsayA9IEYyRlNfQllURVNfVE9fQkxLKHN0YXJ0ICsgbGVuIC0gMSk7Cj4+IC0K
Pj4gLSAgICAgICBpZiAobGVuICYgRjJGU19CTEtTSVpFX01BU0spCj4+IC0gICAgICAgICAgICAg
ICBsZW4gPSByb3VuZF91cChsZW4sIEYyRlNfQkxLU0laRSk7Cj4+ICsgICAgICAgYmxrX2xlbiA9
IGxhc3RfYmxrIC0gc3RhcnRfYmxrICsgMTsKPj4gKyAgICAgICBtYXhfbGVuID0gRjJGU19CWVRF
U19UT19CTEsobWF4Ynl0ZXMpIC0gc3RhcnRfYmxrOwo+Pgo+PiAgICBuZXh0Ogo+PiAgICAgICAg
ICBtZW1zZXQoJm1hcCwgMCwgc2l6ZW9mKG1hcCkpOwo+PiAgICAgICAgICBtYXAubV9sYmxrID0g
c3RhcnRfYmxrOwo+PiAtICAgICAgIG1hcC5tX2xlbiA9IEYyRlNfQllURVNfVE9fQkxLKGxlbik7
Cj4+ICsgICAgICAgbWFwLm1fbGVuID0gYmxrX2xlbjsKPj4gICAgICAgICAgbWFwLm1fbmV4dF9w
Z29mcyA9ICZuZXh0X3Bnb2ZzOwo+PiAgICAgICAgICBtYXAubV9zZWdfdHlwZSA9IE5PX0NIRUNL
X1RZUEU7Cj4+Cj4+IEBAIC0xOTcwLDYgKzE5NjksMTcgQEAgaW50IGYyZnNfZmllbWFwKHN0cnVj
dCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWVtYXBfZXh0ZW50X2luZm8gKmZpZWluZm8sCj4+ICAg
ICAgICAgICAgICAgICAgZmxhZ3MgfD0gRklFTUFQX0VYVEVOVF9MQVNUOwo+PiAgICAgICAgICB9
Cj4+Cj4+ICsgICAgICAgLyoKPj4gKyAgICAgICAgKiBjdXJyZW50IGV4dGVudCBtYXkgY3Jvc3Mg
Ym91bmRhcnkgb2YgaW5xdWlyeSwgaW5jcmVhc2UgbGVuIHRvCj4+ICsgICAgICAgICogcmVxdWVy
eS4KPj4gKyAgICAgICAgKi8KPj4gKyAgICAgICBpZiAoIWNvbXByX2NsdXN0ZXIgJiYgKG1hcC5t
X2ZsYWdzICYgRjJGU19NQVBfTUFQUEVEKSAmJgo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIG1hcC5tX2xibGsgKyBtYXAubV9sZW4gLSAxID09IGxhc3RfYmxrICYmCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxrX2xlbiAhPSBtYXhfbGVuKSB7Cj4+ICsgICAg
ICAgICAgICAgICBibGtfbGVuID0gbWF4X2xlbjsKPj4gKyAgICAgICAgICAgICAgIGdvdG8gbmV4
dDsKPj4gKyAgICAgICB9Cj4+ICsKPiBpdCBzZWVtcyBpZiB1c2VyIGlucHV0IHRoZSBsZW5naHQg
d2hpY2ggaXMgbGVzcyB0aGFuIHRoZSBmaWxlIHNpemUsCj4gYnV0IHJldHVybiB0aGUgd2hvbGUg
ZmllbWFwPwo+IHN1Y2ggYXM6Cj4gICBkZCBpZj0vZGV2L3plcm8gb2Y9ZmlsZSBicz00ayBjb3Vu
dD01Cj4gICB4ZnNfaW8gZmlsZSAtYyAiZmllbWFwIC12IDAgMTYzODQiCj4gd2lsbCBnZXQgZXh0
ZW50IHdpdGggbGVuZ2h0ID0gMHg1MDAwPyBJcyB0aGlzIGV4cGVjdGVkPwo+IE9yIGRpZCBJIHVu
ZGVyc3RhbmQgaXQgd3Jvbmc/CgpJdCdzIGZpbmU/CgpRdW90ZWQgZnJvbSBEb2N1bWVudGF0aW9u
L2ZpbGVzeXN0ZW1zL2ZpZW1hcC5yc3QKCiJmbV9zdGFydCwgYW5kIGZtX2xlbmd0aCBzcGVjaWZ5
IHRoZSBsb2dpY2FsIHJhbmdlIHdpdGhpbiB0aGUgZmlsZQp3aGljaCB0aGUgcHJvY2VzcyB3b3Vs
ZCBsaWtlIG1hcHBpbmdzIGZvci4gRXh0ZW50cyByZXR1cm5lZCBtaXJyb3IKdGhvc2Ugb24gZGlz
ayAtIHRoYXQgaXMsIHRoZSBsb2dpY2FsIG9mZnNldCBvZiB0aGUgMXN0IHJldHVybmVkIGV4dGVu
dAptYXkgc3RhcnQgYmVmb3JlIGZtX3N0YXJ0LCBhbmQgdGhlIHJhbmdlIGNvdmVyZWQgYnkgdGhl
IGxhc3QgcmV0dXJuZWQKZXh0ZW50IG1heSBlbmQgYWZ0ZXIgZm1fbGVuZ3RoLiBBbGwgb2Zmc2V0
cyBhbmQgbGVuZ3RocyBhcmUgaW4gYnl0ZXMuIgoKUXVvdGVkIGZyb20gcmVwbHkgb2YgRGFycmlj
azoKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2ZzdGVzdHMvMjAyMTAyMjQxNjUwNTcuR0I3MjY5
QG1hZ25vbGlhLwoKVGhhbmtzLAoKPiB0aGFua3MhCj4+ICAgICAgICAgIGNvbXByX2FwcGVuZGVk
ID0gZmFsc2U7Cj4+ICAgICAgICAgIC8qIEluIGEgY2FzZSBvZiBjb21wcmVzc2VkIGNsdXN0ZXIs
IGFwcGVuZCB0aGlzIHRvIHRoZSBsYXN0IGV4dGVudCAqLwo+PiAgICAgICAgICBpZiAoY29tcHJf
Y2x1c3RlciAmJiAoKG1hcC5tX2ZsYWdzICYgRjJGU19NQVBfREVMQUxMT0MpIHx8Cj4+IC0tCj4+
IDIuNDAuMQo+Pgo+Pj4gdGhhbmtzIQo+Pj4+Cj4+Pj4gVGhhbmtzLAo+Pj4+Cj4+Pj4+IHN1Y2gg
YXMgdGhpcyBzcGVjaWFsIGNhc2UgInhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMiAxNjM4NCIg
d2UgZGlzY3Vzc2VkLgo+Pj4+PiBidXQgaXQgaXMgZmluZSBmb3IgbWUgdG8ga2VlcCB0aGUgY3Vy
cmVudCBjb2Rlcy4KPj4+Pj4gdGhhbmtzIQo+Pj4+Pj4KPj4+Pj4+IFRob3VnaHRzPwo+Pj4+Pj4K
Pj4+Pj4+IFRoYW5rcywKPj4+Pj4+Cj4+Pj4+Pj4gYmVmb3JlOgo+Pj4+Pj4+IHN0YXJ0X2JsayA9
IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIHN0YXJ0KTsKPj4+Pj4+PiBsYXN0X2JsayA9IGJ5dGVzX3Rv
X2Jsa3MoaW5vZGUsIHN0YXJ0ICsgbGVuIC0gMSk7Cj4+Pj4+Pj4gYWZ0ZXI6Cj4+Pj4+Pj4KPj4+
Pj4+PiBzdGFydF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCk7Cj4+Pj4+Pj4gbGFz
dF9ibGsgPSBzdGFydF9ibGsgKyBieXRlc190b19ibGtzKGlub2RlLCBsZW4gLSAxKTsKPj4+Pj4+
PiB0aGFua3MhCj4+Pj4+Pj4+ICAgICAgIG5leHQ6Cj4+Pj4+Pj4+ICAgICAgICAgICAgIG1lbXNl
dCgmbWFwLCAwLCBzaXplb2YobWFwKSk7Cj4+Pj4+Pj4+ICAgICAgICAgICAgIG1hcC5tX2xibGsg
PSBzdGFydF9ibGs7Cj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2YyZnNfZnMu
aCBiL2luY2x1ZGUvbGludXgvZjJmc19mcy5oCj4+Pj4+Pj4+IGluZGV4IGIwYjgyMWVkZmQ5Ny4u
OTU0ZThlODM0NGI3IDEwMDY0NAo+Pj4+Pj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L2YyZnNfZnMu
aAo+Pj4+Pj4+PiArKysgYi9pbmNsdWRlL2xpbnV4L2YyZnNfZnMuaAo+Pj4+Pj4+PiBAQCAtMjQs
MTAgKzI0LDExIEBACj4+Pj4+Pj4+ICAgICAgICNkZWZpbmUgTkVXX0FERFIgICAgICAgICAgICAg
ICgoYmxvY2tfdCktMSkgICAvKiB1c2VkIGFzIGJsb2NrX3QgYWRkcmVzc2VzICovCj4+Pj4+Pj4+
ICAgICAgICNkZWZpbmUgQ09NUFJFU1NfQUREUiAgICAgICAgICgoYmxvY2tfdCktMikgICAvKiB1
c2VkIGFzIGNvbXByZXNzZWQgZGF0YSBmbGFnICovCj4+Pj4+Pj4+Cj4+Pj4+Pj4+ICsjZGVmaW5l
IEYyRlNfQkxLU0laRV9NQVNLICAgICAgICAgICAgICAoRjJGU19CTEtTSVpFIC0gMSkKPj4+Pj4+
Pj4gICAgICAgI2RlZmluZSBGMkZTX0JZVEVTX1RPX0JMSyhieXRlcykgICAgICAoKGJ5dGVzKSA+
PiBGMkZTX0JMS1NJWkVfQklUUykKPj4+Pj4+Pj4gICAgICAgI2RlZmluZSBGMkZTX0JMS19UT19C
WVRFUyhibGspICAgICAgICAgICAgICAgICgoYmxrKSA8PCBGMkZTX0JMS1NJWkVfQklUUykKPj4+
Pj4+Pj4gICAgICAgI2RlZmluZSBGMkZTX0JMS19FTkRfQllURVMoYmxrKSAgICAgICAgICAgICAg
IChGMkZTX0JMS19UT19CWVRFUyhibGsgKyAxKSAtIDEpCj4+Pj4+Pj4+IC0jZGVmaW5lIEYyRlNf
QkxLX0FMSUdOKHgpICAgICAgICAgICAgICAgICAgICAgIChGMkZTX0JZVEVTX1RPX0JMSygoeCkg
KyBGMkZTX0JMS1NJWkUgLSAxKSkKPj4+Pj4+Pj4gKyNkZWZpbmUgRjJGU19CTEtfQUxJR04oeCkg
ICAgICAgICAgICAgIChGMkZTX0JZVEVTX1RPX0JMSygoeCkgKyBGMkZTX0JMS1NJWkUgLSAxKSkK
Pj4+Pj4+Pj4KPj4+Pj4+Pj4gICAgICAgLyogMCwgMShub2RlIG5pZCksIDIobWV0YSBuaWQpIGFy
ZSByZXNlcnZlZCBub2RlIGlkICovCj4+Pj4+Pj4+ICAgICAgICNkZWZpbmUgRjJGU19SRVNFUlZF
RF9OT0RFX05VTSAgICAgICAgICAgICAgICAzCj4+Pj4+Pj4+IC0tCj4+Pj4+Pj4+IDIuNDAuMQo+
Pj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gVGhhbmtzCj4+Pj4+Pj4+Pj4KPj4+
Pj4+Pj4+PiBUaGFua3MsCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gYnV0IG92ZXJhbGwgbGFzdF9i
bGsgd2lsbCBjaGFuZ2UgbG9vcCBjb3VudHMgYnV0IGhhcyBub3QgYWZmZWN0IG9uIHRoZSByZXN1
bHRzLgo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IFNob3VsZCB3ZSByb3VuZF91cCBsZW4gYWZ0
ZXIgc3RhcnRfYmxrICYgbGFzdF9ibGsgY2FsY3VsYXRpb24/Cj4+Pj4+Pj4+Pj4+IEkgdGhpbmtz
IGl0IGlzIG9rICxidXQganVzdCBhIGxpdHRsZSBiaXQgcmVkdW5kYW50IHdpdGggdGhlIGZvbGxv
d2luZwo+Pj4+Pj4+Pj4+PiBoYW5kbGluZyBhYm91dCBsZW4uCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+
Pj4+IGlmIChieXRlc190b19ibGtzKGlub2RlLCBsZW4pID09IDApCj4+Pj4+Pj4+Pj4+ICAgICAg
ICAgIGxlbiA9IGJsa3NfdG9fYnl0ZXMoaW5vZGUsIDEpOwo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+
PiBCYXNlZCBvbiB0aGUgYWJvdmUgc2l0dWF0aW9uLAo+Pj4+Pj4+Pj4+PiBkbyB5b3UgaGF2ZSBh
bnkgb3RoZXIgZ29vZCBzdWdnZXN0aW9ucz8gXl4KPj4+Pj4+Pj4+Pj4gdGhhbmtzIQo+Pj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IFRoYW5rcywKPj4+Pj4+Pj4+Pj4+Cj4+Pj4+
Pj4+Pj4+Pj4gdGhhbmtz77yBCj4+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+IFRoYW5rcywK
Pj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4KPj4+Pj4+Cj4+
Pj4KPj4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=
