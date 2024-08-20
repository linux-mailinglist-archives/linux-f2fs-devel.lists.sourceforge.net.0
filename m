Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD92C957BD4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Aug 2024 05:12:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sgFIP-0004OG-KB;
	Tue, 20 Aug 2024 03:12:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sgFIO-0004O9-SH
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Aug 2024 03:12:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l8hK5mO4DeMli9JmDAfVvTiYlVo3/QCXCxP/87VU2xY=; b=RiRvlfm+yXt3Kg1BvFztH7wLAY
 edIcxlAcxN7lWACLF3b487hvA+OLy7jI8sMuxKQuATS31Q/wxxxuTOqYUYJ8Z9J3ifupZuZJg3DqU
 AALnf52HTe7YeCXs8mq6EWxPz8zyrzctt3L9vecjdfCHtWnzTK+uwpqFGMtiIOQeSG88=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l8hK5mO4DeMli9JmDAfVvTiYlVo3/QCXCxP/87VU2xY=; b=TD02KofoWDReVR/fZaDgcOzuue
 QpBPY1kmC5Ck2RauLa/fZYrtF3xpg3379Au7Z04CD769sY2i7+EsyuWQpH6n1H3fAhnw1/tCZJSJJ
 UH/rKrvrEBckXp1nV9WyCbD0NUJhGW2iiZKxKTf9YBbr9hj0NPq6q/G0/F1T1fiTbh2s=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sgFIO-00049P-Gb for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Aug 2024 03:12:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C3996CE0B30;
 Tue, 20 Aug 2024 03:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5A4C32782;
 Tue, 20 Aug 2024 03:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724123540;
 bh=QKhlxlwDATkF97MPMQ4ixIJvaRr3OUD3A0KzVY7UtcA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GiCGNBE3xLlyf1xZyuQYHVyVFWFSQoAk0fr4slWSym6noDyAOXLEp9aS/k33Mu0/6
 67hX9E4u4Yrdg/1tJjdgwus0Esmc7FKecHJ2+dDhgMP/Mp6+IX/c6sSBKn1PFAgKBn
 3daJZ6VWqOXosqrg+7NN6p4CDxPpk8n9u61ML9BeuIKR1gWXu2mb0D9nYlxA7Edbd7
 IpRfCftyUW5GHuemsKpGTKey0PSpgwgMKkmtRh8iweWeELQGWYfpMJC4hcQ9ciJhoP
 kO/O2B18zcEfSH1HWsRoCU8sBQsflrg6e6k3D8LP2tt5GByH3yes3kKk02sBXItHme
 bjG8J7oovIQmQ==
Message-ID: <3edbddee-3215-4d20-bb74-084acc7fa813@kernel.org>
Date: Tue, 20 Aug 2024 11:12:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Li Zetao <lizetao1@huawei.com>, jaegeuk@kernel.org
References: <20240819012023.3871272-1-chao@kernel.org>
 <20240819012023.3871272-2-chao@kernel.org>
 <52808e24-923d-4758-a08f-7bba87fc42b0@huawei.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <52808e24-923d-4758-a08f-7bba87fc42b0@huawei.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/8/20 11:04, Li Zetao wrote: > Hi, > > 在 2024/8/19
    9:20, Chao Yu 写道: >> Convert to use folio, so that we can get rid of
   'page->index' to >> prepare for removal of 'index' field in structu [...] 
 
 Content analysis details:   (-0.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [145.40.73.55 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                           [145.40.73.55 listed in sa-trusted.bondedsender.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sgFIO-00049P-Gb
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
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC84LzIwIDExOjA0LCBMaSBaZXRhbyB3cm90ZToKPiBIaSwKPiAKPiDlnKggMjAyNC84
LzE5IDk6MjAsIENoYW8gWXUg5YaZ6YGTOgo+PiBDb252ZXJ0IHRvIHVzZSBmb2xpbywgc28gdGhh
dCB3ZSBjYW4gZ2V0IHJpZCBvZiAncGFnZS0+aW5kZXgnIHRvCj4+IHByZXBhcmUgZm9yIHJlbW92
YWwgb2YgJ2luZGV4JyBmaWVsZCBpbiBzdHJ1Y3R1cmUgcGFnZSBbMV0uCj4+Cj4+IFsxXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvWnA4ZmdVU0lCR1ExVE4wREBjYXNwZXIuaW5mcmFkZWFk
Lm9yZy8KPj4KPj4gQ2M6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPgo+PiBT
aWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4+IC0tLQo+PiDCoCBmcy9m
MmZzL2RhdGEuYyB8IDE5ICsrKysrKysrKystLS0tLS0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9m
MmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4+IGluZGV4IDllMWFkZTEzMDYwYy4uZTExNGQ3
MzhiNmI0IDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+PiArKysgYi9mcy9mMmZzL2Rh
dGEuYwo+PiBAQCAtMzM3OCw3ICszMzc4LDcgQEAgdm9pZCBmMmZzX3dyaXRlX2ZhaWxlZChzdHJ1
Y3QgaW5vZGUgKmlub2RlLCBsb2ZmX3QgdG8pCj4+IMKgIH0KPj4gwqAgc3RhdGljIGludCBwcmVw
YXJlX3dyaXRlX2JlZ2luKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc3RydWN0IHBhZ2UgKnBhZ2UsIGxvZmZfdCBwb3MsIHVuc2lnbmVkIGxlbiwK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGZvbGlvICpmb2xpbywgbG9mZl90IHBv
cywgdW5zaWduZWQgaW50IGxlbiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmxvY2tf
dCAqYmxrX2FkZHIsIGJvb2wgKm5vZGVfY2hhbmdlZCkKPj4gwqAgewo+PiDCoMKgwqDCoMKgIHN0
cnVjdCBpbm9kZSAqaW5vZGUgPSBmb2xpby0+bWFwcGluZy0+aG9zdDsKPj4gQEAgLTM0MjUsNyAr
MzQyNSw3IEBAIHN0YXRpYyBpbnQgcHJlcGFyZV93cml0ZV9iZWdpbihzdHJ1Y3QgZjJmc19zYl9p
bmZvICpzYmksCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2V0X3BhZ2Vf
cHJpdmF0ZV9pbmxpbmUoaXBhZ2UpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3Rv
IG91dDsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gLcKgwqDCoMKgwqDCoMKgIGVyciA9IGYy
ZnNfY29udmVydF9pbmxpbmVfcGFnZSgmZG4sIHBhZ2UpOwo+PiArwqDCoMKgwqDCoMKgwqAgZXJy
ID0gZjJmc19jb252ZXJ0X2lubGluZV9wYWdlKCZkbiwgZm9saW9fcGFnZShmb2xpbywgMCkpOwo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGVyciB8fCBkbi5kYXRhX2Jsa2FkZHIgIT0gTlVMTF9B
RERSKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsKPj4gwqDCoMKgwqDC
oCB9Cj4+IEBAIC0zNjI5LDcgKzM2MjksNyBAQCBzdGF0aWMgaW50IGYyZnNfd3JpdGVfYmVnaW4o
c3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLAo+PiDCoMKg
wqDCoMKgIGZvbGlvID0gcGFnZV9mb2xpbyhwYWdlKTsKPj4gwqDCoMKgwqDCoCBpZiAoZjJmc19p
c19hdG9taWNfZmlsZShpbm9kZSkpCj4+IC3CoMKgwqDCoMKgwqDCoCBlcnIgPSBwcmVwYXJlX2F0
b21pY193cml0ZV9iZWdpbihzYmksIGZvbGlvLCBwb3MsIGxlbgo+PiArwqDCoMKgwqDCoMKgwqAg
ZXJyID0gcHJlcGFyZV9hdG9taWNfd3JpdGVfYmVnaW4oc2JpLCBmb2xpbywgcG9zLCBsZW4sCgpU
aGFua3MgZm9yIHlvdXIgcmVtaW5kZXIsIEkgcmVtb3ZlZCBjb21tYSBhZnRlciBAbGVuIGluIHBh
dGNoIDEvOCBieQptaXN0YWtlLCBsZXQgbWUgZml4IGl0LgoKVGhhbmtzLAoKPiBUaGlzIGhhcyBi
ZWVuIGNoYW5nZWQgaW4gdGhlIGZpcnN0IHBhdGNoLCBpdCBpcyByZWR1bmRhbnQgaGVyZS4KPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZibGthZGRyLCAmbmVl
ZF9iYWxhbmNlLCAmdXNlX2Nvdyk7Cj4+IMKgwqDCoMKgwqAgZWxzZQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgZXJyID0gcHJlcGFyZV93cml0ZV9iZWdpbihzYmksIGZvbGlvLCBwb3MsIGxlbiwKPj4g
QEAgLTM2OTgsNyArMzY5OCw4IEBAIHN0YXRpYyBpbnQgZjJmc193cml0ZV9lbmQoc3RydWN0IGZp
bGUgKmZpbGUsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxvZmZfdCBwb3MsIHVuc2ln
bmVkIGxlbiwgdW5zaWduZWQgY29waWVkLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
dHJ1Y3QgcGFnZSAqcGFnZSwgdm9pZCAqZnNkYXRhKQo+PiDCoCB7Cj4+IC3CoMKgwqAgc3RydWN0
IGlub2RlICppbm9kZSA9IHBhZ2UtPm1hcHBpbmctPmhvc3Q7Cj4+ICvCoMKgwqAgc3RydWN0IGZv
bGlvICpmb2xpbyA9IHBhZ2VfZm9saW8ocGFnZSk7Cj4+ICvCoMKgwqAgc3RydWN0IGlub2RlICpp
bm9kZSA9IGZvbGlvLT5tYXBwaW5nLT5ob3N0Owo+PiDCoMKgwqDCoMKgIHRyYWNlX2YyZnNfd3Jp
dGVfZW5kKGlub2RlLCBwb3MsIGxlbiwgY29waWVkKTsKPj4gQEAgLTM3MDcsMTcgKzM3MDgsMTcg
QEAgc3RhdGljIGludCBmMmZzX3dyaXRlX2VuZChzdHJ1Y3QgZmlsZSAqZmlsZSwKPj4gwqDCoMKg
wqDCoMKgICogc2hvdWxkIGJlIFBBR0VfU0laRS4gT3RoZXJ3aXNlLCB3ZSB0cmVhdCBpdCB3aXRo
IHplcm8gY29waWVkIGFuZAo+PiDCoMKgwqDCoMKgwqAgKiBsZXQgZ2VuZXJpY19wZXJmb3JtX3dy
aXRlKCkgdHJ5IHRvIGNvcHkgZGF0YSBhZ2FpbiB0aHJvdWdoIGNvcGllZD0wLgo+PiDCoMKgwqDC
oMKgwqAgKi8KPj4gLcKgwqDCoCBpZiAoIVBhZ2VVcHRvZGF0ZShwYWdlKSkgewo+PiArwqDCoMKg
IGlmICghZm9saW9fdGVzdF91cHRvZGF0ZShmb2xpbykpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IGlmICh1bmxpa2VseShjb3BpZWQgIT0gbGVuKSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY29waWVkID0gMDsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UKPj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgU2V0UGFnZVVwdG9kYXRlKHBhZ2UpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBmb2xpb19tYXJrX3VwdG9kYXRlKGZvbGlvKTsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgICNp
ZmRlZiBDT05GSUdfRjJGU19GU19DT01QUkVTU0lPTgo+PiDCoMKgwqDCoMKgIC8qIG92ZXJ3cml0
ZSBjb21wcmVzc2VkIGZpbGUgKi8KPj4gwqDCoMKgwqDCoCBpZiAoZjJmc19jb21wcmVzc2VkX2Zp
bGUoaW5vZGUpICYmIGZzZGF0YSkgewo+PiAtwqDCoMKgwqDCoMKgwqAgZjJmc19jb21wcmVzc193
cml0ZV9lbmQoaW5vZGUsIGZzZGF0YSwgcGFnZS0+aW5kZXgsIGNvcGllZCk7Cj4+ICvCoMKgwqDC
oMKgwqDCoCBmMmZzX2NvbXByZXNzX3dyaXRlX2VuZChpbm9kZSwgZnNkYXRhLCBmb2xpby0+aW5k
ZXgsIGNvcGllZCk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX3VwZGF0ZV90aW1lKEYyRlNf
SV9TQihpbm9kZSksIFJFUV9USU1FKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChwb3MgKyBj
b3BpZWQgPiBpX3NpemVfcmVhZChpbm9kZSkgJiYKPj4gQEAgLTM3MzAsMTAgKzM3MzEsMTAgQEAg
c3RhdGljIGludCBmMmZzX3dyaXRlX2VuZChzdHJ1Y3QgZmlsZSAqZmlsZSwKPj4gwqDCoMKgwqDC
oCBpZiAoIWNvcGllZCkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gdW5sb2NrX291dDsKPj4g
LcKgwqDCoCBzZXRfcGFnZV9kaXJ0eShwYWdlKTsKPj4gK8KgwqDCoCBmb2xpb19tYXJrX2RpcnR5
KGZvbGlvKTsKPj4gwqDCoMKgwqDCoCBpZiAoZjJmc19pc19hdG9taWNfZmlsZShpbm9kZSkpCj4+
IC3CoMKgwqDCoMKgwqDCoCBzZXRfcGFnZV9wcml2YXRlX2F0b21pYyhwYWdlKTsKPj4gK8KgwqDC
oMKgwqDCoMKgIHNldF9wYWdlX3ByaXZhdGVfYXRvbWljKGZvbGlvX3BhZ2UoZm9saW8sIDApKTsK
Pj4gwqDCoMKgwqDCoCBpZiAocG9zICsgY29waWVkID4gaV9zaXplX3JlYWQoaW5vZGUpICYmCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCAhZjJmc192ZXJpdHlfaW5fcHJvZ3Jlc3MoaW5vZGUpKSB7CgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwK
