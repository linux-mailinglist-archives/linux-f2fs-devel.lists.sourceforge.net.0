Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5834AD495
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Feb 2022 10:18:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nHMdg-00028Z-5J; Tue, 08 Feb 2022 09:18:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nHMdf-00028T-7h
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Feb 2022 09:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bMK1RXPSrIAj6EYFofoRjvnQSgEI7shT11kjfl2nKDA=; b=aujE/DN3fPCoj4KOEohysluYrD
 eKzTDs0qJSgpJQkwgZJdksLU/6KRAjy69ukH/opeSWNnVNyNqIQvo5aUH8dv1YlzJBi5JP7e7ioWu
 DJUCl/Wm7ZA/mAVGPfMsSPqy7DhTT6PaIJv7Iy4xU9sfKDikZ0lj3x5qq0wAoXSTMwtE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bMK1RXPSrIAj6EYFofoRjvnQSgEI7shT11kjfl2nKDA=; b=EiItjoHNnliU61p0wYlc3EDoWh
 TNaeqaIJ/AEOAwjaM3DuXUVwpxuuIe7Zo4q+v8AXOFNIB8AxlUhVNUgwXIiHPWglWFctGYc1toxQU
 MlPNMlZ82uM0ieGhGa4vaSfXhHEkYZ7CY4gSQd5ZMY/mZojNH5NTqo3nFyVNFFijiJ50=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nHMdb-0001l3-UO
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Feb 2022 09:18:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8B06461479
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  8 Feb 2022 09:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CD4C340EE;
 Tue,  8 Feb 2022 09:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644311886;
 bh=I7Xie7sMfICHs14aE9eDxrmpTe6fMPFsk6GoOxJmkV8=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=g2SIl1sv37Wg4HfiTuc4dZnLg2S/byf3jUtnH3uIc4WvhjoID1lqvjW6LXqKoZ09y
 KJaXGAbCLiMOl0wys7ZCmWmeT2Fx2xPwaTXoZ3ZZJZ6lVnKu3/rQkqPNJ1f5NEJeMk
 1Ovl49WTI0DoSyXnD9KNIDP39i5U+0J28WZuuFMKPe+UV2PbVEY93HpsSm6pkDcWOo
 zi9BuuErpypqH+TrJl38bj6QOjzLVmakbAjevbg858sHUeDausKlm4Tsu3MfoJDQXh
 Ei3Wb7fUIFDqoMCTQGPh/JHreg5ddJVjBg2shjWIIvmLVKeAMytFsfIEb4Ruc3xhCQ
 qUjloscENnUNg==
Message-ID: <2cd93012-16b8-6681-cabe-c1401987bf27@kernel.org>
Date: Tue, 8 Feb 2022 17:18:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220207113516.9489-1-chao@kernel.org>
 <YgFvqnoa61BspqmW@google.com>
 <59da7f3e-92bd-1165-00e3-3dc18ae19aea@kernel.org>
In-Reply-To: <59da7f3e-92bd-1165-00e3-3dc18ae19aea@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2022/2/8 9:35, Chao Yu wrote: > On 2022/2/8 3:14, Jaegeuk
    Kim wrote: >> On 02/07, Chao Yu wrote: >>> During checkpoint, we have committed
    preflush command via f2fs_flush_device_cache() >> >>   787 [...] 
 
 Content analysis details:   (-7.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nHMdb-0001l3-UO
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid unneeded preflush during
 checkpoint()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMi8yLzggOTozNSwgQ2hhbyBZdSB3cm90ZToKPiBPbiAyMDIyLzIvOCAzOjE0LCBKYWVn
ZXVrIEtpbSB3cm90ZToKPj4gT24gMDIvMDcsIENoYW8gWXUgd3JvdGU6Cj4+PiBEdXJpbmcgY2hl
Y2twb2ludCwgd2UgaGF2ZSBjb21taXR0ZWQgcHJlZmx1c2ggY29tbWFuZCB2aWEgZjJmc19mbHVz
aF9kZXZpY2VfY2FjaGUoKQo+Pgo+PiDCoCA3ODcgaW50IGYyZnNfZmx1c2hfZGV2aWNlX2NhY2hl
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPj4gwqAgNzg4IHsKPj4gwqAgNzg5wqDCoMKgwqDC
oMKgwqDCoCBpbnQgcmV0ID0gMCwgaTsKPj4gwqAgNzkwCj4+IMKgIDc5McKgwqDCoMKgwqDCoMKg
wqAgaWYgKCFmMmZzX2lzX211bHRpX2RldmljZShzYmkpKQo+PiDCoCA3OTLCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4KPj4gU2VlbXMgYSB3cm9uZyBhc3N1bXB0
aW9uLgo+IAo+IE9oLCBJIG1pc3NlZCB0aGF0IGYyZnNfZmx1c2hfZGV2aWNlX2NhY2hlIHdhcyBp
bnRyb2R1Y2VkIHRvIGZsdXNoIGRldmljZXMgZXhjZXB0Cj4gZmlyc3QgZGV2aWNlIHdoZW4gbXVs
dGktZGV2aWNlIGZlYXR1cmUgaXMgb24uCj4gCj4gIMKgwqDCoMKgZm9yIChpID0gMTsgaSA8IHNi
aS0+c19uZGV2czsgaSsrKSB7Cj4gIMKgwqDCoMKgwqDCoMKgIGludCBjb3VudCA9IERFRkFVTFRf
UkVUUllfSU9fQ09VTlQ7Cj4gCj4gU28sIHRoaXMgcGF0Y2ggc2VlbXMgd3JvbmcuLi4KPiAKPiBJ
bnN0ZWFkLCBiZWxvdyBjYXNlIGxvb2tzIHdyb25nIHNpbmNlIGl0IG5lZWRzIHRvIHRyaWdnZXIg
Zmx1c2ggZHVyaW5nIGNoZWNrcG9pbnQoKQo+IG5vIG1hdHRlciBub2JhcnJpZXIgaXMgb24gb3Ig
b2ZmLgoKV3JvbmcgY29tbWVudHMsIGxldCdzIGlnbm9yZSB0aGlzIHBhdGNoLCBzb3JyeS4KClRo
YW5rcywKCj4gCj4gIMKgwqDCoMKgaWYgKHRlc3Rfb3B0KHNiaSwgTk9CQVJSSUVSKSkKPiAgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4gCj4gVGhhbmtzLAo+IAo+Pgo+Pj4gdG8gcGVyc2lzdCBh
bGwgbWV0YWRhdGEgcGFnZXMgZXhjZXB0IGxhc3QgIzIgQ1AgcGFjayBwYWdlLCBzbyB3ZSBkb24n
dCBuZWVkIHRvCj4+PiBjb21taXQgYW5vdGhlciBwcmVmbHVzaCBjb21tYW5kIGluIGNvbW1pdF9j
aGVja3BvaW50KCksIHJlbW92ZSBpdCB0byBhdm9pZCB1bm5lZWRlZAo+Pj4gd3JpdGUgY2FjaGUg
b3ZlcmhlYWQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
Pgo+Pj4gLS0tCj4+PiDCoCBmcy9mMmZzL2RhdGEuYyB8IDIgKy0KPj4+IMKgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9m
cy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4+PiBpbmRleCA4YzQxNzg2NGM2NmEuLjE1
YWMxOGJiYmM4ZSAxMDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4+PiArKysgYi9mcy9m
MmZzL2RhdGEuYwo+Pj4gQEAgLTU5OCw3ICs1OTgsNyBAQCBzdGF0aWMgdm9pZCBfX2YyZnNfc3Vi
bWl0X21lcmdlZF93cml0ZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgaW8tPmZpby5vcCA9IFJFUV9PUF9XUklURTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBpby0+ZmlvLm9wX2ZsYWdzID0gUkVRX01FVEEgfCBSRVFfUFJJTyB8IFJFUV9TWU5DOwo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgIGlmICghdGVzdF9vcHQoc2JpLCBOT0JBUlJJRVIpKQo+Pj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaW8tPmZpby5vcF9mbGFncyB8PSBSRVFfUFJFRkxVU0ggfCBS
RVFfRlVBOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW8tPmZpby5vcF9mbGFncyB8PSBS
RVFfRlVBOwo+Pj4gwqDCoMKgwqDCoCB9Cj4+PiDCoMKgwqDCoMKgIF9fc3VibWl0X21lcmdlZF9i
aW8oaW8pOwo+Pj4gwqDCoMKgwqDCoCB1cF93cml0ZSgmaW8tPmlvX3J3c2VtKTsKPj4+IC0tIAo+
Pj4gMi4zMi4wCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
