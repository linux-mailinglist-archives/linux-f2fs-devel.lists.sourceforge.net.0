Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F71D9712EB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Sep 2024 11:05:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1snaKa-0007xv-Hq;
	Mon, 09 Sep 2024 09:05:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1snaKZ-0007xo-Gp
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 09:05:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PP1C3k6PmMDg9c0WoNXvbCKjPdKPZLJj3k4oJHTfm9Y=; b=UrToQTyCeImSBWhFvI9juUvwpW
 ReLvJtQHqvrBb2/8TD7iD7tseyEn5q6yqQgfFa4K2oldUvDw5qxn7yF3uGqLSxcVK6TOxWhK8e7rJ
 fxsT3JcLLr2wYpnzRvoPsSXcj3dQUg5wHx40AUPe4aoPYd0c0BWapnlBH55l9PV+7WI4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PP1C3k6PmMDg9c0WoNXvbCKjPdKPZLJj3k4oJHTfm9Y=; b=L8PpP7oBrVTBsrnUQ2os+f02KN
 iEApTRCQf8mk6REIf+wRrkJxrj5xAuZBbjb6xU0ZsUiyW4x4FixrU5F6lyumKeUHvUmXvzWEPOOV2
 mGGZno8Zp/xrodTvSqZ4PXVacuwLGAKXUdRJgN+9BNAmRdJzHyjafQkjLEES8wsVzIhc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1snaKY-0003Cu-HJ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 09:05:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9096E5C573D;
 Mon,  9 Sep 2024 09:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821FFC4CECB;
 Mon,  9 Sep 2024 09:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725872695;
 bh=lCsruMSp1KOiTzsHB5Spv5z72CjumY9SnOeQbIfyNpk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=rzQXqEOzHmW/R+YiWvu/UKQXQWZJesupXQ5nHfVCiAwFbbAhgtw+6unhe+gEiOIP1
 FABGwHcDzZ52yNyhTcIFUwFUlYy61mNhopYTsMtaL0YnDdedNdEM9rN94eytOm4UHj
 q5P/AeLmu0vDMJVwmwqW2BkacLeSJs1hu45OB7S626vRAjnJMRB6IdoolsYO/rYoul
 lO7SnZN+et1eSHjuDxwKPVrB9W2LFsW76TR5LzcQHI371WR8Kewv8/RUI//US9gJng
 TlbkiCl1Ss2iSanw9t4+z1S+jw860v7Os6h60QzcliyXytXmkKi5irMzntdYilajLT
 mf10btu/RAXPA==
Message-ID: <f1bc191e-98fa-4a75-a2a6-0ee8a76c4637@kernel.org>
Date: Mon, 9 Sep 2024 17:04:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>
References: <55f6fdba-f505-4557-8074-6bfa942c275d@kernel.org>
 <20240909040600.2371098-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20240909040600.2371098-1-wangzijie1@honor.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/9/9 12:06, wangzijie wrote: >> On 2024/9/8 12:12,
 wangzijie wrote: >>>>> From: Chao Yu via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
 >>>>> >>>>>> On 2024/8/27 14:22, wangzijie [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1snaKY-0003Cu-HJ
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: don't set SBI_QUOTA_NEED_REPAIR
 flag if receive SIGKILL
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC85LzkgMTI6MDYsIHdhbmd6aWppZSB3cm90ZToKPj4gT24gMjAyNC85LzggMTI6MTIs
IHdhbmd6aWppZSB3cm90ZToKPj4+Pj4gRnJvbTogQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZl
bCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ+Cj4+Pj4+Cj4+Pj4+PiBP
biAyMDI0LzgvMjcgMTQ6MjIsIHdhbmd6aWppZSB3cm90ZToKPj4+Pj4+PiBUaHJlYWQgQQo+Pj4+
Pj4+IC1kcXVvdF9pbml0aWFsaXplCj4+Pj4+Pj4gICDCoCAtZHFnZXQKPj4+Pj4+PiAgIMKgwqAg
LWYyZnNfZHF1b3RfYWNxdWlyZQo+Pj4+Pj4+ICAgwqDCoMKgIC12Ml9yZWFkX2RxdW90Cj4+Pj4+
Pj4gICDCoMKgwqDCoCAtcXRyZWVfcmVhZF9kcXVvdAo+Pj4+Pj4+ICAgwqDCoMKgwqDCoCAtZmlu
ZF90cmVlX2RxZW50cnkKPj4+Pj4+PiAgIMKgwqDCoMKgwqDCoCAtZjJmc19xdW90YV9yZWFkCj4+
Pj4+Pj4gICDCoMKgwqDCoMKgwqDCoCAtcmVhZF9jYWNoZV9wYWdlX2dmcAo+Pj4+Pj4+ICAgwqDC
oMKgwqDCoMKgwqDCoCAtZG9fcmVhZF9jYWNoZV9mb2xpbwo+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKg
wqDCoMKgIC1maWVtYXBfcmVhZF9mb2xpbwo+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LWZvbGlvX3dhaXRfbG9ja2VkX2tpbGxhYmxlCj4+Pj4+Pj4gICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC1yZWNlaXZlIFNJR0tJTEwgOiByZXR1cm4gLUVJTlRSCj4+Pj4+Pj4gICDCoMKgwqDCoMKg
wqDCoCAtc2V0IFNCSV9RVU9UQV9ORUVEX1JFUEFJUgo+Pj4+Pj4+ICAgwqDCoMKgIC1zZXQgU0JJ
X1FVT1RBX05FRURfUkVQQUlSCj4+Pj4+Pj4KPj4+Pj4+PiBXaGVuIGNhbGxpbmcgcmVhZF9jYWNo
ZV9wYWdlX2dmcCBpbiBxdW90YSByZWFkLCB0aHJlYWQgbWF5IHJlY2VpdmUgU0lHS0lMTCBhbmQK
Pj4+Pj4+PiBzZXQgU0JJX1FVT1RBX05FRURfUkVQQUlSLCBzaG91bGQgd2Ugc2V0IFNCSV9RVU9U
QV9ORUVEX1JFUEFJUiBpbiB0aGlzIGVycm9yIHBhdGg/Cj4+Pj4+Pgo+Pj4+Pj4gZjJmc19xdW90
YV9yZWFkKCkgY2FuIGJlIGNhbGxlZCBpbiBhIGxvdCBvZiBjb250ZXh0cywgY2FuIHdlIGp1c3Qg
aWdub3JlIC1FSU5UUgo+Pj4+Pj4gZm9yIGYyZnNfZHF1b3RfaW5pdGlhbGl6ZSgpIGNhc2U/Cj4+
Pj4+Pgo+Pj4+Pj4gVGhhbmtzLAo+Pj4+Pgo+Pj4+PiBZZXMsIGluIG1hbnkgY29udGV4dHMgZjJm
c19xdW90YV9yZWFkKCkgY2FuIGJlIGNhbGxlZCBhbmQgbWF5IHJldHVybiAtRUlOVFIsIHdlIG5l
ZWQgdG8gaWdub3JlIHRoaXMgZXJybm8gZm9yIG1vcmUgY2FzZXMuIElmIHdlIG5lZWQgdG8gZG8g
c28sIEkgd2lsbCBjaGVjayBpdCBhbmQgcmVzZW5kIHBhdGNoLgo+Pj4+PiBPciBkbyB5b3UgaGF2
ZSBvdGhlciBzdWdnZXN0aW9ucyB0byBhdm9pZCB1bm5lY2Vzc2FyeSBTQklfUVVPVEFfTkVFRF9S
RVBBSVIgZmxhZyBzZXQ/Cj4+Pj4KPj4+PiBIb3cgYWJvdXQgdGhpcz8KPj4+Pgo+Pj4+IC0tLQo+
Pj4+ICAgIGZzL2YyZnMvZjJmcy5oICB8ICAxICsKPj4+PiAgICBmcy9mMmZzL2lub2RlLmMgfCAg
MyArLS0KPj4+PiAgICBmcy9mMmZzL3N1cGVyLmMgfCAxNyArKysrKysrKysrKysrLS0tLQo+Pj4+
ICAgIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4+
Pgo+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4+Pj4g
aW5kZXggZGZlZDE5NzRlZGE1Li5hMTcwNGExOWRmZTkgMTAwNjQ0Cj4+Pj4gLS0tIGEvZnMvZjJm
cy9mMmZzLmgKPj4+PiArKysgYi9mcy9mMmZzL2YyZnMuaAo+Pj4+IEBAIC04MTAsNiArODEwLDcg
QEAgZW51bSB7Cj4+Pj4gICAgCUZJX0FUT01JQ19ESVJUSUVELAkvKiBpbmRpY2F0ZSBhdG9taWMg
ZmlsZSBpcyBkaXJ0aWVkICovCj4+Pj4gICAgCUZJX0FUT01JQ19SRVBMQUNFLAkvKiBpbmRpY2F0
ZSBhdG9taWMgcmVwbGFjZSAqLwo+Pj4+ICAgIAlGSV9PUEVORURfRklMRSwJCS8qIGluZGljYXRl
IGZpbGUgaGFzIGJlZW4gb3BlbmVkICovCj4+Pj4gKwlGSV9JTklUX0RRVU9ULAkJLyogaW5kaWNh
dGUgaXQncyBpbml0aWFsaXppbmcgZHF1b3QgKi8KPj4+PiAgICAJRklfTUFYLAkJCS8qIG1heCBm
bGFnLCBuZXZlciBiZSB1c2VkICovCj4+Pj4gICAgfTsKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9m
cy9mMmZzL2lub2RlLmMgYi9mcy9mMmZzL2lub2RlLmMKPj4+PiBpbmRleCAwMDhmMDEzNDhhZmEu
LmIxZGJhZWRhMzA2ZiAxMDA2NDQKPj4+PiAtLS0gYS9mcy9mMmZzL2lub2RlLmMKPj4+PiArKysg
Yi9mcy9mMmZzL2lub2RlLmMKPj4+PiBAQCAtODI3LDggKzgyNyw3IEBAIHZvaWQgZjJmc19ldmlj
dF9pbm9kZShzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+Pj4+Cj4+Pj4gICAgCWVyciA9IGYyZnNfZHF1
b3RfaW5pdGlhbGl6ZShpbm9kZSk7Cj4+Pj4gICAgCWlmIChlcnIpIHsKPj4+PiAtCQlpZiAoZXJy
ICE9IC1FSU5UUikKPj4+PiAtCQkJc2V0X3NiaV9mbGFnKHNiaSwgU0JJX1FVT1RBX05FRURfUkVQ
QUlSKTsKPj4+PiArCQlzZXRfc2JpX2ZsYWcoc2JpLCBTQklfUVVPVEFfTkVFRF9SRVBBSVIpOwo+
Pj4+ICAgIAkJZXJyID0gMDsKPj4+PiAgICAJfQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2Yy
ZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIuYwo+Pj4+IGluZGV4IDhlMjlhYmE0YjdhNC4uZTc3
NGJkZjg3NWIyIDEwMDY0NAo+Pj4+IC0tLSBhL2ZzL2YyZnMvc3VwZXIuYwo+Pj4+ICsrKyBiL2Zz
L2YyZnMvc3VwZXIuYwo+Pj4+IEBAIC0yNjQ0LDggKzI2NDQsMTEgQEAgc3RhdGljIHNzaXplX3Qg
ZjJmc19xdW90YV9yZWFkKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIGludCB0eXBlLCBjaGFyICpk
YXRhLAo+Pj4+ICAgIAkJCWlmIChQVFJfRVJSKHBhZ2UpID09IC1FTk9NRU0pIHsKPj4+PiAgICAJ
CQkJbWVtYWxsb2NfcmV0cnlfd2FpdChHRlBfTk9GUyk7Cj4+Pj4gICAgCQkJCWdvdG8gcmVwZWF0
Owo+Pj4+IC0JCQl9IGVsc2UgaWYgKFBUUl9FUlIocGFnZSkgIT0gLUVJTlRSKQo+Pj4+IC0JCQkJ
c2V0X3NiaV9mbGFnKEYyRlNfU0Ioc2IpLCBTQklfUVVPVEFfTkVFRF9SRVBBSVIpOwo+Pj4+ICsJ
CQl9IGVsc2UgaWYgKFBUUl9FUlIocGFnZSkgPT0gLUVJTlRSICYmCj4+Pj4gKwkJCQlpc19pbm9k
ZV9mbGFnX3NldChpbm9kZSwgRklfSU5JVF9EUVVPVCkpIHsKPj4+PiArCQkJCXJldHVybiBQVFJf
RVJSKHBhZ2UpOwo+Pj4+ICsJCQl9Cj4+Pj4gKwkJCXNldF9zYmlfZmxhZyhGMkZTX1NCKHNiKSwg
U0JJX1FVT1RBX05FRURfUkVQQUlSKTsKPj4+PiAgICAJCQlyZXR1cm4gUFRSX0VSUihwYWdlKTsK
Pj4+PiAgICAJCX0KPj4+Pgo+Pj4+IEBAIC0yNzIxLDEwICsyNzI0LDE2IEBAIHN0YXRpYyBzc2l6
ZV90IGYyZnNfcXVvdGFfd3JpdGUoc3RydWN0IHN1cGVyX2Jsb2NrICpzYiwgaW50IHR5cGUsCj4+
Pj4KPj4+PiAgICBpbnQgZjJmc19kcXVvdF9pbml0aWFsaXplKHN0cnVjdCBpbm9kZSAqaW5vZGUp
Cj4+Pj4gICAgewo+Pj4+ICsJaW50IHJldDsKPj4+PiArCj4+Pj4gICAgCWlmICh0aW1lX3RvX2lu
amVjdChGMkZTX0lfU0IoaW5vZGUpLCBGQVVMVF9EUVVPVF9JTklUKSkKPj4+PiAgICAJCXJldHVy
biAtRVNSQ0g7Cj4+Pj4KPj4+PiAtCXJldHVybiBkcXVvdF9pbml0aWFsaXplKGlub2RlKTsKPj4+
PiArCXNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9JTklUX0RRVU9UKTsKPj4+PiArCXJldCA9IGRx
dW90X2luaXRpYWxpemUoaW5vZGUpOwo+Pj4+ICsJY2xlYXJfaW5vZGVfZmxhZyhpbm9kZSwgRklf
SU5JVF9EUVVPVCk7Cj4+Pj4gKwo+Pj4+ICsJcmV0dXJuIHJldDsKPj4+PiAgICB9Cj4+Pj4KPj4+
PiAgICBzdGF0aWMgc3RydWN0IGRxdW90IF9fcmN1ICoqZjJmc19nZXRfZHF1b3RzKHN0cnVjdCBp
bm9kZSAqaW5vZGUpCj4+Pj4gQEAgLTMwNjQsNyArMzA3Myw3IEBAIHN0YXRpYyBpbnQgZjJmc19k
cXVvdF9hY3F1aXJlKHN0cnVjdCBkcXVvdCAqZHF1b3QpCj4+Pj4KPj4+PiAgICAJZjJmc19kb3du
X3JlYWQoJnNiaS0+cXVvdGFfc2VtKTsKPj4+PiAgICAJcmV0ID0gZHF1b3RfYWNxdWlyZShkcXVv
dCk7Cj4+Pj4gLQlpZiAocmV0IDwgMCAmJiByZXQgIT0gLUVJTlRSKQo+Pj4+ICsJaWYgKHJldCA8
IDApCj4+Pj4gICAgCQlzZXRfc2JpX2ZsYWcoc2JpLCBTQklfUVVPVEFfTkVFRF9SRVBBSVIpOwo+
Pj4+ICAgIAlmMmZzX3VwX3JlYWQoJnNiaS0+cXVvdGFfc2VtKTsKPj4+PiAgICAJcmV0dXJuIHJl
dDsKPj4+PiAtLSAKPj4+PiAyLjQwLjEKPj4+Cj4+PiBIaSwgQ2hhbwo+Pj4gSWYgd2UgZG9udCd0
IGlnbm9yZSAtRUlOVFIgaW4gZjJmc19kcXVvdF9hY3F1aXJlKCksIHdlIHdpbGwgc3RpbGwgc2V0
IFNCSV9RVU9UQV9ORUVEX1JFUEFJUiBmbGFnCj4+PiBpbiBmMmZzX2RxdW90X2FjcXVpcmUoKSBp
ZiBmMmZzX3F1b3RhX3JlYWQgcmV0dXJuIC1FSU5UUi4gSSB0aGluayB3ZSBuZWVkIG1vcmUgY2Fz
ZXMgaW4gYWRkaXRpb24gdG8KPj4+IGRxdW90IGluaXRpYWxpemluZyBhbmQgSSB3aWxsIGNoZWNr
IGl0IGFnYWluLgo+Pgo+PiBNYXliZSB3ZSBjYW4gY292ZXIgdGhpcyBjYXNlIHcvIGJlbG93IGRp
ZmY/Cj4+Cj4+IC0tLQo+PiAgIGZzL2YyZnMvc3VwZXIuYyB8IDMgKystCj4+ICAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCj4+IGluZGV4IGU3NzRiZGY4NzViMi4u
N2ZjOTcwMTIxYTNmIDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL3N1cGVyLmMKPj4gKysrIGIvZnMv
ZjJmcy9zdXBlci5jCj4+IEBAIC0zMDczLDcgKzMwNzMsOCBAQCBzdGF0aWMgaW50IGYyZnNfZHF1
b3RfYWNxdWlyZShzdHJ1Y3QgZHF1b3QgKmRxdW90KQo+Pgo+PiAgIAlmMmZzX2Rvd25fcmVhZCgm
c2JpLT5xdW90YV9zZW0pOwo+PiAgIAlyZXQgPSBkcXVvdF9hY3F1aXJlKGRxdW90KTsKPj4gLQlp
ZiAocmV0IDwgMCkKPj4gKwlpZiAocmV0IDwgMCAmJgo+PiArCQkocmV0ICE9IC1FSU5UUiB8fCAh
aXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0lOSVRfRFFVT1QpKSkKPj4gICAJCXNldF9zYmlf
ZmxhZyhzYmksIFNCSV9RVU9UQV9ORUVEX1JFUEFJUik7Cj4+ICAgCWYyZnNfdXBfcmVhZCgmc2Jp
LT5xdW90YV9zZW0pOwo+PiAgIAlyZXR1cm4gcmV0Owo+PiAtLSAKPj4gMi40MC4xCj4+Cj4+IFRo
YW5rcywKPiAKPiBZZXMsIEkgdGhpbmsgaXQgY2FuIGNvdmVyIGluaXRpYWxpemluZyBkcXVvdCBj
YXNlLgoKT29wcywgcGxlYXNlIGlnbm9yZSB0aGlzLCBhcyB3ZSBjYW4gbm90IGdldCBpbm9kZSBw
b2ludGVyIGluCmYyZnNfZHF1b3RfYWNxdWlyZSgpIGNvbnRleHQuLi4KClRoYW5rcywKCj4gCj4+
Cj4+PiBUaGFuayB5b3UgZm9yIHlvdXIgc3VnZ2VzdGlvbiEKPj4+Cj4+Pj4+Cj4+Pj4+IFRoYW5r
IHlvdSBmb3IgcmV2aWV3Lgo+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogd2Fu
Z3ppamllIDx3YW5nemlqaWUxQGhvbm9yLmNvbT4KPj4+Pj4+PiAtLS0KPj4+Pj4+PiAgIMKgIGZz
L2YyZnMvaW5vZGUuYyB8IDMgKystCj4+Pj4+Pj4gICDCoCBmcy9mMmZzL3N1cGVyLmMgfCA2ICsr
Ky0tLQo+Pj4+Pj4+ICAgwqAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4+Pj4+Pj4KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9pbm9kZS5jIGIv
ZnMvZjJmcy9pbm9kZS5jCj4+Pj4+Pj4gaW5kZXggZWQ2MjlkYWJiLi4yYWY5OGUyYjcgMTAwNjQ0
Cj4+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9pbm9kZS5jCj4+Pj4+Pj4gKysrIGIvZnMvZjJmcy9pbm9k
ZS5jCj4+Pj4+Pj4gQEAgLTgzNyw4ICs4MzcsOSBAQCB2b2lkIGYyZnNfZXZpY3RfaW5vZGUoc3Ry
dWN0IGlub2RlICppbm9kZSkKPj4+Pj4+PiAgIMKgwqDCoMKgwqAgZXJyID0gZjJmc19kcXVvdF9p
bml0aWFsaXplKGlub2RlKTsKPj4+Pj4+PiAgIMKgwqDCoMKgwqAgaWYgKGVycikgewo+Pj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCBpZiAoZXJyICE9IC1FSU5UUikKPj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzZXRfc2JpX2ZsYWcoc2JpLCBTQklfUVVPVEFfTkVFRF9SRVBBSVIpOwo+Pj4+
Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgIGVyciA9IDA7Cj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKg
IHNldF9zYmlfZmxhZyhzYmksIFNCSV9RVU9UQV9ORUVEX1JFUEFJUik7Cj4+Pj4+Pj4gICDCoMKg
wqDCoMKgIH0KPj4+Pj4+PiAgIMKgwqDCoMKgwqAgZjJmc19yZW1vdmVfaW5vX2VudHJ5KHNiaSwg
aW5vZGUtPmlfaW5vLCBBUFBFTkRfSU5PKTsKPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9z
dXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCj4+Pj4+Pj4gaW5kZXggMWYxYjM2NDdhLi5mOTlhMzZm
ZjMgMTAwNjQ0Cj4+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9zdXBlci5jCj4+Pj4+Pj4gKysrIGIvZnMv
ZjJmcy9zdXBlci5jCj4+Pj4+Pj4gQEAgLTI2NTAsOCArMjY1MCw4IEBAIHN0YXRpYyBzc2l6ZV90
IGYyZnNfcXVvdGFfcmVhZChzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBpbnQgdHlwZSwgY2hhciAq
ZGF0YSwKPj4+Pj4+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChQVFJfRVJSKHBh
Z2UpID09IC1FTk9NRU0pIHsKPj4+Pj4+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbWVtYWxsb2NfcmV0cnlfd2FpdChHRlBfTk9GUyk7Cj4+Pj4+Pj4gICDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gcmVwZWF0Owo+Pj4+Pj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIH0KPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZXRfc2JpX2Zs
YWcoRjJGU19TQihzYiksIFNCSV9RVU9UQV9ORUVEX1JFUEFJUik7Cj4+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfSBlbHNlIGlmIChQVFJfRVJSKHBhZ2UpICE9IC1FSU5UUikKPj4+Pj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNldF9zYmlfZmxhZyhGMkZTX1NCKHNi
KSwgU0JJX1FVT1RBX05FRURfUkVQQUlSKTsKPj4+Pj4+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiBQVFJfRVJSKHBhZ2UpOwo+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKg
IH0KPj4+Pj4+PiBAQCAtMzA3MCw3ICszMDcwLDcgQEAgc3RhdGljIGludCBmMmZzX2RxdW90X2Fj
cXVpcmUoc3RydWN0IGRxdW90ICpkcXVvdCkKPj4+Pj4+PiAgIMKgwqDCoMKgwqAgZjJmc19kb3du
X3JlYWQoJnNiaS0+cXVvdGFfc2VtKTsKPj4+Pj4+PiAgIMKgwqDCoMKgwqAgcmV0ID0gZHF1b3Rf
YWNxdWlyZShkcXVvdCk7Cj4+Pj4+Pj4gLcKgwqDCoCBpZiAocmV0IDwgMCkKPj4+Pj4+PiArwqDC
oMKgIGlmIChyZXQgPCAwICYmIHJldCAhPSAtRUlOVFIpCj4+Pj4+Pj4gICDCoMKgwqDCoMKgwqDC
oMKgwqAgc2V0X3NiaV9mbGFnKHNiaSwgU0JJX1FVT1RBX05FRURfUkVQQUlSKTsKPj4+Pj4+PiAg
IMKgwqDCoMKgwqAgZjJmc191cF9yZWFkKCZzYmktPnF1b3RhX3NlbSk7Cj4+Pj4+Pj4gICDCoMKg
wqDCoMKgIHJldHVybiByZXQ7Cj4+Pj4+Cj4+Pj4+Cj4+Pgo+Pj4KPiAKPiAKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
