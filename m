Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F19976D053
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Aug 2023 16:42:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRD3I-0005iI-J1;
	Wed, 02 Aug 2023 14:42:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qRD3G-0005iC-Dc
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 14:42:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fZGmKWRHwh95hI8qKkbxKsSgeSY70zi7bF6jrpx5CwQ=; b=Seh03SJig7EEy7D79SVKWNB+wl
 OhlVpc7FD8IW1PxRvLzqeLEozhpn9OQHYBSbWITrfwtPpvuRqAaiF2rlMJCXt7I3tksNDc6y9DeyJ
 tJ4unkxNuicjY/NbJ2t3r/ptaEy5XdLETru6ehTpmDLKG19OmICBO1Hk8RHz/a74PrXU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fZGmKWRHwh95hI8qKkbxKsSgeSY70zi7bF6jrpx5CwQ=; b=eJ5Ph6xAPenQzrLuuZE+tox3ic
 B+TUcUuT1OHcCg+oMq9SQKOYHfmUc+OjvlZiYEN5ME2QCbW50SVDqnsQgxKkYohM+5voZxr8uD4CI
 NFYbXU6bYYpvJKBhmbN2LOwSoMe1oNr5568lCG6iEfBi38zPQ7RXazdO62SpEFRoSMRo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRD3D-00AorN-5d for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 14:42:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5311061986;
 Wed,  2 Aug 2023 14:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 876C8C433C7;
 Wed,  2 Aug 2023 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690987317;
 bh=rgBibd0o1fF3a08ENh2daqV1NavlTbBZdbLQsxegWxc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LsO5YIjulAA+IzwpnNSj1YqtdW3281G/xtbfm3/p7lpBThcXcAAbHrV/ZlJsfeWp3
 LD2aDD9fHkqgBUBRTpQLqtgxI39svr4NnQLOvBCEyok2kL4/Gtu7itm9xiezkMl2uu
 4zU/TcHLqyPZ6yn/Q9Q/WfDwwnyUEfU/mG+0daExoPCBWYiB+PBUj33Q4V7T2wo1L7
 T7s66Jx6Zd3THMYDp8GFcxWwcMwDL00K1S9xd3lTFVm5zTsc/y5ukLrUPRi6j/yUQd
 5Q5Ckz9yUNxXlRkSNlAGMya8p55pfeuXVkDISabeGI3A+/WcdonwDdX4ibgXakBKbP
 WMm3q04z2oPcw==
Message-ID: <7a8fbee4-6176-b122-7d43-32fb553ef332@kernel.org>
Date: Wed, 2 Aug 2023 22:41:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
To: Chao Liu <chaoliu719@gmail.com>
References: <20230725013607.4134123-1-chaoliu719@gmail.com>
 <16625fbb-3dc0-34d5-ee75-fe010aa0d9ec@kernel.org>
 <ZMC6JfDFOo3WrRsC@liuchao-VM>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZMC6JfDFOo3WrRsC@liuchao-VM>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2023/7/26 14:16, Chao Liu wrote: > On 7月 26 09:24, Chao
    Yu wrote: >> On 2023/7/25 9:36, Chao Liu wrote: >>> From: Chao Liu <liuchao@coolpad.com>
    >>> >>> This patch is a cleanup: >>> 1. Merge __dr [...] 
 
 Content analysis details:   (-5.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qRD3D-00AorN-5d
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce two helper functions for
 the largest cached extent
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Liu <liuchao@coolpad.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy83LzI2IDE0OjE2LCBDaGFvIExpdSB3cm90ZToKPiBPbiA35pyIIDI2IDA5OjI0LCBD
aGFvIFl1IHdyb3RlOgo+PiBPbiAyMDIzLzcvMjUgOTozNiwgQ2hhbyBMaXUgd3JvdGU6Cj4+PiBG
cm9tOiBDaGFvIExpdSA8bGl1Y2hhb0Bjb29scGFkLmNvbT4KPj4+Cj4+PiBUaGlzIHBhdGNoIGlz
IGEgY2xlYW51cDoKPj4+IDEuIE1lcmdlIF9fZHJvcF9sYXJnZXN0X2V4dGVudCgpIHNpbmNlIGl0
IGhhcyBvbmx5IG9uZSBjYWxsZXIuCj4+PiAyLiBJbnRyb2R1Y2UgX191bmxvY2tfdHJlZV93aXRo
X2NoZWNraW5nX2xhcmdlc3QoKSBhbmQKPj4+ICAgICAgX19kcm9wX2xhcmdlc3RfZXh0ZW50KCkg
dG8gaGVscCBtYW5hZ2UgbGFyZ2VzdCBhbmQgbGFyZ2VzdF91cGRhdGUKPj4+ICAgICAgaW4gZXh0
ZW50X3RyZWUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBMaXUgPGxpdWNoYW9AY29vbHBh
ZC5jb20+Cj4+PiAtLS0KPj4+IHYyOiBNYWtlIHN1cmUgZXQtPmxhcmdlc3RfdXBkYXRlZCBnZXRz
IHVwZGF0ZWQgd2l0aGluICZldC0+bG9jay4KPj4+ICAgICAgIFRoYW5rcyB0byBDaGFvIFl1IGZv
ciBwb2ludGluZyBvdXQuCj4+PiAtLS0KPj4+ICAgIGZzL2YyZnMvZXh0ZW50X2NhY2hlLmMgfCA2
NiArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+ICAgIGZzL2Yy
ZnMvZjJmcy5oICAgICAgICAgfCAgNCArLS0KPj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgMzMgaW5z
ZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
ZXh0ZW50X2NhY2hlLmMgYi9mcy9mMmZzL2V4dGVudF9jYWNoZS5jCj4+PiBpbmRleCAwZTJkNDkx
NDBjMDdmLi5jZmM2OTYyMWE4YTI2IDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9leHRlbnRfY2Fj
aGUuYwo+Pj4gKysrIGIvZnMvZjJmcy9leHRlbnRfY2FjaGUuYwo+Pj4gQEAgLTE5LDYgKzE5LDEy
IEBACj4+PiAgICAjaW5jbHVkZSAibm9kZS5oIgo+Pj4gICAgI2luY2x1ZGUgPHRyYWNlL2V2ZW50
cy9mMmZzLmg+Cj4+PiArc3RhdGljIHZvaWQgX19kcm9wX2xhcmdlc3RfZXh0ZW50KHN0cnVjdCBl
eHRlbnRfdHJlZSAqZXQpCj4+PiArewo+Pj4gKwlldC0+bGFyZ2VzdC5sZW4gPSAwOwo+Pj4gKwll
dC0+bGFyZ2VzdF91cGRhdGVkID0gdHJ1ZTsKPj4+ICt9Cj4+PiArCj4+PiAgICBib29sIHNhbml0
eV9jaGVja19leHRlbnRfY2FjaGUoc3RydWN0IGlub2RlICppbm9kZSkKPj4+ICAgIHsKPj4+ICAg
IAlzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkgPSBGMkZTX0lfU0IoaW5vZGUpOwo+Pj4gQEAgLTM1
LDggKzQxLDcgQEAgYm9vbCBzYW5pdHlfY2hlY2tfZXh0ZW50X2NhY2hlKHN0cnVjdCBpbm9kZSAq
aW5vZGUpCj4+PiAgICAJLyogTGV0J3MgZHJvcCwgaWYgY2hlY2twb2ludCBnb3QgY29ycnVwdGVk
LiAqLwo+Pj4gICAgCWlmIChpc19zZXRfY2twdF9mbGFncyhzYmksIENQX0VSUk9SX0ZMQUcpKSB7
Cj4+PiAtCQllaS0+bGVuID0gMDsKPj4+IC0JCWV0LT5sYXJnZXN0X3VwZGF0ZWQgPSB0cnVlOwo+
Pj4gKwkJX19kcm9wX2xhcmdlc3RfZXh0ZW50KGV0KTsKPj4KPj4gX19kcm9wX2xhcmdlc3RfZXh0
ZW50X2ZvcmNlKGV0KTsKPj4KPj4+ICAgIAkJcmV0dXJuIHRydWU7Cj4+PiAgICAJfQo+Pj4gQEAg
LTMxMCw2ICszMTUsOCBAQCBzdGF0aWMgdm9pZCBfX2RldGFjaF9leHRlbnRfbm9kZShzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmksCj4+PiAgICAJaWYgKGV0LT5jYWNoZWRfZW4gPT0gZW4pCj4+PiAg
ICAJCWV0LT5jYWNoZWRfZW4gPSBOVUxMOwo+Pj4gKwo+Pj4gKwkvKiBrZWVwIHRoZSBsYXJnZXN0
IGFzIHdlIGNhbiBzdGlsbCB1c2UgaXQgKi8KPj4KPj4gVGhlIGNvbW1lbnRzIGRvZXNuJ3QgbWF0
Y2ggYmVsb3cgY29kZT8KPj4KPiAKPiBTb3JyeSBmb3Igbm90IGV4cGxhaW5pbmcgdGhpcyBlYXJs
aWVyLgo+IAo+IEl0J3MganVzdCBhIGhpbnQgYW5kIGhhcyBub3RoaW5nIHRvIGRvIHdpdGggdGhl
IGNvZGUgYmVsb3cuIEl0CgpTbywgaXQgc2hvdWxkIGJlIG5lYXIgdG8gcmVsYXRlZCBjb2RlLi4u
LCBvdGhlcndpc2UsIElNTywgaXQgbWFrZXMgdGhlIGNvZGUKbW9yZSBjb25mdXNlZC4KClRoYW5r
cywKCj4gc2ltcGx5IGV4cGxhaW5zIHRoYXQgd2UgZG9uJ3QgbmVlZCB0byBkaXNhYmxlIHRoZSBs
YXJnZXN0IGhlcmUsIHdoaWNoCj4gbWFrZXMgdGhlIHdob2xlIGNvZGUgbG9naWMgb2YgdGhlIGxh
cmdlc3QgbW9yZSBjbGVhci4gOikKPiAKPiBJZiBpdCdzIG5vdCBmaXR0aW5nLCBwbGVhc2UgbGV0
IG1lIGtub3csIGFuZCBJJ2xsIGRyb3AgdGhlbS4KPiAKPj4+ICAgIAlrbWVtX2NhY2hlX2ZyZWUo
ZXh0ZW50X25vZGVfc2xhYiwgZW4pOwo+Pj4gICAgfQo+Pj4gQEAgLTM4NSwxNSArMzkyLDYgQEAg
c3RhdGljIHVuc2lnbmVkIGludCBfX2ZyZWVfZXh0ZW50X3RyZWUoc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpLAo+Pj4gICAgCXJldHVybiBjb3VudCAtIGF0b21pY19yZWFkKCZldC0+bm9kZV9jbnQp
Owo+Pj4gICAgfQo+Pj4gLXN0YXRpYyB2b2lkIF9fZHJvcF9sYXJnZXN0X2V4dGVudChzdHJ1Y3Qg
ZXh0ZW50X3RyZWUgKmV0LAo+Pj4gLQkJCQkJcGdvZmZfdCBmb2ZzLCB1bnNpZ25lZCBpbnQgbGVu
KQo+Pj4gLXsKPj4+IC0JaWYgKGZvZnMgPCBldC0+bGFyZ2VzdC5mb2ZzICsgZXQtPmxhcmdlc3Qu
bGVuICYmCj4+PiAtCQkJZm9mcyArIGxlbiA+IGV0LT5sYXJnZXN0LmZvZnMpIHsKPj4+IC0JCWV0
LT5sYXJnZXN0LmxlbiA9IDA7Cj4+PiAtCQlldC0+bGFyZ2VzdF91cGRhdGVkID0gdHJ1ZTsKPj4+
IC0JfQo+Pj4gLX0KPj4KPj4gV2hhdCBhYm91dDoKPj4KPj4gc3RhdGljIHZvaWQgX19kcm9wX2xh
cmdlc3RfZXh0ZW50X2NvbmQoc3RydWN0IGV4dGVudF90cmVlICpldCwKPj4gCQkJCQlwZ29mZl90
IGZvZnMsIHVuc2lnbmVkIGludCBsZW4sCj4+IAkJCQkJYm9vbCBmb3JjZSkKPj4gewo+PiAJaWYg
KGZvcmNlIHx8IChmb2ZzIDwgZXQtPmxhcmdlc3QuZm9mcyArIGV0LT5sYXJnZXN0LmxlbiAmJgo+
PiAJCQlmb2ZzICsgbGVuID4gZXQtPmxhcmdlc3QuZm9mcykpIHsKPj4gCQlldC0+bGFyZ2VzdC5s
ZW4gPSAwOwo+PiAJCWV0LT5sYXJnZXN0X3VwZGF0ZWQgPSB0cnVlOwo+PiAJfQo+PiB9Cj4+Cj4+
IHN0YXRpYyB2b2lkIF9fZHJvcF9sYXJnZXN0X2V4dGVudF9mb3JjZShzdHJ1Y3QgZXh0ZW50X3Ry
ZWUgKmV0KQo+PiB7Cj4+IAlfX2Ryb3BfbGFyZ2VzdF9leHRlbnRfY29uZChldCwgMCwgMCwgdHJ1
ZSk7Cj4+IH0KPj4KPiAKPiBUaGFuayB5b3UuIEkgZmVlbCBpdCBtYXRjaGVzIGJldHRlciB3aXRo
IHRoZSBleGlzdGluZyBjb2RlCj4gb3JnYW5pemF0aW9uIHN0eWxlLiBMZXQgbWUgYXBwbHkgaXQg
aW4gdjMuCj4gCj4+PiAgICB2b2lkIGYyZnNfaW5pdF9yZWFkX2V4dGVudF90cmVlKHN0cnVjdCBp
bm9kZSAqaW5vZGUsIHN0cnVjdCBwYWdlICppcGFnZSkKPj4+ICAgIHsKPj4+IEBAIC02MDEsNiAr
NTk5LDE5IEBAIHN0YXRpYyBzdHJ1Y3QgZXh0ZW50X25vZGUgKl9faW5zZXJ0X2V4dGVudF90cmVl
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+ICAgIAlyZXR1cm4gZW47Cj4+PiAgICB9Cj4+
PiArc3RhdGljIHZvaWQgX191bmxvY2tfdHJlZV93aXRoX2NoZWNraW5nX2xhcmdlc3Qoc3RydWN0
IGV4dGVudF90cmVlICpldCwKPj4+ICsJCQkJCQlzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+Pj4gK3sK
Pj4+ICsJaWYgKGV0LT50eXBlID09IEVYX1JFQUQgJiYgZXQtPmxhcmdlc3RfdXBkYXRlZCkgewo+
Pj4gKwkJZXQtPmxhcmdlc3RfdXBkYXRlZCA9IGZhbHNlOwo+Pj4gKwkJd3JpdGVfdW5sb2NrKCZl
dC0+bG9jayk7Cj4+PiArCQlmMmZzX21hcmtfaW5vZGVfZGlydHlfc3luYyhpbm9kZSwgdHJ1ZSk7
Cj4+PiArCQlyZXR1cm47Cj4+PiArCX0KPj4+ICsKPj4+ICsJd3JpdGVfdW5sb2NrKCZldC0+bG9j
ayk7Cj4+PiArfQo+Pj4gKwo+Pj4gICAgc3RhdGljIHZvaWQgX191cGRhdGVfZXh0ZW50X3RyZWVf
cmFuZ2Uoc3RydWN0IGlub2RlICppbm9kZSwKPj4+ICAgIAkJCXN0cnVjdCBleHRlbnRfaW5mbyAq
dGVpLCBlbnVtIGV4dGVudF90eXBlIHR5cGUpCj4+PiAgICB7Cj4+PiBAQCAtNjEyLDcgKzYyMyw2
IEBAIHN0YXRpYyB2b2lkIF9fdXBkYXRlX2V4dGVudF90cmVlX3JhbmdlKHN0cnVjdCBpbm9kZSAq
aW5vZGUsCj4+PiAgICAJc3RydWN0IHJiX25vZGUgKippbnNlcnRfcCA9IE5VTEwsICppbnNlcnRf
cGFyZW50ID0gTlVMTDsKPj4+ICAgIAl1bnNpZ25lZCBpbnQgZm9mcyA9IHRlaS0+Zm9mcywgbGVu
ID0gdGVpLT5sZW47Cj4+PiAgICAJdW5zaWduZWQgaW50IGVuZCA9IGZvZnMgKyBsZW47Cj4+PiAt
CWJvb2wgdXBkYXRlZCA9IGZhbHNlOwo+Pj4gICAgCWJvb2wgbGVmdG1vc3QgPSBmYWxzZTsKPj4+
ICAgIAlpZiAoIWV0KQo+Pj4gQEAgLTYzNiwxMSArNjQ2LDEwIEBAIHN0YXRpYyB2b2lkIF9fdXBk
YXRlX2V4dGVudF90cmVlX3JhbmdlKHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4+PiAgICAJCXByZXYg
PSBldC0+bGFyZ2VzdDsKPj4+ICAgIAkJZGVpLmxlbiA9IDA7Cj4+PiAtCQkvKgo+Pj4gLQkJICog
ZHJvcCBsYXJnZXN0IGV4dGVudCBiZWZvcmUgbG9va3VwLCBpbiBjYXNlIGl0J3MgYWxyZWFkeQo+
Pj4gLQkJICogYmVlbiBzaHJ1bmsgZnJvbSBleHRlbnQgdHJlZQo+Pj4gLQkJICovCj4+PiAtCQlf
X2Ryb3BfbGFyZ2VzdF9leHRlbnQoZXQsIGZvZnMsIGxlbik7Cj4+Cj4+IF9fZHJvcF9sYXJnZXN0
X2V4dGVudF9jb25kKGV0LCBmb2ZzLCBsZW4sIGZhbHNlKTsKPj4KPj4+ICsJCS8qIHVwZGF0ZXMg
bWF5IGNhdXNlIGxhcmdlc3QgZXh0ZW50IGNhY2hlIHRvIGJlY29tZSBpbnZhbGlkICovCj4+PiAr
CQlpZiAoZm9mcyA8IGV0LT5sYXJnZXN0LmZvZnMgKyBldC0+bGFyZ2VzdC5sZW4gJiYKPj4+ICsJ
CSAgICBmb2ZzICsgbGVuID4gZXQtPmxhcmdlc3QuZm9mcykKPj4+ICsJCQlfX2Ryb3BfbGFyZ2Vz
dF9leHRlbnQoZXQpOwo+Pj4gICAgCX0KPj4+ICAgIAkvKiAxLiBsb29rdXAgZmlyc3QgZXh0ZW50
IG5vZGUgaW4gcmFuZ2UgW2ZvZnMsIGZvZnMgKyBsZW4gLSAxXSAqLwo+Pj4gQEAgLTczMyw4ICs3
NDIsNyBAQCBzdGF0aWMgdm9pZCBfX3VwZGF0ZV9leHRlbnRfdHJlZV9yYW5nZShzdHJ1Y3QgaW5v
ZGUgKmlub2RlLAo+Pj4gICAgCQlpZiAoZGVpLmxlbiA+PSAxICYmCj4+PiAgICAJCQkJcHJldi5s
ZW4gPCBGMkZTX01JTl9FWFRFTlRfTEVOICYmCj4+PiAgICAJCQkJZXQtPmxhcmdlc3QubGVuIDwg
RjJGU19NSU5fRVhURU5UX0xFTikgewo+Pj4gLQkJCWV0LT5sYXJnZXN0LmxlbiA9IDA7Cj4+PiAt
CQkJZXQtPmxhcmdlc3RfdXBkYXRlZCA9IHRydWU7Cj4+PiArCQkJX19kcm9wX2xhcmdlc3RfZXh0
ZW50KGV0KTsKPj4KPj4gX19kcm9wX2xhcmdlc3RfZXh0ZW50X2ZvcmNlKGV0KTsKPj4KPj4+ICAg
IAkJCXNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9OT19FWFRFTlQpOwo+Pj4gICAgCQl9Cj4+PiAg
ICAJfQo+Pj4gQEAgLTc0MiwxMCArNzUwLDYgQEAgc3RhdGljIHZvaWQgX191cGRhdGVfZXh0ZW50
X3RyZWVfcmFuZ2Uoc3RydWN0IGlub2RlICppbm9kZSwKPj4+ICAgIAlpZiAoaXNfaW5vZGVfZmxh
Z19zZXQoaW5vZGUsIEZJX05PX0VYVEVOVCkpCj4+PiAgICAJCV9fZnJlZV9leHRlbnRfdHJlZShz
YmksIGV0KTsKPj4+IC0JaWYgKGV0LT5sYXJnZXN0X3VwZGF0ZWQpIHsKPj4+IC0JCWV0LT5sYXJn
ZXN0X3VwZGF0ZWQgPSBmYWxzZTsKPj4+IC0JCXVwZGF0ZWQgPSB0cnVlOwo+Pj4gLQl9Cj4+Cj4+
IEkgZ3Vlc3Mgd2UnZCBiZXR0ZXIga2VlcCBwcmV2aW91cyBsb2dpYy4KPiAKPiBPaywgSSB3aWxs
IGRyb3AgdGhlc2UgY2hhbmdlcyBpbiB2My4gRGl0dG8gZm9yIF9fZHJvcF9leHRlbnRfdHJlZSgp
Lgo+IAo+Pgo+Pj4gICAgCWdvdG8gb3V0X3JlYWRfZXh0ZW50X2NhY2hlOwo+Pj4gICAgdXBkYXRl
X2FnZV9leHRlbnRfY2FjaGU6Cj4+PiAgICAJaWYgKCF0ZWktPmxhc3RfYmxvY2tzKQo+Pj4gQEAg
LTc1NywxMCArNzYxLDcgQEAgc3RhdGljIHZvaWQgX191cGRhdGVfZXh0ZW50X3RyZWVfcmFuZ2Uo
c3RydWN0IGlub2RlICppbm9kZSwKPj4+ICAgIAkJX19pbnNlcnRfZXh0ZW50X3RyZWUoc2JpLCBl
dCwgJmVpLAo+Pj4gICAgCQkJCQlpbnNlcnRfcCwgaW5zZXJ0X3BhcmVudCwgbGVmdG1vc3QpOwo+
Pj4gICAgb3V0X3JlYWRfZXh0ZW50X2NhY2hlOgo+Pj4gLQl3cml0ZV91bmxvY2soJmV0LT5sb2Nr
KTsKPj4+IC0KPj4+IC0JaWYgKHVwZGF0ZWQpCj4+PiAtCQlmMmZzX21hcmtfaW5vZGVfZGlydHlf
c3luYyhpbm9kZSwgdHJ1ZSk7Cj4+Cj4+IERpdHRvLAo+Pgo+Pj4gKwlfX3VubG9ja190cmVlX3dp
dGhfY2hlY2tpbmdfbGFyZ2VzdChldCwgaW5vZGUpOwo+Pj4gICAgfQo+Pj4gICAgI2lmZGVmIENP
TkZJR19GMkZTX0ZTX0NPTVBSRVNTSU9OCj4+PiBAQCAtMTA5Miw3ICsxMDkzLDYgQEAgc3RhdGlj
IHZvaWQgX19kcm9wX2V4dGVudF90cmVlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGVudW0gZXh0ZW50
X3R5cGUgdHlwZSkKPj4+ICAgIHsKPj4+ICAgIAlzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkgPSBG
MkZTX0lfU0IoaW5vZGUpOwo+Pj4gICAgCXN0cnVjdCBleHRlbnRfdHJlZSAqZXQgPSBGMkZTX0ko
aW5vZGUpLT5leHRlbnRfdHJlZVt0eXBlXTsKPj4+IC0JYm9vbCB1cGRhdGVkID0gZmFsc2U7Cj4+
PiAgICAJaWYgKCFfX21heV9leHRlbnRfdHJlZShpbm9kZSwgdHlwZSkpCj4+PiAgICAJCXJldHVy
bjsKPj4+IEBAIC0xMTAxLDE0ICsxMTAxLDEwIEBAIHN0YXRpYyB2b2lkIF9fZHJvcF9leHRlbnRf
dHJlZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBlbnVtIGV4dGVudF90eXBlIHR5cGUpCj4+PiAgICAJ
X19mcmVlX2V4dGVudF90cmVlKHNiaSwgZXQpOwo+Pj4gICAgCWlmICh0eXBlID09IEVYX1JFQUQp
IHsKPj4+ICAgIAkJc2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX05PX0VYVEVOVCk7Cj4+PiAtCQlp
ZiAoZXQtPmxhcmdlc3QubGVuKSB7Cj4+PiAtCQkJZXQtPmxhcmdlc3QubGVuID0gMDsKPj4+IC0J
CQl1cGRhdGVkID0gdHJ1ZTsKPj4+IC0JCX0KPj4+ICsJCWlmIChldC0+bGFyZ2VzdC5sZW4pCj4+
PiArCQkJX19kcm9wX2xhcmdlc3RfZXh0ZW50KGV0KTsKPj4+ICAgIAl9Cj4+PiAtCXdyaXRlX3Vu
bG9jaygmZXQtPmxvY2spOwo+Pj4gLQlpZiAodXBkYXRlZCkKPj4+IC0JCWYyZnNfbWFya19pbm9k
ZV9kaXJ0eV9zeW5jKGlub2RlLCB0cnVlKTsKPj4KPj4gRGl0dG8sCj4+Cj4+IFRoYW5rcywKPj4K
Pj4+ICsJX191bmxvY2tfdHJlZV93aXRoX2NoZWNraW5nX2xhcmdlc3QoZXQsIGlub2RlKTsKPj4+
ICAgIH0KPj4+ICAgIHZvaWQgZjJmc19kcm9wX2V4dGVudF90cmVlKHN0cnVjdCBpbm9kZSAqaW5v
ZGUpCj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+Pj4g
aW5kZXggZDM3MmJlZGIwZmU0ZS4uZGEwMmUxMjBlNWVhNiAxMDA2NDQKPj4+IC0tLSBhL2ZzL2Yy
ZnMvZjJmcy5oCj4+PiArKysgYi9mcy9mMmZzL2YyZnMuaAo+Pj4gQEAgLTY2NSw3ICs2NjUsNyBA
QCBzdHJ1Y3QgZXh0ZW50X3RyZWUgewo+Pj4gICAgc3RydWN0IGV4dGVudF90cmVlX2luZm8gewo+
Pj4gICAgCXN0cnVjdCByYWRpeF90cmVlX3Jvb3QgZXh0ZW50X3RyZWVfcm9vdDsvKiBjYWNoZSBl
eHRlbnQgY2FjaGUgZW50cmllcyAqLwo+Pj4gLQlzdHJ1Y3QgbXV0ZXggZXh0ZW50X3RyZWVfbG9j
azsJLyogbG9ja2luZyBleHRlbnQgcmFkaXggdHJlZSAqLwo+Pj4gKwlzdHJ1Y3QgbXV0ZXggZXh0
ZW50X3RyZWVfbG9jazsJCS8qIGxvY2tpbmcgZXh0ZW50IHJhZGl4IHRyZWUgKi8KPj4+ICAgIAlz
dHJ1Y3QgbGlzdF9oZWFkIGV4dGVudF9saXN0OwkJLyogbHJ1IGxpc3QgZm9yIHNocmlua2VyICov
Cj4+PiAgICAJc3BpbmxvY2tfdCBleHRlbnRfbG9jazsJCQkvKiBsb2NraW5nIGV4dGVudCBscnUg
bGlzdCAqLwo+Pj4gICAgCWF0b21pY190IHRvdGFsX2V4dF90cmVlOwkJLyogZXh0ZW50IHRyZWUg
Y291bnQgKi8KPj4+IEBAIC03NjYsNyArNzY2LDcgQEAgZW51bSB7Cj4+PiAgICAJRklfQUNMX01P
REUsCQkvKiBpbmRpY2F0ZSBhY2wgbW9kZSAqLwo+Pj4gICAgCUZJX05PX0FMTE9DLAkJLyogc2hv
dWxkIG5vdCBhbGxvY2F0ZSBhbnkgYmxvY2tzICovCj4+PiAgICAJRklfRlJFRV9OSUQsCQkvKiBm
cmVlIGFsbG9jYXRlZCBuaWRlICovCj4+PiAtCUZJX05PX0VYVEVOVCwJCS8qIG5vdCB0byB1c2Ug
dGhlIGV4dGVudCBjYWNoZSAqLwo+Pj4gKwlGSV9OT19FWFRFTlQsCQkvKiBub3QgdG8gdXNlIHRo
ZSByZWFkIGV4dGVudCBjYWNoZSAqLwo+Pj4gICAgCUZJX0lOTElORV9YQVRUUiwJLyogdXNlZCBm
b3IgaW5saW5lIHhhdHRyICovCj4+PiAgICAJRklfSU5MSU5FX0RBVEEsCQkvKiB1c2VkIGZvciBp
bmxpbmUgZGF0YSovCj4+PiAgICAJRklfSU5MSU5FX0RFTlRSWSwJLyogdXNlZCBmb3IgaW5saW5l
IGRlbnRyeSAqLwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
