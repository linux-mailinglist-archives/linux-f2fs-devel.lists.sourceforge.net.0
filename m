Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6595E4D18E5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Mar 2022 14:15:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nRZgQ-0006wN-EL; Tue, 08 Mar 2022 13:15:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sunke32@huawei.com>) id 1nRZgP-0006wD-4F
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Mar 2022 13:15:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iYxCngVtmUy0/3j25IVILwJpb8suJPvIHzeRuiWHw3g=; b=gNqeWnZLy7STv+1hOeKIl3/PqP
 VPPEZ5rYZJmObdST9/gOgL+5rFMdt/iqlfZNLQagimfAvCRrbKJzvsFYlQi2A6HIKztUMRmhSZkQz
 dkw75CfNRZTjq44blvYr5XpVQPpZRzPHxHTmAJSbJp32jwHR0tZH9SioFamRg4AuFR3E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iYxCngVtmUy0/3j25IVILwJpb8suJPvIHzeRuiWHw3g=; b=RgznGVd8WUMh6brKiM4q1+ToUh
 t5358r3aVVDTjL2TSW17mEFd0SPiD9L5Os+cNdCHESaLKIHJCQOa3l3YnrtoZ7VWfJT7IrflE/M87
 7ztAWY9dBkf3KZ1CfH0pnS7DWKvQEPpzakpFCRBHGhmpeEeV9pHi23xCRKWjspixiEd0=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nRZgI-008bF9-Vq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Mar 2022 13:15:19 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KCbKM6gQ5zbc37;
 Tue,  8 Mar 2022 21:10:15 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 8 Mar 2022 21:15:03 +0800
Received: from [10.174.178.31] (10.174.178.31) by
 kwepemm600010.china.huawei.com (7.193.23.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 8 Mar 2022 21:15:03 +0800
To: <fstests@vger.kernel.org>, <guan@eryu.me>
References: <20220228035719.4102745-1-sunke32@huawei.com>
Message-ID: <bc2d3921-083f-d867-4213-eee05bd6c1cb@huawei.com>
Date: Tue, 8 Mar 2022 21:15:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20220228035719.4102745-1-sunke32@huawei.com>
X-Originating-IP: [10.174.178.31]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Friendly ping... ÔÚ 2022/2/28 11:57, Sun Ke Ð´µÀ: > The test
    fail on f2fs: > xattr names and values after second fsync log replay: > #
    file: SCRATCH_MNT/foobar > +user.attr1="val1" > user.attr3="val3" > > attr1
    is sti [...] 
 
 Content analysis details:   (-4.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [45.249.212.187 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
                             [45.249.212.187 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nRZgI-008bF9-Vq
Subject: Re: [f2fs-dev] [PATCH] generic/066: attr1 is still there after log
 replay on f2fs
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RnJpZW5kbHkgcGluZy4uLgoK1NogMjAyMi8yLzI4IDExOjU3LCBTdW4gS2Ug0LS1wDoKPiBUaGUg
dGVzdCBmYWlsIG9uIGYyZnM6Cj4gICAgICAgeGF0dHIgbmFtZXMgYW5kIHZhbHVlcyBhZnRlciBz
ZWNvbmQgZnN5bmMgbG9nIHJlcGxheToKPiAgICAgICAjIGZpbGU6IFNDUkFUQ0hfTU5UL2Zvb2Jh
cgo+ICAgICAgK3VzZXIuYXR0cjE9InZhbDEiCj4gICAgICAgdXNlci5hdHRyMz0idmFsMyIKPgo+
IGF0dHIxIGlzIHN0aWxsIHRoZXJlIGFmdGVyIGxvZyByZXBsYXkuCj4gSSBndWVzcyBpdCBpcyBm
MmZzJ3Mgc3BlY2lhbCBmZWF0dXJlIHRvIGltcHJvdmUgdGhlIHBlcmZvcm1hbmNlLgo+Cj4gU2ln
bmVkLW9mZi1ieTogU3VuIEtlIDxzdW5rZTMyQGh1YXdlaS5jb20+Cj4gLS0tCj4KPiBJcyBpdCBh
IEJVRyBvbiBmMmZzPwo+ICAgLmdpdGlnbm9yZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDEgKwo+ICAgdGVzdHMvZ2VuZXJpYy8wNjYgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDMgKysrCj4gICB0ZXN0cy9nZW5lcmljLzA2Ni5jZmcgICAgICAgICAgICAgICAgICAgICAg
fCAgMSArCj4gICB0ZXN0cy9nZW5lcmljL3swNjYub3V0ID0+IDA2Ni5vdXQuZGVmYXVsdH0gfCAg
MAo+ICAgdGVzdHMvZ2VuZXJpYy8wNjYub3V0LmYyZnMgICAgICAgICAgICAgICAgIHwgMTEgKysr
KysrKysrKysKPiAgIDUgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHRlc3RzL2dlbmVyaWMvMDY2LmNmZwo+ICAgcmVuYW1lIHRlc3RzL2dlbmVy
aWMvezA2Ni5vdXQgPT4gMDY2Lm91dC5kZWZhdWx0fSAoMTAwJSkKPiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCB0ZXN0cy9nZW5lcmljLzA2Ni5vdXQuZjJmcwo+Cj4gZGlmZiAtLWdpdCBhLy5naXRpZ25v
cmUgYi8uZ2l0aWdub3JlCj4gaW5kZXggNjViOTMzMDcuLjEzNTc0MmY1IDEwMDY0NAo+IC0tLSBh
Ly5naXRpZ25vcmUKPiArKysgYi8uZ2l0aWdub3JlCj4gQEAgLTE5NCw2ICsxOTQsNyBAQCB0YWdz
Cj4gICAvc3JjL3BlcmYvKi5weWMKPiAgIAo+ICAgIyBTeW1saW5rZWQgZmlsZXMKPiArL3Rlc3Rz
L2dlbmVyaWMvMDY2Lm91dAo+ICAgL3Rlc3RzL2dlbmVyaWMvMDM1Lm91dAo+ICAgL3Rlc3RzL2dl
bmVyaWMvMDUwLm91dAo+ICAgL3Rlc3RzL3hmcy8wMzMub3V0Cj4gZGlmZiAtLWdpdCBhL3Rlc3Rz
L2dlbmVyaWMvMDY2IGIvdGVzdHMvZ2VuZXJpYy8wNjYKPiBpbmRleCAxMDVhN2FjZC4uNTI0ZGM4
MmQgMTAwNzU1Cj4gLS0tIGEvdGVzdHMvZ2VuZXJpYy8wNjYKPiArKysgYi90ZXN0cy9nZW5lcmlj
LzA2Ngo+IEBAIC0xNyw2ICsxNyw3IEBACj4gICAjCj4gICAjICBCdHJmczogcmVtb3ZlIGRlbGV0
ZWQgeGF0dHJzIG9uIGZzeW5jIGxvZyByZXBsYXkKPiAgICMKPiArc2VxZnVsbD0kMAo+ICAgLiAu
L2NvbW1vbi9wcmVhbWJsZQo+ICAgX2JlZ2luX2ZzdGVzdCBhdXRvIHF1aWNrIGF0dHIgbWV0YWRh
dGEgbG9nCj4gICAKPiBAQCAtMzIsNiArMzMsOCBAQCBfY2xlYW51cCgpCj4gICAuIC4vY29tbW9u
L2RtZmxha2V5Cj4gICAuIC4vY29tbW9uL2F0dHIKPiAgIAo+ICsjIFNlbGVjdCBhcHByb3ByaWF0
ZSBnb2xkZW4gb3V0cHV0IGJhc2VkIG9uIGZzdHlwZQo+ICtfbGlua19vdXRfZmlsZQo+ICAgIyBy
ZWFsIFFBIHRlc3Qgc3RhcnRzIGhlcmUKPiAgIF9zdXBwb3J0ZWRfZnMgZ2VuZXJpYwo+ICAgX3Jl
cXVpcmVfc2NyYXRjaAo+IGRpZmYgLS1naXQgYS90ZXN0cy9nZW5lcmljLzA2Ni5jZmcgYi90ZXN0
cy9nZW5lcmljLzA2Ni5jZmcKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAw
Li5jMjU2NDFiZQo+IC0tLSAvZGV2L251bGwKPiArKysgYi90ZXN0cy9nZW5lcmljLzA2Ni5jZmcK
PiBAQCAtMCwwICsxIEBACj4gK2YyZnM6IGYyZnMKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvZ2VuZXJp
Yy8wNjYub3V0IGIvdGVzdHMvZ2VuZXJpYy8wNjYub3V0LmRlZmF1bHQKPiBzaW1pbGFyaXR5IGlu
ZGV4IDEwMCUKPiByZW5hbWUgZnJvbSB0ZXN0cy9nZW5lcmljLzA2Ni5vdXQKPiByZW5hbWUgdG8g
dGVzdHMvZ2VuZXJpYy8wNjYub3V0LmRlZmF1bHQKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvZ2VuZXJp
Yy8wNjYub3V0LmYyZnMgYi90ZXN0cy9nZW5lcmljLzA2Ni5vdXQuZjJmcwo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAuLjhmYzU4NjkzCj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL3Rlc3RzL2dlbmVyaWMvMDY2Lm91dC5mMmZzCj4gQEAgLTAsMCArMSwxMSBAQAo+ICtRQSBv
dXRwdXQgY3JlYXRlZCBieSAwNjYKPiAreGF0dHIgbmFtZXMgYW5kIHZhbHVlcyBhZnRlciBmaXJz
dCBmc3luYyBsb2cgcmVwbGF5Ogo+ICsjIGZpbGU6IFNDUkFUQ0hfTU5UL2Zvb2Jhcgo+ICt1c2Vy
LmF0dHIxPSJ2YWwxIgo+ICt1c2VyLmF0dHIzPSJ2YWwzIgo+ICsKPiAreGF0dHIgbmFtZXMgYW5k
IHZhbHVlcyBhZnRlciBzZWNvbmQgZnN5bmMgbG9nIHJlcGxheToKPiArIyBmaWxlOiBTQ1JBVENI
X01OVC9mb29iYXIKPiArdXNlci5hdHRyMT0idmFsMSIKPiArdXNlci5hdHRyMz0idmFsMyIKPiAr
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
