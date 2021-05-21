Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1E438C215
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 May 2021 10:38:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lk0g0-00037S-Hw; Fri, 21 May 2021 08:38:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1lk0fy-00037L-Uv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 May 2021 08:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:In-Reply-To:References:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G1BeVSmIgDF1aIB9aUwMMeyUt8pX5A4Tx4xhIzHE85Y=; b=IQgtWoFF5Mqn17PRL4omCNztSw
 3MMqeNK9RPYzH7IpNYdE4j6BGwd7YG7LGlmfBmIQm4uH0w36SZeRg22Iw6m8UVP+oB9yStJ5JSvRI
 iqxayn3b9A4bZIl+ZTXzFjoQS2uPcq/X4GRUjox9l7zYhRwUJLUGi+c5JKsw5Gl15WeE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:In-Reply-To:References:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G1BeVSmIgDF1aIB9aUwMMeyUt8pX5A4Tx4xhIzHE85Y=; b=mnFZUNC+WWjzIDm4LEcZtNmRc1
 sOd5xgHNkNsbeZmMZ1+8vsH3Mi3MmWCEHxBeaq1OrWmPkEdgfOahlB5xO7T9auHAz+//yogONY7TI
 k4ufq88CBbrmoS8q+lElnRGbOIWG5Et/zeu+ijTEY3mCDSavgrhGCSeQgbdlpfz1v5b8=;
Received: from mail-m17635.qiye.163.com ([59.111.176.35])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lk0fw-0001vs-CJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 May 2021 08:38:37 +0000
Received: from SZ11126892 (unknown [58.251.74.232])
 by mail-m17635.qiye.163.com (Hmail) with ESMTPA id AE4E64001C6;
 Fri, 21 May 2021 16:38:21 +0800 (CST)
From: <changfengnan@vivo.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20210518125113.1712-1-changfengnan@vivo.com>
In-Reply-To: <20210518125113.1712-1-changfengnan@vivo.com>
Date: Fri, 21 May 2021 16:38:20 +0800
Message-ID: <002c01d74e1c$a832c7b0$f8985710$@vivo.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQHOlVE4bDv6QAxu/j4of1dMYsvDF6r++djQ
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQx1OHVYdTB0aQh5DQkpNTEhVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nwg6LBw*Qz8ITi4NMQgVPB40
 OQEKCzxVSlVKTUlKTkNNSEtJSU5JVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOSlVMT1VJSElZV1kIAVlBTUtKTjcG
X-HM-Tid: 0a798e135385d991kuwsae4e64001c6
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [59.111.176.35 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.35 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 1.0 PDS_BAD_THREAD_QP_64   Bad thread header - short QP
X-Headers-End: 1lk0fw-0001vs-CJ
Subject: [f2fs-dev] =?gb2312?b?tPC4tDogW1JGQyBQQVRDSF0gZjJmczogY29tcHJl?=
	=?gb2312?b?c3M6IHJlbW92ZSB1bm5lZWRlZCByZWFkIHdoZW4gcmV3cml0ZSB3?=
	=?gb2312?b?aG9sZSBjbHVzdGVy?=
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
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGk6CiBBbnkgY29tbWVudHMgZm9yIHRoaXM/CgkKVGhhbmtzLgoKLS0tLS3Tyrz+1K28/i0tLS0t
CreivP7IyzogRmVuZ25hbiBDaGFuZyA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPiAKt6LLzcqxvOQ6
IDIwMjHE6jXUwjE4yNUgMjA6NTEKytW8/sjLOiBqYWVnZXVrQGtlcm5lbC5vcmc7IGNoYW9Aa2Vy
bmVsLm9yZzsKbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKs63LzTogRmVu
Z25hbiBDaGFuZyA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPgrW98ziOiBbUkZDIFBBVENIXSBmMmZz
OiBjb21wcmVzczogcmVtb3ZlIHVubmVlZGVkIHJlYWQgd2hlbiByZXdyaXRlIHdob2xlCmNsdXN0
ZXIKCkZvciBub3csd2hlbiBvdmVyd3JpdGUgY29tcHJlc3NlZCBmaWxlLCB3ZSBuZWVkIHJlYWQg
b2xkIGRhdGEgdG8gcGFnZSBjYWNoZQpmaXJzdCBhbmQgdXBkYXRlIHBhZ2VzLgpCdXQgd2hlbiB3
ZSBuZWVkIG92ZXJ3cml0ZSB3aG9sZSBjbHVzdGVyLCB3ZSBkb24ndCBuZWVkIG9sZCBkYXRhIGFu
eW1vcmUuClNvLCBJIHRoaW5rIHdlIGNhbiByZW1vdmUgcmVhZCBkYXRhICBwcm9jZXNzIGluIHRo
aXMgY2FzZSwgSSBoYXZlIG1hZGUgc29tZQpzaW1wbGUgY2hhbmdlcyB0byB0ZXN0LCB0ZXN0cyBo
YXZlIHNob3duIHRoYXQgdGhpcyBjYW4gbGVhZCB0byBzaWduaWZpY2FudApwZXJmb3JtYW5jZSBp
bXByb3ZlbWVudHMsIHRoZSBzcGVlZCBvZiBzZXF1ZW50aWFsIHdyaXRlIHVwIHRvIDJ4LgoKSSBo
YXZlbid0IGZpZ3VyZWQgb3V0IHRoZSB3aG9sZSBwcm9jZXNzIHlldCxzbyB0aGUgZm9sbG93aW5n
IG1vZGlmaWNhdGlvbiBpcwphIHNpbXBsZSBhbmQgY3J1ZGUsIGFueSBzdWdnZXN0aW9ucyBhcmUg
d2VsY29tZS4KSSB3YW50IHRvIGtub3cgaWYgdGhpcyBpZGVhIGlzIHdvcmthYmxlLGlmIHNvLCBJ
IHdpbGwgY29udGludWUgdG8gaW1wcm92ZQp0aGlzIHBhdGNoLgpUaGFua3MuCgpTaWduZWQtb2Zm
LWJ5OiBGZW5nbmFuIENoYW5nIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+Ci0tLQogZnMvZjJmcy9j
b21wcmVzcy5jIHwgMTIgKysrKysrLS0tLS0tCiBmcy9mMmZzL2RhdGEuYyAgICAgfCAgNCArKy0t
CiBmcy9mMmZzL2YyZnMuaCAgICAgfCAgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvZjJmcy9jb21wcmVzcy5jIGIv
ZnMvZjJmcy9jb21wcmVzcy5jIGluZGV4CjkyNWE1Y2EzNzQ0YS4uNzA1NmMwMDllZTlhIDEwMDY0
NAotLS0gYS9mcy9mMmZzL2NvbXByZXNzLmMKKysrIGIvZnMvZjJmcy9jb21wcmVzcy5jCkBAIC05
OTAsNyArOTkwLDcgQEAgc3RhdGljIHZvaWQgc2V0X2NsdXN0ZXJfZGlydHkoc3RydWN0IGNvbXBy
ZXNzX2N0eCAqY2MpCn0KIAogc3RhdGljIGludCBwcmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZShz
dHJ1Y3QgY29tcHJlc3NfY3R4ICpjYywKLQkJc3RydWN0IHBhZ2UgKipwYWdlcCwgcGdvZmZfdCBp
bmRleCwgdm9pZCAqKmZzZGF0YSkKKwkJc3RydWN0IHBhZ2UgKipwYWdlcCwgcGdvZmZfdCBpbmRl
eCwgdm9pZCAqKmZzZGF0YSwgaW50IGxlbikKIHsKIAlzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkg
PSBGMkZTX0lfU0IoY2MtPmlub2RlKTsKIAlzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZyA9
IGNjLT5pbm9kZS0+aV9tYXBwaW5nOyBAQCAtMTAwNyw2CisxMDA3LDggQEAgc3RhdGljIGludCBw
cmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZShzdHJ1Y3QgY29tcHJlc3NfY3R4ICpjYywKIAlpZiAo
cmV0IDw9IDApCiAJCXJldHVybiByZXQ7CiAKKwlpZiAobGVuID09IFBBR0VfU0laRSkKKwkJcmV0
dXJuIDA7CiAJLyogY29tcHJlc3NlZCBjYXNlICovCiAJcHJlYWxsb2MgPSAocmV0IDwgY2MtPmNs
dXN0ZXJfc2l6ZSk7CiAKQEAgLTEwNDUsNyArMTA0Nyw2IEBAIHN0YXRpYyBpbnQgcHJlcGFyZV9j
b21wcmVzc19vdmVyd3JpdGUoc3RydWN0CmNvbXByZXNzX2N0eCAqY2MsCiAJCWlmIChyZXQpCiAJ
CQlnb3RvIG91dDsKIAl9Ci0KIAlmb3IgKGkgPSAwOyBpIDwgY2MtPmNsdXN0ZXJfc2l6ZTsgaSsr
KSB7CiAJCWYyZnNfYnVnX29uKHNiaSwgY2MtPnJwYWdlc1tpXSk7CiAKQEAgLTExMDEsNyArMTEw
Miw3IEBAIHN0YXRpYyBpbnQgcHJlcGFyZV9jb21wcmVzc19vdmVyd3JpdGUoc3RydWN0CmNvbXBy
ZXNzX2N0eCAqY2MsICB9CiAKIGludCBmMmZzX3ByZXBhcmVfY29tcHJlc3Nfb3ZlcndyaXRlKHN0
cnVjdCBpbm9kZSAqaW5vZGUsCi0JCXN0cnVjdCBwYWdlICoqcGFnZXAsIHBnb2ZmX3QgaW5kZXgs
IHZvaWQgKipmc2RhdGEpCisJCXN0cnVjdCBwYWdlICoqcGFnZXAsIHBnb2ZmX3QgaW5kZXgsIHZv
aWQgKipmc2RhdGEsIGludCBsZW4pCiB7CiAJc3RydWN0IGNvbXByZXNzX2N0eCBjYyA9IHsKIAkJ
Lmlub2RlID0gaW5vZGUsCkBAIC0xMTExLDggKzExMTIsNyBAQCBpbnQgZjJmc19wcmVwYXJlX2Nv
bXByZXNzX292ZXJ3cml0ZShzdHJ1Y3QgaW5vZGUKKmlub2RlLAogCQkucnBhZ2VzID0gTlVMTCwK
IAkJLm5yX3JwYWdlcyA9IDAsCiAJfTsKLQotCXJldHVybiBwcmVwYXJlX2NvbXByZXNzX292ZXJ3
cml0ZSgmY2MsIHBhZ2VwLCBpbmRleCwgZnNkYXRhKTsKKwlyZXR1cm4gcHJlcGFyZV9jb21wcmVz
c19vdmVyd3JpdGUoJmNjLCBwYWdlcCwgaW5kZXgsIGZzZGF0YSwgbGVuKTsKIH0KIAogYm9vbCBm
MmZzX2NvbXByZXNzX3dyaXRlX2VuZChzdHJ1Y3QgaW5vZGUgKmlub2RlLCB2b2lkICpmc2RhdGEs
IEBAIC0xMTU1LDcKKzExNTUsNyBAQCBpbnQgZjJmc190cnVuY2F0ZV9wYXJ0aWFsX2NsdXN0ZXIo
c3RydWN0IGlub2RlICppbm9kZSwgdTY0IGZyb20sCmJvb2wgbG9jaykKIAogCS8qIHRydW5jYXRl
IGNvbXByZXNzZWQgY2x1c3RlciAqLwogCWVyciA9IGYyZnNfcHJlcGFyZV9jb21wcmVzc19vdmVy
d3JpdGUoaW5vZGUsICZwYWdlcCwKLQkJCQkJCXN0YXJ0X2lkeCwgJmZzZGF0YSk7CisJCQkJCQlz
dGFydF9pZHgsICZmc2RhdGEsIDApOwogCiAJLyogc2hvdWxkIG5vdCBiZSBhIG5vcm1hbCBjbHVz
dGVyICovCiAJZjJmc19idWdfb24oRjJGU19JX1NCKGlub2RlKSwgZXJyID09IDApOyBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9kYXRhLmMKYi9mcy9mMmZzL2RhdGEuYyBpbmRleCAwMDlhMDlmYjlkODgu
LjlhNmI4MmQ4ZjI3OCAxMDA2NDQKLS0tIGEvZnMvZjJmcy9kYXRhLmMKKysrIGIvZnMvZjJmcy9k
YXRhLmMKQEAgLTI5MTYsNyArMjkxNiw3IEBAIHN0YXRpYyBpbnQgZjJmc193cml0ZV9jYWNoZV9w
YWdlcyhzdHJ1Y3QgYWRkcmVzc19zcGFjZQoqbWFwcGluZywKIAogCQkJCQlyZXQyID0KZjJmc19w
cmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZSgKIAkJCQkJCQlpbm9kZSwgJnBhZ2VwLAotCQkJCQkJ
CXBhZ2UtPmluZGV4LAomZnNkYXRhKTsKKwkJCQkJCQlwYWdlLT5pbmRleCwKJmZzZGF0YSwgMCk7
CiAJCQkJCWlmIChyZXQyIDwgMCkgewogCQkJCQkJcmV0ID0gcmV0MjsKIAkJCQkJCWRvbmUgPSAx
OwpAQCAtMzMwNyw3ICszMzA3LDcgQEAgc3RhdGljIGludCBmMmZzX3dyaXRlX2JlZ2luKHN0cnVj
dCBmaWxlICpmaWxlLCBzdHJ1Y3QKYWRkcmVzc19zcGFjZSAqbWFwcGluZywKIAkJKmZzZGF0YSA9
IE5VTEw7CiAKIAkJcmV0ID0gZjJmc19wcmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZShpbm9kZSwg
cGFnZXAsCi0JCQkJCQkJaW5kZXgsIGZzZGF0YSk7CisJCQkJCQkJaW5kZXgsIGZzZGF0YSwgbGVu
KTsKIAkJaWYgKHJldCA8IDApIHsKIAkJCWVyciA9IHJldDsKIAkJCWdvdG8gZmFpbDsKZGlmZiAt
LWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmggaW5kZXgKYzgzZDkwMTI1ZWJk
Li44ZDRmZWRmMDI5MWIgMTAwNjQ0Ci0tLSBhL2ZzL2YyZnMvZjJmcy5oCisrKyBiL2ZzL2YyZnMv
ZjJmcy5oCkBAIC0zOTMyLDcgKzM5MzIsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgZjJmc19wb3N0
X3JlYWRfcmVxdWlyZWQoc3RydWN0Cmlub2RlICppbm9kZSkgIGJvb2wgZjJmc19pc19jb21wcmVz
c2VkX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpOyAgc3RydWN0IHBhZ2UKKmYyZnNfY29tcHJlc3Nf
Y29udHJvbF9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKTsgIGludApmMmZzX3ByZXBhcmVfY29tcHJl
c3Nfb3ZlcndyaXRlKHN0cnVjdCBpbm9kZSAqaW5vZGUsCi0JCQlzdHJ1Y3QgcGFnZSAqKnBhZ2Vw
LCBwZ29mZl90IGluZGV4LCB2b2lkICoqZnNkYXRhKTsKKwkJCXN0cnVjdCBwYWdlICoqcGFnZXAs
IHBnb2ZmX3QgaW5kZXgsIHZvaWQgKipmc2RhdGEsCmludCBsZW4pOwogYm9vbCBmMmZzX2NvbXBy
ZXNzX3dyaXRlX2VuZChzdHJ1Y3QgaW5vZGUgKmlub2RlLCB2b2lkICpmc2RhdGEsCiAJCQkJCXBn
b2ZmX3QgaW5kZXgsIHVuc2lnbmVkIGNvcGllZCk7CiBpbnQgZjJmc190cnVuY2F0ZV9wYXJ0aWFs
X2NsdXN0ZXIoc3RydWN0IGlub2RlICppbm9kZSwgdTY0IGZyb20sIGJvb2wKbG9jayk7Ci0tCjIu
MjkuMAoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
