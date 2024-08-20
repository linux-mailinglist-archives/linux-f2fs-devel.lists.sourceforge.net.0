Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B370957BBF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Aug 2024 05:05:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sgFAy-0006zD-Gi;
	Tue, 20 Aug 2024 03:04:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lizetao1@huawei.com>) id 1sgFAw-0006z7-PZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Aug 2024 03:04:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/NjW8uEolC9vsfatKG8PZgv56JHDiCECERPrlN/XsE0=; b=X79KzrRVh+pgvXg+JZEemAJ8VO
 +CB1q9c268rWyGuRB55jNuWi0Gsbcyw9kajdTnaOJwmoNKzEoyVtX1GMaKzqmTYqP0DA4BIGFVXG/
 5UvwlM05Q4/eU2LD4YAGb7/NT8FuhllyCFiR9SALUBm+r+6J7qoL7cN1S+hVG4Ur+kPo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/NjW8uEolC9vsfatKG8PZgv56JHDiCECERPrlN/XsE0=; b=BodtKY+RjIAyiOoK9lZ3W9Wrti
 SsxGtpbp6ygaTwQ4jw56NtniMNfgLDxgge29/SoRabILi6Y+tYbxkXy1F32bL3E3SbeGr5/VtbZ5t
 MjTXrRmlMd9nO8j1c1l34Pf/7DAzecGRFLYphUNrEV4tPC54dmk4+abIAE8ga6I5TAZw=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sgFAv-0003j0-AN for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Aug 2024 03:04:50 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WnvMF3YS8z1j6lf;
 Tue, 20 Aug 2024 10:59:37 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id 99D3514010C;
 Tue, 20 Aug 2024 11:04:36 +0800 (CST)
Received: from [10.67.111.176] (10.67.111.176) by
 kwepemd500012.china.huawei.com (7.221.188.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 20 Aug 2024 11:04:36 +0800
Message-ID: <52808e24-923d-4758-a08f-7bba87fc42b0@huawei.com>
Date: Tue, 20 Aug 2024 11:04:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, <jaegeuk@kernel.org>
References: <20240819012023.3871272-1-chao@kernel.org>
 <20240819012023.3871272-2-chao@kernel.org>
In-Reply-To: <20240819012023.3871272-2-chao@kernel.org>
X-Originating-IP: [10.67.111.176]
X-ClientProxiedBy: dggpeml100002.china.huawei.com (7.185.36.130) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, 在 2024/8/19 9:20, Chao Yu 写道: > Convert to use folio,
    so that we can get rid of 'page->index' to > prepare for removal of 'index'
    field in structure page [1]. > > [1] https://lore.kernel.org/all [...] 
 
 Content analysis details:   (-0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [45.249.212.191 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [45.249.212.191 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [45.249.212.191 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sgFAv-0003j0-AN
Subject: Re: [f2fs-dev] [PATCH 2/8] f2fs: convert f2fs_write_end() to use
 folio
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

SGksCgrlnKggMjAyNC84LzE5IDk6MjAsIENoYW8gWXUg5YaZ6YGTOgo+IENvbnZlcnQgdG8gdXNl
IGZvbGlvLCBzbyB0aGF0IHdlIGNhbiBnZXQgcmlkIG9mICdwYWdlLT5pbmRleCcgdG8KPiBwcmVw
YXJlIGZvciByZW1vdmFsIG9mICdpbmRleCcgZmllbGQgaW4gc3RydWN0dXJlIHBhZ2UgWzFdLgo+
IAo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvWnA4ZmdVU0lCR1ExVE4wREBjYXNw
ZXIuaW5mcmFkZWFkLm9yZy8KPiAKPiBDYzogTWF0dGhldyBXaWxjb3ggPHdpbGx5QGluZnJhZGVh
ZC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+IC0tLQo+
ICAgZnMvZjJmcy9kYXRhLmMgfCAxOSArKysrKysrKysrLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hh
bmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+IGluZGV4IDllMWFkZTEzMDYwYy4uZTEx
NGQ3MzhiNmI0IDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4gKysrIGIvZnMvZjJmcy9k
YXRhLmMKPiBAQCAtMzM3OCw3ICszMzc4LDcgQEAgdm9pZCBmMmZzX3dyaXRlX2ZhaWxlZChzdHJ1
Y3QgaW5vZGUgKmlub2RlLCBsb2ZmX3QgdG8pCj4gICB9Cj4gICAKPiAgIHN0YXRpYyBpbnQgcHJl
cGFyZV93cml0ZV9iZWdpbihzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gLQkJCXN0cnVjdCBw
YWdlICpwYWdlLCBsb2ZmX3QgcG9zLCB1bnNpZ25lZCBsZW4sCj4gKwkJCXN0cnVjdCBmb2xpbyAq
Zm9saW8sIGxvZmZfdCBwb3MsIHVuc2lnbmVkIGludCBsZW4sCj4gICAJCQlibG9ja190ICpibGtf
YWRkciwgYm9vbCAqbm9kZV9jaGFuZ2VkKQo+ICAgewo+ICAgCXN0cnVjdCBpbm9kZSAqaW5vZGUg
PSBmb2xpby0+bWFwcGluZy0+aG9zdDsKPiBAQCAtMzQyNSw3ICszNDI1LDcgQEAgc3RhdGljIGlu
dCBwcmVwYXJlX3dyaXRlX2JlZ2luKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiAgIAkJCQlz
ZXRfcGFnZV9wcml2YXRlX2lubGluZShpcGFnZSk7Cj4gICAJCQlnb3RvIG91dDsKPiAgIAkJfQo+
IC0JCWVyciA9IGYyZnNfY29udmVydF9pbmxpbmVfcGFnZSgmZG4sIHBhZ2UpOwo+ICsJCWVyciA9
IGYyZnNfY29udmVydF9pbmxpbmVfcGFnZSgmZG4sIGZvbGlvX3BhZ2UoZm9saW8sIDApKTsKPiAg
IAkJaWYgKGVyciB8fCBkbi5kYXRhX2Jsa2FkZHIgIT0gTlVMTF9BRERSKQo+ICAgCQkJZ290byBv
dXQ7Cj4gICAJfQo+IEBAIC0zNjI5LDcgKzM2MjksNyBAQCBzdGF0aWMgaW50IGYyZnNfd3JpdGVf
YmVnaW4oc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLAo+
ICAgCWZvbGlvID0gcGFnZV9mb2xpbyhwYWdlKTsKPiAgIAo+ICAgCWlmIChmMmZzX2lzX2F0b21p
Y19maWxlKGlub2RlKSkKPiAtCQllcnIgPSBwcmVwYXJlX2F0b21pY193cml0ZV9iZWdpbihzYmks
IGZvbGlvLCBwb3MsIGxlbgo+ICsJCWVyciA9IHByZXBhcmVfYXRvbWljX3dyaXRlX2JlZ2luKHNi
aSwgZm9saW8sIHBvcywgbGVuLApUaGlzIGhhcyBiZWVuIGNoYW5nZWQgaW4gdGhlIGZpcnN0IHBh
dGNoLCBpdCBpcyByZWR1bmRhbnQgaGVyZS4KPiAgIAkJCQkJJmJsa2FkZHIsICZuZWVkX2JhbGFu
Y2UsICZ1c2VfY293KTsKPiAgIAllbHNlCj4gICAJCWVyciA9IHByZXBhcmVfd3JpdGVfYmVnaW4o
c2JpLCBmb2xpbywgcG9zLCBsZW4sCj4gQEAgLTM2OTgsNyArMzY5OCw4IEBAIHN0YXRpYyBpbnQg
ZjJmc193cml0ZV9lbmQoc3RydWN0IGZpbGUgKmZpbGUsCj4gICAJCQlsb2ZmX3QgcG9zLCB1bnNp
Z25lZCBsZW4sIHVuc2lnbmVkIGNvcGllZCwKPiAgIAkJCXN0cnVjdCBwYWdlICpwYWdlLCB2b2lk
ICpmc2RhdGEpCj4gICB7Cj4gLQlzdHJ1Y3QgaW5vZGUgKmlub2RlID0gcGFnZS0+bWFwcGluZy0+
aG9zdDsKPiArCXN0cnVjdCBmb2xpbyAqZm9saW8gPSBwYWdlX2ZvbGlvKHBhZ2UpOwo+ICsJc3Ry
dWN0IGlub2RlICppbm9kZSA9IGZvbGlvLT5tYXBwaW5nLT5ob3N0Owo+ICAgCj4gICAJdHJhY2Vf
ZjJmc193cml0ZV9lbmQoaW5vZGUsIHBvcywgbGVuLCBjb3BpZWQpOwo+ICAgCj4gQEAgLTM3MDcs
MTcgKzM3MDgsMTcgQEAgc3RhdGljIGludCBmMmZzX3dyaXRlX2VuZChzdHJ1Y3QgZmlsZSAqZmls
ZSwKPiAgIAkgKiBzaG91bGQgYmUgUEFHRV9TSVpFLiBPdGhlcndpc2UsIHdlIHRyZWF0IGl0IHdp
dGggemVybyBjb3BpZWQgYW5kCj4gICAJICogbGV0IGdlbmVyaWNfcGVyZm9ybV93cml0ZSgpIHRy
eSB0byBjb3B5IGRhdGEgYWdhaW4gdGhyb3VnaCBjb3BpZWQ9MC4KPiAgIAkgKi8KPiAtCWlmICgh
UGFnZVVwdG9kYXRlKHBhZ2UpKSB7Cj4gKwlpZiAoIWZvbGlvX3Rlc3RfdXB0b2RhdGUoZm9saW8p
KSB7Cj4gICAJCWlmICh1bmxpa2VseShjb3BpZWQgIT0gbGVuKSkKPiAgIAkJCWNvcGllZCA9IDA7
Cj4gICAJCWVsc2UKPiAtCQkJU2V0UGFnZVVwdG9kYXRlKHBhZ2UpOwo+ICsJCQlmb2xpb19tYXJr
X3VwdG9kYXRlKGZvbGlvKTsKPiAgIAl9Cj4gICAKPiAgICNpZmRlZiBDT05GSUdfRjJGU19GU19D
T01QUkVTU0lPTgo+ICAgCS8qIG92ZXJ3cml0ZSBjb21wcmVzc2VkIGZpbGUgKi8KPiAgIAlpZiAo
ZjJmc19jb21wcmVzc2VkX2ZpbGUoaW5vZGUpICYmIGZzZGF0YSkgewo+IC0JCWYyZnNfY29tcHJl
c3Nfd3JpdGVfZW5kKGlub2RlLCBmc2RhdGEsIHBhZ2UtPmluZGV4LCBjb3BpZWQpOwo+ICsJCWYy
ZnNfY29tcHJlc3Nfd3JpdGVfZW5kKGlub2RlLCBmc2RhdGEsIGZvbGlvLT5pbmRleCwgY29waWVk
KTsKPiAgIAkJZjJmc191cGRhdGVfdGltZShGMkZTX0lfU0IoaW5vZGUpLCBSRVFfVElNRSk7Cj4g
ICAKPiAgIAkJaWYgKHBvcyArIGNvcGllZCA+IGlfc2l6ZV9yZWFkKGlub2RlKSAmJgo+IEBAIC0z
NzMwLDEwICszNzMxLDEwIEBAIHN0YXRpYyBpbnQgZjJmc193cml0ZV9lbmQoc3RydWN0IGZpbGUg
KmZpbGUsCj4gICAJaWYgKCFjb3BpZWQpCj4gICAJCWdvdG8gdW5sb2NrX291dDsKPiAgIAo+IC0J
c2V0X3BhZ2VfZGlydHkocGFnZSk7Cj4gKwlmb2xpb19tYXJrX2RpcnR5KGZvbGlvKTsKPiAgIAo+
ICAgCWlmIChmMmZzX2lzX2F0b21pY19maWxlKGlub2RlKSkKPiAtCQlzZXRfcGFnZV9wcml2YXRl
X2F0b21pYyhwYWdlKTsKPiArCQlzZXRfcGFnZV9wcml2YXRlX2F0b21pYyhmb2xpb19wYWdlKGZv
bGlvLCAwKSk7Cj4gICAKPiAgIAlpZiAocG9zICsgY29waWVkID4gaV9zaXplX3JlYWQoaW5vZGUp
ICYmCj4gICAJICAgICFmMmZzX3Zlcml0eV9pbl9wcm9ncmVzcyhpbm9kZSkpIHsKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
