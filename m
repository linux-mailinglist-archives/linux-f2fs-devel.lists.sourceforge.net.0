Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F197BAC6AB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Sep 2025 12:10:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:Date:To:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQ93wgIaphwad6Aqg1tJgvEwcwVWpwkjdh1iPeqd4KM=; b=TZFuIvTQDwKnIshWO43OryJTLv
	Rz2IYcZGAANUXNRS1C98NmEzFCLTOvxgBD7mx2MBLk7Sqx1IvrTJi5fA5aggwMkKsz04X7wNyn2bZ
	HneyR6DASlNsWkATBlZQqzrrDKX5pLm8IakhpGfL1rhl5yrhseYFY4ObFlxxvvSiLIqk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3XJF-0007tD-5u;
	Tue, 30 Sep 2025 10:10:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <920484857@qq.com>) id 1v3XJC-0007t1-6A
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Sep 2025 10:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+z4VuSEyqyHbymvozcwTCmyPiBeyYrKjSnszB1XAJjM=; b=MAwqeE4jy6bvHEUJ8rseG3Ip2K
 o1ooOnb/NelbUUFr9TfspcfHrOrIihPoha05ffMdUXU/QLQR8D7NVjON8gLa4SjXdCOI78p2CtqBU
 MH4l36ObFX72xortEL8kmXGyp/M0kvwISYQspxLUm4gw/GrVRSFT3CqPpoFdKGQLlzqs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Date:Subject:Cc:To:From:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+z4VuSEyqyHbymvozcwTCmyPiBeyYrKjSnszB1XAJjM=; b=CPDTLlaizevtrfXEzi/T1pp0rA
 WRYv/n4oCslstrv1wnm7iacq2cYKfXzgdjS40va4MD9/HGpTPBMzCwQKWIpqoAZ2ffgkS0W/efpaD
 yqHh9QkXp/2deLgREiA3Nay2XgsB7sjJLEvnvwANhKCLFsjfnJ89D+RUHxiKOaX1hVfM=;
Received: from out203-205-221-205.mail.qq.com ([203.205.221.205])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3XJB-0007q9-0R for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Sep 2025 10:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1759226691; bh=+z4VuSEyqyHbymvozcwTCmyPiBeyYrKjSnszB1XAJjM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ataDAaFLJ2W7VrZyKH0vt8k85iXDjmmX3ySZx5Nay+zR+bn1epntzeMxoCe84G/EU
 Jf01w3+bXbQuU7pwAib7PxRc5ztaqpBBd61f/W2lSgQoOozcEBEFXvtiZ7hw4V089L
 wsPsVN9AIrpShIV7qGHnIjUi5bisU7GYfxEJO5a8=
Received: from localhost.localdomain ([116.128.244.171])
 by newxmesmtplogicsvrszc41-0.qq.com (NewEsmtp) with SMTP
 id 13128091; Tue, 30 Sep 2025 18:04:49 +0800
X-QQ-mid: xmsmtpt1759226689trcyp1n79
Message-ID: <tencent_5A915E07B07A5564B9DA65F6F002EBD91209@qq.com>
X-QQ-XMAILINFO: MDbayGdXPuoedgpXSJFomO/6fblRmk4vCwGYnjkIVYH7C3nIeehO22HyWf6OTT
 H82d301dWqKCR6Zau631ToEr6wLdpL01e2uNZ0DkXPdyBkGq4MMcx0bzALvqRRGmGHiC0+B7Tbut
 VpJh9GqMZZc6T6N+1mSw42oikLVgFlFGHn3kbLyEeGDhM6VUv8/ecQOS7xQDbvXxnbfXGIaUTa2c
 huBhC1jsGroSIENX6/4gAQ2yR1I8G2fevqyHr5y1raXXdV7V1ru5Z8Pc3u2Y/nu7aIm3RQZboMkX
 ZQThhzTkoJ1YcEb0IcLs/Yg5+3+f4HmgYEsSU21nzhLG2i19G6EEmZN/ivX7IsL11sQj2nxCW4SU
 cJ6Wr0fYk3/gTMknAvXJOusPZKQmceIYmAKkLv31Kh4QtyYmSLn7hc2Z8I5B9p8d0lMbyv9QbOLS
 /guEW8rDpqyCvuoPunyMOVXTXUOASy3Xq2yLcJxWHWShWAXiL1nkOAVanl3mQTHzRlfJl5rKDwf+
 00jrpLv4mxGHuae9T7TfaoajGslaaeB6olqPZcRg+teimElxnVsnogvqcINUqcQyJv6zcX8cMlpA
 YIOw+Vo/BWH1gb+rp8ydotkVrYzyRjgF0g5GBKB8bORcI0ncVY72JPVOHMoVkF0pKTQw9tbOndmo
 VXAXRGqUBEtfFYe//HbdE2XPGeBg6FeNkZ7FI0ugQXCc33CKnJhI8HjiYaswMoaVYYYe8EHcx4cG
 n/dVpnwEmbjczpeIuqUuN9zLoeM5Xwd5ZjNIzw60uT99jaGQw1pHW5IlANrrYTu/Fj4E3fmv/Oqn
 bkKbqcVHfww4a4q9cgt/Yy898GwktiDdCaQKcUY+uTFt02BheKiv3qlR1rxDQvA/i9L+KFb1DqJy
 Qtj5oPrqNam3m6vxODHVtkbzUCfRjCGeRkPGahuZGN8cA33ZVY1ZkSFYY0DxoWJOrvvJF0y/Guin
 nmWeHwnwX6xzw18gI/Yc6XPkeeeV+222be+Q8KPFXUMXUEgfjNagW1VUTQdHpdnLBGxkeGPD29PB
 N/uGm0+b+Pw5jMuxCQ6xdHgYTW7gk68/V7uW6bYFt9A6GxVwQj
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 30 Sep 2025 18:04:48 +0800
X-OQ-MSGID: <20250930100448.4061644-1-920484857@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <tencent_3FA2C956B557ED4D050EB26922B50D3CF40A@qq.com>
References: <tencent_3FA2C956B557ED4D050EB26922B50D3CF40A@qq.com>
MIME-Version: 1.0
X-Spam-Score: 3.7 (+++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: >Fixes a memory leak issue in f2fs_move_inline_dirents()
 where
 >the ifolio is not properly released in certain error paths. >Problem
 Analysis: >- In f2fs_try_convert_inline_dir(),
 ifolio is acquired via f2fs_get_inode_folio()
 >- When do_convert_inline_dir() fails, the caller expects ifolio to be released
 >- However, in f2f [...] 
 Content analysis details:   (3.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [203.205.221.205 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [920484857(at)qq.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [920484857(at)qq.com]
 0.4 RDNS_DYNAMIC           Delivered to internal network by host with
 dynamic-looking rDNS
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 3.2 HELO_DYNAMIC_IPADDR    Relay HELO'd using suspicious hostname (IP addr
 1)
X-Headers-End: 1v3XJB-0007q9-0R
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix ifolio memory leak in
 f2fs_move_inline_dirents error path
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
From: Haofeng Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Haofeng Li <920484857@qq.com>
Cc: linux-kernel@vger.kernel.org, 13266079573@163.com, 920484857@qq.com,
 jaegeuk@kernel.org, lihaofeng@kylinos.cn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PkZpeGVzIGEgbWVtb3J5IGxlYWsgaXNzdWUgaW4gZjJmc19tb3ZlX2lubGluZV9kaXJlbnRzKCkg
d2hlcmUKPnRoZSBpZm9saW8gaXMgbm90IHByb3Blcmx5IHJlbGVhc2VkIGluIGNlcnRhaW4gZXJy
b3IgcGF0aHMuCgo+UHJvYmxlbSBBbmFseXNpczoKPi0gSW4gZjJmc190cnlfY29udmVydF9pbmxp
bmVfZGlyKCksIGlmb2xpbyBpcyBhY3F1aXJlZCB2aWEgZjJmc19nZXRfaW5vZGVfZm9saW8oKQo+
LSBXaGVuIGRvX2NvbnZlcnRfaW5saW5lX2RpcigpIGZhaWxzLCB0aGUgY2FsbGVyIGV4cGVjdHMg
aWZvbGlvIHRvIGJlIHJlbGVhc2VkCj4tIEhvd2V2ZXIsIGluIGYyZnNfbW92ZV9pbmxpbmVfZGly
ZW50cygpLCB0d28gc3BlY2lmaWMgZXJyb3IgcGF0aHMgZG9uJ3QgcmVsZWFzZSBpZm9saW8KCkFk
ZCBzb21lIGFkZGl0aW9uYWwgaW5mb3JtYXRpb24uCgpXaGVuIGRvX2NvbnZlcnRfaW5saW5lX2Rp
cigpIGZhaWxzIGluIGYyZnNfdHJ5X2NvbnZlcnRfaW5saW5lX2RpcigpLAp0aGUgaWZvbGlvIG9i
dGFpbmVkIHZpYSBmMmZzX2dldF9pbm9kZV9mb2xpbygpIGlzIG5vdCBwcm9wZXJseSByZWxlYXNl
ZCwKbGVhZGluZyB0byBhIG1lbW9yeSBsZWFrLgoKVGhlIGlzc3VlIG9jY3VycyBpbiB0aGUgZm9s
bG93aW5nIGNhbGwgcGF0aDoKCmYyZnNfdHJ5X2NvbnZlcnRfaW5saW5lX2RpcigpCuKUnOKUgOKU
gCBmMmZzX2dldF9pbm9kZV9mb2xpbygpICAvLyBhY3F1aXJlcyBpZm9saW8K4pSc4pSA4pSAIGRv
X2NvbnZlcnRfaW5saW5lX2RpcigpCuKUgiAgIOKUnOKUgOKUgCBmMmZzX21vdmVfaW5saW5lX2Rp
cmVudHMoKSAvLyBUaGUgaXNzdWUgaXMgaW4gdGhpcyBmdW5jdGlvbi4gCuKUgiAgIOKUgiAgIOKU
lOKUgOKUgCBFcnJvciBwYXRocyBtYXkgbm90IHJlbGVhc2UgaWZvbGlvCuKUlOKUgOKUgCBPbmx5
IHJlbGVhc2VzIGlmb2xpbyBvbiBzdWNjZXNzOiBpZiAoIWVycikgZjJmc19mb2xpb19wdXQoaWZv
bGlvLCB0cnVlKQoKU3BlY2lmaWNhbGx5LCBpbiBmMmZzX21vdmVfaW5saW5lX2RpcmVudHMoKToK
LSBJZiBmMmZzX3Jlc2VydmVfYmxvY2soKSBmYWlscywgdGhlIGZ1bmN0aW9uIGp1bXBzIHRvICdv
dXQnIGxhYmVsCi0gVGhlICdvdXQnIGxhYmVsIG9ubHkgcmVsZWFzZXMgdGhlIG5ld2x5IGFsbG9j
YXRlZCAnZm9saW8nIGJ1dCBub3QgJ2lmb2xpbycKLSBUaGlzIGxlYXZlcyBpZm9saW8gdW5yZWxl
YXNlZCB3aGVuIGYyZnNfcmVzZXJ2ZV9ibG9jaygpIGZhaWxzCgpJbiBjb250cmFzdCwgZjJmc19t
b3ZlX3JlaGFzaGVkX2RpcmVudHMoKSBwcm9wZXJseSBoYW5kbGVzIGlmb2xpbyByZWxlYXNlCmlu
IGl0cyBlcnJvciByZWNvdmVyeSBwYXRoLCBidXQgdGhlIGluY29uc2lzdGVuY3kgY3JlYXRlcyBh
IGxlYWsgcmlzay4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
