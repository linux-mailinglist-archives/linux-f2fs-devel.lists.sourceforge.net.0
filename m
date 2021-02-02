Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A644D30B4AD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Feb 2021 02:29:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l6kVg-0005kw-NL; Tue, 02 Feb 2021 01:29:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1l6kVe-0005ko-D9
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Feb 2021 01:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QmFMclw+kljAb/TDXsgK1s2YTWc7iOFVPTNZ7M8ZCn0=; b=HqVyCkP1czIwTwULZ0W+fRQuDB
 8fGuuvt/M0VH3V+DVSVCLXDk44Ajgtzmvg6F77mRvWcmZ4aX3tGFRkvWZinlbcYUEqvZQ9xvIp/mN
 9PEFVjeUM+G3tMdiNeSBZVD4LyXlKC0KuiBhGsBc4N7FOGWCdSOCMljAVqwu/aBWy7Dw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QmFMclw+kljAb/TDXsgK1s2YTWc7iOFVPTNZ7M8ZCn0=; b=mdEZckzypX0ckzCrjDq9qqZSLl
 g38V8XYpIgbs64ATWUxVYOuZnxLou2HnLpp8Lnzh/vOvAEbYpOrDF+VJduALsBOELdcTStSmYqZc3
 MOzUQGbBt3Zj9bGxRv/9HA3UIFPTnxCRCosmXReS8/nYBSMJr57+T/m/umQyOpVvFU2M=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1l6kVI-000177-Vw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Feb 2021 01:29:37 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DV6cz40snzjHj1;
 Tue,  2 Feb 2021 09:27:47 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 2 Feb 2021
 09:28:59 +0800
To: Daeho Jeong <daeho43@gmail.com>, Chao Yu <chao@kernel.org>
References: <20210201000606.2206740-1-daeho43@gmail.com>
 <7e2f440e-6500-04c8-1115-880754a18efa@kernel.org>
 <CACOAw_zW+xnN7pBmTknuJ1=CGiAvVq0sQhe7D6X8sOjgjF_qeg@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <a98a7866-3e57-e480-9405-4002de0ec4ad@huawei.com>
Date: Tue, 2 Feb 2021 09:28:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACOAw_zW+xnN7pBmTknuJ1=CGiAvVq0sQhe7D6X8sOjgjF_qeg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1l6kVI-000177-Vw
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix checkpoint mount option wrong
 combination
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
Cc: linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS8yLzEgMjE6MTEsIERhZWhvIEplb25nIHdyb3RlOgo+IEFjdHVhbGx5LCBJIHRoaW5r
IHdlIG5lZWQgdG8gc2VsZWN0IG9uZSBhbW9uZyB0aGVtLCBkaXNhYmxlLCBlbmFibGUKPiBhbmQg
bWVyZ2UuIEkgcmVhbGl6ZWQgbXkgcHJldmlvdXMgdW5kZXJzdGFuZGluZyBhYm91dCB0aGF0IHdh
cyB3cm9uZy4KCkFjdHVhbGx5LAoxLiBjaGVrY3BvaW50PWVuYWJsZS9kaXNhYmxlIGRlY2lkZSB3
aGV0aGVyIHdlIHdpbGwgYWxsb3cgY2hlY2twb2ludAoyLiBjaGVja3BvaW50PW1lcmdlIG9yIG5v
dCBkZWNpZGUgaG93IHdlIGlzc3VlIGNoZWNrcG9pbnQKClRoZXkgYXJlIGRpZmZlcmVudCwgd2Ug
c2hvdWxkIG5vdCBvbmx5IHNlbGVjdCBvbmx5IG9uZSBvZiB0aGVtLCB0aGUKY29tYmluYXRpb24g
b2YgdGhlbSBpcyBhbGxvd2VkLgoKVGhhbmtzLAoKPiBJbiB0aGF0IGNhc2Ugb2YgImNoZWNrcG9p
bnQ9bWVyZ2UsY2hlY2twb2ludD1lbmFibGUiLCB0aGUgbGFzdCBvcHRpb24KPiB3aWxsIG92ZXJy
aWRlIHRoZSBvbmVzIGJlZm9yZSB0aGF0Lgo+IFRoaXMgaXMgaG93IHRoZSBvdGhlciBtb3VudCBv
cHRpb25zIGxpa2UgZnN5bmNfbW9kZSwgd2hpbnRfbW9kZSBhbmQgZXRjLgo+IFNvLCB0aGUgYW5z
d2VyIHdpbGwgYmUgImNoZWNrcG9pbnQ9ZW5hYmxlIi4gV2hhdCBkbyB5b3UgdGhpbms/Cj4gCj4g
Cj4gCj4gMjAyMeuFhCAy7JuUIDHsnbwgKOyblCkg7Jik7ZuEIDk6NDAsIENoYW8gWXUgPGNoYW9A
a2VybmVsLm9yZz7ri5jsnbQg7J6R7ISxOgo+Pgo+PiBPbiAyMDIxLzIvMSA4OjA2LCBEYWVobyBK
ZW9uZyB3cm90ZToKPj4+IEZyb206IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+
Cj4+Pgo+Pj4gQXMgY2hlY2twb2ludD1tZXJnZSBjb21lcyBpbiwgbW91bnQgb3B0aW9uIHNldHRp
bmcgcmVsYXRlZCB0bwo+Pj4gY2hlY2twb2ludCBoYWQgYmVlbiBtaXhlZCB1cC4gRml4ZWQgaXQu
Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNv
bT4KPj4+IC0tLQo+Pj4gICAgZnMvZjJmcy9zdXBlci5jIHwgMTEgKysrKystLS0tLS0KPj4+ICAg
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4+Pgo+Pj4g
ZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIuYwo+Pj4gaW5kZXgg
NTY2OTZmNmNmYTg2Li44MjMxYzg4OGM3NzIgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL3N1cGVy
LmMKPj4+ICsrKyBiL2ZzL2YyZnMvc3VwZXIuYwo+Pj4gQEAgLTkzMCwyMCArOTMwLDI1IEBAIHN0
YXRpYyBpbnQgcGFyc2Vfb3B0aW9ucyhzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBjaGFyICpvcHRp
b25zLCBib29sIGlzX3JlbW91bnQpCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgIEYyRlNfT1BUSU9OKHNi
aSkudW51c2FibGVfY2FwX3BlcmMgPSBhcmc7Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgIHNl
dF9vcHQoc2JpLCBESVNBQkxFX0NIRUNLUE9JTlQpOwo+Pj4gKyAgICAgICAgICAgICAgICAgICAg
IGNsZWFyX29wdChzYmksIE1FUkdFX0NIRUNLUE9JTlQpOwo+Pj4gICAgICAgICAgICAgICAgICAg
ICAgICBicmVhazsKPj4+ICAgICAgICAgICAgICAgIGNhc2UgT3B0X2NoZWNrcG9pbnRfZGlzYWJs
ZV9jYXA6Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgIGlmIChhcmdzLT5mcm9tICYmIG1hdGNo
X2ludChhcmdzLCAmYXJnKSkKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gLUVJTlZBTDsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgRjJGU19PUFRJT04oc2JpKS51
bnVzYWJsZV9jYXAgPSBhcmc7Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgIHNldF9vcHQoc2Jp
LCBESVNBQkxFX0NIRUNLUE9JTlQpOwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGNsZWFyX29w
dChzYmksIE1FUkdFX0NIRUNLUE9JTlQpOwo+Pj4gICAgICAgICAgICAgICAgICAgICAgICBicmVh
azsKPj4+ICAgICAgICAgICAgICAgIGNhc2UgT3B0X2NoZWNrcG9pbnRfZGlzYWJsZToKPj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgc2V0X29wdChzYmksIERJU0FCTEVfQ0hFQ0tQT0lOVCk7Cj4+
PiArICAgICAgICAgICAgICAgICAgICAgY2xlYXJfb3B0KHNiaSwgTUVSR0VfQ0hFQ0tQT0lOVCk7
Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+Pj4gICAgICAgICAgICAgICAgY2Fz
ZSBPcHRfY2hlY2twb2ludF9lbmFibGU6Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgIGNsZWFy
X29wdChzYmksIERJU0FCTEVfQ0hFQ0tQT0lOVCk7Cj4+PiArICAgICAgICAgICAgICAgICAgICAg
Y2xlYXJfb3B0KHNiaSwgTUVSR0VfQ0hFQ0tQT0lOVCk7Cj4+Cj4+IFdoYXQgaWY6IC1vIGNoZWNr
cG9pbnQ9bWVyZ2UsY2hlY2twb2ludD1lbmFibGUKPj4KPj4gQ2FuIHlvdSBwbGVhc2UgZXhwbGFp
biB0aGUgcnVsZSBvZiBtZXJnZS9kaXNhYmxlL2VuYWJsZSBjb21iaW5hdGlvbiBhbmQgdGhlaXIK
Pj4gcmVzdWx0PyBlLmcuCj4+IGNoZWNrcG9pbnQ9bWVyZ2UsY2hlY2twb2ludD1lbmFibGUKPj4g
Y2hlY2twb2ludD1lbmFibGUsY2hlY2twb2ludD1tZXJnZQo+PiBjaGVja3BvaW50PW1lcmdlLGNo
ZWNrcG9pbnQ9ZGlzYWJsZQo+PiBjaGVja3BvaW50PWRpc2FibGUsY2hlY2twb2ludD1tZXJnZQo+
Pgo+PiBJZiB0aGUgcnVsZS9yZXN1bHQgaXMgY2xlYXIsIGl0IHNob3VsZCBiZSBkb2N1bWVudGVk
Lgo+Pgo+PiBUaGFua3MsCj4+Cj4+Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+
Pj4gICAgICAgICAgICAgICAgY2FzZSBPcHRfY2hlY2twb2ludF9tZXJnZToKPj4+ICsgICAgICAg
ICAgICAgICAgICAgICBjbGVhcl9vcHQoc2JpLCBESVNBQkxFX0NIRUNLUE9JTlQpOwo+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICBzZXRfb3B0KHNiaSwgTUVSR0VfQ0hFQ0tQT0lOVCk7Cj4+PiAg
ICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+Pj4gICAgI2lmZGVmIENPTkZJR19GMkZTX0ZT
X0NPTVBSRVNTSU9OCj4+PiBAQCAtMTE0MiwxMiArMTE0Nyw2IEBAIHN0YXRpYyBpbnQgcGFyc2Vf
b3B0aW9ucyhzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBjaGFyICpvcHRpb25zLCBib29sIGlzX3Jl
bW91bnQpCj4+PiAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+ICAgICAgICB9Cj4+
Pgo+Pj4gLSAgICAgaWYgKHRlc3Rfb3B0KHNiaSwgRElTQUJMRV9DSEVDS1BPSU5UKSAmJgo+Pj4g
LSAgICAgICAgICAgICAgICAgICAgIHRlc3Rfb3B0KHNiaSwgTUVSR0VfQ0hFQ0tQT0lOVCkpIHsK
Pj4+IC0gICAgICAgICAgICAgZjJmc19lcnIoc2JpLCAiY2hlY2twb2ludD1tZXJnZSBjYW5ub3Qg
YmUgdXNlZCB3aXRoIGNoZWNrcG9pbnQ9ZGlzYWJsZVxuIik7Cj4+PiAtICAgICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOwo+Pj4gLSAgICAgfQo+Pj4gLQo+Pj4gICAgICAgIC8qIE5vdCBwYXNzIGRv
d24gd3JpdGUgaGludHMgaWYgdGhlIG51bWJlciBvZiBhY3RpdmUgbG9ncyBpcyBsZXNzZXIKPj4+
ICAgICAgICAgKiB0aGFuIE5SX0NVUlNFR19QRVJTSVNUX1RZUEUuCj4+PiAgICAgICAgICovCj4+
Pgo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
