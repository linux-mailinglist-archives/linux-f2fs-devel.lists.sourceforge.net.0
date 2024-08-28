Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDE5962842
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Aug 2024 15:08:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sjIPi-0007EG-I8;
	Wed, 28 Aug 2024 13:08:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lizetao1@huawei.com>) id 1sjIPg-0007E8-V3
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Aug 2024 13:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BgDPKd9ZSsKQIIlkuhMwdFqkL6fDEzuPlPwGts6b23s=; b=ASqZ0AC/d0ZFvA5fIE4Dz3vfbz
 QfqKAVc4p763lONufhIEW90btOM6GcLxyfkm0zhdd82Tl0wTrRlDIj0f44pmmKGWMk+KWiCoB9lwV
 OGp+2QIMKtnL1T/zWi9UD4rCGyW7GzMSyP2CzIAPVDPaYJkoFFgohCvOVLcZAyrlcr+k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BgDPKd9ZSsKQIIlkuhMwdFqkL6fDEzuPlPwGts6b23s=; b=IssQgGL6b2a/v0DdJNEH4y9Y7X
 uit9SarvHvEiuQCZ42iVQCp9a6qLw3j0PzZBF30EonKwA8j7YvPbKp0b2UC/9ordHsQWBXEec6bNB
 obI0f//v5UxlJsA6R63Ki4++Eme5ZHZeezV+pjD3OVxB436zuBsHQKMarf8MyydD6ofQ=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sjIPf-00014a-GA for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Aug 2024 13:08:40 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wv4TB5wC2zyQfQ;
 Wed, 28 Aug 2024 21:07:42 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id 67390180105;
 Wed, 28 Aug 2024 21:08:31 +0800 (CST)
Received: from [10.67.111.176] (10.67.111.176) by
 kwepemd500012.china.huawei.com (7.221.188.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 28 Aug 2024 21:08:30 +0800
Message-ID: <2a0a26e9-ae51-4e69-aa84-30681dc6284f@huawei.com>
Date: Wed, 28 Aug 2024 21:08:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Josef Bacik <josef@toxicpanda.com>
References: <20240822013714.3278193-1-lizetao1@huawei.com>
 <20240823195051.GD2237731@perftesting> <20240823211522.GA2305223@perftesting>
 <20240826140818.GA2393039@perftesting>
In-Reply-To: <20240826140818.GA2393039@perftesting>
X-Originating-IP: [10.67.111.176]
X-ClientProxiedBy: dggpeml500014.china.huawei.com (7.185.36.63) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2024/8/26 22:08, Josef Bacik 写道: > On Fri, Aug 23,
    2024 at 05:15:22PM -0400, Josef Bacik wrote: >> On Fri, Aug 23, 2024 at 03:50:51PM
    -0400, Josef Bacik wrote: >>> On Thu, Aug 22, 2024 at 09:3 [...] 
 
 Content analysis details:   (-0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [45.249.212.187 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [45.249.212.187 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
                             [45.249.212.187 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sjIPf-00014a-GA
Subject: Re: [f2fs-dev] [PATCH -next 00/14] btrfs: Cleaned up folio->page
 conversion
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
From: Li Zetao via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Li Zetao <lizetao1@huawei.com>
Cc: willy@infradead.org, linux-f2fs-devel@lists.sourceforge.net, clm@fb.com,
 terrelln@fb.com, dsterba@suse.com, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgrlnKggMjAyNC84LzI2IDIyOjA4LCBKb3NlZiBCYWNpayDlhpnpgZM6Cj4gT24gRnJpLCBBdWcg
MjMsIDIwMjQgYXQgMDU6MTU6MjJQTSAtMDQwMCwgSm9zZWYgQmFjaWsgd3JvdGU6Cj4+IE9uIEZy
aSwgQXVnIDIzLCAyMDI0IGF0IDAzOjUwOjUxUE0gLTA0MDAsIEpvc2VmIEJhY2lrIHdyb3RlOgo+
Pj4gT24gVGh1LCBBdWcgMjIsIDIwMjQgYXQgMDk6Mzc6MDBBTSArMDgwMCwgTGkgWmV0YW8gd3Jv
dGU6Cj4+Pj4gSGkgYWxsLAo+Pj4+Cj4+Pj4gSW4gYnRyZnMsIGJlY2F1c2UgdGhlcmUgYXJlIHNv
bWUgaW50ZXJmYWNlcyB0aGF0IGRvIG5vdCB1c2UgZm9saW8sCj4+Pj4gdGhlcmUgaXMgcGFnZS1m
b2xpby1wYWdlIG11dHVhbCBjb252ZXJzaW9uLiBUaGlzIHBhdGNoIHNldCBzaG91bGQKPj4+PiBj
bGVhbiB1cCBmb2xpby1wYWdlIGNvbnZlcnNpb24gYXMgbXVjaCBhcyBwb3NzaWJsZSBhbmQgdXNl
IGZvbGlvCj4+Pj4gZGlyZWN0bHkgdG8gcmVkdWNlIGludmFsaWQgY29udmVyc2lvbnMuCj4+Pj4K
Pj4+PiBUaGlzIHBhdGNoIHNldCBzdGFydHMgd2l0aCB0aGUgcmVjdGlmaWNhdGlvbiBvZiBmdW5j
dGlvbiBwYXJhbWV0ZXJzLAo+Pj4+IHVzaW5nIGZvbGlvIGFzIHBhcmFtZXRlcnMgZGlyZWN0bHku
IEFuZCBzb21lIG9mIHRob3NlIGZ1bmN0aW9ucyBoYXZlCj4+Pj4gYWxyZWFkeSBiZWVuIGNvbnZl
cnRlZCB0byBmb2xpbyBpbnRlcm5hbGx5LCBzbyB0aGlzIHBhcnQgaGFzIGxpdHRsZQo+Pj4+IGlt
cGFjdC4KPj4+Pgo+Pj4+IEkgaGF2ZSB0ZXN0ZWQgd2l0aCBmc3N0cmVzcyBtb3JlIHRoYW4gMTAg
aG91cnMsIGFuZCBubyBwcm9ibGVtcyB3ZXJlCj4+Pj4gZm91bmQuIEZvciB0aGUgY29udmVuaWVu
Y2Ugb2YgcmV2aWV3aW5nLCBJIHRyeSBteSBiZXN0IHRvIG9ubHkgbW9kaWZ5Cj4+Pj4gYSBzaW5n
bGUgaW50ZXJmYWNlIGluIGVhY2ggcGF0Y2guCj4+Pj4KPj4+PiBKb3NlZiBhbHNvIHdvcmtlZCBv
biBjb252ZXJ0aW5nIHBhZ2VzIHRvIGZvbGlvcywgYW5kIHRoaXMgcGF0Y2ggc2V0IHdhcwo+Pj4+
IGluc3BpcmVkIGJ5IGhpbToKPj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvY292ZXIu
MTcyMjAyMjM3Ni5naXQuam9zZWZAdG94aWNwYW5kYS5jb20vCj4+Pj4KPj4+Cj4+PiBUaGlzIGxv
b2tzIGdvb2QsIEknbSBydW5uaW5nIGl0IHRocm91Z2ggdGhlIENJLiAgSWYgdGhhdCBjb21lcyBv
dXQgY2xlYW4gdGhlbgo+Pj4gSSdsbCBwdXQgbXkgcmV2aWV3ZWQtYnkgb24gaXQgYW5kIHB1c2gg
aXQgdG8gb3VyIGZvci1uZXh0IGJyYW5jaC4gIFRoZSBDSSBydW4KPj4+IGNhbiBiZSBzZWVuIGhl
cmUKPj4+Cj4+PiBodHRwczovL2dpdGh1Yi5jb20vYnRyZnMvbGludXgvYWN0aW9ucy9ydW5zLzEw
NTMxNTAzNzM0Cj4+Pgo+Pgo+PiBMb29rcyBsaWtlIHRoZSBjb21wcmVzc2lvbiBzdHVmZiBwYW5p
YydlZCwgdGhlIHJ1biBoYXMgdG8gZmluaXNoIGJlZm9yZSBpdAo+PiBjb2xsZWN0cyB0aGUgZG1l
c2cgc28gSURLIHdoZXJlIGl0IGZhaWxlZCB5ZXQsIGJ1dCBJJ2QgZ28gb3ZlciB0aGUgY29tcHJl
c3Npb24KPj4gc3R1ZmYgYWdhaW4gdG8gc2VlIGlmIHlvdSBjYW4gc3BvdCBpdC4gIFdoZW4gdGhl
IHdob2xlIHJ1biBmaW5pc2hlcyB0aGVyZSB3aWxsCj4+IGJlIHRlc3QgYXJ0aWZhY3RzIHlvdSBj
YW4gZ2V0IHRvLiAgSWYgeW91IGRvbid0IGhhdmUgcGVybWlzc2lvbnMgKEkgaG9uZXN0bHkKPj4g
ZG9uJ3Qga25vdyBob3cgdGhlIGFydGlmYWN0cyBwZXJtaXNzaW9uIHN0dWZmIHdvcmtzKSB0aGVu
IG5vIHdvcnJpZXMsIEknbGwgZ3JhYgo+PiBpdCBpbiB0aGUgbW9ybmluZyBhbmQgc2VuZCB5b3Ug
dGhlIHRlc3QgYW5kIGRtZXNnIG9mIHdoYXQgZmVsbCBvdmVyLiAgVGhhbmtzLAo+Pgo+IAo+IFRo
ZXkgYWxsIGZlbGwgb3Zlciwgc28gSSBzdWdnZXN0IHJ1bm5pbmcgZnN0ZXN0cyBhZ2FpbnN0IHlv
dXIgc2VyaWVzIGJlZm9yZSB5b3UKPiByZXNlbmQuICBidHJmcy8wNjkgcGFuaWNlZCBvbiBvbmUg
bWFjaGluZSwgYnRyZnMvMDYwIHBhbmljZWQgb24gb25lIG1hY2hpbmUuCj4gTm9uZSBvZiB0aGUg
bWFjaGluZXMgcGFzc3NlZCB3aXRob3V0IHBhbmljaW5nLiAgVGhhbmtzLAo+IApUaGFuayB5b3Ug
Zm9yIHlvdXIgdGVzdC4gV2hlbiBidHJmcy8wNjAgYW5kIGJ0cmZzLzA2OSBmYWlsZWQgZHVlIHRv
IG15IApjYXJlbGVzc25lc3MsIERhbiBoYXMgaXNzdWVkIGEgcGF0Y2hbMV0gdG8gZml4IGl0LiBB
ZnRlciBhcHBseWluZyBoaXMgCnBhdGNoLCBpdCB3YXMgc3RpbGwgZm91bmQgdGhhdCAzIHRlc3Qg
Y2FzZXMgcmVwb3J0ZWQgZXJyb3JzLiBJIHJldmVydGVkIApteSBwYXRjaHNldCBhbmQgdGhlIGVy
cm9yIHN0aWxsIHBlcnNpc3RzLCBzbyB0aGUgZXJyb3JzIG1heSBub3QgYmUgCmNhdXNlZCBieSBt
eSBwYXRjaC4gQmVsb3cgaXMgdGhlIHRlc3QgbG9nOgoKICAgRmFpbHVyZXM6IGJ0cmZzLzAxMiBi
dHJmcy8yNDkgYnRyZnMvMjg0CiAgIEZhaWxlZCAzIG9mIDMyMiB0ZXN0cwoKTXkgeGZzdGVzdHMg
cHJvamVjdCBpcyBmb3JrZWQgZnJvbSBodHRwczovL2dpdGh1Yi5jb20va2RhdmUveGZzdGVzdHMu
Z2l0Cgo+IEpvc2VmCj4gCgpbMV06IApodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1idHJm
cy8yMDI0MDgyNzE1MzczOS5HWTI1OTYyQHR3aW4uamlrb3MuY3ovVC8jbTNmM2UyOGRhZDA1YTlj
ODM4NWE3MmY1NTAzYTViOWMxMzBiNDRjMDQKCgpUaGFua3MsCkxpIFpldGFvLgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
