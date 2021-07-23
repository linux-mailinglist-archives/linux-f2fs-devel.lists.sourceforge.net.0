Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 864A43D322F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 05:18:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6lhg-0004zZ-17; Fri, 23 Jul 2021 03:18:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <changfengnan@vivo.com>) id 1m6lhe-0004zT-RI
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 03:18:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=atJSgR8x0k+nSVYVBokIGLM/GDUTGBkkpEHTfiouA0o=; b=TEgT61r3WCn85jm5LYX/CLpEgA
 trk2t08p5nDFqOATuEZdk0iBjfP0/fmN4w2BiKGqRdJpfxb1aSz/mv2tt2zj7NKBFJta9/X9+utdA
 8HYZi7DE9mzZLK/9VuwCsAv6RzNnYoOco1r/hOjYSQDVsSooiPgTqoHdvVQ7qHJIyHME=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=atJSgR8x0k+nSVYVBokIGLM/GDUTGBkkpEHTfiouA0o=; b=PxG38EC88v/2RHO8Sy6BJXhUbE
 uC3tem3Wf0NucCV3KXL/QDkSOLNAFWUt8hdcGor2sZzygAiJhxlVuW/eS+gl6OsQ1QoX9Zl3Dw73l
 vVLKvujJpF2Xd1/6kjYDY3K1gaxobsnDiq1PgPsqhZ7rwjmBm2eK6sY1CHLExBg77YqM=;
Received: from mail-m121144.qiye.163.com ([115.236.121.144])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6lhb-00HRic-ST
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 03:18:22 +0000
DKIM-Signature: a=rsa-sha256;
 b=Y4ut/GpNpHM2uePI5Q/uOQZuOQ3Hx8Q9Be3a7mQ9GssQW3m6VhxriMBKsS7SDCsy12FTDL8WcIqwkbUK4XRxwK8qn6itxhFTj/UF88wlz8DS8LH8mOCvwTEge2DwZJ7hqcqEdX8RGVCMdLOgpJszIB8VvzofW4+0gXjM4YUyz2c=;
 c=relaxed/relaxed; s=default; d=vivo.com; v=1;
 bh=atJSgR8x0k+nSVYVBokIGLM/GDUTGBkkpEHTfiouA0o=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.25.44.145] (unknown [58.250.176.229])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id 03436AC0118;
 Fri, 23 Jul 2021 11:18:12 +0800 (CST)
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210722032536.150423-1-changfengnan@vivo.com>
 <b2ce8000-226e-6dfa-0052-36cb2faeaf3a@kernel.org>
From: Fengnan Chang <changfengnan@vivo.com>
Message-ID: <72752bc5-c8b9-43b2-ca82-d7364238649e@vivo.com>
Date: Fri, 23 Jul 2021 11:18:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <b2ce8000-226e-6dfa-0052-36cb2faeaf3a@kernel.org>
Content-Language: en-US
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRoZS0xWShkYSkJMSk0dGB
 pMVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktITkhVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NBw6FRw*Fj9OUUkXERYOPjEe
 Ax5PCytVSlVKTUlMS0pLSUJISEJLVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOS1VKTE1VSUlCWVdZCAFZQUhJSk43Bg++
X-HM-Tid: 0a7ad15edd7ab039kuuu03436ac0118
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [115.236.121.144 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [115.236.121.144 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6lhb-00HRic-ST
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: compress: avoid duplicate counting
 of valid blocks when read compressed file
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

ZjJmc19yZWFkX211bHRpX3BhZ2VzIHdpbGwgaGFuZGxl77yMYWxsIHRydW5jYXRlIHBhZ2Ugd2ls
bCBiZSB6ZXJvIG91dCwgCldoZXRoZXIgcGFydGlhbCBvciBhbGwgcGFnZSBpbiBjbHVzdGVyLgoK
Ck9uIDIwMjEvNy8yMiAyMTo0NywgQ2hhbyBZdSB3cm90ZToKPiBPbiAyMDIxLzcvMjIgMTE6MjUs
IEZlbmduYW4gQ2hhbmcgd3JvdGU6Cj4+IFNpbmNlIGNsdXN0ZXIgaXMgYmFzaWMgdW5pdCBvZiBj
b21wcmVzc2lvbiwgb25lIGNsdXN0ZXIgaXMgY29tcHJlc3NlZCBvcgo+PiBub3QsIHNvIHdlIGNh
biBjYWxjdWxhdGUgdmFsaWQgYmxvY2tzIG9ubHkgZm9yIGZpcnN0IHBhZ2UgaW4gY2x1c3Rlciwg
dGhlCj4+IG90aGVyIHBhZ2VzIGp1c3Qgc2tpcC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRmVuZ25h
biBDaGFuZyA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPgo+PiAtLS0KPj4gwqAgZnMvZjJmcy9kYXRh
LmMgfCAxMyArKysrKysrLS0tLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2Zz
L2YyZnMvZGF0YS5jCj4+IGluZGV4IGQyY2Y0OGM1YTJlNC4uYTAwOTlkODMyOWYwIDEwMDY0NAo+
PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+PiArKysgYi9mcy9mMmZzL2RhdGEuYwo+PiBAQCAtMjMw
NCwxMiArMjMwNCwxMyBAQCBzdGF0aWMgaW50IGYyZnNfbXBhZ2VfcmVhZHBhZ2VzKHN0cnVjdCBp
bm9kZSAKPj4gKmlub2RlLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlm
IChyZXQpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3Rv
IHNldF9lcnJvcl9wYWdlOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IGYyZnNfaXNfY29tcHJlc3NlZF9jbHVzdGVyKGlub2Rl
LCBwYWdlLT5pbmRleCk7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQgPCAwKQo+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gc2V0X2Vycm9yX3BhZ2U7Cj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UgaWYgKCFyZXQpCj4+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZ290byByZWFkX3NpbmdsZV9wYWdlOwo+IAo+IEhvdyBhYm91dCB0
cnVuY2F0aW9uIHJhY2VzIHdpdGggcmVhZD8KPiAKPiBUaGFua3MsCj4gCj4+IC0KPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgaWYgKGNjLmNsdXN0ZXJfaWR4ID09IE5VTExfQ0xVU1RFUikgewo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IGYyZnNfaXNfY29tcHJlc3Nl
ZF9jbHVzdGVyKGlub2RlLCBwYWdlLT5pbmRleCk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKHJldCA8IDApCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBnb3RvIHNldF9lcnJvcl9wYWdlOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGVsc2UgaWYgKCFyZXQpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBnb3RvIHJlYWRfc2luZ2xlX3BhZ2U7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IH0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gZjJmc19pbml0X2NvbXByZXNz
X2N0eCgmY2MpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gc2V0X2Vycm9yX3BhZ2U7Cj4+Cj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
