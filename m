Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4593E3E87F4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 04:17:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDdoM-0005lR-QU; Wed, 11 Aug 2021 02:17:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1mDdoL-0005lB-3r
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 02:17:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vcludcSVI4JEJGMCHEHSvh6SC7BSAr4uSGa+mGsx4LE=; b=klZG2xZt8qlAnSWj1TVu77bMyF
 axlVINXC6JvIOSiXNSjnvWqc9znHEmXyDVtePywqcEEfW+HrIZmsQqppqYw6f0xxqsDGHqjAZRqBs
 LDnICb54XiUI1PJMjMXEtO0T3ln6jDlqplxo3JND3EgSAgJk0TGRoZncJ0cP5JcwUsTg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vcludcSVI4JEJGMCHEHSvh6SC7BSAr4uSGa+mGsx4LE=; b=Nr2+zoEYMI4X13VzOi57TZiMfi
 Elu9wW8K60Ibv4YyZhv/oVNxADiCJowLYHU90BagKVfp+cRfpRJwuGTsyLbfzCwJHby/eMsQRrHyg
 ktpam46T891ZEZ/cArrSxGcpyH9oDmhnGb4QDrbzNfktnp4FuG7sB0kXUng61mdxTufk=;
Received: from mail-m17654.qiye.163.com ([59.111.176.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDdoH-0008FK-H8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 02:17:41 +0000
Received: from [172.25.44.145] (unknown [58.250.176.229])
 by mail-m17654.qiye.163.com (Hmail) with ESMTPA id 0BF8920096;
 Wed, 11 Aug 2021 10:17:29 +0800 (CST)
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210810033934.123709-1-changfengnan@vivo.com>
 <7d7b6e89-7bcb-85c3-8567-796741e0d335@kernel.org>
From: Fengnan Chang <changfengnan@vivo.com>
Message-ID: <f7ec12e5-3bba-af4f-c6b6-3193b39d74dd@vivo.com>
Date: Wed, 11 Aug 2021 10:17:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <7d7b6e89-7bcb-85c3-8567-796741e0d335@kernel.org>
Content-Language: en-US
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRpCTklWSk9PThhISBkdSk
 4aVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktITkhVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NE06TBw5CT9REyw8QjMCKkpL
 NFEKCxlVSlVKTUlDTU9DSU5LS0NNVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOS1VKTE1VSUlCWVdZCAFZQU5OSkk3Bg++
X-HM-Tid: 0a7b3300173fd9fdkuws0bf8920096
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [59.111.176.54 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.54 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1mDdoH-0008FK-H8
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

CgpPbiAyMDIxLzgvMTEgMTA6MDcsIENoYW8gWXUgd3JvdGU6Cj4gT24gMjAyMS84LzEwIDExOjM5
LCBGZW5nbmFuIENoYW5nIHdyb3RlOgo+PiBTaW5jZSBjbHVzdGVyIGlzIGJhc2ljIHVuaXQgb2Yg
Y29tcHJlc3Npb24sIG9uZSBjbHVzdGVyIGlzIGNvbXByZXNzZWQgb3IKPj4gbm90LCBzbyB3ZSBj
YW4gY2FsY3VsYXRlIHZhbGlkIGJsb2NrcyBvbmx5IGZvciBmaXJzdCBwYWdlIGluIGNsdXN0ZXIs
Cj4+IHRoZSBvdGhlciBwYWdlcyBqdXN0IHNraXAuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEZlbmdu
YW4gQ2hhbmcgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT4KPj4gLS0tCj4+IMKgIGZzL2YyZnMvY29t
cHJlc3MuYyB8wqAgMSArCj4+IMKgIGZzL2YyZnMvZGF0YS5jwqDCoMKgwqAgfCAxOSArKysrKysr
KysrKysrKy0tLS0tCj4+IMKgIGZzL2YyZnMvZjJmcy5owqDCoMKgwqAgfMKgIDEgKwo+PiDCoCAz
IGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Cj4+IGRp
ZmYgLS1naXQgYS9mcy9mMmZzL2NvbXByZXNzLmMgYi9mcy9mMmZzL2NvbXByZXNzLmMKPj4gaW5k
ZXggN2RiZmQ2OTY1Yjk3Li43MTc2OGYxNTc1MmEgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvY29t
cHJlc3MuYwo+PiArKysgYi9mcy9mMmZzL2NvbXByZXNzLmMKPj4gQEAgLTE1Miw2ICsxNTIsNyBA
QCB2b2lkIGYyZnNfZGVzdHJveV9jb21wcmVzc19jdHgoc3RydWN0IGNvbXByZXNzX2N0eCAKPj4g
KmNjLCBib29sIHJldXNlKQo+PiDCoMKgwqDCoMKgIGNjLT5ycGFnZXMgPSBOVUxMOwo+PiDCoMKg
wqDCoMKgIGNjLT5ucl9ycGFnZXMgPSAwOwo+PiDCoMKgwqDCoMKgIGNjLT5ucl9jcGFnZXMgPSAw
Owo+PiArwqDCoMKgIGNjLT5uY19jbHVzdGVyX2lkeCA9IE5VTExfQ0xVU1RFUjsKPj4gwqDCoMKg
wqDCoCBpZiAoIXJldXNlKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY2MtPmNsdXN0ZXJfaWR4ID0g
TlVMTF9DTFVTVEVSOwo+PiDCoCB9Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2Zz
L2YyZnMvZGF0YS5jCj4+IGluZGV4IGRmNWU4ZDhjNjU0ZS4uYmM1YzBkOTRhNmZhIDEwMDY0NAo+
PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+PiArKysgYi9mcy9mMmZzL2RhdGEuYwo+PiBAQCAtMjI5
NCw2ICsyMjk0LDcgQEAgc3RhdGljIGludCBmMmZzX21wYWdlX3JlYWRwYWdlcyhzdHJ1Y3QgaW5v
ZGUgCj4+ICppbm9kZSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIC5sb2dfY2x1c3Rlcl9zaXplID0g
RjJGU19JKGlub2RlKS0+aV9sb2dfY2x1c3Rlcl9zaXplLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
LmNsdXN0ZXJfc2l6ZSA9IEYyRlNfSShpbm9kZSktPmlfY2x1c3Rlcl9zaXplLAo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgLmNsdXN0ZXJfaWR4ID0gTlVMTF9DTFVTVEVSLAo+PiArwqDCoMKgwqDCoMKg
wqAgLm5jX2NsdXN0ZXJfaWR4ID0gTlVMTF9DTFVTVEVSLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
LnJwYWdlcyA9IE5VTEwsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAuY3BhZ2VzID0gTlVMTCwKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIC5ucl9ycGFnZXMgPSAwLAo+PiBAQCAtMjMzMSwxMiArMjMzMiwy
MCBAQCBzdGF0aWMgaW50IGYyZnNfbXBhZ2VfcmVhZHBhZ2VzKHN0cnVjdCBpbm9kZSAKPj4gKmlu
b2RlLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHNldF9lcnJvcl9w
YWdlOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldCA9IGYyZnNfaXNfY29tcHJlc3NlZF9jbHVzdGVyKGlub2RlLCBwYWdlLT5pbmRl
eCk7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQgPCAwKQo+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gc2V0X2Vycm9yX3BhZ2U7Cj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGVsc2UgaWYgKCFyZXQpCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZ290byByZWFkX3NpbmdsZV9wYWdlOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoY2MuY2x1c3Rlcl9pZHggPT0gTlVMTF9DTFVTVEVSKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKGNjLm5jX2NsdXN0ZXJfaWR4ICE9IE5VTExfQ0xVU1RFUikKPiAK
PiBPbmNlIGNjLm5jX2NsdXN0ZXJfaWR4IHdhcyBzZXQsIHRoaXMgY29uZGl0aW9uIHdpbGwgYWx3
YXlzIGZvcmNlIHRvIHJlYWRpbmcKPiBzaW5nbGUgcGFnZT8gZHVlIHRvICJjYy5uY19jbHVzdGVy
X2lkeCA9IE5VTExfQ0xVU1RFUjsiIHdpbGwgbmV2ZXIgYmUgCj4gY2FsbGVkLgpZZXMsIGNjLm5j
X2NsdXN0ZXJfaWR4IG9ubHkgd2lsbCBiZSBzZXQgZm9yIG5vdCBmaXJzdCBwYWdlIG9mIApub24t
Y29tcHJlc3MgY2x1c3RlciwgYW5kIGNjLm5jX2NsdXN0ZXJfaWR4ID0gTlVMTF9DTFVTVEVSOyB3
aWxsIGJlIApjYWxsZWQgZm9yIGNvbXByZXNzZWQgY2x1c3Rlci4KPiAKPiBUaGFua3MsCj4gCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHJlYWRfc2luZ2xl
X3BhZ2U7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gZjJmc19pc19j
b21wcmVzc2VkX2NsdXN0ZXIoaW5vZGUsIHBhZ2UtPmluZGV4KTsKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0IDwgMCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGdvdG8gc2V0X2Vycm9yX3BhZ2U7Cj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZWxzZSBpZiAoIXJldCkgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY2MubmNfY2x1c3Rlcl9pZHggPSBwYWdlLT5pbmRleCA+PiAKPj4g
Y2MubG9nX2NsdXN0ZXJfc2l6ZTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGdvdG8gcmVhZF9zaW5nbGVfcGFnZTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYy5uY19j
bHVzdGVyX2lkeCA9IE5VTExfQ0xVU1RFUjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBmMmZzX2luaXRfY29tcHJlc3NfY3R4
KCZjYyk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBzZXRfZXJyb3JfcGFnZTsKPj4gZGlmZiAt
LWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPj4gaW5kZXggZTk3YjRkOGM1
ZWZjLi5lOWI2ODkwYTNmMTkgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4+ICsrKyBi
L2ZzL2YyZnMvZjJmcy5oCj4+IEBAIC0xNDcxLDYgKzE0NzEsNyBAQCBzdHJ1Y3QgY29tcHJlc3Nf
ZGF0YSB7Cj4+IMKgIHN0cnVjdCBjb21wcmVzc19jdHggewo+PiDCoMKgwqDCoMKgIHN0cnVjdCBp
bm9kZSAqaW5vZGU7wqDCoMKgwqDCoMKgwqAgLyogaW5vZGUgdGhlIGNvbnRleHQgYmVsb25nIHRv
ICovCj4+IMKgwqDCoMKgwqAgcGdvZmZfdCBjbHVzdGVyX2lkeDvCoMKgwqDCoMKgwqDCoCAvKiBj
bHVzdGVyIGluZGV4IG51bWJlciAqLwo+PiArwqDCoMKgIHBnb2ZmX3QgbmNfY2x1c3Rlcl9pZHg7
wqDCoMKgwqDCoMKgwqAgLyogY2x1c3RlciBpbmRleCBudW1iZXIgZm9yIAo+PiBub24tY29tcHJl
c3NlZCBjbHVzdGVyIHVzZSovCj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGNsdXN0ZXJfc2l6
ZTvCoMKgwqAgLyogcGFnZSBjb3VudCBpbiBjbHVzdGVyICovCj4+IMKgwqDCoMKgwqAgdW5zaWdu
ZWQgaW50IGxvZ19jbHVzdGVyX3NpemU7wqDCoMKgIC8qIGxvZyBvZiBjbHVzdGVyIHNpemUgKi8K
Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgcGFnZSAqKnJwYWdlczvCoMKgwqDCoMKgwqDCoCAvKiBwYWdl
cyBzdG9yZSByYXcgZGF0YSBpbiBjbHVzdGVyICovCj4+Cj4gCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
