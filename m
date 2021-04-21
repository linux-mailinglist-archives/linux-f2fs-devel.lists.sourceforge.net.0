Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F00366BD5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Apr 2021 15:07:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lZCZA-0006sT-Hc; Wed, 21 Apr 2021 13:06:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1lZCZ9-0006sE-Jx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Apr 2021 13:06:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:In-Reply-To:References:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s1Nw5YmUYV6UW+Qqy36p7X5g9tXT8hMndOobArKzZy4=; b=hLGT+PoWBzRmPhj2+vw63a/8jr
 YCMwZXUxDTTu2Hs4OQPWWI9OvMg4wWT4z5H3orcZGpLgEPdZk2Q3GT5cfPLnPvtM2GLVAFv9I9unI
 g+JQOReHW+dSSZwlRkcmc8UNCG1IU3Vdj4m/ZTjsdMn6J4ExNAsPhxrhGJ9o6hW2m3zU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:In-Reply-To:References:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s1Nw5YmUYV6UW+Qqy36p7X5g9tXT8hMndOobArKzZy4=; b=SQ1VvAsaYfpuZho2TUUlLMrBmX
 s8HpaegKIiPaSgwA1PiCmruI5UR9CRMMwKaA1B/jntSq3vBvP5+q1rt9EQRO/fcxBG62i9tAucSMW
 PUtCPfCAMPJ5NFHt8FWfBnljM1lqAcP4QyBgA77gbYs77W+csie+vVSu8i30wbw653Zo=;
Received: from mail-m118208.qiye.163.com ([115.236.118.208])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lZCZ4-007xVA-4U
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Apr 2021 13:06:51 +0000
Received: from SZ11126892 (unknown [58.250.176.229])
 by mail-m118208.qiye.163.com (Hmail) with ESMTPA id 9FD3DE05E9;
 Wed, 21 Apr 2021 21:06:36 +0800 (CST)
From: <changfengnan@vivo.com>
To: "'Jaegeuk Kim'" <jaegeuk@kernel.org>,
 "'Fengnan Chang'" <fengnanchang@gmail.com>
References: <4dc282e0-b41c-caf2-c2ff-a6372e60a906@huawei.com>
 <20210417070251.42979-1-fengnanchang@gmail.com> <YH2uYPmJBvZFqIz+@google.com>
 <003b01d73589$fd640060$f82c0120$@vivo.com>
In-Reply-To: <003b01d73589$fd640060$f82c0120$@vivo.com>
Date: Wed, 21 Apr 2021 21:06:36 +0800
Message-ID: <003f01d736af$29229d30$7b67d790$@vivo.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLjH0k41dOCOrST79xbW2StELcKcACMPZfjAW82A78BiGfZLaiLAHhw
Content-Language: zh-cn
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQ0pLQ1ZOQxoaGUNJThlMSx5VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NjY6GAw4AT8SSwgRHi8rNCkW
 ShAKCSFVSlVKTUpCS0pLSEJMSk9DVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOS1VKTE1VSUlCWVdZCAFZQU9ISkk3Bg++
X-HM-Tid: 0a78f48a226a2c17kusn9fd3de05e9
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [115.236.118.208 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [115.236.118.208 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 1.0 PDS_BAD_THREAD_QP_64   Bad thread header - short QP
X-Headers-End: 1lZCZ4-007xVA-4U
Subject: [f2fs-dev] =?utf-8?b?562U5aSNOiAg562U5aSNOiAgW1JGQyBQQVRDSF0gZjJm?=
	=?utf-8?q?s=3A_add_no_compress_extensions_support?=
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

SWYgdGhlcmUgYXJlIG5vIGZ1cnRoZXIgY29tbWVudHMsIEkgd2lsbCBpc3N1ZSBhIGZvcm1hbCBw
YXRjaCBsYXRlci4gCgotLS0tLemCruS7tuWOn+S7ti0tLS0tCuWPkeS7tuS6ujogY2hhbmdmZW5n
bmFuQHZpdm8uY29tIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+IArlj5HpgIHml7bpl7Q6IDIwMjHl
ubQ05pyIMjDml6UgMTA6MDgK5pS25Lu25Lq6OiAnSmFlZ2V1ayBLaW0nIDxqYWVnZXVrQGtlcm5l
bC5vcmc+OyAnRmVuZ25hbiBDaGFuZycgPGZlbmduYW5jaGFuZ0BnbWFpbC5jb20+CuaKhOmAgTog
eXVjaGFvMEBodWF3ZWkuY29tOyBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dArkuLvpopg6IOetlOWkjTogW2YyZnMtZGV2XSDnrZTlpI06IFtSRkMgUEFUQ0hdIGYyZnM6IGFk
ZCBubyBjb21wcmVzcyBleHRlbnNpb25zIHN1cHBvcnQKCkl0IHNlZW1zIHRoYXQgd2UgZG9uJ3Qg
bmVlZCB0byBzdXBwb3J0ICogZm9yIG5vbi1jb21wcmVzcy4KCkZvciBub3csIGlmIG9uZSBmaWxl
IG1hdGNoIGNvbXBfZXh0ZW50aW9uLCB0aGUgZGlyIGZsYWcgbm90IHdvcmssIGJ1dCB3ZSBjYW4g
c3RpbGwgdXNlIGNvbXBfZmlsZV9mbGFnIGFuZCBub19jb21wX2ZpbGVfZmxhZy4gU28gdGhlIHBy
aW9yaXR5IGlzOgpkaXJfZmxhZyA8IGNvbXBfZXh0ZW50aW9uIDwgIGNvbXBfZmlsZV9mbGFnLCBu
b19jb21wX2ZpbGVfZmxhZy4KCmFmdGVyIGFkZCBub19jb21wX2V4dGVudGlvbiBmbGFnLCB0aGUg
cHJpb3JpdHkgc2hvdWxkIGJlOgpkaXJfZmxhZyA8IGNvbXBfZXh0ZW50aW9uIDwgbm9fY29tcF9l
eHRlbnRpb24gPCAgY29tcF9maWxlX2ZsYWcsIG5vX2NvbXBfZmlsZV9mbGFnLgoKCi0tLS0t6YKu
5Lu25Y6f5Lu2LS0tLS0K5Y+R5Lu25Lq6OiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3Jn
Pgrlj5HpgIHml7bpl7Q6IDIwMjHlubQ05pyIMjDml6UgMDoyMwrmlLbku7bkuro6IEZlbmduYW4g
Q2hhbmcgPGZlbmduYW5jaGFuZ0BnbWFpbC5jb20+CuaKhOmAgTogeXVjaGFvMEBodWF3ZWkuY29t
OyBjaGFuZ2ZlbmduYW5Adml2by5jb207IGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0CuS4u+mimDogUmU6IFtmMmZzLWRldl0g562U5aSNOiBbUkZDIFBBVENIXSBmMmZzOiBh
ZGQgbm8gY29tcHJlc3MgZXh0ZW5zaW9ucyBzdXBwb3J0CgpPbiAwNC8xNywgRmVuZ25hbiBDaGFu
ZyB3cm90ZToKPiBJbiB0aGlzIHBhdGNoLCB3ZSBjYW5ub3QgaGFuZGxlIGZpbGVzIHdpdGhvdXQg
ZXh0ZW5zaW9ucy4gQXQgdGhlIAo+IG1vbWVudCB0aGVyZSBpcyBqdXN0IGEgcm91Z2ggaWRlYe+8
jHRlc3QgYSBwb3J0aW9uIG9mIHRoZSBkYXRhIHRvIGRlY2lkZSAKPiB3aGV0aGVyIHRvIGNvbXBy
ZXNzIGl0IGJlZm9yZSBwZXJmb3JtaW5nIGEgZnVsbCBjb21wcmVzc2lvbi4gSXQgbWF5IAo+IG5l
ZWQgbW9yZSB0ZXN0LiAgQW55IG90aGVyIHN1Z2dlc3Rpb25zPwo+Cj4gSW4gbXkgY29uc2lkZXIs
IHRoZSBub24tY29tcHJlc3MgIGZsYWcgaGFzIGEgaGlnaGVyIHByaW9yaXR5IHRoYW4gdGhlIAo+
IGNvbXByZXNzZWQgZmxhZy4KPiAxLiB0aGUgc2FtZSBleHRlbnNpb24gbmFtZSBjYW5ub3Qgbm90
IGFwcGVhciBpbiBib3RoIGNvbXByZXNzIGFuZCAKPiBub24tY29tcHJlc3MgZXh0ZW5zaW9uIGF0
IHRoZSBzYW1lIHRpbWXvvIwgY2hlY2sgdGhpcyBpbiBtb3VudCBwcm9jZXNzLgo+IDIuIElmIHRo
ZSBjb21wcmVzcyBleHRlbnNpb24gc3BlY2lmaWVzIGFsbCBmaWxlcywgdGhlIHR5cGVzIHNwZWNp
ZmllZCAKPiBieSB0aGUgbm9uLWNvbXByZXNzIGV4dGVuc2lvbiB3aWxsIGJlIHRyZWF0ZWQgYXMg
c3BlY2lhbCBjYXNlcyBhbmQgCj4gd2lsbCBub3QgYmUgY29tcHJlc3NlZC4KPiAzLiBJZiB0aGUg
bm9uLWNvbXByZXNzIGV4dGVuc2lvbiBzcGVjaWZpZXMgYWxsIGZpbGVzLCBzaG91bGQgbm90IAo+
IHNwZWNpZmllcyBhbnkgY29tcHJlc3MgZXh0ZW5zaW9uLCBjaGVjayBpbiBtb3VudCBwcm9jZXNz
IHRvby4KCkRvIHdlIG5lZWQgdG8gc3VwcG9ydCAqIGZvciBub24tY29tcHJlc3M/Cgo+Cj4gQW55
IG90aGVyIHN1Z2dlc3Rpb25zPwoKU28sIHdoYXQgY291bGQgdGhlIHByaW9yaXR5IGZvciBhbGwg
dGhlIGJlbG93IGNvbWJpbmF0aW9ucz8KCkUuZy4sIGNvbXBfZXh0ZW50aW9uLCBub19jb21wX2V4
dGVudGlvbiwgZGlyX2ZsYWcsIGNvbXBfZmlsZV9mbGFnLCBub19jb21wX2ZpbGVfZmxhZy4KClRo
YW5rcywKCgoKCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
