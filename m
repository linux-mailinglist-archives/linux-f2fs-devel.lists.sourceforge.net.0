Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F44837F0FC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 May 2021 03:41:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lh0MB-0001JP-Ix; Thu, 13 May 2021 01:41:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <changfengnan@vivo.com>) id 1lh0M8-0001JC-JK
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 May 2021 01:41:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:In-Reply-To:References:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ztSu9EQrTZ9gxjFW1OadqXAKB4q0EIzjWEYw7BEr4cc=; b=YvA725jVnPPr/Hp0yzHUufDTiR
 Q2GBw4eO/4D+jjLJbRGDvSSZI5IQoahM5ddRh4gEkgBnAhDPbjznUuK86MvngNefnfa7o9iCeiTEG
 GC52CoTaubY5OLuh7MomxJeLAEq4aZXJjRO/sT3akwaXrnJ3oX1O6Uejj21ltDuHggoA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:In-Reply-To:References:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ztSu9EQrTZ9gxjFW1OadqXAKB4q0EIzjWEYw7BEr4cc=; b=hOmMN24kYHvnxErZTIQ9G/QxAE
 OL2Shg85cV04wdBPok9FRVPkTkjMFheF41dnyHI+f1jhc+LwHbEchKrnSFwLEIpdq1SwqTKvcft9c
 neNdVC0MMBCUipGcikbGV/5btQbP5GTDIFhnEghjpYKUPxS/u+bGU19PE1et+GF5xY6c=;
Received: from mail-m17657.qiye.163.com ([59.111.176.57])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lh0Ly-006CbZ-AX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 May 2021 01:41:41 +0000
Received: from SZ11126892 (unknown [58.250.176.229])
 by mail-m17657.qiye.163.com (Hmail) with ESMTPA id 0C94A2800A7;
 Thu, 13 May 2021 09:41:20 +0800 (CST)
From: <changfengnan@vivo.com>
To: "'Chao Yu'" <yuchao0@huawei.com>,
	"'Jaegeuk Kim'" <jaegeuk@kernel.org>
References: <20210507094455.1695-1-changfengnan@vivo.com>
 <YJlUpHJLONlORWWl@google.com> <000b01d74656$518e96f0$f4abc4d0$@vivo.com>
 <YJr8PuZlOBqb+Qv1@google.com>
 <15efccda-b8e3-80bc-13b7-b2d62a1cac15@huawei.com>
In-Reply-To: <15efccda-b8e3-80bc-13b7-b2d62a1cac15@huawei.com>
Date: Thu, 13 May 2021 09:41:19 +0800
Message-ID: <001501d74799$13660360$3a320a20$@vivo.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQHMWO6DzzIYy5cyNAl5YIMHDd6ZwQHXl5KvAiUMNgYBoGkc8gIa8nVFqri/n6A=
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQhoYTVZPSxpPSUweS08YQx5VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 9ISFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NVE6DDo4Kz8RTjIfMy4sSAtJ
 CDIwCzRVSlVKTUlLQ0xLS0NKTkpIVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOS1VKTE1VSUlCWVdZCAFZQU1LSEM3Bg++
X-HM-Tid: 0a796362aa79da03kuws0c94a2800a7
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.0 PDS_BAD_THREAD_QP_64   Bad thread header - short QP
X-Headers-End: 1lh0Ly-006CbZ-AX
Subject: [f2fs-dev] =?utf-8?b?562U5aSNOiAg562U5aSNOiBbUEFUQ0ggdjRdIGYyZnM6?=
	=?utf-8?q?_compress=3A_avoid_unnecessary_check_in_f2fs=5Fprepare?=
	=?utf-8?q?=5Fcompress=5Foverwrite?=
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SSBhZ3JlZSB3aXRoIHRoaXMgcGxhbiwgSSB3aWxsIGFsc28gdGVzdCB0aGlzIHBhdGNoIGFsc28u
CgpUaGFua3MKCi0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0K5Y+R5Lu25Lq6OiBDaGFvIFl1IDx5dWNo
YW8wQGh1YXdlaS5jb20+IArlj5HpgIHml7bpl7Q6IDIwMjHlubQ15pyIMTLml6UgOTo1MgrmlLbk
u7bkuro6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+OyBjaGFuZ2ZlbmduYW5Adml2
by5jb20K5oqE6YCBOiBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldArkuLvp
opg6IFJlOiBbZjJmcy1kZXZdIOetlOWkjTogW1BBVENIIHY0XSBmMmZzOiBjb21wcmVzczogYXZv
aWQgdW5uZWNlc3NhcnkgY2hlY2sgaW4gZjJmc19wcmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZQoK
T24gMjAyMS81LzEyIDU6NTAsIEphZWdldWsgS2ltIHdyb3RlOgo+IE9uIDA1LzExLCBjaGFuZ2Zl
bmduYW5Adml2by5jb20gd3JvdGU6Cj4+IEhpIEphZWdldWs6Cj4+Cj4+IElmIHRoZXJlJ3JlIGV4
aXN0aW5nIGNsdXN0ZXJzIGJleW9uZCBpX3NpemUsIG1heSBjYXVzZSBkYXRhIAo+PiBjb3JydXB0
aW9uLCBidXQgd2lsbCB0aGlzIGhhcHBlbiBpbiBub3JtYWw/IG1heWJlIHNvbWUgZXJyb3IgY2Fu
IAo+PiBjYXVzZSB0aGlzLCBpZiBpX3NpemUgaXMgZXJyb3IgdGhlIGRhdGEgYmV5b25kIHNpemUg
c3RpbGwgY2FuJ3QgCj4+IGhhbmRsZSBwcm9wZXJseS4gIElzIHRoZXJlIG5vcm1hbCBjYXNlIGNh
biBjYXN1ZSBleGlzdGluZyBjbHVzdGVycyBiZXlvbmQgaV9zaXplPwo+IAo+IFdlIGRvbid0IGhh
dmUgYSBydWxlIHRvIHN5bmMgYmV0d2VlbiBpX3NpemUgYW5kIGlfYmxvY2tzLgoKSSBjYW4ndCBp
bWFnZSBhIGNhc2UgdGhhdCBjb21wcmVzc2VkIGNsdXN0ZXIgbWF5IGNyb3NzIGZpbGVzaXplLCBp
dCBsb29rcyBpdCdzIGEgYnVnIGlmIHRoYXQgaGFwcGVuZWQsIGJ1dCBJJ20gbm90IHN1cmUgSSBo
YXZlIGNvbnNpZGVyZWQgYWxsIGNhc2VzLiBTbywgSSBwcmVmZXIgdG8gYWRkIGEgY2hlY2sgY29u
ZGl0aW9uIGFzIGJlbG93LCB0aGVuIHRlc3Rpbmcgdy8geGZzdGVzdC9wb3JfZnNzdHJlc3MgZm9y
IGEgd2hpbGUuCgpTdWJqZWN0OiBbUEFUQ0hdIGYyZnM6IGNvbXByZXNzOiBjb21wcmVzc2VkIGNs
dXN0ZXIgc2hvdWxkIG5vdCBjcm9zcyBpX3NpemUKCi0tLQogIGZzL2YyZnMvZGF0YS5jIHwgMiAr
KwogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9mcy9mMmZz
L2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jIGluZGV4IDA2ZDFlNThkMzg4Mi4uOWFjY2EzNThkNTc4
IDEwMDY0NAotLS0gYS9mcy9mMmZzL2RhdGEuYworKysgYi9mcy9mMmZzL2RhdGEuYwpAQCAtMzMy
NSw2ICszMzI1LDggQEAgc3RhdGljIGludCBmMmZzX3dyaXRlX2JlZ2luKHN0cnVjdCBmaWxlICpm
aWxlLCBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKICAJCQllcnIgPSByZXQ7CiAgCQkJ
Z290byBmYWlsOwogIAkJfSBlbHNlIGlmIChyZXQpIHsKKwkJCWYyZnNfYnVnX29uKHNiaSwgaW5k
ZXggPj0KKwkJCQlESVZfUk9VTkRfVVAoaV9zaXplX3JlYWQoaW5vZGUpLCBQQUdFX1NJWkUpKTsK
ICAJCQlyZXR1cm4gMDsKICAJCX0KICAJfQotLQoyLjI5LjIKCgoKPiAKPj4KPj4gVGhhbmtzLgo+
Pgo+PiAtLS0tLemCruS7tuWOn+S7ti0tLS0tCj4+IOWPkeS7tuS6ujogSmFlZ2V1ayBLaW0gPGph
ZWdldWtAa2VybmVsLm9yZz4KPj4g5Y+R6YCB5pe26Ze0OiAyMDIx5bm0NeaciDEw5pelIDIzOjQ0
Cj4+IOaUtuS7tuS6ujogRmVuZ25hbiBDaGFuZyA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPgo+PiDm
ioTpgIE6IGNoYW9Aa2VybmVsLm9yZzsgbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKPj4g5Li76aKYOiBSZTogW1BBVENIIHY0XSBmMmZzOiBjb21wcmVzczogYXZvaWQgdW5u
ZWNlc3NhcnkgY2hlY2sgaW4KPj4gZjJmc19wcmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZQo+Pgo+
PiBPbiAwNS8wNywgRmVuZ25hbiBDaGFuZyB3cm90ZToKPj4+IHdoZW4gd3JpdGUgY29tcHJlc3Nl
ZCBmaWxlIHdpdGggT19UUlVOQywgdGhlcmUgd2lsbCBiZSBhIGxvdCBvZgo+Pj4gdW5uZWNlc3Nh
cnkgY2hlY2sgdmFsaWQgYmxvY2tzIGluIGYyZnNfcHJlcGFyZV9jb21wcmVzc19vdmVyd3JpdGUs
Cj4+PiBlc3BlY2lhbGx5IHdoZW4gd3JpdHRlbiBpbiBwYWdlIHNpemUsIHJlbW92ZSBpdC4KPj4+
Cj4+PiBUaGlzIHBhdGNoIHdpbGwgbm90IGJyaW5nIHNpZ25pZmljYW50IHBlcmZvcm1hbmNlIGlt
cHJvdmVtZW50cywgSSB0ZXN0Cj4+PiB0aGlzIG9uIG1vYmlsZSBwaG9uZSwgdXNlIGFuZHJvYmVu
Y2gsIHRoZSBzZXF1ZW50aWFsIHdyaXRlIHRlc3QgY2FzZQo+Pj4gd2FzIG9wZW4gZmlsZSB3aXRo
IE9fVFJVTkMsIHNldCB3cml0ZSBzaXplIHRvIDRLQiwgIHBlcmZvcm1hbmNlCj4+PiBpbXByb3Zl
ZCBhYm91dCAyJS0zJS4gSWYgd3JpdGUgc2l6ZSBzZXQgdG8gMzJNQiwgcGVyZm9ybWFuY2UgaW1w
cm92ZWQKPj4gYWJvdXQgMC41JS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBGZW5nbmFuIENoYW5n
IDxjaGFuZ2ZlbmduYW5Adml2by5jb20+Cj4+PiAtLS0KPj4+ICAgZnMvZjJmcy9kYXRhLmMgfCA4
ICsrKysrKysrCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPj4+Cj4+PiBk
aWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYyBpbmRleAo+Pj4gY2Y5
MzU0NzRmZmJhLi5iOWVjN2IxODJmNDUgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+
Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPj4+IEBAIC0zMzAzLDkgKzMzMDMsMTcgQEAgc3RhdGlj
IGludCBmMmZzX3dyaXRlX2JlZ2luKHN0cnVjdCBmaWxlICpmaWxlLAo+Pj4gc3RydWN0IGFkZHJl
c3Nfc3BhY2UgKm1hcHBpbmcsICAjaWZkZWYgQ09ORklHX0YyRlNfRlNfQ09NUFJFU1NJT04KPj4+
ICAgCWlmIChmMmZzX2NvbXByZXNzZWRfZmlsZShpbm9kZSkpIHsKPj4+ICAgCQlpbnQgcmV0Owo+
Pj4gKwkJcGdvZmZfdCBlbmQgPSAoaV9zaXplX3JlYWQoaW5vZGUpICsgUEFHRV9TSVpFIC0gMSkg
Pj4KPj4gUEFHRV9TSElGVDsKPj4+Cj4+PiAgIAkJKmZzZGF0YSA9IE5VTEw7Cj4+Pgo+Pj4gKwkJ
LyoKPj4+ICsJCSAqIHdoZW4gd3JpdGUgcG9zIGlzIGJpZ2dlciB0aGFuIGlub2RlIHNpemUKPj4g
LGYyZnNfcHJlcGFyZV9jb21wcmVzc19vdmVyd3JpdGUKPj4+ICsJCSAqIGFsd2F5cyByZXR1cm4g
MCwgc28gY2hlY2sgcG9zIGZpcnN0IHRvIGF2b2lkIHRoaXMuCj4+PiArCQkgKi8KPj4+ICsJCWlm
IChpbmRleCA+PSBlbmQpCj4+PiArCQkJZ290byByZXBlYXQ7Cj4+Cj4+IFdoYXQgaWYgdGhlcmUn
cmUgZXhpc3RpbmcgY2x1c3RlcnMgYmV5b25kIGlfc2l6ZT8gR2l2ZW4gcGVyZm9ybWFuY2UgaW1w
YWN0cywKPj4gZG8gd2UgcmVhbGx5IG5lZWQgdGhpcz8KPj4KPj4+ICsKPj4+ICAgCQlyZXQgPSBm
MmZzX3ByZXBhcmVfY29tcHJlc3Nfb3ZlcndyaXRlKGlub2RlLCBwYWdlcCwKPj4+ICAgCQkJCQkJ
CWluZGV4LCBmc2RhdGEpOwo+Pj4gICAJCWlmIChyZXQgPCAwKSB7Cj4+PiAtLQo+Pj4gMi4yOS4w
Cj4+Cj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+IAoKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
