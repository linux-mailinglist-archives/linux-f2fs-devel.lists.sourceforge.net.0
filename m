Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF8F8403A6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jan 2024 12:17:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUPdY-0006Ap-CU;
	Mon, 29 Jan 2024 11:17:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rUPdW-0006Ae-Dh
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 11:17:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wsl6GXrZC1IFa6biWKE9LaCWUNJGQm90pFHXw2cjDvc=; b=jXAsqPn6SN1XsYqVbZXug6t7Ib
 ehweDc1YlC/WYGDazZdEOD/tPwDEqfTwTeogdlfpcycRtWZ9t2tAoX6asyvMMhFOD95lt5qSw6ZHK
 m4tarWs93hqqtSdRnh61y9FNqXI+TmIu22xPxawWFW9v00ZCMP/0xifgmwKTVY9v5Z2Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wsl6GXrZC1IFa6biWKE9LaCWUNJGQm90pFHXw2cjDvc=; b=SyGNnaGwIxszZ3S2caYXpITnJb
 VDJVSaCgJmygNCKo3abqkJFeMPPHyJ1y6HHCjrSuwzjqxA1i6k7Xi7XY4Au1mINHQp82Clnq5Y0Fa
 C+fGdJpZqcuqKDXUPeI+/bTh+IezvmKg2kIcxDAxhGZXiqM6b3QIccktKFgs/gtD/HHg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rUPdR-0000er-Hj for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 11:17:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9547B620D0;
 Mon, 29 Jan 2024 11:16:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2414C433F1;
 Mon, 29 Jan 2024 11:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706527015;
 bh=S9RgsTiinDPCOsZbeFEA2HpDxwJGkw8/kTFTAURjfYY=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=MloQDblJX8MmBA9g95QdxAITc2g2x/5JFsfZaXmWxhROVFlStuSOEUO1A35qQRyuX
 l2XiE0bvoUtN6Kpft3NYUPEu4RJvADWhpIA3LyQWMwweowwNX4MTvVhxsZzZBO95UP
 KqMzgAQueECLGs5aBg9UJZ1H0zrCuSE+xcSU0ZbaXhx3ExAOhw1L4L5mJdiwM4k28+
 8DWEYB4Sh6r+nW9t2xUK2Z53w1mlNg+p+QG0ASXiMtTGva/EnxNP8JfOlzzP+S7sLp
 j3axAlq48y0MfuA/qB3QchQd4amMnGid+awTNDRkA5dqc1GcwW5EArVYD7N8hq2qeT
 0QcWnpS2NhKWA==
Message-ID: <0f356116-9e67-4abb-8bc2-65e63a936c17@kernel.org>
Date: Mon, 29 Jan 2024 19:16:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
To: Wenjie Qi <qwjhust@gmail.com>, jaegeuk@kernel.org
References: <20240116141138.1245-1-qwjhust@gmail.com>
 <d379bc01-ca31-41e6-9d85-7fca846af491@kernel.org>
In-Reply-To: <d379bc01-ca31-41e6-9d85-7fca846af491@kernel.org>
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/1/29 18:27, Chao Yu wrote: > On 2024/1/16 22:11,
 Wenjie
 Qi wrote: >> BUG: kernel NULL pointer dereference, address: 0000000000000014
 >> RIP: 0010:f2fs_submit_page_write+0x6cf/0x780 [f2fs] >> C [...] 
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rUPdR-0000er-Hj
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: fix NULL pointer dereference in
 f2fs_submit_page_write()
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
Cc: linux-kernel@vger.kernel.org, hustqwj@hust.edu.cn,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8xLzI5IDE4OjI3LCBDaGFvIFl1IHdyb3RlOgo+IE9uIDIwMjQvMS8xNiAyMjoxMSwg
V2VuamllIFFpIHdyb3RlOgo+PiBCVUc6IGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2Us
IGFkZHJlc3M6IDAwMDAwMDAwMDAwMDAwMTQKPj4gUklQOiAwMDEwOmYyZnNfc3VibWl0X3BhZ2Vf
d3JpdGUrMHg2Y2YvMHg3ODAgW2YyZnNdCj4+IENhbGwgVHJhY2U6Cj4+IDxUQVNLPgo+PiA/IHNo
b3dfcmVncysweDZlLzB4ODAKPj4gPyBfX2RpZSsweDI5LzB4NzAKPj4gPyBwYWdlX2ZhdWx0X29v
cHMrMHgxNTQvMHg0YTAKPj4gPyBwcmJfcmVhZF92YWxpZCsweDIwLzB4MzAKPj4gPyBfX2lycV93
b3JrX3F1ZXVlX2xvY2FsKzB4MzkvMHhkMAo+PiA/IGlycV93b3JrX3F1ZXVlKzB4MzYvMHg3MAo+
PiA/IGRvX3VzZXJfYWRkcl9mYXVsdCsweDMxNC8weDZjMAo+PiA/IGV4Y19wYWdlX2ZhdWx0KzB4
N2QvMHgxOTAKPj4gPyBhc21fZXhjX3BhZ2VfZmF1bHQrMHgyYi8weDMwCj4+ID8gZjJmc19zdWJt
aXRfcGFnZV93cml0ZSsweDZjZi8weDc4MCBbZjJmc10KPj4gPyBmMmZzX3N1Ym1pdF9wYWdlX3dy
aXRlKzB4NzM2LzB4NzgwIFtmMmZzXQo+PiBkb193cml0ZV9wYWdlKzB4NTAvMHgxNzAgW2YyZnNd
Cj4+IGYyZnNfb3V0cGxhY2Vfd3JpdGVfZGF0YSsweDYxLzB4YjAgW2YyZnNdCj4+IGYyZnNfZG9f
d3JpdGVfZGF0YV9wYWdlKzB4M2Y4LzB4NjYwIFtmMmZzXQo+PiBmMmZzX3dyaXRlX3NpbmdsZV9k
YXRhX3BhZ2UrMHg1YmIvMHg3YTAgW2YyZnNdCj4+IGYyZnNfd3JpdGVfY2FjaGVfcGFnZXMrMHgz
ZGEvMHhiZTAgW2YyZnNdCj4+IC4uLgo+PiBJdCBpcyBwb3NzaWJsZSB0aGF0IG90aGVyIHRocmVh
ZHMgaGF2ZSBhZGRlZCB0aGlzIGZpbyB0byBpby0+YmlvCj4+IGFuZCBzdWJtaXR0ZWQgdGhlIGlv
LT5iaW8gYmVmb3JlIGVudGVyaW5nIGYyZnNfc3VibWl0X3BhZ2Vfd3JpdGUoKS4KPj4gQXQgdGhp
cyBwb2ludCBpby0+YmlvID0gTlVMTC4KPj4gSWYgaXNfZW5kX3pvbmVfYmxrYWRkcihzYmksIGZp
by0+bmV3X2Jsa2FkZHIpIG9mIHRoaXMgZmlvIGlzIHRydWUsCj4+IHRoZW4gYW4gTlVMTCBwb2lu
dGVyIGRlcmVmZXJlbmNlIGVycm9yIG9jY3VycyBhdCBiaW9fZ2V0KGlvLT5iaW8pLgo+PiBUaGUg
b3JpZ2luYWwgY29kZSBmb3IgZGV0ZXJtaW5pbmcgem9uZSBlbmQgd2FzIGFmdGVyICJvdXQ6IiwK
Pj4gd2hpY2ggd291bGQgaGF2ZSBtaXNzZWQgc29tZSBmaW8gd2hvIGlzIHpvbmUgZW5kLiBJJ3Zl
IG1vdmVkCj4+IMKgIHRoaXMgY29kZSBiZWZvcmUgInNraXA6IiB0byBtYWtlIHN1cmUgaXQncyBk
b25lIGZvciBlYWNoIGZpby4KPj4KCkZpeGVzOiBlMDY3ZGMzYzZiOWMgKCJmMmZzOiBtYWludGFp
biBzaXggb3BlbiB6b25lcyBmb3Igem9uZWQgZGV2aWNlcyIpCgo+PiBTaWduZWQtb2ZmLWJ5OiBX
ZW5qaWUgUWkgPHF3amh1c3RAZ21haWwuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBDaGFvIFl1IDxj
aGFvQGtlcm5lbC5vcmc+Cj4gCj4gVGhhbmtzLAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
