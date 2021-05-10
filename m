Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 872F8378A1B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 13:55:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg4Vj-00064n-Rh; Mon, 10 May 2021 11:55:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1lg4Vj-00064V-1Z; Mon, 10 May 2021 11:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KQTuFYHZIpy7ah4plsRk5EIuJ1MgtrwGpK9+hGS6HBE=; b=BraVkxhGA1Xa5+HWm/BV/e/6cd
 YBYS9D7p0OAoQJyxDr1zL6AMMip/opg3mJOcIx+MV6Ykf1pGG/O3Ml4V6E9Gj4lgl5lzVZJw0Tfat
 bEdoBXf8UDwbJDyHXBFjDwCUd+V46mmKoIXMvegXROScStRideeyTVsH9QrSKiyWPGjI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KQTuFYHZIpy7ah4plsRk5EIuJ1MgtrwGpK9+hGS6HBE=; b=dq0Hn0DE9KO0KKnmX1mthNgNjK
 MjbpNEzMAKZHgq5EVMQn7xc53RRhjDEJG31YL5r+k392HoFdzdY78Fx4t5VKdZpg2Rde+9W6Cl2qP
 iemHqHaHtec0hoOOexwuX2JbunMkEsYAZPpNo3zpA15NEC682gfBwZg0UXNGJOupSMMM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lg4Va-001aPb-Li; Mon, 10 May 2021 11:55:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 383C061260;
 Mon, 10 May 2021 11:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620647729;
 bh=dyIPtb49LgFnCoKazyq+bQhPSj3PCobNssG21KHdoK4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S4cpkndG9UuTYGkhKfO3hJLbYIHDWve5Su3QQFRXInDkMRoAu9bVjsNPKBQQExFiA
 MH/LvEqboPFe5Mg323DsrqgW7WJPZfjJ5OWh3KcGd7Kzb/Ed/OuhsjfzebDsCLf+jo
 Z2y3h21hX1f0r0znndE/gsvI3+7MfvcFNE3R9vJ3F6eSaoK3rYc9HAxpysQKCzq2nw
 XliTZNXkMCNQpYy6ormSrp00pDOW21OImF+xXBpjWC/JIXAZfq/wrXo3rh38peS5/g
 BQeri8Wl+fs0ihvm/Fcaw0vxpMvqk7Fkm7kctYIMuGKithMKv3Kd8J2NMAGsk2M1IJ
 Z8/9XzwZufeKA==
Date: Mon, 10 May 2021 13:55:18 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20210510135518.305cc03d@coco.lan>
In-Reply-To: <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
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
X-Headers-End: 1lg4Va-001aPb-Li
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

SGkgRGF2aWQsCgpFbSBNb24sIDEwIE1heSAyMDIxIDExOjU0OjAyICswMTAwCkRhdmlkIFdvb2Ro
b3VzZSA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4gZXNjcmV2ZXU6Cgo+IE9uIE1vbiwgMjAyMS0wNS0x
MCBhdCAxMjoyNiArMDIwMCwgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIHdyb3RlOgo+ID4gVGhlcmUg
YXJlIHNldmVyYWwgVVRGLTggY2hhcmFjdGVycyBhdCB0aGUgS2VybmVsJ3MgZG9jdW1lbnRhdGlv
bi4KPiA+IAo+ID4gU2V2ZXJhbCBvZiB0aGVtIHdlcmUgZHVlIHRvIHRoZSBwcm9jZXNzIG9mIGNv
bnZlcnRpbmcgZmlsZXMgZnJvbQo+ID4gRG9jQm9vaywgTGFUZVgsIEhUTUwgYW5kIE1hcmtkb3du
LiBUaGV5IHdlcmUgcHJvYmFibHkgaW50cm9kdWNlZAo+ID4gYnkgdGhlIGNvbnZlcnNpb24gdG9v
bHMgdXNlZCBvbiB0aGF0IHRpbWUuCj4gPiAKPiA+IE90aGVyIFVURi04IGNoYXJhY3RlcnMgd2Vy
ZSBhZGRlZCBhbG9uZyB0aGUgdGltZSwgYnV0IHRoZXkncmUgZWFzaWx5Cj4gPiByZXBsYWNlYWJs
ZSBieSBBU0NJSSBjaGFycy4KPiA+IAo+ID4gQXMgTGludXggZGV2ZWxvcGVycyBhcmUgYWxsIGFy
b3VuZCB0aGUgZ2xvYmUsIGFuZCBub3QgZXZlcnlib2R5IGhhcyBVVEYtOAo+ID4gYXMgdGhlaXIg
ZGVmYXVsdCBjaGFyc2V0LCBiZXR0ZXIgdG8gdXNlIFVURi04IG9ubHkgb24gY2FzZXMgd2hlcmUg
aXQgaXMgcmVhbGx5Cj4gPiBuZWVkZWQuICAKPiAKPiBObywgdGhhdCBpcyBhYnNvbHV0ZWx5IHRo
ZSB3cm9uZyBhcHByb2FjaC4KPiAKPiBJZiBzb21lb25lIGhhcyBhIGxvY2FsIHNldHVwIHdoaWNo
IG1ha2VzIGJvZ3VzIGFzc3VtcHRpb25zIGFib3V0IHRleHQKPiBlbmNvZGluZ3MsIHRoYXQgaXMg
dGhlaXIgb3duIG1pc3Rha2UuCj4gCj4gV2UgZG9uJ3QgZG8gdGhlbSBhbnkgZmF2b3VycyBieSB0
cnlpbmcgdG8gKmhpZGUqIGl0IGluIHRoZSBjb21tb24gY2FzZQo+IHNvIHRoYXQgdGhleSBkb24n
dCBub3RpY2UgaXQgZm9yIGxvbmdlci4KPiAKPiBUaGVyZSByZWFsbHkgaXNuJ3QgbXVjaCBleGN1
c2UgZm9yIHN1Y2ggYnJva2VubmVzcywgdGhpcyBmYXIgaW50byB0aGUKPiAyMXN0IGNlbnR1cnku
Cj4gCj4gRXZlbiAqYmVmb3JlKiBVVEYtOCBjYW1lIGFsb25nIGluIHRoZSBmaW5hbCBkZWNhZGUg
b2YgdGhlIGxhc3QKPiBtaWxsZW5uaXVtLCBpdCB3YXMgaW1wb3J0YW50IHRvIGtub3cgd2hpY2gg
Y2hhcmFjdGVyIHNldCBhIGdpdmVuIHBpZWNlCj4gb2YgdGV4dCB3YXMgZW5jb2RlZCBpbi4KPiAK
PiBJbiBmYWN0IGl0IHdhcyBldmVuICptb3JlKiBpbXBvcnRhbnQgYmFjayB0aGVuLCB3ZSBjb3Vs
ZG4ndCBqdXN0IGFzc3VtZQo+IFVURi04IGV2ZXJ5d2hlcmUgbGlrZSB3ZSBjYW4gaW4gbW9kZXJu
IHRpbWVzLgo+IAo+IEdpdCBjYW4gYWxyZWFkeSBkbyB0aGluZ3MgbGlrZSBDUkxGIGNvbnZlcnNp
b24gb24gY2hlY2tpbmcgZmlsZXMgb3V0IHRvCj4gbWF0Y2ggbG9jYWwgY29udmVudGlvbnM7IGlm
IHlvdSB3YW50IHRvIHRlYWNoIGl0IHRvIGRvIGNoYXJhY3RlciBzZXQKPiBjb252ZXJzaW9ucyB0
b28gdGhlbiBJIHN1cHBvc2UgdGhhdCBtaWdodCBiZSB1c2VmdWwgdG8gYSBmZXcgZGV2ZWxvcGVy
cwo+IHdobyd2ZSBmYWxsZW4gdGhyb3VnaCBhIHRpbWUgd2FycCBhbmQgc3RpbGwgbmVlZCBpdC4g
QnV0IG5vYm9keSdzIGV2ZXIKPiBib3RoZXJlZCBiZWZvcmUgYmVjYXVzZSBpdCBqdXN0IGlzbid0
IG5lY2Vzc2FyeSB0aGVzZSBkYXlzLgo+IAo+IFBsZWFzZSAqZG9uJ3QqIGF0dGVtcHQgdG8gYWRk
cmVzcyB0aGlzIGFuYWNocm9uaXN0aWMgYW5kIGVzb3RlcmljCj4gInJlcXVpcmVtZW50IiBieSBk
cmFnZ2luZyB0aGUga2VybmVsIHNvdXJjZSBiYWNrIGluIHRpbWUgYnkgdGhyZWUKPiBkZWNhZGVz
LgoKTm8uIFRoZSBpZGVhIGlzIG5vdCB0byBnbyBiYWNrIHRocmVlIGRlY2FkZXMgYWdvLiAKClRo
ZSBnb2FsIGlzIGp1c3QgdG8gYXZvaWQgdXNlIFVURi04IHdoZXJlIGl0IGlzIG5vdCBuZWVkZWQu
IFNlZSwgdGhlIHZhc3QKbWFqb3JpdHkgb2YgVVRGLTggY2hhcnMgYXJlIGtlcHQ6CgoJLSBOb24t
QVNDSUkgTGF0aW4gYW5kIEdyZWVrIGNoYXJzOwoJLSBCb3ggZHJhd2luZ3M7CgktIGFycm93czsK
CS0gbW9zdCBzeW1ib2xzLgoKVGhlcmUsIGl0IG1ha2VzIHBlcmZlY3Qgc2Vuc2UgdG8ga2VlcCB1
c2luZyBVVEYtOC4KCldlIHNob3VsZCBrZWVwIHVzaW5nIFVURi04IG9uIEtlcm5lbC4gVGhpcyBp
cyBzb21ldGhpbmcgdGhhdCBpdCBzaG91bGRuJ3QKYmUgY2hhbmdlZC4KCi0tLQoKVGhpcyBwYXRj
aCBzZXJpZXMgaXMgZG9pbmcgY29udmVyc2lvbiBvbmx5IHdoZW4gdXNpbmcgQVNDSUkgbWFrZXMK
bW9yZSBzZW5zZSB0aGFuIHVzaW5nIFVURi04LiAKClNlZSwgYSBudW1iZXIgb2YgY29udmVydGVk
IGRvY3VtZW50cyBlbmRlZCB3aXRoIHdlaXJkIGNoYXJhY3RlcnMKbGlrZSBaRVJPIFdJRFRIIE5P
LUJSRUFLIFNQQUNFIChVK0ZFRkYpIGNoYXJhY3Rlci4gVGhpcyBzcGVjaWZpYwpjaGFyYWN0ZXIg
ZG9lc24ndCBkbyBhbnkgZ29vZC4KCk90aGVycyB1c2UgTk8tQlJFQUsgU1BBQ0UgKFUrQTApIGlu
c3RlYWQgb2YgMHgyMC4gSGFybWxlc3MsIHVudGlsCnNvbWVvbmUgdHJpZXMgdG8gdXNlIGdyZXBb
MV0uCgpbMV0gdHJ5IHRvIHJ1bjoKCiAgICAkIGdpdCBncmVwICJDUFUgMCBoYXMgYmVlbiIgRG9j
dW1lbnRhdGlvbi9SQ1UvCgogICAgaXQgd2lsbCByZXR1cm4gbm90aGluZyB3aXRoIGN1cnJlbnQg
dXBzdHJlYW0uCgogICAgQnV0IGl0IHdpbGwgd29yayBmaW5lIGFmdGVyIHRoZSBzZXJpZXMgaXMg
YXBwbGllZDoKCiAgICAkIGdpdCBncmVwICJDUFUgMCBoYXMgYmVlbiIgRG9jdW1lbnRhdGlvbi9S
Q1UvCiAgICAgIERvY3VtZW50YXRpb24vUkNVL0Rlc2lnbi9EYXRhLVN0cnVjdHVyZXMvRGF0YS1T
dHJ1Y3R1cmVzLnJzdDp8ICMuIENQVSAwIGhhcyBiZWVuIGluIGR5bnRpY2staWRsZSBtb2RlIGZv
ciBxdWl0ZSBzb21lIHRpbWUuIFdoZW4gaXQgICB8CiAgICAgIERvY3VtZW50YXRpb24vUkNVL0Rl
c2lnbi9EYXRhLVN0cnVjdHVyZXMvRGF0YS1TdHJ1Y3R1cmVzLnJzdDp8ICAgIG5vdGljZXMgdGhh
dCBDUFUgMCBoYXMgYmVlbiBpbiBkeW50aWNrIGlkbGUgbW9kZSwgd2hpY2ggcXVhbGlmaWVzICB8
CgpUaGUgbWFpbiBwb2ludCBvbiB0aGlzIHNlcmllcyBpcyB0byByZXBsYWNlIGp1c3QgdGhlIG9j
Y3VycmVuY2VzCndoZXJlIEFTQ0lJIHJlcHJlc2VudHMgdGhlIHN5bWJvbCBlcXVhbGx5IHdlbGws
IGUuIGcuIGl0IGlzIGxpbWl0ZWQKZm9yIHRob3NlIGNoYXJzOgoKCS0gVSsyMDEwICgn4oCQJyk6
IEhZUEhFTgoJLSBVKzAwYWQgKCfCrScpOiBTT0ZUIEhZUEhFTgoJLSBVKzIwMTMgKCfigJMnKTog
RU4gREFTSAoJLSBVKzIwMTQgKCfigJQnKTogRU0gREFTSAoKCS0gVSsyMDE4ICgn4oCYJyk6IExF
RlQgU0lOR0xFIFFVT1RBVElPTiBNQVJLCgktIFUrMjAxOSAoJ+KAmScpOiBSSUdIVCBTSU5HTEUg
UVVPVEFUSU9OIE1BUksKCS0gVSswMGI0ICgnwrQnKTogQUNVVEUgQUNDRU5UCgoJLSBVKzIwMWMg
KCfigJwnKTogTEVGVCBET1VCTEUgUVVPVEFUSU9OIE1BUksKCS0gVSsyMDFkICgn4oCdJyk6IFJJ
R0hUIERPVUJMRSBRVU9UQVRJT04gTUFSSwoKCS0gVSswMGQ3ICgnw5cnKTogTVVMVElQTElDQVRJ
T04gU0lHTgoJLSBVKzIyMTIgKCfiiJInKTogTUlOVVMgU0lHTgoKCS0gVSsyMjE3ICgn4oiXJyk6
IEFTVEVSSVNLIE9QRVJBVE9SCgkgICh0aGlzIG9uZSB1c2VkIGFzIGEgcG9pbnRlciByZWZlcmVu
Y2UgbGlrZSAiKmZvbyIgb24gQyBjb2RlCgkgICBleGFtcGxlIGluc2lkZSBhIGRvY3VtZW50IGNv
bnZlcnRlZCBmcm9tIExhVGVYKQoKCS0gVSswMGJiICgnwrsnKTogUklHSFQtUE9JTlRJTkcgRE9V
QkxFIEFOR0xFIFFVT1RBVElPTiBNQVJLCgkgICh0aGlzIG9uZSBhbHNvIHVzZWQgd3JvbmdseSBv
biBhbiBBQkkgZmlsZSwgbWVhbmluZyAnPicpCgoJLSBVKzAwYTAgKCfCoCcpOiBOTy1CUkVBSyBT
UEFDRQoJLSBVK2ZlZmYgKCfvu78nKTogWkVSTyBXSURUSCBOTy1CUkVBSyBTUEFDRQoKVXNpbmcg
dGhlIGFib3ZlIHN5bWJvbHMgd2lsbCBqdXN0IHRyaWNrIHRvb2xzIGxpa2UgZ3JlcCBmb3Igbm8g
Z29vZApyZWFzb24uCgpUaGFua3MsCk1hdXJvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
