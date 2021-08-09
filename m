Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD30B3E3E6E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Aug 2021 05:47:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mCwFm-0001b1-61; Mon, 09 Aug 2021 03:47:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <changfengnan@vivo.com>) id 1mCwFk-0001ag-G4
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Aug 2021 03:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:To:Subject:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fPdu0VR3J1GkLD3uL6CafTvmTY+qB9CGIy5n4kniqQ0=; b=TeBZddMsxDPbQK2sJUFGthUPSL
 yPuOjeraXFp4/q/AUIxWZ+dsEKDhIxk2M67aDGw6u1NE3/r6IAk1SnK0OGHhoOIprJbaLGafRywEy
 3eFGD8Lc739qS3sWcMwQmeJ5o8Y86Ul3IOeGHWfzozemwDBCvVJoojV5OQzb2pXJcuJA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:To:Subject:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fPdu0VR3J1GkLD3uL6CafTvmTY+qB9CGIy5n4kniqQ0=; b=cCDT7R6bzOVm4XJFaIqRy5jVt2
 jbie2SBQLVR2edL64QEtGm5NpTvISaatZILF9cUAy1Dx210jLppbXW2Ql9mAiNL/Dvh16vOmeidQb
 Zv9VPN63FBm0SDjffFtBed8gGTP2vj86SjGk0vlJgZLRQVNjPQQV6+S37VDcpwrry+Cc=;
Received: from mail-m17654.qiye.163.com ([59.111.176.54])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mCwFf-00Hakf-FK
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Aug 2021 03:47:04 +0000
Received: from [172.25.44.145] (unknown [58.251.74.232])
 by mail-m17654.qiye.163.com (Hmail) with ESMTPA id AA453201A1;
 Mon,  9 Aug 2021 11:46:51 +0800 (CST)
From: Fengnan Chang <changfengnan@vivo.com>
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210722032536.150423-1-changfengnan@vivo.com>
 <b2ce8000-226e-6dfa-0052-36cb2faeaf3a@kernel.org>
 <72752bc5-c8b9-43b2-ca82-d7364238649e@vivo.com>
 <1c45e327-00f4-1cc8-b168-9a7b571ba47a@kernel.org>
Message-ID: <a8412e91-e43c-6801-b45c-52d390921b17@vivo.com>
Date: Mon, 9 Aug 2021 11:46:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1c45e327-00f4-1cc8-b168-9a7b571ba47a@kernel.org>
Content-Language: en-US
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRofGE1WTUhKQh1OHk8ZTk
 sZVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ME06CBw6Tz8DAyg#NygqQy4R
 Nw0aCglVSlVKTUlDT0NLQ0pJSUhJVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOSlVMT1VJSElZV1kIAVlBT0lOSDcG
X-HM-Tid: 0a7b2905330ed9fdkuwsaa453201a1
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [59.111.176.54 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.54 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -1.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mCwFf-00Hakf-FK
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: compress: avoid duplicate counting
 of valid blocks when read compressed file
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

SGkgY2hhbzoKICAgIFNpbmNlIGNjLmNsdXN0ZXJfaWR4IG9ubHkgd2lsbCBiZSBzZXQgaW4gZjJm
c19jb21wcmVzc19jdHhfYWRkX3BhZ2UsIApzbyBmb3Igbm9uLWNvbXByZXNzZWQgY2x1c3Rlciwg
Y2MuY2x1c3Rlcl9pZHggc2hvdWxkIGFsd2F5cyBiZSBOVUxMLiBpdCAKbWVhbnMgdGhhdCB0aGUg
aGFuZGxpbmcgcHJvY2VzcyBvZiBub24tY29tcHJlc3NlZCBjbHVzdGVyIGlzIHNhbWUgYXMgb2xk
ZXIuCgpPbiAyMDIxLzgvNiA4OjU3LCBDaGFvIFl1IHdyb3RlOgo+IE9uIDIwMjEvNy8yMyAxMTox
OCwgRmVuZ25hbiBDaGFuZyB3cm90ZToKPj4gZjJmc19yZWFkX211bHRpX3BhZ2VzIHdpbGwgaGFu
ZGxl77yMYWxsIHRydW5jYXRlIHBhZ2Ugd2lsbCBiZSB6ZXJvIG91dCwKPj4gV2hldGhlciBwYXJ0
aWFsIG9yIGFsbCBwYWdlIGluIGNsdXN0ZXIuCj4+Cj4+Cj4+IE9uIDIwMjEvNy8yMiAyMTo0Nywg
Q2hhbyBZdSB3cm90ZToKPj4+IE9uIDIwMjEvNy8yMiAxMToyNSwgRmVuZ25hbiBDaGFuZyB3cm90
ZToKPj4+PiBTaW5jZSBjbHVzdGVyIGlzIGJhc2ljIHVuaXQgb2YgY29tcHJlc3Npb24sIG9uZSBj
bHVzdGVyIGlzIAo+Pj4+IGNvbXByZXNzZWQgb3IKPj4+PiBub3QsIHNvIHdlIGNhbiBjYWxjdWxh
dGUgdmFsaWQgYmxvY2tzIG9ubHkgZm9yIGZpcnN0IHBhZ2UgaW4gCj4+Pj4gY2x1c3RlciwgdGhl
Cj4+Pj4gb3RoZXIgcGFnZXMganVzdCBza2lwLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogRmVu
Z25hbiBDaGFuZyA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPgo+Pj4+IC0tLQo+Pj4+IMKgwqAgZnMv
ZjJmcy9kYXRhLmMgfCAxMyArKysrKysrLS0tLS0tCj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPj4+PiBpbmRleCBkMmNmNDhjNWEyZTQuLmEw
MDk5ZDgzMjlmMCAxMDA2NDQKPj4+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+Pj4+ICsrKyBiL2Zz
L2YyZnMvZGF0YS5jCj4+Pj4gQEAgLTIzMDQsMTIgKzIzMDQsMTMgQEAgc3RhdGljIGludCBmMmZz
X21wYWdlX3JlYWRwYWdlcyhzdHJ1Y3QgaW5vZGUKPj4+PiAqaW5vZGUsCj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBzZXRfZXJyb3JfcGFnZTsKPj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZXQgPSBmMmZzX2lzX2NvbXByZXNzZWRfY2x1c3Rlcihpbm9kZSwgcGFnZS0+aW5kZXgpOwo+
Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQgPCAwKQo+Pj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBzZXRfZXJyb3JfcGFnZTsKPj4+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBlbHNlIGlmICghcmV0KQo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZ290byByZWFkX3NpbmdsZV9wYWdlOwo+Pj4KPj4+IEhvdyBhYm91dCB0cnVuY2F0
aW9uIHJhY2VzIHdpdGggcmVhZD8KPiAKPiBMb29rIGludG8gdGhpcyBhZ2FpbiwgaXQgbG9va3Mg
ZmluZSwgdHJ1bmNhdGlvbiB0cmllcyB0byBncmFiIGFsbCBwYWdlcyAKPiBsb2NrCj4gb2YgY2x1
c3RlciwgYnV0IHJlYWRhaGVhZCBoYXMgYWxyZWFkeSBoZWxkIHNvbWUvYWxsIG9mIHRoZW0sIHNv
IHRoZXJlIGlzIG5vCj4gc3VjaCByYWNlIGNvbmRpdGlvbi4KPiAKPiBTbyBjb21wcmVzc2VkIGNs
dXN0ZXIgY2FzZSBsb29rcyBmaW5lIHRvIG1lLCBidXQgd2Ugc3RpbGwgbmVlZCB0byBjYWxsCj4g
ZjJmc19pc19jb21wcmVzc2VkX2NsdXN0ZXIoKSBldmVyeSB0aW1lIGZvciBub24tY29tcHJlc3Nl
ZCBjbHVzdGVyLCBjb3VsZAo+IHlvdSBwbGVhc2UgY2hlY2sgdGhhdCBhcyB3ZWxsPwo+IAo+IFRo
YW5rcywKPiAKPj4+Cj4+PiBUaGFua3MsCj4+Pgo+Pj4+IC0KPj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAoY2MuY2x1c3Rlcl9pZHggPT0gTlVMTF9DTFVTVEVSKSB7Cj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBmMmZzX2lzX2NvbXByZXNzZWRfY2x1c3Rl
cihpbm9kZSwgcGFnZS0+aW5kZXgpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaWYgKHJldCA8IDApCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGdvdG8gc2V0X2Vycm9yX3BhZ2U7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBlbHNlIGlmICghcmV0KQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBnb3RvIHJlYWRfc2luZ2xlX3BhZ2U7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gZjJmc19pbml0X2Nv
bXByZXNzX2N0eCgmY2MpOwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJl
dCkKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBzZXRfZXJy
b3JfcGFnZTsKPj4+Pgo+Pj4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
