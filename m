Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 777852D6227
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Dec 2020 17:40:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1knOzN-0002Nj-II; Thu, 10 Dec 2020 16:40:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1knOvg-0001wk-Je
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Dec 2020 16:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9j9IGwUqdwc8vK2GCjcAzf4gEPZCZv2JGAoOq1jdgew=; b=XnJDj74Vlq7oj0UUd4DbMZAmWV
 iK/0Lw6G2LWQFEOcuVXKS9uDcCt0Vh7628hsho3Eb9Be3PnNT+YEfiiWAgU9cd0tgOoOtCOVXTi4w
 jO4gT1+vMBx6d45kqu23xFIUOpD5XdonlZqvD4TKYtuJRXuui3CNogeK8HoCrP4VHLrY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9j9IGwUqdwc8vK2GCjcAzf4gEPZCZv2JGAoOq1jdgew=; b=gof3T5ToN0GMitNQGHs7yR3nu8
 1y3S8fpF1rD3jc5p+qNxr5mK+F7HJA/TXCJvHKSYNYCbF68oQmgUeDTgNW553SMesuf8kcNLPXcHV
 AMbKZ/xCb03RQ7uLpHHFIOGZHOStt3dndS3XPZlf9vaLSQmEKff+P8pqKwDsxAJ4lxDk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1knOvS-006hva-Qn
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Dec 2020 16:36:32 +0000
Date: Thu, 10 Dec 2020 08:36:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607618173;
 bh=fbQ4nuVsVzui/yLCe8bXeRIRjFWB90VPKZTYzTxSMsU=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=GzMO/8Sg2LxApIIozXGkp2kgxVaFJ1k8OEWW7WQ6vCJPb//80dlWjFqcTWjXH4dns
 ViCNL5ubiNQnJBtKE5Nsgh1+W2C2JhRMO+SgKG8pkk+6GzEHJzK6S/sfxTGurmeDG0
 JSIDkOlpGvd/vNW9kC3YCi97QD/kDZkrkcHejfyLCbLVpNYX2kT9ootfZ3ieOEQ/9o
 bONisRZRZ12z20XKbP/wAFinLmN3nyEyOjwfgS9+jzeUOwjeHMwBSSawWflOOsJmwp
 V6WrYSeulHnXBzixunP4sLIDqLBKNVD0rwuaIIhrVJI7P9lUXMRmfQU8C3Ib5NrweJ
 Fgc/fHeQyrbRA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: =?utf-8?B?5b6Q55Ge5paM?= <robinh3123@gmail.com>
Message-ID: <X9JOe7pULqpJnD0d@google.com>
References: <20201208081555.652932-1-robinh3123@gmail.com>
 <20201208081555.652932-3-robinh3123@gmail.com>
 <785e9f0a-c3d6-9cc5-f17a-a3cc58a43a0f@huawei.com>
 <CAKnFrsLmEROi+ZwVCmoC=W7u+rVoZfWGC9Lr9_y=oLMUZMw63Q@mail.gmail.com>
 <X9JLYADc4+lF53gG@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9JLYADc4+lF53gG@google.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1knOvS-006hva-Qn
Subject: Re: [f2fs-dev] [PATCH v3 2/3] f2fs-tools:sload.f2fs compression
 support
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBhbmQgUm9iaW4sCgpJIHJlZmFjdG9yZWQgdGhlIHBhdGNoIHRvIG1vZGlmeSB0aGUgbmFt
ZXMgYW5kIHN0cnVjdHVyZXMuClBsZWFzZSB0YWtlIGEgbG9vayBhdCB0aGlzLgpodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9qYWVnZXVrL2YyZnMtdG9vbHMu
Z2l0L2NvbW1pdC8/aD1kZXYmaWQ9NWNkOGU1ZmNjNzk2MTFjMDY5MmYxOGM3ZTdlMTNkNmI0NzQy
ZDNjMAoKT24gMTIvMTAsIEphZWdldWsgS2ltIHdyb3RlOgo+IE9uIDEyLzEwLCDlvpDnkZ7mlowg
d3JvdGU6Cj4gPiBIaSwgSmFlZ2V1aywKPiA+IAo+ID4gSSBjb21tZW50IGhlcmUgdGhlIHBhdGNo
IHlvdXIgcHJvdmlkZWQgKDMgcGFydHMsIHNpbmNlIHRoZSBwYXRjaCBjb250YWlucyAzCj4gPiBm
aXhlcyk6Cj4gPiAxLiAgKyAgICAgICBkbi0+ZGF0YV9ibGthZGRyID0gYmxrYWRkcjsKPiA+ICAg
ICAgICAgcmV0ID0gcmVzZXJ2ZV9uZXdfYmxvY2soc2JpLCAmZG4tPmRhdGFfYmxrYWRkciwgJnN1
bSwgdHlwZSwgMCk7Cj4gPiAKPiA+IFdlIGNhbm5vdCBhc3NpZ24gZG4tPmRhdGFfYmxrYWRkciBo
ZXJlLiAgVGhlIG9sZCBvbmUgaXMgdG8gYmUgdXNlZCBpbgo+ID4gcmVzZXJ2ZV9uZXdfYmxvY2so
KSBmdW5jdGlvbi4gIEFsc28sIHJlc2VydmVfbmV3X2Jsb2NrKCkgZnVuY3Rpb24gYWN0dWFsbHkK
PiA+IHdpbGwgc2V0IGRuLT5kYXRhX2Jsa2FkZHIgdG8gYmxrYWRkciBpbiB0aGUgZW5kLgo+IAo+
IFRoaXMgdHJpZXMgdG8gYXZvaWQgZGVsZXRpbmcgdGhlIGJsb2NrIGFkZHJlc3MgdXNlZCBpbiB0
aGUgcHJldmlvdXMgb2Zmc2V0Lgo+IE90aGVyd2lzZSwgd2UnbGwgc2VlIHdyb25nIGlfYmxvY2tz
Lgo+IAo+ID4gCj4gPiAyLiAgIEFkZGVkIGNvbmRpdGlvbiAibiA8ICgxIDw8IGMuc2xkY19jYy5s
b2dfY2x1c3Rlcl9zaXplKSAqIEJMT0NLX1NaIgo+ID4gCj4gPiBUaGUgc2VtYW50aWMgbWVhbmlu
ZyBvZiB0aGUgd2hvbGUgaWYgc3RhdGVtZW50IGlzIHRvIHNheToKPiA+ICAgIFdoZW4gdGhlIGNv
bXByZXNzaW9uIGZhaWwgKHJldCAgIT0gMCkgb3IgdGhlIG9yaWdpbmFsIHJlYWQgc2l6ZSBpcwo+
ID4gc21hbGxlciB0aGFuIHRoZSBjb21wcmVzc2VkIHNpemUgcGx1cyAodGhlIG1pbmltdW0gYmxv
Y2sgc2F2ZWQgKHNwZWNpZmllZAo+ID4gYnkgdGhlIHVzZXIpIHggYmxvY2sgc2l6ZSksIHdlIHdp
bGwgbm90IGRvIGNvbXByZXNzaW9uIGJ1dCBqdXN0IHdyaXRlIHRoZQo+ID4gZGF0YSBhcyBpcy4K
PiAKPiBUaGlzIGlzIG1pc3NpbmcgdGhlIGxhc3QgYmxvY2sgaGF2aW5nIDwgNEtiLgo+IAo+ID4g
Cj4gPiBUaGUgcmlnaHQgaGFuZCBzaWRlIChSSFMpIG9mIHlvdXIgYWRkZWQgY29uZGl0aW9uIGlz
IGV4YWN0bHkgdGhlIHJlYWQgc2l6ZSwKPiA+IGkuZS4gdGhlIGNsdXN0ZXIgc2l6ZS4gIFRoYXQg
bWVhbnMgdGhlIGNvbmRpdGlvbiBpcyBhbHdheXMgZmFsc2UgZXhjZXB0IHRoZQo+ID4gcmVhZCBv
ZiB0aGUgbGFzdCBwYXJ0IG9mIHRoZSBmaWxlLCB3aGVuIHRoZSBmaWxlIHNpemUgaXMgbm90IGV4
YWN0bHkgdGhlCj4gPiBtdWx0aXBsZSBvZiB0aGUgY2x1c3RlciBzaXplLiAgVGhhdCBtZWFucyB3
ZSB3aWxsIG5ldmVyIHRyeSB0byBjb21wcmVzcyB0aGUKPiA+IGxhc3QgcGFydCBvZiB0aGUgZmls
ZSAod2hlbiB0aGUgbGFzdCBwYXJ0IGlzIG5vdCBhIG11bHRpcGxlIG9mIHRoZSBjbHVzdGVyCj4g
PiBzaXplKQo+ID4gCj4gPiBJTUhPLCB0aGUgb3JpZ2luYWwgaW1wbGVtZW50YXRpb24gc2hvdWxk
IGJlIGNvcnJlY3QuCj4gPiAKPiA+IDMuICBub2RlX2Jsay0+aS5pX2Jsb2NrcyArPSBjcHVfdG9f
bGU2NChjYmxvY2tzKTsKPiA+IAo+ID4gSSBhbSBub3QgcXVpdGUgc3VyZSBvZiB0aGUgaV9ibG9j
a3MgY291bnQuICBEaWQgeW91IG1lYW4gdGhhdCB3aGVuIHRoZSBmaWxlCj4gPiBpcyBtdXRhYmxl
LCAgIG1lYW5pbmcgdGhhdCB0aGUgZmlsZSByZXNlcnZlcyBzb21lIGJsb2NrcyBmb3IgZnV0dXJl
IHdyaXRlLAo+ID4gd2Ugd2lsbCBhZGQgY291bnQgdG8gaV9ibG9ja3MgdG8gbWFyayB0aGUgYmxv
Y2sgYXMgYSB1c2VkIGJsb2NrIGJ5IHRoZQo+ID4gZmlsZSwgcmlnaHQ/ICBJIHRob3VnaHQgd2Ug
b25seSBuZWVkIHRvIGluY3JlbWVudCB0aGUgYWxsb2NhdGVkIGNvdW50Li4uCj4gCj4gU2hvdWxk
IGFkZCBpdC4KPiAKPiA+IAo+ID4gUmVnYXJkcywKPiA+IFJvYmluIEhzdSDlvpDnkZ7mlowKPiA+
IAo+ID4gCj4gPiBPbiBUaHUsIERlYyAxMCwgMjAyMCBhdCA0OjQyIFBNIENoYW8gWXUgPHl1Y2hh
bzBAaHVhd2VpLmNvbT4gd3JvdGU6Cj4gPiAKPiA+ID4gT24gMjAyMC8xMi84IDE2OjE1LCBSb2Jp
biBIc3Ugd3JvdGU6Cj4gPiA+ID4gRnJvbTogUm9iaW4gSHN1IDxyb2JpbmhzdUBnb29nbGUuY29t
Pgo+ID4gPiA+Cj4gPiA+ID4gQWRkIEYyRlMgY29tcHJlc3Npb24gc3VwcG9ydCBmb3Igc2xvYWQK
PiA+ID4gPiAqIFN1cHBvcnQgZmlsZSBleHRlbnNpb24gZmlsdGVyLCBlaXRoZXIgZGVmYXVsdC1h
Y2NlcHQgb3IgZGVmYXVsdC1kZW55Cj4gPiA+ID4gICAgcG9saWN5Cj4gPiA+ID4gKiBTdXBwb3J0
IGNob2ljZSBvZiBjb21wcmVzc2lvbiBhbGdvcml0aG0sIExaTyAodmVyc2lvbiAyKSBvciBMWjQK
PiA+ID4gPiAgICAoZGVmYXVsdCkKPiA+ID4gPiAqIFN1cHBvcnQgY3VzdG9tIGxvZyBvZiBjbHVz
dGVyIHNpemUKPiA+ID4gPiAqIFN1cHBvcnQgbWluaW11bSBudW1iZXIgb2YgY29tcHJlc3NlZCBi
bG9ja3MgcGVyIGNsdXN0ZXIgKGRlZmF1bHQgMSkuCj4gPiA+ID4gICAgQSBjbHVzdGVyIHdpbGwg
bm90IGJlIGNvbXByZXNzZWQgaWYgdGhlIG51bWJlciBjYW4gbm90IGJlIG1ldC4KPiA+ID4gPiAq
IHN1dXBvcnQgLXIgKHJlYWQtb25seSkgb3B0aW9uCj4gPiA+Cj4gPiA+IENvdWxkIHlvdSBwbGVh
c2UgdXBkYXRlIG1hbnVhbCBhcyB3ZWxsPwo+ID4gPgo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAv
KiBzbGRjOiBzbG9hZCBjb21wcmVzc2lvbiBzdXBwb3J0ICovCj4gPiA+Cj4gPiA+IFBlcnNvbmFs
bHksIEkgZG9uJ3QgbGlrZSB0aGUgbmFtaW5nIG1ldGhvZCBvZiBhZGRpbmcgInNsZGNfIiBwcmVm
aXguLi4gOigKPiA+ID4KPiA+ID4gPiArICAgICBib29sIHNsZGNfZW47Cj4gPiA+ID4gKyAgICAg
Ym9vbCBzbGRjX3VzZV9hbGxvd19saXN0OyAgLyogZGVmYXVsdCBmYWxzZSB0byB1c2UgdGhlIGRl
bnkgbGlzdCAqLwo+ID4gPiA+ICsgICAgIHN0cnVjdCBjb21wcmVzc19jdHggc2xkY19jYzsKPiA+
ID4gPiArICAgICB1OCBzbGRjX2NhOyAvKiBjb21wcmVzcyBhbGdvcml0aG06IDAgPSBMWk8sIDEg
PSBMWjQgKi8KPiA+ID4gPiArICAgICBjb21wcmVzc19vcHMgKnNsZGNfY29tcHI7Cj4gPiA+ID4g
KyAgICAgZW51bSBmaWx0ZXJfcG9saWN5IHNsZGNfcG9saWN5Owo+ID4gPiA+ICsgICAgIC8qIG1h
eF9jcHBjIGNhbiB1c2VkIHRvIHNwZWNpZnkgbWluaW11bSBjb21wcmVzc2lvbiByYXRlICovCj4g
PiA+ID4gKyAgICAgdW5zaWduZWQgaW50IHNsZGNfbWluX2NicGM7IC8qIG1pbiBjb21wcmVzc2Vk
IHBhZ2VzIHBlciBjbHVzdGVyICovCj4gPiA+ID4gKyAgICAgYm9vbCBzbGRjX2dvdF9vcHQ7Cj4g
PiA+ID4gKyAgICAgYm9vbCBzbGRjX2ltbXV0YWJsZTsKPiA+ID4gPiArICAgICBzdHJ1Y3QgZXh0
X3RibF9vcCAqc2xkY19lZjsgLyogZXh0ZW5zaW9uIGZpbHRlciAqLwo+ID4gPgo+ID4gPiBUaGUg
dmFyaWFibGVzIG5hbWUgbGlrZSBzbGRjX2VuLCBzbGRjX2NhLCBtaW5fY2JwYywgc2xkY19lZiBt
YWtlcwo+ID4gPiBkZXZlbG9wZXJzCj4gPiA+IGhhcmQgdG8gdW5kZXJzdGFuZCB3L28gY29tbWVu
dHMsIGFuZCBhbHNvIHRoZXJlIGlzIG5vIGNvbW1lbnRzIGZvciBzZXZlcmFsCj4gPiA+IHZhcmlh
YmxlIGxpa2Ugc2xkY19lbiwgc2xkY19jYy4uLgo+ID4gPgo+ID4gPiBDb3VsZCB5b3UgcGxlYXNl
IGltcHJvdmUgdGhlIG5hbWluZyBsaWtlIGYyZnMtdG9vbHMgc3R5bGU/Cj4gPiA+Cj4gPiA+IFRo
YW5rcywKPiA+ID4KPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
