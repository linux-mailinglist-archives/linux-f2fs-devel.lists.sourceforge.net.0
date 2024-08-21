Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B5B9598D6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Aug 2024 13:01:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sgj5p-0007Uo-C3;
	Wed, 21 Aug 2024 11:01:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lizetao1@huawei.com>) id 1sgj5b-0007UY-E8
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Aug 2024 11:01:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rV41k99/QP6XTzfCorufHzBV4wkEBPMDcRzi0ycgWDw=; b=iXyfXYWr//sSnLiEx5MuahJbdB
 /pgMUQjuAL4aWFNuv65+VM1fn0vKhIpqncjq0OmpRJY78X6FmngE6PKuLn7CpS4lPBGTulYNtR3n5
 8NMMPBAFRSsqG8n2hMvR7q4134ldYsNQp5eJAlHeIvhZGK2vi5jg06ia0tOeyAO+dU+0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rV41k99/QP6XTzfCorufHzBV4wkEBPMDcRzi0ycgWDw=; b=QbSPcSiZPMCO/qbrZLEqBCGkSG
 0Ct1tIaWB7dBXXIf+JA2oKfVxRMRy4aigm+jgKZh/wRkQCtJ5URn/17C/wBQ0MeIXr4eIWIL6xs+f
 OecdWcKU3OZay4b5rtTMqTd6nDhHStzGDV0A9CD2NsCRDL2G+fQ1roNFWFvsYaQsrYBE=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sgj5Z-0004Mr-RQ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Aug 2024 11:01:18 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Wpjv01NRJz20mDW;
 Wed, 21 Aug 2024 18:56:28 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id D3A5D180019;
 Wed, 21 Aug 2024 19:01:09 +0800 (CST)
Received: from [10.67.111.176] (10.67.111.176) by
 kwepemd500012.china.huawei.com (7.221.188.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 21 Aug 2024 19:01:09 +0800
Message-ID: <ca0a1d1a-106a-432a-be01-d5b3b5d697ea@huawei.com>
Date: Wed, 21 Aug 2024 19:01:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, <jaegeuk@kernel.org>
References: <20240820145507.1372905-1-chao@kernel.org>
In-Reply-To: <20240820145507.1372905-1-chao@kernel.org>
X-Originating-IP: [10.67.111.176]
X-ClientProxiedBy: dggpeml100025.china.huawei.com (7.185.36.37) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, 在 2024/8/20 22:54, Chao Yu 写道: > Convert to use
   folio, so that we can get rid of 'page->index' to > prepare for removal of
    'index' field in structure page [1]. > > [1] https://lore.kernel.org/al [...]
    
 
 Content analysis details:   (-0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [45.249.212.190 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [45.249.212.190 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sgj5Z-0004Mr-RQ
Subject: Re: [f2fs-dev] [PATCH v3 1/9] f2fs: convert f2fs_submit_page_read()
 to use folio
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

SGksCgrlnKggMjAyNC84LzIwIDIyOjU0LCBDaGFvIFl1IOWGmemBkzoKPiBDb252ZXJ0IHRvIHVz
ZSBmb2xpbywgc28gdGhhdCB3ZSBjYW4gZ2V0IHJpZCBvZiAncGFnZS0+aW5kZXgnIHRvCj4gcHJl
cGFyZSBmb3IgcmVtb3ZhbCBvZiAnaW5kZXgnIGZpZWxkIGluIHN0cnVjdHVyZSBwYWdlIFsxXS4K
PiAKPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL1pwOGZnVVNJQkdRMVROMERAY2Fz
cGVyLmluZnJhZGVhZC5vcmcvCj4gCj4gQ2M6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRl
YWQub3JnPgo+IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiAtLS0K
PiAgIGZzL2YyZnMvZGF0YS5jIHwgMTIgKysrKysrLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9mcy9mMmZz
L2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4gaW5kZXggNGY0ZTc2YzMzNjExLi4wNjU1ZmRkZmM0
YmEgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPiArKysgYi9mcy9mMmZzL2RhdGEuYwo+
IEBAIC0xMDg2LDcgKzEwODYsNyBAQCBzdGF0aWMgc3RydWN0IGJpbyAqZjJmc19ncmFiX3JlYWRf
YmlvKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGJsb2NrX3QgYmxrYWRkciwKPiAgIH0KPiAgIAo+ICAg
LyogVGhpcyBjYW4gaGFuZGxlIGVuY3J5cHRpb24gc3R1ZmZzICovCj4gLXN0YXRpYyBpbnQgZjJm
c19zdWJtaXRfcGFnZV9yZWFkKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBwYWdlICpwYWdl
LAo+ICtzdGF0aWMgaW50IGYyZnNfc3VibWl0X3BhZ2VfcmVhZChzdHJ1Y3QgaW5vZGUgKmlub2Rl
LCBzdHJ1Y3QgZm9saW8gKmZvbGlvLAo+ICAgCQkJCSBibG9ja190IGJsa2FkZHIsIGJsa19vcGZf
dCBvcF9mbGFncywKPiAgIAkJCQkgYm9vbCBmb3Jfd3JpdGUpCj4gICB7Cj4gQEAgLTEwOTQsMTQg
KzEwOTQsMTQgQEAgc3RhdGljIGludCBmMmZzX3N1Ym1pdF9wYWdlX3JlYWQoc3RydWN0IGlub2Rl
ICppbm9kZSwgc3RydWN0IHBhZ2UgKnBhZ2UsCj4gICAJc3RydWN0IGJpbyAqYmlvOwo+ICAgCj4g
ICAJYmlvID0gZjJmc19ncmFiX3JlYWRfYmlvKGlub2RlLCBibGthZGRyLCAxLCBvcF9mbGFncywK
PiAtCQkJCQlwYWdlLT5pbmRleCwgZm9yX3dyaXRlKTsKPiArCQkJCQlmb2xpby0+aW5kZXgsIGZv
cl93cml0ZSk7Cj4gICAJaWYgKElTX0VSUihiaW8pKQo+ICAgCQlyZXR1cm4gUFRSX0VSUihiaW8p
Owo+ICAgCj4gICAJLyogd2FpdCBmb3IgR0NlZCBwYWdlIHdyaXRlYmFjayB2aWEgTUVUQV9NQVBQ
SU5HICovCj4gICAJZjJmc193YWl0X29uX2Jsb2NrX3dyaXRlYmFjayhpbm9kZSwgYmxrYWRkcik7
Cj4gICAKPiAtCWlmIChiaW9fYWRkX3BhZ2UoYmlvLCBwYWdlLCBQQUdFX1NJWkUsIDApIDwgUEFH
RV9TSVpFKSB7Cj4gKwlpZiAoIWJpb19hZGRfZm9saW8oYmlvLCBmb2xpbywgUEFHRV9TSVpFLCAw
KSkgewo+ICAgCQlpb3N0YXRfdXBkYXRlX2FuZF91bmJpbmRfY3R4KGJpbyk7Cj4gICAJCWlmIChi
aW8tPmJpX3ByaXZhdGUpCj4gICAJCQltZW1wb29sX2ZyZWUoYmlvLT5iaV9wcml2YXRlLCBiaW9f
cG9zdF9yZWFkX2N0eF9wb29sKTsKPiBAQCAtMTI2OSw3ICsxMjY5LDcgQEAgc3RydWN0IHBhZ2Ug
KmYyZnNfZ2V0X3JlYWRfZGF0YV9wYWdlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHBnb2ZmX3QgaW5k
ZXgsCj4gICAJCXJldHVybiBwYWdlOwo+ICAgCX0KPiAgIAo+IC0JZXJyID0gZjJmc19zdWJtaXRf
cGFnZV9yZWFkKGlub2RlLCBwYWdlLCBkbi5kYXRhX2Jsa2FkZHIsCj4gKwllcnIgPSBmMmZzX3N1
Ym1pdF9wYWdlX3JlYWQoaW5vZGUsIHBhZ2VfZm9saW8ocGFnZSksIGRuLmRhdGFfYmxrYWRkciwK
PiAgIAkJCQkJCW9wX2ZsYWdzLCBmb3Jfd3JpdGUpOwo+ICAgCWlmIChlcnIpCj4gICAJCWdvdG8g
cHV0X2VycjsKPiBAQCAtMzY2OCw4ICszNjY4LDggQEAgc3RhdGljIGludCBmMmZzX3dyaXRlX2Jl
Z2luKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPiAg
IAkJCWdvdG8gZmFpbDsKPiAgIAkJfQo+ICAgCQllcnIgPSBmMmZzX3N1Ym1pdF9wYWdlX3JlYWQo
dXNlX2NvdyA/Cj4gLQkJCQlGMkZTX0koaW5vZGUpLT5jb3dfaW5vZGUgOiBpbm9kZSwgcGFnZSwK
PiAtCQkJCWJsa2FkZHIsIDAsIHRydWUpOwo+ICsJCQkJRjJGU19JKGlub2RlKS0+Y293X2lub2Rl
IDogaW5vZGUsCj4gKwkJCQlwYWdlX2ZvbGlvKHBhZ2UpLCBibGthZGRyLCAwLCB0cnVlKTsKPiAg
IAkJaWYgKGVycikKPiAgIAkJCWdvdG8gZmFpbDsKPiAgIApJIGhhdmUgdGVzdGVkIHRoaXMgcGF0
Y2hzZXQgd2l0aCBmc3N0cmVzcyBhbmQgZ290IGFueSBpc3N1ZS4KClJldmlld2VkLWJ5OiBMaSBa
ZXRhbyA8bGl6ZXRhbzFAaHVhd2VpLmNvbT4KClRoYW5rcywKTGkgWmV0YW8uCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
