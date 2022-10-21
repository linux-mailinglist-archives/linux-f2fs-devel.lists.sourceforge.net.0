Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8296B607328
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 11:00:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olntW-0007W4-Gd;
	Fri, 21 Oct 2022 09:00:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyingliang@huawei.com>) id 1olnsx-0007V3-MF
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 09:00:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ezMSvDrY3DZBmJJm3C3hflsncD1eIFVmvd8eMJYE/Ow=; b=Uo2OnKdIbd6ZqR2/UGDHelEZzZ
 WzYvRDHvOOkB1LnWXYwQxmH4zfDXSFzBJSzWPhFuheKHF6ugJwzxUSqgiKumcTX440aeiFuwWGfAo
 iJ5TwTMX7EF1zqq+jzmtbxsED1ydG7k/eVxNiTfV7Ks45+Gwi+FCQTydO5W0vtvmeMpY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ezMSvDrY3DZBmJJm3C3hflsncD1eIFVmvd8eMJYE/Ow=; b=TxCY1+UOB5KNMd36ulmWZPVUgK
 M8QavGsdzEuXeuzWtYRueLG2ztdvR/a7gqjHucREN25cSj4GRnb9ofElPKXxnO9Suz2ijqvXnl2PT
 0vpW/rZg1b8ZNhSus5VJjQ4nkPKhwetH9oaEymRrWSawRW50WIkOm6Rp5jOVLShtJ/C0=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olnsq-00C749-5d for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 09:00:11 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Mtz1T2m19zHvFM;
 Fri, 21 Oct 2022 16:59:41 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 16:59:48 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 16:59:47 +0800
To: Greg KH <gregkh@linuxfoundation.org>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
 <d559793a-0ce4-3384-e74e-19855aa31f31@amd.com> <Y1IwLOUGayjT9p6d@kroah.com>
 <0591e66f-731a-5f81-fc9d-3a6d80516c65@huawei.com>
 <Y1JZ9IUPL6jZIQ8E@kroah.com>
Message-ID: <f1210e20-d167-26c4-7aba-490d8fb7241e@huawei.com>
Date: Fri, 21 Oct 2022 16:59:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <Y1JZ9IUPL6jZIQ8E@kroah.com>
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/21 16:36, Greg KH wrote: > On Fri, Oct 21, 2022
 at 04:24:23PM +0800, Yang Yingliang wrote: >> On 2022/10/21 13:37, Greg KH
 wrote: >>> On Fri, Oct 21, 2022 at 01:29:31AM -0400, Luben Tuikov [...] 
 Content analysis details:   (-4.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1olnsq-00C749-5d
Subject: Re: [f2fs-dev] [PATCH 00/11] fix memory leak while kset_register()
 fails
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
From: Yang Yingliang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yang Yingliang <yangyingliang@huawei.com>
Cc: rafael@kernel.org, qemu-devel@nongnu.org, liushixin2@huawei.com,
 joseph.qi@linux.alibaba.com, linux-mtd@lists.infradead.org, richard@nod.at,
 mark@fasheh.com, mst@redhat.com, amd-gfx@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, hsiangkao@linux.alibaba.com,
 somlo@cmu.edu, jlbec@evilplan.org, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 alexander.deucher@amd.com, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, ocfs2-devel@oss.oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ck9uIDIwMjIvMTAvMjEgMTY6MzYsIEdyZWcgS0ggd3JvdGU6Cj4gT24gRnJpLCBPY3QgMjEsIDIw
MjIgYXQgMDQ6MjQ6MjNQTSArMDgwMCwgWWFuZyBZaW5nbGlhbmcgd3JvdGU6Cj4+IE9uIDIwMjIv
MTAvMjEgMTM6MzcsIEdyZWcgS0ggd3JvdGU6Cj4+PiBPbiBGcmksIE9jdCAyMSwgMjAyMiBhdCAw
MToyOTozMUFNIC0wNDAwLCBMdWJlbiBUdWlrb3Ygd3JvdGU6Cj4+Pj4gT24gMjAyMi0xMC0yMCAy
MjoyMCwgWWFuZyBZaW5nbGlhbmcgd3JvdGU6Cj4+Pj4+IFRoZSBwcmV2aW91cyBkaXNjdXNzaW9u
IGxpbms6Cj4+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMGRiNDg2ZWItNjkyNy05
MjdlLTM2MjktOTU4ZjhmMjExMTk0QGh1YXdlaS5jb20vVC8KPj4+PiBUaGUgdmVyeSBmaXJzdCBk
aXNjdXNzaW9uIG9uIHRoaXMgd2FzIGhlcmU6Cj4+Pj4KPj4+PiBodHRwczovL3d3dy5zcGluaWNz
Lm5ldC9saXN0cy9kcmktZGV2ZWwvbXNnMzY4MDc3Lmh0bWwKPj4+Pgo+Pj4+IFBsZWFzZSB1c2Ug
dGhpcyBsaW5rLCBhbmQgbm90IHRoZSB0aGF0IG9uZSB1cCB0aGVyZSB5b3Ugd2hpY2ggcXVvdGVk
IGFib3ZlLAo+Pj4+IGFuZCB3aG9zZSBjb21taXQgZGVzY3JpcHRpb24gaXMgdGFrZW4gdmVyYmF0
aW0gZnJvbSB0aGUgdGhpcyBsaW5rLgo+Pj4+Cj4+Pj4+IGtzZXRfcmVnaXN0ZXIoKSBpcyBjdXJy
ZW50bHkgdXNlZCBpbiBzb21lIHBsYWNlcyB3aXRob3V0IGNhbGxpbmcKPj4+Pj4ga3NldF9wdXQo
KSBpbiBlcnJvciBwYXRoLCBiZWNhdXNlIHRoZSBjYWxsZXJzIHRoaW5rIGl0IHNob3VsZCBiZQo+
Pj4+PiBrc2V0IGludGVybmFsIHRoaW5nIHRvIGRvLCBidXQgdGhlIGRyaXZlciBjb3JlIGNhbiBu
b3Qga25vdyB3aGF0Cj4+Pj4+IGNhbGxlciBkb2luZyB3aXRoIHRoYXQgbWVtb3J5IGF0IHRpbWVz
LiBUaGUgbWVtb3J5IGNvdWxkIGJlIGZyZWVkCj4+Pj4+IGJvdGggaW4ga3NldF9wdXQoKSBhbmQg
ZXJyb3IgcGF0aCBvZiBjYWxsZXIsIGlmIGl0IGlzIGNhbGxlZCBpbgo+Pj4+PiBrc2V0X3JlZ2lz
dGVyKCkuCj4+Pj4gQXMgSSBleHBsYWluZWQgaW4gdGhlIGxpbmsgYWJvdmUsIHRoZSByZWFzb24g
dGhlcmUncwo+Pj4+IGEgbWVtb3J5IGxlYWsgaXMgdGhhdCBvbmUgY2Fubm90IGNhbGwga3NldF9y
ZWdpc3RlcigpIHdpdGhvdXQKPj4+PiB0aGUga3NldC0+a29iai5uYW1lIGJlaW5nIHNldC0ta29i
al9hZGRfaW50ZXJuYWwoKSByZXR1cm5zIC1FSU5WQUwsCj4+Pj4gaW4gdGhpcyBjYXNlLCBpLmUu
IGtzZXRfcmVnaXN0ZXIoKSBmYWlscyB3aXRoIC1FSU5WQUwuCj4+Pj4KPj4+PiBUaHVzLCB0aGUg
bW9zdCBjb21tb24gdXNhZ2UgaXMgc29tZXRoaW5nIGxpa2UgdGhpczoKPj4+Pgo+Pj4+IAlrb2Jq
X3NldF9uYW1lKCZrc2V0LT5rb2JqLCBmb3JtYXQsIC4uLik7Cj4+Pj4gCWtzZXQtPmtvYmoua3Nl
dCA9IHBhcmVudF9rc2V0Owo+Pj4+IAlrc2V0LT5rb2JqLmt0eXBlID0ga3R5cGU7Cj4+Pj4gCXJl
cyA9IGtzZXRfcmVnaXN0ZXIoa3NldCk7Cj4+Pj4KPj4+PiBTbywgd2hhdCBpcyBiZWluZyBsZWFr
ZWQsIGlzIHRoZSBtZW1vcnkgYWxsb2NhdGVkIGluIGtvYmpfc2V0X25hbWUoKSwKPj4+PiBieSB0
aGUgY29tbW9uIGlkaW9tIHNob3duIGFib3ZlLiBUaGlzIG5lZWRzIHRvIGJlIG1lbnRpb25lZCBp
bgo+Pj4+IHRoZSBkb2N1bWVudGF0aW9uLCBhdCBsZWFzdCwgaW4gY2FzZSwgaW4gdGhlIGZ1dHVy
ZSB0aGlzIGlzIGFic29sdmVkCj4+Pj4gaW4ga3NldF9yZWdpc3RlcigpIHJlZGVzaWduLCBldGMu
Cj4+PiBCYXNlZCBvbiB0aGlzLCBjYW4ga3NldF9yZWdpc3RlcigpIGp1c3QgY2xlYW4gdXAgZnJv
bSBpdHNlbGYgd2hlbiBhbgo+Pj4gZXJyb3IgaGFwcGVucz8gIElkZWFsbHkgdGhhdCB3b3VsZCBi
ZSB0aGUgY2FzZSwgYXMgdGhlIG9kZHMgb2YgYSBrc2V0Cj4+PiBiZWluZyBlbWJlZGRlZCBpbiBh
IGxhcmdlciBzdHJ1Y3R1cmUgaXMgcHJvYmFibHkgc2xpbSwgYnV0IHdlIHdvdWxkIGhhdmUKPj4+
IHRvIHNlYXJjaCB0aGUgdHJlZSB0byBtYWtlIHN1cmUuCj4+IEkgaGF2ZSBzZWFyY2ggdGhlIHdo
b2xlIHRyZWUsIHRoZSBrc2V0IHVzZWQgaW4gYnVzX3JlZ2lzdGVyKCkgLSBwYXRjaCAjMywKPj4g
a3NldF9jcmVhdGVfYW5kX2FkZCgpIC0gcGF0Y2ggIzQKPj4gX19jbGFzc19yZWdpc3RlcigpIC0g
cGF0Y2ggIzUswqAgZndfY2ZnX2J1aWxkX3N5bWxpbmsoKSAtIHBhdGNoICM2IGFuZAo+PiBhbWRn
cHVfZGlzY292ZXJ5LmMgLSBwYXRjaCAjMTAKPj4gaXMgZW1iZWRkZWQgaW4gYSBsYXJnZXIgc3Ry
dWN0dXJlLiBJbiB0aGVzZSBjYXNlcywgd2UgY2FuIG5vdCBjYWxsCj4+IGtzZXRfcHV0KCkgaW4g
ZXJyb3IgcGF0aCBpbiBrc2V0X3JlZ2lzdGVyKCkKPiBZZXMgeW91IGNhbiBhcyB0aGUga29iamVj
dCBpbiB0aGUga3NldCBzaG91bGQgTk9UIGJlIGNvbnRyb2xpbmcgdGhlCj4gbGlmZXNwYW4gb2Yg
dGhvc2UgbGFyZ2VyIG9iamVjdHMuCj4KPiBJZiBpdCBpcywgcGxlYXNlIHBvaW50IG91dCB0aGUg
Y2FsbCBjaGFpbiBoZXJlIGFzIEkgZG9uJ3QgdGhpbmsgdGhhdAo+IHNob3VsZCBiZSBwb3NzaWJs
ZS4KPgo+IE5vdGUgYWxsIG9mIHRoaXMgaXMgYSBtZXNzIGJlY2F1c2UgdGhlIGtvYmplY3QgbmFt
ZSBzdHVmZiB3YXMgYWRkZWQgbXVjaAo+IGxhdGVyLCBhZnRlciB0aGUgZHJpdmVyIG1vZGVsIGhh
ZCBiZWVuIGNyZWF0ZWQgYW5kIHJ1bm5pbmcgZm9yIGEgd2hpbGUuCj4gV2UgbWlzc2VkIHRoaXMg
ZXJyb3IgcGF0aCB3aGVuIGFkZGluZyB0aGUgZHluYW1pYyBrb2JqZWN0IG5hbWUgbG9naWMsCj4g
dGhhbmsgZm9yIGxvb2tpbmcgaW50byB0aGlzLgo+Cj4gSWYgeW91IGNvdWxkIHRlc3QgdGhlIHBh
dGNoIHBvc3RlZCB3aXRoIHlvdXIgZXJyb3IgaW5qZWN0aW9uIHN5c3RlbXMsCj4gdGhhdCBjb3Vs
ZCBtYWtlIHRoaXMgYWxsIG11Y2ggc2ltcGxlciB0byBzb2x2ZS4KClRoZSBwYXRjaCBwb3N0ZWQg
YnkgTHViZW4gd2lsbCBjYXVzZSBkb3VibGUgZnJlZSBpbiBzb21lIGNhc2VzLgoKCiBGcm9tIDcx
ZTBhMjI4MDFjMDY5OWY2N2VhNDBlZDk2ZTBhN2Q3ZDllMGYzMTggTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCkZyb206IEx1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+CkRhdGU6IEZy
aSwgMjEgT2N0IDIwMjIgMDM6MzQ6MjEgLTA0MDAKU3ViamVjdDogW1BBVENIXSBrb2JqZWN0OiBB
ZGQga3NldF9wdXQoKSBpZiBrc2V0X3JlZ2lzdGVyKCkgZmFpbHMKWC1jaGVjay1zdHJpbmctbGVh
azogdjEuMAoKSWYga3NldF9yZWdpc3RlcigpIGZhaWxzLCB3ZSBjYWxsIGtzZXRfcHV0KCkgYmVm
b3JlIHJldHVybmluZyB0aGUKZXJyb3IuIFRoaXMgbWFrZXMgc3VyZSB0aGF0IHdlIGZyZWUgbWVt
b3J5IGFsbG9jYXRlZCBieSBrb2JqX3NldF9uYW1lKCkKZm9yIHRoZSBrc2V0LCBzaW5jZSBrc2V0
X3JlZ2lzdGVyKCkgY2Fubm90IGJlIGNhbGxlZCB1bmxlc3MgdGhlIGtzZXQgaGFzCmEgbmFtZSwg
dXN1YWxseSBnb3R0ZW4gdmlhIGtvYmpfc2V0X25hbWUoJmtzZXQtPmtvYmosIGZvcm1hdCwgLi4u
KTsKCkNjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgpD
YzogUmFmYWVsIEouIFd5c29ja2kgPHJhZmFlbEBrZXJuZWwub3JnPgpDYzogWWFuZyBZaW5nbGlh
bmcgPHlhbmd5aW5nbGlhbmdAaHVhd2VpLmNvbT4KQ2M6IExpbnV4IEtlcm5lbCBNYWlsaW5nIExp
c3QgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IEx1YmVuIFR1
aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+Ci0tLQogwqBsaWIva29iamVjdC5jIHwgNCArKyst
CiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9saWIva29iamVjdC5jIGIvbGliL2tvYmplY3QuYwppbmRleCBhMGIyZGJmY2ZhMjMz
NC4uYzEyMmI5NzlmMmI3NWUgMTAwNjQ0Ci0tLSBhL2xpYi9rb2JqZWN0LmMKKysrIGIvbGliL2tv
YmplY3QuYwpAQCAtODQ0LDggKzg0NCwxMCBAQCBpbnQga3NldF9yZWdpc3RlcihzdHJ1Y3Qga3Nl
dCAqaykKCiDCoMKgwqDCoCBrc2V0X2luaXQoayk7CiDCoMKgwqDCoCBlcnIgPSBrb2JqZWN0X2Fk
ZF9pbnRlcm5hbCgmay0+a29iaik7Ci3CoMKgwqAgaWYgKGVycikKK8KgwqDCoCBpZiAoZXJyKSB7
CivCoMKgwqAgwqDCoMKgIGtzZXRfcHV0KGspOwogwqDCoMKgwqAgwqDCoMKgIHJldHVybiBlcnI7
CivCoMKgwqAgfQogwqDCoMKgwqAga29iamVjdF91ZXZlbnQoJmstPmtvYmosIEtPQkpfQUREKTsK
IMKgwqDCoMKgIHJldHVybiAwOwogwqB9Ci0tIAoyLjM4LjAtcmMyCgo+Cj4gdGhhbmtzLAo+Cj4g
Z3JlZyBrLWgKPiAuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
