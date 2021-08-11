Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D22B33E883C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 04:51:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDeKe-0002CY-B2; Wed, 11 Aug 2021 02:51:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mDeKc-0002CQ-OQ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 02:51:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XEyZbyYah+xju4mxVSntlq6H5u6Yl3NQe+XDFUCHmT0=; b=VkQQBeqO70Qrt4K6MzquIcdNt9
 t5i1MY7lJ+aCedClrYRWAA+uCRuOdSy8vQgQMWHp+IpozE0j0uQJD7MFG8h1i6GKiQKDtYWy/dTCk
 33qdogvj9+puTxYsmbYYjErurHUqBjHanoD9QDtGi3clx6pYL7vAYc5tarcqgT/EHE/A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XEyZbyYah+xju4mxVSntlq6H5u6Yl3NQe+XDFUCHmT0=; b=AucW+O1GL9Ert8g63iJxonpOEg
 yaCPcv5mRezG/ZPyZcEtRMVPuv43HQ/nO0MpyHJ6NyQaAcazAzK5xehHFspzB0p96KGByer1RDHa8
 +y4CuCNc3XYmf4uJCf9KAtSEhrgkSEq9FZLttwjMxhR2cvz44TaY4r0B/Ihyf08coUks=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDeKb-002WyE-38
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 02:51:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F5886056B;
 Wed, 11 Aug 2021 02:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628650253;
 bh=nFYQrUSZmCaqw2OfA8Inp3fOLVvSZXrJQXDweIZpwcY=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=BbbfkmQmWnf6FaUqj2fn8BDWnhTfO3PsQxHD72PAys1mgBQ8HMDs5KNFd2lEGKKlg
 BfNPt6u47QWxWILmik9Qi4FyWlVi+xSzI3V2qsnfJQEYnySy/Uyl9FrmcK0ZbZdym1
 aGp2pSY9dVSE3wCg1uEbe1sUwBOm99GeFN9f44Hzq706a+Kx2nAjlC4DXTm9kksufY
 ouGRndU2ACmkp9Tfl1siOYWh++aFTarra42cNaz18LNR34gM4SaMucf7nn5ryMchSR
 0dsYA/a2VEBOvFGQ/Erlxg6Yc6+VYFjJ0G7zIBo+PTRixLcpzcJPKKpGaQV+gWsZ77
 sY9Zkfxauq/xg==
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210810033934.123709-1-changfengnan@vivo.com>
 <7d7b6e89-7bcb-85c3-8567-796741e0d335@kernel.org>
 <f7ec12e5-3bba-af4f-c6b6-3193b39d74dd@vivo.com>
 <3fbf4652-3263-29cc-0a9f-9bdd157d0548@kernel.org>
 <c37b8c35-e380-cfc8-e210-8d4b767e16ad@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <7c94e1f8-6cc0-889e-0f2d-729daa9a05eb@kernel.org>
Date: Wed, 11 Aug 2021 10:50:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <c37b8c35-e380-cfc8-e210-8d4b767e16ad@vivo.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mDeKb-002WyE-38
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

T24gMjAyMS84LzExIDEwOjMyLCBGZW5nbmFuIENoYW5nIHdyb3RlOgo+IAo+IAo+IE9uIDIwMjEv
OC8xMSAxMDoyOSwgQ2hhbyBZdSB3cm90ZToKPj4gT24gMjAyMS84LzExIDEwOjE3LCBGZW5nbmFu
IENoYW5nIHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiAyMDIxLzgvMTEgMTA6MDcsIENoYW8gWXUgd3Jv
dGU6Cj4+Pj4gT24gMjAyMS84LzEwIDExOjM5LCBGZW5nbmFuIENoYW5nIHdyb3RlOgo+Pj4+PiBT
aW5jZSBjbHVzdGVyIGlzIGJhc2ljIHVuaXQgb2YgY29tcHJlc3Npb24sIG9uZSBjbHVzdGVyIGlz
Cj4+Pj4+IGNvbXByZXNzZWQgb3IKPj4+Pj4gbm90LCBzbyB3ZSBjYW4gY2FsY3VsYXRlIHZhbGlk
IGJsb2NrcyBvbmx5IGZvciBmaXJzdCBwYWdlIGluIGNsdXN0ZXIsCj4+Pj4+IHRoZSBvdGhlciBw
YWdlcyBqdXN0IHNraXAuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEZlbmduYW4gQ2hhbmcg
PGNoYW5nZmVuZ25hbkB2aXZvLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICDCoMKgIGZzL2YyZnMvY29t
cHJlc3MuYyB8wqAgMSArCj4+Pj4+ICDCoMKgIGZzL2YyZnMvZGF0YS5jwqDCoMKgwqAgfCAxOSAr
KysrKysrKysrKysrKy0tLS0tCj4+Pj4+ICDCoMKgIGZzL2YyZnMvZjJmcy5owqDCoMKgwqAgfMKg
IDEgKwo+Pj4+PiAgwqDCoCAzIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2NvbXByZXNzLmMgYi9m
cy9mMmZzL2NvbXByZXNzLmMKPj4+Pj4gaW5kZXggN2RiZmQ2OTY1Yjk3Li43MTc2OGYxNTc1MmEg
MTAwNjQ0Cj4+Pj4+IC0tLSBhL2ZzL2YyZnMvY29tcHJlc3MuYwo+Pj4+PiArKysgYi9mcy9mMmZz
L2NvbXByZXNzLmMKPj4+Pj4gQEAgLTE1Miw2ICsxNTIsNyBAQCB2b2lkIGYyZnNfZGVzdHJveV9j
b21wcmVzc19jdHgoc3RydWN0IGNvbXByZXNzX2N0eAo+Pj4+PiAqY2MsIGJvb2wgcmV1c2UpCj4+
Pj4+ICDCoMKgwqDCoMKgwqAgY2MtPnJwYWdlcyA9IE5VTEw7Cj4+Pj4+ICDCoMKgwqDCoMKgwqAg
Y2MtPm5yX3JwYWdlcyA9IDA7Cj4+Pj4+ICDCoMKgwqDCoMKgwqAgY2MtPm5yX2NwYWdlcyA9IDA7
Cj4+Pj4+ICvCoMKgwqAgY2MtPm5jX2NsdXN0ZXJfaWR4ID0gTlVMTF9DTFVTVEVSOwo+Pj4+PiAg
wqDCoMKgwqDCoMKgIGlmICghcmV1c2UpCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYy0+
Y2x1c3Rlcl9pZHggPSBOVUxMX0NMVVNURVI7Cj4+Pj4+ICDCoMKgIH0KPj4+Pj4gZGlmZiAtLWdp
dCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPj4+Pj4gaW5kZXggZGY1ZThkOGM2
NTRlLi5iYzVjMGQ5NGE2ZmEgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4+Pj4+
ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+Pj4+IEBAIC0yMjk0LDYgKzIyOTQsNyBAQCBzdGF0aWMg
aW50IGYyZnNfbXBhZ2VfcmVhZHBhZ2VzKHN0cnVjdCBpbm9kZQo+Pj4+PiAqaW5vZGUsCj4+Pj4+
ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCAubG9nX2NsdXN0ZXJfc2l6ZSA9IEYyRlNfSShpbm9kZSkt
PmlfbG9nX2NsdXN0ZXJfc2l6ZSwKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5jbHVzdGVy
X3NpemUgPSBGMkZTX0koaW5vZGUpLT5pX2NsdXN0ZXJfc2l6ZSwKPj4+Pj4gIMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC5jbHVzdGVyX2lkeCA9IE5VTExfQ0xVU1RFUiwKPj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIC5uY19jbHVzdGVyX2lkeCA9IE5VTExfQ0xVU1RFUiwKPj4+Pj4gIMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC5ycGFnZXMgPSBOVUxMLAo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmNwYWdl
cyA9IE5VTEwsCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCAubnJfcnBhZ2VzID0gMCwKPj4+
Pj4gQEAgLTIzMzEsMTIgKzIzMzIsMjAgQEAgc3RhdGljIGludCBmMmZzX21wYWdlX3JlYWRwYWdl
cyhzdHJ1Y3QgaW5vZGUKPj4+Pj4gKmlub2RlLAo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHNldF9lcnJvcl9wYWdlOwo+Pj4+PiAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9
IGYyZnNfaXNfY29tcHJlc3NlZF9jbHVzdGVyKGlub2RlLCBwYWdlLT5pbmRleCk7Cj4+Pj4+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQgPCAwKQo+Pj4+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGdvdG8gc2V0X2Vycm9yX3BhZ2U7Cj4+Pj4+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGVsc2UgaWYgKCFyZXQpCj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZ290byByZWFkX3NpbmdsZV9wYWdlOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBpZiAoY2MuY2x1c3Rlcl9pZHggPT0gTlVMTF9DTFVTVEVSKSB7Cj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGNjLm5jX2NsdXN0ZXJfaWR4ICE9IE5VTExfQ0xVU1RF
UikKPj4+Pgo+Pj4+IE9uY2UgY2MubmNfY2x1c3Rlcl9pZHggd2FzIHNldCwgdGhpcyBjb25kaXRp
b24gd2lsbCBhbHdheXMgZm9yY2UgdG8KPj4+PiByZWFkaW5nCj4+Pj4gc2luZ2xlIHBhZ2U/IGR1
ZSB0byAiY2MubmNfY2x1c3Rlcl9pZHggPSBOVUxMX0NMVVNURVI7IiB3aWxsIG5ldmVyIGJlCj4+
Pj4gY2FsbGVkLgo+Pj4gWWVzLCBjYy5uY19jbHVzdGVyX2lkeCBvbmx5IHdpbGwgYmUgc2V0IGZv
ciBub3QgZmlyc3QgcGFnZSBvZgo+Pj4gbm9uLWNvbXByZXNzIGNsdXN0ZXIsIGFuZCBjYy5uY19j
bHVzdGVyX2lkeCA9IE5VTExfQ0xVU1RFUjsgd2lsbCBiZQo+Pj4gY2FsbGVkIGZvciBjb21wcmVz
c2VkIGNsdXN0ZXIuCj4+Cj4+IEkgbWVhbiBjYy5uY19jbHVzdGVyX2lkeCA9IE5VTExfQ0xVU1RF
UiB3aWxsIG5ldmVyIGJlIGNhbGxlZCBvbmNlCj4+IGNjLm5jX2NsdXN0ZXJfaWR4IHdhcyBzZXQ/
Cj4gCj4gV2hlbiBjaGFuZ2UgdG8gb3RoZXIgY2x1c3Rlciwgd2lsbCBjYWxsIGYyZnNfZGVzdHJv
eV9jb21wcmVzc19jdHgoKSwKPiBjYy5uY19jbHVzdGVyX2lkeCA9IE5VTExfQ0xVU1RFUiB3aWxs
IGJlIHNldCBhZ2Fpbi4KCkhvd2V2ZXIsIGYyZnNfZGVzdHJveV9jb21wcmVzc19jdHgoKSB3b24n
dCBiZSBjYWxsZWQgYWZ0ZXIgbm9uLWNvbXByZXNzZWQKY2x1c3RlciByZWFkLCBlLmcuOgoKMS4g
cmVhZCBub24tY29tcHJlc3NlZCBjbHVzdGVyCjIuIHJlYWQgY29tcHJlc3NlZCBjbHVzdGVyCiAg
ICBmMmZzX2Rlc3Ryb3lfY29tcHJlc3NfY3R4KCkKClNvIGNjLm5jX2NsdXN0ZXJfaWR4IHdvbid0
IGJlIHJlc2V0IGluIGJldHdlZW4gc3RlcCAxIGFuZCAyLgoKVGhhbmtzLAoKPiAKPiBUaGFua3Mu
Cj4gCj4+Cj4+IFRoYW5rcywKPj4KPj4+Pgo+Pj4+IFRoYW5rcywKPj4+Pgo+Pj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byByZWFkX3NpbmdsZV9wYWdlOwo+
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IGYyZnNfaXNfY29tcHJl
c3NlZF9jbHVzdGVyKGlub2RlLCBwYWdlLT5pbmRleCk7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKHJldCA8IDApCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBnb3RvIHNldF9lcnJvcl9wYWdlOwo+Pj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UgaWYgKCFyZXQpIHsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNjLm5jX2NsdXN0ZXJfaWR4ID0gcGFnZS0+aW5kZXgg
Pj4KPj4+Pj4gY2MubG9nX2NsdXN0ZXJfc2l6ZTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gcmVhZF9zaW5nbGVfcGFnZTsKPj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjYy5uY19jbHVzdGVyX2lkeCA9IE5VTExfQ0xVU1RFUjsKPj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZXQgPSBmMmZzX2luaXRfY29tcHJlc3NfY3R4KCZjYyk7Cj4+Pj4+ICDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZ290byBzZXRfZXJyb3JfcGFnZTsKPj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2Yy
ZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPj4+Pj4gaW5kZXggZTk3YjRkOGM1ZWZjLi5lOWI2
ODkwYTNmMTkgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4+Pj4+ICsrKyBiL2Zz
L2YyZnMvZjJmcy5oCj4+Pj4+IEBAIC0xNDcxLDYgKzE0NzEsNyBAQCBzdHJ1Y3QgY29tcHJlc3Nf
ZGF0YSB7Cj4+Pj4+ICDCoMKgIHN0cnVjdCBjb21wcmVzc19jdHggewo+Pj4+PiAgwqDCoMKgwqDC
oMKgIHN0cnVjdCBpbm9kZSAqaW5vZGU7wqDCoMKgwqDCoMKgwqAgLyogaW5vZGUgdGhlIGNvbnRl
eHQgYmVsb25nIHRvICovCj4+Pj4+ICDCoMKgwqDCoMKgwqAgcGdvZmZfdCBjbHVzdGVyX2lkeDvC
oMKgwqDCoMKgwqDCoCAvKiBjbHVzdGVyIGluZGV4IG51bWJlciAqLwo+Pj4+PiArwqDCoMKgIHBn
b2ZmX3QgbmNfY2x1c3Rlcl9pZHg7wqDCoMKgwqDCoMKgwqAgLyogY2x1c3RlciBpbmRleCBudW1i
ZXIgZm9yCj4+Pj4+IG5vbi1jb21wcmVzc2VkIGNsdXN0ZXIgdXNlKi8KPj4+Pj4gIMKgwqDCoMKg
wqDCoCB1bnNpZ25lZCBpbnQgY2x1c3Rlcl9zaXplO8KgwqDCoCAvKiBwYWdlIGNvdW50IGluIGNs
dXN0ZXIgKi8KPj4+Pj4gIMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgbG9nX2NsdXN0ZXJfc2l6
ZTvCoMKgwqAgLyogbG9nIG9mIGNsdXN0ZXIgc2l6ZSAqLwo+Pj4+PiAgwqDCoMKgwqDCoMKgIHN0
cnVjdCBwYWdlICoqcnBhZ2VzO8KgwqDCoMKgwqDCoMKgIC8qIHBhZ2VzIHN0b3JlIHJhdyBkYXRh
IGluCj4+Pj4+IGNsdXN0ZXIgKi8KPj4+Pj4KPj4+Pgo+PgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
