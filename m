Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6C683AC83
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jan 2024 15:54:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rSeeQ-0005bY-Np;
	Wed, 24 Jan 2024 14:54:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rSeeO-0005bM-Mq
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jan 2024 14:54:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6gUP3xZQzMw3jTBHI6Cc9TrKKQZZguSXBuD70gTvnik=; b=Z+Xn0j0mLbLnK2nxRrAmNz4OR0
 WgZ/2o6HlYdmaaSdgPHIi3ywNRHcBBtCi/wZPOKrBelFMLHE9ZCYxi9E8cwrEo3L0xAaSvxuZEiKk
 iU535LtusHC/2+C4Rv/nPaii29sl0VEFnWflP52sHbu4NYsxc+mI8tZV1OVarkYj3+j4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6gUP3xZQzMw3jTBHI6Cc9TrKKQZZguSXBuD70gTvnik=; b=VakAwmpLLw1Kle6dMnAD1rQviX
 MctJ2/g5ACimhqiB6/C/N6bFXbERNeS2+jHFqXezuV/crjPOqrmjVZNWYY+7UvfJj7LJtcpQv3cFk
 Yrs7P5dLw/IB+LKca/jIp59LqtvUBB79LllmH7es1DLJlg1D7YH1IgZixGxEwDT8K0fA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rSeeN-0000gn-Ft for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jan 2024 14:54:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 62AD4CE296C;
 Wed, 24 Jan 2024 14:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52974C433C7;
 Wed, 24 Jan 2024 14:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706108078;
 bh=EN20Jf/orEGnGWTKkhnrX0y5TE3fu6bVQexb33h8Zgw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pj2mKTRrqqjBqq6BhTCRwxiKp3s55N2msA2nDLK63aWZfe2O8x6viPZ/yif0dl/Dr
 JMc6d/ZkZsn3hTGXrUzMeP8J2hsGCg98Gp/1wJKphm4jVpS4nT/q/nmH+h18dxx6W+
 OQ9sPxQvy680F1F2F/eQNG/sYDTltLIaT6lGYIj2xZ7CI76GgK1FoIHMHWZFMerHEa
 gZ/1AXmwmGmdnXlMPMib4a+5S0dZ+UlgUH4jm0J7W5LlOf3IyU3enU+F3Yz1hTpKHf
 onsLVNDxC52CNR38XMGgRQS/XdVDIAFnkC1abKhIrCvAre0cVzD/Is+daLc9kySpj4
 dKIQfZjFKBQNQ==
Message-ID: <b2a3268a-7087-4ff5-9148-dcbc7c95e2bb@kernel.org>
Date: Wed, 24 Jan 2024 22:54:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1703502715-11936-1-git-send-email-zhiguo.niu@unisoc.com>
 <74243f43-c129-4530-970c-4de2afcd307e@kernel.org>
 <CAHJ8P3KmnN3rc5yXh2ecg21Eu61srUJsJP8=TbPxfSu4dY91EQ@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3KmnN3rc5yXh2ecg21Eu61srUJsJP8=TbPxfSu4dY91EQ@mail.gmail.com>
X-Spam-Score: -4.0 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Zhiguo, Can you please check below version? Is it fine to
 you?
 https://lore.kernel.org/linux-f2fs-devel/20240124144915.19445-1-chao@kernel.org
 Content analysis details:   (-4.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rSeeN-0000gn-Ft
Subject: Re: [f2fs-dev] [PATCH V1] f2fs: fix potentail deadloop issue in
 do_recover_data
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
Cc: jaegeuk@kernel.org, ke.wang@unisoc.com, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

WmhpZ3VvLAoKQ2FuIHlvdSBwbGVhc2UgY2hlY2sgYmVsb3cgdmVyc2lvbj8gSXMgaXQgZmluZSB0
byB5b3U/CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzIwMjQwMTI0
MTQ0OTE1LjE5NDQ1LTEtY2hhb0BrZXJuZWwub3JnCgpPbiAyMDI0LzEvMjIgMTM6NDYsIFpoaWd1
byBOaXUgd3JvdGU6Cj4gSGkgQ2hhbwo+IAo+IE9uIE1vbiwgSmFuIDIyLCAyMDI0IGF0IDExOjQ2
4oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4gT24gMjAyMy8xMi8y
NSAxOToxMSwgWmhpZ3VvIE5pdSB3cm90ZToKPj4+IFRoZXJlIGlzIGEgcG90ZW50YWlsIGRlYWRs
b29wIGlzc3VlIGluIHRoZSBjb3JuZXIgY2FzZSBvZgo+Pj4gQ09ORklHX0YyRlNfRkFVTFRfSU5K
RUNUSU9OIGlzIGVuYWJsZWQgYW5kIHRoZSByZXR1cm4gdmFsdWUKPj4+IG9mIGYyZnNfcmVzZXJ2
ZV9uZXdfYmxvY2sgaXMgZXJyb3IgYnV0IG5vdCAtRU5PU1BDLCBzdWNoIGFzCj4+PiB0aGlzIGVy
cm9yIGNhc2U6Cj4+PiBpZiAodW5saWtlbHkoaXNfaW5vZGVfZmxhZ19zZXQoZG4tPmlub2RlLCBG
SV9OT19BTExPQykpKQo+Pj4gICAgICAgICAgICAgICAgcmV0dXJuIC1FUEVSTTsKPj4KPj4gSSBk
b24ndCBzZWUgYW55IHBhdGggdG8gdHJpZ2dlciB0aGlzIGVycm9yPyBhbSBJIG1pc3Npbmcgc29t
ZXRoaW5nPwo+Pgo+Pj4gYmVzaWRlcywgdGhlIG1haW5seSBlcnJvciAtRU5PU1BDIGhhcyBiZWVu
IGhhbmRsZWQgYXMgYnVnIG9uLAo+Pj4gc28gb3RoZXIgZXJyb3IgY2FzZXMgY2FuIGJlIHByb2Vj
c3NlZCBub3JtYWxseSB3aXRob3V0IGxvb3BpbmcuCj4+Cj4+IGNvbW1pdCA5NzU3NTZjNDEzMzJi
YzVlNTIzZTlmODQzMjcxZWQ1YWI2YWFhYWFhCj4+IEF1dGhvcjogSmFlZ2V1ayBLaW0gPGphZWdl
dWtAa2VybmVsLm9yZz4KPj4gRGF0ZTogICBUaHUgTWF5IDE5IDExOjU3OjIxIDIwMTYgLTA3MDAK
Pj4KPj4gICAgICAgZjJmczogYXZvaWQgRU5PU1BDIGZhdWx0IGluIHRoZSByZWNvdmVyeSBwcm9j
ZXNzCj4+Cj4+ICAgICAgIFRoaXMgcGF0Y2ggYXZvaWRzIGltcG9zc2libGUgZXJyb3IgaW5qZWN0
aW9uLCBFTk9TUEMsIGR1cmluZyByZWNvdmVyeSBwcm9jZXNzLgo+Pgo+PiBQbGVhc2UgY2hlY2sg
YWJvdmUgcGF0Y2gsIEkgZ3Vlc3MgaW50ZW50aW9uIG9mIGFkZGluZyBzdWNoIGxvb3AgaXMKPj4g
dG8gYXZvaWQgbW91bnQgZmFpbHVyZSBkdWUgdG8gZmF1bHQgaW5qZWN0aW9uIHdhcyB0cmlnZ2Vy
ZWQgaW4KPj4gZjJmc19yZXNlcnZlX25ld19ibG9jaygpLgo+Pgo+PiBXaGF0IGFib3V0IGNoYW5n
ZSBhcyBibGV3Pwo+PiAtIGtlZXAgdGhlIGxvb3AgdG8gYXZvaWQgbW91bnQgZmFpbHVyZS4KPj4g
LSByZW1vdmUgYnVnX29uKCkgdG8gYXZvaWQgcGFuaWMgZHVlIHRvIGZhdWx0IGluamVjdGlvbiBl
cnJvci4KPj4KPj4gI2RlZmluZSBERUZBVUxUX1JFVFJZX0NPVU5UICAgICAgICAgICAgIDgKPj4K
Pj4gICAgICAgICAgICAgICAgICBmb3IgKGxvb3BzID0gREVGQVVMVF9SRVRSWV9DT1VOVDsgbG9v
cHMgPiAwOyBsb29wcy0tKSB7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBlcnIgPSBmMmZz
X3Jlc2VydmVfbmV3X2Jsb2NrKCZkbik7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAo
IWVyciB8fAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAhSVNfRU5BQkxFRChD
T05GSUdfRjJGU19GQVVMVF9JTkpFQ1RJT04pKQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBicmVhazsKPj4gICAgICAgICAgICAgICAgICB9Cj4gCj4gVGhhbmtzIGZvciB5b3Vy
IGRldGFpbGVkIGV4cGxhbmF0aW9uIGFuZCBJIHVuZGVyc3RhbmQuCj4gSXQgc2VlbXMgdGhhdCB0
aGUgb3JpZ2luYWwgcHJvY2VzcyBpcyBhbHNvIHJlYXNvbmFibGUsCj4gc28gaXTigJlzIG9rYXkg
dG8ga2VlcCBpdCBhcyBpdCBpcy4KPj4KPj4gVGhhbmtzLAo+Pgo+Pj4KPj4+IEZpeGVzOiA5NTZm
YTFkZGMxMzIgKCJmMmZzOiBmaXggdG8gY2hlY2sgcmV0dXJuIHZhbHVlIG9mIGYyZnNfcmVzZXJ2
ZV9uZXdfYmxvY2soKSIpCj4+PiBTaWduZWQtb2ZmLWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1
QHVuaXNvYy5jb20+Cj4+PiAtLS0KPj4+ICAgIGZzL2YyZnMvcmVjb3ZlcnkuYyB8IDI2ICsrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCAxOCBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9yZWNvdmVy
eS5jIGIvZnMvZjJmcy9yZWNvdmVyeS5jCj4+PiBpbmRleCAyMTM4MWI3Li41ZDY1OGY2IDEwMDY0
NAo+Pj4gLS0tIGEvZnMvZjJmcy9yZWNvdmVyeS5jCj4+PiArKysgYi9mcy9mMmZzL3JlY292ZXJ5
LmMKPj4+IEBAIC03MTAsMTUgKzcxMCwxMCBAQCBzdGF0aWMgaW50IGRvX3JlY292ZXJfZGF0YShz
dHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4+PiAgICAgICAg
ICAgICAgICAgKi8KPj4+ICAgICAgICAgICAgICAgIGlmIChkZXN0ID09IE5FV19BRERSKSB7Cj4+
PiAgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfdHJ1bmNhdGVfZGF0YV9ibG9ja3NfcmFuZ2Uo
JmRuLCAxKTsKPj4+IC0gICAgICAgICAgICAgICAgICAgICBkbyB7Cj4+PiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBlcnIgPSBmMmZzX3Jlc2VydmVfbmV3X2Jsb2NrKCZkbik7Cj4+PiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoZXJyID09IC1FTk9TUEMpIHsKPj4+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZjJmc19idWdfb24oc2JpLCAxKTsK
Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4+PiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4+PiAtICAgICAgICAgICAgICAgICAgICAgfSB3
aGlsZSAoZXJyICYmCj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJU19FTkFCTEVE
KENPTkZJR19GMkZTX0ZBVUxUX0lOSkVDVElPTikpOwo+Pj4gLSAgICAgICAgICAgICAgICAgICAg
IGlmIChlcnIpCj4+PiArICAgICAgICAgICAgICAgICAgICAgZXJyID0gZjJmc19yZXNlcnZlX25l
d19ibG9jaygmZG4pOwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGlmIChlcnIgPT0gLUVOT1NQ
QykKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfYnVnX29uKHNiaSwgMSk7
Cj4+PiArICAgICAgICAgICAgICAgICAgICAgZWxzZSBpZiAoZXJyKQo+Pj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyOwo+Pj4gICAgICAgICAgICAgICAgICAgICAgICBj
b250aW51ZTsKPj4+ICAgICAgICAgICAgICAgIH0KPj4+IEBAIC03MjcsMTUgKzcyMiwxMCBAQCBz
dGF0aWMgaW50IGRvX3JlY292ZXJfZGF0YShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVj
dCBpbm9kZSAqaW5vZGUsCj4+PiAgICAgICAgICAgICAgICBpZiAoZjJmc19pc192YWxpZF9ibGth
ZGRyKHNiaSwgZGVzdCwgTUVUQV9QT1IpKSB7Cj4+Pgo+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICBpZiAoc3JjID09IE5VTExfQUREUikgewo+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZG8gewo+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlcnIgPSBm
MmZzX3Jlc2VydmVfbmV3X2Jsb2NrKCZkbik7Cj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGlmIChlcnIgPT0gLUVOT1NQQykgewo+Pj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfYnVnX29uKHNiaSwgMSk7Cj4+PiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4+PiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0KPj4+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIH0gd2hpbGUgKGVyciAmJgo+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBJU19FTkFCTEVEKENPTkZJR19GMkZTX0ZBVUxUX0lOSkVDVElPTikpOwo+
Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGVycikKPj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGVyciA9IGYyZnNfcmVzZXJ2ZV9uZXdfYmxvY2soJmRuKTsKPj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChlcnIgPT0gLUVOT1NQQykKPj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZjJmc19idWdfb24oc2JpLCAxKTsK
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVsc2UgaWYgKGVycikKPj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyOwo+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICB9Cj4+PiAgICByZXRyeV9wcmV2OgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
