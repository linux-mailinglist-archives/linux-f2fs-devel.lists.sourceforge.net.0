Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E79412B74DD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Nov 2020 04:36:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kfEGg-00068W-2s; Wed, 18 Nov 2020 03:36:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.santos@pobox.com>) id 1kfEGe-00068H-QP
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 03:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ja1i2Hb3/Fjyt5aKEKLK8X0sINRau77/rJ4bIoV1AwI=; b=PCM0kmZI5/RI0+v5GdjKmmajeT
 8UrF0b2Oo8i3ErFBQT+cOzuv7o03YdKj7MDoHqPb7bQ4YkLY1BMA63ug0eZO2qLI/7R0gQ4W+7eai
 Qj/CjGnek3tY3+xVVEV6MGnIJWGzL4phdWCOONUumHdWqvCxN6NOUMdV9tLSiVTari5M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:
 Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ja1i2Hb3/Fjyt5aKEKLK8X0sINRau77/rJ4bIoV1AwI=; b=N
 2UqjZxAiKxdX2KKnKLMlfYiHlxzbq9MWzdlvOlbTwqCWOSjIgh1MFIVOxqC66vAttQhVGK5EAjQuU
 XXG+DVwEME79xp5jtg30MBqoT/zJJSI9vZzM1c314Em4I5lxVbbYHY185u1Asme1XuHRPnK3ncSvb
 3T6s1PpYtFTkm/LE=;
Received: from pb-smtp20.pobox.com ([173.228.157.52])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kfEGc-00C5y0-Do
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 03:36:24 +0000
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 4E3431017FE;
 Tue, 17 Nov 2020 22:36:07 -0500 (EST)
 (envelope-from daniel.santos@pobox.com)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=to:from
 :subject:message-id:date:mime-version:content-type
 :content-transfer-encoding; s=sasl; bh=y8l+KF7f0+0ASWZxoZ5hLgdJA
 3c=; b=cudvYm/NffJyMpC2TRIag9B3JCaiGrev0nan8ozTbRKtEiZc7mETNY3it
 Sa/kpP5SZJ/7JnDvbJmoztS8ZFrDlbdTi+19qPUI0Bbyw83CxiUhsaNtSgzFwTj7
 nZbpl0J+oprJ83ixN+e3yYPo6+9Y/kTteYVgtlGDty3ODPYwkU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=pobox.com; h=to:from:subject
 :message-id:date:mime-version:content-type
 :content-transfer-encoding; q=dns; s=sasl; b=rEd5gqV1E13+IjWxLy+
 Q0BeAVsMwcdWyareWsnoQWGc/JNtUnIEzIipHkmCrMLlPk3yxp4cO9x0eZlhKbo7
 SRfdWIcARCClDraDorTP6xN2YJ6UlO5ZkjZe/MYS9eNnvh5IRIJ2YR3keeT6SnUO
 nZ57RSiPN/XEeSp12yDDU0Qs=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 4770D1017FD;
 Tue, 17 Nov 2020 22:36:07 -0500 (EST)
 (envelope-from daniel.santos@pobox.com)
Received: from [192.168.0.8] (unknown [76.183.130.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id A228E1017FA;
 Tue, 17 Nov 2020 22:36:04 -0500 (EST)
 (envelope-from daniel.santos@pobox.com)
To: Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 Linux MMC <linux-mmc@vger.kernel.org>
From: Daniel Santos <daniel.santos@pobox.com>
Message-ID: <c407136e-6d71-1347-511b-b3d76ad0ab32@pobox.com>
Date: Tue, 17 Nov 2020 21:35:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
Content-Language: en-US
X-Pobox-Relay-ID: 2FEEB8BE-294F-11EB-A66A-E43E2BB96649-06139138!pb-smtp20.pobox.com
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kfEGc-00C5y0-Do
Subject: [f2fs-dev] Write in-place w/o erase? (f2fs on microSD)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGVsbG8hCgpJJ20gZGVzaWduaW5nIGFuIGVtYmVkZGVkIHByb2dyYW0gdGhhdCBoYXMgdG8gbG9n
IG1lc3NhZ2VzIG9uIGEgbWljcm9TRApjYXJkIC0tIHNvIEkgcHJlc3VtZSBhIHNpbXBsZSBGVEwu
wqAgSSdtIHdvbmRlcmluZyBpZiBJIGNhbiBpbml0aWFsaXplIGFuCmVyYXNlIGVyYXNlX3NpemUg
cG9ydGlvbiBvZiBhIGZpbGUgd2l0aCAweGZmIGFuZCB0aGVuIG1ha2UgbXVsdGlwbGUKd3JpdGVz
IHRoYXQgb25seSBjbGVhciBiaXRzLCBhbmQgZ2V0IGluLXBsYWNlIHdyaXRlcyAody9vIGFuIGVy
YXNlKQppbnN0ZWFkIG9mIHVzaW5nIG91dC1vZi1wbGFjZSB3cml0ZXMgb24gYSBuZXcgYmxvY2sg
ZWFjaCB0aW1lLsKgIEluIHRoaXMKd2F5LCBJIGNvdWxkIGp1c3Qgd3JpdGUgdGhlIG1lc3NhZ2Ug
c2l6ZSBmb3IgZWFjaCBtZXNzYWdlIChhbHdheXMgbGVzcwp0aGFuIDI1NSkgYW5kIGludGVycHJl
dCBhbiAweGZmIGFzICJlbmQgb2YgbGlzdCIuCgpJJ3ZlIGxvb2tlZCB0aHJvdWdoIHRoZSBtbWMg
c291cmNlcyBhIGJpdCBhbmQgSSdtIG5vdCBldmVuIHN1cmUgaWYgdGhpcwp3b3VsZCBiZSBhIGZ1
bmN0aW9uIG9mIGYyZnMsIHRoZSBtbWMgbGF5ZXIgb3IgdGhlIEZUTC4KCklzIHRoaXMgcG9zc2li
bHkgd2hhdCBGMkZTX0lPQ19TRVRfUElOX0ZJTEUgaXMgZm9yPwoKSSBkbyByZWFsaXplIHRoYXQg
aWYgSSBtYWtlIHdyaXRlcyB0aGF0IHJlcXVpcmUgZXJhc2VzIHRoYXQgSSdsbCBsaWtlbHkKYnJl
YWsgd2VhciBsZXZlbGluZywgc28gSSdsbCB3YW50IHRvIG1ha2Ugc3VyZSBJJ20gbmV2ZXIgdHJp
Z2dlcmluZyBlcmFzZXMuCgpUaGFua3MhCkRhbmllbAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
