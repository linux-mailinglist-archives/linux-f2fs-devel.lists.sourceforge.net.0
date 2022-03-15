Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1204D4D97B7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Mar 2022 10:35:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nU3S3-0000X2-HN; Tue, 15 Mar 2022 09:34:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sunke32@huawei.com>) id 1nU3S2-0000Ww-BU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Mar 2022 09:34:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XMRm0As4TuarndC0bWoXVkRfSQEUkWg/gEYzfUQdjfo=; b=F42LB9rcqd0rvJRs86+GulPBch
 ji1yw1OEktmcl6OzDMq87UOjmhsgiTWv4FBQAWa5cb6NhXi5MiFrwc4dcArLmJAI1nexofa2HR3Rn
 fyPyvc1lMU/7kLPTYhsRBc1eI0xLcFEFPs7PKglYvNrbkL/d2fy2web3qGT7atiGIb38=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XMRm0As4TuarndC0bWoXVkRfSQEUkWg/gEYzfUQdjfo=; b=TNsK8KHlVRgMn4TyM9KT+n/17O
 W+bL/OC54tznSs+FJsaybhmkPy2SLJqw2ZLo1hOkm/O5/MXQru7hgqb+D7dE2CaBoLAfNRy51Bfmu
 JgaP7jXWSQm5Ezvej7QFAPuHDgamut8c77XskorG9LU1wPTufKeTxTFEbtUtSW+DDvx0=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nU3Zw-00GXxD-IK
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Mar 2022 09:34:57 +0000
Received: from kwepemi500022.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KHp995FHPzBrn5;
 Tue, 15 Mar 2022 17:32:45 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 kwepemi500022.china.huawei.com (7.221.188.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 15 Mar 2022 17:34:45 +0800
Received: from [10.174.178.31] (10.174.178.31) by
 kwepemm600010.china.huawei.com (7.193.23.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 15 Mar 2022 17:34:45 +0800
To: Chao Yu <chao.yu@oppo.com>, <fstests@vger.kernel.org>, <guan@eryu.me>
References: <20220311094315.2476774-1-sunke32@huawei.com>
 <de79517f-4fa6-c409-42d4-6187eb968e0e@oppo.com>
Message-ID: <690fc25e-263e-5c7a-2bd0-55fa06c85e23@huawei.com>
Date: Tue, 15 Mar 2022 17:34:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <de79517f-4fa6-c409-42d4-6187eb968e0e@oppo.com>
X-Originating-IP: [10.174.178.31]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2022/3/15 12:01, Chao Yu 写道: > On 2022/3/11 17:43,
    Sun Ke via Linux-f2fs-devel wrote: >> The test fail on f2fs: >>      
    xattr names and values after second fsync log replay: >>     � [...] 
 
 Content analysis details:   (-4.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
                             [45.249.212.188 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [45.249.212.188 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nU3Zw-00GXxD-IK
Subject: Re: [f2fs-dev] [PATCH v2] generic/066: attr1 is still there after
 log replay on f2fs
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
From: Sun Ke via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sun Ke <sunke32@huawei.com>
Cc: jaegeuk@kernel.org, david@fromorbit.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgrlnKggMjAyMi8zLzE1IDEyOjAxLCBDaGFvIFl1IOWGmemBkzoKPiBPbiAyMDIyLzMvMTEgMTc6
NDMsIFN1biBLZSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4gVGhlIHRlc3QgZmFpbCBv
biBmMmZzOgo+PiDCoMKgwqDCoMKgIHhhdHRyIG5hbWVzIGFuZCB2YWx1ZXMgYWZ0ZXIgc2Vjb25k
IGZzeW5jIGxvZyByZXBsYXk6Cj4+IMKgwqDCoMKgwqAgIyBmaWxlOiBTQ1JBVENIX01OVC9mb29i
YXIKPj4gwqDCoMKgwqAgK3VzZXIuYXR0cjE9InZhbDEiCj4+IMKgwqDCoMKgwqAgdXNlci5hdHRy
Mz0idmFsMyIKPj4KPj4gYXR0cjEgaXMgc3RpbGwgdGhlcmUgYWZ0ZXIgbG9nIHJlcGxheS4gZjJm
cyBkb2Vzbid0IHN1cHBvcnQgZnMtb3AgbGV2ZWwKPj4gdHJhbnNhY3Rpb24gZnVuY3Rpb25hbGl0
eS4gc28gaXQgaGF2ZSBubyB3YXkgdG8gcGVyc2lzdCBhbGwgbWV0YWRhdGEKPj4gdXBkYXRlcyBp
biBvbmUgdHJhbnNhY3Rpb24uwqAgV2UgY2FuIHVzZSAiZmFzdGJvb3QiIG1vdW50b3B0aW9uIGZv
ciB0aGlzCj4+IGNhc2UsIHNvIGR1cmluZyBsYXN0IGZzeW5jIG9uIHF3ZXJ0eSwgZjJmcyBjYW4g
dHJpZ2dlciBhIGNoZWNrcG9pbnQKPj4gd2hpY2ggd2lsbCBwZXJzaXN0IGFsbCBtZXRhZGF0YSB1
cGRhdGVzIGJlZm9yZSBmc3luYygpLgo+Pgo+PiBTdWdnZXN0ZWQtYnk6IENoYW8gWXUgPGNoYW9A
a2VybmVsLm9yZz4KPj4gU2lnbmVkLW9mZi1ieTogU3VuIEtlIDxzdW5rZTMyQGh1YXdlaS5jb20+
Cj4+IC0tLQo+PiDCoCB0ZXN0cy9nZW5lcmljLzA2NiB8IDggKysrKysrKysKPj4gwqAgMSBmaWxl
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvdGVzdHMvZ2VuZXJp
Yy8wNjYgYi90ZXN0cy9nZW5lcmljLzA2Ngo+PiBpbmRleCAxMDVhN2FjZC4uYjg0NjUxMDEgMTAw
NzU1Cj4+IC0tLSBhL3Rlc3RzL2dlbmVyaWMvMDY2Cj4+ICsrKyBiL3Rlc3RzL2dlbmVyaWMvMDY2
Cj4+IEBAIC01Niw2ICs1NiwxNCBAQCBzeW5jCj4+IMKgICRTRVRGQVRUUl9QUk9HIC14IHVzZXIu
YXR0cjIgJFNDUkFUQ0hfTU5UL2Zvb2Jhcgo+PiDCoCAkWEZTX0lPX1BST0cgLWMgImZzeW5jIiAk
U0NSQVRDSF9NTlQvZm9vYmFyCj4+ICsjIGYyZnMgZG9lc24ndCBzdXBwb3J0IGZzLW9wIGxldmVs
IHRyYW5zYWN0aW9uIGZ1bmN0aW9uYWxpdHkuIHNvIGl0IAo+PiBoYXZlIG5vIHdheQo+PiArIyB0
byBwZXJzaXN0IGFsbCBtZXRhZGF0YSB1cGRhdGVzIGluIG9uZSB0cmFuc2FjdGlvbi7CoCBXZSBj
YW4gdXNlIAo+PiAiZmFzdGJvb3QiCj4+ICsjIG1vdW50b3B0aW9uIGZvciB0aGlzIGNhc2UsIHNv
IGR1cmluZyBsYXN0IGZzeW5jIG9uIHF3ZXJ0eSwgZjJmcyBjYW4gCj4+IHRyaWdnZXIgYQo+PiAr
IyBjaGVja3BvaW50IHdoaWNoIHdpbGwgcGVyc2lzdCBhbGwgbWV0YWRhdGEgdXBkYXRlcyBiZWZv
cmUgZnN5bmMoKS4KPj4gK2lmIFsgJEZTVFlQID0gImYyZnMiIF07IHRoZW4KPj4gK8KgwqDCoCBl
eHBvcnQgTU9VTlRfT1BUSU9OUz0iLW8gZmFzdGJvb3QiCj4gCj4gQ2FuIHdlIG1lcmdlICJmYXN0
Ym9vdCIgd2l0aCBvcmlnaW5hbCBtb3VudCBvcHRpb25zPyBhbmQgYWZ0ZXIgdGhlIHRlc3QsIAo+
IGhvdyBhYm91dAo+IHJlY292ZXJpbmcgdG8gb3JpZ2luYWwgbW91bnQgb3B0aW9ucz8KPiAKPiBU
aGFua3MsCgpMaWtlIHRoaXM6CgogIGlmIFsgJEZTVFlQID0gImYyZnMiIF07IHRoZW4KLSAgICAg
ICBleHBvcnQgTU9VTlRfT1BUSU9OUz0iLW8gZmFzdGJvb3QiCisgICAgICAgZXhwb3J0IE1PVU5U
X09QVElPTlM9Ii1vIGZhc3Rib290ICRNT1VOVF9PUFRJT05TIgogIGZpCgpyaWdodD8KCkFuZCBJ
IGhhdmUgdGVzdGVkIHRoYXQgdGhlcmUgaXMgbm8gbmVlZCB0byByZWNvdmVyIHRvIG9yaWdpbmFs
IG1vdW50IApvcHRpb25zIGFmdGVyIHRoZSB0ZXN0LiBJdCB3aWxsIGJlIHRoZSBvcmlnaW5hbCBv
bmUgaW4gdGhlIG5leHQgdGVzdC4KClRoYW5rcywKU3VuIEtlCgo+IAo+PiArZmkKPj4gKwo+PiDC
oCBfZmxha2V5X2Ryb3BfYW5kX3JlbW91bnQKPj4gwqAgIyBBZnRlciB0aGUgZnN5bmMgbG9nIGlz
IHJlcGxheWVkLCB0aGUgZmlsZSBzaG91bGQgaGF2ZSBvbmx5IDIgCj4+IHhhdHRycywgdGhlIG9u
ZXMKPiAuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=
