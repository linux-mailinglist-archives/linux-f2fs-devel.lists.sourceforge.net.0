Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D733639F718
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jun 2021 14:50:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:In-Reply-To:
	References:To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GmvJ35p/70yoB7HCmJKDwEUbZE/4EBHOnI2Pah5bjgI=; b=ZS6aNXzf7A4MzTgp+vLRMUlVyd
	GEaoWSdIOqZJKCyAEEQGjHyZ1ZQaqu5I6vFvHJPjmZ6z1OeCUqLp9c89FQ9bpIZgmhzrUDJAK5dID
	e+wZf7NWDmRv3dgseOvSXJUeF4RL23uHthu5erIZIdzhCOubX+Sa0v/P45jazWZ4Qcj0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lqbBV-0004W6-Tw; Tue, 08 Jun 2021 12:50:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1lqb9A-0004RF-MJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Jun 2021 12:47:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:In-Reply-To:References:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IW8emtwJEmiU8YJ0L21KfY+TwYixCY+7QItZN8cDG2I=; b=e79h+OuNKhWDSDHiZh+e8ZvLUa
 /6CJgiKY1j9HUcryYQ5nTquBOVghM6yCLl02T4QdTD75VN1oSUcNz/qgPbPjtjceuUtbQ4mcbzY6A
 mFIGBoyyNWfXAYACkd9nVXYfn8za08hGO9kplkT47/YiI1ucgR2rCcCYuZeP/zmAV4HU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:In-Reply-To:References:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IW8emtwJEmiU8YJ0L21KfY+TwYixCY+7QItZN8cDG2I=; b=dqRwBPGdztPyaKg8wTVdMdfEni
 0JD52UsBYwOtM7epDD77njdYIHjyuY47QzWnYT+jLCT6L2P6mHxHVSEI2SwogYUyf8buR2hyNTzyv
 Vx+IaALsY99M8oqxUikv4PLUcg6GgFf0+VNkHabIDTekaRRJn9ys1kLNcmSQJ+01itUA=;
Received: from mail-m121144.qiye.163.com ([115.236.121.144])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lqb96-000qeU-6X
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Jun 2021 12:47:59 +0000
Received: from SZ11126892 (unknown [58.251.74.232])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id 65851AC027D;
 Tue,  8 Jun 2021 20:47:43 +0800 (CST)
To: "'Chao Yu'" <yuchao0@huawei.com>,
	<jaegeuk@kernel.org>
References: <20210518125113.1712-1-changfengnan@vivo.com>
 <7ad8bae8-6e38-5ff7-add8-fe1023569f43@huawei.com>
 <000001d7515e$458f3db0$d0adb910$@vivo.com>
 <ffdbecea-51ce-69db-6b4d-8ea7eb9c43fc@huawei.com>
 <e7655a1d-9c59-36d6-a4c1-225a293d5cc7@huawei.com>
In-Reply-To: <e7655a1d-9c59-36d6-a4c1-225a293d5cc7@huawei.com>
Date: Tue, 8 Jun 2021 20:47:43 +0800
Message-ID: <01ec01d75c64$797f7480$6c7e5d80$@vivo.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQHOlVE4bDv6QAxu/j4of1dMYsvDFwGvWIFYAmzUxB0CWjOgaQGcijdcqtsGveA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQklJSVZIQ01LS0tPS01OSUlVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PVE6Ijo5LT8IFQ0DGRY9LxQW
 Vi4KFDdVSlVKTUlISk5NT01IQ01NVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOSlVMT1VJSElZV1kIAVlBT0tDTzcG
X-HM-Tid: 0a79ebaa17a1b039kuuu65851ac027d
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [115.236.121.144 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.0 PDS_BAD_THREAD_QP_64   Bad thread header - short QP
X-Headers-End: 1lqb96-000qeU-6X
Subject: [f2fs-dev] =?gb2312?b?tPC4tDogILTwuLQ6IFtSRkMgUEFUQ0hdIGYyZnM6?=
	=?gb2312?b?IGNvbXByZXNzOiByZW1vdmUgdW5uZWVkZWQgcmVhZCB3aGVuIHJl?=
	=?gb2312?b?d3JpdGUgd2hvbGUgY2x1c3Rlcg==?=
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
From: changfengnan--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: changfengnan@vivo.com
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgSmFlZ2V1azoKCglBbnkgY29tbWVudHMgYWJvdXQgdGhpcyBwYXRjaD8KIApUaGFua3MuCgot
LS0tLdPKvP7Urbz+LS0tLS0Kt6K8/sjLOiBDaGFvIFl1IDx5dWNoYW8wQGh1YXdlaS5jb20+IAq3
osvNyrG85DogMjAyMcTqNdTCMjnI1SA5OjEzCsrVvP7IyzogY2hhbmdmZW5nbmFuQHZpdm8uY29t
OyBqYWVnZXVrQGtlcm5lbC5vcmcKs63LzTogbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQK1vfM4jogUmU6IFtmMmZzLWRldl0gtPC4tDogW1JGQyBQQVRDSF0gZjJmczogY29t
cHJlc3M6IHJlbW92ZSB1bm5lZWRlZCByZWFkCndoZW4gcmV3cml0ZSB3aG9sZSBjbHVzdGVyCgpP
biAyMDIxLzUvMjggMTA6NDksIENoYW8gWXUgd3JvdGU6Cj4gT24gMjAyMS81LzI1IDIwOjA1LCBj
aGFuZ2ZlbmduYW5Adml2by5jb20gd3JvdGU6Cj4+IHllcywgSSBqdXN0IGNoZWNrIHdoZWF0aGVy
IHRoZSB3aG9sZSBwYWdlIHdhcyBkaXJ0eSwgYmVjYXVzZSBvZiB3aGVuIAo+PiB3cml0ZSBjYWNo
ZSBmMmZzX3ByZXBhcmVfY29tcHJlc3Nfb3ZlcndyaXRlIHdpbGwgYmUgY2FsbGVkIGFnYWluLCAK
Pj4gd2hlbiB1cGRhdGUgd2hvbGUgY2x1c3RlciwgIGNjIGluIHByZXBhcmVfY29tcHJlc3Nfb3Zl
cndyaXRlIHdpbGwgYmUgCj4+IGVtcHR5LCBzbyB3aWxsIG5vdCBzdWJtaXQgYmlvLgo+PiB3aGVu
IG9ubHkgdXBkYXRlIG9uZSBwYWdlIGluIGNsdXN0ZXIsICBjYyBpbiAKPj4gcHJlcGFyZV9jb21w
cmVzc19vdmVyd3JpdGUgd2lsbCBub3QgYmUgZW1wdHksIHNvIHdpbGwgc3VibWl0IGJpby4KPj4g
VGhpcyBpcyBteSB0aGlua2luZywgbm90IHN1cmUgaWYgSSd2ZSBtaXNzZWQgYW55dGhpbmcKPiAK
PiBXZWxsLCBpdCBsb29rcyBtb3JlIGxpa2Ugd2UgZGlkIGZvciBtbWFwKCkgd3JpdGUgY2FzZS4K
PiAKPiBTbyBJIGd1ZXNzIHdlIGNhbiBjaGFuZ2UgYXMgYmVsb3c6Cj4gCj4gVG8gSmFlZ2V1aywg
Y29tbWVudHM/Cj4gCj4gLS0tCj4gICAgZnMvZjJmcy9kYXRhLmMgfCAyICstCj4gICAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMgaW5kZXggCj4gMmVhODg3YTExNGM4Li43
MjNjNTlkZjUxYjcgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPiArKysgYi9mcy9mMmZz
L2RhdGEuYwo+IEBAIC0zMzIzLDcgKzMzMjMsNyBAQCBzdGF0aWMgaW50IGYyZnNfd3JpdGVfYmVn
aW4oc3RydWN0IGZpbGUgKmZpbGUsCnN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLAo+ICAg
IAl9Cj4gCj4gICAgI2lmZGVmIENPTkZJR19GMkZTX0ZTX0NPTVBSRVNTSU9OCj4gLQlpZiAoZjJm
c19jb21wcmVzc2VkX2ZpbGUoaW5vZGUpKSB7Cj4gKwlpZiAoZjJmc19jb21wcmVzc2VkX2ZpbGUo
aW5vZGUpICYmIGxlbiAhPSBQQUdFX1NJWkUpIHsKCkl0IHdpbGwgY2F1c2UgcGFuaWMgaW4gZjJm
c193cml0ZV9lbmQoKSBkdWUgdG8gbWlzcyB0byBhc3NpZ24gZnNkYXRhIHdpdGgKTlVMTCwgdXBk
YXRlZCBhcyBiZWxvdzoKCi0tLQogIGZzL2YyZnMvZGF0YS5jIHwgMyArKysKICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9m
MmZzL2RhdGEuYyBpbmRleAoyZWE4ODdhMTE0YzguLjRlMjE0YWM4NzkyNSAxMDA2NDQKLS0tIGEv
ZnMvZjJmcy9kYXRhLmMKKysrIGIvZnMvZjJmcy9kYXRhLmMKQEAgLTMzMjgsNiArMzMyOCw5IEBA
IHN0YXRpYyBpbnQgZjJmc193cml0ZV9iZWdpbihzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0CmFk
ZHJlc3Nfc3BhY2UgKm1hcHBpbmcsCgogIAkJKmZzZGF0YSA9IE5VTEw7CgorCQlpZiAobGVuID09
IFBBR0VfU0laRSkKKwkJCWdvdG8gcmVwZWF0OworCiAgCQlyZXQgPSBmMmZzX3ByZXBhcmVfY29t
cHJlc3Nfb3ZlcndyaXRlKGlub2RlLCBwYWdlcCwKICAJCQkJCQkJaW5kZXgsIGZzZGF0YSk7CiAg
CQlpZiAocmV0IDwgMCkgewotLQoyLjI5LjIKClRoYW5rcywKCj4gICAgCQlpbnQgcmV0Owo+IAo+
ICAgIAkJKmZzZGF0YSA9IE5VTEw7Cj4gCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
