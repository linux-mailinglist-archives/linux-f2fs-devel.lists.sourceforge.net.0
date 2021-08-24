Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 703DF3F5657
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Aug 2021 05:01:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mIMgq-0003cK-Qu; Tue, 24 Aug 2021 03:01:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1mIMgp-0003cD-4W
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Aug 2021 03:01:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ksJ0TIWOgbgfdWiIRewtqyyCLrudfJByV7O15BFHxDc=; b=SGwZUV+9UGX8vjsVozCzollZir
 jNqrk0qlfz72tfN4YRZ3eOsCB0x5b16esKXLhQw+pluQi3ClhjrTaKu2uEkWJ/6n/hFoYrHARLD85
 hPCHM3RXCHi8YpuBbSmft5oTpdysJf/KJcMScU5Ag80OqgE1A8jdjSfJwdJSMCxhGtV0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ksJ0TIWOgbgfdWiIRewtqyyCLrudfJByV7O15BFHxDc=; b=EICeOr1nxQuKOLIih6g9THsh4S
 dZMGe+FM4lzjqZxooTDzKx8Ho6Zjw7KmDZvfnUAfV1dPlbG82yISsRA75fefD+5wxNt/ougbRxv2T
 wqchrTRwAC1QqU9lfHj/i0WYpc6nge5IKJDk/rCphSJOSoEdbE6sqYqw16HVRIDkOfUw=;
Received: from mail-m17635.qiye.163.com ([59.111.176.35])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mIMgj-00GORd-Bm
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Aug 2021 03:01:27 +0000
Received: from [172.25.44.145] (unknown [116.31.82.26])
 by mail-m17635.qiye.163.com (Hmail) with ESMTPA id 79817400422;
 Tue, 24 Aug 2021 11:01:10 +0800 (CST)
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210729122522.149960-1-changfengnan@vivo.com>
 <9b1f01f4-66ed-3976-3efb-bd5fee347681@kernel.org>
 <YRWPetjv8PqbzzF/@google.com>
 <3b339c10-f4bc-48f4-4c77-84e904dfa9cb@kernel.org>
 <996dff14-19ec-5ce7-95c8-bb6487344705@vivo.com>
 <1a727d7f-081e-c7bf-fa4e-1dc5cbcdc4a2@kernel.org>
 <bfad4789-a5a3-7879-ecaf-3812567c33a2@vivo.com>
 <069e9160-78c0-c33e-2235-715a9cf2c30e@kernel.org>
From: Fengnan Chang <changfengnan@vivo.com>
Message-ID: <002d0f4b-bbaf-26f0-378d-492a4a3683d9@vivo.com>
Date: Tue, 24 Aug 2021 11:01:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <069e9160-78c0-c33e-2235-715a9cf2c30e@kernel.org>
Content-Language: en-US
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWUJLHxpWTEoaTkkfGkJJQh
 5NVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktPT05VS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OSI6ARw5Fz9DDwgNM0oIMRBC
 IRIaCyxVSlVKTUlCTExPS0xKTk9DVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WUpKTVVISlVDSVVJTVlXWQgBWUFNQ0NINwY+
X-HM-Tid: 0a7b761ac358d991kuws79817400422
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/8/24 8:09, Chao Yu wrote: > On 2021/8/23 20:07,
 Fengnan
 Chang wrote: >> >> >> On 2021/8/20 17:41, Chao Yu wrote: >>> On 2021/8/18
 11:49, Fengnan Chang wrote: >>>> >>>> >>>> On 2021/8/13 9:36, [...] 
 Content analysis details:   (-2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [59.111.176.35 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1mIMgj-00GORd-Bm
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix missing inplace count in overwrite
 with direct io
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgpPbiAyMDIxLzgvMjQgODowOSwgQ2hhbyBZdSB3cm90ZToKPiBPbiAyMDIxLzgvMjMgMjA6MDcs
IEZlbmduYW4gQ2hhbmcgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDIwMjEvOC8yMCAxNzo0MSwgQ2hhbyBZ
dSB3cm90ZToKPj4+IE9uIDIwMjEvOC8xOCAxMTo0OSwgRmVuZ25hbiBDaGFuZyB3cm90ZToKPj4+
Pgo+Pj4+Cj4+Pj4gT24gMjAyMS84LzEzIDk6MzYsIENoYW8gWXUgd3JvdGU6Cj4+Pj4+IE9uIDIw
MjEvOC8xMyA1OjE1LCBKYWVnZXVrIEtpbSB3cm90ZToKPj4+Pj4+IE9uIDA4LzA2LCBDaGFvIFl1
IHdyb3RlOgo+Pj4+Pj4+IE9uIDIwMjEvNy8yOSAyMDoyNSwgRmVuZ25hbiBDaGFuZyB3cm90ZToK
Pj4+Pj4+Pj4gRm9yIG5vdywgb3ZlcndyaXRlIGZpbGUgd2l0aCBkaXJlY3QgaW8gdXNlIGlucGxh
Y2UgcG9saWN5LCBidXQgbm90Cj4+Pj4+Pj4+IGNvdW50ZWQsIGZpeCBpdC4KPj4+Pj4+Pgo+Pj4+
Pj4+IElNTywgTEZTL1NTUi9JUFUgc3RhdHMgaW4gZGVidWdmcyB3YXMgZm9yIGJ1ZmZlcmVkIHdy
aXRlLCBtYXliZSB3ZQo+Pj4+Pj4+IG5lZWQgdG8gYWRkIHNlcGFyYXRlZCBvbmUgZm9yIERJTy4K
Pj4+Pj4+Cj4+Pj4+PiBEbyB3ZSByZWFsbHkgbmVlZCB0byBtb25pdG9yIERJTyBzdGF0cz8KPj4+
Pj4KPj4+Pj4gU2ltaWxhciByZWFzb24gYXMgd2UgZGlkIGZvciBidWZmZXJlZCBJTz8KPj4+Pgo+
Pj4+IEZvciBub3csIExGUyAmIFNTUiBhcmUgY291bnQgaW4gRElPLCBidXQgbm90IGNvdW50IElQ
VSzCoCBJIHRoaW5rIHdlCj4+Pgo+Pj4gSSBndWVzcyBpdCB3aWxsIGFjY291bnQgSU9zIHdoaWNo
IGFyZSBmYWxsYmFja2luZyBmcm9tIERJTyB0byAKPj4+IGJ1ZmZlcmVkIElPLAo+Pj4gc28gYWxs
IERJT3MgYXJlIG5vdCBhY2NvdW50ZWQuLi4KPj4KPj4gSXQgc2VlbXMgbm90LCB0aGUgYWNjb3Vu
dCB3YXMgZG9uZSBpbgo+PiBmMmZzX2FsbG9jYXRlX2RhdGFfYmxvY2stPnN0YXRfaW5jX2Jsb2Nr
X2NvdW50LCB3aGVuIGRpcmVjdCArIGFwcGVuZAo+PiB3cml0ZSBmaWxlLCBpdCB3aWxsIGNvdW50
IERJTyB0b28sIGJlY2F1c2Ugc3RhdF9pbmNfYmxvY2tfY291bnQgZG9lc24ndAo+PiBjYXJlIGFi
b3V0IERJTyBvciBub3QuCj4gCj4gQ29ycmVjdC4KPiAKPj4KPj4gcm9vdEBrdm0teGZzdGVzdHM6
fiMgY2F0IC9zeXMva2VybmVsL2RlYnVnL2YyZnMvc3RhdHVzIHxncmVwIFNTUiAtQyAzCj4+IMKg
wqDCoCBbLS0tLS0tLS0tfC18LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LV0KPj4KPj4gSVBVOiAwIGJsb2Nrcwo+PiBTU1I6IDAgYmxvY2tzIGluIDAgc2VnbWVudHMKPj4g
TEZTOiAwIGJsb2NrcyBpbiAwIHNlZ21lbnRzCj4gCj4gT3V0cHV0IGxpa2UgdGhpcz8KPiAgwqDC
oMKgwqBidWZmZXLCoMKgwqDCoMKgwqDCoCBkaXJlY3TCoMKgwqDCoMKgwqDCoCBzZWdtZW50cwo+
IElQVTrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE4vQQo+IFNTUjoK
PiBMRlM6Cj4gCj4gVGhhbmtzLAoKSSBsaWtlIHRoaXMsIEkgd2lsbCBzZW5kIGEgbmV3IHBhdGNo
IGxhdGVyLgoKVGhhbmtzLgo+IAo+PiByb290QGt2bS14ZnN0ZXN0czovbW50IyBkZCBpZj0vZGV2
L3plcm8gb2Y9Li9uZXcgb2ZsYWc9ZGlyZWN0IGJzPTFNIAo+PiBjb3VudD0xCj4+IDErMCByZWNv
cmRzIGluCj4+IDErMCByZWNvcmRzIG91dAo+PiAxMDQ4NTc2IGJ5dGVzICgxLjAgTUIsIDEuMCBN
aUIpIGNvcGllZCwgMC4wMTYwMDggcywgNjUuNSBNQi9zCj4+IHJvb3RAa3ZtLXhmc3Rlc3RzOi9t
bnQjIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9mMmZzL3N0YXR1cyB8Z3JlcCBTU1IgLUMgMwo+PiDC
oMKgwqAgWy0tLS0tLS0tLXwtfC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS1dCj4+Cj4+IElQVTogMCBibG9ja3MKPj4gU1NSOiAwIGJsb2NrcyBpbiAwIHNlZ21lbnRzCj4+
IExGUzogMjU2IGJsb2NrcyBpbiAxIHNlZ21lbnRzCj4+Cj4+IEJERjogOTksIGF2Zy4gdmJsb2Nr
czogMjI2Cj4+Cj4+Pgo+Pj4gVGhhbmtzLAo+Pj4KPj4+PiBzaG91bGQga2VlcCBjb25zaXN0ZW5j
eS4KPj4+Pgo+Pj4+Pgo+Pj4+PiBUaGFua3MsCj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4g
SmFlZ2V1aywgdGhvdWdodHM/Cj4+Pj4+Pj4KPj4+Pj4+PiBUaGFua3MsCj4+Pj4+Pj4KPj4+Pj4+
Pj4KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRmVuZ25hbiBDaGFuZyA8Y2hhbmdmZW5nbmFuQHZp
dm8uY29tPgo+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4gwqDCoMKgwqAgZnMvZjJmcy9kYXRhLmMgfCA2
ICsrKysrKwo+Pj4+Pj4+PiDCoMKgwqDCoCBmcy9mMmZzL2YyZnMuaCB8IDIgKysKPj4+Pj4+Pj4g
wqDCoMKgwqAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPj4+Pj4+Pj4KPj4+Pj4+
Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPj4+Pj4+Pj4g
aW5kZXggZDJjZjQ4YzVhMmU0Li42MDUxMGFjZjkxZWMgMTAwNjQ0Cj4+Pj4+Pj4+IC0tLSBhL2Zz
L2YyZnMvZGF0YS5jCj4+Pj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+Pj4+Pj4+IEBAIC0x
NDc3LDYgKzE0NzcsOSBAQCBpbnQgZjJmc19tYXBfYmxvY2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUs
Cj4+Pj4+Pj4+IHN0cnVjdCBmMmZzX21hcF9ibG9ja3MgKm1hcCwKPj4+Pj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmIChmbGFnID09IEYyRlNfR0VUX0JMT0NLX0RJTykKPj4+Pj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZjJmc193YWl0X29uX2Jsb2NrX3dyaXRl
YmFja19yYW5nZShpbm9kZSwKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWFwLT5tX3BibGssIG1hcC0+bV9sZW4pOwo+Pj4+
Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFmMmZzX2xmc19tb2RlKHNiaSkgJiYgZmxhZyA9PSBG
MkZTX0dFVF9CTE9DS19ESU8gJiYKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBtYXAtPm1fbWF5X2NyZWF0ZSkKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c3RhdF9hZGRfaW5wbGFjZV9ibG9ja3Moc2JpLCBtYXAtPm1fbGVuKTsKPj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0Owo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIH0K
Pj4+Pj4+Pj4gQEAgLTE1MjYsNiArMTUyOSw5IEBAIGludCBmMmZzX21hcF9ibG9ja3Moc3RydWN0
IGlub2RlICppbm9kZSwKPj4+Pj4+Pj4gc3RydWN0IGYyZnNfbWFwX2Jsb2NrcyAqbWFwLAo+Pj4+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBibGthZGRyID0gZG4uZGF0YV9i
bGthZGRyOwo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZXRfaW5v
ZGVfZmxhZyhpbm9kZSwgRklfQVBQRU5EX1dSSVRFKTsKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIH0KPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICghY3JlYXRlICYmICFmMmZz
X2xmc19tb2RlKHNiaSkgJiYgZmxhZyA9PQo+Pj4+Pj4+PiBGMkZTX0dFVF9CTE9DS19ESU8gJiYK
Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtYXAtPm1fbWF5X2NyZWF0
ZSkKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdF9pbmNfaW5wbGFjZV9ibG9j
a3Moc2JpKTsKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCB9IGVsc2Ugewo+Pj4+Pj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGNyZWF0ZSkgewo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAodW5saWtlbHkoZjJmc19jcF9lcnJvcihzYmkpKSkgewo+
Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+Pj4+
Pj4+PiBpbmRleCA4NjdmMmM1ZDk1NTkuLjNhOWRmMjhlNmZkNyAxMDA2NDQKPj4+Pj4+Pj4gLS0t
IGEvZnMvZjJmcy9mMmZzLmgKPj4+Pj4+Pj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPj4+Pj4+Pj4g
QEAgLTM4MDQsNiArMzgwNCw4IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IGYyZnNfc3RhdF9pbmZv
Cj4+Pj4+Pj4+ICpGMkZTX1NUQVQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+Pj4+Pj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKChzYmkpLT5ibG9ja19jb3VudFsoY3Vyc2VnKS0+YWxs
b2NfdHlwZV0rKykKPj4+Pj4+Pj4gwqDCoMKgwqAgI2RlZmluZSBzdGF0X2luY19pbnBsYWNlX2Js
b2NrcyhzYmkpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+Pj4+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKGF0b21pY19pbmMoJihzYmkpLT5pbnBsYWNlX2Nv
dW50KSkKPj4+Pj4+Pj4gKyNkZWZpbmUgc3RhdF9hZGRfaW5wbGFjZV9ibG9ja3Moc2JpLCBjb3Vu
dCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqAgKGF0b21pY19hZGQoY291bnQsICYoc2JpKS0+aW5wbGFjZV9jb3VudCkpCj4+Pj4+Pj4+IMKg
wqDCoMKgICNkZWZpbmUgc3RhdF91cGRhdGVfbWF4X2F0b21pY193cml0ZShpbm9kZSnCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIGRvIHvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBcCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQgY3VyID0gRjJGU19J
X1NCKGlub2RlKS0+YXRvbWljX2ZpbGVzO8KgwqDCoCBcCj4+Pj4+Pj4+Cj4+Pj4+Cj4+Pgo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwK
