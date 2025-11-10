Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ACBC45CC8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Nov 2025 11:04:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RT3ROkiMcxayqRHvGQSTgTqJHla0KBKQdMV/5x0vF0A=; b=depRcfF2XS9nOZ57iWhKO4Wh9Z
	KP8F63rkYk26g180tTW74pCi+34n5PPKA2c+WwSr4/uW9v+XchVxye6Lf07S97+yGSgs+qQBBezQf
	ljqN9sqWDOiN/kbX7W1EMZs2pq6E0NsfK4ERVMoWpLeIAedwUFT8gCG7HsTnY4lZjtJc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIOkg-0006nt-Sm;
	Mon, 10 Nov 2025 10:03:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vIOke-0006nR-Qp
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 10:03:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cx/Z98EszNo4UPj9t9nR24t+5STSzytXAEba208PPIM=; b=eAdiR++B6fYAwhWs4T4iwC11t0
 5DR+Or19uXiChaeq1E5FHm4OOwLG0YphQghRrvrN2N8SxrT2iMzLWuqAZV3iQZRYaKv8QGoK1IkaO
 nu3iXCiZGI9qbVF7waDFor7NQjq+xYacMggkQi+NNZvk96WDTPgPxQo9XvQRc/WgaQlU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Cx/Z98EszNo4UPj9t9nR24t+5STSzytXAEba208PPIM=; b=IRGIkDZTfF2Hh1R4kWy0WJ76F/
 3V7znzZY8SHBvQ4y8rBDMUhcXVb/zfSgNKim8hk6CSHx4zrJtZ1rN2hlAoieZc3zvbepqCzQNimGX
 /j7FNOD3ks60+4rljqpEkWlhf9qlwmdDSvOMPSBLBKT1ktsM4Yi9W4LwW1G5Ynlz9zLo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIOUc-0006Ee-WD for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 09:47:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 25751601A5;
 Mon, 10 Nov 2025 09:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43798C19421;
 Mon, 10 Nov 2025 09:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762768031;
 bh=8qBdiOxcHwdUkIo8p0E0Ahb80uJGVsyhZpmb6fttr0Y=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=S6JXnA5tSHHFhDQXQS1xEhTGwD6LtS76tLn5foU/AQh/8NmpXylqJNw5QVs3U3UIj
 3qYUF8VaA5idO5zGtgYfMKoBZV4K8ZSZqorb5nBNJ9QBak4etqLByd965dgjVPi+Y8
 AI2L9127YzTwnv4tPErUFcsmh5G3AHdfD7wj4SUHZyhvxyQygfJDTrieCmvZ8Ev5IZ
 m+D0q4kUnssfpq8RAEGq079voKhQNwN+tKR3+bfRYIQiQQkyvkOHpJ60zgoeKhmLtv
 Aozle0ucAsPLz2bKL6YUhi00WPxYyw04nxwFkZ4cdpEriMikrwf4tOCObpG+FcPaJK
 /vJEooeQPCmtg==
Message-ID: <a6892018-f4cd-450f-8c92-158498ff7105@kernel.org>
Date: Mon, 10 Nov 2025 17:47:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251110082223.902207-1-yangyongpeng.storage@gmail.com>
 <20251110082223.902207-3-yangyongpeng.storage@gmail.com>
Content-Language: en-US
In-Reply-To: <20251110082223.902207-3-yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/10/25 16:22, Yongpeng Yang wrote: > From: Yongpeng Yang
 <yangyongpeng@xiaomi.com> > > When emulating a ZNS SSD on qemu with
 zoned.max_open
 set to 0, the > F2FS can still be mounted successfully. [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vIOUc-0006Ee-WD
Subject: Re: [f2fs-dev] [PATCH v2 3/3] f2fs: fix handling of zoned block
 devices with max_open_zones == 0
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTEvMTAvMjUgMTY6MjIsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4gRnJvbTogWW9uZ3Blbmcg
WWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4gCj4gV2hlbiBlbXVsYXRpbmcgYSBaTlMg
U1NEIG9uIHFlbXUgd2l0aCB6b25lZC5tYXhfb3BlbiBzZXQgdG8gMCwgdGhlCj4gRjJGUyBjYW4g
c3RpbGwgYmUgbW91bnRlZCBzdWNjZXNzZnVsbHkuIFRoZSBzeXNmcyBlbnRyeSBzaG93cwo+IHNi
aS0+bWF4X29wZW5fem9uZXMgYXMgVUlOVF9NQVguCj4gCj4gcm9vdEBmZWRvcmEtdm06fiMgY2F0
IC9zeXMvYmxvY2svbnZtZTBuMS9xdWV1ZS96b25lZAo+IGhvc3QtbWFuYWdlZAo+IHJvb3RAZmVk
b3JhLXZtOn4jIGNhdCAvc3lzL2Jsb2NrL252bWUwbjEvcXVldWUvbWF4X29wZW5fem9uZXMKPiAw
Cj4gcm9vdEBmZWRvcmEtdm06fiMgbWtmcy5mMmZzIC1tIC1jIC9kZXYvbnZtZTBuMSAvZGV2L3Zk
YQo+IHJvb3RAZmVkb3JhLXZtOn4jIG1vdW50IC9kZXYvdmRhIC9tbnQvZjJmcy8KPiByb290QGZl
ZG9yYS12bTp+IyBjYXQgL3N5cy9mcy9mMmZzL3ZkYS9tYXhfb3Blbl96b25lcwo+IDQyOTQ5Njcy
OTUKPiAKPiBUaGUgcm9vdCBjYXVzZSBpcyB0aGF0IHNiaS0+bWF4X29wZW5fem9uZXMgaXMgaW5p
dGlhbGl6ZWQgdG8gVUlOVF9NQVgKPiBhbmQgb25seSB1cGRhdGVkIHdoZW4gdGhlIGRldmljZeKA
mXMgbWF4X29wZW5fem9uZXMgaXMgZ3JlYXRlciB0aGFuIDAuCj4gSG93ZXZlciwgYm90aCB0aGUg
c2NzaSBkcml2ZXIgKHNkX3piY19yZWFkX3pvbmVzIG1heSBhc3NpZ25zIDAgdG8KPiBkZXZpY2Un
cyBtYXhfb3Blbl96b25lcykgYW5kIHRoZSBudm1lIGRyaXZlciAobnZtZV9xdWVyeV96b25lX2lu
Zm8gZG9uJ3QKPiBjaGVjayBtYXhfb3Blbl96b25lcykgYWxsb3cgbWF4X29wZW5fem9uZXMgdG8g
YmUgMC4KPiAKPiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBpc3N1ZSBieSBwcmV2ZW50aW5nIG1vdW50
aW5nIG9uIHpvbmVkIFNTRHMgd2hlbgo+IG1heF9vcGVuX3pvbmVzIGlzIDAsIHdoaWxlIHN0aWxs
IGFsbG93aW5nIFNNUiBIRERzIHRvIGJlIG1vdW50ZWQuCj4gaW5pdF9ibGt6X2luZm8oKSBpcyBv
bmx5IGNhbGxlZCBieSBmMmZzX3NjYW5fZGV2aWNlcygpLCBhbmQgdGhlCj4gYmxrem9uZWQgZmVh
dHVyZSBoYXMgYWxyZWFkeSBiZWVuIGNoZWNrZWQgdGhlcmUuIFNvLCB0aGlzIHBhdGNoIGFsc28K
PiByZW1vdmUgcmVkdW5kYW50IHpvbmVkIGRldmljZSBjaGVja3MuCj4gCj4gU2lnbmVkLW9mZi1i
eTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+CgpSZXZpZXdlZC1ieTog
Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgoKVGhhbmtzLAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
