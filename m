Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E407334BCA5
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Mar 2021 16:46:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lQWgO-0004xl-U9; Sun, 28 Mar 2021 14:46:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <andrealmeid@collabora.com>) id 1lQWef-0004tU-At
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Mar 2021 14:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gcBa8LpB132GckVMeypT70c76X/WTbpPd+vx3FK0Mxg=; b=Iw4RIT7SrnPLJY6TbM0/91MyQZ
 cpsKAoYR4FZ+AEF1Qkm/G+DIfZxdVsxj5A+EDEMNPwRSGqU3VcHLPGLJqj9vIiWqojDu/5xVsTqct
 XI0EeI2xUsCvRQwHbE5mf4OY70Bvn0mwxDR18NRBBd3/3v2zAddJ9BIqhVZm+vxzOMT8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gcBa8LpB132GckVMeypT70c76X/WTbpPd+vx3FK0Mxg=; b=O2hhccRJVJwK60BsQivaVZEVz2
 Lmc46cm/lpLFJPqpyA6f69/FnnUuZWqQRKefX6IJc/7QMI2M09vztXyb77qcsrmw7gNNNvlde87Gm
 yqFbjyGdApBRjRt8MWo2ARFj0KV1l/mrva8oXvsBBBIlTv468JCAMe/eYqGuka/ckdkU=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lQWeV-004h9O-Fy
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Mar 2021 14:44:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tonyk) with ESMTPSA id C8BF11F4418B
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, Theodore Ts'o <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Date: Sun, 28 Mar 2021 11:43:54 -0300
Message-Id: <20210328144356.12866-2-andrealmeid@collabora.com>
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
X-Headers-End: 1lQWeV-004h9O-Fy
Subject: [f2fs-dev] [PATCH 1/3] fs/dcache: Add d_clear_dir_neg_dentries()
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

Rm9yIGRpcmVjdG9yaWVzIHdpdGggbmVnYXRpdmUgZGVudHJpZXMgdGhhdCBhcmUgYmVjb21pbmcg
Y2FzZS1pbnNlbnNpdGl2ZQpkaXJzLCB3ZSBuZWVkIHRvIHJlbW92ZSBhbGwgdGhvc2UgbmVnYXRp
dmUgZGVudHJpZXMsIG90aGVyd2lzZSB0aGV5IHdpbGwKYmVjb21lIGRhbmdsaW5nIGRlbnRyaWVz
LiBEdXJpbmcgdGhlIGNyZWF0aW9uIG9mIGEgbmV3IGZpbGUsIGlmIGEgZF9oYXNoCmNvbGxpc2lv
biBoYXBwZW5zIGFuZCB0aGUgbmFtZXMgbWF0Y2ggaW4gYSBjYXNlLWluc2Vuc2l0aXZlIHdheSwg
dGhlIG5hbWUKb2YgdGhlIGZpbGUgd2lsbCBiZSB0aGUgbmFtZSBkZWZpbmVkIGF0IHRoZSBuZWdh
dGl2ZSBkZW50cnksIHRoYXQgbWF5IGJlCmRpZmZlcmVudCBmcm9tIHRoZSBzcGVjaWZpZWQgYnkg
dGhlIHVzZXIuIFRvIHByZXZlbnQgdGhpcyBmcm9tCmhhcHBlbmluZywgd2UgbmVlZCB0byByZW1v
dmUgYWxsIGRlbnRyaWVzIGluIGEgZGlyZWN0b3J5LiBHaXZlbiB0aGF0IHRoZQpkaXJlY3Rvcnkg
bXVzdCBiZSBlbXB0eSBiZWZvcmUgd2UgY2FsbCB0aGlzIGZ1bmN0aW9uIHdlIGFyZSBzdXJlIHRo
YXQKYWxsIGRlbnRyaWVzIHRoZXJlIHdpbGwgYmUgbmVnYXRpdmUuCgpDcmVhdGUgYSBmdW5jdGlv
biB0byByZW1vdmUgYWxsIG5lZ2F0aXZlIGRlbnRyaWVzIGZyb20gYSBkaXJlY3RvcnksIHRvCmJl
IHVzZWQgYXMgZXhwbGFpbmVkIGFib3ZlIGJ5IGZpbGVzeXN0ZW1zIHRoYXQgc3VwcG9ydCBjYXNl
LWluc2Vuc2l0aXZlCmxvb2t1cHMuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyw6kgQWxtZWlkYSA8YW5k
cmVhbG1laWRAY29sbGFib3JhLmNvbT4KLS0tCiBmcy9kY2FjaGUuYyAgICAgICAgICAgIHwgMjcg
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2xpbnV4L2RjYWNoZS5oIHwgIDEg
KwogMiBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZnMvZGNh
Y2hlLmMgYi9mcy9kY2FjaGUuYwppbmRleCA3ZDI0ZmY3ZWIyMDYuLmZhZmIzMDE2ZDZmZCAxMDA2
NDQKLS0tIGEvZnMvZGNhY2hlLmMKKysrIGIvZnMvZGNhY2hlLmMKQEAgLTE3MjMsNiArMTcyMywz
MyBAQCB2b2lkIGRfaW52YWxpZGF0ZShzdHJ1Y3QgZGVudHJ5ICpkZW50cnkpCiB9CiBFWFBPUlRf
U1lNQk9MKGRfaW52YWxpZGF0ZSk7CiAKKy8qKgorICogZF9jbGVhcl9kaXJfbmVnX2RlbnRyaWVz
IC0gUmVtb3ZlIG5lZ2F0aXZlIGRlbnRyaWVzIGluIGFuIGlub2RlCisgKiBAZGlyOiBEaXJlY3Rv
cnkgdG8gY2xlYXIgbmVnYXRpdmUgZGVudHJpZXMKKyAqCisgKiBGb3IgZGlyZWN0b3JpZXMgd2l0
aCBuZWdhdGl2ZSBkZW50cmllcyB0aGF0IGFyZSBiZWNvbWluZyBjYXNlLWluc2Vuc2l0aXZlCisg
KiBkaXJzLCB3ZSBuZWVkIHRvIHJlbW92ZSBhbGwgdGhvc2UgbmVnYXRpdmUgZGVudHJpZXMsIG90
aGVyd2lzZSB0aGV5IHdpbGwKKyAqIGJlY29tZSBkYW5nbGluZyBkZW50cmllcy4gRHVyaW5nIHRo
ZSBjcmVhdGlvbiBvZiBhIG5ldyBmaWxlLCBpZiBhIGRfaGFzaAorICogY29sbGlzaW9uIGhhcHBl
bnMgYW5kIHRoZSBuYW1lcyBtYXRjaCBpbiBhIGNhc2UtaW5zZW5zaXRpdmUsIHRoZSBuYW1lIG9m
CisgKiB0aGUgZmlsZSB3aWxsIGJlIHRoZSBuYW1lIGRlZmluZWQgYXQgdGhlIG5lZ2F0aXZlIGRl
bnRyeSwgdGhhdCBjYW4gYmUKKyAqIGRpZmZlcmVudCBmcm9tIHRoZSBzcGVjaWZpZWQgYnkgdGhl
IHVzZXIuIFRvIHByZXZlbnQgdGhpcyBmcm9tIGhhcHBlbmluZywgd2UKKyAqIG5lZWQgdG8gcmVt
b3ZlIGFsbCBkZW50cmllcyBpbiBhIGRpcmVjdG9yeS4gR2l2ZW4gdGhhdCB0aGUgZGlyZWN0b3J5
IG11c3QgYmUKKyAqIGVtcHR5IGJlZm9yZSB3ZSBjYWxsIHRoaXMgZnVuY3Rpb24gd2UgYXJlIHN1
cmUgdGhhdCBhbGwgZGVudHJpZXMgdGhlcmUgd2lsbAorICogYmUgbmVnYXRpdmUuCisgKi8KK3Zv
aWQgZF9jbGVhcl9kaXJfbmVnX2RlbnRyaWVzKHN0cnVjdCBpbm9kZSAqZGlyKQoreworCXN0cnVj
dCBkZW50cnkgKmFsaWFzLCAqZGVudHJ5OworCisJaGxpc3RfZm9yX2VhY2hfZW50cnkoYWxpYXMs
ICZkaXItPmlfZGVudHJ5LCBkX3UuZF9hbGlhcykgeworCQlsaXN0X2Zvcl9lYWNoX2VudHJ5KGRl
bnRyeSwgJmFsaWFzLT5kX3N1YmRpcnMsIGRfY2hpbGQpIHsKKwkJCWRfZHJvcChkZW50cnkpOwor
CQkJZHB1dChkZW50cnkpOworCQl9CisJfQorfQorRVhQT1JUX1NZTUJPTChkX2NsZWFyX2Rpcl9u
ZWdfZGVudHJpZXMpOworCiAvKioKICAqIF9fZF9hbGxvYwktCWFsbG9jYXRlIGEgZGNhY2hlIGVu
dHJ5CiAgKiBAc2I6IGZpbGVzeXN0ZW0gaXQgd2lsbCBiZWxvbmcgdG8KZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvbGludXgvZGNhY2hlLmggYi9pbmNsdWRlL2xpbnV4L2RjYWNoZS5oCmluZGV4IGMxZTQ4
MDE0MTA2Zi4uYzQzY2QwYmUwNzdmIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2RjYWNoZS5o
CisrKyBiL2luY2x1ZGUvbGludXgvZGNhY2hlLmgKQEAgLTI1MCw2ICsyNTAsNyBAQCBleHRlcm4g
dm9pZCBzaHJpbmtfZGNhY2hlX3NiKHN0cnVjdCBzdXBlcl9ibG9jayAqKTsKIGV4dGVybiB2b2lk
IHNocmlua19kY2FjaGVfcGFyZW50KHN0cnVjdCBkZW50cnkgKik7CiBleHRlcm4gdm9pZCBzaHJp
bmtfZGNhY2hlX2Zvcl91bW91bnQoc3RydWN0IHN1cGVyX2Jsb2NrICopOwogZXh0ZXJuIHZvaWQg
ZF9pbnZhbGlkYXRlKHN0cnVjdCBkZW50cnkgKik7CitleHRlcm4gdm9pZCBkX2NsZWFyX2Rpcl9u
ZWdfZGVudHJpZXMoc3RydWN0IGlub2RlICopOwogCiAvKiBvbmx5IHVzZWQgYXQgbW91bnQtdGlt
ZSAqLwogZXh0ZXJuIHN0cnVjdCBkZW50cnkgKiBkX21ha2Vfcm9vdChzdHJ1Y3QgaW5vZGUgKik7
Ci0tIAoyLjMxLjAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
