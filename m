Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAD636501A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Apr 2021 04:08:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lYfoJ-0000uA-Cz; Tue, 20 Apr 2021 02:08:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1lYfoI-0000tw-84
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Apr 2021 02:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:In-Reply-To:References:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+lla1T4osc8xWGzqGM/ejSpSLWJ2hjev6fIcOJtLIx4=; b=bPtfp5d85IvqOys9buITDoMlny
 NNq+TWlr1dn8MifJvop8eYlP/NI8VFH3OqbETR+1DGs49GZjMhLktxhsIssisJriFkwKwxtzEwGU/
 JnsUbcuiSYDDD7OdqUTUYe+MiiVUmieGhEe8SRb05WFb22GMYFgMPYBiC5tHFq/6+jJ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:In-Reply-To:References:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+lla1T4osc8xWGzqGM/ejSpSLWJ2hjev6fIcOJtLIx4=; b=m+ZLSu/7hgqmSwVcVe0DYQuyXJ
 p8/eYryTOOJubJ0aAi+d45k5EkyO2bwGWGp6P897RXD5Bbi5wUB9q+gRl1cdjSC0Qfpwu4sLCk60j
 y+gXqtytB2tcOQ7EAjSn5YkVTF/0x3zNzwGD5BwcsxpuafDsVjr4rqd0C70EStJaOGWk=;
Received: from mail-m118208.qiye.163.com ([115.236.118.208])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lYfoA-0006ME-7i
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Apr 2021 02:08:17 +0000
Received: from SZ11126892 (unknown [58.251.74.232])
 by mail-m118208.qiye.163.com (Hmail) with ESMTPA id A7EA3E01EC;
 Tue, 20 Apr 2021 10:08:00 +0800 (CST)
From: <changfengnan@vivo.com>
To: "'Jaegeuk Kim'" <jaegeuk@kernel.org>,
 "'Fengnan Chang'" <fengnanchang@gmail.com>
References: <4dc282e0-b41c-caf2-c2ff-a6372e60a906@huawei.com>
 <20210417070251.42979-1-fengnanchang@gmail.com> <YH2uYPmJBvZFqIz+@google.com>
In-Reply-To: <YH2uYPmJBvZFqIz+@google.com>
Date: Tue, 20 Apr 2021 10:08:00 +0800
Message-ID: <003b01d73589$fd640060$f82c0120$@vivo.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLjH0k41dOCOrST79xbW2StELcKcACMPZfjAW82A78CmLnKBA==
Content-Language: zh-cn
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQhoeHlYZTU5NGhgdGk0ZHU1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hOSFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NVE6Ijo6FD8OAgsMGEI2FCIJ
 Mg9PCSNVSlVKTUpDQ0NPT0NKSkxKVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOSlVMT1VJSElZV1kIAVlBSE5CTjcG
X-HM-Tid: 0a78ed08cf3e2c17kusna7ea3e01ec
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [115.236.118.208 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.0 PDS_BAD_THREAD_QP_64   Bad thread header - short QP
X-Headers-End: 1lYfoA-0006ME-7i
Subject: [f2fs-dev] =?utf-8?b?562U5aSNOiAg562U5aSNOiAgW1JGQyBQQVRDSF0gZjJm?=
	=?utf-8?q?s=3A_add_no_compress_extensions_support?=
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SXQgc2VlbXMgdGhhdCB3ZSBkb24ndCBuZWVkIHRvIHN1cHBvcnQgKiBmb3Igbm9uLWNvbXByZXNz
LgoKRm9yIG5vdywgaWYgb25lIGZpbGUgbWF0Y2ggY29tcF9leHRlbnRpb24sIHRoZSBkaXIgZmxh
ZyBub3Qgd29yaywgYnV0IHdlIGNhbiBzdGlsbCB1c2UgY29tcF9maWxlX2ZsYWcgYW5kIG5vX2Nv
bXBfZmlsZV9mbGFnLiBTbyB0aGUgcHJpb3JpdHkgaXM6CmRpcl9mbGFnIDwgY29tcF9leHRlbnRp
b24gPCAgY29tcF9maWxlX2ZsYWcsIG5vX2NvbXBfZmlsZV9mbGFnLgoKYWZ0ZXIgYWRkIG5vX2Nv
bXBfZXh0ZW50aW9uIGZsYWcsIHRoZSBwcmlvcml0eSBzaG91bGQgYmU6CmRpcl9mbGFnIDwgY29t
cF9leHRlbnRpb24gPCBub19jb21wX2V4dGVudGlvbiA8ICBjb21wX2ZpbGVfZmxhZywgbm9fY29t
cF9maWxlX2ZsYWcuCgoKLS0tLS3pgq7ku7bljp/ku7YtLS0tLQrlj5Hku7bkuro6IEphZWdldWsg
S2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+CuWPkemAgeaXtumXtDogMjAyMeW5tDTmnIgyMOaXpSAw
OjIzCuaUtuS7tuS6ujogRmVuZ25hbiBDaGFuZyA8ZmVuZ25hbmNoYW5nQGdtYWlsLmNvbT4K5oqE
6YCBOiB5dWNoYW8wQGh1YXdlaS5jb207IGNoYW5nZmVuZ25hbkB2aXZvLmNvbTsgCmxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0CuS4u+mimDogUmU6IFtmMmZzLWRldl0g562U
5aSNOiBbUkZDIFBBVENIXSBmMmZzOiBhZGQgbm8gY29tcHJlc3MgZXh0ZW5zaW9ucyAKc3VwcG9y
dAoKT24gMDQvMTcsIEZlbmduYW4gQ2hhbmcgd3JvdGU6Cj4gSW4gdGhpcyBwYXRjaCwgd2UgY2Fu
bm90IGhhbmRsZSBmaWxlcyB3aXRob3V0IGV4dGVuc2lvbnMuIEF0IHRoZSBtb21lbnQgCj4gdGhl
cmUgaXMganVzdCBhIHJvdWdoIGlkZWHvvIx0ZXN0IGEgcG9ydGlvbiBvZiB0aGUgZGF0YSB0byBk
ZWNpZGUgd2hldGhlciAKPiB0byBjb21wcmVzcyBpdCBiZWZvcmUgcGVyZm9ybWluZyBhIGZ1bGwg
Y29tcHJlc3Npb24uIEl0IG1heSBuZWVkIG1vcmUgCj4gdGVzdC4gIEFueSBvdGhlciBzdWdnZXN0
aW9ucz8KPgo+IEluIG15IGNvbnNpZGVyLCB0aGUgbm9uLWNvbXByZXNzICBmbGFnIGhhcyBhIGhp
Z2hlciBwcmlvcml0eSB0aGFuIHRoZSAKPiBjb21wcmVzc2VkIGZsYWcuCj4gMS4gdGhlIHNhbWUg
ZXh0ZW5zaW9uIG5hbWUgY2Fubm90IG5vdCBhcHBlYXIgaW4gYm90aCBjb21wcmVzcyBhbmQgCj4g
bm9uLWNvbXByZXNzIGV4dGVuc2lvbiBhdCB0aGUgc2FtZSB0aW1l77yMIGNoZWNrIHRoaXMgaW4g
bW91bnQgcHJvY2Vzcy4KPiAyLiBJZiB0aGUgY29tcHJlc3MgZXh0ZW5zaW9uIHNwZWNpZmllcyBh
bGwgZmlsZXMsIHRoZSB0eXBlcyBzcGVjaWZpZWQgYnkgCj4gdGhlIG5vbi1jb21wcmVzcyBleHRl
bnNpb24gd2lsbCBiZSB0cmVhdGVkIGFzIHNwZWNpYWwgY2FzZXMgYW5kIHdpbGwgbm90IAo+IGJl
IGNvbXByZXNzZWQuCj4gMy4gSWYgdGhlIG5vbi1jb21wcmVzcyBleHRlbnNpb24gc3BlY2lmaWVz
IGFsbCBmaWxlcywgc2hvdWxkIG5vdCBzcGVjaWZpZXMgCj4gYW55IGNvbXByZXNzIGV4dGVuc2lv
biwgY2hlY2sgaW4gbW91bnQgcHJvY2VzcyB0b28uCgpEbyB3ZSBuZWVkIHRvIHN1cHBvcnQgKiBm
b3Igbm9uLWNvbXByZXNzPwoKPgo+IEFueSBvdGhlciBzdWdnZXN0aW9ucz8KClNvLCB3aGF0IGNv
dWxkIHRoZSBwcmlvcml0eSBmb3IgYWxsIHRoZSBiZWxvdyBjb21iaW5hdGlvbnM/CgpFLmcuLCBj
b21wX2V4dGVudGlvbiwgbm9fY29tcF9leHRlbnRpb24sIGRpcl9mbGFnLCBjb21wX2ZpbGVfZmxh
ZywgCm5vX2NvbXBfZmlsZV9mbGFnLgoKVGhhbmtzLAoKCgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
