Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5D834BCA6
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Mar 2021 16:48:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lQWhu-0006sj-Os; Sun, 28 Mar 2021 14:48:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <andrealmeid@collabora.com>) id 1lQWeq-0006jj-8Z
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Mar 2021 14:44:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3tmB62i5iiIF22wI8qmKd1VA1vc17hYDqPD0D9ufknA=; b=lKxgv7TPQ7Bbh04+hy4x6pghb6
 gWho3SPdkHZyjz5zrumMm1vJpoOpuIIPk5kFyUKq8mWM+yD+UOFqRvZMhzJfVDMVM9bBi4cnmN8co
 L9RlO6+H7AM5Z2D9kns0u6ryhVjNEYe48nYtMyt9zKEvVHKUAJ59uJ2lCCaGw91lEPyw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3tmB62i5iiIF22wI8qmKd1VA1vc17hYDqPD0D9ufknA=; b=IIFpeGT+S26vICZztP6EFmHYyf
 RuzAHrL6PKHEdsfUvjLZaIF+NR7jPgeofmhp4aBkPqlylGpNze8dvLRGusWo042+jQ+AE+JP4iWJk
 5C+Q5xP/ta/NNgK0UOUyp3c0KapQIkvGiP/g98N5GvVvzvvzbeQmLAm3b7JMvnQmZkz4=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lQWed-0007ny-NE
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Mar 2021 14:44:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tonyk) with ESMTPSA id CF00F1F42CD7
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, Theodore Ts'o <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Date: Sun, 28 Mar 2021 11:43:55 -0300
Message-Id: <20210328144356.12866-3-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210328144356.12866-1-andrealmeid@collabora.com>
References: <20210328144356.12866-1-andrealmeid@collabora.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1lQWed-0007ny-NE
Subject: [f2fs-dev] [PATCH 2/3] ext4: Prevent dangling dentries on casefold
 directories
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
Cc: kernel@collabora.com, Daniel Rosenberg <drosen@google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 krisman@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

QmVmb3JlIG1ha2luZyBhIGZvbGRlciBhIGNhc2UtaW5zZW5zaXRpdmUgb25lLCB0aGlzIGZvbGRl
ciBjb3VsZCBoYXZlCmJlZW4gdXNlZCBiZWZvcmUgYW5kIGNyZWF0ZWQgc29tZSBuZWdhdGl2ZSBk
ZW50cmllcyAoZ2l2ZW4gdGhhdCB0aGUKZm9sZGVyIG5lZWRzIHRvIGJlIGVtcHR5IGJlZm9yZSBt
YWtpbmcgaXQgY2FzZS1pbnNlbnNpdGl2ZSwgYWxsIGRldHJpZXMKdGhlcmUgYXJlIG5lZ2F0aXZl
IG9uZXMpLiBEdXJpbmcgYSBuZXcgZmlsZSBjcmVhdGlvbiwgaWYgYSBkX2hhc2goKQpjb2xsaXNp
b24gaGFwcGVucyBhbmQgdGhlIG5hbWUgbWF0Y2hlcyBhIG5lZ2F0aXZlIGRlbnRyeSwgdGhlIG5l
dyBmaWxlCm1pZ2h0IGhhdmUgYSBuYW1lIGRpZmZlcmVudCB0aGFuIHRoZSBzcGVjaWZpZWQgYnkg
dXNlci4KClRvIHByZXZlbnQgdGhpcyBmcm9tIGhhcHBlbmluZywgcmVtb3ZlIGFsbCBuZWdhdGl2
ZSBkZW50cmllcyBpbiBhCmRpcmVjdG9yeSBiZWZvcmUgbWFraW5nIGl0IGEgY2FzZS1mb2xkZWQg
b25lLgoKRml4ZXM6IGI4ODZlZTNlNzc4ZSAoImV4dDQ6IFN1cHBvcnQgY2FzZS1pbnNlbnNpdGl2
ZSBmaWxlIG5hbWUgbG9va3VwcyIpClNpZ25lZC1vZmYtYnk6IEFuZHLDqSBBbG1laWRhIDxhbmRy
ZWFsbWVpZEBjb2xsYWJvcmEuY29tPgotLS0KIGZzL2V4dDQvaW9jdGwuYyB8IDMgKysrCiAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZnMvZXh0NC9pb2N0bC5j
IGIvZnMvZXh0NC9pb2N0bC5jCmluZGV4IGEyY2YzNTA2NmY0Ni4uMGVlZGU0YzkzYzIyIDEwMDY0
NAotLS0gYS9mcy9leHQ0L2lvY3RsLmMKKysrIGIvZnMvZXh0NC9pb2N0bC5jCkBAIC0zODEsNiAr
MzgxLDkgQEAgc3RhdGljIGludCBleHQ0X2lvY3RsX3NldGZsYWdzKHN0cnVjdCBpbm9kZSAqaW5v
ZGUsCiAJCQllcnIgPSAtRU5PVEVNUFRZOwogCQkJZ290byBmbGFnc19vdXQ7CiAJCX0KKworCQlp
ZiAoIShvbGRmbGFncyAmIEVYVDRfQ0FTRUZPTERfRkwpICYmIChmbGFncyAmIEVYVDRfQ0FTRUZP
TERfRkwpKQorCQkJZF9jbGVhcl9kaXJfbmVnX2RlbnRyaWVzKGlub2RlKTsKIAl9CiAKIAkvKgot
LSAKMi4zMS4wCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
