Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FA734BCA7
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Mar 2021 16:49:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lQWjE-0004LA-RD; Sun, 28 Mar 2021 14:49:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <andrealmeid@collabora.com>) id 1lQWef-0003eT-Di
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Mar 2021 14:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8GaxDh5r+LGyk9Emuy0QcpogzgPsqvm+OHJAD0Wb2F4=; b=m0nkCfMI+R2qVSGj9HIIpJycjX
 Z4dg6+8NLoayggCU6VtChOUAnr6MANbTZbEl1vu9idD34fqVzijpszr0miwq8AdAJcZC6IuG+JS/t
 I9ByoLBXe3Uj9ppdaRsAahtWVPhQCGxbeX1YS+HwfI3VBENPApec7foI02SI+fEDyd+U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8GaxDh5r+LGyk9Emuy0QcpogzgPsqvm+OHJAD0Wb2F4=; b=koZTeyZYgcEHXbxb2jKs96P5++
 IcFTRWR6koOBS3mWlGV3f+NWIrDxGtke9tn4XMCG/kwvB8ZTXiQX2zkR7XQr0M+CHOg3L67flp5rs
 lLEq+IHko3OBVJRD0rHp6zELJpOZ8SuLRLSz0dmq58crccTgIZ/ceN19H62814WTuhBM=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lQWed-004h9a-Gg
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Mar 2021 14:44:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tonyk) with ESMTPSA id CED981F46335
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, Theodore Ts'o <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Date: Sun, 28 Mar 2021 11:43:56 -0300
Message-Id: <20210328144356.12866-4-andrealmeid@collabora.com>
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1lQWed-004h9a-Gg
Subject: [f2fs-dev] [PATCH 3/3] f2fs: Prevent dangling dentries on casefold
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
b25lLgoKRml4ZXM6IDJjMmViN2EzMDBjZCAoImYyZnM6IFN1cHBvcnQgY2FzZS1pbnNlbnNpdGl2
ZSBmaWxlIG5hbWUgbG9va3VwcyIpClNpZ25lZC1vZmYtYnk6IEFuZHLDqSBBbG1laWRhIDxhbmRy
ZWFsbWVpZEBjb2xsYWJvcmEuY29tPgotLS0KIGZzL2YyZnMvZmlsZS5jIHwgNCArKysrCiAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMg
Yi9mcy9mMmZzL2ZpbGUuYwppbmRleCBkMjZmZjJhZTNmNWUuLjYxNmI3ZWI0Mzc5NSAxMDA2NDQK
LS0tIGEvZnMvZjJmcy9maWxlLmMKKysrIGIvZnMvZjJmcy9maWxlLmMKQEAgLTE4MjYsNiArMTgy
NiwxMCBAQCBzdGF0aWMgaW50IGYyZnNfc2V0ZmxhZ3NfY29tbW9uKHN0cnVjdCBpbm9kZSAqaW5v
ZGUsIHUzMiBpZmxhZ3MsIHUzMiBtYXNrKQogCQkJcmV0dXJuIC1FT1BOT1RTVVBQOwogCQlpZiAo
IWYyZnNfZW1wdHlfZGlyKGlub2RlKSkKIAkJCXJldHVybiAtRU5PVEVNUFRZOworCisJCWlmICgh
KG1hc2tlZF9mbGFncyAmIEYyRlNfQ0FTRUZPTERfRkwpICYmCisJCSAgICAoaWZsYWdzICYgRjJG
U19DQVNFRk9MRF9GTCkpCisJCQlkX2NsZWFyX2Rpcl9uZWdfZGVudHJpZXMoaW5vZGUpOwogCX0K
IAogCWlmIChpZmxhZ3MgJiAoRjJGU19DT01QUl9GTCB8IEYyRlNfTk9DT01QX0ZMKSkgewotLSAK
Mi4zMS4wCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
