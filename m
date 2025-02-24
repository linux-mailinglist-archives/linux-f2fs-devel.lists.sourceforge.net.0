Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59832A41520
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Feb 2025 07:12:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tmRh6-0004d0-4v;
	Mon, 24 Feb 2025 06:11:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tmRh4-0004ct-O6
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Feb 2025 06:11:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7vB3OQsMevLXw/se3m0/r7jqKGTt+zA2/T0fGejWuMI=; b=iFHkjyvWJ/h6NcozzMiEKelF9i
 CtXfiAjXeBLjX/BMHzTLXL1T8man7poP4EtQ515XmkzAzluuYRC/VUpa/OdQi+G11K27OLrSvJqk5
 J3dEwFhDSHUEiNPNAE2eQcBfRqgiJh6Ai/Y7y+aOEsy6PSLJ52sR+X4Lhp0oZSCawQSg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7vB3OQsMevLXw/se3m0/r7jqKGTt+zA2/T0fGejWuMI=; b=jU8fMNTkAwc6PMAPr/blLvtUrw
 H78OSX5N3KIc60H8JSG4RaXG1XLszXhHs8B1ln+IFZDsVEM4n9UzVyFYBPCdp5mM4m4PGivmrC/HE
 nuOB+iNYrM3kcBng0uvb25AtRPcy0u8ZNoZJrkQ6dtrmYLwF2pbM/6kszegKxw6FP5IQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tmRh3-0008EZ-Al for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Feb 2025 06:11:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 21A2661172;
 Mon, 24 Feb 2025 06:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1945FC4CED6;
 Mon, 24 Feb 2025 06:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740377502;
 bh=DusIi7MLerQhf4R4o7zGcF+PN1nI4nAAOn4TINKuBZc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Q9LdBgo6gn60zqBwNsfLakHlyukhwiEMdDEuBWfkfiTHiri/zf7/FrBPfVekflwJp
 VjH8RDt3fppn5GL2km5+ZqYofCybcTaBmh65krCe4azTiBvsYESwMcSRD+GIoEa8bP
 pkjIJYyMjg/Dy51L2yDYewVvI9uggn2qRAZAkbWAO5+4LAIADa5dSc49IIvE9zhffs
 Dp56Eed8d+Emmppiex4u1JdgoaCgD/L3spcLYMmAMMgHBRxXfkFJO8DpDBtP3E7WfC
 VvmZBWoD4+XtNAxuFHZpIYr/o7Wl7hkFMoQXpDdxRtJ89j2p5YPGlM0vIHuGsYx6Bg
 iwMX6lNUGtKcA==
Message-ID: <105491ee-17a1-4f6d-aa0c-5cb5864d185c@kernel.org>
Date: Mon, 24 Feb 2025 14:11:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>
References: <20250204145353.165-1-yohan.joung@sk.com>
 <53598146-1f01-41ad-980e-9f4b989e81ab@kernel.org>
 <CACOAw_x2v9fhorDWx9+f4VufddSPA5S6PF22AM_56smjjD5Faw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CACOAw_x2v9fhorDWx9+f4VufddSPA5S6PF22AM_56smjjD5Faw@mail.gmail.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2/21/25 23:56, Daeho Jeong wrote: > On Mon, Feb 17, 2025
    at 4:38 AM Chao Yu <chao@kernel.org> wrote: >> >> On 2/4/25 22:53, Yohan
    Joung wrote: >>> F2FS zone storage requires discard and reset zon [...] 
 
 Content analysis details:   (-0.6 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [172.105.4.254 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [172.105.4.254 listed in bl.score.senderscore.com]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tmRh3-0008EZ-Al
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: fix to ensure queued discard
 commands are properly issued
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Yohan Joung <jyh429@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMi8yMS8yNSAyMzo1NiwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gT24gTW9uLCBGZWIgMTcsIDIw
MjUgYXQgNDozOOKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IE9u
IDIvNC8yNSAyMjo1MywgWW9oYW4gSm91bmcgd3JvdGU6Cj4+PiBGMkZTIHpvbmUgc3RvcmFnZSBy
ZXF1aXJlcyBkaXNjYXJkIGFuZCByZXNldCB6b25lIGZvciBlYWNoIGNvbnZlbnRpb25hbCwKPj4+
IHpvbmVkIGRldmljZS4KPj4+IEluIHRoZSBjdXJyZW50IGNvbmZpZ3VyYXRpb24sIERpc2NhcmQg
Z3JhbnVsYXJpdHkgaXMgc2V0IHRvIHRoZSB6b25lCj4+PiBzaXplIGJ1dCBxdWV1aW5nIGlzIGlu
c2VydGVkIGludG8gdGhlIHBlbmQgbGlzdCB3aXRoIGEgbWF4aW11bSBzaXplIG9mIHRoZQo+Pj4g
c2VnbWVudCBzaXplIEFzIGEgcmVzdWx0IHF1ZXVlZCBjb21tYW5kcyBjYW5ub3QgYmUgaXNzdWVk
Lgo+Pj4gc28gd2UgYXJlIHJlc3RvcnRpbmcgZGlzY2FyZCBncmFudWxhcml0eSB0byBpdHMgb3Jp
Z2luYWwgc3RhdGUKPj4KPj4gSXQgc2VlbXMgY29tbWl0IDRmOTkzMjY0ZmUyOSAoImYyZnM6IGlu
dHJvZHVjZSBkaXNjYXJkX3VuaXQgbW91bnQgb3B0aW9uIikKPj4gaW50cm9kdWNlZCBhIGJ1Zzog
d2hlbiB3ZSBlbmFibGUgZGlzY2FyZF91bml0PXNlY3Rpb24gb3B0aW9uLCBpdCB3aWxsIHNldAo+
PiAuZGlzY2FyZF9ncmFudWxhcml0eSB0byBCTEtTX1BFUl9TRUMoKSwgaG93ZXZlciBkaXNjYXJk
IGdyYW51bGFyaXR5IG9ubHkKPj4gc3VwcG9ydHMgWzEsIDUxMl0sIG9uY2Ugc2VjdGlvbiBzaXpl
IGlzIG5vdCBlcXVhbCB0byBzZWdtZW50IHNpemUsIGl0IHdpbGwKPj4gY2F1c2UgYnVnLiBibGt6
b25lZCBmZWF0dXJlIGJlY2FtZSB0aGUgdmljdGltIHNpbmNlIGl0IHVzZQo+PiBkaXNjYXJkX3Vu
aXQ9c2VjdGlvbiBvcHRpb24gYnkgZGVmYXVsdC4KPj4KPj4gV2hhdDogICAgICAgICAgIC9zeXMv
ZnMvZjJmcy88ZGlzaz4vZGlzY2FyZF9ncmFudWxhcml0eQo+PiBEYXRlOiAgICAgICAgICAgSnVs
eSAyMDE3Cj4+IENvbnRhY3Q6ICAgICAgICAiQ2hhbyBZdSIgPHl1Y2hhbzBAaHVhd2VpLmNvbT4K
Pj4gRGVzY3JpcHRpb246ICAgIENvbnRyb2xzIGRpc2NhcmQgZ3JhbnVsYXJpdHkgb2YgaW5uZXIg
ZGlzY2FyZCB0aHJlYWQuIElubmVyIHRocmVhZAo+PiAgICAgICAgICAgICAgICAgd2lsbCBub3Qg
aXNzdWUgZGlzY2FyZHMgd2l0aCBzaXplIHRoYXQgaXMgc21hbGxlciB0aGFuIGdyYW51bGFyaXR5
Lgo+PiAgICAgICAgICAgICAgICAgVGhlIHVuaXQgc2l6ZSBpcyBvbmUgYmxvY2soNEtCKSwgbm93
IG9ubHkgc3VwcG9ydCBjb25maWd1cmluZwo+PiAgICAgICAgICAgICAgICAgaW4gcmFuZ2Ugb2Yg
WzEsIDUxMl0uIERlZmF1bHQgdmFsdWUgaXMgMTYuCj4+ICAgICAgICAgICAgICAgICBGb3Igc21h
bGwgZGV2aWNlcywgZGVmYXVsdCB2YWx1ZSBpcyAxLgo+Pgo+PiBXaGF0IGFib3V0IHRoaXM/Cj4+
Cj4+IFN1YmplY3Q6IFtQQVRDSF0gZjJmczogZml4IHRvIHNldCAuZGlzY2FyZF9ncmFudWxhcml0
eSBjb3JyZWN0bHkKPj4KPj4gY29tbWl0IDRmOTkzMjY0ZmUyOSAoImYyZnM6IGludHJvZHVjZSBk
aXNjYXJkX3VuaXQgbW91bnQgb3B0aW9uIikgaW50cm9kdWNlZAo+PiBhIGJ1Zywgd2hlbiB3ZSBl
bmFibGUgZGlzY2FyZF91bml0PXNlY3Rpb24gb3B0aW9uLCBpdCB3aWxsIHNldAo+PiAuZGlzY2Fy
ZF9ncmFudWxhcml0eSB0byBCTEtTX1BFUl9TRUMoKSwgaG93ZXZlciBkaXNjYXJkIGdyYW51bGFy
aXR5IG9ubHkKPj4gc3VwcG9ydHMgWzEsIDUxMl0sIG9uY2Ugc2VjdGlvbiBzaXplIGlzIG5vdCBl
cXVhbCB0byBzZWdtZW50IHNpemUsIGl0IHdpbGwKPj4gY2F1c2UgaXNzdWVfZGlzY2FyZF90aHJl
YWQoKSBpbiBEUE9MSUNZX0JHIG1vZGUgd2lsbCBub3Qgc2VsZWN0IGRpc2NhcmQgZW50cnkKPj4g
dy8gYW55IGdyYW51bGFyaXR5IHRvIGlzc3VlLgo+Pgo+PiBGaXhlczogNGY5OTMyNjRmZTI5ICgi
ZjJmczogaW50cm9kdWNlIGRpc2NhcmRfdW5pdCBtb3VudCBvcHRpb24iKQo+PiBTaWduZWQtb2Zm
LWJ5OiBZb2hhbiBKb3VuZyA8eW9oYW4uam91bmdAc2suY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBD
aGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4+IC0tLQo+PiAgZnMvZjJmcy9zZWdtZW50LmMgfCA1
ICsrLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQu
Ywo+PiBpbmRleCA2ZWJlMjVlYWZhZmEuLjJiNDE1OTI2NjQxZiAxMDA2NDQKPj4gLS0tIGEvZnMv
ZjJmcy9zZWdtZW50LmMKPj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4gQEAgLTIzMjAsMTAg
KzIzMjAsOSBAQCBzdGF0aWMgaW50IGNyZWF0ZV9kaXNjYXJkX2NtZF9jb250cm9sKHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSkKPj4gICAgICAgICBkY2MtPmRpc2NhcmRfZ3JhbnVsYXJpdHkgPSBE
RUZBVUxUX0RJU0NBUkRfR1JBTlVMQVJJVFk7Cj4+ICAgICAgICAgZGNjLT5tYXhfb3JkZXJlZF9k
aXNjYXJkID0gREVGQVVMVF9NQVhfT1JERVJFRF9ESVNDQVJEX0dSQU5VTEFSSVRZOwo+PiAgICAg
ICAgIGRjYy0+ZGlzY2FyZF9pb19hd2FyZSA9IERQT0xJQ1lfSU9fQVdBUkVfRU5BQkxFOwo+PiAt
ICAgICAgIGlmIChGMkZTX09QVElPTihzYmkpLmRpc2NhcmRfdW5pdCA9PSBESVNDQVJEX1VOSVRf
U0VHTUVOVCkKPj4gKyAgICAgICBpZiAoRjJGU19PUFRJT04oc2JpKS5kaXNjYXJkX3VuaXQgPT0g
RElTQ0FSRF9VTklUX1NFR01FTlQgfHwKPj4gKyAgICAgICAgICAgICAgIEYyRlNfT1BUSU9OKHNi
aSkuZGlzY2FyZF91bml0ID09IERJU0NBUkRfVU5JVF9TRUNUSU9OKQo+PiAgICAgICAgICAgICAg
ICAgZGNjLT5kaXNjYXJkX2dyYW51bGFyaXR5ID0gQkxLU19QRVJfU0VHKHNiaSk7Cj4+IC0gICAg
ICAgZWxzZSBpZiAoRjJGU19PUFRJT04oc2JpKS5kaXNjYXJkX3VuaXQgPT0gRElTQ0FSRF9VTklU
X1NFQ1RJT04pCj4+IC0gICAgICAgICAgICAgICBkY2MtPmRpc2NhcmRfZ3JhbnVsYXJpdHkgPSBC
TEtTX1BFUl9TRUMoc2JpKTsKPj4KPj4gICAgICAgICBJTklUX0xJU1RfSEVBRCgmZGNjLT5lbnRy
eV9saXN0KTsKPj4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwgTUFYX1BMSVNUX05VTTsgaSsrKQo+
PiAtLQo+PiAyLjQ4LjEuNjAxLmczMGNlYjdiMDQwLWdvb2cKPj4KPiAKPiBSZXZpZXdlZC1ieTog
RGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KClRoYW5rcyBmb3IgdGhlIHJldmll
dywgbGV0IG1lIHNlbmQgYSBmb3JtYWwgcGF0Y2guCgpUaGFua3MsCgo+IAo+PgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
