Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D115957C7D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Aug 2024 06:39:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sgGeB-0000hI-AA;
	Tue, 20 Aug 2024 04:39:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lizetao1@huawei.com>) id 1sgGeA-0000hC-9h
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Aug 2024 04:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RqxPjsvvUM//ly0GuC9yLr2jzhUMiobahyAFUCEz1V0=; b=YnbLQ97U8ozqArqb9TpTVIKPLk
 2q/+T8fWvUMmNr6SUF5/Vneeqfpn19DswpUIqFpbl0gVHSQAoNWlueQi2bZT9VAc9orIONiKkZ9OV
 x1Ib32tQ8WhAM5Cecww8+K2iMkaOekHUgLr11WLbttHDOZF/ZAhdeYlRpaK0uiyEFoXA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RqxPjsvvUM//ly0GuC9yLr2jzhUMiobahyAFUCEz1V0=; b=Y/Rii9JRQKEpocVcygiQerfubF
 oyTR0bzJwyAcgxjZmrpjlbDvgAcFjF2LKG/qoz7+Glrkka1Kx0rYgdJuvFJ2XS8zphvPjPWOCwp03
 aUdqyaMxA+9h31V9nyv9VWqyO9rxGHKGLewCVAde+b6YnyV6C4wgXCyAXALR7i9851aE=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sgGe8-0000CA-PY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Aug 2024 04:39:06 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WnxYL0nRFzyQy8;
 Tue, 20 Aug 2024 12:38:30 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id 5A1E3180101;
 Tue, 20 Aug 2024 12:38:51 +0800 (CST)
Received: from [10.67.111.176] (10.67.111.176) by
 kwepemd500012.china.huawei.com (7.221.188.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 20 Aug 2024 12:38:50 +0800
Message-ID: <a36db618-e7df-4c15-ad6f-876d8cc2bde5@huawei.com>
Date: Tue, 20 Aug 2024 12:38:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, <jaegeuk@kernel.org>
References: <20240820034654.698236-1-chao@kernel.org>
In-Reply-To: <20240820034654.698236-1-chao@kernel.org>
X-Originating-IP: [10.67.111.176]
X-ClientProxiedBy: dggpeml100005.china.huawei.com (7.185.36.185) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, 在 2024/8/20 11:46, Chao Yu 写道: > Convert to use
   folio, so that we can get rid of 'page->index' to > prepare for removal of
    'index' field in structure page [1]. > > [1] https://lore.kernel.org/al [...]
    
 
 Content analysis details:   (-5.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [45.249.212.187 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [45.249.212.187 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [45.249.212.187 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
                             [45.249.212.187 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1sgGe8-0000CA-PY
Subject: Re: [f2fs-dev] [PATCH v2 1/8] f2fs: convert f2fs_write_begin() to
 use folio
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
From: Li Zetao via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Li Zetao <lizetao1@huawei.com>
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGksCgrlnKggMjAyNC84LzIwIDExOjQ2LCBDaGFvIFl1IOWGmemBkzoKPiBDb252ZXJ0IHRvIHVz
ZSBmb2xpbywgc28gdGhhdCB3ZSBjYW4gZ2V0IHJpZCBvZiAncGFnZS0+aW5kZXgnIHRvCj4gcHJl
cGFyZSBmb3IgcmVtb3ZhbCBvZiAnaW5kZXgnIGZpZWxkIGluIHN0cnVjdHVyZSBwYWdlIFsxXS4K
PiAKPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL1pwOGZnVVNJQkdRMVROMERAY2Fz
cGVyLmluZnJhZGVhZC5vcmcvCj4gCj4gQ2M6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRl
YWQub3JnPgo+IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiAtLS0K
PiB2MjoKPiAtIGZpeCBjb21waWxlIGVycm9yLgo+ICAgZnMvZjJmcy9kYXRhLmMgfCA0NCArKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDIzIGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9m
cy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4gaW5kZXggMDY1NWZkZGZjNGJhLi44NWFj
MDVjMzY1NWEgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPiArKysgYi9mcy9mMmZzL2Rh
dGEuYwo+IEBAIC0zMzc4LDExICszMzc4LDExIEBAIHZvaWQgZjJmc193cml0ZV9mYWlsZWQoc3Ry
dWN0IGlub2RlICppbm9kZSwgbG9mZl90IHRvKQo+ICAgfQo+ICAgCj4gICBzdGF0aWMgaW50IHBy
ZXBhcmVfd3JpdGVfYmVnaW4oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+IC0JCQlzdHJ1Y3Qg
cGFnZSAqcGFnZSwgbG9mZl90IHBvcywgdW5zaWduZWQgbGVuLAo+ICsJCQlzdHJ1Y3QgZm9saW8g
KmZvbGlvLCBsb2ZmX3QgcG9zLCB1bnNpZ25lZCBpbnQgbGVuLAo+ICAgCQkJYmxvY2tfdCAqYmxr
X2FkZHIsIGJvb2wgKm5vZGVfY2hhbmdlZCkKPiAgIHsKPiAtCXN0cnVjdCBpbm9kZSAqaW5vZGUg
PSBwYWdlLT5tYXBwaW5nLT5ob3N0Owo+IC0JcGdvZmZfdCBpbmRleCA9IHBhZ2UtPmluZGV4Owo+
ICsJc3RydWN0IGlub2RlICppbm9kZSA9IGZvbGlvLT5tYXBwaW5nLT5ob3N0Owo+ICsJcGdvZmZf
dCBpbmRleCA9IGZvbGlvLT5pbmRleDsKPiAgIAlzdHJ1Y3QgZG5vZGVfb2ZfZGF0YSBkbjsKPiAg
IAlzdHJ1Y3QgcGFnZSAqaXBhZ2U7Cj4gICAJYm9vbCBsb2NrZWQgPSBmYWxzZTsKPiBAQCAtMzQx
OSwxMyArMzQxOSwxMyBAQCBzdGF0aWMgaW50IHByZXBhcmVfd3JpdGVfYmVnaW4oc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpLAo+ICAgCj4gICAJaWYgKGYyZnNfaGFzX2lubGluZV9kYXRhKGlub2Rl
KSkgewo+ICAgCQlpZiAocG9zICsgbGVuIDw9IE1BWF9JTkxJTkVfREFUQShpbm9kZSkpIHsKPiAt
CQkJZjJmc19kb19yZWFkX2lubGluZV9kYXRhKHBhZ2VfZm9saW8ocGFnZSksIGlwYWdlKTsKPiAr
CQkJZjJmc19kb19yZWFkX2lubGluZV9kYXRhKGZvbGlvLCBpcGFnZSk7Cj4gICAJCQlzZXRfaW5v
ZGVfZmxhZyhpbm9kZSwgRklfREFUQV9FWElTVCk7Cj4gICAJCQlpZiAoaW5vZGUtPmlfbmxpbmsp
Cj4gICAJCQkJc2V0X3BhZ2VfcHJpdmF0ZV9pbmxpbmUoaXBhZ2UpOwo+ICAgCQkJZ290byBvdXQ7
Cj4gICAJCX0KPiAtCQllcnIgPSBmMmZzX2NvbnZlcnRfaW5saW5lX3BhZ2UoJmRuLCBwYWdlKTsK
PiArCQllcnIgPSBmMmZzX2NvbnZlcnRfaW5saW5lX3BhZ2UoJmRuLCBmb2xpb19wYWdlKGZvbGlv
LCAwKSk7Cj4gICAJCWlmIChlcnIgfHwgZG4uZGF0YV9ibGthZGRyICE9IE5VTExfQUREUikKPiAg
IAkJCWdvdG8gb3V0Owo+ICAgCX0KPiBAQCAtMzUxOCwxMiArMzUxOCwxMiBAQCBzdGF0aWMgaW50
IF9fcmVzZXJ2ZV9kYXRhX2Jsb2NrKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHBnb2ZmX3QgaW5kZXgs
Cj4gICB9Cj4gICAKPiAgIHN0YXRpYyBpbnQgcHJlcGFyZV9hdG9taWNfd3JpdGVfYmVnaW4oc3Ry
dWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+IC0JCQlzdHJ1Y3QgcGFnZSAqcGFnZSwgbG9mZl90IHBv
cywgdW5zaWduZWQgaW50IGxlbiwKPiArCQkJc3RydWN0IGZvbGlvICpmb2xpbywgbG9mZl90IHBv
cywgdW5zaWduZWQgaW50IGxlbiwKPiAgIAkJCWJsb2NrX3QgKmJsa19hZGRyLCBib29sICpub2Rl
X2NoYW5nZWQsIGJvb2wgKnVzZV9jb3cpCj4gICB7Cj4gLQlzdHJ1Y3QgaW5vZGUgKmlub2RlID0g
cGFnZS0+bWFwcGluZy0+aG9zdDsKPiArCXN0cnVjdCBpbm9kZSAqaW5vZGUgPSBmb2xpby0+bWFw
cGluZy0+aG9zdDsKPiAgIAlzdHJ1Y3QgaW5vZGUgKmNvd19pbm9kZSA9IEYyRlNfSShpbm9kZSkt
PmNvd19pbm9kZTsKPiAtCXBnb2ZmX3QgaW5kZXggPSBwYWdlLT5pbmRleDsKPiArCXBnb2ZmX3Qg
aW5kZXggPSBmb2xpby0+aW5kZXg7Cj4gICAJaW50IGVyciA9IDA7Cj4gICAJYmxvY2tfdCBvcmlf
YmxrX2FkZHIgPSBOVUxMX0FERFI7Cj4gICAKPiBAQCAtMzU2Niw2ICszNTY2LDcgQEAgc3RhdGlj
IGludCBmMmZzX3dyaXRlX2JlZ2luKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3QgYWRkcmVzc19z
cGFjZSAqbWFwcGluZywKPiAgIAlzdHJ1Y3QgaW5vZGUgKmlub2RlID0gbWFwcGluZy0+aG9zdDsK
PiAgIAlzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkgPSBGMkZTX0lfU0IoaW5vZGUpOwo+ICAgCXN0
cnVjdCBwYWdlICpwYWdlID0gTlVMTDsKPiArCXN0cnVjdCBmb2xpbyAqZm9saW87Cj4gICAJcGdv
ZmZfdCBpbmRleCA9ICgodW5zaWduZWQgbG9uZyBsb25nKSBwb3MpID4+IFBBR0VfU0hJRlQ7Cj4g
ICAJYm9vbCBuZWVkX2JhbGFuY2UgPSBmYWxzZTsKPiAgIAlib29sIHVzZV9jb3cgPSBmYWxzZTsK
PiBAQCAtMzYyNSwyMiArMzYyNiwyMyBAQCBzdGF0aWMgaW50IGYyZnNfd3JpdGVfYmVnaW4oc3Ry
dWN0IGZpbGUgKmZpbGUsIHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLAo+ICAgCS8qIFRP
RE86IGNsdXN0ZXIgY2FuIGJlIGNvbXByZXNzZWQgZHVlIHRvIHJhY2Ugd2l0aCAud3JpdGVwYWdl
ICovCj4gICAKPiAgIAkqcGFnZXAgPSBwYWdlOwo+ICsJZm9saW8gPSBwYWdlX2ZvbGlvKHBhZ2Up
Owo+ICAgCj4gICAJaWYgKGYyZnNfaXNfYXRvbWljX2ZpbGUoaW5vZGUpKQo+IC0JCWVyciA9IHBy
ZXBhcmVfYXRvbWljX3dyaXRlX2JlZ2luKHNiaSwgcGFnZSwgcG9zLCBsZW4sCj4gKwkJZXJyID0g
cHJlcGFyZV9hdG9taWNfd3JpdGVfYmVnaW4oc2JpLCBmb2xpbywgcG9zLCBsZW4sCj4gICAJCQkJ
CSZibGthZGRyLCAmbmVlZF9iYWxhbmNlLCAmdXNlX2Nvdyk7Cj4gICAJZWxzZQo+IC0JCWVyciA9
IHByZXBhcmVfd3JpdGVfYmVnaW4oc2JpLCBwYWdlLCBwb3MsIGxlbiwKPiArCQllcnIgPSBwcmVw
YXJlX3dyaXRlX2JlZ2luKHNiaSwgZm9saW8sIHBvcywgbGVuLAo+ICAgCQkJCQkmYmxrYWRkciwg
Jm5lZWRfYmFsYW5jZSk7Cj4gICAJaWYgKGVycikKPiAgIAkJZ290byBmYWlsOwo+ICAgCj4gICAJ
aWYgKG5lZWRfYmFsYW5jZSAmJiAhSVNfTk9RVU9UQShpbm9kZSkgJiYKPiAgIAkJCWhhc19ub3Rf
ZW5vdWdoX2ZyZWVfc2VjcyhzYmksIDAsIDApKSB7Cj4gLQkJdW5sb2NrX3BhZ2UocGFnZSk7Cj4g
KwkJZm9saW9fdW5sb2NrKGZvbGlvKTsKPiAgIAkJZjJmc19iYWxhbmNlX2ZzKHNiaSwgdHJ1ZSk7
Cj4gLQkJbG9ja19wYWdlKHBhZ2UpOwo+IC0JCWlmIChwYWdlLT5tYXBwaW5nICE9IG1hcHBpbmcp
IHsKPiArCQlmb2xpb19sb2NrKGZvbGlvKTsKPiArCQlpZiAoZm9saW8tPm1hcHBpbmcgIT0gbWFw
cGluZykgewo+ICAgCQkJLyogVGhlIHBhZ2UgZ290IHRydW5jYXRlZCBmcm9tIHVuZGVyIHVzICov
Cj4gICAJCQlmMmZzX3B1dF9wYWdlKHBhZ2UsIDEpOwo+ICAgCQkJZ290byByZXBlYXQ7Cj4gQEAg
LTM2NDksMTggKzM2NTEsMTggQEAgc3RhdGljIGludCBmMmZzX3dyaXRlX2JlZ2luKHN0cnVjdCBm
aWxlICpmaWxlLCBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPiAgIAo+ICAgCWYyZnNf
d2FpdF9vbl9wYWdlX3dyaXRlYmFjayhwYWdlLCBEQVRBLCBmYWxzZSwgdHJ1ZSk7Cj4gICAKPiAt
CWlmIChsZW4gPT0gUEFHRV9TSVpFIHx8IFBhZ2VVcHRvZGF0ZShwYWdlKSkKPiArCWlmIChsZW4g
PT0gUEFHRV9TSVpFIHx8IGZvbGlvX3Rlc3RfdXB0b2RhdGUoZm9saW8pKQo+ICAgCQlyZXR1cm4g
MDsKPiAgIAo+ICAgCWlmICghKHBvcyAmIChQQUdFX1NJWkUgLSAxKSkgJiYgKHBvcyArIGxlbikg
Pj0gaV9zaXplX3JlYWQoaW5vZGUpICYmCj4gICAJICAgICFmMmZzX3Zlcml0eV9pbl9wcm9ncmVz
cyhpbm9kZSkpIHsKPiAtCQl6ZXJvX3VzZXJfc2VnbWVudChwYWdlLCBsZW4sIFBBR0VfU0laRSk7
Cj4gKwkJZm9saW9femVyb19zZWdtZW50KGZvbGlvLCBsZW4sIGZvbGlvX3NpemUoZm9saW8pKTsK
PiAgIAkJcmV0dXJuIDA7Cj4gICAJfQo+ICAgCj4gICAJaWYgKGJsa2FkZHIgPT0gTkVXX0FERFIp
IHsKPiAtCQl6ZXJvX3VzZXJfc2VnbWVudChwYWdlLCAwLCBQQUdFX1NJWkUpOwo+IC0JCVNldFBh
Z2VVcHRvZGF0ZShwYWdlKTsKPiArCQlmb2xpb196ZXJvX3NlZ21lbnQoZm9saW8sIDAsIGZvbGlv
X3NpemUoZm9saW8pKTsKPiArCQlmb2xpb19tYXJrX3VwdG9kYXRlKGZvbGlvKTsKPiAgIAl9IGVs
c2Ugewo+ICAgCQlpZiAoIWYyZnNfaXNfdmFsaWRfYmxrYWRkcihzYmksIGJsa2FkZHIsCj4gICAJ
CQkJREFUQV9HRU5FUklDX0VOSEFOQ0VfUkVBRCkpIHsKPiBAQCAtMzY2OSwxNiArMzY3MSwxNiBA
QCBzdGF0aWMgaW50IGYyZnNfd3JpdGVfYmVnaW4oc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCBh
ZGRyZXNzX3NwYWNlICptYXBwaW5nLAo+ICAgCQl9Cj4gICAJCWVyciA9IGYyZnNfc3VibWl0X3Bh
Z2VfcmVhZCh1c2VfY293ID8KPiAgIAkJCQlGMkZTX0koaW5vZGUpLT5jb3dfaW5vZGUgOiBpbm9k
ZSwKPiAtCQkJCXBhZ2VfZm9saW8ocGFnZSksIGJsa2FkZHIsIDAsIHRydWUpOwo+ICsJCQkJZm9s
aW8sIGJsa2FkZHIsIDAsIHRydWUpOwo+ICAgCQlpZiAoZXJyKQo+ICAgCQkJZ290byBmYWlsOwo+
ICAgCj4gLQkJbG9ja19wYWdlKHBhZ2UpOwo+IC0JCWlmICh1bmxpa2VseShwYWdlLT5tYXBwaW5n
ICE9IG1hcHBpbmcpKSB7Cj4gKwkJZm9saW9fbG9jayhmb2xpbyk7Cj4gKwkJaWYgKHVubGlrZWx5
KGZvbGlvLT5tYXBwaW5nICE9IG1hcHBpbmcpKSB7Cj4gICAJCQlmMmZzX3B1dF9wYWdlKHBhZ2Us
IDEpOwo+ICAgCQkJZ290byByZXBlYXQ7Cj4gICAJCX0KPiAtCQlpZiAodW5saWtlbHkoIVBhZ2VV
cHRvZGF0ZShwYWdlKSkpIHsKPiArCQlpZiAodW5saWtlbHkoIWZvbGlvX3Rlc3RfdXB0b2RhdGUo
Zm9saW8pKSkgewo+ICAgCQkJZXJyID0gLUVJTzsKPiAgIAkJCWdvdG8gZmFpbDsKPiAgIAkJfUkg
d2FudCB0byBhcHBseSB5b3VyIHBhdGNoIHNldCBmb3IgdGVzdGluZywgYnV0IHRoZXJlIGlzIGEg
Y29uZmxpY3Qgb24gCnRoZSBtYXN0ZXIgYnJhbmNoIG9mIGxpbnV4LW5leHQuIE1heWJlIGl0IGRl
cGVuZHMgb24gYSBjZXJ0YWluIApwcmUtcGF0Y2guIFBsZWFzZSBsZXQgbWUga25vdywgdGhhbmsg
eW91LgoKICAgQXBwbHlpbmc6IGYyZnM6IGNvbnZlcnQgZjJmc193cml0ZV9iZWdpbigpIHRvIHVz
ZSBmb2xpbwogICBlcnJvcjogcGF0Y2ggZmFpbGVkOiBmcy9mMmZzL2RhdGEuYzozNTY2CiAgIGVy
cm9yOiBmcy9mMmZzL2RhdGEuYzogcGF0Y2ggZG9lcyBub3QgYXBwbHkKICAgUGF0Y2ggZmFpbGVk
IGF0IDAwMDEgZjJmczogY29udmVydCBmMmZzX3dyaXRlX2JlZ2luKCkgdG8gdXNlIGZvbGlvCgpU
aGFua3MsCkxpIFpldGFvLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
