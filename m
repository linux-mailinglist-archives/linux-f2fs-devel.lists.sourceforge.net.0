Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EA33F53FD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Aug 2021 02:09:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mIK0Z-0008WP-Q0; Tue, 24 Aug 2021 00:09:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mIK0Y-0008WC-E5
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Aug 2021 00:09:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5qEaZw8OS0Q5+3DNudSbQOQsx06X4jppS7BQUjtjJgE=; b=SvXji+gAiAL9Ms72ezh8IXpj8v
 954mHjCNeDTDhjJ+bbN2qRz56ikyA60aSk9QlY7KPoU80jdIbgS9ejW7gRCoqB/BHMLRvWJZBBhdz
 muvuC9rTS7Axc58NGqXHmnENRfykbrRtwfp2ZM5Q+MGKFU4opoCC3r74LFpuzZYZTfy0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5qEaZw8OS0Q5+3DNudSbQOQsx06X4jppS7BQUjtjJgE=; b=BqpjSIV+fL97whK0dJV3GDO31l
 zCKGHabqD1ANGZMoICaAwpLgzOoG3tblJSnsBs7UFacKgInsFtwwAapohs4uZkLMylSN+6C63ohXz
 YUWzCs3oGTYQCzEsIHDEEBvzlyxjV/KNM2MeufEGTGEZjVKpLRhifUOuOFpZzCOMw9BE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mIK0U-0002yc-Bl
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Aug 2021 00:09:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 570EB6124D;
 Tue, 24 Aug 2021 00:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629763764;
 bh=io94TVk6pzS1Y3j4chLdWoo/YVdnOfp4Bjig3qBXpOE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=dPqBQwGbEFf79pKRpXJv4bXEsHBGIbsrvi/8xAJQXfr88bjX5vTnQHQhgi6Dvzd04
 Cg4dZ8l29wiHd852xKWFWarh3hQGCesbf5lmi6uRUb9tRbY45zDAc8dtSIxG6doBtO
 mDw9oACXCa7phqkjAFk3ezGhu54NNcVv+bDKRpOZgTMLZqeyqtRo+2hZ5ygXNfnWEV
 H8ySr2iBsgxSpbpJL7WS2kjhy6xQYO7TO/fjq7gjupCguO2KEPHILVtg/IMt4De+KJ
 /ftQ7hG65iQj7sS8OtnCXnJBAndJaEMQdY3bMkbjHpWJPwiLSSFI9eJNAFRUGujlyZ
 +g3iKNT093rIA==
To: Fengnan Chang <changfengnan@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210729122522.149960-1-changfengnan@vivo.com>
 <9b1f01f4-66ed-3976-3efb-bd5fee347681@kernel.org>
 <YRWPetjv8PqbzzF/@google.com>
 <3b339c10-f4bc-48f4-4c77-84e904dfa9cb@kernel.org>
 <996dff14-19ec-5ce7-95c8-bb6487344705@vivo.com>
 <1a727d7f-081e-c7bf-fa4e-1dc5cbcdc4a2@kernel.org>
 <bfad4789-a5a3-7879-ecaf-3812567c33a2@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <069e9160-78c0-c33e-2235-715a9cf2c30e@kernel.org>
Date: Tue, 24 Aug 2021 08:09:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <bfad4789-a5a3-7879-ecaf-3812567c33a2@vivo.com>
Content-Language: en-US
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mIK0U-0002yc-Bl
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

T24gMjAyMS84LzIzIDIwOjA3LCBGZW5nbmFuIENoYW5nIHdyb3RlOgo+IAo+IAo+IE9uIDIwMjEv
OC8yMCAxNzo0MSwgQ2hhbyBZdSB3cm90ZToKPj4gT24gMjAyMS84LzE4IDExOjQ5LCBGZW5nbmFu
IENoYW5nIHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiAyMDIxLzgvMTMgOTozNiwgQ2hhbyBZdSB3cm90
ZToKPj4+PiBPbiAyMDIxLzgvMTMgNToxNSwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4+Pj4+IE9uIDA4
LzA2LCBDaGFvIFl1IHdyb3RlOgo+Pj4+Pj4gT24gMjAyMS83LzI5IDIwOjI1LCBGZW5nbmFuIENo
YW5nIHdyb3RlOgo+Pj4+Pj4+IEZvciBub3csIG92ZXJ3cml0ZSBmaWxlIHdpdGggZGlyZWN0IGlv
IHVzZSBpbnBsYWNlIHBvbGljeSwgYnV0IG5vdAo+Pj4+Pj4+IGNvdW50ZWQsIGZpeCBpdC4KPj4+
Pj4+Cj4+Pj4+PiBJTU8sIExGUy9TU1IvSVBVIHN0YXRzIGluIGRlYnVnZnMgd2FzIGZvciBidWZm
ZXJlZCB3cml0ZSwgbWF5YmUgd2UKPj4+Pj4+IG5lZWQgdG8gYWRkIHNlcGFyYXRlZCBvbmUgZm9y
IERJTy4KPj4+Pj4KPj4+Pj4gRG8gd2UgcmVhbGx5IG5lZWQgdG8gbW9uaXRvciBESU8gc3RhdHM/
Cj4+Pj4KPj4+PiBTaW1pbGFyIHJlYXNvbiBhcyB3ZSBkaWQgZm9yIGJ1ZmZlcmVkIElPPwo+Pj4K
Pj4+IEZvciBub3csIExGUyAmIFNTUiBhcmUgY291bnQgaW4gRElPLCBidXQgbm90IGNvdW50IElQ
VSzCoCBJIHRoaW5rIHdlCj4+Cj4+IEkgZ3Vlc3MgaXQgd2lsbCBhY2NvdW50IElPcyB3aGljaCBh
cmUgZmFsbGJhY2tpbmcgZnJvbSBESU8gdG8gYnVmZmVyZWQgSU8sCj4+IHNvIGFsbCBESU9zIGFy
ZSBub3QgYWNjb3VudGVkLi4uCj4gCj4gSXQgc2VlbXMgbm90LCB0aGUgYWNjb3VudCB3YXMgZG9u
ZSBpbgo+IGYyZnNfYWxsb2NhdGVfZGF0YV9ibG9jay0+c3RhdF9pbmNfYmxvY2tfY291bnQsIHdo
ZW4gZGlyZWN0ICsgYXBwZW5kCj4gd3JpdGUgZmlsZSwgaXQgd2lsbCBjb3VudCBESU8gdG9vLCBi
ZWNhdXNlIHN0YXRfaW5jX2Jsb2NrX2NvdW50IGRvZXNuJ3QKPiBjYXJlIGFib3V0IERJTyBvciBu
b3QuCgpDb3JyZWN0LgoKPiAKPiByb290QGt2bS14ZnN0ZXN0czp+IyBjYXQgL3N5cy9rZXJuZWwv
ZGVidWcvZjJmcy9zdGF0dXMgfGdyZXAgU1NSIC1DIDMKPiAgICAgWy0tLS0tLS0tLXwtfC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1dCj4gCj4gSVBVOiAwIGJsb2Nrcwo+
IFNTUjogMCBibG9ja3MgaW4gMCBzZWdtZW50cwo+IExGUzogMCBibG9ja3MgaW4gMCBzZWdtZW50
cwoKT3V0cHV0IGxpa2UgdGhpcz8KCWJ1ZmZlcgkJZGlyZWN0CQlzZWdtZW50cwpJUFU6IAkJCQkJ
Ti9BClNTUjoKTEZTOgoKVGhhbmtzLAoKPiByb290QGt2bS14ZnN0ZXN0czovbW50IyBkZCBpZj0v
ZGV2L3plcm8gb2Y9Li9uZXcgb2ZsYWc9ZGlyZWN0IGJzPTFNIGNvdW50PTEKPiAxKzAgcmVjb3Jk
cyBpbgo+IDErMCByZWNvcmRzIG91dAo+IDEwNDg1NzYgYnl0ZXMgKDEuMCBNQiwgMS4wIE1pQikg
Y29waWVkLCAwLjAxNjAwOCBzLCA2NS41IE1CL3MKPiByb290QGt2bS14ZnN0ZXN0czovbW50IyBj
YXQgL3N5cy9rZXJuZWwvZGVidWcvZjJmcy9zdGF0dXMgfGdyZXAgU1NSIC1DIDMKPiAgICAgWy0t
LS0tLS0tLXwtfC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1dCj4gCj4g
SVBVOiAwIGJsb2Nrcwo+IFNTUjogMCBibG9ja3MgaW4gMCBzZWdtZW50cwo+IExGUzogMjU2IGJs
b2NrcyBpbiAxIHNlZ21lbnRzCj4gCj4gQkRGOiA5OSwgYXZnLiB2YmxvY2tzOiAyMjYKPiAKPj4K
Pj4gVGhhbmtzLAo+Pgo+Pj4gc2hvdWxkIGtlZXAgY29uc2lzdGVuY3kuCj4+Pgo+Pj4+Cj4+Pj4g
VGhhbmtzLAo+Pj4+Cj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gSmFlZ2V1aywgdGhvdWdodHM/Cj4+Pj4+
Pgo+Pj4+Pj4gVGhhbmtzLAo+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEZl
bmduYW4gQ2hhbmcgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT4KPj4+Pj4+PiAtLS0KPj4+Pj4+PiAg
wqDCoMKgIGZzL2YyZnMvZGF0YS5jIHwgNiArKysrKysKPj4+Pj4+PiAgwqDCoMKgIGZzL2YyZnMv
ZjJmcy5oIHwgMiArKwo+Pj4+Pj4+ICDCoMKgwqAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlv
bnMoKykKPj4+Pj4+Pgo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2Yy
ZnMvZGF0YS5jCj4+Pj4+Pj4gaW5kZXggZDJjZjQ4YzVhMmU0Li42MDUxMGFjZjkxZWMgMTAwNjQ0
Cj4+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPj4+Pj4+PiArKysgYi9mcy9mMmZzL2RhdGEu
Ywo+Pj4+Pj4+IEBAIC0xNDc3LDYgKzE0NzcsOSBAQCBpbnQgZjJmc19tYXBfYmxvY2tzKHN0cnVj
dCBpbm9kZSAqaW5vZGUsCj4+Pj4+Pj4gc3RydWN0IGYyZnNfbWFwX2Jsb2NrcyAqbWFwLAo+Pj4+
Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChmbGFnID09IEYyRlNfR0VUX0JMT0NLX0RJ
TykKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfd2FpdF9vbl9i
bG9ja193cml0ZWJhY2tfcmFuZ2UoaW5vZGUsCj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtYXAtPm1fcGJsaywgbWFwLT5tX2xl
bik7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICghZjJmc19sZnNfbW9kZShzYmkpICYmIGZs
YWcgPT0gRjJGU19HRVRfQkxPQ0tfRElPICYmCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBtYXAtPm1fbWF5X2NyZWF0ZSkKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzdGF0X2FkZF9pbnBsYWNlX2Jsb2NrcyhzYmksIG1hcC0+bV9sZW4pOwo+Pj4+Pj4+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0Owo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoCB9
Cj4+Pj4+Pj4gQEAgLTE1MjYsNiArMTUyOSw5IEBAIGludCBmMmZzX21hcF9ibG9ja3Moc3RydWN0
IGlub2RlICppbm9kZSwKPj4+Pj4+PiBzdHJ1Y3QgZjJmc19tYXBfYmxvY2tzICptYXAsCj4+Pj4+
Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBibGthZGRyID0gZG4uZGF0YV9ibGth
ZGRyOwo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2V0X2lub2RlX2Zs
YWcoaW5vZGUsIEZJX0FQUEVORF9XUklURSk7Cj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIWNyZWF0ZSAmJiAhZjJmc19sZnNfbW9k
ZShzYmkpICYmIGZsYWcgPT0KPj4+Pj4+PiBGMkZTX0dFVF9CTE9DS19ESU8gJiYKPj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1hcC0+bV9tYXlfY3JlYXRlKQo+Pj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXRfaW5jX2lucGxhY2VfYmxvY2tzKHNiaSk7Cj4+
Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKGNyZWF0ZSkgewo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaWYgKHVubGlrZWx5KGYyZnNfY3BfZXJyb3Ioc2JpKSkpIHsKPj4+Pj4+PiBkaWZmIC0tZ2l0
IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+Pj4+Pj4+IGluZGV4IDg2N2YyYzVk
OTU1OS4uM2E5ZGYyOGU2ZmQ3IDEwMDY0NAo+Pj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4+
Pj4+Pj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPj4+Pj4+PiBAQCAtMzgwNCw2ICszODA0LDggQEAg
c3RhdGljIGlubGluZSBzdHJ1Y3QgZjJmc19zdGF0X2luZm8KPj4+Pj4+PiAqRjJGU19TVEFUKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAo
KHNiaSktPmJsb2NrX2NvdW50WyhjdXJzZWcpLT5hbGxvY190eXBlXSsrKQo+Pj4+Pj4+ICDCoMKg
wqAgI2RlZmluZSBzdGF0X2luY19pbnBsYWNlX2Jsb2NrcyhzYmkpwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChh
dG9taWNfaW5jKCYoc2JpKS0+aW5wbGFjZV9jb3VudCkpCj4+Pj4+Pj4gKyNkZWZpbmUgc3RhdF9h
ZGRfaW5wbGFjZV9ibG9ja3Moc2JpLCBjb3VudCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgXAo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAoYXRvbWljX2FkZChjb3VudCwgJihzYmkpLT5p
bnBsYWNlX2NvdW50KSkKPj4+Pj4+PiAgwqDCoMKgICNkZWZpbmUgc3RhdF91cGRhdGVfbWF4X2F0
b21pY193cml0ZShpbm9kZSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+Pj4+Pj4+
ICDCoMKgwqDCoMKgwqDCoCBkbyB7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGludCBjdXIgPSBGMkZTX0lfU0IoaW5vZGUpLT5hdG9taWNfZmlsZXM7wqDCoMKgIFwKPj4+
Pj4+Pgo+Pj4+Cj4+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
