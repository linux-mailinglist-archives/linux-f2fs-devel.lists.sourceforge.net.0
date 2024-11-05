Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E92789BCAA3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2024 11:39:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t8GyQ-0001BJ-Sk;
	Tue, 05 Nov 2024 10:39:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t8GyO-0001BC-OA
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Nov 2024 10:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OJYirEmOIzCqSYDnDoxjtJww+57AsvNB/HWrjHfvG38=; b=J3XdEXuxKntCQ66/UTTXOe8h94
 XBgLmaGhqQ3szFNGqcVoeCP+w5t2XT7+a5t34fuiOYHlMlCT7u4uxOpPDa4IHUKkqke3tBc1eefw9
 M9SeYHt+TC8lJPxVeOYEOjFCLmbnxnCF+ZRKlVnTQ+pdjXD5V6XT5N7upBZSI31VBnQ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OJYirEmOIzCqSYDnDoxjtJww+57AsvNB/HWrjHfvG38=; b=AaVKW5eu7ObiDxnY5fOTMUx5fr
 JAu2nBjZd4iXlf57rZQQDe83c7CKTkTIVnJkuW5h+tLtNtbGvtR71NA01B5Yeky+U8kCZyS+zRXLQ
 aSAI08wEzJtgiiFUCYVElLQOM50vBImqVelDyvUEcFTT7XFDOeY4bsDwyoJVCZA9H85U=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t8GyH-0002z8-Uj for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Nov 2024 10:39:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 124DAA42A94;
 Tue,  5 Nov 2024 10:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43ABC4CECF;
 Tue,  5 Nov 2024 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730803171;
 bh=3/xAX4B7Wj8zuIXV6aOmApU6XauE3kcnSEIfW53M1Gg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=rnxecJvql01bCuAChTZME/JJL8upUBjFgdncpmNuW8lwhBv+cJRaGBj+giiHbtAeu
 B/wEBXO38BlW/kTBqOIfRVEM7a+32z84uHjUCQygS3Hb4hsk3C0OTcUJTsRAR1ZDwi
 q7JiA5v0uN880PYCw0MQb5a2IZlsCzM3U3s1fNuVN2JNtODySh+7lHjCJvAM3VmpMM
 3IHAAv3t1SDDp8aUWq/5w5Cvlby0F5pbEPR6TwsfIxFSP7XpY0qiO/1u8s7b0xBO1h
 mPn0JaGVkMKFSAkBtOVyFRmzk9fd32xKVN+Tf8MHIGCsN60oHq6GtqZbCz9UpAKn+m
 zZF+fIhXrgGQQ==
Message-ID: <22873055-370b-4240-83ff-96bcfa91413a@kernel.org>
Date: Tue, 5 Nov 2024 18:39:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1730685372-2995-1-git-send-email-zhiguo.niu@unisoc.com>
 <ab9f63b2-8d02-411b-8d2f-bc1b5b748ffe@kernel.org>
 <CAHJ8P3L9o2RJgV=TtUf_MPj36wasgPn7bn9FnGPXu=TgpE7ATQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3L9o2RJgV=TtUf_MPj36wasgPn7bn9FnGPXu=TgpE7ATQ@mail.gmail.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/11/5 15:28, Zhiguo Niu wrote: > Chao Yu <chao@kernel.org>
    于2024年11月5日周二 15:04写道： >> >> On 2024/11/4 9:56, Zhiguo
   Niu wrote: >>> If user give a file size as "length" parameter [...] 
 
 Content analysis details:   (-0.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t8GyH-0002z8-Uj
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

T24gMjAyNC8xMS81IDE1OjI4LCBaaGlndW8gTml1IHdyb3RlOgo+IENoYW8gWXUgPGNoYW9Aa2Vy
bmVsLm9yZz4g5LqOMjAyNOW5tDEx5pyINeaXpeWRqOS6jCAxNTowNOWGmemBk++8mgo+Pgo+PiBP
biAyMDI0LzExLzQgOTo1NiwgWmhpZ3VvIE5pdSB3cm90ZToKPj4+IElmIHVzZXIgZ2l2ZSBhIGZp
bGUgc2l6ZSBhcyAibGVuZ3RoIiBwYXJhbWV0ZXIgZm9yIGZpZW1hcAo+Pj4gb3BlcmF0aW9ucywg
YnV0IGlmIHRoaXMgc2l6ZSBpcyBub24tYmxvY2sgc2l6ZSBhbGlnbmVkLAo+Pj4gaXQgd2lsbCBz
aG93IDIgc2VnbWVudHMgZmllbWFwIHJlc3VsdHMgZXZlbiB0aGlzIHdob2xlIGZpbGUKPj4+IGlz
IGNvbnRpZ3VvdXMgb24gZGlzaywgc3VjaCBhcyB0aGUgZm9sbG93aW5nIHJlc3VsdHM6Cj4+Pgo+
Pj4gICAgLi9mMmZzX2lvIGZpZW1hcCAwIDE5MDM0IHlsb2cvYW5hbHl6ZXIucHkKPj4+IEZpZW1h
cDogb2Zmc2V0ID0gMCBsZW4gPSAxOTAzNAo+Pj4gICAgICAgICAgIGxvZ2ljYWwgYWRkci4gICAg
cGh5c2ljYWwgYWRkci4gICBsZW5ndGggICAgICAgICAgIGZsYWdzCj4+PiAwICAgICAgIDAwMDAw
MDAwMDAwMDAwMDAgMDAwMDAwMDAyMGJhYTAwMCAwMDAwMDAwMDAwMDA0MDAwIDAwMDAxMDAwCj4+
PiAxICAgICAgIDAwMDAwMDAwMDAwMDQwMDAgMDAwMDAwMDAyMGJhZTAwMCAwMDAwMDAwMDAwMDAx
MDAwIDAwMDAxMDAxCj4+Pgo+Pj4gYWZ0ZXIgdGhpcyBwYXRjaDoKPj4+IC4vZjJmc19pbyBmaWVt
YXAgMCAxOTAzNCB5bG9nL2FuYWx5emVyLnB5Cj4+PiBGaWVtYXA6IG9mZnNldCA9IDAgbGVuID0g
MTkwMzQKPj4+ICAgICAgIGxvZ2ljYWwgYWRkci4gICAgcGh5c2ljYWwgYWRkci4gICBsZW5ndGgg
ICAgICAgICAgIGZsYWdzCj4+PiAwICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAzMTVmMzAw
MCAwMDAwMDAwMDAwMDA1MDAwIDAwMDAxMDAxCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogWmhpZ3Vv
IE5pdSA8emhpZ3VvLm5pdUB1bmlzb2MuY29tPgo+Pj4gLS0tCj4+PiBWMjogY29ycmVjdCBjb21t
aXQgbXNnIGFjY29yZGluZyB0byBDaGFvJ3MgcXVlc3Rpb25zCj4+PiBmMmZzX2lvIGhhcyBiZWVu
IG1vZGlmaWVkIGZvciB0ZXN0aW5nLCB0aGUgbGVuZ3RoIGZvciBmaWVtYXAgaXMKPj4+IHJlYWwg
ZmlsZSBzaXplLCBub3QgYmxvY2sgbnVtYmVyCj4+PiAtLS0KPj4+ICAgIGZzL2YyZnMvZGF0YS5j
IHwgNCArKy0tCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0
YS5jCj4+PiBpbmRleCAzMDZiODZiMC4uOWZjMjI5ZCAxMDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMv
ZGF0YS5jCj4+PiArKysgYi9mcy9mMmZzL2RhdGEuYwo+Pj4gQEAgLTE5NjYsOCArMTk2Niw4IEBA
IGludCBmMmZzX2ZpZW1hcChzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmllbWFwX2V4dGVu
dF9pbmZvICpmaWVpbmZvLAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPj4+
ICAgICAgICB9Cj4+Pgo+Pj4gLSAgICAgaWYgKGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIGxlbikgPT0g
MCkKPj4+IC0gICAgICAgICAgICAgbGVuID0gYmxrc190b19ieXRlcyhpbm9kZSwgMSk7Cj4+PiAr
ICAgICBpZiAobGVuICYgKGJsa3NfdG9fYnl0ZXMoaW5vZGUsIDEpIC0gMSkpCj4+PiArICAgICAg
ICAgICAgIGxlbiA9IHJvdW5kX3VwKGxlbiwgYmxrc190b19ieXRlcyhpbm9kZSwgMSkpOwo+Pgo+
PiBIb3cgZG8geW91IHRoaW5rIG9mIGdldHRpbmcgcmlkIG9mIGFib3ZlIGFsaWdubWVudCBmb3Ig
bGVuPwo+Pgo+Pj4KPj4+ICAgICAgICBzdGFydF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBz
dGFydCk7Cj4+PiAgICAgICAgbGFzdF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCAr
IGxlbiAtIDEpOwo+Pgo+PiBBbmQgcm91bmQgdXAgZW5kIHBvc2l0aW9uIHcvOgo+Pgo+PiBsYXN0
X2JsayA9IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIHJvdW5kX3VwKHN0YXJ0ICsgbGVuIC0gMSwgRjJG
U19CTEtTSVpFKSk7Cj4gSGkgQ2hhbywKPiBJIHRoaW5rIHRoaXMgd2lsbCBjaGFuZ2UgdGhlIGN1
cnJlbnQgY29kZSBsb2dpYwo+IC0tLS0tLS0tLS0tLS0KPiBpZiAoc3RhcnRfYmxrID4gbGFzdF9i
bGspCj4gICAgICBnb3RvIG91dDsKPiAtLS0tLS0tLS0tLS0tCj4gZm9yIGV4YW1wbGUsIGEgZmls
ZSB3aXRoIHNpemUgMTkwMDYsIGJ1dCB0aGUgbGVuZ3RoIGZyb20gdGhlIHVzZXIgaXMgMTYzODQu
Cj4gYmVmb3JlIHRoaXMgbW9kaWZpY2F0aW9uLCAgbGFzdF9ibGsgPSAgYnl0ZXNfdG9fYmxrcyhp
bm9kZSwgc3RhcnQgKwo+IGxlbiAtIDEpID0gKGlub2RlLCAxNjM4MykgPSAzCj4gYWZ0ZXIgdGhl
IGZpcnN0IGYyZnNfbWFwX2Jsb2NrcygpLiBzdGFydF9ibGsgY2hhbmdlIHRvIGJlIDQsCj4gYWZ0
ZXIgdGhlIHNlY29uZCBmMmZzX21hcF9ibG9ja3MoKSwgZmllbWFwX2ZpbGxfbmV4X2V4dGVuIHdp
bGwgYmUKPiBjYWxsZWQgdG8gZmlsbCB1c2VyIHBhcmFtZXRlciBhbmQgdGhlbgo+IHdpbGwgZ290
byBvdXQgYmVjYXVzZSBzdGFydF9ibGsgPiBsYXN0X2JsaywgdGhlbiBmaWVtYXAgZmxvdyBmaW5p
c2hlcy4KPiBidXQgYWZ0ZXIgdGhpcyBtb2RpZmljYXRpb24sIGxhc3RfYmxrIHdpbGwgYmUgNAo+
IHdpbGwgZG8gZjJmc19tYXBfYmxvY2tzKCkgdW50aWwgcmVhY2ggdGhlIG1heF9maWxlX2Jsb2Nr
cyhpbm9kZSkKClllcywgeW91J3JlIHJpZ2h0LCBob3dldmVyLCB3LyB0aGlzIHBhdGNoLCBpdCBt
YXkgY2hhbmdlIGxhc3RfYmxrLCBlLmcuCgp4ZnNfaW8gZmlsZSAtYyAiZmllbWFwIC12IDAgMTkw
MDYiIHZzIHhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMiAxOTAwNiIKc3RhcnRfYmxrIGFuZCBs
YXN0X2JsayB3aWxsIGJlOiAwLCA0IGFuZCAwLCA1LgoKU2hvdWxkIHdlIHJvdW5kX3VwIGxlbiBh
ZnRlciBzdGFydF9ibGsgJiBsYXN0X2JsayBjYWxjdWxhdGlvbj8KClRoYW5rcywKCj4gdGhhbmtz
77yBCj4+Cj4+IFRoYW5rcywKPj4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
