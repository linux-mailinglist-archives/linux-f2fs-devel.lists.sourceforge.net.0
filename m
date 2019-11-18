Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3D3FFDBA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Nov 2019 06:10:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iWZJP-0004Xm-Gc; Mon, 18 Nov 2019 05:10:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cgxu519@mykernel.net>) id 1iWZJO-0004XQ-4P
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Nov 2019 05:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Date:Subject:Message-ID:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GDu82HfY7CnDAb1EdcuqFswUt9CFFN7VyyP2enB6TlQ=; b=M+M2+PoIDoIcAFGGHPNJ4ZnloB
 KkAlzuf+VL5r9qmKDpAbnMlgqseJheleq5x4XGuY5EkHtgjySHImWsVv/gFU+fB0zE92cqgJXDT8x
 gdTb5ZkTDS5Bmv8CqItnQTKR2YlZ3g20rwFCinDYDB8w6U53y2b0IKAANfTYvHztCwVI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Date:Subject:Message-ID:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GDu82HfY7CnDAb1EdcuqFswUt9CFFN7VyyP2enB6TlQ=; b=VjueZgJmGe4kzd1LkuqHQLU8A7
 vG4iGlB+7lA4COnGFmhMsWT5plkjUSLOISHbg9b1JOJLa6B09wfbZRt5YcxRoaQHea8dVB1HJlsG8
 4Jbztrl1i+rZYmm+GneqONkh0oj2cDGE69LxHjGV2PYuywpMBmW7Kq/z6g37iYaq+mtU=;
Received: from sender3-of-o52.zoho.com.cn ([124.251.121.247]
 helo=sender2.zoho.com.cn)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1iWZJJ-004M0S-Us
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Nov 2019 05:10:54 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1574053820; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=O70woNDRmcMXazDUfoFGwElRurDEqQkMMtwkKp5K6lJNE3JlmbUwmddwyfDJ7Kkk5NEvifaMbe3QSg6S5Iv6S1jQYwHVE6d1/0UQ7O/xMDxDChXuolGDg50qnLURp0ieO5L6an++ZJmdOKHov5kAWqEcrQy87VGwPGrP2RT4zGY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1574053820;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=GDu82HfY7CnDAb1EdcuqFswUt9CFFN7VyyP2enB6TlQ=; 
 b=NDFYFZseRQVlvn4/MTP/3tm5xReBr2b8K0fkVe9XORh9WOWXlGgKFK4Poqc0odvNBXvnoxWJupOFspTrPLGsgl5L8vMj4wc2cPV2Dhk2Iwd7ERh1HPNWQtIZLW9WzYmgnq0cqPFlHanvOHDqjAiQQWS1CunrfKkT8g2lzoj2Y0o=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=mykernel.net;
 spf=pass  smtp.mailfrom=cgxu519@mykernel.net;
 dmarc=pass header.from=<cgxu519@mykernel.net>
 header.from=<cgxu519@mykernel.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574053820; 
 s=zohomail; d=mykernel.net; i=cgxu519@mykernel.net;
 h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
 l=1682; bh=GDu82HfY7CnDAb1EdcuqFswUt9CFFN7VyyP2enB6TlQ=;
 b=SvQFCdziN57bDfl1glECMMWGyxlsxq9Aynk00GSL3RpiZdBV94P6CXT5PQ7cPCMs
 wN/J3OMCE6VSFOTFYPs2cvzwGGBK6Mzzx1e2xeeEmYZ7+14+K4gzJ04m7HZQNDFmtlr
 V4RcyxibAcDC8EEC3xIl29I12Q7l48+i8mv7Tutg=
Received: from localhost.localdomain (218.18.229.179 [218.18.229.179]) by
 mx.zoho.com.cn with SMTPS id 1574053818929531.7015154867489;
 Mon, 18 Nov 2019 13:10:18 +0800 (CST)
From: Chengguang Xu <cgxu519@mykernel.net>
To: linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org
Message-ID: <20191118050949.15629-3-cgxu519@mykernel.net>
Date: Mon, 18 Nov 2019 13:09:49 +0800
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191118050949.15629-1-cgxu519@mykernel.net>
References: <20191118050949.15629-1-cgxu519@mykernel.net>
MIME-Version: 1.0
X-ZohoCNMailClient: External
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mykernel.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iWZJJ-004M0S-Us
Subject: [f2fs-dev] [RFC PATCH 3/3] xfs: show prjquota info on statfs for a
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
eHU1MTlAbXlrZXJuZWwubmV0PgotLS0KIGZzL3hmcy94ZnNfc3VwZXIuYyB8IDMgKystCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZnMveGZzL3hmc19zdXBlci5jIGIvZnMveGZzL3hmc19zdXBlci5jCmluZGV4IDhkMWRmOWY4YmUw
Ny4uOWY0ZDllODY1NzJhIDEwMDY0NAotLS0gYS9mcy94ZnMveGZzX3N1cGVyLmMKKysrIGIvZnMv
eGZzL3hmc19zdXBlci5jCkBAIC0xMTI1LDcgKzExMjUsOCBAQCB4ZnNfZnNfc3RhdGZzKAogCXN0
YXRwLT5mX2ZmcmVlID0gbWF4X3QoaW50NjRfdCwgZmZyZWUsIDApOwogCiAKLQlpZiAoKGlwLT5p
X2QuZGlfZmxhZ3MgJiBYRlNfRElGTEFHX1BST0pJTkhFUklUKSAmJgorCWlmICgoKGlwLT5pX2Qu
ZGlfZmxhZ3MgJiBYRlNfRElGTEFHX1BST0pJTkhFUklUKSB8fAorCSAgICAgIVNfSVNESVIoZGVu
dHJ5LT5kX2lub2RlLT5pX21vZGUpKSAmJgogCSAgICAoKG1wLT5tX3FmbGFncyAmIChYRlNfUFFV
T1RBX0FDQ1R8WEZTX1BRVU9UQV9FTkZEKSkpID09CiAJCQkgICAgICAoWEZTX1BRVU9UQV9BQ0NU
fFhGU19QUVVPVEFfRU5GRCkpCiAJCXhmc19xbV9zdGF0dmZzKGlwLCBzdGF0cCk7Ci0tIAoyLjIw
LjEKCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
