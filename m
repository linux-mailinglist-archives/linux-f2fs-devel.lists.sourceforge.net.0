Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B217CA382
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Oct 2023 11:07:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qsJZ9-0007ky-Jq;
	Mon, 16 Oct 2023 09:07:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qsJZ8-0007ks-OA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Oct 2023 09:07:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JnPmGmxjpG37wvqQF7DzyLSX/2JE03GQ1DzlELAugrM=; b=ihuIKrhwpNmhhsLJuDvWD1oApt
 iy0RuT0Z+N2NnxNVI573pH/vy0JqCav+XT7U2vchVhz4KdnHBXRuBKVjp64JEJh6O1wdfRxhKZAR0
 xlu+8tnYc++4AEeJrZUfRRYsX6nfkn3j0BuF8cew+D1g4WFRgs2p+ol79XUCrfJwY/Ck=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JnPmGmxjpG37wvqQF7DzyLSX/2JE03GQ1DzlELAugrM=; b=PT2gz3PIw0GBDVOnfeQoYQKVS4
 GPFFRjpck7CQrdszQLsYfQA1VqpMvoXIeb+HpdUHPahCyEkjpHE1sf1pt9y5hodeYez2S0drWV3mG
 41CkaZIMexhH1YtIaxJx+vPoFAT5MSOkWlf67RPNCaC1FM35pvAzob5pT0oEam3A/ASM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qsJZ6-0005eE-Dn for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Oct 2023 09:07:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 57FABB811A9;
 Mon, 16 Oct 2023 09:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E00C433C7;
 Mon, 16 Oct 2023 09:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697447221;
 bh=vAcbyIOjw+AfWx5J2hAtjpDPMhfYDMRRsuqGfoxZOdE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Tb73q4b432ITZ5MH14wlBR79fZaalJVSJg8mrF2qZBXgSeyGe0HN0vqyVoQmn3Dan
 yFdSivbWmot7QQs/d1dBUQ5tj/VjVCykPATcwUtcZacbTPl7h9FD777Hsfyr5k9SlY
 h5vz16bagkss48SsndbZO6lGWydvE0sVQpYX5f1NO9gDl/C2vkjvbQTY+Zs5s11LlE
 VBMDNK+nYNg7nNioI7rRsvpZ64Cn31lLKtC+wYc89ZiNs4prU12zgeQITtiG4kZY0h
 Tg1g22XH7t3pGURRYFVSPGjmynGlUKU7h7PC1E3zCjTIj2Bh5porivNN3eyZTXyqXI
 EYTHmjhmHX5cw==
Message-ID: <4409f648-40f6-c28a-ebe0-d2c69ecd11fc@kernel.org>
Date: Mon, 16 Oct 2023 17:06:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1697194703-21371-1-git-send-email-zhiguo.niu@unisoc.com>
 <1880a7c4-9ab9-8e6d-f1d4-c2172a99685c@kernel.org>
 <CAHJ8P3J+Rnx4dUDGesdrtajDdP_SxDaM6yyYbHRt4ij_wVGhsg@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3J+Rnx4dUDGesdrtajDdP_SxDaM6yyYbHRt4ij_wVGhsg@mail.gmail.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Zhiguo, On 2023/10/16 17:02, Zhiguo Niu wrote: > Dear Chao,
    > > On Mon, Oct 16, 2023 at 3:37 PM Chao Yu <chao@kernel.org> wrote: >>
    >> On 2023/10/13 18:58, Zhiguo Niu wrote: >>> SBI_NEED_FSCK should be set
    [...] 
 
 Content analysis details:   (-5.8 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [145.40.68.75 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -3.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qsJZ6-0005eE-Dn
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix error path of
 __f2fs_build_free_nids
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
Cc: jaegeuk@kernel.org, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

WmhpZ3VvLAoKT24gMjAyMy8xMC8xNiAxNzowMiwgWmhpZ3VvIE5pdSB3cm90ZToKPiBEZWFyIENo
YW8sCj4gCj4gT24gTW9uLCBPY3QgMTYsIDIwMjMgYXQgMzozN+KAr1BNIENoYW8gWXUgPGNoYW9A
a2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIDIwMjMvMTAvMTMgMTg6NTgsIFpoaWd1byBOaXUg
d3JvdGU6Cj4+PiBTQklfTkVFRF9GU0NLIHNob3VsZCBiZSBzZXQgZm9yIGZzY2sgaGFzIGEgY2hh
bmNlIHRvCj4+PiByZXBhaXIgaW4gY2FzZSBvZiBzY2FuX25hdF9wYWdlIGZhaWwgaW4gcnVuIHRp
bWUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlzb2Mu
Y29tPgo+Pgo+PiBIaSBaaGlndW8sCj4+Cj4+IENhbiB5b3UgcGxlYXNlIGNoZWNrIGJlbG93IHVw
ZGF0ZT8KPj4KPj4gICBGcm9tIDlhMzQ1OWQyZDYyYTEyZjg3MDhkNzJhYTc4MDhhMWRlZjlmOWQ5
MmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4+IEZyb206IFpoaWd1byBOaXUgPHpoaWd1by5u
aXVAdW5pc29jLmNvbT4KPj4gRGF0ZTogRnJpLCAxMyBPY3QgMjAyMyAxODo1ODoyMyArMDgwMAo+
PiBTdWJqZWN0OiBbUEFUQ0hdIGYyZnM6IGZpeCBlcnJvciBwYXRoIG9mIF9fZjJmc19idWlsZF9m
cmVlX25pZHMKPj4KPj4gSWYgTkFUIGlzIGNvcnJ1cHRlZCwgbGV0IHNjYW5fbmF0X3BhZ2UoKSBy
ZXR1cm4gRUZTQ09SUlVQVEVELCBzbyB0aGF0LAo+PiBjYWxsZXIgY2FuIHNldCBTQklfTkVFRF9G
U0NLIGZsYWcgaW50byBjaGVja3BvaW50IGZvciBsYXRlciByZXBhaXIgYnkKPj4gZnNjay4KPj4K
Pj4gQWxzbywgdGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgbmV3IGZzY29ycnVwdGVkIGVycm9yIGZs
YWcsIGFuZCBpbiBhYm92ZQo+PiBzY2VuYXJpbywgaXQgd2lsbCBwZXJzaXN0IHRoZSBlcnJvciBm
bGFnIGludG8gc3VwZXJibG9jayBzeW5jaHJvbm91c2x5Cj4+IHRvIGF2b2lkIGl0IGhhcyBubyBs
dWNrIHRvIHRyaWdnZXIgYSBjaGVja3BvaW50IHRvIHJlY29yZCBTQklfTkVFRF9GU0NLLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVuaXNvYy5jb20+Cj4+IFNp
Z25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4gLS0tCj4+ICAgIGZzL2Yy
ZnMvbm9kZS5jICAgICAgICAgIHwgMTEgKysrKysrKysrLS0KPj4gICAgaW5jbHVkZS9saW51eC9m
MmZzX2ZzLmggfCAgMSArCj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvbm9kZS5jIGIvZnMvZjJm
cy9ub2RlLmMKPj4gaW5kZXggYTJiMmM2YzdmNjZkLi41N2Q5ZGQzYTQzYmMgMTAwNjQ0Cj4+IC0t
LSBhL2ZzL2YyZnMvbm9kZS5jCj4+ICsrKyBiL2ZzL2YyZnMvbm9kZS5jCj4+IEBAIC0yMzg5LDcg
KzIzODksNyBAQCBzdGF0aWMgaW50IHNjYW5fbmF0X3BhZ2Uoc3RydWN0IGYyZnNfc2JfaW5mbyAq
c2JpLAo+PiAgICAgICAgICAgICAgICAgIGJsa19hZGRyID0gbGUzMl90b19jcHUobmF0X2Jsay0+
ZW50cmllc1tpXS5ibG9ja19hZGRyKTsKPj4KPj4gICAgICAgICAgICAgICAgICBpZiAoYmxrX2Fk
ZHIgPT0gTkVXX0FERFIpCj4+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
Owo+PiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVGU0NPUlJVUFRFRDsKPj4KPj4g
ICAgICAgICAgICAgICAgICBpZiAoYmxrX2FkZHIgPT0gTlVMTF9BRERSKSB7Cj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICBhZGRfZnJlZV9uaWQoc2JpLCBzdGFydF9uaWQsIHRydWUsIHRydWUp
Owo+PiBAQCAtMjUwNCw3ICsyNTA0LDE0IEBAIHN0YXRpYyBpbnQgX19mMmZzX2J1aWxkX2ZyZWVf
bmlkcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4+Cj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICBpZiAocmV0KSB7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGYyZnNf
dXBfcmVhZCgmbm1faS0+bmF0X3RyZWVfbG9jayk7Cj4+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZjJmc19lcnIoc2JpLCAiTkFUIGlzIGNvcnJ1cHQsIHJ1biBmc2NrIHRvIGZpeCBp
dCIpOwo+PiArCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCA9PSAt
RUZTQ09SUlVQVEVEKSB7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBmMmZzX2VycihzYmksICJOQVQgaXMgY29ycnVwdCwgcnVuIGZzY2sgdG8gZml4IGl0Iik7Cj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZXRfc2JpX2ZsYWcoc2Jp
LCBTQklfTkVFRF9GU0NLKTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGYyZnNfaGFuZGxlX2Vycm9yKHNiaSwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFUlJPUl9JTkNPTlNJU1RFTlRfTkFUKTsKPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4+ICsKPj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPj4gICAgICAgICAgICAgICAgICAgICAgICAg
IH0KPj4gICAgICAgICAgICAgICAgICB9Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2Yy
ZnNfZnMuaCBiL2luY2x1ZGUvbGludXgvZjJmc19mcy5oCj4+IGluZGV4IDA3ZWQ2OWMyODQwZC4u
MDM5ZmUwY2U4ZDgzIDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L2YyZnNfZnMuaAo+PiAr
KysgYi9pbmNsdWRlL2xpbnV4L2YyZnNfZnMuaAo+PiBAQCAtMTA0LDYgKzEwNCw3IEBAIGVudW0g
ZjJmc19lcnJvciB7Cj4+ICAgICAgICAgIEVSUk9SX0NPUlJVUFRFRF9WRVJJVFlfWEFUVFIsCj4+
ICAgICAgICAgIEVSUk9SX0NPUlJVUFRFRF9YQVRUUiwKPj4gICAgICAgICAgRVJST1JfSU5WQUxJ
RF9OT0RFX1JFRkVSRU5DRSwKPj4gKyAgICAgICBFUlJPUl9JTkNPTlNJU1RFTlRfTkFULAo+PiAg
ICAgICAgICBFUlJPUl9NQVgsCj4+ICAgIH07Cj4+Cj4+IC0tCj4+IDIuNDAuMQo+IAo+IFRoYW5r
IHlvdSBmb3IgeW91ciB1cGRhdGVzIGFuZCB0aGVzZSB1cGRhdGVzIGFyZSBtb3JlIHJlYXNvbmFi
bGUgYmFzZWQKPiBvbiB0aGUgbGF0ZXN0IGNvZGUuCj4gSW4gYWRkaXRpb24sICBJIGFsc28gbW9k
aWZpZWQgdGhlIGZvbGxvd2luZyBjb2RlIGFmdGVyIEkgY2hlY2tlZCB0aGUKPiByZWxhdGVkIGZs
b3cgb2YgZjJmc19oYW5kbGVfZXJyb3IuCj4gRVJST1JfSU5DT05TSVNURU5UX0ZPT1RFUiBpcyBy
ZXVzZWQgaGVyZSwgICBhbnkgc3VnZ2VzdGlvbnMgZm9yIHRoaXM/Cj4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvbm9kZS5jIGIvZnMvZjJmcy9ub2RlLmMKPiBpbmRleCBkOWU2MDg3Li45NGY1YzdmIDEw
MDY0NAo+IC0tLSBhL2ZzL2YyZnMvbm9kZS5jCj4gKysrIGIvZnMvZjJmcy9ub2RlLmMKPiBAQCAt
MTQ2Nyw2ICsxNDY3LDcgQEAgc3RhdGljIHN0cnVjdCBwYWdlICpfX2dldF9ub2RlX3BhZ2Uoc3Ry
dWN0Cj4gZjJmc19zYl9pbmZvICpzYmksIHBnb2ZmX3QgbmlkLAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIG9mc19vZl9ub2RlKHBhZ2UpLCBjcHZlcl9vZl9ub2RlKHBhZ2UpLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIG5leHRfYmxrYWRkcl9vZl9ub2RlKHBhZ2UpKTsKPiAgICAg
ICAgICBzZXRfc2JpX2ZsYWcoc2JpLCBTQklfTkVFRF9GU0NLKTsKPiArICAgICAgIGYyZnNfaGFu
ZGxlX2Vycm9yKHNiaSwgRVJST1JfSU5DT05TSVNURU5UX0ZPT1RFUik7Cj4gICAgICAgICAgZXJy
ID0gLUVJTlZBTDsKCmVyciA9IC1FRlNDT1JSVVBURUQ7Cgo+ICAgb3V0X2VycjoKPiAgICAgICAg
ICBDbGVhclBhZ2VVcHRvZGF0ZShwYWdlKTsKPiAKPiBJZiB5b3UgaGF2ZSBubyBvdGhlciBzdWdn
ZXN0aW9ucywgSSB3aWxsIHVwZGF0ZSB0aGUgIlBBVENIIFYyIgoKSG93IGFib3V0IGNoYW5naW5n
IGFib3ZlIGNvZGUgaW4gc2VwYXJhdGVkIHBhdGNoPwoKVGhhbmtzLAoKID4gVGhhbmtzIQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
