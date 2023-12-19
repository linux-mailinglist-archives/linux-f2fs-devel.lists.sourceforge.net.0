Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE45881831C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Dec 2023 09:13:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFVDj-0003eQ-OW;
	Tue, 19 Dec 2023 08:12:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dlemoal@kernel.org>) id 1rFVDh-0003eK-HW
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Dec 2023 08:12:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mSpl0XziOOcW7rQJz5brCnkr+eSxTc9VyEdx3B6X0gk=; b=mA/6bj1wMpdl3QTyP66ToCQUb/
 XDmJGTcS/UKCfOsrvWFcP7JRphCfHTLxWxCsp+5bjW0x9vtZa1T0/+ihoecLMxLXN5oIZsDiqFAYR
 6tvrno9x1lDJclNw3fyquEIHDyRhWM6V3n8ZqFQEdFEK8g8JysBL0Fnhp5CVPMHFsPjs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mSpl0XziOOcW7rQJz5brCnkr+eSxTc9VyEdx3B6X0gk=; b=kqBrRb4PsShkQ3QcKTXKeQRqDL
 L6AsWweO60MFe4/ua7L6gvmdOaugjiT1CFo0OXA1vuIjifoeoO1qQrzVpZPAE/EKi5ipfcOv6apXh
 2FQR3Zqcr61gLMQZByI0g4mPm2nKvv+T0F7daHJ6Iwb/MohA1TJI/M3WfVrA108YHYxM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rFVDg-0007Xj-Gi for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Dec 2023 08:12:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 38986B815C2;
 Tue, 19 Dec 2023 08:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74951C433C7;
 Tue, 19 Dec 2023 08:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702973565;
 bh=U+ZkdTcXjXKG5X1r3LNQSaeJXFjIgFWiM3F9bcVebOk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ttJ037TujCI0HIp63zwRjkVY8HhZNnpxq1+lUfykle8H3F3xExXvUURAumQu/RDLq
 FgkPzT9OSV0ajVnmxU7/8a1j0L7G68hVpnyEexW0cWzW4A1lE8g5PZthfSqyK5nhIo
 6jHEpCaAkl7xku33ttbZTZIqMx/suFdVZApNXCCuCxTKO/E1EvEIf0Dw5npyU9m6NA
 u7ADjgeag9TWY81V1O4RAuRnj1jEYnEnjLPmdqJmpHBqLPVrdiONH0U/aTjxm6TY0u
 iKxQnlGZ6oBIlEu4dqQGCauvJMF1JllG2d+UsYuHSwkp2Yv5y+UyBhdeOS5wyMS/97
 9kE/SUUW3UjSQ==
Message-ID: <0a329050-0010-47cb-8c7b-a2f0863a21e8@kernel.org>
Date: Tue, 19 Dec 2023 17:12:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?RWQgVHNhaSAo6JSh5a6X6LuSKQ==?= <Ed.Tsai@mediatek.com>,
 "Naohiro.Aota@wdc.com" <Naohiro.Aota@wdc.com>
References: <20231217165359.604246-1-hch@lst.de>
 <20231217165359.604246-4-hch@lst.de>
 <b4d33dc359495c6227a3f20285566eed27718a14.camel@mediatek.com>
 <190f58f7-2ed6-46f8-af59-5e167a0bddeb@kernel.org>
 <f19c41b9ea990e6da734b6c81caeebb73fb60b29.camel@mediatek.com>
 <do3ekgymdpa4skyz5p3dp6qcqq7zuty73qrpmftszmffunnxpm@fyswyalaxzfq>
 <dbc4a5b4296effd88ba0ef939aa324df0969545c.camel@mediatek.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <dbc4a5b4296effd88ba0ef939aa324df0969545c.camel@mediatek.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 12/19/23 17:08, Ed Tsai (蔡宗軒) wrote: > On Tue, 2023-12-19
    at 07:16 +0000, Naohiro Aota wrote: >> >> External email : Please do not
   click links or open attachments until >> you have verified t [...] 
 
 Content analysis details:   (-2.6 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rFVDg-0007Xj-Gi
Subject: Re: [f2fs-dev] [PATCH 3/5] block: remove support for the host aware
 zone model
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
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
 "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "hch@lst.de" <hch@lst.de>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTIvMTkvMjMgMTc6MDgsIEVkIFRzYWkgKOiUoeWul+i7kikgd3JvdGU6Cj4gT24gVHVlLCAy
MDIzLTEyLTE5IGF0IDA3OjE2ICswMDAwLCBOYW9oaXJvIEFvdGEgd3JvdGU6Cj4+ICAJIAo+PiBF
eHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bnRpbAo+PiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50
Lgo+PiAgT24gTW9uLCBEZWMgMTgsIDIwMjMgYXQgMDg6MjE6MjJBTSArMDAwMCwgRWQgVHNhaSAo
6JSh5a6X6LuSKSB3cm90ZToKPj4+IE9uIE1vbiwgMjAyMy0xMi0xOCBhdCAxNTo1MyArMDkwMCwg
RGFtaWVuIExlIE1vYWwgd3JvdGU6Cj4+Pj4gIE9uIDIwMjMvMTIvMTggMTU6MTUsIEVkIFRzYWkg
KOiUoeWul+i7kikgd3JvdGU6Cj4+Pj4+IEhpIENocmlzdG9waCwKPj4+Pj4KPj4+Pj4gc29tZSBt
aW5vciBzdWdnZXN0aW9uczoKPj4+Pj4KPj4+Pj4gT24gU3VuLCAyMDIzLTEyLTE3IGF0IDE3OjUz
ICswMTAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tZC9kbS10YWJsZS5jIGIvZHJpdmVycy9tZC9kbS10YWJsZS5jCj4+Pj4+PiBp
bmRleCAxOThkMzhiNTMzMjJjMS4uMjYwYjViOGYyYjBkN2UgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9k
cml2ZXJzL21kL2RtLXRhYmxlLmMKPj4+Pj4+ICsrKyBiL2RyaXZlcnMvbWQvZG0tdGFibGUuYwo+
Pj4+Pj4gQEAgLTE1NzksMjEgKzE1NzksMTggQEAgYm9vbAo+PiBkbV90YWJsZV9oYXNfbm9fZGF0
YV9kZXZpY2VzKHN0cnVjdAo+Pj4+Pj4gZG1fdGFibGUgKnQpCj4+Pj4+PiAgcmV0dXJuIHRydWU7
Cj4+Pj4+PiAgfQo+Pj4+Pj4gIAo+Pj4+Pj4gLXN0YXRpYyBpbnQgZGV2aWNlX25vdF96b25lZF9t
b2RlbChzdHJ1Y3QgZG1fdGFyZ2V0ICp0aSwKPj4gc3RydWN0Cj4+Pj4+PiBkbV9kZXYgKmRldiwK
Pj4+Pj4+IC0gIHNlY3Rvcl90IHN0YXJ0LCBzZWN0b3JfdCBsZW4sIHZvaWQKPj4+Pj4+ICpkYXRh
KQo+Pj4+Pj4gK3N0YXRpYyBpbnQgZGV2aWNlX25vdF96b25lZChzdHJ1Y3QgZG1fdGFyZ2V0ICp0
aSwgc3RydWN0Cj4+IGRtX2Rldgo+Pj4+Pj4gKmRldiwKPj4+Pj4+ICsgICAgc2VjdG9yX3Qgc3Rh
cnQsIHNlY3Rvcl90IGxlbiwgdm9pZCAqZGF0YSkKPj4+Pj4+ICB7Cj4+Pj4+PiAtc3RydWN0IHJl
cXVlc3RfcXVldWUgKnEgPSBiZGV2X2dldF9xdWV1ZShkZXYtPmJkZXYpOwo+Pj4+Pj4gLWVudW0g
YmxrX3pvbmVkX21vZGVsICp6b25lZF9tb2RlbCA9IGRhdGE7Cj4+Pj4+PiArYm9vbCAqem9uZWQg
PSBkYXRhOwo+Pj4+Pj4gIAo+Pj4+Pj4gLXJldHVybiBibGtfcXVldWVfem9uZWRfbW9kZWwocSkg
IT0gKnpvbmVkX21vZGVsOwo+Pj4+Pj4gK3JldHVybiBiZGV2X2lzX3pvbmVkKGRldi0+YmRldikg
IT0gKnpvbmVkOwo+Pj4+Pj4gIH0KPj4+Pj4+ICAKPj4+Pj4+ICBzdGF0aWMgaW50IGRldmljZV9p
c196b25lZF9tb2RlbChzdHJ1Y3QgZG1fdGFyZ2V0ICp0aSwgc3RydWN0Cj4+Pj4gZG1fZGV2Cj4+
Pj4+PiAqZGV2LAo+Pj4+Pj4gICBzZWN0b3JfdCBzdGFydCwgc2VjdG9yX3QgbGVuLCB2b2lkCj4+
Pj4+PiAqZGF0YSkKPj4+Pj4KPj4+Pj4gU2VlbXMgbGlrZSB0aGUgd29yZCAibW9kZWwiIHNob3Vs
ZCBhbHNvIGJlIHJlbW92ZSBoZXJlLgo+Pj4+Pgo+Pj4+Pj4gIHsKPj4+Pj4+IC1zdHJ1Y3QgcmVx
dWVzdF9xdWV1ZSAqcSA9IGJkZXZfZ2V0X3F1ZXVlKGRldi0+YmRldik7Cj4+Pj4+PiAtCj4+Pj4+
PiAtcmV0dXJuIGJsa19xdWV1ZV96b25lZF9tb2RlbChxKSAhPSBCTEtfWk9ORURfTk9ORTsKPj4+
Pj4+ICtyZXR1cm4gYmRldl9pc196b25lZChkZXYtPmJkZXYpOwo+Pj4+Pj4gIH0KPj4+Pj4+ICAK
Pj4+Pj4+ICAvKgo+Pj4+Pj4gQEAgLTE2MDMsOCArMTYwMCw3IEBAIHN0YXRpYyBpbnQgZGV2aWNl
X2lzX3pvbmVkX21vZGVsKHN0cnVjdAo+Pj4+Pj4gZG1fdGFyZ2V0ICp0aSwgc3RydWN0IGRtX2Rl
diAqZGV2LAo+Pj4+Pj4gICAqIGhhcyB0aGUgRE1fVEFSR0VUX01JWEVEX1pPTkVEX01PREVMIGZl
YXR1cmUgc2V0LCB0aGUKPj4gZGV2aWNlcwo+Pj4+IGNhbgo+Pj4+Pj4gaGF2ZSBhbnkKPj4+Pj4+
ICAgKiB6b25lZCBtb2RlbCB3aXRoIGFsbCB6b25lZCBkZXZpY2VzIGhhdmluZyB0aGUgc2FtZSB6
b25lCj4+IHNpemUuCj4+Pj4+PiAgICovCj4+Pj4+PiAtc3RhdGljIGJvb2wgZG1fdGFibGVfc3Vw
cG9ydHNfem9uZWRfbW9kZWwoc3RydWN0IGRtX3RhYmxlICp0LAo+Pj4+Pj4gLSAgZW51bSBibGtf
em9uZWRfbW9kZWwKPj4+Pj4+IHpvbmVkX21vZGVsKQo+Pj4+Pj4gK3N0YXRpYyBib29sIGRtX3Rh
YmxlX3N1cHBvcnRzX3pvbmVkKHN0cnVjdCBkbV90YWJsZSAqdCwgYm9vbAo+Pj4+IHpvbmVkKQo+
Pj4+Pj4gIHsKPj4+Pj4+ICBmb3IgKHVuc2lnbmVkIGludCBpID0gMDsgaSA8IHQtPm51bV90YXJn
ZXRzOyBpKyspIHsKPj4+Pj4+ICBzdHJ1Y3QgZG1fdGFyZ2V0ICp0aSA9IGRtX3RhYmxlX2dldF90
YXJnZXQodCwgaSk7Cj4+Pj4+PiBAQCAtMTYyMywxMSArMTYxOSwxMSBAQCBzdGF0aWMgYm9vbAo+
Pj4+Pj4gZG1fdGFibGVfc3VwcG9ydHNfem9uZWRfbW9kZWwoc3RydWN0IGRtX3RhYmxlICp0LAo+
Pj4+Pj4gIAo+Pj4+Pj4gIGlmIChkbV90YXJnZXRfc3VwcG9ydHNfem9uZWRfaG0odGktPnR5cGUp
KSB7Cj4+Pj4+PiAgaWYgKCF0aS0+dHlwZS0+aXRlcmF0ZV9kZXZpY2VzIHx8Cj4+Pj4+PiAtICAg
IHRpLT50eXBlLT5pdGVyYXRlX2RldmljZXModGksCj4+Pj4+PiBkZXZpY2Vfbm90X3pvbmVkX21v
ZGVsLAo+Pj4+Pj4gLSAgICAgICZ6b25lZF9tb2RlbCkpCj4+Pj4+PiArICAgIHRpLT50eXBlLT5p
dGVyYXRlX2RldmljZXModGksCj4+Pj4+PiBkZXZpY2Vfbm90X3pvbmVkLAo+Pj4+Pj4gKyAgICAg
ICZ6b25lZCkpCj4+Pj4+PiAgcmV0dXJuIGZhbHNlOwo+Pj4+Pj4gIH0gZWxzZSBpZiAoIWRtX3Rh
cmdldF9zdXBwb3J0c19taXhlZF96b25lZF9tb2RlbCh0aS0KPj4+Pj4+PiB0eXBlKSkgewo+Pj4+
Pj4gLWlmICh6b25lZF9tb2RlbCA9PSBCTEtfWk9ORURfSE0pCj4+Pj4+PiAraWYgKHpvbmVkKQo+
Pj4+Pj4gIHJldHVybiBmYWxzZTsKPj4+Pj4+ICB9Cj4+Pj4+PiAgfQo+Pj4+Pgo+Pj4+PiBUaGUg
cGFyYW1ldGVyICJib29sIHpvbmVkIiBpcyByZWR1bmRhbnQuIEl0IHNob3VsZCBiZSByZW1vdmVk
Cj4+IGZyb20KPj4+PiB0aGUKPj4+Pj4gYWJvdmUgMyBmdW5jdGlvbnMKPj4+Cj4+PiBUaGUgdHdv
IGZ1bmMsIGlzIHpvbmVkIGFuZCBub3Qgem9uZWQsIGFyZSBlc3NlbnRpYWxseSB0aGUgc2FtZS4K
Pj4gVGhleQo+Pj4gY2FuIGJlIHNpbXBsaWZpZWQgaW50byBvbmUgZnVuY3Rpb24uCj4+Cj4+IEJv
dGggZnVuY3Rpb25zIGFyZSB1c2VkIGZvciBpdGVyYXRlX2RldmljZXMncyBjYWxsYmFjayBpbgo+
PiBkbV90YWJsZV9zdXBwb3J0c196b25lZF9tb2RlbCgpLiBBcyBzaG93biBpbiByYWlkX2l0ZXJh
dGVfZGV2aWNlcygpLAo+PiBpdGVyYXRlX2RldmljZXMoKSByZXR1cm5zIDAgaWYgdGhlIGNhbGxi
YWNrIGZ1bmMgY2FsbHMgb24gYWxsIHRoZQo+PiBkZXZpY2VzCj4+IHJldHVybnMgMCwgb3IgcmV0
dXJucyBhIG5vbi16ZXJvIHJlc3VsdCBlYXJseSBvdGhlcndpc2UuIFNvLCB0aGUKPj4gaXRlcmF0
ZV9kZXZpY2VzKCkgY2FsbCByZXR1cm5zICJ0cnVlIiBpZiBhbnkgb25lIG9mIHRoZSB1bmRlcmx5
aW5nCj4+IGRldmljZXMKPj4gaXMgKHpvbmVkfG5vdCB6b25lZCkuCj4+Cj4+IFNpbmNlIHdlIGNh
bm5vdCBjcmVhdGUgbGFtYmRhIGFzIGluIG90aGVyIGZhbmN5IGxhbmd1YWdlcywgd2UgbmVlZAo+
PiB0d28KPj4gZnVuY3Rpb25zLi4uCj4gCj4gTm90IHJlYWxseSwgdGhlcmUgaXMgYSAidm9pZCAq
ZGF0YSIgY2FuIGJlIHVzZWQuCj4gCj4gVGhlIGRldmljZV9pc196b25lZF9tb2RlbCgpIGlzIGp1
c3QgdGhlIHNhbWUgYXMgdGhlIGRldmljZV9ub3Rfem9uZWQoKQo+IHdpdGggKGJvb2wgKilkYXRh
ID0gZmFsc2UuCj4gCj4gSXQncyB2ZXJ5IG1pbm9yLCBzbyBpcyBva2F5IHRvIGlnbm9yZSBteSBw
cmVmZXJlbmNlLgoKU2VuZCBhIHBhdGNoIG9uIHRvcCBvZiBDaHJpc3RvcGgncyBzZXJpZXMgaWYg
eW91IHdhbnQgdG8gY2xlYW4gdGhpcyB1cC4KCi0tIApEYW1pZW4gTGUgTW9hbApXZXN0ZXJuIERp
Z2l0YWwgUmVzZWFyY2gKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
