Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AE367458F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Jan 2023 23:11:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pId8G-0006yy-5m;
	Thu, 19 Jan 2023 22:11:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mkarcher@zedat.fu-berlin.de>) id 1pId8C-0006ys-VR
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 22:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=99u4QbRJmltszSmEfDBmEyKbNIgB3K7LFPI1t4QDyBM=; b=ONEtQI/wpkMrUaUpj1AWJhTE3H
 vSgfylHtazvZHtB86NjUkR1POWX0kOAwDW4na5qyLyxvppLvhZXKU3jlYWr3BCTQYaIJ3EQsgtvjh
 9zsh+Ek7ywW9sJEsDTPe8OwNdtOzfaO6dVsSbXMqcVLI+3jHeKylcY+0paNvhEvXd2wo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=99u4QbRJmltszSmEfDBmEyKbNIgB3K7LFPI1t4QDyBM=; b=damM/jYCIA8qvXhzGG8ex+sSIp
 vk9fKxLBgoiR+F8TOTaJwJlja9QQx5mR1ciQ8Fy0hJyldMUymjNUpiObdLSbPLwG94BnBx0L/aSN/
 vXmtfD/JmoxfmgVd7YYFrIAdf9TFYnvNm73ZCQLPM7HZFxYMoGOIMoLwxYREfJlKBP3o=;
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pId8A-009bLz-2W for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 22:11:35 +0000
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.95) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <mkarcher@zedat.fu-berlin.de>)
 id 1pId7s-000ES9-TO; Thu, 19 Jan 2023 23:11:16 +0100
Received: from pd9f631ca.dip0.t-ipconnect.de ([217.246.49.202]
 helo=[192.168.144.87]) by inpost2.zedat.fu-berlin.de (Exim 4.95)
 with esmtpsa (TLS1.3) tls TLS_AES_128_GCM_SHA256
 (envelope-from <Michael.Karcher@fu-berlin.de>)
 id 1pId7s-002cf1-Mu; Thu, 19 Jan 2023 23:11:16 +0100
Message-ID: <1732342f-49fe-c20e-b877-bc0a340e1a50@fu-berlin.de>
Date: Thu, 19 Jan 2023 23:11:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <CAHk-=wgf929uGOVpiWALPyC7pv_9KbwB2EAvQ3C4woshZZ5zqQ@mail.gmail.com>
 <20221227082932.798359-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg>
 <c05bee5d-0d69-289b-fe4b-98f4cd31a4f5@physik.fu-berlin.de>
 <CAMuHMdXNJveXHeS=g-aHbnxtyACxq1wCeaTg8LbpYqJTCqk86g@mail.gmail.com>
 <3800eaa8-a4da-b2f0-da31-6627176cb92e@physik.fu-berlin.de>
 <CAMuHMdWbBRkhecrqcir92TgZnffMe8ku2t7PcVLqA6e6F-j=iw@mail.gmail.com>
 <429140e0-72fe-c91c-53bc-124d33ab5ffa@physik.fu-berlin.de>
 <CAMuHMdWpHSsAB3WosyCVgS6+t4pU35Xfj3tjmdCDoyS2QkS7iw@mail.gmail.com>
 <0d238f02-4d78-6f14-1b1b-f53f0317a910@physik.fu-berlin.de>
From: "Michael.Karcher" <Michael.Karcher@fu-berlin.de>
In-Reply-To: <0d238f02-4d78-6f14-1b1b-f53f0317a910@physik.fu-berlin.de>
X-Original-Sender: Michael.Karcher@fu-berlin.de
X-Originating-IP: 217.246.49.202
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Isn't this supposed to be caught by this check: >>> >>>         
    a, __same_type(a, NULL) >>> >>> ? >> >> Yeah, but gcc thinks it is smarter
    than us... >> Probably it drops the test, assuming U [...] 
 
 Content analysis details:   (-4.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [130.133.4.66 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [130.133.4.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1pId8A-009bLz-2W
Subject: Re: [f2fs-dev] Calculating array sizes in C - was: Re: Build
 regressions/improvements in v6.2-rc1
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
Cc: linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 linux-sh@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 linux-f2fs-devel@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SXNuJ3QgdGhpcyBzdXBwb3NlZCB0byBiZSBjYXVnaHQgYnkgdGhpcyBjaGVjazoKPj4+Cj4+PiDC
oMKgwqDCoMKgwqDCoMKgIGEsIF9fc2FtZV90eXBlKGEsIE5VTEwpCj4+Pgo+Pj4gPwo+Pgo+PiBZ
ZWFoLCBidXQgZ2NjIHRoaW5rcyBpdCBpcyBzbWFydGVyIHRoYW4gdXMuLi4KPj4gUHJvYmFibHkg
aXQgZHJvcHMgdGhlIHRlc3QsIGFzc3VtaW5nIFVCIGNhbm5vdCBoYXBwZW4uCj4gSG1tLCBzb3Vu
ZHMgbGlrZSBhIEdHQyBidWcgdG8gbWUgdGhlbi4gTm90IHN1cmUgaG93IHRvIGZpeCB0aGlzIHRo
ZW4uCgoKSSBkb24ndCBzZWUgYSBjbGVhciBidWcgYXQgdGhpcyBwb2ludC4gV2UgYXJlIHRhbGtp
bmcgYWJvdXQgdGhlIEMgZXhwcmVzc2lvbgoKIMKgIF9fc2FtZV90eXBlKCh2b2lkKikwLCAodm9p
ZCopMCk/IDAgOiBzaXplb2YoKHZvaWQqKTApL3NpemVvZigqKCh2b2lkKjApKQoKVGhpcyBleHBy
ZXNzaW9uIGlzIHZhbGlkIChhc3N1bWluZyBfX3NhbWVfdHlwZSB3b3Jrcywgd2hpY2ggaXMgYSBH
Q0MgCmV4dGVuc2lvbiksIGFuZCBzaG91bGQgcmV0dXJuIDAuIEFzIG9mIG5vdywgSSBoYXZlIG5v
IGluZGljYXRpb24gdGhhdCAKdGhpcyBleHByZXNzaW9uIGRvZXMgbm90IHJldHVybiAwLiBBbHNv
LCBpdCBpcyB0cnVlIHRoYXQgdGhpcyBleHByZXNzaW9uIApjb250YWlucyB0aGUgc3VzcGljaW91
cyBwYXR0ZXJuICJzaXplb2Yodm9pZCopL3NpemVvZih2b2lkKSIsIHdoaWNoIGlzIApkb2VzIG5v
dCBjYWxjdWxhdGUgdGhlIHNpemUgb2YgYW55IGFycmF5LiBHQ0MgaXMgZnJlZSB0byBlbWl0IGFz
IG11Y2ggCndhcm5pbmdzIGlzIGl0IHdhbnRzIGZvciBhbnkga2luZCBvZiBleHByZXNzaW9ucy4g
RnJvbSBhIEMgc3RhbmRhcmQgCnBvaW50IG9mIHZpZXcsIGl0J3MganVzdCBhICJxdWFsaXR5IG9m
IGltcGxlbWVudGF0aW9uIiBpc3N1ZSwgYW5kIGFuIAppbXBsZW1lbnRhdGlvbiB0aGF0IGVtaXRz
IHVzZWxlc3Mgd2FybmluZ3MgaXMgb2YgbG93IHF1YWxpdHksIGJ1dCBub3QgCm5vbi1jb25mb3Jt
aW5nLgoKSW4gdGhpcyBjYXNlLCB3ZSByZXF1ZXN0ZWQgdGhhdCBnY2MgcmVmdXNlcyB0byBjb21w
aWxlIGlmIGl0IGVtaXRzIGFueSAKa2luZCBvZiB3YXJuaW5nLCB3aGljaCBpbnN0cnVjdHMgZ2Nj
IHRvIHJlamVjdCBwcm9ncmFtcyB0aGF0IHdvdWxkIGJlIAp2YWxpZCBhY2NvcmRpbmcgdG8gdGhl
IEMgc3RhbmRhcmQsIGJ1dCBhcmUgZGVlbWVkIHRvIGJlICJsaWtlbHkgaW5jb3JyZWN0Ii4KCkkg
c3VnZ2VzdCB0byBmaWxlIGEgYnVnIGFnYWluc3QgZ2NjIGNvbXBsYWluaW5nIGFib3V0IGEgInNw
dXJpb3VzIAp3YXJuaW5nIiwgYW5kIHVzaW5nICItV2Vycm9yIC1Xbm8tZXJyb3Itc2l6ZW9mLXBv
aW50ZXItZGl2IiB1bnRpbCBnY2MgaXMgCmFkYXB0ZWQgdG8gbm90IGVtaXQgdGhlIHdhcm5pbmcg
YWJvdXQgdGhlIHBvaW50ZXIgZGl2aXNpb24gaWYgdGhlIHJlc3VsdCAKaXMgbm90IHVzZWQuCgoK
UmVnYXJkcywKIMKgIE1pY2hhZWwgS2FyY2hlcgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
