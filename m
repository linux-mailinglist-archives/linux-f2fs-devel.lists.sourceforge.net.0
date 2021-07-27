Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F403D6CA7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Jul 2021 05:23:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m8Dgg-0000wO-0K; Tue, 27 Jul 2021 03:23:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m8Dgf-0000wF-BB
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Jul 2021 03:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mPrZqBtiBo3T6bjYKrSSlRPjHLDVgmuAgWtKViCh2dM=; b=Psyjc8DJMsAHMLwHuJ/t4RFpwV
 XoUT/HH2Vd9rYkRR4U3/UVAYUYdEcbuQ6NbCISW1ikuaGkokSQUhU4PPiRANEs+X0STz1FUVuW63H
 DEqRN6rFPJyXJhaVmNZgZT8xuXt0DD6OHtRR0DsLvG2JxWlmcJACIuVM6jZzvZi/6xxM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mPrZqBtiBo3T6bjYKrSSlRPjHLDVgmuAgWtKViCh2dM=; b=eBVkYTa88PdqXVdl9Vz0Tm0eHZ
 cBUUCR0dsL00+Ua/6x1By+qGddmsTnHW8w5KzIvz5wrnN0V2n+BRnjt5UYelrLFfrLFkfvA4nJrqH
 tHOxQN6KY4lHc4J56fdR2O4Xk/qhl4opVXSPIfkPtY+/qBnhLlppT83RYgkxPfrR6yDY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m8Dgb-000138-Tb
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Jul 2021 03:23:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4370B61057;
 Tue, 27 Jul 2021 03:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627356186;
 bh=D0/BkZwvoY2cXFJOBa5ybmS7OQw1oK528dMchIY/pfI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=GHu3QoFDsl+8vzLRi8CnVyGXQMt4VNFo+W1olYrTc9A5weBex/61UroOsj7Hec+T/
 8OkUW+tVkheN8ehlD9VO3XtB2wORjsx50i5aDwADQYFx8GvDllPRgdn3GSxStI0ZkG
 NcAeJNF0cCfiQBlhzSDFqYfL5LmdxJN9T7QHSVMpsivKvweK6HmHkR9QDezWsBD+oR
 a4GI7lrCd6lOVIdgGeIsAKlmbicS86epw49WkbmX08Fh/46yctBfmRLCl+ha4YBEnm
 Tqrg7ut2vZuww9lrRJFiMyjU/bZ1AKcrqu9j36qVWIaXstppawe4KR9LRlu67NP9LQ
 5pS4XbQwzy62w==
To: Eric Biggers <ebiggers@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210716143919.44373-1-ebiggers@kernel.org>
 <20210716143919.44373-4-ebiggers@kernel.org>
 <14782036-f6a5-878a-d21f-e7dd7008a285@kernel.org>
 <YP2l+1umf9ct/4Sp@sol.localdomain> <YP9oou9sx4oJF1sc@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <70f16fec-02f6-cb19-c407-856101cacc23@kernel.org>
Date: Tue, 27 Jul 2021 11:23:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YP9oou9sx4oJF1sc@google.com>
Content-Language: en-US
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m8Dgb-000138-Tb
Subject: Re: [f2fs-dev] [PATCH 3/9] f2fs: rework write preallocations
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
Cc: Satya Tangirala <satyaprateek2357@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Changheun Lee <nanich.lee@samsung.com>, linux-fsdevel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS83LzI3IDEwOjAwLCBKYWVnZXVrIEtpbSB3cm90ZToKPiBPbiAwNy8yNSwgRXJpYyBC
aWdnZXJzIHdyb3RlOgo+PiBPbiBTdW4sIEp1bCAyNSwgMjAyMSBhdCAwNjo1MDo1MVBNICswODAw
LCBDaGFvIFl1IHdyb3RlOgo+Pj4gT24gMjAyMS83LzE2IDIyOjM5LCBFcmljIEJpZ2dlcnMgd3Jv
dGU6Cj4+Pj4gRnJvbTogRXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0Bnb29nbGUuY29tPgo+Pj4+Cj4+
Pj4gZjJmc193cml0ZV9iZWdpbigpIGFzc3VtZXMgdGhhdCBhbGwgYmxvY2tzIHdlcmUgcHJlYWxs
b2NhdGVkIGJ5Cj4+Pj4gZGVmYXVsdCB1bmxlc3MgRklfTk9fUFJFQUxMT0MgaXMgZXhwbGljaXRs
eSBzZXQuICBUaGlzIGludml0ZXMgZGF0YQo+Pj4+IGNvcnJ1cHRpb24sIGFzIHRoZXJlIGFyZSBj
YXNlcyBpbiB3aGljaCBub3QgYWxsIGJsb2NrcyBhcmUgcHJlYWxsb2NhdGVkLgo+Pj4+IENvbW1p
dCA0NzUwMWY4N2M2MWEgKCJmMmZzOiBwcmVhbGxvY2F0ZSBESU8gYmxvY2tzIHdoZW4gZm9yY2lu
Zwo+Pj4+IGJ1ZmZlcmVkX2lvIikgZml4ZWQgb25lIGNhc2UsIGJ1dCB0aGVyZSBhcmUgb3RoZXJz
IHJlbWFpbmluZy4KPj4+Cj4+PiBDb3VsZCB5b3UgcGxlYXNlIGV4cGxhaW4gd2hpY2ggY2FzZXMg
d2UgbWlzc2VkIHRvIGhhbmRsZSBwcmV2aW91c2x5Pwo+Pj4gdGhlbiBJIGNhbiBjaGVjayB0aG9z
ZSByZWxhdGVkIGxvZ2ljIGJlZm9yZSBhbmQgYWZ0ZXIgdGhlIHJld29yay4KPj4KPj4gQW55IGNh
c2Ugd2hlcmUgYSBidWZmZXJlZCB3cml0ZSBoYXBwZW5zIHdoaWxlIG5vdCBhbGwgYmxvY2tzIHdl
cmUgcHJlYWxsb2NhdGVkCj4+IGJ1dCBGSV9OT19QUkVBTExPQyB3YXNuJ3Qgc2V0LiAgRm9yIGV4
YW1wbGUgd2hlbiBFTk9TUEMgd2FzIGhpdCBpbiB0aGUgbWlkZGxlIG9mCj4+IHRoZSBwcmVhbGxv
Y2F0aW9ucyBmb3IgYSBkaXJlY3Qgd3JpdGUgdGhhdCB3aWxsIGZhbGwgYmFjayB0byBhIGJ1ZmZl
cmVkIHdyaXRlLAo+PiBlLmcuIGR1ZSB0byBmMmZzX2ZvcmNlX2J1ZmZlcmVkX2lvKCkgb3IgcGFn
ZSBjYWNoZSBpbnZhbGlkYXRpb24gZmFpbHVyZS4KCkluZGVlZCwgSUlVQywgdGhlIGJ1Z2d5IGNv
ZGUgaXMgYXMgYmVsb3csIGlmIGFueSBwcmVhbGxvY2F0aW9uIGZhaWxlZCwgd2UgbmVlZCB0bwpz
ZXQgRklfTk9fUFJFQUxMT0MgZmxhZy4KCm1hcF9ibG9ja3M6CgllcnIgPSBmMmZzX21hcF9ibG9j
a3MoaW5vZGUsICZtYXAsIDEsIGZsYWcpOwoJaWYgKG1hcC5tX2xlbiA+IDAgJiYgZXJyID09IC1F
Tk9TUEMpIHsKCQlpZiAoIWRpcmVjdF9pbykgICAgICAgICA8LS0tLQoJCQlzZXRfaW5vZGVfZmxh
Zyhpbm9kZSwgRklfTk9fUFJFQUxMT0MpOwoJCWVyciA9IDA7Cgl9CgpCVFcsIGl0IHdpbGwgYmUg
YmV0dGVyIHRvIGluY2x1ZGUgYWJvdmUgaXNzdWUgZGV0YWlscyB5b3UgZXhwbGFpbmVkIGludG8g
Y29tbWl0Cm1lc3NhZ2U/Cgo+Pgo+Pj4KPj4+PiAtCQkJLyoKPj4+PiAtCQkJICogSWYgZm9yY2Vf
YnVmZmVyZV9pbygpIGlzIHRydWUsIHdlIGhhdmUgdG8gYWxsb2NhdGUKPj4+PiAtCQkJICogYmxv
Y2tzIGFsbCB0aGUgdGltZSwgc2luY2UgZjJmc19kaXJlY3RfSU8gd2lsbCBmYWxsCj4+Pj4gLQkJ
CSAqIGJhY2sgdG8gYnVmZmVyZWQgSU8uCj4+Pj4gLQkJCSAqLwo+Pj4+IC0JCQlpZiAoIWYyZnNf
Zm9yY2VfYnVmZmVyZWRfaW8oaW5vZGUsIGlvY2IsIGZyb20pICYmCj4+Pj4gLQkJCQkJZjJmc19s
ZnNfbW9kZShGMkZTX0lfU0IoaW5vZGUpKSkKPj4+PiAtCQkJCWdvdG8gd3JpdGU7Cj4+Pgo+Pj4g
V2Ugc2hvdWxkIGtlZXAgdGhpcyBPUFUgRElPIGxvZ2ljLCBvdGhlcndpc2UsIGluIGxmcyBtb2Rl
LCB3cml0ZSBkaW8KPj4+IHdpbGwgYWx3YXlzIGFsbG9jYXRlIHR3byBibG9jayBhZGRyZXNzZXMg
Zm9yIGVhY2ggNGsgYXBwZW5kIElPLgo+Pj4KPj4+IEkganN1dCB0ZXN0IGJhc2VkIG9uIGNvZGVz
IG9mIGxhc3QgZjJmcyBkZXYtdGVzdCBicmFuY2guCj4+Cj4+IFllcywgSSBoYWQgbWlzcmVhZCB0
aGF0IGR1ZSB0byB0aGUgd2VpcmQgZ290byBhbmQgbWlzbGVhZGluZyBjb21tZW50IGFuZAo+PiB0
cmFuc2xhdGVkIGl0IGludG86Cj4+Cj4+ICAgICAgICAgIC8qIElmIGl0IHdpbGwgYmUgYW4gaW4t
cGxhY2UgZGlyZWN0IHdyaXRlLCBkb24ndCBib3RoZXIuICovCj4+ICAgICAgICAgIGlmIChkaW8g
JiYgIWYyZnNfbGZzX21vZGUoc2JpKSkKPj4gICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPj4K
Pj4gSXQgc2hvdWxkIGJlOgo+Pgo+PiAgICAgICAgICBpZiAoZGlvICYmIGYyZnNfbGZzX21vZGUo
c2JpKSkKPj4gICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAKPiBIbW0sIHRoaXMgYWRkcmVz
c2VzIG15IDI1MCBmYWlsdXJlLiBBbmQsIEkgdGhpbmsgdGhlIGJlbG93IGNvbW1pdCBjYW4gZXhw
bGFpbgo+IHRoZSBjYXNlLgo+IAo+IGNvbW1pdCA0NzUwMWY4N2M2MWFkMmFhMjM0YWRkNjNlMWFl
MjMxNTIxZGJjM2Y1Cj4gQXV0aG9yOiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgo+
IERhdGU6ICAgVHVlIE5vdiAyNiAxNTowMTo0MiAyMDE5IC0wODAwCj4gCj4gICAgICBmMmZzOiBw
cmVhbGxvY2F0ZSBESU8gYmxvY2tzIHdoZW4gZm9yY2luZyBidWZmZXJlZF9pbwo+IAo+ICAgICAg
VGhlIHByZXZpb3VzIHByZWFsbG9jYXRpb24gYW5kIERJTyBkZWNpc2lvbiBsaWtlIGJlbG93Lgo+
IAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFsbG93X291dHBsYWNlX2RpbyAgICAg
ICAgICAgICAgIWFsbG93X291dHBsYWNlX2Rpbwo+ICAgICAgZjJmc19mb3JjZV9idWZmZXJlZF9p
byAgICgqKSBOb19QcmVhbGxvYyAvIEJ1ZmZlcmVkX0lPICAgUHJlYWxsb2MgLyBCdWZmZXJlZF9J
Two+ICAgICAgIWYyZnNfZm9yY2VfYnVmZmVyZWRfaW8gIE5vX1ByZWFsbG9jIC8gRElPICAgICAg
ICAgICAgICAgUHJlYWxsb2MgLyBESU8KPiAKPiAgICAgIEJ1dCwgSmF2aWVyIHJlcG9ydGVkIENh
c2UgKCopIHdoZXJlIHpvbmVkIGRldmljZSBieXBhc3NlZCBwcmVhbGxvY2F0aW9uIGJ1dAo+ICAg
ICAgZmVsbCBiYWNrIHRvIGJ1ZmZlcmVkIHdyaXRlcyBpbiBmMmZzX2RpcmVjdF9JTygpLCByZXN1
bHRpbmcgaW4gc3RhbGUgZGF0YQo+ICAgICAgYmVpbmcgcmVhZC4KPiAKPiAgICAgIEluIG9yZGVy
IHRvIGZpeCB0aGUgaXNzdWUsIGFjdHVhbGx5IHdlIG5lZWQgdG8gcHJlYWxsb2NhdGUgYmxvY2tz
IHdoZW5ldmVyCj4gICAgICB3ZSBmYWxsIGJhY2sgdG8gYnVmZmVyZWQgSU8gbGlrZSB0aGlzLiBO
byBjaGFuZ2UgaXMgbWFkZSBpbiB0aGUgb3RoZXIgY2FzZXMuCj4gCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgYWxsb3dfb3V0cGxhY2VfZGlvICAgICAgICAgICAgICAhYWxsb3dfb3V0
cGxhY2VfZGlvCj4gICAgICBmMmZzX2ZvcmNlX2J1ZmZlcmVkX2lvICAgKCopIFByZWFsbG9jIC8g
QnVmZmVyZWRfSU8gICAgICBQcmVhbGxvYyAvIEJ1ZmZlcmVkX0lPCj4gICAgICAhZjJmc19mb3Jj
ZV9idWZmZXJlZF9pbyAgTm9fUHJlYWxsb2MgLyBESU8gICAgICAgICAgICAgICBQcmVhbGxvYyAv
IERJTwo+IAo+ICAgICAgUmVwb3J0ZWQtYW5kLXRlc3RlZC1ieTogSmF2aWVyIEdvbnphbGV6IDxq
YXZpZXJAamF2aWdvbi5jb20+Cj4gICAgICBTaWduZWQtb2ZmLWJ5OiBEYW1pZW4gTGUgTW9hbCA8
ZGFtaWVuLmxlbW9hbEB3ZGMuY29tPgo+ICAgICAgVGVzdGVkLWJ5OiBTaGluJ2ljaGlybyBLYXdh
c2FraSA8c2hpbmljaGlyby5rYXdhc2FraUB3ZGMuY29tPgo+ICAgICAgUmV2aWV3ZWQtYnk6IENo
YW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT4KPiAgICAgIFJldmlld2VkLWJ5OiBKYXZpZXIgR29u
esOhbGV6IDxqYXZpZXJAamF2aWdvbi5jb20+Cj4gICAgICBTaWduZWQtb2ZmLWJ5OiBKYWVnZXVr
IEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgo+IAoKVGhhbmtzIGZvciB0aGUgZXhwbGFpbi4KCj4g
Cj4+Cj4+IERvIHlvdSBoYXZlIGEgcHJvcGVyIGV4cGxhbmF0aW9uIGZvciB3aHkgcHJlYWxsb2Nh
dGlvbnMgc2hvdWxkbid0IGJlIGRvbmUgaW4KClNlZSBjb21taXQgZjg0N2M2OTljZmYzICgiZjJm
czogYWxsb3cgb3V0LXBsYWNlLXVwZGF0ZSBmb3IgZGlyZWN0IElPIGluIExGUyBtb2RlIiksCmYy
ZnNfbWFwX2Jsb2NrcygpIGxvZ2ljIHdhcyBjaGFuZ2VkIHRvIGZvcmNlIGFsbG9jYXRpbmcgYSBu
ZXcgYmxvY2sgYWRkcmVzcyBubyBtYXR0ZXIKcHJldmlvdXMgYmxvY2sgYWRkcmVzcyB3YXMgZXhp
c3RlZCBpZiBpdCBpcyBjYWxsZWQgZnJvbSB3cml0ZSBwYXRoIG9mIERJTy4gU28sIGluIHN1Y2gK
Y29uZGl0aW9uLCBpZiB3ZSBwcmVhbGxvY2F0ZSBuZXcgYmxvY2sgYWRkcmVzcyBpbiBmMmZzX2Zp
bGVfd3JpdGVfaXRlcigpLCB3ZSB3aWxsCnN1ZmZlciB0aGUgcHJvYmxlbSB3aGljaCBteSB0cmFj
ZSBpbmRpY2F0ZXMuCgo+PiB0aGlzIGNhc2U/ICBOb3RlIHRoYXQgcHJlYWxsb2NhdGlvbnMgYXJl
IHN0aWxsIGRvbmUgZm9yIGJ1ZmZlcmVkIHdyaXRlcywgd2hpY2gKPj4gbWF5IGJlIG91dC1vZi1w
bGFjZSBhcyB3ZWxsOyBob3cgYXJlIHRob3NlIGRpZmZlcmVudD8KR290IHlvdXIgY29uY2Vybi4K
CkZvciBidWZmZXJlZCBJTywgd2UgdXNlIEYyRlNfR0VUX0JMT0NLX1BSRV9BSU8sIGluIHRoaXMg
bW9kZSwgd2UganVzdCBwcmVzZXJ2ZQpmaWxlc3lzdGVtIGJsb2NrIGNvdW50IGFuZCB0YWcgTkVX
X0FERFIgaW4gZG5vZGUgYmxvY2ssIHNvLCBpdCdzIGZpbmUsIGRvdWJsZQpuZXcgYmxvY2sgYWRk
cmVzcyBhbGxvY2F0aW9uIHdvbid0IGhhcHBlbiBkdXJpbmcgZGF0YSBwYWdlIHdyaXRlYmFjay4K
CkZvciBkaXJlY3QgSU8sIHdlIHVzZSBGMkZTX0dFVF9CTE9DS19QUkVfRElPLCBpbiB0aGlzIG1v
ZGUsIHdlIHdpbGwgYWxsb2NhdGUKcGh5c2ljYWwgYmxvY2sgYWRkcmVzcywgYWZ0ZXIgcHJlYWxs
b2NhdGlvbiwgaWYgd2UgZmFsbGJhY2sgdG8gYnVmZmVyZWQgSU8sIHdlCm1heSBzdWZmZXIgZG91
YmxlIG5ldyBibG9jayBhZGRyZXNzIGFsbG9jYXRpb24gaXNzdWUuLi4gSUlVQy4KCldlbGwsIGNh
biB3ZSByZWxvY2F0ZSBwcmVhbGxvY2F0aW9uIGludG8gZjJmc19kaXJlY3RfSU8oKSBhZnRlciBh
bGwgY2FzZXMgd2hpY2gKbWF5IGNhdXNlIGZhbGxiYWNraW5nIERJTyB0byBidWZmZXJlZCBJTz8K
ClRoYW5rcywKCj4+Cj4+IC0gRXJpYwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
