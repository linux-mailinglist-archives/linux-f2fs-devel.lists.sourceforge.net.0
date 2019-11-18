Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1EFFFDBB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Nov 2019 06:10:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iWZJQ-0007Hb-3f; Mon, 18 Nov 2019 05:10:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cgxu519@mykernel.net>) id 1iWZJO-0007HU-NH
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Nov 2019 05:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Subject:Message-ID:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BsgB+uLSbI/A7RpGrDvhjCegyC49pCxyhfWI2lOuUfk=; b=SOdwt2eEBowLoVGlZk7be4gVrE
 s3mkIEkJhpcY+gcSC3SMTitwIu9kb7BwXEBEoSpDil/qmyWEx2ggqNv6XWOXEC2Yo09jzK538kjMN
 8UJPm0d7CEsWLnec41sQcE/DG13Vd+dwLDCojVoDyWGu02ko/I2XJc78bF2osryypE8Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Subject:
 Message-ID:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BsgB+uLSbI/A7RpGrDvhjCegyC49pCxyhfWI2lOuUfk=; b=K8p1evRgzZ2y8QR9TOV/8T3yef
 ac8Q4jJ6/5kOvsJJIQJqUqhovIu8teDir0gpm63I4QBw1/jQIDxhOrA3Hg10W1O/9Z9GZAaEzNoCF
 nonWoBEL3ofveygfdOBRm9XvpCxKng3UuxfqGNUigFodpMji5tFpgwZeoZEzmlNM9CEM=;
Received: from sender3-of-o52.zoho.com.cn ([124.251.121.247]
 helo=sender2.zoho.com.cn)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1iWZJL-004M0J-Rb
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Nov 2019 05:10:54 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1574053816; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=nOqkrGkbDhtS3JDMvQRPuCCRI17CD3aKZSTRZtWSBRtIjONCrKc6v+eLP7IuCi+Tkb0VZoRzf+u9HRwRyoZxjpE3o/LBCY/xtjVY9lmLKSyHDBAtPBSmHY/MkEagt4xEyqco26PSMXg93wv5ol1WfKIHQt+zoEOWThlUcRAGN+8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1574053816;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=BsgB+uLSbI/A7RpGrDvhjCegyC49pCxyhfWI2lOuUfk=; 
 b=PTPwfFgv2WlRWueS8Em/r/X8tv6FghRBaJJqvDQHrdYADltuXdTTk+PPpD9x7DXGGxiajBFuHx+ywgo4prEMy5XC3vRT4LdJwBbfwIffx2ETasq8EpSMJaSyDqKAEK4aliVEMaWCccd8f334fuTtopvX2yodxA6oYCsKxH3LQIs=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=mykernel.net;
 spf=pass  smtp.mailfrom=cgxu519@mykernel.net;
 dmarc=pass header.from=<cgxu519@mykernel.net>
 header.from=<cgxu519@mykernel.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574053816; 
 s=zohomail; d=mykernel.net; i=cgxu519@mykernel.net;
 h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Type:Content-Transfer-Encoding;
 l=1765; bh=BsgB+uLSbI/A7RpGrDvhjCegyC49pCxyhfWI2lOuUfk=;
 b=Hd4TEPjE8y+eT9uAecADUdrpdpM8idvHMa1WowClTYYDjvX+VFqMB/ZTpEKHKjQi
 efzGVbutkWe2JrkyEhT91eL6JxU5nE58/YJUeOzq8cRZoz3qf/lUNAW3IQPj19sZVxj
 2ViUFwDHjLT3p5JQPt2yg7VxII6IbzbJfqaDVpmA=
Received: from localhost.localdomain (218.18.229.179 [218.18.229.179]) by
 mx.zoho.com.cn with SMTPS id 1574053813058511.6204774440098;
 Mon, 18 Nov 2019 13:10:13 +0800 (CST)
From: Chengguang Xu <cgxu519@mykernel.net>
To: linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org
Message-ID: <20191118050949.15629-1-cgxu519@mykernel.net>
Date: Mon, 18 Nov 2019 13:09:47 +0800
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-ZohoCNMailClient: External
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
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mykernel.net]
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iWZJL-004M0J-Rb
Subject: [f2fs-dev] [RFC PATCH 1/3] ext4: show prjquota info on statfs for a
 file
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
Cc: tytso@mit.edu, darrick.wong@oracle.com,
 Chengguang Xu <cgxu519@mykernel.net>, adilger.kernel@dilger.ca,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q3VycmVudGx5IHdlIHJlcGxhY2UgZmlsZXN5c3RlbSBzdGF0aXN0aWNzIHVzaW5nIHByanF1b3Rh
IGluZm8Kb24gc3RhdGZzIHdoZW4gc3BlY2lmaWVkIGRpcmVjdG9yeSBoYXMgcHJvamVjdCBpZCBp
bmhlcml0IGZsYWcuCkhvd2V2ZXIsIHN0YXRmcyBvbiBhIGZpbGUoYWNjdXJhdGVseSBub24tZGly
KSB3aGljaCBpcyB1bmRlciB0aGUKcHJvamVjdCBxdW90YSBkaXIod2l0aCBpbmhlcml0IGZsYWcp
IHN0aWxsIHNob3dzIHdob2xlIGZpbGVzeXN0ZW0Kc3RhdGlzdGljcy4gSW4gY29udGFpbmVyIHVz
ZSBjYXNlLCBpdCB3aWxsIGdpdmUgY29udGFpbmVyIHVzZXIKaW5jb25zaXN0ZW50IGV4cGVyaWVu
Y2UgYW5kIGNhdXNlIGNvbmZ1c2lvbiBhYm91dCBhdmFpbGFibGUgZnJlZQpzcGFjZS4KCkRldGFp
bCBpbmZvIGxpa2UgYmVsb3c6CldlIHVzZSBwcm9qZWN0IHF1b3RhIHRvIGxpbWl0IGRpc2sgc3Bh
Y2UgdXNhZ2UgZm9yIGEgY29udGFpbmVyCmFuZCBydW4gZGYgY29tbWFuZCBpbnNpZGUgY29udGFp
bmVyLgoKUnVuIGRmIG9uIGEgZGlyZWN0b3J5OgoKW3Jvb3QgL10jIGRmIC1oIC9ldGMvCkZpbGVz
eXN0ZW3CoMKgwqDCoMKgIFNpemXCoCBVc2VkIEF2YWlsIFVzZSUgTW91bnRlZCBvbgprYXRhU2hh
cmVkwqDCoMKgwqDCoCAxLjBHwqDCoCAxM00gMTAxMk3CoMKgIDIlIC8KClJ1biBkZiBvbiBhIGZp
bGU6Cgpbcm9vdCAvXSMgZGYgLWggL2V0Yy9leHBvcnRzCkZpbGVzeXN0ZW3CoMKgwqDCoMKgIFNp
emXCoCBVc2VkIEF2YWlsIFVzZSUgTW91bnRlZCBvbgprYXRhU2hhcmVkwqDCoMKgwqDCoCAxLjVU
wqAgNzc4TcKgIDEuNVTCoMKgIDElIC8KClNpZ25lZC1vZmYtYnk6IENoZW5nZ3VhbmcgWHUgPGNn
eHU1MTlAbXlrZXJuZWwubmV0PgotLS0KIGZzL2V4dDQvc3VwZXIuYyB8IDMgKystCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZnMv
ZXh0NC9zdXBlci5jIGIvZnMvZXh0NC9zdXBlci5jCmluZGV4IGRkNjU0ZTUzYmEzZC4uM2ZiYTIy
YjU0ZjVjIDEwMDY0NAotLS0gYS9mcy9leHQ0L3N1cGVyLmMKKysrIGIvZnMvZXh0NC9zdXBlci5j
CkBAIC01NjA3LDcgKzU2MDcsOCBAQCBzdGF0aWMgaW50IGV4dDRfc3RhdGZzKHN0cnVjdCBkZW50
cnkgKmRlbnRyeSwgc3RydWN0IGtzdGF0ZnMgKmJ1ZikKIAlidWYtPmZfZnNpZC52YWxbMV0gPSAo
ZnNpZCA+PiAzMikgJiAweEZGRkZGRkZGVUw7CiAKICNpZmRlZiBDT05GSUdfUVVPVEEKLQlpZiAo
ZXh0NF90ZXN0X2lub2RlX2ZsYWcoZGVudHJ5LT5kX2lub2RlLCBFWFQ0X0lOT0RFX1BST0pJTkhF
UklUKSAmJgorCWlmICgoZXh0NF90ZXN0X2lub2RlX2ZsYWcoZGVudHJ5LT5kX2lub2RlLCBFWFQ0
X0lOT0RFX1BST0pJTkhFUklUKSB8fAorCSAgICAgIVNfSVNESVIoZGVudHJ5LT5kX2lub2RlLT5p
X21vZGUpKSAmJgogCSAgICBzYl9oYXNfcXVvdGFfbGltaXRzX2VuYWJsZWQoc2IsIFBSSlFVT1RB
KSkKIAkJZXh0NF9zdGF0ZnNfcHJvamVjdChzYiwgRVhUNF9JKGRlbnRyeS0+ZF9pbm9kZSktPmlf
cHJvamlkLCBidWYpOwogI2VuZGlmCi0tIAoyLjIwLjEKCgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
