Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C8E324895
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Feb 2021 02:37:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lF5ar-0002sE-7m; Thu, 25 Feb 2021 01:37:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lF5ap-0002s6-Fl
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Feb 2021 01:37:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vAkSy4QaEGEqn2WR9o+mTYNePtx7QtA2pGSV6PlsxRE=; b=c2or4CfbKst1PqrHj9LAzTfjWi
 WP0FuE1D+Lyqkf7IzPCbf+LjyUHBbuVajbNPO28rDl+NiijvcQfCeWRVtZ9rGmQXAgCzlUvMYKNCK
 5mtWkWaeQykA6Co3WT0HrDM7N3JOOSD3bpxUqs/bBCMmXCKGsVxR1OLzXsouLi7AuqgU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vAkSy4QaEGEqn2WR9o+mTYNePtx7QtA2pGSV6PlsxRE=; b=K1yvWSG6dq8NYtm8vJ0QZAxBtF
 qvKcdHLdxrMmZ0x56wiSB2T22o7Q6mvbftp5YLHcfheTZWhBkGdEEzjGaEK9hYtug3XLTgCd+sk4B
 zdVifqNTlY2eTcWFaft0lFhaLglua3XqV+p/LUoG1zBS01p/rocp+ZjOY8OyRVGhhakE=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lF5ag-0003wc-5N
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Feb 2021 01:37:27 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DmFjH2QB8z7q1b;
 Thu, 25 Feb 2021 09:35:31 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 25 Feb
 2021 09:37:06 +0800
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Jaegeuk Kim
 <jaegeuk@kernel.org>
References: <20210224190313.GA144040@embeddedor>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <bee16b72-f2e2-b113-9785-7f760be867df@huawei.com>
Date: Thu, 25 Feb 2021 09:37:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210224190313.GA144040@embeddedor>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lF5ag-0003wc-5N
Subject: Re: [f2fs-dev] [PATCH][next] f2fs: Replace one-element array with
 flexible-array member
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGVsbG8sIEd1c3Rhdm8sCgpPbiAyMDIxLzIvMjUgMzowMywgR3VzdGF2byBBLiBSLiBTaWx2YSB3
cm90ZToKPiBUaGVyZSBpcyBhIHJlZ3VsYXIgbmVlZCBpbiB0aGUga2VybmVsIHRvIHByb3ZpZGUg
YSB3YXkgdG8gZGVjbGFyZSBoYXZpbmcKPiBhIGR5bmFtaWNhbGx5IHNpemVkIHNldCBvZiB0cmFp
bGluZyBlbGVtZW50cyBpbiBhIHN0cnVjdHVyZS4gS2VybmVsIGNvZGUKPiBzaG91bGQgYWx3YXlz
IHVzZSDigJxmbGV4aWJsZSBhcnJheSBtZW1iZXJz4oCdWzFdIGZvciB0aGVzZSBjYXNlcy4gVGhl
IG9sZGVyCj4gc3R5bGUgb2Ygb25lLWVsZW1lbnQgb3IgemVyby1sZW5ndGggYXJyYXlzIHNob3Vs
ZCBubyBsb25nZXIgYmUgdXNlZFsyXS4KCkkgcHJvcG9zYWwgdG8gZG8gdGhlIHNpbWlsYXIgY2xl
YW51cCwgYW5kIEkndmUgbm8gb2JqZWN0aW9uIG9uIGRvaW5nIHRoaXMuCgpodHRwczovL2xvcmUu
a2VybmVsLm9yZy9wYXRjaHdvcmsvcGF0Y2gvODY5NDQwLwoKTGV0J3MgYXNrIGZvciBKYWVnZXVr
JyBvcGluaW9uLgoKPiAKPiBSZWZhY3RvciB0aGUgY29kZSBhY2NvcmRpbmcgdG8gdGhlIHVzZSBv
ZiBhIGZsZXhpYmxlLWFycmF5IG1lbWJlciBpbgo+IHN0cnVjdCBmMmZzX2NoZWNrcG9pbnQsIGlu
c3RlYWQgb2YgYSBvbmUtZWxlbWVudCBhcnJheXMuCj4gCj4gTm90aWNlIHRoYXQgYSB0ZW1wb3Jh
cnkgcG9pbnRlciB0byB2b2lkICcqdG1wX3B0cicgd2FzIHVzZWQgaW4gb3JkZXIgdG8KPiBmaXgg
dGhlIGZvbGxvd2luZyBlcnJvcnMgd2hlbiB1c2luZyBhIGZsZXhpYmxlIGFycmF5IGluc3RlYWQg
b2YgYSBvbmUKPiBlbGVtZW50IGFycmF5IGluIHN0cnVjdCBmMmZzX2NoZWNrcG9pbnQ6Cj4gCj4g
ICAgQ0MgW01dICBmcy9mMmZzL2Rpci5vCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGZzL2YyZnMv
ZGlyLmM6MTM6Cj4gZnMvZjJmcy9mMmZzLmg6IEluIGZ1bmN0aW9uIOKAmF9fYml0bWFwX3B0cuKA
mToKPiBmcy9mMmZzL2YyZnMuaDoyMjI3OjQwOiBlcnJvcjogaW52YWxpZCB1c2Ugb2YgZmxleGli
bGUgYXJyYXkgbWVtYmVyCj4gICAyMjI3IHwgICByZXR1cm4gJmNrcHQtPnNpdF9uYXRfdmVyc2lv
bl9iaXRtYXAgKyBvZmZzZXQgKyBzaXplb2YoX19sZTMyKTsKPiAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gZnMvZjJmcy9mMmZzLmg6MjIyNzo0OTog
ZXJyb3I6IGludmFsaWQgdXNlIG9mIGZsZXhpYmxlIGFycmF5IG1lbWJlcgo+ICAgMjIyNyB8ICAg
cmV0dXJuICZja3B0LT5zaXRfbmF0X3ZlcnNpb25fYml0bWFwICsgb2Zmc2V0ICsgc2l6ZW9mKF9f
bGUzMik7Cj4gICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXgo+IGZzL2YyZnMvZjJmcy5oOjIyMzg6NDA6IGVycm9yOiBpbnZhbGlkIHVzZSBv
ZiBmbGV4aWJsZSBhcnJheSBtZW1iZXIKPiAgIDIyMzggfCAgIHJldHVybiAmY2twdC0+c2l0X25h
dF92ZXJzaW9uX2JpdG1hcCArIG9mZnNldDsKPiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBeCj4gbWFrZVsyXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1
aWxkOjI4NzogZnMvZjJmcy9kaXIub10gRXJyb3IgMQo+IG1ha2VbMV06ICoqKiBbc2NyaXB0cy9N
YWtlZmlsZS5idWlsZDo1MzA6IGZzL2YyZnNdIEVycm9yIDIKPiBtYWtlOiAqKiogW01ha2VmaWxl
OjE4MTk6IGZzXSBFcnJvciAyCj4gCj4gWzFdIGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtp
L0ZsZXhpYmxlX2FycmF5X21lbWJlcgo+IFsyXSBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9o
dG1sL3Y1LjkvcHJvY2Vzcy9kZXByZWNhdGVkLmh0bWwjemVyby1sZW5ndGgtYW5kLW9uZS1lbGVt
ZW50LWFycmF5cwo+IAo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9LU1BQL2xpbnV4L2lzc3Vl
cy83OQo+IEJ1aWxkLXRlc3RlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+
Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC82MDM2NDdlNC5EZUVGYmw0ZXFs
anV3QVVlJTI1bGtwQGludGVsLmNvbS8KPiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNp
bHZhIDxndXN0YXZvYXJzQGtlcm5lbC5vcmc+Cj4gLS0tCj4gICBmcy9mMmZzL2YyZnMuaCAgICAg
ICAgICB8IDUgKysrLS0KPiAgIGluY2x1ZGUvbGludXgvZjJmc19mcy5oIHwgMiArLQo+ICAgMiBm
aWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPiBpbmRleCBlMmQzMDJhZTNh
NDYuLjNmNWNiMDk3YzMwZiAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+ICsrKyBiL2Zz
L2YyZnMvZjJmcy5oCj4gQEAgLTIyMTUsNiArMjIxNSw3IEBAIHN0YXRpYyBpbmxpbmUgYmxvY2tf
dCBfX2NwX3BheWxvYWQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ICAgc3RhdGljIGlubGlu
ZSB2b2lkICpfX2JpdG1hcF9wdHIoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgZmxhZykK
PiAgIHsKPiAgIAlzdHJ1Y3QgZjJmc19jaGVja3BvaW50ICpja3B0ID0gRjJGU19DS1BUKHNiaSk7
Cj4gKwl2b2lkICp0bXBfcHRyID0gJmNrcHQtPnNpdF9uYXRfdmVyc2lvbl9iaXRtYXA7Cj4gICAJ
aW50IG9mZnNldDsKPiAgIAo+ICAgCWlmIChpc19zZXRfY2twdF9mbGFncyhzYmksIENQX0xBUkdF
X05BVF9CSVRNQVBfRkxBRykpIHsKPiBAQCAtMjIyNCw3ICsyMjI1LDcgQEAgc3RhdGljIGlubGlu
ZSB2b2lkICpfX2JpdG1hcF9wdHIoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgZmxhZykK
PiAgIAkJICogaWYgbGFyZ2VfbmF0X2JpdG1hcCBmZWF0dXJlIGlzIGVuYWJsZWQsIGxlYXZlIGNo
ZWNrc3VtCj4gICAJCSAqIHByb3RlY3Rpb24gZm9yIGFsbCBuYXQvc2l0IGJpdG1hcHMuCj4gICAJ
CSAqLwo+IC0JCXJldHVybiAmY2twdC0+c2l0X25hdF92ZXJzaW9uX2JpdG1hcCArIG9mZnNldCAr
IHNpemVvZihfX2xlMzIpOwo+ICsJCXJldHVybiB0bXBfcHRyICsgb2Zmc2V0ICsgc2l6ZW9mKF9f
bGUzMik7Cj4gICAJfQo+ICAgCj4gICAJaWYgKF9fY3BfcGF5bG9hZChzYmkpID4gMCkgewo+IEBA
IC0yMjM1LDcgKzIyMzYsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgKl9fYml0bWFwX3B0cihzdHJ1
Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCBmbGFnKQo+ICAgCX0gZWxzZSB7Cj4gICAJCW9mZnNl
dCA9IChmbGFnID09IE5BVF9CSVRNQVApID8KPiAgIAkJCWxlMzJfdG9fY3B1KGNrcHQtPnNpdF92
ZXJfYml0bWFwX2J5dGVzaXplKSA6IDA7Cj4gLQkJcmV0dXJuICZja3B0LT5zaXRfbmF0X3ZlcnNp
b25fYml0bWFwICsgb2Zmc2V0Owo+ICsJCXJldHVybiB0bXBfcHRyICsgb2Zmc2V0Owo+ICAgCX0K
PiAgIH0KPiAgIAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2YyZnNfZnMuaCBiL2luY2x1
ZGUvbGludXgvZjJmc19mcy5oCj4gaW5kZXggYzZjYzBhNTY2ZWY1Li41NDg3YTgwNjE3YTMgMTAw
NjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9mMmZzX2ZzLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4
L2YyZnNfZnMuaAo+IEBAIC0xNjgsNyArMTY4LDcgQEAgc3RydWN0IGYyZnNfY2hlY2twb2ludCB7
Cj4gICAJdW5zaWduZWQgY2hhciBhbGxvY190eXBlW01BWF9BQ1RJVkVfTE9HU107Cj4gICAKPiAg
IAkvKiBTSVQgYW5kIE5BVCB2ZXJzaW9uIGJpdG1hcCAqLwo+IC0JdW5zaWduZWQgY2hhciBzaXRf
bmF0X3ZlcnNpb25fYml0bWFwWzFdOwo+ICsJdW5zaWduZWQgY2hhciBzaXRfbmF0X3ZlcnNpb25f
Yml0bWFwW107Cj4gICB9IF9fcGFja2VkOwo+ICAgCj4gICAjZGVmaW5lIENQX0NIS1NVTV9PRkZT
RVQJNDA5MgkvKiBkZWZhdWx0IGNoa3N1bSBvZmZzZXQgaW4gY2hlY2twb2ludCAqLwo+IAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
