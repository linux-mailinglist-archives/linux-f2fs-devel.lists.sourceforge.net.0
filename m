Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F35D3BC61
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 01:25:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:Message-ID:MIME-Version:References:In-Reply-To:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uiFHRoa8rP3GocmwZT0ILvstZ+4VAh1yk1cXDeELrQ=; b=NLdit4XEWsbCNGhEkQPKKmCv32
	oI4rElLuyh+bIrHjP6GgUocv+ugdDmJeujLzLUx9+TurPM4axAUn+rqXnYD/GcxjpnzM9gqaE8fSN
	snTTT3so62ZhBZaLPfHiLbOkMbJI0OXYXo/yLDCtFGP2iJ64LzIySKkL5RtNKTLEQMMk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhzYi-0001Iq-Rb;
	Tue, 20 Jan 2026 00:25:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1vhzYh-0001Ih-BB
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 00:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9U3utyvJryj9473fJO9DUJT2D7m3LCoR0aeEGuyvEEI=; b=B+G8Q1IuawOt0v3GaSDyLbNEjd
 UM7msT3K2HPUeF6rxlowQAcNeab70xuNtNdE7bFBfulKLyGk3zG3IUnMk1eq/Pjzk1sgzflXnkfJm
 QB+tuWWBcsx3817AAepDJwVNXG2s7MgMTHBxoF3nY6n7w0kxG5eGrKCLLTWIlVBLYSRA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:References
 :In-Reply-To:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9U3utyvJryj9473fJO9DUJT2D7m3LCoR0aeEGuyvEEI=; b=Lg7WYcDVwZow5l4S5LB8SaU62a
 7ZWDcEos3WYQizlFZQHk7RawIPpW/v5epbdn+774dc4t2godXLOIt5oGv8nb82YOgXdq/kPUAKclM
 nFJz2KVzqrn4G+Xv+Q+Uxeu4oCziQ86KdWukMqpJxbC0jH7syKU9bsfyOT/ffmNdOH+k=;
Received: from m16.mail.126.com ([117.135.210.8])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhzYg-0004Im-82 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 00:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=9U3utyvJryj9473fJO9DUJT2D7m3LCoR0aeEGuyvEEI=; b=p
 3wd6YQANOS65AlRFXVb6j9vJO11WFtPWGZDrsK2lPgFl9OGJ69/ue4kzdP3gS6NL
 ZgxOMvsnlznSBRP7p8Y9JeDcxvQx6eud+ZlBRyzEGjzoSMa5DmOw9Vx3jY7cjo2x
 bnAw8S9Doo+tPhmhmZDh8+QgiTLHVHfZgWMIK8F/uQ=
Received: from nzzhao$126.com ( [212.135.214.5] ) by
 ajax-webmail-wmsvr-41-108 (Coremail) ; Tue, 20 Jan 2026 08:24:59 +0800
 (CST)
X-Originating-IP: [212.135.214.5]
Date: Tue, 20 Jan 2026 08:24:59 +0800 (CST)
From: "Nanzhe Zhao" <nzzhao@126.com>
To: "Chao Yu" <chao@kernel.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 126com
In-Reply-To: <bf56a771-129b-4bf1-b5c7-05ecba6cda00@kernel.org>
References: <20260112013320.8028-1-chao@kernel.org>
 <5e888451-228e-41e5-ada7-a22a61cb84dd@126.com>
 <32fa7311-0393-4e71-a927-3c502e40efd8@kernel.org>
 <6d6b3bad.5f72.19bd535bd6d.Coremail.nzzhao@126.com>
 <bf56a771-129b-4bf1-b5c7-05ecba6cda00@kernel.org>
X-NTES-SC: AL_Qu2dCvSdt04i7yabZ+kfmUgRgOw3XMSyu/oi2o9UO5FwjDzj4jwee2NfH1rpwvKtDAKLszuHdDdA7eBUZblyT6803rKszWgxUoo6fZ/0wQJQtg==
MIME-Version: 1.0
Message-ID: <7489ce81.333.19bd8ca5df6.Coremail.nzzhao@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: bCkvCgD3v_Ncy25pKtVHAA--.27184W
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsBwAz2luy1wIhAAA3-
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao: At 2026-01-19 21:44:48, "Chao Yu" wrote: > >I guess
 f2fs_map_no_dnode() will update map->m_next_pgofs to pgofs of next >potential
 valid dnode. > >Thanks,
 > I guess we were discussing the cases that f2fs_get_dnode_of_data
 won't return -ENOENT in f2fs_map_blocks but dn.blkaddr is still NULL_ADDR
 or NEW_ADDR ? 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [117.135.210.8 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
X-Headers-End: 1vhzYg-0004Im-82
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid f2fs_map_blocks() for
 consecutive holes in readpages
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQ2hhbzoKQXQgMjAyNi0wMS0xOSAyMTo0NDo0OCwgIkNoYW8gWXUiIDxjaGFvQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj5JIGd1ZXNzIGYyZnNfbWFwX25vX2Rub2RlKCkgd2lsbCB1cGRhdGUgbWFw
LT5tX25leHRfcGdvZnMgdG8gcGdvZnMgb2YgbmV4dAo+cG90ZW50aWFsIHZhbGlkIGRub2RlLgo+
Cj5UaGFua3MsCj4KCkkgZ3Vlc3Mgd2Ugd2VyZSBkaXNjdXNzaW5nIHRoZSBjYXNlcyB0aGF0IGYy
ZnNfZ2V0X2Rub2RlX29mX2RhdGEgd29uJ3QgcmV0dXJuCi1FTk9FTlQgaW4gZjJmc19tYXBfYmxv
Y2tzIGJ1dCBkbi5ibGthZGRyIGlzIHN0aWxsIE5VTExfQUREUiBvciBORVdfQUREUiA/CgpJIHRo
aW5rIEkgbWlnaHQgdW5kZXJzdGFuZCB0aGUgaW50ZW50aW9uIGJlaGluZCB5b3VyIHJlcGVhdGVk
IGVtcGhhc2lzIG9uIHRoZcKgCmYyZnNfbWFwX25vX2Rub2RlIGNhc2U/wqAgQXJlIHlvdSBzYXlp
bmcgdGhhdCwgb24gRjJGUywgdGhlIHZhc3QgbWFqb3JpdHkgb2Ygc3BhcnNlwqAKZmlsZXMgZmFs
bCBpbnRvIGhvbGVzIHdoZXJlIHRoZSBkbm9kZSBoYXNuJ3QgYmVlbiBhbGxvY2F0ZWQgYXQgYWxs
LCBhbmQgdGhhdCB3aXRoaW4gdGhlwqAKZG5vZGUgdGhlIGJsa2FkZHIgdmFsdWVzIE5VTExfQURE
UiBhbmQgTkVXX0FERFLigJRlc3BlY2lhbGx5IHRoZSBsYXR0ZXIgb24gdGhlIHJlYWQgcGF0aAri
gJRhcmUgcmVsYXRpdmVseSB1bmNvbW1vbj8KClRoYW5rcywKTmFuemhlIFpoYW8KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
