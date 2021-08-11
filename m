Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A3E3E8806
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 04:32:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDe2g-0000Ol-Ug; Wed, 11 Aug 2021 02:32:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1mDe2V-0000Ni-E1
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 02:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nfvMibR6M6WaYBjlil2uuZw9N8IIFumYg5hPgOpa8aU=; b=iXNAVq39gy5w3ge1NVkxuMCAyf
 uQKnWIZDr6KOLRXQgLugEGXwF+n0qLJUJxKsnkM6pDBNG4gZ8ynjyYWPbMPB4GYm/jZVidm/EDTnf
 /5AWrHFGc3G41ZcAZ46pebO6uCeCKT6RtYYzBBL9LlPuOBREYd8bei1Nps6w2fTaE/Ck=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nfvMibR6M6WaYBjlil2uuZw9N8IIFumYg5hPgOpa8aU=; b=eIv1wbPrLk749uQ5CGwyrSvV6v
 CY7G+Hdwwkez1xrrwpB1vxIP4x4FzZSVfEjp9RpNDZgpPe2szukLWfAPCSCbNiykjUeSzuE05Dfj6
 q3l+ae76M+pm6HmjBGYVpKw88Ys+P9MDWUt33VdzKG0JBgPOasYJQyjddQoBfjcsdqUU=;
Received: from mail-m17654.qiye.163.com ([59.111.176.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDe2R-0000XP-Q7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 02:32:19 +0000
Received: from [172.25.44.145] (unknown [58.250.176.229])
 by mail-m17654.qiye.163.com (Hmail) with ESMTPA id A123F200B7;
 Wed, 11 Aug 2021 10:32:05 +0800 (CST)
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210810033934.123709-1-changfengnan@vivo.com>
 <7d7b6e89-7bcb-85c3-8567-796741e0d335@kernel.org>
 <f7ec12e5-3bba-af4f-c6b6-3193b39d74dd@vivo.com>
 <3fbf4652-3263-29cc-0a9f-9bdd157d0548@kernel.org>
From: Fengnan Chang <changfengnan@vivo.com>
Message-ID: <c37b8c35-e380-cfc8-e210-8d4b767e16ad@vivo.com>
Date: Wed, 11 Aug 2021 10:32:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <3fbf4652-3263-29cc-0a9f-9bdd157d0548@kernel.org>
Content-Language: en-US
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWUIYQkxWH0hCGU9LTk5LTE
 gfVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ORQ6Hxw4Nz8CEyMKDDhITkg8
 FDoaChpVSlVKTUlDTU9CSklNSUpCVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOS1VKTE1VSUlCWVdZCAFZQU1ISk43Bg++
X-HM-Tid: 0a7b330d7799d9fdkuwsa123f200b7
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.54 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [59.111.176.54 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1mDe2R-0000XP-Q7
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: avoid duplicate counting of
 valid blocks when read compressed file
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgpPbiAyMDIxLzgvMTEgMTA6MjksIENoYW8gWXUgd3JvdGU6Cj4gT24gMjAyMS84LzExIDEwOjE3
LCBGZW5nbmFuIENoYW5nIHdyb3RlOgo+Pgo+Pgo+PiBPbiAyMDIxLzgvMTEgMTA6MDcsIENoYW8g
WXUgd3JvdGU6Cj4+PiBPbiAyMDIxLzgvMTAgMTE6MzksIEZlbmduYW4gQ2hhbmcgd3JvdGU6Cj4+
Pj4gU2luY2UgY2x1c3RlciBpcyBiYXNpYyB1bml0IG9mIGNvbXByZXNzaW9uLCBvbmUgY2x1c3Rl
ciBpcyAKPj4+PiBjb21wcmVzc2VkIG9yCj4+Pj4gbm90LCBzbyB3ZSBjYW4gY2FsY3VsYXRlIHZh
bGlkIGJsb2NrcyBvbmx5IGZvciBmaXJzdCBwYWdlIGluIGNsdXN0ZXIsCj4+Pj4gdGhlIG90aGVy
IHBhZ2VzIGp1c3Qgc2tpcC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEZlbmduYW4gQ2hhbmcg
PGNoYW5nZmVuZ25hbkB2aXZvLmNvbT4KPj4+PiAtLS0KPj4+PiDCoMKgIGZzL2YyZnMvY29tcHJl
c3MuYyB8wqAgMSArCj4+Pj4gwqDCoCBmcy9mMmZzL2RhdGEuY8KgwqDCoMKgIHwgMTkgKysrKysr
KysrKysrKystLS0tLQo+Pj4+IMKgwqAgZnMvZjJmcy9mMmZzLmjCoMKgwqDCoCB8wqAgMSArCj4+
Pj4gwqDCoCAzIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
Cj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9jb21wcmVzcy5jIGIvZnMvZjJmcy9jb21w
cmVzcy5jCj4+Pj4gaW5kZXggN2RiZmQ2OTY1Yjk3Li43MTc2OGYxNTc1MmEgMTAwNjQ0Cj4+Pj4g
LS0tIGEvZnMvZjJmcy9jb21wcmVzcy5jCj4+Pj4gKysrIGIvZnMvZjJmcy9jb21wcmVzcy5jCj4+
Pj4gQEAgLTE1Miw2ICsxNTIsNyBAQCB2b2lkIGYyZnNfZGVzdHJveV9jb21wcmVzc19jdHgoc3Ry
dWN0IGNvbXByZXNzX2N0eAo+Pj4+ICpjYywgYm9vbCByZXVzZSkKPj4+PiDCoMKgwqDCoMKgwqAg
Y2MtPnJwYWdlcyA9IE5VTEw7Cj4+Pj4gwqDCoMKgwqDCoMKgIGNjLT5ucl9ycGFnZXMgPSAwOwo+
Pj4+IMKgwqDCoMKgwqDCoCBjYy0+bnJfY3BhZ2VzID0gMDsKPj4+PiArwqDCoMKgIGNjLT5uY19j
bHVzdGVyX2lkeCA9IE5VTExfQ0xVU1RFUjsKPj4+PiDCoMKgwqDCoMKgwqAgaWYgKCFyZXVzZSkK
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYy0+Y2x1c3Rlcl9pZHggPSBOVUxMX0NMVVNURVI7
Cj4+Pj4gwqDCoCB9Cj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9k
YXRhLmMKPj4+PiBpbmRleCBkZjVlOGQ4YzY1NGUuLmJjNWMwZDk0YTZmYSAxMDA2NDQKPj4+PiAt
LS0gYS9mcy9mMmZzL2RhdGEuYwo+Pj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+Pj4gQEAgLTIy
OTQsNiArMjI5NCw3IEBAIHN0YXRpYyBpbnQgZjJmc19tcGFnZV9yZWFkcGFnZXMoc3RydWN0IGlu
b2RlCj4+Pj4gKmlub2RlLAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5sb2dfY2x1c3Rlcl9z
aXplID0gRjJGU19JKGlub2RlKS0+aV9sb2dfY2x1c3Rlcl9zaXplLAo+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC5jbHVzdGVyX3NpemUgPSBGMkZTX0koaW5vZGUpLT5pX2NsdXN0ZXJfc2l6ZSwK
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuY2x1c3Rlcl9pZHggPSBOVUxMX0NMVVNURVIsCj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIC5uY19jbHVzdGVyX2lkeCA9IE5VTExfQ0xVU1RFUiwKPj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAucnBhZ2VzID0gTlVMTCwKPj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAuY3BhZ2VzID0gTlVMTCwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAubnJfcnBhZ2Vz
ID0gMCwKPj4+PiBAQCAtMjMzMSwxMiArMjMzMiwyMCBAQCBzdGF0aWMgaW50IGYyZnNfbXBhZ2Vf
cmVhZHBhZ2VzKHN0cnVjdCBpbm9kZQo+Pj4+ICppbm9kZSwKPj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHNldF9lcnJvcl9wYWdlOwo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9
IGYyZnNfaXNfY29tcHJlc3NlZF9jbHVzdGVyKGlub2RlLCBwYWdlLT5pbmRleCk7Cj4+Pj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCA8IDApCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBnb3RvIHNldF9lcnJvcl9wYWdlOwo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGVsc2UgaWYgKCFyZXQpCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBnb3RvIHJlYWRfc2luZ2xlX3BhZ2U7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KGNjLmNsdXN0ZXJfaWR4ID09IE5VTExfQ0xVU1RFUikgewo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKGNjLm5jX2NsdXN0ZXJfaWR4ICE9IE5VTExfQ0xVU1RFUikKPj4+
Cj4+PiBPbmNlIGNjLm5jX2NsdXN0ZXJfaWR4IHdhcyBzZXQsIHRoaXMgY29uZGl0aW9uIHdpbGwg
YWx3YXlzIGZvcmNlIHRvIAo+Pj4gcmVhZGluZwo+Pj4gc2luZ2xlIHBhZ2U/IGR1ZSB0byAiY2Mu
bmNfY2x1c3Rlcl9pZHggPSBOVUxMX0NMVVNURVI7IiB3aWxsIG5ldmVyIGJlCj4+PiBjYWxsZWQu
Cj4+IFllcywgY2MubmNfY2x1c3Rlcl9pZHggb25seSB3aWxsIGJlIHNldCBmb3Igbm90IGZpcnN0
IHBhZ2Ugb2YKPj4gbm9uLWNvbXByZXNzIGNsdXN0ZXIsIGFuZCBjYy5uY19jbHVzdGVyX2lkeCA9
IE5VTExfQ0xVU1RFUjsgd2lsbCBiZQo+PiBjYWxsZWQgZm9yIGNvbXByZXNzZWQgY2x1c3Rlci4K
PiAKPiBJIG1lYW4gY2MubmNfY2x1c3Rlcl9pZHggPSBOVUxMX0NMVVNURVIgd2lsbCBuZXZlciBi
ZSBjYWxsZWQgb25jZQo+IGNjLm5jX2NsdXN0ZXJfaWR4IHdhcyBzZXQ/CgpXaGVuIGNoYW5nZSB0
byBvdGhlciBjbHVzdGVyLCB3aWxsIGNhbGwgZjJmc19kZXN0cm95X2NvbXByZXNzX2N0eCgpLCAK
Y2MubmNfY2x1c3Rlcl9pZHggPSBOVUxMX0NMVVNURVIgd2lsbCBiZSBzZXQgYWdhaW4uCgpUaGFu
a3MuCgo+IAo+IFRoYW5rcywKPiAKPj4+Cj4+PiBUaGFua3MsCj4+Pgo+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHJlYWRfc2luZ2xlX3BhZ2U7Cj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBmMmZzX2lzX2NvbXByZXNzZWRf
Y2x1c3Rlcihpbm9kZSwgcGFnZS0+aW5kZXgpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKHJldCA8IDApCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGdvdG8gc2V0X2Vycm9yX3BhZ2U7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBlbHNlIGlmICghcmV0KSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNjLm5jX2NsdXN0ZXJfaWR4ID0gcGFnZS0+aW5kZXggPj4KPj4+PiBj
Yy5sb2dfY2x1c3Rlcl9zaXplOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBnb3RvIHJlYWRfc2luZ2xlX3BhZ2U7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB9Cj4+Pj4gKwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y2MubmNfY2x1c3Rlcl9pZHggPSBOVUxMX0NMVVNURVI7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gZjJmc19pbml0
X2NvbXByZXNzX2N0eCgmY2MpOwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KHJldCkKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBzZXRf
ZXJyb3JfcGFnZTsKPj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2Yy
ZnMuaAo+Pj4+IGluZGV4IGU5N2I0ZDhjNWVmYy4uZTliNjg5MGEzZjE5IDEwMDY0NAo+Pj4+IC0t
LSBhL2ZzL2YyZnMvZjJmcy5oCj4+Pj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPj4+PiBAQCAtMTQ3
MSw2ICsxNDcxLDcgQEAgc3RydWN0IGNvbXByZXNzX2RhdGEgewo+Pj4+IMKgwqAgc3RydWN0IGNv
bXByZXNzX2N0eCB7Cj4+Pj4gwqDCoMKgwqDCoMKgIHN0cnVjdCBpbm9kZSAqaW5vZGU7wqDCoMKg
wqDCoMKgwqAgLyogaW5vZGUgdGhlIGNvbnRleHQgYmVsb25nIHRvICovCj4+Pj4gwqDCoMKgwqDC
oMKgIHBnb2ZmX3QgY2x1c3Rlcl9pZHg7wqDCoMKgwqDCoMKgwqAgLyogY2x1c3RlciBpbmRleCBu
dW1iZXIgKi8KPj4+PiArwqDCoMKgIHBnb2ZmX3QgbmNfY2x1c3Rlcl9pZHg7wqDCoMKgwqDCoMKg
wqAgLyogY2x1c3RlciBpbmRleCBudW1iZXIgZm9yCj4+Pj4gbm9uLWNvbXByZXNzZWQgY2x1c3Rl
ciB1c2UqLwo+Pj4+IMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgY2x1c3Rlcl9zaXplO8KgwqDC
oCAvKiBwYWdlIGNvdW50IGluIGNsdXN0ZXIgKi8KPj4+PiDCoMKgwqDCoMKgwqAgdW5zaWduZWQg
aW50IGxvZ19jbHVzdGVyX3NpemU7wqDCoMKgIC8qIGxvZyBvZiBjbHVzdGVyIHNpemUgKi8KPj4+
PiDCoMKgwqDCoMKgwqAgc3RydWN0IHBhZ2UgKipycGFnZXM7wqDCoMKgwqDCoMKgwqAgLyogcGFn
ZXMgc3RvcmUgcmF3IGRhdGEgaW4gCj4+Pj4gY2x1c3RlciAqLwo+Pj4+Cj4+Pgo+IAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK
