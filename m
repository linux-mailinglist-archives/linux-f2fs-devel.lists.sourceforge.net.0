Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A50D49BDD22
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Nov 2024 03:40:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t8VyB-0002Ym-Na;
	Wed, 06 Nov 2024 02:40:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t8VyA-0002Yd-9r
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Nov 2024 02:40:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sX6RenEb6/B+r2jyxR18w0Q6Fpjt5XtDTXb3aRqB9as=; b=TEo2mc/MO3iFH2woF1o27PdvO8
 sDMrBQZBjBOT7mrz+XGRNzVxzfmnR3eSlwCGYH7tNSIRZH2qPzavVcB/qEc/J8P/W+FOYytqVVuy/
 6h0bVgKYvoZUgIk1t6xD5x341B1D9OX3CpgtYdllz5h5EewjOdVMDursYpk5g8V8niBU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sX6RenEb6/B+r2jyxR18w0Q6Fpjt5XtDTXb3aRqB9as=; b=bCWVMJxGNGm/bnhH+n8tllpVkp
 lG0OPW20+VUu+v7tqWfpE+tjl1hUEVow1YuIXYzbodvfrYkSM7Zd7UNW5q/q+Lf6mxSgTaio/tqn7
 EUDEY55Dy842Mq8b23opFKbrmIPdmJdteSzb7OXXCCdJE5hvgaiR7tvXNFGuvxkCzf6M=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t8Vy8-0002M8-QB for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Nov 2024 02:40:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EC56DA41BE1;
 Wed,  6 Nov 2024 02:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB95C4CECF;
 Wed,  6 Nov 2024 02:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730860822;
 bh=8skSwEKa2BJdI+HdH5Bnq08Ua01XRXyPvb6CEc1N0+o=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=WWXLSvRTbUiPWWKtMytVIOms90KKpuZmDWJjG5XKjv3F4uI0pAzyM1IYTigynUanc
 EqvLbwa86M5kudGz8nuZbG+NlUIw+TGFetghuLiPIbmCcImZIIJWIHX4oDo8zG85OF
 ZZYVaAMIDQDEk5EtfhRfpkGr60JvP8PoDFZnU8SJcfzM4kOgZZ0JAC/8YnhdhonLdB
 ylzR5W2Os02g4AWb3yH2dg3vQAMX4r+Wh7GjnKZITsn9y+jOgCsrMSYnwWATTfFCJN
 KVimjE8sw7F8EbIdmsRHD5z+uTdR9Fxg2AoouH2PPRFem5z7+5yePqOCbv131hqZMs
 lg3KzOj4JVdaQ==
Message-ID: <c070fd2d-6480-4833-b03c-ec032ee37a28@kernel.org>
Date: Wed, 6 Nov 2024 10:40:17 +0800
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
Content-Language: en-US
In-Reply-To: <CAHJ8P3L68mKAcSdrgk-5VZQh4cW+BBroh+50ymvuzO0f5x5kMw@mail.gmail.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/11/6 10:26, Zhiguo Niu wrote: > Chao Yu <chao@kernel.org>
    于2024年11月6日周三 10:16写道： >> >> On 2024/11/5 19:02, Zhiguo
    Niu wrote: >>> Chao Yu <chao@kernel.org> 于2024年11月5日 [...] 
 
 Content analysis details:   (-0.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
X-Headers-End: 1t8Vy8-0002M8-QB
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

T24gMjAyNC8xMS82IDEwOjI2LCBaaGlndW8gTml1IHdyb3RlOgo+IENoYW8gWXUgPGNoYW9Aa2Vy
bmVsLm9yZz4g5LqOMjAyNOW5tDEx5pyINuaXpeWRqOS4iSAxMDoxNuWGmemBk++8mgo+Pgo+PiBP
biAyMDI0LzExLzUgMTk6MDIsIFpoaWd1byBOaXUgd3JvdGU6Cj4+PiBDaGFvIFl1IDxjaGFvQGtl
cm5lbC5vcmc+IOS6jjIwMjTlubQxMeaciDXml6XlkajkuowgMTg6MznlhpnpgZPvvJoKPj4+Pgo+
Pj4+IE9uIDIwMjQvMTEvNSAxNToyOCwgWmhpZ3VvIE5pdSB3cm90ZToKPj4+Pj4gQ2hhbyBZdSA8
Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg15pel5ZGo5LqMIDE1OjA05YaZ6YGT77ya
Cj4+Pj4+Pgo+Pj4+Pj4gT24gMjAyNC8xMS80IDk6NTYsIFpoaWd1byBOaXUgd3JvdGU6Cj4+Pj4+
Pj4gSWYgdXNlciBnaXZlIGEgZmlsZSBzaXplIGFzICJsZW5ndGgiIHBhcmFtZXRlciBmb3IgZmll
bWFwCj4+Pj4+Pj4gb3BlcmF0aW9ucywgYnV0IGlmIHRoaXMgc2l6ZSBpcyBub24tYmxvY2sgc2l6
ZSBhbGlnbmVkLAo+Pj4+Pj4+IGl0IHdpbGwgc2hvdyAyIHNlZ21lbnRzIGZpZW1hcCByZXN1bHRz
IGV2ZW4gdGhpcyB3aG9sZSBmaWxlCj4+Pj4+Pj4gaXMgY29udGlndW91cyBvbiBkaXNrLCBzdWNo
IGFzIHRoZSBmb2xsb3dpbmcgcmVzdWx0czoKPj4+Pj4+Pgo+Pj4+Pj4+ICAgICAgLi9mMmZzX2lv
IGZpZW1hcCAwIDE5MDM0IHlsb2cvYW5hbHl6ZXIucHkKPj4+Pj4+PiBGaWVtYXA6IG9mZnNldCA9
IDAgbGVuID0gMTkwMzQKPj4+Pj4+PiAgICAgICAgICAgICBsb2dpY2FsIGFkZHIuICAgIHBoeXNp
Y2FsIGFkZHIuICAgbGVuZ3RoICAgICAgICAgICBmbGFncwo+Pj4+Pj4+IDAgICAgICAgMDAwMDAw
MDAwMDAwMDAwMCAwMDAwMDAwMDIwYmFhMDAwIDAwMDAwMDAwMDAwMDQwMDAgMDAwMDEwMDAKPj4+
Pj4+PiAxICAgICAgIDAwMDAwMDAwMDAwMDQwMDAgMDAwMDAwMDAyMGJhZTAwMCAwMDAwMDAwMDAw
MDAxMDAwIDAwMDAxMDAxCj4+Pj4+Pj4KPj4+Pj4+PiBhZnRlciB0aGlzIHBhdGNoOgo+Pj4+Pj4+
IC4vZjJmc19pbyBmaWVtYXAgMCAxOTAzNCB5bG9nL2FuYWx5emVyLnB5Cj4+Pj4+Pj4gRmllbWFw
OiBvZmZzZXQgPSAwIGxlbiA9IDE5MDM0Cj4+Pj4+Pj4gICAgICAgICBsb2dpY2FsIGFkZHIuICAg
IHBoeXNpY2FsIGFkZHIuICAgbGVuZ3RoICAgICAgICAgICBmbGFncwo+Pj4+Pj4+IDAgICAgMDAw
MDAwMDAwMDAwMDAwMCAwMDAwMDAwMDMxNWYzMDAwIDAwMDAwMDAwMDAwMDUwMDAgMDAwMDEwMDEK
Pj4+Pj4+Pgo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5p
c29jLmNvbT4KPj4+Pj4+PiAtLS0KPj4+Pj4+PiBWMjogY29ycmVjdCBjb21taXQgbXNnIGFjY29y
ZGluZyB0byBDaGFvJ3MgcXVlc3Rpb25zCj4+Pj4+Pj4gZjJmc19pbyBoYXMgYmVlbiBtb2RpZmll
ZCBmb3IgdGVzdGluZywgdGhlIGxlbmd0aCBmb3IgZmllbWFwIGlzCj4+Pj4+Pj4gcmVhbCBmaWxl
IHNpemUsIG5vdCBibG9jayBudW1iZXIKPj4+Pj4+PiAtLS0KPj4+Pj4+PiAgICAgIGZzL2YyZnMv
ZGF0YS5jIHwgNCArKy0tCj4+Pj4+Pj4gICAgICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+Pj4+Cj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
ZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPj4+Pj4+PiBpbmRleCAzMDZiODZiMC4uOWZjMjI5ZCAx
MDA2NDQKPj4+Pj4+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+Pj4+Pj4+ICsrKyBiL2ZzL2YyZnMv
ZGF0YS5jCj4+Pj4+Pj4gQEAgLTE5NjYsOCArMTk2Niw4IEBAIGludCBmMmZzX2ZpZW1hcChzdHJ1
Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmllbWFwX2V4dGVudF9pbmZvICpmaWVpbmZvLAo+Pj4+
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPj4+Pj4+PiAgICAgICAgICB9
Cj4+Pj4+Pj4KPj4+Pj4+PiAtICAgICBpZiAoYnl0ZXNfdG9fYmxrcyhpbm9kZSwgbGVuKSA9PSAw
KQo+Pj4+Pj4+IC0gICAgICAgICAgICAgbGVuID0gYmxrc190b19ieXRlcyhpbm9kZSwgMSk7Cj4+
Pj4+Pj4gKyAgICAgaWYgKGxlbiAmIChibGtzX3RvX2J5dGVzKGlub2RlLCAxKSAtIDEpKQo+Pj4+
Pj4+ICsgICAgICAgICAgICAgbGVuID0gcm91bmRfdXAobGVuLCBibGtzX3RvX2J5dGVzKGlub2Rl
LCAxKSk7Cj4+Pj4+Pgo+Pj4+Pj4gSG93IGRvIHlvdSB0aGluayBvZiBnZXR0aW5nIHJpZCBvZiBh
Ym92ZSBhbGlnbm1lbnQgZm9yIGxlbj8KPj4+Pj4+Cj4+Pj4+Pj4KPj4+Pj4+PiAgICAgICAgICBz
dGFydF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCk7Cj4+Pj4+Pj4gICAgICAgICAg
bGFzdF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCArIGxlbiAtIDEpOwo+Pj4+Pj4K
Pj4+Pj4+IEFuZCByb3VuZCB1cCBlbmQgcG9zaXRpb24gdy86Cj4+Pj4+Pgo+Pj4+Pj4gbGFzdF9i
bGsgPSBieXRlc190b19ibGtzKGlub2RlLCByb3VuZF91cChzdGFydCArIGxlbiAtIDEsIEYyRlNf
QkxLU0laRSkpOwo+Pj4+PiBIaSBDaGFvLAo+Pj4+PiBJIHRoaW5rIHRoaXMgd2lsbCBjaGFuZ2Ug
dGhlIGN1cnJlbnQgY29kZSBsb2dpYwo+Pj4+PiAtLS0tLS0tLS0tLS0tCj4+Pj4+IGlmIChzdGFy
dF9ibGsgPiBsYXN0X2JsaykKPj4+Pj4gICAgICAgIGdvdG8gb3V0Owo+Pj4+PiAtLS0tLS0tLS0t
LS0tCj4+Pj4+IGZvciBleGFtcGxlLCBhIGZpbGUgd2l0aCBzaXplIDE5MDA2LCBidXQgdGhlIGxl
bmd0aCBmcm9tIHRoZSB1c2VyIGlzIDE2Mzg0Lgo+Pj4+PiBiZWZvcmUgdGhpcyBtb2RpZmljYXRp
b24sICBsYXN0X2JsayA9ICBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCArCj4+Pj4+IGxlbiAt
IDEpID0gKGlub2RlLCAxNjM4MykgPSAzCj4+Pj4+IGFmdGVyIHRoZSBmaXJzdCBmMmZzX21hcF9i
bG9ja3MoKS4gc3RhcnRfYmxrIGNoYW5nZSB0byBiZSA0LAo+Pj4+PiBhZnRlciB0aGUgc2Vjb25k
IGYyZnNfbWFwX2Jsb2NrcygpLCBmaWVtYXBfZmlsbF9uZXhfZXh0ZW4gd2lsbCBiZQo+Pj4+PiBj
YWxsZWQgdG8gZmlsbCB1c2VyIHBhcmFtZXRlciBhbmQgdGhlbgo+Pj4+PiB3aWxsIGdvdG8gb3V0
IGJlY2F1c2Ugc3RhcnRfYmxrID4gbGFzdF9ibGssIHRoZW4gZmllbWFwIGZsb3cgZmluaXNoZXMu
Cj4+Pj4+IGJ1dCBhZnRlciB0aGlzIG1vZGlmaWNhdGlvbiwgbGFzdF9ibGsgd2lsbCBiZSA0Cj4+
Pj4+IHdpbGwgZG8gZjJmc19tYXBfYmxvY2tzKCkgdW50aWwgcmVhY2ggdGhlIG1heF9maWxlX2Js
b2Nrcyhpbm9kZSkKPj4+Pgo+Pj4+IFllcywgeW91J3JlIHJpZ2h0LCBob3dldmVyLCB3LyB0aGlz
IHBhdGNoLCBpdCBtYXkgY2hhbmdlIGxhc3RfYmxrLCBlLmcuCj4+Pj4KPj4+PiB4ZnNfaW8gZmls
ZSAtYyAiZmllbWFwIC12IDAgMTkwMDYiIHZzIHhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMiAx
OTAwNiIKPj4+PiBzdGFydF9ibGsgYW5kIGxhc3RfYmxrIHdpbGwgYmU6IDAsIDQgYW5kIDAsIDUu
Cj4+PiBIaSBDaGFvLAo+Pj4geWVzLCBidXQgdy9vIHRoaXMgcGF0Y2ggLCB0aGUgb3JpZ2luYWwg
Y29kZSBzdGlsbCBoYXMgdGhlIHNhbWUgc2l0dWF0aW9uPz8KPj4+IGZvciBleGFtcGxlCj4+PiB4
ZnNfaW8gZmlsZSAtYyAiZmllbWFwIC12IDAgMTYzODQiIHZzIHhmc19pbyBmaWxlIC1jICJmaWVt
YXAgLXYgMiAxNjM4NCIKPj4+IHN0YXJ0X2JsayBhbmQgbGFzdF9ibGsgd2lsbCBiZTogMCwgMyBh
bmQgMCwgNC4KPj4KPj4gRm9yIHRoZSBjYXNlICJmaWVtYXAgLXYgMiAxOTAwNiIsIG9mZnNldCBp
cyAyLCBhbmQgbGVuZ3RoIGlzIDE5MDA2LCBzbyBsYXN0X29mZnNldAo+PiBpcyAxOTAwOCwgYW5k
IGxhc3RfYmxrIHNob3VsZCBiZSA0IHJhdGhlciB0aGFuIDUsIHJpZ2h0Pwo+IGhpIENoYW8sCj4g
aXQgaXMgcmlnaHQgdy9vIG15IHBhdGNoLgo+Pgo+PiBBbmQgZm9yIHlvdSBjYXNlLCBpdCBjYWxj
dWxhdGVzIGxhc3RfYmxrIGNvcnJlY3RseS4KPiBTbyB5b3Ugc3VnZ2VzdCB0aGF0ICJTaG91bGQg
d2Ugcm91bmRfdXAgbGVuIGFmdGVyIHN0YXJ0X2JsayAmIGxhc3RfYmxrCj4gY2FsY3VsYXRpb24/
IgoKWmhpZ3VvLAoKWWVzLCBJIHRoaW5rIGFsaWdubWVudCBvZiBsZW4gc2hvdWxkIG5vdCBhZmZl
Y3QgY2FsY3VsYXRpb24gb2YgbGFzdF9ibGsuCgpJIG1lYW4gdGhpcywKCi0tLQogIGZzL2YyZnMv
ZGF0YS5jICAgICAgICAgIHwgNiArKystLS0KICBpbmNsdWRlL2xpbnV4L2YyZnNfZnMuaCB8IDMg
KystCiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwppbmRleCA3ZDFiYjk1
MThhNDAuLmNiYmI5NTZmNDIwZCAxMDA2NDQKLS0tIGEvZnMvZjJmcy9kYXRhLmMKKysrIGIvZnMv
ZjJmcy9kYXRhLmMKQEAgLTE5NjcsMTIgKzE5NjcsMTIgQEAgaW50IGYyZnNfZmllbWFwKHN0cnVj
dCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWVtYXBfZXh0ZW50X2luZm8gKmZpZWluZm8sCiAgCQkJ
Z290byBvdXQ7CiAgCX0KCi0JaWYgKGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIGxlbikgPT0gMCkKLQkJ
bGVuID0gYmxrc190b19ieXRlcyhpbm9kZSwgMSk7Ci0KICAJc3RhcnRfYmxrID0gYnl0ZXNfdG9f
Ymxrcyhpbm9kZSwgc3RhcnQpOwogIAlsYXN0X2JsayA9IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIHN0
YXJ0ICsgbGVuIC0gMSk7CgorCWlmIChsZW4gJiBGMkZTX0JMS1NJWkVfTUFTSykKKwkJbGVuID0g
cm91bmRfdXAobGVuLCBGMkZTX0JMS1NJWkUpOworCiAgbmV4dDoKICAJbWVtc2V0KCZtYXAsIDAs
IHNpemVvZihtYXApKTsKICAJbWFwLm1fbGJsayA9IHN0YXJ0X2JsazsKZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvbGludXgvZjJmc19mcy5oIGIvaW5jbHVkZS9saW51eC9mMmZzX2ZzLmgKaW5kZXggYjBi
ODIxZWRmZDk3Li45NTRlOGU4MzQ0YjcgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvZjJmc19m
cy5oCisrKyBiL2luY2x1ZGUvbGludXgvZjJmc19mcy5oCkBAIC0yNCwxMCArMjQsMTEgQEAKICAj
ZGVmaW5lIE5FV19BRERSCQkoKGJsb2NrX3QpLTEpCS8qIHVzZWQgYXMgYmxvY2tfdCBhZGRyZXNz
ZXMgKi8KICAjZGVmaW5lIENPTVBSRVNTX0FERFIJCSgoYmxvY2tfdCktMikJLyogdXNlZCBhcyBj
b21wcmVzc2VkIGRhdGEgZmxhZyAqLwoKKyNkZWZpbmUgRjJGU19CTEtTSVpFX01BU0sJCShGMkZT
X0JMS1NJWkUgLSAxKQogICNkZWZpbmUgRjJGU19CWVRFU19UT19CTEsoYnl0ZXMpCSgoYnl0ZXMp
ID4+IEYyRlNfQkxLU0laRV9CSVRTKQogICNkZWZpbmUgRjJGU19CTEtfVE9fQllURVMoYmxrKQkJ
KChibGspIDw8IEYyRlNfQkxLU0laRV9CSVRTKQogICNkZWZpbmUgRjJGU19CTEtfRU5EX0JZVEVT
KGJsaykJCShGMkZTX0JMS19UT19CWVRFUyhibGsgKyAxKSAtIDEpCi0jZGVmaW5lIEYyRlNfQkxL
X0FMSUdOKHgpCQkJKEYyRlNfQllURVNfVE9fQkxLKCh4KSArIEYyRlNfQkxLU0laRSAtIDEpKQor
I2RlZmluZSBGMkZTX0JMS19BTElHTih4KQkJKEYyRlNfQllURVNfVE9fQkxLKCh4KSArIEYyRlNf
QkxLU0laRSAtIDEpKQoKICAvKiAwLCAxKG5vZGUgbmlkKSwgMihtZXRhIG5pZCkgYXJlIHJlc2Vy
dmVkIG5vZGUgaWQgKi8KICAjZGVmaW5lIEYyRlNfUkVTRVJWRURfTk9ERV9OVU0JCTMKLS0gCjIu
NDAuMQoKCgo+IFRoYW5rcwo+Pgo+PiBUaGFua3MsCj4+Cj4+PiBidXQgb3ZlcmFsbCBsYXN0X2Js
ayB3aWxsIGNoYW5nZSBsb29wIGNvdW50cyBidXQgaGFzIG5vdCBhZmZlY3Qgb24gdGhlIHJlc3Vs
dHMuCj4+Pj4KPj4+PiBTaG91bGQgd2Ugcm91bmRfdXAgbGVuIGFmdGVyIHN0YXJ0X2JsayAmIGxh
c3RfYmxrIGNhbGN1bGF0aW9uPwo+Pj4gSSB0aGlua3MgaXQgaXMgb2sgLGJ1dCBqdXN0IGEgbGl0
dGxlIGJpdCByZWR1bmRhbnQgd2l0aCB0aGUgZm9sbG93aW5nCj4+PiBoYW5kbGluZyBhYm91dCBs
ZW4uCj4+Pgo+Pj4gaWYgKGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIGxlbikgPT0gMCkKPj4+ICAgICAg
bGVuID0gYmxrc190b19ieXRlcyhpbm9kZSwgMSk7Cj4+Pgo+Pj4gQmFzZWQgb24gdGhlIGFib3Zl
IHNpdHVhdGlvbiwKPj4+IGRvIHlvdSBoYXZlIGFueSBvdGhlciBnb29kIHN1Z2dlc3Rpb25zPyBe
Xgo+Pj4gdGhhbmtzIQo+Pj4KPj4+Pgo+Pj4+IFRoYW5rcywKPj4+Pgo+Pj4+PiB0aGFua3PvvIEK
Pj4+Pj4+Cj4+Pj4+PiBUaGFua3MsCj4+Pj4+Pgo+Pj4+Cj4+CgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
