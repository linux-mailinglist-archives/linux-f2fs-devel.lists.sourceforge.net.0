Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B111B390092
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 May 2021 14:06:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1llVoq-0000i8-RZ; Tue, 25 May 2021 12:05:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1llVop-0000he-2W
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 12:05:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:In-Reply-To:References:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iGOQtsxGaWe2hCI/mUDsa5cX+pQDlKYx0o/dMJJTdiQ=; b=HlTEdJnPoSVRdbSDWjRSOb5qFh
 Og/92J/Q04HpBxUIPQuaCYf3NtnRiz81RA4vIwLjGDX+YuA9bFbUGCqHFlzm9LDlYQD9QozO91Cui
 K7GcoyxKJU8CgOwo19fDbdszbp2Fev74Rlu9b0wE+7bPvhpXOoiSsWrwmJHFdy4NyP/c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:In-Reply-To:References:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iGOQtsxGaWe2hCI/mUDsa5cX+pQDlKYx0o/dMJJTdiQ=; b=XQrW1lsB52xaSYB5RyKTuL1yn4
 MNGtV8FvDkb7QLXEohIOjY1soli9ItrD80lhRGPu+EUaQi/uLhRHrihls5jrhn1HAXu/Cu7RQyPzs
 fys4jKIdK6xCP1Dslb81oJ5xZtSooIqEH5/4QdGg/Gk7Y98bjlgrOYjPc90x3daCszBs=;
Received: from mail-m17635.qiye.163.com ([59.111.176.35])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1llVoe-005Hyr-CL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 12:05:55 +0000
Received: from SZ11126892 (unknown [58.250.176.229])
 by mail-m17635.qiye.163.com (Hmail) with ESMTPA id 76FF740015D;
 Tue, 25 May 2021 20:05:36 +0800 (CST)
From: <changfengnan@vivo.com>
To: "'Chao Yu'" <yuchao0@huawei.com>, <jaegeuk@kernel.org>, <chao@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20210518125113.1712-1-changfengnan@vivo.com>
 <7ad8bae8-6e38-5ff7-add8-fe1023569f43@huawei.com>
In-Reply-To: <7ad8bae8-6e38-5ff7-add8-fe1023569f43@huawei.com>
Date: Tue, 25 May 2021 20:05:33 +0800
Message-ID: <000001d7515e$458f3db0$d0adb910$@vivo.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQHOlVE4bDv6QAxu/j4of1dMYsvDFwGvWIFYqvgWuzA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQk8fQ1YaTUwZHh8YTx4dGElVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 9ISFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pwg6Kgw5HD8LMxoQOSs8CSEZ
 ARpPFFZVSlVKTUlKQk9PSEhNQklMVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOS1VKTE1VSUlCWVdZCAFZQUlDS0w3Bg++
X-HM-Tid: 0a79a36a80e4d991kuws76ff740015d
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.35 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [59.111.176.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 1.0 PDS_BAD_THREAD_QP_64   Bad thread header - short QP
X-Headers-End: 1llVoe-005Hyr-CL
Subject: [f2fs-dev] =?gb2312?b?tPC4tDogIFtSRkMgUEFUQ0hdIGYyZnM6IGNvbXBy?=
	=?gb2312?b?ZXNzOiByZW1vdmUgdW5uZWVkZWQgcmVhZCB3aGVuIHJld3JpdGUg?=
	=?gb2312?b?d2hvbGUgY2x1c3Rlcg==?=
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

eWVzLCBJIGp1c3QgY2hlY2sgd2hlYXRoZXIgdGhlIHdob2xlIHBhZ2Ugd2FzIGRpcnR5LCBiZWNh
dXNlIG9mIHdoZW4gd3JpdGUKY2FjaGUgZjJmc19wcmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZSB3
aWxsIGJlIGNhbGxlZCBhZ2FpbiwgCndoZW4gdXBkYXRlIHdob2xlIGNsdXN0ZXIsICBjYyBpbiBw
cmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZSB3aWxsIGJlIGVtcHR5LApzbyB3aWxsIG5vdCBzdWJt
aXQgYmlvLgp3aGVuIG9ubHkgdXBkYXRlIG9uZSBwYWdlIGluIGNsdXN0ZXIsICBjYyBpbiBwcmVw
YXJlX2NvbXByZXNzX292ZXJ3cml0ZSB3aWxsCm5vdCBiZSBlbXB0eSwgc28gd2lsbCBzdWJtaXQg
YmlvLgpUaGlzIGlzIG15IHRoaW5raW5nLCBub3Qgc3VyZSBpZiBJJ3ZlIG1pc3NlZCBhbnl0aGlu
ZwoKCi0tLS0t08q8/tStvP4tLS0tLQq3orz+yMs6IENoYW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNv
bT4gCreiy83KsbzkOiAyMDIxxOo11MIyNMjVIDE5OjM5CsrVvP7IyzogRmVuZ25hbiBDaGFuZyA8
Y2hhbmdmZW5nbmFuQHZpdm8uY29tPjsgamFlZ2V1a0BrZXJuZWwub3JnOwpjaGFvQGtlcm5lbC5v
cmc7IGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Ctb3zOI6IFJlOiBbZjJm
cy1kZXZdIFtSRkMgUEFUQ0hdIGYyZnM6IGNvbXByZXNzOiByZW1vdmUgdW5uZWVkZWQgcmVhZCB3
aGVuCnJld3JpdGUgd2hvbGUgY2x1c3RlcgoKT24gMjAyMS81LzE4IDIwOjUxLCBGZW5nbmFuIENo
YW5nIHdyb3RlOgo+IEZvciBub3csd2hlbiBvdmVyd3JpdGUgY29tcHJlc3NlZCBmaWxlLCB3ZSBu
ZWVkIHJlYWQgb2xkIGRhdGEgdG8gcGFnZSAKPiBjYWNoZSBmaXJzdCBhbmQgdXBkYXRlIHBhZ2Vz
Lgo+IEJ1dCB3aGVuIHdlIG5lZWQgb3ZlcndyaXRlIHdob2xlIGNsdXN0ZXIsIHdlIGRvbid0IG5l
ZWQgb2xkIGRhdGEgCj4gYW55bW9yZS4KCkkgb25seSBzZWUgeW91IGp1c3QgY2hlY2sgdGhlIHdo
b2xlIHBhZ2Ugd2FzIGRpcnR5IGFzIGJlbG93IHJhdGhlciB0aGFuIHRoZQp3aG9sZSBjbHVzdGVy
IGlzIGRpcnR5IGR1cmluZyB3cml0ZSgpLgoKVGhhbmtzLAoKPiArCWlmIChsZW4gPT0gUEFHRV9T
SVpFKQo+ICsJCXJldHVybiAwOwo+ICAgCS8qIGNvbXByZXNzZWQgY2FzZSAqLwo+ICAgCXByZWFs
bG9jID0gKHJldCA8IGNjLT5jbHVzdGVyX3NpemUpOwo+ICAgCgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
