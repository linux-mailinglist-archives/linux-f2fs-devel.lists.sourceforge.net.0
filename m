Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4F63E88FC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 05:47:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDfCq-0003xe-TC; Wed, 11 Aug 2021 03:47:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <changfengnan@vivo.com>) id 1mDf9C-0003oZ-5j
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 03:43:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ldiWe56qMTEj5vKDL1XfMbiXwSvhxwa/hwusXsmBghw=; b=H25y+14LNpJXR3/OVyjK8iOrDZ
 VZCHLWKci/Z8e3Nv1g5H139U5kpz2b7T8FZ1tjl3t6iMj7dQ+FMCENIgdxptWEYUhrj/zKBMuaAMi
 bJFMjxBfVxxyISv4OlDACHsFJwHJChwe5SiMciiRsHaYwTScPQzW6mNsOL7QeUgq0jFs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ldiWe56qMTEj5vKDL1XfMbiXwSvhxwa/hwusXsmBghw=; b=D6uOTVuG30NRwVO+gQqVGtyqy5
 aSYndhgOoHE2O2yszjcOqpCI7s/ynGHuqcxdNh1jTGVGsU8co1zPmsin26sWEjwN2PwlJTNvOqNQ0
 wTAiXsm+Y/HBXJJhDCtOxEuKuNS6C0+DSaZ9wmGkFivXIXfZwtTDRitv7xk3MYi8jpuM=;
Received: from mail-m17654.qiye.163.com ([59.111.176.54])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDf8C-002Ybr-TK
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 03:42:20 +0000
Received: from [172.25.44.145] (unknown [58.250.176.229])
 by mail-m17654.qiye.163.com (Hmail) with ESMTPA id 06DC520127;
 Wed, 11 Aug 2021 11:42:08 +0800 (CST)
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210810033934.123709-1-changfengnan@vivo.com>
 <7d7b6e89-7bcb-85c3-8567-796741e0d335@kernel.org>
 <f7ec12e5-3bba-af4f-c6b6-3193b39d74dd@vivo.com>
 <3fbf4652-3263-29cc-0a9f-9bdd157d0548@kernel.org>
 <c37b8c35-e380-cfc8-e210-8d4b767e16ad@vivo.com>
 <7c94e1f8-6cc0-889e-0f2d-729daa9a05eb@kernel.org>
From: Fengnan Chang <changfengnan@vivo.com>
Message-ID: <c6e30342-08d5-3927-eac8-5aa79a997665@vivo.com>
Date: Wed, 11 Aug 2021 11:42:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <7c94e1f8-6cc0-889e-0f2d-729daa9a05eb@kernel.org>
Content-Language: en-US
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWUNITU9WGB9NGBlKH0JLQ0
 8aVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktITkhVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MQg6CCo*Iz9DKSMwEgxJDAgM
 AwEwCR9VSlVKTUlDTU5ISElCTUtOVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOS1VKTE1VSUlCWVdZCAFZQUxPQ0M3Bg++
X-HM-Tid: 0a7b334d9b14d9fdkuws06dc520127
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.54 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [59.111.176.54 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1mDf8C-002Ybr-TK
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

CgpPbiAyMDIxLzgvMTEgMTA6NTAsIENoYW8gWXUgd3JvdGU6Cj4gT24gMjAyMS84LzExIDEwOjMy
LCBGZW5nbmFuIENoYW5nIHdyb3RlOgo+Pgo+Pgo+PiBPbiAyMDIxLzgvMTEgMTA6MjksIENoYW8g
WXUgd3JvdGU6Cj4+PiBPbiAyMDIxLzgvMTEgMTA6MTcsIEZlbmduYW4gQ2hhbmcgd3JvdGU6Cj4+
Pj4KPj4+Pgo+Pj4+IE9uIDIwMjEvOC8xMSAxMDowNywgQ2hhbyBZdSB3cm90ZToKPj4+Pj4gT24g
MjAyMS84LzEwIDExOjM5LCBGZW5nbmFuIENoYW5nIHdyb3RlOgo+Pj4+Pj4gU2luY2UgY2x1c3Rl
ciBpcyBiYXNpYyB1bml0IG9mIGNvbXByZXNzaW9uLCBvbmUgY2x1c3RlciBpcwo+Pj4+Pj4gY29t
cHJlc3NlZCBvcgo+Pj4+Pj4gbm90LCBzbyB3ZSBjYW4gY2FsY3VsYXRlIHZhbGlkIGJsb2NrcyBv
bmx5IGZvciBmaXJzdCBwYWdlIGluIGNsdXN0ZXIsCj4+Pj4+PiB0aGUgb3RoZXIgcGFnZXMganVz
dCBza2lwLgo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEZlbmduYW4gQ2hhbmcgPGNoYW5n
ZmVuZ25hbkB2aXZvLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gwqDCoMKgIGZzL2YyZnMvY29tcHJl
c3MuYyB8wqAgMSArCj4+Pj4+PiDCoMKgwqAgZnMvZjJmcy9kYXRhLmPCoMKgwqDCoCB8IDE5ICsr
KysrKysrKysrKysrLS0tLS0KPj4+Pj4+IMKgwqDCoCBmcy9mMmZzL2YyZnMuaMKgwqDCoMKgIHzC
oCAxICsKPj4+Pj4+IMKgwqDCoCAzIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY29tcHJlc3Mu
YyBiL2ZzL2YyZnMvY29tcHJlc3MuYwo+Pj4+Pj4gaW5kZXggN2RiZmQ2OTY1Yjk3Li43MTc2OGYx
NTc1MmEgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9mcy9mMmZzL2NvbXByZXNzLmMKPj4+Pj4+ICsrKyBi
L2ZzL2YyZnMvY29tcHJlc3MuYwo+Pj4+Pj4gQEAgLTE1Miw2ICsxNTIsNyBAQCB2b2lkIGYyZnNf
ZGVzdHJveV9jb21wcmVzc19jdHgoc3RydWN0IAo+Pj4+Pj4gY29tcHJlc3NfY3R4Cj4+Pj4+PiAq
Y2MsIGJvb2wgcmV1c2UpCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBjYy0+cnBhZ2VzID0gTlVMTDsK
Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgIGNjLT5ucl9ycGFnZXMgPSAwOwo+Pj4+Pj4gwqDCoMKgwqDC
oMKgwqAgY2MtPm5yX2NwYWdlcyA9IDA7Cj4+Pj4+PiArwqDCoMKgIGNjLT5uY19jbHVzdGVyX2lk
eCA9IE5VTExfQ0xVU1RFUjsKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgIGlmICghcmV1c2UpCj4+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNjLT5jbHVzdGVyX2lkeCA9IE5VTExfQ0xVU1RFUjsK
Pj4+Pj4+IMKgwqDCoCB9Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9m
MmZzL2RhdGEuYwo+Pj4+Pj4gaW5kZXggZGY1ZThkOGM2NTRlLi5iYzVjMGQ5NGE2ZmEgMTAwNjQ0
Cj4+Pj4+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+Pj4+Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMK
Pj4+Pj4+IEBAIC0yMjk0LDYgKzIyOTQsNyBAQCBzdGF0aWMgaW50IGYyZnNfbXBhZ2VfcmVhZHBh
Z2VzKHN0cnVjdCBpbm9kZQo+Pj4+Pj4gKmlub2RlLAo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAubG9nX2NsdXN0ZXJfc2l6ZSA9IEYyRlNfSShpbm9kZSktPmlfbG9nX2NsdXN0ZXJfc2l6
ZSwKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmNsdXN0ZXJfc2l6ZSA9IEYyRlNfSShp
bm9kZSktPmlfY2x1c3Rlcl9zaXplLAo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuY2x1
c3Rlcl9pZHggPSBOVUxMX0NMVVNURVIsCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLm5jX2NsdXN0
ZXJfaWR4ID0gTlVMTF9DTFVTVEVSLAo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucnBh
Z2VzID0gTlVMTCwKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmNwYWdlcyA9IE5VTEws
Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5ucl9ycGFnZXMgPSAwLAo+Pj4+Pj4gQEAg
LTIzMzEsMTIgKzIzMzIsMjAgQEAgc3RhdGljIGludCBmMmZzX21wYWdlX3JlYWRwYWdlcyhzdHJ1
Y3QgaW5vZGUKPj4+Pj4+ICppbm9kZSwKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gc2V0X2Vycm9yX3BhZ2U7Cj4+Pj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
ID0gZjJmc19pc19jb21wcmVzc2VkX2NsdXN0ZXIoaW5vZGUsIHBhZ2UtPmluZGV4KTsKPj4+Pj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQgPCAwKQo+Pj4+Pj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHNldF9lcnJvcl9wYWdlOwo+Pj4+Pj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZWxzZSBpZiAoIXJldCkKPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZ290byByZWFkX3NpbmdsZV9wYWdlOwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKGNjLmNsdXN0ZXJfaWR4ID09IE5VTExfQ0xVU1RFUikgewo+Pj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoY2MubmNfY2x1c3Rlcl9pZHggIT0gTlVM
TF9DTFVTVEVSKQo+Pj4+Pgo+Pj4+PiBPbmNlIGNjLm5jX2NsdXN0ZXJfaWR4IHdhcyBzZXQsIHRo
aXMgY29uZGl0aW9uIHdpbGwgYWx3YXlzIGZvcmNlIHRvCj4+Pj4+IHJlYWRpbmcKPj4+Pj4gc2lu
Z2xlIHBhZ2U/IGR1ZSB0byAiY2MubmNfY2x1c3Rlcl9pZHggPSBOVUxMX0NMVVNURVI7IiB3aWxs
IG5ldmVyIGJlCj4+Pj4+IGNhbGxlZC4KPj4+PiBZZXMsIGNjLm5jX2NsdXN0ZXJfaWR4IG9ubHkg
d2lsbCBiZSBzZXQgZm9yIG5vdCBmaXJzdCBwYWdlIG9mCj4+Pj4gbm9uLWNvbXByZXNzIGNsdXN0
ZXIsIGFuZCBjYy5uY19jbHVzdGVyX2lkeCA9IE5VTExfQ0xVU1RFUjsgd2lsbCBiZQo+Pj4+IGNh
bGxlZCBmb3IgY29tcHJlc3NlZCBjbHVzdGVyLgo+Pj4KPj4+IEkgbWVhbiBjYy5uY19jbHVzdGVy
X2lkeCA9IE5VTExfQ0xVU1RFUiB3aWxsIG5ldmVyIGJlIGNhbGxlZCBvbmNlCj4+PiBjYy5uY19j
bHVzdGVyX2lkeCB3YXMgc2V0Pwo+Pgo+PiBXaGVuIGNoYW5nZSB0byBvdGhlciBjbHVzdGVyLCB3
aWxsIGNhbGwgZjJmc19kZXN0cm95X2NvbXByZXNzX2N0eCgpLAo+PiBjYy5uY19jbHVzdGVyX2lk
eCA9IE5VTExfQ0xVU1RFUiB3aWxsIGJlIHNldCBhZ2Fpbi4KPiAKPiBIb3dldmVyLCBmMmZzX2Rl
c3Ryb3lfY29tcHJlc3NfY3R4KCkgd29uJ3QgYmUgY2FsbGVkIGFmdGVyIG5vbi1jb21wcmVzc2Vk
Cj4gY2x1c3RlciByZWFkLCBlLmcuOgo+IAo+IDEuIHJlYWQgbm9uLWNvbXByZXNzZWQgY2x1c3Rl
cgo+IDIuIHJlYWQgY29tcHJlc3NlZCBjbHVzdGVyCj4gIMKgwqAgZjJmc19kZXN0cm95X2NvbXBy
ZXNzX2N0eCgpCj4gCj4gU28gY2MubmNfY2x1c3Rlcl9pZHggd29uJ3QgYmUgcmVzZXQgaW4gYmV0
d2VlbiBzdGVwIDEgYW5kIDIuCj4gClllcywgeW91IGFyZSByaWdodCwgaXQncyBteSBmYXVsdCwg
d2hlbiB0ZXN0IGZvcmdvdCB0byBkcm9wIGNhY2hlLgptYXliZSB3ZSBzaG91bGQgY29ycmVjdAoK
aWYgKGNjLm5jX2NsdXN0ZXJfaWR4ICE9IE5VTExfQ0xVU1RFUikKCSBnb3RvIHJlYWRfc2luZ2xl
X3BhZ2U7CnRvOgppZiAoY2MubmNfY2x1c3Rlcl9pZHggIT0gTlVMTF9DTFVTVEVSICYmIGNjLm5j
X2NsdXN0ZXJfaWR4ID09IApwYWdlLT5pbmRleCA+PiBjYy5sb2dfY2x1c3Rlcl9zaXplKQoJIGdv
dG8gcmVhZF9zaW5nbGVfcGFnZTsKPiBUaGFua3MsCj4gCj4+Cj4+IFRoYW5rcy4KPj4KPj4+Cj4+
PiBUaGFua3MsCj4+Pgo+Pj4+Pgo+Pj4+PiBUaGFua3MsCj4+Pj4+Cj4+Pj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byByZWFkX3NpbmdsZV9wYWdlOwo+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBmMmZzX2lzX2NvbXByZXNz
ZWRfY2x1c3Rlcihpbm9kZSwgCj4+Pj4+PiBwYWdlLT5pbmRleCk7Cj4+Pj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQgPCAwKQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gc2V0X2Vycm9yX3BhZ2U7Cj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UgaWYgKCFyZXQpIHsKPj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYy5uY19jbHVzdGVyX2lkeCA9IHBh
Z2UtPmluZGV4ID4+Cj4+Pj4+PiBjYy5sb2dfY2x1c3Rlcl9zaXplOwo+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gcmVhZF9zaW5nbGVfcGFnZTsKPj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4gKwo+Pj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYy5uY19jbHVzdGVyX2lkeCA9IE5VTExfQ0xV
U1RFUjsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBmMmZzX2luaXRfY29tcHJlc3NfY3R4KCZjYyk7Cj4+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gc2V0X2Vycm9yX3BhZ2U7Cj4+
Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+Pj4+Pj4g
aW5kZXggZTk3YjRkOGM1ZWZjLi5lOWI2ODkwYTNmMTkgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9mcy9m
MmZzL2YyZnMuaAo+Pj4+Pj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPj4+Pj4+IEBAIC0xNDcxLDYg
KzE0NzEsNyBAQCBzdHJ1Y3QgY29tcHJlc3NfZGF0YSB7Cj4+Pj4+PiDCoMKgwqAgc3RydWN0IGNv
bXByZXNzX2N0eCB7Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgaW5vZGUgKmlub2RlO8Kg
wqDCoMKgwqDCoMKgIC8qIGlub2RlIHRoZSBjb250ZXh0IGJlbG9uZyB0byAqLwo+Pj4+Pj4gwqDC
oMKgwqDCoMKgwqAgcGdvZmZfdCBjbHVzdGVyX2lkeDvCoMKgwqDCoMKgwqDCoCAvKiBjbHVzdGVy
IGluZGV4IG51bWJlciAqLwo+Pj4+Pj4gK8KgwqDCoCBwZ29mZl90IG5jX2NsdXN0ZXJfaWR4O8Kg
wqDCoMKgwqDCoMKgIC8qIGNsdXN0ZXIgaW5kZXggbnVtYmVyIGZvcgo+Pj4+Pj4gbm9uLWNvbXBy
ZXNzZWQgY2x1c3RlciB1c2UqLwo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGNs
dXN0ZXJfc2l6ZTvCoMKgwqAgLyogcGFnZSBjb3VudCBpbiBjbHVzdGVyICovCj4+Pj4+PiDCoMKg
wqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgbG9nX2NsdXN0ZXJfc2l6ZTvCoMKgwqAgLyogbG9nIG9m
IGNsdXN0ZXIgc2l6ZSAqLwo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgc3RydWN0IHBhZ2UgKipycGFn
ZXM7wqDCoMKgwqDCoMKgwqAgLyogcGFnZXMgc3RvcmUgcmF3IGRhdGEgaW4KPj4+Pj4+IGNsdXN0
ZXIgKi8KPj4+Pj4+Cj4+Pj4+Cj4+Pgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
