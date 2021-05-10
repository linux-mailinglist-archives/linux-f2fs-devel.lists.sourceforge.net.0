Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E22B3784C1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 13:20:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg3xN-0002tO-NU; Mon, 10 May 2021 11:20:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1lg3xL-0002tA-MX; Mon, 10 May 2021 11:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nNazoQW0wQFkJyz3CCTQq2cb9JpYNJ6yU8+6sRjnKGQ=; b=bqStBiRQIh0U9gJuzgPxIePM6n
 AXikI4Za+oqpEyHzKaZQzIOEAtUNEGP8DU73DT18yCxHz4MPOS0K3MjKVVAJQW6grdAI9DnbiwFns
 C0KkG3nn2kZtY1CSgd8wb+FDOClKjYA+KuL+8JTjFNiTsztZoASMVJiZegm9PzXgiOyg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nNazoQW0wQFkJyz3CCTQq2cb9JpYNJ6yU8+6sRjnKGQ=; b=MCHREvL9e6jAUGhAUAZQAcAcPa
 Gt6gkD7CNiDwtyt2+rRhAaKwa4d0osiBzzbaFQ+4+pDjCm2wMsC2HDcPrmtXaeaa0Etn0LjTRg5BE
 Vt/i7WWDOQTAYd7DKqfwtamSiBr6wLobf0ff8lfsmZYfqJPLPqLzMCuCAGjzvtY5Oix4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lg3xK-001SmI-H0; Mon, 10 May 2021 11:20:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC8EA6101E;
 Mon, 10 May 2021 11:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620645601;
 bh=W7iAKST7BRDMlEttXNNjJ33EX76A4qp8I6GEgdSMv7U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gmDmb0dM5IcZQ9rSlubjtF+K7WR5CTuBYzK7hGG8NgJ6VoZl1xWTpOcwkH/5/0zA/
 vlx1VxEGYzpDqoIrEOS4Gq4vleDywsH/Tbkz7KjwQOxa0gHoTz3ZfhQBobu6oYwUNn
 Apktwvurhr0XmVvzqYbUbTW3FMnBkgNdhIrbGi6F2SzZTvdCwG1IcEdUG7Tg53VOjZ
 rsHYuTEPmzH2qPOyCxJC2wx/q7V+K8nhKe4JHOwCkQGI9ADck3Kw17WLNRkmbFOBip
 a9pcqsOJVVBc05NJGVPFoJfSO03eP8zjvIV4wRYaZYLrBIVfbDQLgQs1bXlcp7w7lK
 9KVTRb7Ve04dg==
Date: Mon, 10 May 2021 13:19:50 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Message-ID: <20210510131950.063f0608@coco.lan>
In-Reply-To: <c4479ced-f4d8-1a1e-ee54-9abc55344187@leemhuis.info>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <c4479ced-f4d8-1a1e-ee54-9abc55344187@leemhuis.info>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lg3xK-001SmI-H0
Subject: Re: [f2fs-dev] [PATCH 00/53] Get rid of UTF-8 chars that can be
 mapped as ASCII
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 dri-devel@lists.freedesktop.org, keyrings@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, x86@kernel.org, linux-acpi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-sgx@vger.kernel.org, coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RW0gTW9uLCAxMCBNYXkgMjAyMSAxMjo1Mjo0NCArMDIwMApUaG9yc3RlbiBMZWVtaHVpcyA8bGlu
dXhAbGVlbWh1aXMuaW5mbz4gZXNjcmV2ZXU6Cgo+IE9uIDEwLjA1LjIxIDEyOjI2LCBNYXVybyBD
YXJ2YWxobyBDaGVoYWIgd3JvdGU6Cj4gPgo+ID4gQXMgTGludXggZGV2ZWxvcGVycyBhcmUgYWxs
IGFyb3VuZCB0aGUgZ2xvYmUsIGFuZCBub3QgZXZlcnlib2R5IGhhcyBVVEYtOAo+ID4gYXMgdGhl
aXIgZGVmYXVsdCBjaGFyc2V0LCBiZXR0ZXIgdG8gdXNlIFVURi04IG9ubHkgb24gY2FzZXMgd2hl
cmUgaXQgaXMgcmVhbGx5Cj4gPiBuZWVkZWQuCj4gPiBb4oCmXQo+ID4gVGhlIHJlbWFpbmluZyBw
YXRjaGVzIG9uIHNlcmllcyBhZGRyZXNzIHN1Y2ggY2FzZXMgb24gKi5yc3QgZmlsZXMgYW5kIAo+
ID4gaW5zaWRlIHRoZSBEb2N1bWVudGF0aW9uL0FCSSwgdXNpbmcgdGhpcyBwZXJsIG1hcCB0YWJs
ZSBpbiBvcmRlciB0byBkbyB0aGUKPiA+IGNoYXJzZXQgY29udmVyc2lvbjoKPiA+IAo+ID4gbXkg
JWNoYXJfbWFwID0gKAo+ID4gW+KApl0KPiA+IAkweDIwMTMgPT4gJy0nLAkJIyBFTiBEQVNICj4g
PiAJMHgyMDE0ID0+ICctJywJCSMgRU0gREFTSCAgCgoKPiBJIG1pZ2h0IGJlIHBlcmZvcm1pbmcg
YmlrZSBzaGVkZGluZyBoZXJlLCBidXQgd291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvCj4gcmVwbGFj
ZSB0aG9zZSB0d28gd2l0aCAiLS0iLCBhcyBleHBsYWluZWQgaW4KPiBodHRwczovL2VuLndpa2lw
ZWRpYS5vcmcvd2lraS9EYXNoI0FwcHJveGltYXRpbmdfdGhlX2VtX2Rhc2hfd2l0aF90d29fb3Jf
dGhyZWVfaHlwaGVucwo+IAo+IEZvciBFTSBEQVNIIHRoZXJlIHNlZW1zIHRvIGJlIGV2ZW4gIi0t
LSIsIGJ1dCBJJ2Qgc2F5IHRoYXQgaXMgYSBiaXQgdG9vCj4gbXVjaC4KClllYWgsIHdlIGNhbiBk
bywgaW5zdGVhZDoKCiAJMHgyMDEzID0+ICctLScsCQkjIEVOIERBU0gKIAkweDIwMTQgPT4gJy0t
LScsCSMgRU0gREFTSCAgCgpJIHdhcyBhY3R1YWxseSBpbiBkb3VidCBhYm91dCB0aG9zZSA7LSkK
CkJ0dywgd2hlbiBwcm9kdWNpbmcgSFRNTCBkb2N1bWVudGF0aW9uLCAgU3BoaW54IHNob3VsZCBj
b252ZXJ0OgoJLS0gaW50byBFTiBEQVNICmFuZDoKCS0tLSBpbnRvIEVNIERBU0gKClNvLCB0aGUg
cmVzdWx0aW5nIGh0bWwgd2lsbCBiZSBpZGVudGljYWwuCgo+IE9yIGRvIHlvdSBmZWFyIHRoZSBl
eHRyYSB3b3JrIGFzIHNvbWUgbGluZXMgdGhlbiBtaWdodCBicmVhayB0aGUKPiA4MC1jaGFyYWN0
ZXIgbGltaXQgdGhlbj8KCk5vLCBJIHN1c3BlY3QgdGhhdCB0aGUgbGluZSBzaXplIHdvbid0IGJl
IGFuIGlzc3VlLiBTb21lIGNhcmUgc2hvdWxkCnRha2VuIHdoZW4gRU4gREFTSCBhbmQgRU0gREFT
SCBhcmUgdXNlZCBpbnNpZGUgdGFibGVzLgoKVGhhbmtzLApNYXVybwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
